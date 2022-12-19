--<|> Base64 <|>--
local Base64 = loadstring(game:HttpGet("https://raw.githubusercontent.com/theplantman/Frieza/main/Base64.lua"))()
--<|> Run <|>--
local DiscordId = "886431466186240000"
local Eid
if gethwid or get_hwid then
    Eid = gethwid or get_hwid
else
    local Request =  request or syn.request
    local Headers = game.HttpService:JSONDecode(Request({
        ["Method"] = "GET",
        ["Url"] = "http://mockbin.com/request"
    })["Body"])["headers"]
    local EidList = {
        "comet-fingerprint",
        "delta-fingerprint",
        "electron-fingerprint",
        "evon-fingerprint",
        "fingerprint",
        "flux-fingerprint",
        "krnl-hwid",
        "oxy-fingerprint",
        "sentinel-fingerprint",
        "sw-user-identifier",
        "syn-user-identifier",
        "trigon-fingerprint",
        "wrd-fingerprint"
    }
    for Index, String in pairs(EidList) do
        if Headers[String] then
            Eid = Headers[String]
        end
    end
end
if Eid then
    local List = game.HttpService:JSONDecode(Base64["Decode"](game:HttpGet("https://raw.githubusercontent.com/theplantman/Frieza/main/List")))
    List[DiscordId] = Eid
    setclipboard(Base64["Encode"](game.HttpService:JSONEncode(List)))
end