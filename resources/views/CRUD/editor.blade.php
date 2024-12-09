@extends('layouts.master')
@section('title','editor')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="card">
                    <div class="card-header">
                        Tiny MCE Html Editory
                    </div>
                    <div class="card-body">
                        <form action="" method="post">
                            @csrf
                            <textarea name="mytextarea" id="mytextarea"></textarea>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('javascript')
    <script>
        tinymce.init({
            selector: "#mytextarea"
        });
    </script>
@endsection