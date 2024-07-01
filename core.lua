PlayerFrame.PlayerFrameContainer.FrameTexture:SetVertexColor(0,0,0);
PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual.PrestigePortrait:SetAlpha(0);
PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual.PrestigeBadge:SetAlpha(0);


TargetFrame.TargetFrameContainer.FrameTexture:SetVertexColor(0,0,0);
TargetFrame.TargetFrameContent.TargetFrameContentContextual.PrestigePortrait:SetAlpha(0);
TargetFrame.TargetFrameContent.TargetFrameContentContextual.PrestigeBadge:SetAlpha(0);


FocusFrame.TargetFrameContainer.FrameTexture:SetVertexColor(0,0,0);
FocusFrame.TargetFrameContent.TargetFrameContentContextual.PrestigePortrait:SetAlpha(0);
FocusFrame.TargetFrameContent.TargetFrameContentContextual.PrestigeBadge:SetAlpha(0);

PlayerName:Hide(0);

TargetFrame.TargetFrameContent.TargetFrameContentMain.ReputationColor:SetAlpha(0);

--Always dispallable buffs
local function TargetFrame_UpdateAuras(self)
    for buff in self.auraPools:GetPool("TargetBuffFrameTemplate"):EnumerateActive() do
        local data=C_UnitAuras.GetAuraDataByAuraInstanceID(buff.unit,buff.auraInstanceID);
        buff.Stealable:SetShown(data.isStealable or data.dispelName=="Magic");
    end
end

hooksecurefunc(TargetFrame, "UpdateAuras", TargetFrame_UpdateAuras);
hooksecurefunc(FocusFrame, "UpdateAuras", TargetFrame_UpdateAuras);

-- hide 10.1.5 pre match arena frames
-- local _, ns = ...
-- local eventFrame = CreateFrame("Frame")
-- eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
-- eventFrame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
-- eventFrame:RegisterEvent("ARENA_PREP_OPPONENT_SPECIALIZATIONS")

-- local hiddenFrame = CreateFrame("Frame")

-- function ns:hideFrame(frame)
--   frame:SetScript("OnShow", frame.Hide)
--   frame:Hide()
-- end

-- function ns:handleFrame(frame)
--   if not frame then return end
--   frame:SetParent(hiddenFrame)
--   ns:hideFrame(frame)
-- end

-- eventFrame:SetScript("OnEvent", function()
--   ns:hideFrame(hiddenFrame)
--   local arenaFrame = _G["CompactArenaFrame"]
--   ns:handleFrame(arenaFrame)
-- end)

-- hide HUD
GameTooltip:HookScript("OnShow", function(self) if self:GetOwner() == UIParent then self:Hide() end end)

-- PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.HealthBarArea.HealthBar:SetStatusBarColor(255/255, 255/255, 255/255)
-- PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.ManaBarArea.ManaBar:SetStatusBarColor(0/255, 57/255, 166/255)
-- AlternatePowerBar:SetStatusBarColor(213/255, 43/255, 30/255)