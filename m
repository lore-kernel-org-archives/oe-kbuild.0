Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C08439FEB
	for <oe-kbuild@lists.linux.dev>; Wed, 31 Jan 2024 22:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706740716; cv=none; b=QwqJ+J2XKZQzCdBdyNFJ7Y6H6N/9/amBpp5/j3wp2MWzngByhGmqVaA1KnzS4RN6AxuWDlTz+pSikp/07DqSDxOvIy9f53S8dalO+xyduZayf6GbLI7HT0h8qzu1I+UM8rx0X9ePVBE4nrF8b+OOAYh5hw3ZYyyuB+A4YuQ5pi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706740716; c=relaxed/simple;
	bh=EyjoucuFmcZH0s2HD38LJgHeWktVtNq7hFqAR6xysKY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jmHq3Cop8X9GBWbUpPo6WjoMYaSsLpvuij9+xTzM55CseGtSGi6GPm10xT9u5Q2BcaggEi6l4RthPhkkg2LMyFalTkXXwHEecjB/9j00tSZwNCAYykh9gklObAo1lMwkW8IgE1OXSwG2EQXa/hbBnlFGZaaThWqVoc2iIcf4Xyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XuSDjD6D; arc=none smtp.client-ip=134.134.136.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XuSDjD6D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706740714; x=1738276714;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EyjoucuFmcZH0s2HD38LJgHeWktVtNq7hFqAR6xysKY=;
  b=XuSDjD6DaaPQPv2QsJlKXIJiX+/kSIhE1FoQAIMQ7kiF8pRFm2Wjq4iU
   EAun/82thyNG+VgnEsicX/js2nVpyzAa1jY0W1QYoXv4+/cNkXsqJ510x
   eKT5yFiXoVCvg5FQeOs2OEpLllDd8uksivgMldiGNu1NhT44lQDhXe9z/
   9LFXwGvSLryDTWnOv1ZW/L9MXLZklbw2T/7chXUY1VLzPJZ2FBtTVEIxq
   7y/5cPmiHNfivccn+ztZjPPuMhyzdMQjMgR5Px/h0QDFsvHT//zEdRORM
   k4U7LTBJlg44fadkwms6/xgNPOfFQTl/u53n1NNjFrq9cFVTiE/WqCnSw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="407462356"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="407462356"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 14:38:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="4229968"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 31 Jan 2024 14:38:32 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVJDy-00026W-0a;
	Wed, 31 Jan 2024 22:38:30 +0000
Date: Thu, 1 Feb 2024 06:37:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [openeuler:OLK-6.6 2868/2894] kernel/cgroup/misc.c:328:4: warning:
 array subscript 0 is above array bounds of 'const char * const[0]'
Message-ID: <202402010637.VBx6C2kx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: kernel/cgroup/misc.c:328:4: warning: array subscript 0 is above array bounds of 'const char * const[0]' [-Warray-bounds]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: kernel@openeuler.org
TO: yanhaitao <yanhaitao2@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   f6f9abf1a5ef2fc559630c77b3570346dcd19d40
commit: c9c3c6a65afb88bd6c5b15722c4683711b1f0291 [2868/2894] cgroup/misc: reserve kabi for future misc development
:::::: branch date: 13 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-121-20240131 (https://download.01.org/0day-ci/archive/20240201/202402010637.VBx6C2kx-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240201/202402010637.VBx6C2kx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202402010637.VBx6C2kx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/cgroup/misc.c: In function 'misc_cg_capacity_show':
>> kernel/cgroup/misc.c:328:4: warning: array subscript 0 is above array bounds of 'const char * const[0]' [-Warray-bounds]
     328 |    seq_printf(sf, "%s %llu\n", misc_res_name[i], cap);
         |    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/cgroup/misc.c:328:4: warning: array subscript 0 is above array bounds of 'const char * const[0]' [-Warray-bounds]
   kernel/cgroup/misc.c:20:26: note: while referencing 'misc_res_name'
      20 | static const char *const misc_res_name[] = {
         |                          ^~~~~~~~~~~~~
   kernel/cgroup/misc.c: In function 'misc_events_show':
   kernel/cgroup/misc.c:343:4: warning: array subscript 0 is above array bounds of 'const char * const[0]' [-Warray-bounds]
     343 |    seq_printf(sf, "%s.max %llu\n", misc_res_name[i], events);
         |    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/misc.c:343:4: warning: array subscript 0 is above array bounds of 'const char * const[0]' [-Warray-bounds]
   kernel/cgroup/misc.c:20:26: note: while referencing 'misc_res_name'
      20 | static const char *const misc_res_name[] = {
         |                          ^~~~~~~~~~~~~
   kernel/cgroup/misc.c: In function 'misc_cg_current_show':
   kernel/cgroup/misc.c:304:4: warning: array subscript 0 is above array bounds of 'const char * const[0]' [-Warray-bounds]
     304 |    seq_printf(sf, "%s %llu\n", misc_res_name[i], usage);
         |    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/misc.c:304:4: warning: array subscript 0 is above array bounds of 'const char * const[0]' [-Warray-bounds]
   kernel/cgroup/misc.c:20:26: note: while referencing 'misc_res_name'
      20 | static const char *const misc_res_name[] = {
         |                          ^~~~~~~~~~~~~
   kernel/cgroup/misc.c: In function 'misc_cg_max_show':
   kernel/cgroup/misc.c:218:5: warning: array subscript 0 is above array bounds of 'const char * const[0]' [-Warray-bounds]
     218 |     seq_printf(sf, "%s %llu\n", misc_res_name[i],
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     219 |         max);
         |         ~~~~
   kernel/cgroup/misc.c:218:5: warning: array subscript 0 is above array bounds of 'const char * const[0]' [-Warray-bounds]
   kernel/cgroup/misc.c:20:26: note: while referencing 'misc_res_name'
      20 | static const char *const misc_res_name[] = {
         |                          ^~~~~~~~~~~~~
   kernel/cgroup/misc.c:216:5: warning: array subscript 0 is above array bounds of 'const char * const[0]' [-Warray-bounds]
     216 |     seq_printf(sf, "%s max\n", misc_res_name[i]);
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/misc.c:216:5: warning: array subscript 0 is above array bounds of 'const char * const[0]' [-Warray-bounds]
   kernel/cgroup/misc.c:20:26: note: while referencing 'misc_res_name'
      20 | static const char *const misc_res_name[] = {
         |                          ^~~~~~~~~~~~~
   kernel/cgroup/misc.c: In function 'misc_cg_max_write':
   kernel/cgroup/misc.c:260:8: warning: array subscript 0 is above array bounds of 'const char * const[0]' [-Warray-bounds]
     260 |   if (!strcmp(misc_res_name[i], token)) {
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/misc.c:260:8: warning: array subscript 0 is above array bounds of 'const char * const[0]' [-Warray-bounds]
   kernel/cgroup/misc.c:20:26: note: while referencing 'misc_res_name'
      20 | static const char *const misc_res_name[] = {
         |                          ^~~~~~~~~~~~~
   In file included from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from include/linux/jump_label.h:259,
                    from include/linux/static_key.h:1,
                    from arch/x86/include/asm/nospec-branch.h:6,
                    from arch/x86/include/asm/irqflags.h:9,
                    from include/linux/irqflags.h:17,
                    from include/linux/rcupdate.h:26,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/cgroup.h:12,
                    from kernel/cgroup/misc.c:10:
   kernel/cgroup/misc.c: In function 'misc_cg_cancel_charge':
>> include/asm-generic/bug.h:106:3: warning: array subscript 0 is above array bounds of 'const char * const[0]' [-Warray-bounds]
     106 |   __warn_printk(arg);     \
         |   ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:134:3: note: in expansion of macro '__WARN_printf'
     134 |   __WARN_printf(TAINT_WARN, format);   \
         |   ^~~~~~~~~~~~~
   include/linux/once_lite.h:31:4: note: in expansion of macro 'WARN'
      31 |    func(__VA_ARGS__);    \
         |    ^~~~
   include/asm-generic/bug.h:152:2: note: in expansion of macro 'DO_ONCE_LITE_IF'
     152 |  DO_ONCE_LITE_IF(condition, WARN, 1, format)
         |  ^~~~~~~~~~~~~~~
   kernel/cgroup/misc.c:119:2: note: in expansion of macro 'WARN_ONCE'
     119 |  WARN_ONCE(atomic64_add_negative(-amount, &cg->res[type].usage),
         |  ^~~~~~~~~
   kernel/cgroup/misc.c:20:26: note: while referencing 'misc_res_name'
      20 | static const char *const misc_res_name[] = {
         |                          ^~~~~~~~~~~~~


vim +328 kernel/cgroup/misc.c

a72232eabdfcfe Vipin Sharma 2021-03-29  309  
a72232eabdfcfe Vipin Sharma 2021-03-29  310  /**
a72232eabdfcfe Vipin Sharma 2021-03-29  311   * misc_cg_capacity_show() - Show the total capacity of misc res on the host.
a72232eabdfcfe Vipin Sharma 2021-03-29  312   * @sf: Interface file
a72232eabdfcfe Vipin Sharma 2021-03-29  313   * @v: Arguments passed
a72232eabdfcfe Vipin Sharma 2021-03-29  314   *
a72232eabdfcfe Vipin Sharma 2021-03-29  315   * Only present in the root cgroup directory.
a72232eabdfcfe Vipin Sharma 2021-03-29  316   *
a72232eabdfcfe Vipin Sharma 2021-03-29  317   * Context: Any context.
a72232eabdfcfe Vipin Sharma 2021-03-29  318   * Return: 0 to denote successful print.
a72232eabdfcfe Vipin Sharma 2021-03-29  319   */
a72232eabdfcfe Vipin Sharma 2021-03-29  320  static int misc_cg_capacity_show(struct seq_file *sf, void *v)
a72232eabdfcfe Vipin Sharma 2021-03-29  321  {
a72232eabdfcfe Vipin Sharma 2021-03-29  322  	int i;
32bf85c60ca358 Haitao Huang 2023-07-17  323  	u64 cap;
a72232eabdfcfe Vipin Sharma 2021-03-29  324  
a72232eabdfcfe Vipin Sharma 2021-03-29  325  	for (i = 0; i < MISC_CG_RES_TYPES; i++) {
a72232eabdfcfe Vipin Sharma 2021-03-29  326  		cap = READ_ONCE(misc_res_capacity[i]);
a72232eabdfcfe Vipin Sharma 2021-03-29  327  		if (cap)
32bf85c60ca358 Haitao Huang 2023-07-17 @328  			seq_printf(sf, "%s %llu\n", misc_res_name[i], cap);
a72232eabdfcfe Vipin Sharma 2021-03-29  329  	}
a72232eabdfcfe Vipin Sharma 2021-03-29  330  
a72232eabdfcfe Vipin Sharma 2021-03-29  331  	return 0;
a72232eabdfcfe Vipin Sharma 2021-03-29  332  }
a72232eabdfcfe Vipin Sharma 2021-03-29  333  

:::::: The code at line 328 was first introduced by commit
:::::: 32bf85c60ca3584a7ba3bef19da2779b73b2e7d6 cgroup/misc: Change counters to be explicit 64bit types

:::::: TO: Haitao Huang <haitao.huang@linux.intel.com>
:::::: CC: Tejun Heo <tj@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
