@extends('layouts.master')
@section('title','Resize Image')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="card">
                    <div class="card-header">
                        Import
                    </div>
                    <div class="card-body">
                        <form action="{{ route("image.resize") }}" method="post" enctype="multipart/form-data">
                            @csrf
                            <div class="form-group">
                                <label for="">Choose CSV</label>
                                <input type="file" name="file" class="form-control">
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
