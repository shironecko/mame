-- license:BSD-3-Clause
-- copyright-holders:MAMEdev Team

---------------------------------------------------------------------------
--
--   neogeo.lua
--
--   Small driver-specific example makefile
--   Use make SUBTARGET=neogeo to build
--
---------------------------------------------------------------------------


--------------------------------------------------
-- Specify all the CPU cores necessary for the
-- drivers referenced in neogeo.lst.
--------------------------------------------------

CPUS["M6800"] = true
CPUS["Z80"] = true
CPUS["AT89C52"] = true
CPUS["PIC16C56"] = true
CPUS["PIC16C5X"] = true
CPUS["MCS51"] = true
CPUS["M680X0"] = true


--------------------------------------------------
-- Specify all the sound cores necessary for the
-- drivers referenced in neogeo.lst.
--------------------------------------------------

SOUNDS["YMZ280B"] = true
SOUNDS["YM2610"] = true


--------------------------------------------------
-- specify available video cores
--------------------------------------------------

--VIDEOS["MC6845"] = true


--------------------------------------------------
-- specify available machine cores
--------------------------------------------------

MACHINES["TTL74259"] = true
MACHINES["GEN_LATCH"] = true
MACHINES["INPUT_MERGER"] = true
MACHINES["UPD1990A"] = true
MACHINES["Z80DAISY"] = true
MACHINES["EEPROMDEV"] = true
MACHINES["TICKET"] = true
MACHINES["ALPHA_8921"] = true
MACHINES["WATCHDOG"] = true



--------------------------------------------------
-- specify available bus cores
--------------------------------------------------

BUSES["NEOGEO"] = true
BUSES["NEOGEO_CTRL"] = true

--------------------------------------------------
-- This is the list of files that are necessary
-- for building all of the drivers referenced
-- in tiny.lst
--------------------------------------------------

function createProjects_mame_neogeo(_target, _subtarget)
	project ("mame_neogeo")
	targetsubdir(_target .."_" .. _subtarget)
	kind (LIBTYPE)
	uuid (os.uuid("drv-mame-neogeo"))
	addprojectflags()
	precompiledheaders_novs()

	includedirs {
		MAME_DIR .. "src/osd",
		MAME_DIR .. "src/emu",
		MAME_DIR .. "src/devices",
		MAME_DIR .. "src/mame/shared",
		MAME_DIR .. "src/lib",
		MAME_DIR .. "src/lib/util",
		MAME_DIR .. "3rdparty",
		GEN_DIR  .. "mame/layout",
	}

	files{
		MAME_DIR .. "src/mame/neogeo/midas.cpp",
		MAME_DIR .. "src/mame/neogeo/neogeo.cpp",
		MAME_DIR .. "src/mame/neogeo/neogeo.h",
		MAME_DIR .. "src/mame/neogeo/neogeo_spr.cpp",
		MAME_DIR .. "src/mame/neogeo/neogeo_spr.h",
		MAME_DIR .. "src/mame/neogeo/neogeo_v.cpp",
		MAME_DIR .. "src/mame/neogeo/neopcb.cpp",
		MAME_DIR .. "src/mame/neogeo/ng_memcard.cpp",
		MAME_DIR .. "src/mame/neogeo/ng_memcard.h",
	}
end

function linkProjects_mame_neogeo(_target, _subtarget)
	links {
		"mame_neogeo",
	}
end
