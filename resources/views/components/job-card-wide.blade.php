  @props(['job'])

  <x-panel class="flex gap-6">
      <div>
          <x-employer-logo :employer="$job->employer"></x-employer-logo>

      </div>

      <div class="flex flex-1 flex-col">

          <a href="#" class="self-start text-sm text-gray-400">{{ $job->employer->name }}</a>


          <h3 class="font-bold text-xl mt-3 group-hover:text-blue-600 transition-colors duration-300">

              <a target="_blank" href="{{ $job->url }}">
                  {{ $job->title }}

              </a>
          </h3>
          <p class="text-sm text-gray-400 mt-auto">Salary: {{ $job->salary }}</p>
      </div>


      <div class="">
          <div>
              @foreach ($job->tags as $tag)
                  <x-tag :$tag></x-tag>
              @endforeach


          </div>
      </div>

  </x-panel>
