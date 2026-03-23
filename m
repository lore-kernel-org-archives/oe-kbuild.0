Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDB9361DD9
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Mar 2026 08:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774254076; cv=none; b=QNRF85sVNAhTe7QLHJOo34Fyj6yFzc5ElEFpFKzLlnaqLVCqYrXHULVVHm9K5h5gVscjs7H1tKxQi10yvNUTbKkokhxLfkh3fbEjhKTjYQ86gk85m/wPwdDrhU1AM6ReZw8Cwq5PPPwJvFW1HytCCQquqqJF28ogy6aOzMjjGqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774254076; c=relaxed/simple;
	bh=GM8x3oyUxbRyQWgmKCxtMi8x5dV7Q4tnuubuBpQekp0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dSdjciijYSDYmkqmwryPg8hkALXiiVSPsbo0uElvX7N8XvEwbv4XaY7faCDNIlxhfjDFJvMoAeTW1Rsysb+M7FpwGlgXZev1IeebkAm9nJq4utCcvGBer+qrst3Ny2A2f1vlsRJgHP56A1E9Wci0m+Rx1bnjS9x5UndG0ImcGPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NxnnQJjn; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NxnnQJjn"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-439b9b1900bso1729108f8f.1
        for <oe-kbuild@lists.linux.dev>; Mon, 23 Mar 2026 01:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774254073; x=1774858873; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UY+UoW+/BMSdhh0KdbnqTpPp259N8c4v9xdTx5HyxAc=;
        b=NxnnQJjn72CvpDxtDDbZinVN/Z/9VVQFqIBzHjPG77xjI8cRGVeFeqoy9fJJLvGduK
         C1Cf07UFnTMGGuNRLUkddlr9J6/ioURRqKmq0wYTVkPDenMokcp84CSj/QTxPnlnhcwT
         /sc5Rj/DoHB2xMPufoa6QkEJ0YBMlobqKUX5PuigAuIRxwEjQoqvDdVhnkmsg9mOdEi7
         VuPX8pOOoWo7u6fqKEADP0QMyKO7H1nyvLfebWbSav6N5SydGkhDW+TFUWYnDt03xL/G
         TvIXeBVZh/0yF2lb+DYWRyunyn3jO7xpBnaPHexc7ONECizElndEe+uIYw/5Od7386a1
         QJ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774254073; x=1774858873;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UY+UoW+/BMSdhh0KdbnqTpPp259N8c4v9xdTx5HyxAc=;
        b=K+2Z9Z3krjxaPsMu+8pIF521fvWT8FEQDCTzMICe8qVeu4lbbGlrAyjiHzvdFSqG+E
         nvimh/Ek0KOw+poylzu0UjWDNTHBZxb7XAEFPt+NqoTnVmj+RzY5aKiHFT9BkKQwFVet
         0NV7brBdH2W2PrOrZZj8gt1Oxaj9cwuJ/c0E3Q/tboRo7AzgUCVUnq4CMYxRJnM4HrfI
         A5Gw5nRBdXakIM2PU8vH2x1U/ZiOs/izR9muoWV35b7rFzKzJRUlTuMdsYUqBlUqNisS
         jN5/hvwj82RnCUD6aCr2mP/XCigLl6bsWwfj3/x0hN5peOYoAQWx9Aj3cEMBC4k5mJ8f
         OqaA==
X-Gm-Message-State: AOJu0Ywx4tdAh+L7jMx/PQpsyJLx100B+G8l9k/4VOzOqu4HzbceGlR8
	hcVhIWmFiU/Y/keDOqADmBl3Pqyz7sAZ8hHSL8+rQiWkprHnL2G2oA1Dev37bK73ud6tyVCEG09
	JinTm
X-Gm-Gg: ATEYQzxsOfTOa+FrSJS1AM9p2ZFUOaFlpUEzk144IBrIk+9ZAQVZEU7XvmlVmoCEVsX
	tmRqg/xZg9ypIHzAsBmZXA/3CpUkTk27Fh5OkodqTYQg3PBQ06SfPepbj2GF7ISaQFOooFoDpy2
	v3x4sT+/KfUBVCG/7LpySz2KFjRP0t5jgxI7OWHUV4qi1AaD4FVAKnsyqWasy4Lo3himRRUd5Jm
	j4+0ZrPfQO3mzefwObxbAZvkNv2z0AJdIsK/mK0/C9ReOPzv6N4bhvLG//MH47RuP3PJwyPSqgJ
	nrlR+7zYozReroYXFsaI80wmzQddGDl9vnqy+30ascWMb6S49oFa8mNp3vNLiOkcnbwG4KnY2nZ
	+pTOxroQ+5T2A4KS25ikyJatuzhY+a/ssc+igSyFL2H2Se3nqwR109vi+YtNwEAl7G+wReI79zv
	3HqlVglTB/bXKqxLbnJWeiWVS65F+y
X-Received: by 2002:a05:6000:2f84:b0:43b:4273:a6ce with SMTP id ffacd0b85a97d-43b6423ebe4mr15440452f8f.3.1774254073135;
        Mon, 23 Mar 2026 01:21:13 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644bd38bsm27723091f8f.10.2026.03.23.01.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 01:21:12 -0700 (PDT)
Date: Mon, 23 Mar 2026 11:21:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Anna Schumaker <anna.schumaker@oracle.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Benjamin Coddington <bcodding@redhat.com>
Subject: net/sunrpc/sysfs.c:343 rpc_sysfs_xprt_switch_add_xprt_store() warn:
 passing zero to 'PTR_ERR'
Message-ID: <202603230618.haJICSqp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260323082109.kiedqPb1L-KbyTNAXC9QZf_CGHKRs7iAET65DOI98YA@z>

[ Zero day bot is going through old warnings and resending.  It looks like
  a valid issue to me? -dan ]

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ec69c9e88315c4be70c283f18c2ff130da6320b5
commit: df210d9b0951d714c1668c511ca5c8ff38cf6916 sunrpc: Add a sysfs file for adding a new xprt
config: x86_64-randconfig-161-20260322 (https://download.01.org/0day-ci/archive/20260323/202603230618.haJICSqp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202603230618.haJICSqp-lkp@intel.com/

New smatch warnings:
net/sunrpc/sysfs.c:343 rpc_sysfs_xprt_switch_add_xprt_store() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +343 net/sunrpc/sysfs.c

df210d9b0951d7 Anna Schumaker 2025-02-07  315  static ssize_t rpc_sysfs_xprt_switch_add_xprt_store(struct kobject *kobj,
df210d9b0951d7 Anna Schumaker 2025-02-07  316  						    struct kobj_attribute *attr,
df210d9b0951d7 Anna Schumaker 2025-02-07  317  						    const char *buf, size_t count)
df210d9b0951d7 Anna Schumaker 2025-02-07  318  {
df210d9b0951d7 Anna Schumaker 2025-02-07  319  	struct rpc_xprt_switch *xprt_switch =
df210d9b0951d7 Anna Schumaker 2025-02-07  320  		rpc_sysfs_xprt_switch_kobj_get_xprt(kobj);
df210d9b0951d7 Anna Schumaker 2025-02-07  321  	struct xprt_create xprt_create_args;
df210d9b0951d7 Anna Schumaker 2025-02-07  322  	struct rpc_xprt *xprt, *new;
df210d9b0951d7 Anna Schumaker 2025-02-07  323  
df210d9b0951d7 Anna Schumaker 2025-02-07  324  	if (!xprt_switch)
df210d9b0951d7 Anna Schumaker 2025-02-07  325  		return 0;
df210d9b0951d7 Anna Schumaker 2025-02-07  326  
df210d9b0951d7 Anna Schumaker 2025-02-07  327  	xprt = rpc_xprt_switch_get_main_xprt(xprt_switch);
df210d9b0951d7 Anna Schumaker 2025-02-07  328  	if (!xprt)
df210d9b0951d7 Anna Schumaker 2025-02-07  329  		goto out;

Shouldn't we set "count = -EINVAL;" or something here?

df210d9b0951d7 Anna Schumaker 2025-02-07  330  
df210d9b0951d7 Anna Schumaker 2025-02-07  331  	xprt_create_args.ident = xprt->xprt_class->ident;
df210d9b0951d7 Anna Schumaker 2025-02-07  332  	xprt_create_args.net = xprt->xprt_net;
df210d9b0951d7 Anna Schumaker 2025-02-07  333  	xprt_create_args.dstaddr = (struct sockaddr *)&xprt->addr;
df210d9b0951d7 Anna Schumaker 2025-02-07  334  	xprt_create_args.addrlen = xprt->addrlen;
df210d9b0951d7 Anna Schumaker 2025-02-07  335  	xprt_create_args.servername = xprt->servername;
df210d9b0951d7 Anna Schumaker 2025-02-07  336  	xprt_create_args.bc_xprt = xprt->bc_xprt;
df210d9b0951d7 Anna Schumaker 2025-02-07  337  	xprt_create_args.xprtsec = xprt->xprtsec;
df210d9b0951d7 Anna Schumaker 2025-02-07  338  	xprt_create_args.connect_timeout = xprt->connect_timeout;
df210d9b0951d7 Anna Schumaker 2025-02-07  339  	xprt_create_args.reconnect_timeout = xprt->max_reconnect_timeout;
df210d9b0951d7 Anna Schumaker 2025-02-07  340  
df210d9b0951d7 Anna Schumaker 2025-02-07  341  	new = xprt_create_transport(&xprt_create_args);
df210d9b0951d7 Anna Schumaker 2025-02-07  342  	if (IS_ERR_OR_NULL(new)) {

This should just be if (IS_ERR(new)) { since xprt_create_transport()
can't return NULL.  Returning count = 0 indicates EOF which would
be strange.

https://staticthinking.wordpress.com/2022/08/01/mixing-error-pointers-and-null/

df210d9b0951d7 Anna Schumaker 2025-02-07 @343  		count = PTR_ERR(new);
df210d9b0951d7 Anna Schumaker 2025-02-07  344  		goto out_put_xprt;
df210d9b0951d7 Anna Schumaker 2025-02-07  345  	}
df210d9b0951d7 Anna Schumaker 2025-02-07  346  
df210d9b0951d7 Anna Schumaker 2025-02-07  347  	rpc_xprt_switch_add_xprt(xprt_switch, new);
df210d9b0951d7 Anna Schumaker 2025-02-07  348  	xprt_put(new);
df210d9b0951d7 Anna Schumaker 2025-02-07  349  
df210d9b0951d7 Anna Schumaker 2025-02-07  350  out_put_xprt:
df210d9b0951d7 Anna Schumaker 2025-02-07  351  	xprt_put(xprt);
df210d9b0951d7 Anna Schumaker 2025-02-07  352  out:
df210d9b0951d7 Anna Schumaker 2025-02-07  353  	xprt_switch_put(xprt_switch);
df210d9b0951d7 Anna Schumaker 2025-02-07  354  	return count;
df210d9b0951d7 Anna Schumaker 2025-02-07  355  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

