Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307D51E835C
	for <oe-kbuild@lists.linux.dev>; Sun, 13 Jul 2025 23:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752448835; cv=none; b=nS7bXHv+HuHo3zBYdWZ/FQb5Yx7hjA1lhIuiJamKDq1MgznN8Lh3uHr/CySefBagz60IEZng9SbDlwZhXPiwgbwDOBS1pOb9TqCrDzT0xD4C6r49PuzbVlnm/tgq3JNX4ZtoHHOGSBPFJtIFOM4DmG1IO0u2TqgGMdcez8vPmmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752448835; c=relaxed/simple;
	bh=mRwRSa1ar8mm+4SKXU2e0DTqTg6kwwJG9xE6NrdjMuE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mquokh3sud9I+fNhQw/x3Pn1Ek7zZClMoiyVG5q7+3j1KT9UMu1YDJhJGIHlKWGLcam0zz7aVhAFS6McPgPvJtxbsrTtqRya7PBxh5/iBb9FQTnltl+tSF9Ie+QFuPL21q7o35WmbBwpocd8Vy8ASudymS1bXiYllxrsFEdiTSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QbelHJxy; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QbelHJxy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752448833; x=1783984833;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mRwRSa1ar8mm+4SKXU2e0DTqTg6kwwJG9xE6NrdjMuE=;
  b=QbelHJxymThwC/aGl3IdOQMf2OSsJVFG78Ud3lPFtWvvmcbZ1FdYB9Ae
   pIyN5wl5SzBQCnolSRXqo+3KezslpUDQsnmOmypRFOyIFmFCquAICsovA
   UTISFrRzFUlA7cpDDh3Yj+/DctuA/AQINJVk8asHJaAkhi3QTI3inKHXL
   0d6lvdvZmtIuUFHHqcvTQasOaQ1NM+TjkcFgCmQZQPJHurWl9pboi3qHf
   C+nWObhVu6KG8cN3XGwxhOUq/MZaqHoDm2G9SedYbJdOGiIXEEOXBTZB8
   ii+c0KKw4m1x1SsC6iT8JpBVOz2unHfqkTEICWAeaAGoBK7AFcugii3rM
   Q==;
X-CSE-ConnectionGUID: OqUJ4BS3RGePLXwI9azrjQ==
X-CSE-MsgGUID: Zy3LTCgZSfym7J7YWIHq8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="72088585"
X-IronPort-AV: E=Sophos;i="6.16,309,1744095600"; 
   d="scan'208";a="72088585"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2025 16:20:33 -0700
X-CSE-ConnectionGUID: Tw2yL0nDRsSCd0iLp/ClfQ==
X-CSE-MsgGUID: DeqFdSQbRE+Jtt55KR4V+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,309,1744095600"; 
   d="scan'208";a="161342603"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 13 Jul 2025 16:20:32 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ub5zh-0008LF-1s;
	Sun, 13 Jul 2025 23:20:29 +0000
Date: Mon, 14 Jul 2025 07:20:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [shawnguo:imx/dt64 74/85]
 arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: /
 (phytec,imx95-libra-rdk-fpsc): compatible: 'oneOf' conditional failed, one
 must be fixed:
Message-ID: <202507140722.Xp5QghyC-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
TO: Yannic Moog <y.moog@phytec.de>
CC: Shawn Guo <shawnguo@kernel.org>
CC: Frank Li <Frank.Li@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git imx/dt64
head:   4f25d7f1439f12233768dce853260b8302424d16
commit: 911e3962564861704451a7abeafd4e2383559e47 [74/85] arm64: dts: add imx95-libra-rdk-fpsc board
:::::: branch date: 22 hours ago
:::::: commit date: 3 days ago
config: arm64-randconfig-054-20250712 (https://download.01.org/0day-ci/archive/20250714/202507140722.Xp5QghyC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250714/202507140722.Xp5QghyC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507140722.Xp5QghyC-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: / (phytec,imx95-libra-rdk-fpsc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['phytec,imx95-libra-rdk-fpsc', 'phytec,imx95-phycore-fpsc', 'fsl,imx95'] is too long
   	['phytec,imx95-libra-rdk-fpsc', 'phytec,imx95-phycore-fpsc', 'fsl,imx95'] is too short
>> 	arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: / (phytec,imx95-libra-rdk-fpsc): compatible: 'oneOf' conditional failed, one must be fixed:
   		'phytec,imx95-libra-rdk-fpsc' is not one of ['tq,imx8dxp-tqma8xdp-mba8xx']
   		'phytec,imx95-libra-rdk-fpsc' is not one of ['tq,imx8qxp-tqma8xqp-mba8xx']
   		'tq,imx8dxp-tqma8xdp' was expected
   		'tq,imx8qxp-tqma8xqp' was expected
   		'fsl,imx8dxp' was expected
   		'fsl,imx8qxp' was expected
>> 	arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: / (phytec,imx95-libra-rdk-fpsc): compatible: 'oneOf' conditional failed, one must be fixed:
   		'phytec,imx95-libra-rdk-fpsc' is not one of ['tq,imx8qxp-tqma8xqps-mb-smarc-2']
   		'phytec,imx95-libra-rdk-fpsc' is not one of ['tq,imx8dxp-tqma8xdps-mb-smarc-2']
   		'tq,imx8qxp-tqma8xqps' was expected
   		'tq,imx8dxp-tqma8xdps' was expected
   		'fsl,imx8qxp' was expected
   		'fsl,imx8dxp' was expected
   	'phytec,imx95-libra-rdk-fpsc' is not one of ['armadeus,imx1-apf9328', 'fsl,imx1ads']
   	'phytec,imx95-libra-rdk-fpsc' is not one of ['creative,x-fi3', 'fsl,imx23-evk', 'fsl,stmp378x-devb', 'olimex,imx23-olinuxino', 'sandisk,sansa_fuze_plus']
   	'phytec,imx95-libra-rdk-fpsc' is not one of ['fsl,imx25-pdk', 'karo,imx25-tx25']
   	'phytec,imx95-libra-rdk-fpsc' is not one of ['eukrea,mbimxsd25-baseboard']
--
   	'tq,imx6dl-tqma6dl-b' was expected
   	'phytec,imx6ul-pcl063' was expected
   	'phytec,imx6ull-pcl063' was expected
   	'fsl,imx6ulz' was expected
   	'toradex,verdin-imx8mm' was expected
   	'avnet,sm2s-imx8mp' was expected
   	'toradex,verdin-imx8mp' was expected
   	'fsl,imx95' is not one of ['fsl,imx8qxp', 'fsl,imx8dx']
   	'fsl,vf500' was expected
   	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml#
>> arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: /: failed to match any schema with compatible: ['phytec,imx95-libra-rdk-fpsc', 'phytec,imx95-phycore-fpsc', 'fsl,imx95']
>> arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: /: failed to match any schema with compatible: ['phytec,imx95-libra-rdk-fpsc', 'phytec,imx95-phycore-fpsc', 'fsl,imx95']
>> arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: jpegdec@4c500000 (nxp,imx95-jpgdec): compatible: 'oneOf' conditional failed, one must be fixed:
   	'nxp,imx95-jpgdec' is not one of ['nxp,imx8qxp-jpgdec', 'nxp,imx8qxp-jpgenc']
   	'nxp,imx8qm-jpgdec' was expected
   	'nxp,imx8qm-jpgenc' was expected
   	'nxp,imx8qxp-jpgenc' was expected
   	from schema $id: http://devicetree.org/schemas/media/nxp,imx8-jpeg.yaml#
>> arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: jpegdec@4c500000 (nxp,imx95-jpgdec): power-domains: [[62, 21]] is too short
   	from schema $id: http://devicetree.org/schemas/media/nxp,imx8-jpeg.yaml#
>> arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: /soc/jpegdec@4c500000: failed to match any schema with compatible: ['nxp,imx95-jpgdec', 'nxp,imx8qxp-jpgdec']
>> arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: jpegenc@4c550000 (nxp,imx95-jpgenc): compatible: 'oneOf' conditional failed, one must be fixed:
   	'nxp,imx95-jpgenc' is not one of ['nxp,imx8qxp-jpgdec', 'nxp,imx8qxp-jpgenc']
   	'nxp,imx8qm-jpgdec' was expected
   	'nxp,imx8qm-jpgenc' was expected
   	'nxp,imx8qxp-jpgdec' was expected
   	from schema $id: http://devicetree.org/schemas/media/nxp,imx8-jpeg.yaml#
>> arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: jpegenc@4c550000 (nxp,imx95-jpgenc): power-domains: [[62, 21]] is too short
   	from schema $id: http://devicetree.org/schemas/media/nxp,imx8-jpeg.yaml#
>> arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: /soc/jpegenc@4c550000: failed to match any schema with compatible: ['nxp,imx95-jpgenc', 'nxp,imx8qxp-jpgenc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
