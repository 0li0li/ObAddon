PREFABS.Pic_gtd_library_big_shelves_EPIC =
{
  file = "picture/gtd_pic_library_set.wad"
  map = "MAP01"

  prob   = 50

  uses_epic_textures = true

  replaces = "Pic_gtd_library_big_shelves"

  where  = "seeds"
  height = 128

  seed_w = 2
  seed_h = 1

  deep = 16

  bound_z1 = 0
  bound_z2 = 128

  x_fit = { 120,136 }
  y_fit = "top"
}

PREFABS.Pic_gtd_library_caged_shelves_EPIC =
{
  template = "Pic_gtd_library_big_shelves_EPIC"
  map = "MAP02"

  replaces = "Pic_gtd_library_caged_shelves"
}

--

PREFABS.Pic_gtd_library_big_shelves =
{
  file = "picture/gtd_pic_library_set.wad"
  map = "MAP01"

  prob   = 50

  where  = "seeds"
  height = 128

  seed_w = 2
  seed_h = 1

  deep = 16

  bound_z1 = 0
  bound_z2 = 128

  x_fit = { 120,136 }
  y_fit = "top"
}

PREFABS.Pic_gtd_library_caged_shelves =
{
  template = "Pic_gtd_library_caged_shelves"
  map = "MAP02"
}
