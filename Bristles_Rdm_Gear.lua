function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal')
    state.HybridMode:options('Normal', 'PhysicalDef', 'MagicalDef')
	state.CastingMode:options('Normal', 'Resistant', 'Fodder', 'Proc')
    state.IdleMode:options('Normal', 'Refresh', 'PDT', 'MDT', 'TPEat','DTHippo')
    state.PhysicalDefenseMode:options('PDT', 'NukeLock')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','Naegling','Gleti','BlackHalo')
	
	autows_list = {['Naegling']='Savage Blade',['BlackHalo']='Black Halo',['Gleti']='Evisceration'}
	autowstp = 1250

		-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind ^@!` input /ja "Accession" <me>')
	send_command('bind ^backspace input /ja "Saboteur" <me>')
	send_command('bind !backspace input /ja "Spontaneity" <t>')
	send_command('bind @backspace input /ja "Composure" <me>')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	
	select_default_macro_book(1, 3)
end

function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Weapons sets
	--sets.weapons.Sequence = {main="Sequence",sub="Thibron"}
	sets.weapons.Odin = {main="Qutrub Knife",sub="Ceremonial Dagger"}
	sets.weapons.Naegling = {main="Naegling",sub="Pukulatmuj +1"}
	sets.weapons.BH = {main="Maxentius",sub="Ammurapi Shield"}
	sets.weapons.Gleti = {main="Gleti's Knife",sub="Naegling"}--sub="Thibron"}
	sets.WakeUpWeapons = {main="Prime Sword"}
	
	-- Idle sets
	
	sets.idle = {
		main="Daybreak",
		sub="Genmei Shield",
		ammo="Homiliary",
		head="Viti. Chapeau +4",
		body="Lethargy Sayon +3",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Loricate Torque +1",
		waist="Fucho-no-Obi",
		left_ear="Genmei Earring",
		right_ear="Etiolation Earring",
		left_ring="Murky Ring",
		right_ring="Dark Ring",
		back="Solemnity Cape",
}

sets.idle.Refresh = {
		main="Daybreak",
		sub="Genmei Shield",
		ammo="Staunch Tathlum +1",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Loricate Torque +1",
		waist="Fucho-no-Obi",
		left_ear="Genmei Earring",
		right_ear="Etiolation Earring",
		left_ring="Murky Ring",
		right_ring="Dark Ring",
		back="Solemnity Cape",
}
		
	sets.idle.PDT = {}	
	sets.idle.MDT = {}	
	sets.idle.Weak = {}
	sets.idle.DTHippo = set_combine(sets.idle.PDT, {})
	
	-- Precast Sets
	organizer_items = {}
	
	-- Precast sets to enhance JAs
	sets.precast.JA['Chainspell'] = {body="Viti. Tabard +3"}
	

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	-- Fast cast sets for spells
	sets.precast.FC = { --RDM gets 30 FC from traits and up to 8 more from JP gifts
		--main={ name="Crocea Mors", augments={'Path: C',}}, --AH Sword
		sub="Genmei Shield",
		ammo="Staunch Tathlum +1",          -- 0% FC, **11% SIRD**
		head="Atro. Chapeau +4",            -- 14% FC
		body="Viti. Tabard +3",             -- 13% FC, **10% Quick Magic**
		hands="Leyline Gloves",             -- 8% FC, no SIRD/QM
		legs="Carmine Cuisses +1",          -- 0% FC, **20% SIRD**
		--feet="Amalric Nails +1",          -- 5% FC, **+2% QM if aug’d**
		neck="Loricate Torque +1",          -- 0% FC, **5% SIRD**
		waist="Witful Belt",                -- 3% FC, **3% Quick Magic**
		--left_ear="Magnetic Earring",      -- 0% FC, **8% SIRD**
		right_ear="Loquac. Earring",        -- 2% FC
		left_ring="Stikini Ring",        	-- 0% FC
		right_ring="Murky Ring",        -- 0% FC
		back={ name="Sucellos's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}},
--Fast Cast 55% gear capped (with 38% RDM trait/JP)
--SIRD 64% 
--Quick Magic 15% 
}
		
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Crepuscular Cloak"})
       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
		ammo="Coiste Bodhar",
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Leth. houseaux +3",
		neck="Rep. Plat. Medal",
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Ishvara Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Ilabrat Ring",
		back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
	
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Seraph Blade'] =     {
		ammo="Pemphredo Tathlum",
		head={ name="Merlinic Hood", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','"Drain" and "Aspir" potency +4','INT+7','Mag. Acc.+11','"Mag.Atk.Bns."+15',}},
		body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		hands="Jhakri Cuffs +2",
		legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		feet={ name="Amalric Nails +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		neck="Sanctity Necklace",
		waist="Orpheus's Sash",
		left_ear="Malignance Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Freke Ring",
		right_ring="Shiva Ring +1",
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%',}},
}
	sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {})
	
	sets.precast.WS['Chant Du Cygne'] = set_combine(sets.precast.WS, {neck="Fotia Gorget",ear1="Moonshade Earring",ring1="Begrudging Ring",waist="Fotia Belt",feet="Thereoid Greaves"})

	sets.precast.WS['Savage Blade'] = {    
		ammo="Coiste Bodhar",
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Leth. houseaux +3",
		neck="Rep. Plat. Medal",
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Ishvara Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Ilabrat Ring",
		back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
}
		
	sets.precast.WS['Black Halo'] = set_combine(sets.precast.WS['Savage Blade'], {
 		ear2="Sherida Earring",
		})
		
	sets.precast.WS['Sanguine Blade'] =  {
		ammo="Coiste Bodhar",
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Leth. houseaux +3",
		neck="Rep. Plat. Medal",
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Ishvara Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Ilabrat Ring",
		back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
}

	sets.precast.WS['Aeolian Edge'] =  {
		ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
		head="Leth. Chappel +3",
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands="Jhakri Cuffs +2",
		legs="Leth. Fuseau +3",
		feet="Leth. Houseaux +3",
		neck="Sibyl Scarf",
		waist={ name="Acuity Belt +1", augments={'Path: A',}},
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Malignance Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Freke Ring",
		back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
}
	
	-- Midcast Sets

	sets.TreasureHunter = set_combine(sets.TreasureHunter, {feet=gear.chironic_treasure_feet})
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Seidr Cotehardie"}
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {
    main="Bunzi's Rod",
    sub="Ammurapi Shield",
    ammo="Ghastly Tathlum +1",
    head="Leth. Chappel +3",
    body="Lethargy Sayon +3",
    hands="Leth. Ganth. +3",
    legs="Leth. Fuseau +3",
    feet="Leth. houseaux +3",
    neck="Sibyl Scarf",
    waist="Acuity Belt +1",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Freke Ring",
    right_ring="Mujin Band",
	back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	}
		
	sets.midcast.Impact = { 
		main="Maxentius",
		sub="Ammurapi Shield",
		ammo="Regal Gem",
		--range="Ullr", --Pulse weapon
		neck="Null Loop",
		ear1="Malignance Earring",
		ear2="Snotra Earring",
		body="Crepuscular Cloak",
		hands="Leth. Ganth. +3",
		ring1="Metamor. Ring +1",
		ring2="Stikini Ring",
		back="Null Shawl",
		waist="Null Belt",
		legs="Leth. Fuseau +3",
		feet="Leth. houseaux +3"}
		
	sets.RecoverBurst = {head="Ea Hat",neck="Mizu. Kubikazari",body="Seidr Cotehardie",hands="Amalric Gages +1",ring1="Mujin Band",legs="Ea Slops",feet="Jhakri Pigaches +2"}
	
	-- Gear for specific elemental nukes.


	sets.midcast.FastRecast = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Hasty Pinion +1",
		head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Loquac. Earring",ear2="Enchntr. Earring +1",
		body="Zendik Robe",hands="Gende. Gages +1",ring1="Kishar Ring",ring2="Prolix Ring",
		back="Swith Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Medium's Sabots"}

    sets.midcast.Cure = {
		main="Daybreak",
		sub="Sors Shield",
		ammo="Regal Gem",
		head="Vanya Hood",
		body="Vanya Robe",
		hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
		legs={ name="Chironic Hose", augments={'Mag. Acc.+24','Haste+1','MND+14','"Mag.Atk.Bns."+11',}}, --safe 2
		feet="Vanya Clogs",
		neck="Colossus's Torque",
		waist="Luminary Sash",
		left_ear="Regal Earring",
		--right_ear="Magnetic Earring",
		left_ring="Stikini Ring",
		--right_ring="Sirona's Ring",
		back="Tempered Cape +1",
}
		
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {
		neck="Debilis Medallion",
		hands="Hieros Mittens",
		ring1="Haoma's Ring",
		ring2="Haoma's Ring",
		waist="Witful Belt",
		feet="Vanya Clogs"})
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main="Oranyan",sub="Clemency Grip"})
		
	sets.midcast.Curaga = sets.midcast.Cure
	sets.Self_Healing = {neck="Phalaina Locket",ear1="Etiolation Earring",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash"}

	sets.midcast['Enhancing Magic'] = {
		main="Pukulatmuj +1",
		sub="Ammurapi Shield",
		ammo="Staunch Tathlum +1",
		head="Befouled Crown",
		body="Viti. Tabard +3",
		hands="Viti. Gloves +3",
		legs="Telchine Braconi",
		feet="Leth. houseaux +3",
		--neck={ name="Dls. Torque +2", augments={'Path: A',}}, --AH
		waist="Embla Sash",
		left_ear="Andoaa Earring",
		right_ear="Mimir Earring",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring",
		back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +8','Enha.mag. skill +5','Mag. Acc.+7','Enh. Mag. eff. dur. +19',}},
}


--Atrophy Gloves are better than Lethargy for me despite the set bonus for duration on others.		
	sets.buff.ComposureOther = {
		head="Leth. Chappel +3",
		body="Lethargy Sayon +3",
		legs="Leth. Fuseau +3",
		feet="Leth. houseaux +3"}
		
	--Red Mage enhancing sets are handled in a different way from most, layered on due to the way Composure works//
	--Don't set combine a full set with these spells, they should layer on Enhancing Set > Composure (If Applicable) > Spell
	
	sets.midcast.Refresh = {body="Atrophy Tabard +2",legs="Leth. Fuseau +3"}
	sets.midcast.Aquaveil = {hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"}
	sets.midcast.BarElement = {legs="Shedir Seraweels"}
	sets.midcast.Stoneskin = {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"}
	sets.midcast.Protect = {ring2="Sheltered Ring"}
	sets.midcast.Shell = {ring2="Sheltered Ring"}
	
	sets.midcast['Temper II'] = {
		main="Pukulatmuj +1",                    -- +11 Enh. Skill
		sub="Ammurapi Shield",                  -- +10% Duration
		ammo="Pemphredo Tathlum",               -- MACC
		head="Befouled Crown",                  -- +16 Skill
		body="Viti. Tabard +3",             	-- 21 Skill + 10% Duration - +3 +23 Skill
		hands="Viti. Gloves +3",            	-- +21 Skill (upgrade to +3)
		legs="Telchine Braconi",                -- Augment: Enh. Skill +10
		feet="Leth. houseaux +3",               -- Duration (or Atrophy Boots +3 for skill)
		neck="Incanter's Torque",               -- +10 Enh. Skill (or Dls. Torque +2 BiS)
		waist="Embla Sash",                     -- Duration +10%
		left_ear="Andoaa Earring",              -- Duration boost
		right_ear="Mimir Earring",              -- +10 Skill
		left_ring="Stikini Ring",               -- +5 Skill
		right_ring="Stikini Ring",          	-- +5 Skill
		back="Ghostfyre Cape",                  -- Duration +19%, Enh. Skill +5
}

    sets.midcast.Enspell = {
		main="Pukulatmuj +1", 
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head="Befouled Crown",
		body="Viti. Tabard +3",
		hands="Viti. Gloves +3",
		legs="Telchine Braconi",
		feet="Leth. houseaux +3",
		neck="Incanter’s Torque", --neck="Dls. Torque +2",
		waist="Embla Sash",
		left_ear="Andoaa Earring",
		right_ear="Mimir Earring",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring",
		back="Ghostfyre Cape",
}

	sets.midcast['Enfeebling Magic'] = {
		main="Daybreak",
		sub="Ammurapi shield",
		ammo="Regal Gem",
		head="Viti. Chapeau +4",
		body="Lethargy Sayon +3",
		hands="Leth. Ganth. +3",
		legs="Lethargy Fuseau +3",
		feet="Vitiation Boots +2",
		--neck="Dls. Torque +2",
		waist="Luminary Sash",
		left_ear="Snotra Earring",
		right_ear="Regal Earring",
		left_ring={ name="Metamor. Ring +1", augments={'Path: A',}}, --Scales
		right_ring="Stikini Ring ",
		back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
		--Enfeebling Skill +10, MACC +20, INT +20
}
		
	sets.midcast['Enfeebling Magic'].Resistant = {
		main="Daybreak",
		sub="Ammurapi shield",
		ammo="Regal Gem",
		head="Viti. Chapeau +4",
		body="Lethargy Sayon +3",
		hands="Leth. Ganth. +3",
		legs="Chironic Hose",
		feet="Vitiation Boots +2",
		--neck="Dls. Torque +2",
		waist="Luminary Sash",
		left_ear="Snotra Earring",
		right_ear="Regal Earring",
		left_ring={ name="Metamor. Ring +1", augments={'Path: A',}}, --Scales
		right_ring="Stikini Ring ",
		back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
}
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
	sets.midcast['Distract III'] = set_combine(sets.midcast.MndEnfeebles, {})
	sets.midcast['Distract III'].Resistant = set_combine(sets.midcast.MndEnfeebles.Resistant, {hands=gear.chironic_enfeeble_hands})
	sets.midcast['Frazzle III'] = set_combine(sets.midcast.MndEnfeebles, {})
	sets.midcast['Frazzle III'].Resistant = set_combine(sets.midcast.MndEnfeebles.Resistant, {hands=gear.chironic_enfeeble_hands})
	
	sets.midcast.Silence = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.Silence.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})	
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia III'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Viti. Chapeau +4",waist="Chaac Belt"})
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio III'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Viti. Chapeau +4",waist="Chaac Belt",feet=gear.chironic_treasure_feet})

	sets.midcast['Slow II'] = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast['Slow II'].Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
    sets.midcast['Elemental Magic'] = {
		main="Bunzi's Rod",
		sub="Ammurapi Shield",
		ammo="Ghastly Tathlum +1",
		head="Leth. Chappel +3",
		body="Lethargy Sayon +3",
		hands="Leth. Ganth. +3",
		legs="Leth. Fuseau +3",
		feet="Leth. houseaux +3",
		neck="Sanctity Necklace",
		waist="Acuity Belt +1",
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring="Freke Ring",
		right_ring="Metamor. Ring +1",
		back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
}
		
    sets.midcast['Elemental Magic'].Resistant = {}	
    sets.midcast['Elemental Magic'].Fodder = {}
    sets.midcast['Elemental Magic'].Proc = {}
		
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {})
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {})
	sets.midcast['Elemental Magic'].HighTierNuke.Fodder = set_combine(sets.midcast['Elemental Magic'].Fodder, {})

	sets.midcast['Dark Magic'] = {}
    sets.midcast.Drain = {}

	sets.midcast.Aspir = sets.midcast.Drain
	
	sets.midcast['Absorb-TP'] = {
	main="Bunzi's Rod",
	sub="Ammurapi Shield",
	range="Ullr",
	head="Atrophy Chapeau +4",
	neck="Erra Pendant",
    body="Viti. Tabard +3",
	hands="Leth. Ganth. +3",
	waist="Null Belt",
	legs="Leth. Fuseau +3",
	feet="Leth. houseaux +3",
	ear1="Malignance Earring",
	ear2="Leth. Earring +1",
	ring1="Stikini Ring",
	ring2="Metamor. Ring +1",
    back="Aurist's Cape +1",
}
		
	sets.midcast['Absorb-TP'].Resistant = {}
	sets.midcast.Stun = {}
	sets.midcast.Stun.Resistant = {}

	-- Sets for special buff conditions on spells.
		
	sets.buff.Saboteur = {hands="Leth. Ganth. +3"}
	sets.HPDown = {}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {}
	
	-- Defense sets
	sets.defense.PDT = {}
	sets.defense.NukeLock = sets.midcast['Elemental Magic']
	sets.defense.MDT = {}
    sets.defense.MEVA = {}
	sets.idle.TPEat = set_combine(sets.idle, {})
	sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	sets.engaged = {
    ammo="Coiste Bodhar",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Null Loop",
	waist="Sailfi Belt +1",    --waist="Reiki Yotai",
    left_ear="Brutal Earring",
    --left_ear="Telos Earring",
    right_ear="Crepuscular Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10',}},
}

	sets.engaged.DW = {
    ammo="Coiste Bodhar",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Null Loop",
	waist="Sailfi Belt +1",
    --waist="Reiki Yotai",
    left_ear="Brutal Earring",
	--left_ear="Telos Earring",
    right_ear="Crepuscular Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10',}},
}
		
	sets.engaged.Enspell = {
    ammo="Coiste Bodhar",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Null Loop",
	waist="Sailfi Belt +1",
    --waist="Reiki Yotai",
    left_ear="Brutal Earring",
    --left_ear="Telos Earring",
    right_ear="Crepuscular Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10',}},
}
		
		
	sets.engaged.PhysicalDef = {}
	sets.engaged.MagicalDef = {}

end

-- Select default macro book on initial load or subjob change.
-- Default macro set/book
function select_default_macro_book()
    set_macro_page(1, 3)
end

function sub_job_change(new,old)
send_command('wait 6;input /lockstyleset 20')
end

send_command('wait 6;input /lockstyleset 20')

send_command('exec init.txt')

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
		{Name='Enthunder',		Buff='Enthunder',		SpellID=104,	Reapply=false},
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




-- buff_spell_lists = {
	-- Auto = {--Options for When are: Always, Engaged, Idle, OutOfCombat, Combat
		-- {Name='Refresh III',	Buff='Refresh',		SpellID=894,	When='Always'},
		-- {Name='Haste II',		Buff='Haste',		SpellID=511,	When='Always'},
		-- {Name='Aurorastorm',	Buff='Aurorastorm',	SpellID=119,	When='Idle'},
		-- {Name='Reraise',		Buff='Reraise',		SpellID=135,	When='Always'},
	-- },
	
	-- AutoMelee = {
		-- {Name='Haste II',		Buff='Haste',		SpellID=511,	When='Engaged'},
		-- {Name='Temper II',		Buff='Multi Strikes',SpellID=895,	When='Engaged'},
	-- },
	
	-- Default = {
		-- {Name='Refresh III',	Buff='Refresh',		SpellID=894,	Reapply=false},
		-- {Name='Haste II',		Buff='Haste',		SpellID=511,	Reapply=false},
		-- {Name='Stoneskin',		Buff='Stoneskin',	SpellID=54,		Reapply=false},
		-- {Name='Shell V',		Buff='Shell',		SpellID=52,		Reapply=false},
		-- {Name='Protect V',		Buff='Protect',		SpellID=47,		Reapply=false},
	-- },

	-- MageBuff = {
		-- {Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		-- {Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		-- {Name='Aquaveil',		Buff='Aquaveil',		SpellID=55,		Reapply=false},
		-- {Name='Phalanx',		Buff='Phalanx',			SpellID=106,	Reapply=false},
		-- {Name='Stoneskin',		Buff='Stoneskin',		SpellID=54,		Reapply=false},
		-- {Name='Blink',			Buff='Blink',			SpellID=53,		Reapply=false},
		-- {Name='Gain-INT',		Buff='INT Boost',		SpellID=490,	Reapply=false},
		-- {Name='Shell V',		Buff='Shell',			SpellID=52,		Reapply=false},
		-- {Name='Protect V',		Buff='Protect',			SpellID=47,		Reapply=false},
	-- },
	
	-- FullMeleeBuff = {
		-- {Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		-- {Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		-- {Name='Regen II',		Buff='Regen',			SpellID=110,	Reapply=false},
		-- {Name='Aquaveil',		Buff='Aquaveil',		SpellID=55,		Reapply=false},
		-- {Name='Phalanx',		Buff='Phalanx',			SpellID=106,	Reapply=false},
		-- {Name='Stoneskin',		Buff='Stoneskin',		SpellID=54,		Reapply=false},
		-- {Name='Blink',			Buff='Blink',			SpellID=53,		Reapply=false},
		-- {Name='Gain-STR',		Buff='STR Boost',		SpellID=486,	Reapply=false},
		-- {Name='Shell V',		Buff='Shell',			SpellID=52,		Reapply=false},
		-- {Name='Protect V',		Buff='Protect',			SpellID=47,		Reapply=false},
		-- {Name='Shock Spikes',	Buff='Shock Spikes',	SpellID=251,	Reapply=false},
		-- {Name='Enthunder',		Buff='Enthunder',		SpellID=104,	Reapply=false},
		-- {Name='Temper II',		Buff='Multi Strikes',	SpellID=895,	Reapply=false},
		-- {Name='Barfire',		Buff='Barfire',			SpellID=60,		Reapply=false},
		-- {Name='Barparalyze',	Buff='Barparalyze',		SpellID=74,		Reapply=false},
	-- },
	
	-- MeleeBuff = {
		-- {Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		-- {Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		-- {Name='Temper II',		Buff='Multi Strikes',	SpellID=895,	Reapply=false},
		-- {Name='Gain-STR',		Buff='STR Boost',		SpellID=486,	Reapply=false},
		-- {Name='Phalanx',		Buff='Phalanx',			SpellID=106,	Reapply=false},
		-- {Name='Shell V',		Buff='Shell',			SpellID=52,		Reapply=false},
		-- {Name='Protect V',		Buff='Protect',			SpellID=47,		Reapply=false},
		-- {Name='Shock Spikes',	Buff='Shock Spikes',	SpellID=251,	Reapply=false},
		-- {Name='Enthunder',		Buff='Enthunder',		SpellID=104,	Reapply=false},
		-- {Name='Barblizzard',	Buff='Barblizzard',		SpellID=61,		Reapply=false},
		-- {Name='Barparalyze',	Buff='Barparalyze',		SpellID=74,		Reapply=false},
	-- },

	-- Odin = {
		-- {Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		-- {Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		-- {Name='Phalanx',		Buff='Phalanx',			SpellID=106,	Reapply=false},
		-- {Name='Gain-INT',		Buff='INT Boost',		SpellID=490,	Reapply=false},
		-- {Name='Temper II',		Buff='Multi Strikes',	SpellID=895,	Reapply=false},
		-- {Name='Regen II',		Buff='Regen',			SpellID=110,	Reapply=false},
		-- {Name='Enaero',			Buff='Enaero',			SpellID=102,	Reapply=false},
		-- {Name='Stoneskin',		Buff='Stoneskin',		SpellID=54,		Reapply=false},
		-- {Name='Shell V',		Buff='Shell',			SpellID=52,		Reapply=false},
		-- {Name='Protect V',		Buff='Protect',			SpellID=47,		Reapply=false},
	-- },
	
	-- Tolba = {
		-- {Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		-- {Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		-- {Name='Phalanx',		Buff='Phalanx',			SpellID=106,	Reapply=false},
		-- {Name='Gain-STR',		Buff='STR Boost',		SpellID=486,	Reapply=false},
		-- {Name='Temper II',		Buff='Multi Strikes',	SpellID=895,	Reapply=false},
		-- {Name='Regen II',		Buff='Regen',			SpellID=110,	Reapply=false},
		-- {Name='Enblizzard',		Buff='Enblizzard',		SpellID=104,	Reapply=false},
		-- {Name='Stoneskin',		Buff='Stoneskin',		SpellID=54,		Reapply=false},
		-- {Name='Shell V',		Buff='Shell',			SpellID=52,		Reapply=false},
		-- {Name='Protect V',		Buff='Protect',			SpellID=47,		Reapply=false},
		-- {Name='Barwater',		Buff='Barwater',		SpellID=65,		Reapply=false},
	-- },
	
	-- HybridCleave = {
		-- {Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		-- {Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		-- {Name='Phalanx',		Buff='Phalanx',			SpellID=106,	Reapply=false},
		-- {Name='Gain-INT',		Buff='INT Boost',		SpellID=490,	Reapply=false},
		-- {Name='Enthunder II',	Buff='Enthunder II',	SpellID=316,	Reapply=false},
		-- {Name='Temper II',		Buff='Multi Strikes',	SpellID=895,	Reapply=false},
		-- {Name='Shell V',		Buff='Shell',			SpellID=52,		Reapply=false},
		-- {Name='Protect V',		Buff='Protect',			SpellID=47,		Reapply=false},
	-- }}