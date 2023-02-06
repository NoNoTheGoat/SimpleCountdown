    local branding = 
[[
^7
^3|| 
|| Script Made By NoNo
|| Https://discord.gg/TBEjHKk4zD ^3For Help
|| Https://www.HunterModifications.org ^3For More Resources
^3||^2 $$\   $$\           $$\   $$\           
^3||^2 $$$\  $$ |          $$$\  $$ |          
^3||^2 $$$$\ $$ | $$$$$$\  $$$$\ $$ | $$$$$$\  
^3||^2 $$ $$\$$ |$$  __$$\ $$ $$\$$ |$$  __$$\ 
^3||^2 $$ \$$$$ |$$ /  $$ |$$ \$$$$ |$$ /  $$ |
^3||^2 $$ |\$$$ |$$ |  $$ |$$ |\$$$ |$$ |  $$ |
^3||^2 $$ | \$$ |\$$$$$$  |$$ | \$$ |\$$$$$$  |
^3||^2 \__|  \__| \______/ \__|  \__| \______/ 
^3||             
^7                                                                    
   ]]
   local countDownTime = nil
   local countDownTime = nil

   -- Start the countdown when the /countdown command is used
   RegisterCommand("countdown", function(source, args, rawCommand)
       local time = tonumber(args[1])
       if time == nil then
           TriggerClientEvent('chatMessage', source, "Usage: /countdown [time in seconds]")
           return
       end
   
       if time > 500 then
           TriggerClientEvent('chatMessage', source, "Countdown time cannot be greater than 500 seconds.")
           return
       end
   
       countDownTime = time + GetGameTimer() / 1000
   end, false)
   
   -- Periodically check the current time and update the chat message
   Citizen.CreateThread(function()
       while true do
           Citizen.Wait(1000)
   
           if countDownTime ~= nil then
               local remainingTime = countDownTime - GetGameTimer() / 1000
               if remainingTime > 0 then
                   TriggerClientEvent('chatMessage', -1, "Countdown: " .. math.floor(remainingTime) .. " seconds remaining")
               else
                   countDownTime = nil
                   TriggerClientEvent('chatMessage', -1, "Countdown complete!")
               end
           end
       end
   end)
   