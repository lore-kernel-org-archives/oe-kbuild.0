Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC9428EA
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Sep 2024 04:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725163294; cv=none; b=lRXDB4ydXO7la5HTMCxvE85/WSlPh/gxX78G+z6gv9gMEyUy4XQDAfUYh5EBe9NPQl2rxT2TmO+IAPVWEuijcQ+LCwbB8MKxLKR2pPyJh1jecyMUVhmIW+IRQwmDh9OP25FxH7KqUsKwsY2xeu9dAySzK5BybyaqqVFPLN6o0Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725163294; c=relaxed/simple;
	bh=gge6cX8MM7ncSIkKBExr+5ry/GENGsoUd7kLj7PCCrc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UtnHuWVpoMs+0S72JJ8KJLi1Q6zulGQfTQvaYPU7sg0ahnMgBurviIp0VBxiLI6SusNPBFbCeRUU2784N+tKYwc4ajZ53unkYVeGLb23nSPHhM8oViP4m623KA6LMUMk0pW8R652d1dd6rQ8mkp8eUsMav5Ae3qczOiybdGsfyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WiQ25BWb; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WiQ25BWb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725163292; x=1756699292;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gge6cX8MM7ncSIkKBExr+5ry/GENGsoUd7kLj7PCCrc=;
  b=WiQ25BWbpAo2y38VxQ36Nb6k3etb+OzsvBtOJVTAAjhcWw/Foctya/3c
   gMMxtvLffED2B/2gR7/ZVbKJnrfu+4yI5Kibm9ZtVHYFJI+fhHsUT+LWF
   G6xKU7Haj6fVu36hOAQFPC9Dq7BOmCkdiWWJaz0c2+yvkGr6cEbuUV5V7
   KA6t0+y5gmVJFGqQtWwFbNGXyU1KqwEkPYhGSUA9FTmgii+n0g1uxzLOc
   SpwgGKCKdMyDJAnZ0C5to4TcC+b3nqu6wB58tZIWFHM4kvprxIy1b0PQb
   ekT1JdftVaAGjUh9QQqKHgPF53cBpt/JVFJJs/A0KW5d19Y9qJKRpAXSp
   g==;
X-CSE-ConnectionGUID: 5JclX06hQ5+kelrXM7LbaA==
X-CSE-MsgGUID: Pqp+AMEFTfaswtXRzuSJWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="35135558"
X-IronPort-AV: E=Sophos;i="6.10,193,1719903600"; 
   d="scan'208";a="35135558"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 21:01:31 -0700
X-CSE-ConnectionGUID: 55RJx3SNTtiQu2OnSRSY0A==
X-CSE-MsgGUID: dAuZktG/RW+7nHuXmgIhDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,193,1719903600"; 
   d="scan'208";a="68398805"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 31 Aug 2024 21:01:29 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skbmJ-0003O0-1d;
	Sun, 01 Sep 2024 04:01:27 +0000
Date: Sun, 1 Sep 2024 12:01:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [amlogic:v6.12/arm64-dt 10/10]
 arch/arm64/boot/dts/amlogic/amlogic-c3-c308l-aw419.dts:205.9-245.4: Warning
 (avoid_unnecessary_addr_size): /soc/bus@fe000000/spi@56000/nand@0:
 unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or
 child "reg" property
Message-ID: <202409011104.vac3eSlT-lkp@intel.com>
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
TO: Xianwei Zhao <xianwei.zhao@amlogic.com>
CC: Neil Armstrong <neil.armstrong@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git v6.12/arm64-dt
head:   d4bd8f3023b68f72431e05ec6cbc793519b449cf
commit: d4bd8f3023b68f72431e05ec6cbc793519b449cf [10/10] arm64: dts: amlogic: add C3 AW419 board
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-003-20240831 (https://download.01.org/0day-ci/archive/20240901/202409011104.vac3eSlT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240901/202409011104.vac3eSlT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409011104.vac3eSlT-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi:65.7-76.4: Warning (unit_address_vs_reg): /sram: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi:168.34-413.6: Warning (unit_address_vs_reg): /soc/bus@fe000000/pinctrl@4000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi:168.34-413.6: Warning (simple_bus_reg): /soc/bus@fe000000/pinctrl@4000: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/amlogic-c3-c308l-aw419.dts:205.9-245.4: Warning (avoid_unnecessary_addr_size): /soc/bus@fe000000/spi@56000/nand@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property

vim +205 arch/arm64/boot/dts/amlogic/amlogic-c3-c308l-aw419.dts

d4bd8f3023b68f Xianwei Zhao 2024-08-30  197  
d4bd8f3023b68f Xianwei Zhao 2024-08-30  198  &spifc {
d4bd8f3023b68f Xianwei Zhao 2024-08-30  199  	#address-cells = <1>;
d4bd8f3023b68f Xianwei Zhao 2024-08-30  200  	#size-cells = <0>;
d4bd8f3023b68f Xianwei Zhao 2024-08-30  201  
d4bd8f3023b68f Xianwei Zhao 2024-08-30  202  	pinctrl-0 = <&spifc_pins>;
d4bd8f3023b68f Xianwei Zhao 2024-08-30  203  	pinctrl-names = "default";
d4bd8f3023b68f Xianwei Zhao 2024-08-30  204  
d4bd8f3023b68f Xianwei Zhao 2024-08-30 @205  	nand@0 {
d4bd8f3023b68f Xianwei Zhao 2024-08-30  206  		compatible = "spi-nand";
d4bd8f3023b68f Xianwei Zhao 2024-08-30  207  		reg = <0>;
d4bd8f3023b68f Xianwei Zhao 2024-08-30  208  		spi-max-frequency = <83000000>;
d4bd8f3023b68f Xianwei Zhao 2024-08-30  209  		spi-tx-bus-width = <4>;
d4bd8f3023b68f Xianwei Zhao 2024-08-30  210  		spi-rx-bus-width = <4>;
d4bd8f3023b68f Xianwei Zhao 2024-08-30  211  		#address-cells = <1>;
d4bd8f3023b68f Xianwei Zhao 2024-08-30  212  		#size-cells = <1>;
d4bd8f3023b68f Xianwei Zhao 2024-08-30  213  		status = "disabled";
d4bd8f3023b68f Xianwei Zhao 2024-08-30  214  
d4bd8f3023b68f Xianwei Zhao 2024-08-30  215  		partitions {
d4bd8f3023b68f Xianwei Zhao 2024-08-30  216  			compatible = "fixed-partitions";
d4bd8f3023b68f Xianwei Zhao 2024-08-30  217  			#address-cells = <1>;
d4bd8f3023b68f Xianwei Zhao 2024-08-30  218  			#size-cells = <1>;
d4bd8f3023b68f Xianwei Zhao 2024-08-30  219  
d4bd8f3023b68f Xianwei Zhao 2024-08-30  220  			partition@0 {
d4bd8f3023b68f Xianwei Zhao 2024-08-30  221  				label = "boot";
d4bd8f3023b68f Xianwei Zhao 2024-08-30  222  				reg = <0 0x200000>;
d4bd8f3023b68f Xianwei Zhao 2024-08-30  223  			};
d4bd8f3023b68f Xianwei Zhao 2024-08-30  224  
d4bd8f3023b68f Xianwei Zhao 2024-08-30  225  			partition@200000 {
d4bd8f3023b68f Xianwei Zhao 2024-08-30  226  				label = "env";
d4bd8f3023b68f Xianwei Zhao 2024-08-30  227  				reg = <0x200000 0x400000>;
d4bd8f3023b68f Xianwei Zhao 2024-08-30  228  			};
d4bd8f3023b68f Xianwei Zhao 2024-08-30  229  
d4bd8f3023b68f Xianwei Zhao 2024-08-30  230  			partition@600000 {
d4bd8f3023b68f Xianwei Zhao 2024-08-30  231  				label = "system";
d4bd8f3023b68f Xianwei Zhao 2024-08-30  232  				reg = <0x600000 0xa00000>;
d4bd8f3023b68f Xianwei Zhao 2024-08-30  233  			};
d4bd8f3023b68f Xianwei Zhao 2024-08-30  234  
d4bd8f3023b68f Xianwei Zhao 2024-08-30  235  			partition@1000000 {
d4bd8f3023b68f Xianwei Zhao 2024-08-30  236  				label = "rootfs";
d4bd8f3023b68f Xianwei Zhao 2024-08-30  237  				reg = <0x1000000 0x3000000>;
d4bd8f3023b68f Xianwei Zhao 2024-08-30  238  			};
d4bd8f3023b68f Xianwei Zhao 2024-08-30  239  
d4bd8f3023b68f Xianwei Zhao 2024-08-30  240  			partition@4000000 {
d4bd8f3023b68f Xianwei Zhao 2024-08-30  241  				label = "data";
d4bd8f3023b68f Xianwei Zhao 2024-08-30  242  				reg = <0x4000000 0x8000000>;
d4bd8f3023b68f Xianwei Zhao 2024-08-30  243  			};
d4bd8f3023b68f Xianwei Zhao 2024-08-30  244  		};
d4bd8f3023b68f Xianwei Zhao 2024-08-30  245  	};
d4bd8f3023b68f Xianwei Zhao 2024-08-30  246  };
d4bd8f3023b68f Xianwei Zhao 2024-08-30  247  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
