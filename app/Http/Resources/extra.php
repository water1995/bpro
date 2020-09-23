<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class extra extends JsonResource
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
            'achievement' => $this->extra_curricular_activity,
            'file' => $this->file_name,
        ];
    }
}
