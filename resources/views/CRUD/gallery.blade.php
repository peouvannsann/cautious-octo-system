@extends('layouts.master')
@section('title','Gallery')

@section('css')
    <style>
        img{
            background-color: grey;
            height: 250px;
            width: 100%;
            border: 1px solid grey;
            margin-top: 20px;
            box-shadow: 0 8px 6px -6px black;
        }
    </style>
@endsection

@section('content')
<div class="container">
    <div class="row">
        @for ($i = 1; $i < 16; $i++)
        <div class="col-md-6">
                <img src="{{ url("/images/1668875748.jpg") }}" style="width: 100px" alt="">
                {{-- <img data-original="http://45.33.113.129/images/img-{{ $i }}.jpg"> --}}
            </div>
        @endfor
    </div>
@endsection

@section('javascript')
@push('javascript')
    <script>
        $(document).ready(function () {
            $("img").lazyload();
        });
    </script>
@endpush
@endsection

{{-- 
Document ; https://medium.com/codefield-community/responsive-images-and-progressive-image-loading-with-laravel-a67d5d1f42c5    

--}}