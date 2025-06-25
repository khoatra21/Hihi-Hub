-- ✅ TSBG Script: Speed 25 + No Stun + Jump bình thường (Solara compatible)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local lp = Players.LocalPlayer

local TARGET_SPEED = 27

RunService.RenderStepped:Connect(function()
    local char = lp.Character
    if char and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("Humanoid") then
        local hrp = char.HumanoidRootPart
        local hum = char.Humanoid

        -- ✅ NO STUN: chống ngồi, chống bị đẩy nằm
        hum.PlatformStand = false
        hum.Sit = false
        hum:ChangeState(Enum.HumanoidStateType.Running)

        -- ✅ SPEED: boost tốc độ khi đang di chuyển dưới đất
        if hum.MoveDirection.Magnitude > 0 and hum.FloorMaterial ~= Enum.Material.Air then
            local currentY = hrp.Velocity.Y -- giữ nguyên rơi
            hrp.Velocity = Vector3.new(
                hum.MoveDirection.X * TARGET_SPEED,
                currentY,
                hum.MoveDirection.Z * TARGET_SPEED
            )
        end
    end
end)
