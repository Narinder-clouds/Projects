# **Main components to make a voting app:**

  

1.  **Redis**: redis is just like an in-memory database used for caching messages in our case it caching the vote cast by the user.
    
2.  **Vote-service**: it is a frontend web app in python which lets us vote between two options.
    
3.  **Postgres**: it is just the database for storing the votes cast by the user.
    
4.  **Worker**: Worker consumes votes and stores them in the database. It communicates with redis service for vote collection and postgres for vote storage.
    
5.  **Result-service:** it node js app which uses the result of the voting in the real-time in db.
    

  
  
  
## STEPS FOR MAKING THE VOTE APP:

  

1.  First we have to run the redis container using command:
    

  

**Command:** docker run -d --name redis redis

  

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXdwX9MBgGpjLzF_RPqmfeZhOPv--fJoonnE1D3ztZjM4WJhfRS_F-eL-WF6Ox2mhty5aSo9QqS1bd4WVIkKEl_6_eA7jRE5IgY-rXCkrFC-mB2m84McTK-_d5bU08AHrVslApD_zw?key=g06cieB17eBIhgpbTdjajKo2)

2.  Then go to the vote directory then use build command to build image from dockerfile
    

  

**Command:** docker build -t vote [path]

docker run -p 80:80 --link redis:redis vote

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXcZUQ4FX6aldPsK30FV5pz39ENXb3fLUMUizDGZT-Rs_RbP21RBMU081fVmod_dWFrmKDuqBD3V0M8MaJKPtrSMa7-5Fu1PRES6Q3-5dxl-C373vgUbCwHJkAdh0aGQlBmolc7k6Q?key=g06cieB17eBIhgpbTdjajKo2)

--link is used to link redis with the vote service.

  

3.  Now run the database to store the votes which is casted by the users using command.
    

**Command:** docker run -d -e POSTGRES_HOST_AUTH_METHOD=trust --name db postgres

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXf2bipAhz3CmpT_DQuEdpCjB_7K_HT2aGEr029cEtyj4b5W7BYO1OtZxUJF90Ba-FBR8Fyz4g2FPfL_bpmbijcETJ5Nk_J9yCKdZSq0sHi8OfKtaTYBJk1tEBoogzc8e7buo_cMpQ?key=g06cieB17eBIhgpbTdjajKo2)

  

4.  Now we have to go to the worker directory then again use build command to build the image from the docker file .
    

**Command:** docker build -t worker-service [path of dockerfile]

Then, docker run -d --link db:db --link redis:redis worker-service

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXcz_Q2JLvbwTkoKTTwNCoQpYCEnDtYdYfTPMAKEQqAFF8WiHrO0nbfTy2ltL4pdYrSA5VstzrH7BxZA1tkpDam5GS1emezpghqhqXS5WfR_oQzgkYW0QHULa2mc-jVlPo12Ev3A?key=g06cieB17eBIhgpbTdjajKo2)

  

Now we have to go to the result directory then again run build command to build the image from dockerfile.

**Command:** docker build -t [path of docker file]

Then, docker run -p 81:80 --link db:db result-service

  

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXeZ9PVhR8Zl6Tq8x8horygTQrm2DZ1RwK56yWBaf4BYLLy6_oBq_gHew0Ybr5rrmzO4S5-DTVjUrbhKRNm16RZSC4lvpfVJM2R8Q0ViUzx_QQG4OmyNwg5tjRRuk5JYGzfv8wlvXQ?key=g06cieB17eBIhgpbTdjajKo2)

  
  
  

**Vote app:**

  
  

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXe3ftW_uSMXKEmth2PhXRZ8mdxn_DRWEJqXJc0suO5c35DLwTPXbbnJLuN-PLTdcb2HcR2IIBy-RGUf1AjlPiUDjRRPnXRAt_4zHvsiJSZtVGNtreSnFIa9-vKvKMH3X1qnGFGx?key=g06cieB17eBIhgpbTdjajKo2)

  
  
  
  

**Result:**

  

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXfjLbDFpLRCaK5qJFe1K01Jex6ymBU6n0sURSw1fvx-NNy0Z5-MGEGgK1cZ2KIBjpSc5vV3AXl-3AiwfGEgseQq4NUka4ZklCHb0bKmfMSnoOTMie6o-qFxl8dgo1XQHicbVMl3?key=g06cieB17eBIhgpbTdjajKo2)
