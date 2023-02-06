trigger AccountUser on Account (before Update) {
    if(Trigger.isBefore){
        if(Trigger.isUpdate){
             
           User UserDetails=[select Id, Username from User where Id=:userinfo.getUserId()];
            String uName=UserDetails.Username;
        }
    }

}