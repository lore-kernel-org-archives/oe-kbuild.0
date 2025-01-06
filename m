Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3331D935E
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Jan 2025 09:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736155771; cv=none; b=SRv/QNhBjFHw/H2l6CslNcHENTNP1Vfc9Vd1LARX8GZr1Mn6n4SDJJX28Hx/8kT0taIP6baiVjnS0RUOKTfd7NC59hGRUF6c+bGb8HJrauYZhJOHu2tUC0chFvPgjHoCVnH4+t2TZrsAIbXsEfPGdCUzRpUWM6krmRhS04+t7so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736155771; c=relaxed/simple;
	bh=tyZI4LCtZ3WGAkh2DiMdcJIDnnvlvRWusM2NCGA9vZU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jQuWpZIWaahdX2LREPDCgdsWZNclR5Nz6mDr0Mr+ckkJrT417KtXlEeaDL9Rh9Zc/bug7InZ96xWemT3tAkb4VWHxBw+JqndsnjQ1/TZPkuvU8tv6yS6m312QY/uQLAyR2pcXhBL44yYZHO1bSvBeVuhuiefqnVVJLkMIge4QEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vr/sQuMB; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vr/sQuMB"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3862d16b4f5so8706267f8f.0
        for <oe-kbuild@lists.linux.dev>; Mon, 06 Jan 2025 01:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736155767; x=1736760567; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WyPdssncH73MkXc63PAeqQ0YMlwhoT9z2JekLq5gQiw=;
        b=Vr/sQuMB+cez9FswVFhZ/ig+Lwk5NhI9ZblPSxnLHmxx9SRGZAHquVE0bpqWJk6zeD
         4crGZvehelTleqeChRZvZvb8j9FhyNTDNjRzy7Fu7td4+PHX2Xrd2QOOz9Mp9bodvYhR
         H3ux1TYlnjArLs9FOUT4ot1ZdFwZgfy9mmGzfH4YdomWSFDSvg/D61C6CTtFoarPmnSq
         DMeKhuzpfLztgpu+GucfIss/sUkPhohTXi0URf+KYDCq2L6glg8XHcY17nAq2RHf/t4q
         nOWJGNPPKUVhZVoIAYT53TzbCvJsY7V7puDsfTYVv3rG1mqDJRFvlAKLzJangi7uuRKm
         ngMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736155767; x=1736760567;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WyPdssncH73MkXc63PAeqQ0YMlwhoT9z2JekLq5gQiw=;
        b=i84pgtajd9waG8EkcAeSYPnWeohRm+2F5SZQaopNw+lH5Nuki8t93L32eV2ia3CIMQ
         IeaOxBQn/0KlsXpJwoY/Yhe/L02NkxuxwciQ9yvlUpW8byYiwgC8Q+vnMKbJNv5KR7qQ
         adMCbixf7mEaT1WzatbR2LS+bRHcC4/r2s/7BBz4/eSACYojOGLnAwrY1XNxKJDNHea+
         kKbtkBMk1L7HoYwlCBUXrcNfsplmYDgvEyHKqb85h1TqH8eFOnysCN6am1yJ95v0/PXY
         8d46Te3Pi/9sCMp9xfC8h08ViqUsbZdykljnifVUpVOzfjh/mz4K90zuln5RV5A/jMpn
         hX1g==
X-Gm-Message-State: AOJu0Yyt94wyji/iQVgX5pKjcLk/mjWosfOQfLQbAcnUNFGjYpmAYt+0
	FxhKby99iueVZhTX1+CuSbNz9l1yBOniusnsiVN7Bjuw+6tBWeAr/JnQq4RRIWktAwTU3xETeLl
	+
X-Gm-Gg: ASbGncv0UEMQ66fYlCOzvulPrLYSBZ/nqZRoJ6ELNspwaBRz7lCRVR1jW+U4I/zvL2/
	555fKfMpCCzRchtMof5dzzOAg54JqmFy9YV0Dk78VWK4tIGwubSF/K0mK5ODpf/CHDQm4quuZk6
	QKhfTcHVfNYf4uOJvLioeaBoB3UvKidAUI2//BOelT9KWTcnq8/PSq3XJ+5WbFAViSkV2m+NR+M
	IU2ncmTgUWXcGEvcaYEWMu0yWNtVeP3sacJISQ4JBf74pEbgkyfqVdyFPBZlQ==
X-Google-Smtp-Source: AGHT+IGtNggRmlvPCJR4KoRWyvraOrwCUpbc1uBXC2o9swnf/BgIhNgjoJM1SsYAlI5F66Nd13dQag==
X-Received: by 2002:a05:6000:2af:b0:385:e8e7:d09a with SMTP id ffacd0b85a97d-38a229ed1b2mr46352912f8f.2.1736155767389;
        Mon, 06 Jan 2025 01:29:27 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e150sm47310292f8f.66.2025.01.06.01.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 01:29:26 -0800 (PST)
Date: Mon, 6 Jan 2025 12:29:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 7230/7786]
 kernel/sched/deadline.c:2548 find_later_rq() error: we previously assumed
 'exec_ctx' could be null (see line 2541)
Message-ID: <e527e316-2b2a-4a8f-ade0-c01966a64427@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   0ad60853620e2bd7a2f165162fde4729cba0b46d
commit: a70dd213296b2f2524c2b4440cb60d46f85ab2e4 [7230/7786] ANDROID: sched: Add find_exec_ctx helper
config: i386-randconfig-141-20241221 (https://download.01.org/0day-ci/archive/20241222/202412220603.ZrMZILYo-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412220603.ZrMZILYo-lkp@intel.com/

smatch warnings:
kernel/sched/deadline.c:2548 find_later_rq() error: we previously assumed 'exec_ctx' could be null (see line 2541)

vim +/exec_ctx +2548 kernel/sched/deadline.c

eb7630f95f837d Connor O'Brien    2023-11-08  2530  static int find_later_rq(struct task_struct *sched_ctx, struct task_struct *exec_ctx)
1baca4ce16b8cc Juri Lelli        2013-11-07  2531  {
1baca4ce16b8cc Juri Lelli        2013-11-07  2532  	struct sched_domain *sd;
4ba2968420fa9d Christoph Lameter 2014-08-26  2533  	struct cpumask *later_mask = this_cpu_cpumask_var_ptr(local_cpu_mask_dl);
1baca4ce16b8cc Juri Lelli        2013-11-07  2534  	int this_cpu = smp_processor_id();
eb7630f95f837d Connor O'Brien    2023-11-08  2535  	int cpu = task_cpu(sched_ctx);
1baca4ce16b8cc Juri Lelli        2013-11-07  2536  
1baca4ce16b8cc Juri Lelli        2013-11-07  2537  	/* Make sure the mask is initialized first */
1baca4ce16b8cc Juri Lelli        2013-11-07  2538  	if (unlikely(!later_mask))
1baca4ce16b8cc Juri Lelli        2013-11-07  2539  		return -1;
1baca4ce16b8cc Juri Lelli        2013-11-07  2540  
a70dd213296b2f Connor O'Brien    2023-11-08 @2541  	if (exec_ctx && exec_ctx->nr_cpus_allowed == 1)

This line assumes exec_ctx can be NULL.

1baca4ce16b8cc Juri Lelli        2013-11-07  2542  		return -1;
1baca4ce16b8cc Juri Lelli        2013-11-07  2543  
91ec6778ec4f96 Juri Lelli        2014-09-19  2544  	/*
91ec6778ec4f96 Juri Lelli        2014-09-19  2545  	 * We have to consider system topology and task affinity
97fb7a0a8944bd Ingo Molnar       2018-03-03  2546  	 * first, then we can look for a suitable CPU.
91ec6778ec4f96 Juri Lelli        2014-09-19  2547  	 */
eb7630f95f837d Connor O'Brien    2023-11-08 @2548  	if (!cpudl_find(&task_rq(exec_ctx)->rd->cpudl, sched_ctx, exec_ctx, later_mask))

But the next line dereferences it without checking for NULL

1baca4ce16b8cc Juri Lelli        2013-11-07  2549  		return -1;
1baca4ce16b8cc Juri Lelli        2013-11-07  2550  
1baca4ce16b8cc Juri Lelli        2013-11-07  2551  	/*
b18c3ca11c20ca Byungchul Park    2017-05-23  2552  	 * If we are here, some targets have been found, including

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

