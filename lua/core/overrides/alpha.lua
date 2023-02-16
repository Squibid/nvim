local present, alpha = pcall(require, "alpha")
if not present then
	return
end

local pepe = {
  {
    [[⠄⠄⠄⠄⠄⠄⠄⢀⣠⣶⣾⣿⣶⣦⣤⣀⠄⢀⣀⣤⣤⣤⣤⣄⠄⠄⠄⠄⠄⠄]],
    [[⠄⠄⠄⠄⠄⢀⣴⣿⣿⣿⡿⠿⠿⠿⠿⢿⣷⡹⣿⣿⣿⣿⣿⣿⣷⠄⠄⠄⠄⠄]],
    [[⠄⠄⠄⠄⠄⣾⣿⣿⣿⣯⣵⣾⣿⣿⡶⠦⠭⢁⠩⢭⣭⣵⣶⣶⡬⣄⣀⡀⠄⠄]],
    [[⠄⠄⠄⡀⠘⠻⣿⣿⣿⣿⡿⠟⠩⠶⠚⠻⠟⠳⢶⣮⢫⣥⠶⠒⠒⠒⠒⠆⠐⠒]],
    [[⠄⢠⣾⢇⣿⣿⣶⣦⢠⠰⡕⢤⠆⠄⠰⢠⢠⠄⠰⢠⠠⠄⡀⠄⢊⢯⠄⡅⠂⠄]],
    [[⢠⣿⣿⣿⣿⣿⣿⣿⣏⠘⢼⠬⠆⠄⢘⠨⢐⠄⢘⠈⣼⡄⠄⠄⡢⡲⠄⠂⠠⠄]],
    [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣥⣀⡁⠄⠘⠘⠘⢀⣠⣾⣿⢿⣦⣁⠙⠃⠄⠃⠐⣀]],
    [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣋⣵⣾⣿⣿⣿⣿⣦⣀⣶⣾⣿⣿⡉⠉⠉]],
    [[⣿⣿⣿⣿⣿⣿⣿⠟⣫⣥⣬⣭⣛⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠄]],
    [[⣿⣿⣿⣿⣿⣿⣿⠸⣿⣏⣙⠿⣿⣿⣶⣦⣍⣙⠿⠿⠿⠿⠿⠿⠿⠿⣛⣩⣶⠄]],
    [[⣛⣛⣛⠿⠿⣿⣿⣿⣮⣙⠿⢿⣶⣶⣭⣭⣛⣛⣛⣛⠛⠛⠻⣛⣛⣛⣛⣋⠁⢀]],
    [[⣿⣿⣿⣿⣿⣶⣬⢙⡻⠿⠿⣷⣤⣝⣛⣛⣛⣛⣛⣛⣛⣛⠛⠛⣛⣛⠛⣡⣴⣿]],
    [[⣛⣛⠛⠛⠛⣛⡑⡿⢻⢻⠲⢆⢹⣿⣿⣿⣿⣿⣿⠿⠿⠟⡴⢻⢋⠻⣟⠈⠿⠿]],
    [[⣿⡿⡿⣿⢷⢤⠄⡔⡘⣃⢃⢰⡦⡤⡤⢤⢤⢤⠒⠞⠳⢸⠃⡆⢸⠄⠟⠸⠛⢿]],
    [[⡟⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢸]],
  },
  {
    [[⠄⠄⠄⠄⠄⠄⠄⠄⠄⣾⣿⣿⣿⣿⡄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄]],
    [[⠄⠄⠄⠄⠄⠄⠄⠄⣼⣿⣿⣿⣿⣿⣿⣧⠄⠄⠄⠄⠄⣀⣀⠄⠄⠄⠄⠄⠄⠄]],
    [[⠄⠄⠄⠄⠄⠄⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣧⠄⠄⠄⣾⠛⠛⣷⢀⣾⠟⠻⣦⠄]],
    [[⠄⠄⠄⠄⠄⠄⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠄⠄⢰⡿⠋⠄⠄⣠⡾⠋⠄]],
    [[⠄⠄⠄⠄⠄⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡄⠄⣬⡄⠄⠄⠄⣭⡅⠄⠄]],
    [[⠄⠄⠄⠄⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠄⠄⠄⠄⠄⠄⠄⠄⠄]],
    [[⠄⠄⠄⠄⢛⣛⣛⣛⣛⣛⣛⣛⣛⡛⢋⣉⣭⣭⣥⣬⣤⣤⣀⠄⠄⠄⠄⠄⠄⠄]],
    [[⠄⠄⣴⣵⣿⣟⡉⣥⣶⣶⠶⠶⠬⣉⡂⠹⣟⡫⠽⠟⢒⣒⠒⠆⠄⠄⠄⠄⠄⠄]],
    [[⠄⣼⣿⣿⣿⣿⣿⣶⣭⣃⡈⠄⠄⠘⠃⡰⢶⣶⣿⠏⠄⠄⠙⡛⠄⠄⠄⠄⠄⠄]],
    [[⢰⣿⣿⣿⣿⣿⣿⣿⣯⣉⣉⣩⣭⣶⣿⡿⠶⠶⠶⠶⠶⠾⣋⠄⠄⠄⠄⠄⠄⠄]],
    [[⢾⣿⣿⣿⣿⣿⣿⣿⢩⣶⣒⠒⠶⢖⣒⣚⡛⠭⠭⠭⠍⠉⠁⠄⠄⠄⣀⣀⡀⠄]],
    [[⠘⢿⣿⣿⣿⣿⣿⣿⣧⣬⣭⣭⣭⣤⡤⠤⠶⠟⣋⣀⣀⡀⢀⣤⣾⠟⠋⠈⢳⠄]],
    [[⣴⣦⡒⠬⠭⣭⣭⣭⣙⣛⠋⠭⡍⠁⠈⠙⠛⠛⠛⠛⢻⠛⠉⢻⠁⠄⠄⠄⢸⡀]],
    [[⣿⣿⣿⣿⣷⣦⣤⠤⢬⢍⣼⣦⡾⠛⠄⠄⠄⠄⠄⠄⠈⡇⠄⢸⠄⠄⠄⢦⣄⣇]],
    [[⣿⣿⡿⣋⣭⣭⣶⣿⣶⣿⣿⣿⠟⠛⠃⠄⠄⠄⠄⠄⢠⠃⠄⡜⠄⠄⠄⠔⣿⣿]],
  },
  {
    [[⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠔⠊⠉⠉⠉⠉⠉⠐⢦⡄⠄⠄⠄⠄⠄⠄⠄⠄]],
    [[⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⡐⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠘⣆⠄⠄⠄⠄⠄⠄⠄]],
    [[⠄⠄⠄⠄⠄⠄⠄⠄⢀⠖⠁⢀⣾⣆⡰⠶⡷⠶⣀⣾⣄⠄⠈⣆⠄⠄⠄⠄⠄⠄]],
    [[⠄⠄⡄⠄⠠⢤⣤⠔⠃⠄⠄⠄⠄⠘⢧⣤⢣⣤⠋⠄⠄⠄⠄⠈⠣⢤⡠⠄⠄⠄]],
    [[⠄⠄⠘⠦⡀⠄⠄⠄⠄⠄⠄⠄⢻⡟⠻⣿⣿⡿⠻⡟⠃⠄⠄⠄⠄⠄⠄⠄⡀⠞]],
    [[⠄⠄⠄⠄⠉⢢⡀⠄⠄⠄⠄⠄⠄⠄⠄⠄⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⡠⠊⠄⠄]],
    [[⠄⠄⠄⠄⠄⠄⠈⠢⣤⣤⣴⣶⡶⢶⣶⣶⣶⣆⢒⣤⣤⠄⢠⠤⠤⠚⠄⠄⠄⠄]],
    [[⠄⠄⠄⠄⠄⢀⣠⣾⣿⣿⣿⣿⣎⢻⣿⠁⡀⣿⡎⣿⣿⣀⣃⠧⡀⠄⠄⠄⠄⠄]],
    [[⠄⠄⣠⣶⣾⣿⣿⣿⣿⣿⣿⣿⡹⡼⢿⣠⠵⠿⣑⢿⣟⣛⠤⣩⡁⠄⠄⠄⠄⠄]],
    [[⢠⣿⣿⣿⢏⡜⡻⣷⡽⣿⣷⣭⣿⣮⣽⣯⣽⣿⣿⣷⣤⣾⡿⠟⠃⠄⠄⠄⠄⠄]],
    [[⠻⣿⣿⣿⣌⢷⣙⠾⠯⣒⡿⠭⣝⣛⣛⣛⣛⠛⠭⠭⠟⢣⠌⠄⠄⠄⠄⠄⠄⠄]],
    [[⠄⠻⣿⣿⣿⣮⣟⠷⣦⣤⣝⣛⠲⠶⠶⠒⢂⣀⠠⠄⠐⠁⠄⠄⠄⠄⠄⠄⠄⠄]],
    [[⠄⠄⠄⠙⠿⠿⢿⣿⡷⠶⠭⠭⠭⠵⠶⠒⠋⠉⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄]],
  },
  {
    [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
    [[⣿⣿⣿⣿⣿⣿⣿⠛⢩⣴⣶⣶⣶⣌⠙⠫⠛⢋⣭⣤⣤⣤⣤⡙⣿⣿⣿⣿⣿⣿]],
    [[⣿⣿⣿⣿⣿⡟⢡⣾⣿⠿⣛⣛⣛⣛⣛⡳⠆⢻⣿⣿⣿⠿⠿⠷⡌⠻⣿⣿⣿⣿]],
    [[⣿⣿⣿⣿⠏⣰⣿⣿⣴⣿⣿⣿⡿⠟⠛⠛⠒⠄⢶⣶⣶⣾⡿⠶⠒⠲⠌⢻⣿⣿]],
    [[⣿⣿⠏⣡⢨⣝⡻⠿⣿⢛⣩⡵⠞⡫⠭⠭⣭⠭⠤⠈⠭⠒⣒⠩⠭⠭⣍⠒⠈⠛]],
    [[⡿⢁⣾⣿⣸⣿⣿⣷⣬⡉⠁⠄⠁⠄⠄⠄⠄⠄⠄⠄⣶⠄⠄⠄⠄⠄⠄⠄⠄⢀]],
    [[⢡⣾⣿⣿⣿⣿⣿⣿⣿⣧⡀⠄⠄⠄⠄⠄⠄⠄⢀⣠⣿⣦⣤⣀⣀⣀⣀⠄⣤⣾]],
    [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣶⡶⢇⣰⣿⣿⣟⠿⠿⠿⠿⠟⠁⣾⣿⣿]],
    [[⣿⣿⣿⣿⣿⣿⣿⡟⢛⡛⠿⠿⣿⣧⣶⣶⣿⣿⣿⣿⣿⣷⣼⣿⣿⣿⣧⠸⣿⣿]],
    [[⠘⢿⣿⣿⣿⣿⣿⡇⢿⡿⠿⠦⣤⣈⣙⡛⠿⠿⠿⣿⣿⣿⣿⠿⠿⠟⠛⡀⢻⣿]],
    [[⠄⠄⠉⠻⢿⣿⣿⣷⣬⣙⠳⠶⢶⣤⣍⣙⡛⠓⠒⠶⠶⠶⠶⠖⢒⣛⣛⠁⣾⣿]],
    [[⠄⠄⠄⠄⠄⠈⠛⠛⠿⠿⣿⣷⣤⣤⣈⣉⣛⣛⣛⡛⠛⠛⠿⠿⠿⠟⢋⣼⣿⣿]],
    [[⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠈⠉⠉⣻⣿⣿⣿⣿⡿⠿⠛⠃⠄⠙⠛⠿⢿⣿]],
    [[⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢬⣭⣭⡶⠖⣢⣦⣀⠄⠄⠄⠄⢀⣤⣾⣿]],
    [[⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢰⣶⣶⣶⣾⣿⣿⣿⣿⣷⡄⠄⢠⣾⣿⣿⣿]],
  },
}

-- dynamic header padding
local fn = vim.fn
local marginTopPercent = 0.2
local Padding = fn.max { 2, fn.floor(fn.winheight(0) * marginTopPercent) }

local header = {
	type = "text",
	val = pepe[math.random(#pepe)],
	opts = {
		position = "center",
		hl = "AlphaAscii",
	},
}

local plugins = require('lazy').stats().count
local date = os.date("%d/%m/%y(%a)%X")

math.randomseed(os.time())
local id = math.random(10000000, 99999999)
local id1 = math.random(10000000, 99999999)
local id2 = math.random(10000000, 99999999)

local chan = {
  [[based!!!]],
  [[in other words, 4chan is better because
                       everyone gets to be an idiot.]],
  [[NOOOOOOO YOU CAN’T PUBLISH BENCHMARKS FOR 
                       OUR ANCIENT OS]],
  [[This is the beginning of the end. AI has
                       finally won. Tech is no longer a viable job.]],
  [[And Wikipedia is bloat because of html,
                       mathml, rich text, etc. Using modern codecs
                       and a simpler form of wiki we could store
                       the entire "human knowledge-base" and plain
                       text references (books, papers, articles, 
                       websites) inside a single μSD card]],
  [[My arch install broke again]],
  [[Why are stdout, stderr and stdin already
                       opened when I start my program? Who opened
                       them and what is he doing in my computer?]],
  [[YES BOYCOTT!
                       SPREAD THIS MESSAGE
                       EVERYONE QUIT USING THE SITE, THEY CANNOT 
                       IGNORE US ANYMORE. FROM THIS DAY ONWARDS 
                       THEIR PRODUCT WILL NOT BE ABLE TO HOLD UP 
                       WITHOUT US]],
  [[COMPANY A BETTER THAN COMPANY B]],
  [[Nah, ignore this anon. If you want to
                       REALLY learn programming, you need to
                       learn with punch cards. Once you've
                       got that under your belt, move on
                       up to assembly.]],
}
local phrase = chan[math.random(#chan)]

local heading = {
	type = "text",
	val = "  Anonymous " .. date .. " No." .. id .. " ",
	opts = {
		position = "center",
		hl = "AlphaButtons",
	},
}

local post_buttons = {
	type = "text",
	val = "They don't get it. For me, it's nvim.     ",
	opts = {
		position = "center",
		hl = "AlphaFooter",
	},
}

local pre_foot = {
	type = "text",
	val = ">>" .. id2 .. "(OP)                            ",
	opts = {
		position = "center",
		hl = "AlphaEmphasis",
	},
}

local footer = {
	type = "text",
	val = " I've " .. plugins .. " plugins, it launches instantly kek.",
	opts = {
		position = "center",
		hl = "AlphaFooter",
	},
}

local pre_foot_2 = {
	type = "text",
	val = ">>" .. id1 .. "                                ",
	opts = {
		position = "center",
		hl = "AlphaEmphasis",
	},
}

local footer_2 = {
	type = "text",
	val = "                       " .. phrase,
	opts = {
		position = "left",
		hl = "AlphaFooter",
	},
}

local function button(sc, txt, keybind)
	local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

	local opts = {
		position = "center",
		text = txt,
		shortcut = sc,
		cursor = 0,
		width = 44,
		align_shortcut = "right",
		hl_shortcut = "AlphaShortcuts",
		hl = "AlphaHeader",
	}
	if keybind then
		opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
	end

	return {
		type = "button",
		val = txt,
		on_press = function()
			local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
			vim.api.nvim_feedkeys(key, "normal", false)
		end,
		opts = opts,
	}
end

local buttons = {
	type = "group",
	val = {
		button("LDR e", " >open new file", ":ene<CR>"),
		button("LDR h", " >open oldfiles", ":Telescope oldfiles<CR>"),
		button("LDR f", " >fuzzy search", ":Telescope find_files<CR>"),
		button("LDR y", " >browse folders" , ":Telescope file_browser path=%:p:h<CR>"),
		button("LDR /", " >regex search", ":Telescope live_grep<CR>"),
		button("LDR u", " >update plugins", ":lua require('lazy').update()<CR>"),
	},
	opts = {
		spacing = 0,
	},
}

local section = {
	header = header,
	buttons = buttons,
	heading = heading,
	post_buttons = post_buttons,
	pre_foot = pre_foot,
	footer = footer,
	pre_foot_2 = pre_foot_2,
	footer_2 = footer_2,
}

local opts = {
	layout = {
    { type = "padding", val = Padding},
		{ type = "padding", val = 1 },
		section.header,
		{ type = "padding", val = 1 },
		section.heading,
		{ type = "padding", val = 1 },
		section.buttons,
		section.post_buttons,
		{ type = "padding", val = 1 },
		section.pre_foot,
		section.footer,
		{ type = "padding", val = 1 },
		section.pre_foot_2,
		section.footer_2,
    { type = "padding", val = Padding },
	},
	opts = {
		margin = 50,
	},
}
alpha.setup(opts)
