# tfenv Docker

## Usage
* Clone the repo and cd in the directory
```
git clone https://github.com/hristo-ganekov-sumup/tfenv.git
cd tfenv
```
* Change Docker file according your needs (username)

* Build image 
```
docker build . -t tfenv
```
* in the tfenv directory clone/create terraform directory
```
git clone https://github.com/<my-terraform-repo> terraform
````
* change run script to your needs 

* execute it 
```
./run
```

## Inside container 

### list installed terraform versions
```
tfenv list
```

### select active terraform version
```
tfenv use <version>
```

if a terraform project (directory) have .terraform-version file containing a version number the terraform selection is automatic
