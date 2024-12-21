Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39951DA11B
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Dec 2024 22:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734819415; cv=none; b=VyfAscWPulrjTbregtKK8Y1LEdHQ+ftek9l3VYuIibruwzOhkDuyC1ti8vqEAhpoBDdV7BSJsxfPXLMIXxNTtR1ct/63+x2ZtRtwcvY0n+S5BB/w3wg0RsHK6ynGByEuxGCtKqeGC8mcdpCXvYE0t/KEecSJBsBUkjp4MUNd2ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734819415; c=relaxed/simple;
	bh=REZx3od1fsHfuUnXLDqUccE//DRdjX2wLOIhbjgl8PM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UixsV9zG6N1lqFaH1NP3Mr0JXwBFz93fQ9I4F1r4Kw+YuwKk599v6h7KEaIg70RTIT/W+3gz20x1Ek8Mu1uzO+QOcMPHfvjR0/CigcfetZHpDyptTpyGlDubi0nehARX7yxR/69II4X4Duz90y91tL0Nfc6yJmL5+jggHkskEb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PlOLrZ/E; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PlOLrZ/E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734819412; x=1766355412;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=REZx3od1fsHfuUnXLDqUccE//DRdjX2wLOIhbjgl8PM=;
  b=PlOLrZ/EMzDp3LrnmsTlBqezIAJjowxPk+xzel8TU0NmJHz3HhkBz3tb
   rwwHgHkjehGX8q2hEz6LbH5kMZBuxK2Cnp0AOTnZ/jiGCYXVlimfUA88J
   pEn/Yyih+9oVMJp1csb/cz8cR/OJTEZFVDjQGWGVftxMEinl9qEm8+Ljo
   2IrPUtDlkMutdS7pVu3UxOZeTrPMZQ2wlHvnfZSEI8+Sqcqy1l7OOo+DO
   /be69ckZzYWZm/IgM/zF6R6c5p712Zzu3HeEoOlF/uxTZJekQp4LnKGUx
   DVF3mVDd+MPTfyNr6Q328vOuMDz4rAcmUqatYYT1Bn33phphuxrhCyaoS
   g==;
X-CSE-ConnectionGUID: poTKVlmOS4ilvRSBqrx0bg==
X-CSE-MsgGUID: zjWjXsFzTvK605WxLwFXlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="35362721"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="35362721"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 14:16:52 -0800
X-CSE-ConnectionGUID: N3+bAh/xRGqp8vR1u34idw==
X-CSE-MsgGUID: xS5Yad4XQ1eisNlX9pah1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102950655"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 Dec 2024 14:16:51 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tP7mC-0002XZ-3C;
	Sat, 21 Dec 2024 22:16:48 +0000
Date: Sun, 22 Dec 2024 06:15:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 2/6] arm64: dts: imx8mp: Configure dsp node for rproc
 usage
Message-ID: <202412220603.xBnzcO2U-lkp@intel.com>
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
In-Reply-To: <20241210125338.104959-3-daniel.baluta@nxp.com>
References: <20241210125338.104959-3-daniel.baluta@nxp.com>
TO: Daniel Baluta <daniel.baluta@nxp.com>
TO: shawnguo@kernel.org
TO: s.hauer@pengutronix.de
TO: kernel@pengutronix.de
TO: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: festevam@gmail.com
CC: devicetree@vger.kernel.org
CC: imx@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: frank.li@nxp.com
CC: aisheng.dong@nxp.com
CC: daniel.baluta@gmail.com
CC: laurentiu.mihalcea@nxp.com
CC: shengjiu.wang@nxp.com
CC: iuliana.prodan@nxp.com
CC: a.fatoum@pengutronix.de
CC: Daniel Baluta <daniel.baluta@nxp.com>

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on abelvesa/clk/imx robh/for-next linus/master v6.13-rc3 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Baluta/arm64-dts-imx8mp-Add-mu2-root-clock/20241210-205708
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20241210125338.104959-3-daniel.baluta%40nxp.com
patch subject: [PATCH v3 2/6] arm64: dts: imx8mp: Configure dsp node for rproc usage
:::::: branch date: 11 days ago
:::::: commit date: 11 days ago
config: arm64-randconfig-052-20241221 (https://download.01.org/0day-ci/archive/20241222/202412220603.xBnzcO2U-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 9daf10ff8f29ba3a88a105aaa9d2379c21b77d35)
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412220603.xBnzcO2U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412220603.xBnzcO2U-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8mp-navqp.dtb: dsp@3b6e8000: memory-region: [[111]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb: dsp@3b6e8000: memory-region: [[130]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dtb: dsp@3b6e8000: memory-region: [[126]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dtb: dsp@3b6e8000: memory-region: [[153]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dtb: dsp@3b6e8000: memory-region: [[156]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: dsp@3b6e8000: memory-region: [[120]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb: dsp@3b6e8000: memory-region: [[129]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx-2x.dtb: dsp@3b6e8000: memory-region: [[123]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: dsp@3b6e8000: memory-region: [[160]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-ivy.dtb: dsp@3b6e8000: memory-region: [[157]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: dsp@3b6e8000: memory-region: [[165]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-ivy.dtb: dsp@3b6e8000: memory-region: [[162]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: panel: compatible:0: 'jenson,bl-jt60050-01a' is not one of ['admatec,9904379', 'auo,b101ew05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: panel: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: /panel: failed to match any schema with compatible: ['jenson,bl-jt60050-01a', 'panel-lvds']
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: dsp@3b6e8000: memory-region: [[150]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds.dtb: dsp@3b6e8000: memory-region: [[153]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb: dsp@3b6e8000: memory-region: [[136]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
