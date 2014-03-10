#  nc-amimoto

 for centos


## Requirement

- knife-solo
-  availalble SSH_Key for your account.

## Setup(local)

```
bundle 
```

## Setup(VM)

1. create centos vm and get ip_address.
2. knife solo prepare ${IP_ADDRESS} # install omnibus-chef
3. knife solo cook ${IP_ADDRESS}  -o amimoto     # run chef-solo


## test

1. `cd spec`
2. `ln -s template ${ipaddress}`
3. `cd ..`
4. rspec spec/${ipaddress}

## Cleanup

2. knife solo clean ${IP_ADDRESS}