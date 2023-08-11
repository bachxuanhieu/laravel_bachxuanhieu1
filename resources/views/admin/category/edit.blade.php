@extends('layouts.admin')


@section('content')
<div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h3>Edit Category</h3>
                        <a href="{{url('admin/category')}}" class="btn btn-primary btn-sm text-white float-end ">Back</a>
                    </div>
                    <div class="card-body">
                    <form action="{{ url('admin/category/' . $category->id) }}" method="POST" enctype="multipart/form-data">

                            @csrf
                            @method('PUT')
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="">Name</label>
                                    <input type="text" name="name" value="{{ $category->name }}" class="form-control">
                                    @error('name') <small class="text-danger">{{$message}}</small>   @enderror
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="">Slug</label>
                                    <input type="text" name="slug"  value="{{ $category->slug }}" class="form-control">
                                    @error('slug') <small class="text-danger">{{$message}}</small>   @enderror
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="">Descripton</label>
                                    <textarea name="description"   class="form-control" row="3">{{ $category->description }}</textarea>
                                    @error('description') <small class="text-danger">{{$message}}</small>   @enderror
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="">Image</label>
                                    <input type="file" name="image" class="form-control">
                                    <img src="{{ asset('/uploads/category/'.$category->image)}}" width='100px' heith='100px' alt="">
                                </div>
                                <div class="col-md-6 mb-3"><br/>
                                    <label for="">Status</label>
                                    <input type="checkbox" name="status" {{ $category->status=='1' ? 'checked' : ''}}/>
                                </div>

                                <div class="col-md-12">
                                    <h4>SEO Tags</h4>
                                </div>

                                <div class="col-md-12 mb-3">
                                    <label for="">Meta_title</label>
                                    <input type="text" name="meta_title" value="{{ $category->meta_title }}" class="form-control">
                                    @error('meta_title') <small class="text-danger">{{$message}}</small>   @enderror
                                </div>
                                <div class="col-md-12 mb-3">
                                    <label for="">Meta_keyword</label>
                                    <textarea type="text" name="meta_keyword" class="form-control" row="3">{{ $category->meta_keyword }}</textarea>
                                    @error('meta_keyword') <small class="text-danger">{{$message}}</small>   @enderror
                                </div>
                                <div class="col-md-12 mb-3">
                                    <label for="">Meta_description</label>
                                    <textarea type="text" name="meta_description" class="form-control" row="3">{{ $category->meta_description }}</textarea>
                                    @error('meta_description') <small class="text-danger">{{$message}}</small>   @enderror
                                </div>
                                <div class="col-md-12 mb-3">
                                    <button type="submit" class="btn btn-primary float-end">Update</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
</div>
@endsection