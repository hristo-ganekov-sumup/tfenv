# tfenv Docker

## Usage
* Clone the repo 

* Change Docker file according your needs (username)

* Build image 

* in the tfenv directory clone/create terraform directory

* change run script to your needs 

* execute it 

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
