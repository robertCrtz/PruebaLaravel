@if(auth::user()->image)
    <div class="container-avatar">
        <img src="{{ route('user.avatar', ['filename'=>auth::user()->image]) }}" class="mb-1 avatar">
    </div>
@endif


