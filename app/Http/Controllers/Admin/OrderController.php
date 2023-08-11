<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facedes\Mail;
use App\Models\Order;
use App\Mail\InvoiceOrderMailable;
use Illuminate\Support\Carbon;
use Barryvdh\DomPDF\Facade\Pdf;

class OrderController extends Controller
{
    public function index(Request $request) {
        $todayDate = Carbon::now()->format('Y-m-d');
        $orders = Order::where(function ($q) use ($request, $todayDate) {
            if ($request->date != null) {
                $q->whereDate('created_at', $request->date);
            } else {
                $q->whereDate('created_at', $todayDate);
            }
        })
        ->when($request->status != null, function ($q) use ($request) {
            $q->where('status_message', $request->status);
        })
        ->paginate(10);
    
        return view('admin.orders.index', compact('orders'));
    }
    



    public function show(int $orderId){
        $order = Order::where('id',$orderId)->first();
        if($order){
            return view('admin.orders.view',compact('order'));
        }else{
            
            return redirect()->back()->with('message','No order Found');
        }
        
    }

    public function updateOrderStatus(int $orderId, Request $request){
        $order = Order::where('id',$orderId)->first();
        if($order){

            $order->update([
                'status_message' => $request->order_status
            ]);
            return redirect('admin/orders/'.$orderId)->with('message','Order status Updated');
        }else{
            
            return redirect('admin/orders/'.$orderId)->with('message','Order is not Updated');
        }
    }

    public function viewInvoice(int $orderId)
    {
        $order = Order::findOrFail($orderId);
        return view('admin.invoice.generate-invoice',compact('order'));
    }
    public function  generateInvoice(int $orderId){

        $order = Order::findOrFail($orderId);

        $data = ['order' => $order];    
        $tadayDate= Carbon::now()->format('Y-m-d');
        $pdf = Pdf::loadView('admin.invoice.generate-invoice', $data);
        return $pdf->download('invoice'.$order->id.'-'.$tadayDate.'.pdf');
    }

    public function mailInvoice(int $orderId){
        try{
            $order = Order::findOrFail($orderId);
            Mail::to("$order->email")->send(new InvoiceOrderMailable($order));
            return redirect('admin/orders/'.$orderId)->with('message','Invoice mail has been to send to '.$order->email);
        }catch(\Exception $e)
        {
            return redirect('admin/orders/'.$orderId)->with('message','Something Went Wrong!'); 
        }
        
       
       
    }
}
