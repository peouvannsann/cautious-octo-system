@extends('layouts.master')
@section('title', 'Autocomplete Search')

@section('content')
    <div class="container">
        <div class="row">
            <select class="js-data-example-ajax"></select>
        </div>
    </div>

    <button id="button_id"></button>
@endsection

@section('javascript')

    <script>

        $(".js-data-example-ajax").select2(
        {
            ajax: {
                url: '{{ route('ajax.get.response') }}',
                dataType: 'json',
                type: "GET",
                delay: 250,
                data: function (params) {
                    return {
                        query: params.term
                    };
                },
                processResults: function (data) {
                		var res = data.map(function (item) {
                        	return {id: item.id, text: item.name};
                        });
                    return {
                        results: res
                    };
                }
            },

           });
    </script>
@endsection
