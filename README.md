# Action Tracker

A meeting action tracker. Add actions with an owner and due date, group them by owner, tick them off, and see open, done and overdue counts. Overdue actions show in red. Data is stored in Supabase so the whole team sees the same list.

## Setup

1. The `actions` table, access policies and mock data have already been created in the Supabase project. `setup.sql` is kept for reference only. Do not run it again on this project, or the mock rows will be duplicated.
2. The project URL and publishable key are set at the top of the script in `index.html`.

## Deploy on Vercel

1. Import this repository at vercel.com/new.
2. Framework Preset: Other. Leave the build command and output directory empty.
3. Click Deploy.

## Security note

`setup.sql` allows anyone with the app URL to read and edit actions (no login). Add Supabase Auth and tighter policies before using real or sensitive data.
