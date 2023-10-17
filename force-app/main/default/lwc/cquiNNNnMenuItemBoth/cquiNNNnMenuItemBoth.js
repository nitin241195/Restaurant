// basic import
import { track, api} from 'lwc';
import cqRecordForm from 'c/cqRecordForm';





// field and schema import

// Object_<Object api name without __c if present>
import OBJECT_CQ_NN_SQX_MENU_ITEM__C from '@salesforce/schema/CQ_NN_SQX_Menu_Item__c';


// Field_<field api name without __c if present>

import FIELD_NAME from '@salesforce/schema/CQ_NN_SQX_Menu_Item__c.Name';

import FIELD_OWNERID from '@salesforce/schema/CQ_NN_SQX_Menu_Item__c.OwnerId';

import FIELD_CQ_NN_SQX_RESTAURANT__C from '@salesforce/schema/CQ_NN_SQX_Menu_Item__c.CQ_NN_SQX_Restaurant__c';

import FIELD_CQ_NN_DRINK_TYPE__C from '@salesforce/schema/CQ_NN_SQX_Menu_Item__c.CQ_NN_Drink_Type__c';

import FIELD_CQ_NN_TITLE__C from '@salesforce/schema/CQ_NN_SQX_Menu_Item__c.CQ_NN_Title__c';

import FIELD_CQ_NN_DATE__C from '@salesforce/schema/CQ_NN_SQX_Menu_Item__c.CQ_NN_Date__c';

import FIELD_CQ_NN_SQX_USER__C from '@salesforce/schema/CQ_NN_SQX_Menu_Item__c.CQ_NN_SQX_User__c';

import FIELD_CQ_NN_ITEM_IMAGE__C from '@salesforce/schema/CQ_NN_SQX_Menu_Item__c.CQ_NN_Item_Image__c';

import FIELD_CREATEDBYID from '@salesforce/schema/CQ_NN_SQX_Menu_Item__c.CreatedById';

import FIELD_LASTMODIFIEDBYID from '@salesforce/schema/CQ_NN_SQX_Menu_Item__c.LastModifiedById';





// additional Field_<field api name without __c if present>



// Lookup fields Field_<field api name without __c if present>_<name field>


    


    


    
import FIELD_CQ_NN_SQX_RESTAURANT__NAME from '@salesforce/schema/CQ_NN_SQX_Menu_Item__c.CQ_NN_SQX_Restaurant__r.Name';
    


    


    


    


    
import FIELD_CQ_NN_SQX_USER__NAME from '@salesforce/schema/CQ_NN_SQX_Menu_Item__c.CQ_NN_SQX_User__r.Name';
    


    


    


    



// import section custom label
    
        
import CQNN_INFORMATION from '@salesforce/label/c.CQNN_INFORMATION';
        
    
        
import CQNN_SYSTEM_INFORMATION from '@salesforce/label/c.CQNN_SYSTEM_INFORMATION';
        
    
        
    


    


// generated to match the indext with the exact value field


// import as array to help in code generation below

const fields = [
 

    
    FIELD_NAME,
    
    FIELD_OWNERID,
    
    FIELD_CQ_NN_SQX_RESTAURANT__C,
    
    FIELD_CQ_NN_DRINK_TYPE__C,
    
    FIELD_CQ_NN_TITLE__C,
    
    FIELD_CQ_NN_DATE__C,
    
    FIELD_CQ_NN_SQX_USER__C,
    
    FIELD_CQ_NN_ITEM_IMAGE__C,
    
    FIELD_CREATEDBYID,
    
    FIELD_LASTMODIFIEDBYID,
    
    
    
        
    
        
    
        
    FIELD_CQ_NN_SQX_RESTAURANT__NAME,
        
    
        
    
        
    
        
    
        
    FIELD_CQ_NN_SQX_USER__NAME,
        
    
        
    
        
    
        
    
];

const lookupDisplayFields = {
    
    
        

        

        
    "CQ_NN_SQX_Restaurant__c": FIELD_CQ_NN_SQX_RESTAURANT__NAME,
    

        

        

        

        
    "CQ_NN_SQX_User__c": FIELD_CQ_NN_SQX_USER__NAME,
    

        

        

        

};

const LOOKUP_FILTERS = {};
const DYNAMIC_SOURCES = {};
const FORM_RULES = {};
const FORMULA_FIELDS = {};

export default class cquiNNNnMenuItemBoth  extends cqRecordForm {
    
    @track
    sectionHider = {};
    fieldsToTrack = [];
    saveImmediate = false;

    constructor() {
        super();
        this.init(OBJECT_CQ_NN_SQX_MENU_ITEM__C,fields,lookupDisplayFields);
        
        
        this.sectionHider = {"expando_unique_id_1":true,"expando_unique_id_2":true,"expando_unique_id_3":true}

        // Extend rules
        this.lookupFilters = LOOKUP_FILTERS;
        this.dynamicSources = DYNAMIC_SOURCES;
        this.inputFormRules = FORM_RULES;
        this.systemFormRules = FORMULA_FIELDS;
        this.picklistValueSource = {
            
        };
        this.uiType = {"Upload_File__c":{"type":"file","showFilePicker":true,"shareContent":true},"CQ_NN_Item_Image__c":{"type":"file","showFilePicker":true,"shareContent":true}};
        this.parentRecordApi="";
        
    }


    @api
    get recordId() {
        return this._recordId;
    }
    set recordId(value) {
        this._recordId = value;
        this.parentId = value;
    }

    // getters for field value, display value and field metadata
    
    get v_NAME() {
        return this.getValueFor(FIELD_NAME.fieldApiName);
    }
    get f_NAME() {
        let val=this.fieldsInfo ? this.fieldsInfo[FIELD_NAME.fieldApiName] : {};
        return val;
    }

    get d_NAME() {
        return lookupDisplayFields[FIELD_NAME.fieldApiName] && this.getValueFor(lookupDisplayFields[FIELD_NAME.fieldApiName].fieldApiName);
    }

    
    get v_OWNERID() {
        return this.getValueFor(FIELD_OWNERID.fieldApiName);
    }
    get f_OWNERID() {
        let val=this.fieldsInfo ? this.fieldsInfo[FIELD_OWNERID.fieldApiName] : {};
        return val;
    }

    get d_OWNERID() {
        return lookupDisplayFields[FIELD_OWNERID.fieldApiName] && this.getValueFor(lookupDisplayFields[FIELD_OWNERID.fieldApiName].fieldApiName);
    }

    
    get v_CQ_NN_SQX_RESTAURANT__C() {
        return this.getValueFor(FIELD_CQ_NN_SQX_RESTAURANT__C.fieldApiName);
    }
    get f_CQ_NN_SQX_RESTAURANT__C() {
        let val=this.fieldsInfo ? this.fieldsInfo[FIELD_CQ_NN_SQX_RESTAURANT__C.fieldApiName] : {};
        return val;
    }

    get d_CQ_NN_SQX_RESTAURANT__C() {
        return lookupDisplayFields[FIELD_CQ_NN_SQX_RESTAURANT__C.fieldApiName] && this.getValueFor(lookupDisplayFields[FIELD_CQ_NN_SQX_RESTAURANT__C.fieldApiName].fieldApiName);
    }

    
    get v_CQ_NN_DRINK_TYPE__C() {
        return this.getValueFor(FIELD_CQ_NN_DRINK_TYPE__C.fieldApiName);
    }
    get f_CQ_NN_DRINK_TYPE__C() {
        let val=this.fieldsInfo ? this.fieldsInfo[FIELD_CQ_NN_DRINK_TYPE__C.fieldApiName] : {};
        return val;
    }

    get d_CQ_NN_DRINK_TYPE__C() {
        return lookupDisplayFields[FIELD_CQ_NN_DRINK_TYPE__C.fieldApiName] && this.getValueFor(lookupDisplayFields[FIELD_CQ_NN_DRINK_TYPE__C.fieldApiName].fieldApiName);
    }

    
    get v_CQ_NN_TITLE__C() {
        return this.getValueFor(FIELD_CQ_NN_TITLE__C.fieldApiName);
    }
    get f_CQ_NN_TITLE__C() {
        let val=this.fieldsInfo ? this.fieldsInfo[FIELD_CQ_NN_TITLE__C.fieldApiName] : {};
        return val;
    }

    get d_CQ_NN_TITLE__C() {
        return lookupDisplayFields[FIELD_CQ_NN_TITLE__C.fieldApiName] && this.getValueFor(lookupDisplayFields[FIELD_CQ_NN_TITLE__C.fieldApiName].fieldApiName);
    }

    
    get v_CQ_NN_DATE__C() {
        return this.getValueFor(FIELD_CQ_NN_DATE__C.fieldApiName);
    }
    get f_CQ_NN_DATE__C() {
        let val=this.fieldsInfo ? this.fieldsInfo[FIELD_CQ_NN_DATE__C.fieldApiName] : {};
        return val;
    }

    get d_CQ_NN_DATE__C() {
        return lookupDisplayFields[FIELD_CQ_NN_DATE__C.fieldApiName] && this.getValueFor(lookupDisplayFields[FIELD_CQ_NN_DATE__C.fieldApiName].fieldApiName);
    }

    
    get v_CQ_NN_SQX_USER__C() {
        return this.getValueFor(FIELD_CQ_NN_SQX_USER__C.fieldApiName);
    }
    get f_CQ_NN_SQX_USER__C() {
        let val=this.fieldsInfo ? this.fieldsInfo[FIELD_CQ_NN_SQX_USER__C.fieldApiName] : {};
        return val;
    }

    get d_CQ_NN_SQX_USER__C() {
        return lookupDisplayFields[FIELD_CQ_NN_SQX_USER__C.fieldApiName] && this.getValueFor(lookupDisplayFields[FIELD_CQ_NN_SQX_USER__C.fieldApiName].fieldApiName);
    }

    
    get v_CQ_NN_ITEM_IMAGE__C() {
        return this.getValueFor(FIELD_CQ_NN_ITEM_IMAGE__C.fieldApiName);
    }
    get f_CQ_NN_ITEM_IMAGE__C() {
        let val=this.fieldsInfo ? this.fieldsInfo[FIELD_CQ_NN_ITEM_IMAGE__C.fieldApiName] : {};
        return val;
    }

    get d_CQ_NN_ITEM_IMAGE__C() {
        return lookupDisplayFields[FIELD_CQ_NN_ITEM_IMAGE__C.fieldApiName] && this.getValueFor(lookupDisplayFields[FIELD_CQ_NN_ITEM_IMAGE__C.fieldApiName].fieldApiName);
    }

    
    get v_CREATEDBYID() {
        return this.getValueFor(FIELD_CREATEDBYID.fieldApiName);
    }
    get f_CREATEDBYID() {
        let val=this.fieldsInfo ? this.fieldsInfo[FIELD_CREATEDBYID.fieldApiName] : {};
        return val;
    }

    get d_CREATEDBYID() {
        return lookupDisplayFields[FIELD_CREATEDBYID.fieldApiName] && this.getValueFor(lookupDisplayFields[FIELD_CREATEDBYID.fieldApiName].fieldApiName);
    }

    
    get v_LASTMODIFIEDBYID() {
        return this.getValueFor(FIELD_LASTMODIFIEDBYID.fieldApiName);
    }
    get f_LASTMODIFIEDBYID() {
        let val=this.fieldsInfo ? this.fieldsInfo[FIELD_LASTMODIFIEDBYID.fieldApiName] : {};
        return val;
    }

    get d_LASTMODIFIEDBYID() {
        return lookupDisplayFields[FIELD_LASTMODIFIEDBYID.fieldApiName] && this.getValueFor(lookupDisplayFields[FIELD_LASTMODIFIEDBYID.fieldApiName].fieldApiName);
    }

    


    
        
    get CQNN_INFORMATION() {
        return CQNN_INFORMATION;
    }
        
    
        
    get CQNN_SYSTEM_INFORMATION() {
        return CQNN_SYSTEM_INFORMATION;
    }
        
    
        
    
}