Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19C3482D1
	for <oe-kbuild@lists.linux.dev>; Wed, 20 Dec 2023 18:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AbUu5K1z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703096528; x=1734632528;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YrErcvvzB3ABH2sCr299nrojZ0K01drOsOKlhqSYKeU=;
  b=AbUu5K1zH1uJpcUKYkrhHBpEgoxLvJiQ10Up3CZvqXSGSsv+fbel5QgU
   yTM7StKQ6yDkg0tbAd1DMsvXpep6XD+q0PtY4fLNjLSJEQNl5asyFCx5m
   ugMivyRUJaD3+9hbsfYmNqHQGa51+sEfGDxGksumCcFVrrrBd4rgLhwC0
   dfrVS5e4QIkRD0QEX0xvS3AClUtOz07pex9dvFCIOr9nO3rMnB84Z5HUC
   Pj/a5W+QD8Afu6uE+TMtI3h9uA04IdcZYMsqACHgxhX/rcjCs/V/zvgIe
   osOeWGMvghbNxZfeBifcxtRaLLnD9dFdDQDLeudtCA+yOtIXBC9Eo1XX+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="462303375"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="462303375"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 10:22:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="24659465"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 20 Dec 2023 10:22:07 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rG1Cm-0007KB-1Z;
	Wed, 20 Dec 2023 18:22:04 +0000
Date: Thu, 21 Dec 2023 02:21:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/2] PM: domains: Move genpd and its governor to the
 pmdomain subsystem
Message-ID: <202312210228.bcE94X2N-lkp@intel.com>
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
In-Reply-To: <20231213113305.29098-1-ulf.hansson@linaro.org>
References: <20231213113305.29098-1-ulf.hansson@linaro.org>
TO: Ulf Hansson <ulf.hansson@linaro.org>

Hi Ulf,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on rafael-pm/acpi-bus linus/master v6.7-rc6]
[cannot apply to rafael-pm/devprop next-20231220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ulf-Hansson/PM-domains-Move-genpd-and-its-governor-to-the-pmdomain-subsystem/20231213-193436
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20231213113305.29098-1-ulf.hansson%40linaro.org
patch subject: [PATCH 2/2] PM: domains: Move genpd and its governor to the pmdomain subsystem
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: powerpc64-randconfig-r071-20231220 (https://download.01.org/0day-ci/archive/20231221/202312210228.bcE94X2N-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312210228.bcE94X2N-lkp@intel.com/

smatch warnings:
drivers/pmdomain/core.c:427 genpd_dev_pm_set_performance_state() error: 'genpd' dereferencing possible ERR_PTR()
drivers/pmdomain/core.c:822 genpd_dev_pm_start() error: 'genpd' dereferencing possible ERR_PTR()

vim +/genpd +427 drivers/pmdomain/core.c

5937c3ce21228d drivers/base/power/domain.c Ulf Hansson 2021-06-03  420  
401e09201a0118 drivers/base/power/domain.c Ulf Hansson 2023-09-25  421  static int genpd_dev_pm_set_performance_state(struct device *dev,
401e09201a0118 drivers/base/power/domain.c Ulf Hansson 2023-09-25  422  					      unsigned int state)
401e09201a0118 drivers/base/power/domain.c Ulf Hansson 2023-09-25  423  {
401e09201a0118 drivers/base/power/domain.c Ulf Hansson 2023-09-25  424  	struct generic_pm_domain *genpd = dev_to_genpd(dev);
401e09201a0118 drivers/base/power/domain.c Ulf Hansson 2023-09-25  425  	int ret = 0;
401e09201a0118 drivers/base/power/domain.c Ulf Hansson 2023-09-25  426  
401e09201a0118 drivers/base/power/domain.c Ulf Hansson 2023-09-25 @427  	genpd_lock(genpd);
401e09201a0118 drivers/base/power/domain.c Ulf Hansson 2023-09-25  428  	if (pm_runtime_suspended(dev)) {
401e09201a0118 drivers/base/power/domain.c Ulf Hansson 2023-09-25  429  		dev_gpd_data(dev)->rpm_pstate = state;
401e09201a0118 drivers/base/power/domain.c Ulf Hansson 2023-09-25  430  	} else {
401e09201a0118 drivers/base/power/domain.c Ulf Hansson 2023-09-25  431  		ret = genpd_set_performance_state(dev, state);
401e09201a0118 drivers/base/power/domain.c Ulf Hansson 2023-09-25  432  		if (!ret)
401e09201a0118 drivers/base/power/domain.c Ulf Hansson 2023-09-25  433  			dev_gpd_data(dev)->rpm_pstate = 0;
401e09201a0118 drivers/base/power/domain.c Ulf Hansson 2023-09-25  434  	}
401e09201a0118 drivers/base/power/domain.c Ulf Hansson 2023-09-25  435  	genpd_unlock(genpd);
401e09201a0118 drivers/base/power/domain.c Ulf Hansson 2023-09-25  436  
401e09201a0118 drivers/base/power/domain.c Ulf Hansson 2023-09-25  437  	return ret;
401e09201a0118 drivers/base/power/domain.c Ulf Hansson 2023-09-25  438  }
401e09201a0118 drivers/base/power/domain.c Ulf Hansson 2023-09-25  439  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
