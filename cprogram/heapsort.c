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

void main(){
	int arr[20],n,i;
	printf("enter the array number");
	scanf("%d",&n);

	printf("enter array elements");
	for(i=0;i<n;i++)
		scanf("%d",&arr[i]);
	
	heapSort(arr,n);

	printf("the sorted elements are \n");
	for(i=0;i<n;i++)
		printf(" %d ",arr[i]);
}