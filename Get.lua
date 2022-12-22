--<|> Run <|>--
local Eid
if gethwid or get_hwid then
    Eid = gethwid or get_hwid
else
    local Request = http_request or request or syn.request
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
    setclipboard(Eid)
end
