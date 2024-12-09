@extends('layouts.master')
@section('title', 'Autocomplete Search')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="card">
                    <div class="card-header">
                        Import
                    </div>
                    <div class="card-body" style="padding-top: 30px;padding-bottom: 40px;padding-right: 20px;">
                        <form method="POST">
                            @csrf
                            <div class="form-group">
                                <input type="text" name="" id="" class="form-control typeahead"
                                    data-provide="typeahead" placeholder="Search...">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('javascript')

    <script>
        var $input = $(".typeahead");

        var path = "{{ route('autocomplete') }}";

        $input.typeahead({
            // source: function(query) {
            //     return $.get(path);
            // },
            source : function(terms, process){
                return $.get(path, {terms: terms}, function(data){
                    return process(data);
                });
            },
            // source: [{
            //         id: "someId1",
            //         name: "Display name 1"
            //     },
            //     {
            //         id: "someId2",
            //         name: "Display name 2"
            //     }
            // ],
            autoSelect: true

        });

        $input.change(function() {
            var current = $input.typeahead("getActive");
            if (current) {
                // Some item from your model is active!
                if (current.name == $input.val()) {
                    // This means the exact match is found. Use toLowerCase() if you want case insensitive match.
                } else {
                    // This means it is only a partial match, you can either add a new item
                    // or take the active if you don't want new items
                }
            } else {
                // Nothing is active so it is a new value (or maybe empty value)
            }
        });
    </script>
@endsection
