--------------- CREATING USER ------------------------ 
. Manage jenkins > manage users > we can create users
. Once created user we can login using that user credentials
. "created two users RAM and VIjay"
if we login using user credentials they will have all access i.e even manage jenkins
"suppose developers should not have access to manage jenkins"-- to enable this we use role based strategy

----------------- ASSIGNING ROLES -------------------
. manage jenkins > config global security > authorisation > role based strategy > apply & save
 " now logout and try login with RAM credentials, we can see overall permission denied"
.log back again with your credentials 
. manage jenkins > manage and assign roles > manage ROLES
  - manage roles:
    .global ROLES: create new role employee in overall(read access),view(provide all access)
	. item roles : also known as project ROLES
	              - role to add developer 
				  - pattern dev.*

  - assign roles : add both users to employee in global ROLES
                   add both users to item roles but for ram(developer role),vijay(tester role)

. once saved "restart jenkins"	--using public-ip:8080/restart

-------------- CHECKING ASSIGNED ROLES ---------------------------------
. once we logged with user ram credentials he can ccess only development jobs (because pattern dev.*)
. similarly with user vijay credentials he can access only testing jobs (because pattern test.*)
"from above jobs can be restricted using item roles base don pattern
  i.e. developer -> dev jobs(pattern dev.*)
       tester -> test jobs (pattern test.*)"

--> our responsibility is to inform dev team to create jobs starting with dev
--> similarly for testers to create jobs starting with test 

eg: paypal and ge clients
    for paypal client users to access pay pal jobs we need to inform them to create jobs starting with "pay" 
     as we will provide pattern pay.*
    similarly for ge client users
	
	 
