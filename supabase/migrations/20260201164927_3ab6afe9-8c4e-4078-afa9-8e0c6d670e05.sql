-- Add unique constraint on session_id for upsert to work
ALTER TABLE public.valentine_responses ADD CONSTRAINT valentine_responses_session_id_key UNIQUE (session_id);