Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363AA26C3B3
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Jul 2025 19:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752520899; cv=none; b=jTgXtLW+ckEV9Q4ZxhNVyqePKa4bGUTw4IPtFnMyxcF3VZTdZKYlXkZJJr/A/yMNwyoZV8PZFSPfSUzZJ4fB3zULjTM0dU5OYQnXJ8q09f4xpm9hRzrhMsf757Ouny2xWLR6Q/YAQwFvTQmZ2XtxHO9LpPQI1EUBt9NDUdFAVqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752520899; c=relaxed/simple;
	bh=udjkE+pI4OacORgCdb4WXwwC+spArKyAGJt1PZl93OQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uffQ58+gYrF4R1ymHYxtbQAsA3O8U8owpTNWtOVCdWQhyZTKKH88bavkrDvIMhswkQ0v2IgPsJrbHsgOLa+0/ssO5L0sLWghmmxY38q4zCHqQADEmQ78Ty4Shau7lq5GlthYTFtl14h5aQsgWzZdxrqXc07BI02boXDN7TEcEkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jUx+XNhO; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jUx+XNhO"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-73b5350980cso2749303a34.1
        for <oe-kbuild@lists.linux.dev>; Mon, 14 Jul 2025 12:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752520896; x=1753125696; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q92yAW0S6TrRmtOIpQ3n/UYYq1tKeTfstmJi/xgr22U=;
        b=jUx+XNhOmGrGcCeAwglNZktxoxxdwE2ZZWO/lRqG8XahonStJCI4rM1uzHfuA1YMw+
         1vAA9t1SgK1rnmQqDFD/2CXAvj5TLnzr2/kwIbdhbR2Cj7PpxG/7PY8RcfyVcxsgPHnZ
         qNj+0Eg6mh1lAAnP/cAsNnZRfhhZb9EifjkTFZ/PGAULpwyl+r+n251+qZLRbGZanLs7
         XERmfoXGGUPB1YejH+F+b4AyFcpISF80H+TPqZP5mHPwhGFTI6TsjVNzbPx5jR9VFbmO
         jGOivLhhxFhaGy93OUUjoT7snwkJ2H9YvaMMHlBfwC/RXvacLEOyRfm+uZqiaiZn8bhv
         L1UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752520896; x=1753125696;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q92yAW0S6TrRmtOIpQ3n/UYYq1tKeTfstmJi/xgr22U=;
        b=Llw3UPMiZnPZp0VR7OTm8oFhKN1vHx2IaVv70UtvmEgx0+1paqNVw0SNmEf7+f/O91
         69n8QFS2g/McVIJ9FZpa6ClGIfjuj3JOqKIXuTH6EXaZkFYVENfiGfQmNhKDhLHAM7id
         UqxUdIhi/CMy0JU1/Hfxei9zGpj0/kC12BakcV8LhsEQ/SkiZ79tH9qdqbxw48oluXai
         2PKro6TCHKSULOP4HsZZ7LbMocuO2IQhm2EedvptCJZd+yuLqRq71Q+fjiPuPkXGRknv
         i/sgJEOhotu/+pf2r5a0tiQEaekA3MO55AIEf15PObAOu3y90YsQUMJYCKwhudSzwk0g
         csiw==
X-Gm-Message-State: AOJu0Yxd/TZOMW4I5LUbByu64FaQwD+lyUAWCvqA4YneDTu0ixdKkp/i
	EYH33wbeNHF8gBPGKIczVGcZBJKAVJzdnn1zJePDkGxTFr8YgnCAl2BgxiAblHwYSVwTV1shNE1
	DrZPr
X-Gm-Gg: ASbGnctMPUyo7+UkzRBZeoe3B80j0zrAEOywDj9Fu8y+Ayg3Tlrnu3RsGr3XRIEtCXc
	WbBHHELmmRv2mVRYbH8YEj0soCf44BNhzcV+937qi+yWtFVHgvEiszTTju6uexg5riOmmFuanjs
	ZIfpJatQwau4d1XrvlFj2AD5KyFB17Z6MnQKcAFCEehyy0oeldJmUCQ/w0v2U15JlsBp8CisVPI
	udn1Tls6NerEpQrLKHAn0KPi1S3R54A+wggY4xp4nk2K1DpHrjkq8Q2Gy/tFZBLyupv7A8UO/zm
	akZzv6tp2I5H5zn2Z/lSSfPxcrd+M37r+Qi1vWo2wWgE83hUgCGdoOdJZwnoMWEE8xnNZi8QIEi
	veHlaHOnLXqn9+SsWd1v0f+RjWWBYzw==
X-Google-Smtp-Source: AGHT+IG2M23gD2repp+zhsPZVLlk4Dw/CrJTTJ5KdVKqm6Qa+WYZ1jeCVz2Ttdp7sIGfZaoAqv20Iw==
X-Received: by 2002:a05:6808:67cc:b0:40c:b75a:40ab with SMTP id 5614622812f47-41b7d63b43bmr600281b6e.19.1752520895505;
        Mon, 14 Jul 2025 12:21:35 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:6bb2:d90f:e5da:befc])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4141bcd27b6sm1614381b6e.29.2025.07.14.12.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 12:21:35 -0700 (PDT)
Date: Mon, 14 Jul 2025 22:21:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2024-07 10/10] net/rds/rdma.c:306
 __rds_rdma_map() error: we previously assumed 'cp' could be null (see line
 291)
Message-ID: <13570846-9fd4-4c6a-9c15-67f9956783df@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1-2024-07
head:   923188d534f2cba1fabe5b4d1e5d1e2ca134cdb1
commit: 998fd719e6d6468b930ac0c44552ea9ff8b07b80 [10/10] net/rds: fix WARNING in rds_conn_connect_if_down
config: i386-randconfig-141-20250709 (https://download.01.org/0day-ci/archive/20250709/202507092141.iP0rV1YL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202507092141.iP0rV1YL-lkp@intel.com/

smatch warnings:
net/rds/rdma.c:306 __rds_rdma_map() error: we previously assumed 'cp' could be null (see line 291)

vim +/cp +306 net/rds/rdma.c

eff5f53bef75c0 Andy Grover       2009-02-24  172  static int __rds_rdma_map(struct rds_sock *rs, struct rds_get_mr_args *args,
9e630bcb7701f9 Avinash Repaka    2018-07-24  173  			  u64 *cookie_ret, struct rds_mr **mr_ret,
9e630bcb7701f9 Avinash Repaka    2018-07-24  174  			  struct rds_conn_path *cp)
eff5f53bef75c0 Andy Grover       2009-02-24  175  {
eff5f53bef75c0 Andy Grover       2009-02-24  176  	struct rds_mr *mr = NULL, *found;
2eafa1746f1787 Hans Westgaard Ry 2020-01-15  177  	struct scatterlist *sg = NULL;
eff5f53bef75c0 Andy Grover       2009-02-24  178  	unsigned int nr_pages;
eff5f53bef75c0 Andy Grover       2009-02-24  179  	struct page **pages = NULL;
eff5f53bef75c0 Andy Grover       2009-02-24  180  	void *trans_private;
eff5f53bef75c0 Andy Grover       2009-02-24  181  	unsigned long flags;
eff5f53bef75c0 Andy Grover       2009-02-24  182  	rds_rdma_cookie_t cookie;
2eafa1746f1787 Hans Westgaard Ry 2020-01-15  183  	unsigned int nents = 0;
2eafa1746f1787 Hans Westgaard Ry 2020-01-15  184  	int need_odp = 0;
eff5f53bef75c0 Andy Grover       2009-02-24  185  	long i;
eff5f53bef75c0 Andy Grover       2009-02-24  186  	int ret;
eff5f53bef75c0 Andy Grover       2009-02-24  187  
eee2fa6ab32251 Ka-Cheong Poon    2018-07-23  188  	if (ipv6_addr_any(&rs->rs_bound_addr) || !rs->rs_transport) {
eff5f53bef75c0 Andy Grover       2009-02-24  189  		ret = -ENOTCONN; /* XXX not a great errno */
eff5f53bef75c0 Andy Grover       2009-02-24  190  		goto out;
eff5f53bef75c0 Andy Grover       2009-02-24  191  	}
eff5f53bef75c0 Andy Grover       2009-02-24  192  
8690bfa17aea4c Andy Grover       2010-01-12  193  	if (!rs->rs_transport->get_mr) {
eff5f53bef75c0 Andy Grover       2009-02-24  194  		ret = -EOPNOTSUPP;
eff5f53bef75c0 Andy Grover       2009-02-24  195  		goto out;
eff5f53bef75c0 Andy Grover       2009-02-24  196  	}
eff5f53bef75c0 Andy Grover       2009-02-24  197  
2eafa1746f1787 Hans Westgaard Ry 2020-01-15  198  	/* If the combination of the addr and size requested for this memory
2eafa1746f1787 Hans Westgaard Ry 2020-01-15  199  	 * region causes an integer overflow, return error.
2eafa1746f1787 Hans Westgaard Ry 2020-01-15  200  	 */
2eafa1746f1787 Hans Westgaard Ry 2020-01-15  201  	if (((args->vec.addr + args->vec.bytes) < args->vec.addr) ||
2eafa1746f1787 Hans Westgaard Ry 2020-01-15  202  	    PAGE_ALIGN(args->vec.addr + args->vec.bytes) <
2eafa1746f1787 Hans Westgaard Ry 2020-01-15  203  		    (args->vec.addr + args->vec.bytes)) {
2eafa1746f1787 Hans Westgaard Ry 2020-01-15  204  		ret = -EINVAL;
2eafa1746f1787 Hans Westgaard Ry 2020-01-15  205  		goto out;
2eafa1746f1787 Hans Westgaard Ry 2020-01-15  206  	}
2eafa1746f1787 Hans Westgaard Ry 2020-01-15  207  
2eafa1746f1787 Hans Westgaard Ry 2020-01-15  208  	if (!can_do_mlock()) {
2eafa1746f1787 Hans Westgaard Ry 2020-01-15  209  		ret = -EPERM;
2eafa1746f1787 Hans Westgaard Ry 2020-01-15  210  		goto out;
2eafa1746f1787 Hans Westgaard Ry 2020-01-15  211  	}
2eafa1746f1787 Hans Westgaard Ry 2020-01-15  212  
eff5f53bef75c0 Andy Grover       2009-02-24  213  	nr_pages = rds_pages_in_vec(&args->vec);
eff5f53bef75c0 Andy Grover       2009-02-24  214  	if (nr_pages == 0) {
eff5f53bef75c0 Andy Grover       2009-02-24  215  		ret = -EINVAL;
eff5f53bef75c0 Andy Grover       2009-02-24  216  		goto out;
eff5f53bef75c0 Andy Grover       2009-02-24  217  	}
eff5f53bef75c0 Andy Grover       2009-02-24  218  
f9fb69adb6c7ac Avinash Repaka    2016-02-29  219  	/* Restrict the size of mr irrespective of underlying transport
f9fb69adb6c7ac Avinash Repaka    2016-02-29  220  	 * To account for unaligned mr regions, subtract one from nr_pages
f9fb69adb6c7ac Avinash Repaka    2016-02-29  221  	 */
f9fb69adb6c7ac Avinash Repaka    2016-02-29  222  	if ((nr_pages - 1) > (RDS_MAX_MSG_SIZE >> PAGE_SHIFT)) {
f9fb69adb6c7ac Avinash Repaka    2016-02-29  223  		ret = -EMSGSIZE;
f9fb69adb6c7ac Avinash Repaka    2016-02-29  224  		goto out;
f9fb69adb6c7ac Avinash Repaka    2016-02-29  225  	}
f9fb69adb6c7ac Avinash Repaka    2016-02-29  226  
eff5f53bef75c0 Andy Grover       2009-02-24  227  	rdsdebug("RDS: get_mr addr %llx len %llu nr_pages %u\n",
eff5f53bef75c0 Andy Grover       2009-02-24  228  		args->vec.addr, args->vec.bytes, nr_pages);
eff5f53bef75c0 Andy Grover       2009-02-24  229  
eff5f53bef75c0 Andy Grover       2009-02-24  230  	/* XXX clamp nr_pages to limit the size of this alloc? */
eff5f53bef75c0 Andy Grover       2009-02-24  231  	pages = kcalloc(nr_pages, sizeof(struct page *), GFP_KERNEL);
8690bfa17aea4c Andy Grover       2010-01-12  232  	if (!pages) {
eff5f53bef75c0 Andy Grover       2009-02-24  233  		ret = -ENOMEM;
eff5f53bef75c0 Andy Grover       2009-02-24  234  		goto out;
eff5f53bef75c0 Andy Grover       2009-02-24  235  	}
eff5f53bef75c0 Andy Grover       2009-02-24  236  
eff5f53bef75c0 Andy Grover       2009-02-24  237  	mr = kzalloc(sizeof(struct rds_mr), GFP_KERNEL);
8690bfa17aea4c Andy Grover       2010-01-12  238  	if (!mr) {
eff5f53bef75c0 Andy Grover       2009-02-24  239  		ret = -ENOMEM;
eff5f53bef75c0 Andy Grover       2009-02-24  240  		goto out;
eff5f53bef75c0 Andy Grover       2009-02-24  241  	}
eff5f53bef75c0 Andy Grover       2009-02-24  242  
e228a5d05e9ee2 Ka-Cheong Poon    2020-04-08  243  	kref_init(&mr->r_kref);
eff5f53bef75c0 Andy Grover       2009-02-24  244  	RB_CLEAR_NODE(&mr->r_rb_node);
eff5f53bef75c0 Andy Grover       2009-02-24  245  	mr->r_trans = rs->rs_transport;
eff5f53bef75c0 Andy Grover       2009-02-24  246  	mr->r_sock = rs;
eff5f53bef75c0 Andy Grover       2009-02-24  247  
eff5f53bef75c0 Andy Grover       2009-02-24  248  	if (args->flags & RDS_RDMA_USE_ONCE)
eff5f53bef75c0 Andy Grover       2009-02-24  249  		mr->r_use_once = 1;
eff5f53bef75c0 Andy Grover       2009-02-24  250  	if (args->flags & RDS_RDMA_INVALIDATE)
eff5f53bef75c0 Andy Grover       2009-02-24  251  		mr->r_invalidate = 1;
eff5f53bef75c0 Andy Grover       2009-02-24  252  	if (args->flags & RDS_RDMA_READWRITE)
eff5f53bef75c0 Andy Grover       2009-02-24  253  		mr->r_write = 1;
eff5f53bef75c0 Andy Grover       2009-02-24  254  
eff5f53bef75c0 Andy Grover       2009-02-24  255  	/*
eff5f53bef75c0 Andy Grover       2009-02-24  256  	 * Pin the pages that make up the user buffer and transfer the page
eff5f53bef75c0 Andy Grover       2009-02-24  257  	 * pointers to the mr's sg array.  We check to see if we've mapped
eff5f53bef75c0 Andy Grover       2009-02-24  258  	 * the whole region after transferring the partial page references
eff5f53bef75c0 Andy Grover       2009-02-24  259  	 * to the sg array so that we can have one page ref cleanup path.
eff5f53bef75c0 Andy Grover       2009-02-24  260  	 *
eff5f53bef75c0 Andy Grover       2009-02-24  261  	 * For now we have no flag that tells us whether the mapping is
eff5f53bef75c0 Andy Grover       2009-02-24  262  	 * r/o or r/w. We need to assume r/w, or we'll do a lot of RDMA to
eff5f53bef75c0 Andy Grover       2009-02-24  263  	 * the zero page.
eff5f53bef75c0 Andy Grover       2009-02-24  264  	 */
d22faec22c2ab2 Andy Grover       2010-01-12  265  	ret = rds_pin_pages(args->vec.addr, nr_pages, pages, 1);
2eafa1746f1787 Hans Westgaard Ry 2020-01-15  266  	if (ret == -EOPNOTSUPP) {
2eafa1746f1787 Hans Westgaard Ry 2020-01-15  267  		need_odp = 1;
2eafa1746f1787 Hans Westgaard Ry 2020-01-15  268  	} else if (ret <= 0) {
eff5f53bef75c0 Andy Grover       2009-02-24  269  		goto out;
2eafa1746f1787 Hans Westgaard Ry 2020-01-15  270  	} else {
eff5f53bef75c0 Andy Grover       2009-02-24  271  		nents = ret;
3cec0369905d08 Julia Lawall      2020-09-20  272  		sg = kmalloc_array(nents, sizeof(*sg), GFP_KERNEL);
8690bfa17aea4c Andy Grover       2010-01-12  273  		if (!sg) {
eff5f53bef75c0 Andy Grover       2009-02-24  274  			ret = -ENOMEM;
eff5f53bef75c0 Andy Grover       2009-02-24  275  			goto out;
eff5f53bef75c0 Andy Grover       2009-02-24  276  		}
eff5f53bef75c0 Andy Grover       2009-02-24  277  		WARN_ON(!nents);
eff5f53bef75c0 Andy Grover       2009-02-24  278  		sg_init_table(sg, nents);
eff5f53bef75c0 Andy Grover       2009-02-24  279  
eff5f53bef75c0 Andy Grover       2009-02-24  280  		/* Stick all pages into the scatterlist */
eff5f53bef75c0 Andy Grover       2009-02-24  281  		for (i = 0 ; i < nents; i++)
eff5f53bef75c0 Andy Grover       2009-02-24  282  			sg_set_page(&sg[i], pages[i], PAGE_SIZE, 0);
eff5f53bef75c0 Andy Grover       2009-02-24  283  
eff5f53bef75c0 Andy Grover       2009-02-24  284  		rdsdebug("RDS: trans_private nents is %u\n", nents);
2eafa1746f1787 Hans Westgaard Ry 2020-01-15  285  	}
eff5f53bef75c0 Andy Grover       2009-02-24  286  	/* Obtain a transport specific MR. If this succeeds, the
eff5f53bef75c0 Andy Grover       2009-02-24  287  	 * s/g list is now owned by the MR.
eff5f53bef75c0 Andy Grover       2009-02-24  288  	 * Note that dma_map() implies that pending writes are
eff5f53bef75c0 Andy Grover       2009-02-24  289  	 * flushed to RAM, so no dma_sync is needed here. */
2eafa1746f1787 Hans Westgaard Ry 2020-01-15  290  	trans_private = rs->rs_transport->get_mr(
2eafa1746f1787 Hans Westgaard Ry 2020-01-15 @291  		sg, nents, rs, &mr->r_key, cp ? cp->cp_conn : NULL,
                                                                                           ^^
This line assumes cp can be NULL.

2eafa1746f1787 Hans Westgaard Ry 2020-01-15  292  		args->vec.addr, args->vec.bytes,
2eafa1746f1787 Hans Westgaard Ry 2020-01-15  293  		need_odp ? ODP_ZEROBASED : ODP_NOT_NEEDED);
eff5f53bef75c0 Andy Grover       2009-02-24  294  
eff5f53bef75c0 Andy Grover       2009-02-24  295  	if (IS_ERR(trans_private)) {
2eafa1746f1787 Hans Westgaard Ry 2020-01-15  296  		/* In ODP case, we don't GUP pages, so don't need
2eafa1746f1787 Hans Westgaard Ry 2020-01-15  297  		 * to release anything.
2eafa1746f1787 Hans Westgaard Ry 2020-01-15  298  		 */
2eafa1746f1787 Hans Westgaard Ry 2020-01-15  299  		if (!need_odp) {
0d4597c8c5abde Leon Romanovsky   2020-02-11  300  			unpin_user_pages(pages, nr_pages);
eff5f53bef75c0 Andy Grover       2009-02-24  301  			kfree(sg);
2eafa1746f1787 Hans Westgaard Ry 2020-01-15  302  		}
eff5f53bef75c0 Andy Grover       2009-02-24  303  		ret = PTR_ERR(trans_private);
998fd719e6d646 Edward Adam Davis 2024-03-05  304  		/* Trigger connection so that its ready for the next retry */
998fd719e6d646 Edward Adam Davis 2024-03-05  305  		if (ret == -ENODEV)
998fd719e6d646 Edward Adam Davis 2024-03-05 @306  			rds_conn_connect_if_down(cp->cp_conn);
                                                                                                 ^^^^^^^^^^^
This code dereference cp without checking.

eff5f53bef75c0 Andy Grover       2009-02-24  307  		goto out;
eff5f53bef75c0 Andy Grover       2009-02-24  308  	}
eff5f53bef75c0 Andy Grover       2009-02-24  309  
eff5f53bef75c0 Andy Grover       2009-02-24  310  	mr->r_trans_private = trans_private;
eff5f53bef75c0 Andy Grover       2009-02-24  311  
eff5f53bef75c0 Andy Grover       2009-02-24  312  	rdsdebug("RDS: get_mr put_user key is %x cookie_addr %p\n",
eff5f53bef75c0 Andy Grover       2009-02-24  313  	       mr->r_key, (void *)(unsigned long) args->cookie_addr);
eff5f53bef75c0 Andy Grover       2009-02-24  314  
eff5f53bef75c0 Andy Grover       2009-02-24  315  	/* The user may pass us an unaligned address, but we can only
eff5f53bef75c0 Andy Grover       2009-02-24  316  	 * map page aligned regions. So we keep the offset, and build
eff5f53bef75c0 Andy Grover       2009-02-24  317  	 * a 64bit cookie containing <R_Key, offset> and pass that
eff5f53bef75c0 Andy Grover       2009-02-24  318  	 * around. */
2eafa1746f1787 Hans Westgaard Ry 2020-01-15  319  	if (need_odp)
2eafa1746f1787 Hans Westgaard Ry 2020-01-15  320  		cookie = rds_rdma_make_cookie(mr->r_key, 0);
2eafa1746f1787 Hans Westgaard Ry 2020-01-15  321  	else
2eafa1746f1787 Hans Westgaard Ry 2020-01-15  322  		cookie = rds_rdma_make_cookie(mr->r_key,
2eafa1746f1787 Hans Westgaard Ry 2020-01-15  323  					      args->vec.addr & ~PAGE_MASK);
eff5f53bef75c0 Andy Grover       2009-02-24  324  	if (cookie_ret)
eff5f53bef75c0 Andy Grover       2009-02-24  325  		*cookie_ret = cookie;
eff5f53bef75c0 Andy Grover       2009-02-24  326  
0d4597c8c5abde Leon Romanovsky   2020-02-11  327  	if (args->cookie_addr &&
0d4597c8c5abde Leon Romanovsky   2020-02-11  328  	    put_user(cookie, (u64 __user *)(unsigned long)args->cookie_addr)) {
0d4597c8c5abde Leon Romanovsky   2020-02-11  329  		if (!need_odp) {
0d4597c8c5abde Leon Romanovsky   2020-02-11  330  			unpin_user_pages(pages, nr_pages);
0d4597c8c5abde Leon Romanovsky   2020-02-11  331  			kfree(sg);
0d4597c8c5abde Leon Romanovsky   2020-02-11  332  		}
eff5f53bef75c0 Andy Grover       2009-02-24  333  		ret = -EFAULT;
eff5f53bef75c0 Andy Grover       2009-02-24  334  		goto out;
eff5f53bef75c0 Andy Grover       2009-02-24  335  	}
eff5f53bef75c0 Andy Grover       2009-02-24  336  
eff5f53bef75c0 Andy Grover       2009-02-24  337  	/* Inserting the new MR into the rbtree bumps its
eff5f53bef75c0 Andy Grover       2009-02-24  338  	 * reference count. */
eff5f53bef75c0 Andy Grover       2009-02-24  339  	spin_lock_irqsave(&rs->rs_rdma_lock, flags);
eff5f53bef75c0 Andy Grover       2009-02-24  340  	found = rds_mr_tree_walk(&rs->rs_rdma_keys, mr->r_key, mr);
eff5f53bef75c0 Andy Grover       2009-02-24  341  	spin_unlock_irqrestore(&rs->rs_rdma_lock, flags);
eff5f53bef75c0 Andy Grover       2009-02-24  342  
eff5f53bef75c0 Andy Grover       2009-02-24  343  	BUG_ON(found && found != mr);
eff5f53bef75c0 Andy Grover       2009-02-24  344  
eff5f53bef75c0 Andy Grover       2009-02-24  345  	rdsdebug("RDS: get_mr key is %x\n", mr->r_key);
eff5f53bef75c0 Andy Grover       2009-02-24  346  	if (mr_ret) {
e228a5d05e9ee2 Ka-Cheong Poon    2020-04-08  347  		kref_get(&mr->r_kref);
eff5f53bef75c0 Andy Grover       2009-02-24  348  		*mr_ret = mr;
eff5f53bef75c0 Andy Grover       2009-02-24  349  	}
eff5f53bef75c0 Andy Grover       2009-02-24  350  
eff5f53bef75c0 Andy Grover       2009-02-24  351  	ret = 0;
eff5f53bef75c0 Andy Grover       2009-02-24  352  out:
eff5f53bef75c0 Andy Grover       2009-02-24  353  	kfree(pages);
eff5f53bef75c0 Andy Grover       2009-02-24  354  	if (mr)
e228a5d05e9ee2 Ka-Cheong Poon    2020-04-08  355  		kref_put(&mr->r_kref, __rds_put_mr_final);
eff5f53bef75c0 Andy Grover       2009-02-24  356  	return ret;
eff5f53bef75c0 Andy Grover       2009-02-24  357  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

