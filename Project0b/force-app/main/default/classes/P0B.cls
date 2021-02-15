public inherited sharing class P0B {
    // Name: Project 0 Bravo
    // Author: Kevin (kvn.luo@gmail.com)
    // Date: 02/14/2021
    // Description: Series of apex methods to demonstrate
    // basic understanding of coding concepts.

    /*
     * 1. Return the nth Fibonacci number
     * Test Cases:
     * Input: 0     Output: 0
     * Input: 1    Output: 1
     * Input: 2     Output: 1
     * Input: 10    Output: 55
    */
    public static Integer nFibonacci( Integer n ){
      if(n <= 1) {
        return n;
      }

      Integer n1 = 0;
      Integer n2 = 1;
      Integer n3;

      for(Integer i=2; i <= n; i++) {
        n3 = n1 + n2;
        n1 = n2;
        n2 = n3;
      }
      System.debug(n3);
      return n3;     
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
      for (Integer i = 0; i < intList.size(); i++) {
        for (Integer ii = i+1; ii < intList.size(); ii++) {
          if(intList[i] > intList[ii]) {
            Integer temp = intList[i];
            intList[i] = intList[ii];
            intList[ii] = temp;
          }
        }
      }
      System.debug(intList);
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
      if(n <= 1) {
        return 1;
      }
      Integer factorialNum = 1;
      for (Integer i = 2; i <= n; i++) {
        factorialNum *= i;
      }
      System.debug(factorialNum);
      return factorialNum;
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
      List<Integer> rotatedInts = new List<Integer>();

      if(math.mod(n, nList.size()) == 0) {
        return nList;
      }
      
      Integer increment = n;
      if(n > nList.size()) {
        increment = math.mod(n, nList.size());
      }

      for (Integer i=increment; i<nList.size(); i++) {
        rotatedInts.add(nList[i]);
      }
      for (Integer i=0; i < increment; i++) {
        rotatedInts.add(nList[i]);
      }

      System.debug(rotatedInts);
      return rotatedInts;
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
      Map<String, String> bracketRef = new Map<String, String>();
      bracketRef.put('(', ')');
      bracketRef.put('[', ']');
      bracketRef.put('{', '}');

      List<String> openBrackets = new List<String>();
      for(Integer i = 0; i < s.length(); i++) {
        if (s.substring(i, i+1) == '(' || s.substring(i, i+1) == '[' || s.substring(i, i+1) == '{') {
          openBrackets.add(s.substring(i, i+1));
          continue;
        }

        if(openBrackets.size() < 1) {
          System.debug(false);
          return false;
        }

        if(s.substring(i, i+1) != bracketRef.get(openBrackets.remove(openBrackets.size() - 1))) {
          System.debug(false);
          return false;
        }
      }

      if(openBrackets.size() > 0) {
        System.debug(false);
        return false;
      }

      System.debug(true);
      return true;
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
    public static void updateAccountSize( ) {
      List<Account> acctList = [
        SELECT Name, NumberOfEmployees
        FROM Account
      ];

      List<Account> updatedList = new List<Account>();

      for(Account a: acctList) {
        if(a.NumberOfEmployees == null) {
          updatedList.add(a);
          continue;
        }

        if(a.NumberOfEmployees <= 1000) {
          a.Size__c = 'Small';
        } else if(a.NumberOfEmployees <= 10000) {
          a.Size__c = 'Medium';
        } else {
          a.Size__c = 'Large';
        }

        updatedList.add(a);
      }

      update updatedList;
    }

    /* 
     * 7. Create a method that will find all leads that contain 'ca' in their fields. 
     *     If a lead is located in California(CA), change their Lead Status field to 'Closed - Not 
     * Converted' and their description should display the message, "We are no longer doing 
     * business in California."
     */
    public static void updateCALeads( ) {

    }

    /*
     * 8. Create a method that will find all Opportunities which have already passed their Close Date 
     * and have a Stage field that is not 'Closed Won'. Since they have passed their Close Date and 
     * they are not marked as 'Closed Won', they should be marked as 'Closed Lost'.
     */
    public static void closePastDueOpportunities( ) {

    }
}
