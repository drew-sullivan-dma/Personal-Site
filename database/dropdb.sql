SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = 'Site_v.2';

DROP DATABASE Site_v.2;

DROP USER drew;