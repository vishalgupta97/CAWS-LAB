L2P=no
./build_champsim.sh bimodal no ${L2P} no no lru 1 

mkdir -p output

for((i=12;i<=23;i++))
do
bin/bimodal-no-${L2P}-no-no-lru-1core -warmup_instructions 1000000 -simulation_instructions 1000000 -traces ../traces/cache-code-${i}.trace.gz &> output/cache-code-${i}.txt
ipc=`grep -nri "CPU 0 cumulative IPC:" output/cache-code-${i}.txt | awk '{print $5}'`
echo "2^${i} => ${ipc}"
done

