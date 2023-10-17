import {api } from 'lwc';
import CqGridForm from 'c/cqGridForm';
import CQ_NN_SQX_MENU_ITEM__C from '@salesforce/schema/CQ_NN_SQX_Menu_Item__c';


import FIELDS_PARENT_ID from '@salesforce/schema/CQ_NN_SQX_Restaurant__c.Id';

import FIELDS_PARENT_NAME from '@salesforce/schema/CQ_NN_SQX_Restaurant__c.Name';

import FIELDS_PARENT_STATUS__C from '@salesforce/schema/CQ_NN_SQX_Restaurant__c.Status__c';





//import fields


import FIELDS_CQ_NN_SQX_MENU_ITEM__C_NAME from '@salesforce/schema/CQ_NN_SQX_Menu_Item__c.Name';

import FIELDS_CQ_NN_SQX_MENU_ITEM__C_CQ_NN_DRINK_TYPE__C from '@salesforce/schema/CQ_NN_SQX_Menu_Item__c.CQ_NN_Drink_Type__c';

import FIELDS_CQ_NN_SQX_MENU_ITEM__C_CQ_NN_TITLE__C from '@salesforce/schema/CQ_NN_SQX_Menu_Item__c.CQ_NN_Title__c';

import FIELDS_CQ_NN_SQX_MENU_ITEM__C_CQ_NN_SQX_RESTAURANT__C from '@salesforce/schema/CQ_NN_SQX_Menu_Item__c.CQ_NN_SQX_Restaurant__c';

import FIELDS_CQ_NN_SQX_MENU_ITEM__C_CQ_NN_SQX_RESTAURANT__R_NAME from '@salesforce/schema/CQ_NN_SQX_Menu_Item__c.CQ_NN_SQX_Restaurant__r.Name';

import FIELDS_CQ_NN_SQX_MENU_ITEM__C_CQ_NN_DATE__C from '@salesforce/schema/CQ_NN_SQX_Menu_Item__c.CQ_NN_Date__c';


//import customlabels (Labels must not have space)

import CQNN_BULK_EDIT from '@salesforce/label/c.CQNN_BULK_EDIT';

import CQNN_NEW from '@salesforce/label/c.CQNN_NEW';




            
import CQNN_FIELDS_SUMMARY from '@salesforce/label/c.CQNN_FIELDS_SUMMARY';
            

//additonalFields added in query while fetching data
const additionalFields = [



];
const columns = [


    FIELDS_CQ_NN_SQX_MENU_ITEM__C_NAME,

        
    FIELDS_CQ_NN_SQX_MENU_ITEM__C_CQ_NN_DRINK_TYPE__C,

        
    FIELDS_CQ_NN_SQX_MENU_ITEM__C_CQ_NN_TITLE__C,

        
               
              {
                
                    label: CQNN_FIELDS_SUMMARY,
                
                
                    type:'customComponent',
                
                

                    fields:[
                    
                    
                        {
                            fieldInfo:FIELDS_CQ_NN_SQX_MENU_ITEM__C_CQ_NN_SQX_RESTAURANT__C
                            
                            ,displayField:FIELDS_CQ_NN_SQX_MENU_ITEM__C_CQ_NN_SQX_RESTAURANT__R_NAME
                            
                            
                            ,displayType:'hyperLink'
                            
                            
                        },
                        
                        {
                            fieldInfo:FIELDS_CQ_NN_SQX_MENU_ITEM__C_CQ_NN_DATE__C
                            
                            
                            
                        },
                        
                    ],
                

                
                    groupName:'fieldsSummaryGroup'
                

               },
          
    
];

const parentFields = [

    FIELDS_PARENT_ID,

    FIELDS_PARENT_NAME,

    FIELDS_PARENT_STATUS__C,

];

export default class cquiNNNnMenuItemGrid  extends CqGridForm {
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
        this.mainObject = CQ_NN_SQX_MENU_ITEM__C;
        this.relationalField = FIELDS_CQ_NN_SQX_MENU_ITEM__C_CQ_NN_SQX_RESTAURANT__C; //todo use this in import
        this.additionalFields = additionalFields;
        this.parentFields = parentFields;

        
        this.headerActions = [{"label": CQNN_BULK_EDIT,"name":"showEditSelected","componentName":"cqui-n-n-nn-menu-item-both","component_namespace":"c__","action_type":"","bulk":true},{"label": CQNN_NEW,"name":"std_new","componentName":"cqui-n-n-nn-menu-item-both"},];
        

        this.limitToRecordType = '';

        
        this.rowActions = [];
        

        
        this.rowFormRules = {"delete":{"fields":["Status__c","Name"],"visible":"parent.Status__c.value != 'Complete'   && parent.Name.value != 'Closed'  "},"edit":{"fields":["Status__c","Status__c"],"visible":"parent.Status__c.value != 'Complete'   && parent.Status__c.value != 'Closed'  "}};
        

        
        this.headerFormRules = {"std_new":{"fields":["Status__c","Status__c"],"visible":"parent.Status__c.value != 'Complete'   && parent.Status__c.value != 'Closed'  "},"showEditSelected":{"fields":["Status__c","Status__c"],"visible":"parent.Status__c.value != 'Complete'   || parent.Status__c.value != 'Closed'  "}};
        

        
        
    
               
                   
        this.lookupFields[FIELDS_CQ_NN_SQX_MENU_ITEM__C_CQ_NN_SQX_RESTAURANT__C.fieldApiName]=FIELDS_CQ_NN_SQX_MENU_ITEM__C_CQ_NN_SQX_RESTAURANT__R_NAME;
                   

             
        

        
        this.sortOrder = 'ASC NULLS LAST';
        

        

        

        

        

        this.componentName="c:cquiNNNnMenuItemGrid";

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