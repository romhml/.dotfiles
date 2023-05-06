-- Projections
vim.g.projectionist_heuristics = {
	["pyproject.toml"] = {
		["tests/**/routes/test_*s.py"] = {
			["alternate"] = {
				"{dirname}/models/{basename}.py",
				"{dirname}/routes/{basename}s.py",
				"{dirname}/schemas/{basename}.py",
				"tests/{dirname}/routes/test_{basename}s.py",
				"tests/{dirname}/factories/{basename}.py",
			},
			["type"] = "t",
		},
		["tests/**/factories/*.py"] = {
			["alternate"] = {
				"{dirname}/models/{basename}.py",
				"{dirname}/routes/{basename}s.py",
				"{dirname}/schemas/{basename}.py",
				"tests/{dirname}/routes/test_{basename}s.py",
				"tests/{dirname}/factories/{basename}.py",
			},
			["type"] = "f",
		},
		["**/models/*.py"] = {
			["alternate"] = {
				"{dirname}/models/{basename}.py",
				"{dirname}/routes/{basename}s.py",
				"{dirname}/schemas/{basename}.py",
				"tests/{dirname}/routes/test_{basename}s.py",
				"tests/{dirname}/factories/{basename}.py",
			},
			["type"] = "m",
		},
		["**/schemas/*.py"] = {
			["alternate"] = {
				"{dirname}/models/{basename}.py",
				"{dirname}/routes/{basename}s.py",
				"{dirname}/schemas/{basename}.py",
				"tests/{dirname}/routes/test_{basename}s.py",
				"tests/{dirname}/factories/{basename}.py",
			},
			["type"] = "s",
		},
		["**/routes/*s.py"] = {
			["alternate"] = {
				"{dirname}/models/{basename}.py",
				"{dirname}/routes/{basename}s.py",
				"{dirname}/schemas/{basename}.py",
				"tests/{dirname}/routes/test_{basename}s.py",
				"tests/{dirname}/factories/{basename}.py",
			},
			["type"] = "r",
		},
	},
	["src/App.vue"] = {
		["**/api/*s.js"] = {
			["alternate"] = {
				"{dirname}/stores/{basename}.js",
			},
			["type"] = "a",
		},
		["**/stores/*.js"] = {
			["alternate"] = {
				"{dirname}/api/{basename}.js",
			},
			["type"] = "s",
		},
		["src/components/*.vue"] = {
			["alternate"] = {
				"src/stories/{basename}.stories.js",
			},
			["type"] = "c",
		},
		["src/stories/*.stories.js"] = {
			["alternate"] = {
				"src/components/{basename}.vue",
			},
			["type"] = "s",
		},
	},
}
