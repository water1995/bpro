<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ProfActivity extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        //return parent::toArray($request);
        return[
            'id' => $this->id,
            'title' => $this->title,
            'activity' => $this->activity,
            'professor' =>$this->professor,
            'marks' => $this->marks,
            'file_name' => $this->file_name,
        ];
    }
}
