Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF63625
	for <oe-kbuild@lists.linux.dev>; Fri, 11 Jul 2025 03:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752204095; cv=none; b=R7VNJUi2XG7RLOfLApCGGJ+Azw+w1qjyBVASAL1q92H3DRVUk3MdgM39kycZfTaGFUTq/3HRIQ8AENOxAEp8eo9Du2uHoPVsIwj82n0lAVHwpR2E+5VcVWOCa00zgg/CFw4CHmm9fOI4v8OR597CNk8dieLNfSbRCmeAmrFxIpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752204095; c=relaxed/simple;
	bh=0TsEy1wY1vAH+q2lKzmXEHKlV9sbIPd5JoTYQS2/jb4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RM2onhdjt5EQvH1jCjDFrQ0f5wsco78h66nVa1PkrV98PApGvqdFrpqI4d9R0Bb5YzbWaPXLeTZIlLml6sf5N6/RE8BOoKtKxbrWuN+6ibUG2V4+/UHDiJIZjjd7dLBBXNKhn+wzsr77y3H/VqNFgfk+WbQj89gOyK6SeDbvHkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RQ4xQqnY; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RQ4xQqnY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752204094; x=1783740094;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0TsEy1wY1vAH+q2lKzmXEHKlV9sbIPd5JoTYQS2/jb4=;
  b=RQ4xQqnY/y84+/LJkVB/K+FLlRScIoMPhaflvhYCOHZgiUhetom3WT53
   s99IcwWP4MGf4ewjnuFTS6zxed2zpEAl3N/ItTJ3po4Ymtz5TWTSQBgbG
   o4p09P+hA6LyoMP/9P5+ihEII2skX+ugdA1Dyt3pCSYAlbWTZLqnzDeIq
   4NggVOR6kgVeh6RH7KjfnrryqREAMYVEsor3XUdasucT2TGwzomysB0Ht
   zi9dC2pL1hI82fWTi8E3T/S7C+w9qkSiBy4B6c4X5tNOYrtLUbwGrX0cN
   1Hp39mB5sSp69OjghBVU1RafXKy4Y3x7lHZVeTpJL7BkRC+CBE9cvPj78
   A==;
X-CSE-ConnectionGUID: yNneNVqfQVGgRzrxuKIeIQ==
X-CSE-MsgGUID: 7uadUaijS924+oH1gdZ/Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="42130727"
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; 
   d="scan'208";a="42130727"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 20:21:34 -0700
X-CSE-ConnectionGUID: N0sZpngHQo+wFbnpHIBrSg==
X-CSE-MsgGUID: pDANmRmHRzSekN1RVRKPCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; 
   d="scan'208";a="155678183"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 10 Jul 2025 20:21:32 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ua4KH-0005o7-0x;
	Fri, 11 Jul 2025 03:21:29 +0000
Date: Fri, 11 Jul 2025 11:20:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 4/4] arm64: dts: allwinner: a523: Add power controller
 device nodes
Message-ID: <202507111143.btqojKRy-lkp@intel.com>
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
In-Reply-To: <20250709155343.3765227-5-wens@kernel.org>
References: <20250709155343.3765227-5-wens@kernel.org>
TO: "Chen-Yu Tsai" <wens@kernel.org>
TO: "Chen-Yu Tsai" <wens@csie.org>
TO: Jernej Skrabec <jernej@kernel.org>
TO: Samuel Holland <samuel@sholland.org>
TO: Ulf Hansson <ulf.hansson@linaro.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-sunxi@lists.linux.dev
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: linux-pm@vger.kernel.org
CC: Andre Przywara <andre.przywara@arm.com>

Hi Chen-Yu,

kernel test robot noticed the following build errors:

[auto build test ERROR on sunxi/sunxi/for-next]
[also build test ERROR on robh/for-next linus/master v6.16-rc5 next-20250710]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Yu-Tsai/dt-bindings-power-Add-A523-PPU-and-PCK600-power-controllers/20250709-235554
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi/for-next
patch link:    https://lore.kernel.org/r/20250709155343.3765227-5-wens%40kernel.org
patch subject: [PATCH v2 4/4] arm64: dts: allwinner: a523: Add power controller device nodes
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: arm64-randconfig-003-20250711 (https://download.01.org/0day-ci/archive/20250711/202507111143.btqojKRy-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250711/202507111143.btqojKRy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507111143.btqojKRy-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts:8:
>> arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:11:10: fatal error: dt-bindings/power/allwinner,sun55i-a523-pck600.h: No such file or directory
      11 | #include <dt-bindings/power/allwinner,sun55i-a523-pck600.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.

dtcheck warnings: (new ones prefixed by >>)
>> In file included from arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts:8:
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:11:10: fatal error: dt-bindings/power/allwinner,sun55i-a523-pck600.h: No such file or directory
      11 | #include <dt-bindings/power/allwinner,sun55i-a523-pck600.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.

vim +11 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi

35ac96f79664934 Andre Przywara 2025-03-07   3  
35ac96f79664934 Andre Przywara 2025-03-07   4  #include <dt-bindings/interrupt-controller/arm-gic.h>
35ac96f79664934 Andre Przywara 2025-03-07   5  #include <dt-bindings/clock/sun6i-rtc.h>
35ac96f79664934 Andre Przywara 2025-03-07   6  #include <dt-bindings/clock/sun55i-a523-ccu.h>
35ac96f79664934 Andre Przywara 2025-03-07   7  #include <dt-bindings/clock/sun55i-a523-r-ccu.h>
35ac96f79664934 Andre Przywara 2025-03-07   8  #include <dt-bindings/reset/sun55i-a523-ccu.h>
35ac96f79664934 Andre Przywara 2025-03-07   9  #include <dt-bindings/reset/sun55i-a523-r-ccu.h>
18c9bae1ae810c6 Chen-Yu Tsai   2025-07-09  10  #include <dt-bindings/power/allwinner,sun55i-a523-ppu.h>
18c9bae1ae810c6 Chen-Yu Tsai   2025-07-09 @11  #include <dt-bindings/power/allwinner,sun55i-a523-pck600.h>
35ac96f79664934 Andre Przywara 2025-03-07  12  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
