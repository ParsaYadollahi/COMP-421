ALTER TABLE batch
ADD CONSTRAINT expiration CHECK (manudate < expiradate);
