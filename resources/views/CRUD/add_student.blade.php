@extends('layouts.master')
@section('title','Add Student')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="card">
                    <div class="card-header">
                        Add new Student
                    </div>
                    <div class="card-body">
                        @if (Session::has('student_added'))
                            <div class="alert alert-success" role="alert">
                                {{ Session::get('student_added') }}
                            </div>
                        @endif

                        <form action="{{ route("student.store") }}" method="POST" enctype="multipart/form-data">
                            @csrf
                            <div class="form-group">
                                <label for="name">Name</label>
                                <input type="text" name="name" class="form-control">
                            </div>

                            <div class="form-group">
                                <label for="file">Choose Profile Image</label>
                                <input type="file" name="file" class="form-control" onchange="previewFile(this)">
                                <img src="" id="previewImg" alt="profile image" style="max-width: 130px;margin-top: 20px">
                            </div>

                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@if (Session::has('student_added'))
    @section('javascript')
        <script>
            swal("Hello world!");
        </script>
    @overwrite
@endif

@if(Session::has('student_added'))
    @section('javascript')
        <script>
            toastr.success("{!! Session::get("student_added") !!}")
        </script>   
        @yield('javascript')
    @overwrite
@endif

{{-- @if(Session::has('student_added'))
    @section('javascript')
        <script>
            toastr.success("{!! Session::get("student_added") !!}")
        </script>    
    @overwrite
@endif --}}



{{-- @if (Session::has('student_added'))
    <script>
        console.log("Swal");
        // swal("Great Job!", "{!! Session::get("student_added") !!}", "success", {
        //     button: "OK"
        // });
        Swal.fire('Test!', 'Hello test message','success');
    </script>
@endif --}}
<script>
    function previewFile(input) {
        var file = $("input[type=file]").get(0).files[0];
        if (file){
            var reader = new FileReader();
            reader.onload = function () {
                $("#previewImg").attr("src", reader.result);
            }
            reader.readAsDataURL(file);
        }
    }
</script>

