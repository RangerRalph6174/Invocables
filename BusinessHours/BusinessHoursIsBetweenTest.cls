@isTest
public class BusinessHoursIsBetweenTest {

    @IsTest(SeeAllData=true)
    public static void isDuringBusinessHoursTest(){

        
    // Create BusinessHours record
    BusinessHours bh = [SELECT Id FROM BusinessHours WHERE isDefault=true LIMIT 1];
       
        
    BusinessHoursIsBetween.IsBetweenBusinessHoursWrapper wrapper = new BusinessHoursIsBetween.IsBetweenBusinessHoursWrapper();
    wrapper.businessHoursId = bh.Id;

    wrapper.dateTimeToCheck = DateTime.newInstanceGMT(2023, 6, 1, 17, 0, 0);
    
    // Create a list of wrappers
    List<BusinessHoursIsBetween.IsBetweenBusinessHoursWrapper> wrappers = new List<BusinessHoursIsBetween.IsBetweenBusinessHoursWrapper>{wrapper};
    
    // Call the method
    List<Boolean> IsBetweenBusinessHoursWrapperResults = BusinessHoursIsBetween.isDuringBusinessHours(wrappers);
    
    // Assert the result
    System.assertEquals(true, IsBetweenBusinessHoursWrapperResults[0]);
}
    
}