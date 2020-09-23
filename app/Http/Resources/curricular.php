<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class curricular extends JsonResource
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
            'achievement' => $this->activity,
            'file' => $this->file_name,
        ];
    }
    
}
