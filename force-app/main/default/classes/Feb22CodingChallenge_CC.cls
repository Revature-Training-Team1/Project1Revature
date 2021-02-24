public class Feb22CodingChallenge_CC {

    public List<Feb22CodingChallenge_Wrapper> sumExpectedRevenue {get;set;}

    public List<Feb22CodingChallenge_Wrapper> getOppRev() {
        sumExpectedRevenue = new List<Feb22CodingChallenge_Wrapper>();

        List<AggregateResult> aggregateList = [SELECT SUM(ExpectedRevenue) rev, Account.Name FROM Opportunity GROUP by Account.Name];
        
        for(AggregateResult aRev : aggregateList){

            if ((Double)aRev.get('rev')>0)

            sumExpectedRevenue.add(new Feb22CodingChallenge_Wrapper(String.valueOf(aRev.get('Name')), Double.valueOf(aRev.get('rev'))));
        }
        
        return sumExpectedRevenue;
    }

    public Feb22CodingChallenge_CC(){
        getOppRev();
    }

}