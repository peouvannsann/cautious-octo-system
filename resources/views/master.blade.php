<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    {{-- <script src="{{ asset('js/app.js') }}" defer></script> --}}
    {{-- <link href="{{ asset('css/app.css') }}" rel="stylesheet"> --}}
    <meta name="csrf-token" content="{{ csrf_token() }}" />

    <title>Document</title>
    <link rel="stylesheet" type="text/css" href=" {{ asset('css/custom_style.css') }}">
    <link rel="stylesheet" href="{{ asset('dist/sweetalert2.min.css') }}">
    <link rel="stylesheet" href="{{ asset('lib/sweetalert2/dist/sweetalert2.min.css') }}">
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    {{-- @vite(['resources/js/app.js']) --}}

</head>

<style>
    
</style>
@yield('css')

<body>
    <div class="container">
        <h1>{{ asset('css/custom_style.css') }}</h1>
        <p id="p-id">Style Css</p>
        @include('layer.navigationbar')
        @yield('section')

    </div>

</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="{{ asset('dist/sweetalert2.min.js') }}"></script>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous">
</script>

<script>
    $(document).ready(function() {
        // Swal.fire({
        //     title: 'Error!',
        //     text: 'Do you want to continue',
        //     icon: 'error',
        //     confirmButtonText: 'Cool'
        // })
    });
</script>

@yield('javascript')

</html>
