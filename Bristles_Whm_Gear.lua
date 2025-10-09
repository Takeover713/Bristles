-- Setup vars that are user-dependent.  Can override this in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal','Acc')
    state.CastingMode:options('Normal','Resistant')
    state.IdleMode:options('Normal','PDT')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','LorgMor',')

    select_default_macro_book(1, 1)
end

	--cg3 450	cg4 1157	cg5 1616
	--c3 504	c4 921		c5 1116		c6 1435

--AF Theophany  ALL

--Theophany Cap +3 - Set bonus enfeebles
--Th. Pant. +3 - Cursna and Regen
--Theo. Duckbills +3 - Enhancing Duration and set bonus enfeebles


--Relic Piety Head,Body,Legs

--Piety Cap +3 - macro piece for Devotion.
--Piety Pantaln. +1 - Bar spells
--Piety Bliaut +3 - Regen Potency and Benediction

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

	-- Weapons sets
	sets.weapons.LorgMor = {main="Lorg Mor",sub="Genmei Shield"}
    sets.buff.Sublimation = {waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}
	sets.WakeUpWeapons = {main="Prime Maul"}
    
	-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {
		main="Lorg Mor",
		sub="Genmei Shield",
		ammo="Homiliary",
		head="Bunzi's Hat",
		body="Ebers Bliaut +1",
		hands="Bunzi's Gloves",
		legs="Ebers Pant. +1",
		feet="Ebers Duckbills +1",
		neck="Loricate Torque +1",
		waist="Plat. Mog. Belt",
		left_ear="Etiolation Earring",
		right_ear="Genmei Earring", -- Eabani earring domain point 100
		left_ring="Murky Ring",
		right_ring="Defending Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
}

	sets.idle.Refresh = {}
	sets.idle.PDT = {}
	sets.idle.MDT = {}
	sets.idle.Weak = {}

    -- Defense sets

	sets.defense.PDT = {}
	sets.defense.MDT = {}
    sets.defense.MEVA = {}
	
	-- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {
		main="Lorg Mor", --main="C. Palug hammer",
		sub="Chanter's Shield",
		ammo="Impatiens",
		head="Bunzi's Hat",
		body="Inyanga Jubbah +2",
		hands="Leyline Gloves", --hands="Fanatic Gloves", --Fast Cast"+7
		legs="Ayanmo Cosciales +1", --legs={ name="Lengo Pants", augments={'INT+5','Mag. Acc.+13',}},
		feet="Regal Pumps +1",
		neck="Voltsurge Torque", --neck="Cleric's Torque +2",
		waist="Witful Belt",
		left_ear="Malignance Earring",
		right_ear="Loquac. Earring",
		left_ring="Prolix Ring",
		right_ring="Kishar Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})
    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {legs="Ebers Pant. +1"})
    sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']
	
    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {
		main="Queller Rod", --main="C. Palug hammer",
		sub="Sors Shield",
		ammo="Impatiens",
		head="Ebers Cap +1", --head="Piety Cap +4",
		body="Inyanga Jubbah +2",
		--hands="Fanatic Gloves",
		legs="Ebers Pant. +1",
		feet="Regal Pumps +1",
    	neck="Voltsurge Torque",
		--neck="Cleric's Torque +2",
		waist="Witful Belt",
		left_ear="Nourish. Earring",
		right_ear="Loquacious Earring",
		left_ring="Prolix Ring",
		right_ring="Kishar Ring",
		back="Perimede Cape",
})

    sets.precast.FC.Curaga = sets.precast.FC.Cure
	sets.precast.FC.CureSolace = sets.precast.FC.Cure
	sets.precast.FC.Impact =  set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Genmei Shield"})

    -- Precast sets to enhance JAs
    sets.precast.JA.Benediction = {body="Piety Bliaut"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}

    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {}
    sets.precast.WS.Dagan = {}
		
	sets.MaxTP = {ear1="Cessance Earring",ear2="Brutal Earring"}
	sets.MaxTP.Dagan = {ear1="Etiolation Earring",ear2="Evans Earring"}

    --sets.precast.WS['Flash Nova'] = {}

    --sets.precast.WS['Mystic Boon'] = {}

    -- Midcast Sets

    sets.Kiting = {feet="Herald's Gaiters"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.TPEat = {neck="Chrys. Torque"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	--Situational sets: Gear that is equipped on certain targets
	sets.Self_Healing = {}
	sets.Cure_Received = {}
	sets.Self_Refresh = {}

	-- Conserve Mp set for spells that don't need anything else, for set_combine.
	
	sets.ConserveMP = {}
	sets.midcast.Teleport = sets.ConserveMP
	
	-- Gear for Magic Burst mode.
	sets.MagicBurst = {neck="Mizu. Kubikazari",ring1="Mujin Band",ring2="Locus Ring"}
	
    sets.midcast.FastRecast = {
	    main="Queller Rod",
		sub="Sors Shield",
		ammo="Impatiens",
		head="Ebers Cap +1",
		body="Inyanga Jubbah +2",
		hands="Telchine Gloves", --hands={ name="Fanatic Gloves", augments={'MP+50','Healing magic skill +10','"Conserve MP"+7','"Fast Cast"+7',}},
		legs="Ebers Pant. +1", --legs={ name="Lengo Pants", augments={'INT+5','Mag. Acc.+13',}},
		feet="Regal Pumps +1",
		neck="Colossus's Torque", --neck="Cleric's Torque +2",
		waist="Witful Belt",
		left_ear="Malignance Earring",
		right_ear="Loquac. Earring",
		left_ring="Prolix Ring",
		right_ring="Kishar Ring",
		back="Perimede Cape",
}
		
    -- Cure sets

	sets.midcast['Full Cure'] = sets.midcast.FastRecast
	
	sets.midcast.Cure = {
		main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}}, 
		--main="Raetic Rod +1",AH
		sub="Sors Shield", --sub="Thuellaic Ecu +1",
		ammo="Pemphredo Tathlum",
		head="Ebers Cap +1", --Kaykaus Mitra +1 C: Spell interruption rate -12%
		body="Ebers Bliaut +1",
    	hands="Theophany Mitts +2",
		legs="Ebers Pant. +1", 
		feet="Vanya Clogs", --Kaykaus Boots +1 D: Mag. Acc. +20,Cure Potency +6,Fast Cast +4%
		neck="Colossus's Torque", --neck={ name="Clr. Torque +2", augments={'Path: A',}},
		waist="Austerity Belt", 
		-- waist="Shinjutsu-no-obi +1", needs augments, Lustreless Scale
		left_ear="Magnetic Earring",
		right_ear="Glorious Earring",
		left_ring="Naji's Loop",
		right_ring="Mephitas's Ring +1",
		back="Tempered Cape +1",
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
}

	sets.midcast.CureSolace = set_combine(sets.midcast.Cure,{})
	sets.midcast.LightWeatherCure = set_combine(sets.midcast.Cure,{})
	sets.midcast.LightWeatherCureSolace = set_combine(sets.midcast.Cure,{})
	sets.midcast.LightDayCureSolace = set_combine(sets.midcast.Cure,{})
	sets.midcast.LightDayCure = set_combine(sets.midcast.Cure,{})
	sets.midcast.Cure.DT = set_combine(sets.midcast.Cure,{})

	sets.midcast.Curaga = {
		main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}}, 
		--main="Raetic Rod +1",AH
		sub="Sors Shield", --sub="Thuellaic Ecu +1",
		ammo="Pemphredo Tathlum",
		head="Ebers Cap +1", -- Kaykaus Mitra +1 C: Spell interruption rate -12%
		body="Theo. Bliaut +2",
    	hands="Theophany Mitts +2",
		legs="Ebers Pant. +1", 
		feet="Vanya Clogs",--Kaykaus Boots +1 D: Mag. Acc. +20,Cure Potency +6,Fast Cast +4%
		neck="Colossus's Torque", --neck={ name="Clr. Torque +2", augments={'Path: A',}},
		waist="Austerity Belt",
		-- waist="Shinjutsu-no-obi +1", needs augments, Lustreless Scale
		left_ear="Magnetic Earring",
		right_ear="Glorious Earring",
		left_ring="Naji's Loop",
		right_ring="Mephitas's Ring +1",
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
}
		
	sets.midcast.LightWeatherCuraga = set_combine(sets.midcast.Curaga,{})
	sets.midcast.LightDayCuraga = set_combine(sets.midcast.Curaga,{})
		
	--Melee Curesets are used whenever your Weapons state is set to anything but None.
	sets.midcast.MeleeCure = {}
		
	sets.midcast.MeleeCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaut +1"})
	sets.midcast.MeleeLightWeatherCure = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightWeatherCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaut +1",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaut +1",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCure = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCuraga = set_combine(sets.midcast.MeleeCure, {})
	sets.midcast.MeleeLightWeatherCuraga = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCuraga = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})

	sets.midcast.CureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +1"})
	sets.midcast.LightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.LightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +1",waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +1",waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.Curaga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.LightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCure.DT = set_combine(sets.midcast.Cure.DT, {})
	
	sets.midcast.MeleeCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +1"})
	sets.midcast.MeleeLightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +1",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +1",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCuraga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeLightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})

	sets.midcast.Cursna = {
	main="Queller Rod", --main="Yagrush",
	sub="Sors Shield",	--sub="Thuellaic Ecu +1",
	ammo="Pemphredo Tathlum",
	head="Vanya Hood",
	body="Ebers Bliaut +1",
	--hands={ name="Fanatic Gloves", augments={'MP+50','Healing magic skill +10','"Conserve MP"+7','"Fast Cast"+7',}},
	legs="Th. Pantaloons +2",
	feet="Vanya Clogs",
	--neck="Debilis Medallion",
	--waist="Bishop's Sash",
	left_ear="Meili Earring",
	right_ear="Ebers Earring +2",
	left_ring="Menelaus's Ring",
	right_ring="Haoma's Ring",
	back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
}

	sets.midcast.StatusRemoval = {
		main="Queller Rod",
		sub="Sors Shield",
		ammo="Pemphredo Tathlum",
		head="Vanya Hood",
		body="Ebers Bliaut +1",
		hands="Ebers Mitts +1",
		legs="Ebers Pant. +1",
		--feet="Ebers Duckbills +1",
		neck="Cleric's Torque +2",
		waist="Witful Belt",
		left_ear="Magnetic Earring",
		right_ear="Loquac. Earring",
		left_ring="Prolix Ring",
		right_ring="Kishar Ring",
		back="Fi Follet Cape", --Augment Lustreless Hide
}

    -- 110 total Enhancing Magic Skill; caps even without Light Arts
	sets.midcast['Enhancing Magic'] = {
		main="Gada",
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head="Befouled Crown",
		body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
		hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +8',}},
		legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
		--feet="Theo. Duckbills +2",
		neck="Colossus's Torque",
		waist="Embla Sash",
		left_ear="Andoaa Earring",
		right_ear="Magnetic Earring",
		left_ring="Prolix Ring",
		right_ring="Kishar Ring",
		back="Fi Follet Cape", --+1
}

	sets.midcast.Haste = {
		main={ name="Gada", augments={'Enh. Mag. eff. dur. +5','Mag. Acc.+4','"Mag.Atk.Bns."+18',}},
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head="Befouled Crown",
		body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
		hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +8',}},
		legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
		--feet="Theo. Duckbills +2",
		neck="Colossus's Torque",
		waist="Embla Sash",
		left_ear="Andoaa Earring",
		right_ear="Magnetic Earring",
		left_ring="Prolix Ring",
		right_ring="Kishar Ring",
		back="Fi Follet Cape",
}

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
		waist="Siegel Sash",
		right_ear="Earthcry Earring",
		neck="Nodens Gorget",
})

	sets.midcast.Auspice = set_combine(sets.midcast['Enhancing Magic'], {feet="Ebers Duckbills +1"})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {
		main="Vadose Rod",
		head="Chironic Hat",
		hands="Regal Cuffs",
})

	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {
	main="Bolelabunga",
	head="Inyanga Tiara +2",
	hands="Ebers Mitts +1",
	--body="Piety Bliaut +4",
	legs="Theophany Pantaloons +2"
})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Vocane Ring +1",feet="Piety Duckbills +2",ear1="Gifted Earring",waist="Sekhmet Corset"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Vocane Ring +1",feet="Piety Duckbills +2",ear1="Gifted Earring",waist="Sekhmet Corset"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Vocane Ring +1",legs="Piety Pantaln. +1",ear1="Gifted Earring",waist="Sekhmet Corset"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Vocane Ring +1",legs="Piety Pantaln. +1",ear1="Gifted Earring",waist="Sekhmet Corset"})
	
	
	sets.midcast.BarElement = {
		main="Beneficus",
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head="Ebers Cap +1",
		body="Ebers Bliaut +1",
		hands="Ebers Mitts +1",
		legs="Piety Pantaln. +1",
		feet="Ebers Duckbills +1",
		neck="Incanter's Torque",
		waist="Embla Sash",
		left_ear="Magnetic Earring",
		right_ear="Andoaa Earring",
		right_ring="Stikini Ring",
		right_ring="Stikini Ring",
		back="Fi Follet Cape",
}

	sets.midcast.Impact = {}
		
	sets.midcast['Elemental Magic'] = {}
	sets.midcast['Elemental Magic'].Resistant = {}
	sets.midcast['Divine Magic'] = {
		main={ name="Marin Staff +1", augments={'Path: A',}},
		sub="Enki Strap",
		ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
		head="Inyanga Tiara +2",
		body={ name="Witching Robe", augments={'MP+40','Mag. Acc.+10',}},
		hands={ name="Fanatic Gloves", augments={'MP+50','Healing magic skill +10','"Conserve MP"+7','"Fast Cast"+7',}},
		legs={ name="Lengo Pants", augments={'INT+5','Mag. Acc.+13',}},
		feet="Theo. Duckbills +2",
		neck="Sanctity Necklace",
		waist={ name="Acuity Belt +1", augments={'Path: A',}},
		left_ear="Friomisi Earring",
		right_ear="Hecate's Earring",
		left_ring="Fenrir Ring +1",
		right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		back="Toro Cape",
}
		
	sets.midcast.Holy = {}
	sets.midcast['Dark Magic'] = {}
    sets.midcast.Drain = {}
    sets.midcast.Drain.Resistant = {}
    sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant
	sets.midcast.Stun = {}
	sets.midcast.Stun.Resistant = {}
	sets.midcast.Dispel = {}
	sets.midcast.Dispelga = set_combine(sets.midcast.Dispel, {main="Daybreak",sub="Ammurapi Shield"})

	sets.midcast['Enfeebling Magic'] = {
		main="Daybreak",
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head="Theophany Cap +2",
		body="Theo. Bliaut +2",
		--hands="Regal Cuffs",
		--legs={ name="Chironic Hose", augments={'Mag. Acc.+24','Haste+1','MND+14','"Mag.Atk.Bns."+11',}},
		--feet="Theo. Duckbills +2",
		neck="Null Loop",
		waist={ name="Acuity Belt +1", augments={'Path: A',}}, -- Obstin. Sash augmented
		left_ear="Regal Earring",
		right_ear="Ebers Earring +2",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring",
		back="Null Shawl",
}

	sets.midcast['Enfeebling Magic'].Resistant = {
		main="Daybreak",
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head="Theophany Cap +2",
		body="Theo. Bliaut +2",
		--hands="Regal Cuffs",
		--legs={ name="Chironic Hose", augments={'Mag. Acc.+24','Haste+1','MND+14','"Mag.Atk.Bns."+11',}},
		--feet="Theo. Duckbills +2",
		neck="Null Loop",
		waist={ name="Acuity Belt +1", augments={'Path: A',}}, -- Obstin. Sash augmented
		left_ear="Regal Earring",
		right_ear="Ebers Earring +2",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring",
		back="Null Shawl",
}
		
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)

    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {
    head="Befouled Crown",
})

	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {
	main="Yagrush",
})

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})

	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

    -- Sets to return to when not performing an action.

    -- Resting sets
	sets.resting = {
		main="Daybreak",
		sub="Genmei Shield",
		ammo="Homiliary",
		head="Bunzi's Hat",
		body="Ebers Bliaut +1",
		hands="Bunzi's Gloves",
		legs="Ebers Pant. +1",
		feet="Ebers Duckbills +1",
		neck="Loricate Torque +1",
		waist="Plat. Mog. Belt",
		left_ear="Etiolation Earring",
		right_ear="Hearty Earring", -- Eabani earring
		left_ring="Murky Ring",
		right_ring="Stikini Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity-10','Phys. dmg. taken-10%',}},}

    
		
	-- Engaged sets
	
    sets.engaged = {
		main="Lorg Mor",
		ammo="Staunch Tathlum +1",
		head={ name="Nyame Helm", augments={'Path: B',}},
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck="Null Loop",
		waist="Plat. Mog. Belt",
		left_ear={ name="Ebers Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','Damage taken-6%','STR+7 MND+7',}},
		right_ear="Crep. Earring",
		left_ring="Chirich Ring +1",
		right_ring="Chirich Ring +1",
		back="Nullshawl",
}
    
	sets.engaged.Acc = {}

		-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Divine Caress'] = {hands="Ebers Mitts +1",back="Mending Cape"}
	sets.HPDown = {}
	sets.HPCure = {}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 1)
end

buff_spell_lists = {
	Auto = {--Options for When are: Always, Engaged, Idle, OutOfCombat, Combat
		{Name='Refresh III',	Buff='Refresh',		SpellID=894,	When='Always'},
		{Name='Haste II',		Buff='Haste',		SpellID=511,	When='Always'},
		{Name='Aurorastorm',	Buff='Aurorastorm',	SpellID=119,	When='Idle'},
		{Name='Reraise',		Buff='Reraise',		SpellID=135,	When='Always'},
	},
	
	AutoMelee = {
		{Name='Haste II',		Buff='Haste',		SpellID=511,	When='Engaged'},
		{Name='Temper II',		Buff='Multi Strikes',SpellID=895,	When='Engaged'},
	},
	
	Default = {
		{Name='Refresh III',	Buff='Refresh',		SpellID=894,	Reapply=false},
		{Name='Haste II',		Buff='Haste',		SpellID=511,	Reapply=false},
		{Name='Stoneskin',		Buff='Stoneskin',	SpellID=54,		Reapply=false},
		{Name='Shell V',		Buff='Shell',		SpellID=52,		Reapply=false},
		{Name='Protect V',		Buff='Protect',		SpellID=47,		Reapply=false},
	},

	MageBuff = {
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		{Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		{Name='Aquaveil',		Buff='Aquaveil',		SpellID=55,		Reapply=false},
		{Name='Phalanx',		Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Stoneskin',		Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Blink',			Buff='Blink',			SpellID=53,		Reapply=false},
		{Name='Gain-INT',		Buff='INT Boost',		SpellID=490,	Reapply=false},
		{Name='Shell V',		Buff='Shell',			SpellID=52,		Reapply=false},
		{Name='Protect V',		Buff='Protect',			SpellID=47,		Reapply=false},
	},
	
	FullMeleeBuff = {
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		{Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		{Name='Regen II',		Buff='Regen',			SpellID=110,	Reapply=false},
		{Name='Aquaveil',		Buff='Aquaveil',		SpellID=55,		Reapply=false},
		{Name='Phalanx',		Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Stoneskin',		Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Blink',			Buff='Blink',			SpellID=53,		Reapply=false},
		{Name='Gain-STR',		Buff='STR Boost',		SpellID=486,	Reapply=false},
		{Name='Shell V',		Buff='Shell',			SpellID=52,		Reapply=false},
		{Name='Protect V',		Buff='Protect',			SpellID=47,		Reapply=false},
		{Name='Shock Spikes',	Buff='Shock Spikes',	SpellID=251,	Reapply=false},
		{Name='Enthunder',		Buff='Enthunder',		SpellID=104,	Reapply=false},
		{Name='Temper II',		Buff='Multi Strikes',	SpellID=895,	Reapply=false},
		{Name='Barfire',		Buff='Barfire',			SpellID=60,		Reapply=false},
		{Name='Barparalyze',	Buff='Barparalyze',		SpellID=74,		Reapply=false},
	},
	
	MeleeBuff = {
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		{Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		{Name='Temper II',		Buff='Multi Strikes',	SpellID=895,	Reapply=false},
		{Name='Gain-STR',		Buff='STR Boost',		SpellID=486,	Reapply=false},
		{Name='Phalanx',		Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Shell V',		Buff='Shell',			SpellID=52,		Reapply=false},
		{Name='Protect V',		Buff='Protect',			SpellID=47,		Reapply=false},
		{Name='Shock Spikes',	Buff='Shock Spikes',	SpellID=251,	Reapply=false},
		{Name='Enthunder',		Buff='Enthunder',		SpellID=104,	Reapply=false},
		{Name='Barblizzard',	Buff='Barblizzard',		SpellID=61,		Reapply=false},
		{Name='Barparalyze',	Buff='Barparalyze',		SpellID=74,		Reapply=false},
	},

	Odin = {
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		{Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		{Name='Phalanx',		Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Gain-INT',		Buff='INT Boost',		SpellID=490,	Reapply=false},
		{Name='Temper II',		Buff='Multi Strikes',	SpellID=895,	Reapply=false},
		{Name='Regen II',		Buff='Regen',			SpellID=110,	Reapply=false},
		{Name='Enaero',			Buff='Enaero',			SpellID=102,	Reapply=false},
		{Name='Stoneskin',		Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Shell V',		Buff='Shell',			SpellID=52,		Reapply=false},
		{Name='Protect V',		Buff='Protect',			SpellID=47,		Reapply=false},
	},
	
	Tolba = {
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		{Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		{Name='Phalanx',		Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Gain-STR',		Buff='STR Boost',		SpellID=486,	Reapply=false},
		{Name='Temper II',		Buff='Multi Strikes',	SpellID=895,	Reapply=false},
		{Name='Regen II',		Buff='Regen',			SpellID=110,	Reapply=false},
		{Name='Enblizzard',		Buff='Enblizzard',		SpellID=104,	Reapply=false},
		{Name='Stoneskin',		Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Shell V',		Buff='Shell',			SpellID=52,		Reapply=false},
		{Name='Protect V',		Buff='Protect',			SpellID=47,		Reapply=false},
		{Name='Barwater',		Buff='Barwater',		SpellID=65,		Reapply=false},
	},
	
	HybridCleave = {
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		{Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		{Name='Phalanx',		Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Gain-INT',		Buff='INT Boost',		SpellID=490,	Reapply=false},
		{Name='Enthunder II',	Buff='Enthunder II',	SpellID=316,	Reapply=false},
		{Name='Temper II',		Buff='Multi Strikes',	SpellID=895,	Reapply=false},
		{Name='Shell V',		Buff='Shell',			SpellID=52,		Reapply=false},
		{Name='Protect V',		Buff='Protect',			SpellID=47,		Reapply=false},
	}}
	
function sub_job_change(new,old)
send_command('wait 5;input /lockstyleset 17')
end

send_command('wait 5;input /lockstyleset 17')

send_command('exec init.txt')