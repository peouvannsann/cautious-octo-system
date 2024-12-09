@extends('layouts.master')
@section('title','Dropzone ')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="card">
                    <div class="card-header">
                        Dropzone File Upload
                    </div>
                    <div class="card-body">
                        <form class="dropzone dz-clickable" action="{{ route("dropzone.store") }}" method="POST" enctype="multipart/form-data">
                            @csrf
                            <div class="text-center">
                                Upload Image By Click on Box
                            </div>
                            <div class="dz-default dz-message">
                                <span>Drop Files here to upload</span>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
