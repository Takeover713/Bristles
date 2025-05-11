-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal')
    state.CastingMode:options('Normal','Resistant','Proc','OccultAcumen')
    state.IdleMode:options('Normal', 'PDT', 'TPEat')
	state.HybridMode:options('Normal','PDT')
	state.Weapons:options('None','Akademos','Khatvanga')

	gear.nuke_jse_back = {name="Lugh's Cape",augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10'}}
	
	gear.obi_cure_back = "Tempered Cape +1"
	gear.obi_cure_waist = "Witful Belt"

	gear.obi_low_nuke_waist = "Refoccilation Stone"
	gear.obi_high_nuke_waist = "Refoccilation Stone"
	
		-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind !` gs c scholar power')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind ^q gs c weapons Khatvanga;gs c set CastingMode OccultAcumen')
	send_command('bind !q gs c weapons default;gs c reset CastingMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation and Myrkr.
	send_command('bind @^` input /ja "Parsimony" <me>')
	send_command('bind ^backspace input /ma "Stun" <t>')
	send_command('bind !backspace gs c scholar speed')
	send_command('bind @backspace gs c scholar aoe')
	send_command('bind ^= input /ja "Dark Arts" <me>')
	send_command('bind != input /ja "Light Arts" <me>')
	send_command('bind ^\\\\ input /ma "Protect V" <t>')
	send_command('bind @\\\\ input /ma "Shell V" <t>')
	send_command('bind !\\\\ input /ma "Reraise III" <me>')
	
    select_default_macro_book(1, 8)
end

-- Define sets and vars used by this job file.
function init_gear_sets()

    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Precast sets to enhance JAs

    sets.precast.JA['Tabula Rasa'] = {legs="Peda. Pants +1"}
	sets.precast.JA['Enlightenment'] = {} --body="Peda. Gown +1"

    -- Fast cast sets for spells

    sets.precast.FC = {
    head={ name="Merlinic Hood", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','Magic dmg. taken -2%','INT+10','Mag. Acc.+14','"Mag.Atk.Bns."+9',}},
    body={ name="Merlinic Jubbah", augments={'"Mag.Atk.Bns."+23','Magic burst dmg.+10%','MND+8',}},
    legs={ name="Lengo Pants", augments={'INT+7','Mag. Acc.+7','"Mag.Atk.Bns."+3','"Refresh"+1',}},
    feet="Regal Pumps +1",
    waist="Witful Belt",
    left_ear="Loquac. Earring",
    right_ear="Etiolation Earring",
    left_ring="Prolix Ring",
    right_ring="Kishar Ring",
    back="Perimede Cape",
}
		
	sets.precast.FC.Arts = {}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
		waist="Siegel Sash",
		head="Umuthi Hat"})

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {
		neck="Stoicheion Medal",
		ear1="Barkaro. Earring",
		body="Mallquis Saio +1",
		hands="Mallquis Cuffs +1",
		legs="Mallquis Trews +1",
		feet="Mallquis Clogs +1",
})

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {
	main="Serenity",
	sub="Clerisy Strap +1",
	body="Heka's Kalasiris",
	feet="Vanya Clogs",
})

    sets.precast.FC.Curaga = sets.precast.FC.Cure

    sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {
	body="Twilight Cloak"
})

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS['Myrkr'] = {
		ammo="Ghastly Tathlum +1",
	    head="Merlinic Hood",
		neck="Morgana's Choker",
		ear1="Gifted Earring",
		ear2="Etiolation Earring",
		body="Merlinic Jubbah",
		hands="Zenith Mitts",
		ring1="Mephitas's Ring +1",
		ring2="Mephitas's Ring",
		back="Altruistic Cape",
		waist="Refoccilation Stone",
		legs="Merlinic Shalwar",
		feet="Merlinic Crackows",
}

    -- Midcast Sets

	sets.TreasureHunter = set_combine(sets.TreasureHunter, {feet=gear.chironic_treasure_feet})
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Seidr Cotehardie"}
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {main="Akademos",neck="Mizu. Kubikazari",hands="Amalric Gages +1",ring1="Mujin Band",ring2="Locus Ring",feet="Jhakri Pigaches +2"}
	
	-- Gear for specific elemental nukes.
	sets.element.Wind = {main="Marin Staff +1"}
	sets.element.Ice = {main="Ngqoqwanb"}
	sets.element.Earth = {neck="Quanpur Necklace"}
	sets.element.Dark = {head="Pixie Hairpin +1",ring2="Archon Ring"}

    sets.midcast.FastRecast = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Hasty Pinion +1",
		head="Amalric Coif +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Zendik Robe",hands="Gende. Gages +1",ring1="Kishar Ring",ring2="Prolix Ring",
		back="Swith Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Regal Pumps +1"}
		
    sets.midcast.Cure = {
		head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
		body="Heka's Kalasiris",
		hands="Telchine Gloves",
		legs={ name="Lengo Pants", augments={'INT+7','Mag. Acc.+7','"Mag.Atk.Bns."+3','"Refresh"+1',}},
		feet="Telchine Pigaches",
		neck="Nodens Gorget",
		waist="Cascade Belt",
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring="Ephedra Ring",
		right_ring="Sirona's Ring",
		back="Tempered Cape +1",
}

    sets.midcast.LightWeatherCure = {main="Chatoyant Staff",sub="Curatio Grip",ammo="Hasty Pinion +1",
        head="Gende. Caubeen +1",neck="Incanter's Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
        body="Kaykaus Bliaut",hands="Kaykaus Cuffs",ring1="Janniston Ring",ring2="Lebeche Ring",
        back="Twilight Cape",waist="Hachirin-no-Obi",legs="Chironic Hose",feet="Kaykaus Boots"}
		
    sets.midcast.LightDayCure = {main="Serenity",sub="Curatio Grip",ammo="Hasty Pinion +1",
        head="Gende. Caubeen +1",neck="Incanter's Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
        body="Kaykaus Bliaut",hands="Kaykaus Cuffs",ring1="Janniston Ring",ring2="Lebeche Ring",
        back="Twilight Cape",waist="Hachirin-no-Obi",legs="Chironic Hose",feet="Kaykaus Boots"}

    sets.midcast.Curaga = sets.midcast.Cure

	sets.Self_Healing = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash",feet="Inspirited Boots"}
	
	sets.midcast.Cursna = {
		--neck="Incanter's Torque",
		--body="Vanya Robe",
		--hands="Pedagogy Bracers +1",
		ring1="Stikini Ring",
		ring2="Ephedra Ring",
		back="Tempered Cape +1",
		waist="Bishop's Sash",
		--legs="Academic's Pants +1",
		feet="Vanya Clogs"}
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main="Oranyan",sub="Clemency Grip"})

	sets.midcast['Enhancing Magic'] =  {
		--main="Gada", --Enhancing Magic Duration	+1~5 Fern Stone
		ammo="Savant's Treatise", --in slip 08
		head="Telchine Cap", --Bri needs (Alluvion skirmish - augment)
		body="Pedagogy Gown +3", --upgrade argute gown
		hands="Augur's Gloves", --Chloris Abyss-Throngi
		legs="Telchine Braconi",
		feet="Rubeus Boots",
		ear1="Andoaa Earring",
		neck="Incanter's Torque",
		waist="Cascade Belt",}

    sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {back=gear.nuke_jse_back})

    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1"})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",sub="Genmei Shield",head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})
	
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {legs="Shedir Seraweels"})

    sets.midcast.Storm = set_combine(sets.midcast['Enhancing Magic'], {feet="Peda. Loafers +1"})

    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Protectra = sets.midcast.Protect

    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Shellra = sets.midcast.Shell


    -- Custom spell classes

	sets.midcast['Enfeebling Magic'] = {
		ammo="Pemphredo Tathlum",
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Enfeebling Torque",
		left_ear="Barkaro. Earring",
		right_ear="Regal Earring",
		left_ring="Freke Ring",
		right_ring="Kishar Ring",
		back="Lugh's Cape",
}
	
	sets.midcast['Enfeebling Magic'].Resistant = {
		ammo="Pemphredo Tathlum",
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Enfeebling Torque",
		left_ear="Barkaro. Earring",
		right_ear="Regal Earring",
		left_ring="Freke Ring",
		right_ring="Kishar Ring",
		back="Lugh's Cape",
}
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'],{
		sub="Willpower Grip",
		ammo="Pemphredo Tathlum",
	    head="Jhakri Coronal +1",
		neck="Incanter's Torque",
		ear1="Friomisi Earring",
		ear2="Barkaro. Earring",
		body="Merlinic Jubbah",
		hands="Amalric Gages",
		ring1="",
		ring2="Strendu Ring",
		back="Lugh's Cape",
		waist="",
		legs="Merlinic Shalwar",
		feet="Merlinic Crackows",
})
		
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {
		sub="Willpower Grip",
		ammo="Pemphredo Tathlum",
	    head="Jhakri Coronal +1",
		neck="Incanter's Torque",
		ear1="Friomisi Earring",
		ear2="Barkaro. Earring",
		body="Merlinic Jubbah",
		hands="Amalric Gages",
		ring1="",
		ring2="Strendu Ring",
		back="Lugh's Cape",
		waist="",
		legs="Merlinic Shalwar",
		feet="Merlinic Crackows",
})
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {
		head="Amalric Coif +1",
		ear1="Barkaro. Earring",
		back=gear.nuke_jse_back,
		waist="Acuity Belt +1"})
		
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {
		head="Amalric Coif +1",
		ear2="Barkaro. Earring",
		back=gear.nuke_jse_back,
		waist="Acuity Belt +1"})

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {
		ammo="Pemphredo Tathlum",
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Enfeebling Torque",
		waist="Cascade Belt",
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring="Kishar Ring",
		right_ring="Strendu Ring",
		back="Lugh's Cape",
})

	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {
		ammo="Pemphredo Tathlum",
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Enfeebling Torque",
		waist="Cascade Belt",
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring="Kishar Ring",
		right_ring="Strendu Ring",
		back="Lugh's Cape",
})
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {ring1="Stikini Ring",feet=gear.chironic_nuke_feet})

    sets.midcast['Dark Magic'] = {
    ammo="Hydrocera",
    head="Nyame Helm",
    body="Psycloth Vest",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard", --Relic legs required. Argute
    feet={ name="Medium's Sabots", augments={'MP+30','MND+8','"Cure" potency +2%',}},
    waist="Witful Belt",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Tamas Ring",
    right_ring="Evanescence Ring",
    back="Bookworm's Cape",
}

    sets.midcast.Kaustra = {main="Akademos",sub="Niobid Strap",ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1",neck="Saevus Pendant +1",ear1="Crematio Earring",ear2="Barkaro. Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Archon Ring",
        back=gear.nuke_jse_back,waist="Refoccilation Stone",legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}
		
    sets.midcast.Kaustra.Resistant = {main=gear.grioavolr_nuke_staff,sub="Niobid Strap",ammo="Pemphredo Tathlum",
        head=gear.merlinic_nuke_head,neck="Erra Pendant",ear1="Crematio Earring",ear2="Barkaro. Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
        back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}

    sets.midcast.Drain = {
		ammo="Incantor Stone",
		head="Pixie Hairpin +1",
		ear1="Hirudinea Earring",
		ear2="Loquacious Earring",
		hands="Amalric Gages",
		waist="Fucho-no-obi",
}
		
    sets.midcast.Drain.Resistant = {main="Rubicundity",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head="Amalric Coif +1",neck="Erra Pendant",ear1="Regal Earring",ear2="Barkaro. Earring",
        body="Chironic Doublet",hands=gear.chironic_enfeeble_hands,ring1="Stikini Ring",ring2="Stikini Ring",
        back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Chironic Hose",feet=gear.merlinic_aspir_feet}

    sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant

    sets.midcast.Stun = {
		ammo="Pemphredo Tathlum",
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Dark Torque",
		waist="Eschan Stone",
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring="Freke Ring",
		right_ring="Evanescence Ring",
		back="Lugh's Cape",
}

    sets.midcast.Stun.Resistant = {
		ammo="Incantor Stone",
		head="Pedagogy Mortarboard +1",
		neck="Orunmila's Torque",
		ear1="Enchanter Earring +1",
		ear2="Loquac. Earring",
		body="Merlinic Jubbah",
		hands="Gendewitha Gages +1",
		ring1="Weatherspoon Ring",
		ring2="Prolix Ring",
		back="Perimede Cape +1",
		waist="Ninurta's Sash",
		legs="Psycloth Lappas",
		feet="Academic's Loafers +1"
}

    -- Elemental Magic sets are default for handling low-tier nukes.
    sets.midcast['Elemental Magic'] = {
		main={ name="Akademos", augments={'INT+15','"Mag.Atk.Bns."+15','Mag. Acc.+15',}},
		sub="Enki Strap",
		ammo="Pemphredo Tathlum",
		head={ name="Merlinic Hood", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','Magic dmg. taken -2%','INT+10','Mag. Acc.+14','"Mag.Atk.Bns."+9',}},
		body={ name="Amalric Doublet", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
		hands="Jhakri Cuffs +1",
		legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+14 "Mag.Atk.Bns."+14','"Occult Acumen"+4','INT+3','Mag. Acc.+14','"Mag.Atk.Bns."+13',}},
		feet="Jhakri Pigaches +1",
		neck="Saevus Pendant +1",
		waist="Eschan Stone",
		left_ear="Friomisi Earring",
		right_ear="Malignance Earring",
		left_ring="Freke Ring",
		right_ring="Vertigo Ring",
		back="Lugh's Cape",
}

    sets.midcast['Elemental Magic'].Resistant = {
		main={ name="Akademos", augments={'INT+15','"Mag.Atk.Bns."+15','Mag. Acc.+15',}},
		sub="Enki Strap",
		ammo="Pemphredo Tathlum",
		head={ name="Merlinic Hood", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','Magic dmg. taken -2%','INT+10','Mag. Acc.+14','"Mag.Atk.Bns."+9',}},
		body={ name="Amalric Doublet", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
		hands="Jhakri Cuffs +1",
		legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+14 "Mag.Atk.Bns."+14','"Occult Acumen"+4','INT+3','Mag. Acc.+14','"Mag.Atk.Bns."+13',}},
		feet="Jhakri Pigaches +1",
		neck="Saevus Pendant +1",
		waist="Eschan Stone",
		left_ear="Friomisi Earring",
		right_ear="Malignance Earring",
		left_ring="Freke Ring",
		right_ring="Vertigo Ring",
		back="Lugh's Cape",
}
		
    sets.midcast['Elemental Magic'].Fodder = {
		main={ name="Akademos", augments={'INT+15','"Mag.Atk.Bns."+15','Mag. Acc.+15',}},
		sub="Enki Strap",
		ammo="Pemphredo Tathlum",
		head={ name="Merlinic Hood", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','Magic dmg. taken -2%','INT+10','Mag. Acc.+14','"Mag.Atk.Bns."+9',}},
		body={ name="Amalric Doublet", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
		hands="Jhakri Cuffs +1",
		legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+14 "Mag.Atk.Bns."+14','"Occult Acumen"+4','INT+3','Mag. Acc.+14','"Mag.Atk.Bns."+13',}},
		feet="Jhakri Pigaches +1",
		neck="Saevus Pendant +1",
		waist="Eschan Stone",
		left_ear="Friomisi Earring",
		right_ear="Malignance Earring",
		left_ring="Freke Ring",
		right_ring="Vertigo Ring",
		back="Lugh's Cape",
}
	
    sets.midcast['Elemental Magic'].Proc = {
		ammo="Pemphredo Tathlum",
		head={ name="Merlinic Hood", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','Magic dmg. taken -2%','INT+10','Mag. Acc.+14','"Mag.Atk.Bns."+9',}},
		body={ name="Amalric Doublet", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
		hands="Jhakri Cuffs +1",
		legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+14 "Mag.Atk.Bns."+14','"Occult Acumen"+4','INT+3','Mag. Acc.+14','"Mag.Atk.Bns."+13',}},
		feet="Jhakri Pigaches +1",
		neck="Saevus Pendant +1",
		waist="Eschan Stone",
		left_ear="Friomisi Earring",
		right_ear="Malignance Earring",
		left_ring="Freke Ring",
		right_ring="Vertigo Ring",
		back="Lugh's Cape",
}
		
    sets.midcast['Elemental Magic'].OccultAcumen = {main="Khatvanga",sub="Bloodrain Strap",ammo="Seraphic Ampulla",
        head="Mall. Chapeau +2",neck="Combatant's Torque",ear1="Dedition Earring",ear2="Telos Earring",
        body=gear.merlinic_occult_body,hands=gear.merlinic_occult_hands,ring1="Rajas Ring",ring2="Petrov Ring",
        back=gear.nuke_jse_back,waist="Oneiros Rope",legs="Perdition Slops",feet=gear.merlinic_occult_feet}
		
    -- Custom refinements for certain nuke tiers
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {main="Akademos",sub="Niobid Strap",ammo="Pemphredo Tathlum",ear1="Regal Earring",ear2="Barkaro. Earring",hands="Amalric Gages +1"})
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {main=gear.grioavolr_nuke_staff,sub="Niobid Strap",ammo="Pemphredo Tathlum",ear1="Regal Earring",ear2="Barkaro. Earring",hands="Amalric Gages +1"})
	sets.midcast['Elemental Magic'].HighTierNuke.Fodder = set_combine(sets.midcast['Elemental Magic'].Fodder, {sub="Alber Strap",ammo="Pemphredo Tathlum",ear1="Regal Earring",ear2="Barkaro. Earring",hands="Amalric Gages +1"})

	sets.midcast.Helix = set_combine(sets.midcast['Elemental Magic'], {
		neck="Sanctity Necklace",
		back="Bookworm's Cape",
})
	
	sets.midcast.Helix.Resistant = {
		main=gear.grioavolr_nuke_staff,
		sub="Niobid Strap",
		ammo="Pemphredo Tathlum",
		head=gear.merlinic_nuke_head,
		neck="Sanctity Necklace",
		ear1="Barkaro. Earring",
		ear2="Friomisi Earring",
        body=gear.merlinic_nuke_body
		,hands="Amalric Gages +1",
		ring1="Shiva Ring +1",
		ring2="Shiva Ring +1",
        back=gear.nuke_jse_back,
		waist="Acuity Belt +1",
		legs="Merlinic Shalwar",
		feet=gear.merlinic_nuke_feet}
		
	sets.midcast.Helix.Proc = {main=empty, sub=empty,ammo="Impatiens",
        head="Nahtirah Hat",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
        body="Helios Jacket",hands="Gende. Gages +1",ring1="Kishar Ring",ring2="Prolix Ring",
        back="Swith Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Regal Pumps +1"}

	sets.midcast.Impact = {
		sub="Mephitis Grip",
		ammo="Hydrocera",
		head=empty,
		neck="Sanctity Necklace",
		ear1="Barkarole Earring",
		ear2="Gwati Earring",
		body="Twilight Cloak",
		hands=chiro_hands_MAB,
		ring1="Weatherspoon Ring",
		ring2="Sangoma Ring",
		back="Refraction Cape",
		waist="Luminary Sash",
		legs="Chironic Hose",
		feet="Medium's Sabots"
}
		
    sets.midcast.Impact.OccultAcumen = set_combine(sets.midcast['Elemental Magic'].OccultAcumen, {head=empty,body="Twilight Cloak"})
		
    -- Sets to return to when not performing an action.

     -- Resting sets
    sets.resting = {
		main="Chatoyant	Staff",
		ammo="Pemphredo Tathlum",
		head="Befouled Crown",
		body="Errant Hpl.",
		hands="Serpentes Cuffs",
		legs="Assid. Pants +1",
		feet="Serpentes Sabots",
		neck="Grandiose Chain",
		waist="Austerity Belt",
		left_ear="Etiolation Earring",
		right_ear="Moonshade Earring",
		left_ring="Sheltered Ring",
}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle = {
		main="Malignance Pole",
		sub="Giuoco Grip",
		ammo="Oreiad's Tathlum",
		head="Befouled Crown",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Assid. Pants +1",
		feet="Nyame Sollerets",
		neck="Loricate Torque +1",
		waist="Witful Belt",
		left_ear="Etiolation Earring",
		right_ear={ name="Moonshade Earring", augments={'MP+25','Latent effect: "Refresh"+1',}},
		left_ring={ name="Dark Ring", augments={'Magic dmg. taken -4%','Phys. dmg. taken -4%',}},
		right_ring="Renaye Ring",
		back="Solemnity Cape",
}

    sets.idle.PDT = {
		main="Malignance Pole",
		sub="Mensch Strap",
		ammo="Staunch Tathlum",
		head="Befouled Crown",
		body={ name="Merlinic Jubbah", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','Magic burst dmg.+10%','CHR+6','Mag. Acc.+13','"Mag.Atk.Bns."+13',}},
		hands="Serpentes Cuffs",
		legs="Assid. Pants +1",
		feet="Serpentes Sabots",
		neck="Loricate Torque +1",
		waist="Plat. Mog. Belt",
		left_ear="Regal Earring",
		right_ear="Barkaro. Earring",
		left_ring="Defending Ring",
		right_ring="Vocane Ring",
		back="Solemnity Cape",
}	
		
	sets.idle.Hippo = set_combine(sets.idle.PDT, {feet="Hippo. Socks +1"})

    sets.idle.Weak = {
		main="Malignance Pole",
		sub="Mensch Strap",
		ammo="Staunch Tathlum",
		head="Befouled Crown",
		body={ name="Merlinic Jubbah", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','Magic burst dmg.+10%','CHR+6','Mag. Acc.+13','"Mag.Atk.Bns."+13',}},
		hands="Serpentes Cuffs",
		legs="Assid. Pants +1",
		feet="Serpentes Sabots",
		neck="Loricate Torque +1",
		waist="Plat. Mog. Belt",
		left_ear="Regal Earring",
		right_ear="Barkaro. Earring",
		left_ring="Defending Ring",
		right_ring="Vocane Ring",
		back="Solemnity Cape",
}
		
    sets.idle.TPEat = set_combine(sets.idle, {neck="Chrys. Torque"})

    -- Defense sets

    sets.defense.PDT = {
		sub="Willpower Grip",
		ammo="Pemphredo Tathlum",
		Head="Befouled Crown",
		neck="Loricate Torque +1",
		ear1="Friomisi Earring",
		ear2="Novio Earring",
		body="Jhakri Robe +1",
		hands="Arbatel Bracers +1",
		ring1="Defending Ring",
		ring2="Vocane Ring",
		back="Lugh's Cape",
		waist=gear.ElementalObi,
		legs="Assiduity Pants +1",
		feet="Merlinic Crackows",
}

    sets.defense.MDT = {
		sub="Willpower Grip",
		ammo="Pemphredo Tathlum",
		Head="Befouled Crown",
		neck="Loricate Torque +1",
		ear1="Friomisi Earring",
		ear2="Novio Earring",
		body="Jhakri Robe +1",
		hands="Arbatel Bracers +1",
		ring1="Defending Ring",
		ring2="Vocane Ring",
		back="Lugh's Cape",
		waist=gear.ElementalObi,
		legs="Assiduity Pants +1",
		feet="Merlinic Crackows",
}
		
    sets.defense.MEVA = {main="Oranyan",sub="Umbra Strap",ammo="Staunch Tathlum",
        head=gear.merlinic_nuke_head,neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
        body=gear.merlinic_nuke_body,hands="Gende. Gages +1",ring1="Vengeful Ring",ring2="Purity Ring",
        back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}
		
    sets.Kiting = {feet="Herald's Gaiters"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {
		head="Befouled Crown",
		neck="Loricate Torque +1",
		ear1="Etiolation Earring",
		ear2="Ethereal Earring",
        body="Jhakri Robe +2",
		hands=gear.merlinic_refresh_hands,
		ring1="Defending Ring",
		ring2="Sheltered Ring",
        back="Umbra Cape",
		waist="Flax Sash",
		legs="Assid. Pants +1",
		feet=gear.chironic_refresh_feet,
}
		
	sets.engaged.PDT = {
		main="Malignance Pole",
		sub="Oneiros Grip",
		ammo="Staunch Tathlum +1",
        head="Gende. Caubeen +1",
		neck="Loricate Torque +1",
		ear1="Etiolation Earring",
		ear2="Ethereal Earring",
        body="Vrikodara Jupon",
		hands="Gende. Gages +1",
		ring1="Defending Ring",
		ring2="Dark Ring",
        back="Umbra Cape",
		waist="Flax Sash",
		legs="Hagondes Pants +1",
		feet=gear.chironic_refresh_feet,
}

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Ebullience'] = {head="Arbatel Bonnet +1"}
    sets.buff['Rapture'] = {head="Arbatel Bonnet +1"}
    sets.buff['Perpetuance'] = {hands="Arbatel Bracers +1"}
    sets.buff['Immanence'] = {hands="Arbatel Bracers +1"}
    sets.buff['Penury'] = {legs="Arbatel Pants +1"}
    sets.buff['Parsimony'] = {legs="Arbatel Pants +1"}
    sets.buff['Celerity'] = {feet="Peda. Loafers +1"}
    sets.buff['Alacrity'] = {feet="Peda. Loafers +1"}
    sets.buff['Klimaform'] = {feet="Arbatel Loafers +1"}
	
	sets.HPDown = {head="Pixie Hairpin +1",ear1="Mendicant's Earring",ear2="Evans Earring",
		body="Zendik Robe",hands="Hieros Mittens",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back="Swith Cape +1",waist="Flax Sash",legs="Shedir Seraweels",feet=""}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff['Light Arts'] = {} --legs="Academic's Pants +3"
	sets.buff['Dark Arts'] = {} --body="Academic's Gown +3"

    sets.buff.FullSublimation = {}
    sets.buff.PDTSublimation = {}
	
	-- Weapons sets
	sets.weapons.Akademos = {main="Akademos",sub="Niobid Strap"}
	sets.weapons.Khatvanga = {main="Khatvanga",sub="Bloodrain Strap"}
end

-- Select default macro book on initial load or subjob change.
-- Default macro set/book
function select_default_macro_book()
    set_macro_page(1, 8)
end

function sub_job_change(new,old)
send_command('wait 2;input /lockstyleset 20')
end