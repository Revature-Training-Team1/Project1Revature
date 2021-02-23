public class AccountUtility {
	public static void viewAnnualRevenue()
    {
        List<Account> accountsList = new List<Account>();
        accountsList = [SELECT Name, AnnualRevenue FROM Account];
        for (Account acc : accountsList)
        {
            String accRev = acc.Name + ' : ' + acc.AnnualRevenue;
            System.debug(accRev);
        }
    }
}