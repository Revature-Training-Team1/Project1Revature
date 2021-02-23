public with sharing class Feb22CodingChallenge_CC 
{
  public List<Feb22CodingChallenge_Wrapper> accountList
  {
    get
    {
      if (accountList == null)
      {
        Map<String,Decimal> mapItems = Feb15CodingChallenge.getOppRevByAccount();

        accountList = new List<Feb22CodingChallenge_Wrapper>();

        for (String name: mapItems.keySet())
        {
          accountList.add(new Feb22CodingChallenge_Wrapper(name, mapItems.get(name)));
        }
      }
      return accountList;
    }
    set;
  }
}