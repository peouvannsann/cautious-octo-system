<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
</head>
<body class="bg-gray-200 w-full h-full font-sans">
    <div class="flex h-screen">
        <div class="m-auto">
            <h1 class="text-center pb-12 text-2xl font-bold">
                Netsletter
            </h1>

            <form action="/subscribe" method="post">
                @csrf
                <input type="text" name="email"
                 placeholder="Enter Email"
                  class="px-4 py-2 shadow-xl rouned-xl placeholder-gray-50::placeholder">

                  <button type="submit">
                          submit
                      </button>
            </form>
        </div>
    </div>
    
</body>
</html>