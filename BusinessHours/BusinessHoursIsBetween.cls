public class BusinessHoursIsBetween {
    
    
    @InvocableMethod(label='Is Date/Time During Business Hours?' category='Business Hours')
    public static List<Boolean> isDuringBusinessHours(List<IsBetweenBusinessHoursWrapper> wrappers){
        
        List<Boolean> returnList = new List<Boolean>();
        for(IsBetweenBusinessHoursWrapper wrapper: wrappers){
            returnList.add(BusinessHours.isWithin(wrapper.businessHoursId, wrapper.DateTimeToCheck));
        }
        return returnList;
    }

    public class IsBetweenBusinessHoursWrapper{
        @InvocableVariable(label='Business Hours Id' required=true)
        public String businessHoursId;
        @InvocableVariable(label='DateTime To Check')
        public DateTime dateTimeToCheck;
        
    }
}