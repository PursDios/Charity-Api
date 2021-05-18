<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Charities extends Model
{
    use HasFactory;

    protected $fillable = [
        'charity_id',
        'charity_name',
        'is_approved',
        'country_id',
    ];
}
