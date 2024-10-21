Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8441E1028
	for <oe-kbuild@lists.linux.dev>; Mon, 21 Oct 2024 07:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729497531; cv=none; b=i+MrX4hn66jxakUADIfMjIXf+FrYIK/fuA8G4MGrSiW9ElGZkP5nmCAGaUcfU9rxSorbfqPEv27ILg8p7hIOTOMVBuKBD/zo/E5ZhSe3SqkUwPkMGNvwasvlACnQTvgTuDbWFSo8NZUdnLd/H7fcFV3aoNbx8bnxhLJaUyqKOFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729497531; c=relaxed/simple;
	bh=KST3vVs1DZX8QFrivGF9n8bIHUS5wbN1i1o3z1E4ORE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZyrCF9NVRna+UZZzBGtP7CITLDf9FpgnZ1cmXB2lu6vP0faITqxtTm+cSBuWhyeEa7Uyj5xcgausXamO6EN37+qIxhY/zpimd42qzNB77pF5OGdxDeElkBuXnyjwmZuxCLzfqgYtYNOCY12X1BHx9zX991pR7IcbQqTSyc294yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pqaq7sdn; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pqaq7sdn"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43159c9f617so38824855e9.2
        for <oe-kbuild@lists.linux.dev>; Mon, 21 Oct 2024 00:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729497527; x=1730102327; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sJGIPbMZ/ckp7C6X/xnQvAUz9+I8JS21pip0P/FC/aI=;
        b=pqaq7sdnv2VFmzE3bMPDfWAGbgvTPj3xCb2rTBycIxq0O0Ff91GD6Vg9a2O8KzwTQe
         WcBcHHe/px7XGjYcIi5uP27j74y2NcEq8AeZQhpHhK/7XYSbtOPKgd5lezKBN7FimQJs
         b2CuY2SFccI4oMimK+IzQC8cHZ+ns5/9C49diVFeVKcFFGhAkwC79M1gkEPRap4M2kGy
         2CZYylipwG+Y50ZBqmSqzeDjEgaZMibyMvvHpIT+S8fQpZDeSYbDEsMrMqhge1hy5FEF
         AMicV7AuJSWaCr0vw8/fquo7/rBSldTMO4XKkmMMS/bxxDreIsiA5FJgnSJISTM1voay
         giDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729497527; x=1730102327;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sJGIPbMZ/ckp7C6X/xnQvAUz9+I8JS21pip0P/FC/aI=;
        b=DFrd+LBOjclcW0zt3RwvH5xwwwBgt/uk143syrXQE0s3io4GHOLQLd1J6JXBZXumKw
         emzrahzWRlHpyHJdaR/CslFhFCKQRm0nju2Vk4qlfD8ZhHdJ/VowCPHmltnOlIwchVoc
         JZ9VCylghmJzTuyQqsiL99zzFcvVKMhyrcz94ytcF3y+xtp4ZxeA/NkO/cWrzpAH4OxQ
         qDZH0zdtm2YST4kB6jmx0MKqv/6G6MtBThheih1rhTqRKM2z5KEq0Nm8RCN+tSqSQSJg
         b6zOsnYKw5CGO0MGDgdNmEP+nJ9pBFUiLXu6dCAGDUsOO4NbA8yLa+oRivfPaGloS++T
         LT1g==
X-Gm-Message-State: AOJu0YzWyMETbMVrY/PT5U37d9A944faz7ikC9vo/eFDhGanEN20xdcJ
	iWbQJA3fYBZs8LAw4fWl6BtrQSgDRxeMBa0q2Qk6buJDtw3TDES2tNwlS7LBPFyfd0VjxtMUDtj
	9
X-Google-Smtp-Source: AGHT+IGI7O57lXVTvzr6BVZgp5Zz9mljjRfqBRz4+CyDxVEeo9IDM57f+sp41FssIZuIG8up9o1j2g==
X-Received: by 2002:a05:600c:3591:b0:431:4c14:abf4 with SMTP id 5b1f17b1804b1-4316163a1b2mr85784645e9.14.1729497527102;
        Mon, 21 Oct 2024 00:58:47 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a365e5sm3653547f8f.21.2024.10.21.00.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 00:58:46 -0700 (PDT)
Date: Mon, 21 Oct 2024 10:58:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Pavel Begunkov <asml.silence@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/next 12/19] io_uring/zcrx.c:411 io_pp_zc_init() warn:
 variable dereferenced before check 'ifq' (see line 408)
Message-ID: <540d5e5f-5251-4ba4-b5e9-2c11420a0b8e@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/next
head:   2ddeede97bba995798be3e7a1ae9ac3340bec129
commit: bcb187b21fdb59e9ddaaf2a179a5e2044336e198 [12/19] io_uring/zcrx: implement zerocopy receive pp memory provider
config: x86_64-randconfig-161-20241020 (https://download.01.org/0day-ci/archive/20241021/202410210918.7CYUHUaU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410210918.7CYUHUaU-lkp@intel.com/

smatch warnings:
io_uring/zcrx.c:411 io_pp_zc_init() warn: variable dereferenced before check 'ifq' (see line 408)

vim +/ifq +411 io_uring/zcrx.c

bcb187b21fdb59 Pavel Begunkov 2023-12-08  405  static int io_pp_zc_init(struct page_pool *pp)
bcb187b21fdb59 Pavel Begunkov 2023-12-08  406  {
bcb187b21fdb59 Pavel Begunkov 2023-12-08  407  	struct io_zcrx_ifq *ifq = pp->mp_priv;
bcb187b21fdb59 Pavel Begunkov 2023-12-08 @408  	struct io_zcrx_area *area = ifq->area;
                                                                            ^^^^^^^^^
Dereferenced

bcb187b21fdb59 Pavel Begunkov 2023-12-08  409  	int ret;
bcb187b21fdb59 Pavel Begunkov 2023-12-08  410  
bcb187b21fdb59 Pavel Begunkov 2023-12-08 @411  	if (!ifq)
                                                    ^^^^
Checked too late

bcb187b21fdb59 Pavel Begunkov 2023-12-08  412  		return -EINVAL;
bcb187b21fdb59 Pavel Begunkov 2023-12-08  413  	if (pp->p.order != 0)
bcb187b21fdb59 Pavel Begunkov 2023-12-08  414  		return -EINVAL;
bcb187b21fdb59 Pavel Begunkov 2023-12-08  415  	if (!pp->p.napi)
bcb187b21fdb59 Pavel Begunkov 2023-12-08  416  		return -EINVAL;
bcb187b21fdb59 Pavel Begunkov 2023-12-08  417  
bcb187b21fdb59 Pavel Begunkov 2023-12-08  418  	ret = page_pool_mp_init_paged_area(pp, &area->nia, area->pages);
bcb187b21fdb59 Pavel Begunkov 2023-12-08  419  	if (ret)
bcb187b21fdb59 Pavel Begunkov 2023-12-08  420  		return ret;
bcb187b21fdb59 Pavel Begunkov 2023-12-08  421  
bcb187b21fdb59 Pavel Begunkov 2023-12-08  422  	percpu_ref_get(&ifq->ctx->refs);
bcb187b21fdb59 Pavel Begunkov 2023-12-08  423  	ifq->pp = pp;
bcb187b21fdb59 Pavel Begunkov 2023-12-08  424  	return 0;
bcb187b21fdb59 Pavel Begunkov 2023-12-08  425  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

