Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AFEA50
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Mar 2025 00:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742429297; cv=none; b=TzlXay0Qk8Co8q/MTsWM7gH/zP+066F+YvGdcTJM8OA//wMAz2pSJGgzdMWiOGC5RySu3pjPbUxHeA25Af3P2Hqbq7GTztUBR7NrqV0g/aypvJeqcJajmkzZd4ig9Xij2Ug+tBD1CrL+l4V1rPhJqu4Qjzua/ogk2X0z8PFFGI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742429297; c=relaxed/simple;
	bh=MiUghm+b4NNoea1KWAsf/Tod82rHo1MvXSgtVzZ95G4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Id6WWedzA8ABElUwIUXPWTApnMiQ92341oSFyCrDn/YM5DO/HMGaldC2/wtXkRtRGgMqB9zmH6Jjm2hJwhMglad43MeRpjK1PJWBvB66QvB3wB2qAQT0s75HQhY7LYb9VQcD4F13xrpT20d/nOR3DdvYUw8eX6hvFq8TsI+H1rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eDGTkHTa; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eDGTkHTa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742429296; x=1773965296;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MiUghm+b4NNoea1KWAsf/Tod82rHo1MvXSgtVzZ95G4=;
  b=eDGTkHTasjNO55lE6mp3xHM2Cf2Mx4ZWgxQZ44YAd/i4CNB5/h5LjMlz
   o2QS8tXRRJqiHGLFdMXOp2dpSh5fKIh20v+YzUrxVw/IN4oJEuu6ixAqe
   uTGknn3q4alhbsqNeOQaWRPa3mucD/Gq0Z8eEtykuUOFq0KKZIt5IkxKJ
   EzsAc3pcF2fP8O8PhCB9j/ohEG8rj6TFMYchoYblFovNDivOAbphLyV90
   tzqUae3BQ7M8Eqs0bV2RehmkxVSSafgN84ePmatsd2OQPwI0+PgkJsu4L
   1iZh4Jxg/dwGIqR3dIIS1Ba1i0CSFnIh1qMgUwDJ5LFk7PK/VGbc8l3gf
   w==;
X-CSE-ConnectionGUID: 0Em82a5/SH+bXIinhW18Mw==
X-CSE-MsgGUID: mGehkGBSRHKrQNrOrDLclw==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="43756799"
X-IronPort-AV: E=Sophos;i="6.14,260,1736841600"; 
   d="scan'208";a="43756799"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2025 17:08:15 -0700
X-CSE-ConnectionGUID: HhVRv2n+SfK2pVr10m7xcA==
X-CSE-MsgGUID: P08AwRIbRLyyuuTS6fPNsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,260,1736841600"; 
   d="scan'208";a="153751469"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 19 Mar 2025 17:08:14 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tv3SF-00001z-1v;
	Thu, 20 Mar 2025 00:08:11 +0000
Date: Thu, 20 Mar 2025 08:07:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [morimoto:sound-msiof-2025-03-18-2 3/11]
 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dtb: regulator-vcc-sdhi:
 'gpios' is a required property
Message-ID: <202503200855.a1DYyC2z-lkp@intel.com>
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
TO: Marek Vasut <marek.vasut+renesas@mailbox.org>
CC: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

tree:   https://github.com/morimoto/linux sound-msiof-2025-03-18-2
head:   920e565f45c3b4a2065fdab49586b975b90f1712
commit: df1969bba83d97b1d9d0e36ccf1fad660f9c3967 [3/11] arm64: dts: renesas: r8a779g3: Add Renesas R-Car V4H Sparrow Hawk board support
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-052-20250319 (https://download.01.org/0day-ci/archive/20250320/202503200855.a1DYyC2z-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.3.dev5+g0f9dc23
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250320/202503200855.a1DYyC2z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503200855.a1DYyC2z-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1357.12-1367.7: Warning (graph_child_address): /soc/video@e6ef0000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1386.12-1396.7: Warning (graph_child_address): /soc/video@e6ef1000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1415.12-1425.7: Warning (graph_child_address): /soc/video@e6ef2000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1444.12-1454.7: Warning (graph_child_address): /soc/video@e6ef3000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1473.12-1483.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1502.12-1512.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1531.12-1541.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1560.12-1570.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:2244.12-2254.7: Warning (graph_child_address): /soc/isp@fed00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dtb: regulator-vcc-sdhi: 'gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/gpio-regulator.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dtb: regulator-vcc-sdhi: Unevaluated properties are not allowed ('gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/gpio-regulator.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
