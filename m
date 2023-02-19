Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CD47FA
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Feb 2023 06:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676786910; x=1708322910;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tudkUbazVaUhhLsm7mo2sdUUXAFs2uxlPB6RUawUoLY=;
  b=Uft1G4Ama8gkXSDslgbNpHt8CSC9jfvyZ+3QRecj62JlUTr2wfcFFJCM
   4gVf1scR4iO1YMF4ScwHkxSjJhNdHjpYKh7xCM/D5Ti9wPTNOpXxtjjfd
   yrnxuwtAoJVq+SX2+xu0AmEXn6fzpAcno+nh98DWPlMlCbUCMGmvTqxqd
   KU6ys/0eWMXYi9AbC6OF4i8f9x0P7r44NKqqollDDAK9OJgccov59XWbe
   dxg2xB0hc6rMsroQqVqqe1NJud04ooR6Mz0uB0wYTHRwYkzZrxnMosxUY
   QJhLzcusFYC7YM6TXzi/rz/LDfQ5eIEFvkvrAsA0hSVhs9KF5MPYDtFY1
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="315940552"
X-IronPort-AV: E=Sophos;i="5.97,309,1669104000"; 
   d="scan'208";a="315940552"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2023 22:08:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="844993249"
X-IronPort-AV: E=Sophos;i="5.97,309,1669104000"; 
   d="scan'208";a="844993249"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 18 Feb 2023 22:08:27 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTcs7-000D61-0s;
	Sun, 19 Feb 2023 06:08:27 +0000
Date: Sun, 19 Feb 2023 14:08:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/arm64/kernel/acpi.c:443 acpi_ffh_address_space_arch_setup()
 warn: possible memory leak of 'ffh_ctxt'
Message-ID: <202302191417.dAl9NuE8-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: "Rafael J. Wysocki" <rjw@rjwysocki.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   925cf0457d7e62ce08878ffb789189ac08ca8677
commit: 45494d77f279d0420f06376dcf105b23e300c5a4 Merge branches 'acpi-scan', 'acpi-bus', 'acpi-tables' and 'acpi-sysfs'
date:   10 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 10 weeks ago
config: arm64-randconfig-m031-20230219 (https://download.01.org/0day-ci/archive/20230219/202302191417.dAl9NuE8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302191417.dAl9NuE8-lkp@intel.com/

New smatch warnings:
arch/arm64/kernel/acpi.c:443 acpi_ffh_address_space_arch_setup() warn: possible memory leak of 'ffh_ctxt'

Old smatch warnings:
arch/arm64/kernel/acpi.c:448 acpi_ffh_address_space_arch_setup() warn: possible memory leak of 'ffh_ctxt'

vim +/ffh_ctxt +443 arch/arm64/kernel/acpi.c

1d280ce099db39 Sudeep Holla 2022-11-10  432  
1d280ce099db39 Sudeep Holla 2022-11-10  433  int acpi_ffh_address_space_arch_setup(void *handler_ctxt, void **region_ctxt)
1d280ce099db39 Sudeep Holla 2022-11-10  434  {
1d280ce099db39 Sudeep Holla 2022-11-10  435  	enum arm_smccc_conduit conduit;
1d280ce099db39 Sudeep Holla 2022-11-10  436  	struct acpi_ffh_data *ffh_ctxt;
1d280ce099db39 Sudeep Holla 2022-11-10  437  
1d280ce099db39 Sudeep Holla 2022-11-10  438  	ffh_ctxt = kzalloc(sizeof(*ffh_ctxt), GFP_KERNEL);
1d280ce099db39 Sudeep Holla 2022-11-10  439  	if (!ffh_ctxt)
1d280ce099db39 Sudeep Holla 2022-11-10  440  		return -ENOMEM;
1d280ce099db39 Sudeep Holla 2022-11-10  441  
1d280ce099db39 Sudeep Holla 2022-11-10  442  	if (arm_smccc_get_version() < ARM_SMCCC_VERSION_1_2)
1d280ce099db39 Sudeep Holla 2022-11-10 @443  		return -EOPNOTSUPP;
1d280ce099db39 Sudeep Holla 2022-11-10  444  
1d280ce099db39 Sudeep Holla 2022-11-10  445  	conduit = arm_smccc_1_1_get_conduit();
1d280ce099db39 Sudeep Holla 2022-11-10  446  	if (conduit == SMCCC_CONDUIT_NONE) {
1d280ce099db39 Sudeep Holla 2022-11-10  447  		pr_err("%s: invalid SMCCC conduit\n", __func__);
1d280ce099db39 Sudeep Holla 2022-11-10  448  		return -EOPNOTSUPP;
1d280ce099db39 Sudeep Holla 2022-11-10  449  	}
1d280ce099db39 Sudeep Holla 2022-11-10  450  
1d280ce099db39 Sudeep Holla 2022-11-10  451  	if (conduit == SMCCC_CONDUIT_SMC) {
1d280ce099db39 Sudeep Holla 2022-11-10  452  		ffh_ctxt->invoke_ffh_fn = __arm_smccc_smc;
1d280ce099db39 Sudeep Holla 2022-11-10  453  		ffh_ctxt->invoke_ffh64_fn = arm_smccc_1_2_smc;
1d280ce099db39 Sudeep Holla 2022-11-10  454  	} else {
1d280ce099db39 Sudeep Holla 2022-11-10  455  		ffh_ctxt->invoke_ffh_fn = __arm_smccc_hvc;
1d280ce099db39 Sudeep Holla 2022-11-10  456  		ffh_ctxt->invoke_ffh64_fn = arm_smccc_1_2_hvc;
1d280ce099db39 Sudeep Holla 2022-11-10  457  	}
1d280ce099db39 Sudeep Holla 2022-11-10  458  
1d280ce099db39 Sudeep Holla 2022-11-10  459  	memcpy(ffh_ctxt, handler_ctxt, sizeof(ffh_ctxt->info));
1d280ce099db39 Sudeep Holla 2022-11-10  460  
1d280ce099db39 Sudeep Holla 2022-11-10  461  	*region_ctxt = ffh_ctxt;
1d280ce099db39 Sudeep Holla 2022-11-10  462  	return AE_OK;
1d280ce099db39 Sudeep Holla 2022-11-10  463  }
1d280ce099db39 Sudeep Holla 2022-11-10  464  

:::::: The code at line 443 was first introduced by commit
:::::: 1d280ce099db396e092cac1aa9bf2ea8beee6d76 arm64: Add architecture specific ACPI FFH Opregion callbacks

:::::: TO: Sudeep Holla <sudeep.holla@arm.com>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
