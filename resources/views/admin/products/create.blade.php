@extends('layouts.admin')
@section('content')
<div class="row">
   <div class="col-md-12">
      <div class="card">
         <div class="card-header">
            <h3>Add Products
               <a href="{{url('admin/products')}}" class="btn btn-danger btn-sm text-white float-end ">Back</a>
            </h3>
         </div>
         <div class="card-body">
            @if($errors->any())
            <div class="alert alert-warning">
               @foreach($errors->all() as $error)
               <div>{{$error}}</div>
               @endforeach
            </div>
            @endif
            <form action="{{ url('admin/products')}}" method="POST" enctype="multipart/form-data">
               @csrf
               <ul class="nav nav-tabs" id="myTab" role="tablist">
                  <li class="nav-item" role="presentation">
                     <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">
                     Home
                     </button>
                  </li>
                  <li class="nav-item" role="presentation">
                     <button class="nav-link" id="seotag-tab" data-bs-toggle="tab" data-bs-target="#seotag" type="button" role="tab" aria-controls="seotag" aria-selected="false">
                     SEO Tags
                     </button>
                  </li>
                  <li class="nav-item" role="presentation">
                     <button class="nav-link" id="details-tab" data-bs-toggle="tab" data-bs-target="#details" type="button" role="tab" aria-controls="details" aria-selected="false">
                     Details
                     </button>
                  </li>
                  <li class="nav-item" role="presentation">
                     <button class="nav-link" id="image-tab" data-bs-toggle="tab" data-bs-target="#image" type="button" role="tab" aria-controls="image" aria-selected="false">
                     Product Image
                     </button>
                  </li>
                  <li class="nav-item" role="presentation">
                     <button class="nav-link" id="color-tab" data-bs-toggle="tab" data-bs-target="#color" type="button" role="tab" aria-controls="image" aria-selected="false">
                     Product Color
                     </button>
                  </li>
               </ul>
               <div class="tab-content" id="myTabContent">
                  <div class="tab-pane fade border p-3 show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                     <div class="mb-3">
                        <label for="">Category</label>
                        <select name="category_id" class="form-control" id="">
                           @foreach ($categories as $category)
                           <option value="{{$category->id}}">{{$category->name}}</option>
                           @endforeach
                        </select>
                     </div>
                     <div class="mb-3">
                        <label for="">Name</label>
                        <input type="text" name="name" class="form-control">
                        @error('name') <small class="text-danger">{{$message}}</small>   @enderror
                     </div>
                     <div class="mb-3">
                        <label for="">Slug</label>
                        <input type="text" name="slug" class="form-control">
                        @error('slug') <small class="text-danger">{{$message}}</small>   @enderror
                     </div>
                     <div class="mb-3">
                        <label for="">Select Brand</label>
                        <select name="brand" class="form-control" id="">
                           @foreach ($brands as $brand)
                           <option value="{{$brand->name}}">{{$brand->name}}</option>
                           @endforeach
                        </select>
                     </div>
                     <div class="mb-3">
                        <label for="">Small Description</label>
                        <textarea name="small_description" class="form-control" id=""  rows="4"></textarea>
                        @error('small_description') <small class="text-danger">{{$message}}</small>   @enderror
                     </div>
                     <div class="mb-3">
                        <label for="">Description</label>
                        <textarea name="description" id="" class="form-control" rows="4"></textarea>
                        @error('description') <small class="text-danger">{{$message}}</small>   @enderror
                     </div>
                  </div>
                  <div class="tab-pane fade  border p-3" id="seotag" role="tabpanel" aria-labelledby="seotag-tab">
                     <div class="mb-3">
                        <label for="">Meta Title</label>
                        <input type="text" name="meta_title" class="form-control">
                        @error('meta_title') <small class="text-danger">{{$message}}</small>   @enderror
                     </div>
                     <div class="mb-3">
                        <label for="">Meta Keyword</label>
                        <textarea name="meta_keyword" class="form-control" id=""  rows="4"></textarea>
                        @error('meta_keyword') <small class="text-danger">{{$message}}</small>   @enderror
                     </div>
                     <div class="mb-3">
                        <label for="">Meta Description</label>
                        <textarea name="meta_description" class="form-control" id=""  rows="4"></textarea>
                        @error('meta_description') <small class="text-danger">{{$message}}</small>   @enderror
                     </div>
                  </div>
                  <div class="tab-pane fade  border p-3" id="details" role="tabpanel" aria-labelledby="details-tab">
                     <div class="row">
                        <div class="col-md-4">
                           <div class="mb-3">
                              <label for="">Original Price</label>
                              <input type="text" name="original_price" class="form-control">
                              @error('original_price') <small class="text-danger">{{$message}}</small>   @enderror
                           </div>
                        </div>
                        <div class="col-md-4">
                           <div class="mb-3">
                              <label for="">Selling Price</label>
                              <input type="number" name="selling_price" class="form-control">
                              @error('selling_price') <small class="text-danger">{{$message}}</small>   @enderror
                           </div>
                        </div>
                        <div class="col-md-4">
                           <div class="mb-3">
                              <label for="">Quanlity</label>
                              <input type="text" name="quanlity" class="form-control">
                              @error('quanlity') <small class="text-danger">{{$message}}</small>   @enderror
                           </div>
                        </div>
                        <div class="col-md-4">
                           <div class="mb-3">
                              <label for="">Trending</label>
                              <input type="checkbox" name="trending">
                           </div>
                        </div>
                        <div class="col-md-4">
                           <div class="mb-3">
                              <label for="">Status</label>
                              <input type="checkbox" name="status">
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="tab-pane fade  border p-3" id="image" role="tabpanel" aria-labelledby="image-tab">
                     <label for="">Upload Product Imaga</label>
                     <input type="file" name="image[]" multiple class="">
                  </div>
                  <div class="tab-pane fade  border p-3" id="color" role="tabpanel" aria-labelledby="color-tab">
                     <label for="">Select Color</label>
                     <div class="row">
                        @forelse ($colors as $coloritem)
                        <div class="col-md-3">
                           Color: <input type="checkbox" name="colors[]" multiple class="" value="{{$coloritem->id}}">
                           {{$coloritem->name}}
                           <br/>
                           Quanlity: <input type="number" name="colorquanlity[{{$coloritem->id}}]" style="width: 70px; border:1px soild">
                        </div>
                        @empty
                        <div class="col-md-2">
                           <h1>No colors found</h1>
                        </div>
                        @endforelse
                     </div>
                  </div>
               </div>
               <div>
                  <button type="submit" class="btn btn-primary">Submit</button>
               </div>
            </form>
         </div>
      </div>
   </div>
</div>
@endsection