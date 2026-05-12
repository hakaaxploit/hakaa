-- HAKA BRAINROT FINAL
local player = game.Players.LocalPlayer
local bp = player.Backpack
local chr = player.Character or player.CharacterAdded:Wait()
local rs = game:GetService("ReplicatedStorage")
local limit = 20
local count = 0

local items = {"Divine Brainrot","Infinity Brainrot","Paradox Brainrot","Limitless Brainrot"}

local function getItem(n)
    for _,v in pairs(bp:GetChildren()) do if v.Name == n then return v end end
    for _,v in pairs(chr:GetChildren()) do if v:IsA("Tool") and v.Name == n then return v end end
    return nil
end

local function dupe(n)
    if count >= limit then return false end
    local it = getItem(n)
    if not it then return false end
    local r = rs:FindFirstChild("CloneItem") or rs:FindFirstChild("DuplicateItem")
    if r then r:FireServer(it) count = count + 1 print(n.." duped ("..count.."/"..limit..")") end
    return r ~= nil
end

print("Haka Brainrot Loaded")
for i=1,limit do for _,n in pairs(items) do dupe(n) wait(2) end end
print("Done")