<?php
class CalendarDateTimeExtension extends DataExtension {

	public function StartDateTime() {
		//print_r();

		$startDateTime = new SS_Datetime();
		$startDateTime->setValue($this->owner->StartDate);

		return $startDateTime;
		//return "eawhasf";
	}

}