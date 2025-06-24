Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32C33FE7
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Jun 2025 01:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750729025; cv=none; b=cp44i1Fxdpi1Y4tEZjtTCrupIyzMKEe/JFdYC3Qdr0t0d5eJ2KdAzL3XHjcfpJyPElHmv0JF7990LN39gW6JAArAEgbH70uGobrJVmfgUXMw42TDsglMh3sqhH8NcuTNvYuP+lsrWFOZkADDQEo3042rbXUXWVY1zeA17NFp1/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750729025; c=relaxed/simple;
	bh=P8aSxWEuRXk9n0aNNF8eIEUT2WzfjU5ZHWmPVNPe3TQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ig1IPY1jzQ+u4dTJ7PwaBzchNRxopJjqW29TI+D6HDX6x3vMvRG2BIPyWSOmZVI8fSLeei3CoY5bhn0a0sOajgmqf1ZVECKpVzDvcsBWZChh9tgcwMUmF5KSSiVAQ1t+Q3+b2YGsro4TdidECVPjWwCrur3qsC0R8onFM/yKmQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yver2lbt; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yver2lbt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750729022; x=1782265022;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P8aSxWEuRXk9n0aNNF8eIEUT2WzfjU5ZHWmPVNPe3TQ=;
  b=Yver2lbtWuT/8Hod5kv0MSgcDJMxjZQtCkEd66t7bbgHoiqPWtot50UL
   wMYiF10OSAtdzTxY5UKQEr9yBhJVeWB0Iq1kKyc6WAS6j0ZDX99L2Uvjv
   PJS1U55V7994NR15RDy8R6OTtjsrjTeMp5xHx6c6Zfxuh5S6AYkcFBH9b
   kv86JlB7o+w6SwzfB5dF27HRem2/0lTrdbHE8zHdlgYDwW8FgUNg7XF9f
   4xtSjyhLEDBt6cLmx2c4vrGHZlKQE4vyL3gMpUU2+L1yv4P/rlqPuG2ci
   2tvjFtTqTn5AjK1aFEntSezd/wHvjFC1Ju4dtpp2ChxIL4zMHtnXe5iVh
   A==;
X-CSE-ConnectionGUID: wP1q0b2tR5ifBLjrLTqLaQ==
X-CSE-MsgGUID: luHRfVndSXWNTvGtmI9OAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="64385348"
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="64385348"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 18:37:01 -0700
X-CSE-ConnectionGUID: YWkuWaPYTleScMBWUOSOwQ==
X-CSE-MsgGUID: 4d/coPH3QC+i7QNIDDct1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="157258190"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 23 Jun 2025 18:37:00 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTsao-000RbW-0L;
	Tue, 24 Jun 2025 01:36:58 +0000
Date: Tue, 24 Jun 2025 09:36:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 10/11] ARM: dts: mediatek: add basic support for JTY D101
 board
Message-ID: <202506241126.td9jarBJ-lkp@intel.com>
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
In-Reply-To: <20250620-mt6572-v1-10-e2d47820f042@proton.me>
References: <20250620-mt6572-v1-10-e2d47820f042@proton.me>
TO: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Jiri Slaby <jirislaby@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Matthias Brugger <matthias.bgg@gmail.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
TO: Thomas Gleixner <tglx@linutronix.de>
TO: Daniel Lezcano <daniel.lezcano@linaro.org>
TO: Wim Van Sebroeck <wim@linux-watchdog.org>
TO: Guenter Roeck <linux@roeck-us.net>
TO: Sean Wang <sean.wang@mediatek.com>
TO: Russell King <linux@armlinux.org.uk>
CC: linux-kernel@vger.kernel.org
CC: linux-serial@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-mediatek@lists.infradead.org
CC: linux-watchdog@vger.kernel.org
CC: Max Shevchenko <wctrl@proton.me>

Hi Max,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0ff41df1cb268fc69e703a08a57ee14ae967d0ca]

url:    https://github.com/intel-lab-lkp/linux/commits/Max-Shevchenko-via-B4-Relay/dt-bindings-serial-mediatek-uart-add-MT6572/20250620-234721
base:   0ff41df1cb268fc69e703a08a57ee14ae967d0ca
patch link:    https://lore.kernel.org/r/20250620-mt6572-v1-10-e2d47820f042%40proton.me
patch subject: [PATCH 10/11] ARM: dts: mediatek: add basic support for JTY D101 board
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-051-20250621 (https://download.01.org/0day-ci/archive/20250624/202506241126.td9jarBJ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.6.1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250624/202506241126.td9jarBJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506241126.td9jarBJ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/mediatek/mt6572-jty-d101.dts:22.37-30.5: Warning (unit_address_vs_reg): /chosen/framebuffer@bf400000: node has a unit name, but no reg or ranges property
>> arch/arm/boot/dts/mediatek/mt6572-jty-d101.dts:33.9-36.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/mediatek/mt6572-jty-d101.dts:17.9-31.4: Warning (avoid_unnecessary_addr_size): /chosen: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm/boot/dts/mediatek/mt6572-jty-d101.dtb: / (jty,d101): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[2147483648, 1073741824]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#

vim +22 arch/arm/boot/dts/mediatek/mt6572-jty-d101.dts

a913a253369557 Max Shevchenko 2025-06-20   8  
a913a253369557 Max Shevchenko 2025-06-20   9  / {
a913a253369557 Max Shevchenko 2025-06-20  10  	model = "JTY D101";
a913a253369557 Max Shevchenko 2025-06-20  11  	compatible = "jty,d101", "mediatek,mt6572";
a913a253369557 Max Shevchenko 2025-06-20  12  
a913a253369557 Max Shevchenko 2025-06-20  13  	aliases {
a913a253369557 Max Shevchenko 2025-06-20  14  		serial0 = &uart0;
a913a253369557 Max Shevchenko 2025-06-20  15  	};
a913a253369557 Max Shevchenko 2025-06-20  16  
a913a253369557 Max Shevchenko 2025-06-20 @17  	chosen {
a913a253369557 Max Shevchenko 2025-06-20  18  		#address-cells = <1>;
a913a253369557 Max Shevchenko 2025-06-20  19  		#size-cells = <1>;
a913a253369557 Max Shevchenko 2025-06-20  20  		stdout-path = "serial0:921600n8";
a913a253369557 Max Shevchenko 2025-06-20  21  
a913a253369557 Max Shevchenko 2025-06-20 @22  		framebuffer: framebuffer@bf400000 {
a913a253369557 Max Shevchenko 2025-06-20  23  			compatible = "simple-framebuffer";
a913a253369557 Max Shevchenko 2025-06-20  24  			memory-region = <&framebuffer_reserved>;
a913a253369557 Max Shevchenko 2025-06-20  25  			width = <1024>;
a913a253369557 Max Shevchenko 2025-06-20  26  			height = <600>;
a913a253369557 Max Shevchenko 2025-06-20  27  			stride = <(1024 * 2)>;
a913a253369557 Max Shevchenko 2025-06-20  28  			format = "r5g6b5";
a913a253369557 Max Shevchenko 2025-06-20  29  			status = "okay";
a913a253369557 Max Shevchenko 2025-06-20  30  		};
a913a253369557 Max Shevchenko 2025-06-20  31  	};
a913a253369557 Max Shevchenko 2025-06-20  32  
a913a253369557 Max Shevchenko 2025-06-20 @33  	memory {
a913a253369557 Max Shevchenko 2025-06-20  34  		device_type = "memory";
a913a253369557 Max Shevchenko 2025-06-20  35  		reg = <0x80000000 0x40000000>;
a913a253369557 Max Shevchenko 2025-06-20  36  	};
a913a253369557 Max Shevchenko 2025-06-20  37  
a913a253369557 Max Shevchenko 2025-06-20  38  	reserved-memory {
a913a253369557 Max Shevchenko 2025-06-20  39  		#address-cells = <1>;
a913a253369557 Max Shevchenko 2025-06-20  40  		#size-cells = <1>;
a913a253369557 Max Shevchenko 2025-06-20  41  		ranges;
a913a253369557 Max Shevchenko 2025-06-20  42  
a913a253369557 Max Shevchenko 2025-06-20  43  		connsys@80000000 {
a913a253369557 Max Shevchenko 2025-06-20  44  			reg = <0x80000000 0x100000>;
a913a253369557 Max Shevchenko 2025-06-20  45  			no-map;
a913a253369557 Max Shevchenko 2025-06-20  46  		};
a913a253369557 Max Shevchenko 2025-06-20  47  
a913a253369557 Max Shevchenko 2025-06-20  48  		modem@be000000 {
a913a253369557 Max Shevchenko 2025-06-20  49  			reg = <0xbe000000 0x1400000>;
a913a253369557 Max Shevchenko 2025-06-20  50  			no-map;
a913a253369557 Max Shevchenko 2025-06-20  51  		};
a913a253369557 Max Shevchenko 2025-06-20  52  
a913a253369557 Max Shevchenko 2025-06-20  53  		framebuffer_reserved: framebuffer@bf400000 {
a913a253369557 Max Shevchenko 2025-06-20  54  			reg = <0xbf400000 0xc00000>;
a913a253369557 Max Shevchenko 2025-06-20  55  			no-map;
a913a253369557 Max Shevchenko 2025-06-20  56  		};
a913a253369557 Max Shevchenko 2025-06-20  57  	};
a913a253369557 Max Shevchenko 2025-06-20  58  };
a913a253369557 Max Shevchenko 2025-06-20  59  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
