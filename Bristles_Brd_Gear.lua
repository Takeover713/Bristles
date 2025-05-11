function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Acc')
	state.HybridMode:options('Normal','DTLite','PDT')
    state.CastingMode:options('Normal','Resistant','AoE')
    state.IdleMode:options('Normal','PDT')
	state.Weapons:options('None','DualWeapons','DualSword','Carn','Naegling','Trials')
	
	-- Adjust this if using the Terpander (new +song instrument)
    info.ExtraSongInstrument = 'Terpander'
	-- How many extra songs we can keep from Daurdabla/Terpander
    info.ExtraSongs = 2
	
	-- Set this to false if you don't want to use custom timers.
    state.UseCustomTimers = M(false, 'Use Custom Timers')
	
	-- Additional local binds
    send_command('bind ^` gs c cycle ExtraSongsMode')
	send_command('bind !` input /ma "Chocobo Mazurka" <me>')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !q gs c weapons NukeWeapons;gs c update')
	send_command('bind !d send @all gs c buff')
	send_command('bind !q send @brd //hordelullaby2 <bt>')
	send_command('bind !a sat alltarget')
	send_command('bind ^d send rafleshia gs c oboss')
	send_command('bind !s send @whm sacrosanctity')
	send_command('bind !f send @geo fullcircle ')


	select_default_macro_book(1, 6)
	
end

function init_gear_sets()

	-- Weapons sets
	sets.weapons.DualWeapons = {main="Carnwenhan",sub="Gleti's Knife"}
	sets.weapons.DualSword = {main="Naegling",sub="Gleti's Knife"}
	sets.weapons.Carn = {main="Carnwenhan",sub="Genmei Shield"}
	sets.weapons.Naegling = {main="Naegling",sub="Genmei Shield"}
	sets.weapons.Trials = {main="Fusetto",sub="Genmei Shield"}
	
	---------------
	-- Idle Sets --
	---------------
	
	--sets.idle = {    
	--main="Carnwenhan",
	--sub="Genmei Shield",
	--range="Gjallarhorn",
    --head="Fili Calot +3",
    --body="Fili Hongreline +3",
    --hands="Fili Manchettes +2",
	--legs="Fili Rhingrave +2",
    --feet="Fili Cothurnes +2",
    --neck="Loricate Torque +1",
    --waist="Plat. Mog. Belt",
    --left_ear="Etiolation Earring",
    --right_ear={ name="Fili Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','Damage taken-3%',}},
    --left_ring="Defending Ring",
    --right_ring={ name="Dark Ring", augments={'Phys. dmg. taken -5%','Magic dmg. taken -3%',}},
    --back={ name="Intarabus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+6','Occ. inc. resist. to stat. ailments+10',}},}

	sets.idle = {
    main="Sangoma",
    sub="Genmei Shield",
    range="Marsyas",
    head="Fili Calot +2",
    body="Fili Hongreline +2",
    hands="Fili Manchettes +2",
	legs="Fili Rhingrave +2",
    feet="Fili Cothurnes +2",
    neck="Loricate Torque +1",
    waist="Plat. Mog. Belt",
    left_ear="Etiolation Earring",
    right_ear="Aoidos' Earring",
	left_ring="Inyanga Ring",
    right_ring="Sheltered Ring",
    back="Intarabus's Cape",
}

	sets.idle.PDT = {    
    head="Fili Calot +2",
    body="Fili Hongreline +2",
    hands="Fili Manchettes +2",
	legs="Fili Rhingrave +2",
    feet="Fili Cothurnes +2",
    neck="Loricate Torque +1",
    waist="Plat. Mog. Belt",
    left_ear="Etiolation Earring",
    right_ear={ name="Fili Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','Damage taken-3%',}},
    left_ring="Defending Ring",
    right_ring={ name="Dark Ring", augments={'Phys. dmg. taken -5%','Magic dmg. taken -3%',}},
    back={ name="Intarabus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+6','Occ. inc. resist. to stat. ailments+10',}},
}
	
	-- Defense sets --
	sets.defense.PDT = {
    head="Fili Calot +2",
    body="Fili Hongreline +2",
    hands="Fili Manchettes +2",
	legs="Fili Rhingrave +2",
    feet="Fili Cothurnes +2",
    neck="Loricate Torque +1",
    waist="Plat. Mog. Belt",
    left_ear="Etiolation Earring",
    right_ear={ name="Fili Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','Damage taken-3%',}},
    left_ring="Defending Ring",
    right_ring={ name="Dark Ring", augments={'Phys. dmg. taken -5%','Magic dmg. taken -3%',}},
    back={ name="Intarabus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+6','Occ. inc. resist. to stat. ailments+10',}},
}

	sets.defense.MDT = {
    head="Fili Calot +2",
    body="Fili Hongreline +2",
    hands="Fili Manchettes +2",
    legs="Fili Rhingrave +2",
    feet="Fili Cothurnes +2",
    neck="Loricate Torque +1",
    waist="Plat. Mog. Belt",
    left_ear="Etiolation Earring",
    right_ear={ name="Fili Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','Damage taken-3%',}},
    left_ring="Defending Ring",
    right_ring={ name="Dark Ring", augments={'Phys. dmg. taken -5%','Magic dmg. taken -3%',}},
    back={ name="Intarabus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+6','Occ. inc. resist. to stat. ailments+10',}},
}

	-- Resting sets
	sets.resting = {	
	main="Chatoyant Staff",
	head="Goliard Chapeau",
	body="Heka's Kalasiris",
	hands="Oracle's Gloves",
	legs="Sagacity Lappas",
	feet="Avocat Pigaches",
	waist="Fucho-no-Obi",
	neck="Grandiose Chain",
	back="Invigorating Cape",
	left_ear="Moonshade Earring"
}
	
	
	------------------
	-- Precast Sets --
	------------------
	
	-- Fast cast --
	sets.precast.FC = {    
    head="Fili Calot +2",
    body="Inyanga Jubbah +2",
    hands={ name="Leyline Gloves", augments={'Accuracy+14','Mag. Acc.+13','"Mag.Atk.Bns."+13','"Fast Cast"+2',}},
    legs="Aya. Cosciales +2",
    feet="Fili Cothurnes +2",
    neck="Voltsurge Torque",
    waist="Witful Belt",
    left_ear="Loquac. Earring",
    right_ear="Etiolation Earring",
    left_ring="Prolix Ring",
    right_ring="Kishar Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
}

	sets.precast.FC.Cure = set_combine(sets.precast.FC, { })
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
	sets.precast.FC.BardSong = {	--55% + 550JP 5% = 60% + (-21% Song Spellcasting)  = 81% FC
	main={ name="Carnwenhan", augments={'Path: A',}},
    sub="Genmei Shield",
    head="Fili Calot +2",
    body="Inyanga Jubbah +2",
    hands={ name="Leyline Gloves", augments={'Accuracy+14','Mag. Acc.+13','"Mag.Atk.Bns."+13','"Fast Cast"+2',}},
    legs="Aya. Cosciales +2",
    feet="Fili Cothurnes +2",
    neck="Loricate Torque +1",
    waist="Aoidos' Belt",
    left_ear="Etiolation Earring",
    right_ear={ name="Fili Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','Damage taken-3%',}},
    left_ring="Defending Ring",
    right_ring="Kishar Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
}

	sets.precast.FC.SongDebuff = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})
	sets.precast.FC.SongDebuff.Resistant = set_combine(sets.precast.FC.BardSong,{range="Gjallarhorn"})
	sets.precast.FC['Magic Finale'] = set_combine(sets.precast.FC.BardSong,{range="Gjallarhorn"})
	sets.precast.FC['Horde Lullaby'] = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})
	sets.precast.FC['Horde Lullaby'].Resistant = set_combine(sets.precast.FC.BardSong,{range="Gjallarhorn"})
	sets.precast.FC['Horde Lullaby'].AoE = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})
	sets.precast.FC['Horde Lullaby II'] = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})
	sets.precast.FC['Horde Lullaby II'].Resistant = set_combine(sets.precast.FC.BardSong,{range="Gjallarhorn"})
	sets.precast.FC['Horde Lullaby II'].AoE = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})
	sets.precast.FC.Mazurka = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})
	sets.precast.FC['Honor March'] = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})

	sets.precast.FC.Daurdabla = set_combine(sets.precast.FC.BardSong, {range=info.ExtraSongInstrument})
	sets.precast.DaurdablaDummy = sets.precast.FC.Daurdabla
		
	
	-- Precast sets to enhance JAs
	
	sets.precast.JA.Nightingale = {feet="Bihu Slippers +3"}
	sets.precast.JA.Troubadour = {body="Bihu Jstcorps. +3"}
	sets.precast.JA['Soul Voice'] = {legs="Bihu Cannions +3"}

	------------------
	-- Midcast Sets --
	------------------

	-- General set for recast times.
	sets.midcast.FastRecast = {}

	-- For song buff duration
	sets.midcast.SongEffect = {    
	main={ name="Carnwenhan", augments={'Path: A',}},
    sub="Genmei Shield",
    range="Gjallarhorn",
    head="Fili Calot +2",
    body="Fili Hongreline +2",
    hands="Fili Manchettes +2",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +2",
    neck="Moonbow Whistle",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
}

	-- Gear to enhance certain classes of songs.  No instruments added here since Gjallarhorn is being used.
	sets.midcast.Ballad = set_combine(sets.midcast.SongEffect,{legs="Inyanga Shalwar +2",})
	sets.midcast.Madrigal = set_combine(sets.midcast.SongEffect,{head="Fili Calot +3",})
	sets.midcast.Paeon = set_combine(sets.midcast.SongEffect,{range="Terpander",})
	sets.midcast.March = set_combine(sets.midcast.SongEffect,{hands="Fili Manchettes +2",})
	sets.midcast['Honor March'] = set_combine(sets.midcast.March,{range="Marsyas", hands="Fili Manchettes +2",})
	sets.midcast.Minuet = set_combine(sets.midcast.SongEffect,{body="Fili Hongreline +3"})
	sets.midcast.Minne = set_combine(sets.midcast.SongEffect,{legs="Mousai Seraweels +1"})
	sets.midcast.Carol = set_combine(sets.midcast.SongEffect,{hands="Mousai Gages +1"})
	sets.midcast["Sentinel's Scherzo"] = set_combine(sets.midcast.SongEffect,{feet="Fili Cothurnes +2"})
	sets.midcast.Mazurka = set_combine(sets.midcast.SongEffect,{})
	sets.midcast.Etude = set_combine(sets.midcast.SongEffect,{head="Mousai Turban"})
	sets.midcast.Prelude = set_combine(sets.midcast.SongEffect,{feet="Fili Cothurnes +2"})

	-- For song defbuffs (duration primary, accuracy secondary)
	sets.midcast.SongDebuff = {    
    main={ name="Carnwenhan", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range="Gjallarhorn",
    head="Brioso Roundlet +2",
    body="Fili Hongreline +2",
    hands="Fili Manchettes +2",
    legs="Fili Rhingrave +2",
    feet="Brioso Slippers +2",
    neck="Moonbow Whistle",
    waist={ name="Acuity Belt +1", augments={'Path: A',}},
    left_ear="Regal Earring",
    right_ear={ name="Fili Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','Damage taken-3%',}},
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
}

	sets.midcast.Lullaby = {    
    main={ name="Carnwenhan", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range="Marsyas",
    head="Brioso Roundlet +2",
    body="Brioso Justau. +2",
    hands="Inyan. Dastanas +2",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +2",
    neck="Moonbow Whistle",
    waist="Harfner's Sash",
    left_ear="Musical Earring",
    right_ear="Regal Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
}
	sets.midcast['Horde Lullaby'] = {
    main={ name="Carnwenhan", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range="Terpander",
    head="Brioso Roundlet +2",
    body="Brioso Justau. +2",
    hands="Inyan. Dastanas +2",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +2",
    neck="Moonbow Whistle",
    waist="Harfner's Sash",
    left_ear="Musical Earring",
    right_ear="Regal Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
}

	sets.midcast['Horde Lullaby'].Resistant = set_combine(sets.midcast['Horde Lullaby'],{})
	sets.midcast['Horde Lullaby'].AoE = set_combine(sets.midcast['Horde Lullaby'],{})
	sets.midcast['Horde Lullaby II'] = set_combine(sets.midcast['Horde Lullaby'],{})
	sets.midcast['Horde Lullaby II'].Resistant = set_combine(sets.midcast['Horde Lullaby'],{})
	sets.midcast['Horde Lullaby II'].AoE = set_combine(sets.midcast['Horde Lullaby'],{})	
	sets.midcast['Magic Finale'] = set_combine(sets.midcast.SongEffect,{})

	-- For song defbuffs (accuracy primary, duration secondary)
	sets.midcast.SongDebuff.Resistant = set_combine(sets.midcast.SongDebuff,{})
	-- Song-specific recast reduction
	sets.midcast.SongRecast = {}
	-- Cast spell with normal gear, except using Daurdabla instead
    sets.midcast.Daurdabla = {range=info.ExtraSongInstrument}
	-- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
    sets.midcast.DaurdablaDummy = set_combine(sets.midcast.SongRecast, {range=info.ExtraSongInstrument})

	-- Other general spells --
	sets.midcast.Cure = {    
    main="Daybreak",
    sub="Ammurapi Shield",
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body="Inyanga Jubbah +2",
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs="Chironic Hose",
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck="Colossus's Torque",
    waist="Luminary Sash",
    left_ear="Calamitous Earring",
    right_ear="Magnetic Earring",
    left_ring="Lebeche Ring",
    right_ring="Stikini Ring +1",
    back="Solemnity Cape",
}
		
	sets.Self_Healing = {waist="Gishdubar Sash"}
	sets.Cure_Received = {waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
		
	sets.midcast['Enhancing Magic'] = {    
    main="Daybreak",
    sub="Ammurapi Shield",
    head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
    body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
    hands="Inyan. Dastanas +2",
    legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
    feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
    neck="Incanter's Torque",
    waist="Olympus Sash",
    left_ear="Andoaa Earring",
    right_ear="Magnetic Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
	back="Fi Follet Cape +1",
}
		
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {		--fix
    sub="Ammurapi Shield",
    head={ name="Chironic Hat", augments={'Mag. Acc.+18','CHR+5','"Treasure Hunter"+1','Accuracy+5 Attack+5',}},
    neck="Nodens Gorget",
    waist="Siegel Sash",
    left_ear="Earthcry Earring",
})
		
	sets.midcast['Elemental Magic'] = {}
	sets.midcast['Elemental Magic'].Resistant = {}
	sets.midcast.Helix = sets.midcast['Elemental Magic']
	sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic'].Fodder
		
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {		
		hands="Inyan. Dastanas +2",
		legs="Marduk's Shalwar",
		feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
		neck="Malison Medallion",
		waist="Bishop's Sash",
		left_ear="Beatific Earring",
		left_ring="Ephedra Ring",
		right_ring="Ephedra Ring",
		back="Tempered Cape +1"})
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.Cure, {})


	------------------
	-- Engaged sets --
	------------------

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	sets.engaged = {
    range={ name="Linos", augments={'Accuracy+15 Attack+15','"Store TP"+4','Quadruple Attack +3',}},
    head="Bunzi's Hat",
    body="Ayanmo Corazza +2",
    hands="Bunzi's Gloves",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Telos Earring",
    right_ear="Cessance Earring",
    left_ring="Chirich Ring +1",
    right_ring="Petrov Ring", --right_ring="Moonlight Ring",
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dual Wield"+10',}},
}

	sets.engaged.DTLite = set_combine(sets.engaged, {
	left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
	})   

	sets.engaged.Acc = set_combine(sets.engaged, {
	head="Aya. Zucchetto +2",
	ear1="Digni. Earring",
	ear2="Telos Earring",
	ring1="Ramuh Ring +1",
	ring2="Ilabrat Ring",
	legs="Aya. Cosciales +2",
	feet="Aya. Gambieras +1",
})
	
	sets.engaged.DW = {
    range={ name="Linos", augments={'Accuracy+15 Attack+15','"Store TP"+4','Quadruple Attack +3',}},
    head="Bunzi's Hat",
    body="Ayanmo Corazza +2",
    hands="Bunzi's Gloves",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Telos Earring",
    right_ear="Cessance Earring",
    left_ring="Chirich Ring +1",
    right_ring="Petrov Ring",
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dual Wield"+10',}},
}

	sets.engaged.DW.Acc = set_combine(sets.engaged.DW, {})
	
	----------------------
	-- Weaponskill sets --
	----------------------
	
	sets.precast.WS = {
    range={ name="Linos", augments={'Accuracy+15 Attack+15','Weapon skill damage +3%','CHR+8',}},
    head="Nyame Helm",
    body={ name="Bihu Jstcorps. +3", augments={'Enhances "Troubadour" effect',}},
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Bard's Charm +2",
    waist="Sailfi Belt +1",
    left_ear="Moonshade Earring",
    right_ear="Ishvara Earring",
    left_ring="Chirich Ring +1",
	right_ring="Epaminondas's Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Accuracy+20 Attack+20','CHR+10','Weapon skill damage +10%',}},
}
		
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Ishvara Earring",ear2="Telos Earring",}
	sets.AccMaxTP = {ear1="Zennaroi Earring",ear2="Telos Earring"}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	
	sets.precast.WS['Savage Blade'] = {
	range={ name="Linos", augments={'Accuracy+15 Attack+15','Weapon skill damage +3%','CHR+8',}},
    head="Nyame Helm",
    body="Bihu Jstcorps. +3",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Bard's Charm +2",
    waist="Sailfi Belt +1",
    left_ear="Regal Earring",
    right_ear="Moonshade Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Karieyh Ring +1",
    back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}, --Need 10 more STR
}

	sets.precast.WS['Mordant Rime'] = {
	range={ name="Linos", augments={'Accuracy+15 Attack+15','Weapon skill damage +3%','CHR+8',}},
    head="Nyame Helm",
    body="Bihu Jstcorps. +3",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Bard's Charm +2",
    waist="Kentarch Belt +1",
    left_ear="Regal Earring",
    right_ear="Moonshade Earring",
    left_ring="Metamorph Ring +1",
    right_ring="Ilabrat ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Accuracy+20 Attack+20','CHR+10','Weapon skill damage +10%',}},
}
	
	sets.Kiting = {feet="Fili Cothurnes +2"}
	
end

-- Select default macro book on initial load or subjob change.
	function select_default_macro_book()
		set_macro_page(1, 6)
	end

function sub_job_change(new,old)
send_command('wait 2;input /lockstyleset 18')
end

send_command('wait 2;input /lockstyleset 18')