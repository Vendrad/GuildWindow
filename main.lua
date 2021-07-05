function GuildWindow_OnLoad()
  SLASH_GUILDWINDOW1= "/gw";
  SlashCmdList["GUILDWINDOW"] = GuildWindow_SlashCommand;
end

function makeRow(player)
  return "\"" .. table.concat(player, "\",\"") .. "\"";
end

function aa(a)
  return "\"" .. a .. "\",";
end

function bb(a)
  return "\"" .. a .. "\"\n";
end

function GuildWindow_SlashCommand(msg)
  SetGuildRosterShowOffline(true);

  local i = 1;
  local numMembers = GetNumGuildMembers();
  local players = {};

  DEFAULT_CHAT_FRAME:AddMessage("members: " .. numMembers);

  while i <= numMembers do
    local name, rankName, rankIndex, level, classDisplayName, zone, publicNote, officerNote = GetGuildRosterInfo(i);
    local yearsOffline, monthsOffline, daysOffline, hoursOffline = GetGuildRosterLastOnline(i);

    players[i] = makeRow({
      name:gsub("-NethergardeKeep", ""),
      rankName,
      rankIndex,
      level,
      classDisplayName,
      zone and zone or "",
      publicNote,
      officerNote,
      yearsOffline,
      monthsOffline,
      daysOffline,
      hoursOffline
    });

    i = i + 1;
  end

  editbox(table.concat(players, "\n"));
end

function editbox(text)
  local f = CreateFrame("Button", "FizzleUIGrabTextFrame", UIParent)

  -- f:SetBackdrop({
  --   bgFile = "Interface/Tooltips/UI-Tooltip-Background",
  --   tile = true,
  --   tileSize = 16,
  --   insets = {
  --     left = 0,
  --     right = 0,
  --     top = 0, 
  --     bottom = 0
  --   },
  -- })
  -- f:SetBackdropColor(0, 0, 0)
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



-- for iteration with key/value
-- local row = "";
-- for i, value = ipairs(player) do
--   row = row .. player;
-- end
