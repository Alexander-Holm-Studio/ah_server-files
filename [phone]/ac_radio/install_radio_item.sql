-- ============================================================================
-- AC Radio Item Installation for ESX
-- ============================================================================
-- This SQL file adds the radio item to your ESX database
-- Run this in your MySQL/MariaDB database if the radio item doesn't exist
-- ============================================================================

-- Add radio item to items table (if using ox_inventory with database items)
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) 
VALUES ('radio', 'Radio', 100, 0, 1)
ON DUPLICATE KEY UPDATE 
    `label` = 'Radio',
    `weight` = 100;

-- Alternative: If you're using the legacy esx items table
-- INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`) 
-- VALUES ('radio', 'Radio', 1, 0, 1)
-- ON DUPLICATE KEY UPDATE 
--     `label` = 'Radio',
--     `limit` = 1;

-- Optional: Add radio to a shop (24/7 stores)
-- Uncomment if you want players to buy radios from shops
-- INSERT INTO `shops` (`store`, `item`, `price`)
-- VALUES ('TwentyFourSeven', 'radio', 250)
-- ON DUPLICATE KEY UPDATE `price` = 250;

-- Optional: Give all existing players a radio (run once)
-- Uncomment if you want to give everyone a free radio
-- INSERT INTO `ox_inventory` (`owner`, `name`, `data`, `slot`)
-- SELECT identifier, 'radio', '{}', 1
-- FROM users
-- WHERE NOT EXISTS (
--     SELECT 1 FROM ox_inventory 
--     WHERE owner = users.identifier AND name = 'radio'
-- );
