local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Psycho Hub by Nanno",
   Icon = "menu", -- Ícone temporário, pode trocar por outro do Lucide Icons
   LoadingTitle = "Psycho Hub Loading...",
   LoadingSubtitle = "by Nanno",
   Theme = "Default",
   
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   Discord = {
      Enabled = true, 
      Invite = "bFG4ZQDubk", -- Código do seu Discord
      RememberJoins = true 
   },
})

-- Criando uma aba principal
local MainTab = Window:CreateTab("Main", "home") -- Ícone 'home' pode ser trocado

-- Criando uma seção
local Section = MainTab:CreateSection("Bem-vindo ao Psycho Hub")

-- Pegando o fantasma
local ghost = game.Workspace:FindFirstChild("Ghost")

if ghost then
   -- Verificando se o atributo 'CurrentRoom' existe
   local currentRoom = ghost:GetAttribute("CurrentRoom")
   if currentRoom == nil then
      currentRoom = "Cômodo desconhecido"  -- Valor padrão caso o atributo seja nil
   end

   -- Gerando as informações do fantasma
   local ghostInfo = "Tipo do Fantasma: " .. tostring(ghost:GetAttribute("GhostType")) .. "\n" ..
      "Gênero: " .. tostring(ghost:GetAttribute("Gender")) .. "\n" ..
      "Idade do Fantasma: " .. tostring(ghost:GetAttribute("Age")) .. "\n" ..
      "Cômodo Favorito: " .. tostring(ghost:GetAttribute("FavoriteRoom")) .. "\n" ..
      "Cômodo Atual: " .. currentRoom  -- Aqui, a verificação de nil foi aplicada

   -- Criando um parágrafo para mostrar as informações do fantasma
   local GhostParagraph = MainTab:CreateParagraph({Title = "Informações do Fantasma", Content = ghostInfo})
else
   -- Caso o fantasma não seja encontrado
   local GhostParagraph = MainTab:CreateParagraph({Title = "Informações do Fantasma", Content = "Fantasma não encontrado!"})
end

-- Criando o botão Limpar o Mapa
local ClearMapButton = MainTab:CreateButton({
   Name = "Limpar o Mapa",
   Callback = function()
      -- Limpar o nevoeiro (nofog)
      game:GetService("Lighting").FogEnd = 100000
      for _,v in pairs(game:GetService("Lighting"):GetDescendants()) do
         if v:IsA("Atmosphere") then
            v:Destroy()
         end
      end

      -- Ativar fullbright (fullbrightness)
      game:GetService("Lighting").Brightness = 2
      game:GetService("Lighting").ClockTime = 14
      game:GetService("Lighting").FogEnd = 100000
      game:GetService("Lighting").GlobalShadows = false
      game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(128, 128, 128)

      -- Definir o horário do dia (day)
      game:GetService("Lighting").ClockTime = 14
   end,
})
