//Lead off your class with the following comment, filled out with 
    //your information.

    /////////////////////////////////////////////////////////////////
    //
    // Name: Project 0 Bravo
    // Author: Allan (abduong206@gmail.com)
    // Date: 02/02/2021
    // Description: Series of apex methods to demonstrate
    // basic understanding of coding concepts.
    //
    /////////////////////////////////////////////////////////////////

    //Write the following methods in a class called P0B. 
    //Note: The method signatures are given.

public class P0B {
    
    /*
     * 1. Return the nth Fibonacci number
     * Test Cases:
     * Input: 0     Output: 0
     * Input: 1    Output: 1
     * Input: 2     Output: 1
     * Input: 10    Output: 55
    */

    public static Integer nFibonacci( Integer n ){
        
        if(n <=1){
           return n; 
        }
        return nFibonacci(n - 1) + nFibonacci(n - 2);
    }
    
    /*
     * 2. Sort a list of integers.
     * Test Cases:
     * Input: [2,4,5,1,3,1]     Output: [1,1,2,3,4,5]
     * Input: [5,4,3,2,1]     Output: [1,2,3,4,5]
     *
     * Don't use the sort() method... that would be lame.
    */
    
    public static List<Integer> sortList( List<Integer> intList ) {
        
        List<Integer> mylist = new List<Integer>();
        Integer tempNum;
        
        for(Integer i = 0; i < intList.size(); i++){
            
            for(Integer j = i+1; j < intList.size(); j++){
                if(intList[i] > intList[j]){
                    
                    tempNum = intList[i];
                    intList[i] = intList[j];
                    intList[j] = tempNum;
                    
                }
                
                mylist.add(tempNum);
            }

        }
        
        return intList;
        
    }
    
    /*
     * 3. Return the factorial of n.
     * Test Cases:
     * Input: 0    Output: 1
     * Input: 1    Output: 1
     * Input: 3    Output: 6
    */
    
    public static Integer nFactorial( Integer n) {
        
        Integer currentNum = n;
        Integer temp = n-1;
        
        for(Integer i = n; i > 1; i--){
            
            currentNum = currentNum * temp;
            temp--;
        }
        return currentNum;
    }
    
    /*
     * 4. Rotate left
     * Given a list, list, and an integer, n, rotate the values in list left n times and return list
     * Test Cases:
     * Input: [1,2,3,4,5], 1    Output: [2,3,4,5,1]
     * Input: [1,2,3,4,5], 6    Output: [2,3,4,5,1]
     * Input: [1,2,3,4,5], 3    Output: [4,5,1,2,3]
    */
    public static List<Integer> rotateLeftNTimes( List<Integer> nList, Integer n) {
        
        for (Integer i = 0; i < n; i++){
            
            Integer temp = nList[0];
            for(Integer j = 0; j < nList.size()-1; j++){
                
                nList[j] = nList[j+1];
            }
            nList[nlist.size() - 1] = temp;
        }
        
        return nList;
    }
    
    /*
     * 5. Balanced Brackets
     * A bracket is any one of the following: (, ), {, }, [, or ]
     * 
     * The following are balanced brackets:
     *    ( )
     *    ( ) ( )
     *    ( ( ) )
     *    ( { [ ] } )
     *
     * The following are NOT balanced brackets:
     *   (
     *   )
     *   ( ( )
     *   ( [ ) ]
     *
     * Return true if balanced
     * Return false if not balanced
    */
    public static Boolean bracketsAreBalanced( String s ) {
        
        Stack chars = new Stack();
        String x = s.deleteWhitespace();
        List<String> characters = new List<String>(x.split(''));

        
        for(Integer i = 0; i < characters.size(); i++){
            
            if(characters[i] == '(' || characters[i] == '[' || characters[i] == '{'){
                
                chars.push(characters.get(i));
                continue;
                
            }
            if(chars.isEmpty()){
                return false;
            }
            
            switch on characters[i]{
                when ')'{
                    x = chars.peek().toString();
                    chars.pop();
                    if (x == '{' || x == '['){
                        return false;
                    }   
                    }
                when '}'{
                    x = chars.peek().toString();
                    chars.pop();
                    if (x == '(' || x == '['){
                        return false;
                }
                }
                when ']'{
                    x = chars.peek().toString();
                    chars.pop();
                    if (x == '{' || x == '('){
                        return false;
                    }
                }
            }
        }
        if(chars.isEmpty() == true){
            system.debug('Balanced');
        }
        else{
            system.debug('Unbalanced');
        }
        return chars.isEmpty();
    }
    
    /* You should NOT be submitting answers that you find online. You will be expected to be able to defend any of these solutions without notice. */

    /*
     * 6. Create a method that retrieves a list of all accounts and updates those accounts.
     *      Create a custom field on the Account standard object called Size__c that will be a 
     * picklist containing small/medium/large.
     *     Create a method that retrieves a list of all accounts. 
     *         - If an account has between 1-1000 employees then it is classified as small.
     *         - If an account has between 1001-10000 employees it is classified as medium.
    *         - If an account has more than 10000 employees it is classified as large.
     *     Update the Size__c field on each account to reflect the amount of employees in the Account.
    */
    /*
    public static void updateAccountSize( ) {
        
        List<Account> acc = [SELECT id, Name, NumberOfEmployees FROM  Account WHERE NumberOfEmployees=null];
        for(Integer i = 0; i < acc.size(); i++){
            acc[i].NumberOfEmployees = 1000;

        }
        update acc;
        acc.clear();
        
        acc = [SELECT id, Name, NumberOfEmployees FROM  Account];
        for(Integer i = 0; i < acc.size(); i++){
            if(acc[i].NumberOfEmployees >= 1 && acc[i].NumberOfEmployees <= 1000){
                acc[i].Size__c = 'Small';
            }
            if (acc[i].NumberOfEmployees >= 1001 && acc[i].NumberOfEmployees <= 10000){
                acc[i].Size__c = 'Medium';
            }
            if (acc[i].NumberOfEmployees >= 10000){
                acc[i].Size__c = 'Large';
            }
        }
        update acc; 
    }
    
    /* 
     * 7. Create a method that will find all leads that contain 'ca' in their fields. 
     *     If a lead is located in California(CA), change their Lead Status field to 'Closed - Not 
     * Converted' and their description should display the message, "We are no longer doing 
     * business in California."
     */
    public static void updateCALeads( ) {
        List<Lead> leads = [SELECT Name FROM Lead WHERE state = 'CA'];
        for(Integer i = 0; i < leads.size(); i++){
            leads[i].Status = 'Closed - Not Converted';
            leads[i].Description = 'We are no longer doing business in California.';
        }
        update leads;
    }
    
    /*
     * 8. Create a method that will find all Opportunities which have already passed their Close Date 
     * and have a Stage field that is not 'Closed Won'. Since they have passed their Close Date and 
     * they are not marked as 'Closed Won', they should be marked as 'Closed Lost'.
     */
    public static void closePastDueOpportunities( ) {
        
        List<Opportunity> opp = [SELECT Name FROM Opportunity WHERE StageName != 'Closed Won' AND CloseDate < TODAY];
        for(Integer i = 0; i < opp.size(); i++){
            opp[i].StageName = 'Closed Lost';
        }
        update opp;
    }
}