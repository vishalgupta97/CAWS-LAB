app=cache-code

gcc -O0 ${app}.c -o ${app}

mkdir -p traces

for((i=12;i<=23;i++))
do
echo $app $i
pin -ifeellucky -t ChampSim/tracer/obj-intel64/champsim_tracer.so -s 10000000 -t 2000000 -o ${app}-${i}.trace -- ./${app} ${i}
gzip ${app}-${i}.trace
mv ${app}-${i}.trace.gz traces/
done

rm -f ${app}

