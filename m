Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A02B2E3370
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Mar 2025 16:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742141202; cv=none; b=GgkD6dMOi+MbM5ml7IiZ8KSdD1hm/WYyd68EPYR4NoCCi5e+HMVeg1G5r2Z16Cra3YeYzp+FvsZTACIzwjLPsV4lGz3xxoZt9lUu9U2hBL2o+Zh9/B9WeKvABoTBH+zHy7Mtzq252HluZHFvlAnwOrrkJHiPbp9HUzKHi6LaAHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742141202; c=relaxed/simple;
	bh=2Mt9YRLyRa70ulT9BfoOt4O6yFtl5Eax+d714IAcPyY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HrBpaaHyPfBj/NQP/wgESekqDdymxvhXGMn6UHmTg5f1sApLrIBWlMVqxFmPhXvsHvTgUsRR8cEM5ZsVlxZWR+NFgdjfujvVDIZpn9tGE7+RYySrcRg9v2dnvd3BWUfvVUR7T9sPre2/lIE7/TxNA03UNwKIYhpbtQA5BNAPj54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nYx4B1U2; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nYx4B1U2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742141200; x=1773677200;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2Mt9YRLyRa70ulT9BfoOt4O6yFtl5Eax+d714IAcPyY=;
  b=nYx4B1U2MnKz/RZ977UeXShZaptby3BqdQprAau7SKxFKcVpbOLIRHo+
   HVEpoSm1pb+SFhvNrntcQzvYMfS5IwEuh56w7eDXOUNvzFTchzPh87LpP
   A7I8nK4Vlf0lMF/+EOKsUq2VV86d6j2gWbNUb949o96M9BgvA8AIVEn/A
   UG5oTmEgs6F4IMQT9KCY4Mld4I3STjULhW384r04TON391Vx3WCrFKEl/
   gDzaPHTcIHWsUta+9j8+Tj3H5zOqe49b3nxxegfXWpAhVSMbb1xECyslR
   rxAm7BbwdgdA8QUyw4VnQevniaMkFBa8c4z1zp8c/KDngeyPVIZ00kloI
   Q==;
X-CSE-ConnectionGUID: LpMIG3QwRRSg+YJK8IHkWg==
X-CSE-MsgGUID: d9X6vbyQQGumSUNsSHmRCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="43109968"
X-IronPort-AV: E=Sophos;i="6.14,252,1736841600"; 
   d="scan'208";a="43109968"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2025 09:06:40 -0700
X-CSE-ConnectionGUID: 5n8IIP04T+KVq0fPNfXo4A==
X-CSE-MsgGUID: Ox1AHBpLRFihQm/n3Uy1Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,252,1736841600"; 
   d="scan'208";a="122477000"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 16 Mar 2025 09:06:38 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttqVY-000C5N-18;
	Sun, 16 Mar 2025 16:06:36 +0000
Date: Mon, 17 Mar 2025 00:06:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [soc:imx/dt64 65/84]
 arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb:
 clock-controller@30380000: 'fsl,operating-mode' does not match any of the
 regexes: 'pinctrl-[0-9]+'
Message-ID: <202503170043.qg0qXg1u-lkp@intel.com>
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
CC: arm@kernel.org
TO: Ahmad Fatoum <a.fatoum@pengutronix.de>
CC: Shawn Guo <shawnguo@kernel.org>
CC: Peng Fan <peng.fan@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git imx/dt64
head:   5a690619426fc4b09c7fd3f40d3a69264ef3db0f
commit: 1cf99ee00d5a1e38401be2ea409305ff3d11778e [65/84] arm64: dts: freescale: imx8mp-skov: operate SoC in nominal mode
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm64-randconfig-051-20250312 (https://download.01.org/0day-ci/archive/20250317/202503170043.qg0qXg1u-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev4+g7b57675
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250317/202503170043.qg0qXg1u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503170043.qg0qXg1u-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: clock-controller@30380000: 'fsl,operating-mode' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dtb: clock-controller@30380000: 'fsl,operating-mode' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dtb: lvds-decoder: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,sn65lvds822', 'lvds-decoder'] is too long
   	'ti,sn65lvds822' is not one of ['ti,ds90c185', 'ti,ds90c187', 'ti,sn75lvds83']
   	'ti,sn65lvds822' is not one of ['ti,ds90cf364a', 'ti,ds90cf384a', 'ti,sn65lvds94']
   	'ti,sn65lvds822' is not one of ['thine,thc63lvdm83d']
   	'lvds-encoder' was expected
   	from schema $id: http://devicetree.org/schemas/display/bridge/lvds-codec.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dtb: /lvds-decoder: failed to match any schema with compatible: ['ti,sn65lvds822', 'lvds-decoder']
--
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: clock-controller@30380000: 'fsl,operating-mode' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
