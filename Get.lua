--<|> Base64 <|>--
local Base64 = loadstring(game:HttpGet("https://raw.githubusercontent.com/theplantman/Frieza/main/Base64.lua"))()
--<|> Run <|>--
local Eid
if gethwid or get_hwid then
    Eid = gethwid or get_hwid
else
    local Request = http_request  or request or syn.request
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
    local Data = game.HttpService:JSONDecode(game:HttpGet("https://Frying-Pan.theplantman.repl.co?eid=" .. Base64["Encode"](Eid) .. "&type=gff"))
    
end
