<?php

namespace App\Http\Livewire\Frontend\Product;

use Livewire\Component;
use Illuminate\Support\Facades\Auth;
use App\Models\Wishlist;
use App\Models\Cart;

class View extends Component
{
    public $category, $product, $prodColorSelectedQuanlity, $quanlityCount=1, $productColorId;

    public function addWishList($productId){
        
        if(Auth::check()){
            if(Wishlist::where('user_id',auth()->user()->id)->where('product_id',$productId)->exists()){
                session()->flash('message','Already added to wishlist');
                $this->dispatchBrowserEvent('message', [
                    'text' => 'Already added to wishlist',
                    'type' => 'warning',
                    'status' => 409
                ]);
            }else{
                Wishlist::create([
                    'user_id'=> auth()->user()->id,
                    'product_id' => $productId,
                ]);
                $this->emit('wishlistAddedUpdated');
                session()->flash('message','Wishlist added successfully');
                $this->dispatchBrowserEvent('message', [
                    'text' => 'Wishlist added successfully',
                    'type' => 'success',
                    'status' => 200
                ]);
            }

        }else{
            session()->flash('message','please login to contine');
                $this->dispatchBrowserEvent('message', [
                    'text' => 'please login to continue',
                    'type' => 'info',
                    'status' => 401
                ]);
            
            return false;
        }

    }
// add to cart
    public function addToCart(int $productId)
    {
        if(Auth::check())
        {
            // dd($productId);
            if($this->product->where('id',$productId)->where('status','0')->exists()){
                //kiểm tra màu
               if($this->product->productColors()->count() > 1)
               {
                    if( $this->prodColorSelectedQuanlity != null)
                    {
                        if(Cart::where('user_id',auth()->user()->id)
                                ->where('product_id',$productId)
                                ->where('product_color_id',$this->productColorId)
                                ->exists())
                            {
                                $this->dispatchBrowserEvent('message', [
                                    'text' => 'Sản phẩm đã có trong giỏ hàng',
                                    'type' => 'success',
                                    'status' => 200
                                ]); 
                            }
                            else
                            {

                                $productColor = $this->product->productColors()->where('id',$this->productColorId)->first();
                                if($productColor->quanlity > 0)
                                {
                                    if($productColor->quanlity > $this->quanlityCount)
                                    {
                                        // insert product
                                        Cart::create([
                                            'user_id' => auth()->user()->id,
                                            'product_id' => $productId,
                                            'product_color_id' => $this->productColorId,
                                            'quanlity' => $this -> quanlityCount
                                        ]);
                                        $this->dispatchBrowserEvent('message', [
                                            'text' => 'Sản phẩm đã được thêm vào giỏ  hàng',
                                            'type' => 'success',
                                            'status' => 200
                                        ]);  
                                    }
                                    else
                                    {
                                        $this->dispatchBrowserEvent('message', [
                                            'text' => 'Sản phẩm chir còn '.$productColor->quanlity.' trong cửa hàng',
                                            'type' => 'warning',
                                            'status' => 404
                                        ]);    
                                    }
                                }
                                else
                                {
                                    $this->dispatchBrowserEvent('message', [
                                        'text' => 'Sản phẩm đã hết hàng',
                                        'type' => 'info',
                                        'status' => 404
                                    ]);  
                               }
                            }
                    }
                    else
                    {
                        $this->dispatchBrowserEvent('message', [
                            'text' => 'Bạn hãy chọn màu sản phẩm',
                            'type' => 'info',
                            'status' => 404
                        ]);  
                    }
               }
               else
               {    
                    if(Cart::where('user_id',auth()->user()->id)->where('product_id',$productId)->exists())
                    {
                        $this->dispatchBrowserEvent('message', [
                            'text' => 'Sản phẩm đã có trong giỏ hàng',
                            'type' => 'success',
                            'status' => 200
                        ]);  
                    }
                    else
                    {
                        if($this->product->quanlity > 0)
                        {
                            if($this->product->quanlity > $this->quanlityCount)
                            {
                                // insert product
                                Cart::create([
                                    'user_id' => auth()->user()->id,
                                    'product_id' => $productId,
                                    'quanlity' => $this -> quanlityCount
                                ]);
                                $this->dispatchBrowserEvent('message', [
                                    'text' => 'Sản phẩm đã được thêm vào giỏ  hàng',
                                    'type' => 'success',
                                    'status' => 200
                                ]);  
                            }
                            else
                            {
                                $this->dispatchBrowserEvent('message', [
                                    'text' => 'Sản phẩm chir còn '.$this->product->quanlity.' trong cửa hàng',
                                    'type' => 'warning',
                                    'status' => 404
                                ]);    
                            }
                        }
                        else
                        {
                            $this->dispatchBrowserEvent('message', [
                                'text' => 'Sản phẩm đã hết trong cửa hàng',
                                'type' => 'warning',
                                'status' => 404
                            ]);    
                        }
                    }
               }
            }
            else
            {
                $this->dispatchBrowserEvent('message', [
                    'text' => 'San pham khong ton tai',
                    'type' => 'warning',
                    'status' => 404
                ]);  
            }
        }
        else{
            $this->dispatchBrowserEvent('message', [
                'text' => 'please login to continue',
                'type' => 'info',
                'status' => 401
            ]);
        }
    }





    public function colorSelected($productColorId)
    {
        $this->productColorId = $productColorId;
        $productColor = $this->product->productColors()->where('id', $productColorId)->first();
    
        $this->prodColorSelectedQuanlity = $productColor->quanlity;
    
        if ($this->prodColorSelectedQuanlity == 0) {
            $this->prodColorSelectedQuanlity = "outOfstock";
        }
    }
    
    

    public function incrementQuanlity()
    {
        if ($this->quanlityCount < 10) {
            $this->quanlityCount++;
        }
    }
    
    public function decrementQuanlity()
    {
        if ($this->quanlityCount > 1) {
            $this->quanlityCount--;
        }
    }
    

    public function render()
    {
        return view('livewire.frontend.product.view',[
            'category' => $this-> category,
            'product' => $this-> product,
        ]);
    }
}
