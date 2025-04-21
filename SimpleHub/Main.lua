if game.PlaceId == 44444444444 then -- some game
    loadstring(game:HttpGet("your_link_here?nocache=1"))
elseif game.PlaceId == 3333333 then -- another game
    loadstring(game:HttpGet("your_link_here?nocache=1"))
else
    loadstring(game:HttpGet("https://raw.githubusercontent.com/SsimplynickK/SimpleHub/refs/heads/main/SimpleHub/Games/Universal.lua?nocache=1")) -- universal
end