@extends('layouts.master')
@section('title','Employee')

@section('content')
    <div class="container">
        <table class="styled-table">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Department</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($employees as $employee)     
                <tr>
                    <td>{{ $employee->id }}</td>
                    <td>{{ $employee->name }}</td>
                    <td>{{ $employee->email }}</td>
                    <td>{{ $employee->department }}</td>
                </tr>
                @endforeach
                {{-- <tr class="active-row">
                    <td>Melissa</td>
                    <td>5150</td>
                </tr> --}}
                <!-- and so on... -->
            </tbody>
        </table>
    </div>
@endsection
