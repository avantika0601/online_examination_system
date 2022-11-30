found = 0
found_at = 0
fullyregistered = 0;
for i in range(0,len(res1)):
        if res1[i].pass == obj.pass:
            if res1[i].college != 'none':
                fullyregistered = 1
                found = 1
        found_at = i
        
      
      
if found == 0:
    print('Incorrect Password')
    res.status(202).send('incorrect password'):
elif (found == 1 && fullyregistered == 1):
    res.status(200).send('Correct User')
elif (found == 1 && fullyregistered == 0):
    res.status(221).send('registration pending')
    