Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D265A222594
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Jul 2025 19:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752521038; cv=none; b=DZO2FLy8oZT4Xyv+uyoHu5R7ICaGcTlCgw/iDKKAR4XA77db5bqSA0KWqTDBwc2L0IXurnxtEL0Hjtm9UWU4CwrU70kmm6Yd0VhmtdtkbfxBqyxX7TqHfUK1FQ3kV9gNRor0+3FHJPRlWnAFXiqtjpKfyvHxL/HFs4zFMQ83EJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752521038; c=relaxed/simple;
	bh=Bi76y6YpBRxjRJ2NIBrDs4jtU9BeQjlZkSb578NS3E4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=czpCUYxfTgUrIx8SH/VieGjTm3CBIdiMtDQmAuc5ohwC6Bk4yDY8vW7YCAsgBd1kYkVkYtQ9JNgYzIur+xyqghl0gcWIW4Weo9DeSEeDbAkTEuIgizZs0nE4l8vbFnfPhLuMNxqVe0gbgdGpHBhB8zogZzciaY1PRxye/NZDCyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r9xfsq9u; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r9xfsq9u"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2ebb468cbb4so4139180fac.2
        for <oe-kbuild@lists.linux.dev>; Mon, 14 Jul 2025 12:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752521035; x=1753125835; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kVAbad0bqrRxFZKZsjO45060tZ0nsAfjW1VyioFz3hQ=;
        b=r9xfsq9uyptn8FnAhROHscGuZ+LNqA9TFRftbcGqAtLD0lPlzmpmZxnZf0J7gmlbV+
         4A1ePJx70zRLPS87XMK8CNey1Tm+JSMnP5yDag1PX/AN2b/yEJTK6qHBOFvUIbfI92Tn
         a3GTtJfdcuk1C+W2GUJN3wvHUH92JS8VbrFPdkSLACejVm2POUvPbG32bTDcZQUeA293
         Z/W8uCSr0wXwv+1qzeXEtLdp9XBY1tlqlDTz7OkUwj9mWQGu7vwnMypZyAKuS0Lg3rgl
         6mAZkOI0RikFolzqxvR5Ia47G8XE5boJZYjnpD6Vuv8YWgaAyJ3T1379xw3ooJcUoFhW
         IBiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752521035; x=1753125835;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kVAbad0bqrRxFZKZsjO45060tZ0nsAfjW1VyioFz3hQ=;
        b=EpP/UFEfo1wgZa2arYdqSaTtlZ7snK3vOWJ2n574yOm8nNsLr6TibfFhJPhFjlw//g
         29l43Dc5C6fhHXS7fgw4H2ZPwEJafJr6MI8hUs+gWqz/iZmZKTdj3cmmFJ+w4MoxC/F7
         YcW7HM0766mww+jFfXDnKA1YwDU1JnV8ziKGC9jJOrATNGkKwErIVYlyZD1rIUcOyCFf
         ermnAi1dFPKxY5XBw+OQS9sDsjWhK9i1JSwYG1aHVhUYyxYX+oliHwJuB0jR/9Sw0HJt
         nUBr9A6GWpRDwT66OmXSQexeldGfHtZVOjHGZTfQdFTavfdFlQVjNJSfKi9p5kUAVxyN
         Njjw==
X-Gm-Message-State: AOJu0YybvS/I4wmIbP5xFGO1SFQGGHAZHTF/I7oqnxGwvUSvRXw/mM6N
	VPeD2Z891mdfu99d/WYcnP4VKqrKFinYcFSH2HQSPnr7gdchfQkAv2LXOOOaGwKuGpdPkugZ7D7
	Ou24H
X-Gm-Gg: ASbGnctD7tB9voHmogaYO+1cpyr431IpArGq//RYBBJl5NQWnnVBOh65MBYRXd9ODhU
	NZwluQxb9Jj31t378Vh0HwV+IahsUOAgWQjXUuVjA2TgRjpxpfuyG9nLZfjcUTN+9mo5Nsg3e8W
	eOsg9zQzX40KIfDPCH9K+wLeF1+2FOSHOTjFgSVgIpJ7lTKVpuq+/P2jQCndMwZsgRhdXUnkEfh
	i9LYireWftqj7OrFbri0WlWGJSbIicp1jJOA73uwQm9wGFtUc7R5R7MCeZUI2DQtNl/aIQqqpih
	D09pOPzEAB6s6vInZ2DzFWauoY9Hc5kEc52F+6Q9Bp8XbTQ4hFj0ExmvwKV6/3RoWA8rY5zQx54
	GN/5t/oAD6g5mglN2ZjIKqdoFtTCqpg==
X-Google-Smtp-Source: AGHT+IGMatdwAQ/bJnDCAryBnd8ohHFGnE9tgHnrBwOBxnhsIjf1MB7IYVqg9olruTThYbySZOCU0g==
X-Received: by 2002:a05:6870:ce41:b0:2ef:2af4:dfcb with SMTP id 586e51a60fabf-2ff271545ddmr10167556fac.28.1752521035426;
        Mon, 14 Jul 2025 12:23:55 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:6bb2:d90f:e5da:befc])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ff11235201sm2061442fac.12.2025.07.14.12.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 12:23:54 -0700 (PDT)
Date: Mon, 14 Jul 2025 22:23:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 6/6] kernel/fork.c:2318
 copy_dmabuf_info() warn: sleeping in atomic context
Message-ID: <28caf853-4120-4c52-a98d-6a1454a8edbc@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   a9597c7b32ec09bdaf13909f77b203e77b4fbb69
commit: f44d593749dcbd4e1013121fa615ecca412d1cb3 [6/6] ANDROID: Track per-process dmabuf RSS
config: i386-randconfig-141-20250709 (https://download.01.org/0day-ci/archive/20250710/202507100414.f3Yyuj82-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202507100414.f3Yyuj82-lkp@intel.com/

smatch warnings:
kernel/fork.c:2318 copy_dmabuf_info() warn: sleeping in atomic context

vim +2318 kernel/fork.c

f44d593749dcbd T.J. Mercier               2025-06-25  2292  static int copy_dmabuf_info(u64 clone_flags, struct task_struct *p)
f44d593749dcbd T.J. Mercier               2025-06-25  2293  {
f44d593749dcbd T.J. Mercier               2025-06-25  2294  	struct task_dma_buf_record *rec, *copy;
f44d593749dcbd T.J. Mercier               2025-06-25  2295  
f44d593749dcbd T.J. Mercier               2025-06-25  2296  	if (current->dmabuf_info && (clone_flags & (CLONE_VM | CLONE_FILES))
f44d593749dcbd T.J. Mercier               2025-06-25  2297  						== (CLONE_VM | CLONE_FILES)) {
f44d593749dcbd T.J. Mercier               2025-06-25  2298  		/*
f44d593749dcbd T.J. Mercier               2025-06-25  2299  		 * Both MM and FD references to dmabufs are shared with the parent, so
f44d593749dcbd T.J. Mercier               2025-06-25  2300  		 * we can share a RSS counter with the parent.
f44d593749dcbd T.J. Mercier               2025-06-25  2301  		 */
f44d593749dcbd T.J. Mercier               2025-06-25  2302  		refcount_inc(&current->dmabuf_info->refcnt);
f44d593749dcbd T.J. Mercier               2025-06-25  2303  		p->dmabuf_info = current->dmabuf_info;
f44d593749dcbd T.J. Mercier               2025-06-25  2304  		return 0;
f44d593749dcbd T.J. Mercier               2025-06-25  2305  	}
f44d593749dcbd T.J. Mercier               2025-06-25  2306  
f44d593749dcbd T.J. Mercier               2025-06-25  2307  	p->dmabuf_info = kmalloc(sizeof(*p->dmabuf_info), GFP_KERNEL);
f44d593749dcbd T.J. Mercier               2025-06-25  2308  	if (!p->dmabuf_info)
f44d593749dcbd T.J. Mercier               2025-06-25  2309  		return -ENOMEM;
f44d593749dcbd T.J. Mercier               2025-06-25  2310  
f44d593749dcbd T.J. Mercier               2025-06-25  2311  	refcount_set(&p->dmabuf_info->refcnt, 1);
f44d593749dcbd T.J. Mercier               2025-06-25  2312  	spin_lock_init(&p->dmabuf_info->lock);
f44d593749dcbd T.J. Mercier               2025-06-25  2313  	INIT_LIST_HEAD(&p->dmabuf_info->dmabufs);
f44d593749dcbd T.J. Mercier               2025-06-25  2314  	if (current->dmabuf_info) {
f44d593749dcbd T.J. Mercier               2025-06-25  2315  		spin_lock(&current->dmabuf_info->lock);
                                                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
We're holding a spin lock.

f44d593749dcbd T.J. Mercier               2025-06-25  2316  		p->dmabuf_info->rss = current->dmabuf_info->rss;
f44d593749dcbd T.J. Mercier               2025-06-25  2317  		list_for_each_entry(rec, &current->dmabuf_info->dmabufs, node) {
f44d593749dcbd T.J. Mercier               2025-06-25 @2318  			copy = kmalloc(sizeof(*copy), GFP_KERNEL);
                                                                                                              ^^^^^^^^^^
So we aren't allowed to sleep.

f44d593749dcbd T.J. Mercier               2025-06-25  2319  			if (!copy) {
f44d593749dcbd T.J. Mercier               2025-06-25  2320  				spin_unlock(&current->dmabuf_info->lock);
f44d593749dcbd T.J. Mercier               2025-06-25  2321  				goto err_list_copy;
f44d593749dcbd T.J. Mercier               2025-06-25  2322  			}
f44d593749dcbd T.J. Mercier               2025-06-25  2323  
f44d593749dcbd T.J. Mercier               2025-06-25  2324  			copy->dmabuf = rec->dmabuf;
f44d593749dcbd T.J. Mercier               2025-06-25  2325  			copy->refcnt = rec->refcnt;
f44d593749dcbd T.J. Mercier               2025-06-25  2326  			list_add(&copy->node, &p->dmabuf_info->dmabufs);
f44d593749dcbd T.J. Mercier               2025-06-25  2327  		}
f44d593749dcbd T.J. Mercier               2025-06-25  2328  		spin_unlock(&current->dmabuf_info->lock);
f44d593749dcbd T.J. Mercier               2025-06-25  2329  	} else {
f44d593749dcbd T.J. Mercier               2025-06-25  2330  		p->dmabuf_info->rss = 0;
f44d593749dcbd T.J. Mercier               2025-06-25  2331  	}
f44d593749dcbd T.J. Mercier               2025-06-25  2332  
f44d593749dcbd T.J. Mercier               2025-06-25  2333  	return 0;
f44d593749dcbd T.J. Mercier               2025-06-25  2334  
f44d593749dcbd T.J. Mercier               2025-06-25  2335  err_list_copy:
f44d593749dcbd T.J. Mercier               2025-06-25  2336  	list_for_each_entry_safe(rec, copy, &p->dmabuf_info->dmabufs, node) {
f44d593749dcbd T.J. Mercier               2025-06-25  2337  		list_del(&rec->node);
f44d593749dcbd T.J. Mercier               2025-06-25  2338  		kfree(rec);
f44d593749dcbd T.J. Mercier               2025-06-25  2339  	}
f44d593749dcbd T.J. Mercier               2025-06-25  2340  	kfree(p->dmabuf_info);
f44d593749dcbd T.J. Mercier               2025-06-25  2341  	return -ENOMEM;
f44d593749dcbd T.J. Mercier               2025-06-25  2342  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

