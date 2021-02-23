public class Feb22CodingChallenge_Wrapper {
    public String name {get; set;}
    public Decimal revenue {get; set;}

    public Feb22CodingChallenge_Wrapper(String name,Decimal sumRev) {
        this.name = name;
        this.revenue = sumRev;
    }
}