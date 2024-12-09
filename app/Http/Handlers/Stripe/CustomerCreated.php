<?php

namespace App\Http\Handlers\Stripe;

use Illuminate\Foundation\Bus\Dispatchable;

class CustomerCreated
{
    use Dispatchable;

    public $data;
    public $event;

    public function __construct(string $event, array $data)
    {
        $this->data     = $data;
        $this->event    = $event;
    }

    public function handle()
    {
        return "web hook handler";
    }
}
