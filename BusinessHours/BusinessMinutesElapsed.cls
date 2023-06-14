public class BusinessMinutesElapsed {
    
    @InvocableMethod(label='Get Business Minutes Between Two DateTimes' category='Business Hours')
    public static List<Decimal> getElapsedBusinessMinutes(List<ElapsedBusinessMinutesWrapper> ebws){
        List<Decimal> elapsedBusinessMinutes = new List<Decimal>();

        for(ElapsedBusinessMinutesWrapper ebw : ebws){
            Decimal tempResult = BusinessHours.diff(ebw.businessHoursId,ebw.startTime,ebw.endTime);
            Decimal finalResult = tempResult/(60*1000);
            elapsedBusinessMinutes.add(finalResult);
        }

        return elapsedBusinessMinutes;
    }

  

    public class ElapsedBusinessMinutesWrapper{
        @InvocableVariable(label='Business Hours Id' required=true)
        public String businessHoursId;
        @InvocableVariable(label='Start DateTime')
        public DateTime startTime;
        @InvocableVariable(label='End DateTime')
        public DateTime endTime;
    }
}