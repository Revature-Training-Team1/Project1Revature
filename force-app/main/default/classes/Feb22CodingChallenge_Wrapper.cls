public inherited sharing class Feb22CodingChallenge_Wrapper {

    public String opportunityName {get;set;}
    public Double expectedRev {get;set;}

    public Feb22CodingChallenge_Wrapper(String name, Double revenue) {

        opportunityName = name;
        expectedRev = revenue;
    }
}