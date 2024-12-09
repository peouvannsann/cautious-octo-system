@extends('layouts.master')
@section('title', 'Autocomplete Search')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    All Students <a href="/add_student" class="btn btn-success">Add New</a>
                </div>
                <div class="card-body">
                    <table class="styled-table">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Name</th>
                                <th>Profile Image</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($students as $student)
                            <tr>
                                <td>{{ $student->id }}</td>
                                <td>{{ $student->name }}</td>
                                <td>
                                    <img src="{{ asset('images') }}/{{ $student->profileimage }}" style="max-width: 60px" alt="">
                                    {{ $student->profileimage }}
                                </td>
                                <td>
                                    <a href="/edit_student/{{ $student->id }}" class="btn btn-info" >Edit</a>
                                    <a href="/delete_student/{{ $student->id }}" class="btn btn-danger" >Delete</a>
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
@endsection

