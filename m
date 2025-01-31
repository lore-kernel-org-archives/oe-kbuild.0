Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC5428EC
	for <oe-kbuild@lists.linux.dev>; Fri, 31 Jan 2025 09:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738316628; cv=none; b=BlZ88Clb+MeeW79llxcesyV24lc7UmtAZlZAgp9wxhGIRauLqQOj6gqIOMuI7hHHGKSjKdrjqYf0j0+JH0QNhyoeQ0ik1SsamMG2fl5lMGwWkgUefMyA2+wfj+FyVWw0VWSTjrhwZBHi72khdku2T9MlrWgcM+UTn70SHGPo+iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738316628; c=relaxed/simple;
	bh=NEHBG/X4A9psYOffzEjim++bPREmZ8r91av9LXQjPjY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XQ3sF2QaWCQX/uU95ppWjbN16txtXhRt0r9rORXyEKa42ZvSGxGoLNbem4hiesy9uDIuxXth7PCvmcyYxe3NL1kH4KiN/toEvenyJGsOexRYQuA93NqYYWVu1XVuNKBgAV+uU3LEZfyQUjv8DpEvu7otxHofVSaRbgUKemoRJAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M/mrqa8E; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M/mrqa8E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738316626; x=1769852626;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NEHBG/X4A9psYOffzEjim++bPREmZ8r91av9LXQjPjY=;
  b=M/mrqa8E9Wa4Yx7/DwsmzRGPM+DHN5XDFMzKmnXQT4wvncjopL43/Aqt
   T08Z6p/QzJcgNjBKkKWzFqngOBoed81scKtRfyLRr+hS32R4/HswQ77eC
   UywzGXJ4LuHu2ZAaX6M1+70A8t6SrPJa5CWxz4LqbFLBLylNNPmZbYRtu
   RdBxefdiiTUdhvMFf+bU5Oj02EVytZX0bIcPsyUh35EjJNJP8QD39Hphs
   QTyiFimIBawkL59v5raaLjMsQVceIvH3v8YsVH08Jr0lV8YJC0CFK0Zce
   vxOXfs1SI9xu7pUo8yQz/5Q4jmNqn5rB60ctolM8hw4aevl2FpEkQ7jqI
   A==;
X-CSE-ConnectionGUID: jBrNOKDdRuCCPTemeYUqMw==
X-CSE-MsgGUID: eDTkfHeJTp20L0+K1b+Yog==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="64245812"
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; 
   d="scan'208";a="64245812"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 01:43:46 -0800
X-CSE-ConnectionGUID: BSEyZ0N5RmybNsmZBgELjw==
X-CSE-MsgGUID: BsEIMeatSUmPWeOVdSmtEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; 
   d="scan'208";a="109425625"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 31 Jan 2025 01:43:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdnYt-000mEY-0W;
	Fri, 31 Jan 2025 09:43:43 +0000
Date: Fri, 31 Jan 2025 17:43:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [morimoto:sound-msiof-2025-01-30 2/2]
 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts:53.18-59.4: Warning
 (spi_bus_reg): /soc/spi@e6e90000/port: missing or empty reg property
Message-ID: <202501311739.ZRWjzZgY-lkp@intel.com>
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
TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

tree:   https://github.com/morimoto/linux sound-msiof-2025-01-30
head:   d9a82c93cca8d2f5381062d77bbab0736dd6dc5b
commit: d9a82c93cca8d2f5381062d77bbab0736dd6dc5b [2/2] msiof
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20250131/202501311739.ZRWjzZgY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250131/202501311739.ZRWjzZgY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501311739.ZRWjzZgY-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts:53.18-59.4: Warning (spi_bus_reg): /soc/spi@e6e90000/port: missing or empty reg property
>> arch/arm64/boot/dts/renesas/r8a77960.dtsi:1436.24-1450.5: Warning (avoid_unnecessary_addr_size): /soc/spi@e6e90000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts:33.8-42.4: Warning (avoid_unnecessary_addr_size): /dummy: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property

vim +53 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts

d9b1c753878310 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts  Vladimir Barinov   2016-11-03  12  
d9b1c753878310 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts  Vladimir Barinov   2016-11-03  13  / {
83772e1b44231e arch/arm64/boot/dts/renesas/r8a77960-m3ulcb.dts Geert Uytterhoeven 2019-12-11  14  	model = "Renesas M3ULCB board based on r8a77960";
d9b1c753878310 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts  Vladimir Barinov   2016-11-03  15  	compatible = "renesas,m3ulcb", "renesas,r8a7796";
d9b1c753878310 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts  Vladimir Barinov   2016-11-03  16  
d9b1c753878310 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts  Vladimir Barinov   2016-11-03  17  	memory@48000000 {
d9b1c753878310 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts  Vladimir Barinov   2016-11-03  18  		device_type = "memory";
d9b1c753878310 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts  Vladimir Barinov   2016-11-03  19  		/* first 128MB is reserved for secure area. */
d9b1c753878310 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts  Vladimir Barinov   2016-11-03  20  		reg = <0x0 0x48000000 0x0 0x38000000>;
d9b1c753878310 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts  Vladimir Barinov   2016-11-03  21  	};
811a0d07e68ed3 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts  Vladimir Barinov   2016-11-03  22  
2a3ee629ed8b2f arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts  Vladimir Barinov   2017-01-26  23  	memory@600000000 {
2a3ee629ed8b2f arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts  Vladimir Barinov   2017-01-26  24  		device_type = "memory";
2a3ee629ed8b2f arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts  Vladimir Barinov   2017-01-26  25  		reg = <0x6 0x00000000 0x0 0x40000000>;
2a3ee629ed8b2f arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts  Vladimir Barinov   2017-01-26  26  	};
d9a82c93cca8d2 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-10  27  
d9a82c93cca8d2 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-10  28  	msiof_sound: msiof_sound {
d9a82c93cca8d2 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-10  29  		compatible = "audio-graph-card2";
d9a82c93cca8d2 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-10  30  		links = <&msiof_snd>;
d9a82c93cca8d2 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-10  31  	};
d9a82c93cca8d2 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-10  32  
d9a82c93cca8d2 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-10 @33  	dummy {
d9a82c93cca8d2 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-10  34  		#address-cells = <1>;
d9a82c93cca8d2 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-10  35  		#size-cells = <0>;
d9a82c93cca8d2 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-10  36  		compatible = "test-codec";
d9a82c93cca8d2 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-10  37  		port {
d9a82c93cca8d2 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-10  38  			dummy: endpoint {
d9a82c93cca8d2 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-10  39  				remote-endpoint = <&msiof>;
d9a82c93cca8d2 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-10  40  			};
d9a82c93cca8d2 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-10  41  		};
d9a82c93cca8d2 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-10  42  	};
d9a82c93cca8d2 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-10  43  };
d9a82c93cca8d2 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-10  44  
d9a82c93cca8d2 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-10  45  &msiof0 {
d9a82c93cca8d2 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-10  46  	#address-cells = <1>;
d9a82c93cca8d2 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-10  47  	#size-cells = <0>;
d9a82c93cca8d2 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-10  48  
d9a82c93cca8d2 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-10  49  	compatible = "renesas,msiof_sound-r8a7796",
d9a82c93cca8d2 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-10  50  		     "renesas,msiof_sound-gen3";
d9a82c93cca8d2 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-10  51  	status = "okay";
d9a82c93cca8d2 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-10  52  
d9a82c93cca8d2 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-10 @53  	msiof_snd: port {
d9a82c93cca8d2 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-10  54  		msiof: endpoint {
d9a82c93cca8d2 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-10  55  			remote-endpoint = <&dummy>;
d9a82c93cca8d2 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-10  56  			bitclock-master;
d9a82c93cca8d2 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-10  57  			frame-master;
d9a82c93cca8d2 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-10  58  		};
d9a82c93cca8d2 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts   Kuninori Morimoto  2024-07-10  59  	};
31e12cb663b039 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts  Vladimir Barinov   2016-11-03  60  };
d6e381673d8762 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts  Vladimir Barinov   2017-07-07  61  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
