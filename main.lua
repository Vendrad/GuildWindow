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

  f:SetBackdrop({
    bgFile = "Interface/Tooltips/UI-Tooltip-Background",
    tile = true,
    tileSize = 16,
    insets = {
      left = 0,
      right = 0,
      top = 0, 
      bottom = 0
    },
  })
  f:SetBackdropColor(0, 0, 0)
  f:SetPoint("CENTER")
  f:SetSize(500, 500)

  f.Text = CreateFrame("EditBox", nil, f)
  f.Text:SetPoint("TOPRIGHT", -40, -10)
  f.Text:SetPoint("BOTTOMLEFT", 10, 10)
  f.Text:SetMultiLine(true)
  f.Text:SetMaxLetters(99999)
  f.Text:SetFontObject(GameFontNormal)
  f.Text:SetText(text)
end

GuildWindow_OnLoad();
