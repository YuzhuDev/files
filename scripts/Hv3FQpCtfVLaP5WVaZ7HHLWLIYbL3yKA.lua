local v2 = _G
local v3 = getfenv or function() return v2 end


local v1 = function(str, key)
    local function hexToByte(hex)
        return tonumber(hex, 16)
    end
    local result = ""
    for i = 1, #str, 2 do
        local hex = string.sub(str, i, i + 1)
        local byte = hexToByte(hex)
        local keyByte = string.byte(key, ((i-1)/2 % #key) + 1)
        result = result .. string.char(bit.bxor(byte, keyByte))
    end
    return result
end

print(v1("0f3d3d2e28747115282a3d26", "GXQB"))