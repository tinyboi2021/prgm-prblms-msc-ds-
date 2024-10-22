#include<stdio.h>
#include<stdlib.h>

void heapify(int arr[],int n,int i){
	int largest=i;
	
	int l=(largest*2)+1;
	int r=(largest*2)+2;
	
	if(l<n&&arr[l]>arr[largest])
		largest=l;
	if(r<n&&arr[r]>arr[largest])
		largest=r;
		
	if(largest!=i){
		int temp=arr[largest];
		arr[largest]=arr[i];
		arr[i]=temp;
		
		heapify(arr,n,largest);
	}
}
void heapSort(int arr[],int n){
	
	for(int i=n/2-1;i>=0;i--){
		heapify(arr,n,i);
	}
	
	for(int i=n-1;i>0;i--){
		int temp=arr[0];
		arr[0]=arr[i];
		arr[i]=temp;
		
		heapify(arr,i,0);
	}
}

void printArray(int arr[], int n) {
    for (int i = 0; i < n; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");
}


int main(){
	int arr[20];
	int n=0,choice;
	
	while(1){
		
			printf("\nenter choices to select operation\n");
			printf(" 1 to insert");
			printf(" 0 to exit");
			scanf("%d",&choice);
			
			switch(choice){
				case 0:
					printf("\n program exited");
					exit(0);
					
				case 1:
					printf("enter element to insert");
					n++;
					scanf("%d",&arr[n-1]);
					heapSort(arr,n);
					
					break;
					
				default:
					printf("invalid input");
					break;
					
			}
		printf("Sorted array is \n");
		printArray(arr, n);
		
		
	}
	return 0;	
}
