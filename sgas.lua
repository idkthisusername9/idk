local placeId = game.PlaceId
if placeId == 2753915549 or placeId == 4442272183 or placeId == 7449423635 then
    repeat wait() until game:IsLoaded()
    
    spawn(function()
        pcall(function()
            local player = game.Players.LocalPlayer
           
            -- Wait for everything to load (team can take a moment)
            wait(3)
           
            -- Get initial team
            local currentTeam = (player.Team and player.Team.Name) or "None"
            print("Current team: " .. currentTeam)
           
            if currentTeam == "Marines" then
                print("✅ Already on Marines team!")
            else
                print("🔄 Switching to Marines...")
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Marines")
               
                -- Wait for the team change to apply
                wait(3)
               
                -- Get team again after switch
                currentTeam = (player.Team and player.Team.Name) or "None"
                print("Team after switch: " .. currentTeam)
            end
           
            -- Set global output variables (you can check these in other scripts)
            getgenv().PlayerTeam = currentTeam
            getgenv().IsMarines = (currentTeam == "Marines")
        end)
    end)
end
