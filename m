Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014C0125DF
	for <oe-kbuild@lists.linux.dev>; Sat, 10 May 2025 20:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746909925; cv=none; b=dJvGsXgSJh3oOEKm6pEWxh7xcZs/PC0y1D+vlBQuIO3tkCo/yJmZs3W6hOchZvSCjyBPObbTWPbdREqymqmGBloLeGHqzzTTxfyFv+Qmi+o80iulASbCoZTV51PWAr62CWUcSuKFlOVbPqbvOkNUbi35Ikr+BZeWe2ZTNEb2w8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746909925; c=relaxed/simple;
	bh=0ekSH2uI9o/geKSjWYq7zBjtzcm3rzvXRHHFX+xe1zQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KYmO1Esmr9R5Z8nmrvVfwNEUAYTzOAzi2BJYY78XMpyeID3jjcnhm/rOhkNpXsi6q0zB9PSzU3gxKFHGF1kDZDzhFWsIx8NILF4L93wf2lwaeKKzuL0O9Iblk+y2kie42U0kwynuHHAZpmTZKiHe+hcgMZ4jlwjBOWKhep0quwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ILYmtRhI; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ILYmtRhI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746909923; x=1778445923;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0ekSH2uI9o/geKSjWYq7zBjtzcm3rzvXRHHFX+xe1zQ=;
  b=ILYmtRhIaua94/z/nmzcozGmnFcjvtLF3eCysLRxYBQzb3+1OyfiAW1t
   qn/lj5v93pE7odR8LQiDjt/Mzgnl5r/vGuh7Slc9Hwweb3u6fD/lrZD7i
   ywMr+B1IaEtwG5JBW8a8BJMkscoTMHMXZM5g7gOAUTpP/kl2PK7XyHyv3
   eYjxxtAT2+BrEWyXEJo9irq2i7RCKVRlAbqf2PEFYLdiEMqTzG5a1bpd9
   U0SPCUyiiKR1zJ6/aHiWi0ZIZeBIikq79gcA5MzYtF7xCWF61CMxsPGQM
   RoLJfoGudzUxalVKD+cdo2dBG7XTh/VkEUiREBpIngQ+Zlvv3Qp6O2E/p
   w==;
X-CSE-ConnectionGUID: EG+1FyaIR0S+uCQYGAk2xQ==
X-CSE-MsgGUID: 2KFQswHkSw+ugkDEiQnT2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11429"; a="48884133"
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="48884133"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 13:45:23 -0700
X-CSE-ConnectionGUID: 1e45lkLVQvCTCt3myWnbjQ==
X-CSE-MsgGUID: khqD/tIsQrefJOv9ImObhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="141010286"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 May 2025 13:45:21 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDr4Q-000DNP-31;
	Sat, 10 May 2025 20:45:18 +0000
Date: Sun, 11 May 2025 04:44:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: timer: Convert lsi,zevio-timer to DT schema
Message-ID: <202505110412.wCibIeYB-lkp@intel.com>
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
In-Reply-To: <20250506022257.2588136-1-robh@kernel.org>
References: <20250506022257.2588136-1-robh@kernel.org>
TO: "Rob Herring (Arm)" <robh@kernel.org>

Hi Rob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/timers/core]
[also build test WARNING on linus/master v6.15-rc5 next-20250509]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring-Arm/dt-bindings-timer-Convert-lsi-zevio-timer-to-DT-schema/20250506-143752
base:   tip/timers/core
patch link:    https://lore.kernel.org/r/20250506022257.2588136-1-robh%40kernel.org
patch subject: [PATCH] dt-bindings: timer: Convert lsi,zevio-timer to DT schema
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm-randconfig-051-20250507 (https://download.01.org/0day-ci/archive/20250511/202505110412.wCibIeYB-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250511/202505110412.wCibIeYB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505110412.wCibIeYB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nspire/nspire.dtsi:44.21-47.4: Warning (unit_address_vs_reg): /base_clk: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/nspire/nspire.dtsi:49.19-53.4: Warning (unit_address_vs_reg): /ahb_clk: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/nspire/nspire.dtsi:130.16-220.5: Warning (unit_address_vs_reg): /ahb/apb@90000000: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/nspire/nspire-tp.dtb: /base_clk: failed to match any schema with compatible: ['lsi,nspire-classic-clock']
   arch/arm/boot/dts/nspire/nspire-tp.dtb: /ahb_clk: failed to match any schema with compatible: ['lsi,nspire-classic-ahb-divider']
   arch/arm/boot/dts/nspire/nspire-tp.dtb: apb@90000000 (simple-bus): 'clocks' is a dependency of 'clock-ranges'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
>> arch/arm/boot/dts/nspire/nspire-tp.dtb: timer@900d0000 (lsi,zevio-timer): 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/lsi,zevio-timer.yaml#
>> arch/arm/boot/dts/nspire/nspire-tp.dtb: timer@900d0000 (lsi,zevio-timer): clocks: [[9], [9], [9]] is too long
   	from schema $id: http://devicetree.org/schemas/timer/lsi,zevio-timer.yaml#
   arch/arm/boot/dts/nspire/nspire-tp.dtb: /ahb/interrupt-controller@dc000000: failed to match any schema with compatible: ['lsi,zevio-intc']
--
   arch/arm/boot/dts/nspire/nspire.dtsi:44.21-47.4: Warning (unit_address_vs_reg): /base_clk: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/nspire/nspire.dtsi:49.19-53.4: Warning (unit_address_vs_reg): /ahb_clk: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/nspire/nspire.dtsi:130.16-220.5: Warning (unit_address_vs_reg): /ahb/apb@90000000: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/nspire/nspire-clp.dtb: /base_clk: failed to match any schema with compatible: ['lsi,nspire-classic-clock']
   arch/arm/boot/dts/nspire/nspire-clp.dtb: /ahb_clk: failed to match any schema with compatible: ['lsi,nspire-classic-ahb-divider']
   arch/arm/boot/dts/nspire/nspire-clp.dtb: apb@90000000 (simple-bus): 'clocks' is a dependency of 'clock-ranges'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
>> arch/arm/boot/dts/nspire/nspire-clp.dtb: timer@900d0000 (lsi,zevio-timer): 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/lsi,zevio-timer.yaml#
>> arch/arm/boot/dts/nspire/nspire-clp.dtb: timer@900d0000 (lsi,zevio-timer): clocks: [[9], [9], [9]] is too long
   	from schema $id: http://devicetree.org/schemas/timer/lsi,zevio-timer.yaml#
   arch/arm/boot/dts/nspire/nspire-clp.dtb: /ahb/interrupt-controller@dc000000: failed to match any schema with compatible: ['lsi,zevio-intc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
