# ggsegTracula 2.0.0

## Breaking changes

* `tracula` is now a `ggseg_atlas` object (from ggseg.formats) containing
  both 2D and 3D data. The separate `tracula_3d` object has been removed.

* Use `ggplot() + ggseg::geom_brain(atlas = tracula)` for 2D plots and
  `ggseg3d::ggseg3d(atlas = tracula)` for 3D plots — both from the same
  object.

* `ggseg.formats` is now a hard dependency (in Depends).

* Package URLs updated from `LCBC-UiO` to `ggseg` GitHub organisation.

## Bug fixes

* Fixed mislabeled coronal views of corticospinal tract (were incorrectly
  labeled as `rh_atr`/`lh_atr` instead of `rh_cst`/`lh_cst`).

* Harmonized label names between 2D and 3D data (3D used `fmaj`/`fmin`
  instead of `fmajor`/`fminor`, and `lh_cnf`/`rh_unf` instead of
  `lh_unc`/`rh_unc`).

# ggsegTracula 1.0.02

* fix mixup of forceps minor and major in 3d-atlas ([issue #3](https://github.com/ggseg/ggsegTracula/issues/3))


# ggsegTracula 1.0.01

* adapt atlas to ggseg >= 1.6.0
* Added a `NEWS.md` file to track changes to the package.
