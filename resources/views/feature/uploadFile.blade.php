@extends('master')


@section('css')
    <style>
        /* This css is for normalizing styles. You can skip this. */
        *,
        *:before,
        *:after {
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }
        .new {
            padding: 50px;
        }

        .form-group {
            display: block;
            margin-bottom: 15px;
        }

        .form-group input {
            padding: 0;
            height: initial;
            width: initial;
            margin-bottom: 0;
            display: none;
            cursor: pointer;
        }

        .form-group label {
            position: relative;
            cursor: pointer;
        }

        .form-group label:before {
            content: '';
            -webkit-appearance: none;
            background-color: transparent;
            border: 2px solid #0079bf;
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05), inset 0px -15px 10px -12px rgba(0, 0, 0, 0.05);
            padding: 10px;
            display: inline-block;
            position: relative;
            vertical-align: middle;
            cursor: pointer;
            margin-right: 5px;
        }

        .form-group input:checked+label:after {
            content: '';
            display: block;
            position: absolute;
            top: 2px;
            left: 9px;
            width: 6px;
            height: 14px;
            border: 10px solid;
            border-width: 0 2px 2px 0;
            transform: rotate(45deg);
        }
    </style>
@endsection

@section('section')
    <h1>Feature Upload</h1>
    <div class="drag-area">
        <div class="icon"><i class="fas fa-cloud-upload-alt"></i></div>

        {{-- Request using ajax --}}
        <button id="upload-file-ajax" class="my-3">Reques using ajax</button>
        <form id="import_csv_form" method="POST" enctype="multipart/form-data">
            @csrf
            <input type="file" id="upload_import_file" name="import_csv" hidden>
        </form>

        {{-- Request using form --}}
        <button id="upload-file-iofactory" class="my-3">Read from file using IOFactory</button>
        <form method="POST" action="http://127.0.0.1:8000/users_xlsx" enctype="multipart/form-data">
            @csrf
            <input type="file" name="import_csv" hidden>
        </form>

        <form id="download_csv" method="POST" action="http://127.0.0.1:8000/downloadFile" enctype="multipart/form-data">
            @csrf
            <button id="download_file">Download File</button>
        </form>

        <button id="button_click">Ajax Push to ajaxExcell</button>

    </div>

    <div class="parent">
        <input type="checkbox" />parent
    </div>
    <div>
        <ul class="child">
            <li>
                <input type="checkbox" />child 1
            </li>
            <li>
                <input type="checkbox" />child 2
            </li>
            <li>
                <input type="checkbox" />child 3
            </li>
        </ul>
    </div>
    <div class="parent">
        <input type="checkbox" />parent
    </div>
    <div>
        <ul class="child">
            <li>
                <input type="checkbox" />child 1
            </li>
            <li>
                <input type="checkbox" />child 2
            </li>
            <li>
                <input type="checkbox" />child 3
            </li>
        </ul>
    </div>

    <div class="new">
        <form>
            <div class="form-group">
                <input type="checkbox" id="html">
                <label for="html">HTML</label>
            </div>
            <div class="form-group">
                <input type="checkbox" id="css">
                <label for="css">CSS</label>
            </div>
            <div class="form-group">
                <input type="checkbox" id="javascript">
                <label for="javascript">Javascript</label>
            </div>
        </form>
    </div>
@endsection

@section('javascript')
    <script>
        $(document).ready(function() {

            $("#upload-file-ajax").on("click", function() {
                $("#upload_import_file").click();
            });

            $("#upload_import_file").on("change", function() {
                var file_directory = $("#upload_import_file").val();
                // if (file_directory) {
                //     $("#import_csv_form").submit();
                // }
                var formData = new FormData();
                formData.append('import_csv', this.files[0]);
                console.log(formData);

                $.ajax({
                    method: "POST",
                    url: "{{ route('ajax_excell.csv') }}",
                    data: formData,
                    dataType: "json",
                    enctype: 'multipart/form-data',
                    processData: false,
                    contentType: false,
                    cache: false,
                    headers: {
                        'X-CSRF-TOKEN': $('input[name="_token"]').val()
                    },
                    success: function(response) {
                        console.log(response);
                        // if(response.code == 200){
                        //     Swal.close();
                        // }else{
                        //     $("#upload_import_file").val("");
                        //     Swal.fire({
                        //         icon: 'error',
                        //         title: 'Error',
                        //         text: response.message,
                        //         allowOutsideClick: false,
                        //     })
                        // }

                    }
                });


            });

            $('.my_upload').on('change', function() {
                let formData = new FormData();
                formData.append('profile', this.files[0]);
            });

            // Ajax test
            $("#button_click").click(function(e) {

                $.ajax({
                    type: "POST",
                    url: "{{ route('ajax_excell.csv') }}",
                    data: {
                        "name": "hello vannsann"
                    },
                    dataType: "json",
                    success: function(response) {
                        console.log(response);
                    }
                });

            });

            Swal.fire({
                title: 'Error!',
                text: 'Do you want to continue',
                icon: 'error',
                confirmButtonText: 'Cool'
            })

        });

        $(".parent input").on('click', function() {
            var _parent = $(this);
            var nextli = $(this).parent().next().children().children();

            if (_parent.prop('checked')) {
                console.log('parent checked');
                nextli.each(function() {
                    $(this).children().prop('checked', true);
                });

            } else {
                console.log('parent un checked');
                nextli.each(function() {
                    $(this).children().prop('checked', false);
                });

            }
        });

        $(".child input").on('click', function() {

            var ths = $(this);
            console.log('ths :>> ', ths);
            var parentinput = ths.closest('div').prev().children();
            // console.log('parentinput :>> ', parentinput);
            var sibblingsli = ths.closest('ul').find('li');
            // console.log('sibblingsli :>> ', sibblingsli);
            console.log('ths.prop :>> ', ths.prop('checked'));
            if (ths.prop('checked')) {
                console.log('child checked');
                parentinput.prop('checked', true);
            } else {
                console.log('child unchecked');
                var status = true;
                sibblingsli.each(function() {
                    console.log('sibb');
                    if ($(this).children().prop('checked')) status = false;
                });
                if (status) parentinput.prop('checked', false);
            }
        });

        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
    </script>
@endsection
{{-- <script>
    console.log("Hello Upload file");
</script> --}}
