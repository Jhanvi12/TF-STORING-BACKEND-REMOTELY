# TF-STORING-BACKEND-REMOTELY
Description - Here, we are storing our backend i.e state file remotely on AWS with the help of s3 and dynamodb.s3 is used to store the file whereas dynamodb is used to implement locking of state file .


**This is a terraform code to store backend remotely .This code will also help you manage storage function, operation function between local and remote.**
```
1.**Infra-Setup.PNG** is the architecture of AWS , resource used , property used for storing state file .
2.**backend.tf** has all terraform code which is required to provision s3 bucket and Dynamo db .
3.**Provider.tf** has cloud provider information i.e AWS in our case . We can provision multi cloud here in provider . It also has code which helps you to store backend remotely. 
4.**terraform.tfstate** is the state file which we will store remotely in s3. 
5.Console after terraform init ![image](https://user-images.githubusercontent.com/36741795/235789117-ec58cbbf-4e86-4e97-bf9f-68320a1272c7.png)

```
**Steps to run in your local machine to store Backend Remotely assuming your TF and AWS Account is set** 
```
1.terraform init - By running the terraform init command , we can download the provider AWS Api , which will help to connect to remote backend
2.terraform validate - This command will tell you that your tf file is syntax wise correct or not.
3.terraform plan - This will check the complete resource and calculate the delta with previous changes.
4.terraform apply- This will actually provision resources in AWS Account .
5.Go to your AWS Account by console to check the resource creation.- Navigate to s3 and  **global/mystatefile/terraform.tfstate file ** . You will see state file there and it will be removed from local repo.
```

**Steps to run in your local machine to pull back your Backend operation locally assuming your TF and AWS Account is set** 
```
Pre - Comment out the code (backend s3 block) at provider.tf and save. Refer ![image](https://user-images.githubusercontent.com/36741795/235789538-a63aeb73-5062-4056-bef9-603a8923fd16.png)

1.terraform init -migrate-state - By running the this command , we can bring back our remotely stored file at local repo.

5.Go to your AWS Account by console to check the resource deletion.- Navigate to s3 , and  **global/mystatefile/terraform.tfstate file ** and refresh. You will not see any state file there and it will be removed from local repo.
```
