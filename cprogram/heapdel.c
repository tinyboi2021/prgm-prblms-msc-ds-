#include<stdio.h>
#include<stdlib.h>

void heapify(int arr[],int n,int i){
	int largest=i;
	
	int l=(i*2)+1;
	int r=(i*2)+2;
	
	if(l<n&&arr[l]>arr[i])
		largest=l;
	if(r<n&&arr[r]>arr[i])
		largest=r;
		
	if(largest!=i){
		int temp=arr[i];
		arr[i]=arr[largest];
		arr[largest]=temp;
		
		heapify(arr,n,largest);
	}
}
// Function to insert an element into the heap
void insertHeap(int arr[], int* n, int value) {
    // Increase heap size and insert the new value at the end
    (*n)++;
    arr[*n - 1] = value;
    
    // Adjust the heap (heapify up)
    int i = *n - 1;
    while (i != 0 && arr[(i - 1) / 2] < arr[i]) {
        // Swap with parent
        int temp = arr[(i - 1) / 2];
        arr[(i - 1) / 2] = arr[i];
        arr[i] = temp;
        
        i = (i - 1) / 2;
    }
}
void deleteHeap(int arr[],int* n){
	
	arr[0]=arr[*n-1];
	
	(*n)--;
	
	heapify(arr, *n,0);
	
}

int main(){
	int arr[20];
	int n=0,choice,i,value;
	
	while(1){
		
			printf("\nenter choices to select operation\n");
			printf(" 1 to insert\n");
			printf(" 2 to display\n");
			printf(" 3 to delete\n");
			printf(" 0 to exit\n -->");
			scanf("%d",&choice);
			
			switch(choice){
				case 0:
					printf("\nprogram exited\n");
					exit(0);
					
				case 1:
					printf("enter element to insert ");
					scanf("%d",&value);
					insertHeap(arr,&n,value);
					
					break;
				case 2:
					printf("\nheap elements are \n");
					for(i=0;i<n;i++)
						printf(" %d ",arr[i]);
					break;
					
				case 3:
					printf("element %d is deleted\n",arr[0]);
					deleteHeap(arr,&n);
					
					break;
					
					
				default:
					printf("\ninvalid input\n");
					break;
					
			}
		
	}
	return 0;	
}
		
		
