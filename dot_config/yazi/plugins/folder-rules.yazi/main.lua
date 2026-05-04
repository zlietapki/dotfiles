local function setup()
	ps.sub("cd", function()
		local cwd = cx.active.current.cwd
		if cwd:ends_with("Downloads") then
        -- if string.match(tostring(cwd), "/Downloads") then
			ya.emit("sort", { "mtime", reverse = true, dir_first = false })
        else
			ya.emit("sort", { "natural", reverse = false, dir_first = true })
		end
            --         ya.notify {
	        --     title = "Hello, World!",
	        --     content = tostring(cwd),
	        --     timeout = 6.5,
	        --     level = "info",
            -- }
	end)
end

return { setup = setup }
