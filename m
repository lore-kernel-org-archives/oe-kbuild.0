Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44496205AC6
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Nov 2024 20:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731528814; cv=none; b=Q7cNDIIgT436vtsxw3ezHrd/6cWK9PVpOnsx6VMkUR/0VzkeYQvM/TTOP/FmfmlYxjqUuOj8+qcLVB4hkzurBGl/NSfnq0CsxSINxEEfBLg5vB8rJMGlfqpygkxK77ady6jYYjkVngSQl3R004LQqCwHFXhafQAfUCk/hJPfFlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731528814; c=relaxed/simple;
	bh=ggPRmF+816DTquta67xHOuORt2acG3AHRTY3aL96lYo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yw+Xp70XsDew/KNmSz0dUtlCyHO5QULuU4t7MzBQDXCYOQv1/c8Iah9Yx0w6WYTg9451rWUyz7BmK+HFx5F0rVNdasj2c8diiGQbtFi7+ZWX7i9fBjO8c6/EbFF9ZL55CE3LUn4BzS1oz12iAz/M9A17+59S+NG/0suV5G2WCVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dRKH1UZ5; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dRKH1UZ5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731528812; x=1763064812;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ggPRmF+816DTquta67xHOuORt2acG3AHRTY3aL96lYo=;
  b=dRKH1UZ5cEults492NBeAMBxjhGqaHXy3kWbZuRFyaR6uWjHtu3Yn/L8
   tNGWFbqdzliJRyzXovIhIsalqZYh3dBeX30yxS9HUeK/LNTUcHbfJacwd
   9mzx77M4MQocVsk1b2UymP85REP6hWHTmvaPTXv5i6HE6BHkW/7L7OYxy
   VNglaJ8lGf+gVXOHokgbiZRY52AYg9u4rp0I6U6iOb16KwMuInDgCCpte
   f8aazdxFPIIKxsQjuMEH8zNQEp5/5LQcstFTxesuolFPVdNTj18/oPFsN
   W+/wM4+DVogSWDD+Dk6oQ0sKCYEEdVsCRtzD5VjdlJW2kf22IQV+WitW2
   w==;
X-CSE-ConnectionGUID: zG8jNwPGSwGCf8HRXaIDHA==
X-CSE-MsgGUID: wdpBiUQoTyuNeP8p9/xMDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="35236356"
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; 
   d="scan'208";a="35236356"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 12:13:32 -0800
X-CSE-ConnectionGUID: dDgDCu3HTBW7X6YhLeVXfQ==
X-CSE-MsgGUID: x26izMcESVGujHab7euS4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; 
   d="scan'208";a="93042540"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 13 Nov 2024 12:13:31 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBJk0-0000gf-1Q;
	Wed, 13 Nov 2024 20:13:28 +0000
Date: Thu, 14 Nov 2024 04:13:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/3] arm64: dts: nuvoton: Add Ethernet nodes
Message-ID: <202411140345.7g6SDOqP-lkp@intel.com>
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
In-Reply-To: <20241113051857.12732-3-a0987203069@gmail.com>
References: <20241113051857.12732-3-a0987203069@gmail.com>
TO: Joey Lu <a0987203069@gmail.com>
TO: andrew+netdev@lunn.ch
TO: davem@davemloft.net
TO: edumazet@google.com
TO: kuba@kernel.org
TO: pabeni@redhat.com
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: mcoquelin.stm32@gmail.com
TO: richardcochran@gmail.com
CC: alexandre.torgue@foss.st.com
CC: joabreu@synopsys.com
CC: ychuang3@nuvoton.com
CC: schung@nuvoton.com
CC: yclu4@nuvoton.com
CC: linux-arm-kernel@lists.infradead.org
CC: netdev@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: openbmc@lists.ozlabs.org
CC: linux-stm32@st-md-mailman.stormreply.com
CC: Joey Lu <a0987203069@gmail.com>

Hi Joey,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on net-next/main net/main linus/master v6.12-rc7 next-20241113]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Joey-Lu/dt-bindings-net-nuvoton-Add-schema-for-MA35-family-GMAC/20241113-132300
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241113051857.12732-3-a0987203069%40gmail.com
patch subject: [PATCH v2 2/3] arm64: dts: nuvoton: Add Ethernet nodes
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20241114/202411140345.7g6SDOqP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241114/202411140345.7g6SDOqP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411140345.7g6SDOqP-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts:15.10-23.4: ERROR (path_references): /aliases: Reference to non-existent node or label "eth0"
--
>> arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts:15.10-23.4: ERROR (path_references): /aliases: Reference to non-existent node or label "eth1"

vim +/eth0 +15 arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts

b69af09847323f Jacky Huang 2023-06-05  10  
b69af09847323f Jacky Huang 2023-06-05  11  / {
b69af09847323f Jacky Huang 2023-06-05  12  	model = "Nuvoton MA35D1-SOM";
b69af09847323f Jacky Huang 2023-06-05  13  	compatible = "nuvoton,ma35d1-som", "nuvoton,ma35d1";
b69af09847323f Jacky Huang 2023-06-05  14  
b69af09847323f Jacky Huang 2023-06-05 @15  	aliases {
b69af09847323f Jacky Huang 2023-06-05  16  		serial0 = &uart0;
82d7cf56551af9 Jacky Huang 2024-08-19  17  		serial11 = &uart11;
82d7cf56551af9 Jacky Huang 2024-08-19  18  		serial12 = &uart12;
82d7cf56551af9 Jacky Huang 2024-08-19  19  		serial14 = &uart14;
82d7cf56551af9 Jacky Huang 2024-08-19  20  		serial16 = &uart16;
e6ba4259118e2f Joey Lu     2024-11-13  21  		ethernet0 = &eth0;
e6ba4259118e2f Joey Lu     2024-11-13  22  		ethernet1 = &eth1;
b69af09847323f Jacky Huang 2023-06-05  23  	};
b69af09847323f Jacky Huang 2023-06-05  24  
b69af09847323f Jacky Huang 2023-06-05  25  	chosen {
b69af09847323f Jacky Huang 2023-06-05  26  		stdout-path = "serial0:115200n8";
b69af09847323f Jacky Huang 2023-06-05  27  	};
b69af09847323f Jacky Huang 2023-06-05  28  
b69af09847323f Jacky Huang 2023-06-05  29  	mem: memory@80000000 {
b69af09847323f Jacky Huang 2023-06-05  30  		device_type = "memory";
b69af09847323f Jacky Huang 2023-06-05  31  		reg = <0x00000000 0x80000000 0 0x10000000>; /* 256M DRAM */
b69af09847323f Jacky Huang 2023-06-05  32  	};
b69af09847323f Jacky Huang 2023-06-05  33  
b69af09847323f Jacky Huang 2023-06-05  34  	clk_hxt: clock-hxt {
b69af09847323f Jacky Huang 2023-06-05  35  		compatible = "fixed-clock";
b69af09847323f Jacky Huang 2023-06-05  36  		#clock-cells = <0>;
b69af09847323f Jacky Huang 2023-06-05  37  		clock-frequency = <24000000>;
b69af09847323f Jacky Huang 2023-06-05  38  		clock-output-names = "clk_hxt";
b69af09847323f Jacky Huang 2023-06-05  39  	};
b69af09847323f Jacky Huang 2023-06-05  40  };
b69af09847323f Jacky Huang 2023-06-05  41  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
