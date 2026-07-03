@props(['employer', 'width' => 90])

<img class="rounded-xl" width="{{ $width }}" src="{{ asset($employer->logo) }}" alt="{{ $employer->name }}">
