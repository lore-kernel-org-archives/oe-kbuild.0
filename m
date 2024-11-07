Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993D2217F5B
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Nov 2024 20:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731012215; cv=none; b=ErO/F1xAyvGEZv4T2XIAnfrT2Ja+5AtsF0ntYfmqY3JNA64TZ4GLpVtK52iEhJWU1HWacW6VkFP5MnNoRMBSqTbDUVYY2voOmbJ2Txhdv2yq6Db0H2luKx6JdB8QD6iz2x03zUAC4gaSIjPZgLc9gPWu1vkjjquTHsgURdV7/Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731012215; c=relaxed/simple;
	bh=5cYyQm7bINGHgaD3lPLBJm8gy6GuacFYXvAfkAjRjiE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P2uQV3bO0cAM0rHbJXtVsv/2jl4KyW3nfz6egvFl6kXs0HUQDGFoGoCqv32MHwyLywW0pnRYhCCfDbxBMgzh1znOQ2h9dZfpibVNEIVWwYC/Jdv6IOMczDyD+KvIL5A1endkHxe4kowgk0rDw4EjU5e13XZ/2XPCg8+gR8zuOKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OuaGFeQT; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OuaGFeQT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731012214; x=1762548214;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5cYyQm7bINGHgaD3lPLBJm8gy6GuacFYXvAfkAjRjiE=;
  b=OuaGFeQTuGNc7CvrP2uQSQGE+R5+upseEgmMnwmnhmVBdL6o0h+5MSu5
   nSqPItDrGwUUvBzZFkyIFIb+ZO7uGzU3OllnTSDwuwoK4x5gmDzG/kDFy
   /5z+i377nLe/M+0iFaizdqWOutuwBAZe/IJHDDRPoqE/P5LQu+SwOpn2c
   n1Q0q/oZUuXzeq8IqgF5dPCT078AeirwXTDxzSTxW69lIRwYpsKbh89Y4
   xkmNNtFtPiT1oPrvs58XtKeapsmdLaYwt33PKLUogm/5fxiXmX8UdbpXY
   /SWa4IUw4zV+C4VAEB73gBOlFIJpqMbYeR5P1OdBVH5Wp39cGbMOFBXvn
   Q==;
X-CSE-ConnectionGUID: d0U2nvgNTRCFMilhUaPW1A==
X-CSE-MsgGUID: ScqB4J+oT1qDDJkEk9w4vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="33726347"
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; 
   d="scan'208";a="33726347"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 12:43:32 -0800
X-CSE-ConnectionGUID: jY0MFgxLSgGo9PDVsr4/Dw==
X-CSE-MsgGUID: HbHJaag5THGNVC6HSKisSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; 
   d="scan'208";a="84750675"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 Nov 2024 12:43:30 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t99Lk-000qek-1j;
	Thu, 07 Nov 2024 20:43:28 +0000
Date: Fri, 8 Nov 2024 04:43:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 4/7] pmdomain: core: Introduce
 dev_pm_genpd_rpm_always_on()
Message-ID: <202411080432.5dWP6wRt-lkp@intel.com>
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
In-Reply-To: <1730705521-23081-5-git-send-email-shawn.lin@rock-chips.com>
References: <1730705521-23081-5-git-send-email-shawn.lin@rock-chips.com>
TO: Shawn Lin <shawn.lin@rock-chips.com>
TO: Rob Herring <robh+dt@kernel.org>
TO: "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
TO: "Martin K . Petersen" <martin.petersen@oracle.com>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Ulf Hansson <ulf.hansson@linaro.org>
TO: Heiko Stuebner <heiko@sntech.de>
TO: "Rafael J . Wysocki" <rafael@kernel.org>
CC: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: Alim Akhtar <alim.akhtar@samsung.com>
CC: Avri Altman <avri.altman@wdc.com>
CC: Bart Van Assche <bvanassche@acm.org>
CC: YiFeng Zhao <zyf@rock-chips.com>
CC: Liang Chen <cl@rock-chips.com>
CC: linux-scsi@vger.kernel.org
CC: linux-rockchip@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-pm@vger.kernel.org

Hi Shawn,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jejb-scsi/for-next]
[also build test WARNING on robh/for-next linus/master v6.12-rc6]
[cannot apply to mkp-scsi/for-next next-20241107]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shawn-Lin/dt-bindings-ufs-Document-Rockchip-UFS-host-controller/20241104-191810
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi.git for-next
patch link:    https://lore.kernel.org/r/1730705521-23081-5-git-send-email-shawn.lin%40rock-chips.com
patch subject: [PATCH v4 4/7] pmdomain: core: Introduce dev_pm_genpd_rpm_always_on()
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: loongarch-randconfig-r073-20241107 (https://download.01.org/0day-ci/archive/20241108/202411080432.5dWP6wRt-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411080432.5dWP6wRt-lkp@intel.com/

New smatch warnings:
drivers/pmdomain/core.c:898 genpd_power_off() warn: curly braces intended?

Old smatch warnings:
drivers/pmdomain/core.c:509 genpd_dev_pm_set_performance_state() error: 'genpd' dereferencing possible ERR_PTR()
drivers/pmdomain/core.c:1000 genpd_dev_pm_start() error: 'genpd' dereferencing possible ERR_PTR()

vim +898 drivers/pmdomain/core.c

29e47e2173349ee drivers/base/power/domain.c Ulf Hansson     2015-09-02  837  
1f8728b7adc4c2b drivers/base/power/domain.c Ulf Hansson     2017-02-17  838  /**
1f8728b7adc4c2b drivers/base/power/domain.c Ulf Hansson     2017-02-17  839   * genpd_power_off - Remove power from a given PM domain.
1f8728b7adc4c2b drivers/base/power/domain.c Ulf Hansson     2017-02-17  840   * @genpd: PM domain to power down.
3c64649d1cf9f32 drivers/base/power/domain.c Ulf Hansson     2017-02-17  841   * @one_dev_on: If invoked from genpd's ->runtime_suspend|resume() callback, the
3c64649d1cf9f32 drivers/base/power/domain.c Ulf Hansson     2017-02-17  842   * RPM status of the releated device is in an intermediate state, not yet turned
3c64649d1cf9f32 drivers/base/power/domain.c Ulf Hansson     2017-02-17  843   * into RPM_SUSPENDED. This means genpd_power_off() must allow one device to not
3c64649d1cf9f32 drivers/base/power/domain.c Ulf Hansson     2017-02-17  844   * be RPM_SUSPENDED, while it tries to power off the PM domain.
763663c9715f5f1 drivers/base/power/domain.c Yang Yingliang  2021-05-12  845   * @depth: nesting count for lockdep.
1f8728b7adc4c2b drivers/base/power/domain.c Ulf Hansson     2017-02-17  846   *
1f8728b7adc4c2b drivers/base/power/domain.c Ulf Hansson     2017-02-17  847   * If all of the @genpd's devices have been suspended and all of its subdomains
1f8728b7adc4c2b drivers/base/power/domain.c Ulf Hansson     2017-02-17  848   * have been powered down, remove power from @genpd.
1f8728b7adc4c2b drivers/base/power/domain.c Ulf Hansson     2017-02-17  849   */
2da835452a08758 drivers/base/power/domain.c Ulf Hansson     2017-02-17  850  static int genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
2da835452a08758 drivers/base/power/domain.c Ulf Hansson     2017-02-17  851  			   unsigned int depth)
1f8728b7adc4c2b drivers/base/power/domain.c Ulf Hansson     2017-02-17  852  {
1f8728b7adc4c2b drivers/base/power/domain.c Ulf Hansson     2017-02-17  853  	struct pm_domain_data *pdd;
1f8728b7adc4c2b drivers/base/power/domain.c Ulf Hansson     2017-02-17  854  	struct gpd_link *link;
1f8728b7adc4c2b drivers/base/power/domain.c Ulf Hansson     2017-02-17  855  	unsigned int not_suspended = 0;
f63816e43d90442 drivers/base/power/domain.c Ulf Hansson     2020-09-24  856  	int ret;
1f8728b7adc4c2b drivers/base/power/domain.c Ulf Hansson     2017-02-17  857  
1f8728b7adc4c2b drivers/base/power/domain.c Ulf Hansson     2017-02-17  858  	/*
1f8728b7adc4c2b drivers/base/power/domain.c Ulf Hansson     2017-02-17  859  	 * Do not try to power off the domain in the following situations:
1f8728b7adc4c2b drivers/base/power/domain.c Ulf Hansson     2017-02-17  860  	 * (1) The domain is already in the "power off" state.
1f8728b7adc4c2b drivers/base/power/domain.c Ulf Hansson     2017-02-17  861  	 * (2) System suspend is in progress.
1f8728b7adc4c2b drivers/base/power/domain.c Ulf Hansson     2017-02-17  862  	 */
41e2c8e0060db25 drivers/base/power/domain.c Ulf Hansson     2017-03-20  863  	if (!genpd_status_on(genpd) || genpd->prepared_count > 0)
1f8728b7adc4c2b drivers/base/power/domain.c Ulf Hansson     2017-02-17  864  		return 0;
1f8728b7adc4c2b drivers/base/power/domain.c Ulf Hansson     2017-02-17  865  
ffaa42e8a40b7f1 drivers/base/power/domain.c Ulf Hansson     2017-03-20  866  	/*
ffaa42e8a40b7f1 drivers/base/power/domain.c Ulf Hansson     2017-03-20  867  	 * Abort power off for the PM domain in the following situations:
ffaa42e8a40b7f1 drivers/base/power/domain.c Ulf Hansson     2017-03-20  868  	 * (1) The domain is configured as always on.
ffaa42e8a40b7f1 drivers/base/power/domain.c Ulf Hansson     2017-03-20  869  	 * (2) When the domain has a subdomain being powered on.
ffaa42e8a40b7f1 drivers/base/power/domain.c Ulf Hansson     2017-03-20  870  	 */
ed61e18a4b4e445 drivers/base/power/domain.c Leonard Crestez 2019-04-30  871  	if (genpd_is_always_on(genpd) ||
ed61e18a4b4e445 drivers/base/power/domain.c Leonard Crestez 2019-04-30  872  			genpd_is_rpm_always_on(genpd) ||
ed61e18a4b4e445 drivers/base/power/domain.c Leonard Crestez 2019-04-30  873  			atomic_read(&genpd->sd_count) > 0)
1f8728b7adc4c2b drivers/base/power/domain.c Ulf Hansson     2017-02-17  874  		return -EBUSY;
1f8728b7adc4c2b drivers/base/power/domain.c Ulf Hansson     2017-02-17  875  
e7d90cfac5510f8 drivers/base/power/domain.c Ulf Hansson     2022-02-17  876  	/*
e7d90cfac5510f8 drivers/base/power/domain.c Ulf Hansson     2022-02-17  877  	 * The children must be in their deepest (powered-off) states to allow
e7d90cfac5510f8 drivers/base/power/domain.c Ulf Hansson     2022-02-17  878  	 * the parent to be powered off. Note that, there's no need for
e7d90cfac5510f8 drivers/base/power/domain.c Ulf Hansson     2022-02-17  879  	 * additional locking, as powering on a child, requires the parent's
e7d90cfac5510f8 drivers/base/power/domain.c Ulf Hansson     2022-02-17  880  	 * lock to be acquired first.
e7d90cfac5510f8 drivers/base/power/domain.c Ulf Hansson     2022-02-17  881  	 */
e7d90cfac5510f8 drivers/base/power/domain.c Ulf Hansson     2022-02-17  882  	list_for_each_entry(link, &genpd->parent_links, parent_node) {
e7d90cfac5510f8 drivers/base/power/domain.c Ulf Hansson     2022-02-17  883  		struct generic_pm_domain *child = link->child;
e7d90cfac5510f8 drivers/base/power/domain.c Ulf Hansson     2022-02-17  884  		if (child->state_idx < child->state_count - 1)
e7d90cfac5510f8 drivers/base/power/domain.c Ulf Hansson     2022-02-17  885  			return -EBUSY;
e7d90cfac5510f8 drivers/base/power/domain.c Ulf Hansson     2022-02-17  886  	}
e7d90cfac5510f8 drivers/base/power/domain.c Ulf Hansson     2022-02-17  887  
1f8728b7adc4c2b drivers/base/power/domain.c Ulf Hansson     2017-02-17  888  	list_for_each_entry(pdd, &genpd->dev_list, list_node) {
1f8728b7adc4c2b drivers/base/power/domain.c Ulf Hansson     2017-02-17  889  		/*
1f8728b7adc4c2b drivers/base/power/domain.c Ulf Hansson     2017-02-17  890  		 * Do not allow PM domain to be powered off, when an IRQ safe
1f8728b7adc4c2b drivers/base/power/domain.c Ulf Hansson     2017-02-17  891  		 * device is part of a non-IRQ safe domain.
1f8728b7adc4c2b drivers/base/power/domain.c Ulf Hansson     2017-02-17  892  		 */
1f8728b7adc4c2b drivers/base/power/domain.c Ulf Hansson     2017-02-17  893  		if (!pm_runtime_suspended(pdd->dev) ||
7a02444b8fc25ac drivers/base/power/domain.c Ulf Hansson     2022-05-11  894  			irq_safe_dev_in_sleep_domain(pdd->dev, genpd))
1f8728b7adc4c2b drivers/base/power/domain.c Ulf Hansson     2017-02-17  895  			not_suspended++;
f0f6da10152fb8f drivers/pmdomain/core.c     Ulf Hansson     2024-11-04  896  
f0f6da10152fb8f drivers/pmdomain/core.c     Ulf Hansson     2024-11-04  897  			/* The device may need its PM domain to stay powered on. */
f0f6da10152fb8f drivers/pmdomain/core.c     Ulf Hansson     2024-11-04 @898  			if (to_gpd_data(pdd)->rpm_always_on)
f0f6da10152fb8f drivers/pmdomain/core.c     Ulf Hansson     2024-11-04  899  				return -EBUSY;
1f8728b7adc4c2b drivers/base/power/domain.c Ulf Hansson     2017-02-17  900  	}
1f8728b7adc4c2b drivers/base/power/domain.c Ulf Hansson     2017-02-17  901  
3c64649d1cf9f32 drivers/base/power/domain.c Ulf Hansson     2017-02-17  902  	if (not_suspended > 1 || (not_suspended == 1 && !one_dev_on))
1f8728b7adc4c2b drivers/base/power/domain.c Ulf Hansson     2017-02-17  903  		return -EBUSY;
1f8728b7adc4c2b drivers/base/power/domain.c Ulf Hansson     2017-02-17  904  
1f8728b7adc4c2b drivers/base/power/domain.c Ulf Hansson     2017-02-17  905  	if (genpd->gov && genpd->gov->power_down_ok) {
1f8728b7adc4c2b drivers/base/power/domain.c Ulf Hansson     2017-02-17  906  		if (!genpd->gov->power_down_ok(&genpd->domain))
1f8728b7adc4c2b drivers/base/power/domain.c Ulf Hansson     2017-02-17  907  			return -EAGAIN;
1f8728b7adc4c2b drivers/base/power/domain.c Ulf Hansson     2017-02-17  908  	}
1f8728b7adc4c2b drivers/base/power/domain.c Ulf Hansson     2017-02-17  909  
2c9b7f8772033cc drivers/base/power/domain.c Ulf Hansson     2018-10-03  910  	/* Default to shallowest state. */
2c9b7f8772033cc drivers/base/power/domain.c Ulf Hansson     2018-10-03  911  	if (!genpd->gov)
2c9b7f8772033cc drivers/base/power/domain.c Ulf Hansson     2018-10-03  912  		genpd->state_idx = 0;
2c9b7f8772033cc drivers/base/power/domain.c Ulf Hansson     2018-10-03  913  
f63816e43d90442 drivers/base/power/domain.c Ulf Hansson     2020-09-24  914  	/* Don't power off, if a child domain is waiting to power on. */
1f8728b7adc4c2b drivers/base/power/domain.c Ulf Hansson     2017-02-17  915  	if (atomic_read(&genpd->sd_count) > 0)
1f8728b7adc4c2b drivers/base/power/domain.c Ulf Hansson     2017-02-17  916  		return -EBUSY;
1f8728b7adc4c2b drivers/base/power/domain.c Ulf Hansson     2017-02-17  917  
1f8728b7adc4c2b drivers/base/power/domain.c Ulf Hansson     2017-02-17  918  	ret = _genpd_power_off(genpd, true);
c6a113b52302adc drivers/base/power/domain.c Lina Iyer       2020-10-15  919  	if (ret) {
c6a113b52302adc drivers/base/power/domain.c Lina Iyer       2020-10-15  920  		genpd->states[genpd->state_idx].rejected++;
1f8728b7adc4c2b drivers/base/power/domain.c Ulf Hansson     2017-02-17  921  		return ret;
c6a113b52302adc drivers/base/power/domain.c Lina Iyer       2020-10-15  922  	}
1f8728b7adc4c2b drivers/base/power/domain.c Ulf Hansson     2017-02-17  923  
49f618e1b669ef0 drivers/base/power/domain.c Ulf Hansson     2020-09-24  924  	genpd->status = GENPD_STATE_OFF;
afece3ab9a3640f drivers/base/power/domain.c Thara Gopinath  2017-07-14  925  	genpd_update_accounting(genpd);
c6a113b52302adc drivers/base/power/domain.c Lina Iyer       2020-10-15  926  	genpd->states[genpd->state_idx].usage++;
1f8728b7adc4c2b drivers/base/power/domain.c Ulf Hansson     2017-02-17  927  
8d87ae48ced2dff drivers/base/power/domain.c Kees Cook       2020-07-08  928  	list_for_each_entry(link, &genpd->child_links, child_node) {
8d87ae48ced2dff drivers/base/power/domain.c Kees Cook       2020-07-08  929  		genpd_sd_counter_dec(link->parent);
8d87ae48ced2dff drivers/base/power/domain.c Kees Cook       2020-07-08  930  		genpd_lock_nested(link->parent, depth + 1);
8d87ae48ced2dff drivers/base/power/domain.c Kees Cook       2020-07-08  931  		genpd_power_off(link->parent, false, depth + 1);
8d87ae48ced2dff drivers/base/power/domain.c Kees Cook       2020-07-08  932  		genpd_unlock(link->parent);
1f8728b7adc4c2b drivers/base/power/domain.c Ulf Hansson     2017-02-17  933  	}
1f8728b7adc4c2b drivers/base/power/domain.c Ulf Hansson     2017-02-17  934  
1f8728b7adc4c2b drivers/base/power/domain.c Ulf Hansson     2017-02-17  935  	return 0;
1f8728b7adc4c2b drivers/base/power/domain.c Ulf Hansson     2017-02-17  936  }
1f8728b7adc4c2b drivers/base/power/domain.c Ulf Hansson     2017-02-17  937  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
