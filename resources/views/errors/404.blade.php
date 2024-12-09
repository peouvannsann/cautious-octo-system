{{-- @extends('errors::minimal')

@section('title', __('Not Found'))
@section('code', '404')
@section('message', __('Not Found')) --}}

@extends('errors.layout.masterError')
@section('Title', "Error 404")
    @section('content')
        <div class="row">
            <div class="col-md-8 offset-md-2 text-center">
                <h1 style="font-size: 162px">404</h1>
                <h2>Page Not Found</h2>
                <p>We are sorry, the page you requested could not be found. Please go back to the homepage.</p>
                <a href="/" class="btn btn-primary">Visit Homepage</a>
            </div>

        </div>
    @endsection