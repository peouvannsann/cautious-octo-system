@extends('master')

@section('section')

@endsection

@section('javascript')
    <script>
        console.log("Javascript Object");

        console.log("===Crate Object using new Object() and Appending object using .key = value ===");
        var myCar = new Object();
        myCar.make = "Ford";
        myCar.model = "Mustang";
        console.log('myCar :>> ', myCar);

        console.log("===Appending Object using ['key'] = value ===");
        myCar["year"] = 1969;
        console.log('myCar :>> ', myCar);

        function showProps(obj, objName) {
            var result = "";
            for (var i in obj) {
                if (obj.hasOwnProperty(i)) console.log(obj[i]);

            }
        }
        console.log("===Function showProps()===");
        showProps(myCar, "myCar");

        console.log("===Create object initializer===");
        // Using objects for Lookups
        var myHonda = {
            color : "red",
            wheels: 4,
            engine: {
                cylinders: 4,
                size: 2.2
            }
        };

        console.log("===Create Constructor function===");
        function Car(make, model, year) {
            this.make = make;
            this.model = model;
            this.year = year;
        }

        console.log("===Create variable to store object of constructor Car===");
        var mycar = new Car("Chevy", "Maliby", 1993);
        var anothercar = new Car("Mazda", "Miata", 1990);
        console.log('mycar.model :>> ', mycar.model);
        mycar.color = "black";
        console.log('mycar.color :>> ', mycar.color);

        console.log("===Create Object create===");
        var Animal = {
            type: "Invertebrates",
            displayType: function () {
                console.log('this.type :>> ', this.type);
            }
        };
        var animal = Object.create(Animal);
        animal.displayType();

        var fish = Object.create(Animal);
        fish.type = "Fishes";
        animal.displayType();

        let dishes = {
            plates: 8,
            cups: 10,
            forks: 28,
            bowls: 13
        };
        console.log("===Remove element in object dishes===");
        delete dishes.cups;
        console.log(dishes);

        console.log("===Multiple dimension object===");
        var ourStorage = {
            "desk": {
                "drawer" : "stapler"
            },
            "cabinet": {
                "top drawer" : {
                    "folder1" : "a file",
                    "folder2" : "secrets"
                },
                "bottom drawer" : "soda"
            }
        };
        console.log("Access object");
        console.log(ourStorage.cabinet["top drawer"].folder2);
        console.log(ourStorage.desk.drawer);
        ourStorage.cabinet['top drawer'].folder2 = "cake recipe";
        console.log(ourStorage.cabinet["top drawer"].folder2);

        console.log("Object Key");
        console.log(Object.keys(ourStorage));

        console.log("===Array Creation===");
        var sandwich = ["peanut butter", 'jelly', 'bread'];
        var teams = [
            ['Bulls', 23],
            ["white Sox", 45]
        ];
        console.log(sandwich[1]);//access array
        sandwich[1] = "bananas"; // assign array
        console.log(sandwich);
        console.log(teams[1][0]);
        teams[1][0] = "red socks";

        sandwich.forEach(element => {
            console.log('element :>> ', element);
        });

        console.log("=== Copying Array ===");
        var original = [true, true, undefined, false, null];
        var copy1 = original.slice(0);
        var copy2 = [...original];
        console.log(copy1, copy2);

        console.log("===Deep Array===");
        var deepArray0 = [["freeCodeCamp"]];
        var deepArray1 = [["freeCodeCamp"]];

        var shallowCopy = deepArray0.slice(0);
        shallowCopy[0].push('is great');
        console.log('Invalid Copy :>> ', deepArray0[0], shallowCopy[0]);

        var deepCopy = JSON.parse(JSON.stringify(deepArray1));
        deepCopy[0].push("is great");
        console.log('Deep Copy :>> ', deepArray1[0], deepCopy[0]);

        console.log("===Array Iterate===");
        var three = [1,2,3];
        console.log("Foreach");
        three.forEach( (item ,index) => {
            console.log('index, item :>> ', index, item);
        });
        console.log("Map");
        const doubled = three.map(function (item) {
            return item;
        })
        console.log('doubled :>> ', doubled);

        console.log("Closure");

        function makefunc() {
            var name = "JS Nuggests";
            function displayName() {
                console.log(name);
            }
            return displayName;
        }

        var myFunc = makefunc();
        myFunc();

        var counter = (function () { // anonymouse function
            var privateCounter = 0;
            function changeBy(val) { //private function can access in anonymous function wrapper
                privateCounter += val;
            }
            return { // public function
                increment: function () {
                    changeBy(1);
                },
                decrement: function(){
                    changeBy(-1);
                },
                value: function () {
                    return privateCounter;
                }
            };
        })(); // () for execute function

        console.log('counter.value() :>> ', counter.value());
        counter.increment();
        counter.increment();
        console.log('counter.value() :>> ', counter.value());
        counter.decrement();
        console.log('counter.value() :>> ', counter.value());

        console.log("An example to use assign() method");

        let user_obj = {
            "key_1": { name: "Adam" },
            2: { name: "Harry" },
        };
        let obj = Object.assign(user_obj, { 3: { name: "Jasam" } });
        console.log(obj);

        let obj1 = {name: 'Harry'};
        obj2 = {...obj1, color: 'white'};
        console.log(obj2);

        

    </script>
@endsection
