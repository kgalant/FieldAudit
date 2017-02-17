Map <String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
for (Schema.SObjectType typ : schemaMap.values()) {
    Map <String, Schema.SObjectField> fieldMap = typ.getDescribe().fields.getMap();
    for (Schema.SObjectField myField : fieldMap.values() ) {
		Schema.DescribeFieldResult dfr = myfield.getDescribe();

		String myLabel = dfr.getLabel();
		Integer myLength = dfr.getLength();
		String myLocalName = dfr.getLocalName();
		String myInlineHelpText = dfr.getInlineHelpText();
		Integer myDigits = dfr.getDigits();

		System.debug('Object: ' + String.valueOf(typ) + ' Field: ' + myLocalName + ' Label: ' + myLabel + ' Length: ' + myLength);
	}
}
/*
		String myAccessible = dfr.isAccessible();
		String myAutoNumber = dfr.isAutoNumber();
		String myByteLength = dfr.getByteLength();
		String myCalculated = dfr.isCalculated();
		String myCalculatedFormula = dfr.getCalculatedFormula();
		String myCascadeDelete = dfr.isCascadeDelete();
		String myCaseSensitive = dfr.isCaseSensitive();
		String myController = dfr.getController();
		String myCreateable = dfr.isCreateable();
		String myCustom = dfr.isCustom();
		String myDefaultedOnCreate = dfr.isDefaultedOnCreate();
		String myDefaultValue = dfr.getDefaultValue();
		String myDefaultValueFormula = dfr.getDefaultValueFormula();
		String myDependentPicklist = dfr.isDependentPicklist();
		String myDeprecatedAndHidden = dfr.isDeprecatedAndHidden();
		
		String myExternalID = dfr.isExternalID();
		String myFilterable = dfr.isFilterable();
		String myGroupable = dfr.isGroupable();
		String myHtmlFormatted = dfr.isHtmlFormatted();
		String myIdLookup = dfr.isIdLookup();
		
		String myName = dfr.getName();
		String myNameField = dfr.isNameField();
		String myNamePointing = dfr.isNamePointing();
		String myNillable = dfr.isNillable();
		boolean myPermissionable = dfr.isPermissionable();
		String myPicklistValues = dfr.getPicklistValues();
		String myPrecision = dfr.getPrecision();
		String myReferenceTargetField = dfr.getReferenceTargetField();
		String myReferenceTo = dfr.getReferenceTo();
		String myRelationshipName = dfr.getRelationshipName();
		Integer myRelationshipOrder = dfr.getRelationshipOrder();
		boolean myRestrictedDelete = dfr.isRestrictedDelete();
		boolean myRestrictedPicklist = dfr.isRestrictedPicklist();
		Integer myScale = dfr.getScale();
		boolean mySortable = dfr.isSortable();
		boolean myUnique = dfr.isUnique();
		boolean myUpdateable = dfr.isUpdateable();
		boolean myWriteRequiresMasterRead = dfr.isWriteRequiresMasterRead();
		*/

System.debug('objectNames: ' + stdObjectNames);