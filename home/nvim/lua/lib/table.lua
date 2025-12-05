-- [nfnl] fnl/lib/table.fnl
local function first(items)
  _G.assert((nil ~= items), "Missing argument items on /home/usainzg/.config/nvim/fnl/lib/table.fnl:3")
  if items then
    return items[1]
  else
    return nil
  end
end
local function last(items)
  _G.assert((nil ~= items), "Missing argument items on /home/usainzg/.config/nvim/fnl/lib/table.fnl:7")
  if items then
    return items[#items]
  else
    return nil
  end
end
return {first = first, last = last}
