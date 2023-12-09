Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EA1D522
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Dec 2023 14:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I2oMdwH6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702130798; x=1733666798;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jlJIgmJpi1U6NmaUPGJEKySNZS0BWiy1SF4h6ZIOcbE=;
  b=I2oMdwH6GpZy8LIrgiAw5RXxOboyjV1Vc1SFfswzo3GUkwz9ca/GCY8R
   eclXIasJOkyCKqfo0nMs0wOfCBB96lRg6HkRfDUFFEqwjpqGzB8aTBNwf
   Umi7LvTNKbhU8oPxEOpikvJWjfxzjzZDS3xr0cy+Y7IpKIfGVaNBI45RZ
   xI/rEdyrVhpquoGQx+M9rrEpVgExoV+gAKLrMQxwfXSzVo4AV1AQPzKO6
   s5s0fseMwHoNm5urAkZ52sdlBKoRUoVZJr8mSL5BS5dIZftMkSJM8AqRu
   oyitBXkO/sHyTHtyBsOVpJhbiFw/Nigcj8lNKAhI1M90/ytiZd2a0FqZF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="391683600"
X-IronPort-AV: E=Sophos;i="6.04,263,1695711600"; 
   d="scan'208";a="391683600"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2023 06:06:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="1019659841"
X-IronPort-AV: E=Sophos;i="6.04,263,1695711600"; 
   d="scan'208";a="1019659841"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 09 Dec 2023 06:06:36 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBxyS-000FQ9-1Y;
	Sat, 09 Dec 2023 14:06:33 +0000
Date: Sat, 9 Dec 2023 22:06:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/pmdomain/rockchip/pm-domains.c:593 rockchip_pd_attach_dev()
 warn: 'clk' is an error pointer or valid
Message-ID: <202312092101.NB7gSwHp-lkp@intel.com>
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
TO: Ulf Hansson <ulf.hansson@linaro.org>
CC: Linus Walleij <linus.walleij@linaro.org>

Hi Ulf,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f2e8a57ee9036c7d5443382b6c3c09b51a92ec7e
commit: e2ad626f8f409899baf1bf192d0533a851128b19 pmdomain: Rename the genpd subsystem to pmdomain
date:   3 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 3 months ago
config: powerpc-randconfig-r071-20231209 (https://download.01.org/0day-ci/archive/20231209/202312092101.NB7gSwHp-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20231209/202312092101.NB7gSwHp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312092101.NB7gSwHp-lkp@intel.com/

smatch warnings:
drivers/pmdomain/rockchip/pm-domains.c:593 rockchip_pd_attach_dev() warn: 'clk' is an error pointer or valid
drivers/pmdomain/rockchip/pm-domains.c:593 rockchip_pd_attach_dev() warn: 'clk' is an error pointer or valid

vim +/clk +593 drivers/pmdomain/rockchip/pm-domains.c

7c696693a4f54d drivers/soc/rockchip/pm_domains.c Caesar Wang 2015-09-08  576  
7c696693a4f54d drivers/soc/rockchip/pm_domains.c Caesar Wang 2015-09-08  577  static int rockchip_pd_attach_dev(struct generic_pm_domain *genpd,
7c696693a4f54d drivers/soc/rockchip/pm_domains.c Caesar Wang 2015-09-08  578  				  struct device *dev)
7c696693a4f54d drivers/soc/rockchip/pm_domains.c Caesar Wang 2015-09-08  579  {
7c696693a4f54d drivers/soc/rockchip/pm_domains.c Caesar Wang 2015-09-08  580  	struct clk *clk;
7c696693a4f54d drivers/soc/rockchip/pm_domains.c Caesar Wang 2015-09-08  581  	int i;
7c696693a4f54d drivers/soc/rockchip/pm_domains.c Caesar Wang 2015-09-08  582  	int error;
7c696693a4f54d drivers/soc/rockchip/pm_domains.c Caesar Wang 2015-09-08  583  
7c696693a4f54d drivers/soc/rockchip/pm_domains.c Caesar Wang 2015-09-08  584  	dev_dbg(dev, "attaching to power domain '%s'\n", genpd->name);
7c696693a4f54d drivers/soc/rockchip/pm_domains.c Caesar Wang 2015-09-08  585  
7c696693a4f54d drivers/soc/rockchip/pm_domains.c Caesar Wang 2015-09-08  586  	error = pm_clk_create(dev);
7c696693a4f54d drivers/soc/rockchip/pm_domains.c Caesar Wang 2015-09-08  587  	if (error) {
7c696693a4f54d drivers/soc/rockchip/pm_domains.c Caesar Wang 2015-09-08  588  		dev_err(dev, "pm_clk_create failed %d\n", error);
7c696693a4f54d drivers/soc/rockchip/pm_domains.c Caesar Wang 2015-09-08  589  		return error;
7c696693a4f54d drivers/soc/rockchip/pm_domains.c Caesar Wang 2015-09-08  590  	}
7c696693a4f54d drivers/soc/rockchip/pm_domains.c Caesar Wang 2015-09-08  591  
7c696693a4f54d drivers/soc/rockchip/pm_domains.c Caesar Wang 2015-09-08  592  	i = 0;
7c696693a4f54d drivers/soc/rockchip/pm_domains.c Caesar Wang 2015-09-08 @593  	while ((clk = of_clk_get(dev->of_node, i++)) && !IS_ERR(clk)) {
7c696693a4f54d drivers/soc/rockchip/pm_domains.c Caesar Wang 2015-09-08  594  		dev_dbg(dev, "adding clock '%pC' to list of PM clocks\n", clk);
7c696693a4f54d drivers/soc/rockchip/pm_domains.c Caesar Wang 2015-09-08  595  		error = pm_clk_add_clk(dev, clk);
7c696693a4f54d drivers/soc/rockchip/pm_domains.c Caesar Wang 2015-09-08  596  		if (error) {
7c696693a4f54d drivers/soc/rockchip/pm_domains.c Caesar Wang 2015-09-08  597  			dev_err(dev, "pm_clk_add_clk failed %d\n", error);
7c696693a4f54d drivers/soc/rockchip/pm_domains.c Caesar Wang 2015-09-08  598  			clk_put(clk);
7c696693a4f54d drivers/soc/rockchip/pm_domains.c Caesar Wang 2015-09-08  599  			pm_clk_destroy(dev);
7c696693a4f54d drivers/soc/rockchip/pm_domains.c Caesar Wang 2015-09-08  600  			return error;
7c696693a4f54d drivers/soc/rockchip/pm_domains.c Caesar Wang 2015-09-08  601  		}
7c696693a4f54d drivers/soc/rockchip/pm_domains.c Caesar Wang 2015-09-08  602  	}
7c696693a4f54d drivers/soc/rockchip/pm_domains.c Caesar Wang 2015-09-08  603  
7c696693a4f54d drivers/soc/rockchip/pm_domains.c Caesar Wang 2015-09-08  604  	return 0;
7c696693a4f54d drivers/soc/rockchip/pm_domains.c Caesar Wang 2015-09-08  605  }
7c696693a4f54d drivers/soc/rockchip/pm_domains.c Caesar Wang 2015-09-08  606  

:::::: The code at line 593 was first introduced by commit
:::::: 7c696693a4f54d12714738b45aee3e4302884ade soc: rockchip: power-domain: Add power domain driver

:::::: TO: Caesar Wang <wxt@rock-chips.com>
:::::: CC: Heiko Stuebner <heiko@sntech.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
