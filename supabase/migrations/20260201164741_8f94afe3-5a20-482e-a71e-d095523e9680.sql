-- Create table for storing valentine responses/selections
CREATE TABLE public.valentine_responses (
  id UUID NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  session_id TEXT NOT NULL,
  selected_date DATE,
  food_selections TEXT[],
  other_food TEXT,
  dessert_selections TEXT[],
  activity_selections TEXT[],
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
);

-- Enable RLS
ALTER TABLE public.valentine_responses ENABLE ROW LEVEL SECURITY;

-- Allow anyone to insert responses
CREATE POLICY "Anyone can create valentine responses"
ON public.valentine_responses
FOR INSERT
WITH CHECK (true);

-- Allow anyone to view responses
CREATE POLICY "Anyone can view valentine responses"
ON public.valentine_responses
FOR SELECT
USING (true);

-- Allow anyone to update responses (for adding selections during flow)
CREATE POLICY "Anyone can update valentine responses"
ON public.valentine_responses
FOR UPDATE
USING (true);