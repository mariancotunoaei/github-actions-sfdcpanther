/**
 * @description       : 
 * @author            : Amit Singh
 * @group             : 
 * @last modified on  : 04-15-2021
 * @last modified by  : Amit Singh
 * Modifications Log 
 * Ver   Date         Author       Modification
 * 1.0   04-15-2021   Amit Singh   Initial Version
**/
@IsTest
public with sharing class GitHubActionsTest {

    @TestSetup
    private static void makeData(){
        System.debug('');
    }

    @IsTest
    private static void testMethodDemo(){
        System.debug('');
    }
}
