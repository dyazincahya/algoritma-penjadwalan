#include<stdio.h>
#include<string.h>
main()

{

int n, ar[100], b[100], i, j, tmp, wt[100], ta[100], time[100];

int totWT=0, totTA=0;

float AvWT, AvTA;

char name[25][25], tmpName[25];

printf("\t** Program First Come First Served **\n");

puts("");

printf("Kelompok :\n"); 
printf("	1. Nico Cendiana (1310511065),\n	2. Meilana Ayu Ismawati (1310511072)\n");
printf("	3. Fathul Jannah (1310511086),\n	4. Dwi Kartika Agustina (1310511095)\n\n");

printf("Jumlah Proses\t	= "); scanf("%d", &n);

puts("");



for(i=0; i<n; i++){

fflush(stdin);

printf("Nama Proses\t	= "); gets(name[i]);

printf("Arrival Time\t	= "); scanf("%d", &ar[i]);

printf("Burst Time\t	= "); scanf("%d", &b[i]);

puts("");

}



for(i=0; i<n; i++){

for(j=i+1; j<n; j++)

if(ar[i]>ar[j]){



strcpy(tmpName, name[i]);

strcpy(name[i], name[j]);

strcpy(name[j], tmpName);


tmp=ar[i];

ar[i]=ar[j];

ar[j]=tmp;



tmp=b[i];

b[i]=b[j];

b[j]=tmp;

}

}

time[0]=ar[0];

puts("\n\t- Tabel Proses -");

puts("==========================================");

printf("| No | Proses\t | Time Arrival\t | Burst |\n");

puts("""""""""""""""");


for (i=0; i<n; i++){

printf("| %2d | %s\t |  \t%d\t | %d\t |\n", i+1, name[i], ar[i], b[i]);

time[i+1]=time[i]+b[i]; 

wt[i]=time[i]-ar[i];

ta[i]=time[i+1]-ar[i];

totWT+=wt[i];

totTA+=ta[i];

}

puts("==========================================");

printf("\tWaiting Time\t= %d \n", totWT);

printf("\tTurn Arround Time\t= %d \n", totTA);

puts("\n\t- Tabel Waktu Proses -");

puts("==================================================");

printf("| No | Proses\t | Waiting Time\t | Turn Arround\t |\n");

puts("""""""""""""""""""");

for(i=0; i<n; i++){

printf("| %2d | %s\t |  \t%d\t | \t%d\t |\n", i+1, name[i], wt[i], ta[i]);

}

puts("==================================================");



puts("\n");

puts("\t- Diagram Gant -\n");

for(i=0; i<n; i++){

printf(" %s\t ", name[i]);

}

puts("");

for(i=0; i<n; i++){

printf("|=========");

}

printf("|\n");

for(i=0; i<=n; i++){

printf(" %d\t ", time[i]);

}


printf("(Dari Penjumlahan Burst)");

puts("\n");

AvWT=(float)totWT/n; 

AvTA=(float)totTA/n; 

printf("\tWaiting Time : %f\n", AvWT);

printf("\tTurn Arround Time : %f\n", AvTA);

}