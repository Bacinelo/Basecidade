-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
cnVRP = {}
Tunnel.bindInterface("vrp_admin",cnVRP)
vCLIENT = Tunnel.getInterface("vrp_admin")
vHOMES = Tunnel.getInterface("vrp_homes")
vPLAYER = Tunnel.getInterface("vrp_player")
vRPRAGE = Tunnel.getInterface("vrp_garages")

local screenshotOptions = {
	encoding = 'png',
	quality = 1
}

local active = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
local webhookadmin = "https://discord.com/api/webhooks/842899107dsadsa353460736/GpFtj2jwdsadsadsaE9oyAsb5jpgNZkfVwh6JjHkclSYFMBMFZV2rhAYujwnA7VSAzy1OCSgsjqYB"
local webhookkick = "https://discord.com/api/webhooks/842899107353460736/GpFtj2jdsadsawE9oyAsb5jpgNZkfVwh6JjHkclSYFMBMFZV2rhAYujwnA7VSAzy1OCSgsjqYB"
-- local webhookfac = ""
local webhooknotify = "https://discordapp.com/api/webhooks/859762782287560714/ddasdsadassadsaN9XCtrA18RV3FbGFCju9YpDvfOmC4VWjYJEuzgXCE-TE5IgbrUdjFTfx4rAo85hM4nnv"
-- local webhookkeys = ""
local webhookcds = "https://discord.com/api/webhooks/842899107353460736/GpFtj2jwE9oyAsb5dsadsadjpgNZkfVwh6JjHkclSYFMBMdsadasFZV2rhAYujwnA7VSAzy1OCSgsjqYB"
local webhookblacklist = "https://discord.com/api/webhooks/842899544034377749/ADSwt9XmmdsadsaHdk4zi_YUNCDXVdaS-QRBRqs-irvE2sadsadsa76WTI4uZyv8cSe4iixCGV0B12rmHT"
local webhookgive = "https://discord.com/api/webhooks/842899107353460736/GpFtj2jwE9oyAsdasdssadasdasab5jpgNZkfVwh6JjHkclSYFMBMFZV2rhsadsaAYujwnA7VSAzy1OCSgsjqYB"
local webhookban = "https://discord.com/api/webhooks/842899107353460736/GpFtj2jwdsadasE9oyAsbsadsa5jpgNZkfVwh6JjHkclSYFMBMFZV2rhAYujwnA7VSAzy1OCSgsjqYB"
local webhookadminwl = "https://discord.com/api/webhooks/848447024542122004/Ua8Hgac7GOXEdsadsatIdHWEXoXsIbsQjKsUDPZm_k5fNXFydasdaseyFWluhfCH3bUseZw8-dxvHXxC"
local webhookunwl = "https://discord.com/api/webhooks/84844702454212asdsadsa2004/Udsadasda8dsadsadHgac7GOXEtIdHdsadsadasWEXoXsIbsQjKsUDPZm_k5fNXFyeyFWluhfCH3bUseZw8-dxvHXxC"
local webhookadmingod = "https://discord.com/api/webhooks/842899107sadsadsad353460736/GpFdsatj2jwE9oyAsb5jpgNZkfVwh6JjHkclSYFMBMFZV2rhAYujwnA7VSAzy1OCSgsjqYB"
local webhookgroup = "https://discord.com/api/webhooks/8484500005930dasdsa92628/8ndsadsaNIH7LdsadT792bnjOREhasdsad3ddVexasdsa4gKC7qudasdsaQXfVto1R3fuDWY0xbVTfYiGzcHf0MObfvOeso"
-- local webhookinfernao = " "
-- local webhooktroxao = " "
-- local webhookaddcar = " "

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECK PERMISSAO COR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("cor", function(source, args)
    local source = source
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id, 'Booster') or vRP.hasPermission(user_id, 'Owner') or vRP.hasPermission(user_id, 'Admin') or vRP.hasPermission(user_id, 'Prata') or vRP.hasPermission(user_id, 'Ouro') or vRP.hasPermission(user_id, 'Diamante') or vRP.hasPermission(user_id, 'Platina') or vRP.hasPermission(user_id, 'Supremo') or vRP.hasPermission(user_id, 'Mestre') then
        TriggerClientEvent('changeWeaponColor', source, args[1])
	else
		TriggerClientEvent("Notify",source,"vermelho","Você não possui <b>VIP</b> ou <b>Booster</b>.",3000) 
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ ADM FUEL ]---------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('admfuel',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Owner") then
			TriggerClientEvent("admfuel",source)
		end	
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TURBO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("turbo",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Owner") then
			TriggerClientEvent("LigarTurbao",source)
		end
	end
end)

-- RegisterCommand("explosion",function(source,args,rawCommand)
-- 	local user_id = vRP.getUserId(source)
-- 	if user_id then
-- 		if vRP.hasPermission(user_id,"Owner") then
-- 			TriggerClientEvent("boom",source)
-- 		end
-- 	end
-- end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ARMA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('arma',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
			if args[1] then
					if vRP.hasPermission(user_id,"DevilPERM") then
						vRPclient.giveWeapons(source,{[args[1]] = { ammo = 250 }})
					end
			end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LIMPAR INVENTARIO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('limparinv',function(source,args,rawCommand)
    local source = source
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"Owner") or vRP.hasPermission(user_id,"Admin") then
        vRP.clearInventory(user_id)
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SAY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('adm',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)
    if vRP.hasPermission(user_id,"Admin") then
        local mensagem = vRP.prompt(source,"Mensagem:","")
        if mensagem == "" then
            return
        end

		TriggerClientEvent("Notify",-1,"amarelo",mensagem.."<br><b>Mensagem enviada por:</b> Governador",15000)
		SendWebhookMessage(webhooknotify,"```ini\n[ID]: "..user_id.."\n[MSG]: "..mensagem.." "..os.date("\n[DATA]: %d/%m/%Y [HORA]: %H:%M:%S").." \r```")
    end
end)
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ANÚNCIO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('anuncio',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"Owner") or vRP.hasPermission(user_id,"Admin") or vRP.hasPermission(user_id,"Moderador") or vRP.hasPermission(user_id,"Suporte") or vRP.hasPermission(user_id,"Helper") or vRP.hasPermission(user_id,"Police") or vRP.hasPermission(user_id,"Paramedic") then
		local mensagem = vRP.prompt(source,"Mensagem:","")
		if mensagem == "" then
			return
		end
	   
		TriggerClientEvent("Notify",-1,"azul",mensagem.."<br><b>Mensagem enviado por: "..identity.name.." "..identity.name2.."</b>",15000)
		SendWebhookMessage(webhooknotify,"```ini\n[ID]: "..user_id.."\n[MSG]: "..mensagem.." "..os.date("\n[DATA]: %d/%m/%Y [HORA]: %H:%M:%S").." \r```")
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SERVIÇO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('ptr', function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)
	local oficiais = vRP.numPermission("Police")
	local policia = 0
	local oficiais_nomes = ""
	--if vRP.hasPermission(user_id,"Police") or vRP.hasPermission(user_id,"Owner") or vRP.hasPermission(user_id,"Admin") or vRP.hasPermission(user_id,"Moderador") or vRP.hasPermission(user_id,"Suporte") then
	for k,v in ipairs(oficiais) do
		local identity = vRP.getUserIdentity(parseInt(v))
		oficiais_nomes = oficiais_nomes .. "<b>" .. v .. "</b>: " .. identity.name .. " " .. identity.name2 .. "<br>"
		policia = policia + 1
	end
	TriggerClientEvent("Notify",source,"amarelo", "Atualmente <b>"..policia.." Policiais</b> em serviço.",5000)
	if parseInt(policia) > 0 then
		--TriggerClientEvent("Notify",source,"amarelo", oficiais_nomes,5000)
	end
	--end
end)

RegisterCommand('ptr2', function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)
	local oficiais = vRP.numPermission("Police")
	local policia = 0
	local oficiais_nomes = ""
	if vRP.hasPermission(user_id,"Police") or vRP.hasPermission(user_id,"Owner") or vRP.hasPermission(user_id,"Admin") or vRP.hasPermission(user_id,"Moderador") or vRP.hasPermission(user_id,"Suporte") then
		for k,v in ipairs(oficiais) do
			local identity = vRP.getUserIdentity(parseInt(v))
			oficiais_nomes = oficiais_nomes .. "<b>" .. v .. "</b>: " .. identity.name .. " " .. identity.name2 .. "<br>"
			policia = policia + 1
		end
		TriggerClientEvent("Notify",source,"amarelo", "Atualmente <b>"..policia.." Paramédicos</b> em serviço.",5000)
		if parseInt(policia) > 0 then
			TriggerClientEvent("Notify",source,"amarelo", oficiais_nomes,5000)
		end
	end
end)

RegisterCommand('ems', function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)
	local oficiais = vRP.numPermission("Paramedic")
	local policia = 0
	local oficiais_nomes = ""
	--if vRP.hasPermission(user_id,"Police") or vRP.hasPermission(user_id,"Owner") or vRP.hasPermission(user_id,"Admin") or vRP.hasPermission(user_id,"Moderador") or vRP.hasPermission(user_id,"Suporte") then
	for k,v in ipairs(oficiais) do
		local identity = vRP.getUserIdentity(parseInt(v))
		oficiais_nomes = oficiais_nomes .. "<b>" .. v .. "</b>: " .. identity.name .. " " .. identity.name2 .. "<br>"
		policia = policia + 1
	end
	TriggerClientEvent("Notify",source,"amarelo", "Atualmente <b>"..policia.." Paramédicos</b> em serviço.",5000)
	if parseInt(policia) > 0 then
		--TriggerClientEvent("Notify",source,"amarelo", oficiais_nomes,5000)
	end
	--end
end)

RegisterCommand('ems2', function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)
	local oficiais = vRP.numPermission("Paramedic")
	local policia = 0
	local oficiais_nomes = ""
	if vRP.hasPermission(user_id,"Police") or vRP.hasPermission(user_id,"Owner") or vRP.hasPermission(user_id,"Admin") or vRP.hasPermission(user_id,"Moderador") or vRP.hasPermission(user_id,"Suporte") then
		for k,v in ipairs(oficiais) do
			local identity = vRP.getUserIdentity(parseInt(v))
			oficiais_nomes = oficiais_nomes .. "<b>" .. v .. "</b>: " .. identity.name .. " " .. identity.name2 .. "<br>"
			policia = policia + 1
		end
		TriggerClientEvent("Notify",source,"amarelo", "Atualmente <b>"..policia.." Paramédicos</b> em serviço.",5000)
		if parseInt(policia) > 0 then
			TriggerClientEvent("Notify",source,"amarelo", oficiais_nomes,5000)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTPLAYERS
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("vRP:playerSpawn",function(user_id,source)
	local identity = vRP.getUserIdentity(user_id)
	if identity then
		vCLIENT.setDiscord(source,"#"..user_id.." "..identity.name.." "..identity.name2)
		TriggerClientEvent(source,'active:checkcam',true)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SKIN
-----------------------------------------------------------------------------------------------------------------------------------------
-- RegisterCommand('skin',function(source,args,rawCommand)
--     local user_id = vRP.getUserId(source)
-- 	if vRP.hasPermission(user_id,"Owner") or vRP.hasPermission(user_id,"Admin") then
-- 		TriggerClientEvent("skinmenu",args[1],args[2])
-- 		TriggerClientEvent("Notify",source,"vermelho","Voce setou a skin <b>"..args[2].."</b> no passaporte <b>"..parseInt(args[1]).."</b>.",5000)
--     end
-- end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("item",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") or vRP.hasPermission(user_id,"Owner") or vRP.hasPermission(user_id,"Moderador") then
			if args[1] and args[2] and vRP.itemNameList(args[1]) ~= nil then
				vRP.giveInventoryItem(user_id,args[1],parseInt(args[2]),true)
				SendWebhookMessage(webhookgive,"```prolog\n[ID]: "..user_id.."\n[PEGOU]: "..args[1].." \n[QUANTIDADE]: "..parseInt(args[2]).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DEBUG
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("toggledebug",function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") then
			TriggerClientEvent("ToggleDebug",source)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("plate",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Owner") and args[1] and args[2] and args[3] then
			vRP.execute("vRP/update_plate_vehicle",{ user_id = parseInt(args[1]), vehicle = args[2], plate = args[3] })
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DERRUBAR JOGADOR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('ney',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)
	if user_id then
    	if vRP.hasPermission(user_id,"Owner") or vRP.hasPermission(user_id,"Admin") then
        	if args[1] then
				local nplayer = vRP.getUserSource(parseInt(args[1]))
				if nplayer then
           	 	TriggerClientEvent('derrubarwebjogador',nplayer,args[1])
				end
        	end
    	end
	end
end)

-- RegisterCommand("good",function(source,args,rawCommand)
-- 	local user_id = vRP.getUserId(source)
-- 	if user_id then
-- 		if vRP.hasPermission(user_id,"Owner") or vRP.hasPermission(user_id,"Admin") then
-- 			if args[1] then
-- 				local nplayer = vRP.getUserSource(parseInt(args[1]))
-- 				if nplayer then
-- 					vCLIENT._revivePlayer(nplayer,200)
-- 					vRP.upgradeThirst(parseInt(args[1]),100)
-- 					vRP.upgradeHunger(parseInt(args[1]),100)
-- 					vRP.downgradeStress(parseInt(args[1]),100)
-- 					TriggerClientEvent("resetBleeding",nplayer)
-- 					TriggerClientEvent("resetDiagnostic",nplayer)
-- 				end
-- 			else
-- 				vRP.upgradeThirst(user_id,100)
-- 				vRP.upgradeHunger(user_id,100)
-- 				vRP.downgradeStress(user_id,100)
-- 				vCLIENT._revivePlayer(source,200)
-- 				TriggerClientEvent("resetBleeding",source)
-- 				TriggerClientEvent("resetDiagnostic",source)
-- 			end
-- 		end
-- 	end
-- end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADDCAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("addcar",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Owner") and args[1] and args[2] then
			vRP.execute("vRP/add_vehicle",{ user_id = parseInt(args[1]), vehicle = args[2], plate = vRP.generatePlateNumber(), phone = vRP.getPhone(args[1]), work = tostring(false) })
			TriggerClientEvent("Notify",args[1],"verde","Voce recebeu <b>"..args[2].."</b> em sua garagem.",5000)
			TriggerClientEvent("Notify",source,"verde","Adicionou o veiculo: <b>"..args[2].."</b> no ID:<b>"..args[1].."</b.",3000)
		end
	end
end)

RegisterCommand("capuzz",function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Owner") or vRP.hasPermission(user_id,"Admin") and args[1] then
			TriggerClientEvent("vrp_hud:toggleHood",source,args[1])
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- NC
-----------------------------------------------------------------------------------------------------------------------------------------
function cnVRP.enablaNoclip()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") or vRP.hasPermission(user_id,"Owner") or vRP.hasPermission(user_id,"Moderador") or vRP.hasPermission(user_id,"Suporte")  then
			vRPclient.noClip(source)
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- KICK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("kick",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") or vRP.hasPermission(user_id,"Owner") or vRP.hasPermission(user_id,"Moderador") and parseInt(args[1]) > 0 then
			vRP.kick(parseInt(args[1]),"Você foi expulso da cidade.")
			SendWebhookMessage(webhookkick,"```prolog\n[ID]: "..user_id.."\n[KICKOU]: "..args[1].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BAN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("ban",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") or vRP.hasPermission(user_id,"Owner") or vRP.hasPermission(user_id,"Moderador") and parseInt(args[1]) > 0 then
			local identity = vRP.getUserIdentity(parseInt(args[1]))
			if identity then
				vRP.execute("vRP/set_banned",{ steam = tostring(identity.steam), banned = 1 })
				vRP.kick(parseInt(args[1]),"Você foi banido! [ Mais informações em: https://discord.gg/es5y8X9P2F ]")
				TriggerClientEvent("Notify",source,"verde","Você baniu o passaporte <b>"..args[1].."</b> da cidade.",3000)
				SendWebhookMessage(webhookban,"```prolog\n[ID]: "..user_id.." \n[BANIU]: "..args[1].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- WL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("wl",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") or vRP.hasPermission(user_id,"Owner") or vRP.hasPermission(user_id,"Moderador") or vRP.hasPermission(user_id,"Suporte") then
			vRP.execute("vRP/set_whitelist",{ steam = tostring(args[1]), whitelist = 1 })
			TriggerClientEvent("Notify",source,"verde","Você aprovou o passaporte <b>"..args[1].."</b> na whitelist.",3000)
			SendWebhookMessage(webhookadminwl,"```prolog\n[ID]: "..user_id.."\n[APROVOU WL]: "..args[1].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UNWL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("unwl",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") and parseInt(args[1]) > 0 then
			local identity = vRP.getUserIdentity(parseInt(args[1]))
			if identity then
				vRP.execute("vRP/set_whitelist",{ steam = tostring(identity.steam), whitelist = 0 })
				TriggerClientEvent("Notify",source,"verde","Você retirou o passaporte <b>"..args[1].."</b> da whitelist.",3000)
				SendWebhookMessage(webhookunwl,"```prolog\n[ID]: "..user_id.."\n[RETIROU WL]: "..args[1].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GEMS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("Coins",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"DevilADM") and parseInt(args[1]) > 0 and parseInt(args[2]) > 0 then
			local identity = vRP.getUserIdentity(parseInt(args[1]))
			if identity then
				vRP.addGmsId(args[1],args[2])
				TriggerClientEvent("Notify",source,"verde","Coins entregues para "..identity.name.." #"..args[1]..".",5000)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UNBAN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("unban",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") and parseInt(args[1]) > 0 then
			local identity = vRP.getUserIdentity(parseInt(args[1]))
			if identity then
				vRP.execute("vRP/set_banned",{ steam = tostring(identity.steam), banned = 0 })
				TriggerClientEvent("Notify",source,"verde","Você desbaniu o passaporte <b>"..args[1].."</b> da cidade.",3000)
				SendWebhookMessage(webhookban,"```prolog\n[ID]: "..user_id.." \n[DESBANIU]: "..args[1].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPCDS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("tpcds",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") then
			local fcoords = vRP.prompt(source,"Coordinates:","")
			if fcoords == "" then
				return
			end

			local coords = {}
			for coord in string.gmatch(fcoords or "0,0,0","[^,]+") do
				table.insert(coords,parseInt(coord))
			end
			vRPclient.teleport(source,coords[1] or 0,coords[2] or 0,coords[3] or 0)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CDS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("cds",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Owner") or vRP.hasPermission(user_id,"Admin") or vRP.hasPermission(user_id,"Moderador") or vRP.hasPermission(user_id,"Suporte") then
			local x,y,z,h = vRPclient.getPositions(source)
			vRP.prompt(source,"Coordinates:",x..","..y..","..z)
		end
	end
end)

RegisterCommand("cds2",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Owner") or vRP.hasPermission(user_id,"Admin") or vRP.hasPermission(user_id,"Moderador") or vRP.hasPermission(user_id,"Suporte") then
			local x,y,z,h = vRPclient.getPositions(source)
			vRP.prompt(source,"Coordinates:","['x'] = "..tD(x)..", ['y'] = "..tD(y)..", ['z'] = "..tD(z))
		end
	end
end)

RegisterCommand("cds3",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Owner") or vRP.hasPermission(user_id,"Admin") or vRP.hasPermission(user_id,"Moderador") or vRP.hasPermission(user_id,"Suporte") then
			local x,y,z,h = vRPclient.getPositions(source)
			vRP.prompt(source,"Coordinates:","{x="..tD(x)..", y="..tD(y)..", z="..tD(z).."},")
		end
	end
end)

RegisterCommand("cds4",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Owner") or vRP.hasPermission(user_id,"Admin") or vRP.hasPermission(user_id,"Moderador") or vRP.hasPermission(user_id,"Suporte") then
			local x,y,z,h = vRPclient.getPositions(source)
			vRP.prompt(source,"Coordinates:",x..","..y..","..z..","..h)
		end
	end
end)

function tD(n)
    n = math.ceil(n * 100) / 100
    return n
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GROUP
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("group",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Owner") or vRP.hasPermission(user_id,"Admin") or vRP.hasPermission(user_id,"Moderador") or vRP.hasPermission(user_id,"Suporte") then
			if not vRP.hasPermission(parseInt(args[1]),tostring(args[2])) then
				local tsource = vRP.getUserSource(parseInt(args[1]))
				if tsource then
				vRP.insertPermission(tsource, args[2])
				end
				vRP.execute("vRP/add_group",{ user_id = parseInt(args[1]), permiss = tostring(args[2]) })
				TriggerClientEvent("Notify",source,"verde","Você setou o passaporte <b>"..parseInt(args[1]).."</b> no grupo <b>"..args[2].."</b>.",3000)
				SendWebhookMessage(webhookgroup,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.name2.." \n[SETOU]: "..args[1].." \n[GRUPO]: "..args[2].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UNGROUP
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("ungroup",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Owner") or vRP.hasPermission(user_id,"Admin") or vRP.hasPermission(user_id,"Moderador") or vRP.hasPermission(user_id,"Suporte") then
			if vRP.hasPermission(parseInt(args[1]),tostring(args[2])) then
				local tsource = vRP.getUserSource(parseInt(args[1]))
				if tsource then
				vRP.removePermission(tsource, args[2])
				end
				vRP.execute("vRP/del_group",{ user_id = parseInt(args[1]), permiss = tostring(args[2]) })
				TriggerClientEvent("Notify",source,"verde","Voce removeu o passaporte <b>"..parseInt(args[1]).."</b> do grupo <b>"..args[2].."</b>.",3000)
				SendWebhookMessage(webhookgroup,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.name2.." \n[REMOVEU]: "..args[1].." \n[GRUPO]: "..args[2].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPTOME
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("tptome",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") or vRP.hasPermission(user_id,"Owner") or vRP.hasPermission(user_id,"Moderador") or vRP.hasPermission(user_id,"Suporte") or vRP.hasPermission(user_id,"Helper") and parseInt(args[1]) > 0 then
			local nplayer = vRP.getUserSource(parseInt(args[1]))
			if nplayer then
				vRPclient.teleport(nplayer,vRPclient.getPositions(source))
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPTO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("tpto",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") or vRP.hasPermission(user_id,"Owner") or vRP.hasPermission(user_id,"Moderador") or vRP.hasPermission(user_id,"Suporte") or vRP.hasPermission(user_id,"Helper") and parseInt(args[1]) > 0 then
			local nplayer = vRP.getUserSource(parseInt(args[1]))
			if nplayer then
				vRPclient.teleport(source,vRPclient.getPositions(nplayer))
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPWAY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("tpway",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") or vRP.hasPermission(user_id,"Owner") or vRP.hasPermission(user_id,"Moderador") or vRP.hasPermission(user_id,"Suporte") or vRP.hasPermission(user_id,"Helper") then
			vCLIENT.teleportWay(source)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LIMBO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("limbo",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRPclient.getHealth(source) <= 101 then
			vCLIENT.teleportLimbo(source)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HASH
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("hash",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") then
			local vehicle = vRPclient.getNearVehicle(source,7)
			if vehicle then
				vCLIENT.vehicleHash(source,vehicle)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DELNPCS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("delnpcs",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") then
			vCLIENT.deleteNpcs(source)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TUNING
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("tuning",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Owner") or vRP.hasPermission(user_id,"Admin") then
			TriggerClientEvent("vrp_admin:vehicleTuning",source)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FIX
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("fix",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Owner") or vRP.hasPermission(user_id,"Admin") or vRP.hasPermission(user_id,"Moderador") or vRP.hasPermission(user_id,"Suporte") then
			local vehicle,vehNet = vRPclient.vehList(source,11)
			if vehicle then
				TriggerClientEvent("vrp_inventory:repairVehicle",-1,vehNet,true)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CARRO POLICIA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("fixar",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local vehicle,vehNet,vehPlate,vehName,vehLock,vehBlock,vehHealth,vehModel,vehClass = vRPclient.vehList(source,3)
	if vehicle and vehClass ~= 15 and vehClass ~= 16 then
		if vRP.hasPermission(user_id,"Owner") or vRP.hasPermission(user_id,"Admin") or vRP.hasPermission(user_id,"Moderador") or vRP.hasPermission(user_id,"Suporte") or vRP.hasPermission(user_id,"Police") or vRP.hasPermission(user_id,"Paramedic") then
			if vRPclient.inVehicle(source) then
				active[user_id] = 100
				vRPclient.stopActived(source)
				vCLIENT.blockButtons(source,true)
				vRPRAGE.startAnimHotwired(source)
				TriggerEvent("setPlateEveryone",vehPlate)
				TriggerEvent("setPlatePlayers",vehPlate,user_id)
				Wait(3000)
				vCLIENT.blockButtons(source,false)
				vRPRAGE.stopAnimHotwired(source,vehicle)
				active[user_id] = nil
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LIMPARAREA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("limpararea",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") then
			local x,y,z = vRPclient.getPositions(source)
			TriggerClientEvent("syncarea",-1,x,y,z,100)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYERS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("players",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") then
			local quantidade = 0
			local users = vRP.getUsers()
			for k,v in pairs(users) do
				quantidade = parseInt(quantidade) + 1
			end
			TriggerClientEvent("Notify",source,"amarelo","<b>Players Conectados:</b> "..quantidade,5000)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CPLAYERS
-----------------------------------------------------------------------------------------------------------------------------------------

RegisterCommand("cplayers",function(source,args,rawCommand)
	if source == 0 then
		local quantidade = 0
		local users = vRP.getUsers()
		for k,v in pairs(users) do
			quantidade = parseInt(quantidade) + 1
		end
		print("Players Conectados: "..quantidade)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PON
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('pon',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"Admin") or vRP.hasPermission(user_id,"Owner") or vRP.hasPermission(user_id,"Moderador") or vRP.hasPermission(user_id,"Suporte") then
		local users = vRP.getUsers()
		local players = ""
		local quantidade = 0
		for k,v in pairs(users) do
			if k ~= #users then
				players = players..", "
			end
			players = players..k
			quantidade = quantidade + 1
		end
		TriggerClientEvent('chatMessage',source,"TOTAL ONLINE",{1, 136, 0},quantidade)
		TriggerClientEvent('chatMessage',source,"ID's ONLINE",{1, 136, 0},players)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CDS
-----------------------------------------------------------------------------------------------------------------------------------------
function cnVRP.buttonTxt()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") then
			local x,y,z,h = vRPclient.getPositions(source)
			vRP.updateTxt(user_id..".txt",x..","..y..","..z..","..h)
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMALL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("itemall",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Owner") then
			local users = vRP.getUsers()
			for k,v in pairs(users) do
				vRP.giveInventoryItem(parseInt(k),tostring(args[1]),parseInt(args[2]),true)
				SendWebhookMessage(webhookgive,"```prolog\n[ID]: "..user_id.." \n[DEU]: "..args[2].." PARA TODOS "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			end
		end
	end
end)