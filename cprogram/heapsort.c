#include <stdio.h>

void heapsort(int *arr,int n){

	int i,temp,parent,right,left,max=(n-1);
	while(max>0){
		parent=0;
		while(parent<=max){
			if(((parent*2)+1) > max)
					break;
			
			left=(parent*2)+1;
			printf("left = %d \n",left);
			parent++;
		}
		printf("parent is %d \n",--parent);
	
	
		if(((parent*2)+2) <= max)
			right=(parent*2)+2;
		else
			right=-1;

		if(arr[left]<arr[right]){
			if(arr[left]<arr[parent]){
				temp=arr[parent];
				arr[parent]=arr[left];
				arr[left]=temp;
			}
		}else{
			if(arr[right]<arr[parent]){
				temp=arr[parent];
				arr[parent]=arr[right];
				arr[right]=temp;
			}
		}
		
		temp=arr[0];
		arr[0]=arr[max];
		arr[max]=temp;
						
		printf("max --\n");
		max--;
				
	}

	printf("\n the heapsorted result \n");
	for(i=0;i<n;i++){
		printf("%d ",arr[i]);
	}
}


void main(){
	int arr[10]={9,4,3,8,10,2,5},n=7;
	/*printf("enter a number of elements inside the array");
	scanf("%d",&n);

	printf("enter the elements inside the array");

	for(int i=0;i<n;i++){
		scanf("%d",&arr[i]);

	}*/
	heapsort(arr,n);
}
	
	