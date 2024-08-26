Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671FA18D629
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Aug 2024 17:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724695165; cv=none; b=lGkrK7ok27rrjOQVV1WTshDVHb35k74JAFqlb+KqOk+y9nE0pEI+dhmNOsjKLE1J5H81ZFNALCt31/KwY1IeOeqW8T1maCrUjqv2QchjY6+VxP3Fpjc3J9KwMPJ7mFQt1/uPO52vuLeeOVoP629LEkqF93HCsq/eAHGwnNEPDCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724695165; c=relaxed/simple;
	bh=zyRm/m7bqPyQKhnwZz4M2q4SkK8jSiIO9phzQI7lKOI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SGtGteRJXXEtJZ5fpcS3NKSBMG4ilgpoeiJjica91Cdg+159YqkdGfwibtPYqug7N7WLvImvrwi3S26FaVdGP4HYb3Cnmw6nXIhDJ+a2GCj13H+knu/9CLwpuqWjlQDMEJwAUmnWhoy/Tawo2dObIIXOcqYFNi/Mreu0Pd86ucI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FS8DSYJE; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FS8DSYJE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724695164; x=1756231164;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zyRm/m7bqPyQKhnwZz4M2q4SkK8jSiIO9phzQI7lKOI=;
  b=FS8DSYJEcRN+Q0xE29+WZtcHHQhAi7b72RQQPkc7FjXVerszwPi8f+Cq
   NemuzTFWMtE14QR/Bohqa3UJL03MV3U7sjNkh/EMntqq5XSR8mxgRdpmD
   +Oi1Oflh/o9odlNTwwNuMdWO7VREAPALxcXZ4nlyOKfjzgriqVID4QYyH
   tOHUKQ87oi1q0QjHWX6ENRHsTjZlvJnv5iKzN3V9meOcojDeR5NUs58aD
   5yboACIz7oM4uZN0oHZvBXU3sPHh1J4ukQHpirQcFsSIM6NpwGUzwlVZ/
   DPuEqHGtlXE6QwU8JanMDOgrJPGkcvukvv7c7w6DEUGcue+s6kRV/j7af
   Q==;
X-CSE-ConnectionGUID: RUdIWGvhSmqqqpL+zC+6LQ==
X-CSE-MsgGUID: 2d517znXRfi6vSObhy006Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23315295"
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; 
   d="scan'208";a="23315295"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 10:59:23 -0700
X-CSE-ConnectionGUID: dmr0w5thS8KFrDkaA1c9wg==
X-CSE-MsgGUID: UTO2xqrmRKyJNQYtuC9a2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; 
   d="scan'208";a="62906005"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 26 Aug 2024 10:59:21 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sidzr-000HSA-2X;
	Mon, 26 Aug 2024 17:59:19 +0000
Date: Tue, 27 Aug 2024 01:59:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3] arm64: dts: imx8mm-emtop-baseboard: Add Peripherals
 Support
Message-ID: <202408270122.RS3dMlo8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dts:111.20-120.11: ERROR (phandle_references): /soc@0/bus@30800000/spba-bus@30800000/spi@30830000/can@0: Reference to non-existent node or label "pinctrl_canbus""
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240823120158.19294-1-tarang.raval@siliconsignals.io>
References: <20240823120158.19294-1-tarang.raval@siliconsignals.io>
TO: Tarang Raval <tarang.raval@siliconsignals.io>
TO: shawnguo@kernel.org
TO: krzk+dt@kernel.org
TO: festevam@gmail.com
CC: tarang.raval@siliconsignals.io
CC: Rob Herring <robh@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Sascha Hauer <s.hauer@pengutronix.de>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>
CC: devicetree@vger.kernel.org
CC: imx@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org

Hi Tarang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on next-20240826]
[cannot apply to linus/master v6.11-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tarang-Raval/arm64-dts-imx8mm-emtop-baseboard-Add-Peripherals-Support/20240826-125744
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20240823120158.19294-1-tarang.raval%40siliconsignals.io
patch subject: [PATCH v3] arm64: dts: imx8mm-emtop-baseboard: Add Peripherals Support
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240827/202408270122.RS3dMlo8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240827/202408270122.RS3dMlo8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408270122.RS3dMlo8-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dts:111.20-120.11: ERROR (phandle_references): /soc@0/bus@30800000/spba-bus@30800000/spi@30830000/can@0: Reference to non-existent node or label "pinctrl_canbus"

vim +/pinctrl_canbus +111 arch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dts

d957ce2fca01e44 Tarang Raval 2024-08-23  104  
d957ce2fca01e44 Tarang Raval 2024-08-23  105  /* CAN BUS */
d957ce2fca01e44 Tarang Raval 2024-08-23  106  &ecspi2 {
d957ce2fca01e44 Tarang Raval 2024-08-23  107          pinctrl-names = "default";
d957ce2fca01e44 Tarang Raval 2024-08-23  108          pinctrl-0 = <&pinctrl_ecspi2>;
d957ce2fca01e44 Tarang Raval 2024-08-23  109          status = "okay";
d957ce2fca01e44 Tarang Raval 2024-08-23  110  
d957ce2fca01e44 Tarang Raval 2024-08-23 @111          can: can@0 {
d957ce2fca01e44 Tarang Raval 2024-08-23  112                  compatible = "microchip,mcp2515";
d957ce2fca01e44 Tarang Raval 2024-08-23  113                  reg = <0>;
d957ce2fca01e44 Tarang Raval 2024-08-23  114                  pinctrl-names = "default";
d957ce2fca01e44 Tarang Raval 2024-08-23  115                  pinctrl-0 = <&pinctrl_canbus>;
d957ce2fca01e44 Tarang Raval 2024-08-23  116                  clocks = <&osc_can>;
d957ce2fca01e44 Tarang Raval 2024-08-23  117                  interrupt-parent = <&gpio1>;
d957ce2fca01e44 Tarang Raval 2024-08-23  118                  interrupts = <14 IRQ_TYPE_LEVEL_HIGH>;
d957ce2fca01e44 Tarang Raval 2024-08-23  119                  spi-max-frequency = <10000000>;
d957ce2fca01e44 Tarang Raval 2024-08-23  120          };
38e93270fd735e6 Tarang Raval 2024-07-25  121  };
38e93270fd735e6 Tarang Raval 2024-07-25  122  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
