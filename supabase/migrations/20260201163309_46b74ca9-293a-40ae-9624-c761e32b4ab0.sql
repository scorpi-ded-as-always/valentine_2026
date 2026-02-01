-- Create storage bucket for valentine media uploads
INSERT INTO storage.buckets (id, name, public) 
VALUES ('valentine-media', 'valentine-media', true);

-- Allow anyone to upload files (since this is a fun valentine app without auth)
CREATE POLICY "Anyone can upload valentine media"
ON storage.objects
FOR INSERT
WITH CHECK (bucket_id = 'valentine-media');

-- Allow anyone to view files
CREATE POLICY "Anyone can view valentine media"
ON storage.objects
FOR SELECT
USING (bucket_id = 'valentine-media');

-- Create table to store messages with media references
CREATE TABLE public.valentine_messages (
  id UUID NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  message TEXT,
  media_url TEXT,
  media_type TEXT CHECK (media_type IN ('video', 'photo')),
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
);

-- Enable RLS but allow public access for this fun app
ALTER TABLE public.valentine_messages ENABLE ROW LEVEL SECURITY;

-- Allow anyone to insert messages
CREATE POLICY "Anyone can create valentine messages"
ON public.valentine_messages
FOR INSERT
WITH CHECK (true);

-- Allow anyone to view messages
CREATE POLICY "Anyone can view valentine messages"
ON public.valentine_messages
FOR SELECT
USING (true);