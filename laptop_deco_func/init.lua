laptop_deco = {}

function laptop_deco.register(prefix,common,difference)
	-- itemstring: prefix .. "_" .. difference(key)
	local names = {}
	for i,v in pairs(difference) do
		local def = table.copy(common)
		for x,y in pairs(v) do
			def[x] = y
		end
		if def.not_in_creative_inventory then
			if not def.groups then def.groups = {} end
			def.groups.not_in_creative_inventory = 1
		end

		local name = prefix .. "_" .. i
		minetest.register_node(name,def)
		if string.sub(name,1,1,true) == ":" then
			name = string.sub(name,2,nil,true)
		end
		names[#names + 1] = name
	end
	if common.order then
		names = {}
		for i,v in ipairs(common.order) do
			local name = prefix .. "_" .. v
			if string.sub(name,1,1,true) == ":" then
				name = string.sub(name,2,nil,true)
			end
			names[i] = name
		end
	end
	cycle.node.punchcycle(names)
end
