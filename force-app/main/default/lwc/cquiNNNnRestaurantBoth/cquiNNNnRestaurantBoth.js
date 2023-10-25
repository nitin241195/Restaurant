// basic import
import { track, api} from 'lwc';
import cqRecordForm from 'c/cqRecordForm';





// field and schema import

// Object_<Object api name without __c if present>
import OBJECT_CQ_NN_SQX_RESTAURANT__C from '@salesforce/schema/CQ_NN_SQX_Restaurant__c';


// Field_<field api name without __c if present>

import FIELD_NAME from '@salesforce/schema/CQ_NN_SQX_Restaurant__c.Name';

import FIELD_OWNERID from '@salesforce/schema/CQ_NN_SQX_Restaurant__c.OwnerId';

import FIELD_CQ_NN_SQX_ACCOUNT__C from '@salesforce/schema/CQ_NN_SQX_Restaurant__c.CQ_NN_SQX_Account__c';

import FIELD_CQ_NN_SQX_PART_FAMILY__C from '@salesforce/schema/CQ_NN_SQX_Restaurant__c.CQ_NN_SQX_Part_Family__c';

import FIELD_CQ_NN_SQX_PART__C from '@salesforce/schema/CQ_NN_SQX_Restaurant__c.CQ_NN_SQX_Part__c';

import FIELD_CQ_NN_CUISINE_TYPE__C from '@salesforce/schema/CQ_NN_SQX_Restaurant__c.CQ_NN_Cuisine_Type__c';

import FIELD_SQ_NN_TITLE__C from '@salesforce/schema/CQ_NN_SQX_Restaurant__c.SQ_NN_Title__c';

import FIELD_CQ_NN_DESCRIPTION__C from '@salesforce/schema/CQ_NN_SQX_Restaurant__c.CQ_NN_Description__c';

import FIELD_CQ_NN_TARGET_DATE__C from '@salesforce/schema/CQ_NN_SQX_Restaurant__c.CQ_NN_Target_Date__c';

import FIELD_CQ_NN_INITIATED_DATE__C from '@salesforce/schema/CQ_NN_SQX_Restaurant__c.CQ_NN_Initiated_Date__c';

import FIELD_CQ_NN_MEAL_TYPES_SERVED__C from '@salesforce/schema/CQ_NN_SQX_Restaurant__c.CQ_NN_Meal_Types_Served__c';

import FIELD_CQ_NN_SQX_USER__C from '@salesforce/schema/CQ_NN_SQX_Restaurant__c.CQ_NN_SQX_User__c';

import FIELD_STATUS__C from '@salesforce/schema/CQ_NN_SQX_Restaurant__c.Status__c';

import FIELD_UPLOAD_FILE__C from '@salesforce/schema/CQ_NN_SQX_Restaurant__c.Upload_File__c';

import FIELD_CQ_NN_CHILD_RECORD__C from '@salesforce/schema/CQ_NN_SQX_Restaurant__c.CQ_NN_Child_Record__c';

import FIELD_CREATEDBYID from '@salesforce/schema/CQ_NN_SQX_Restaurant__c.CreatedById';

import FIELD_LASTMODIFIEDBYID from '@salesforce/schema/CQ_NN_SQX_Restaurant__c.LastModifiedById';





// additional Field_<field api name without __c if present>



// Lookup fields Field_<field api name without __c if present>_<name field>


    


    


    
import FIELD_CQ_NN_SQX_ACCOUNT__NAME from '@salesforce/schema/CQ_NN_SQX_Restaurant__c.CQ_NN_SQX_Account__r.Name';
    


    
import FIELD_CQ_NN_SQX_PART_FAMILY__NAME from '@salesforce/schema/CQ_NN_SQX_Restaurant__c.CQ_NN_SQX_Part_Family__r.Name';
    


    
import FIELD_CQ_NN_SQX_PART__NAME from '@salesforce/schema/CQ_NN_SQX_Restaurant__c.CQ_NN_SQX_Part__r.Name';
    


    


    


    


    


    


    


    
import FIELD_CQ_NN_SQX_USER__NAME from '@salesforce/schema/CQ_NN_SQX_Restaurant__c.CQ_NN_SQX_User__r.Name';
    


    


    


    


    


    



// import section custom label
    
        
import CQNN_INFORMATION from '@salesforce/label/c.CQNN_INFORMATION';
        
    
        
import CQNN_SYSTEM_INFORMATION from '@salesforce/label/c.CQNN_SYSTEM_INFORMATION';
        
    
        
import CQNN_CUSTOM_LINKS from '@salesforce/label/c.CQNN_CUSTOM_LINKS';
        
    


    


// generated to match the indext with the exact value field


// import as array to help in code generation below

const fields = [
 

    
    FIELD_NAME,
    
    FIELD_OWNERID,
    
    FIELD_CQ_NN_SQX_ACCOUNT__C,
    
    FIELD_CQ_NN_SQX_PART_FAMILY__C,
    
    FIELD_CQ_NN_SQX_PART__C,
    
    FIELD_CQ_NN_CUISINE_TYPE__C,
    
    FIELD_SQ_NN_TITLE__C,
    
    FIELD_CQ_NN_DESCRIPTION__C,
    
    FIELD_CQ_NN_TARGET_DATE__C,
    
    FIELD_CQ_NN_INITIATED_DATE__C,
    
    FIELD_CQ_NN_MEAL_TYPES_SERVED__C,
    
    FIELD_CQ_NN_SQX_USER__C,
    
    FIELD_STATUS__C,
    
    FIELD_UPLOAD_FILE__C,
    
    FIELD_CQ_NN_CHILD_RECORD__C,
    
    FIELD_CREATEDBYID,
    
    FIELD_LASTMODIFIEDBYID,
    
    
    
        
    
        
    
        
    FIELD_CQ_NN_SQX_ACCOUNT__NAME,
        
    
        
    FIELD_CQ_NN_SQX_PART_FAMILY__NAME,
        
    
        
    FIELD_CQ_NN_SQX_PART__NAME,
        
    
        
    
        
    
        
    
        
    
        
    
        
    
        
    FIELD_CQ_NN_SQX_USER__NAME,
        
    
        
    
        
    
        
    
        
    
        
    
];

const lookupDisplayFields = {
    
    
        

        

        
    "CQ_NN_SQX_Account__c": FIELD_CQ_NN_SQX_ACCOUNT__NAME,
    

        
    "CQ_NN_SQX_Part_Family__c": FIELD_CQ_NN_SQX_PART_FAMILY__NAME,
    

        
    "CQ_NN_SQX_Part__c": FIELD_CQ_NN_SQX_PART__NAME,
    

        

        

        

        

        

        

        
    "CQ_NN_SQX_User__c": FIELD_CQ_NN_SQX_USER__NAME,
    

        

        

        

        

        

};

const LOOKUP_FILTERS = {"CQ_NN_SQX_Account__c":{"filters":[{"field":"compliancequest__Active__c","operator":"eq","isDynamic":false,"value":"Yes"},{"field":"RecordTypeId","operator":"eq","isDynamic":false,"usv_function":"reference","usv_param":"Name","value":"Supplier"}],"logic":"and","fields":[]},"CQ_NN_SQX_Part__c":{"fields":["CQ_NN_SQX_Part_Family__c"]}};
const DYNAMIC_SOURCES = {"CQ_NN_SQX_Part__c":{"ns":"","componentname":"CQUI_NN_Filter_Products_By_ProductFamily"}};
const FORM_RULES = {"CQ_NN_SQX_Account__c":{"transfer":[{"fields":["CQ_NN_SQX_Account__c"],"filter":"record.CQ_NN_SQX_Account__c   ","action":{"OwnerId":["CQ_NN_SQX_User__c"],"Owner":["CQ_NN_SQX_User__r"]}}]},"SQ_NN_Title__c":{"required":{"fields":["CQ_NN_Cuisine_Type__c"],"filter":"record.CQ_NN_Cuisine_Type__c == 'Indian' "}},"CQ_NN_Description__c":{"hidden":{"fields":["CQ_NN_Cuisine_Type__c"],"filter":"record.CQ_NN_Cuisine_Type__c == 'Indian' "}},"CQ_NN_SQX_User__c":{"readonly":{"fields":["CQ_NN_Target_Date__c"],"filter":"record.CQ_NN_Target_Date__c   "}},"onLoad":{"invoke":{"action":[{"name":"CQUI_NN_Update_Target_Date","ns":""}]}},"Upload_File__c":{"required":{"fields":["CQ_NN_Cuisine_Type__c"],"filter":"record.CQ_NN_Cuisine_Type__c == 'Indian' "}}};
const FORMULA_FIELDS = {};

export default class cquiNNNnRestaurantBoth  extends cqRecordForm {
    
    @track
    sectionHider = {};
    fieldsToTrack = [];
    saveImmediate = false;

    constructor() {
        super();
        this.init(OBJECT_CQ_NN_SQX_RESTAURANT__C,fields,lookupDisplayFields);
        
        
        this.sectionHider = {"expando_unique_id_1":true,"expando_unique_id_2":true,"expando_unique_id_3":true}

        // Extend rules
        this.lookupFilters = LOOKUP_FILTERS;
        this.dynamicSources = DYNAMIC_SOURCES;
        this.inputFormRules = FORM_RULES;
        this.systemFormRules = FORMULA_FIELDS;
        this.picklistValueSource = {
            
        };
        this.uiType = {"Upload_File__c":{"type":"file","showFilePicker":true,"shareContent":true}};
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

    
    get v_CQ_NN_SQX_ACCOUNT__C() {
        return this.getValueFor(FIELD_CQ_NN_SQX_ACCOUNT__C.fieldApiName);
    }
    get f_CQ_NN_SQX_ACCOUNT__C() {
        let val=this.fieldsInfo ? this.fieldsInfo[FIELD_CQ_NN_SQX_ACCOUNT__C.fieldApiName] : {};
        return val;
    }

    get d_CQ_NN_SQX_ACCOUNT__C() {
        return lookupDisplayFields[FIELD_CQ_NN_SQX_ACCOUNT__C.fieldApiName] && this.getValueFor(lookupDisplayFields[FIELD_CQ_NN_SQX_ACCOUNT__C.fieldApiName].fieldApiName);
    }

    
    get v_CQ_NN_SQX_PART_FAMILY__C() {
        return this.getValueFor(FIELD_CQ_NN_SQX_PART_FAMILY__C.fieldApiName);
    }
    get f_CQ_NN_SQX_PART_FAMILY__C() {
        let val=this.fieldsInfo ? this.fieldsInfo[FIELD_CQ_NN_SQX_PART_FAMILY__C.fieldApiName] : {};
        return val;
    }

    get d_CQ_NN_SQX_PART_FAMILY__C() {
        return lookupDisplayFields[FIELD_CQ_NN_SQX_PART_FAMILY__C.fieldApiName] && this.getValueFor(lookupDisplayFields[FIELD_CQ_NN_SQX_PART_FAMILY__C.fieldApiName].fieldApiName);
    }

    
    get v_CQ_NN_SQX_PART__C() {
        return this.getValueFor(FIELD_CQ_NN_SQX_PART__C.fieldApiName);
    }
    get f_CQ_NN_SQX_PART__C() {
        let val=this.fieldsInfo ? this.fieldsInfo[FIELD_CQ_NN_SQX_PART__C.fieldApiName] : {};
        return val;
    }

    get d_CQ_NN_SQX_PART__C() {
        return lookupDisplayFields[FIELD_CQ_NN_SQX_PART__C.fieldApiName] && this.getValueFor(lookupDisplayFields[FIELD_CQ_NN_SQX_PART__C.fieldApiName].fieldApiName);
    }

    
    get v_CQ_NN_CUISINE_TYPE__C() {
        return this.getValueFor(FIELD_CQ_NN_CUISINE_TYPE__C.fieldApiName);
    }
    get f_CQ_NN_CUISINE_TYPE__C() {
        let val=this.fieldsInfo ? this.fieldsInfo[FIELD_CQ_NN_CUISINE_TYPE__C.fieldApiName] : {};
        return val;
    }

    get d_CQ_NN_CUISINE_TYPE__C() {
        return lookupDisplayFields[FIELD_CQ_NN_CUISINE_TYPE__C.fieldApiName] && this.getValueFor(lookupDisplayFields[FIELD_CQ_NN_CUISINE_TYPE__C.fieldApiName].fieldApiName);
    }

    
    get v_SQ_NN_TITLE__C() {
        return this.getValueFor(FIELD_SQ_NN_TITLE__C.fieldApiName);
    }
    get f_SQ_NN_TITLE__C() {
        let val=this.fieldsInfo ? this.fieldsInfo[FIELD_SQ_NN_TITLE__C.fieldApiName] : {};
        return val;
    }

    get d_SQ_NN_TITLE__C() {
        return lookupDisplayFields[FIELD_SQ_NN_TITLE__C.fieldApiName] && this.getValueFor(lookupDisplayFields[FIELD_SQ_NN_TITLE__C.fieldApiName].fieldApiName);
    }

    
    get v_CQ_NN_DESCRIPTION__C() {
        return this.getValueFor(FIELD_CQ_NN_DESCRIPTION__C.fieldApiName);
    }
    get f_CQ_NN_DESCRIPTION__C() {
        let val=this.fieldsInfo ? this.fieldsInfo[FIELD_CQ_NN_DESCRIPTION__C.fieldApiName] : {};
        return val;
    }

    get d_CQ_NN_DESCRIPTION__C() {
        return lookupDisplayFields[FIELD_CQ_NN_DESCRIPTION__C.fieldApiName] && this.getValueFor(lookupDisplayFields[FIELD_CQ_NN_DESCRIPTION__C.fieldApiName].fieldApiName);
    }

    
    get v_CQ_NN_TARGET_DATE__C() {
        return this.getValueFor(FIELD_CQ_NN_TARGET_DATE__C.fieldApiName);
    }
    get f_CQ_NN_TARGET_DATE__C() {
        let val=this.fieldsInfo ? this.fieldsInfo[FIELD_CQ_NN_TARGET_DATE__C.fieldApiName] : {};
        return val;
    }

    get d_CQ_NN_TARGET_DATE__C() {
        return lookupDisplayFields[FIELD_CQ_NN_TARGET_DATE__C.fieldApiName] && this.getValueFor(lookupDisplayFields[FIELD_CQ_NN_TARGET_DATE__C.fieldApiName].fieldApiName);
    }

    
    get v_CQ_NN_INITIATED_DATE__C() {
        return this.getValueFor(FIELD_CQ_NN_INITIATED_DATE__C.fieldApiName);
    }
    get f_CQ_NN_INITIATED_DATE__C() {
        let val=this.fieldsInfo ? this.fieldsInfo[FIELD_CQ_NN_INITIATED_DATE__C.fieldApiName] : {};
        return val;
    }

    get d_CQ_NN_INITIATED_DATE__C() {
        return lookupDisplayFields[FIELD_CQ_NN_INITIATED_DATE__C.fieldApiName] && this.getValueFor(lookupDisplayFields[FIELD_CQ_NN_INITIATED_DATE__C.fieldApiName].fieldApiName);
    }

    
    get v_CQ_NN_MEAL_TYPES_SERVED__C() {
        return this.getValueFor(FIELD_CQ_NN_MEAL_TYPES_SERVED__C.fieldApiName);
    }
    get f_CQ_NN_MEAL_TYPES_SERVED__C() {
        let val=this.fieldsInfo ? this.fieldsInfo[FIELD_CQ_NN_MEAL_TYPES_SERVED__C.fieldApiName] : {};
        return val;
    }

    get d_CQ_NN_MEAL_TYPES_SERVED__C() {
        return lookupDisplayFields[FIELD_CQ_NN_MEAL_TYPES_SERVED__C.fieldApiName] && this.getValueFor(lookupDisplayFields[FIELD_CQ_NN_MEAL_TYPES_SERVED__C.fieldApiName].fieldApiName);
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

    
    get v_STATUS__C() {
        return this.getValueFor(FIELD_STATUS__C.fieldApiName);
    }
    get f_STATUS__C() {
        let val=this.fieldsInfo ? this.fieldsInfo[FIELD_STATUS__C.fieldApiName] : {};
        return val;
    }

    get d_STATUS__C() {
        return lookupDisplayFields[FIELD_STATUS__C.fieldApiName] && this.getValueFor(lookupDisplayFields[FIELD_STATUS__C.fieldApiName].fieldApiName);
    }

    
    get v_UPLOAD_FILE__C() {
        return this.getValueFor(FIELD_UPLOAD_FILE__C.fieldApiName);
    }
    get f_UPLOAD_FILE__C() {
        let val=this.fieldsInfo ? this.fieldsInfo[FIELD_UPLOAD_FILE__C.fieldApiName] : {};
        return val;
    }

    get d_UPLOAD_FILE__C() {
        return lookupDisplayFields[FIELD_UPLOAD_FILE__C.fieldApiName] && this.getValueFor(lookupDisplayFields[FIELD_UPLOAD_FILE__C.fieldApiName].fieldApiName);
    }

    
    get v_CQ_NN_CHILD_RECORD__C() {
        return this.getValueFor(FIELD_CQ_NN_CHILD_RECORD__C.fieldApiName);
    }
    get f_CQ_NN_CHILD_RECORD__C() {
        let val=this.fieldsInfo ? this.fieldsInfo[FIELD_CQ_NN_CHILD_RECORD__C.fieldApiName] : {};
        return val;
    }

    get d_CQ_NN_CHILD_RECORD__C() {
        return lookupDisplayFields[FIELD_CQ_NN_CHILD_RECORD__C.fieldApiName] && this.getValueFor(lookupDisplayFields[FIELD_CQ_NN_CHILD_RECORD__C.fieldApiName].fieldApiName);
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
        
    
        
    get CQNN_CUSTOM_LINKS() {
        return CQNN_CUSTOM_LINKS;
    }
        
    
}