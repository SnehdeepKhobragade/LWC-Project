({
    doInit: function(cmp, event, helper) {
        //Set the attribute value.
        var map = cmp.get("v.map");
        map['str1'] = 'FirstName';
        map['str2'] = 'Lastname';
        var obj = {"FirstName":"Rohan","LastName":'Guru'};
        map['obj'] = obj;
        cmp.set("v.map", map);
    }
})