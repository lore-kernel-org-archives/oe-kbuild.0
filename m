Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF8CAD33
	for <oe-kbuild@lists.linux.dev>; Wed, 14 Dec 2022 18:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671042349; x=1702578349;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wV6XRu8RAwttknoUsopLy4p1/JR30tZkFvLBgtRz2lg=;
  b=hoT8NfAusZuEFzhmf4rfU6fU2Ub7twXKneTzF6SniGg8PFsZFDaRcdFt
   OHAZnaad2/QgpD0nNxKrln/BD4ZlPX57sT/nd/mHpVJCNXq5fe5QieCdx
   G1BZdxtQbDdULLkz4gamPyOaE+5Ck8U5Az9Fg58sAUjynllUMgmYXdyML
   FVa0ZIMzRCP85XaevaRbLiPTn4YULtRY/SHVZnA/KIaQqjHF/EWPJzXtl
   gNEN3IFQiMtNHZjUb3qdBHfyQCmH7sBT3vkm+516bY1xjPVabd/GFfElF
   remKtTucBSh954YSKEYOdk6Tbyp5kAnv6jC964owhrvklbY6cba4YQhoY
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="318526179"
X-IronPort-AV: E=Sophos;i="5.96,245,1665471600"; 
   d="scan'208";a="318526179"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2022 10:25:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="823384564"
X-IronPort-AV: E=Sophos;i="5.96,245,1665471600"; 
   d="scan'208";a="823384564"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 14 Dec 2022 10:25:22 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p5WRV-0005iQ-2X;
	Wed, 14 Dec 2022 18:25:21 +0000
Date: Thu, 15 Dec 2022 02:24:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpio/gpio-mxc.c:550:31: warning: Shifting signed 32-bit
 value by 31 bits is implementation-defined behaviour
 [shiftTooManyBitsSigned]
Message-ID: <202212150215.MKt5P5xe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/gpio/gpio-mxc.c:550:31: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Shenwei Wang <shenwei.wang@nxp.com>
CC: Linus Walleij <linus.walleij@linaro.org>
CC: Peng Fan <peng.fan@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e2ca6ba6ba0152361aa4fcbf6067db71b2c7a770
commit: f60c9eac54af28d7b5651fe49944bfd5098550e6 gpio: mxc: enable pad wakeup on i.MX8x platforms
date:   5 weeks ago
:::::: branch date: 15 hours ago
:::::: commit date: 5 weeks ago
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout f60c9eac54af28d7b5651fe49944bfd5098550e6
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpio/gpio-mxc.c:550:31: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
     if ((port->wakeup_pads & (1 << i))) {
                                 ^
   drivers/gpio/gpio-mxc.c:549:16: note: Assuming that condition 'i<32' is not redundant
    for (i = 0; i < 32; i++) {
                  ^
   drivers/gpio/gpio-mxc.c:550:31: note: Shift
     if ((port->wakeup_pads & (1 << i))) {
                                 ^
>> drivers/gpio/gpio-mxc.c:550:31: warning: Signed integer overflow for expression '1<<i'. [integerOverflow]
     if ((port->wakeup_pads & (1 << i))) {
                                 ^
   drivers/gpio/gpio-mxc.c:549:16: note: Assuming that condition 'i<32' is not redundant
    for (i = 0; i < 32; i++) {
                  ^
   drivers/gpio/gpio-mxc.c:550:31: note: Integer overflow
     if ((port->wakeup_pads & (1 << i))) {
                                 ^
>> drivers/gpio/gpio-mxc.c:293:32: warning: Uninitialized variable: port->hwdata [uninitvar]
     irq_msk = readl(port->base + GPIO_IMR);
                                  ^
>> drivers/gpio/gpio-mxc.c:596:22: warning: Uninitialized variables: port.node, port.clk, port.irq, port.irq_high, port.domain, port.gc, port.dev, port.both_edges, port.gpio_saved_reg, port.power_off, port.wakeup_pads, port.is_pad_wakeup, port.hwdata [uninitvar]
     mxc_gpio_save_regs(port);
                        ^
>> drivers/gpio/gpio-mxc.c:615:25: warning: Uninitialized variables: port.node, port.irq, port.irq_high, port.domain, port.gc, port.dev, port.both_edges, port.gpio_saved_reg, port.power_off, port.wakeup_pads, port.is_pad_wakeup, port.hwdata [uninitvar]
     mxc_gpio_restore_regs(port);
                           ^
   drivers/gpio/gpio-mxc.c:611:7: note: Assuming condition is false
     if (ret) {
         ^
   drivers/gpio/gpio-mxc.c:615:25: note: Uninitialized variables: port.node, port.irq, port.irq_high, port.domain, port.gc, port.dev, port.both_edges, port.gpio_saved_reg, port.power_off, port.wakeup_pads, port.is_pad_wakeup, port.hwdata
     mxc_gpio_restore_regs(port);
                           ^

vim +550 drivers/gpio/gpio-mxc.c

f60c9eac54af28 Shenwei Wang 2022-10-27  530  
f60c9eac54af28 Shenwei Wang 2022-10-27  531  static bool mxc_gpio_set_pad_wakeup(struct mxc_gpio_port *port, bool enable)
f60c9eac54af28 Shenwei Wang 2022-10-27  532  {
f60c9eac54af28 Shenwei Wang 2022-10-27  533  	unsigned long config;
f60c9eac54af28 Shenwei Wang 2022-10-27  534  	bool ret = false;
f60c9eac54af28 Shenwei Wang 2022-10-27  535  	int i, type;
f60c9eac54af28 Shenwei Wang 2022-10-27  536  
f60c9eac54af28 Shenwei Wang 2022-10-27  537  	static const u32 pad_type_map[] = {
f60c9eac54af28 Shenwei Wang 2022-10-27  538  		IMX_SCU_WAKEUP_OFF,		/* 0 */
f60c9eac54af28 Shenwei Wang 2022-10-27  539  		IMX_SCU_WAKEUP_RISE_EDGE,	/* IRQ_TYPE_EDGE_RISING */
f60c9eac54af28 Shenwei Wang 2022-10-27  540  		IMX_SCU_WAKEUP_FALL_EDGE,	/* IRQ_TYPE_EDGE_FALLING */
f60c9eac54af28 Shenwei Wang 2022-10-27  541  		IMX_SCU_WAKEUP_FALL_EDGE,	/* IRQ_TYPE_EDGE_BOTH */
f60c9eac54af28 Shenwei Wang 2022-10-27  542  		IMX_SCU_WAKEUP_HIGH_LVL,	/* IRQ_TYPE_LEVEL_HIGH */
f60c9eac54af28 Shenwei Wang 2022-10-27  543  		IMX_SCU_WAKEUP_OFF,		/* 5 */
f60c9eac54af28 Shenwei Wang 2022-10-27  544  		IMX_SCU_WAKEUP_OFF,		/* 6 */
f60c9eac54af28 Shenwei Wang 2022-10-27  545  		IMX_SCU_WAKEUP_OFF,		/* 7 */
f60c9eac54af28 Shenwei Wang 2022-10-27  546  		IMX_SCU_WAKEUP_LOW_LVL,		/* IRQ_TYPE_LEVEL_LOW */
f60c9eac54af28 Shenwei Wang 2022-10-27  547  	};
f60c9eac54af28 Shenwei Wang 2022-10-27  548  
f60c9eac54af28 Shenwei Wang 2022-10-27  549  	for (i = 0; i < 32; i++) {
f60c9eac54af28 Shenwei Wang 2022-10-27 @550  		if ((port->wakeup_pads & (1 << i))) {
f60c9eac54af28 Shenwei Wang 2022-10-27  551  			type = port->pad_type[i];
f60c9eac54af28 Shenwei Wang 2022-10-27  552  			if (enable)
f60c9eac54af28 Shenwei Wang 2022-10-27  553  				config = pad_type_map[type];
f60c9eac54af28 Shenwei Wang 2022-10-27  554  			else
f60c9eac54af28 Shenwei Wang 2022-10-27  555  				config = IMX_SCU_WAKEUP_OFF;
f60c9eac54af28 Shenwei Wang 2022-10-27  556  			ret |= mxc_gpio_generic_config(port, i, config);
f60c9eac54af28 Shenwei Wang 2022-10-27  557  		}
f60c9eac54af28 Shenwei Wang 2022-10-27  558  	}
f60c9eac54af28 Shenwei Wang 2022-10-27  559  
f60c9eac54af28 Shenwei Wang 2022-10-27  560  	return ret;
f60c9eac54af28 Shenwei Wang 2022-10-27  561  }
f60c9eac54af28 Shenwei Wang 2022-10-27  562  
f60c9eac54af28 Shenwei Wang 2022-10-27  563  static int __maybe_unused mxc_gpio_noirq_suspend(struct device *dev)
f60c9eac54af28 Shenwei Wang 2022-10-27  564  {
f60c9eac54af28 Shenwei Wang 2022-10-27  565  	struct platform_device *pdev = to_platform_device(dev);
f60c9eac54af28 Shenwei Wang 2022-10-27  566  	struct mxc_gpio_port *port = platform_get_drvdata(pdev);
f60c9eac54af28 Shenwei Wang 2022-10-27  567  
f60c9eac54af28 Shenwei Wang 2022-10-27  568  	if (port->wakeup_pads > 0)
f60c9eac54af28 Shenwei Wang 2022-10-27  569  		port->is_pad_wakeup = mxc_gpio_set_pad_wakeup(port, true);
f60c9eac54af28 Shenwei Wang 2022-10-27  570  
f60c9eac54af28 Shenwei Wang 2022-10-27  571  	return 0;
f60c9eac54af28 Shenwei Wang 2022-10-27  572  }
f60c9eac54af28 Shenwei Wang 2022-10-27  573  
f60c9eac54af28 Shenwei Wang 2022-10-27  574  static int __maybe_unused mxc_gpio_noirq_resume(struct device *dev)
f60c9eac54af28 Shenwei Wang 2022-10-27  575  {
f60c9eac54af28 Shenwei Wang 2022-10-27  576  	struct platform_device *pdev = to_platform_device(dev);
f60c9eac54af28 Shenwei Wang 2022-10-27  577  	struct mxc_gpio_port *port = platform_get_drvdata(pdev);
f60c9eac54af28 Shenwei Wang 2022-10-27  578  
f60c9eac54af28 Shenwei Wang 2022-10-27  579  	if (port->wakeup_pads > 0)
f60c9eac54af28 Shenwei Wang 2022-10-27  580  		mxc_gpio_set_pad_wakeup(port, false);
f60c9eac54af28 Shenwei Wang 2022-10-27  581  	port->is_pad_wakeup = false;
f60c9eac54af28 Shenwei Wang 2022-10-27  582  
f60c9eac54af28 Shenwei Wang 2022-10-27  583  	return 0;
f60c9eac54af28 Shenwei Wang 2022-10-27  584  }
f60c9eac54af28 Shenwei Wang 2022-10-27  585  
f60c9eac54af28 Shenwei Wang 2022-10-27  586  static const struct dev_pm_ops mxc_gpio_dev_pm_ops = {
f60c9eac54af28 Shenwei Wang 2022-10-27  587  	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(mxc_gpio_noirq_suspend, mxc_gpio_noirq_resume)
f60c9eac54af28 Shenwei Wang 2022-10-27  588  };
f60c9eac54af28 Shenwei Wang 2022-10-27  589  
1a5287a3dbc34c Anson Huang  2018-11-09  590  static int mxc_gpio_syscore_suspend(void)
c19fdaeea0aa19 Anson Huang  2018-07-18  591  {
1a5287a3dbc34c Anson Huang  2018-11-09  592  	struct mxc_gpio_port *port;
c19fdaeea0aa19 Anson Huang  2018-07-18  593  
1a5287a3dbc34c Anson Huang  2018-11-09  594  	/* walk through all ports */
1a5287a3dbc34c Anson Huang  2018-11-09  595  	list_for_each_entry(port, &mxc_gpio_ports, node) {
c19fdaeea0aa19 Anson Huang  2018-07-18 @596  		mxc_gpio_save_regs(port);
c19fdaeea0aa19 Anson Huang  2018-07-18  597  		clk_disable_unprepare(port->clk);
1a5287a3dbc34c Anson Huang  2018-11-09  598  	}
c19fdaeea0aa19 Anson Huang  2018-07-18  599  
c19fdaeea0aa19 Anson Huang  2018-07-18  600  	return 0;
c19fdaeea0aa19 Anson Huang  2018-07-18  601  }
c19fdaeea0aa19 Anson Huang  2018-07-18  602  
1a5287a3dbc34c Anson Huang  2018-11-09  603  static void mxc_gpio_syscore_resume(void)
c19fdaeea0aa19 Anson Huang  2018-07-18  604  {
1a5287a3dbc34c Anson Huang  2018-11-09  605  	struct mxc_gpio_port *port;
c19fdaeea0aa19 Anson Huang  2018-07-18  606  	int ret;
c19fdaeea0aa19 Anson Huang  2018-07-18  607  
1a5287a3dbc34c Anson Huang  2018-11-09  608  	/* walk through all ports */
1a5287a3dbc34c Anson Huang  2018-11-09  609  	list_for_each_entry(port, &mxc_gpio_ports, node) {
c19fdaeea0aa19 Anson Huang  2018-07-18  610  		ret = clk_prepare_enable(port->clk);
1a5287a3dbc34c Anson Huang  2018-11-09  611  		if (ret) {
1a5287a3dbc34c Anson Huang  2018-11-09  612  			pr_err("mxc: failed to enable gpio clock %d\n", ret);
1a5287a3dbc34c Anson Huang  2018-11-09  613  			return;
1a5287a3dbc34c Anson Huang  2018-11-09  614  		}
c19fdaeea0aa19 Anson Huang  2018-07-18 @615  		mxc_gpio_restore_regs(port);
1a5287a3dbc34c Anson Huang  2018-11-09  616  	}
c19fdaeea0aa19 Anson Huang  2018-07-18  617  }
c19fdaeea0aa19 Anson Huang  2018-07-18  618  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
