<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class RegisterUserController extends Controller
{
    /**
     * Show the registration form.
     */
    public function create()
    {
        return view('auth.register');
    }

    /**
     * Store a newly created user in storage.
     */
    public function store(Request $request)
    {
        $userAttributes = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:8|confirmed',
        ]);

        $employerAttributes = $request->validate([
            'employer' => 'required|string|max:255',
            'logo' => 'required|image|max:2048',
        ]);

        $user = User::create($userAttributes);

        // Spremi logo u public/logos
        $filename = $request->file('logo')->hashName();

        $request->file('logo')->move(public_path('logos'), $filename);

        $logoPath = 'logos/' . $filename;

        $user->employer()->create([
            'name' => $employerAttributes['employer'],
            'logo' => $logoPath,
        ]);

        Auth::login($user);

        return redirect('/');
    }
}
