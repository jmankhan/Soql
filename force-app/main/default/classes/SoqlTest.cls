@IsTest
private class SoqlTest {
    @IsTest
    private static void testSimple() {
        Account acc = getAccounts('Test', 1)[0];
        Soql q = new Soql.Builder()
                .selectId()
                .fromm('Account')
                .wheree(
                        new SoqlCondition.Builder().eq('Id', acc.Id).build()
                ).build();
        List<Account> result = Database.query(q.toString());

        System.assert(!result.isEmpty());
        System.assertEquals(1, result.size());
        System.assertEquals(acc.Id, result[0].Id);
    }

    @IsTest
    private static void testLimit() {
        getAccounts('Test', 2);
        Soql q = new Soql.Builder()
                .selectFields(new List<String>{'Id', 'NumberOfEmployees'})
                .fromm('Account')
                .limitBy(1).build();

        List<Account> result = Database.query(q.toString());
        System.assert(!result.isEmpty());
        System.assertEquals(1, result.size());
    }

    @IsTest
    private static void testOrder() {
        List<Account> data = getAccounts('Test', 5);
        List<String> sorted = new List<String>{data[0].Name, data[1].Name, data[2].Name, data[3].Name, data[4].Name};
        List<String> rev = new List<String>{data[4].Name, data[3].Name, data[2].Name, data[1].Name, data[0].Name};

        Soql q = new Soql.Builder()
                .selectFields(new List<String>{'Id', 'Name'})
                .fromm('Account')
                .orderBy('Name', true).build();

        List<Account> result = Database.query(q.toString());
        q = new Soql.Builder()
            .selectFields(new List<String>{'Id', 'Name'})
            .fromm('Account')
            .orderBy('Name', false).build();
        List<Account> result2 = Database.query((q.toString()));

        System.assert(!result.isEmpty());
        for(Integer i=0; i<sorted.size(); i++) {
            System.assertEquals(sorted[i], result[i].Name);
            System.assertEquals(rev[i], result2[i].Name);
        }
    }

    /************** Helper methods **************/
    private static List<Account> getAccounts(String name, Integer amount) {
        List<Account> accounts = new List<Account>();
        for(Integer i=0; i<amount; i++) {
            accounts.add(new Account(
                    Name = name + String.valueOf(i),
                    NumberOfEmployees = Integer.valueOf(10 * Math.random())
            ));
        }
        insert accounts;
        return accounts;
    }
}
