# Shared Notes Database

This site is static, so GitHub Pages can host the page but cannot store notes by itself. The page is ready to sync notes through Supabase.

1. Create a Supabase project.
2. Open the Supabase SQL editor and run `supabase-schema.sql`.
3. Open `database-config.js`.
4. Fill in `supabaseUrl` and the public `supabaseAnonKey`.
5. Commit and push `database-config.js`.

Use only the public anon key. Never put a Supabase `service_role` key in a browser file.

After the database is connected, open the site once on any phone/browser that already has old local notes. The page will keep those notes visible and try to upload them into Supabase so other devices can see them too.
