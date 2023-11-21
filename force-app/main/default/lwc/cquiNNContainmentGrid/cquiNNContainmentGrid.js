import {api } from 'lwc';
import CqGridForm from 'c/cqGridForm';
import COMPLIANCEQUEST__SQX_CONTAINMENT__C from '@salesforce/schema/compliancequest__SQX_Containment__c';


import FIELDS_PARENT_ID from '@salesforce/schema/compliancequest__SQX_Nonconformance__c.Id';

import FIELDS_PARENT_NAME from '@salesforce/schema/compliancequest__SQX_Nonconformance__c.Name';





//import fields


import FIELDS_COMPLIANCEQUEST__SQX_CONTAINMENT__C_NAME from '@salesforce/schema/compliancequest__SQX_Containment__c.Name';

import FIELDS_COMPLIANCEQUEST__SQX_CONTAINMENT__C_COMPLIANCEQUEST__DESCRIPTION__C from '@salesforce/schema/compliancequest__SQX_Containment__c.compliancequest__Description__c';

import FIELDS_COMPLIANCEQUEST__SQX_CONTAINMENT__C_COMPLIANCEQUEST__SQX_USER__C from '@salesforce/schema/compliancequest__SQX_Containment__c.compliancequest__SQX_User__c';

import FIELDS_COMPLIANCEQUEST__SQX_CONTAINMENT__C_COMPLIANCEQUEST__SQX_USER__R_NAME from '@salesforce/schema/compliancequest__SQX_Containment__c.compliancequest__SQX_User__r.Name';

import FIELDS_COMPLIANCEQUEST__SQX_CONTAINMENT__C_COMPLIANCEQUEST__DUE_DATE__C from '@salesforce/schema/compliancequest__SQX_Containment__c.compliancequest__Due_Date__c';

import FIELDS_COMPLIANCEQUEST__SQX_CONTAINMENT__C_COMPLIANCEQUEST__STATUS__C from '@salesforce/schema/compliancequest__SQX_Containment__c.compliancequest__Status__c';

import FIELDS_COMPLIANCEQUEST__SQX_CONTAINMENT__C_COMPLIANCEQUEST__COMPLETION_DATE__C from '@salesforce/schema/compliancequest__SQX_Containment__c.compliancequest__Completion_Date__c';

import FIELDS_COMPLIANCEQUEST__SQX_CONTAINMENT__C_COMPLIANCEQUEST__SQX_NONCONFORMANCE__C from '@salesforce/schema/compliancequest__SQX_Containment__c.compliancequest__SQX_Nonconformance__c';


//import customlabels (Labels must not have space)

import CQNN_NEW from '@salesforce/label/c.CQNN_NEW';





//additonalFields added in query while fetching data
const additionalFields = [



];
const columns = [


    FIELDS_COMPLIANCEQUEST__SQX_CONTAINMENT__C_NAME,

        
    FIELDS_COMPLIANCEQUEST__SQX_CONTAINMENT__C_COMPLIANCEQUEST__DESCRIPTION__C,

        
    FIELDS_COMPLIANCEQUEST__SQX_CONTAINMENT__C_COMPLIANCEQUEST__SQX_USER__C,
                
            
    FIELDS_COMPLIANCEQUEST__SQX_CONTAINMENT__C_COMPLIANCEQUEST__DUE_DATE__C,

        
    FIELDS_COMPLIANCEQUEST__SQX_CONTAINMENT__C_COMPLIANCEQUEST__STATUS__C,

        
    FIELDS_COMPLIANCEQUEST__SQX_CONTAINMENT__C_COMPLIANCEQUEST__COMPLETION_DATE__C,

        
    
];

const parentFields = [

    FIELDS_PARENT_ID,

    FIELDS_PARENT_NAME,

];

export default class cquiNNContainmentGrid  extends CqGridForm {
    @api
    maxRows;

    @api
    maxColumns;

    @api
    gridType;

    @api
    flexipageRegionWidth;
    
    constructor() {
        super();
        this.fields = columns;
        this.columns = columns;
        this.mainObject = COMPLIANCEQUEST__SQX_CONTAINMENT__C;
        this.relationalField = FIELDS_COMPLIANCEQUEST__SQX_CONTAINMENT__C_COMPLIANCEQUEST__SQX_NONCONFORMANCE__C; //todo use this in import
        this.additionalFields = additionalFields;
        this.parentFields = parentFields;

        
        this.headerActions = [{"label": CQNN_NEW,"name":"std_new","componentName":"cqui-n-n-containment-create"},];
        

        this.limitToRecordType = '';

        
        this.rowActions = [];
        

        
        this.rowFormRules = {};
        

        
        this.headerFormRules = {};
        

        
        
    
        this.lookupFields[FIELDS_COMPLIANCEQUEST__SQX_CONTAINMENT__C_COMPLIANCEQUEST__SQX_USER__C.fieldApiName] = FIELDS_COMPLIANCEQUEST__SQX_CONTAINMENT__C_COMPLIANCEQUEST__SQX_USER__R_NAME;
                
                
            
        

        
        this.sortOrder = 'ASC NULLS LAST';
        

        

        

        

        

        this.componentName="c:cquiNNContainmentGrid";

    }

    connectedCallback(){
        this.maxRowsToDisplay = this.maxRows;
        this.maxColumnsToDisplay = this.maxColumns;
        this.gridDesktopView = this.gridType;
    }

    @api 
    get recordId() {
        return this._recordId;
    }

    set recordId(value) {
        this._recordId = value;
    }

}