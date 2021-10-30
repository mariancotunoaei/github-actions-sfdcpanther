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
trigger CaseTriggerGitHub on Case (before insert) {
  System.debug('Hello PR');
}
