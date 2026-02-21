describe("tracula atlas", {
  it("is a ggseg_atlas", {
    expect_s3_class(tracula(), "ggseg_atlas")
    expect_s3_class(tracula(), "subcortical_atlas")
  })

  it("is valid", {
    expect_true(ggseg.formats::is_ggseg_atlas(tracula()))
  })

  it("renders with ggseg", {
    skip_if_not_installed("ggseg")
    skip_if_not_installed("ggplot2")
    skip_if_not_installed("vdiffr")
    p <- ggplot2::ggplot() +
      ggseg::geom_brain(
        atlas = tracula(),
        mapping = ggplot2::aes(fill = label),
        position = ggseg::position_brain(hemi ~ view),
        show.legend = FALSE
      ) +
      ggplot2::scale_fill_manual(
        values = tracula()$palette,
        na.value = "grey"
      ) +
      ggplot2::theme_void()
    vdiffr::expect_doppelganger("tracula-2d", p)
  })

})
