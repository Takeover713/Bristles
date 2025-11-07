function user_setup()

	-- Options: Override default values
    state.OffenseMode:options('Normal')
	state.CastingMode:options('Normal', 'Resistant', 'Fodder', 'Proc')
    state.IdleMode:options('Normal')
	state.PhysicalDefenseMode:options('PDT', 'NukeLock', 'GeoLock', 'PetPDT')
	state.MagicalDefenseMode:options('MDT', 'NukeLock')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','Idris','LorgMor','Zeni','Zeni2000')
	
	autows_list = {['BlackHalo']='Black Halo'}
	
	autoindi = "Fury"
	autogeo = "Frailty"
	autoentrust = "Precision"
	autoentrustee = "Temahri"
	
    --indi_timer = 180
    indi_duration = 290
	
	select_default_macro_book(1, 5)
end

function init_gear_sets()

	sets.WakeUpWeapons = {main="Lorg Mor"}
	sets.weapons.LorgMor = {main="Lorg Mor",sub="Genmei Shield"}
	sets.weapons.Idris = {main="Idris",sub="Genmei Shield"}
	sets.weapons.Zeni = {range="Soultrapper",ammo="Blank Soulplate"}
	sets.weapons.Zeni2000 = {range="Soultrapper 2000",ammo="Blank Soulplate"}
	
	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	-- Resting sets
	sets.resting = {	
		main="Chatoyant Staff",
		neck="Grandiose Chain",
        waist="Austerity Belt"}

	-- Idle sets

	sets.idle = {
		main="Lorg Mor",
		sub="Genmei Shield",
		range="Dunna",
		head="Azimuth Hood +3",
		body="Azimuth Coat +3",
		hands="Bagua Mitaines +4",
		legs="Assid. Pants +1",
		feet="Geo. Sandals +4",
		neck="Loricate Torque +1",
		waist="Witful Belt",
		left_ear="Etiolation Earring",
		right_ear="Genmei Earring",
		left_ring="Murky Ring",
		right_ring="Defending Ring",
		back="Solemnity Cape"
}
		
	sets.idle.PDT = {
		main="Lorg Mor",sub="Genmei Shield",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head="Azimuth Hood +3",
		body="Azimuth Coat +3",
		hands="Geo. Mitaines +4",
		legs="Assid. Pants +1",
		feet="Geo. Sandals +4",
		neck="Loricate Torque +1",
		left_ear="Etiolation Earring",
		right_ear="Genmei Earring",
		left_ring="Murky Ring",
		right_ring="Defending Ring",
		waist="Isa Belt",
		back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10','Pet: Damage taken -5%',}},
}
		
	sets.idle.TPEat = set_combine(sets.idle, {neck="Chrys. Torque"})

	-- .Pet sets are for when Luopan is present.
	sets.idle.Pet = {
		main="Lorg Mor",sub="Genmei Shield",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head="Azimuth Hood +3",
		body="Geomancy Tunic +4",
		hands="Geo. Mitaines +4",
		legs="Nyame Flanchard", --Agwu's Slops, Ongo
		feet="Bagua Sandals +4",
		neck={ name="Bagua Charm +2", augments={'Path: A',}},
		left_ear="Etiolation Earring",
		right_ear="Moonshade Earring", --Odnowa Earring R15
		left_ring="Murky Ring", --Stikini +1 if want refresh
		right_ring="Defending Ring",
		waist="Isa Belt",
		back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10','Pet: Damage taken -5%',}}, --change to +15 regen
}

	sets.idle.PDT.Pet = {
		main="Lorg Mor",sub="Genmei Shield",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head="Azimuth Hood +3",
		body="Geomancy Tunic +4",
		hands="Geo. Mitaines +4",
		legs="Nyame Flanchard", --Agwu's Slops, Ongo
		feet="Bagua Sandals +4",
		neck={ name="Bagua Charm +2", augments={'Path: A',}},
		left_ear="Etiolation Earring",
		right_ear="Moonshade Earring", --Odnowa Earring R15
		left_ring="Murky Ring", --Stikini +1 if want refresh
		right_ring="Defending Ring",
		waist="Isa Belt",
		back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10','Pet: Damage taken -5%',}}, --change to +15 regen
}

	-- .Indi sets are for when an Indi-spell is active.
	sets.idle.Indi = set_combine(sets.idle, {
		main="Lorg Mor",sub="Genmei Shield",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head="Azimuth Hood +3",
		body="Geomancy Tunic +4",
		hands="Geo. Mitaines +4",
		legs="Nyame Flanchard", --Agwu's Slops, Ongo
		feet="Bagua Sandals +4",
		neck={ name="Bagua Charm +2", augments={'Path: A',}},
		left_ear="Etiolation Earring",
		right_ear="Moonshade Earring", --Odnowa Earring R15
		left_ring="Murky Ring", --Stikini +1 if want refresh
		right_ring="Defending Ring",
		waist="Isa Belt",
		back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10','Pet: Damage taken -5%',}}, --change to +15 regen
})
		
	sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {
		main="Lorg Mor",sub="Genmei Shield",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head="Azimuth Hood +3",
		body="Geomancy Tunic +4",
		hands="Geo. Mitaines +4",
		legs="Nyame Flanchard", --Agwu's Slops, Ongo
		feet="Bagua Sandals +4",
		neck={ name="Bagua Charm +2", augments={'Path: A',}},
		left_ear="Etiolation Earring",
		right_ear="Moonshade Earring", --Odnowa Earring R15
		left_ring="Murky Ring", --Stikini +1 if want refresh
		right_ring="Defending Ring",
		waist="Isa Belt",
		back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10','Pet: Damage taken -5%',}}, --change to +15 regen
})
		
	sets.idle.PDT.Indi = set_combine(sets.idle.PDT, {legs="Bagua Pants +3"}) 
	sets.idle.PDT.Pet.Indi = set_combine(sets.idle.PDT.Pet, {})

	sets.idle.Weak = {
		main="Lorg Mor",sub="Genmei Shield",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head="Azimuth Hood +3",
		body="Mallquis Saio +1",
		hands="Geo. Mitaines +4",
		legs="Assid. Pants +1",
		feet="Mallquis Clogs +1",
		neck="Loricate Torque +1",
		left_ear="Etiolation Earring",
		right_ear="Genmei Earring",
		left_ring="Murky Ring",
		right_ring="Defending Ring",
		waist="Isa Belt",
		back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10','Pet: Damage taken -5%',}},
}
	
	------------------
	-- Midcast sets --
	------------------
	
	sets.midcast['Absorb-TP'] = {
		head="Azimuth Hood +3",
		body="Azimuth Coat +3",
		hands="Azimuth Gloves +3",
		legs="Azimuth Tights +3",
		feet="Azimuth Gaiters +3",
		neck="Erra Pendant",
		waist="Null Belt",
		left_ear="Malignance Earring",
		right_ear="Crep. Earring",
		left_ring="Medada's Ring",
		right_ring="Stikini Ring",
		back="Null Shawl"
}
	
    sets.midcast.FastRecast = {    
		range="Dunna",
		head="Merlinic Hood",--Augment merlinic for 7%
		body="Merlinic Jubbah",--Augment merlinic for 7%
		hands="", --"Volte Gloves",
		legs="Lengo Pants",
		feet="Regal Pumps +1",	
		neck="Voltsurge Torque",
		waist="Witful Belt",
		left_ear="Malignance Earring",
		right_ear="Loquac. Earring",
		left_ring="Medada's Ring",
		right_ring="Kishar Ring",
		back={ name="Nantosuelta's Cape", augments={'"Fast Cast"+10','Pet: Damage taken -5%',}},
}

	sets.midcast.Geomancy = {
		main="Idris",
		sub="Genmei Shield",
		range="Dunna",
		head="Azimuth Hood +3",
		body="Bagua Tunic +1", 
		hands="Geo. Mitaines +4",
		legs="Bagua Pants +3",
		feet="Bagua Sandals +4",
		neck="Bagua Charm +2",
		waist="Austerity Belt",
		left_ear="Calamitous Earring",
		right_ear="Gifted Earring",
		left_ring="Murky Ring",
		right_ring="Defending Ring",
		back={ name="Lifestream Cape", augments={'Geomancy Skill +10','Indi. eff. dur. +19','Pet: Damage taken -3%',}},
		--Need 20% on cape
}

	--Extra Indi duration as long as you can keep your 900 skill cap.
	sets.midcast.Geomancy.Indi = set_combine(sets.midcast.Geomancy, {
		range="Dunna",
		legs="Bagua Pants +3",
		feet="Azimuth Gaiters +3",
		back={ name="Lifestream Cape", augments={'Geomancy Skill +10','Indi. eff. dur. +19','Pet: Damage taken -3%',}},
})
		
    sets.midcast.Cure = {   
		main="Daybreak",
		sub="Ammurapi Shield",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head="Vanya Hood",
		body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
		hands={ name="Vanya Cuffs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
		legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
		feet="Vanya Clogs",
		neck="Incanter's Torque",
		waist="Luminary Sash",
		left_ear="Mendi. Earring",
		right_ear="Meili Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Tempered Cape +1",
}
		
    sets.midcast.LightWeatherCure = {}
		
	--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = sets.midcast.Cure

    sets.midcast.Curaga = sets.midcast.Cure
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {})
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})
	
    sets.midcast['Elemental Magic'] = {
		main="Bunzi's Rod",
		sub="Ammurapi Shield",
		ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
		head="Azimuth Hood +3",
		body="Azimuth Coat +3",
		hands="Azimuth Gloves +3",
		legs="Azimuth Tights +3",
		feet="Azimuth Gaiters +3",
		neck="Mizu. Kubikazari", --Baetyl pendant Warder Of Love
		waist={ name="Acuity Belt +1", augments={'Path: A',}}, -- Sacro cord Alexander
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
		left_ring="Medada's Ring",
		right_ring="Metamor. Ring +1",
		back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
}

    sets.midcast['Elemental Magic'].Resistant = {}

	-- Gear for Magic Burst mode.
    sets.MagicBurst = {
		main="Bunzi's Rod",
		sub="Ammurapi Shield",
		ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
		head="Azimuth Hood +3",
		body="Azimuth Coat +3",
		hands="Bagua Mitaines +4",
		legs="Azimuth Tights +3",
		feet="Azimuth Gaiters +3",
		neck="Mizu. Kubikazari",
		waist="Acuity Belt +1",
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
		left_ring="Medada's Ring",
		right_ring="Mujin Band",
		back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
}
		
    sets.midcast['Elemental Magic'].Fodder = {}
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {})
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {})
	sets.midcast['Elemental Magic'].HighTierNuke.Fodder = set_combine(sets.midcast['Elemental Magic'].Fodder, {})
    sets.midcast['Dark Magic'] = {}
		
    sets.midcast.Drain = {}
    sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Stun = {}
	sets.midcast.Stun.Resistant = {}
	sets.midcast.Impact = {}
		
	sets.midcast['Enfeebling Magic'] = {		
		main="Daybreak",
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head="Geo. Galero +4",
		body="Geomancy Tunic +2",
		hands="Geo. Mitaines +4",
		legs="Geomancy Pants +2",
		feet="Geo. Sandals +4",
		neck={ name="Bagua Charm +2", augments={'Path: A',}},
		waist="Eschan Stone",
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
		left_ring="Kishar Ring",
		right_ring="Stikini Ring",
		back={ name="Aurist's Cape +1", augments={'Path: A',}},
}
		
	sets.midcast['Enfeebling Magic'].Resistant = set_combine(sets.midcast['Enfeebling Magic'], {})
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {head="Amalric Coif +1",ear2="Barkaro. Earring",waist="Acuity Belt +1"})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head="Amalric Coif +1",ear2="Barkaro. Earring",waist="Acuity Belt +1"})
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {head="Amalric Coif +1",ear2="Barkaro. Earring",waist="Acuity Belt +1"})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head="Amalric Coif +1",ear2="Barkaro. Earring",waist="Acuity Belt +1"})
	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {range=empty,ring1="Stikini Ring"})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {range=empty,ring1="Stikini Ring"})
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {ring1="Stikini Ring"})
		
	sets.midcast['Enhancing Magic'] = {
		main="Gada",
		sub="Ammurapi Shield",
		ammo="Hasty Pinion +1",
		head="Telchine Cap",
		neck="Incanter's Torque",
		ear1="Andoaa Earring",
		ear2="Gifted Earring",
		body="Telchine Chas.",
		hands="Telchine Gloves",
		ring1="Stikini Ring",
		ring2="Stikini Ring",
		back="Perimede Cape",
		waist="Olympus Sash",
		legs="Telchine Braconi",
		feet="Telchine Pigaches"}
		
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1"})
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",sub="Genmei Shield",head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {legs="Shedir Seraweels"})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear1="Gifted Earring",ear2="Loquacious Earring",waist="Sekhmet Corset"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear1="Gifted Earring",ear2="Loquacious Earring",waist="Sekhmet Corset"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear1="Gifted Earring",ear2="Loquacious Earring",waist="Sekhmet Corset"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear1="Gifted Earring",ear2="Loquacious Earring",waist="Sekhmet Corset"})
	
	------------------
	-- Precast sets --
	------------------

	-- Precast sets to enhance JAs
	sets.precast.JA.Bolster = {body="Bagua Tunic +1"}
	sets.precast.JA['Life Cycle'] = {body="Geomancy Tunic +4"}
	sets.precast.JA['Radial Arcana'] = {feet="Bagua Sandals +4"}
	sets.precast.JA['Mending Halation'] = {legs="Bagua Pants +3"}
	sets.precast.JA['Full Circle'] = {head="Azimuth Hood +3",hands="Bagua Mitaines +4"}
	
	-- Indi Duration in slots that would normally have skill here to make entrust more efficient.
	sets.buff.Entrust = {main="Gada",} --Gada, Indi duration 11%
	
	--Once you unlock the Idris, you would only use a Solstice or Gada when using Entrust.
	--Pellucid Stones and Taupe Stones have a maximum augment of +10% duration while Fern Stones
	--have a maximum augment of +11% duration. Even with a 8% duration increase, 
	--coupled with the 20% duration increase (maximum augment) on the Lifestream Cape, you can 
	--see an Indicolure spell duration of 346 seconds (5:46), assuming you have fully invested in 
	--the Indicolure Spell Effect Duration job points.
	
	
	-- Fast cast sets for spells

	sets.precast.FC = { --68% 
		range="Dunna",
		head="Merlinic Hood",--Augment merlinic for 7%
		body="Merlinic Jubbah",--Augment merlinic for 7%
		hands="",
		legs="Lengo Pants",
		feet="Regal Pumps +1",	
		neck="Voltsurge Torque",
		waist="Witful Belt",
		left_ear="Malignance Earring",
		right_ear="Loquac. Earring",
		left_ring="Medada's Ring",
		right_ring="Kishar Ring",
		back={ name="Nantosuelta's Cape", augments={'"Fast Cast"+10','Pet: Damage taken -5%',}},
}

	sets.precast.FC.Geomancy = set_combine(sets.precast.FC, {range="Dunna",ammo=empty})
	
    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {
		neck="Stoicheion Medal",
		ear2="Barkaro. Earring",
		hands="Bagua Mitaines +4",
})

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})	
	sets.precast.FC.Curaga = sets.precast.FC.Cure
	
	sets.Self_Healing = {
		main="Daybreak",
		sub="Ammurapi Shield",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head="Vanya Hood",
		body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
		hands={ name="Vanya Cuffs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
		legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
		feet="Vanya Clogs",
		neck="Incanter's Torque",
		waist="Luminary Sash",
		left_ear="Mendi. Earring",
		right_ear="Meili Earring",
		left_ring="Stikini Ring", -- stikini +1
		right_ring="Defending Ring", -- stikini +1
		back="Tempered Cape +1",
}

	sets.Cure_Received = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash",feet="Inspirited Boots"}
	
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

	sets.precast.FC.Impact = {ammo="Impatiens",
		head=empty,neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Twilight Cloak"}

	
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
		ammo="Oshasha's Treatise",
		head={ name="Nyame Helm", augments={'Path: B',}},
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck="Rep. Plat. Medal",
		waist="Cornelia's Belt",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Mache Earring +1",
		left_ring="Epaminondas's Ring",
		right_ring="Karieyh Ring +1",
		back={ name="Nantosuelta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}

	--------------------------------------
	-- Engaged sets
	--------------------------------------

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Normal melee group
	sets.engaged = {
		main="Lorg Mor",
		sub="Genmei Shield",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head="Azimuth Hood +3",
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Gazu Bracelets +1", augments={'Path: A',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck={ name="Bagua Charm +2", augments={'Path: A',}},
		waist="Windbuffet Belt +1",
		left_ear="Telos Earring",
		right_ear="Mache Earring +1",
		left_ring="Chirich Ring +1",
		right_ring="Chirich Ring +1",
		back={ name="Nantosuelta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
}
	
	-- {
	-- main="Lorg Mor",sub="Genmei Shield",
    -- range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    -- head="Azimuth Hood +3",
    -- body={ name="Nyame Mail", augments={'Path: B',}},
    -- hands={ name="Gazu Bracelets +1", augments={'Path: A',}},
    -- legs={ name="Nyame Flanchard", augments={'Path: B',}},
    -- feet={ name="Nyame Sollerets", augments={'Path: B',}},
    -- neck={ name="Bagua Charm +2", augments={'Path: A',}},
    -- waist="Windbuffet Belt +1",
    -- left_ear="Telos Earring",
    -- right_ear="Mache Earring +1",
    -- left_ring="Chirich Ring +1",
    -- right_ring="Chirich Ring +1",
    -- back={ name="Nantosuelta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}},}
	
	-- sets["GEO TP"] = {
    -- main="Tishtrya",
    -- sub="Ammurapi Shield",
    -- ammo="Crepuscular Pebble",
    -- head="Nyame Helm",
    -- neck="Combatant's Torque",
    -- ear1="Cessance Earring",
    -- ear2="Dedition Earring",
    -- body="Nyame Mail",
    -- hands="Nyame Gauntlets",
    -- ring1="Chirich Ring +1",
    -- ring2="Chirich Ring +1",
    -- back="Null Shawl",
    -- waist="Cornelia's Belt",
    -- legs="Jhakri Slops +2",
    -- feet="Nyame Sollerets"
-- }
		
	sets.engaged.DW = {
		main="Lorg Mor",
		sub="C.Palug Hammer",
		head="Azimuth Hood +3",
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Gazu Bracelets +1", augments={'Path: A',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck={ name="Bagua Charm +2", augments={'Path: A',}},
		waist="Windbuffet Belt +1",
		left_ear="Telos Earring",
		right_ear="Mache Earring +1",
		left_ring="Chirich Ring +1",
		right_ring="Chirich Ring +1",
		back={ name="Nantosuelta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
}


	-- sets.engaged.DW = {
    -- main="Idris",
	-- sub="Ternion Dagger +1",
	-- ranged=Empty,
	-- ammo="Crepuscular Pebble",
	-- head="Azimuth Hood +3",
	-- body="Mallquis Saio +2",
	-- hands="Gazu Bracelets +1",
	-- legs="Jhakri Slops +2",
	-- feet="Azimuth Gaiters +3",
	-- neck="Loricate Torque +1",
	-- waist="Windbuffet Belt +1",
	-- ear1="Brutal Earring",
	-- ear2="Suppanomimi",
	-- ring1="Petrov Ring",
	-- ring2="Chirich Ring +1",
	-- back="Nantosuelta's Cape",
	-- }
	
		-- Defense sets
	
	sets.defense.PDT = {}
	sets.defense.MDT = {}
    sets.defense.MEVA = {}		
	sets.defense.PetPDT = sets.idle.PDT.Pet		
	sets.defense.NukeLock = sets.midcast['Elemental Magic']	
	sets.defense.GeoLock = sets.midcast.Geomancy.Indi

	sets.Kiting = {feet="Geo. Sandals +4"}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	-- sets.DayIdle = {}
	-- sets.NightIdle = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.HPDown = {}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Seidr Cotehardie"}
	
	sets.RecoverBurst = {
	head="Ea Hat",
	neck="Mizu. Kubikazari",
	body="Seidr Cotehardie",
	ring1="Mujin Band",
	legs="Ea Slops",
	feet="Jhakri Pigaches +2"}

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 5)
end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 20')
end

send_command('exec init.txt')