function GuildWindow_OnLoad()
  SLASH_GUILDWINDOW1= "/gw";
  SlashCmdList["GUILDWINDOW"] = GuildWindow_SlashCommand;
end

function aa(a)
  return "\"" .. a .. "\",";
end

function bb(a)
  return "\"" .. a .. "\"";
end

function GuildWindow_SlashCommand(msg)
  SetGuildRosterShowOffline(true);

  local i = 1;
  local numMembers = GetNumGuildMembers();
  local text = "";

  while i <= numMembers do
    local a, b, c, d, e, f, g, h = GetGuildRosterInfo(i)
    text = text .. aa(a:gsub("-NethergardeKeep", "")) .. aa(b) .. aa(c) .. aa(d) .. aa(e) .. aa(f) .. aa(g) .. bb(h) .. "\n";
    i = i + 1;
  end

  editbox(text);
end

function editbox(text)
  local f = CreateFrame("Button", "FizzleUIGrabTextFrame", UIParent)

  f:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", tile = true, tileSize = 16, insets = {left = 0, right = 0, top = 0, bottom = 0},})
  f:SetBackdropColor(0, 0, 0)
  f:SetPoint("CENTER")
  f:SetSize(500, 500)
  f:SetMovable(true)
  f:EnableMouse(true)
  f:RegisterForDrag("LeftButton")
  f:SetScript("OnDragStart", frame.StartMoving)
  f:SetScript("OnDragStop", frame.StopMovingOrSizing)

  f.ExitButton = CreateFrame('Button', 'exit', f)
  f.ExitButton:SetPoint("TOP", -5)
  f:ExitButton:SetSize(150, 30)
  f:

  f.Text = CreateFrame("EditBox", nil, f)
  f.Text:SetPoint("TOPRIGHT", -40, -10)
  f.Text:SetPoint("BOTTOMLEFT", 10, 10)
  f.Text:SetMultiLine(true)
  f.Text:SetMaxLetters(99999)
  f.Text:SetFontObject(GameFontNormal)
  f.Text:SetText(text)
end

GuildWindow_OnLoad();




-- local CopyChat = CreateFrame('Frame', 'nChatCopy', UIParent)
-- CopyChat:SetWidth(500)
-- CopyChat:SetHeight(400)
-- CopyChat:SetPoint('CENTER')
-- CopyChat:SetFrameStrata('DIALOG')
-- -- CopyChat:Hide()
-- CopyChat:SetBackdrop({
-- 	bgFile = [[Interface\Buttons\WHITE8x8]],
-- 	insets = {left = 3, right = 3, top = 4, bottom = 3
-- }})
-- CopyChat:SetBackdropColor(0, 0, 0, 0.7)

-- CreateBorder(CopyChat, 12, 1, 1, 1)

-- CopyChatBox = CreateFrame('EditBox', 'nChatCopyBox', CopyChat)
-- CopyChatBox:SetMultiLine(true)
-- CopyChatBox:SetAutoFocus(true)
-- CopyChatBox:EnableMouse(true)
-- CopyChatBox:SetMaxLetters(99999)
-- CopyChatBox:SetFont('Fonts\\ARIALN.ttf', 13, 'THINOUTLINE')
-- CopyChatBox:SetWidth(590)
-- CopyChatBox:SetHeight(590)
-- CopyChatBox:SetScript('OnEscapePressed', function() CopyChat:Hide() end)

-- local Scroll = CreateFrame('ScrollFrame', 'nChatCopyScroll', CopyChat, 'UIPanelScrollFrameTemplate')
-- Scroll:SetPoint('TOPLEFT', CopyChat, 'TOPLEFT', 8, -30)
-- Scroll:SetPoint('BOTTOMRIGHT', CopyChat, 'BOTTOMRIGHT', -30, 8)
-- Scroll:SetScrollChild(CopyChatBox)



-- local backdrop = {
--   bgFile = "Interface/BUTTONS/WHITE8X8",
--   edgeFile = "Interface/GLUES/Common/Glue-Tooltip-Border",
--   tile = true,
--   edgeSize = 8,
--   tileSize = 8,
--   insets = {
--       left = 5,
--       right = 5,
--       top = 5,
--       bottom = 5,
--   },
-- }


-- local f = CreateFrame("Frame", "MyScrollMessageTextFrame", UIParent)
-- f:SetSize(150, 150)
-- f:SetPoint("CENTER")
-- f:SetFrameStrata("BACKGROUND")
-- f:SetBackdrop(backdrop)
-- f:SetBackdropColor(0, 0, 0)
-- f.Close = CreateFrame("Button", "$parentClose", f)
-- f.Close:SetSize(24, 24)
-- f.Close:SetPoint("TOPRIGHT")
-- f.Close:SetNormalTexture("Interface/Buttons/UI-Panel-MinimizeButton-Up")
-- f.Close:SetPushedTexture("Interface/Buttons/UI-Panel-MinimizeButton-Down")
-- f.Close:SetHighlightTexture("Interface/Buttons/UI-Panel-MinimizeButton-Highlight", "ADD")
-- f.Close:SetScript("OnClick", function(self)
--   self:GetParent():Hide()
-- end)
-- f.Select = CreateFrame("Button", "$parentSelect", f, "UIPanelButtonTemplate")
-- f.Select:SetSize(14, 14)
-- f.Select:SetPoint("RIGHT", f.Close, "LEFT")
-- f.Select:SetText("S")
-- f.Select:SetScript("OnClick", function(self)
--   self:GetParent().Text:HighlightText() -- parameters (start, end) or default all
--   self:GetParent().Text:SetFocus()
-- end)

-- f.SF = CreateFrame("ScrollFrame", "$parent_DF", f, "UIPanelScrollFrameTemplate")
-- f.SF:SetPoint("TOPLEFT", f, 12, -30)
-- f.SF:SetPoint("BOTTOMRIGHT", f, -30, 10)
-- f.Text = CreateFrame("EditBox", nil, f)
-- f.Text:SetMultiLine(true)
-- f.Text:SetSize(180, 170)
-- f.Text:SetPoint("TOPLEFT", f.SF)
-- f.Text:SetPoint("BOTTOMRIGHT", f.SF)
-- f.Text:SetMaxLetters(99999)
-- f.Text:SetFontObject(GameFontNormal)
-- f.Text:SetAutoFocus(false)
-- f.Text:SetScript("OnEscapePressed", function(self) self:ClearFocus() end) 
-- f.SF:SetScrollChild(f.Text)

-- f.Text:SetText("bfs fasjdf dsaf adsj fasjkf bsafjsaf bjs fasjkf bjsf basf badsjkf dsakfbhaskf asjkf asjkf skaf sak fsk fdsaf kkl l fjds rewpwfrjpo foewf jjfwe fpwfevzv mcvn  qo fnaw[ffgngnerf we foiweffgorenfg[f fewfn sdskfn asdf sp ffq[ofkgbhp    i regp nIF N 'OFGRE  NG;G KG IGN ;EFPIREG REG  ZG;  ergregp esg gg-ero  rdf45540 4y   q8wffn ")

