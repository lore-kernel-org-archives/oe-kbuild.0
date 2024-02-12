Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A5463CB
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Feb 2024 05:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707715773; cv=none; b=efO+2sqh2T+9y0rg6J7L5kZAP1TmZTYvaqs+Lcz+sl/66hr7Q3FmOqvp9TgHoB7BUfL3FcKaV61a53ZUncl/vIqAvjhtlRuwYtPwNqZoaDkTVhfr28ph3EJDuMP5Wat46xVYNzSf1MoGVOys6G1Sw3z2argqp6QoUXzDdw+3gSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707715773; c=relaxed/simple;
	bh=2Dmg264w7LsApcVk/aaWGKf/+/+1EGUNBDcooAdVI/s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l6ctrXeH47Mqu1m4josXM1zZvdUiQrgAQTIn6M2LvwDzl6AsqdSI7hzo0x/FiA0X6UgW2ivnG+uHm4wzY38ajCXehr9tqqE0ia4KHRjY1on3NnqB/F4E9BPXDJdEE5YSSU0VaGbMIhr+3ze7IFWOPNIIMUWtDA6xhN+BPLQov+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XUWDJDTB; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XUWDJDTB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707715771; x=1739251771;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2Dmg264w7LsApcVk/aaWGKf/+/+1EGUNBDcooAdVI/s=;
  b=XUWDJDTB6+T67H6YV4yPREPg/EOL/h05DnLvzDR2vDiEzXfnvNwinci4
   cBKQgfjIyPSGEnznJvIuTirQSjAK49st1GMLa8eIGqfHMe8m3jHTLqYD4
   oF7v25fcispct2CvVlybe4PGi1kSbH3QgpwgK/zc3Y7+bn1tsixEl9qK1
   Jf+qOOpOk7/Ha+R8fd01A60AE5RMoXyS6qFClU2sMQR4Wf/AasjKhA74C
   52Fgr6JunWXSA33j6xLRjZlCNATFQzWQ4BZwUgAXEFdJhKMLpdT+J6AoN
   iruX2OOEK3uzBi5qexYrDHeoaTcCn6iLXdqFAVO9TfNt7EoidtipUbhUu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="2013874"
X-IronPort-AV: E=Sophos;i="6.05,262,1701158400"; 
   d="scan'208";a="2013874"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2024 21:29:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="934993773"
X-IronPort-AV: E=Sophos;i="6.05,262,1701158400"; 
   d="scan'208";a="934993773"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 11 Feb 2024 21:29:30 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZOsh-0006ws-0L;
	Mon, 12 Feb 2024 05:29:27 +0000
Date: Mon, 12 Feb 2024 13:28:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 13/19] power: reset: msm-poweroff: Use
 devm_register_sys_off_handler(RESTART)
Message-ID: <202402121342.7WgNqBu9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "empty line found in static check configure file"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240208170410.67975-14-afd@ti.com>
References: <20240208170410.67975-14-afd@ti.com>
TO: Andrew Davis <afd@ti.com>
TO: Sebastian Reichel <sre@kernel.org>
TO: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
TO: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
TO: Florian Fainelli <florian.fainelli@broadcom.com>
TO: Ray Jui <rjui@broadcom.com>
TO: Scott Branden <sbranden@broadcom.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konrad.dybcio@linaro.org>
TO: Sean Wang <sean.wang@mediatek.com>
TO: Matthias Brugger <matthias.bgg@gmail.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: linux-pm@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-actions@lists.infradead.org
CC: linux-arm-msm@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-mediatek@lists.infradead.org
CC: Andrew Davis <afd@ti.com>

Hi Andrew,

kernel test robot noticed the following build warnings:

[auto build test WARNING on sre-power-supply/for-next]
[also build test WARNING on mani-mhi/mhi-next soc/for-next linus/master v6.8-rc4 next-20240209]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrew-Davis/power-reset-atc260x-poweroff-Use-devm_register_sys_off_handler-RESTART/20240209-011655
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply.git for-next
patch link:    https://lore.kernel.org/r/20240208170410.67975-14-afd%40ti.com
patch subject: [PATCH v3 13/19] power: reset: msm-poweroff: Use devm_register_sys_off_handler(RESTART)
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-r131-20240211 (https://download.01.org/0day-ci/archive/20240212/202402121342.7WgNqBu9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240212/202402121342.7WgNqBu9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202402121342.7WgNqBu9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/power/reset/msm-poweroff.c:18:41: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *msm_ps_hold @@     got void *cb_data @@
   drivers/power/reset/msm-poweroff.c:18:41: sparse:     expected void [noderef] __iomem *msm_ps_hold
   drivers/power/reset/msm-poweroff.c:18:41: sparse:     got void *cb_data
>> drivers/power/reset/msm-poweroff.c:33:61: sparse: sparse: incorrect type in argument 5 (different address spaces) @@     expected void *cb_data @@     got void [noderef] __iomem *msm_ps_hold @@
   drivers/power/reset/msm-poweroff.c:33:61: sparse:     expected void *cb_data
   drivers/power/reset/msm-poweroff.c:33:61: sparse:     got void [noderef] __iomem *msm_ps_hold
   drivers/power/reset/msm-poweroff.c:37:39: sparse: sparse: incorrect type in argument 5 (different address spaces) @@     expected void *cb_data @@     got void [noderef] __iomem *msm_ps_hold @@
   drivers/power/reset/msm-poweroff.c:37:39: sparse:     expected void *cb_data
   drivers/power/reset/msm-poweroff.c:37:39: sparse:     got void [noderef] __iomem *msm_ps_hold

vim +18 drivers/power/reset/msm-poweroff.c

78be3176c4335b Abhimanyu Kapur 2013-07-30  15  
bc460fab0b719d Andrew Davis    2024-02-08  16  static int do_msm_poweroff(struct sys_off_data *data)
78be3176c4335b Abhimanyu Kapur 2013-07-30  17  {
bc460fab0b719d Andrew Davis    2024-02-08 @18  	void __iomem *msm_ps_hold = data->cb_data;
bc460fab0b719d Andrew Davis    2024-02-08  19  
78be3176c4335b Abhimanyu Kapur 2013-07-30  20  	writel(0, msm_ps_hold);
78be3176c4335b Abhimanyu Kapur 2013-07-30  21  	mdelay(10000);
18a702e0de9879 Pramod Gurav    2014-09-25  22  
18a702e0de9879 Pramod Gurav    2014-09-25  23  	return NOTIFY_DONE;
78be3176c4335b Abhimanyu Kapur 2013-07-30  24  }
78be3176c4335b Abhimanyu Kapur 2013-07-30  25  
78be3176c4335b Abhimanyu Kapur 2013-07-30  26  static int msm_restart_probe(struct platform_device *pdev)
78be3176c4335b Abhimanyu Kapur 2013-07-30  27  {
bc460fab0b719d Andrew Davis    2024-02-08  28  	void __iomem *msm_ps_hold = devm_platform_ioremap_resource(pdev, 0);
78be3176c4335b Abhimanyu Kapur 2013-07-30  29  	if (IS_ERR(msm_ps_hold))
78be3176c4335b Abhimanyu Kapur 2013-07-30  30  		return PTR_ERR(msm_ps_hold);
78be3176c4335b Abhimanyu Kapur 2013-07-30  31  
bc460fab0b719d Andrew Davis    2024-02-08  32  	devm_register_sys_off_handler(&pdev->dev, SYS_OFF_MODE_RESTART,
bc460fab0b719d Andrew Davis    2024-02-08 @33  				      128, do_msm_poweroff, msm_ps_hold);
18a702e0de9879 Pramod Gurav    2014-09-25  34  
521ef776c49589 Andrew Davis    2024-02-08  35  	devm_register_sys_off_handler(&pdev->dev, SYS_OFF_MODE_POWER_OFF,
521ef776c49589 Andrew Davis    2024-02-08  36  				      SYS_OFF_PRIO_DEFAULT, do_msm_poweroff,
521ef776c49589 Andrew Davis    2024-02-08  37  				      msm_ps_hold);
18a702e0de9879 Pramod Gurav    2014-09-25  38  
78be3176c4335b Abhimanyu Kapur 2013-07-30  39  	return 0;
78be3176c4335b Abhimanyu Kapur 2013-07-30  40  }
78be3176c4335b Abhimanyu Kapur 2013-07-30  41  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
