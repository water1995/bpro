<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class course extends JsonResource
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
            'req_id' => $this->req_id,
            'course' => $this->course,
        ];
    }
}
