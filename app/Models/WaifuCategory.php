<?php

namespace App\Models;

class Category
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'category'
    ];

    function getCategories() {
        return ['waifu', 'neko', 'smut'];
    }
}
