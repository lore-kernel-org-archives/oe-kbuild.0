Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E8F3B0AFB
	for <oe-kbuild@lists.linux.dev>; Thu,  1 Oct 2026 23:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790898890; cv=none; b=oFylYIDGmMOxSL/7JVe9QIghda6nu8f7Gfvav5VTVSvsDddHcV7WNt+9Q0NqSLF7OG8b/Hi8L1sDeVsLXJODSvhU81Dh/RzHu2rayztgNcl13YrcPYL0L5PTfjIM6JUim3W2p6LZMRZf1OQ7QVmSvnHmd5Sa2hG52cWSukAPd+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790898890; c=relaxed/simple;
	bh=duTriYXLVfnzV/CZIMNVlJHcFyQPPv/SSQMC3FbwBis=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dQe3F6BvS07IGEHApzeow7HeAsnhIGmlsK4x7eyb65hRo+dIXhcFCYkgyghAkVI9S3wX8nAKTxYjV2chShK0XfKO6FmESi4vFShbM5MS5evpvh+GRlVkAuYB9vLwbmWgAEB4Lfp894VOEwTLFS6isfWtm+9bGNaD4L4I46BprGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kLF+gZ+L; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kLF+gZ+L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790898888; x=1822434888;
  h=date:from:to:cc:subject:message-id;
  bh=duTriYXLVfnzV/CZIMNVlJHcFyQPPv/SSQMC3FbwBis=;
  b=kLF+gZ+LE36+4eOKYoHgJiY/TNCjnEvYIyvDR9OJHz77s5KMIvCOHhcn
   64nvhDIgN3dM3TXmeBk0/7yFBOKLYoczPIKvryOcAFjkroOt8+S7mhFvW
   OV6Og7DoC5lGsZ8UONE6ycxuwxNtmlxB2belF4UHNzrY/tq0AMBLqN4dJ
   fej8QzcGlQLb7lsHb9/5u3yiL17cii7KMcv1bNnAclg9d+LnOw87M2Xbf
   v2SWASzsS6/Jm7MbDm/VzE6zs3Ks4ial4pdlpeeL2Wx6br0Rom5i1MviY
   fyr3rZX/yKzd2jBX1VYcCSODpW4kIZBadFCNlSRmRf/NFLW/qqjjjA9KA
   Q==;
X-CSE-ConnectionGUID: NQnbr5WbSqqecpmrBa2RFQ==
X-CSE-MsgGUID: UkyL7IU8SXa7ohhNzJauPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="94551892"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="94551892"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 16:54:47 -0700
X-CSE-ConnectionGUID: YNtSjKVhTe6OH8k1XD5W4g==
X-CSE-MsgGUID: G42zP2FBREKGh5ivfHVCPg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 01 Oct 2026 16:54:46 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCQbs-00000000SVG-1I3T;
	Thu, 01 Oct 2026 23:54:44 +0000
Date: Fri, 02 Oct 2026 07:54:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/media/i2c/imx219.c:1053:12: warning:
 'imx219_power_on' defined but not used
Message-ID: <202610020736.6Mh3IWdr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Mattijs-Korpershoek/media-imx219-Move-LP-11-state-switch-to-power_on/20261001-145519, commit: bd5cfc31508e17cb9fbe84c9cce7e0cf90946f97"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Mattijs Korpershoek <mkorpershoek@kernel.org>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Mattijs-Korpershoek/media-imx219-Move-LP-11-state-switch-to-power_on/20261001-145519
head:   18288596e9f9f87a17687c2897086168462d7648
commit: bd5cfc31508e17cb9fbe84c9cce7e0cf90946f97 media: imx219: Allow driver probe with missing sensor
date:   11 hours ago
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: nios2-randconfig-1001-20261002 (https://download.01.org/0day-ci/archive/20261002/202610020736.6Mh3IWdr-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610020736.6Mh3IWdr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610020736.6Mh3IWdr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/imx219.c:1053:12: warning: 'imx219_power_on' defined but not used [-Wunused-function]
    1053 | static int imx219_power_on(struct device *dev)
         |            ^~~~~~~~~~~~~~~


vim +/imx219_power_on +1053 drivers/media/i2c/imx219.c

1283b3b8f82b90 Dave Stevenson      2020-01-20  1048  
d03dfb7d4c5fae Laurent Pinchart    2023-09-24  1049  /* -----------------------------------------------------------------------------
d03dfb7d4c5fae Laurent Pinchart    2023-09-24  1050   * Power management
d03dfb7d4c5fae Laurent Pinchart    2023-09-24  1051   */
ceddfd4493b334 Adam Ford           2022-12-20  1052  
d03dfb7d4c5fae Laurent Pinchart    2023-09-24 @1053  static int imx219_power_on(struct device *dev)
1283b3b8f82b90 Dave Stevenson      2020-01-20  1054  {
d03dfb7d4c5fae Laurent Pinchart    2023-09-24  1055  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
d03dfb7d4c5fae Laurent Pinchart    2023-09-24  1056  	struct imx219 *imx219 = to_imx219(sd);
d03dfb7d4c5fae Laurent Pinchart    2023-09-24  1057  	int ret;
1283b3b8f82b90 Dave Stevenson      2020-01-20  1058  
d03dfb7d4c5fae Laurent Pinchart    2023-09-24  1059  	ret = regulator_bulk_enable(IMX219_NUM_SUPPLIES,
d03dfb7d4c5fae Laurent Pinchart    2023-09-24  1060  				    imx219->supplies);
d03dfb7d4c5fae Laurent Pinchart    2023-09-24  1061  	if (ret) {
d03dfb7d4c5fae Laurent Pinchart    2023-09-24  1062  		dev_err(dev, "%s: failed to enable regulators\n",
d03dfb7d4c5fae Laurent Pinchart    2023-09-24  1063  			__func__);
1283b3b8f82b90 Dave Stevenson      2020-01-20  1064  		return ret;
d03dfb7d4c5fae Laurent Pinchart    2023-09-24  1065  	}
1283b3b8f82b90 Dave Stevenson      2020-01-20  1066  
d03dfb7d4c5fae Laurent Pinchart    2023-09-24  1067  	ret = clk_prepare_enable(imx219->xclk);
d03dfb7d4c5fae Laurent Pinchart    2023-09-24  1068  	if (ret) {
d03dfb7d4c5fae Laurent Pinchart    2023-09-24  1069  		dev_err(dev, "%s: failed to enable clock\n",
d03dfb7d4c5fae Laurent Pinchart    2023-09-24  1070  			__func__);
d03dfb7d4c5fae Laurent Pinchart    2023-09-24  1071  		goto reg_off;
d03dfb7d4c5fae Laurent Pinchart    2023-09-24  1072  	}
49b94d580abc47 Andrey Konovalov    2021-01-26  1073  
9d108d226224b9 Krzysztof Kozlowski 2025-08-18  1074  	/*
9d108d226224b9 Krzysztof Kozlowski 2025-08-18  1075  	 * Note: Misinterpretation of reset assertion - do not re-use this code.
9d108d226224b9 Krzysztof Kozlowski 2025-08-18  1076  	 * XCLR pin is using incorrect (for reset signal) logical level.
9d108d226224b9 Krzysztof Kozlowski 2025-08-18  1077  	 */
d03dfb7d4c5fae Laurent Pinchart    2023-09-24  1078  	gpiod_set_value_cansleep(imx219->reset_gpio, 1);
d03dfb7d4c5fae Laurent Pinchart    2023-09-24  1079  	usleep_range(IMX219_XCLR_MIN_DELAY_US,
d03dfb7d4c5fae Laurent Pinchart    2023-09-24  1080  		     IMX219_XCLR_MIN_DELAY_US + IMX219_XCLR_DELAY_RANGE_US);
1283b3b8f82b90 Dave Stevenson      2020-01-20  1081  
bd5cfc31508e17 Mattijs Korpershoek 2026-10-01  1082  	/*
bd5cfc31508e17 Mattijs Korpershoek 2026-10-01  1083  	 * If we can't identify the module here, it might be disconnected.
bd5cfc31508e17 Mattijs Korpershoek 2026-10-01  1084  	 * Consider power_on() complete and exit early in that case.
bd5cfc31508e17 Mattijs Korpershoek 2026-10-01  1085  	 */
bd5cfc31508e17 Mattijs Korpershoek 2026-10-01  1086  	ret = imx219_identify_module(imx219);
bd5cfc31508e17 Mattijs Korpershoek 2026-10-01  1087  	if (ret)
bd5cfc31508e17 Mattijs Korpershoek 2026-10-01  1088  		return 0;
bd5cfc31508e17 Mattijs Korpershoek 2026-10-01  1089  
70f13b5683f82c Mattijs Korpershoek 2026-10-01  1090  	/*
70f13b5683f82c Mattijs Korpershoek 2026-10-01  1091  	 * Sensor doesn't enter LP-11 state upon power up until and unless
70f13b5683f82c Mattijs Korpershoek 2026-10-01  1092  	 * streaming is started, so upon power up switch the modes to:
70f13b5683f82c Mattijs Korpershoek 2026-10-01  1093  	 * streaming -> standby
70f13b5683f82c Mattijs Korpershoek 2026-10-01  1094  	 */
70f13b5683f82c Mattijs Korpershoek 2026-10-01  1095  	ret = cci_write(imx219->regmap, IMX219_REG_MODE_SELECT,
70f13b5683f82c Mattijs Korpershoek 2026-10-01  1096  			IMX219_MODE_STREAMING, NULL);
70f13b5683f82c Mattijs Korpershoek 2026-10-01  1097  	if (ret < 0)
70f13b5683f82c Mattijs Korpershoek 2026-10-01  1098  		goto gpio_off;
70f13b5683f82c Mattijs Korpershoek 2026-10-01  1099  
70f13b5683f82c Mattijs Korpershoek 2026-10-01  1100  	usleep_range(100, 110);
70f13b5683f82c Mattijs Korpershoek 2026-10-01  1101  
70f13b5683f82c Mattijs Korpershoek 2026-10-01  1102  	/* put sensor back to standby mode */
70f13b5683f82c Mattijs Korpershoek 2026-10-01  1103  	ret = cci_write(imx219->regmap, IMX219_REG_MODE_SELECT,
70f13b5683f82c Mattijs Korpershoek 2026-10-01  1104  			IMX219_MODE_STANDBY, NULL);
70f13b5683f82c Mattijs Korpershoek 2026-10-01  1105  	if (ret < 0)
70f13b5683f82c Mattijs Korpershoek 2026-10-01  1106  		goto gpio_off;
70f13b5683f82c Mattijs Korpershoek 2026-10-01  1107  
70f13b5683f82c Mattijs Korpershoek 2026-10-01  1108  	usleep_range(100, 110);
70f13b5683f82c Mattijs Korpershoek 2026-10-01  1109  
d03dfb7d4c5fae Laurent Pinchart    2023-09-24  1110  	return 0;
1283b3b8f82b90 Dave Stevenson      2020-01-20  1111  
70f13b5683f82c Mattijs Korpershoek 2026-10-01  1112  gpio_off:
70f13b5683f82c Mattijs Korpershoek 2026-10-01  1113  	gpiod_set_value_cansleep(imx219->reset_gpio, 0);
70f13b5683f82c Mattijs Korpershoek 2026-10-01  1114  	clk_disable_unprepare(imx219->xclk);
70f13b5683f82c Mattijs Korpershoek 2026-10-01  1115  
d03dfb7d4c5fae Laurent Pinchart    2023-09-24  1116  reg_off:
d03dfb7d4c5fae Laurent Pinchart    2023-09-24  1117  	regulator_bulk_disable(IMX219_NUM_SUPPLIES, imx219->supplies);
1283b3b8f82b90 Dave Stevenson      2020-01-20  1118  
d03dfb7d4c5fae Laurent Pinchart    2023-09-24  1119  	return ret;
d03dfb7d4c5fae Laurent Pinchart    2023-09-24  1120  }
1283b3b8f82b90 Dave Stevenson      2020-01-20  1121  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
