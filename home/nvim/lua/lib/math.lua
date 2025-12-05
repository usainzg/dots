-- [nfnl] fnl/lib/math.fnl
local function div(x, y)
  _G.assert((nil ~= y), "Missing argument y on /home/usainzg/.config/nvim/fnl/lib/math.fnl:3")
  _G.assert((nil ~= x), "Missing argument x on /home/usainzg/.config/nvim/fnl/lib/math.fnl:3")
  return math.floor((x / y))
end
local function ln(x)
  _G.assert((nil ~= x), "Missing argument x on /home/usainzg/.config/nvim/fnl/lib/math.fnl:7")
  return math.log(x)
end
return {div = div, ln = ln}
