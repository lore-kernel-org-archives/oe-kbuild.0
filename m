Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106F716F8E3
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Jul 2024 19:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719863266; cv=none; b=WXaOe0zqKIVV/0LFot0VTb/DVrXjxCk+Tpyebp4E8klB1LxSJmNrD9oJhoTXg4FSKcHlJYWb5d0PtYc4Pd7c1boouY14z3PkfP3veMj8c/LBjM6YElbqyFSczOsQSas+fX1SArfplitzf+ZmwgHweqN+ZguQ+sOIvNsiXX4bKKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719863266; c=relaxed/simple;
	bh=RJ3sc55DiuUYwd3v7wYURegyh36CBPRbjMGPL9VrHT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oYkYxR/XygndbOdrjyJ1R//nc2gqRyoWPEc4F69kuaMNcpJhl3oWXqG2K28TneRWCk7UTS7IL42gMsLbW2LD1Sx2+bOtAR5gyUOdzkCJMfvIKHv9SsYfyz/1RZrzOstywVf4O+F/6GSrMFfPz/uGqfXDdPuxaxtKMUD8q3TipWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d9OiNa+n; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d9OiNa+n"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5c40f0aed5bso1343462eaf.2
        for <oe-kbuild@lists.linux.dev>; Mon, 01 Jul 2024 12:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719863264; x=1720468064; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rhNMYB1zr8j/8x5hEiifpg+dWIlJrOqqqN/Lc/vPbUc=;
        b=d9OiNa+nc8TinRAoPZGgUA7zZRoqe4pi+uOsvcKfPD/7CAnNO4aj8a7oocCABRky5y
         tE1rm3olXwRPPUPQwBZ0kPtk/yD0VuRoju96aMQEzE7txPdeQzYhkEb9MS63L+fYeOK7
         xumlV692K18pdNcPXBL1Ogy4mfVN2Fg9RbgSleG1V5CK8enIaEDhCZZqyomIfOsD1KPa
         IbGIuSaBrUtarVta+vyEZ2SGfkAEspdbOrOE2OvSVZCiVgzqYwjcN+Hex/yp0ChswGt1
         SsiCIru2Dec9Doa4Mg0tYjGmmjelDtRxeqiwZne5JazBhO1IcaYIsKbiR2lQe8lObsiv
         2bog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719863264; x=1720468064;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rhNMYB1zr8j/8x5hEiifpg+dWIlJrOqqqN/Lc/vPbUc=;
        b=q/SqigfM7Y8F82YsTdZ8XlBWp77yv9A4RqQpvml5HaBphJOSOYhGjUo6EJ3pRqQ6Mq
         /Te/mzk1Ta+7ShoN+wYXkLAI0t9MvRhYe0mfkWi+y62MsDLqTkIWAdPdtShq7LwX/eWa
         s5H+IUw00fnMq/aJLy9ibSeCAyvJ0vvPHDu2swHu/L8sRLUKjxx1ljtzw7JEIIlFlWmn
         n+vAY+atghEFKC4x/+fnA6K0IvV+qAIbAbDAGlITfZkLUExrTiErh5j5oyk4FGOw1ZYz
         DbZBxstKOhmNBRPU2dgwJKtgvShZuETHzipz9abm9DkrFpLYevfSOtSkVtdinZjBIa7L
         DFoA==
X-Gm-Message-State: AOJu0Yy8zR+33LWYJSGjx+9sjx0XaBtzYVrpdax/h65JWKPzjDE835bg
	lk5bcl+XIdLCmI0aNlHO/VfFyAcaNFwukEHJvNIEmvq7jyqHN6tia9Jffncl62o=
X-Google-Smtp-Source: AGHT+IGO7kpLe7/HTqtMj/Gvt0KY7xnl2MLDe5NUbJ/uY1ig3sf97Etjvvc0/nZYLeVQRxcz8FlCPA==
X-Received: by 2002:a4a:5892:0:b0:5c3:c6e7:6daa with SMTP id 006d021491bc7-5c438e0f1b3mr5949530eaf.1.1719863264067;
        Mon, 01 Jul 2024 12:47:44 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:e8c6:2364:637f:c70e])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5c42fa82f86sm781446eaf.31.2024.07.01.12.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 12:47:43 -0700 (PDT)
Date: Mon, 1 Jul 2024 21:47:41 +0200
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Vishal Moola <vishal.moola@gmail.com>
Cc: oe-kbuild@lists.linux.dev, Aristeu Rozanski <aris@redhat.com>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [linux-next:master 7944/8232] mm/hugetlb.c:2677
 gather_surplus_pages() error: uninitialized symbol 'folio'.
Message-ID: <16438a9b-ef57-459d-a79e-8bdd7c80cbc1@suswa.mountain>
References: <6d5e5b32-246e-4c56-84d7-f7c4f0a6212f@suswa.mountain>
 <668300a6.170a0220.cdc45.7372@mx.google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <668300a6.170a0220.cdc45.7372@mx.google.com>

On Mon, Jul 01, 2024 at 12:16:52PM -0700, Vishal Moola wrote:
> On Mon, Jul 01, 2024 at 05:49:34PM +0200, Dan Carpenter wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   df9574a57d02b265322e77fb8628d4d33641dda9
> > commit: 1cb6271d927cdb448a6a2794291c5405f1effa76 [7944/8232] hugetlb: force allocating surplus hugepages on mempolicy allowed nodes
> > config: i386-randconfig-141-20240627 (https://download.01.org/0day-ci/archive/20240627/202406270727.F4yNrBsh-lkp@intel.com/config)
> > compiler: gcc-9 (Ubuntu 9.5.0-4ubuntu2) 9.5.0
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > | Closes: https://lore.kernel.org/r/202406270727.F4yNrBsh-lkp@intel.com/
> > 
> > smatch warnings:
> > mm/hugetlb.c:2677 gather_surplus_pages() error: uninitialized symbol 'folio'.
> > 
> > vim +/folio +2677 mm/hugetlb.c
> > 
> > 0a4f3d1bb91cac Liu Xiang               2020-12-14  2644  static int gather_surplus_pages(struct hstate *h, long delta)
> > 1b2a1e7bb9ce99 Jules Irenge            2020-04-06  2645  	__must_hold(&hugetlb_lock)
> > e4e574b767ba63 Adam Litke              2007-10-16  2646  {
> > 3466534131b28e Miaohe Lin              2022-09-01  2647  	LIST_HEAD(surplus_list);
> > 454a00c40a21c5 Matthew Wilcox (Oracle  2023-08-16  2648) 	struct folio *folio, *tmp;
> > 0a4f3d1bb91cac Liu Xiang               2020-12-14  2649  	int ret;
> > 0a4f3d1bb91cac Liu Xiang               2020-12-14  2650  	long i;
> > 0a4f3d1bb91cac Liu Xiang               2020-12-14  2651  	long needed, allocated;
> > 28073b02bfaaed Hillf Danton            2012-03-21  2652  	bool alloc_ok = true;
> > 1cb6271d927cdb Aristeu Rozanski        2024-06-21  2653  	int node;
> > 1cb6271d927cdb Aristeu Rozanski        2024-06-21  2654  	nodemask_t *mbind_nodemask = policy_mbind_nodemask(htlb_alloc_mask(h));
> > e4e574b767ba63 Adam Litke              2007-10-16  2655  
> > 9487ca60fd7fa2 Mike Kravetz            2021-05-04  2656  	lockdep_assert_held(&hugetlb_lock);
> > a5516438959d90 Andi Kleen              2008-07-23  2657  	needed = (h->resv_huge_pages + delta) - h->free_huge_pages;
> > ac09b3a15154af Adam Litke              2008-03-04  2658  	if (needed <= 0) {
> > a5516438959d90 Andi Kleen              2008-07-23  2659  		h->resv_huge_pages += delta;
> > e4e574b767ba63 Adam Litke              2007-10-16  2660  		return 0;
> > ac09b3a15154af Adam Litke              2008-03-04  2661  	}
> > e4e574b767ba63 Adam Litke              2007-10-16  2662  
> > e4e574b767ba63 Adam Litke              2007-10-16  2663  	allocated = 0;
> > e4e574b767ba63 Adam Litke              2007-10-16  2664  
> > e4e574b767ba63 Adam Litke              2007-10-16  2665  	ret = -ENOMEM;
> > e4e574b767ba63 Adam Litke              2007-10-16  2666  retry:
> > db71ef79b59bb2 Mike Kravetz            2021-05-04  2667  	spin_unlock_irq(&hugetlb_lock);
> > e4e574b767ba63 Adam Litke              2007-10-16  2668  	for (i = 0; i < needed; i++) {
> > 1cb6271d927cdb Aristeu Rozanski        2024-06-21  2669  		for_each_node_mask(node, cpuset_current_mems_allowed) {
> 
> Smatch might be concerned about us skipping over this
> for_each_node_mask()? It appears to be possible if we have 1 non-empty
> Numa node. 
> 

Oh, yes, good point.  That too.  Thanks for looking at this.

regards,
dan carpenter

