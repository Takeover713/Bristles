function user_setup()

	-- Options: Override default values
    state.OffenseMode:options('Normal')
	state.CastingMode:options('Normal', 'Resistant', 'Fodder', 'Proc')
    state.IdleMode:options('Normal', 'PDT', 'TPEat')
	state.PhysicalDefenseMode:options('PDT', 'NukeLock', 'GeoLock', 'PetPDT')
	state.MagicalDefenseMode:options('MDT', 'NukeLock')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None')

	gear.nuke_jse_back = {name="Nantosuelta's Cape",augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10'}}
	gear.idle_jse_back = {name="Nantosuelta's Cape",augments={'HP+60','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10'}}
	
	gear.obi_cure_back = "Tempered Cape +1"
	gear.obi_cure_waist = "Witful Belt"

	gear.obi_low_nuke_back = gear.nuke_jse_back
	gear.obi_low_nuke_waist = "Sekhmet Corset"

	gear.obi_high_nuke_back = gear.nuke_jse_back
	gear.obi_high_nuke_waist = "Refoccilation Stone"
	
	autoindi = "Acumen"
	autogeo = "Malaise"
	autoentrust = "Focus"
	autoentrustee = "Thebossman"
	
	-- buff_spell_lists = {
	-- Auto = {	
		-- {Name='Haste',		Buff='Haste',		SpellID=57,		When='false'},
		-- {Name='Refresh',	Buff='Refresh',		SpellID=109,	When='false'},
	-- },
	
	-- Default = {
		-- {Name='Haste',		Buff='Haste',		SpellID=57,		Reapply=false},
		-- {Name='Refresh',	Buff='Refresh',		SpellID=109,	Reapply=false},
		-- {Name='Aquaveil',	Buff='Aquaveil',	SpellID=55,		Reapply=false},
		-- {Name='Stoneskin',	Buff='Stoneskin',	SpellID=54,		Reapply=false},
		-- {Name='Blink',		Buff='Blink',		SpellID=53,		Reapply=false},
		-- {Name='Regen',		Buff='Regen',		SpellID=108,	Reapply=false},
		-- {Name='Phalanx',	Buff='Phalanx',		SpellID=106,	Reapply=false},
	-- },
-- }
	
	-- Additional local binds
	-- send_command('bind ^` gs c cycle ElementalMode')
	-- send_command('bind !` input /ja "Full Circle" <me>')
	-- send_command('bind @f8 gs c toggle AutoNukeMode')
	-- send_command('bind @` gs c cycle MagicBurstMode')
	-- send_command('bind @f10 gs c cycle RecoverMode')
	-- send_command('bind ^backspace input /ja "Entrust" <me>')
	-- send_command('bind !backspace input /ja "Life Cycle" <me>')
	-- send_command('bind @backspace input /ma "Sleep II" <t>')
	-- send_command('bind ^delete input /ma "Aspir III" <t>')
	-- send_command('bind @delete input /ma "Sleep" <t>')
	-- send_command('bind !pause gs c toggle AutoBuffMode')

    --di_timer = 180
    indi_duration = 290
	
	select_default_macro_book(1, 5)
end

function init_gear_sets()


	sets.WakeUpWeapons = {main="Prime Maul"}
	--------------------------------------
	-- Midcast sets
	--------------------------------------

    sets.midcast.FastRecast = {    
		main="Sucellus",
		sub="Genmei Shield",
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

	sets.midcast.Geomancy = {
		main="Idris",
		sub="Genmei Shield",
		range="Dunna",
		head="Azimuth Hood +3",
		body="Bagua Tunic +1", 
		hands="Geo. Mitaines +3",
		legs="Bagua Pants +3",
		feet="Bagua Sandals +1", -- +3 Dynamis
		neck="Bagua Charm +2",
		waist="Austerity Belt",
		left_ear="Calamitous Earring",
		right_ear="Gifted Earring",
		left_ring="Warden's Ring",
		right_ring="Defending Ring",
		back={ name="Lifestream Cape", augments={'Geomancy Skill +10','Indi. eff. dur. +18','Pet: Damage taken -2%',}},
}

--GET 
	--Dynamis: Bagua Sandals +3

	--Extra Indi duration as long as you can keep your 900 skill cap.
	
	sets.midcast.Geomancy.Indi = set_combine(sets.midcast.Geomancy, {
		range="Dunna",
		legs="Bagua Pants +3",
		feet="Azimuth Gaiters +3",
		back={ name="Lifestream Cape", augments={'Geomancy Skill +10','Indi. eff. dur. +18','Pet: Damage taken -2%',}},
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
    left_ring="Stikini Ring", -- stikini +1
    right_ring="Defending Ring", -- stikini +1
    back="Tempered Cape +1",
}
		
    sets.midcast.LightWeatherCure = {}
		
		--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = sets.midcast.Cure

    sets.midcast.Curaga = sets.midcast.Cure

	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Debilis Medallion",ring1="Menelaus's Ring",ring2="Haoma's Ring"})
	
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main="Oranyan",sub="Clemency Grip"})
	
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
		right_ring="Freke Ring", --"Metamor. Ring +1" Lustreless Scales
		back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
}

    sets.midcast['Elemental Magic'].Resistant = {		
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
		right_ring="Freke Ring", --"Metamor. Ring +1" Lustreless Scales
		back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
}

	-- Gear for Magic Burst mode.
    sets.MagicBurst = {
		main="Bunzi's Rod",
		sub="Ammurapi Shield",
		ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
		head="Azimuth Hood +3",
		body="Azimuth Coat +3",
		hands="Bagua Mitaines +3",
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
		
    sets.midcast['Dark Magic'] = {main="Rubicundity",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head=gear.merlinic_nuke_head,neck="Erra Pendant",ear1="Regal Earring",ear2="Barkaro. Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Stikini Ring",ring2="Stikini Ring",
        back=gear.nuke_jse_back,waist="Yamabuki-no-Obi",legs="Merlinic Shalwar",feet=gear.merlinic_aspir_feet}
		
    sets.midcast.Drain = {main="Rubicundity",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1",neck="Erra Pendant",ear1="Regal Earring",ear2="Barkaro. Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Archon Ring",ring2="Evanescence Ring",
        back=gear.nuke_jse_back,waist="Fucho-no-obi",legs="Merlinic Shalwar",feet=gear.merlinic_aspir_feet}
    
    sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Stun = {main="Oranyan",sub="Clerisy Strap +1",ammo="Hasty Pinion +1",
		head="Amalric Coif +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Zendik Robe",hands="Volte Gloves",ring1="Kishar Ring",ring2="Stikini Ring",
		back="Lifestream Cape",waist="Witful Belt",legs="Psycloth Lappas",feet="Regal Pumps +1"}
		
	sets.midcast.Stun.Resistant = {main="Oranyan",sub="Enki Strap",ammo="Pemphredo Tathlum",
		head="Amalric Coif +1",neck="Erra Pendant",ear1="Regal Earring",ear2="Barkaro. Earring",
		body="Zendik Robe",hands="Amalric Gages +1",ring1="Stikini Ring",ring2="Stikini Ring",
		back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Merlinic Shalwar",feet=gear.merlinic_aspir_feet}

		
	sets.midcast.Impact = {main="Oranyan",sub="Enki Strap",ammo="Pemphredo Tathlum",
		head=empty,neck="Erra Pendant",ear1="Regal Earring",ear2="Barkaro. Earring",
		body="Twilight Cloak",hands="Regal Cuffs",ring1="Stikini Ring",ring2="Stikini Ring",
		back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}
		
	sets.midcast['Enfeebling Magic'] = {		
		main="Daybreak",
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head="Geo. Galero +2",
		body="Geomancy Tunic +2",
		hands="Geo. Mitaines +3",
		legs="Geomancy Pants +2",
		feet="Geo. Sandals +2",
		neck={ name="Bagua Charm +2", augments={'Path: A',}},
		waist="Eschan Stone",
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
		left_ring="Kishar Ring",
		right_ring="Stikini Ring",
		back={ name="Aurist's Cape +1", augments={'Path: A',}},
}
		
	sets.midcast['Enfeebling Magic'].Resistant = {		
		main="Daybreak",
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head="Geo. Galero +2",
		body="Geomancy Tunic +2",
		hands="Geo. Mitaines +3",
		legs="Geomancy Pants +2",
		feet="Geo. Sandals +2",
		neck={ name="Bagua Charm +2", augments={'Path: A',}},
		waist="Eschan Stone",
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
		left_ring="Kishar Ring",
		right_ring="Stikini Ring",
		back={ name="Aurist's Cape +1", augments={'Path: A',}},
}
		
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
		
	sets.midcast['Enhancing Magic'] = {main="Gada",sub="Ammurapi Shield",ammo="Hasty Pinion +1",
		head="Telchine Cap",neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Gifted Earring",
		body="Telchine Chas.",hands="Telchine Gloves",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Perimede Cape",waist="Olympus Sash",legs="Telchine Braconi",feet="Telchine Pigaches"}
		
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1"})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",sub="Genmei Shield",head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})
	
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {legs="Shedir Seraweels"})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear1="Gifted Earring",ear2="Loquacious Earring",waist="Sekhmet Corset"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear1="Gifted Earring",ear2="Loquacious Earring",waist="Sekhmet Corset"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear1="Gifted Earring",ear2="Loquacious Earring",waist="Sekhmet Corset"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear1="Gifted Earring",ear2="Loquacious Earring",waist="Sekhmet Corset"})

	-- Gear for specific elemental nukes.
	--sets.element.Wind = {main="Marin Staff +1"}
	--sets.element.Ice = {main="Ngqoqwanb"}
	--sets.element.Earth = {neck="Quanpur Necklace"}

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
		main="Idris",
		sub="Genmei Shield",
		range="Dunna",
		head="Azimuth Hood +3",
		body="Azimuth Coat +3",
		hands="Bagua Mitaines +3",
		legs="Assid. Pants +1",
		feet="Geo. Sandals +2",
		neck="Loricate Torque +1",
		waist="Witful Belt",
		left_ear="Etiolation Earring",
		right_ear="Genmei Earring",
		left_ring="Warden's Ring",
		right_ring="Defending Ring",
		back="Solemnity Cape"
}
		
	sets.idle.PDT = {		
		main="Malignance Pole",
		sub="Achaq Grip",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head="Azimuth Hood +3",
		body="Azimuth Coat +3",
		hands="Geo. Mitaines +3",
		legs="Assid. Pants +1",
		feet="Geo. Sandals +2",
		neck="Loricate Torque +1",
		left_ear="Etiolation Earring",
		right_ear="Genmei Earring",
		left_ring="Warden's Ring",
		right_ring="Defending Ring",
		waist="Isa Belt",
		back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10','Pet: Damage taken -5%',}},
}
		
	sets.idle.TPEat = set_combine(sets.idle, {neck="Chrys. Torque"})

	-- .Pet sets are for when Luopan is present.
	sets.idle.Pet = {		
		main="Idris",
		sub="Genmei Shield",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head="Azimuth Hood +3",
		body="Geomancy Tunic +2",
		hands="Geo. Mitaines +3",
		legs="Assid. Pants +1",
		feet={ name="Bagua Sandals +1", augments={'Enhances "Radial Arcana" effect',}},
		neck={ name="Bagua Charm +2", augments={'Path: A',}},
		left_ear="Etiolation Earring",
		right_ear="Moonshade Earring",
		left_ring="Warden's Ring",
		right_ring="Defending Ring",
		waist="Isa Belt",
		back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10','Pet: Damage taken -5%',}},
}

	sets.idle.PDT.Pet = {
		main="Idris",
		sub="Genmei Shield",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head="Azimuth Hood +3",
		body="Mallquis Saio +1",
		hands="Geo. Mitaines +3",
		legs="Assid. Pants +1",
		feet="Geo. Sandals +2",
		neck={ name="Bagua Charm +2", augments={'Path: A',}},
		left_ear="Etiolation Earring",
		right_ear="Genmei Earring",
		left_ring="Warden's Ring",
		right_ring="Defending Ring",
		waist="Isa Belt",
		back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10','Pet: Damage taken -5%',}},
}

	-- .Indi sets are for when an Indi-spell is active.
	sets.idle.Indi = set_combine(sets.idle, {
		main="Idris",
		sub="Genmei Shield",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head="Azimuth Hood +3",
		body="Geomancy Tunic +2",
		hands="Geo. Mitaines +3",
		legs="Assid. Pants +1",
		feet={ name="Bagua Sandals +1", augments={'Enhances "Radial Arcana" effect',}},
		neck={ name="Bagua Charm +2", augments={'Path: A',}},
		left_ear="Etiolation Earring",
		right_ear="Moonshade Earring",
		left_ring="Warden's Ring",
		right_ring="Defending Ring",
		waist="Isa Belt",
		back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10','Pet: Damage taken -5%',}},
})
		
	sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {
		main="Idris",
		sub="Genmei Shield",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head="Azimuth Hood +3",
		body="Mallquis Saio +1",
		hands="Geo. Mitaines +3",
		legs="Assid. Pants +1",
		feet={ name="Bagua Sandals +1", augments={'Enhances "Radial Arcana" effect',}},
		neck={ name="Bagua Charm +2", augments={'Path: A',}},
		left_ear="Etiolation Earring",
		right_ear="Genmei Earring",
		left_ring="Warden's Ring",
		right_ring="Defending Ring",
		waist="Isa Belt",
		back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10','Pet: Damage taken -5%',}},
})
		
	sets.idle.PDT.Indi = set_combine(sets.idle.PDT, {legs="Bagua Pants +3"}) 
	sets.idle.PDT.Pet.Indi = set_combine(sets.idle.PDT.Pet, {})

	sets.idle.Weak = { 
		main="Malignance Pole",
		sub="Achaq Grip",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head="Azimuth Hood +3",
		body="Mallquis Saio +1",
		hands="Geo. Mitaines +3",
		legs="Assid. Pants +1",
		feet="Mallquis Clogs +1",
		neck="Loricate Torque +1",
		left_ear="Etiolation Earring",
		right_ear="Genmei Earring",
		left_ring="Warden's Ring",
		right_ring="Defending Ring",
		waist="Isa Belt",
		back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10','Pet: Damage taken -5%',}},
}

	-- Defense sets
	
	sets.defense.PDT = {
		neck="Loricate Torque +1",
		ring1={ name="Dark Ring", augments={'Magic dmg. taken -4%','Phys. dmg. taken -4%',}},
		ring2="Defending Ring"
}

	sets.defense.MDT = {}
		
    sets.defense.MEVA = {}
		
	sets.defense.PetPDT = sets.idle.PDT.Pet
		
	sets.defense.NukeLock = sets.midcast['Elemental Magic']
	
	sets.defense.GeoLock = sets.midcast.Geomancy.Indi

	sets.Kiting = {feet="Geo. Sandals +2"}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	-- sets.DayIdle = {}
	-- sets.NightIdle = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.HPDown = {}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	
	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Precast sets to enhance JAs
	sets.precast.JA.Bolster = {body="Bagua Tunic +1"}
	sets.precast.JA['Life Cycle'] = {body="Geomancy Tunic +2"}
	sets.precast.JA['Radial Arcana'] = {feet="Bagua Sandals +1"}
	sets.precast.JA['Mending Halation'] = {legs="Bagua Pants +3"}
	sets.precast.JA['Full Circle'] = {head="Azimuth Hood +3",hands="Bagua Mitaines +3"}
	
	-- Indi Duration in slots that would normally have skill here to make entrust more efficient.
	sets.buff.Entrust = {}
	
	-- Fast cast sets for spells

	sets.precast.FC = { --68% 
		main="Sucellus",
		sub="Genmei Shield",
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
		hands="Bagua Mitaines +3",
})

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})
		
	sets.precast.FC.Curaga = sets.precast.FC.Cure
	
	sets.Self_Healing = {
	main="Daybreak",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    hands={ name="Vanya Cuffs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck="Incanter's Torque",
    waist="Luminary Sash",
    left_ear="Mendi. Earring",
    right_ear="Meili Earring",
    left_ring="Stikini Ring", -- stikini +1
    right_ring="Defending Ring", -- stikini +1
    back="Tempered Cape +1",}
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
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Karieyh Ring +1",
    right_ring="Chirich Ring +1",
    back="Solemnity Cape",
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
    head="Nyame Helm",
    body="Nyame Mail",
    hands={ name="Gazu Bracelets +1", augments={'Path: A',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Null Loop",
    waist="Null Belt",
    left_ear="Crep. Earring",
    right_ear="Brutal Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back="Null Shawl",
	}
	
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
    head="Nyame Helm",
    body="Nyame Mail",
    hands={ name="Gazu Bracelets +1", augments={'Path: A',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Null Loop",
    waist="Null Belt",
    left_ear="Crep. Earring",
    right_ear="Brutal Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back="Null Shawl",
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

	-- Weapons sets
	--sets.weapons.Nehushtan = {main='Nehushtan',sub='Genmei Shield'}
	--sets.weapons.DualWeapons = {main='Nehushtan',sub='Nehushtan'}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 5)
end

function sub_job_change(new,old)
send_command('wait 8;input /lockstyleset 20')
end

send_command('wait 8;input /lockstyleset 20')

send_command('exec init.txt')