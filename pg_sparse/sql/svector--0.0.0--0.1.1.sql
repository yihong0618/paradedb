-- complain if script is sourced in psql, rather than via CREATE EXTENSION
\echo Use "ALTER EXTENSION svector UPDATE TO '0.1.1'" to load this file. \quit

CREATE FUNCTION svectorrecv(internal, oid, integer) RETURNS svector
	AS 'MODULE_PATHNAME' LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION svectorsend(svector) RETURNS bytea
	AS 'MODULE_PATHNAME' LANGUAGE C IMMUTABLE STRICT;

ALTER TYPE svector SET ( RECEIVE = svectorrecv, SEND = svectorsend );

-- functions

ALTER FUNCTION svectorin(cstring, oid, integer) PARALLEL SAFE;
ALTER FUNCTION svectorout(svector) PARALLEL SAFE;
ALTER FUNCTION svectortypmod_in(cstring[]) PARALLEL SAFE;
ALTER FUNCTION svectorrecv(internal, oid, integer) PARALLEL SAFE;
ALTER FUNCTION svectorsend(svector) PARALLEL SAFE;
ALTER FUNCTION l2_distance(svector, svector) PARALLEL SAFE;
ALTER FUNCTION inner_product(svector, svector) PARALLEL SAFE;
ALTER FUNCTION cosine_distance(svector, svector) PARALLEL SAFE;
ALTER FUNCTION svector_dims(svector) PARALLEL SAFE;
ALTER FUNCTION svectorn_elem(svector) PARALLEL SAFE;
ALTER FUNCTION svector_norm(svector) PARALLEL SAFE;
ALTER FUNCTION svector_add(svector, svector) PARALLEL SAFE;
ALTER FUNCTION svector_sub(svector, svector) PARALLEL SAFE;
ALTER FUNCTION svector_lt(svector, svector) PARALLEL SAFE;
ALTER FUNCTION svector_le(svector, svector) PARALLEL SAFE;
ALTER FUNCTION svector_eq(svector, svector) PARALLEL SAFE;
ALTER FUNCTION svector_ne(svector, svector) PARALLEL SAFE;
ALTER FUNCTION svector_ge(svector, svector) PARALLEL SAFE;
ALTER FUNCTION svector_gt(svector, svector) PARALLEL SAFE;
ALTER FUNCTION svector_cmp(svector, svector) PARALLEL SAFE;
ALTER FUNCTION svectorl2_squared_distance(svector, svector) PARALLEL SAFE;
ALTER FUNCTION svector_negative_inner_product(svector, svector) PARALLEL SAFE;
ALTER FUNCTION svector_spherical_distance(svector, svector) PARALLEL SAFE;
ALTER FUNCTION svector(svector, integer, boolean) PARALLEL SAFE;
ALTER FUNCTION array_to_svector(integer[], integer, boolean) PARALLEL SAFE;
ALTER FUNCTION array_to_svector(real[], integer, boolean) PARALLEL SAFE;
ALTER FUNCTION array_to_svector(double precision[], integer, boolean) PARALLEL SAFE;
