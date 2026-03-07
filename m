Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2852379CD
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Mar 2026 13:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772889973; cv=none; b=G053o9LfjLNuc2SS+35AkHV/9S+Lgbp0SRz98cfX4ulLAJgDrcqi27KZh5CieZUzqJmYfBtKbVJ+EqtlAxM6h+DSi/2gvpqn+LO9EG1RFxVkjDuvKCy67/zXUjOVD3cDM4jCFE4TbXUXJB74vpcYfLnYZPTxxQvFOy4H7lN+9VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772889973; c=relaxed/simple;
	bh=f8aw40tb/ReMw81ayZdTvGq5QaKecW/RIrXzooiA+S8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TJ7ONtpd8tYDQp+WLge/y5iWKx/TTbqNuXZtZQapj/D+WA5J2UvhYhj2pyGB3RoxggisgrZGSv38rsh2/VD8e61SWoq5IPTYhBFWqu5nIAgtmWthPV0g1d/86MyGep918ipn1+VdY/DM7qES1l6pXPTSEKCkrmrBOS/LUk5wYqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n6adBY1F; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n6adBY1F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772889971; x=1804425971;
  h=date:from:to:cc:subject:message-id;
  bh=f8aw40tb/ReMw81ayZdTvGq5QaKecW/RIrXzooiA+S8=;
  b=n6adBY1FzYy+x+/4Qvndrxa5q9WrSmBqzvrm/wbEvhygus+tlBbZQgFQ
   WPhV9bfyU3vOfTVUbbdniTQPdc0lXa8or3mxfCgNWGLVY7c86PvtdqCN4
   PeSqxAIST9eYZ6qK/XBn0By+M2jq59eLnIAZ+O6tTLFFhGgTYt7idkPKf
   8RFH4XQLrCcLr5vFJ6j6U1dCRhuhNJuvZpgLgcnl0KR2QNtVrnGNlpTvS
   m78PWW1a0yP4/kSM6Xh7NMnwZdcIwktuWgfBWbmeQF9YUDgN4h/p0zfJ0
   Pbui9pejG5UCxqRTmlRMFK42x3oHaCfmrn6fB53WoGaJ4HUI5QWO9wHEa
   A==;
X-CSE-ConnectionGUID: M93Nl54hSP+6y8amm240bA==
X-CSE-MsgGUID: fSNpTjd+SxyS0j+LsYo+yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="74055433"
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="74055433"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2026 05:26:10 -0800
X-CSE-ConnectionGUID: spnoTS9qSnGipdLZn8YoPQ==
X-CSE-MsgGUID: ar5YcmTpQRmNJJhR6P2xcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="249750806"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 07 Mar 2026 05:26:10 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyrfT-000000002UJ-106m;
	Sat, 07 Mar 2026 13:26:07 +0000
Date: Sat, 07 Mar 2026 14:25:08 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-li:imx/dt64 39/47]
 arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-02.dtb:
 system-controller@4ac10000 (fsl,imx93-media-blk-ctrl): 'dpi-bridge' does not
 match any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202603071421.RYD7CcGy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Andrej Picej <andrej.picej@norik.com>
CC: Frank Li <Frank.Li@nxp.com>
CC: Primoz Fiser <primoz.fiser@norik.com>
CC: Christian Hemp <c.hemp@phytec.de>
CC: Marco Felsch <m.felsch@pengutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git imx/dt64
head:   455842162c230a6310e3cf9d9a14de9239d6763c
commit: a251f9ed77f01f16adaaa1b3d2f568fc1b5acbfd [39/47] arm64: dts: imx93-phyboard-segin: Add peb-av-02 overlay
:::::: branch date: 20 hours ago
:::::: commit date: 5 days ago
config: arm64-randconfig-2052-20260306 (https://download.01.org/0day-ci/archive/20260307/202603071421.RYD7CcGy-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603071421.RYD7CcGy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603071421.RYD7CcGy-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-02.dtb: system-controller@4ac10000 (fsl,imx93-media-blk-ctrl): 'dpi-bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx93-media-blk-ctrl.yaml
>> arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-02.dtb: /soc@0/system-controller@4ac10000/dpi-bridge: failed to match any schema with compatible: ['nxp,imx93-pdfc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
