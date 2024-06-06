Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43BE1991C6
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Jun 2024 18:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717698084; cv=none; b=G6z0k40cF+nKPFEXFDoQRq3u6L06PfuDwdkqIJLsIseVY2AD8MwyvwxOf6xig/FMj9rv2nXkVffQi3U/Tnq5W2rUazp8bxdN7aKcpL/i2u1Hr1awgGQX0tfIc9JEyphJX6iSFDORZAljz4Oapc4GstmbiBC81+K/sMw/NbzmY1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717698084; c=relaxed/simple;
	bh=y6icbh+CDlDBx8xDSuP+5IsaZhYm5o71AsYm7vzrNek=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NdYBQJYFqmNsVBG+CiQN5yirNw2AZRHdpwn4bfAH9K9lm2WUIOhSkFwIyY2NrprAqfei+QAGRt+/QXabZa2ByhkTnmf7qGD1Z4xDHQsOTFs3CVVIlwj4Jy/sn/N2nh2LT+6/vqZ4mJ/RLwXDFOhaqINmonp9+uwTI/+2mX4ZjhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NnN9H9R/; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NnN9H9R/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717698083; x=1749234083;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y6icbh+CDlDBx8xDSuP+5IsaZhYm5o71AsYm7vzrNek=;
  b=NnN9H9R/dEYoqgXR7zToi2x5ftXSU430YIS/X52gXmOp9Tlwj/roFONF
   pBZk/SoFD9kuJJSuD3RrGBTbMAbUE8GPzDJsMCFpqPCDJhBKeJ5DUjUmC
   18Yqh+eaz6z5lJdWMSrmIYiMcTzyC2j+HRDQeerf1Lz/0Xcp/SZ3dHrg3
   Z/OzAO1uOozay7xU9V2Qr5OXlhGSFMrIXtxEJ7+mrIclXnqWbDB4jRpgX
   ljiwBlsUJ5Gr3mWjs9WQjm5+ypgd806HcOj9I/EW+obd1yQanWwvfA7X8
   O31MtdOJoLfNRSzlLbZWEZMhjZXHqdJch7QjU1tlouyiQ96BZgW6mCiCo
   Q==;
X-CSE-ConnectionGUID: RUM79MI8Tl2o2IY5NXD0dQ==
X-CSE-MsgGUID: LobK/Rt9SOCwNB/QJ5PGXQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="25045384"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="25045384"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 11:21:22 -0700
X-CSE-ConnectionGUID: WKxhYYMqSeKHFpqyiOQv/g==
X-CSE-MsgGUID: Q7tCXV9uQj+UvlhZzd5vtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="42973547"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 06 Jun 2024 11:21:21 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFHjh-0003YK-2j;
	Thu, 06 Jun 2024 18:21:18 +0000
Date: Fri, 7 Jun 2024 02:20:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] ARM: dts: bcm-mobile: Split out nodes used by both
 BCM21664 and BCM23550
Message-ID: <202406070221.achg575g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/arm/boot/dts/broadcom/bcm21664.dtsi:31.37-38.5: Warning (simple_bus_reg): /apps-bus@3e300000/interrupt-controller@1c00100: simple-bus unit address format error, expected "1c01000""
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240605-bcm21664-common-v1-2-6386e9141eb6@gmail.com>
References: <20240605-bcm21664-common-v1-2-6386e9141eb6@gmail.com>
TO: Artur Weber <aweber.kernel@gmail.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Florian Fainelli <florian.fainelli@broadcom.com>
TO: Ray Jui <rjui@broadcom.com>
TO: Scott Branden <sbranden@broadcom.com>
CC: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
CC: Stanislav Jakubek <stano.jakubek@gmail.com>
CC: ~postmarketos/upstreaming@lists.sr.ht
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Artur Weber <aweber.kernel@gmail.com>

Hi Artur,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a38297e3fb012ddfa7ce0321a7e5a8daeb1872b6]

url:    https://github.com/intel-lab-lkp/linux/commits/Artur-Weber/ARM-dts-broadcom-bcm21664-Move-chosen-node-into-bcm21664-garnet-DTS/20240605-144250
base:   a38297e3fb012ddfa7ce0321a7e5a8daeb1872b6
patch link:    https://lore.kernel.org/r/20240605-bcm21664-common-v1-2-6386e9141eb6%40gmail.com
patch subject: [PATCH 2/2] ARM: dts: bcm-mobile: Split out nodes used by both BCM21664 and BCM23550
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240607/202406070221.achg575g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406070221.achg575g-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/broadcom/bcm21664.dtsi:31.37-38.5: Warning (simple_bus_reg): /apps-bus@3e300000/interrupt-controller@1c00100: simple-bus unit address format error, expected "1c01000"

vim +/1c01000 +31 arch/arm/boot/dts/broadcom/bcm21664.dtsi

2eba905e860f8a arch/arm/boot/dts/bcm21664.dtsi          Markus Mayer 2014-03-06   5  
2eba905e860f8a arch/arm/boot/dts/bcm21664.dtsi          Markus Mayer 2014-03-06   6  / {
2eba905e860f8a arch/arm/boot/dts/bcm21664.dtsi          Markus Mayer 2014-03-06   7  	model = "BCM21664 SoC";
2eba905e860f8a arch/arm/boot/dts/bcm21664.dtsi          Markus Mayer 2014-03-06   8  	compatible = "brcm,bcm21664";
2eba905e860f8a arch/arm/boot/dts/bcm21664.dtsi          Markus Mayer 2014-03-06   9  	interrupt-parent = <&gic>;
2eba905e860f8a arch/arm/boot/dts/bcm21664.dtsi          Markus Mayer 2014-03-06  10  
1d3138b75e3af4 arch/arm/boot/dts/bcm21664.dtsi          Alex Elder   2014-06-30  11  	cpus {
1d3138b75e3af4 arch/arm/boot/dts/bcm21664.dtsi          Alex Elder   2014-06-30  12  		#address-cells = <1>;
1d3138b75e3af4 arch/arm/boot/dts/bcm21664.dtsi          Alex Elder   2014-06-30  13  		#size-cells = <0>;
1d3138b75e3af4 arch/arm/boot/dts/bcm21664.dtsi          Alex Elder   2014-06-30  14  
1d3138b75e3af4 arch/arm/boot/dts/bcm21664.dtsi          Alex Elder   2014-06-30  15  		cpu0: cpu@0 {
1d3138b75e3af4 arch/arm/boot/dts/bcm21664.dtsi          Alex Elder   2014-06-30  16  			device_type = "cpu";
1d3138b75e3af4 arch/arm/boot/dts/bcm21664.dtsi          Alex Elder   2014-06-30  17  			compatible = "arm,cortex-a9";
1d3138b75e3af4 arch/arm/boot/dts/bcm21664.dtsi          Alex Elder   2014-06-30  18  			reg = <0>;
1d3138b75e3af4 arch/arm/boot/dts/bcm21664.dtsi          Alex Elder   2014-06-30  19  		};
1d3138b75e3af4 arch/arm/boot/dts/bcm21664.dtsi          Alex Elder   2014-06-30  20  
1d3138b75e3af4 arch/arm/boot/dts/bcm21664.dtsi          Alex Elder   2014-06-30  21  		cpu1: cpu@1 {
1d3138b75e3af4 arch/arm/boot/dts/bcm21664.dtsi          Alex Elder   2014-06-30  22  			device_type = "cpu";
1d3138b75e3af4 arch/arm/boot/dts/bcm21664.dtsi          Alex Elder   2014-06-30  23  			compatible = "arm,cortex-a9";
f302b57ab0e5ff arch/arm/boot/dts/bcm21664.dtsi          Chris Brand  2016-04-28  24  			enable-method = "brcm,bcm11351-cpu-method";
84320e1a635fcf arch/arm/boot/dts/bcm21664.dtsi          Kapil Hali   2015-12-01  25  			secondary-boot-reg = <0x35004178>;
1d3138b75e3af4 arch/arm/boot/dts/bcm21664.dtsi          Alex Elder   2014-06-30  26  			reg = <1>;
1d3138b75e3af4 arch/arm/boot/dts/bcm21664.dtsi          Alex Elder   2014-06-30  27  		};
1d3138b75e3af4 arch/arm/boot/dts/bcm21664.dtsi          Alex Elder   2014-06-30  28  	};
1d3138b75e3af4 arch/arm/boot/dts/bcm21664.dtsi          Alex Elder   2014-06-30  29  
6a24a6d8543d0b arch/arm/boot/dts/broadcom/bcm21664.dtsi Artur Weber  2024-06-05  30  	apps: apps-bus@3e300000 {
6a24a6d8543d0b arch/arm/boot/dts/broadcom/bcm21664.dtsi Artur Weber  2024-06-05 @31  		gic: interrupt-controller@1c00100 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
