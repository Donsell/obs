CREATE TABLE `bodies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `body_id` text COLLATE utf8_unicode_ci,
  `alt_id` text COLLATE utf8_unicode_ci,
  `body_type_id` int(11) DEFAULT NULL,
  `constellation_id` int(11) DEFAULT NULL,
  `right_ascension` time DEFAULT NULL,
  `declination` float DEFAULT NULL,
  `magnitude` float DEFAULT NULL,
  `surface_brightness` float DEFAULT NULL,
  `uranometria` int(11) DEFAULT NULL,
  `sky_atlas_2000` int(11) DEFAULT NULL,
  `pocket_sky_atlas` int(11) DEFAULT NULL,
  `size_max` float DEFAULT NULL,
  `size_min` float DEFAULT NULL,
  `position_angle` int(11) DEFAULT NULL,
  `class_id` text COLLATE utf8_unicode_ci,
  `number_of_stars` int(11) DEFAULT NULL,
  `brightest_star_mag` float DEFAULT NULL,
  `ngc_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10343 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `body_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `abbr` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `constellations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `abbr` text COLLATE utf8_unicode_ci,
  `constellation` text COLLATE utf8_unicode_ci,
  `genitive` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `observations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `obs_date` date DEFAULT NULL,
  `obs_time` time DEFAULT NULL,
  `seeing` int(11) DEFAULT NULL,
  `transparency` int(11) DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `session_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_observations_on_session_id` (`session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `begin_date` date DEFAULT NULL,
  `begin_time` time DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seeing` int(11) DEFAULT NULL,
  `transparency` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO schema_migrations (version) VALUES ('20120304195459');

INSERT INTO schema_migrations (version) VALUES ('20120309223858');

INSERT INTO schema_migrations (version) VALUES ('20120311163128');

INSERT INTO schema_migrations (version) VALUES ('20120311172637');

INSERT INTO schema_migrations (version) VALUES ('20120311182618');