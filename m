Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9C21D90CD
	for <oe-kbuild@lists.linux.dev>; Tue, 15 Oct 2024 11:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728992879; cv=none; b=sDck2ywaDqJcjtXxkVhkPJeAUHgHRSYJ+9T+WF+03hXQh87syqjkkiZJ/oWgCfR1od8fHcSFeajHHzNYb1SGJVbP8fdNavB18dYPc+7mdRZ/XEPCf1XU2t1CNroRSQDODCljL5ZCrGfh9Ksfoz13ZugCC9ZqpACC5cg8BuWyCrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728992879; c=relaxed/simple;
	bh=e4T8PK/veabJ3oocpQOnkamvou+OX99H9XYS5xMI0wo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EwSMidXTLG+Cm6+/D4pTeWJ5amIpK46pJn36JR3rckXmkZrAf0+KH6l/JoAu21/GTY1pSiZdsp2t8igR44QKfzSZ0Fc2zzM4XClN0qP0i26qTfUpvqiNPelfhDf+XmRpGj6k9BIk12zI4U58q3nw9PPjHXj1+hCJVNse0kZOzcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A4KmJ812; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A4KmJ812"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728992877; x=1760528877;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e4T8PK/veabJ3oocpQOnkamvou+OX99H9XYS5xMI0wo=;
  b=A4KmJ812gKcLikTk4umUJCL5UbQMiULsBH4/VxYSbLXtNEom+xVhHmBw
   1tIOWmUiHtUbpRi3B4A0cDunbMJrZ8Z6m5E7IM0QKapsyG/JkAhExabsy
   oYu167T0TucfmQrR2cmJTfb+9Cll/D1VSiSY6fFT8ib0faYWm8pJdeAvB
   MpZfpiTZbv5sXAgrrVZ1SAv6EVPAEo7v3Xr2oPCRDjGwHYymSoIJDT+qy
   m33wvLfrCAS9rN/EHCX3naktpqoXJ2HZViKiFIp9ORuKz58+ibLgwOpZi
   86bBMu7sJ4m690Tu3SkWiE+hQ+BT76fXbSvxVxVd4gLPoedq70kAUerSs
   A==;
X-CSE-ConnectionGUID: 7q/oCkmpQayJNPfuVmdEfQ==
X-CSE-MsgGUID: HC2ZHZ86RwGgBGNMh9V1Qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="27862075"
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; 
   d="scan'208";a="27862075"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 04:47:57 -0700
X-CSE-ConnectionGUID: r7+DS0n2Qxyr5pRsAe10Xw==
X-CSE-MsgGUID: zVJ1GUyrSh+iY/n6CuUApQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; 
   d="scan'208";a="77877944"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 15 Oct 2024 04:47:55 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0g1p-000IGX-1C;
	Tue, 15 Oct 2024 11:47:53 +0000
Date: Tue, 15 Oct 2024 19:46:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ti:ti-rt-linux-6.1.y-cicd 32/44]
 arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi:523.21-578.4: Warning
 (avoid_unnecessary_addr_size):
 /bus@100000/bus@28380000/bus@47000000/spi@47040000/nand@0: unnecessary
 #address-cells/#size-cells without "ranges" or child "reg" property
Message-ID: <202410151912.UvNGq634-lkp@intel.com>
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
CC: vigneshr@ti.com
CC: nm@ti.com
TO: Apurva Nandan <a-nandan@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   451df8c0a2a3bcf0656b2f6fdc49d6fb4d05f186
commit: 2640dbd4d366c468dba3337bf5aa5d8d32c63248 [32/44] arm64: dts: k3-j721s2: Add node for OSPI NAND Flash
:::::: branch date: 7 days ago
:::::: commit date: 1 year, 4 months ago
config: arm64-randconfig-002-20241013 (https://download.01.org/0day-ci/archive/20241015/202410151912.UvNGq634-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241015/202410151912.UvNGq634-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410151912.UvNGq634-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi:523.21-578.4: Warning (avoid_unnecessary_addr_size): /bus@100000/bus@28380000/bus@47000000/spi@47040000/nand@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi:1353.34-1362.4: Warning (avoid_unnecessary_addr_size): /bus@100000/pinctrl@a40000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi:469.21-521.4: Warning (unique_unit_address): /bus@100000/bus@28380000/bus@47000000/spi@47040000/flash@0: duplicate unit-address (also used in node /bus@100000/bus@28380000/bus@47000000/spi@47040000/nand@0)

vim +523 arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi

dc3281f7ce6010 Aswath Govindraju 2023-05-02  463  
dc3281f7ce6010 Aswath Govindraju 2023-05-02  464  &ospi0 {
dc3281f7ce6010 Aswath Govindraju 2023-05-02  465  	status = "okay";
dc3281f7ce6010 Aswath Govindraju 2023-05-02  466  	pinctrl-names = "default";
dc3281f7ce6010 Aswath Govindraju 2023-05-02  467  	pinctrl-0 = <&mcu_fss0_ospi0_pins_default>;
dc3281f7ce6010 Aswath Govindraju 2023-05-02  468  
2640dbd4d366c4 Apurva Nandan     2023-06-08 @469  	ospi0_nor: flash@0 {
dc3281f7ce6010 Aswath Govindraju 2023-05-02  470  		compatible = "jedec,spi-nor";
dc3281f7ce6010 Aswath Govindraju 2023-05-02  471  		reg = <0x0>;
dc3281f7ce6010 Aswath Govindraju 2023-05-02  472  		spi-tx-bus-width = <8>;
dc3281f7ce6010 Aswath Govindraju 2023-05-02  473  		spi-rx-bus-width = <8>;
dc3281f7ce6010 Aswath Govindraju 2023-05-02  474  		spi-max-frequency = <25000000>;
dc3281f7ce6010 Aswath Govindraju 2023-05-02  475  		cdns,tshsl-ns = <60>;
dc3281f7ce6010 Aswath Govindraju 2023-05-02  476  		cdns,tsd2d-ns = <60>;
dc3281f7ce6010 Aswath Govindraju 2023-05-02  477  		cdns,tchsh-ns = <60>;
dc3281f7ce6010 Aswath Govindraju 2023-05-02  478  		cdns,tslch-ns = <60>;
dc3281f7ce6010 Aswath Govindraju 2023-05-02  479  		cdns,read-delay = <4>;
d144560c3191b1 Vaishnav Achath   2023-05-16  480  
d144560c3191b1 Vaishnav Achath   2023-05-16  481  		partitions {
d144560c3191b1 Vaishnav Achath   2023-05-16  482  			compatible = "fixed-partitions";
d144560c3191b1 Vaishnav Achath   2023-05-16  483  			#address-cells = <1>;
d144560c3191b1 Vaishnav Achath   2023-05-16  484  			#size-cells = <1>;
d144560c3191b1 Vaishnav Achath   2023-05-16  485  
d144560c3191b1 Vaishnav Achath   2023-05-16  486  			partition@0 {
d144560c3191b1 Vaishnav Achath   2023-05-16  487  				label = "ospi.tiboot3";
d144560c3191b1 Vaishnav Achath   2023-05-16  488  				reg = <0x0 0x80000>;
d144560c3191b1 Vaishnav Achath   2023-05-16  489  			};
d144560c3191b1 Vaishnav Achath   2023-05-16  490  
d144560c3191b1 Vaishnav Achath   2023-05-16  491  			partition@80000 {
d144560c3191b1 Vaishnav Achath   2023-05-16  492  				label = "ospi.tispl";
d144560c3191b1 Vaishnav Achath   2023-05-16  493  				reg = <0x80000 0x200000>;
d144560c3191b1 Vaishnav Achath   2023-05-16  494  			};
d144560c3191b1 Vaishnav Achath   2023-05-16  495  
d144560c3191b1 Vaishnav Achath   2023-05-16  496  			partition@280000 {
d144560c3191b1 Vaishnav Achath   2023-05-16  497  				label = "ospi.u-boot";
d144560c3191b1 Vaishnav Achath   2023-05-16  498  				reg = <0x280000 0x400000>;
d144560c3191b1 Vaishnav Achath   2023-05-16  499  			};
d144560c3191b1 Vaishnav Achath   2023-05-16  500  
d144560c3191b1 Vaishnav Achath   2023-05-16  501  			partition@680000 {
d144560c3191b1 Vaishnav Achath   2023-05-16  502  				label = "ospi.env";
d144560c3191b1 Vaishnav Achath   2023-05-16  503  				reg = <0x680000 0x40000>;
d144560c3191b1 Vaishnav Achath   2023-05-16  504  			};
d144560c3191b1 Vaishnav Achath   2023-05-16  505  
d144560c3191b1 Vaishnav Achath   2023-05-16  506  			partition@6c0000 {
d144560c3191b1 Vaishnav Achath   2023-05-16  507  				label = "ospi.env.backup";
d144560c3191b1 Vaishnav Achath   2023-05-16  508  				reg = <0x6c0000 0x40000>;
d144560c3191b1 Vaishnav Achath   2023-05-16  509  			};
d144560c3191b1 Vaishnav Achath   2023-05-16  510  
d144560c3191b1 Vaishnav Achath   2023-05-16  511  			partition@800000 {
d144560c3191b1 Vaishnav Achath   2023-05-16  512  				label = "ospi.rootfs";
d144560c3191b1 Vaishnav Achath   2023-05-16  513  				reg = <0x800000 0x37c0000>;
d144560c3191b1 Vaishnav Achath   2023-05-16  514  			};
d144560c3191b1 Vaishnav Achath   2023-05-16  515  
d144560c3191b1 Vaishnav Achath   2023-05-16  516  			partition@3fc0000 {
d144560c3191b1 Vaishnav Achath   2023-05-16  517  				label = "ospi.phypattern";
d144560c3191b1 Vaishnav Achath   2023-05-16  518  				reg = <0x3fc0000 0x40000>;
d144560c3191b1 Vaishnav Achath   2023-05-16  519  			};
d144560c3191b1 Vaishnav Achath   2023-05-16  520  		};
dc3281f7ce6010 Aswath Govindraju 2023-05-02  521  	};
2640dbd4d366c4 Apurva Nandan     2023-06-08  522  
2640dbd4d366c4 Apurva Nandan     2023-06-08 @523  	ospi0_nand: nand@0 {
2640dbd4d366c4 Apurva Nandan     2023-06-08  524  		compatible = "spi-nand";
2640dbd4d366c4 Apurva Nandan     2023-06-08  525  		reg = <0x0>;
2640dbd4d366c4 Apurva Nandan     2023-06-08  526  		spi-tx-bus-width = <8>;
2640dbd4d366c4 Apurva Nandan     2023-06-08  527  		spi-rx-bus-width = <8>;
2640dbd4d366c4 Apurva Nandan     2023-06-08  528  		spi-max-frequency = <25000000>;
2640dbd4d366c4 Apurva Nandan     2023-06-08  529  		cdns,tshsl-ns = <60>;
2640dbd4d366c4 Apurva Nandan     2023-06-08  530  		cdns,tsd2d-ns = <60>;
2640dbd4d366c4 Apurva Nandan     2023-06-08  531  		cdns,tchsh-ns = <60>;
2640dbd4d366c4 Apurva Nandan     2023-06-08  532  		cdns,tslch-ns = <60>;
2640dbd4d366c4 Apurva Nandan     2023-06-08  533  		cdns,read-delay = <2>;
2640dbd4d366c4 Apurva Nandan     2023-06-08  534  		#address-cells = <1>;
2640dbd4d366c4 Apurva Nandan     2023-06-08  535  		#size-cells = <1>;
2640dbd4d366c4 Apurva Nandan     2023-06-08  536  		status = "disabled";
2640dbd4d366c4 Apurva Nandan     2023-06-08  537  
2640dbd4d366c4 Apurva Nandan     2023-06-08  538  		partitions {
2640dbd4d366c4 Apurva Nandan     2023-06-08  539  			compatible = "fixed-partitions";
2640dbd4d366c4 Apurva Nandan     2023-06-08  540  			#address-cells = <1>;
2640dbd4d366c4 Apurva Nandan     2023-06-08  541  			#size-cells = <1>;
2640dbd4d366c4 Apurva Nandan     2023-06-08  542  
2640dbd4d366c4 Apurva Nandan     2023-06-08  543  			partition@0 {
2640dbd4d366c4 Apurva Nandan     2023-06-08  544  				label = "ospi_nand.tiboot3";
2640dbd4d366c4 Apurva Nandan     2023-06-08  545  				reg = <0x0 0x80000>;
2640dbd4d366c4 Apurva Nandan     2023-06-08  546  			};
2640dbd4d366c4 Apurva Nandan     2023-06-08  547  
2640dbd4d366c4 Apurva Nandan     2023-06-08  548  			partition@80000 {
2640dbd4d366c4 Apurva Nandan     2023-06-08  549  				label = "ospi_nand.tispl";
2640dbd4d366c4 Apurva Nandan     2023-06-08  550  				reg = <0x80000 0x200000>;
2640dbd4d366c4 Apurva Nandan     2023-06-08  551  			};
2640dbd4d366c4 Apurva Nandan     2023-06-08  552  
2640dbd4d366c4 Apurva Nandan     2023-06-08  553  			partition@280000 {
2640dbd4d366c4 Apurva Nandan     2023-06-08  554  				label = "ospi_nand.u-boot";
2640dbd4d366c4 Apurva Nandan     2023-06-08  555  				reg = <0x280000 0x400000>;
2640dbd4d366c4 Apurva Nandan     2023-06-08  556  			};
2640dbd4d366c4 Apurva Nandan     2023-06-08  557  
2640dbd4d366c4 Apurva Nandan     2023-06-08  558  			partition@680000 {
2640dbd4d366c4 Apurva Nandan     2023-06-08  559  				label = "ospi_nand.env";
2640dbd4d366c4 Apurva Nandan     2023-06-08  560  				reg = <0x680000 0x40000>;
2640dbd4d366c4 Apurva Nandan     2023-06-08  561  			};
2640dbd4d366c4 Apurva Nandan     2023-06-08  562  
2640dbd4d366c4 Apurva Nandan     2023-06-08  563  			partition@6c0000 {
2640dbd4d366c4 Apurva Nandan     2023-06-08  564  				label = "ospi_nand.env.backup";
2640dbd4d366c4 Apurva Nandan     2023-06-08  565  				reg = <0x6c0000 0x40000>;
2640dbd4d366c4 Apurva Nandan     2023-06-08  566  			};
2640dbd4d366c4 Apurva Nandan     2023-06-08  567  
2640dbd4d366c4 Apurva Nandan     2023-06-08  568  			partition@2000000 {
2640dbd4d366c4 Apurva Nandan     2023-06-08  569  				label = "ospi_nand.rootfs";
2640dbd4d366c4 Apurva Nandan     2023-06-08  570  				reg = <0x2000000 0x5fc0000>;
2640dbd4d366c4 Apurva Nandan     2023-06-08  571  			};
2640dbd4d366c4 Apurva Nandan     2023-06-08  572  
2640dbd4d366c4 Apurva Nandan     2023-06-08  573  			partition@7fc0000 {
2640dbd4d366c4 Apurva Nandan     2023-06-08  574  				label = "ospi_nand.phypattern";
2640dbd4d366c4 Apurva Nandan     2023-06-08  575  				reg = <0x7fc0000 0x40000>;
2640dbd4d366c4 Apurva Nandan     2023-06-08  576  			};
2640dbd4d366c4 Apurva Nandan     2023-06-08  577  		};
2640dbd4d366c4 Apurva Nandan     2023-06-08  578  	};
dc3281f7ce6010 Aswath Govindraju 2023-05-02  579  };
d47dd257a5052f Rahul T R         2023-05-26  580  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
