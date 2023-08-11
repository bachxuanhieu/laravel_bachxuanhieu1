<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\ColorFormRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\File;
use App\Models\Category;
use App\Models\Color;
use App\Models\Product;
use App\Models\ProductImage;

class ColorController extends Controller
{
    public function index(){
        $colors= Color::all();
        return view('admin.colors.index',compact('colors'));
    }

    public function create(){
        return view('admin.colors.create');
    }
    public function store(ColorFormRequest $request){
        $validatedData= $request->validated();
        $validatedData['status']=$request->status==true ? '1':'0';
        Color::create($validatedData);
        return redirect('admin/colors')->with('message','Color added successfully');


    }
    public function edit(Color $color){
        
        return view('admin.colors.edit', compact('color'));
    }

    public function update(ColorFormRequest $request, $color_id){
        $validatedData= $request->validated();
        $validatedData['status']=$request->status==true ? '1':'0';
        Color::find($color_id)->update($validatedData);
        return redirect('admin/colors')->with('message','Color update successfully');
    }
    public function destroy($color_id){
        $color= Color::findOrFail($color_id);
        $color->delete();
        return redirect('admin/colors')->with('message','Color delete successfully');

    }
}
