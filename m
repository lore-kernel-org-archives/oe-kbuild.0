Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3074647A7A
	for <oe-kbuild@lists.linux.dev>; Thu,  2 May 2024 08:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714640378; cv=none; b=GMpPfwrKvxfxxtLGZ/Jn6+zaTTgg+ljNtLFHlQXfZjOAIw/Ur41V1LL5tO66KtPgcUMApTPDsOetRNfOSA8mnepxCPvAuM5GA7OrVykjOydJh8yrvn0nAdRUjzz4SkluPVEhPgKH/sNrDsNKrIC/Mx5ySOv6tu5wynpsGxE+cLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714640378; c=relaxed/simple;
	bh=D4E94Bf3nVOiOUOtGxbjP0qqOdPORDnjxt9Hu/q2a9I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ul8K9S5VyEjFG/vBt0tuIEREfEbWmz8LWxyosR5iVSG4QmUEAPC1xtr2ktTkKxfPXaQYYkDVFUeoG5AavyqceNxsMh7/VlOiEXUiV0jSC6nvu6wwYgz+ZIib7sdgj3JjsLg7MKoVs+r1RjMhrWBI+PIA8LGsJfLjvDFdvbjQimM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=htdmcM9k; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="htdmcM9k"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2e1fa1f1d9bso4449741fa.0
        for <oe-kbuild@lists.linux.dev>; Thu, 02 May 2024 01:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714640374; x=1715245174; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Jv464nUVZs5/EmPlVKp62NMB+0lshPo0ejZbmfV3ec=;
        b=htdmcM9k89EQhIBey/oxtaUR80Ap/mw2tup04zBhbaEqPFLzJp/UhEJorY5mItDcZS
         Gy4cfxqwXOIuLxOr8tsqvwQBmxzWvSVzv5e1LtxKKheXAvB75FXtC8VIq5BKL2mFxy+d
         T4rBk5XXH2n/xs3cwGbYpZiilrp6I5v0k4ZTZXZTHVHEqV2xPx4j6E9s7f+3h6CdVU+/
         f6SjskxaL6dhDgJpJkjxn+mdIRqb+d+5/u3iL2JHV20u8lg883JbA2JfwKfJu/uVVQut
         4PiWK13PHBNm8iW3RMGdYBKJ+3VDSNy4sKooIhLfwwqpUwxdEV5mW/mvg+9sMKMNXtkg
         Txrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714640374; x=1715245174;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Jv464nUVZs5/EmPlVKp62NMB+0lshPo0ejZbmfV3ec=;
        b=elPAZp2TcdDgn6GjPwOSz2HTuLqBnb8uD98vLoVnkBXVBKXDSz5NutgK8u33fj96+R
         uZAh9CwvI9ZeqlgJnPbYntSlNMpYnrc7Ez28MoeAt+/M6mAvM2f2O0+NSKI8Wb7VKPfF
         PztfNN85173U8TOE6sTFjcw2FyD4Ogee7xky8BR/ohJ9omR+1Jen2lA3EA7sfAko3cfo
         dmPwvEv73VnsU3vZxSnp7KLnjgoIoo6I1dsa0sC71tsSeMmKXPuMK8YCFuZ9+W+rw1+x
         pNJxuICKh5uIwXqEJpXODgPpLTVbi7OCLaveE18Rw4mOx5mhogTcWi1z5zM81OBoqX4r
         6ITw==
X-Gm-Message-State: AOJu0YyM+OZYDnSqv+FKg1hVHVshwbYyKAyqq8Di0/KASLwGt9/GW9io
	NdlFm1qTs7CGnNizo6lZOHwd3ag5kegl1naB77yTQE5Z0bfrwqsowaNwo7bPAV2gz6qtYJG7iT7
	J
X-Google-Smtp-Source: AGHT+IFSm1XgjU4ltzkV4coChbf017gLdis2ZE1zb2ZVx12mG5gq9WFToPXwHmmgQqFOfP89396O0w==
X-Received: by 2002:ac2:5b4f:0:b0:51f:3e0c:ace3 with SMTP id i15-20020ac25b4f000000b0051f3e0cace3mr587276lfp.16.1714640373922;
        Thu, 02 May 2024 01:59:33 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id i25-20020a056512007900b00516c247fc40sm101701lfo.222.2024.05.02.01.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 01:59:33 -0700 (PDT)
Date: Thu, 2 May 2024 11:45:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Oreoluwa Babatunde <quic_obabatun@quicinc.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 9793/10134] drivers/of/of_reserved_mem.c:463
 fdt_init_reserved_mem() error: uninitialized symbol 'nomap'.
Message-ID: <34976102-567d-4651-bf14-41b85af8735e@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f68868ba718e30594165879cc3020607165b0761
commit: 2acef04ad57cab44b33001542791fc93f81cadf1 [9793/10134] of: reserved_mem: Remove the use of phandle from the reserved_mem APIs
config: i386-randconfig-141-20240501 (https://download.01.org/0day-ci/archive/20240502/202405020127.3ncxx3EI-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202405020127.3ncxx3EI-lkp@intel.com/

smatch warnings:
drivers/of/of_reserved_mem.c:463 fdt_init_reserved_mem() error: uninitialized symbol 'nomap'.

vim +/nomap +463 drivers/of/of_reserved_mem.c

3f0c8206644836 Marek Szyprowski   2014-02-28  430  void __init fdt_init_reserved_mem(void)
3f0c8206644836 Marek Szyprowski   2014-02-28  431  {
3f0c8206644836 Marek Szyprowski   2014-02-28  432  	int i;
ae1add247bf8c2 Mitchel Humpherys  2015-09-15  433  
ae1add247bf8c2 Mitchel Humpherys  2015-09-15  434  	/* check for overlapping reserved regions */
ae1add247bf8c2 Mitchel Humpherys  2015-09-15  435  	__rmem_check_for_overlap();
ae1add247bf8c2 Mitchel Humpherys  2015-09-15  436  
3f0c8206644836 Marek Szyprowski   2014-02-28  437  	for (i = 0; i < reserved_mem_count; i++) {
3f0c8206644836 Marek Szyprowski   2014-02-28  438  		struct reserved_mem *rmem = &reserved_mem[i];
3f0c8206644836 Marek Szyprowski   2014-02-28  439  		unsigned long node = rmem->fdt_node;
3f0c8206644836 Marek Szyprowski   2014-02-28  440  		int err = 0;
6f1188b4ac7577 Yue Hu             2020-07-30  441  		bool nomap;
3f0c8206644836 Marek Szyprowski   2014-02-28  442  
3f0c8206644836 Marek Szyprowski   2014-02-28  443  		if (rmem->size == 0)
3f0c8206644836 Marek Szyprowski   2014-02-28  444  			err = __reserved_mem_alloc_size(node, rmem->name,
3f0c8206644836 Marek Szyprowski   2014-02-28  445  						 &rmem->base, &rmem->size);
d0b8ed47e83a22 pierre Kuo         2019-02-19  446  		if (err == 0) {
d0b8ed47e83a22 pierre Kuo         2019-02-19  447  			err = __reserved_mem_init_node(rmem);
d0b8ed47e83a22 pierre Kuo         2019-02-19  448  			if (err != 0 && err != -ENOENT) {
d0b8ed47e83a22 pierre Kuo         2019-02-19  449  				pr_info("node %s compatible matching fail\n",
d0b8ed47e83a22 pierre Kuo         2019-02-19  450  					rmem->name);
2acef04ad57cab Oreoluwa Babatunde 2024-04-22  451  
2acef04ad57cab Oreoluwa Babatunde 2024-04-22  452  				nomap = of_get_flat_dt_prop(node, "no-map", NULL) != NULL;
d0b8ed47e83a22 pierre Kuo         2019-02-19  453  				if (nomap)
7b25995f5319ad Dong Aisheng       2021-06-11  454  					memblock_clear_nomap(rmem->base, rmem->size);
3c6867a12a224d Dong Aisheng       2021-06-11  455  				else
3ecc68349bbab6 Mike Rapoport      2021-11-05  456  					memblock_phys_free(rmem->base,
3ecc68349bbab6 Mike Rapoport      2021-11-05  457  							   rmem->size);
aeb9267eb6b1df Martin Liu         2023-02-10  458  			} else {
aeb9267eb6b1df Martin Liu         2023-02-10  459  				phys_addr_t end = rmem->base + rmem->size - 1;
aeb9267eb6b1df Martin Liu         2023-02-10  460  				bool reusable =
aeb9267eb6b1df Martin Liu         2023-02-10  461  					(of_get_flat_dt_prop(node, "reusable", NULL)) != NULL;
aeb9267eb6b1df Martin Liu         2023-02-10  462  
6ee7afbabcee4d Geert Uytterhoeven 2023-02-16 @463  				pr_info("%pa..%pa (%lu KiB) %s %s %s\n",
aeb9267eb6b1df Martin Liu         2023-02-10  464  					&rmem->base, &end, (unsigned long)(rmem->size / SZ_1K),
aeb9267eb6b1df Martin Liu         2023-02-10  465  					nomap ? "nomap" : "map",
                                                                                        ^^^^^    ^^^^^
This is nomap from the previous iteration through the loop.  How is
it useful?

aeb9267eb6b1df Martin Liu         2023-02-10  466  					reusable ? "reusable" : "non-reusable",
aeb9267eb6b1df Martin Liu         2023-02-10  467  					rmem->name ? rmem->name : "unknown");
d0b8ed47e83a22 pierre Kuo         2019-02-19  468  			}
d0b8ed47e83a22 pierre Kuo         2019-02-19  469  		}
3f0c8206644836 Marek Szyprowski   2014-02-28  470  	}
3f0c8206644836 Marek Szyprowski   2014-02-28  471  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

