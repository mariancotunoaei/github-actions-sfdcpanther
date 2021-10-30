/**
 * @description       : 
 * @author            : Amit Singh
 * @group             : 
 * @last modified on  : 04-12-2021
 * @last modified by  : Amit Singh
 * Modifications Log 
 * Ver   Date         Author       Modification
 * 1.0   04-12-2021   Amit Singh   Initial Version
**/
trigger GitHubActionTrigger on Account (before insert) {
    for(Account acc : trigger.new){
        acc.Rating = 'Hot';
        acc.Description = 'Account Description Here...';
    }
}