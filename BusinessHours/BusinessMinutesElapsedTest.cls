@IsTest
public class BusinessMinutesElapsedTest {
    
    @IsTest(SeeAllData=true)
    public static void testGetElapsedBusinessMinutes() {
        // Create BusinessHours record
        BusinessHours bh = [SELECT Id FROM BusinessHours WHERE isDefault=true LIMIT 1];
       
        
        // Create elapsed business hours wrapper
        BusinessMinutesElapsed.ElapsedBusinessMinutesWrapper wrapper = new BusinessMinutesElapsed.ElapsedBusinessMinutesWrapper();
        wrapper.businessHoursId = bh.Id;

        // YOU WILL HAVE TO CHANGE THE HOUR/MINUTES OFFSET TO ACCOUNT FOR GMT AND YOUR TIMEZONE.
        wrapper.startTime = DateTime.newInstanceGMT(2023, 6, 1, 17, 0, 0);
        wrapper.endTime = DateTime.newInstanceGMT(2023, 6, 1, 18, 0, 0);
        
        // Create a list of wrappers
        List<BusinessMinutesElapsed.ElapsedBusinessMinutesWrapper> wrappers = new List<BusinessMinutesElapsed.ElapsedBusinessMinutesWrapper>{wrapper};
        
        // Call the method
        List<Decimal> elapsedBusinessHoursList = BusinessMinutesElapsed.getElapsedBusinessMinutes(wrappers);
        
        // Assert the result
        System.assertEquals(60, elapsedBusinessHoursList[0]);
    }
}
