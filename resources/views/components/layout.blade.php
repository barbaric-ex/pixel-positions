<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Pixel Positions</title>
    @vite(['resources/css/app.css', 'resources/js/app.js'])
    <link href="https://fonts.googleapis.com/css2?family=Hanken+Grotesk:wght@400;500;600;&display=swap" rel="stylesheet">
</head>

<body class="bg-body text-white hanken pb-10">

    <div class="main_wrap px-10">

        <nav class="flex justify-between items-center py-4 border-b border-white/10">
            <div>
                <a href="/">
                  <img src="{{ asset('images/logo.svg') }}" alt="Pixel Positions Logo">
                </a>
            </div>

            <div class="space-x-6 font-bold">
                <a href="#">Jobs</a>
                <a href="#">Careers</a>
                <a href="#">Salaries</a>
                <a href="#">Companies</a>
            </div>

            @auth
                <div class="flex space-x-6 font-bold">
                    <a href="/jobs/create">Post a Job</a>

                    <form action="/logout" method="POST" class="inline">
                        @csrf
                        @method('DELETE')
                        <button type="submit">Logout</button>

                    </form>
                </div>


            @endauth

            @guest
                <div class="space-x-6 font-bold">
                    <a href="/register">Sign Up</a>
                    <a href="/login">Log In</a>
                </div>
            @endguest

        </nav>

        <main class="mt-10 max-w-[986px] mx-auto">
            {{ $slot }}
        </main>


    </div>

</body>

</html>
