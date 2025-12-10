--@Author Theo
--@Version 1.0.2    
--@Github https://github.com/xodashy
--@Readme https://developer.lovense.com/docs/standard-solutions/standard-api.html#step-1-configure-the-developer-dashboard

--- Main configuration table for Sense App
--- @class Config
Config = {}

--- Lovense API configuration settings
--- @class Config.Lovense
--- @field TOKEN string Authentication token for Lovense API
--- @field KEY string Encryption key for Lovense API
--- @field IV string Initialization vector for encryption
--- @field API_URL string Base URL for Lovense API endpoints
--- @field DEFAULT_PLAYER_NAME string Default player name for Lovense API aka Company Name 
Config.Lovense = {
    TOKEN = "YOUR_TOKEN_HERE",
    KEY = "YOUR_KEY_HERE",
    IV = "YOUR_IV_HERE",
    API_URL = "YOUR_API_URL_HERE",
    DEFAULT_PLAYER_NAME = "Fivem",
}

--- Debug mode flag for development
--- @field Debug boolean Enable/disable debug logging and features
Config.Debug = true
