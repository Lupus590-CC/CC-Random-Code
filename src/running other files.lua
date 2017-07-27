local s, err = loadfile( FILENAME )
if not s then
    error( err, 0 )
end
s( unpack( args ) )

-- similar to:
-- assert( loadfile( FILENAME ) )( unpack( args ) )
