Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130B9156E0
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Oct 2023 09:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="foLUhvNo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698399805; x=1729935805;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IwHqrTGRpP6XLPfasFSq2aRxvRZcX5DX7HbEYW3NqA0=;
  b=foLUhvNoSMOxhx9I0by5EMlwRjRkAnQ6GzcSoxvyC5YdtXPEZEb4nOSr
   XYd3elwrfualfnCSmrS2ev3SmVVTgpI7xo6uC0mkWaZx9Ei2opV9YcGxJ
   Qw1NkF9MP6TmWNoI96M8HsQkw3Y94J5e9EEuLhKodzc3PyB5VBhf5Y3v/
   zYjTDktKALKVv28bbf4IQ4/g/HawbwXRJR+cHU6VM7YAgJ6FhwZtje4Pn
   UFBbg5HGgPKRBFKfhq6d5Pq6vkYm7N6QIJ8d6W13QgMZgfU/Iq0NgebRY
   HUdXBoOsVjykjnHEmzYaDml1nhyrUWPIT0TH/zx8RcC6898EPp3joDIBc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="473983674"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="473983674"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 02:43:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="736032679"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="736032679"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 27 Oct 2023 02:43:22 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwJN9-000Ahh-38;
	Fri, 27 Oct 2023 09:43:19 +0000
Date: Fri, 27 Oct 2023 17:42:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v5] module: Add CONFIG_MODULE_DISABLE_INIT_FREE option
Message-ID: <202310271751.28pKVu4K-lkp@intel.com>
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
In-Reply-To: <20231013062711.28852-1-quic_jiangenj@quicinc.com>
References: <20231013062711.28852-1-quic_jiangenj@quicinc.com>
TO: Joey Jiao <quic_jiangenj@quicinc.com>
TO: linux-modules@vger.kernel.org
CC: quic_jiangenj@quicinc.com
CC: quic_likaid@quicinc.com
CC: Luis Chamberlain <mcgrof@kernel.org>
CC: linux-kernel@vger.kernel.org

Hi Joey,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mcgrof/modules-next]
[also build test WARNING on linus/master v6.6-rc7 next-20231026]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Joey-Jiao/module-Add-CONFIG_MODULE_DISABLE_INIT_FREE-option/20231017-115509
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git modules-next
patch link:    https://lore.kernel.org/r/20231013062711.28852-1-quic_jiangenj%40quicinc.com
patch subject: [PATCH v5] module: Add CONFIG_MODULE_DISABLE_INIT_FREE option
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: x86_64-randconfig-161-20231026 (https://download.01.org/0day-ci/archive/20231027/202310271751.28pKVu4K-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231027/202310271751.28pKVu4K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310271751.28pKVu4K-lkp@intel.com/

smatch warnings:
kernel/module/main.c:2608 do_init_module() warn: possible memory leak of 'freeinit'

vim +/freeinit +2608 kernel/module/main.c

c749637909eea5 kernel/module.c      Rusty Russell    2015-01-20  2517  
c749637909eea5 kernel/module.c      Rusty Russell    2015-01-20  2518  	freeinit = kmalloc(sizeof(*freeinit), GFP_KERNEL);
c749637909eea5 kernel/module.c      Rusty Russell    2015-01-20  2519  	if (!freeinit) {
c749637909eea5 kernel/module.c      Rusty Russell    2015-01-20  2520  		ret = -ENOMEM;
c749637909eea5 kernel/module.c      Rusty Russell    2015-01-20  2521  		goto fail;
c749637909eea5 kernel/module.c      Rusty Russell    2015-01-20  2522  	}
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2523  	freeinit->init_text = mod->mem[MOD_INIT_TEXT].base;
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2524  	freeinit->init_data = mod->mem[MOD_INIT_DATA].base;
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2525  	freeinit->init_rodata = mod->mem[MOD_INIT_RODATA].base;
34e1169d996ab1 kernel/module.c      Kees Cook        2012-10-16  2526  
34e1169d996ab1 kernel/module.c      Kees Cook        2012-10-16  2527  	do_mod_ctors(mod);
34e1169d996ab1 kernel/module.c      Kees Cook        2012-10-16  2528  	/* Start the module */
34e1169d996ab1 kernel/module.c      Kees Cook        2012-10-16  2529  	if (mod->init != NULL)
34e1169d996ab1 kernel/module.c      Kees Cook        2012-10-16  2530  		ret = do_one_initcall(mod->init);
34e1169d996ab1 kernel/module.c      Kees Cook        2012-10-16  2531  	if (ret < 0) {
c749637909eea5 kernel/module.c      Rusty Russell    2015-01-20  2532  		goto fail_free_freeinit;
34e1169d996ab1 kernel/module.c      Kees Cook        2012-10-16  2533  	}
34e1169d996ab1 kernel/module.c      Kees Cook        2012-10-16  2534  	if (ret > 0) {
bddb12b32f90c5 kernel/module.c      Andrew Morton    2013-11-12  2535  		pr_warn("%s: '%s'->init suspiciously returned %d, it should "
bddb12b32f90c5 kernel/module.c      Andrew Morton    2013-11-12  2536  			"follow 0/-E convention\n"
34e1169d996ab1 kernel/module.c      Kees Cook        2012-10-16  2537  			"%s: loading module anyway...\n",
bddb12b32f90c5 kernel/module.c      Andrew Morton    2013-11-12  2538  			__func__, mod->name, ret, __func__);
34e1169d996ab1 kernel/module.c      Kees Cook        2012-10-16  2539  		dump_stack();
34e1169d996ab1 kernel/module.c      Kees Cook        2012-10-16  2540  	}
34e1169d996ab1 kernel/module.c      Kees Cook        2012-10-16  2541  
34e1169d996ab1 kernel/module.c      Kees Cook        2012-10-16  2542  	/* Now it's a first class citizen! */
34e1169d996ab1 kernel/module.c      Kees Cook        2012-10-16  2543  	mod->state = MODULE_STATE_LIVE;
34e1169d996ab1 kernel/module.c      Kees Cook        2012-10-16  2544  	blocking_notifier_call_chain(&module_notify_list,
34e1169d996ab1 kernel/module.c      Kees Cook        2012-10-16  2545  				     MODULE_STATE_LIVE, mod);
34e1169d996ab1 kernel/module.c      Kees Cook        2012-10-16  2546  
38dc717e97153e kernel/module.c      Jessica Yu       2020-11-27  2547  	/* Delay uevent until module has finished its init routine */
38dc717e97153e kernel/module.c      Jessica Yu       2020-11-27  2548  	kobject_uevent(&mod->mkobj.kobj, KOBJ_ADD);
38dc717e97153e kernel/module.c      Jessica Yu       2020-11-27  2549  
774a1221e862b3 kernel/module.c      Tejun Heo        2013-01-15  2550  	/*
774a1221e862b3 kernel/module.c      Tejun Heo        2013-01-15  2551  	 * We need to finish all async code before the module init sequence
67d6212afda218 kernel/module.c      Igor Pylypiv     2022-01-27  2552  	 * is done. This has potential to deadlock if synchronous module
67d6212afda218 kernel/module.c      Igor Pylypiv     2022-01-27  2553  	 * loading is requested from async (which is not allowed!).
774a1221e862b3 kernel/module.c      Tejun Heo        2013-01-15  2554  	 *
67d6212afda218 kernel/module.c      Igor Pylypiv     2022-01-27  2555  	 * See commit 0fdff3ec6d87 ("async, kmod: warn on synchronous
67d6212afda218 kernel/module.c      Igor Pylypiv     2022-01-27  2556  	 * request_module() from async workers") for more details.
774a1221e862b3 kernel/module.c      Tejun Heo        2013-01-15  2557  	 */
67d6212afda218 kernel/module.c      Igor Pylypiv     2022-01-27  2558  	if (!mod->async_probe_requested)
34e1169d996ab1 kernel/module.c      Kees Cook        2012-10-16  2559  		async_synchronize_full();
34e1169d996ab1 kernel/module.c      Kees Cook        2012-10-16  2560  
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2561  	ftrace_free_mem(mod, mod->mem[MOD_INIT_TEXT].base,
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2562  			mod->mem[MOD_INIT_TEXT].base + mod->mem[MOD_INIT_TEXT].size);
34e1169d996ab1 kernel/module.c      Kees Cook        2012-10-16  2563  	mutex_lock(&module_mutex);
34e1169d996ab1 kernel/module.c      Kees Cook        2012-10-16  2564  	/* Drop initial reference. */
34e1169d996ab1 kernel/module.c      Kees Cook        2012-10-16  2565  	module_put(mod);
34e1169d996ab1 kernel/module.c      Kees Cook        2012-10-16  2566  	trim_init_extable(mod);
34e1169d996ab1 kernel/module.c      Kees Cook        2012-10-16  2567  #ifdef CONFIG_KALLSYMS
8244062ef1e545 kernel/module.c      Rusty Russell    2016-02-03  2568  	/* Switch to core kallsyms now init is done: kallsyms may be walking! */
8244062ef1e545 kernel/module.c      Rusty Russell    2016-02-03  2569  	rcu_assign_pointer(mod->kallsyms, &mod->core_kallsyms);
34e1169d996ab1 kernel/module.c      Kees Cook        2012-10-16  2570  #endif
444d13ff10fb13 kernel/module.c      Jessica Yu       2016-07-27  2571  	module_enable_ro(mod, true);
93c2e105f6bcee kernel/module.c      Peter Zijlstra   2015-05-27  2572  	mod_tree_remove_init(mod);
d453cded05ee21 kernel/module.c      Rusty Russell    2015-01-20  2573  	module_arch_freeing_init(mod);
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2574  	for_class_mod_mem_type(type, init) {
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2575  		mod->mem[type].base = NULL;
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2576  		mod->mem[type].size = 0;
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2577  	}
df3e764d8e5cd4 kernel/module/main.c Luis Chamberlain 2023-03-28  2578  
607c543f939d8c kernel/module.c      Andrii Nakryiko  2020-11-20  2579  #ifdef CONFIG_DEBUG_INFO_BTF_MODULES
607c543f939d8c kernel/module.c      Andrii Nakryiko  2020-11-20  2580  	/* .BTF is not SHF_ALLOC and will get removed, so sanitize pointer */
607c543f939d8c kernel/module.c      Andrii Nakryiko  2020-11-20  2581  	mod->btf_data = NULL;
607c543f939d8c kernel/module.c      Andrii Nakryiko  2020-11-20  2582  #endif
c749637909eea5 kernel/module.c      Rusty Russell    2015-01-20  2583  	/*
c749637909eea5 kernel/module.c      Rusty Russell    2015-01-20  2584  	 * We want to free module_init, but be aware that kallsyms may be
0be964be0d4508 kernel/module.c      Peter Zijlstra   2015-05-27  2585  	 * walking this with preempt disabled.  In all the failure paths, we
cb2f55369d3a9e kernel/module.c      Paul E. McKenney 2018-11-06  2586  	 * call synchronize_rcu(), but we don't want to slow down the success
1a7b7d9220819a kernel/module.c      Rick Edgecombe   2019-04-25  2587  	 * path. module_memfree() cannot be called in an interrupt, so do the
1a7b7d9220819a kernel/module.c      Rick Edgecombe   2019-04-25  2588  	 * work and call synchronize_rcu() in a work queue.
1a7b7d9220819a kernel/module.c      Rick Edgecombe   2019-04-25  2589  	 *
ae646f0b9ca135 kernel/module.c      Jeffrey Hugo     2018-05-11  2590  	 * Note that module_alloc() on most architectures creates W+X page
ae646f0b9ca135 kernel/module.c      Jeffrey Hugo     2018-05-11  2591  	 * mappings which won't be cleaned up until do_free_init() runs.  Any
ae646f0b9ca135 kernel/module.c      Jeffrey Hugo     2018-05-11  2592  	 * code such as mark_rodata_ro() which depends on those mappings to
ae646f0b9ca135 kernel/module.c      Jeffrey Hugo     2018-05-11  2593  	 * be cleaned up needs to sync with the queued work - ie
cb2f55369d3a9e kernel/module.c      Paul E. McKenney 2018-11-06  2594  	 * rcu_barrier()
c749637909eea5 kernel/module.c      Rusty Russell    2015-01-20  2595  	 */
36022a47582048 kernel/module/main.c Joey Jiao        2023-10-13  2596  	if (!IS_ENABLED(CONFIG_MODULE_DISABLE_INIT_FREE) &&
36022a47582048 kernel/module/main.c Joey Jiao        2023-10-13  2597  	    llist_add(&freeinit->node, &init_free_list))
1a7b7d9220819a kernel/module.c      Rick Edgecombe   2019-04-25  2598  		schedule_work(&init_free_wq);
1a7b7d9220819a kernel/module.c      Rick Edgecombe   2019-04-25  2599  
34e1169d996ab1 kernel/module.c      Kees Cook        2012-10-16  2600  	mutex_unlock(&module_mutex);
34e1169d996ab1 kernel/module.c      Kees Cook        2012-10-16  2601  	wake_up_all(&module_wq);
34e1169d996ab1 kernel/module.c      Kees Cook        2012-10-16  2602  
df3e764d8e5cd4 kernel/module/main.c Luis Chamberlain 2023-03-28  2603  	mod_stat_add_long(text_size, &total_text_size);
df3e764d8e5cd4 kernel/module/main.c Luis Chamberlain 2023-03-28  2604  	mod_stat_add_long(total_size, &total_mod_size);
df3e764d8e5cd4 kernel/module/main.c Luis Chamberlain 2023-03-28  2605  
df3e764d8e5cd4 kernel/module/main.c Luis Chamberlain 2023-03-28  2606  	mod_stat_inc(&modcount);
df3e764d8e5cd4 kernel/module/main.c Luis Chamberlain 2023-03-28  2607  
34e1169d996ab1 kernel/module.c      Kees Cook        2012-10-16 @2608  	return 0;
c749637909eea5 kernel/module.c      Rusty Russell    2015-01-20  2609  
c749637909eea5 kernel/module.c      Rusty Russell    2015-01-20  2610  fail_free_freeinit:
c749637909eea5 kernel/module.c      Rusty Russell    2015-01-20  2611  	kfree(freeinit);
c749637909eea5 kernel/module.c      Rusty Russell    2015-01-20  2612  fail:
c749637909eea5 kernel/module.c      Rusty Russell    2015-01-20  2613  	/* Try to protect us from buggy refcounters. */
c749637909eea5 kernel/module.c      Rusty Russell    2015-01-20  2614  	mod->state = MODULE_STATE_GOING;
cb2f55369d3a9e kernel/module.c      Paul E. McKenney 2018-11-06  2615  	synchronize_rcu();
c749637909eea5 kernel/module.c      Rusty Russell    2015-01-20  2616  	module_put(mod);
c749637909eea5 kernel/module.c      Rusty Russell    2015-01-20  2617  	blocking_notifier_call_chain(&module_notify_list,
c749637909eea5 kernel/module.c      Rusty Russell    2015-01-20  2618  				     MODULE_STATE_GOING, mod);
7e545d6eca20ce kernel/module.c      Jessica Yu       2016-03-16  2619  	klp_module_going(mod);
7dcd182bec271a kernel/module.c      Jessica Yu       2016-02-16  2620  	ftrace_release_mod(mod);
c749637909eea5 kernel/module.c      Rusty Russell    2015-01-20  2621  	free_module(mod);
c749637909eea5 kernel/module.c      Rusty Russell    2015-01-20  2622  	wake_up_all(&module_wq);
df3e764d8e5cd4 kernel/module/main.c Luis Chamberlain 2023-03-28  2623  
c749637909eea5 kernel/module.c      Rusty Russell    2015-01-20  2624  	return ret;
34e1169d996ab1 kernel/module.c      Kees Cook        2012-10-16  2625  }
34e1169d996ab1 kernel/module.c      Kees Cook        2012-10-16  2626  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
