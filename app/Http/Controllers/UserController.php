<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\File;
use Illuminate\Http\Response;

class UserController extends Controller{
    
    public function __construct(){
        $this->middleware('auth');
    }
    
    public function config(){
        return view('user.config');
    }
    
    public function update(Request $request){
        //conseguir usuario identificado
        $user = \auth::user();
        $id = \auth::user()->id;
        
        //validacion del formulario
        $validate = $this->validate($request, [
            'name' => 'required|string|max:255',
            'surname'=> 'required|string|max:255',
            'nick'=> 'required|string|max:255|unique:users,nick,'.$id,
            'email'=> 'required|string|email|max:255|unique:users,email,'.$id
        ]);
        
        //recoger los datos del usuario
        $name = $request->input('name');
        $surname = $request->input('surname');
        $nick = $request->input('nick');
        $email = $request->input('email');
        
        //asignar nuevos valores del usuario
        $user->name = $name;
        $user->surname = $surname;
        $user->nick = $nick;
        $user->email = $email;
        
        //Subir imagen
        $image_path = $request->file('image_path');
        if($image_path){
            //poner nombre unico
            $image_path_full = time().$image_path->getClientOriginalName();
            
            //guardar carpeta storage
            Storage::disk('users')->put($image_path_full, File::get($image_path));
            
            //setear el nombre de la imagen en el objeto
            $user->image = $image_path_full;
        }
        
        //ejecutar consulta y cambios en la base de datos
        $user->update();

        return redirect()->route('config')
                         ->with(['message'=>'Usuario actualizado correctamente']);
//        die();
       
    }
    
        //Obtener la imagen
        public function getImage($filename){
            $file = Storage::disk('users')->get($filename);
            return new response($file, 200);
        }
}
