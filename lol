local Animate = game.Players.LocalPlayer.Character.Animate
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=782841498"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=782845736"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616168032"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616163682"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083218792"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1083182000"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1083189019"

game.StarterGui:SetCore("SendNotification", {
	Title = "Free Animation Script",
	Text = "Made by ahjared<3 #0069",
	Duration = 10
})

game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 23


local emotes = {
    block = 6862022283,
    guitar = 6532134724,
    fault = 6797891807,
    drum = 6531483720,
    rodeo = 5918728267,
    takeme = 6797890377,
    panini = 5915713518,
    rockon = 5915714366,
    hips = 6797888062,
    holiday = 5937558680,
    oldtownroad = 5937560570,
    sleep = 4686925579,
    highwave = 5915690960,
    airdance = 4555782893,
    herolanding = 5104344710,
    sidetoside = 3333136415,
    dorky = 4212455378,
    dolphin = 5918726674,
    god = 3337994105,
    happy = 4841405708,
    sad = 4841407203,
    monkey = 3333499508,
    baby = 4265725525,
    line = 4049037604,
    fashion = 3333331310,
    twirl = 3334968680,
    top = 3361276673,
    dizzy = 3361426436,
    shy = 3337978742,
    side = 3333136415,
    dorky = 4212455378,
    robot = 3338025566,
    shuffle = 4349242221,
    around = 3303391864,
    tpose = 3338010159,
    body = 3333387824,
    fancy = 3333432454,
    celebrate = 3338097973,
    idol = 4101966434,
    hands = 4265701731,
    haha = 3337966527,
    curtsy = 4555816777,
    airdance = 4555782893,
    zombie = 4210116953,
    tree = 4049551434,
    swoosh = 3361481910,
    great = 3338042785,
    sneaky = 3334424322,
    jacks = 3338066331,
    getout = 3333272779,
    fish = 3334832150,
    loud = 3338083565,
    ypose = 4349285876,
    borock = 3236842542,
    udzal = 3303161675,
    hype = 3695333486,
    floss = 5917459365,
    fancy = 3333432454,
    beckon = 5230598276,
    tree = 4049551434,
    bored = 5230599789,
    cower = 4940563117,
    applaud = 5915693819,
    chacha = 3695322025,
    superhero = 3695373233,
    airguitar = 3695300085
}

local active = {}

local player = game.Players.LocalPlayer
chatcon = player.Chatted:Connect(function(msg)
    msg = string.lower(msg)
    
    local separate = string.sub(msg,1,3)
    if separate == "/e " then
        local cmd = string.sub(msg,4,string.len(msg))
        
        if emotes[cmd] then
            for i,v in pairs(active) do
                v:Stop(0.1)
                active[i] = nil
            end
            
            local Anim = Instance.new("Animation")
            Anim.AnimationId = "rbxassetid://"..emotes[cmd]
            
            player.Character.Animate.Disabled = true
            local toplay = player.Character.Humanoid.Animator:LoadAnimation(Anim)
            toplay:Play(0.1,1,1)
            
            active[cmd] = toplay
            con = player.Character.Humanoid.Running:connect(function(speed)
                if speed > 0.5 then
                    player.Character.Animate.Disabled = false
                    toplay:Stop(0.1)
                    active[cmd] = nil
                    con:Disconnect()
                end
            end)
            jumpcon = player.Character.Humanoid.Jumping:connect(function()
                player.Character.Animate.Disabled = false
                toplay:Stop(0.1)
                active[cmd] = nil
                jumpcon:Disconnect()
            end)
        elseif cmd == "disable" then
            for i,v in pairs(active) do
                v:Stop(0.1)
            end
            
            chatcon:Disconnect()
        end
    end
end)

local toprint = "List of commands:\n"
for i,v in pairs(emotes) do
    toprint ..= "/e ".. i.. "\n"
end
print(toprint)
