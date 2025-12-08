-- [nfnl] fnl/lib/math.fnl
local function div(x, y)
  if (nil == y) then
    _G.error("Missing argument y on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/math.fnl:3", 2)
  else
  end
  if (nil == x) then
    _G.error("Missing argument x on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/math.fnl:3", 2)
  else
  end
  return math.floor((x / y))
end
local function ln(x)
  if (nil == x) then
    _G.error("Missing argument x on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/math.fnl:7", 2)
  else
  end
  return math.log(x)
end
return {div = div, ln = ln}
