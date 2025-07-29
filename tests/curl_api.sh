PORT=$1

hex_toto=$(curl http://localhost:$PORT/encode/Héllo)

if [ "$hex_toto" != "\"48c3a96c6c6f\"" ]; then
	echo "Error: Expected '48c3a96c6c6f', got '$hex_toto'"
	exit 1
fi

toto=$(curl http://localhost:$PORT/decode/48c3a96c6c6f)

if [ "$toto" != "\"Héllo\"" ]; then
	echo "Error: Expected 'Héllo', got '$toto'"
	exit 1
fi
