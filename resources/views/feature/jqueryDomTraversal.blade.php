@extends('master')

@section('css')
    <style>
        .container-border * {
            display: block;
            border: 2px solid DarkSeaGreen;
            padding: 5px;
            margin: 15px;
            background: PapayaWhip;
        }

        .box {
            background: RebeccaPurple;
            color: LightGoldenRodYellow;
            height: 30px;
            width: 200px;
            font-size: 20px;
            padding: 30px;
            margin: 20px;
        }
    </style>
@endsection

@section('section')
    <div>
        <h1>Selecting & changing Website Elements (Dom manipulation)</h1>
        <p>Some outer text</p>
        <p class="unicycle">Some outer text</p>
        <div id="div1" style="border: solid blue 3px">
            <p>Some div1 text</p>
            <p class="unicycle">Some div1 text</p>
            <div id="div2" style="border: solid red 3px">
                <p>Some div2 text</p>
                <p>Some div2 text</p>
            </div>
        </div>
    </div>

    <div>
        <h1>Dom Event</h1>
        <h1 id="testh1" onclick="this.innerHTML='Cereal!'">What is my favorite food?</h1>
        <h1 onclick="changeColor(this)">Click to change color!</h1>
        <button id="myBtn">Click ME!!!</button>

        {{-- <body onload="checkCookies()"> --}}

        <input type="text" id="words" oninput="removeLetterFromH1()" />

        <div onmouseover="mOver(this)" onmouseout="mOut(this)" class="box">
            Mouse Over Me
        </div>
    </div>

    <div>
        <h1>addEventListener</h1>
        <div id="myDiv">
            <p id="myP">How much wood would a woodchuck chuck if a wood chuck could chuck wood?</p>
        </div><br>

        <div id="myDiv2">
            <p id="myP2">A woodchuck would chuck as much wood as a woodchuck could chuck if a woodchuck could chuck
                wood.</p>
        </div>
    </div>

    <div class="container container-border">
        <h1>jQuery: Traversing the DOM</h1>
        <div>div
            <ul>ul
                <li>li
                    <span class="parent">span
                        <p>p</p>
                        <span class="child">span</span>
                        <h2>h2</h2>
                        <h3>h3</h3>
                        <p>p</p>
                    </span>
                </li>
            </ul>
        </div>
    </div>

    <div class="mc-field-group input-group"><strong>What Kind Of Shoes Are You Interested In?</strong><br>
  
        <ul>
          
          <li><input id="selectAll" type="checkbox"><label for='selectAll'>Select All</label></li>
          <li><input class="toggle-normal" id="mce-group[19]-19-0" type="checkbox" name="group[19][8]" value="8" /><label for="mce-group[19]-19-0">Women's</label></li>
          <li><input class="toggle-normal" id="mce-group[19]-19-1" type="checkbox" name="group[19][16]" value="16" /><label for="mce-group[19]-19-1">Men's</label></li>
          <li><input class="toggle-normal" id="mce-group[19]-19-2" type="checkbox" name="group[19][32]" value="32" /><label for="mce-group[19]-19-2">Kid's</label></li>
          <li><input class="toggle-normal" id="mce-group[19]-19-3" type="checkbox" name="group[19][64]" value="64" /><label for="mce-group[19]-19-3">Athletic</label></li>
          <li><input class="toggle-normal" id="mce-group[19]-19-4" type="checkbox" name="group[19][128]" value="128" /><label for="mce-group[19]-19-4">Outdoor</label></li>
          <li><input class="toggle-normal" id="mce-group[19]-19-5" type="checkbox" name="group[19][256]" value="256" /><label for="mce-group[19]-19-5">Dress Shoes</label></li>
          <li><input class="toggle-normal" id="mce-group[19]-19-6" type="checkbox" name="group[19][512]" value="512" /><label for="mce-group[19]-19-6">Casual</label></li>
          <li><input class="toggle-normal" id="mce-group[19]-19-7" type="checkbox" name="group[19][1024]" value="1024" /><label for="mce-group[19]-19-7">Flip Flops</label></li>
        </ul>
      </div>

@endsection

@section('javascript')
    <script>
        // DOM Manipulation: Selecting & changing website elements

        var div1 = document.getElementById('div1');
        console.log('div1 :>> ', div1);

        var uniycle = document.getElementsByClassName('unicycle');
        console.log('uniycle :>> ', uniycle);

        var paragraphs = document.getElementsByTagName('p');
        console.log('paragraphs :>> ', paragraphs);

        var queryUnicycle = document.querySelector('.unicycle');
        console.log('queryUnicycle :>> ', queryUnicycle);

        var queryAll = document.querySelectorAll('.unicycle, #div2');
        console.log('queryAll :>> ', queryAll);

        var text = "<h1>Hello World</h1>";

        queryUnicycle.textContent = text;

        for (i = 0; i < queryAll.length; ++i) {
            queryAll[i].innerHTML = text;
        }

        console.log("DOM Events");
        /* DOM Events */

        document.getElementById("myBtn").onclick = changeBackgroundColorToMediumOrchid;

        function changeBackgroundColorToMediumOrchid() {
            document.querySelector('body').style.background = "MediumOrchid";
        }

        function removeLetterFromH1() {
            var h1 = document.querySelector('#testh1');
            h1.textContent = h1.textContent.slice(0, -1);
        }

        function mOver(obj) {
            obj.innerHTML = "GET OFF ME!"
        }

        function mOut(obj) {
            obj.innerHTML = "Thank you 😃"
        }

        console.log("addEventListener");
        /* Event Listeners */

        //Syntax: element.addEventListener(event, function, useCapture);
        var myP = document.getElementById("myP");
        var myDiv = document.getElementById("myDiv");
        var myP2 = document.getElementById("myP2");
        var myDiv2 = document.getElementById("myDiv2");

        myP.addEventListener("click", function() {
            myDiv.style.background = "lightblue"
        });

        // myP.onclick = function(){ myDiv.style.background = "lightblue" };

        myP.addEventListener("click", changeText, false);

        myDiv.addEventListener("click", changeText2, false);

        myDiv.addEventListener("mouseover", function() {
            myDiv2.style.background = "darkkhaki"
        });

        function changeText() {
            myP2.textContent = myP2.textContent += "According to a Cornell publication, the answer is ~700 pounds."
        };

        function changeText2() {
            myP2.textContent = myP2.textContent += "THE REAL ANSWER."
        };
    </script>


    <script>
        // $("li").parent().css({
        // $("li").children().css({
        // $("span").children().css({
        // $("span").children('h2').css({
        // $("ul").find('span').css({ // find all ul span children
        // $("h2").siblings().css({
        // $("h2").siblings('p').css({
        // $("h2").next().css({
        // $("h2").nextAll().css({
        // $("span.child").nextUntil().css({
        $("span.child").prev().css({
            "color": "yellow",
            "border": "5px solid blue"
        });

        $(document).ready(function () {
            $("#selectAll").click(function() {
                console.log($(".toggle-normal").prop("checked", $(this).prop("checked")));
                // $("input[type=checkbox]").prop("checked", $(this).prop("checked"));
            });

            $("input[type=checkbox]").click(function() {
                if (!$(this).prop("checked")) {
                    $("#selectAll").prop("checked", false);
                }
            });
        });
    </script>
@endsection
