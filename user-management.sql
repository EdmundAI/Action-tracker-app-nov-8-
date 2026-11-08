-- Reference copy of what was applied to the Supabase project for user management.
-- Already applied. Do not run again on the same project.

create table public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  username text not null unique check (username ~ '^[a-z0-9._-]{2,30}$'),
  role text not null default 'member' check (role in ('admin','member')),
  created_at timestamptz not null default now()
);
alter table public.profiles enable row level security;
create policy "signed in users can read profiles"
  on public.profiles for select to authenticated using (true);

alter table public.actions
  add column created_by uuid references auth.users(id) on delete set null default auth.uid();

-- _create_user inserts into auth.users, auth.identities and public.profiles.
-- admin_create_user is the version the app calls, restricted to admins.
-- (Function bodies: see the Supabase dashboard under Database > Functions.)

-- Seed users, password "password" (change these after first sign in):
-- select public._create_user('priya',  'password', 'admin');
-- select public._create_user('dan',    'password', 'member');
-- select public._create_user('marcus', 'password', 'member');

-- Lock the actions table to signed in users (replaces the open anon policies):
-- drop policy "anon read"   on public.actions;  (and insert, update, delete)
-- create policy "signed in read"   on public.actions for select to authenticated using (true);
-- create policy "signed in insert" on public.actions for insert to authenticated with check (true);
-- create policy "signed in update" on public.actions for update to authenticated using (true) with check (true);
-- create policy "signed in delete" on public.actions for delete to authenticated using (true);
