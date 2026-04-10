Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4003DA7CF
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Apr 2026 18:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775844347; cv=none; b=QKADhpNT50ByDVgTdqy8hUC/Tc9fmd+XlK40bwrrZhJPvFVUyDwX5tH6Jdgnj7fAl1GB2vH56rTJM1ZfxsqFpUJVRZyrMgsAayZIHlBcmcdq1FLoFaqbI36NcwCEzE1BZu3M9fISADJXuQRFkodt79UsU8wTlbMvy529bbFCj80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775844347; c=relaxed/simple;
	bh=upL7uHHOJh5ywIAgLkRxox+sJgtNxUQ606R8TPmuxBM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nx59sA2JoDbCWYbVOJOrRygWiUqDhOAzJAPfXFBaP5fVsvJq/u/Sla2ItsEmxN3GVnf9t906KOlK4hsGMXkZvvmQWVJsXhcxIl0239etesSKckrZWAIumI2jLdMczN2I/620Ze88f7HV5+R2R5AbKRrfGGLVVZ5KASK6KtlKPVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XlN0fnR4; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XlN0fnR4"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488ba840146so23032145e9.1
        for <oe-kbuild@lists.linux.dev>; Fri, 10 Apr 2026 11:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775844344; x=1776449144; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6NQzOxAI8vhLFi6LQBGuGCO3XXob0e0ZDFDrbba0yug=;
        b=XlN0fnR4vZ40yVlTOrVuC8T2IuQD9zZO0BWCphAlehlDvalW276UKAjsj3m+f/U0Nv
         awWyh149uUOBuLPsIRclaqXz83zbBOdBY5a9ADBiMBJXt8bSA3SuZNjMDH+za4KejmnG
         u6LYmoXEW74CM1IP4JoSFUQb16kktLJcf2o+28fM+TfXE7z88QnqmOZLWvOK+HUSvvJC
         eBTC2zb6bhEgUo7iGLWbbGIfnfDs3n+oZHC5zqdNa22zqICJbiRkld4mn8XuDkwwQ+9X
         K13l1P4XARjtWxAeDZuOwP/ZDW2nSPsP6zLhXJGCDDi/6BtK03tqr7BN2jSy4mAZOfsU
         hB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775844344; x=1776449144;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6NQzOxAI8vhLFi6LQBGuGCO3XXob0e0ZDFDrbba0yug=;
        b=oNuf3wcGd3aq8bVt90QI2tPKIra0dhIZwUsifvtwbZO+DeRjSdpt8G7XuLSPjDjRWc
         blF8ej4kMECRy4uzXAz1sHkvPGgM2UqmUB7ebFvUpo2rl0+TX/g3uT9FaB8mPTso8a4V
         xpL1/X1zGo8RspVQmtUztP1XYlCOny0971f/Q5SLo3RmSEo2RdB+g9ItyJFJIdg/UYx/
         NX1dQXXzEGdsAaFhmioVMxwUv5BbKhIPn6SbWDp8sRKVu49hXw3X9Fl9xOA3OUKBcQxJ
         nNwyRb/EiFjdqh9RCf98VRITjU2eAvMzDdAPydIRlcxD4U3vmMdCqjZQS+aNN3xTqjSb
         Cmpw==
X-Gm-Message-State: AOJu0YxGsg3CrkNNYusUUjg7CjK7HieMpPLoMJlsycIoFVA/V8+EoExd
	i5mqhuAD2rlJAVSKGmqu5lNATPKTgDt35W+NbHuwLkHYXQhjDuIsP7OsXoyGnuTr
X-Gm-Gg: AeBDievlLNxgY1EhaXRRQF73c0vteqBekrdMCmgz/2Q7e2MZOT/XfJjBKBZuhRFwIS7
	6bapvuXR1LQj4U87G4HLuGZBW0T3A4Pl1Cn2iOCwew4aCRjMdLWq0UNamNf4HV7d6nTveQofKbh
	POpoP7/S69bACb5MtSvQdGnv+LIHXcxaLzzTyzhNceeRkR3HZ53Q5p7LTfeqRxJxbWtWUsydQHs
	bDCOJ1pqfS38hgfdPYI25fQz/McJOj804cdwj6DgbIXBVAhopzOiFsOyE4nw1c+Kw4Qfi4X/rrE
	tZxVH1j7ybAkRfcWFbXaykgokoLfAjzs8dvyznuaniKYo4cWn3n2qPehWI8AYsLEcI4IDv983tw
	KIPPx9hzXh/4hYyQ8N/URojifV3ltWHeMdrkeF5hlwyggshFnref+lYIizxEuCsTrZpiYnSf71C
	j2Dul+sqE/bptr6D6kAlo=
X-Received: by 2002:a05:600c:a11b:b0:488:bfc3:efc with SMTP id 5b1f17b1804b1-488d66559d0mr47321895e9.0.1775844343977;
        Fri, 10 Apr 2026 11:05:43 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d538c03esm89763415e9.13.2026.04.10.11.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:05:43 -0700 (PDT)
Date: Fri, 10 Apr 2026 21:05:39 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 38/38]
 drivers/gpu/drm/etnaviv/etnaviv_sched.c:66 etnaviv_sched_timedout_job()
 warn: variable dereferenced before check 'sched_job' (see line 37)
Message-ID: <202604110106.aMi7vRva-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Message-ID: <20260410180539.l0kIhLoIErDG0klS_ysdPAEi_baOuLFs5QJcIQ3ozUE@z>

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   831eddf6244dd5478d58b2f2f83a856781ba030b
commit: f503efe2c5da084dc5ee2db38409f7a7e4f1bc1e [38/38] drm/etnaviv: Protect the scheduler's pending list with its lock
config: i386-randconfig-141-20260410 (https://download.01.org/0day-ci/archive/20260411/202604110106.aMi7vRva-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604110106.aMi7vRva-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/etnaviv/etnaviv_sched.c:66 etnaviv_sched_timedout_job() warn: variable dereferenced before check 'sched_job' (see line 37)

vim +/sched_job +66 drivers/gpu/drm/etnaviv/etnaviv_sched.c
e93b6deeb45a78 Lucas Stach       2017-12-04  32  
a6a1f036c74e3d Luben Tuikov      2021-01-20  33  static enum drm_gpu_sched_stat etnaviv_sched_timedout_job(struct drm_sched_job
a6a1f036c74e3d Luben Tuikov      2021-01-20  34  							  *sched_job)
e93b6deeb45a78 Lucas Stach       2017-12-04  35  {
6d7a20c0776036 Lucas Stach       2017-12-06  36  	struct etnaviv_gem_submit *submit = to_etnaviv_submit(sched_job);
f503efe2c5da08 Maíra Canal       2025-06-02 @37  	struct drm_gpu_scheduler *sched = sched_job->sched;
                                                                                          ^^^^^^^^^^^^^^^^
Dereferenced.

6d7a20c0776036 Lucas Stach       2017-12-06  38  	struct etnaviv_gpu *gpu = submit->gpu;
2c83a726d6fbb5 Lucas Stach       2018-06-27  39  	u32 dma_addr;
2c83a726d6fbb5 Lucas Stach       2018-06-27  40  	int change;
2c83a726d6fbb5 Lucas Stach       2018-06-27  41  
2c83a726d6fbb5 Lucas Stach       2018-06-27  42  	/*
2c83a726d6fbb5 Lucas Stach       2018-06-27  43  	 * If the GPU managed to complete this jobs fence, the timout is
2c83a726d6fbb5 Lucas Stach       2018-06-27  44  	 * spurious. Bail out.
2c83a726d6fbb5 Lucas Stach       2018-06-27  45  	 */
6fce3a406108ee Lucas Stach       2018-10-04  46  	if (dma_fence_is_signaled(submit->out_fence))
50248a3ec0f5e5 Lucas Stach       2020-08-24  47  		goto out_no_timeout;
2c83a726d6fbb5 Lucas Stach       2018-06-27  48  
2c83a726d6fbb5 Lucas Stach       2018-06-27  49  	/*
2c83a726d6fbb5 Lucas Stach       2018-06-27  50  	 * If the GPU is still making forward progress on the front-end (which
2c83a726d6fbb5 Lucas Stach       2018-06-27  51  	 * should never loop) we shift out the timeout to give it a chance to
2c83a726d6fbb5 Lucas Stach       2018-06-27  52  	 * finish the job.
2c83a726d6fbb5 Lucas Stach       2018-06-27  53  	 */
2c83a726d6fbb5 Lucas Stach       2018-06-27  54  	dma_addr = gpu_read(gpu, VIVS_FE_DMA_ADDRESS);
2c83a726d6fbb5 Lucas Stach       2018-06-27  55  	change = dma_addr - gpu->hangcheck_dma_addr;
cdd156955f946b Lucas Stach       2021-12-22  56  	if (gpu->completed_fence != gpu->hangcheck_fence ||
cdd156955f946b Lucas Stach       2021-12-22  57  	    change < 0 || change > 16) {
2c83a726d6fbb5 Lucas Stach       2018-06-27  58  		gpu->hangcheck_dma_addr = dma_addr;
cdd156955f946b Lucas Stach       2021-12-22  59  		gpu->hangcheck_fence = gpu->completed_fence;
50248a3ec0f5e5 Lucas Stach       2020-08-24  60  		goto out_no_timeout;
2c83a726d6fbb5 Lucas Stach       2018-06-27  61  	}
6d7a20c0776036 Lucas Stach       2017-12-06  62  
2dd415c2e34c5a Lucas Stach       2024-06-21  63  	/* block scheduler */
2dd415c2e34c5a Lucas Stach       2024-06-21  64  	drm_sched_stop(&gpu->sched, sched_job);
2dd415c2e34c5a Lucas Stach       2024-06-21  65  
222b5f04415987 Andrey Grodzovsky 2018-12-04 @66  	if(sched_job)
                                                           ^^^^^^^^^
Checked too late.  Probably just delete this check.

222b5f04415987 Andrey Grodzovsky 2018-12-04  67  		drm_sched_increase_karma(sched_job);
6d7a20c0776036 Lucas Stach       2017-12-06  68  
6d7a20c0776036 Lucas Stach       2017-12-06  69  	/* get the GPU back into the init state */
9a1fdae5876016 Lucas Stach       2019-08-09  70  	etnaviv_core_dump(submit);
6d7a20c0776036 Lucas Stach       2017-12-06  71  	etnaviv_gpu_recover_hang(gpu);
6d7a20c0776036 Lucas Stach       2017-12-06  72  
222b5f04415987 Andrey Grodzovsky 2018-12-04  73  	drm_sched_resubmit_jobs(&gpu->sched);
222b5f04415987 Andrey Grodzovsky 2018-12-04  74  
a6a1f036c74e3d Luben Tuikov      2021-01-20  75  	drm_sched_start(&gpu->sched, true);
a6a1f036c74e3d Luben Tuikov      2021-01-20  76  	return DRM_GPU_SCHED_STAT_NOMINAL;
a6a1f036c74e3d Luben Tuikov      2021-01-20  77  
50248a3ec0f5e5 Lucas Stach       2020-08-24  78  out_no_timeout:
f503efe2c5da08 Maíra Canal       2025-06-02  79  	spin_lock(&sched->job_list_lock);
f503efe2c5da08 Maíra Canal       2025-06-02  80  	list_add(&sched_job->list, &sched->pending_list);
f503efe2c5da08 Maíra Canal       2025-06-02  81  	spin_unlock(&sched->job_list_lock);
a6a1f036c74e3d Luben Tuikov      2021-01-20  82  	return DRM_GPU_SCHED_STAT_NOMINAL;
e93b6deeb45a78 Lucas Stach       2017-12-04  83  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

