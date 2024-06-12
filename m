Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510F817DE39
	for <oe-kbuild@lists.linux.dev>; Wed, 12 Jun 2024 14:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718203198; cv=none; b=dADPU0Yy4RS6H0Pb1ypLxsWEdaMc1Mci4PzjKzPuxPzACltStGzA4DfXT6Y9QsmKn4s2bioUgRMVu2+ZcXFsRWeNf2IPW/URDsjyTTMLutpLUEmsY4268mM4Aprujlbi+BeVM9JZWfwUu6uS8beNhIzDlJaIFNluCazO32XvyM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718203198; c=relaxed/simple;
	bh=C8Pf6TJnvxaJ4Nn4K66aAeGYlXGVGIeUuoWkgeaYxbg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jD6Fh1NzSfWD8hXOoaVqE41PkKfiqVh9b5nODrCEVhXLsv/Zqy5x4Dzi0oi8eCbp8EVhD5lOs1J5hc8GBSFT8Rx5a2i+k3dQnHvzsnZ1sRUrbBKdenfn7Xk6ruRkD6HAE3o4t0pgWAFwLqSofBX3VpPUF9OXQGzC6Y3OierjPic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yx59APT7; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yx59APT7"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4217a96de38so35938875e9.1
        for <oe-kbuild@lists.linux.dev>; Wed, 12 Jun 2024 07:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718203194; x=1718807994; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ek4Yz+vlANPAH4c/dw08+ma76dKbUBNCWTM+vTMJPkg=;
        b=Yx59APT7PzcFBu091HgnXtK3bXq8fSf486PlTUNz1a1+a6MnZ44dNshzKrhCPNv545
         29u9SB1EUC+nLlQuKL1PWDNjka3ZQXIv/K7Pfvp8Ck7r7BUlO284va1V80SzIEduZ/Oo
         j9C4Cw/lTcKBttjI2wCuFzVRQJxGKi0AYV6jgvBj9wKXQX7OAAmVtLDID1SDCDRdnKAE
         JNzg+70VgGAF8kWF/FJGJ4fIWv4xOVDq3klf6sDDrsfx4WaDHQKTrCA0W3274zRDbDO+
         axeDbBcKdZu5ai7CbEBnMwzYqPtQNMYUkzo8JWx2DvZE/00jVlFkHyAVVVaiLrpoiEvp
         CqLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718203194; x=1718807994;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ek4Yz+vlANPAH4c/dw08+ma76dKbUBNCWTM+vTMJPkg=;
        b=bARyv5G99c9YlLp3tI+SixM3h+8L5RAorXUcpVCjyrKCatQfvdcYBmzkSa/kK+efV5
         xKf0PnfKnMJfJGI5+SjPHibJ2+9+5G+WQ2XWTjp+H1Ii7TUyUXfVsGmcNvRxMpP/l2nS
         rjbbSzUa0g5/Wbvg4K6JTm/C+C/D/gFWVSA84qrH+qIa5Gsv0m+AAXXVfWNZHUT2c6r4
         j7JrYgXiCXnNN3RvYklsE2VHuLRberiwQWDksY0nprVv1hMEwVxwm0tWIKHRYoKZkfen
         Emj/DCnGtHjRK7KNMlemcM+fr+nV+DpTwbIuWjCwg838VVuw2PglEIBWpty7q9GzPSGI
         BDDg==
X-Gm-Message-State: AOJu0YxwQRM9Zio470737r65CiifIrdwA/FzYvH4OiJw7Vf5vA/faxCo
	PaEOhuv9iXhCXjzu8+MhouKIRANGSMy9cSQDkVHY8TA1VtHizJpdM6Sk2fEbTZMAk+Nj/O+cBjg
	b
X-Google-Smtp-Source: AGHT+IHoBqFVkLgUfa4fzrXbQ2MvOOSCUpnqYXpdqs629Xjbqw2VXrzEMNGPqVF9CCj+Druqiqe2WA==
X-Received: by 2002:a05:600c:314e:b0:422:140:f440 with SMTP id 5b1f17b1804b1-422867c0b23mr18811025e9.36.1718203193587;
        Wed, 12 Jun 2024 07:39:53 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422871ec9e6sm29485865e9.38.2024.06.12.07.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 07:39:53 -0700 (PDT)
Date: Wed, 12 Jun 2024 17:39:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [vbabka:slub-reservations 6/12] mm/slub.c:5551
 kmem_cache_reserve_only_alloc_noprof() warn: inconsistent returns
 '&s->reserve_lock'.
Message-ID: <0682f0c0-41bd-482e-8ea9-6a676766ef34@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git slub-reservations
head:   f5877f7833fc9f8a236be339ae5bbcccdde7c850
commit: 17f60c99bf92fbf1ed52e1c492f46cec91d14cd5 [6/12] mm, slub: implement per-cache reserves
config: x86_64-randconfig-161-20240612 (https://download.01.org/0day-ci/archive/20240612/202406122208.joPiUJJy-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202406122208.joPiUJJy-lkp@intel.com/

smatch warnings:
mm/slub.c:5551 kmem_cache_reserve_only_alloc_noprof() warn: inconsistent returns '&s->reserve_lock'.
mm/slub.c:5551 kmem_cache_reserve_only_alloc_noprof() warn: inconsistent returns 'flags'.

vim +5551 mm/slub.c

17f60c99bf92fbf Vlastimil Babka 2024-05-31  5512  
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5513  void *kmem_cache_reserve_only_alloc_noprof(struct kmem_cache_reserve *reserve,
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5514  					   gfp_t gfp)
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5515  {
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5516  	struct kmem_cache *s = reserve->cache;
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5517  	unsigned long flags;
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5518  	void *obj = NULL;
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5519  
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5520  	spin_lock_irqsave(&s->reserve_lock, flags);
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5521  
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5522  	if (!reserve->size && !s->reserve_surplus)
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5523  		goto empty_reserve;

spin_unlock_irqrestore(&s->reserve_lock, flags);

17f60c99bf92fbf Vlastimil Babka 2024-05-31  5524  
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5525  	/*
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5526  	 * Should not happen, the kmem_cache reserve_size should be sum of all
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5527  	 * active struct kmem_cache_reserve's size and the shared surplus
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5528  	 */
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5529  	if (WARN_ON_ONCE(!s->reserve_size))
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5530  		goto empty_reserve;

spin_unlock_irqrestore(&s->reserve_lock, flags)

17f60c99bf92fbf Vlastimil Babka 2024-05-31  5531  
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5532  	obj = s->reserve_freelist;
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5533  	s->reserve_freelist = get_freepointer(s, obj);
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5534  
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5535  	s->reserve_size--;
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5536  
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5537  	if (s->size)
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5538  		reserve->size--;
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5539  	else
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5540  		s->reserve_surplus--;
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5541  
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5542  	spin_unlock_irqrestore(&s->reserve_lock, flags);
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5543  
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5544  	slab_post_alloc_hook(s, NULL, gfp, 1, &obj,
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5545  		slab_want_init_on_alloc(gfp, s), s->object_size);
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5546  
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5547  	/* paired with smp_rmb() in kmem_cache_reserve_free() */
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5548  	smp_wmb();
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5549  
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5550  empty_reserve:
17f60c99bf92fbf Vlastimil Babka 2024-05-31 @5551  	return obj;
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5552  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

