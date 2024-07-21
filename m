Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B651662FE
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Jul 2024 15:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721577346; cv=none; b=mrWpwmvygRTLqxVhHmLsQOexQwRSftzdYUriExQNawjQk+hp+hJwFeyWAxlGyiUplMuYCTm+zNkNS2WFCMrAvY9Qd74adOguvR0uecABVM9CjiV8B6vtA+Cy9u42AfSqCCETymdFIuUmN8PrW3mD19+AFDcze8k4mWdzEZVn+b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721577346; c=relaxed/simple;
	bh=yrPIYJDIAe6D5PtkXBwCqozYQlf4iNgLHVa59r0XKTk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a9KNSbUjbovvwM2LB/qYtwj3749l8e9aX3UoE0AqgtaVqB+PmY3U8VG9XrYicmaNFc+HiN1B3/M3bI5mNAltkslMHjNr7haLTrBhXiSJIU3/CrJVCxtiRtOwQaGNgJvSJILHnoFk7TimV5YJbJdfNW5EYWUDGFGvVGIFttO6wLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WTvfH9XG; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WTvfH9XG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721577344; x=1753113344;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yrPIYJDIAe6D5PtkXBwCqozYQlf4iNgLHVa59r0XKTk=;
  b=WTvfH9XG+o5KlHP00roxp4/MmH3KthMAsi0m2X9bYssKToaXbEOoaPEb
   HcMVg9L6et67NeJZpkDmAVb8Y2PtnTV53Z2EberUYvDO6ZaNnsGZK0Q0M
   4pxrJpcJMhJEJbf2mTsO5dGcFKfnTqZdOOWTYtHqT2M97S67XyjmOH/Y0
   k514TTu1HymdT5MxFSypB/8o8xBdh5+DyCR+HEhZdzoz5rqFDHBiSrskL
   Xz+OvImCcybof6LrMfnHumosYqNnpBpby0JylBvdxS1Zr5cmtKCGs803x
   VGoi06hWAfHRDiOyIbvd5zbif4A3tZHqmua655+9WWspG0RuCuVIs3u6E
   g==;
X-CSE-ConnectionGUID: IQYwnt+fQH+f1MGSPyT0mA==
X-CSE-MsgGUID: z/a23EBeTqG+8TXqc6QEzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="23008043"
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="23008043"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2024 08:55:44 -0700
X-CSE-ConnectionGUID: Pf2bcC9+SPGF/NLtEc69wg==
X-CSE-MsgGUID: O1AW1HcfTSSO3dy8cPaoZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="55901829"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 21 Jul 2024 08:55:43 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVYuS-000kMk-2Q;
	Sun, 21 Jul 2024 15:55:40 +0000
Date: Sun, 21 Jul 2024 23:55:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 4/6] OPP/pmdomain: Set the required_dev for a required
 OPP during genpd attach
Message-ID: <202407212334.w0O7cX3u-lkp@intel.com>
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
In-Reply-To: <20240718234319.356451-5-ulf.hansson@linaro.org>
References: <20240718234319.356451-5-ulf.hansson@linaro.org>
TO: Ulf Hansson <ulf.hansson@linaro.org>
TO: Viresh Kumar <vireshk@kernel.org>
TO: Nishanth Menon <nm@ti.com>
TO: Stephen Boyd <sboyd@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@linaro.org>
CC: Nikunj Kela <nkela@quicinc.com>
CC: Prasad Sodagudi <psodagud@quicinc.com>
CC: Thierry Reding <thierry.reding@gmail.com>
CC: Jonathan Hunter <jonathanh@nvidia.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>
CC: linux-pm@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org

Hi Ulf,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on rafael-pm/bleeding-edge linus/master next-20240719]
[cannot apply to v6.10]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ulf-Hansson/OPP-Fix-support-for-required-OPPs-for-multiple-PM-domains/20240719-074630
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20240718234319.356451-5-ulf.hansson%40linaro.org
patch subject: [PATCH v2 4/6] OPP/pmdomain: Set the required_dev for a required OPP during genpd attach
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: powerpc64-randconfig-r081-20240721 (https://download.01.org/0day-ci/archive/20240721/202407212334.w0O7cX3u-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202407212334.w0O7cX3u-lkp@intel.com/

New smatch warnings:
drivers/pmdomain/core.c:2878 genpd_set_required_opp_dev() error: 'genpd' dereferencing possible ERR_PTR()

Old smatch warnings:
drivers/pmdomain/core.c:467 genpd_dev_pm_set_performance_state() error: 'genpd' dereferencing possible ERR_PTR()
drivers/pmdomain/core.c:924 genpd_dev_pm_start() error: 'genpd' dereferencing possible ERR_PTR()

vim +/genpd +2878 drivers/pmdomain/core.c

4f14bffcf029b0 Ulf Hansson 2024-07-19  2863  
4f14bffcf029b0 Ulf Hansson 2024-07-19  2864  static int genpd_set_required_opp_dev(struct device *dev,
4f14bffcf029b0 Ulf Hansson 2024-07-19  2865  				      struct device *base_dev)
4f14bffcf029b0 Ulf Hansson 2024-07-19  2866  {
4f14bffcf029b0 Ulf Hansson 2024-07-19  2867  	struct generic_pm_domain *genpd = dev_to_genpd(dev);
4f14bffcf029b0 Ulf Hansson 2024-07-19  2868  	struct opp_table *opp_table;
4f14bffcf029b0 Ulf Hansson 2024-07-19  2869  	int ret = 0;
4f14bffcf029b0 Ulf Hansson 2024-07-19  2870  
4f14bffcf029b0 Ulf Hansson 2024-07-19  2871  	/* Limit support to non-providers for now. */
4f14bffcf029b0 Ulf Hansson 2024-07-19  2872  	if (of_property_present(base_dev->of_node, "#power-domain-cells"))
4f14bffcf029b0 Ulf Hansson 2024-07-19  2873  		return 0;
4f14bffcf029b0 Ulf Hansson 2024-07-19  2874  
4f14bffcf029b0 Ulf Hansson 2024-07-19  2875  	if (!dev_pm_opp_of_has_required_opp(base_dev))
4f14bffcf029b0 Ulf Hansson 2024-07-19  2876  		return 0;
4f14bffcf029b0 Ulf Hansson 2024-07-19  2877  
4f14bffcf029b0 Ulf Hansson 2024-07-19 @2878  	genpd_lock(genpd);
4f14bffcf029b0 Ulf Hansson 2024-07-19  2879  	opp_table = genpd_find_opp_table(genpd, 0);
4f14bffcf029b0 Ulf Hansson 2024-07-19  2880  	genpd_unlock(genpd);
4f14bffcf029b0 Ulf Hansson 2024-07-19  2881  
4f14bffcf029b0 Ulf Hansson 2024-07-19  2882  	if (opp_table) {
4f14bffcf029b0 Ulf Hansson 2024-07-19  2883  		struct dev_pm_opp_config config = {
4f14bffcf029b0 Ulf Hansson 2024-07-19  2884  			.required_dev = dev,
4f14bffcf029b0 Ulf Hansson 2024-07-19  2885  			.required_opp_table = opp_table,
4f14bffcf029b0 Ulf Hansson 2024-07-19  2886  		};
4f14bffcf029b0 Ulf Hansson 2024-07-19  2887  
4f14bffcf029b0 Ulf Hansson 2024-07-19  2888  		ret = devm_pm_opp_set_config(base_dev, &config);
4f14bffcf029b0 Ulf Hansson 2024-07-19  2889  		if (ret < 0)
4f14bffcf029b0 Ulf Hansson 2024-07-19  2890  			dev_err(dev, "failed to set opp config %d\n", ret);
4f14bffcf029b0 Ulf Hansson 2024-07-19  2891  	}
4f14bffcf029b0 Ulf Hansson 2024-07-19  2892  
4f14bffcf029b0 Ulf Hansson 2024-07-19  2893  	return ret;
4f14bffcf029b0 Ulf Hansson 2024-07-19  2894  }
4f14bffcf029b0 Ulf Hansson 2024-07-19  2895  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
