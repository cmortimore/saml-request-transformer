public class SAMLRequestController {

    public String errorMessage {get;set;}
    public String ACS{get;set;}
    public String IDPURL{get;set;}
    public String SAMLRequest {get;set;}
    public String RelayState {get;set;}
    public String TransformedSAMLRequest {get;set;}

    public SAMLRequestController() {
        
        Apexpages.currentPage().getHeaders().put('Cache-Control','no-cache, no-store');
        Apexpages.currentPage().getHeaders().put('Pragma','no-cache');
        Apexpages.currentPage().getHeaders().put('Expires','Mon, 01 Jan 1990 12:00:00 GMT');
        
        this.RelayState = ApexPages.currentPage().getParameters().get('RelayState');
        this.SAMLRequest = ApexPages.currentPage().getParameters().get('SAMLRequest');
        if ( this.SAMLRequest == null ) {
            errorMessage = 'No SAML Request - only SP initiated implemented';
        } 
        
        ACS = 'THE ACS URL FROM YOUR CONNECTED APP';
        IDPURL = 'https://YOUR MY DOMAIN/idp/endpoint/HttpPost';

    }
    
    public void doSAML() {
        
        String DecodedSAMLRequest = Apexpages.currentPage().getParameters().get('DecodedSAMLRequest');
        
        try {
            DOM.Document Request_DOM = new DOM.Document();
            Request_DOM.load(DecodedSAMLRequest);
            DOM.XMLNode Root_Request = Request_DOM.getRootElement();
            Root_Request.setAttribute('AssertionConsumerServiceURL', ACS);
            TransformedSAMLRequest = EncodingUtil.base64Encode(Blob.valueOf(Request_DOM.toXMLString()));  
            
        } catch(Exception e) { 
            errorMessage = e.getMessage();
        }
        
    
    }
    
    
}
