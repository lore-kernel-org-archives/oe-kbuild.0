Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7372290E
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Jun 2023 06:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686380243; x=1717916243;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kA+3bad7dkzzK3afks19DC7jfhHZtw+WBLwHIuAGVg4=;
  b=MRgDx5K9/OpNEcDgAYCPEH6kQu9OQAMXM4C2x5g+y8l40m+P+xZ5P05y
   5JLXl6EkGVZvrLw5T7oLOMBA3y4pChJp7X0qItGcDRcM6Rf8MnST2Fcz8
   n3XoJCZwt8SfQAtD5uir8wZBxQfa5tmgW9WJ11Imk8kOj/yEVpK+0OojO
   r/z4T8Gpc23r6RN1mIL7HvNLh+/L9ccuZ90+QJf+NhtbLOFV1PNHsdPm8
   cUn7bRV0GouRL5QEaC+1ZgbNz8ZPT/Sw+aUMTGfrECZD2rmUmYCm0VVNM
   NZ+KmjVpnSwOimIW489svAuKcSROgGueBBFTmjWuEC/Gdk3f+r4cKFLlF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="342416494"
X-IronPort-AV: E=Sophos;i="6.00,231,1681196400"; 
   d="scan'208";a="342416494"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 23:57:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="957394365"
X-IronPort-AV: E=Sophos;i="6.00,231,1681196400"; 
   d="scan'208";a="957394365"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 09 Jun 2023 23:57:21 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7sXI-0009q8-29;
	Sat, 10 Jun 2023 06:57:20 +0000
Date: Sat, 10 Jun 2023 14:56:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [peterz-queue:core/guards 37/58] kernel/events/core.c:4798
 find_get_pmu_context() warn: possible memory leak of 'new'
Message-ID: <202306101436.Jw8okc2P-lkp@intel.com>
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
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git core/guards
head:   dd132e83d180b932488bcf612576529e6163a1ea
commit: bbca204d731b08997a60a4ca0530fdee8b6f429c [37/58] perf: Simplify find_get_pmu_context()
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: arm64-randconfig-m031-20230608 (https://download.01.org/0day-ci/archive/20230610/202306101436.Jw8okc2P-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306101436.Jw8okc2P-lkp@intel.com/

smatch warnings:
kernel/events/core.c:4798 find_get_pmu_context() warn: possible memory leak of 'new'

vim +/new +4798 kernel/events/core.c

0793a61d4df8da kernel/perf_counter.c Thomas Gleixner 2008-12-04  4756  
bbca204d731b08 kernel/events/core.c  Peter Zijlstra  2023-06-09  4757  /*
bbca204d731b08 kernel/events/core.c  Peter Zijlstra  2023-06-09  4758   * Returns a matching perf_event_pmu_context with elevated refcount or NULL.
bbca204d731b08 kernel/events/core.c  Peter Zijlstra  2023-06-09  4759   */
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4760  static struct perf_event_pmu_context *
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4761  find_get_pmu_context(struct pmu *pmu, struct perf_event_context *ctx,
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4762  		     struct perf_event *event)
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4763  {
bbca204d731b08 kernel/events/core.c  Peter Zijlstra  2023-06-09  4764  	struct perf_event_pmu_context *epc;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4765  	void *task_ctx_data = NULL;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4766  
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4767  	if (!ctx->task) {
b255c4a091a85e kernel/events/core.c  Peter Zijlstra  2023-06-09  4768  		/*
b255c4a091a85e kernel/events/core.c  Peter Zijlstra  2023-06-09  4769  		 * perf_pmu_migrate_context() / __perf_pmu_install_event()
b255c4a091a85e kernel/events/core.c  Peter Zijlstra  2023-06-09  4770  		 * relies on the fact that find_get_pmu_context() cannot fail
b255c4a091a85e kernel/events/core.c  Peter Zijlstra  2023-06-09  4771  		 * for CPU contexts.
b255c4a091a85e kernel/events/core.c  Peter Zijlstra  2023-06-09  4772  		 */
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4773  		struct perf_cpu_pmu_context *cpc;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4774  
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4775  		cpc = per_cpu_ptr(pmu->cpu_pmu_context, event->cpu);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4776  		epc = &cpc->epc;
4f64a6c9f6f11e kernel/events/core.c  James Clark     2023-01-27  4777  		raw_spin_lock_irq(&ctx->lock);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4778  		if (!epc->ctx) {
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4779  			atomic_set(&epc->refcount, 1);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4780  			epc->embedded = 1;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4781  			list_add(&epc->pmu_ctx_entry, &ctx->pmu_ctx_list);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4782  			epc->ctx = ctx;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4783  		} else {
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4784  			WARN_ON_ONCE(epc->ctx != ctx);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4785  			atomic_inc(&epc->refcount);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4786  		}
4f64a6c9f6f11e kernel/events/core.c  James Clark     2023-01-27  4787  		raw_spin_unlock_irq(&ctx->lock);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4788  		return epc;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4789  	}
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4790  
bbca204d731b08 kernel/events/core.c  Peter Zijlstra  2023-06-09  4791  	void *new __free(kfree) = kzalloc(sizeof(*epc), GFP_KERNEL);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4792  	if (!new)
bbca204d731b08 kernel/events/core.c  Peter Zijlstra  2023-06-09  4793  		return NULL;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4794  
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4795  	if (event->attach_state & PERF_ATTACH_TASK_DATA) {
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4796  		task_ctx_data = alloc_task_ctx_data(pmu);
bbca204d731b08 kernel/events/core.c  Peter Zijlstra  2023-06-09  4797  		if (!task_ctx_data)
bbca204d731b08 kernel/events/core.c  Peter Zijlstra  2023-06-09 @4798  			return NULL;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4799  	}
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4800  
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4801  	__perf_init_event_pmu_context(new, pmu);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4802  
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4803  	/*
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4804  	 * XXX
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4805  	 *
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4806  	 * lockdep_assert_held(&ctx->mutex);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4807  	 *
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4808  	 * can't because perf_event_init_task() doesn't actually hold the
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4809  	 * child_ctx->mutex.
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4810  	 */
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4811  
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4812  	raw_spin_lock_irq(&ctx->lock);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4813  	list_for_each_entry(epc, &ctx->pmu_ctx_list, pmu_ctx_entry) {
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4814  		if (epc->pmu == pmu) {
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4815  			WARN_ON_ONCE(epc->ctx != ctx);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4816  			atomic_inc(&epc->refcount);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4817  			goto found_epc;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4818  		}
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4819  	}
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4820  
bbca204d731b08 kernel/events/core.c  Peter Zijlstra  2023-06-09  4821  	epc = no_free_ptr(new);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4822  
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4823  	list_add(&epc->pmu_ctx_entry, &ctx->pmu_ctx_list);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4824  	epc->ctx = ctx;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4825  
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4826  found_epc:
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4827  	if (task_ctx_data && !epc->task_ctx_data) {
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4828  		epc->task_ctx_data = task_ctx_data;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4829  		task_ctx_data = NULL;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4830  		ctx->nr_task_data++;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4831  	}
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4832  	raw_spin_unlock_irq(&ctx->lock);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4833  
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4834  	free_task_ctx_data(pmu, task_ctx_data);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4835  
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4836  	return epc;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4837  }
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4838  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
