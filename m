Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710372;
	b=VeKAmKIAdT/ldUGe/SI80Cy8NTFvYpxeGklyVBBldl/T25VdupnugHj2fCOnw04/w8xw
	 B8FqHEmbFCnsDXVFKl2oa40iy+5Hn+r5RH3pinO/iwG1nve9jjfo9uxaaLogqJVNAsMC1
	 UOBVkMbG5eldMR69h5AhwCb3JLvWJC9BGpbYUx0baIZY8DgN3qJT+lnuEmzn/mQcRZ2LA
	 Q24JrTZI2fo5OI2JN8kA6hThtrJFYtu9cLEEnd85Bd7NBu42vaB9u/aduzv05hft5ccSX
	 29O7/wWT/kUE6QEsZSENFFHiEosfkR5NTVTknfg0T46mz8QnHbhbX2nC+CQ3iL+wGaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710372;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=riXNZF1JwOcVAtFq8FgK8QvetRKD7sbR0R3zXpsT4RU=;
	b=Wawv4200HE+m0Zzhg6YpW8McgMg+FAoFemNC4EbXIKTTpwxQedaO0AaanXZFjlmCbRVS
	 +qWIQ4mIUmnAiycAC+mVD/YPw2n0adSttZeZcQtbtACGRQPEPKZRnsVgyBiOCTV7N8FjZ
	 3TFrkWivbqQT+HBQpsZ2kh2fC5Z0qUK8iTapwOsq7q0/ReEsSB4evtbq1JHuawfGYOqP2
	 IhjCy0BvLqqUpotiTYlvqVTA2sd3VliqEjZOWz5wh5vwl9QrAkyXTJFXu0zXqV0BJ4jX2
	 sEEuIY9qgvdFZXc5SrR610DT9vtL4dxBcjaeO0OZANT1vwDQbx2Vj1Y8MoU8/hjjhYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gI2PAZnC;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE1C606A321
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Nov 2026 16:26:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FE1C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gI2PAZnC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795710371; x=1827246371;
  h=date:from:to:cc:subject:message-id;
  bh=vsphLnoGUp4rpvsKL82R3LKvkgdDhOABmeB8WbhOiFU=;
  b=gI2PAZnC5zJaxC0ppAMmCTzfs0Om9JVwGWgqhO3cpaAxCxq0Hzf/1G/s
   vDJlKf3rm9bl5ks/nZh8QQN/Lfp+RpjDofSYVUr9A0BF0sxj1cj8r3AAC
   kmGOCNGS6iwEJTaiQroQYzz9EqBpM7xdcXAcHdG/GTFVOEBljpTamAb6Z
   4SkFZHELOLUNqriuVJphrCwHQhxH9ADMwIaWpjmIHSZJx0rmC7n4h4kPh
   AlBYWkGsHgufFMMgdFpnxzT9Bh6dkLoA8KuBI9JwMI+e/W+aNNIEYyMQ1
   XVK4qBdRNXVsE5lNCm35I98s3qbJLdlMXTS0MrOLnfrVpF2zYCrMphK22
   A==;
X-CSE-ConnectionGUID: MMD3KAaAQjGaxHWSlwH3hA==
X-CSE-MsgGUID: hF+34I3zQMGDy4+njgwXJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4642687"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4642687"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 08:26:10 -0800
X-CSE-ConnectionGUID: GP+kCl0kQzCmG+ZO/wxpZw==
X-CSE-MsgGUID: nak12qTYQ3+fLOoWzOpA8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="12239366"
Received: from igk-lkp-server01.igk.intel.com (HELO 800201f3098f) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 26 Nov 2026 08:26:10 -0800
Received: from kbuild by 800201f3098f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWcIR-0000000006s-2HCN;
	Thu, 26 Nov 2026 16:26:07 +0000
Date: Thu, 26 Nov 2026 17:25:22 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-li:imx/dt64 137/145]
 arch/arm64/boot/dts/freescale/imx93-var-dart-sonata-m33.dtb: remoteproc-cm33
 (fsl,imx93-cm33): 'memory-region-names' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <20261126172148.BZCWHLTB-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Stefano Radaelli <stefano.r@variscite.com>
CC: Frank Li <Frank.Li@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git imx/dt64
head:   8cfe8506008e75f27c7299715bf3ab75732ee18c
commit: df9c60741e857ee54c8619e069854e110d05e612 [137/145] arm64: dts: imx93-var: Add Cortex-M33 configurations
:::::: branch date: 20 hours ago
:::::: commit date: 22 hours ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261126/20261126172148.BZCWHLTB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev9+g7453fd0b0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126172148.BZCWHLTB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261126172148.BZCWHLTB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx93-var-dart-sonata-m33.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-var-dart-sonata-m33.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-var-dart-sonata-m33.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-var-dart-sonata-m33.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-var-dart-sonata-m33.dtb: gpio@47400000 (fsl,imx93-gpio): clocks: [[6, 116]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-var-dart-sonata-m33.dtb: remoteproc-cm33 (fsl,imx93-cm33): 'memory-region-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/remoteproc/fsl,imx-rproc.yaml
--
   arch/arm64/boot/dts/freescale/imx93-var-som-symphony-m33.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-var-som-symphony-m33.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-var-som-symphony-m33.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-var-som-symphony-m33.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-var-som-symphony-m33.dtb: gpio@47400000 (fsl,imx93-gpio): clocks: [[6, 116]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-var-som-symphony-m33.dtb: remoteproc-cm33 (fsl,imx93-cm33): 'memory-region-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/remoteproc/fsl,imx-rproc.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
