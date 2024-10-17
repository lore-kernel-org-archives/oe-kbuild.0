Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DEB189910
	for <oe-kbuild@lists.linux.dev>; Thu, 17 Oct 2024 06:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729146549; cv=none; b=OMKtK85a0fFL+qvcNs1OwvBx2msNpJKpH7/BMYdRr4yb4okuTl1+hrCT2rrAtxjZ39oJyjYqGXfEEpPiNhp5yKUQhuESfekuzZMwzCCWXap/mIufj1xrtfIVQF9+01wslGaOWGqVrlBI04nhrn+UuWkahrdaBdBIvzZ8BTnViXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729146549; c=relaxed/simple;
	bh=TY8E+4oSocld5E83dBKblYKJZcFLFe6wQOTEuCEFp/c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ch23itnJiYsVfOjY7J7oxDP21t41L93CD0IwwmcAwOWRQw+oYnZG1O09xyTVPhGaYS2SFoV46mOxBjD1lKRJWH4OZRLtUN32iMBeB06BTe1g6aeVtCUTZy4DGSoZQ8N3cMPtpUixoUQtaaXE+aIFwddlI/73qwjRv/bD0FTV08E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SJ1Capk7; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SJ1Capk7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729146546; x=1760682546;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TY8E+4oSocld5E83dBKblYKJZcFLFe6wQOTEuCEFp/c=;
  b=SJ1Capk7I3M12EP4O/XidQdLFUL0rDaXaboDjW6POwqYzkE9qUx07Xb+
   m9kM5D1+7ZGeLXbouF/59v0KDzCRImn3EUSeQjK5Afz/SNYXFtCzs5wBd
   bRHvJ7L221U3/tFgC2xaRWnxkNXQf2/Y5oSVOTs8kxMx0iwEw0+00uvbE
   siGjhkzYJgH5U0GzDhbUzQywVesrOSEhsf7ooRrTnItn7Ic6OrOHBo/yl
   VbnCYg1PqYE+O8s1M/98BjQKHBdOYH8aYLKVVnSMq/lhmk4D0vOJ0tTDL
   1SrHwE4BIRsnMncenlVPJKGli/uBivy47G998LOzrFAPMO/lkKjxRRqnX
   g==;
X-CSE-ConnectionGUID: BHEpNaAZTLqhc3AKUaGaqA==
X-CSE-MsgGUID: d/R0nlzERvi1kj4Df+7ICA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28504928"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28504928"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 23:29:02 -0700
X-CSE-ConnectionGUID: uMrpuKJcS4iXZezphlW5FA==
X-CSE-MsgGUID: BiJB9wxoR02dHkc50bc7LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="78483783"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Oct 2024 23:29:01 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1K0I-000Lod-2g;
	Thu, 17 Oct 2024 06:28:58 +0000
Date: Thu, 17 Oct 2024 14:28:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ti:ti-rt-linux-6.1.y-cicd 32/44]
 arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi:523.21-578.4: Warning
 (avoid_unnecessary_addr_size):
 /bus@100000/bus@28380000/bus@47000000/spi@47040000/nand@0: unnecessary
 #address-cells/#size-cells without "ranges" or child "reg" property
Message-ID: <202410171420.mPcAisyc-lkp@intel.com>
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
head:   e680678e5fef8c191b1588d8d7520171011ebe93
commit: 2640dbd4d366c468dba3337bf5aa5d8d32c63248 [32/44] arm64: dts: k3-j721s2: Add node for OSPI NAND Flash
:::::: branch date: 35 hours ago
:::::: commit date: 1 year, 4 months ago
config: arm64-randconfig-002-20241013 (https://download.01.org/0day-ci/archive/20241017/202410171420.mPcAisyc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241017/202410171420.mPcAisyc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410171420.mPcAisyc-lkp@intel.com/

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
