local E, L, _, P, _ = unpack(ElvUI)
if not E then return end
local ACH = E.Libs.ACH

local SUPPORTERS = {
	E:TextGradient('Eltreum', 0.50, 0.70, 1, 0.67, 0.95, 1),
	'Jiberish',
    '|cFFb8bb26Thurin|r',
	'Tsxy',
}

local function SortList(a, b)
	return E:StripString(a) < E:StripString(b)
end
sort(SUPPORTERS, SortList)
local SUPPORTER_STRING = table.concat(SUPPORTERS, '|n')
SUPPORTER_STRING = '|cff00FF98Repooc Reforged|r |cffA330C9Community|r|n'..SUPPORTER_STRING

--* Repooc Reforged Plugin section
local rrp = E.Options.args.rrp
if not rrp then
    rrp = ACH:Group('|cff00FF98Repooc Reforged|r |cffA330C9Plugins|r', nil, 6)
    E.Options.args.rrp = rrp

    --* Healer Only Power Section
    local RRPHelp = ACH:Group(L["Help"], nil, 99)
    rrp.args.help = RRPHelp

    local Support = ACH:Group(L["Support"], nil, 1)
    RRPHelp.args.support = Support
    Support.inline = true
    Support.args.wago = ACH:Execute(L["AddOns on Wago"], nil, 1, function() E:StaticPopup_Show('ELVUI_EDITBOX', nil, nil, 'https://addons.wago.io/user/Repooc') end, nil, nil, 140)
    Support.args.curse = ACH:Execute(L["AddOns on Curseforge"], nil, 1, function() E:StaticPopup_Show('ELVUI_EDITBOX', nil, nil, 'https://legacy.curseforge.com/members/repooc/projects') end, nil, nil, 140)
    Support.args.discord = ACH:Execute(L["Discord"], nil, 3, function() E:StaticPopup_Show('ELVUI_EDITBOX', nil, nil, 'https://repoocreforged.dev/discord') end, nil, nil, 140)

    local Supporters = ACH:Group(L["Supporters"], nil, 8)
    RRPHelp.args.supporters = Supporters
    Supporters.inline = true
    Supporters.args.string = ACH:Description(SUPPORTER_STRING, 1, 'medium')

    rrp.args.hop = RRPHelp
end
