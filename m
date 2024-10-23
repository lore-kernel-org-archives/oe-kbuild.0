Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813301459FD
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Oct 2024 06:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729665937; cv=none; b=nk7K/CC5K3MLyJMOq6IH7gqvHtmIO7wcc9YXgF5L5CsRDJz8xSn6wOpnvsEiVMWI9B8uPoDxmZEKJGt/ev/fIaLMXvG0+7Z/hXe0+SWVRQLikkjcAqoWRoJ6Mm5OqiqD7/uZE48nPPCfqioT8uV+LTZOQqXrY+FUgl1CZf7xheY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729665937; c=relaxed/simple;
	bh=Yp5Lrf35AhNgAiw9glPGB4PFN3JNrMAHC9ZNWVFQQ54=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IJAO2nfzqrbATdnn+LSArsYJYYqWahoGnO19TVW5b/dX6tDdJPJ96gy4fFG8e3NZCLQxT0PVKQcjraYqeO9IeEcrL+sqQ27j64i2FFMrG0T0MJ68hzhD6R65gSLaUIgJQ4JX8w1GkV4v2/PnNm4Y4UkqvvGTf5UrQGh9Md6eN8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i/Hezouf; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i/Hezouf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729665936; x=1761201936;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Yp5Lrf35AhNgAiw9glPGB4PFN3JNrMAHC9ZNWVFQQ54=;
  b=i/Hezouf9JbHEjjLLIGk2SW6+0qZg3uNQubGtRxDGer8TYSPaD1/om3A
   PA9NftGO0b5PG8fgsa4GuDlCPg88lBbHiu5byq38J7pQa94rgyKc9T9Ya
   2hwmUNhqY9nbG4+3OVQVIbmCkX1jzFld3SEk+mR0cLP40rAWFmRRA0dK5
   37cd7GVZ0NuY56Xm/3vl9lXXXYASV+ra2AZrF/s2Ex/X+ApZYtSJLGQEN
   eD0BXa1TTBiPQ/juL1SNMZNAbl/z/d/ftDFDiOrHT312BIVZ4KNHx9z6x
   aG2xYSw0AW2NKoIwNwmUK6KfrYLxmdVtELlkP55NUieBb1RYDTCnOFVEW
   A==;
X-CSE-ConnectionGUID: C0ym4KTqR0mn6XdPwG7EqA==
X-CSE-MsgGUID: 0QI9mR10TSC/SrZ1bMdkJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="40607197"
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="40607197"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 23:45:35 -0700
X-CSE-ConnectionGUID: u4oAujWKSwm9gEyLIqML4w==
X-CSE-MsgGUID: MASeAcVWT9O0eG44Z5GJew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="117574576"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 22 Oct 2024 23:45:34 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3V7a-000UaQ-33;
	Wed, 23 Oct 2024 06:45:30 +0000
Date: Wed, 23 Oct 2024 14:45:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [shawnguo:imx/dt 8/17]
 arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:56.9-74.4: Warning
 (avoid_unnecessary_addr_size): /clocks: unnecessary
 #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"
 property
Message-ID: <202410231417.lDwnMaS9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
TO: Fabio Estevam <festevam@denx.de>
CC: Shawn Guo <shawnguo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git imx/dt
head:   a5c45d49932a856fa709027cbc07a9060f2960bc
commit: b5707f8ac5fa21eae70815a2919cf9a700bdc005 [8/17] ARM: dts: imx6qdl-tx6: Fix 'fixed-clock' description
:::::: branch date: 24 hours ago
:::::: commit date: 2 days ago
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20241023/202410231417.lDwnMaS9-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241023/202410231417.lDwnMaS9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410231417.lDwnMaS9-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:56.9-74.4: Warning (avoid_unnecessary_addr_size): /clocks: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:905.28-913.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
--
>> arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:56.9-74.4: Warning (avoid_unnecessary_addr_size): /clocks: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:905.28-913.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)

vim +56 arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi

07134a365f1c4b arch/arm/boot/dts/imx6qdl.dtsi Lucas Stach    2014-03-05   9  
7d740f87fd0741 arch/arm/boot/dts/imx6q.dtsi   Shawn Guo      2011-09-06  10  / {
7f107887d1995c arch/arm/boot/dts/imx6qdl.dtsi Fabio Estevam  2016-11-12  11  	#address-cells = <1>;
7f107887d1995c arch/arm/boot/dts/imx6qdl.dtsi Fabio Estevam  2016-11-12  12  	#size-cells = <1>;
a971c5545c3d45 arch/arm/boot/dts/imx6qdl.dtsi Fabio Estevam  2017-01-23  13  	/*
a971c5545c3d45 arch/arm/boot/dts/imx6qdl.dtsi Fabio Estevam  2017-01-23  14  	 * The decompressor and also some bootloaders rely on a
a971c5545c3d45 arch/arm/boot/dts/imx6qdl.dtsi Fabio Estevam  2017-01-23  15  	 * pre-existing /chosen node to be available to insert the
a971c5545c3d45 arch/arm/boot/dts/imx6qdl.dtsi Fabio Estevam  2017-01-23  16  	 * command line and merge other ATAGS info.
a971c5545c3d45 arch/arm/boot/dts/imx6qdl.dtsi Fabio Estevam  2017-01-23  17  	 */
a971c5545c3d45 arch/arm/boot/dts/imx6qdl.dtsi Fabio Estevam  2017-01-23  18  	chosen {};
7f107887d1995c arch/arm/boot/dts/imx6qdl.dtsi Fabio Estevam  2016-11-12  19  
7d740f87fd0741 arch/arm/boot/dts/imx6q.dtsi   Shawn Guo      2011-09-06  20  	aliases {
22970070e027cb arch/arm/boot/dts/imx6qdl.dtsi Marek Vasut    2014-02-28  21  		ethernet0 = &fec;
5f8fbc2cd2e1bf arch/arm/boot/dts/imx6qdl.dtsi Lothar Waﬂmann 2013-12-12  22  		can0 = &can1;
5f8fbc2cd2e1bf arch/arm/boot/dts/imx6qdl.dtsi Lothar Waﬂmann 2013-12-12  23  		can1 = &can2;
5230f8fe9ad870 arch/arm/boot/dts/imx6q.dtsi   Shawn Guo      2012-08-05  24  		gpio0 = &gpio1;
5230f8fe9ad870 arch/arm/boot/dts/imx6q.dtsi   Shawn Guo      2012-08-05  25  		gpio1 = &gpio2;
5230f8fe9ad870 arch/arm/boot/dts/imx6q.dtsi   Shawn Guo      2012-08-05  26  		gpio2 = &gpio3;
5230f8fe9ad870 arch/arm/boot/dts/imx6q.dtsi   Shawn Guo      2012-08-05  27  		gpio3 = &gpio4;
5230f8fe9ad870 arch/arm/boot/dts/imx6q.dtsi   Shawn Guo      2012-08-05  28  		gpio4 = &gpio5;
5230f8fe9ad870 arch/arm/boot/dts/imx6q.dtsi   Shawn Guo      2012-08-05  29  		gpio5 = &gpio6;
5230f8fe9ad870 arch/arm/boot/dts/imx6q.dtsi   Shawn Guo      2012-08-05  30  		gpio6 = &gpio7;
80fa058471999b arch/arm/boot/dts/imx6qdl.dtsi Sascha Hauer   2013-06-25  31  		i2c0 = &i2c1;
80fa058471999b arch/arm/boot/dts/imx6qdl.dtsi Sascha Hauer   2013-06-25  32  		i2c1 = &i2c2;
80fa058471999b arch/arm/boot/dts/imx6qdl.dtsi Sascha Hauer   2013-06-25  33  		i2c2 = &i2c3;
41beef39cdc8f2 arch/arm/boot/dts/imx6qdl.dtsi Philipp Zabel  2015-12-02  34  		ipu0 = &ipu1;
fb06d65ccc6a09 arch/arm/boot/dts/imx6qdl.dtsi Sascha Hauer   2014-01-16  35  		mmc0 = &usdhc1;
fb06d65ccc6a09 arch/arm/boot/dts/imx6qdl.dtsi Sascha Hauer   2014-01-16  36  		mmc1 = &usdhc2;
fb06d65ccc6a09 arch/arm/boot/dts/imx6qdl.dtsi Sascha Hauer   2014-01-16  37  		mmc2 = &usdhc3;
fb06d65ccc6a09 arch/arm/boot/dts/imx6qdl.dtsi Sascha Hauer   2014-01-16  38  		mmc3 = &usdhc4;
80fa058471999b arch/arm/boot/dts/imx6qdl.dtsi Sascha Hauer   2013-06-25  39  		serial0 = &uart1;
80fa058471999b arch/arm/boot/dts/imx6qdl.dtsi Sascha Hauer   2013-06-25  40  		serial1 = &uart2;
80fa058471999b arch/arm/boot/dts/imx6qdl.dtsi Sascha Hauer   2013-06-25  41  		serial2 = &uart3;
80fa058471999b arch/arm/boot/dts/imx6qdl.dtsi Sascha Hauer   2013-06-25  42  		serial3 = &uart4;
80fa058471999b arch/arm/boot/dts/imx6qdl.dtsi Sascha Hauer   2013-06-25  43  		serial4 = &uart5;
80fa058471999b arch/arm/boot/dts/imx6qdl.dtsi Sascha Hauer   2013-06-25  44  		spi0 = &ecspi1;
80fa058471999b arch/arm/boot/dts/imx6qdl.dtsi Sascha Hauer   2013-06-25  45  		spi1 = &ecspi2;
80fa058471999b arch/arm/boot/dts/imx6qdl.dtsi Sascha Hauer   2013-06-25  46  		spi2 = &ecspi3;
80fa058471999b arch/arm/boot/dts/imx6qdl.dtsi Sascha Hauer   2013-06-25  47  		spi3 = &ecspi4;
5c8b3b8a182cbc arch/arm/boot/dts/imx6qdl.dtsi Peng Fan       2020-11-01  48  		usb0 = &usbotg;
5c8b3b8a182cbc arch/arm/boot/dts/imx6qdl.dtsi Peng Fan       2020-11-01  49  		usb1 = &usbh1;
5c8b3b8a182cbc arch/arm/boot/dts/imx6qdl.dtsi Peng Fan       2020-11-01  50  		usb2 = &usbh2;
5c8b3b8a182cbc arch/arm/boot/dts/imx6qdl.dtsi Peng Fan       2020-11-01  51  		usb3 = &usbh3;
8189c51f18463b arch/arm/boot/dts/imx6qdl.dtsi Peter Chen     2013-12-20  52  		usbphy0 = &usbphy1;
8189c51f18463b arch/arm/boot/dts/imx6qdl.dtsi Peter Chen     2013-12-20  53  		usbphy1 = &usbphy2;
7d740f87fd0741 arch/arm/boot/dts/imx6q.dtsi   Shawn Guo      2011-09-06  54  	};
7d740f87fd0741 arch/arm/boot/dts/imx6q.dtsi   Shawn Guo      2011-09-06  55  
7d740f87fd0741 arch/arm/boot/dts/imx6q.dtsi   Shawn Guo      2011-09-06 @56  	clocks {

:::::: The code at line 56 was first introduced by commit
:::::: 7d740f87fd0741c00231a4b13074660d526d5630 arm/imx6q: add device tree source

:::::: TO: Shawn Guo <shawn.guo@linaro.org>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
