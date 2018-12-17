rule final:
    input:
        expand("../ERR675624/FindFungi/Processing/SplitFiles_Kraken/ERR675624.{i}", i=list(range(1, 33)))

rule kraken:
    input:
        "../ERR675624/FASTA/ERR675624.final.fna"
    output:
        "../ERR675624/FindFungi/Processing/SplitFiles_Kraken/ERR675624.{i}"
    params:
        i = "{i}"
    log:
        "../ERR675624/FindFungi/Processing/SplitFiles_Kraken/ERR675624.{i}.log"
    threads: 30
    shell: "kraken --db ~/analysis/FindFungi/Kraken_32DB/Kraken_{params.i}/ --preload --threads 30 --fasta-input {input} --output {output} 2> {log}"

