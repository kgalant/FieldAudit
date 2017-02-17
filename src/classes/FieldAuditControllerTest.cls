@isTest
private class FieldAuditControllerTest {
	
	@isTest static void testFieldAuditController() {
		FieldAuditController fac = new FieldAuditController();
		System.assert(fac.myLines.size() > 0);
	}
	
}