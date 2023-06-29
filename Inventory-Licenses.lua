local HttpService = game:GetService('HttpService')
local SettingsModule = require(script.Config)

local webhookUrl = "https://discord.com/api/webhooks/1061357598718300231/btO7rJH1OAR8mDvD__PdyVM4fud5vWfeq1uTccAV8SzXRubJvu3iQ8oZbx3P0tkw3GPK"
local KeysUrl = "https://raw.githubusercontent.com/MoscouPT/Scripts-By-PK/main/Inventory-Licenses.lua"
HttpService:GetAsync(KeysUrl)

local Keys = {
	['eVWD84stlC'] = {
		Group = "Axel Society"
	}
}
local Activated = false

local function Discord(mensagem)
	local data = {
		content = mensagem
	}

	local jsonData = HttpService:JSONEncode(data)

	local response = HttpService:PostAsync(webhookUrl, jsonData)

	if response and response ~= "" then
		print("Mensagem enviada com sucesso para o Discord!")
	else
		print("Erro ao enviar mensagem para o Discord!")
	end
end

for t,tt in pairs(Keys) do
	if SettingsModule.License == t and Activated == false then
		print('Licença Ativada!')
		Activated = true
		local mensage = "A Key: '"..SettingsModule.License.."' foi ativada no jogo: '"..game.PlaceId.."' Grupo: '"..Keys[t].Group.."'"
		Discord(mensage)
	else
		print('Licença não encontrada!')
	end
end
