@extends('layouts.master')
@section('title','Add Student')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="card">
                    <div class="card-header">
                        Edit Student
                    </div>
                    <div class="card-body">
                        @if (Session::has('student_update'))
                            <div class="alert alert-success" role="alert">
                                {{ Session::get('student_update') }}
                            </div>
                        @endif

                        <form action="{{ route("student.update") }}" method="POST" enctype="multipart/form-data">
                            @csrf
                            <input type="hidden" name="id" value="{{ $student->id }}">
                            <div class="form-group">
                                <label for="name">Name</label>
                                <input type="text" name="name" class="form-control">
                            </div>

                            <div class="form-group">
                                <label for="file">Choose Profile Image</label>
                                <input type="file" name="file" class="form-control" onchange="previewFile(this)">
                                <img src="{{ asset("images") }}/{{ $student->profileimage }}" id="previewImg" alt="profile image" style="max-width: 130px;margin-top: 20px">
                            </div>

                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

{{-- @section('javascript') --}}
    <script>
        $(document).ready(function () {
            console.log("Hello world");
        });
        function previewFile(input) {
            console.log(input);
            var file = $("input[type=file]").get(0).files[0];
            console.log(file);
            if (file){
                var reader = new FileReader();
                reader.onload = function () {
                    $("#previewImg").attr("src", reader.result);
                }
                reader.readAsDataURL(file);
            }
        }
    </script>
{{-- @endsection --}}
