----------------------------------------------------------------
--  MODULE: ZDoom Ambient Sound Addon
----------------------------------------------------------------
--
--  Copyright (C) 2019 MsrSgtShooterPerson
--  Copyright (C) 2019 Frozsoul
--
--  This program is free software; you can redistribute it and/or
--  modify it under the terms of the GNU General Public License
--  as published by the Free Software Foundation; either version 2
--  of the License, or (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
-------------------------------------------------------------------

---------------------------------
-- How to add your own sounds: --
---------------------------------

-- DECORATE and SNDINFO code are all generated by Oblige.
-- Go to zdoom_sounds.lua to add new data to the table.

-- Each new entry added means Oblige will generate a SNDINFO
-- chunk as well as decorate code for each entry.

-- Thing ID's are dynamically assigned based on the
-- ACTOR_ID_OFFSET constant declared below. This constant
-- can be changed at any time so Oblige will use other numbers
-- forward from that constant if there are any issues with
-- thing ID incompatibilities.

-- The module also handles the actual replacement of sound spot
-- specials (thing 8185) in prefab WAD's with the appropriate
-- sound. See gtd_pic_tec_controlroom fab WAD and Lua def as an example.

-- In order to specify what sound to replace a sound spot with,
-- declare a "sound" field in the prefab Lua def. The sound field
-- can contain a single string pertaining to a sound name in the
-- sound data table, or list of names and probabilities whereas
-- Oblige will randomly pick between each.

-- The actual sound files (OGG, WAV, MP3 etc.) are NOT part of
-- the module and are instead contained in a separate WAD file
-- to be loaded separately during play.

gui.import("zdoom_sounds.lua")

ZDOOM_SOUND = {}

ZDOOM_SOUND.ACTOR_ID_OFFSET = 20000

ZDOOM_SOUND.TEMPLATES =
{
  DEC =
[[actor ACTORNAME IDNUM : AmbientSound
{
  +THRUACTORS
  Radius 4
  Height 4
  States
  {
    Spawn:
      TNT1 A 0
      TNT1 A 0 A_PlaySoundEx("SOUNDNAME", "Auto", 1)
      Goto Live

    Live:
      TNT1 A 24
      Loop
  }
}
]]
}

function ZDOOM_SOUND.build_lumps()
  local offset_count = ZDOOM_SOUND.ACTOR_ID_OFFSET
  local sndtable = table.deep_copy(ZDOOM_SOUND_DEFS)
  PARAM.SOUND_DEC = ""
  PARAM.SNDINFO = ""

  table.name_up(sndtable)

  for _,sound in pairs(sndtable) do

    ZDOOM_SOUND_DEFS[_].id = offset_count

    -- build DECORATE chunk
    local dec_chunk = ZDOOM_SOUND.TEMPLATES.DEC

    dec_chunk = string.gsub(dec_chunk, "ACTORNAME", sound.name)
    dec_chunk = string.gsub(dec_chunk, "IDNUM", offset_count)
    dec_chunk = string.gsub(dec_chunk, "SOUNDNAME", sound.lump)

    PARAM.SOUND_DEC = PARAM.SOUND_DEC .. dec_chunk .. "\n\n"

    -- build SNDINFO chunk
    local sndinfo_chunk = sound.lump .. " " .. sound.lump .. "\n" ..
    sound.flags

    PARAM.SNDINFO = PARAM.SNDINFO .. sndinfo_chunk .. "\n"

    offset_count = offset_count + 1
  end

  gui.printf(table.tostr(ZDOOM_SOUND_DEFS, 5))
end

function ZDOOM_SOUND.setup(self)
  gui.printf("\n--== Ambient Sound Addons module active ==--\n\n")

  --[[for name,opt in pairs(self.options) do
    local value = self.options[name].value
    PARAM[name] = value
  end]]

  PARAM.ambient_sounds = true
  ZDOOM_SOUND.build_lumps()
end

OB_MODULES["zdoom_ambient_sound"] =
{
  label = _("ZDoom: Frozsoul's Ambient Sound")

  game = "doomish"

  side = "left"

  priority = 69

  engine = { zdoom=1, gzdoom=1 }

  hooks =
  {
    setup = ZDOOM_SOUND.setup
  }

  tooltip = "Adds ambient sound to maps, based on fabs and room themes." ..
  "THIS MODULE IS NOT YET READY FOR USE."
}