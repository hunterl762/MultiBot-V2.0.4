-- Optional manual schema. The application also creates these tables automatically at startup.
CREATE TABLE IF NOT EXISTS guild_settings (
  guild_id VARCHAR(32) PRIMARY KEY,
  prefix VARCHAR(10) NOT NULL DEFAULT '!',
  verification_enabled TINYINT(1) NOT NULL DEFAULT 0,
  verified_role_id VARCHAR(32) NULL,
  unverified_role_id VARCHAR(32) NULL,
  verification_channel_id VARCHAR(32) NULL,
  ticket_category_id VARCHAR(32) NULL,
  ticket_log_channel_id VARCHAR(32) NULL,
  broadcast_channel_id VARCHAR(32) NULL,
  twitch_enabled TINYINT(1) NOT NULL DEFAULT 0,
  twitch_channel_id VARCHAR(32) NULL,
  twitch_role_id VARCHAR(32) NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS twitch_streamers (
  guild_id VARCHAR(32) NOT NULL,
  twitch_login VARCHAR(64) NOT NULL,
  last_stream_id VARCHAR(64) NULL,
  PRIMARY KEY (guild_id, twitch_login),
  CONSTRAINT fk_twitch_guild FOREIGN KEY (guild_id) REFERENCES guild_settings(guild_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS tickets (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  guild_id VARCHAR(32) NOT NULL,
  channel_id VARCHAR(32) NOT NULL UNIQUE,
  opener_id VARCHAR(32) NOT NULL,
  closed_by VARCHAR(32) NULL,
  status ENUM('open','closed') NOT NULL DEFAULT 'open',
  transcript_html LONGTEXT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  closed_at TIMESTAMP NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS broadcast_logs (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  owner_id VARCHAR(32) NOT NULL,
  message TEXT NOT NULL,
  sent_count INT NOT NULL DEFAULT 0,
  failed_count INT NOT NULL DEFAULT 0,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
