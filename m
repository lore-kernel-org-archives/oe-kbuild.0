Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4231C1E49E;
	Mon,  1 Jul 2024 19:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719861417; cv=none; b=I+E07Fi0VZx0WbSss1uoTaYguonmTObfaEreAzQNdjNW5+1tpnDIx4pHCqUXgsTfALlUkgDt52Ec1TcklnHc2PtBlXaAN1q+qyqRipDw3K1TJzCUUNpEjAWKjafojN9o/o1oe1s2lAtaMRqplpPjKDEc9l7NlDpjQPG5NgLByfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719861417; c=relaxed/simple;
	bh=Xd1hInzB0lMCYJ3OWnSYV1qdd91+CfcbRbLze9jyYwk=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cGdKyJDoO+wtw7OpR1R3IPr03yhDkpugFA4SZhMsjETydrr2QQMPESWqIKXmJv/V7xUG+VLh2ZFOBBJoxKZc6aym9mdbyuerB8Jj3a7q7nsx6RyOfZNGFHnpTxEwHBZmTs0m/VAK9uvsi/FfRDAzSrnUlHzES8EbPdLKDbZDwyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AVGkNKyP; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AVGkNKyP"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1f9b523a15cso22626485ad.0;
        Mon, 01 Jul 2024 12:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719861415; x=1720466215; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UYgAL8UtwtVMQRblko/vWUwJ2u8kL0IKti8mph9r91c=;
        b=AVGkNKyPq64LzV1aoQgNplIyIa556ADJsEPO5ANkdlshjJB6lzn5CucgvzBjfQYGzS
         uuikAQemn6JEmryF/fNOZmCYWKx+SEb3tSgCWWbcM7l0NQwtsrhZZEpiS/2hO+3Hp/hZ
         MeJ86lxBSoHJTqp3IJwJoQZ+/KUd8AEOSl0gk6epBuWNhbo32T+DIEC058Mx4396tuwq
         r/4Fq3fIHBCBDGbNBZnYDvjjUc5V0wkv3hv525FwyegIpVOmwKIjeVoCk9vlJJ70ylVI
         XtbW1Na4yv86UOK/Nb0Qwdpzzlhl23OfhG/Lz4zpohPuKQ5vkk74/B2bGPfNEoOVCUAx
         7uDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719861415; x=1720466215;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UYgAL8UtwtVMQRblko/vWUwJ2u8kL0IKti8mph9r91c=;
        b=Vic+kMw5dfnlsm+Asv1sWeE70xh9EB77bbD7FlbTJT/QwxYpJmMUxVWD0scwxFwb5j
         MtxPDZQ5tSJ4zl1rvgJj0lt6uobGmc2JacMwkico+Y+VxKtsFD9eAHDq/8tfSnZ7eIi0
         NQ+PA35bKpXwgD/4xP2oi80K7VvCq8YfH4MOZU1MIaaGhbg/5N8SpPW4JGVXLAdTYjji
         Rn9gu8qCz5QL3SG3KJQa1vu38ljvVIoXuZS3l5xd7N7ZJfE7TgKWJPu58j6XqzHqM7ch
         xbNNiEHDBjyp5Cd0N4Uuv9dJy2aJ5Aw4mvQI5Ig6TRBT67cvVhpepDhs491mS2CKAFgb
         3OEA==
X-Forwarded-Encrypted: i=1; AJvYcCW8nsgGXMd+ugk7WJSwcRX3LnZGBtnjIV9l6VKuEMnUSqNUDfYoyR2D5N06zWH4HK6BPlTFSyQwM/+PbHYlNI8vxqXQYadk1nEBLjn7Ng==
X-Gm-Message-State: AOJu0YwEMi/4dby6SlBmPe5zgL/OBxsJx0zxuha7gpFsUn11mZB1W7xC
	kEeVaO2N1+dPWg+RL+dHPXVHYDn0Fg6yD6HqPO6zUbmzVD7k4ptr
X-Google-Smtp-Source: AGHT+IFkTuG8/9oR/a/Iu5Ue22u3smgRX0lBB8ReYw4O5P9NRn1WwM7wviml+m7H11mOyuSoZTYBQA==
X-Received: by 2002:a17:903:41cb:b0:1f9:dab3:b048 with SMTP id d9443c01a7336-1fadb4d189amr103254495ad.32.1719861415304;
        Mon, 01 Jul 2024 12:16:55 -0700 (PDT)
Received: from DESKTOP-DUKSS9G. (c-73-170-51-167.hsd1.ca.comcast.net. [73.170.51.167])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac1535cfbsm68829845ad.173.2024.07.01.12.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 12:16:54 -0700 (PDT)
Message-ID: <668300a6.170a0220.cdc45.7372@mx.google.com>
X-Google-Original-Message-ID: <ZoMApE_v5VEnYtux@DESKTOP-DUKSS9G.>
Date: Mon, 1 Jul 2024 12:16:52 -0700
From: Vishal Moola <vishal.moola@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Aristeu Rozanski <aris@redhat.com>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [linux-next:master 7944/8232] mm/hugetlb.c:2677
 gather_surplus_pages() error: uninitialized symbol 'folio'.
References: <6d5e5b32-246e-4c56-84d7-f7c4f0a6212f@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d5e5b32-246e-4c56-84d7-f7c4f0a6212f@suswa.mountain>

On Mon, Jul 01, 2024 at 05:49:34PM +0200, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   df9574a57d02b265322e77fb8628d4d33641dda9
> commit: 1cb6271d927cdb448a6a2794291c5405f1effa76 [7944/8232] hugetlb: force allocating surplus hugepages on mempolicy allowed nodes
> config: i386-randconfig-141-20240627 (https://download.01.org/0day-ci/archive/20240627/202406270727.F4yNrBsh-lkp@intel.com/config)
> compiler: gcc-9 (Ubuntu 9.5.0-4ubuntu2) 9.5.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202406270727.F4yNrBsh-lkp@intel.com/
> 
> smatch warnings:
> mm/hugetlb.c:2677 gather_surplus_pages() error: uninitialized symbol 'folio'.
> 
> vim +/folio +2677 mm/hugetlb.c
> 
> 0a4f3d1bb91cac Liu Xiang               2020-12-14  2644  static int gather_surplus_pages(struct hstate *h, long delta)
> 1b2a1e7bb9ce99 Jules Irenge            2020-04-06  2645  	__must_hold(&hugetlb_lock)
> e4e574b767ba63 Adam Litke              2007-10-16  2646  {
> 3466534131b28e Miaohe Lin              2022-09-01  2647  	LIST_HEAD(surplus_list);
> 454a00c40a21c5 Matthew Wilcox (Oracle  2023-08-16  2648) 	struct folio *folio, *tmp;
> 0a4f3d1bb91cac Liu Xiang               2020-12-14  2649  	int ret;
> 0a4f3d1bb91cac Liu Xiang               2020-12-14  2650  	long i;
> 0a4f3d1bb91cac Liu Xiang               2020-12-14  2651  	long needed, allocated;
> 28073b02bfaaed Hillf Danton            2012-03-21  2652  	bool alloc_ok = true;
> 1cb6271d927cdb Aristeu Rozanski        2024-06-21  2653  	int node;
> 1cb6271d927cdb Aristeu Rozanski        2024-06-21  2654  	nodemask_t *mbind_nodemask = policy_mbind_nodemask(htlb_alloc_mask(h));
> e4e574b767ba63 Adam Litke              2007-10-16  2655  
> 9487ca60fd7fa2 Mike Kravetz            2021-05-04  2656  	lockdep_assert_held(&hugetlb_lock);
> a5516438959d90 Andi Kleen              2008-07-23  2657  	needed = (h->resv_huge_pages + delta) - h->free_huge_pages;
> ac09b3a15154af Adam Litke              2008-03-04  2658  	if (needed <= 0) {
> a5516438959d90 Andi Kleen              2008-07-23  2659  		h->resv_huge_pages += delta;
> e4e574b767ba63 Adam Litke              2007-10-16  2660  		return 0;
> ac09b3a15154af Adam Litke              2008-03-04  2661  	}
> e4e574b767ba63 Adam Litke              2007-10-16  2662  
> e4e574b767ba63 Adam Litke              2007-10-16  2663  	allocated = 0;
> e4e574b767ba63 Adam Litke              2007-10-16  2664  
> e4e574b767ba63 Adam Litke              2007-10-16  2665  	ret = -ENOMEM;
> e4e574b767ba63 Adam Litke              2007-10-16  2666  retry:
> db71ef79b59bb2 Mike Kravetz            2021-05-04  2667  	spin_unlock_irq(&hugetlb_lock);
> e4e574b767ba63 Adam Litke              2007-10-16  2668  	for (i = 0; i < needed; i++) {
> 1cb6271d927cdb Aristeu Rozanski        2024-06-21  2669  		for_each_node_mask(node, cpuset_current_mems_allowed) {

Smatch might be concerned about us skipping over this
for_each_node_mask()? It appears to be possible if we have 1 non-empty
Numa node. 

> 1cb6271d927cdb Aristeu Rozanski        2024-06-21  2670  			if (!mbind_nodemask || node_isset(node, *mbind_nodemask)) {

Alternatively it might be worried about us skipping the folio assignment
during each iteration due to the if statement here.

> 3a740e8bb56ef7 Sidhartha Kumar         2023-01-13  2671  				folio = alloc_surplus_hugetlb_folio(h, htlb_alloc_mask(h),
> 1cb6271d927cdb Aristeu Rozanski        2024-06-21  2672  						node, NULL);
> 1cb6271d927cdb Aristeu Rozanski        2024-06-21  2673  				if (folio)
> 1cb6271d927cdb Aristeu Rozanski        2024-06-21  2674  					break;
> 1cb6271d927cdb Aristeu Rozanski        2024-06-21  2675  			}
> 
> folio is uninitialized if everything is set, I guess.  Not sure if that
> is possible or not.

I'm not familiar enough with NUMA to know whether its possible or not,
but it shouldn't hurt much to initialize the folio.

> 1cb6271d927cdb Aristeu Rozanski        2024-06-21  2676  		}
> 3a740e8bb56ef7 Sidhartha Kumar         2023-01-13 @2677  		if (!folio) {
> 28073b02bfaaed Hillf Danton            2012-03-21  2678  			alloc_ok = false;
> 28073b02bfaaed Hillf Danton            2012-03-21  2679  			break;
> 28073b02bfaaed Hillf Danton            2012-03-21  2680  		}
> 3a740e8bb56ef7 Sidhartha Kumar         2023-01-13  2681  		list_add(&folio->lru, &surplus_list);

If getting here with an uninitialized folio is possible, this could be
bad.

> 69ed779a1454d9 David Rientjes          2017-07-10  2682  		cond_resched();
> e4e574b767ba63 Adam Litke              2007-10-16  2683  	}
> 28073b02bfaaed Hillf Danton            2012-03-21  2684  	allocated += i;
> e4e574b767ba63 Adam Litke              2007-10-16  2685  
> e4e574b767ba63 Adam Litke              2007-10-16  2686  	/*
> e4e574b767ba63 Adam Litke              2007-10-16  2687  	 * After retaking hugetlb_lock, we need to recalculate 'needed'
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
