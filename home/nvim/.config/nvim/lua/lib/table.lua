-- [nfnl] fnl/lib/table.fnl
local function first(items)
  if (nil == items) then
    _G.error("Missing argument items on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/table.fnl:3", 2)
  else
  end
  if items then
    return items[1]
  else
    return nil
  end
end
local function first0(items)
  if (nil == items) then
    _G.error("Missing argument items on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/table.fnl:6", 2)
  else
  end
  if items then
    return items[1]
  else
    return nil
  end
end
local function last(items)
  if (nil == items) then
    _G.error("Missing argument items on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/table.fnl:9", 2)
  else
  end
  if items then
    return items[#items]
  else
    return nil
  end
end
return {first = first0, last = last}
