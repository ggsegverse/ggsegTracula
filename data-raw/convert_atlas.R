# Convert legacy tracula atlas to unified ggseg_atlas format
#
# The tracula atlas has several label inconsistencies between the 2D and 3D
# objects that must be fixed before conversion:
#
# 1. 3D labels use different abbreviations: fmaj/fmin vs fmajor/fminor,
#    lh_cnf/rh_unf vs lh_unc/rh_unc
# 2. 2D data has mislabeled coronal views of corticospinal tract (labeled
#    as rh_atr/lh_atr instead of rh_cst/lh_cst)
# 3. CSF is a context region (region = NA) but has a non-NA label
#
# The atlas type is "subcortical" because the 3D data consists of pre-built
# tube meshes (not centerlines). The original ggseg.formats tracula used type
# "subcortical" for the same reason.
#
# Run with: Rscript data-raw/convert_atlas.R

library(ggseg.formats)

load(here::here("data/tracula.rda"))
load(here::here("data/tracula_3d.rda"))

label_map <- c(
  "fmaj"   = "fmajor",
  "fmin"   = "fminor",
  "lh_cnf" = "lh_unc",
  "rh_unf" = "rh_unc"
)
inner <- tracula_3d$ggseg_3d[[1]]
for (old in names(label_map)) {
  idx <- inner$label == old
  if (any(idx)) inner$label[idx] <- label_map[old]
}
tracula_3d$ggseg_3d[[1]] <- inner

tracula$data$label[tracula$data$label == "csf"] <- NA

bad_idx <- which(
  tracula$data$region == "Corticospinal tract" &
    grepl("_atr$", tracula$data$label)
)
for (idx in bad_idx) {
  tracula$data$label[idx] <- sub("_atr$", "_cst", tracula$data$label[idx])
}

tracula <- convert_legacy_brain_atlas(
  atlas_2d = tracula,
  atlas_3d = tracula_3d,
  type = "subcortical"
)

stopifnot(is_ggseg_atlas(tracula))
print(tracula)

save(tracula, file = here::here("data/tracula.rda"), compress = "xz")
file.remove(here::here("data/tracula_3d.rda"))

brain_pals <- list()
brain_pals[[tracula$atlas]] <- tracula$palette
save(brain_pals, file = here::here("R/sysdata.rda"), compress = "xz")
