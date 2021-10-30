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
trigger ContactTriggerGitHub on Contact (before insert) {
    System.debug(' Contacts '+ Trigger.New);
}