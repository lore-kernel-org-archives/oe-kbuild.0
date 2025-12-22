Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461B932D0E9
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Dec 2025 15:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766418444; cv=none; b=VwHiP7JorL5DPDUV/271si4weysolvGHWxJWKg1ZNlLgg8J1wudRcDDW91H/4sSqT7yxcYpcahfanSdDP3HxmR8vB4tZ7bjrNHLo1gcOw3rDJT+l1z+FGo8QpwQx+/VhGfCuy/p/d1TGk9LCR2S2VBeQyKycomVDLJ3C1yULGaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766418444; c=relaxed/simple;
	bh=fGqZ7busip10wN9bhjYRob9g12DfiWprKWEswMNVGeM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FlACtOfyCSWNreOOg68/rhGVpxIlfUPJbKHtu8KMGLl72o7xoL6e6hfr2nLkjlW5AUbNZa72ey3+1+pJpkbuwhNXRmeTXNzmPSbE5TKTJixMLSudblDqnLliLv/NwV6MfRiU4EPt0i36ZHogCBRYTeaPR+deezMRXFkDXSr1wG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U+gI3dNa; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U+gI3dNa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766418443; x=1797954443;
  h=date:from:to:cc:subject:message-id;
  bh=fGqZ7busip10wN9bhjYRob9g12DfiWprKWEswMNVGeM=;
  b=U+gI3dNaPEWJnl5dY8ZsprvmKZQwS7x3gf3Do0W4uoV8IajCt2HqZ65I
   TY5se1+Bu9NyUl/1KWQaNG3sBi5jNVhLuWMMhPGSHjv85br9GoM74mBYr
   20ohLPdiXWcAjVQnbjampXkVSabve17QZIwICGA5hkueLe3tSkBNf7u7X
   IKzPCXYhTGlgzQDKBIRBE0XQHO0Uug1i4HsVyZ2vS8DB1gHjbv/Aob065
   Vs7b5/Py7jdyPr1j/C8JEMXC6sszlz8i7vRfipID17AUoNsXyng96ZPcx
   LWVB+NZNFnv84cSowxF/Ql8LGR5TYuEHAhBHJw08RxXJo8gGcABB/6I9N
   Q==;
X-CSE-ConnectionGUID: X6vayfxfQKOoJ8jSP8eOlw==
X-CSE-MsgGUID: uAjg1Ki5SfuY77uboMAxTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68213027"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68213027"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 07:47:19 -0800
X-CSE-ConnectionGUID: yz7HowNgQYC6Uy0xZHoQjw==
X-CSE-MsgGUID: N0AjWvJdSeCuSRA67Fpj0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="204604996"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 22 Dec 2025 07:47:17 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXi7v-000000000lp-1Ahi;
	Mon, 22 Dec 2025 15:47:15 +0000
Date: Mon, 22 Dec 2025 23:46:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/phy/ti/phy-ti-pipe3.c:848 ti_pipe3_probe() warn:
 'phy->refclk' from clk_prepare_enable() not released on lines: 841,848.
Message-ID: <202512222357.2ZhDmJqP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Dave Penkler <dpenkler@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9448598b22c50c8a5bb77a9103e2d49f134c9578
commit: e6ab504633e4c06e35377ecf3c8cbc304de79858 staging: gpib: Destage gpib
date:   4 weeks ago
:::::: branch date: 16 hours ago
:::::: commit date: 4 weeks ago
config: alpha-randconfig-r071-20251222 (https://download.01.org/0day-ci/archive/20251222/202512222357.2ZhDmJqP-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512222357.2ZhDmJqP-lkp@intel.com/

New smatch warnings:
drivers/phy/ti/phy-ti-pipe3.c:848 ti_pipe3_probe() warn: 'phy->refclk' from clk_prepare_enable() not released on lines: 841,848.
drivers/gpib/cb7210/cb7210.c:1068 cb_isa_attach() warn: 'config->ibbase' from __request_region() not released on lines: 1064.

Old smatch warnings:
internal error: arch/alpha/include/asm/io_trivial.h:18 SQL error #2: near "and": syntax error
internal error: arch/alpha/include/asm/io_trivial.h:18 SQL: 'select * from return_states where  and type = 1044 and parameter = -1 and key = '$' limit 1;'

vim +848 drivers/phy/ti/phy-ti-pipe3.c

234738ea33903a drivers/phy/phy-ti-pipe3.c    Kishon Vijay Abraham I 2015-12-21  787  
1fe521225a830e drivers/phy/phy-ti-pipe3.c    Kishon Vijay Abraham I 2015-12-21  788  static int ti_pipe3_probe(struct platform_device *pdev)
1fe521225a830e drivers/phy/phy-ti-pipe3.c    Kishon Vijay Abraham I 2015-12-21  789  {
1fe521225a830e drivers/phy/phy-ti-pipe3.c    Kishon Vijay Abraham I 2015-12-21  790  	struct ti_pipe3 *phy;
1fe521225a830e drivers/phy/phy-ti-pipe3.c    Kishon Vijay Abraham I 2015-12-21  791  	struct phy *generic_phy;
1fe521225a830e drivers/phy/phy-ti-pipe3.c    Kishon Vijay Abraham I 2015-12-21  792  	struct phy_provider *phy_provider;
1fe521225a830e drivers/phy/phy-ti-pipe3.c    Kishon Vijay Abraham I 2015-12-21  793  	struct device *dev = &pdev->dev;
1fe521225a830e drivers/phy/phy-ti-pipe3.c    Kishon Vijay Abraham I 2015-12-21  794  	int ret;
21bf6fc47a1e45 drivers/phy/ti/phy-ti-pipe3.c Rob Herring            2023-10-09  795  	const struct pipe3_data *data;
1fe521225a830e drivers/phy/phy-ti-pipe3.c    Kishon Vijay Abraham I 2015-12-21  796  
1fe521225a830e drivers/phy/phy-ti-pipe3.c    Kishon Vijay Abraham I 2015-12-21  797  	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
1fe521225a830e drivers/phy/phy-ti-pipe3.c    Kishon Vijay Abraham I 2015-12-21  798  	if (!phy)
1fe521225a830e drivers/phy/phy-ti-pipe3.c    Kishon Vijay Abraham I 2015-12-21  799  		return -ENOMEM;
1fe521225a830e drivers/phy/phy-ti-pipe3.c    Kishon Vijay Abraham I 2015-12-21  800  
21bf6fc47a1e45 drivers/phy/ti/phy-ti-pipe3.c Rob Herring            2023-10-09  801  	data = device_get_match_data(dev);
21bf6fc47a1e45 drivers/phy/ti/phy-ti-pipe3.c Rob Herring            2023-10-09  802  	if (!data)
22940823f0629b drivers/phy/ti/phy-ti-pipe3.c Roger Quadros          2019-03-22  803  		return -EINVAL;
22940823f0629b drivers/phy/ti/phy-ti-pipe3.c Roger Quadros          2019-03-22  804  
1fe521225a830e drivers/phy/phy-ti-pipe3.c    Kishon Vijay Abraham I 2015-12-21  805  	phy->dev = dev;
22940823f0629b drivers/phy/ti/phy-ti-pipe3.c Roger Quadros          2019-03-22  806  	phy->mode = data->mode;
22940823f0629b drivers/phy/ti/phy-ti-pipe3.c Roger Quadros          2019-03-22  807  	phy->dpll_map = data->dpll_map;
fdef2f9f700fab drivers/phy/ti/phy-ti-pipe3.c Roger Quadros          2019-03-22  808  	phy->settings = data->settings;
1fe521225a830e drivers/phy/phy-ti-pipe3.c    Kishon Vijay Abraham I 2015-12-21  809  
1fe521225a830e drivers/phy/phy-ti-pipe3.c    Kishon Vijay Abraham I 2015-12-21  810  	ret = ti_pipe3_get_pll_base(phy);
1fe521225a830e drivers/phy/phy-ti-pipe3.c    Kishon Vijay Abraham I 2015-12-21  811  	if (ret)
1fe521225a830e drivers/phy/phy-ti-pipe3.c    Kishon Vijay Abraham I 2015-12-21  812  		return ret;
1fe521225a830e drivers/phy/phy-ti-pipe3.c    Kishon Vijay Abraham I 2015-12-21  813  
2796ceb0c18a5a drivers/phy/ti/phy-ti-pipe3.c Kishon Vijay Abraham I 2017-10-09  814  	ret = ti_pipe3_get_tx_rx_base(phy);
2796ceb0c18a5a drivers/phy/ti/phy-ti-pipe3.c Kishon Vijay Abraham I 2017-10-09  815  	if (ret)
2796ceb0c18a5a drivers/phy/ti/phy-ti-pipe3.c Kishon Vijay Abraham I 2017-10-09  816  		return ret;
2796ceb0c18a5a drivers/phy/ti/phy-ti-pipe3.c Kishon Vijay Abraham I 2017-10-09  817  
73bbc78e57c96a drivers/phy/phy-ti-pipe3.c    Kishon Vijay Abraham I 2015-12-21  818  	ret = ti_pipe3_get_sysctrl(phy);
73bbc78e57c96a drivers/phy/phy-ti-pipe3.c    Kishon Vijay Abraham I 2015-12-21  819  	if (ret)
73bbc78e57c96a drivers/phy/phy-ti-pipe3.c    Kishon Vijay Abraham I 2015-12-21  820  		return ret;
234738ea33903a drivers/phy/phy-ti-pipe3.c    Kishon Vijay Abraham I 2015-12-21  821  
234738ea33903a drivers/phy/phy-ti-pipe3.c    Kishon Vijay Abraham I 2015-12-21  822  	ret = ti_pipe3_get_clk(phy);
234738ea33903a drivers/phy/phy-ti-pipe3.c    Kishon Vijay Abraham I 2015-12-21  823  	if (ret)
234738ea33903a drivers/phy/phy-ti-pipe3.c    Kishon Vijay Abraham I 2015-12-21  824  		return ret;
234738ea33903a drivers/phy/phy-ti-pipe3.c    Kishon Vijay Abraham I 2015-12-21  825  
57f6ce072e3577 drivers/usb/phy/omap-usb3.c   Kishon Vijay Abraham I 2013-01-25  826  	platform_set_drvdata(pdev, phy);
d65ff52eb8ed5c drivers/phy/phy-ti-pipe3.c    Kishon Vijay Abraham I 2015-12-21  827  	pm_runtime_enable(dev);
c934b3612747bd drivers/phy/phy-ti-pipe3.c    Roger Quadros          2015-07-17  828  
c934b3612747bd drivers/phy/phy-ti-pipe3.c    Roger Quadros          2015-07-17  829  	/*
c934b3612747bd drivers/phy/phy-ti-pipe3.c    Roger Quadros          2015-07-17  830  	 * Prevent auto-disable of refclk for SATA PHY due to Errata i783
c934b3612747bd drivers/phy/phy-ti-pipe3.c    Roger Quadros          2015-07-17  831  	 */
22940823f0629b drivers/phy/ti/phy-ti-pipe3.c Roger Quadros          2019-03-22  832  	if (phy->mode == PIPE3_MODE_SATA) {
c934b3612747bd drivers/phy/phy-ti-pipe3.c    Roger Quadros          2015-07-17  833  		if (!IS_ERR(phy->refclk)) {
0a0830feb2adce drivers/phy/phy-ti-pipe3.c    Roger Quadros          2015-06-02  834  			clk_prepare_enable(phy->refclk);
c934b3612747bd drivers/phy/phy-ti-pipe3.c    Roger Quadros          2015-07-17  835  			phy->sata_refclk_enabled = true;
c934b3612747bd drivers/phy/phy-ti-pipe3.c    Roger Quadros          2015-07-17  836  		}
c934b3612747bd drivers/phy/phy-ti-pipe3.c    Roger Quadros          2015-07-17  837  	}
a70143bbef6bf0 drivers/phy/phy-ti-pipe3.c    Kishon Vijay Abraham I 2014-03-03  838  
d65ff52eb8ed5c drivers/phy/phy-ti-pipe3.c    Kishon Vijay Abraham I 2015-12-21  839  	generic_phy = devm_phy_create(dev, NULL, &ops);
a70143bbef6bf0 drivers/phy/phy-ti-pipe3.c    Kishon Vijay Abraham I 2014-03-03  840  	if (IS_ERR(generic_phy))
a70143bbef6bf0 drivers/phy/phy-ti-pipe3.c    Kishon Vijay Abraham I 2014-03-03  841  		return PTR_ERR(generic_phy);
a70143bbef6bf0 drivers/phy/phy-ti-pipe3.c    Kishon Vijay Abraham I 2014-03-03  842  
a70143bbef6bf0 drivers/phy/phy-ti-pipe3.c    Kishon Vijay Abraham I 2014-03-03  843  	phy_set_drvdata(generic_phy, phy);
cc34ace73dfa24 drivers/phy/phy-ti-pipe3.c    Kishon Vijay Abraham I 2015-12-21  844  
cc34ace73dfa24 drivers/phy/phy-ti-pipe3.c    Kishon Vijay Abraham I 2015-12-21  845  	ti_pipe3_power_off(generic_phy);
cc34ace73dfa24 drivers/phy/phy-ti-pipe3.c    Kishon Vijay Abraham I 2015-12-21  846  
d65ff52eb8ed5c drivers/phy/phy-ti-pipe3.c    Kishon Vijay Abraham I 2015-12-21  847  	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
045ef3115382fa drivers/phy/phy-ti-pipe3.c    Vivek Gautam           2016-10-20 @848  	return PTR_ERR_OR_ZERO(phy_provider);
57f6ce072e3577 drivers/usb/phy/omap-usb3.c   Kishon Vijay Abraham I 2013-01-25  849  }
57f6ce072e3577 drivers/usb/phy/omap-usb3.c   Kishon Vijay Abraham I 2013-01-25  850  

:::::: The code at line 848 was first introduced by commit
:::::: 045ef3115382fab2c16f2692411296ebfba60256 phy: Fix ptr_ret.cocci warnings

:::::: TO: Vivek Gautam <vivek.gautam@codeaurora.org>
:::::: CC: Kishon Vijay Abraham I <kishon@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
