Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE601FDA9E
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Sep 2025 04:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757909088; cv=none; b=XxTUKehUbOOYrT09mRt5+CKGvXjMovlaEvOOxUqc2/qcxKOTIETkXKTQwh7EnxB2XYQrLr5KgyrIT/UU8/0gUHl11yjzApbmBFn3/KahItGCjjr99LbRZzce2Z0Bok8OKTrQecPrD8gXIoq+/cjA+wePcu6fhq9rb3MucereyR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757909088; c=relaxed/simple;
	bh=QMZR18SobBXW80i+dwRWY7JG1vURHnDRsahFjFXwboE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=npwa9eVWlH2l3cteJd9Sj3NOh4i7jmOsTS42RwreUTqLkruLyZgGdPEzfi8ruFO5LJVJ6vX0mIWYr63MgFvcGm/6wZtCqninHteG+6VCJuvak1iYG5jm2D9ei/f2JCqAOqXEGVE+FRwcxDB0JjlH5ooi4e4wXCPQDu/u5NMr+mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bIk31/o9; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bIk31/o9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757909087; x=1789445087;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QMZR18SobBXW80i+dwRWY7JG1vURHnDRsahFjFXwboE=;
  b=bIk31/o99C5Auo4wyqg74fZyn7UT54ndaZe1u86IUzuesO5JQknLqfZo
   Qxt/MdOe5D6qMWKJrXHn8X/I3SM1olG4P225t/kU3OraL0fv4nbyiG8Wq
   aZkQ2JJRMbrRfWpGOq45vbtlnt70NVzbLzB/fzBqcwSGPV/XB/8A1cXCO
   3hqneBChd+r/+VFZGhW04aPbYsQ1NIQHlgHc74vv1Xd0B1wRDUNO3M9Z3
   PtGHwinFN3Ynkr1lrEc4PrZ5xeVWI4jvLVYTw9HIGOshqdkMZjK2lk3Ks
   68xyPO/PMOwc7S8FvIuko5spTQwDWukuEMlcN8HsRtO+jtG5oIv1ULGDC
   g==;
X-CSE-ConnectionGUID: IOW/WsrUTPGZQyvyPWFOcA==
X-CSE-MsgGUID: SnOCAiENQJabULnXNlzi9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60075245"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60075245"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2025 21:04:46 -0700
X-CSE-ConnectionGUID: YGsdqqvdTje0dNdvw/VaSQ==
X-CSE-MsgGUID: JJXfQ4GoTK6oMAbyCjgsuQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa003.fm.intel.com with ESMTP; 14 Sep 2025 21:04:44 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1uy0SI-000000001wl-1cB8;
	Mon, 15 Sep 2025 04:04:42 +0000
Date: Mon, 15 Sep 2025 06:03:58 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [shawnguo:imx/dt64 71/75]
 arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dtb: current-sense
 (current-sense-amplifier): '#io-channel-cells' does not match any of the
 regexes: '^pinctrl-[0-9]+$'
Message-ID: <202509150640.QuoEtxuq-lkp@intel.com>
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
TO: Primoz Fiser <primoz.fiser@norik.com>
CC: Shawn Guo <shawnguo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git imx/dt64
head:   dc8662956496d2bfeee95eca3cf57d7b9a8f2ba4
commit: 463714763fd1887a6538470132ba51a1a04e8ec2 [71/75] arm64: dts: freescale: imx93-phyboard-nash: Current sense via iio-hwmon
:::::: branch date: 15 hours ago
:::::: commit date: 4 days ago
config: arm64-randconfig-2051-20250914 (https://download.01.org/0day-ci/archive/20250915/202509150640.QuoEtxuq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250915/202509150640.QuoEtxuq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509150640.QuoEtxuq-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dtb: current-sense (current-sense-amplifier): '#io-channel-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/afe/current-sense-amplifier.yaml#
--
>> arch/arm64/boot/dts/freescale/imx93-phyboard-nash-peb-wlbt-07.dtb: current-sense (current-sense-amplifier): '#io-channel-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/afe/current-sense-amplifier.yaml#
--
>> arch/arm64/boot/dts/freescale/imx93-phycore-rpmsg.dtb: current-sense (current-sense-amplifier): '#io-channel-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/afe/current-sense-amplifier.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
