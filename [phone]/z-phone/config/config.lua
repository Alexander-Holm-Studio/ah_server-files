Config = {}

Config.Debug = false
Config.Core = "ESX" -- QB, ESX eller QBX
Config.OpenPhone = 'F1'
Config.RepeatTimeout = 3000
Config.CallRepeats = 5

Config.App = {
    InetMax = {
        Name = "InetMax",
        IsUseInetMax = true,
        TopupRate = {
            InKB = 1000000, -- 1 GB
            Price = 100
        },
        InetMaxUsage = {
            -- I KB
            MessageSend = math.random(10000, 15000),
            LoopsPostTweet = math.random(50000, 150000),
            LoopsPostComment = math.random(10000, 30000),
            AdsPost = math.random(50000, 150000),
            PhoneCall = math.random(300000, 800000),
            ServicesMessage = math.random(5000, 10000),
            BankCheckTransferReceiver = math.random(5000, 15000),
            BankTransfer = math.random(100000, 200000),
        },
        SocietySeller = "government"
    },
    Phone = {
        Name = "Telefon"
    },
    Ads = {
        Name = "Annoncer"
    },
    Loops = {
        Name = "Loops"
    },
    Services = {
        Name = "Tjenester"
    },
    Message = {
        Name = "Beskeder"
    },
    Wallet = {
        Name = "Pung"
    },
}

Config.MsgNotEnoughInternetData = "Du har ikke nok mobildata!"
Config.MsgSignalZone = "Intet signal"

Config.Signal = {
    IsUse = false,
    DefaultSignalZones = "FULL_SIGNAL",
    Zones = {
        ["FULL_SIGNAL"] = {
            CenterCoords = vec3(49.58, -1560.84, 29.38),
            Radius = 3,
            ChanceSignal = 1
        },
        ["0_SIGNAL_1"] = {
            CenterCoords = vec3(47.71, -1536.74, 29.29),
            Radius = 3,
            ChanceSignal = 0.0
        },
        ["1_SIGNAL_1"] = {
            CenterCoords = vec3(42.48, -1543.57, 29.27),
            Radius = 3,
            ChanceSignal = 0.25
        },
        ["2_SIGNAL_1"] = {
            CenterCoords = vec3(37.75, -1548.99, 29.28),
            Radius = 3,
            ChanceSignal = 0.5
        },
        ["3_SIGNAL_1"] = {
            CenterCoords = vec3(43.09, -1555.95, 29.28),
            Radius = 3,
            ChanceSignal = 0.75
        }
    }
}

Config.Services = {
    goverment = {
        job = "goverment",
        name = "Regering",
        type = "Generel"
    },
    police = {
        job = "police",
        name = "Politi",
        type = "Generel"
    },
    ambulance = {
        job = "ambulance",
        name = "Ambulance",
        type = "Sundhed"
    },
    realestate = {
        job = "realestate",
        name = "Ejendomsmægler",
        type = "Ejendomme"
    },
    taxi = {
        job = "taxi",
        name = "Taxi",
        type = "Transport"
    },
    burgershot = {
        job = "burgershot",
        name = "Burger Shot",
        type = "Mad"
    },
    kfc = {
        job = "kfc",
        name = "KFC",
        type = "Mad"
    },
}
