set -euo pipefail
BIN=$1; MODE=$2; N=$3; NAME=${4:-flame}

if [ ! -d FlameGraph ]; then
  git clone --depth 1 https://github.com/brendangregg/FlameGraph.git
fi

sudo perf record -F 4999 -g -o "perf_$NAME.data" -- "$BIN" "$MODE" "$N"
sudo perf script -i "perf_$NAME.data" > "out_$NAME.perf"
./FlameGraph/stackcollapse-perf.pl "out_$NAME.perf" > "out_$NAME.folded"
./FlameGraph/flamegraph.pl --title "$NAME" "out_$NAME.folded" > "$NAME.svg"
echo "Готово"
