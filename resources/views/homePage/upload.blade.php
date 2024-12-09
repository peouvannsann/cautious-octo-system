@extends('layouts.master')
@section('title', 'Upload')
    @section('content')
        <div class="row">
            <div class="col-md-6" offset-md-3>
                <div class="card">
                    <div class="card-header">
                        File Upload
                    </div>
                    <div class="card-body">
                        <form action="{{ route('upload-uploadFile') }}" method="post" enctype="multipart/form-data">
                            @csrf
                            <div class="form-group">
                                <label for="">Choose File</label>
                                <input type="file" class="form-control" name="file" id="file">
                            </div>
                            <button type="submit" class="btn btn-success">Upload</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    @endsection