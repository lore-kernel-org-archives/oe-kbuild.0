Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761B81C4608
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Oct 2024 07:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730274036; cv=none; b=TFfFJiKevIfdcuHknEDnM0bTQa+z9asm22xDoYIBZ8jmRvV0ok5/70ByjWYq77188WTXBryNBQRBKFZTilzPO7f+q9msYdKhQHc89AX8C98mzyenBdAo5Ect2Q39mb7le3FkDZ2U4dQtAIsJnDgQ3hHIUa8rs53LnqTVQ05iE64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730274036; c=relaxed/simple;
	bh=AY43lMUIhQoEMC7uEGV93yz8cx9NvJLk47YChSFOxKU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CbiC3tFsNy4jTDRSXZts8TPZheZLCw2bGi4ravyLOevVE2iCpTM2XKu7cRUQ/3PEqct9XWaviVzGW4Tn/c0HZo7hdEA48jfWiTGMQ/gUH0HFwkBvn82C98C1rgLFoccxOSHwvrL+rB/TzDoQFZt1NgS223nK0rL6k/REq31CrU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SZswoOgG; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SZswoOgG"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539f6e1f756so6584102e87.0
        for <oe-kbuild@lists.linux.dev>; Wed, 30 Oct 2024 00:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730274031; x=1730878831; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UKlzhvOczZ66FJXd+4RhBHxb7FWQEadgfoSSv5+THYk=;
        b=SZswoOgGxwITEK6H60Q+xQJQu0Y1BOmE6wvY1cV+4hXKt+rIOhUSV/55+TK/pdZnnH
         dWT5CmqQoq0j0cEUv3+oyFnDRTDhvEUZnoRXd/1OjmZPIuz9liZBxV49NomAryxJ5HwD
         I+McgLP4Hn8gS4JGkk00BUepKQ7rbEz7/NLoRhOLat18gKCvjkRYPTAwcnPc9Z8vLsv6
         Nh4o5qrJV40+UJ/eyVx8Usc6lEFyVkY3F3lTT7lXOxRcwXelkAIjKQ5Vs/h/p6CbD1+p
         CjbD7EzCztAEt67xckNPMLpGL3GdrQ5WI5IfzB1+EAnkzlSa6HC5BJTe0fLRpKAULMUb
         uPjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730274031; x=1730878831;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UKlzhvOczZ66FJXd+4RhBHxb7FWQEadgfoSSv5+THYk=;
        b=A7Fk7RN7sxYDoU1W5sTyXoal2XLDe+7SbeVGy+nRjL0Yhh/CUgO7GZQqvG9xf1ao9T
         9wkYQeaianksDWrwwdIwWWTADxq9Pq9sGa47nMtNaEVsMRCeZ3NSH/WgMlR1qx1vl87Y
         CND0XLsdY6CA7P9MS0nuq3MHABfFEXdG5ncEs/o+KSJFqiWZQxK7Tbz+W24HCfin6bk1
         OR0ZIJ9/Dc2DkXbB5JsidygmmzfpGDHX/Ubm5535W7DC7rDk13Cc4AIvbhZV8Cx1as5k
         Qg155FBLj956wLkXAXLJu1hEWCIKisbRdZWmFGMIQ9EZBGr4pc20yFTjJUpQrtV9EYVr
         n0gQ==
X-Gm-Message-State: AOJu0YzeTrL9SXdnbUvj1UU4ApirP5E0GSOk0XGfwAEB1WSY0x0XFOUZ
	8MDByswUkox/Dz2wpHSKKfGhTQEcZlZb4FirqWH6oAaYAU4yKMY42DgQOP3lkqebMzebpgQc5DR
	X
X-Google-Smtp-Source: AGHT+IFThVewfxT487QDXTLykZT7515hU3LMcfI3EWXbakFrGMaHiU0+6wizm4+cE/BScprCiHxmfQ==
X-Received: by 2002:a05:6512:3b25:b0:539:e9b4:7ff6 with SMTP id 2adb3069b0e04-53b34a18f2fmr6335612e87.45.1730274030818;
        Wed, 30 Oct 2024 00:40:30 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bb79429asm19090105e9.1.2024.10.30.00.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 00:40:30 -0700 (PDT)
Date: Wed, 30 Oct 2024 10:40:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Yunsheng Lin <linyunsheng@huawei.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:mpmc 1/1] mm/page_frag_test.c:448 page_frag_test_init()
 error: uninitialized symbol 'start'.
Message-ID: <11657f23-46c5-447f-adb5-314b7d77a654@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git mpmc
head:   ec46c0c4fe8ec793a5b918d5996fca2097581589
commit: ec46c0c4fe8ec793a5b918d5996fca2097581589 [1/1] mm: page_frag: add a test module for page_frag
config: sparc64-randconfig-r073-20241030 (https://download.01.org/0day-ci/archive/20241030/202410300826.xEilTEMe-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410300826.xEilTEMe-lkp@intel.com/

smatch warnings:
mm/page_frag_test.c:448 page_frag_test_init() error: uninitialized symbol 'start'.

vim +/start +448 mm/page_frag_test.c

ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  387  static int __init page_frag_test_init(void)
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  388  {
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  389  	struct task_struct *tsk;
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  390  	ktime_t start;
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  391  	u64 duration;
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  392  	int cpu, ret;
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  393  
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  394  	if (!cpumask_available(pop_cpumask)) {
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  395  		if (!alloc_cpumask_var(&pop_cpumask, GFP_KERNEL)) {
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  396  			ret = -ENOMEM;
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  397  			goto err_cpumask;
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  398  		}
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  399  
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  400  		cpumask_copy(pop_cpumask, cpu_online_mask);
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  401  	}
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  402  
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  403  	if (!cpumask_available(push_cpumask)) {
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  404  		if (!alloc_cpumask_var(&push_cpumask, GFP_KERNEL)) {
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  405  			ret = -ENOMEM;
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  406  			goto err_cpumask;
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  407  		}
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  408  
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  409  		cpumask_copy(push_cpumask, cpu_online_mask);
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  410  	}
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  411  
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  412  	if (!cpumask_subset(pop_cpumask, cpu_online_mask) ||
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  413  	    !cpumask_subset(push_cpumask, cpu_online_mask)) {
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  414  		ret = -EINVAL;
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  415  		goto err_cpumask;
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  416  	}
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  417  
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  418  	ret = objpool_init(&ptr_pool, nr_objs, GFP_KERNEL);
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  419  	if (ret)
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  420  		goto err_cpumask;
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  421  
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  422  	atomic_set(&nthreads, 0);
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  423  	init_completion(&wait);
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  424  
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  425  	for_each_cpu(cpu, push_cpumask) {
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  426  		tsk = kthread_create_on_cpu(page_frag_push_thread, &ptr_pool,
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  427  					    cpu, "push.*%u");
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  428  		if (IS_ERR(tsk))
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  429  			break;
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  430  
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  431  		wake_up_process(tsk);
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  432  		atomic_inc(&nthreads);
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  433  	}
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  434  
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  435  	for_each_cpu(cpu, pop_cpumask) {
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  436  		tsk = kthread_create_on_cpu(page_frag_pop_thread, &ptr_pool,
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  437  					    cpu, "pop.*%u");
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  438  		if (IS_ERR(tsk))
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  439  			break;
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  440  
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  441  		wake_up_process(tsk);
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  442  		atomic_inc(&nthreads);
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  443  	}
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  444  
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  445  	pr_info("waiting for test to complete\n");
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  446  	wait_for_completion(&wait);
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  447  
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31 @448  	duration = (u64)ktime_us_delta(ktime_get(), start);
                                                                                            ^^^^^

ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  449  	pr_info("%d of iterations for testing took: %lluus\n", nr_test,
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  450  		duration);
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  451  
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  452  	objpool_free(&ptr_pool);
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  453  	return -EAGAIN;
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  454  
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  455  err_cpumask:
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  456  	if (cpumask_available(pop_cpumask))
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  457  		free_cpumask_var(pop_cpumask);
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  458  
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  459  	if (cpumask_available(push_cpumask))
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  460  		free_cpumask_var(push_cpumask);
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  461  
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  462  	return ret;
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  463  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

