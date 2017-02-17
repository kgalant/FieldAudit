public with sharing class FieldAuditController {

	public List<String> myLines {get; set;}
    private final String separator = ',';
    private final String newLine = '\n';
    private final String quote = '"';

    public FieldAuditController() {

        myLines = new List<String>();

        // first, generate the header line

        String header = 'ObjectFullName' + separator + 'ObjectName' + separator + 'ObjectLabel' + separator + String.join(fieldNames, separator);
        

        // now generate a list of all the objects, fields, etc.

        Map <String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        for (Schema.SObjectType typ : schemaMap.values()) {           
            Map <String, Schema.SObjectField> fieldMap = typ.getDescribe().fields.getMap();
            for (Schema.SObjectField myField : fieldMap.values() ) {
                String line = typ.getDescribe().getName() + separator + String.valueOf(typ) + separator + typ.getDescribe().getLabel();
                Schema.DescribeFieldResult dfr = myfield.getDescribe();
                if (line.contains('__c') || dfr.getLocalName().contains('__c')) { // only list custom fields for std objects or everything for custom objects
                    for (String field : fieldNames) {
                        if (field == 'FieldName') line += separator + String.valueOf(dfr.getLocalName());
                        if (field == 'FieldLabel') line += separator + quote + String.valueOf(dfr.getLabel()) + quote;
                        if (field == 'Data Type') line += separator + String.valueOf(dfr.getType());
                        if (field == 'Length') line += separator + String.valueOf(dfr.getLength());
                        if (field == 'InlineHelpText') line += separator + quote + 
                            (String.valueOf(dfr.getInlineHelpText()) != null ? String.valueOf(dfr.getInlineHelpText()).replace('"','\'') : '') + quote;
                        if (field == 'Digits') line += separator + String.valueOf(dfr.getDigits());
                        if (field == 'Scale') line += separator + String.valueOf(dfr.getScale());
                        if (field == 'Precision') line += separator + String.valueOf(dfr.getPrecision());
                        if (field == 'IsPicklist') line += separator + (dfr.getType() == Schema.DisplayType.Picklist || dfr.getType() == Schema.DisplayType.MultiPicklist ? 'true' : 'false');
                        if (field == 'PicklistValues') {
                            line += separator + quote;
                            if (dfr.getType() == Schema.DisplayType.Picklist || dfr.getType() == Schema.DisplayType.MultiPicklist) {
                                List<Schema.PicklistEntry> picklistValues = dfr.getPicklistValues();
                                
                                for (Schema.PicklistEntry ple : picklistValues)  {
                                    line += ple.getValue() + '##';
                                }
                            }
                            line += quote;
                        }
                        if (field == 'RefersTo') {
                            line += separator + quote;
                            if (dfr.getType() == Schema.DisplayType.Reference) {
                                List<Schema.sObjectType> refsTo = dfr.getReferenceTo();
                                
                                for (Schema.sObjectType refTo : refsTo)  {
                                    line += String.valueOf(refTo) + '##';
                                }
                            }
                            line += quote;
                        }
                        if (field == 'Required') {
                            line += separator + (dfr.isCreateable() && !dfr.isNillable() && !dfr.isDefaultedOnCreate() ? 'true' : 'false');
                        }
                    }
                    myLines.add(line + newLine);
                }             
            }
            
        }
        myLines.sort();
        myLines.set(0, header + newLine);
    }

    private List<String> fieldNames = new List<String>{
        'FieldName',
        'FieldLabel',
        'Data Type',
        'Length',
        'InlineHelpText',
        'Digits',
        'Precision',
        'Scale',
        'IsPicklist',
        'PicklistValues',
        'RefersTo',
        'Required'          
    };
}