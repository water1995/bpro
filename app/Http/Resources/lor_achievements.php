<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class lor_achievements extends JsonResource
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
            'achievement' => $this->achievement,
            'file' => $this->file_name,
        ];
    }
}
