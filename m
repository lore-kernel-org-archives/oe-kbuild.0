Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D994A23D28C
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Sep 2025 03:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759204415; cv=none; b=f4e7MdWD8FxTQcT4N17NHIBhy9yyGph2S4XHLeRYVJohcpxmYgP4pRmwt/sWcY/xRe2mHL1GvjoxME1YGtQaDAUibIOvCevqVTq/1igyASsqAJG42uUIxmp1V7HoErcEVeuvJI6UKqzCB3Woqumt6l14ubElGMWYKFRbTDXSsqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759204415; c=relaxed/simple;
	bh=gts9sidDvBoQcvgW2wd44HSDfviHn/LfwKab+V9dnZw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lHukixmyS5GUsF1iLli+WjARvhagfbLmRiHnpGRYkX9QrfX51mGKRXnn9yFOBOPPOB4tP2sawMURrlCwClMaY485MZpdZbQYcFB/ZQKIDGP2S8KszeLM3s1YD7IydNhG9KeDUbsDlJVcANkEPoXb0mvdHmoGT8OJPuZMrkhSPuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GfmYRQNl; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GfmYRQNl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759204413; x=1790740413;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gts9sidDvBoQcvgW2wd44HSDfviHn/LfwKab+V9dnZw=;
  b=GfmYRQNlfmMlkHPAVjnzA+qeBINSEaDCRdwavAzCWurCs+S9NKt3NH5m
   0jpJeE1j8T8SFvyOMJBXAQRb6tR8upwE/EA2xPsgRcv8qfe4Trol98QT5
   G44biQGBYCj5PqSMEclBo5iS3jSM2DgCziZja/IgZZ9AQIHnJHbfSh2SU
   Z/zrlnZ2YDI2uIrxgBOxSHoSDqmcCl9MYV20ExKQhuyncnIn03byKtnfa
   JxlSEvjMV8Qsdq98sxY8iCoMMjVl/uyXo06cAtpQCWRAlujc6wdXTmaeg
   G++tRUd04ALB2TPo6awchHrvqsl+7wb1w98K6Akp2tcD2vitkedi37pAd
   Q==;
X-CSE-ConnectionGUID: Z4PZygu+QPmh2+8quz90tA==
X-CSE-MsgGUID: y7fEU/n1SsmI/Ov3Zj2eog==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="61165327"
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; 
   d="scan'208";a="61165327"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2025 20:52:51 -0700
X-CSE-ConnectionGUID: pENEWxmPSYCPn2BD40bPjA==
X-CSE-MsgGUID: odolt2fKSDW5jrftxtu5Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; 
   d="scan'208";a="178006348"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 29 Sep 2025 20:52:49 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v3RPz-0000t1-11;
	Tue, 30 Sep 2025 03:52:47 +0000
Date: Tue, 30 Sep 2025 11:52:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [geert-renesas-devel:renesas-dts-for-v6.19 58/59]
 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-5in.dtb:
 dsi@fed80000 (renesas,r8a779g0-dsi-csi2-tx): '#address-cells',
 '#size-cells', 'panel@0' do not match any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202509301147.qvk69ktt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-renesas-soc@vger.kernel.org
TO: Marek Vasut <marek.vasut+renesas@mailbox.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.19
head:   a9aff62b92522fb21fd0399e79d78b443c6f2ea1
commit: cedd071151520fc8ac377110dcd516cfbc067d58 [58/59] arm64: dts: renesas: sparrow-hawk: Add overlay for RPi Display 2
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: arm64-randconfig-051-20250930 (https://download.01.org/0day-ci/archive/20250930/202509301147.qvk69ktt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250930/202509301147.qvk69ktt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509301147.qvk69ktt-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-5in.dtb: touchscreen@5d (goodix,gt911): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/goodix.yaml#
   arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-5in.dtb: gpio@45 (raspberrypi,touchscreen-panel-regulator-v2): '#gpio-cells', '#pwm-cells', 'gpio-controller' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/raspberrypi,7inch-touchscreen-panel-regulator.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-5in.dtb: dsi@fed80000 (renesas,r8a779g0-dsi-csi2-tx): '#address-cells', '#size-cells', 'panel@0' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/bridge/renesas,dsi-csi2-tx.yaml#
   arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-5in.dtb: panel@0 (raspberrypi,dsi-5inch): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/panel/ilitek,ili9881c.yaml#
   arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-5in.dtb: panel@0 (raspberrypi,dsi-5inch): compatible:0: 'raspberrypi,dsi-5inch' is not one of ['ampire,am8001280g', 'bananapi,lhr050h41', 'feixin,k101-im2byl02', 'raspberrypi,dsi-7inch', 'startek,kd050hdfia020', 'tdo,tl050hdv35', 'wanchanglong,w552946aba']
   	from schema $id: http://devicetree.org/schemas/display/panel/ilitek,ili9881c.yaml#
   arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-5in.dtb: /soc/dsi@fed80000/panel@0: failed to match any schema with compatible: ['raspberrypi,dsi-5inch', 'ilitek,ili9881c']
--
   arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-7in.dtb: touchscreen@5d (goodix,gt911): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/goodix.yaml#
   arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-7in.dtb: gpio@45 (raspberrypi,touchscreen-panel-regulator-v2): '#gpio-cells', '#pwm-cells', 'gpio-controller' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/raspberrypi,7inch-touchscreen-panel-regulator.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-7in.dtb: dsi@fed80000 (renesas,r8a779g0-dsi-csi2-tx): '#address-cells', '#size-cells', 'panel@0' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/bridge/renesas,dsi-csi2-tx.yaml#
   arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-7in.dtb: panel@0 (raspberrypi,dsi-7inch): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/panel/ilitek,ili9881c.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
