-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal','Acc')
    state.WeaponskillMode:options('Match','Normal','Acc')
    state.HybridMode:options('Normal','DTLite')
    state.PhysicalDefenseMode:options('PDT')
    state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal', 'PDT')
	state.Weapons:options('GaeBuide','Trishula','Naegling','Club')
	state.Passive = M{['description'] = 'Passive Mode','None','MP','Twilight'}

	autows_list = {['GaeBuide']='Diarmuid',['Trishula']='Stardiver',['Naegling']='Savage Blade',['Club']='Judgment'}

		--autows = 'Stardiver'
		autowstp = 1250
	
	-- Weapons sets
	sets.weapons.GaeBuide = {main="Gae Buide",sub="Utu Grip"}
	sets.weapons.Trishula = {main="Trishula",sub="Utu Grip"}
	sets.weapons.Naegling = {main="Naegling",sub="Regis"}
	sets.weapons.Club = {main="Mafic Cudgel",sub="Regis"}

	-- Additional local binds
	send_command('bind ^` input /ja "Hasso" <me>')
	send_command('bind !` input /ja "Seigan" <me>')
	send_command('bind ^f11 gs c cycle MagicalDefenseMode')
	send_command('bind @f7 gs c toggle AutoJumpMode')
	send_command('bind @` gs c cycle SkillchainMode')

    select_default_macro_book(1, 16)
end

function init_gear_sets()
	
	---------------
	-- Idle sets --
	---------------
	
	sets.idle = {
		ammo="Staunch Tathlum +1",
		head="Peltast's Mezail +3",
		body="Nyame Mail",
		hands="Gleti's Gauntlets",
		legs="Gleti's Breeches",
		feet="Gleti's Boots",
		neck="Loricate Torque +1",
		waist="Plat. Mog. Belt",
		left_ear="Eabani Earring",
		right_ear="Etiolation Earring",
		left_ring="Defending Ring",
		right_ring="Murky Ring",
		back="Solemnity Cape",
}
		
	sets.idle.Refresh = {}
	sets.idle.Weak = set_combine(sets.idle, {})
	sets.idle.Reraise = set_combine(sets.idle, {})
	
	-- Defense sets --
	sets.defense.PDT = {
		ammo="Crepuscular Pebble",
		head={ name="Nyame Helm", augments={'Path: B',}},
		body="Nyame Mail",
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck="Loricate Torque +1",
		waist="Plat. Mog. Belt",
		left_ear="Genmei Earring",
		right_ear="Etiolation Earring",
		left_ring="Defending Ring",
		right_ring={ name="Dark Ring", augments={'Magic dmg. taken -4%','Phys. dmg. taken -4%',}},
		back="Solemnity Cape",
}
		
	sets.defense.PDTReraise = set_combine(sets.defense.PDT, {})

	sets.defense.MDT = {
		ammo="Crepuscular Pebble",
		head={ name="Nyame Helm", augments={'Path: B',}},
		body="Nyame Mail",
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck="Loricate Torque +1",
		waist="Plat. Mog. Belt",
		left_ear="Genmei Earring",
		right_ear="Etiolation Earring",
		left_ring="Defending Ring",
		right_ring={ name="Dark Ring", augments={'Magic dmg. taken -4%','Phys. dmg. taken -4%',}},
		back="Solemnity Cape",
}
		
	sets.defense.MDTReraise = set_combine(sets.defense.MDT, {})
	sets.defense.MEVA = {}
	sets.Kiting = {legs="Carmine Cuisses +1"}
	--sets.Reraise = {head="Twilight Helm",body="Twilight Mail"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	--sets.buff.Sleep = {head="Frenzy Sallet"}
	
	------------------
	-- Precast Sets --
	------------------
	
	sets.precast.JA.Jump = {
	    ammo="Ginsen", -- Aurgelmir orb
		head="Flam. Zucchetto +2",
		body="Vishap Mail +3",
		hands="Vis. Fng. Gaunt. +3",
		legs="Pteroslaver Brais +4",
		feet="Ostro Greaves",
		neck={ name="Vim Torque +1", augments={'Path: A',}},
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear="Telos Earring",
		right_ear="Sherida Earring",
		left_ring="Chirich Ring +1",
		right_ring="Niqmaddu Ring",
		back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
}  

	sets.precast.JA.Angon = {ammo="Angon",hands="Ptero. Fin. G. +4"}
	sets.precast.JA['Ancient Circle'] = {} --legs="Vishap Brais"
	
	sets.precast.JA['High Jump'] = {
		ammo="Ginsen", -- Aurgelmir orb
		head="Flam. Zucchetto +2",
		body="Vishap Mail +3",
		hands="Vis. Fng. Gaunt. +3",
		legs="Pteroslaver Brais +4",
		feet="Ostro Greaves",
		neck={ name="Vim Torque +1", augments={'Path: A',}},
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear="Telos Earring",
		right_ear="Sherida Earring",
		left_ring="Chirich Ring +1",
		right_ring="Niqmaddu Ring",
		back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
	}
	sets.precast.JA['Soul Jump'] = {
		ammo="Ginsen", -- Aurgelmir orb
		head="Flam. Zucchetto +2",
		body="Vishap Mail +3",
		hands="Vis. Fng. Gaunt. +3",
		legs="Pteroslaver Brais +4",
		feet="Ostro Greaves",
		neck={ name="Vim Torque +1", augments={'Path: A',}},
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear="Telos Earring",
		right_ear="Sherida Earring",
		left_ring="Chirich Ring +1",
		right_ring="Niqmaddu Ring",
		back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
	}
	sets.precast.JA['Spirit Jump'] = {
		ammo="Ginsen", -- Aurgelmir orb
		head="Flam. Zucchetto +2",
		body="Vishap Mail +3",
		hands="Vis. Fng. Gaunt. +3",
		legs="Pteroslaver Brais +4",
		feet="Peltast's Schynbalds +3",  
		neck={ name="Vim Torque +1", augments={'Path: A',}},
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear="Telos Earring",
		right_ear="Sherida Earring",
		left_ring="Chirich Ring +1",
		right_ring="Niqmaddu Ring",
		back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
	}
	sets.precast.JA['Super Jump'] = {}
	sets.precast.JA['Spirit Link'] = {hands="Pel. Vambraces +3"} --head="Vishap Armet",
	sets.precast.JA['Call Wyvern'] = {body="Ptero. Mail +1"}
	sets.precast.JA['Deep Breathing'] = {hands="Ptero. Armet +4"}
	sets.precast.JA['Spirit Surge'] = {body="Ptero. Mail +1"}
	sets.precast.JA['Steady Wing'] = {}
	
	-- Breath sets
	sets.precast.JA['Restoring Breath'] = {back="Brigantia's Mantle"}
	sets.precast.JA['Smiting Breath'] = {back="Brigantia's Mantle"}
	sets.HealingBreath = {back="Brigantia's Mantle"}
	sets.SmitingBreath = {back="Brigantia's Mantle"}

	-- Fast cast sets
	
	sets.precast.FC = {}
	sets.midcast.Cure = {}
	-- sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	-- sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	-- sets.Self_Refresh = {waist="Gishdubar Sash"}
	
	-- Midcast Sets
	sets.midcast.FastRecast = {}
		
	-- Put HP+ gear and the AF head to make healing breath trigger more easily with this set.
	sets.midcast.HB_Trigger = set_combine(sets.midcast.FastRecast, {head="Vishap Armet +1"})
	
    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.passive.MP = {ear2="Ethereal Earring",waist="Flume Belt"}
    sets.passive.Twilight = {head="Twilight Helm", body="Twilight Mail"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Swap to these on Moonshade using WS if at 3000 TP
	-- sets.MaxTP = {ear1="Lugra Earring +1",ear2="Sherida Earring",}
	-- sets.AccMaxTP = {ear1="Zennaroi Earring",ear2="Telos Earring"}
	-- sets.AccDayMaxTPWSEars = {ear1="Zennaroi Earring",ear2="Telos Earring"}
	-- sets.DayMaxTPWSEars = {ear1="Brutal Earring",ear2="Sherida Earring",}
	-- sets.AccDayWSEars = {ear1="Zennaroi Earring",ear2="Telos Earring"}
	-- sets.DayWSEars = {ear1="Moonshade Earring",ear2="Sherida Earring",}
	
	------------------
	-- Engaged sets --
	------------------
		-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	sets.engaged = {
		ammo="Coiste Bodhar",
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Pel. Vambraces +3",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck={ name="Dgn. Collar +2", augments={'Path: A',}},
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear="Telos Earring",	--right_ear="Sroda Earring", if  Wyvern
		right_ear="Sherida Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Chirich Ring +1", --Moonlight Ring
		back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
}
		
	sets.engaged.DTLite = { --Max DT & MEva
		ammo="Coiste Bodhar",
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Pel. Vambraces +3",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck={ name="Dgn. Collar +2", augments={'Path: A',}},
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		--right_ear="Sroda Earring", --Telos Earring if no Wyvern
		right_ear="Sherida Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Chirich Ring +1", --Moonlight Ring
		back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
}
		
    sets.engaged.SomeAcc = {}
	sets.engaged.Acc = {}
    sets.engaged.AM = {}
    sets.engaged.AM.SomeAcc = {}
	sets.engaged.AM.Acc = {}
    sets.engaged.PDT = {}
	sets.engaged.SomeAcc.PDT = {}
	sets.engaged.Acc.PDT = {}
    sets.engaged.AM.PDT = {}
    sets.engaged.AM.SomeAcc.PDT = {}
	sets.engaged.AM.Acc.PDT = {}

	----------------------
	-- Weaponskill sets --
	----------------------
	
	sets.precast.WS = {
		ammo="Coiste Bodhar",
		head="Peltast's Mezail +3",
		body="Gleti's Cuirass",
		hands="Gleti's Gauntlets",
		legs="Gleti's Breeches",
		feet="Flam. Gambieras +2",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Pel. Earring +1",
		left_ring="Sroda Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
}
	
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {})

	
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Savage Blade'] = {
		ammo="Knobkierrie",
		head="Peltast's Mezail +3",
		body="Pelt. Plackart +3",
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck={ name="Dgn. Collar +2", augments={'Path: A',}},
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Pel. Earring +1",
		left_ring="Sroda Ring",
		right_ring="Epaminondas's Ring",
		back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}
	
	sets.precast.WS['Stardiver'] = set_combine(sets.precast.WS, {
		ammo="Coiste Bodhar",
		head="Ptero. Armet +4",
		body="Nyame Mail",
			--body="Gleti's Cuirass", Needs augs
		hands="Ptero. Fin. G. +4",
			--hands="Gleti's Gauntlets", Needs augs
		legs="Nyame Flanchard",
			--legs="Gleti's Breeches", Needs augs
		feet="Nyame Sollerets",
		neck="Dgn. Collar +2",
		left_ear="Moonshade Earring",
		right_ear="Pel. Earring +1",
		left_ring="Sroda Ring",
		right_ring="Niqmaddu Ring",
		waist="Fotia Belt",
		back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
})

	sets.precast.WS['Stardiver'].Acc = set_combine(sets.precast.WS.Acc, {})
	
	sets.precast.WS['Drakesbane'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Drakesbane'].Acc = set_combine(sets.precast.WS.Acc, {})

	sets.precast.WS['Diarmuid'] = set_combine(sets.precast.WS, {
		ammo="Coiste Bodhar",
		head="Peltast's Mezail +3",
		body="Nyame Mail",
			--body="Gleti's Cuirass", Needs augs
		hands="Ptero. Fin. G. +4",
		legs="Nyame Flanchard",
			--legs="Gleti's Breeches", Needs augs
		feet="Nyame Sollerets",
		neck={ name="Dgn. Collar +2", augments={'Path: A',}},
		waist="Sailfi Belt +1",
		left_ear="Moonshade Earring",
		right_ear="Pel. Earring +1",
		left_ring="Sroda Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
})

	sets.precast.WS['Diarmuid'].Acc = set_combine(sets.precast.WS.Acc, {})

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    --Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(1, 16)
    elseif player.sub_job == 'SAM' then
      set_macro_page(1, 16)
    elseif player.sub_job == 'BLU' then
      set_macro_page(1, 16)
    else
      set_macro_page(1, 16)
    end
end

function sub_job_change(new,old)
send_command('wait 5;input /lockstyleset 20')
end

send_command('wait 5;input /lockstyleset 20')

send_command('exec init.txt')