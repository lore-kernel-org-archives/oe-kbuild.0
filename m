Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AE71E495
	for <oe-kbuild@lists.linux.dev>; Sat,  8 Jun 2024 22:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717887573; cv=none; b=m+7q6GtmtJCIZ1WdFaWh+fFiwegib3SB/WfdlkvAdigZ9XeBXbIL6fPFZeYV9LcUzYfMEy/dJ0MS6eB1ibgeW0W7fuAR7+AY6c9aF2NNw8Nccue2tXPZz77NyNRhcXBUGVMq2zMV17+4Zb5qK83fUFEvuMQiY2IE26OjWdiFbec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717887573; c=relaxed/simple;
	bh=lCjclgRLQFO5GqLaJWCr0L7QxsZx22igUE3nCS1l55o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HwO7TShyWLY6EWaPtKNC6AmsJ8wnPHXxCpESR+VAPNVfnkrLzTBHG43Aa4ocMgk9Rr6cYGUzzKjqV9DQqU1YZkzKH/lIgOVxOTjDRp/4RKXjg4Yw1WfnPobfBkBIMvKjHuVA2xwFzYEsYcYLCjd4s6J4iXysCdzrL4KUrq2RfXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZQQZ9ZTd; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZQQZ9ZTd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717887571; x=1749423571;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lCjclgRLQFO5GqLaJWCr0L7QxsZx22igUE3nCS1l55o=;
  b=ZQQZ9ZTdiJow9l7I3HKNtKHgwpEYGLo284ND+yaDLyyWY5vlDu7Hh6dD
   qoypZ1NiNH0vLOI2DVfLOmUOo8qP978JGVn2TYpeBvIC+1l62zlwGGpMd
   RWrjyjzGnBZQHtJjfhqomU5xn6/I9fH41ZZPqvJDWx4ZQt6P1Oo4fHlYM
   xXtwLwHRVPDW7eAKUHDDh6Abj15kc64xe5lE/67WvDLh0dIxnCDreHL5W
   8M2KA7dz0D352+ZiZhc8WwMSf7UtRQ2tLxa54+7J8pLAipdg14z1qEAaX
   nV789Wcg3TUVzWuq3vwOG//IHkbJSi9swTCAWD4V/3HIgTpM7tzKLAqhI
   A==;
X-CSE-ConnectionGUID: dCTMrUKGTUKNw+7BGTdZfg==
X-CSE-MsgGUID: yumpvyjAS3uf4Grw8z5fQw==
X-IronPort-AV: E=McAfee;i="6600,9927,11097"; a="14765182"
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="14765182"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2024 15:59:30 -0700
X-CSE-ConnectionGUID: mau7lnYySCG+a9+Dxc4OzQ==
X-CSE-MsgGUID: SGRtshyxQBeDS3ZqM2WkwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="76153948"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 Jun 2024 15:59:29 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sG51y-0000aq-1Y;
	Sat, 08 Jun 2024 22:59:26 +0000
Date: Sun, 9 Jun 2024 06:59:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/mips/boot/dts/lantiq/danube_easy50712.dts:107.4-109.6: Warning
 (interrupt_map): /fpi@10000000/pci@e105400:interrupt-map: property size (28)
 too small, expected > 40
Message-ID: <202406090631.s1AD79Xe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only scripts/Makefile.* file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Rob Herring <robh@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   061d1af7b0305227182bd9da60c7706c079348b7
commit: a8528f7f31abf792f188d3f397b15aae7ed8564c dtc: Enable dtc interrupt_provider check
date:   3 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 3 months ago
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240609/202406090631.s1AD79Xe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406090631.s1AD79Xe-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/lantiq/danube.dtsi:8.9-10.5: Warning (unit_address_vs_reg): /cpus/cpu@0: node has a unit name, but no reg or ranges property
   arch/mips/boot/dts/lantiq/danube.dtsi:93.21-103.5: Warning (simple_bus_reg): /fpi@10000000/pci@e105400: simple-bus unit address format error, expected "7000000"
>> arch/mips/boot/dts/lantiq/danube_easy50712.dts:107.4-109.6: Warning (interrupt_map): /fpi@10000000/pci@e105400:interrupt-map: property size (28) too small, expected > 40

vim +107 arch/mips/boot/dts/lantiq/danube_easy50712.dts

a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13    5  
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13    6  / {
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13    7  	chosen {
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13    8  		bootargs = "console=ttyLTQ0,115200 init=/etc/preinit";
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13    9  	};
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   10  
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   11  	memory@0 {
dfc44f8030653b arch/mips/lantiq/dts/easy50712.dts      Leif Lindholm   2014-04-17   12  		device_type = "memory";
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   13  		reg = <0x0 0x2000000>;
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   14  	};
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   15  
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   16  	fpi@10000000 {
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   17  		#address-cells = <1>;
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   18  		#size-cells = <1>;
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   19  		localbus@0 {
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   20  			#address-cells = <2>;
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   21  			#size-cells = <1>;
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   22  			ranges = <0 0 0x0 0x3ffffff /* addrsel0 */
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   23  				1 0 0x4000000 0x4000010>; /* addsel1 */
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   24  			compatible = "lantiq,localbus", "simple-bus";
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   25  
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   26  			nor-boot@0 {
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   27  				compatible = "lantiq,nor";
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   28  				bank-width = <2>;
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   29  				reg = <0 0x0 0x2000000>;
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   30  				#address-cells = <1>;
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   31  				#size-cells = <1>;
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   32  
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   33  				partition@0 {
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   34  					label = "uboot";
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   35  					reg = <0x00000 0x10000>; /* 64 KB */
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   36  				};
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   37  
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   38  				partition@10000 {
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   39  					label = "uboot_env";
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   40  					reg = <0x10000 0x10000>; /* 64 KB */
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   41  				};
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   42  
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   43  				partition@20000 {
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   44  					label = "linux";
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   45  					reg = <0x20000 0x3d0000>;
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   46  				};
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   47  
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   48  				partition@400000 {
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   49  					label = "rootfs";
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   50  					reg = <0x400000 0x400000>;
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   51  				};
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   52  			};
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   53  		};
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   54  
965f22bc425298 arch/mips/boot/dts/lantiq/easy50712.dts Songjun Wu      2018-09-24   55  		gpio: pinmux@e100b10 {
8571e645d1d15a arch/mips/boot/dts/lantiq/easy50712.dts Martin Schiller 2015-11-26   56  			compatible = "lantiq,danube-pinctrl";
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   57  			pinctrl-names = "default";
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   58  			pinctrl-0 = <&state_default>;
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   59  
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   60  			#gpio-cells = <2>;
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   61  			gpio-controller;
965f22bc425298 arch/mips/boot/dts/lantiq/easy50712.dts Songjun Wu      2018-09-24   62  			reg = <0xe100b10 0xa0>;
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   63  
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   64  			state_default: pinmux {
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   65  				stp {
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   66  					lantiq,groups = "stp";
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   67  					lantiq,function = "stp";
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   68  				};
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   69  				exin {
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   70  					lantiq,groups = "exin1";
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   71  					lantiq,function = "exin";
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   72  				};
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   73  				pci {
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   74  					lantiq,groups = "gnt1";
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   75  					lantiq,function = "pci";
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   76  				};
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   77  				conf_out {
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   78  					lantiq,pins = "io4", "io5", "io6"; /* stp */
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   79  					lantiq,open-drain;
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   80  					lantiq,pull = <0>;
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   81  				};
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   82  			};
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   83  		};
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   84  
965f22bc425298 arch/mips/boot/dts/lantiq/easy50712.dts Songjun Wu      2018-09-24   85  		etop@e180000 {
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   86  			compatible = "lantiq,etop-xway";
965f22bc425298 arch/mips/boot/dts/lantiq/easy50712.dts Songjun Wu      2018-09-24   87  			reg = <0xe180000 0x40000>;
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   88  			interrupt-parent = <&icu0>;
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   89  			interrupts = <73 78>;
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   90  			phy-mode = "rmii";
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   91  			mac-address = [ 00 11 22 33 44 55 ];
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   92  		};
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   93  
965f22bc425298 arch/mips/boot/dts/lantiq/easy50712.dts Songjun Wu      2018-09-24   94  		stp0: stp@e100bb0 {
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   95  			#gpio-cells = <2>;
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   96  			compatible = "lantiq,gpio-stp-xway";
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   97  			gpio-controller;
965f22bc425298 arch/mips/boot/dts/lantiq/easy50712.dts Songjun Wu      2018-09-24   98  			reg = <0xe100bb0 0x40>;
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   99  
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13  100  			lantiq,shadow = <0xfff>;
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13  101  			lantiq,groups = <0x3>;
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13  102  		};
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13  103  
965f22bc425298 arch/mips/boot/dts/lantiq/easy50712.dts Songjun Wu      2018-09-24  104  		pci@e105400 {
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13  105  			lantiq,bus-clock = <33333333>;
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13  106  			interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13 @107  			interrupt-map = <

:::::: The code at line 107 was first introduced by commit
:::::: a0392222d9a374588803454c4d2211108c64d4e4 OF: MIPS: lantiq: implement OF support

:::::: TO: John Crispin <blogic@openwrt.org>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
