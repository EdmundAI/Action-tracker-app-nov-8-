# Action Tracker

A meeting action tracker. Add actions with an owner and due date, group them by owner, tick them off, and see open, done and overdue counts. Overdue actions show in red.

Data and sign in are handled by Supabase. Users are stored in Supabase Auth (`auth.users`) with a linked `profiles` table (username and role). Usernames map to `<username>@actiontracker.app` behind the scenes.

## Users

- Sign in with a username and password. Use Sign out to end the session.
- Admins see a Manage users button to add users and set their initial password.
- Starting users: priya (admin), dan and marcus, all with the initial password `password`. Change these before real use.

## Deploy on Vercel

1. Import this repository at vercel.com/new.
2. Framework Preset: Other. Leave the build command and output directory empty.
3. Click Deploy.

## Notes

- The Supabase URL and publishable key are at the top of the script in `index.html`. The publishable key is designed to be public. Access is controlled by sign in and row level security.
- `setup.sql` and `user-management.sql` are reference copies of what was already applied. Do not run them again on this project.
