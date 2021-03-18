CONNECT TO 'CS421';
ALTER TABLE batch
ADD CONSTRAINT expiration CHECK (manudate < expiradate);
