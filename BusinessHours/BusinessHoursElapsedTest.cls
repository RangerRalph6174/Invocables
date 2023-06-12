@IsTest
public class BusinessHoursElapsedTest {
    
    @IsTest(SeeAllData=true)
    public static void testGetElapsedBusinessHours() {
        // Create BusinessHours record
        BusinessHours bh = [SELECT Id FROM BusinessHours WHERE isDefault=true LIMIT 1];
       
        
        // Create elapsed business hours wrapper
        BusinessHoursElapsed.ElapsedBusinessHoursWrapper wrapper = new BusinessHoursElapsed.ElapsedBusinessHoursWrapper();
        wrapper.businessHoursId = bh.Id;

        // YOU WILL HAVE TO CHANGE THE HOUR/MINUTES OFFSET TO ACCOUNT FOR GMT AND YOUR TIMEZONE.
        wrapper.startTime = DateTime.newInstanceGMT(2023, 6, 1, 17, 0, 0);
        wrapper.endTime = DateTime.newInstanceGMT(2023, 6, 1, 18, 0, 0);
        
        // Create a list of wrappers
        List<BusinessHoursElapsed.ElapsedBusinessHoursWrapper> wrappers = new List<BusinessHoursElapsed.ElapsedBusinessHoursWrapper>();
        
        // Call the method
        List<Decimal> elapsedBusinessHoursList = BusinessHoursElapsed.getElapsedBusinessHours(wrappers);
        
        // Assert the result
        System.assertEquals(1, elapsedBusinessHoursList[0]);
    }
}
