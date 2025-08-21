Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FE02EC560
	for <oe-kbuild@lists.linux.dev>; Thu, 21 Aug 2025 13:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755784777; cv=none; b=m3YafQrkt63J0MQeJio2D/fgHrJ/vC30v2YMJGvrJnFBxP0fKaT7BOSa3hyUQFIJHpJAFd5zgE8GVXDs76b+h2y6N90nIUhUbxv6UHT+reQorIHza2wCYfmQZtjLHDiVzUuxNaNBtHDUzaRowIkwwON8nZczpJeaamIl2MI30NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755784777; c=relaxed/simple;
	bh=BVxABCLI8fu1njuuRO+owYX1RODAjz3IO1eyhFVRC7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ODq8YMXaU9TZveO0w2GfZ1PgnBqdqhNyjPfJnRHu0r3vOGmGK2bk3sOOjuRDLdR4rc2i8egEyO16Pai+HQiifKRcbTl1MKuuMRXKdpbv3DprG2m+KPFV+rvs3TsaG+ztaj+gThYB8TMMSv9ibRhRsKC7LAHDca3Li2wSAyygwc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WwS6U6ch; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WwS6U6ch"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755784776; x=1787320776;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BVxABCLI8fu1njuuRO+owYX1RODAjz3IO1eyhFVRC7Y=;
  b=WwS6U6chVOure5FjHMLMFPfP4rgXtNgDBskJQpRSogja3NxngJ/EJvJU
   Cn8eXex59HxZblWyNjavNo7GMqRvaGo54F4SsNvAriu0UT83FSGZM9Wv7
   9IeJ3P/9rIgOH/8cgCTUCgVeqgQO/U/iQpy9KDf5pgWWriXQdnzAkes/Q
   jmQAaPFZfmqQPqQBZwPe4FR1LEUZRFW5Xn/xCIyptmzJk0HiLy6NmOS/3
   AOqANT1+DR3Yhi1xTGWiXxg0AsOjMEmTnGyNBNUrb2wzsAT7EKytciQlx
   R977C+w2Mkt9jounmNXnOZYAgkxKjUQ9r6qHsGcvnH4cr4kUWm5NpCC5F
   g==;
X-CSE-ConnectionGUID: 0VVgecsqSI+wgn31mmdJYA==
X-CSE-MsgGUID: rtDAjc7HSqGLktE9+6TMNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="68777896"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="68777896"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 06:59:35 -0700
X-CSE-ConnectionGUID: CvvLvOxrRnCW7IRmHO0RvQ==
X-CSE-MsgGUID: r77Lhl+CQsaqGMRHaDeg8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="172670223"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 21 Aug 2025 06:59:33 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1up5pC-000KKp-2w;
	Thu, 21 Aug 2025 13:59:30 +0000
Date: Thu, 21 Aug 2025 21:58:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] ARM: dts: vf: Change the pinctrl node name
Message-ID: <202508212148.BaTtcxZj-lkp@intel.com>
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
In-Reply-To: <20250819193405.2847808-1-festevam@gmail.com>
References: <20250819193405.2847808-1-festevam@gmail.com>
TO: Fabio Estevam <festevam@gmail.com>
TO: shawnguo@kernel.org
CC: stefan@agner.ch
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: Fabio Estevam <festevam@gmail.com>

Hi Fabio,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on linus/master v6.17-rc2 next-20250820]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fabio-Estevam/ARM-dts-vf-Change-the-pinctrl-node-name/20250820-033643
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20250819193405.2847808-1-festevam%40gmail.com
patch subject: [PATCH] ARM: dts: vf: Change the pinctrl node name
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-052-20250820 (https://download.01.org/0day-ci/archive/20250821/202508212148.BaTtcxZj-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250821/202508212148.BaTtcxZj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508212148.BaTtcxZj-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: /soc/bus@40000000/interrupt-controller@40001800: failed to match any schema with compatible: ['fsl,vf610-mscm-ir']
>> arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: pinctrl@40048000 (fsl,vf610-iomuxc): Unevaluated properties are not allowed ('i2c0grp-gpio', 'pinctrl-gpio-e6185-eeprom-spi0', 'pinctrl-gpio-spi0', 'pinctrl-gpio-switch0', 'pinctrl-gpio-switch1', 'pinctrl-i2c-mux-reset', 'pinctrl-leds-debug', 'pinctrl-mdio-mux', 'pinctrl-pca95540-22', 'pinctrl-usb-vbus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/fsl,vf610-iomuxc.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: pinctrl@40048000 (fsl,vf610-iomuxc): i2c0grp-gpio: {'fsl,pins': [[144, 0, 0, 0, 12738, 148, 0, 0, 0, 12738]], 'phandle': 19} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: /soc/bus@40000000/dcu@40058000: failed to match any schema with compatible: ['fsl,vf610-dcu']
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: /soc/bus@40000000/src@4006e000: failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: /soc/bus@40080000/ocotp@400a5000: failed to match any schema with compatible: ['fsl,vf610-ocotp', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: ftm@400b8000 (fsl,ftm-timer): reg: [[1074495488, 4096], [1074499584, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/timer/fsl,ftm-timer.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: nand@400e0000 (fsl,vf610-nfc): $nodename:0: 'nand@400e0000' does not match '^nand-controller(@.*)?'
   	from schema $id: http://devicetree.org/schemas/mtd/fsl,vf610-nfc.yaml#
--
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: /soc/bus@40000000/interrupt-controller@40001800: failed to match any schema with compatible: ['fsl,vf610-mscm-ir']
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: /soc/bus@40000000/spi@4002c000/atzb-rf-233@1: failed to match any schema with compatible: ['atmel,at86rf233']
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: atzb-rf-233@1 (atmel,at86rf233): xtal-trim: b'\x06' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: pinctrl@40048000 (fsl,vf610-iomuxc): Unevaluated properties are not allowed ('i2c0grp-gpio', 'pinctrl-gpio-spi0', 'pinctrl-gpio-switch0', 'pinctrl-gpio-switch1', 'pinctrl-i2c-mux-reset', 'pinctrl-leds-debug', 'pinctrl-usb-vbus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/fsl,vf610-iomuxc.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: pinctrl@40048000 (fsl,vf610-iomuxc): i2c0grp-gpio: {'fsl,pins': [[144, 0, 0, 0, 12738, 148, 0, 0, 0, 12738]], 'phandle': 25} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: /soc/bus@40000000/dcu@40058000: failed to match any schema with compatible: ['fsl,vf610-dcu']
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: /soc/bus@40000000/src@4006e000: failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: /soc/bus@40080000/ocotp@400a5000: failed to match any schema with compatible: ['fsl,vf610-ocotp', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: ftm@400b8000 (fsl,ftm-timer): reg: [[1074495488, 4096], [1074499584, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/timer/fsl,ftm-timer.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: nand@400e0000 (fsl,vf610-nfc): $nodename:0: 'nand@400e0000' does not match '^nand-controller(@.*)?'
   	from schema $id: http://devicetree.org/schemas/mtd/fsl,vf610-nfc.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
