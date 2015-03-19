<?php
class CalendarDateTimeExtension extends DataExtension {

	public function StartDateTime() {
		$startDateTime = new SS_Datetime();
		$startDateTime->setValue($this->owner->StartDate);

		return $startDateTime;
	}

	public function onBeforeWrite(){
		$event = $this->owner->Event();

		$event->FirstStartDateTime = $this->owner->StartDate;
		$event->write();

		if($event->isPublished()){
			$event->doPublish();
		}

		parent::onBeforeWrite();
	}

}