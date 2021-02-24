public class Test {
    //151 new contacts created, encap in a try catch block
    public static void method1(){
    
    try{
        List<Contact> contacts = new List<Contact>();
        for(Integer i = 0; i > 151; i++){
        Contact c = new contact(LastName = 'contact' + i);
            contacts.add(c);
    	}
        insert contacts;
    }
    catch(DMLexception e){
        system.debug('Encoutnered DMLexception');
    	}
   	catch(Limitexception e){
            system.debug('Encoutnered Limitexception');
        }
    finally {
            system.debug('Finished');
        }
    }

}