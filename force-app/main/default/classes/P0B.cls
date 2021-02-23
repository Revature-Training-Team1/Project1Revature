public class P0B {
	public static List<Integer> nFibonacci( Integer n )
	{
        final Integer Minimum = 2; // minimum length of the sequence
        final Integer Maximum = 47; // maximum length of the sequence
        /*
            description: method to bring about a list of Fibonacci 
            sequence numbers
            param: user specified the integer of length with a sequence
            that should be 2-47, inclusively.
                - The sequence begins on 0 and 1 by definition so the minimum
                length could only go down to 2.
                - For the 48th number edge in the sequence or greater, it takes
                a long time to run and could require a Long data type.
            return: a working list of integers in a squence represented as
            a List<Integers>
        */
        List<Integer> fib = new List<Integer>{0,1}; // Put something first
        Integer index;
        
        if (n<Minimum)
        {
            n=Maximum;
        } else {
            n=Minimum;
        }
    
        for (index = fib.size(); index < n; index++)
        {
            // The next number in the sequence comes from this .
            fib.add(fib[index-1]+fib[index-2]);
            system.debug(fib.get(index));
        }
        return fib;   
	}
}