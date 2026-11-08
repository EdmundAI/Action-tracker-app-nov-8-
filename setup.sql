-- Action Tracker: run once in Supabase Dashboard > SQL Editor
create table if not exists public.actions (
  id uuid primary key default gen_random_uuid(),
  text text not null,
  owner text not null,
  due date not null,
  done boolean not null default false,
  created_at timestamptz not null default now()
);

alter table public.actions enable row level security;

-- Open access for the shared team tracker (no login). Anyone with the app URL can read and edit.
drop policy if exists "anon read"   on public.actions;
drop policy if exists "anon insert" on public.actions;
drop policy if exists "anon update" on public.actions;
drop policy if exists "anon delete" on public.actions;
create policy "anon read"   on public.actions for select to anon using (true);
create policy "anon insert" on public.actions for insert to anon with check (true);
create policy "anon update" on public.actions for update to anon using (true) with check (true);
create policy "anon delete" on public.actions for delete to anon using (true);

-- Mock data (dates are relative to today so some show as overdue)
insert into public.actions (text, owner, due, done) values
  ('Send revised quote to client',          'Amy',   current_date - 3,  false),
  ('Book venue for Q1 offsite',             'Amy',   current_date + 10, false),
  ('Share meeting minutes with the team',   'Amy',   current_date - 6,  true),
  ('Update the sales deck with new pricing','Ben',   current_date + 2,  false),
  ('Confirm supplier delivery dates',       'Ben',   current_date - 1,  false),
  ('Review contract draft with legal',      'Chloe', current_date + 5,  false),
  ('Close out last quarter expense claims', 'Chloe', current_date - 8,  true),
  ('Set up weekly stock count schedule',    'Daniel',current_date + 14, false),
  ('Fix POS receipt printer at Store 3',    'Daniel',current_date - 2,  false);
