<?php

namespace App\Http\Controllers;

use App\Models\Job;
use Illuminate\Http\Request;

class SearchController extends Controller
{
    public function __invoke(Request $request)
    {
        $query = $request->input('q');

        // Perform the search logic here, e.g., querying the database for jobs matching the query
        $jobs = Job::with('employer', 'tags')->where('title', 'like', "%{$query}%")->get();

        return view('results', ['jobs' => $jobs]);
    }
}
