Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABF98F7A
	for <oe-kbuild@lists.linux.dev>; Wed, 10 Jan 2024 23:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g5fYdHE1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704927999; x=1736463999;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7DH1jUtPnRIJtGPl8e0z/2OD6Qq9wbH7GRnmU3fulZ8=;
  b=g5fYdHE1ncjW9GNYmVZLusMCVRV/wHRqtLg+P7A+VJtcc/GY39YV64fR
   JL3JduebC1PfB1HrgjgIcwPsiHAb+LlQl1fjGurWFvA6W9yVqWFx1jw3f
   Aql+lWi4n6bdhhWAN3kHiRC/faRB4YPOYIH9wdC2O4PekStf0VPN8vyHP
   UqTsX9lQt+zso1q6UK8YfLlcj2e7eoZo2yLTbjBB5vnjWx3ywUiRUVhcd
   anefrQh0VA9wCy7ZX4B2GyVEKqk9rSsMiEzVDP6h5LojuW/SgR5Qc+ZPy
   qK+xj70M4tMf5XWVcaxXl0Q7xQM6HZSB4HI/rhYIozbxhOrznKvjj2WD7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="5448683"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="5448683"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 15:06:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="1113601591"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="1113601591"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 10 Jan 2024 15:06:37 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNhec-0007Zi-38;
	Wed, 10 Jan 2024 23:06:34 +0000
Date: Thu, 11 Jan 2024 07:06:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/clk/sunxi/clk-a20-gmac.c:43: warning: expecting prototype
 for sun7i_a20_gmac_clk_setup(). Prototype was for SUN7I_A20_GMAC_GPIT()
 instead
Message-ID: <202401110628.T2xYEQhh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only kconfig file changed"
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/clk/sunxi/clk-a20-gmac.c:43: warning: expecting prototype for sun7i_a20_gmac_clk_setup(). Prototype was for SUN7I_A20_GMAC_GPIT() instead"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Samuel Holland <samuel@sholland.org>
CC: Jernej Skrabec <jernej.skrabec@gmail.com>
CC: Guo Ren <guoren@kernel.org>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0cb552aa97843f24549ce808883494138471c16b
commit: 6f5178acf63614f2ee27450b2ab4d4980a698161 riscv: Add the Allwinner SoC family Kconfig option
date:   12 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 12 months ago
config: riscv-randconfig-r042-20230805 (https://download.01.org/0day-ci/archive/20240111/202401110628.T2xYEQhh-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20240111/202401110628.T2xYEQhh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401110628.T2xYEQhh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/sunxi/clk-a20-gmac.c:43: warning: expecting prototype for sun7i_a20_gmac_clk_setup(). Prototype was for SUN7I_A20_GMAC_GPIT() instead
--
>> drivers/clk/sunxi/clk-usb.c:80: warning: expecting prototype for sunxi_usb_clk_setup(). Prototype was for SUNXI_USB_MAX_SIZE() instead
--
>> drivers/clk/sunxi/clk-sun9i-cpus.c:25: warning: expecting prototype for sun9i_a80_cpus_clk_setup(). Prototype was for SUN9I_CPUS_MAX_PARENTS() instead


vim +43 drivers/clk/sunxi/clk-a20-gmac.c

59cb10e32a6053 Maxime Ripard 2014-05-09  17  
59cb10e32a6053 Maxime Ripard 2014-05-09  18  /**
59cb10e32a6053 Maxime Ripard 2014-05-09  19   * sun7i_a20_gmac_clk_setup - Setup function for A20/A31 GMAC clock module
59cb10e32a6053 Maxime Ripard 2014-05-09  20   *
59cb10e32a6053 Maxime Ripard 2014-05-09  21   * This clock looks something like this
59cb10e32a6053 Maxime Ripard 2014-05-09  22   *                               ________________________
59cb10e32a6053 Maxime Ripard 2014-05-09  23   *  MII TX clock from PHY >-----|___________    _________|----> to GMAC core
59cb10e32a6053 Maxime Ripard 2014-05-09  24   *  GMAC Int. RGMII TX clk >----|___________\__/__gate---|----> to PHY
59cb10e32a6053 Maxime Ripard 2014-05-09  25   *  Ext. 125MHz RGMII TX clk >--|__divider__/            |
59cb10e32a6053 Maxime Ripard 2014-05-09  26   *                              |________________________|
59cb10e32a6053 Maxime Ripard 2014-05-09  27   *
59cb10e32a6053 Maxime Ripard 2014-05-09  28   * The external 125 MHz reference is optional, i.e. GMAC can use its
59cb10e32a6053 Maxime Ripard 2014-05-09  29   * internal TX clock just fine. The A31 GMAC clock module does not have
59cb10e32a6053 Maxime Ripard 2014-05-09  30   * the divider controls for the external reference.
59cb10e32a6053 Maxime Ripard 2014-05-09  31   *
59cb10e32a6053 Maxime Ripard 2014-05-09  32   * To keep it simple, let the GMAC use either the MII TX clock for MII mode,
59cb10e32a6053 Maxime Ripard 2014-05-09  33   * and its internal TX clock for GMII and RGMII modes. The GMAC driver should
59cb10e32a6053 Maxime Ripard 2014-05-09  34   * select the appropriate source and gate/ungate the output to the PHY.
59cb10e32a6053 Maxime Ripard 2014-05-09  35   *
59cb10e32a6053 Maxime Ripard 2014-05-09  36   * Only the GMAC should use this clock. Altering the clock so that it doesn't
59cb10e32a6053 Maxime Ripard 2014-05-09  37   * match the GMAC's operation parameters will result in the GMAC not being
59cb10e32a6053 Maxime Ripard 2014-05-09  38   * able to send traffic out. The GMAC driver should set the clock rate and
59cb10e32a6053 Maxime Ripard 2014-05-09  39   * enable/disable this clock to configure the required state. The clock
59cb10e32a6053 Maxime Ripard 2014-05-09  40   * driver then responds by auto-reparenting the clock.
59cb10e32a6053 Maxime Ripard 2014-05-09  41   */
59cb10e32a6053 Maxime Ripard 2014-05-09  42  
59cb10e32a6053 Maxime Ripard 2014-05-09 @43  #define SUN7I_A20_GMAC_GPIT	2
59cb10e32a6053 Maxime Ripard 2014-05-09  44  #define SUN7I_A20_GMAC_MASK	0x3
59cb10e32a6053 Maxime Ripard 2014-05-09  45  #define SUN7I_A20_GMAC_PARENTS	2
59cb10e32a6053 Maxime Ripard 2014-05-09  46  

:::::: The code at line 43 was first introduced by commit
:::::: 59cb10e32a60533865e26dc9a8303306ba972a70 clk: sunxi: Move the GMAC clock to a file of its own

:::::: TO: Maxime Ripard <maxime.ripard@free-electrons.com>
:::::: CC: Maxime Ripard <maxime.ripard@free-electrons.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
