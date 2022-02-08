@extends ('layouts.app')

@section('content')

<div class="container">
    <div class="justify-content-center row">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Subir Nueva Imagen</div>
                <div class="card-body">
                    <form method="POST" action="{{ route('image.save') }}" class="" enctype="multipart/form-data">
                        @csrf
                        <div class="form-group row">
                            <label for="image_path" class="col-md-3 col-form-label text-md-right">Imagen</label>
                            <div class="col-md-7">
                                <input class="form-control" name="image_path" id="image_path" type="file" required>
                                @if($errors->has('image_path'))
                                <span class="invalid-feedback" role='alert'>
                                    <strong>{{ $errors->first('image_path') }}</strong>
                                </span>
                                @endif
                            </div>
                        </div>

                            <div class="form-group row">
                                <label for="description" class="col-md-3 col-form-label text-md-right">Descripcion</label>
                                <div class="col-md-7">
                                    <textarea class="form-control" name="description" id="description" required></textarea>
                                    @if($errors->has('description'))
                                    <span class="invalid-feedback" role='alert'>
                                        <strong>{{ $errors->first('description') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>
                        
                        <div class="form-group row">                            
                            <div class="col-md-6 offset-md-3">
                                <input class="btn btn-primary" type="submit" value="Guardar Imagen">
                            </div>
                        </div>
                            
                            
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection

