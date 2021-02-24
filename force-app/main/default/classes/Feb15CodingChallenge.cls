public class Feb15CodingChallenge {
    public static Map<String, Double> getOppRevByAccount() {
        List<AggregateResult> ars = [SELECT SUM(ExpectedRevenue) sumRev, Account.Name name FROM Opportunity GROUP BY Account.Name 
                                     HAVING SUM(ExpectedRevenue) > 0];
        Map<String, Double> oppRevByAccount = new Map<String, Double>();
        
        for(AggregateResult ar : ars) {
            oppRevByAccount.put(String.valueOf(ar.get('name')), Double.valueOf(ar.get('sumRev')));
        }
        
        return oppRevByAccount;
    }
}