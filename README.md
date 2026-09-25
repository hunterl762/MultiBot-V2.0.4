# MultiBot V3 — discord.js v14

This update replaces the old discord.js v11 runtime with a modern **discord.js v14** entrypoint while keeping the legacy folders in the repository for reference.

## Added

- Slash commands with automatic registration: `/ping`, `/help`, `/ban`, `/kick`, `/purge`, `/ticket`, `/verification-panel`, `/twitch list`, and owner-only `/broadcast`.
- Prefix fallback for core commands; prefix is configurable per guild.
- SQL-backed ticket system with private channels, buttons, ticket records, and HTML transcripts.
- Member verification with an admin dashboard toggle, verified/unverified roles, join prompts, and a verification button.
- Owner broadcasts to all bot servers, with a preferred per-server broadcast channel and safe fallback.
- Configurable Twitch stream announcements for specified Twitch usernames, channels, and optional mention roles.
- Discord OAuth2 web panel limited to server owners/administrators.
- MySQL/MariaDB persistence for guild settings, tickets, Twitch state, and broadcast logs.

## Requirements

- Node.js 18+
- MySQL 8+ or MariaDB 10.5+
- Discord bot/application
- Twitch application credentials if Twitch alerts are enabled

Enable the **Server Members Intent**. Enable **Message Content Intent** only if you want the optional prefix-command fallback.

## Install

1. Copy `.env.example` to `.env`.
2. Create the database in `DATABASE_NAME` and grant the configured SQL user access. Tables auto-create at startup; `schema.sql` is also included.
3. Add `DISCORD_REDIRECT_URI` to the Discord Developer Portal OAuth2 redirects.
4. Invite the bot with `bot` + `applications.commands` scopes and the permissions required by the features you enable.
5. Run:

```bash
npm install
npm start
```

For fast slash-command testing, set `DEV_GUILD_ID`. Remove it for global command registration.

## Configuration

See `.env.example` for Discord, SQL, dashboard session, and Twitch variables.

Open the dashboard at the configured host/port (default port 3000), sign in with Discord, select a server, and configure:

- verification toggle, verified role, optional unverified role, fallback verification channel;
- ticket category and transcript channel;
- broadcast channel;
- Twitch alert toggle, channel, optional role mention, and Twitch usernames;
- prefix fallback.

Keep `.env` private. In production, use HTTPS and set `COOKIE_SECURE=true`.
