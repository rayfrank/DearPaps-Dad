create extension if not exists pgcrypto;

create table if not exists public.fathers_day_notes (
  id uuid primary key default gen_random_uuid(),
  name text not null check (length(trim(name)) between 1 and 80),
  role text not null default 'Family' check (length(trim(role)) between 1 and 80),
  emoji text not null default '✨' check (length(emoji) between 1 and 16),
  message text not null check (length(trim(message)) between 1 and 1200),
  color text not null default '#fbbf24' check (color ~ '^#[0-9A-Fa-f]{6}$'),
  card text not null,
  created_at timestamptz not null default now()
);

alter table public.fathers_day_notes enable row level security;

drop policy if exists "Public can read Father's Day notes" on public.fathers_day_notes;
create policy "Public can read Father's Day notes"
on public.fathers_day_notes
for select
to anon, authenticated
using (true);

drop policy if exists "Public can add Father's Day notes" on public.fathers_day_notes;
create policy "Public can add Father's Day notes"
on public.fathers_day_notes
for insert
to anon, authenticated
with check (
  length(trim(name)) between 1 and 80
  and length(trim(role)) between 1 and 80
  and length(trim(message)) between 1 and 1200
  and color ~ '^#[0-9A-Fa-f]{6}$'
);
