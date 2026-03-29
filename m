Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF0B26A1A7
	for <oe-kbuild@lists.linux.dev>; Sun, 29 Mar 2026 19:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774812772; cv=none; b=gGzAaUHCMEXrcxTs9IakEBni/n4WPxuxcUXWU6K4BeJCGn/HxsFlVlMypMxnw25NgSx8s0oFG5ArCc0gop3hctk/S4zq0Zt3ySD6na687cP3uwBlk7K9RN613VI1W44wNyYElP+VcxccG+AS+NJX5zQns5MOHuSiubalwMfOn9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774812772; c=relaxed/simple;
	bh=rNOtyqE88EoocoFnJ6NlEKgjiMn4d7nnMXQvCbvkJXE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kd/D6rza2u9BRtbS4vO6RmpW/aFwCziDtrCMc6q2z8VY2N4ksOy2FzqnElkWabmmycVvIUyn8NzJH7lA819f1n4PJCanbKGpoM94kWj9VW/4mPiVZmq0Rz4QMbmjw2vl1+lmNeugkWoByKybpvpPAlN9k7EcYBRaqJqMAI1Ucks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uskf1CWn; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uskf1CWn"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4870206f73bso22209495e9.3
        for <oe-kbuild@lists.linux.dev>; Sun, 29 Mar 2026 12:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774812769; x=1775417569; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a6VvwY2um+1G+zyhgax4hPE5TziXAcWpnu+VdKulIUc=;
        b=Uskf1CWns/v5/n6BN6j7m/9DrD2nAAKDlolC/gYz7Dyvj63ujggUED9kFzbBFfsSTe
         twt3SSxI2jmgkKkr7QNhacNOZEKImFbotrEa4tlCV/6lv58O3h0aCF5Iv1P2VDARKrvn
         kHxoK9mSnGIKQnZjgZwtt/tqmJbQ4NpZQrwd6q74rZ6GRLUFTU9wJVdH6BjtnHgZwG9L
         c0fDxy1zWL5PQbEQMVdIv8UHilGy4ZSwlNkGqRC24Z0rIT+U5i5ZzYigSdneHUH5KR8U
         wfISBrkDM0IpHClW2N3bBAJq/zUc16/ozQ6x0/YbN2PjNFoI5DPdJaz1Ivej1SLjgPT7
         fXeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774812769; x=1775417569;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a6VvwY2um+1G+zyhgax4hPE5TziXAcWpnu+VdKulIUc=;
        b=SzdF4bMaUFaqqKF/w3PY+iGBmFYk380dy1fErg2lSdP4L6qRlGLOQhHPS1KI4IYgHV
         HFZFnbnAMPXvf7HG8nLo3za4qJV6yKHoqZgQfxt4KNi4DsqOi7MYK2EjInnBHGh8FGcw
         /+G+vLhgOhtWBP3V2hN4/PYKSihMEQ5nOU2gorq1FA8Pfysy5PFfpW5x1myMKtA8jjWY
         OZQEsfmqDPKiqiid2SJXS24ygc7fx1SP7Cr1SpMBFlb+jZ1QPELrqGb7dwudLDfrXBI/
         SNTXv1PTS9RkmZO6zVCEXJZRYf591J/kzNoOmxDmwE5NBkEZkj1TZYceCFuuPI48PGqM
         gbvg==
X-Gm-Message-State: AOJu0YwRVfbD3UxArtmT2sTaITm/ujFPlrqEyf69gridnFJV+5eLDviz
	7St9gzzFwSRtStl0UzPE4TejFVnpkfxuUnTJXQMWWOqF4MYBRo+Ywry6Uxra3w==
X-Gm-Gg: ATEYQzxOj9rP3LJls/st2J33koM6ojZ7fiy1BbJRcOv7Hb7RX62WPsvkUrk3VcW/A1b
	+jXSjlc1aNuex1SnnX0XcGvRS4wt3lwiqdh0glrrZdRt1uLsyvCEFv0anxNxPdJaPRWpuGzTogm
	mgJXVrpgoHZFjjbnG+9b27QE/PGRyUAd+4txfivhoOfRL5N29EJeWoRaNfYwa7H7PTV/o0ahahp
	B4s2A9VqsNN7xCkvk7s1SCiDixyPxzGhZAWsownBRHFImW8pyCm9OFhsmEapRPFDa3TSXoPHpvx
	3YksgP6ek5vWELhGlxaHbKaDIcettpcn++XoPK/Pce5F8T/kgaP0yDlz16NoumvJSRRTsgSNMw4
	SAcn4fvDl3P16hJyI1Dnz3Yo4S51jFOyMmNg+Yf/zl2PISB9W7WDfVCQZ4uwCz8JdjWChDHrEYw
	uj9zaXkfPt7rbUHFT3wVI=
X-Received: by 2002:a05:600d:8:b0:486:fb0b:ad79 with SMTP id 5b1f17b1804b1-48727f7b951mr140290415e9.20.1774812768409;
        Sun, 29 Mar 2026 12:32:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf245e4b9sm12127140f8f.20.2026.03.29.12.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 12:32:47 -0700 (PDT)
Date: Sun, 29 Mar 2026 22:32:44 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 7/7] kernel/sched/deadline.c:2501
 find_later_rq() error: we previously assumed 'exec_ctx' could be null (see
 line 2494)
Message-ID: <202603282157.m7MFAEFC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260329193244.nJOeGleGJ1WnKUupjWOmLoAIw7PMQTVKzoDcjx-mGGk@z>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   1eeff75d058d17b506a97fa282e7bbb55074c8d1
commit: 57d50e9d7fc2f224ab09145b7ba2aae530ec798e [7/7] ANDROID: sched: Add find_exec_ctx helper
config: i386-randconfig-141-20260328 (https://download.01.org/0day-ci/archive/20260328/202603282157.m7MFAEFC-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603282157.m7MFAEFC-lkp@intel.com/

smatch warnings:
kernel/sched/deadline.c:2501 find_later_rq() error: we previously assumed 'exec_ctx' could be null (see line 2494)

vim +/exec_ctx +2501 kernel/sched/deadline.c

c621dead3a640a Connor O'Brien    2023-11-08  2483  static int find_later_rq(struct task_struct *sched_ctx, struct task_struct *exec_ctx)
1baca4ce16b8cc Juri Lelli        2013-11-07  2484  {
1baca4ce16b8cc Juri Lelli        2013-11-07  2485  	struct sched_domain *sd;
4ba2968420fa9d Christoph Lameter 2014-08-26  2486  	struct cpumask *later_mask = this_cpu_cpumask_var_ptr(local_cpu_mask_dl);
1baca4ce16b8cc Juri Lelli        2013-11-07  2487  	int this_cpu = smp_processor_id();
c621dead3a640a Connor O'Brien    2023-11-08  2488  	int cpu = task_cpu(sched_ctx);
1baca4ce16b8cc Juri Lelli        2013-11-07  2489  
1baca4ce16b8cc Juri Lelli        2013-11-07  2490  	/* Make sure the mask is initialized first */
1baca4ce16b8cc Juri Lelli        2013-11-07  2491  	if (unlikely(!later_mask))
1baca4ce16b8cc Juri Lelli        2013-11-07  2492  		return -1;
1baca4ce16b8cc Juri Lelli        2013-11-07  2493  
57d50e9d7fc2f2 Connor O'Brien    2023-11-08 @2494  	if (exec_ctx && exec_ctx->nr_cpus_allowed == 1)
                                                            ^^^^^^^^
Check for NULL.

1baca4ce16b8cc Juri Lelli        2013-11-07  2495  		return -1;
1baca4ce16b8cc Juri Lelli        2013-11-07  2496  
91ec6778ec4f96 Juri Lelli        2014-09-19  2497  	/*
91ec6778ec4f96 Juri Lelli        2014-09-19  2498  	 * We have to consider system topology and task affinity
97fb7a0a8944bd Ingo Molnar       2018-03-03  2499  	 * first, then we can look for a suitable CPU.
91ec6778ec4f96 Juri Lelli        2014-09-19  2500  	 */
c621dead3a640a Connor O'Brien    2023-11-08 @2501  	if (!cpudl_find(&task_rq(exec_ctx)->rd->cpudl, sched_ctx, exec_ctx, later_mask))
                                                                                 ^^^^^^^^
If exec_ctx were really NULL on line 2494 then the kernel would crash
here.

1baca4ce16b8cc Juri Lelli        2013-11-07  2502  		return -1;
1baca4ce16b8cc Juri Lelli        2013-11-07  2503  
1baca4ce16b8cc Juri Lelli        2013-11-07  2504  	/*
b18c3ca11c20ca Byungchul Park    2017-05-23  2505  	 * If we are here, some targets have been found, including
b18c3ca11c20ca Byungchul Park    2017-05-23  2506  	 * the most suitable which is, among the runqueues where the
b18c3ca11c20ca Byungchul Park    2017-05-23  2507  	 * current tasks have later deadlines than the task's one, the
b18c3ca11c20ca Byungchul Park    2017-05-23  2508  	 * rq with the latest possible one.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

