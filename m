Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93152538B
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Jul 2023 05:35:53 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3fc04692e20so6013165e9.0
        for <oe-kbuild@lists.linux.dev>; Wed, 26 Jul 2023 22:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690436151; x=1691040951;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ftumy01F0Ko1xW2hs0crQpUrNaDf+ViDOsglCguDcFA=;
        b=o209E11dTN46mx03WZNxUbOse9BjutpAW3039IRt/ufJPO3Y7r+6uX88D8cgUdon+C
         AIS1hOrTVAeyd0+477aaCPFGfgtem38oEjl+WRqT3nny8hjTe0MA7EF32bENY744LfW8
         tiq+VG6FWm4UCZmIxnVEpXfdkgMLmhfBrnKUwqmSkY5CmUYPcMuHxShbtIAhk+WiaG39
         MwHQp/EJDm7Z2BxRWu7FYZ5C/JrUf7SJ612B39gGWlB2utQ4xPqZOPSKgbtGBrht79Dj
         HagP6RPEAdgmm/gtaN5TsADrsuKApe1iO48bsb44ZI6VSmrUlwUuMa5Fel45Vk6aGBfc
         oCMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690436151; x=1691040951;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ftumy01F0Ko1xW2hs0crQpUrNaDf+ViDOsglCguDcFA=;
        b=CwbASt7cgEXgQFHWkE54RFig00CAWEs6tyUURGcWAX8jzkBREpejkq9LQZ5GCl+ddV
         AGkw4sR52WMkkzkvl9UHPlrKuGmNjPfLOVzk++z9HwjpIx4g9MiBwmy/212bE1GOzeA/
         p2R5fGcq/KFgO0R+jB9Uy7IB751zTcK4vDh33Hzh9sMcshss3MwVMit+A9PI6nRBe6cU
         5t4/4+V+4dd6HmQRiSQfppf698VThBpUtXB6FP2b/6dikUZCyILlfnVmBh/IXpssNbWp
         1rkq56mekIm0XU/WWOG5FmXVxuHugcj5w67z6Eg9yu71hE9nEmsenjEO8WSZ+rn0ybIA
         DIzg==
X-Gm-Message-State: ABy/qLa8YYu9/ZpJY7mTl2SLDpzc7n8HYxVM49dsGM7nOnkap0/Gkgfn
	wXd3eerDZHGLXFVxpS/6c+tPVQ==
X-Google-Smtp-Source: APBJJlEsJPQjvGo+rB2dJPNqvRvmfx49TydEw+OzOTWp5o/8mQYZWXfSc54kYmYKpjEgzau4Qg/y2A==
X-Received: by 2002:adf:ff89:0:b0:317:6b16:497e with SMTP id j9-20020adfff89000000b003176b16497emr710486wrr.42.1690436151569;
        Wed, 26 Jul 2023 22:35:51 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t4-20020a0560001a4400b003176053506fsm833310wry.99.2023.07.26.22.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 22:35:51 -0700 (PDT)
Date: Thu, 27 Jul 2023 08:35:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Helge Deller <deller@gmx.de>
Cc: oe-kbuild@lists.linux.dev, Marco Elver <elver@google.com>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: mm/kfence/kfence_test.c:287 test_alloc() warn: use 'gfp' here
 instead of GFP_KERNEL?
Message-ID: <7f9f8c77-044c-4c20-85ba-3c1ef4e6a358@kadam.mountain>
References: <9e72b7ea-9598-415d-bc55-f2f42b7fcb3b@kadam.mountain>
 <fea8677b-348a-dd67-4eac-12c547afa00d@gmx.de>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fea8677b-348a-dd67-4eac-12c547afa00d@gmx.de>

On Thu, Jul 27, 2023 at 07:23:23AM +0200, Helge Deller wrote:
> > bc8fbc5f305aec Marco Elver     2021-02-25  282  			alloc = kmalloc(size, gfp);
> >                                                                                                ^^^
> > 
> > bc8fbc5f305aec Marco Elver     2021-02-25  283
> > bc8fbc5f305aec Marco Elver     2021-02-25  284  		if (is_kfence_address(alloc)) {
> > 8dae0cfed57357 Vlastimil Babka 2021-11-03  285  			struct slab *slab = virt_to_slab(alloc);
> > 588c7fa022d7b2 Hyeonggon Yoo   2021-06-28  286  			struct kmem_cache *s = test_cache ?:
> > 588c7fa022d7b2 Hyeonggon Yoo   2021-06-28 @287  					kmalloc_caches[kmalloc_type(GFP_KERNEL)][__kmalloc_index(size, false)];
> >                                                                                                                      ^^^^^^^^^^
> > I feel like using gfp might be correct but I'm not sure?  This code
> > is from prior to this commit.  Let's add Marco to the CC.
> 
> Since this is a test program, I assume that "GFP_KERNEL" is used intentionally
> instead of "gfp" here to check if the "kmalloc(size, gfp)" above gets the right kmalloc_caches[].
> If so, is there a way to silence the smatch warning ("mm/kfence/kfence_test.c:287 test_alloc() warn: use 'gfp' here instead of GFP_KERNEL?") ?
> But I'm not sure either, so adding Hyeonggon to the CC too...

Instead of silencing warnings, I prefer to just look at them one time
and move on.

Old warnings are included in the emails if someone touches the code
again.  The other double free warnings are an example of this.  (Except
that I never have forwarded them before because they're intentional as
part of testing kfence.)

regards,
dan carpenter
