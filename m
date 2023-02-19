Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D781AA29
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Feb 2023 08:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676796814; x=1708332814;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/BqWZOGQqQxDKQflGTwMsvjhvWSp3wRXv/1dw6l7zyU=;
  b=FdXSVyvZFVqKBBN+EmCygVJF/Bph4CLJ7/3AGLrllms9rKLGnFXvp1hw
   YJqTBZ/8lmVD+EHqdW9n2fyIhVDcbEFVLWlYQWyqIdTJFN0r/qDmEuHAC
   944zM1YucqknKguwZ7ce3v23uzPYAZveEEq2WwERFduFvHMHZYG7NlI32
   SHA+nZnhJ+yYHfIXS5VEPC9gMezI38O15eD4vRaLXlZrBr61EtBvLqqDy
   2UGBZ264UCAVJ70RNHu6KJZZtYSiz5HNadDM8ICqa9GwxtxTGZARp0Yug
   uQ/7bZP+Qmr1P5vAJsvgD4GN25kSYNsenB2FQC6FZBI+QofL1BW5YxARo
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="315948717"
X-IronPort-AV: E=Sophos;i="5.97,310,1669104000"; 
   d="scan'208";a="315948717"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2023 00:53:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="739737607"
X-IronPort-AV: E=Sophos;i="5.97,310,1669104000"; 
   d="scan'208";a="739737607"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 19 Feb 2023 00:53:31 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTfRr-000DCL-0F;
	Sun, 19 Feb 2023 08:53:31 +0000
Date: Sun, 19 Feb 2023 16:53:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/base/power/domain.c:2729:7: warning: Branch condition
 evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
Message-ID: <202302191620.kbkdrAli-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/base/power/domain.c:2729:7: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Abel Vesa <abel.vesa@linaro.org>
CC: "Rafael J. Wysocki" <rjw@rjwysocki.net>
CC: Ulf Hansson <ulf.hansson@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   925cf0457d7e62ce08878ffb789189ac08ca8677
commit: ae8ac19655e0cd7ca5ac2f45837d386745aaed7f PM: domains: Reverse the order of performance and enabling ops
date:   3 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 3 months ago
config: arm-randconfig-c002-20230218 (https://download.01.org/0day-ci/archive/20230219/202302191620.kbkdrAli-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ae8ac19655e0cd7ca5ac2f45837d386745aaed7f
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ae8ac19655e0cd7ca5ac2f45837d386745aaed7f
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302191620.kbkdrAli-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
   include/linux/dynamic_debug.h:222:2: note: expanded from macro '__dynamic_func_call_cls'
           if (DYNAMIC_DEBUG_BRANCH(id))                           \
           ^
   drivers/base/power/domain.c:1585:2: note: Loop condition is false.  Exiting loop
           dev_dbg(dev, "%s()\n", __func__);
           ^
   include/linux/dev_printk.h:155:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:272:2: note: expanded from macro 'dynamic_dev_dbg'
           _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
           ^
   include/linux/dynamic_debug.h:249:2: note: expanded from macro '_dynamic_func_call'
           _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:247:2: note: expanded from macro '_dynamic_func_call_cls'
           __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:220:58: note: expanded from macro '__dynamic_func_call_cls'
   #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
                                                            ^
   drivers/base/power/domain.c:1587:6: note: Left side of '||' is false
           if (IS_ERR_OR_NULL(genpd) || IS_ERR_OR_NULL(dev))
               ^
   drivers/base/power/domain.c:1587:2: note: Taking false branch
           if (IS_ERR_OR_NULL(genpd) || IS_ERR_OR_NULL(dev))
           ^
   drivers/base/power/domain.c:1590:13: note: Calling 'genpd_alloc_dev_data'
           gpd_data = genpd_alloc_dev_data(dev, gd);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/power/domain.c:1467:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/base/power/domain.c:1467:2: note: Taking false branch
           if (ret)
           ^
   drivers/base/power/domain.c:1470:13: note: Calling 'kzalloc'
           gpd_data = kzalloc(sizeof(*gpd_data), GFP_KERNEL);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:712:9: note: Uninitialized value stored to field 'td'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/power/domain.c:1470:13: note: Returning from 'kzalloc'
           gpd_data = kzalloc(sizeof(*gpd_data), GFP_KERNEL);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/power/domain.c:1471:6: note: Assuming 'gpd_data' is non-null
           if (!gpd_data) {
               ^~~~~~~~~
   drivers/base/power/domain.c:1471:2: note: Taking false branch
           if (!gpd_data) {
           ^
   drivers/base/power/domain.c:1480:6: note: Assuming 'has_governor' is false
           if (has_governor) {
               ^~~~~~~~~~~~
   drivers/base/power/domain.c:1480:2: note: Taking false branch
           if (has_governor) {
           ^
   drivers/base/power/domain.c:1495:6: note: Assuming field 'domain_data' is null
           if (dev->power.subsys_data->domain_data)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/power/domain.c:1495:2: note: Taking false branch
           if (dev->power.subsys_data->domain_data)
           ^
   drivers/base/power/domain.c:1502:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/base/power/domain.c:1502:2: note: Taking false branch
           if (ret)
           ^
   drivers/base/power/domain.c:1590:13: note: Returning from 'genpd_alloc_dev_data'
           gpd_data = genpd_alloc_dev_data(dev, gd);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/power/domain.c:1591:2: note: Taking false branch
           if (IS_ERR(gpd_data))
           ^
   drivers/base/power/domain.c:1596:8: note: Assuming field 'attach_dev' is non-null
           ret = genpd->attach_dev ? genpd->attach_dev(genpd, dev) : 0;
                 ^~~~~~~~~~~~~~~~~
   drivers/base/power/domain.c:1596:8: note: '?' condition is true
   drivers/base/power/domain.c:1597:6: note: Assuming 'ret' is not equal to 0
           if (ret)
               ^~~
   drivers/base/power/domain.c:1597:2: note: Taking true branch
           if (ret)
           ^
   drivers/base/power/domain.c:1598:3: note: Control jumps to line 1613
                   goto out;
                   ^
   drivers/base/power/domain.c:1613:6: note: 'ret' is not equal to 0
           if (ret)
               ^~~
   drivers/base/power/domain.c:1613:2: note: Taking true branch
           if (ret)
           ^
   drivers/base/power/domain.c:1614:3: note: Calling 'genpd_free_dev_data'
                   genpd_free_dev_data(dev, gpd_data);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/power/domain.c:1524:2: note: 1st function call argument is an uninitialized value
           kfree(gpd_data->td);
           ^     ~~~~~~~~~~~~
>> drivers/base/power/domain.c:2729:7: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
                   if (dev_gpd_data(dev)->default_pstate) {
                       ^
   drivers/base/power/domain.c:2852:6: note: Assuming field 'of_node' is non-null
           if (!dev->of_node)
               ^~~~~~~~~~~~~
   drivers/base/power/domain.c:2852:2: note: Taking false branch
           if (!dev->of_node)
           ^
   drivers/base/power/domain.c:2857:6: note: Assuming 'index' is >= 0
           if (index < 0)
               ^~~~~~~~~
   drivers/base/power/domain.c:2857:2: note: Taking false branch
           if (index < 0)
           ^
   drivers/base/power/domain.c:2860:9: note: Calling 'genpd_dev_pm_attach_by_id'
           return genpd_dev_pm_attach_by_id(dev, index);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/power/domain.c:2800:12: note: Field 'of_node' is non-null
           if (!dev->of_node)
                     ^
   drivers/base/power/domain.c:2800:2: note: Taking false branch
           if (!dev->of_node)
           ^
   drivers/base/power/domain.c:2806:6: note: Assuming 'index' is < 'num_domains'
           if (index >= num_domains)
               ^~~~~~~~~~~~~~~~~~~~
   drivers/base/power/domain.c:2806:2: note: Taking false branch
           if (index >= num_domains)
           ^
   drivers/base/power/domain.c:2811:6: note: Assuming 'virt_dev' is non-null
           if (!virt_dev)
               ^~~~~~~~~
   drivers/base/power/domain.c:2811:2: note: Taking false branch
           if (!virt_dev)
           ^
   drivers/base/power/domain.c:2820:6: note: Assuming 'ret' is 0
           if (ret) {
               ^~~
   drivers/base/power/domain.c:2820:2: note: Taking false branch
           if (ret) {
           ^
   drivers/base/power/domain.c:2826:8: note: Calling '__genpd_dev_pm_attach'
           ret = __genpd_dev_pm_attach(virt_dev, dev, index, false);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/power/domain.c:2685:6: note: Assuming 'ret' is >= 0
           if (ret < 0)
               ^~~~~~~
   drivers/base/power/domain.c:2685:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/base/power/domain.c:2691:2: note: Taking false branch
           if (IS_ERR(pd)) {
           ^
   drivers/base/power/domain.c:2698:2: note: Taking false branch
           dev_dbg(dev, "adding to PM domain %s\n", pd->name);
           ^
   include/linux/dev_printk.h:155:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:272:2: note: expanded from macro 'dynamic_dev_dbg'
           _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
           ^
   include/linux/dynamic_debug.h:249:2: note: expanded from macro '_dynamic_func_call'
           _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
           ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:357:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:345:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:337:3: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/base/power/domain.c:2698:2: note: Loop condition is false.  Exiting loop
           dev_dbg(dev, "adding to PM domain %s\n", pd->name);
           ^
   include/linux/dev_printk.h:155:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:272:2: note: expanded from macro 'dynamic_dev_dbg'
           _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
           ^
   include/linux/dynamic_debug.h:249:2: note: expanded from macro '_dynamic_func_call'
           _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
           ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:357:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:345:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:329:2: note: expanded from macro '__compiletime_assert'
           do {                                                            \
           ^
   drivers/base/power/domain.c:2698:2: note: Taking false branch
           dev_dbg(dev, "adding to PM domain %s\n", pd->name);
           ^

vim +2729 drivers/base/power/domain.c

632f7ce3f9b650 Russell King       2015-03-20  2674  
51dcf7482f4b31 Ulf Hansson        2019-04-25  2675  static int __genpd_dev_pm_attach(struct device *dev, struct device *base_dev,
51dcf7482f4b31 Ulf Hansson        2019-04-25  2676  				 unsigned int index, bool power_on)
aa42240ab2544a Tomasz Figa        2014-09-19  2677  {
aa42240ab2544a Tomasz Figa        2014-09-19  2678  	struct of_phandle_args pd_args;
aa42240ab2544a Tomasz Figa        2014-09-19  2679  	struct generic_pm_domain *pd;
c016baf7dc58e7 Rajendra Nayak     2021-08-12  2680  	int pstate;
aa42240ab2544a Tomasz Figa        2014-09-19  2681  	int ret;
aa42240ab2544a Tomasz Figa        2014-09-19  2682  
e8b04de9da71b5 Ulf Hansson        2019-04-18  2683  	ret = of_parse_phandle_with_args(dev->of_node, "power-domains",
8cb1cbd644d5bb Ulf Hansson        2018-05-31  2684  				"#power-domain-cells", index, &pd_args);
001d50c9a14f1f Geert Uytterhoeven 2017-11-30  2685  	if (ret < 0)
bcd931f298d4a5 Ulf Hansson        2018-05-31  2686  		return ret;
aa42240ab2544a Tomasz Figa        2014-09-19  2687  
19efa5ff63dc5e Jon Hunter         2016-09-12  2688  	mutex_lock(&gpd_list_lock);
f58d4e5ab0ca34 Jon Hunter         2016-09-12  2689  	pd = genpd_get_from_provider(&pd_args);
265e2cf672aaa9 Eric Anholt        2015-12-01  2690  	of_node_put(pd_args.np);
aa42240ab2544a Tomasz Figa        2014-09-19  2691  	if (IS_ERR(pd)) {
19efa5ff63dc5e Jon Hunter         2016-09-12  2692  		mutex_unlock(&gpd_list_lock);
aa42240ab2544a Tomasz Figa        2014-09-19  2693  		dev_dbg(dev, "%s() failed to find PM domain: %ld\n",
aa42240ab2544a Tomasz Figa        2014-09-19  2694  			__func__, PTR_ERR(pd));
e20813dcdc05aa Saravana Kannan    2022-08-19  2695  		return driver_deferred_probe_check_state(base_dev);
aa42240ab2544a Tomasz Figa        2014-09-19  2696  	}
aa42240ab2544a Tomasz Figa        2014-09-19  2697  
aa42240ab2544a Tomasz Figa        2014-09-19  2698  	dev_dbg(dev, "adding to PM domain %s\n", pd->name);
aa42240ab2544a Tomasz Figa        2014-09-19  2699  
f9ccd7c3a1d87c Ulf Hansson        2019-04-25  2700  	ret = genpd_add_device(pd, dev, base_dev);
19efa5ff63dc5e Jon Hunter         2016-09-12  2701  	mutex_unlock(&gpd_list_lock);
aa42240ab2544a Tomasz Figa        2014-09-19  2702  
9a6582b839281e Ahmad Fatoum       2022-02-23  2703  	if (ret < 0)
9a6582b839281e Ahmad Fatoum       2022-02-23  2704  		return dev_err_probe(dev, ret, "failed to add to PM domain %s\n", pd->name);
aa42240ab2544a Tomasz Figa        2014-09-19  2705  
aa42240ab2544a Tomasz Figa        2014-09-19  2706  	dev->pm_domain->detach = genpd_dev_pm_detach;
632f7ce3f9b650 Russell King       2015-03-20  2707  	dev->pm_domain->sync = genpd_dev_pm_sync;
aa42240ab2544a Tomasz Figa        2014-09-19  2708  
c016baf7dc58e7 Rajendra Nayak     2021-08-12  2709  	/* Set the default performance state */
c016baf7dc58e7 Rajendra Nayak     2021-08-12  2710  	pstate = of_get_required_opp_performance_state(dev->of_node, index);
656164181eece6 Geert Uytterhoeven 2021-08-24  2711  	if (pstate < 0 && pstate != -ENODEV && pstate != -EOPNOTSUPP) {
c016baf7dc58e7 Rajendra Nayak     2021-08-12  2712  		ret = pstate;
c016baf7dc58e7 Rajendra Nayak     2021-08-12  2713  		goto err;
c016baf7dc58e7 Rajendra Nayak     2021-08-12  2714  	} else if (pstate > 0) {
c016baf7dc58e7 Rajendra Nayak     2021-08-12  2715  		ret = dev_pm_genpd_set_performance_state(dev, pstate);
c016baf7dc58e7 Rajendra Nayak     2021-08-12  2716  		if (ret)
c016baf7dc58e7 Rajendra Nayak     2021-08-12  2717  			goto err;
c016baf7dc58e7 Rajendra Nayak     2021-08-12  2718  		dev_gpd_data(dev)->default_pstate = pstate;
c016baf7dc58e7 Rajendra Nayak     2021-08-12  2719  	}
ae8ac19655e0cd Abel Vesa          2022-11-15  2720  
ae8ac19655e0cd Abel Vesa          2022-11-15  2721  	if (power_on) {
ae8ac19655e0cd Abel Vesa          2022-11-15  2722  		genpd_lock(pd);
ae8ac19655e0cd Abel Vesa          2022-11-15  2723  		ret = genpd_power_on(pd, 0);
ae8ac19655e0cd Abel Vesa          2022-11-15  2724  		genpd_unlock(pd);
ae8ac19655e0cd Abel Vesa          2022-11-15  2725  	}
ae8ac19655e0cd Abel Vesa          2022-11-15  2726  
ae8ac19655e0cd Abel Vesa          2022-11-15  2727  	if (ret) {
ae8ac19655e0cd Abel Vesa          2022-11-15  2728  		/* Drop the default performance state */
ae8ac19655e0cd Abel Vesa          2022-11-15 @2729  		if (dev_gpd_data(dev)->default_pstate) {
ae8ac19655e0cd Abel Vesa          2022-11-15  2730  			dev_pm_genpd_set_performance_state(dev, 0);
ae8ac19655e0cd Abel Vesa          2022-11-15  2731  			dev_gpd_data(dev)->default_pstate = 0;
ae8ac19655e0cd Abel Vesa          2022-11-15  2732  		}
ae8ac19655e0cd Abel Vesa          2022-11-15  2733  
ae8ac19655e0cd Abel Vesa          2022-11-15  2734  		genpd_remove_device(pd, dev);
ae8ac19655e0cd Abel Vesa          2022-11-15  2735  		return -EPROBE_DEFER;
ae8ac19655e0cd Abel Vesa          2022-11-15  2736  	}
ae8ac19655e0cd Abel Vesa          2022-11-15  2737  
c016baf7dc58e7 Rajendra Nayak     2021-08-12  2738  	return 1;
c016baf7dc58e7 Rajendra Nayak     2021-08-12  2739  
c016baf7dc58e7 Rajendra Nayak     2021-08-12  2740  err:
c016baf7dc58e7 Rajendra Nayak     2021-08-12  2741  	dev_err(dev, "failed to set required performance state for power-domain %s: %d\n",
c016baf7dc58e7 Rajendra Nayak     2021-08-12  2742  		pd->name, ret);
c016baf7dc58e7 Rajendra Nayak     2021-08-12  2743  	genpd_remove_device(pd, dev);
c016baf7dc58e7 Rajendra Nayak     2021-08-12  2744  	return ret;
aa42240ab2544a Tomasz Figa        2014-09-19  2745  }
8cb1cbd644d5bb Ulf Hansson        2018-05-31  2746  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
