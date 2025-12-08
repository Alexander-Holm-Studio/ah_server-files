-- Table for tracking which vehicles have radio installed
CREATE TABLE IF NOT EXISTS `radiocar_owned` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spz` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `spz` (`spz`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table for storing saved radio stations for each vehicle
CREATE TABLE IF NOT EXISTS `radiocar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `url` text NOT NULL,
  `spz` varchar(50) NOT NULL,
  `index_music` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `spz_index` (`spz`, `index_music`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
