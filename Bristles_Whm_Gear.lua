-- Setup vars that are user-dependent.  Can override this in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal','Acc')
    state.CastingMode:options('Normal','Resistant')
    state.IdleMode:options('Normal','PDT','TPEat')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','DualWeapons','MeleeWeapons')

	gear.obi_cure_waist = "Austerity Belt +1"
	gear.obi_cure_back = "Alaunus's Cape"

	gear.obi_nuke_waist = "Sekhmet Corset"
	gear.obi_high_nuke_waist = "Yamabuki-no-Obi"
	gear.obi_nuke_back = "Toro Cape"

		-- Additional local binds
	send_command('bind ^` input /ma "Arise" <t>')
	send_command('bind !` input /ja "Penury" <me>')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind ^@!` gs c toggle AutoCaress')
	send_command('bind ^backspace input /ja "Sacrosanctity" <me>')
	send_command('bind @backspace input /ma "Aurora Storm" <me>')
	send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation.
	send_command('bind !backspace input /ja "Accession" <me>')
	send_command('bind != input /ja "Sublimation" <me>')
	send_command('bind ^delete input /ja "Dark Arts" <me>')
	send_command('bind !delete input /ja "Addendum: Black" <me>')
	send_command('bind @delete input /ja "Manifestation" <me>')
	send_command('bind ^\\\\ input /ma "Protectra V" <me>')
	send_command('bind @\\\\ input /ma "Shellra V" <me>')
	send_command('bind !\\\\ input /ma "Reraise IV" <me>')
	send_command('bind !d send @all gs c buff')
	send_command('bind !q send @brd //hordelullaby2 <bt>')
	send_command('bind !a sat alltarget')
	send_command('bind ^d send rafleshia gs c oboss')
	send_command('bind !s send @whm sacrosanctity')
	send_command('bind !f send @others gs c attackbt ')


    select_default_macro_book(1, 1)
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

	-- Weapons sets
	sets.weapons.MeleeWeapons = {main="Izcalli",sub="Ammurapi Shield"}
	sets.weapons.DualWeapons = {main="Izcalli",sub="Nehushtan"}
	
    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {
    main="Marin Staff +1",
    sub="Achaq Grip",
    ammo="Impatiens",
    head="Vanya Hood",
    body="Inyanga Jubbah +2",
    hands="",
    legs="Ayanmo Cosciales +1",
    feet="Regal Pumps +1",
    neck="",
    waist="Witful Belt",
    left_ear="Etiolation Earring",
    right_ear="Loquac. Earring",
    left_ring="Prolix Ring",
    right_ring="Kishar Ring",
    back="Swith Cape",
}
		
    sets.precast.FC.DT = {}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {head="Umuthi Hat"})

    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {
    main="Queller Rod",
    sub="Sors Shield",
    ammo="Oreiad's Tathlum",
    head="Vanya Hood",
    body="Inyanga Jubbah +2",
    hands="",
    legs="Ebers Pant. +1",
    feet="Vanya Clogs",
    neck="Orison Locket",
    waist="Witful Belt",
    left_ear="Nourish. Earring",
    right_ear="Loquacious Earring",
    left_ring="Prolix Ring",
    right_ring="Kishar Ring",
    back="Swith Cape",
})

    sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']
	
    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {
    main="Queller Rod",
    sub="Sors Shield",
    ammo="Oreiad's Tathlum",
    head="Ebers Cap +1",
    body="Inyanga Jubbah +2",
    hands="",
    legs="Ebers Pant. +1",
    feet="Vanya Clogs",
    neck="Orison Locket",
    waist="Witful Belt",
    left_ear="Nourish. Earring",
    right_ear="Loquacious Earring",
    left_ring="Prolix Ring",
    right_ring="Kishar Ring",
    back="Swith Cape",
})
	
	sets.precast.FC.Cure.DT = {}

    sets.precast.FC.Curaga = sets.precast.FC.Cure

	sets.precast.FC.CureSolace = sets.precast.FC.Cure

	sets.precast.FC.Impact =  set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})

    -- Precast sets to enhance JAs
    sets.precast.JA.Benediction = {body="Piety Briault +1"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
head="Nahtirah Hat",ear1="Roundel Earring",
body="Vanir Cotehardie",hands="Yaoyotl Gloves",
back="Refraction Cape",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}

    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {head="Nahtirah Hat",neck=gear.ElementalGorget,ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
back="Refraction Cape",waist=gear.ElementalBelt,legs="Gendewitha Spats",feet="Gendewitha Galoshes"}

    --sets.precast.WS['Flash Nova'] = {}

    --sets.precast.WS['Mystic Boon'] = {}

    -- Midcast Sets

    sets.Kiting = {feet="Herald's Gaiters"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {back="Umbra Cape"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {feet=gear.chironic_treasure_feet})
	
	--Situational sets: Gear that is equipped on certain targets
	sets.Self_Healing = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash",feet="Inspirited Boots"}

	-- Conserve Mp set for spells that don't need anything else, for set_combine.
	
	sets.ConserveMP = {
	main="Sucellus",
    sub="Genmei Shield",
    ammo="Homiliary",
    head="Befouled Crown",
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    waist="Austerity Belt",
    left_ear="Gifted Earring",
    right_ear="Calamitous Earring",
    back="Solemnity Cape",}
		
	sets.midcast.Teleport = sets.ConserveMP
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {neck="Mizu. Kubikazari",ring1="Mujin Band",ring2="Locus Ring"}
	
    sets.midcast.FastRecast = {
    main="Queller Rod",
    sub="Sors Shield",
    ammo="Oreiad's Tathlum",
    head="Ebers Cap +1",
    body="Ebers Bliaud +1",
    hands="Telchine Gloves",
    legs="Ebers Pant. +1",
    feet="Vanya Clogs",
    neck="Colossus's Torque",
    waist="Bishop's Sash",
    left_ear="Nourish. Earring",
    right_ear="Glorious Earring",
    left_ring="",
    right_ring="Ephedra Ring",
    back="Tempered Cape +1",
}
		
    -- Cure sets

	sets.midcast['Full Cure'] = sets.midcast.FastRecast
	
	sets.midcast.Cure = {
    main="Queller Rod",
    sub="Sors Shield",
    ammo="Oreiad's Tathlum",
    head="Ebers Cap +1",
    body="Ebers Bliaut +1",
    hands="Telchine Gloves",
    legs="Ebers Pant. +1",
    feet="Vanya Clogs",
	neck="Colossus's Torque",
    waist="Bishop's Sash",
    left_ear="Nourish. Earring",
    right_ear="Glorious Earring",
    left_ring="",
    right_ring="Ephedra Ring",
    back="Tempered Cape +1",
}
		
	sets.midcast.CureSolace = {
    main="Queller Rod",
    sub="Sors Shield",
    ammo="Oreiad's Tathlum",
    head="Ebers Cap +1",
    body="Ebers Bliaut +1",
    hands="Telchine Gloves",
    legs="Ebers Pant. +1",
    feet="Vanya Clogs",
	neck="Colossus's Torque",
    waist="Bishop's Sash",
    left_ear="Nourish. Earring",
    right_ear="Glorious Earring",
    left_ring="",
    right_ring="Ephedra Ring",
    back="Tempered Cape +1",
}

	sets.midcast.LightWeatherCure = set_combine(sets.midcast.Cure, {main="Chatoyant Staff",sub=empty})

	sets.midcast.LightWeatherCureSolace = set_combine(sets.midcast.CureSolace, {main="Chatoyant Staff",sub=empty})
		
	sets.midcast.LightDayCureSolace = set_combine(sets.midcast.CureSolace, {main="Chatoyant Staff",sub=empty})

	sets.midcast.LightDayCure = set_combine(sets.midcast.Cure, {main="Chatoyant Staff",sub=empty})

	sets.midcast.Curaga = {
    main="Queller Rod",
    sub="Sors Shield",
    ammo="Oreiad's Tathlum",
    head="Ebers Cap +1",
    body="Ebers Bliaut +1",
    hands="Telchine Gloves",
    legs="Ebers Pant. +1",
    feet="Vanya Clogs",
	neck="Colossus's Torque",
    waist="Bishop's Sash",
    left_ear="Nourish. Earring",
    right_ear="Glorious Earring",
    left_ring="",
    right_ring="Ephedra Ring",
    back="Tempered Cape +1",
}
		
	sets.midcast.LightWeatherCuraga = set_combine(sets.midcast.Curaga, {main="Chatoyant Staff",sub=empty})
		
	sets.midcast.LightDayCuraga = set_combine(sets.midcast.Curaga, {main="Chatoyant Staff",sub=empty})

	sets.midcast.Cure.DT = {}
		
	--Melee Curesets are used whenever your Weapons state is set to anything but None.
	sets.midcast.MeleeCure = {
    ammo="Oreiad's Tathlum",
    head="Ebers Cap +1",
    body="Ebers Bliaut +1",
    hands="Telchine Gloves",
    legs="Ebers Pant. +1",
    feet="Vanya Clogs",
	neck="Colossus's Torque",
    waist="Bishop's Sash",
    left_ear="Nourish. Earring",
    right_ear="Glorious Earring",
    left_ring="",
    right_ring="Ephedra Ring",
    back="Tempered Cape +1",
}
		
	sets.midcast.MeleeCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaud +1"})
	sets.midcast.MeleeLightWeatherCure = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightWeatherCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaud +1",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaud +1",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCure = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCuraga = set_combine(sets.midcast.MeleeCure, {})
	sets.midcast.MeleeLightWeatherCuraga = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCuraga = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})

	sets.midcast.CureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaud +1"})
	sets.midcast.LightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.LightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaud +1",waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaud +1",waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.Curaga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.LightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCure.DT = set_combine(sets.midcast.Cure.DT, {})
	
	sets.midcast.MeleeCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaud +1"})
	sets.midcast.MeleeLightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaud +1",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaud +1",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCuraga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeLightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})

	sets.midcast.Cursna = {
	main="Queller Rod",
	sub="Genmei Shield",
	head="Ebers Cap +1",
	neck="",
	body="Ebers Bliaud +1",
	hands="",
	ring1="",
	ring2="Ephedra Ring",
	back="Mending Cape", --don't have
	waist="",
	legs="Ebers Pant. +1",
	feet=""
}

	sets.midcast.StatusRemoval = {
	main="Queller Rod",
	sub="Sors Shield",
	ammo="Impatiens",
	head="Ebers Cap +1",
	neck="Colossus's Torque",
	ear1="",
	ear2="",
	body="Inyanga Jubbah +2",
	hands="Orison Mitts +1",
	ring1="",
	ring2="Ephedra Ring",
	back="Tempered Cape +1",
	waist="Bishop's Sash",
	legs="Ebers Pant. +1",
	feet="Vanya Clogs"
}

    -- 110 total Enhancing Magic Skill; caps even without Light Arts
	sets.midcast['Enhancing Magic'] = {
    main="Gada",
    sub="Ammurapi Shield",
    ammo="Oreiad's Tathlum",
    head="Befouled Crown",
    body="",
    hands="",
    legs="Piety Pantaloons +1",
    feet="Orison Duckbills +2", --Ebers Duckbills  --Orthrus's Claw	Oxblood
    neck="Colossus's Torque",
    waist="Cascade Belt",
    left_ear="",
    right_ear="",
    left_ring="",
    right_ring="",
    back="Fi Follet Cape", --+1
}

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
    main="Gada",
    sub="Ammurapi Shield",
    ammo="Oreiad's Tathlum",
    head="Befouled Crown",
    body="Inyanga Jubbah +2",
    hands="Inyan. Dastanas +2",
    legs="Inyanga Shalwar +2",
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck="Nodens Gorget",
    waist="Siegel Sash",
    left_ear="Earthcry Earring",
    right_ear="Regal Earring",
    back="Fi Follet Cape", --+1
})


	sets.midcast.Auspice = set_combine(sets.midcast['Enhancing Magic'], {feet="Ebers Duckbills"})

	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",sub="Ammurapi Shield",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})

	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {
	main="Bolelabunga",
	sub="Ammurapi Shield",
	head="Inyanga Tiara +1",
	body="Clr. Briault +1",
	hands="Orison Mitts +1",
	legs="" --Theophany Pantaloons
})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",feet="Piety Duckbills +1",ear1="Gifted Earring",waist="Sekhmet Corset"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",feet="Piety Duckbills +1",ear1="Gifted Earring",waist="Sekhmet Corset"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",legs="Piety Pantaln. +1",ear1="Gifted Earring",waist="Sekhmet Corset"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",legs="Piety Pantaln. +1",ear1="Gifted Earring",waist="Sekhmet Corset"})
	
	sets.midcast.BarElement = set_combine(sets.midcast['Enhancing Magic'], {
    main="Beneficus",
    legs="Piety Pantaloons",
})

	sets.midcast.Impact = {}
		
	sets.midcast['Elemental Magic'] = {}

	sets.midcast['Elemental Magic'].Resistant = {}

	sets.midcast['Divine Magic'] = {}
		
	sets.midcast.Holy = {main=gear.grioavolr_nuke_staff,sub="Alber Strap",ammo="Pemphredo Tathlum",
		head="Buremte Hat",neck="Baetyl Pendant",ear1="Regal Earring",ear2="Friomisi Earring",
		body="Witching Robe",hands=gear.chironic_enfeeble_hands,ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back="Toro Cape",waist=gear.ElementalObi,legs="Gyve Trousers",feet=gear.chironic_nuke_feet}

	sets.midcast['Dark Magic'] = {}

    sets.midcast.Drain = {}

    sets.midcast.Drain.Resistant = {}

    sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant

	sets.midcast.Stun = {}

	sets.midcast.Stun.Resistant = {}

	sets.midcast['Enfeebling Magic'] = {}

	sets.midcast['Enfeebling Magic'].Resistant = {}
		
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)

    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {})

    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})

	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})

	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

    -- Sets to return to when not performing an action.

    -- Resting sets
	sets.resting = set_combine(sets.idle, {
	waist="Austerity Belt",
	neck="Grandiose Chain",
})

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {
    main="Bolelabunga",
    sub="Genmei Shield",
    ammo="Homiliary",
	head="Befouled Crown",
    body="Ebers Bliaut +1",
    hands="Aya. Manopolas +1",
    feet="Aya. Gambieras +1",
    legs="Assid. Pants +1",
    neck="Loricate Torque +1",
    waist="Plat. Mog. Belt",
    left_ear="Etiolation Earring",
    right_ear="Moonshade Earring",
	left_ring="Defending Ring",
	right_ring="Dark Ring",
    back="Solemnity Cape",
}

	sets.idle.PDT = {
    main="Bolelabunga",
    sub="Genmei Shield",
    ammo="Homiliary",
	head="Befouled Crown",
    body="Ebers Bliaut +1",
    hands="Aya. Manopolas +1",
    feet="Aya. Gambieras +1",
    legs="Assid. Pants +1",
    neck="Loricate Torque +1",
    waist="Plat. Mog. Belt",
    left_ear="Etiolation Earring",
    right_ear="Moonshade Earring",
	left_ring="Defending Ring",
	right_ring="Dark Ring",
    back="Solemnity Cape",
}

    sets.idle.TPEat = set_combine(sets.idle, {neck="Chrys. Torque"})

	sets.idle.Weak = {
    main="Bolelabunga",
    sub="Genmei Shield",
    ammo="Homiliary",
	head="Befouled Crown",
    body="Ebers Bliaut +1",
    hands="Aya. Manopolas +1",
    feet="Aya. Gambieras +1",
    legs="Assid. Pants +1",
    neck="Loricate Torque +1",
    waist="Plat. Mog. Belt",
    left_ear="Etiolation Earring",
    right_ear="Moonshade Earring",
	left_ring="Defending Ring",
	right_ring="Dark Ring",
    back="Solemnity Cape",
}

    -- Defense sets

	sets.defense.PDT = {
    main="Bolelabunga",
    sub="Genmei Shield",
    ammo="Homiliary",
	head="Befouled Crown",
    body="Ebers Bliaut +1",
    hands="Aya. Manopolas +1",
    feet="Aya. Gambieras +1",
    legs="Assid. Pants +1",
    neck="Loricate Torque +1",
    waist="Plat. Mog. Belt",
    left_ear="Etiolation Earring",
    right_ear="Moonshade Earring",
	left_ring="Defending Ring",
	right_ring="Dark Ring",
    back="Solemnity Cape",
}

	sets.defense.MDT = {}

    sets.defense.MEVA = {}
		
	-- Gear for specific elemental nukes.
	sets.element.Wind = {main="Marin Staff +1"}
	sets.element.Ice = {main="Ngqoqwanb"}
	sets.element.Earth = {neck="Quanpur Necklace"}

		-- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Basic set for if no TP weapon is defined.
    sets.engaged = {}

    sets.engaged.Acc = {}

	sets.engaged.DW = {}

    sets.engaged.DW.Acc = {}

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

function user_self_command(commandArgs, eventArgs)
	if commandArgs[1] == 'buff' then
	   send_command('input //cp unpause')
       add_to_chat(158,'Resuming')
	elseif commandArgs[1] == 'rad' then
       send_command('input /echo waiting; wait 5.5; input //temps buy radialens')
       add_to_chat(158,'Radialens')
	elseif commandArgs[1] == 'bli' then
       send_command('input /ma "Blind" <bt>')
	elseif commandArgs[1] == 'ewz' then
	   send_command('input /echo waiting; wait 5.5; input //ew z')
       add_to_chat(158,'Zoning')
	elseif commandArgs[1] == 'ew1' then
	   send_command('input /echo waiting; wait 5.5; input //ew 1')
       add_to_chat(158,'Zoning')
	elseif commandArgs[1] == 'ew2' then
	   send_command('input /echo waiting; wait 5.5; input //ew 2')
       add_to_chat(158,'Zoning')
	elseif commandArgs[1] == 'ew3' then
	   send_command('input /echo waiting; wait 5.5; input //ew 3')
       add_to_chat(158,'Zoning')
	elseif commandArgs[1] == 'ew4' then
	   send_command('input /echo waiting; wait 5.5; input //ew 4')
       add_to_chat(158,'Zoning')
	elseif commandArgs[1] == 'ew5' then
	   send_command('input /echo waiting; wait 5.5; input //ew 5')
       add_to_chat(158,'Zoning')
	elseif commandArgs[1] == 'ew6' then
	   send_command('input /echo waiting; wait 5.5; input //ew 6')
       add_to_chat(158,'Zoning')
	elseif commandArgs[1] == 'ew7' then
	   send_command('input /echo waiting; wait 5.5; input //ew 7')
       add_to_chat(158,'Zoning')
	elseif commandArgs[1] == 'ew8' then
	   send_command('input /echo waiting; wait 5.5; input //ew 8')
       add_to_chat(158,'Zoning')
	elseif commandArgs[1] == 'ew9' then
	   send_command('input /echo waiting; wait 5.5; input //ew 9')
       add_to_chat(158,'Zoning')
	elseif commandArgs[1] == 'ew10' then
	   send_command('input /echo waiting; wait 5.5; input //ew 10')
       add_to_chat(158,'Zoning')
	elseif commandArgs[1] == 'ew11' then
	   send_command('input /echo waiting; wait 5.5; input //ew 11')
       add_to_chat(158,'Zoning')
	elseif commandArgs[1] == 'ew12' then
	   send_command('input /echo waiting; wait 5.5; input //ew 12')
       add_to_chat(158,'Zoning')
	elseif commandArgs[1] == 'ew13' then
	   send_command('input /echo waiting; wait 5.5; input //ew 13')
       add_to_chat(158,'Zoning')
	elseif commandArgs[1] == 'ew14' then
	   send_command('input /echo waiting; wait 5.5; input //ew 14')
       add_to_chat(158,'Zoning')
	elseif commandArgs[1] == 'ew15' then
	   send_command('input /echo waiting; wait 5.5; input //ew 15')
       add_to_chat(158,'Zoning')
	elseif commandArgs[1] == 'stop' then
       windower.ffxi.run(false)
       windower.ffxi.follow()
	   add_to_chat(158,'Chillin')
	elseif commandArgs[1] == 'food' then
       send_command('input /item "Pear Crepe" <me>')
       add_to_chat(158,'Eating')
	elseif commandArgs[1] == 'charm' then
       send_command('input /item "Charm Buffer" <me>')
       add_to_chat(158,'Charm buffer')
	elseif commandArgs[1] == 'wing1' then
       send_command('input /item "Lucid Wings I" <me>')
       add_to_chat(158,'Lucid Wings I')
	elseif commandArgs[1] == 'wing2' then
       send_command('input /item "Lucid Wings II" <me>')
       add_to_chat(158,'Lucid Wings II')
	elseif commandArgs[1] == 'wing3' then
       send_command('input /item "Daedalus wing" <me>')
       add_to_chat(158,'Daedalus wing')
	elseif commandArgs[1] == 'super' then
       send_command('input /item "Super Revitalizer" <me>')
       add_to_chat(158,'Super Revitalizer')
	elseif commandArgs[1] == 'pois' then
       send_command('input /item "Poison Buffer" <me>')
       add_to_chat(158,'Poison Buffer')
	elseif commandArgs[1] == 'doom' then
       send_command('input /item "Savior\'s Tonic" <me>')
       add_to_chat(158,'Savior tonic')
	elseif commandArgs[1] == 'amne' then
       send_command('input /item "Moneta\'s Tonic"  <me>')
       add_to_chat(158,'Monetas Tonic')
	elseif commandArgs[1] == 'petri' then
       send_command('input /item "Mirror\'s Tonic" <me>')
       add_to_chat(158,'Mirrors Tonic')
	elseif commandArgs[1] == 'pote' then
       send_command('input /item "Champion\'s Drink" <me>')
       add_to_chat(158,'Champions Drink')
	end
end

function sub_job_change(new,old)
send_command('wait 2;input /lockstyleset 20')
end

send_command('wait 2;input /lockstyleset 20')