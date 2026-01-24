Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCFE227B8E
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Jan 2026 15:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769268961; cv=none; b=t5U0Rf0MgT25A8dgNTgwZrk0z25jgDJhs18EQQ+vKCs3DFWXX8F460yXwDH0pWCXfUzxypG3R1hHo82N4Jd2AhM285H2H9zVaZJ58dewV7ExllJWTyPrO0jdzvo1O6cUlpjTwe4yfvOFmte+lGVoLQsuOiQiRFG0wEYBCRy4t68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769268961; c=relaxed/simple;
	bh=3VXcw1e3nncQqzdrG4Z0p6CC1v7nsN950OPMzxp2310=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bWDpyutPBwIOdvPiSGnlmzwHFv/ieuI4sj5piDFDZSLu/A8LsMWNYTJgGvhqrp9330dxfYx2g8k9MtZfLfzCHZzBNYaXWmkiPk2aCBSycYG/WkOZEVqjDlba6eol0NEVo78zJO/vh23QRAMrTh8KC4TZ+0Ge/DeOQz+mDH0jQ3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JsyBYNg9; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JsyBYNg9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769268959; x=1800804959;
  h=date:from:to:cc:subject:message-id;
  bh=3VXcw1e3nncQqzdrG4Z0p6CC1v7nsN950OPMzxp2310=;
  b=JsyBYNg92ZRjQbfuIT6Xa1V5fDci6qwi+xxJ2v5RgoPFGTBJEqxqMwDg
   U2hmF0LqhNVBlUkIjFCBEMgB+1LessqyNS0jJuWzyuCZaHE92egQCzYuD
   SzenYm1sL06CJ0+k91vFo3MQpU7JFk8ATKkd7rOVfA8VoiaSwafZyKeTS
   2Aqnte6PaGAPWnfFJvRdP7gT68d8nWK1l/vqHYAR2WQfamxZkfc1pr73p
   CqpC73dpqAdCfBVuZH3+GTDYufkJkgC0FSxmHyPVatxTRdzrLNFt32gp2
   VDJ4oehtfNXRl0v41gsu6hMWYNbHc2ck9+yuiGTLa2AxYKcOgyGtRO9SL
   g==;
X-CSE-ConnectionGUID: bE2vSFxUTxejMkxMzNymVg==
X-CSE-MsgGUID: 7ljm/DNiS6egn9D7hL02BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="70545953"
X-IronPort-AV: E=Sophos;i="6.21,250,1763452800"; 
   d="scan'208";a="70545953"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 07:35:59 -0800
X-CSE-ConnectionGUID: /fNhLTy3QPufqvY84y76gA==
X-CSE-MsgGUID: 2ZethsyHQ1CsTiSSfxgGtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,250,1763452800"; 
   d="scan'208";a="207088191"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 24 Jan 2026 07:35:58 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjfg3-0000000011h-1clD;
	Sat, 24 Jan 2026 15:35:55 +0000
Date: Sat, 24 Jan 2026 16:35:07 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/ti/omap/am571x-idk.dtb: clock@20
 (ti,clkctrl): 'assigned-clock-parents', 'assigned-clocks' do not match any of
 the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202601241647.IOrjw79p-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Andreas Kemnade <andreas@kemnade.info>
CC: Stephen Boyd <sboyd@kernel.org>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   62085877ae6592be830c2267e35dc469cb706308
commit: 944b074ff105a1541626c9492e32d248d3b1257b dt-bindings: clock: ti: Convert ti-clkctrl.txt to json-schema
date:   11 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-2055-20260118 (https://download.01.org/0day-ci/archive/20260124/202601241647.IOrjw79p-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0
dtschema version: 2025.13.dev4+g85cec3155
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601241647.IOrjw79p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601241647.IOrjw79p-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clocks/clock-dpll-gmac-x2: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@300: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: clock@300 (ti,omap4-cm): '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@400: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: clock@400 (ti,omap4-cm): '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@500: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: clock@500 (ti,omap4-cm): '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
>> arch/arm/boot/dts/ti/omap/am571x-idk.dtb: clock@20 (ti,clkctrl): 'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/ti,clkctrl.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@600: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: clock@600 (ti,omap4-cm): '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@700: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: clock@700 (ti,omap4-cm): '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: clock@760 (ti,omap4-cm): '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
