-- Allow anyone to delete valentine messages
CREATE POLICY "Anyone can delete valentine messages"
ON public.valentine_messages
FOR DELETE
USING (true);