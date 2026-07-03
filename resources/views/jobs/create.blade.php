<x-layout>
    <x-page-heading>New Job</x-page-heading>

    <x-forms.form method="POST" action="/jobs">
        @csrf

        <x-forms.input label="Title" name="title" placeholder="Job Title" />
        <x-forms.input label="Salary" name="salary" placeholder="Annual Salary" />
        <x-forms.input label="Location" name="location" placeholder=", Florida, Columbia" />

        <x-forms.select label="Schedule" name="schedule">
            <option>Full Time</option>
            <option>Part Time</option>

        </x-forms.select>
        <x-forms.input label="URL" name="url" placeholder="https://acme.com/job" />
        <x-forms.checkbox label="Feature (Cost Extra)" name="featured" />

        <x-forms.divider></x-forms.divider>

        <x-forms.input label="Tags (comma-separated)" name="tags" placeholder="frontend , backend , education..." />

        <x-forms.button>Publish</x-forms.button>
    </x-forms.form>
</x-layout>
