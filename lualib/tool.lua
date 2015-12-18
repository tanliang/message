tool = {}

tool.split = function(s, p)
    local res = {}
    string.gsub(s, '[^'..p..']+', function(w) table.insert(res, w) end )
    return res
end

tool.nil2val = function(t)
    if t == nil or _G.next(t) == nil then
        return nil
    else
        return t
    end
end

tool.auth_args = function (auth, args) 
    local res = {}
    local err = nil
    table.foreach(auth, function(i, v) 
        res[i] = args[i]
        if args[i] == nil or string.len(args[i]) == 0 then
            if v == "required" then
                err = i
            end
            res[i] = v
        end 
    end)
    if err then
        res = nil
    end
    return res, err
end

return tool
