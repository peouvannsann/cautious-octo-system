@extends('master')

@section('css')
    <style>

        span.tool-tip {
            color: #e91e63;
            font-family: monospace;
            white-space: nowrap;
        }

        span.tool-tip:after {
            font-family: Arial, sans-serif;
            text-align: left;
            white-space: normal;
        }

        span.tool-tip:focus {
            outline: none;
        }

        .wrap-container {
            background: #ECF0F1;
            color: #607D8B;
            height: 100%;
            overflow: auto;
            padding: 1em 2.5em;
            text-align: center;
            width: 100%;
        }

        /*== start of code for tooltips ==*/
        .tool-tip {
            cursor: help;
            position: relative;
        }

        /*== common styles for both parts of tool-tip tip ==*/
        .tool-tip::before,
        .tool-tip::after {
            left: 50%;
            opacity: 0;
            position: absolute;
            z-index: -100;
        }

        .tool-tip:hover::before,
        .tool-tip:focus::before,
        .tool-tip:hover::after,
        .tool-tip:focus::after {
            opacity: 1;
            transform: scale(1) translateY(0);
            z-index: 100; 
        }


        /*== pointer tip ==*/
        .tool-tip::before {
            border-style: solid;
            border-width: 1em 0.75em 0 0.75em;
            border-color: #3E474F transparent transparent transparent;
            bottom: 100%;
            content: "";
            margin-left: -0.5em;
            transition: all .65s cubic-bezier(.84,-0.18,.31,1.26), opacity .65s .5s;
            transform:  scale(.6) translateY(-90%);
        } 

        .tool-tip:hover::before,
        .tool-tip:focus::before {
            transition: all .65s cubic-bezier(.84,-0.18,.31,1.26) .2s;
        }


        /*== speech bubble ==*/
        .tool-tip::after {
            background: #3E474F;
            border-radius: .25em;
            bottom: 180%;
            color: #EDEFF0;
            content: attr(data-tip);
            margin-left: -8.75em;
            padding: 1em;
            transition: all .65s cubic-bezier(.84,-0.18,.31,1.26) .2s;
            transform:  scale(.6) translateY(50%);  
            width: 17.5em;
        }

        .tool-tip:hover::after,
        .tool-tip:focus::after  {
            transition: all .65s cubic-bezier(.84,-0.18,.31,1.26);
        }
        .dropbtn {
  background-color: #04AA6D;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
  cursor: pointer;
}

.dropbtn:hover, .dropbtn:focus {
  background-color: #3e8e41;
}

#myInput {
  box-sizing: border-box;
  background-image: url('searchicon.png');
  background-position: 14px 12px;
  background-repeat: no-repeat;
  font-size: 16px;
  padding: 14px 20px 12px 45px;
  border: none;
  border-bottom: 1px solid #ddd;
}

#myInput:focus {outline: 3px solid #ddd;}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f6f6f6;
  min-width: 230px;
  overflow: auto;
  border: 1px solid #ddd;
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown a:hover {background-color: #ddd;}

.show {display: block;}

    </style>

@endsection

@section('section')
    {{-- <div class="wrap-container"> --}}
        <h1>Pure CSS Tooltips</h1>
        <p>To create a tooltip just add the
            <span class="tool-tip" 
            data-tip="By adding this class you can provide almost any element with a tool tip." tabindex="1">tool</span> 
            class and the <span class="tool-tip" data-tip="Use this data-tip attribute to store your tool tip message."
        tabindex="2">data-tip</span> attribute with your tooltip message.</p>
        <pre>&lt;span class="tool" data-tip="content..."&gt;</pre>
    {{-- </div> --}}

    <span class="tool-tip" data-tip="mode" tabindex="1">
        hello world
    </span>

    <div class="dropdown">
        <button onclick="myFunction()" class="dropbtn">Dropdown</button>
        <div id="myDropdown" class="dropdown-content">
          <input type="text" placeholder="Search.." id="myInput" onkeyup="filterFunction()">
            <a href="#about">About</a>
            <a href="#base">Base</a>
            <a href="#blog">Blog</a>
            <a href="#contact">Contact</a>
            <a href="#custom">Custom</a>
            <a href="#support">Support</a>
            <a href="#tools">Tools</a>
        </div>
    </div>


    <form class="row g-3">
        <div class="col-md-4">
          <label for="validationDefault01" class="form-label">First name</label>
          <input type="text" class="form-control" id="validationDefault01" value="Mark" required>
        </div>
        <div class="col-md-4">
          <label for="validationDefault02" class="form-label">Last name</label>
          <input type="text" class="form-control" id="validationDefault02" value="Otto" required>
        </div>
        <div class="col-md-4">
          <label for="validationDefaultUsername" class="form-label">Username</label>
          <div class="input-group">
            <span class="input-group-text" id="inputGroupPrepend2">@</span>
            <input type="text" class="form-control" id="validationDefaultUsername"  aria-describedby="inputGroupPrepend2" required>
          </div>
        </div>
        <div class="col-md-6">
          <label for="validationDefault03" class="form-label">City</label>
          <input type="text" class="form-control" id="validationDefault03" required>
        </div>
        <div class="col-md-3">
          <label for="validationDefault04" class="form-label">State</label>
          <select class="form-select" id="validationDefault04" required>
            <option selected disabled value="">Choose...</option>
            <option>...</option>
          </select>
        </div>
        <div class="col-md-3">
          <label for="validationDefault05" class="form-label">Zip</label>
          <input type="text" class="form-control" id="validationDefault05" required>
        </div>
        <div class="col-12">
          <div class="form-check">
            <input class="form-check-input" type="checkbox" value="" id="invalidCheck2" required>
            <label class="form-check-label" for="invalidCheck2">
              Agree to terms and conditions
            </label>
          </div>
        </div>
        <div class="col-12">
          <button class="btn btn-primary" type="submit">Submit form</button>
        </div>
      </form>

@endsection

@section('javascript')
    <script>
        function myFunction() {
            document.getElementById("myDropdown").classList.toggle("show");
        }

        function filterFunction() {
            var input, filter, ul, li, a, i;
            input  = document.getElementById("myInput");
            filter = input.value.toUpperCase();
            div    = document.getElementById("myDropdown");
            a      = div.getElementsByTagName("a");
            // console.log(a);
            for (i = 0; i < a.length; i++) {
                txtValue = a[i].textContent || a[i].innerText;
                // console.log(txtValue);
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    console.log(txtValue.toUpperCase().indexOf(filter));
                    a[i].style.display = "";
                } else {
                    a[i].style.display = "none";
                }
            }
        }
    </script>
@endsection
