Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56908169397
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Feb 2025 07:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739949720; cv=none; b=CFwQu5VDLb9ghqCDYx9PRNMzaJwcYG5473kzKg/bykv7YyFkOFdF4j0G0mETuaVXuUHC0eLXKJ/i+m0+AGYOZLFPhYrl53Z6lc8iw1qFC2+LvW2GHGfZwsEDZZuidjV0a3ehe1ngFZT6YbopUr6yw7eOEH8hDu5t/ihHlOrAe1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739949720; c=relaxed/simple;
	bh=SQ0DQqDA4bJ+HlaHXC27e986ZWIb1dqrj6EAgISpNwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kJjImgBZoWnP7ZM4Ku4wYUFLXMyAa9xvmdVSqX49HsFiMM7I+lfzRlq1wsRDZHOnh5v0xjAi1hGhrwBCKX+eGnQo0CLQJnOxkYmwqlrhXYHTCElQH9aG5wpV7sHjOY+yiTAJ7MUnt9YJmHwAYRLebNXva5TZLZWhPsceqAKVMdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BNUL6LUJ; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BNUL6LUJ"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-abbdc4a0b5aso35075766b.0
        for <oe-kbuild@lists.linux.dev>; Tue, 18 Feb 2025 23:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739949716; x=1740554516; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nL4ehjy0HunCJ0sJe+PFpLuc0MbSZl0UMHQbeYAyHRI=;
        b=BNUL6LUJcmNyT9Ahfw/PYcBQf5t+FFZGD4k0DmfhJm68tquHxezw4PYKx1BanD6y24
         qNYOOGll3DS3XSmUq4yoW1Hu2JKeF7U0u7F0EfLb6sWx5Mr8gbpDun9VA1DAhcfjmps0
         XG7eKyhDHMnZ3kz7lzUOz4aMT5Z8A98Sb/9LfUGUZPhe4Xkvv73g4ZgSwIKuKqbf7lQG
         SzdEHcFEYNrnwT/5FYNlx0hJ6RQzFzZOI5SO//QWsv18y0uzb8nFamyTgcbRfTIG8944
         ya08Morkr0CflDFJ7uyrnC0rAZTmDOmA6EBHLdsaasgCG+ZpfgTsv31J3hMJC6JOAZS4
         Wiug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739949716; x=1740554516;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nL4ehjy0HunCJ0sJe+PFpLuc0MbSZl0UMHQbeYAyHRI=;
        b=ezNUPZ0PUYvtvLl0XfOVKjQKriwC1ERnzwB771NIsBFjAb7FUZlIiCmLPpezh59dEc
         Qty13EU9NhGFX/Nx44RwKaj3vFpMUn/oStlu6eLQCdfHDQ5CUqrEkEBHp4H5PkGheorG
         MI4WENK1wnBRlUSsjXEzOWN5FMmUebMGuXC69Ek5IbR79R4hKYt3tmgaLHqwryw7K4+H
         whf1fIx+fWj6M26jVseOnqqp5jxuiwwQPmQZgVBoCYinIVmkHei5LL/y6cCAPx8QnuU6
         j6lnruDtYRcb5zs3uczY5puzfLH35LfzPfjaQNxHH+WJrGwMUib6hyBmL4+Uby7Umvw5
         YUmw==
X-Gm-Message-State: AOJu0YyrH9FpDXHOg0AZ3Cmy13lrIgwaqTpUyF9L/w7EbOBlxx41RWn3
	J+I+l789yFL8MCG3fxv64r0pxTU3OXHryzFsPQEdOKWxe3jMO0AQD3x1oE35GbacX0pzxrSxysc
	O
X-Gm-Gg: ASbGncvl/eknBdCGVzqxn7E6YPufH6vralzccirAQzR/G+rTs/+9zD/GBmF2IK0Imgm
	B2QzbSpcKPAppjbDjP4csUkbkhwEAz4zQh/nvIC3LVv6Jljjv8U0eroiNo/mf2PvbQlAZRSz8Mx
	KXaCAxWO7qg01O/ZxReXEHJuE77U7Fyo36KAhM1O7YgvVsbvnwIDrWFmNxjCpTJZcL3SEMQLpxG
	voL5zeFhVKUMmj2LJDQk+gvjr5fnoTzpYg5iSN1DvLHI26fwPoghDlL7GJqH24a7tuy1t1j6rZz
	SoTmwsIZ3Mv8grxS6npe
X-Google-Smtp-Source: AGHT+IEP99w93lRjUsG1LWrTV9PSO+j6kUMUtQdYxNrHsv8+/S4B02UoOh0SxZNhKWZSRJoHtBhNSQ==
X-Received: by 2002:a17:907:9411:b0:ab6:fe30:f49e with SMTP id a640c23a62f3a-abbcc7f2de8mr285156766b.28.1739949716226;
        Tue, 18 Feb 2025 23:21:56 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-aba5323226asm1208953266b.8.2025.02.18.23.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 23:21:55 -0800 (PST)
Date: Wed, 19 Feb 2025 10:21:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Pavel Begunkov <asml.silence@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jens Axboe <axboe@kernel.dk>, David Wei <dw@davidwei.uk>
Subject: [linux-next:master 3999/4377] io_uring/zcrx.c:223
 io_register_zcrx_ifq() warn: missing unwind goto?
Message-ID: <9123f4ac-233a-41df-b50e-9865e528bd60@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Pavel,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e5d3fd687aac5eceb1721fa92b9f49afcf4c3717
commit: 035af94b39fd13751abf5f0a2948c9eddede55d0 [3999/4377] io_uring/zcrx: grab a net device
config: i386-randconfig-141-20250218 (https://download.01.org/0day-ci/archive/20250219/202502190532.W7NnmyiP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202502190532.W7NnmyiP-lkp@intel.com/

smatch warnings:
io_uring/zcrx.c:223 io_register_zcrx_ifq() warn: missing unwind goto?

vim +223 io_uring/zcrx.c

6f377873cb2390 David Wei      2025-02-14  160  int io_register_zcrx_ifq(struct io_ring_ctx *ctx,
6f377873cb2390 David Wei      2025-02-14  161  			  struct io_uring_zcrx_ifq_reg __user *arg)
6f377873cb2390 David Wei      2025-02-14  162  {
cf96310c5f9a0d David Wei      2025-02-14  163  	struct io_uring_zcrx_area_reg area;
6f377873cb2390 David Wei      2025-02-14  164  	struct io_uring_zcrx_ifq_reg reg;
6f377873cb2390 David Wei      2025-02-14  165  	struct io_uring_region_desc rd;
6f377873cb2390 David Wei      2025-02-14  166  	struct io_zcrx_ifq *ifq;
6f377873cb2390 David Wei      2025-02-14  167  	int ret;
6f377873cb2390 David Wei      2025-02-14  168  
6f377873cb2390 David Wei      2025-02-14  169  	/*
6f377873cb2390 David Wei      2025-02-14  170  	 * 1. Interface queue allocation.
6f377873cb2390 David Wei      2025-02-14  171  	 * 2. It can observe data destined for sockets of other tasks.
6f377873cb2390 David Wei      2025-02-14  172  	 */
6f377873cb2390 David Wei      2025-02-14  173  	if (!capable(CAP_NET_ADMIN))
6f377873cb2390 David Wei      2025-02-14  174  		return -EPERM;
6f377873cb2390 David Wei      2025-02-14  175  
6f377873cb2390 David Wei      2025-02-14  176  	/* mandatory io_uring features for zc rx */
6f377873cb2390 David Wei      2025-02-14  177  	if (!(ctx->flags & IORING_SETUP_DEFER_TASKRUN &&
6f377873cb2390 David Wei      2025-02-14  178  	      ctx->flags & IORING_SETUP_CQE32))
6f377873cb2390 David Wei      2025-02-14  179  		return -EINVAL;
6f377873cb2390 David Wei      2025-02-14  180  	if (ctx->ifq)
6f377873cb2390 David Wei      2025-02-14  181  		return -EBUSY;
6f377873cb2390 David Wei      2025-02-14  182  	if (copy_from_user(&reg, arg, sizeof(reg)))
6f377873cb2390 David Wei      2025-02-14  183  		return -EFAULT;
6f377873cb2390 David Wei      2025-02-14  184  	if (copy_from_user(&rd, u64_to_user_ptr(reg.region_ptr), sizeof(rd)))
6f377873cb2390 David Wei      2025-02-14  185  		return -EFAULT;
6f377873cb2390 David Wei      2025-02-14  186  	if (memchr_inv(&reg.__resv, 0, sizeof(reg.__resv)))
6f377873cb2390 David Wei      2025-02-14  187  		return -EINVAL;
6f377873cb2390 David Wei      2025-02-14  188  	if (reg.if_rxq == -1 || !reg.rq_entries || reg.flags)
6f377873cb2390 David Wei      2025-02-14  189  		return -EINVAL;
6f377873cb2390 David Wei      2025-02-14  190  	if (reg.rq_entries > IO_RQ_MAX_ENTRIES) {
6f377873cb2390 David Wei      2025-02-14  191  		if (!(ctx->flags & IORING_SETUP_CLAMP))
6f377873cb2390 David Wei      2025-02-14  192  			return -EINVAL;
6f377873cb2390 David Wei      2025-02-14  193  		reg.rq_entries = IO_RQ_MAX_ENTRIES;
6f377873cb2390 David Wei      2025-02-14  194  	}
6f377873cb2390 David Wei      2025-02-14  195  	reg.rq_entries = roundup_pow_of_two(reg.rq_entries);
6f377873cb2390 David Wei      2025-02-14  196  
cf96310c5f9a0d David Wei      2025-02-14  197  	if (copy_from_user(&area, u64_to_user_ptr(reg.area_ptr), sizeof(area)))
6f377873cb2390 David Wei      2025-02-14  198  		return -EFAULT;
6f377873cb2390 David Wei      2025-02-14  199  
6f377873cb2390 David Wei      2025-02-14  200  	ifq = io_zcrx_ifq_alloc(ctx);
6f377873cb2390 David Wei      2025-02-14  201  	if (!ifq)
6f377873cb2390 David Wei      2025-02-14  202  		return -ENOMEM;
6f377873cb2390 David Wei      2025-02-14  203  
6f377873cb2390 David Wei      2025-02-14  204  	ret = io_allocate_rbuf_ring(ifq, &reg, &rd);
6f377873cb2390 David Wei      2025-02-14  205  	if (ret)
6f377873cb2390 David Wei      2025-02-14  206  		goto err;
6f377873cb2390 David Wei      2025-02-14  207  
cf96310c5f9a0d David Wei      2025-02-14  208  	ret = io_zcrx_create_area(ifq, &ifq->area, &area);
cf96310c5f9a0d David Wei      2025-02-14  209  	if (ret)
cf96310c5f9a0d David Wei      2025-02-14  210  		goto err;
cf96310c5f9a0d David Wei      2025-02-14  211  
6f377873cb2390 David Wei      2025-02-14  212  	ifq->rq_entries = reg.rq_entries;
6f377873cb2390 David Wei      2025-02-14  213  	ifq->if_rxq = reg.if_rxq;
6f377873cb2390 David Wei      2025-02-14  214  
035af94b39fd13 Pavel Begunkov 2025-02-14  215  	ret = -ENODEV;
035af94b39fd13 Pavel Begunkov 2025-02-14  216  	ifq->netdev = netdev_get_by_index(current->nsproxy->net_ns, reg.if_idx,
035af94b39fd13 Pavel Begunkov 2025-02-14  217  					  &ifq->netdev_tracker, GFP_KERNEL);
035af94b39fd13 Pavel Begunkov 2025-02-14  218  	if (!ifq->netdev)
035af94b39fd13 Pavel Begunkov 2025-02-14  219  		goto err;
035af94b39fd13 Pavel Begunkov 2025-02-14  220  
035af94b39fd13 Pavel Begunkov 2025-02-14  221  	ifq->dev = ifq->netdev->dev.parent;
035af94b39fd13 Pavel Begunkov 2025-02-14  222  	if (!ifq->dev)
035af94b39fd13 Pavel Begunkov 2025-02-14 @223  		return -EOPNOTSUPP;

goto err;

035af94b39fd13 Pavel Begunkov 2025-02-14  224  	get_device(ifq->dev);
035af94b39fd13 Pavel Begunkov 2025-02-14  225  
6f377873cb2390 David Wei      2025-02-14  226  	reg.offsets.rqes = sizeof(struct io_uring);
6f377873cb2390 David Wei      2025-02-14  227  	reg.offsets.head = offsetof(struct io_uring, head);
6f377873cb2390 David Wei      2025-02-14  228  	reg.offsets.tail = offsetof(struct io_uring, tail);
6f377873cb2390 David Wei      2025-02-14  229  
6f377873cb2390 David Wei      2025-02-14  230  	if (copy_to_user(arg, &reg, sizeof(reg)) ||
6f377873cb2390 David Wei      2025-02-14  231  	    copy_to_user(u64_to_user_ptr(reg.region_ptr), &rd, sizeof(rd))) {
6f377873cb2390 David Wei      2025-02-14  232  		ret = -EFAULT;
6f377873cb2390 David Wei      2025-02-14  233  		goto err;
6f377873cb2390 David Wei      2025-02-14  234  	}
cf96310c5f9a0d David Wei      2025-02-14  235  	if (copy_to_user(u64_to_user_ptr(reg.area_ptr), &area, sizeof(area))) {
cf96310c5f9a0d David Wei      2025-02-14  236  		ret = -EFAULT;
cf96310c5f9a0d David Wei      2025-02-14  237  		goto err;
cf96310c5f9a0d David Wei      2025-02-14  238  	}
6f377873cb2390 David Wei      2025-02-14  239  	ctx->ifq = ifq;
6f377873cb2390 David Wei      2025-02-14  240  	return 0;
6f377873cb2390 David Wei      2025-02-14  241  err:
6f377873cb2390 David Wei      2025-02-14  242  	io_zcrx_ifq_free(ifq);
6f377873cb2390 David Wei      2025-02-14  243  	return ret;
6f377873cb2390 David Wei      2025-02-14  244  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

