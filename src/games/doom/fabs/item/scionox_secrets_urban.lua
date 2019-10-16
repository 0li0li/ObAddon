--Based on gtd_pic_urban_generic_frontages
PREFABS.Item_generic_frontage_secret =
{
  file   = "item/scionox_secrets_urban.wad"
  map    = "MAP01"

  prob   = 25
  theme = "urban"
  
  env = "!cave"

  where  = "seeds"
  key    = "secret"
  height = 128

  seed_w = 3
  seed_h = 2

  bound_z1 = 0
  bound_z2 = 128

  deep   =  16

  x_fit = "frame"
  y_fit = "top"

  tex_COMPBLUE =
  {
    COMPBLUE = 10
    LITE5 = 10
    LITEBLU4 = 10
    REDWALL = 10
  }

  tex_MODWALL3 =
  {
    MODWALL3 = 20
    STEP4 = 10
    STEP5 = 10
  }
}

PREFABS.Item_generic_frontage_secret_2 =
{
  file   = "item/scionox_secrets_urban.wad"
  map    = "MAP02"

  prob   = 15
  theme = "urban"
  
  engine = "zdoom"
  
  env = "!cave"

  where  = "seeds"
  key    = "secret"
  height = 128

  seed_w = 2
  seed_h = 2

  bound_z1 = 0
  bound_z2 = 128

  deep   =  16

  x_fit = "frame"
  y_fit = "top"
}

PREFABS.Item_generic_frontage_secret_3 =
{
  file   = "item/scionox_secrets_urban.wad"
  map    = "MAP03"

  prob   = 25
  theme = "urban"
  
  env = "!cave"

  where  = "seeds"
  key    = "secret"
  height = 128

  seed_w = 3
  seed_h = 2

  bound_z1 = -96
  bound_z2 = 128

  deep   =  16

  x_fit = "frame"
  y_fit = "top"
}