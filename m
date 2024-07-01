Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C027C16D32E
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Jul 2024 15:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719848980; cv=none; b=CzhEMJWwEgGFB6oudHBByGbW3BLKF7rcaW0LtIFWyYFQupzZwZpJv770msnBLYmxrTOAhZcoV1GLqfl7UlV7nfj7DKP6jISw3P3REvumO3RWmw5o5GBKQuYBHN9iby/9bxma8uJuHu0xSOAAAV0QXzlSu0ga7hnbGZKmzFowl+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719848980; c=relaxed/simple;
	bh=TK4vZaAnfVkxJ/ZoBJZqiWc0fTJ4Gh5qMFpt9eiHrgY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aR2OOmAbKSDEkhr3Kc82SkD3WbFnWyeWWhQtnf5P4wqq9AVkjbnzmqAoiJppIvaZrqI5Lzcf8d7FgwEvd9MpTw9dgSmxmtYAsdsy7pZhx+fcvh8NTcpAuF8Qd69NlCKJ0Bhi3dB9Tdm4k+2XOsmTd2JV6T5WIAEo9o1RRCaEpwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qr6vzVau; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qr6vzVau"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5c40f0aed5bso1220674eaf.2
        for <oe-kbuild@lists.linux.dev>; Mon, 01 Jul 2024 08:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719848977; x=1720453777; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9pbnnRVQrzMX0CGFAYif3fzXQZbulLBKnBWYz5JrFPE=;
        b=Qr6vzVauWGbK+6Tvnyw9kzcntAVXhNCHNAYVq5koiIsj5HjhXMzt+StEEAInOmCr1s
         087PKP6iu4D6GThaxk4qNxXHzK3RysSleR4YMiswHRAjMAx0zhcCBojMrNgNY3uePgSV
         h83nPzmwyusXmg1iwiN9qZ4bRUUURDbvsm4ZAfW/+e7K6/cc4oV1UQ6/aEMiQGZx5LRC
         TGcbPuqlq81pImHvViHgniR+0My1evxYSD1ZWqCWEAOgVx6YkixOtx+iwFTc172OxITf
         mKnhKMQlPEA3eNcu8wCie/yr9bv6KbjO2rEdhBAnrAc+vaWPzeKjLIXMk6DckDSuOsTB
         NnJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719848977; x=1720453777;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9pbnnRVQrzMX0CGFAYif3fzXQZbulLBKnBWYz5JrFPE=;
        b=Vkf0rUkQpndHTHyqOYNxZ8TrqODXIRO+WWVOflj9OWHtHlJrIJumnXzolE2chZ3oEr
         YmnsbZo8Ehp3VXLHR/rRdcl2/XCwK5eZpWizJUryzDeSixVTCQdTYmknsOsbAF6A4MxA
         wPz2qgA8eugWOsGSHDS2ZKZx/pfKQN9cnlaWcPLpAmXDSnMv7DOwADDwzaGkvjGVdwa4
         UftcoZGEZoiTOW5bBs1nGtEFkp2GwN1yydvyrYaFXYSmUQfPpdZ1dWkJBR4Q2mwRwXrN
         6n+yoA/gVoj2uqZ8LMYTlhZgULBKCnOYCU/fD9UXQvb0XHJtD8YkU6nrerbvTBUlNOBU
         MxdA==
X-Gm-Message-State: AOJu0Yzk6vSiE58M/8UCKMacnni3Yx+g5JnTbR7qMi9LrydUdIP8geiL
	hFx0881Dkf/mACdMJx57UtatT4gLn/hYEJOv1J4Fx1i+mBubscbhcXS6fshtZQD6erIClEkCvsK
	c
X-Google-Smtp-Source: AGHT+IGdWlJ27Yw/zyy5GfKOqPdKnbpeLSIQMH8kFN5if5+K8hSApWs45kzO5cdt9RpoIl3tm10ucA==
X-Received: by 2002:a4a:ad8e:0:b0:5c4:fd5:35fd with SMTP id 006d021491bc7-5c439249112mr4233273eaf.7.1719848977395;
        Mon, 01 Jul 2024 08:49:37 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:e8c6:2364:637f:c70e])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5c414939fdcsm1012772eaf.25.2024.07.01.08.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 08:49:35 -0700 (PDT)
Date: Mon, 1 Jul 2024 17:49:34 +0200
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Aristeu Rozanski <aris@redhat.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 7944/8232] mm/hugetlb.c:2677
 gather_surplus_pages() error: uninitialized symbol 'folio'.
Message-ID: <6d5e5b32-246e-4c56-84d7-f7c4f0a6212f@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   df9574a57d02b265322e77fb8628d4d33641dda9
commit: 1cb6271d927cdb448a6a2794291c5405f1effa76 [7944/8232] hugetlb: force allocating surplus hugepages on mempolicy allowed nodes
config: i386-randconfig-141-20240627 (https://download.01.org/0day-ci/archive/20240627/202406270727.F4yNrBsh-lkp@intel.com/config)
compiler: gcc-9 (Ubuntu 9.5.0-4ubuntu2) 9.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202406270727.F4yNrBsh-lkp@intel.com/

smatch warnings:
mm/hugetlb.c:2677 gather_surplus_pages() error: uninitialized symbol 'folio'.

vim +/folio +2677 mm/hugetlb.c

0a4f3d1bb91cac Liu Xiang               2020-12-14  2644  static int gather_surplus_pages(struct hstate *h, long delta)
1b2a1e7bb9ce99 Jules Irenge            2020-04-06  2645  	__must_hold(&hugetlb_lock)
e4e574b767ba63 Adam Litke              2007-10-16  2646  {
3466534131b28e Miaohe Lin              2022-09-01  2647  	LIST_HEAD(surplus_list);
454a00c40a21c5 Matthew Wilcox (Oracle  2023-08-16  2648) 	struct folio *folio, *tmp;
0a4f3d1bb91cac Liu Xiang               2020-12-14  2649  	int ret;
0a4f3d1bb91cac Liu Xiang               2020-12-14  2650  	long i;
0a4f3d1bb91cac Liu Xiang               2020-12-14  2651  	long needed, allocated;
28073b02bfaaed Hillf Danton            2012-03-21  2652  	bool alloc_ok = true;
1cb6271d927cdb Aristeu Rozanski        2024-06-21  2653  	int node;
1cb6271d927cdb Aristeu Rozanski        2024-06-21  2654  	nodemask_t *mbind_nodemask = policy_mbind_nodemask(htlb_alloc_mask(h));
e4e574b767ba63 Adam Litke              2007-10-16  2655  
9487ca60fd7fa2 Mike Kravetz            2021-05-04  2656  	lockdep_assert_held(&hugetlb_lock);
a5516438959d90 Andi Kleen              2008-07-23  2657  	needed = (h->resv_huge_pages + delta) - h->free_huge_pages;
ac09b3a15154af Adam Litke              2008-03-04  2658  	if (needed <= 0) {
a5516438959d90 Andi Kleen              2008-07-23  2659  		h->resv_huge_pages += delta;
e4e574b767ba63 Adam Litke              2007-10-16  2660  		return 0;
ac09b3a15154af Adam Litke              2008-03-04  2661  	}
e4e574b767ba63 Adam Litke              2007-10-16  2662  
e4e574b767ba63 Adam Litke              2007-10-16  2663  	allocated = 0;
e4e574b767ba63 Adam Litke              2007-10-16  2664  
e4e574b767ba63 Adam Litke              2007-10-16  2665  	ret = -ENOMEM;
e4e574b767ba63 Adam Litke              2007-10-16  2666  retry:
db71ef79b59bb2 Mike Kravetz            2021-05-04  2667  	spin_unlock_irq(&hugetlb_lock);
e4e574b767ba63 Adam Litke              2007-10-16  2668  	for (i = 0; i < needed; i++) {
1cb6271d927cdb Aristeu Rozanski        2024-06-21  2669  		for_each_node_mask(node, cpuset_current_mems_allowed) {
1cb6271d927cdb Aristeu Rozanski        2024-06-21  2670  			if (!mbind_nodemask || node_isset(node, *mbind_nodemask)) {
3a740e8bb56ef7 Sidhartha Kumar         2023-01-13  2671  				folio = alloc_surplus_hugetlb_folio(h, htlb_alloc_mask(h),
1cb6271d927cdb Aristeu Rozanski        2024-06-21  2672  						node, NULL);
1cb6271d927cdb Aristeu Rozanski        2024-06-21  2673  				if (folio)
1cb6271d927cdb Aristeu Rozanski        2024-06-21  2674  					break;
1cb6271d927cdb Aristeu Rozanski        2024-06-21  2675  			}

folio is uninitialized if everything is set, I guess.  Not sure if that
is possible or not.

1cb6271d927cdb Aristeu Rozanski        2024-06-21  2676  		}
3a740e8bb56ef7 Sidhartha Kumar         2023-01-13 @2677  		if (!folio) {
28073b02bfaaed Hillf Danton            2012-03-21  2678  			alloc_ok = false;
28073b02bfaaed Hillf Danton            2012-03-21  2679  			break;
28073b02bfaaed Hillf Danton            2012-03-21  2680  		}
3a740e8bb56ef7 Sidhartha Kumar         2023-01-13  2681  		list_add(&folio->lru, &surplus_list);
69ed779a1454d9 David Rientjes          2017-07-10  2682  		cond_resched();
e4e574b767ba63 Adam Litke              2007-10-16  2683  	}
28073b02bfaaed Hillf Danton            2012-03-21  2684  	allocated += i;
e4e574b767ba63 Adam Litke              2007-10-16  2685  
e4e574b767ba63 Adam Litke              2007-10-16  2686  	/*
e4e574b767ba63 Adam Litke              2007-10-16  2687  	 * After retaking hugetlb_lock, we need to recalculate 'needed'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

