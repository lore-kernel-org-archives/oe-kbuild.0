Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E136E144D21
	for <oe-kbuild@lists.linux.dev>; Thu, 17 Oct 2024 20:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729196573; cv=none; b=PYewLOHcTHgyiN6UOefTjTz9pUG+LWjYFSooxjCX2S3jcn04bWEBTMQf7gQ/24wrCCdtAtFpmuNVQmTrIRK1tpvLGsz9XqN/EheJ28IBwRImiMZ5np2maRj9DsWrAXU08mT1VX5HJyCHTuQAglZ6w8wM3/bXh5jj0efpJTuSVUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729196573; c=relaxed/simple;
	bh=x9Mkhu4K20anbOaBppNIdqO52eVf/L/eGyMCP2yIKcw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r9/Ei2HqBJiU8ILnW0Z2W0PwC4hFrI4mOIo8IsPSxQIa2AgQqcNSSzfeOAgvVrH5bMukc0JNVKeowTai2ObcstK7l5b7mY839kViaYg/QavzWZQSZuX3RJicY1NMHudeSWLSr1TjWjxb3TxdXz39z0XzAqBA7UgqMA05KJD7m2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WO0VbUVp; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WO0VbUVp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729196567; x=1760732567;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x9Mkhu4K20anbOaBppNIdqO52eVf/L/eGyMCP2yIKcw=;
  b=WO0VbUVpMSNTlAwHKnUAD1UPdgwWVuP7A6SFv/dfQDUYbHpz+GsP6rMB
   O37vkRBJkyrvwb56iRayxUsBd+eFpmkYyFfY39s2ng7o83eImHpVfJXYg
   TFfZ1cCD/b4Hn82DCfwcN01cgPHaH0M057K28CErYYHMKBt+AX0LW/fL9
   YRmbJkjMBPno8VeJMsQreN2261LUOGRCgpOGHSWW/wychLHQRYBrD1dcs
   Ki7oDuiWBQi867Xs+tBnBQK45BOA0/2Bq12ISOyjynpNq0UQ3Pffq09P8
   TaSzW9imwoWix9LcfgFvNtZ7t1VE8HMG3ViTYyyDkWCIdZZ4bms4paVdO
   w==;
X-CSE-ConnectionGUID: UAUMR0GLQAm8FGoFnG69Jw==
X-CSE-MsgGUID: jrH7VRyVRcCZwpOfEkJaiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28587726"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28587726"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 13:22:47 -0700
X-CSE-ConnectionGUID: CYIt9hVGQjmEmZcPL3lSXg==
X-CSE-MsgGUID: dbo+gsXARBSWph/RWY7v2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; 
   d="scan'208";a="79006151"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Oct 2024 13:22:46 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1X1A-000MtM-0s;
	Thu, 17 Oct 2024 20:22:44 +0000
Date: Fri, 18 Oct 2024 04:22:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [shawnguo:imx/dt64 16/28]
 arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: touchscreen@5d:
 'power-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
Message-ID: <202410180421.LhZvn5SB-lkp@intel.com>
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
TO: Frieder Schrempf <frieder.schrempf@kontron.de>
CC: Shawn Guo <shawnguo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git imx/dt64
head:   49c2a67787f512a18e30a892d284086d9583b3cc
commit: 946ab10e3f40fdb8d6cbce4eb38c42e718163ff3 [16/28] arm64: dts: Add support for Kontron OSM-S i.MX8MP SoM and BL carrier board
:::::: branch date: 11 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-053-20241017 (https://download.01.org/0day-ci/archive/20241018/202410180421.LhZvn5SB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241018/202410180421.LhZvn5SB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410180421.LhZvn5SB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'fsl,imx8mp' is not one of ['fsl,imx8qxp', 'fsl,imx8dx']
   	'fsl,vf500' was expected
   	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: /: failed to match any schema with compatible: ['kontron,imx8mp-bl-osm-s', 'kontron,imx8mp-osm-s', 'fsl,imx8mp']
   arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: /: failed to match any schema with compatible: ['kontron,imx8mp-bl-osm-s', 'kontron,imx8mp-osm-s', 'fsl,imx8mp']
   arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: panel: compatible:0: 'jenson,bl-jt60050-01a' is not one of ['admatec,9904379', 'auo,b101ew05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: panel: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: /panel: failed to match any schema with compatible: ['jenson,bl-jt60050-01a', 'panel-lvds']
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: touchscreen@5d: 'power-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/goodix.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
