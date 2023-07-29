Received: from mgamail.intel.com (unknown [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276AF7C
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Jul 2023 20:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690663357; x=1722199357;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PwkZLyN2j5usDUq/jvZnjmjfPJBXMap44kjYUR9+2kQ=;
  b=CjaUBEMyImMFR9FPRe8D9ccEWkh7CfdnbxL1zLRevcZqBPhkUJMoPpKX
   WOU5AE5isOB0u2JtfK++CPvM9bzqBKvNmj3nLyzFY9mBDkpqz3HvIbCGa
   WJDs/vGtThvi7uIpo9awylPWnilcbmLJ3Kco8t80qBnjsB+rfc66KYC6t
   4nKSkfLSh7pIDFwo5WDxrcJwuOpC0rWwLhYs1R6ABhgS82e9tu8JxfxLp
   sarchXinxSGGRUnHFoCzJEqZbDfWpry7TUwAkVUmwJTrtK2KjHjqomHa9
   ZYdMg5k5V+Uj0XkNKbXRhEKbxbyTF+QOPR1QfYQYYp4An4GoHs+T1idiK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="455151513"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="455151513"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2023 13:42:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="841702368"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="841702368"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 29 Jul 2023 13:42:18 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPqlW-0004IH-0t;
	Sat, 29 Jul 2023 20:42:18 +0000
Date: Sun, 30 Jul 2023 04:41:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [peterz-queue:core/guards2 34/55] kernel/events/core.c:4790
 find_get_pmu_context() warn: possible memory leak of 'new'
Message-ID: <202307300405.uglJYcxf-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git core/guards2
head:   bef4845ab42c7a28ab63629ea1e619cbe51cccad
commit: c7978e9b8f1d670393e537233b0461fabb5b8057 [34/55] perf: Simplify find_get_pmu_context()
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-m021-20230730 (https://download.01.org/0day-ci/archive/20230730/202307300405.uglJYcxf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230730/202307300405.uglJYcxf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307300405.uglJYcxf-lkp@intel.com/

smatch warnings:
kernel/events/core.c:4790 find_get_pmu_context() warn: possible memory leak of 'new'

vim +/new +4790 kernel/events/core.c

0793a61d4df8da kernel/perf_counter.c Thomas Gleixner 2008-12-04  4748  
c7978e9b8f1d67 kernel/events/core.c  Peter Zijlstra  2023-06-09  4749  /*
c7978e9b8f1d67 kernel/events/core.c  Peter Zijlstra  2023-06-09  4750   * Returns a matching perf_event_pmu_context with elevated refcount or NULL.
c7978e9b8f1d67 kernel/events/core.c  Peter Zijlstra  2023-06-09  4751   */
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4752  static struct perf_event_pmu_context *
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4753  find_get_pmu_context(struct pmu *pmu, struct perf_event_context *ctx,
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4754  		     struct perf_event *event)
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4755  {
c7978e9b8f1d67 kernel/events/core.c  Peter Zijlstra  2023-06-09  4756  	struct perf_event_pmu_context *epc;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4757  	void *task_ctx_data = NULL;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4758  
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4759  	if (!ctx->task) {
11128072c6d531 kernel/events/core.c  Peter Zijlstra  2023-06-09  4760  		/*
11128072c6d531 kernel/events/core.c  Peter Zijlstra  2023-06-09  4761  		 * perf_pmu_migrate_context() / __perf_pmu_install_event()
11128072c6d531 kernel/events/core.c  Peter Zijlstra  2023-06-09  4762  		 * relies on the fact that find_get_pmu_context() cannot fail
11128072c6d531 kernel/events/core.c  Peter Zijlstra  2023-06-09  4763  		 * for CPU contexts.
11128072c6d531 kernel/events/core.c  Peter Zijlstra  2023-06-09  4764  		 */
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4765  		struct perf_cpu_pmu_context *cpc;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4766  
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4767  		cpc = per_cpu_ptr(pmu->cpu_pmu_context, event->cpu);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4768  		epc = &cpc->epc;
4f64a6c9f6f11e kernel/events/core.c  James Clark     2023-01-27  4769  		raw_spin_lock_irq(&ctx->lock);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4770  		if (!epc->ctx) {
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4771  			atomic_set(&epc->refcount, 1);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4772  			epc->embedded = 1;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4773  			list_add(&epc->pmu_ctx_entry, &ctx->pmu_ctx_list);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4774  			epc->ctx = ctx;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4775  		} else {
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4776  			WARN_ON_ONCE(epc->ctx != ctx);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4777  			atomic_inc(&epc->refcount);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4778  		}
4f64a6c9f6f11e kernel/events/core.c  James Clark     2023-01-27  4779  		raw_spin_unlock_irq(&ctx->lock);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4780  		return epc;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4781  	}
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4782  
c7978e9b8f1d67 kernel/events/core.c  Peter Zijlstra  2023-06-09  4783  	void *new __free(kfree) = kzalloc(sizeof(*epc), GFP_KERNEL);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4784  	if (!new)
c7978e9b8f1d67 kernel/events/core.c  Peter Zijlstra  2023-06-09  4785  		return NULL;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4786  
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4787  	if (event->attach_state & PERF_ATTACH_TASK_DATA) {
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4788  		task_ctx_data = alloc_task_ctx_data(pmu);
c7978e9b8f1d67 kernel/events/core.c  Peter Zijlstra  2023-06-09  4789  		if (!task_ctx_data)
c7978e9b8f1d67 kernel/events/core.c  Peter Zijlstra  2023-06-09 @4790  			return NULL;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4791  	}
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4792  
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4793  	__perf_init_event_pmu_context(new, pmu);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4794  
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4795  	/*
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4796  	 * XXX
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4797  	 *
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4798  	 * lockdep_assert_held(&ctx->mutex);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4799  	 *
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4800  	 * can't because perf_event_init_task() doesn't actually hold the
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4801  	 * child_ctx->mutex.
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4802  	 */
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4803  
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4804  	raw_spin_lock_irq(&ctx->lock);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4805  	list_for_each_entry(epc, &ctx->pmu_ctx_list, pmu_ctx_entry) {
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4806  		if (epc->pmu == pmu) {
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4807  			WARN_ON_ONCE(epc->ctx != ctx);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4808  			atomic_inc(&epc->refcount);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4809  			goto found_epc;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4810  		}
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4811  	}
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4812  
c7978e9b8f1d67 kernel/events/core.c  Peter Zijlstra  2023-06-09  4813  	epc = no_free_ptr(new);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4814  
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4815  	list_add(&epc->pmu_ctx_entry, &ctx->pmu_ctx_list);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4816  	epc->ctx = ctx;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4817  
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4818  found_epc:
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4819  	if (task_ctx_data && !epc->task_ctx_data) {
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4820  		epc->task_ctx_data = task_ctx_data;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4821  		task_ctx_data = NULL;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4822  		ctx->nr_task_data++;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4823  	}
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4824  	raw_spin_unlock_irq(&ctx->lock);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4825  
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4826  	free_task_ctx_data(pmu, task_ctx_data);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4827  
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4828  	return epc;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4829  }
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4830  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
