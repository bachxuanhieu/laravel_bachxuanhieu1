<?php

namespace App\Http\Livewire\Frontend\Cart;

use Livewire\Component;
use App\Models\Cart;

class CartShow extends Component
{
    public $cart, $totalPrice=0;

    public function decrementQuanlity(int $cartId){

        $cartData = Cart::where('id',$cartId)->where('user_id',auth()->user()->id)->first();
        if($cartData)
        {
            $cartData->decrement('quanlity');
            $this->dispatchBrowserEvent('message', [
                'text' => 'Quanlity Updated',
                'type' => 'success',
                'status' => 200
            ]);
        }else
        {
            $this->dispatchBrowserEvent('message', [
                'text' => 'Something went wrong',
                'type' => 'error',
                'status' => 404
            ]);
        }
    }

    public function incrementQuanlity(int $cartId){
        $cartData = Cart::where('id',$cartId)->where('user_id',auth()->user()->id)->first();
        if($cartData)
        {
            if($cartData->productColor()->where('id',$cartData->product_color_id)->exists())
            {
                $productColor = $cartData->productColor()->where('id',$cartData->product_color_id)->first();
                if($productColor->quanlity > $cartData->quanlity)
                {
                    $cartData->increment('quanlity');
                    $this->dispatchBrowserEvent('message', [
                        'text' => 'Quanlity Updated',
                        'type' => 'success',
                        'status' => 200
                    ]); 
                }else{
                    $this->dispatchBrowserEvent('message', [
                        'text' => 'Only '.$productColor->quanlity.' Quanlity Avaiable',
                        'type' => 'warning',
                        'status' => 404
                    ]); 
                }
            }else{
                if($cartData->product->quanlity > $cartData->quanlity)
                {
                    $cartData->increment('quanlity');
                    $this->dispatchBrowserEvent('message', [
                        'text' => 'Quanlity Updated',
                        'type' => 'success',
                        'status' => 200
                    ]);
                }else{
                    $this->dispatchBrowserEvent('message', [
                        'text' => 'Only '.$cartData->product->quanlity.' Quanlity Avaiable',
                        'type' => 'warning',
                        'status' => 404
                    ]); 

                }
               
            }    
        }else
        {
            $this->dispatchBrowserEvent('message', [
                'text' => 'Something went wrong',
                'type' => 'error',
                'status' => 404
            ]);
        }
    }

    public function removeCartItem(int $cartId){
        $cartRemoveData = Cart::where('user_id',auth()->user()->id)->where('id',$cartId)->first();
            if($cartRemoveData){
                $cartRemoveData->delete();
                $this->emit('CartAddedUpdated');
                    $this->dispatchBrowserEvent('message', [
                        'text' => 'Cart Item Removed Successfully',
                        'type' => 'success',
                        'status' => 200
                    ]);
            }else{
                $this->dispatchBrowserEvent('message', [
                    'text' => 'Something went wrong',
                    'type' => 'error',
                    'status' => 500
                ]);

            }
    }


    public function render()
    {
        $this->cart = Cart::where('user_id',auth()->user()->id)->get();
        return view('livewire.frontend.cart.cart-show',[
            'cart'=> $this->cart,
        ]);
    }
}
