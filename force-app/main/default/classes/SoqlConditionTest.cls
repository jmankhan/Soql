@isTest
private class SoqlConditionTest {
	
	@isTest
	private static void testEq() {
		String result = new SoqlCondition.Builder().eq('Name', 'Test').build().toString().trim();
		System.assertEquals('Name=\'Test\'', result);
	}

	@isTest
	private static void testAnd() {
		String result = new SoqlCondition.Builder().eq('Name', 'Test').andd().eq('Id', 'Test').build().toString().trim();
		System.assertEquals('Name=\'Test\' And Id=\'Test\'', result);
	}

	@isTest
	private static void testOr() {
		String result = new SoqlCondition.Builder().eq('Name', 'Test').orr().eq('Id', 'Test').build().toString().trim();
		System.assertEquals('Name=\'Test\' Or Id=\'Test\'', result);
	}
    
    @isTest
    private static void testAndOr() {
        String result = new SoqlCondition.Builder().eq('Name', 'Test').andd().eq('Id', 'Test').orr().eq('Name', 'Test2').build().toString().trim();
		System.assertEquals('Name=\'Test\' And Id=\'Test\' Or Name=\'Test2\'', result);        
    }
    
    @isTest
    private static void testOrAnd() {
        String result = new SoqlCondition.Builder().eq('Name', 'Test').orr().eq('Id', 'Test').andd().eq('Name', 'Test2').build().toString().trim();
        System.assertEquals('Name=\'Test\' Or Id=\'Test\' And Name=\'Test2\'', result);
    }
    
    @isTest
    private static void testOrOr() {
        String result = new SoqlCondition.Builder()
            .eq('Name', 'Test')
            .orr()
            .eq('Name', 'Test2')
            .orr()
            .eq('Name', 'Test3')
            .build().toString().trim();
        System.assertEquals('Name=\'Test\' Or Name=\'Test2\' Or Name=\'Test3\'', result);
    }
    
    @isTest
    private static void testAndAnd() {
        String result = new SoqlCondition.Builder()
            .eq('Name', 'Test')
            .andd()
            .eq('Id', 'Test')
            .andd()
            .eq('City', 'Test')
            .build().toString().trim();
        System.assertEquals('Name=\'Test\' And Id=\'Test\' And City=\'Test\'', result);
    }
    
    @isTest
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
        System.assertEquals('Name=\'Test\' Or Id=\'Test\' And Name=\'Test2\' Or Id=\'Test2\'', result);
    }
    
    @isTest
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
        System.assertEquals('Name=\'Test\' And Id=\'Test\' Or Name=\'Test2\' And Id=\'Test2\'', result);
    }
    
    @isTest
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
        System.assertEquals('Name=\'Test\' And Id=\'Test\' And City=\'Test\' And State=\'Test\'', result);
    }
    
    @isTest
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
        System.assertEquals('Name=\'Test\' Or Name=\'Test2\' Or Name=\'Test3\' Or Name=\'Test4\'', result);
    }
 
 	@isTest
 	private static void testTypes() {
 		Account a = new Account(Name = 'Bob');
 		insert a;

 		String result = new SoqlCondition.Builder()
 			.eq('Blob', Blob.valueOf('Test')).orr()
 			.eq('Boolean', true).orr()
 			.eq('Date', Date.today()).orr()
 			.eq('Datetime', Datetime.now()).orr()
 			.eq('Decimal', 1.0).orr()
 			.eq('Double', 1.0).orr()
 			.eq('Id', a.Id).orr()
 			.eq('Integer', 1).orr()
 			.eq('Long', Long.valueOf('9999999999999')).orr()
 			.eq('Object', (Object) a).orr()
 			.eq('String', 'Test').orr()
 			.eq('Time', Time.newInstance(1,1,1,1))
 			.build().toString();
 		System.assertNotEquals(null, result);

 	}   
}