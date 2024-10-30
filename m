Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D5019BA6
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Oct 2024 00:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730247462; cv=none; b=DHt2TekJ5JMvIZ2NbiHBRQA0+V1ssHH9Ioki9sI0FgpYowYt2M7awNCYbw4v57LOEWH0XB6dNi05nIBrK+Yo66N6ungnN7kS3x7kLFVi41owvrbGgdbKXjExPN618/byMq64MP1DUc7D7UYbUnv9Kac7yGIK2Gs/jDJ1qEcR9H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730247462; c=relaxed/simple;
	bh=eUXWJ5kfmrya5Iaaha98EDPX3EkpYbf6VuHHe+MXD2s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rY56oP+HxgZ3mUfDMRiL7RKF1mqrANFI4R7B3MYA1fNEIXPW+5AqtJjc9X7Ar8X3mw5XljoSI567bSNJIYeuVFmL9xdyu7TJ2twjY3RlU5TCxX3VcVPGWnBSEkIT/7UE907lmfRo2rftBJlggLPpRRvo2WHXMEygt47bIwU9qbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lJ/yJ8fh; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lJ/yJ8fh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730247459; x=1761783459;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eUXWJ5kfmrya5Iaaha98EDPX3EkpYbf6VuHHe+MXD2s=;
  b=lJ/yJ8fhnUd535Pr5dsLmFojTYP23mggdYaU39Vwm6wctvTFVBDAMs1g
   PBX35DQRCqhKciM+z4uQ/llcHiSuTyOtzC/HKQ+gnX/m63Ll4lD+IcaOE
   Q3a01TYM3KvzMiungFzZqMEZOeoZnmhb95CoI0jTAfjtmst7whh6PiR9O
   2FnCUpLPcWNhuOtzaQ/bml6hbc+V38AtjbqFjbBJDnhccZQNb0jDztibc
   tg55KQ/sghKg3YaFl/lbNa7lWagZ75QUR+rjxU86RZX2sEsPOHPYYbYrW
   4WlofULxf0WM8TsipTq0Q3AgsiVT2rdBiYeCDR0QIiraCaW8Uf2EEnjo9
   A==;
X-CSE-ConnectionGUID: yanRTnSWSLadGZ+uqlelgA==
X-CSE-MsgGUID: IdcV0RcnTdWUGRFg61nUuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="41323327"
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; 
   d="scan'208";a="41323327"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 17:17:39 -0700
X-CSE-ConnectionGUID: DWB3HYu9T1ecfTQgux9RTQ==
X-CSE-MsgGUID: SGXp99OpTZCqt3ub19E1tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; 
   d="scan'208";a="82948638"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 Oct 2024 17:17:37 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5wP0-000eIw-2u;
	Wed, 30 Oct 2024 00:17:34 +0000
Date: Wed, 30 Oct 2024 08:17:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linyunsheng:mpmc 1/1] mm/page_frag_test.c:448 page_frag_test_init()
 error: uninitialized symbol 'start'.
Message-ID: <202410300826.xEilTEMe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Yunsheng Lin <linyunsheng@huawei.com>

tree:   https://github.com/gestionlin/linux.git mpmc
head:   ec46c0c4fe8ec793a5b918d5996fca2097581589
commit: ec46c0c4fe8ec793a5b918d5996fca2097581589 [1/1] mm: page_frag: add a test module for page_frag
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: sparc64-randconfig-r073-20241030 (https://download.01.org/0day-ci/archive/20241030/202410300826.xEilTEMe-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410300826.xEilTEMe-lkp@intel.com/

smatch warnings:
mm/page_frag_test.c:448 page_frag_test_init() error: uninitialized symbol 'start'.

vim +/start +448 mm/page_frag_test.c

ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  386  
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
ec46c0c4fe8ec7 Yunsheng Lin 2024-07-31  464  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
