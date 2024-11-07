#include<stdio.h>

#define max 10

int mat[max][max];
int visited[max];
int n;
int queue[max];
int front=-1;
int rear=-1;



void addVertex(int i,int j){
	mat[i][j]=1;
	mat[j][i]=1;
}


void enqueue(int vertex){
	if(rear==max-1)
		return;
	if(front==-1)
		front=0;
	queue[++rear]=vertex;
}

int dequeue(){
	if(front==-1 || front>rear)
		return -1;
	return queue[front++];
}

void BFS(int startVertex){
	for(int i=0;i<n;i++)
		visited[i]=0;

	enqueue(startVertex);
	visited[startVertex]=1;

	while(front<=rear){
		int vertex = dequeue();
		printf(" %d ",vertex);
		
		for(int i=0;i<n;i++){
			if(mat[vertex][i]==1&&!visited[i]){
				enqueue(i);
				visited[i]=1;
			}
		}
	}
}


void DFS(int vertex){
	printf(" %d ",vertex);
	visited[vertex]=1;
	
	for(int i=0;i<n;i++){
		if(mat[vertex][i]==1&&!visited[i]){
			DFS(i);
		}
	}
}

void display(){
	int i,j;
	printf("   ");
	for(i=0;i<n;i++)
		printf(" %d ",i);

	printf("\n\n");
	for(i=0;i<n;i++){
		
		printf("%d  ",i);
		for(j=0;j<n;j++){
			printf(" %d ",mat[i][j]);
		}
		printf("\n");
	}
}


void main(){
	int i,j,edges,u,v;
	printf("enter maximum vertexes in the graph\n");
	scanf("%d",&n);
	for(i=0;i<n;i++){
		for(j=0;j<n;j++)
			mat[i][j]=0;
		visited[i]=0;
	}
	printf("enter the number of edges\n");
	scanf("%d",&edges);
	printf("enter edges in u,v order\n");
	for(i=0;i<edges;i++){
		scanf("%d %d",&u,&v);
		addVertex(u,v);
	}
	
	printf("the adjacency matrix is \n");
	display(mat);

	printf("the dfs traversal of the tree is \n");
	DFS(0);	
	printf("\n the bfs traversla of the tree is \n");
	BFS(0);
}