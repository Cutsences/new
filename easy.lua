local NewTool = Instance.new("Tool",game.Players.LocalPlayer.Backpack)
local SelectionBox = Instance.new("SelectionBox",game.Workspace)
SelectionBox.Name = "BTOOL BOX"
SelectionBox.LineThickness = 0.05
SelectionBox.Adornee = nil
SelectionBox.Color3 = Color3.fromRGB(255,0,0)
SelectionBox.Visible = false
NewTool.Name = "FE BTOOL"
NewTool.RequiresHandle = false
local IsEquipped = false
local Mouse = game.Players.LocalPlayer:GetMouse()


function DestroyObj(Obj)
game:GetService("ReplicatedStorage").Channels.HouseChannel:FireServer("PlaceFurniture",Obj or nil,CFrame.new(0,-math.huge,0),0)
end

NewTool.Equipped:connect(function()
IsEquipped = true
SelectionBox.Visible = true
SelectionBox.Adornee = nil
end)

NewTool.Unequipped:connect(function()
IsEquipped = false
SelectionBox.Visible = false
SelectionBox.Adornee = nil
end)


NewTool.Activated:connect(function()
if IsEquipped then
DestroyObj(Mouse.Target)
end
end)


function GetPlrByPart(Prt)
if Prt then
for _,Plr in pairs(game.Players:GetPlayers()) do
if Plr.Character then
if Prt:IsDescendantOf(Plr.Character) then
return Plr
end
end
end
end
return nil

end


local NewTool2 = Instance.new("Tool",game.Players.LocalPlayer.Backpack)
local SelectionBox2 = Instance.new("SelectionBox",game.Workspace)
SelectionBox2.Name = "PLAYER BOX"
SelectionBox2.LineThickness = 0.05
SelectionBox2.Adornee = nil
SelectionBox2.Color3 = Color3.fromRGB(0,255,0)
SelectionBox2.Visible = false
NewTool2.Name = "PLAYER KICKER"
NewTool2.RequiresHandle = false
local IsEquipped2 = false
local Mouse2 = game.Players.LocalPlayer:GetMouse()



NewTool2.Equipped:connect(function()
IsEquipped2 = true
SelectionBox2.Visible = true
SelectionBox2.Adornee = nil
end)

NewTool2.Unequipped:connect(function()
IsEquipped2 = false
SelectionBox2.Visible = false
SelectionBox2.Adornee = nil
end)


NewTool2.Activated:connect(function()
if IsEquipped2 and GetPlrByPart(Mouse.Target) then
DestroyObj(GetPlrByPart(Mouse.Target))
end
end)

while true do
if GetPlrByPart(Mouse.Target or nil) then
SelectionBox2.Color3 = Color3.fromRGB(0,255,0)
else
SelectionBox2.Color3 = Color3.fromRGB(255,0,0)
end
SelectionBox.Adornee = Mouse.Target or nil
SelectionBox2.Adornee = Mouse.Target or nil
wait(0.1)
end