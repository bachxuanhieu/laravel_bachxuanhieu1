<div>
    <div class="footer-area">
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <h4 class="footer-heading">{{$appSetting->website_name ?? 'website name'}}</h4>
                    <div class="footer-underline"></div>
                    <p>
                        Sinh viên Cao Đẳng Công Nghệ Thông Tin tp.Hồ Chí Minh.
                    </p>
                </div>
                <div class="col-md-3">
                    <h4 class="footer-heading">Quick Links</h4>
                    <div class="footer-underline"></div>
                    <div class="mb-2"><a href="{{ url('/') }}" class="text-white">Home</a></div>
                    <div class="mb-2"><a href="{{ url('/about-us') }}" class="text-white">About Us</a></div>
                    <div class="mb-2"><a href="{{ url('/contact-us') }}" class="text-white">Contact Us</a></div>
                    <div class="mb-2"><a href="{{ url('/blogs') }}" class="text-white">Blogs</a></div>
                    <div class="mb-2"><a href="#" class="text-white">Sitemaps</a></div>
                </div>
                <div class="col-md-3">
                    <h4 class="footer-heading">Shop Now</h4>
                    <div class="footer-underline"></div>
                    <div class="mb-2"><a href="{{ url('/collections') }}" class="text-white">Collections</a></div>
                    <div class="mb-2"><a href="{{ url('/') }}" class="text-white">Trending Products</a></div>
                    <div class="mb-2"><a href="{{ url('/new-arrivals') }}" class="text-white">New Arrivals Products</a></div>
                    <div class="mb-2"><a href="{{ url('/cart') }}" class="text-white">Cart</a></div>
                </div>
                <div class="col-md-3">
                    <h4 class="footer-heading">Reach Us</h4>
                    <div class="footer-underline"></div>
                    <div class="mb-2">
                        <p>
                            <i class="fa fa-map-marker"></i>{{$appSetting->address ?? 'address'}}
                        </p>
                    </div>
                    <div class="mb-2">
                        <a href="" class="text-white">
                            <i class="fa fa-phone"></i> {{$appSetting->phone1 ?? 'phone'}}
                        </a>
                    </div>
                    <div class="mb-2">
                        <a href="" class="text-white">
                            <i class="fa fa-envelope"></i> {{$appSetting->email1 ?? 'email1'}}
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="copyright-area">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <p class=""> &copy;Bach Xuan Hieu; sv: itc </p>
                </div>
                <div class="col-md-4">
                    <div class="social-media">
                        Get Connected:
                        @if($appSetting->facebook)
                            <a href="{{($appSetting->facebook)}}"><i class="fa fa-facebook"></i></a>
                        @endif

                        @if($appSetting->twitter)
                            <a href="{{($appSetting->twitter)}}"><i class="fa fa-twitter"></i></a>
                        @endif

                        @if($appSetting->instagram)
                            <a href="{{($appSetting->instagram)}}"><i class="fa fa-instagram"></i></a>
                        @endif
                    
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>