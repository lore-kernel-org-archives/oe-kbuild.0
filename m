Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9D71FF618
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Feb 2025 05:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740635811; cv=none; b=rgcnOiLsG/dS8O669cv+VIQASFvrAe0gt9G9upXd1YgCgvkBuGbXt3EjkFgBNz1bQoKk4hLmauFgETbULaVpAXok5Z/HotHN6Ppn0F8o1y8UUGqORpAUGlgxYCk02+Tci38sXE/EJva2vjgCsyBUrJLZ17ZKYgcsdtLpgVmQk4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740635811; c=relaxed/simple;
	bh=MiyddU2tgNTmDEbaDTCguJiyNGY3QxY6d6ri7PWBSSw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aydnw7N0GRcxN7CBQ6MFpFrcFlenuvbZq7lBZFgvJs4ibT0i3Mor9Ptnk4S5jmKM0tKk4nAQfA9aNICXPO/CSmu6huAnNvjvbani5r5g9sYmUwJ09fXOydV7e+PAu7fOfmYIGR33E9anTo3EmpwjRkun0k6pEvuA/TK4nHImNDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H96N1OsN; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H96N1OsN"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-abb9709b5b5so92477866b.2
        for <oe-kbuild@lists.linux.dev>; Wed, 26 Feb 2025 21:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740635807; x=1741240607; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZXLQxXcuCf57XEtDqs12ZZ6d38hjRE+HBHVkPeO7MEM=;
        b=H96N1OsNvNRZz12ffofQcuq/uCUYFbD9aMozBv787wXu/scXjByM7x4QAtK1SiUjDk
         hqpnhDOzuGcZp732SODD5o2yoO8zUukKXztx4ERB6KLNf5ciSwcSkvbST4WSCxxgGuH3
         GoDBriQpsRT7NVBGz3bGShEvTQueA9oqXnAt84o08BMdvWG6LgQ28iizFFCubWvwPG0H
         AouMz6uVQTFAhTvuw+KQgpfKrSblaB5/dq7RkYA0O9p/rjCiOvLS6k6q6hYrzVIhLnHs
         CqgZ41HQMSby85ELDJteDUh5Mx3N0VU6/LokU5x4LYrgLEhqX5iosOcBj7IsH6qbO9xt
         T+yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740635807; x=1741240607;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZXLQxXcuCf57XEtDqs12ZZ6d38hjRE+HBHVkPeO7MEM=;
        b=UvcvJFRFwFy35IFOPBYOYqwXot6TJHW3QQE5abm6r9tVK6zKe0kffKR7PGDgk0xUvb
         EdcTxK1YZ1dIie3UZdeDveLTsH2HrJzWSXfeVRMGE8GXyn1uv1a22sBO6x9kkxZC35uv
         n0JYG6TS8ZkOQ1Hrx82P16Wj137nPQhZ+z0k9L5rgLe/WZ05iD0qHgw+oyHo81NEsUDX
         wvmnnCkzVEW/kRJvbmKCaI1e0M+lMX0u5K9xKhwxvBBzMiraCEUGeHdavOf4592rSJuu
         5mI67XdmzE1Biy3kV1NKEIfdZYDlTN//DuXVLdt6swczeoMZlR4JEyNKVRpj608HUq7n
         LNuA==
X-Gm-Message-State: AOJu0YwRwukqlrKUWO2v6WbQAFTjCWzX5GT+LgUrOkXo9fPYI7io4qt4
	1iL0BAr/W6d9GJHFCMzfEA4cQ4dqcFoTUoK8JOVCwkvMz9Jn4o4Yn7LDzwog64JkaYpnIf+aL4k
	n
X-Gm-Gg: ASbGnctt6xNDCdihQ+oSXgJsfb/VyddmEKT25wn1Gxtjl9c1UsoGGsVUcIqTEGfsvTP
	3vSOoMTB5nsMMyiGcpgOd7LlrgP4jYJLVVZjOf7jKBV7YG2B2QnqlTcB4dfQ2juxrRZzzojrdMj
	iVNEs+It5J/5TGbz4rkiUHdaWsDJMj0DBOWckK59QM845MO61aF5apJfb5648eLHh4p0FNlQcy2
	wWIUIGlw2ROo1sRc4ClH0tv2DKscdF0+ZeK4qK+IphRJRdYlRvIyriOPiBf3yBuM52NdpDIHvYj
	IcTdqsncxiDNgxANQglNgdNRrdfg1No=
X-Google-Smtp-Source: AGHT+IFVZa3lS8MmqYUlhtMpkkd+H56ifZixSk6eTaLvSx0RJHjbWK905sFTsmzA3RLqW3w5yo8AOQ==
X-Received: by 2002:a17:906:3109:b0:aa6:7091:1e91 with SMTP id a640c23a62f3a-abed0c66947mr1116813366b.11.1740635807423;
        Wed, 26 Feb 2025 21:56:47 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abf17fa4a4asm20390166b.92.2025.02.26.21.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 21:56:47 -0800 (PST)
Date: Thu, 27 Feb 2025 08:56:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Pavel Begunkov <asml.silence@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jens Axboe <axboe@kernel.dk>
Subject: [axboe-block:for-6.15/io_uring 43/57] io_uring/rw.c:299 io_prep_rw()
 error: uninitialized symbol 'ret'.
Message-ID: <e14911d2-c648-4738-84e4-48af3fcfdd9c@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-6.15/io_uring
head:   047fa0ba8f1bed6b1c5d88e31c4fd187de16dbc1
commit: 61ed48b5fc63d1c6d9c3eb59ed2b46a2cbfc6039 [43/57] io_uring/rw: open code io_prep_rw_setup()
config: i386-randconfig-141-20250226 (https://download.01.org/0day-ci/archive/20250227/202502271201.3Eaa0Ych-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202502271201.3Eaa0Ych-lkp@intel.com/

smatch warnings:
io_uring/rw.c:299 io_prep_rw() error: uninitialized symbol 'ret'.

vim +/ret +299 io_uring/rw.c

a9165b83c1937e Jens Axboe        2024-03-18  248  static int io_prep_rw(struct io_kiocb *req, const struct io_uring_sqe *sqe,
a9165b83c1937e Jens Axboe        2024-03-18  249  		      int ddir, bool do_import)
f3b44f92e59a80 Jens Axboe        2022-06-13  250  {
f2ccb5aed7bce1 Stefan Metzmacher 2022-08-11  251  	struct io_rw *rw = io_kiocb_to_cmd(req, struct io_rw);
f3b44f92e59a80 Jens Axboe        2022-06-13  252  	unsigned ioprio;
59a7d12a7fb5ab Anuj Gupta        2024-11-28  253  	u64 attr_type_mask;
f3b44f92e59a80 Jens Axboe        2022-06-13  254  	int ret;
f3b44f92e59a80 Jens Axboe        2022-06-13  255  
c72282dd865ee6 Pavel Begunkov    2025-02-24  256  	if (io_rw_alloc_async(req))
c72282dd865ee6 Pavel Begunkov    2025-02-24  257  		return -ENOMEM;
c72282dd865ee6 Pavel Begunkov    2025-02-24  258  
f3b44f92e59a80 Jens Axboe        2022-06-13  259  	rw->kiocb.ki_pos = READ_ONCE(sqe->off);
f3b44f92e59a80 Jens Axboe        2022-06-13  260  	/* used for fixed read/write too - just read unconditionally */
f3b44f92e59a80 Jens Axboe        2022-06-13  261  	req->buf_index = READ_ONCE(sqe->buf_index);
f3b44f92e59a80 Jens Axboe        2022-06-13  262  
f3b44f92e59a80 Jens Axboe        2022-06-13  263  	ioprio = READ_ONCE(sqe->ioprio);
f3b44f92e59a80 Jens Axboe        2022-06-13  264  	if (ioprio) {
f3b44f92e59a80 Jens Axboe        2022-06-13  265  		ret = ioprio_check_cap(ioprio);
f3b44f92e59a80 Jens Axboe        2022-06-13  266  		if (ret)
f3b44f92e59a80 Jens Axboe        2022-06-13  267  			return ret;
f3b44f92e59a80 Jens Axboe        2022-06-13  268  
f3b44f92e59a80 Jens Axboe        2022-06-13  269  		rw->kiocb.ki_ioprio = ioprio;
f3b44f92e59a80 Jens Axboe        2022-06-13  270  	} else {
f3b44f92e59a80 Jens Axboe        2022-06-13  271  		rw->kiocb.ki_ioprio = get_current_ioprio();
f3b44f92e59a80 Jens Axboe        2022-06-13  272  	}
099ada2c87260e Jens Axboe        2023-07-08  273  	rw->kiocb.dio_complete = NULL;
59a7d12a7fb5ab Anuj Gupta        2024-11-28  274  	rw->kiocb.ki_flags = 0;
f3b44f92e59a80 Jens Axboe        2022-06-13  275  
f3b44f92e59a80 Jens Axboe        2022-06-13  276  	rw->addr = READ_ONCE(sqe->addr);
f3b44f92e59a80 Jens Axboe        2022-06-13  277  	rw->len = READ_ONCE(sqe->len);
f3b44f92e59a80 Jens Axboe        2022-06-13  278  	rw->flags = READ_ONCE(sqe->rw_flags);
59a7d12a7fb5ab Anuj Gupta        2024-11-28  279  
61ed48b5fc63d1 Pavel Begunkov    2025-02-24  280  	if (do_import && !io_do_buffer_select(req)) {
61ed48b5fc63d1 Pavel Begunkov    2025-02-24  281  		struct io_async_rw *io = req->async_data;
61ed48b5fc63d1 Pavel Begunkov    2025-02-24  282  
61ed48b5fc63d1 Pavel Begunkov    2025-02-24  283  		ret = io_import_rw_buffer(ddir, req, io, 0);
59a7d12a7fb5ab Anuj Gupta        2024-11-28  284  		if (unlikely(ret))
59a7d12a7fb5ab Anuj Gupta        2024-11-28  285  			return ret;
61ed48b5fc63d1 Pavel Begunkov    2025-02-24  286  	}
59a7d12a7fb5ab Anuj Gupta        2024-11-28  287  
59a7d12a7fb5ab Anuj Gupta        2024-11-28  288  	attr_type_mask = READ_ONCE(sqe->attr_type_mask);
59a7d12a7fb5ab Anuj Gupta        2024-11-28  289  	if (attr_type_mask) {
59a7d12a7fb5ab Anuj Gupta        2024-11-28  290  		u64 attr_ptr;
59a7d12a7fb5ab Anuj Gupta        2024-11-28  291  
59a7d12a7fb5ab Anuj Gupta        2024-11-28  292  		/* only PI attribute is supported currently */
59a7d12a7fb5ab Anuj Gupta        2024-11-28  293  		if (attr_type_mask != IORING_RW_ATTR_FLAG_PI)
59a7d12a7fb5ab Anuj Gupta        2024-11-28  294  			return -EINVAL;
59a7d12a7fb5ab Anuj Gupta        2024-11-28  295  
59a7d12a7fb5ab Anuj Gupta        2024-11-28  296  		attr_ptr = READ_ONCE(sqe->attr_ptr);
59a7d12a7fb5ab Anuj Gupta        2024-11-28  297  		ret = io_prep_rw_pi(req, rw, ddir, attr_ptr, attr_type_mask);
59a7d12a7fb5ab Anuj Gupta        2024-11-28  298  	}
59a7d12a7fb5ab Anuj Gupta        2024-11-28 @299  	return ret;

Smatch is concerned that we could hit all three else statements.

a9165b83c1937e Jens Axboe        2024-03-18  300  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

