saml-request-transformer
=================

Re-writes SAML Requests on the fly.   This example takes an SAML SP-Init over HTTP Redirect binding, changes the ACS URL, and sends it to the Salesforce IDP over POST Binding.   

Not something you'd normally do, but let's say you were trying to point the IDP at an alternate ACS URL then what your Service Provider was expecting.   An example use-case might be pointing at a Cloud Proxy instead of directly at the Service provider.    In essense it sorts our the impedence mis-match between where the SP is requesting to have it's assertions sent, and where the IDP wants to send them for it's own intermediation purposes. 

To get started:

1. Create a Connected App that sends SAML to your SP
2. Create the code from the Apex, and Pages directory
3. Alter the controller code to point at your desired ACS URL and your Connected App 
4. Adjust permissions on your profiles to allow the proper users to be able to excute the management and SPInit endpoints

Now, you can have your Service Providers SP-init against /apex/SAMLRequest and the request will be changed so it's requested ACS URL is somewhere besides the SP.   Use thoughtfully and respectfully of course.   


