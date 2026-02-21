#' TRACULA White Matter Tracts
#'
#' Brain atlas for automated probabilistic reconstruction of white-matter
#' pathways with 10 tract regions across hemispheres.
#' Contains both 2D polygon geometry for [ggseg::geom_brain()] and
#' 3D mesh geometry for [ggseg3d::ggseg3d()].
#'
#' @family ggseg_atlases
#'
#' @references Yendiki et al. (2011) Automated probabilistic reconstruction of
#' white-matter pathways in health and disease using an atlas of the underlying
#' anatomy. Front. Neuroinform. 5:23. doi: 10.3389/fninf.2011.00023
#' (\href{https://www.ncbi.nlm.nih.gov/pubmed/22016733}{PubMed})
#'
#' @return A [ggseg.formats::ggseg_atlas] object (subcortical).
#' @import ggseg.formats
#' @export
#' @examples
#' tracula()
tracula <- function() .tracula
