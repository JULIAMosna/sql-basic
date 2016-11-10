GRANT CONNECT ON DATABASE devstudy TO readonly;
GRANT USAGE ON SCHEMA public TO readonly;
GRANT SELECT ON account TO readonly;

REVOKE CONNECT ON DATABASE devstudy FROM readonly;
REVOKE USAGE ON SCHEMA public FROM readonly;
REVOKE SELECT ON account FROM readonly;

DROP ROLE readonly;