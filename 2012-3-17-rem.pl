$name ="three-color-brace";

#
#使い方。１行目の$nameに商品IDを入れます。
#それでこのrem.plファイルを変更したいフォルダに入れて
#実行すると連番のjpgファイルが出来上がります。
#ファイル名を１個づつ変更する手間を削減できます。
#
#更新履歴
#Version1.1
#実行したフォルダとsumnailフォルダ内を一度に出来るようにした
#
#Version1.0
#実行したフォルダ内だけ変換


opendir(DIR, ".");
opendir(DIR2, "./sumnail");
@file  = readdir(DIR);
@file2 = readdir(DIR2);
closedir(DIR);
closedir(DIR2);

$i=1;

foreach (@file){
    print "$_\n";
    if($_ eq "rem.pl"){ next; }
    if($_ eq "."){ next; }
    if($_ eq ".."){ next; }
    if($_ eq "sumnail"){ next; }
    rename "$_" , "$name-$i.jpg";
    $i++;
}

$i=1;

foreach (@file2){
    print "$_\n";
    if($_ eq "."){ next; }
    if($_ eq ".."){ next; }
    rename "./sumnail/$_" , "./sumnail/$name-$i.jpg";
    $i++;
}