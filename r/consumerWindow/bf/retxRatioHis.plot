set boxwidth 0.5 relative

set style histogram clustered gap 1.5 title offset character 0, 0, 0
set datafile missing '-'
set style data histograms 
set xlabel "Type"
#set terminal windows
#下面这行语句就是指示柱状图中的每一条的数据是来自'16newmsgsdata(trace).txt'文件的哪一列.
#eg:u 3 ti col title "Cluster Search" 就是表示title为Cluster Search的'柱子'的数据来自data
#文件的第三列.
plot 'textRatio.txt' using 2:xtic(1) fs pattern 1 title "中文"

#col title "Cluster Search", '' u 4 ti col title "Simple Search"
set terminal png
set output "./graphs/rextRatio.png"
replot