@IsTest
private class SoqlConditionTest {
    @TestSetup
    private static void setup() {
        getAccounts('Test', 1, 0);
    }

	@IsTest
	private static void testEq() {
		String result = new SoqlCondition.Builder().eq('Name', 'Test').build().toString().trim();
		System.assertEquals('Name = \'Test\'', result);
	}

	@IsTest
	private static void testAnd() {
		String result = new SoqlCondition.Builder().eq('Name', 'Test').andd().eq('Id', 'Test').build().toString().trim();
		System.assertEquals('Name = \'Test\' AND Id = \'Test\'', result);
	}

	@IsTest
	private static void testOr() {
		String result = new SoqlCondition.Builder().eq('Name', 'Test').orr().eq('Id', 'Test').build().toString().trim();
		System.assertEquals('Name = \'Test\' OR Id = \'Test\'', result);
	}
    
    @IsTest
    private static void testAndOr() {
        String result = new SoqlCondition.Builder().eq('Name', 'Test').andd().eq('Id', 'Test').orr().eq('Name', 'Test2').build().toString().trim();
		System.assertEquals('Name = \'Test\' AND Id = \'Test\' OR Name = \'Test2\'', result);
    }
    
    @IsTest
    private static void testOrAnd() {
        String result = new SoqlCondition.Builder().eq('Name', 'Test').orr().eq('Id', 'Test').andd().eq('Name', 'Test2').build().toString().trim();
        System.assertEquals('Name = \'Test\' OR Id = \'Test\' AND Name = \'Test2\'', result);
    }
    
    @IsTest
    private static void testOrOr() {
        String result = new SoqlCondition.Builder()
            .eq('Name', 'Test')
            .orr()
            .eq('Name', 'Test2')
            .orr()
            .eq('Name', 'Test3')
            .build().toString().trim();
        System.assertEquals('Name = \'Test\' OR Name = \'Test2\' OR Name = \'Test3\'', result);
    }
    
    @IsTest
    private static void testAndAnd() {
        String result = new SoqlCondition.Builder()
            .eq('Name', 'Test')
            .andd()
            .eq('Id', 'Test')
            .andd()
            .eq('City', 'Test')
            .build().toString().trim();
        System.assertEquals('Name = \'Test\' AND Id = \'Test\' AND City = \'Test\'', result);
    }
    
    @IsTest
    private static void testOrAndOr() {
        String result = new SoqlCondition.Builder()
            .eq('Name', 'Test')
            .orr()
            .eq('Id', 'Test')
            .andd()
            .eq('Name', 'Test2')
            .orr()
            .eq('Id', 'Test2')
            .build().toString().trim();
        System.assertEquals('Name = \'Test\' OR Id = \'Test\' AND Name = \'Test2\' OR Id = \'Test2\'', result);
    }
    
    @IsTest
    private static void testAndOrAnd() {
        String result = new SoqlCondition.Builder()
            .eq('Name', 'Test')
            .andd()
            .eq('Id', 'Test')
            .orr()
            .eq('Name', 'Test2')
            .andd()
            .eq('Id', 'Test2')
            .build().toString().trim();
        System.assertEquals('Name = \'Test\' AND Id = \'Test\' OR Name = \'Test2\' AND Id = \'Test2\'', result);
    }
    
    @IsTest
    private static void testAndAndAnd() {
        String result = new SoqlCondition.Builder()
            .eq('Name', 'Test')
            .andd()
            .eq('Id', 'Test')
            .andd()
            .eq('City', 'Test')
            .andd()
            .eq('State', 'Test')
            .build().toString().trim();
        System.assertEquals('Name = \'Test\' AND Id = \'Test\' AND City = \'Test\' AND State = \'Test\'', result);
    }
    
    @IsTest
    private static void testOrOrOr() {
        String result = new SoqlCondition.Builder()
            .eq('Name', 'Test')
            .orr()
            .eq('Name', 'Test2')
            .orr()
            .eq('Name', 'Test3')
            .orr()
            .eq('Name', 'Test4')
            .build().toString().trim();
        System.assertEquals('Name = \'Test\' OR Name = \'Test2\' OR Name = \'Test3\' OR Name = \'Test4\'', result);
    }
 
 	@IsTest
 	private static void testEqTypes() {
        Account a = [SELECT Id FROM Account LIMIT 1];

 		String result = new SoqlCondition.Builder()
 			.eq('Boolean', true).orr()
 			.eq('Date', Date.today()).orr()
 			.eq('Datetime', Datetime.now()).orr()
 			.eq('Decimal', 1.0).orr()
 			.eq('Double', Double.valueOf('1.0')).orr()
 			.eq('Id', a.Id).orr()
 			.eq('Integer', 1).orr()
 			.eq('Long', Long.valueOf('9999999999999')).orr()
 			.eq('Object', (Object) a).orr()
 			.eq('String', 'Test').orr()
 			.eq('Time', Time.newInstance(1,1,1,1))
 			.build().toString();

        Integer symbolCount = result.countMatches('=');
        System.assertNotEquals(null, result);
        //eq includes an additional '=' in the Account print statement (Account: {Id = ...})
        System.assertEquals(12, symbolCount, 'wrong symbol count: ' + result);
 	}

    @IsTest
    private static void testNeqTypes() {
        Account a = [SELECT Id FROM Account LIMIT 1];

        String result = new SoqlCondition.Builder()
                .neq('Boolean', true).orr()
                .neq('Date', Date.today()).orr()
                .neq('Datetime', Datetime.now()).orr()
                .neq('Decimal', 1.0).orr()
                .neq('Double', Double.valueOf('1.0')).orr()
                .neq('Id', a.Id).orr()
                .neq('Integer', 1).orr()
                .neq('Long', Long.valueOf('9999999999999')).orr()
                .neq('Object', (Object) a).orr()
                .neq('String', 'Test').orr()
                .neq('Time', Time.newInstance(1,1,1,1))
                .build().toString();
        Integer symbolCount = result.countMatches('!=');
        System.assertNotEquals(null, result);
        System.assertEquals(11, symbolCount, 'wrong symbol count: ' + result);

    }

    @IsTest
    private static void testLeTypes() {
        Account a = [SELECT Id FROM Account LIMIT 1];

        String result = new SoqlCondition.Builder()
                .le('Date', Date.today()).orr()
                .le('Datetime', Datetime.now()).orr()
                .le('Decimal', 1.0).orr()
                .le('Double', Double.valueOf('1.0')).orr()
                .le('Id', a.Id).orr()
                .le('Integer', 1).orr()
                .le('Long', Long.valueOf('9999999999999')).orr()
                .le('String', 'Test').orr()
                .le('Time', Time.newInstance(1,1,1,1))
                .build().toString();
        Integer symbolCount = result.countMatches('<=');
        System.assertNotEquals(null, result);
        System.assertEquals(9, symbolCount, 'wrong symbol count: ' + result);
    }

    @IsTest
    private static void testLtTypes() {
        Account a = [SELECT Id FROM Account LIMIT 1];

        String result = new SoqlCondition.Builder()
            .lt('Date', Date.today()).orr()
            .lt('Datetime', Datetime.now()).orr()
            .lt('Decimal', 1.0).orr()
            .lt('Double', Double.valueOf('1.0')).orr()
            .lt('Id', a.Id).orr()
            .lt('Integer', 1).orr()
            .lt('Long', Long.valueOf('9999999999999')).orr()
            .lt('String', 'Test').orr()
            .lt('Time', Time.newInstance(1,1,1,1))
            .build().toString();
        Integer symbolCount = result.countMatches('<');
        System.assertNotEquals(null, result);
        System.assertEquals(9, symbolCount, 'wrong symbol count: ' + result);
    }

    @IsTest
    private static void testGeTypes() {
        Account a = [SELECT  Id FROM Account LIMIT 1];

        String result = new SoqlCondition.Builder()
                .ge('Date', Date.today()).orr()
                .ge('Datetime', Datetime.now()).orr()
                .ge('Decimal', 1.0).orr()
                .ge('Double', Double.valueOf('1.0')).orr()
                .ge('Id', a.Id).orr()
                .ge('Integer', 1).orr()
                .ge('Long', Long.valueOf('9999999999999')).orr()
                .ge('String', 'Test').orr()
                .ge('Time', Time.newInstance(1,1,1,1))
                .build().toString();
        Integer symbolCount = result.countMatches('>=');
        System.assertNotEquals(null, result);
        System.assertEquals(9, symbolCount, 'wrong symbol count: ' + result);
    }

    @IsTest
    private static void testGtTypes() {
        Account a = [SELECT  Id FROM Account LIMIT 1];

        String result = new SoqlCondition.Builder()
                .gt('Date', Date.today()).orr()
                .gt('Datetime', Datetime.now()).orr()
                .gt('Decimal', 1.0).orr()
                .gt('Double', Double.valueOf('1.0')).orr()
                .gt('Id', a.Id).orr()
                .gt('Integer', 1).orr()
                .gt('Long', Long.valueOf('9999999999999')).orr()
                .gt('String', 'Test').orr()
                .gt('Time', Time.newInstance(1,1,1,1))
                .build().toString();
        Integer symbolCount = result.countMatches('>');
        System.assertNotEquals(null, result);
        System.assertEquals(9, symbolCount, 'wrong symbol count: ' + result);
    }

    @IsTest
    private static void testInnTypes() {
        Account a = [SELECT  Id FROM Account LIMIT 1];

        String result = new SoqlCondition.Builder()
            .inn('Boolean', new List<Boolean>{true}).orr()
            .inn('Date', new List<Date>{Date.today()}).orr()
            .inn('Datetime', new List<Datetime>{Datetime.now()}).orr()
            .inn('Decimal', new List<Decimal>{1.0}).orr()
            .inn('Double', new List<Double>{1.0}).orr()
            .inn('Id', new List<Id>{a.Id}).orr()
            .inn('Integer', new List<Integer>{1}).orr()
            .inn('Long', new List<Long>{Long.valueOf('9999999999999')}).orr()
            .inn('Object', new List<Object>{(Object) a}).orr()
            .inn('String', new List<String>{'Test'}).orr()
            .inn('Time', new List<Time>{Time.newInstance(1,1,1,1)})
            .build().toString();
        Integer symbolCount = result.countMatches('IN ');
        System.assertNotEquals(null, result);
        System.assertEquals(11, symbolCount, 'wrong symbol count: ' + result);
    }

    @IsTest
    private static void testNinnTypes() {
        Account a = [SELECT  Id FROM Account LIMIT 1];

        String result = new SoqlCondition.Builder()
            .ninn('Boolean', new List<Boolean>{true}).orr()
            .ninn('Date', new List<Date>{Date.today()}).orr()
            .ninn('Datetime', new List<Datetime>{Datetime.now()}).orr()
            .ninn('Decimal', new List<Decimal>{1.0}).orr()
            .ninn('Double', new List<Double>{1.0}).orr()
            .ninn('Id', new List<Id>{a.Id}).orr()
            .ninn('Integer', new List<Integer>{1}).orr()
            .ninn('Long', new List<Long>{Long.valueOf('9999999999999')}).orr()
            .ninn('Object', new List<Object>{(Object) a}).orr()
            .ninn('String', new List<String>{'Test'}).orr()
            .ninn('Time', new List<Time>{Time.newInstance(1,1,1,1)})
            .build().toString();
        Integer symbolCount = result.countMatches('NOT IN ');
        System.assertNotEquals(null, result);
        System.assertEquals(11, symbolCount, 'wrong symbol count: ' + result);
    }

    @IsTest
    private static void testIncTypes() {
        Account a = [SELECT Id FROM Account LIMIT 1];

        String result = new SoqlCondition.Builder()
            .inc('Boolean', new List<Boolean>{true}).orr()
            .inc('Date', new List<Date>{Date.today()}).orr()
            .inc('Datetime', new List<Datetime>{Datetime.now()}).orr()
            .inc('Decimal', new List<Decimal>{1.0}).orr()
            .inc('Double', new List<Double>{1.0}).orr()
            .inc('Id', new List<Id>{a.Id}).orr()
            .inc('Integer', new List<Integer>{1}).orr()
            .inc('Long', new List<Long>{Long.valueOf('9999999999999')}).orr()
            .inc('Object', new List<Object>{(Object) a}).orr()
            .inc('String', new List<String>{'Test'}).orr()
            .inc('Time', new List<Time>{Time.newInstance(1,1,1,1)})
            .build().toString();
        Integer symbolCount = result.countMatches('INCLUDES ');
        System.assertNotEquals(null, result);
        System.assertEquals(11, symbolCount, 'wrong symbol count: ' + result);
    }

    @IsTest
    private static void testExcTypes() {
        Account a = [SELECT Id FROM Account LIMIT 1];

        String result = new SoqlCondition.Builder()
                .exc('Boolean', new List<Boolean>{true}).orr()
                .exc('Date', new List<Date>{Date.today()}).orr()
                .exc('Datetime', new List<Datetime>{Datetime.now()}).orr()
                .exc('Decimal', new List<Decimal>{1.0}).orr()
                .exc('Double', new List<Double>{1.0}).orr()
                .exc('Id', new List<Id>{a.Id}).orr()
                .exc('Integer', new List<Integer>{1}).orr()
                .exc('Long', new List<Long>{Long.valueOf('9999999999999')}).orr()
                .exc('Object', new List<Object>{(Object) a}).orr()
                .exc('String', new List<String>{'Test'}).orr()
                .exc('Time', new List<Time>{Time.newInstance(1,1,1,1)})
                .build().toString();
        Integer symbolCount = result.countMatches('EXCLUDES ');
        System.assertNotEquals(null, result);
        System.assertEquals(11, symbolCount, 'wrong symbol count: ' + result);
    }

    @IsTest
    private static void testLikeTypes() {
        String result = new SoqlCondition.Builder()
                .likee('Name', '%Test%')
                .build().toString();

        System.assertEquals('Name LIKE \'%Test%\' ', result, 'assertion failed with result: ' + result);
    }

    @IsTest
    private static void testEqNulls() {
        Account a = [SELECT Id FROM Account LIMIT  1];
        String result = new SoqlCondition.Builder()
                .eqNull(true).orr()
                .eqNull(Date.today()).orr()
                .eqNull(Datetime.now()).orr()
                .eqNull(1.0).orr()
                .eqNull(Double.valueOf('1.0')).orr()
                .eqNull(a.Id).orr()
                .eqNull(1).orr()
                .eqNull(Long.valueOf('9999999999999')).orr()
                .eqNull((Object) a).orr()
                .eqNull('Test').orr()
                .eqNull(Time.newInstance(1,1,1,1))
                .build().toString();
        Integer symbolCount = result.countMatches('NULL');
        System.assertNotEquals(null, result);
        System.assertEquals(11, symbolCount);
    }

    @IsTest
    private static void testNeqNulls() {
        Account a = [SELECT Id FROM Account LIMIT  1];
        String result = new SoqlCondition.Builder()
                .neqNull(true).orr()
                .neqNull(Date.today()).orr()
                .neqNull(Datetime.now()).orr()
                .neqNull(1.0).orr()
                .neqNull(Double.valueOf('1.0')).orr()
                .neqNull(a.Id).orr()
                .neqNull(1).orr()
                .neqNull(Long.valueOf('9999999999999')).orr()
                .neqNull((Object) a).orr()
                .neqNull('Test').orr()
                .neqNull(Time.newInstance(1,1,1,1))
                .build().toString();
        Integer symbolCount = result.countMatches('NULL');
        System.assertNotEquals(null, result);
        System.assertEquals(11, symbolCount);
    }

    @IsTest
    private static void testParenSingleCondition() {
        SoqlCondition condition = new SoqlCondition.Builder().eq('Name', 'Test2').build();
        String result = new SoqlCondition.Builder()
                .eq('Name', 'Test').orr()
                .paren(condition)
                .build().toString();
        System.assertEquals('Name = \'Test\' OR ( Name = \'Test2\'  ) ', result);
    }

    /*************** Integration Tests ***************/
    @IsTest
    private static void testDBExecuteSimple() {
        Account a = new Account(Name = 'Test2');
        insert a;

        List<Account> accounts = [SELECT Name FROM Account];
        String condition = new SoqlCondition.Builder().eq('Name', 'Test2').build().toString();
        String q = 'SELECT Name FROM ACCOUNT WHERE ' + condition;

        List<Account> result = Database.query(q);

        System.assert(!result.isEmpty());
        System.assertEquals(1, result.size());
        System.assertEquals('Test2', result[0].Name);
    }

    @IsTest
    private static void testDBExecuteSimpleChain() {
        List<Account> data = getAccounts('Test', 2, 1);

        String condition1 = new SoqlCondition.Builder()
                .eq('Name', data[0].Name).andd()
                .eq('NumberOfEmployees', data[0].NumberOfEmployees)
                .build().toString();
        String condition2 = new SoqlCondition.Builder()
                .eq('Name', data[1].Name).andd()
                .eq('NumberOfEmployees', data[1].NumberOfEmployees)
                .build().toString();

        String base = 'SELECT Name FROM Account WHERE ';

        List<Account> result = Database.query(base + condition1);
        List<Account> result2 = Database.query(base + condition2);

        System.assert(!result.isEmpty());
        System.assertEquals(1, result.size());
        System.assertEquals(data[0].Name, result[0].Name);

        System.assert(!result2.isEmpty());
        System.assertEquals(1, result2.size());
        System.assertEquals(data[1].Name, result2[0].Name);
    }

    @IsTest
    private static void testDBExecuteMedium() {
        List<Account> data = getAccounts('Test', 9, 1);

        String condition = new SoqlCondition.Builder()
                .paren(
                        new SoqlCondition.Builder()
                        .eq('Name', data[0].Name).andd()
                        .eq('NumberOfEmployees', data[0].NumberOfEmployees).build()
                ).orr()
                .eq('Name', data[1].Name).orr()
                .paren(
                        new SoqlCondition.Builder()
                        .eq('NumberOfEmployees', data[2].NumberOfEmployees).andd()
                        .eq('Name', data[2].Name).build()
                ).build().toString();

        String base = 'SELECT Name, NumberOfEmployees FROM Account WHERE ';
        List<Account> result = Database.query(base + condition);

        System.assert(!result.isEmpty());
        System.assertEquals(3, result.size());
        Boolean contains0 = false, contains1 = false, contains2 = false;
        for(Account r : result) {
            if(r.Name == data[0].Name && r.NumberOfEmployees == data[0].NumberOfEmployees) {
                contains0 = true;
            }
            if(r.Name == data[1].Name) {
                contains1 = true;
            }
            if(r.Name == data[2].Name && r.NumberOfEmployees == data[2].NumberOfEmployees) {
                contains2 = true;
            }
        }
        System.assert(contains0, 'Missing match for 1st condition');
        System.assert(contains1, 'Missing match for 2nd condition');
        System.assert(contains2, 'Missing match for 3rd condition');
    }

    /************** Helper methods **************/
    private static List<Account> getAccounts(String name, Integer amount, Integer offset) {
        List<Account> accounts = new List<Account>();
        for(Integer i=0; i<amount; i++) {
            accounts.add(new Account(
                    Name = name + String.valueOf(i + offset),
                    NumberOfEmployees = Integer.valueOf(10 * Math.random())
            ));
        }
        insert accounts;
        return accounts;
    }
}