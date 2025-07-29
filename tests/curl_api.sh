PORT=$1

hex_toto=$(curl http://localhost:$PORT/encode/toto)

if [ "$hex_toto" != "\"746f746f\"" ]; then
	echo "Error: Expected '746f746f', got '$hex_toto'"
	exit 1
fi

toto=$(curl http://localhost:$PORT/decode/746f746f)

if [ "$toto" != "\"toto\"" ]; then
	echo "Error: Expected 'toto', got '$toto'"
	exit 1
fi
