public class BusinessHoursElapsed {
    
    @InvocableMethod(label='Get Business Hours Between Two DateTimes' category='Business Hours')
    public static List<Decimal> getElapsedBusinessHours(List<ElapsedBusinessHoursWrapper> ebws){
        List<Decimal> elapsedBusinessHoursList = new List<Decimal>();

        for(ElapsedBusinessHoursWrapper ebw : ebws){
            Decimal tempResult = BusinessHours.diff(ebw.businessHoursId,ebw.startTime,ebw.endTime);
            Decimal finalResult = tempResult/(60*60*1000);
            elapsedBusinessHoursList.add(finalResult);
        }

        return elapsedBusinessHoursList;
    }

  

    public class ElapsedBusinessHoursWrapper{
        @InvocableVariable(label='Business Hours Id' required=true)
        public String businessHoursId;
        @InvocableVariable(label='Start DateTime')
        public DateTime startTime;
        @InvocableVariable(label='End DateTime')
        public DateTime endTime;
    }
}