select 'GRANT SELECT ON ' || table_schema || '.' || table_name ||' to usuarios;' 
from information_schema.tables 
where 
  table_type = 'BASE TABLE' and 
  table_schema = 'public'or table_schema = 'audit'

GRANT usage ON SCHEMA public TO usuarios;
GRANT usage ON SCHEMA audit TO usuarios;


