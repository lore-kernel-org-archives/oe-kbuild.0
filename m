Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B0F17BB6
	for <oe-kbuild@lists.linux.dev>; Sat, 31 May 2025 15:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748704704; cv=none; b=t+Io+L37a4UWiqGeOrHhw8cq4BqS4egA98RyuDNBhSRdm2tL+uEOWtzkhCJ/+XVtbXnOIpmR2Ru1R00IsknrKwqJDLS/LRATrM43F0efkwOZtGANGcuLwBs74h0dlm76ePoYIpnDpBsAedITZ3cMaaqy2okIfEaB+UpBe6DUADg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748704704; c=relaxed/simple;
	bh=Pv4F4iryxQL/BY5JL+CvpIuYIhXxXUF53qDiVTBk3fw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dZtxoIiofaI8nQl+x4wuoo4ozkhcsYw0B2dKMNSPbLhXCHYrsLDXIGsj61u2JMCicPD8frKE93z5+jbin9RZltRJ7vrMfzY7cZ981exkdMQaYExVDQibho3Fi/gM/Bwx4E0eK3zKncRjXt/T4gQUOITH1JiZ3jbxopIggjFzBso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V/TMJcyY; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V/TMJcyY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748704702; x=1780240702;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pv4F4iryxQL/BY5JL+CvpIuYIhXxXUF53qDiVTBk3fw=;
  b=V/TMJcyYZFpeCgsp+b0JfkYgkvHjruhc7qNjtq0yHplZecfbebD83x+y
   2QvB1lDfMx+TnEZkti2Nf4xo86/UJrH76tZAz2Obk2JxKu7jb3FLNmj0C
   tnCTSbM3Bo+P+xL468NvRUEejrULOjDAmtoZ00ZCYK49B0BO3JnpJsqi5
   Vasa+uXwM8SULyIt38QLOtPLl/vYd1LWRzXq9CByC9pU2aJkgLwvd2EwX
   8Cd9UPNSEX24z2wgUPrkVR3dgScHYqZmEeXk4lAfyB4Ji4GMmB/MjfKMg
   3sPybRfewti8+nw66+rcTLxaWmxAaCpFihxvJJgcoZUx6pEFvDUYa1bhO
   Q==;
X-CSE-ConnectionGUID: KPswnKrnQ0eAHYJIMnH4RA==
X-CSE-MsgGUID: 8XorusmiSzehgW4c6AzRKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="50832278"
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600"; 
   d="scan'208";a="50832278"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2025 08:18:22 -0700
X-CSE-ConnectionGUID: 0J9BDLdUQ6CTdUyjzmJa0Q==
X-CSE-MsgGUID: b/TA+uNJRrK5eXrw1nyOEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600"; 
   d="scan'208";a="144463600"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 31 May 2025 08:18:20 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLNyT-000YSm-34;
	Sat, 31 May 2025 15:18:17 +0000
Date: Sat, 31 May 2025 23:18:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 3/3] dt-bindings: net: sun8i-emac: Add AC300 EMAC1
 nvmem phy selection
Message-ID: <202505312345.7itMKCfh-lkp@intel.com>
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
In-Reply-To: <20250527175558.2738342-3-james.hilliard1@gmail.com>
References: <20250527175558.2738342-3-james.hilliard1@gmail.com>
TO: James Hilliard <james.hilliard1@gmail.com>
TO: netdev@vger.kernel.org
CC: linux-sunxi@lists.linux.dev
CC: James Hilliard <james.hilliard1@gmail.com>
CC: Andrew Lunn <andrew+netdev@lunn.ch>
CC: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: "Chen-Yu Tsai" <wens@csie.org>
CC: Jernej Skrabec <jernej.skrabec@gmail.com>
CC: Samuel Holland <samuel@sholland.org>
CC: Maxime Ripard <mripard@kernel.org>
CC: Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: Giuseppe Cavallaro <peppe.cavallaro@st.com>
CC: Jose Abreu <joabreu@synopsys.com>
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org

Hi James,

kernel test robot noticed the following build warnings:

[auto build test WARNING on sunxi/sunxi/for-next]
[also build test WARNING on robh/for-next net/main net-next/main linus/master v6.15 next-20250530]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/James-Hilliard/net-stmmac-dwmac-sun8i-Allow-runtime-AC200-AC300-phy-selection/20250528-020008
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi/for-next
patch link:    https://lore.kernel.org/r/20250527175558.2738342-3-james.hilliard1%40gmail.com
patch subject: [PATCH v2 3/3] dt-bindings: net: sun8i-emac: Add AC300 EMAC1 nvmem phy selection
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-051-20250530 (https://download.01.org/0day-ci/archive/20250531/202505312345.7itMKCfh-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250531/202505312345.7itMKCfh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505312345.7itMKCfh-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: pinctrl@18800 (marvell,armada3710-sb-pinctrl): reg: [[100352, 256], [101376, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: /soc/bus@d0000000/ethernet@30000: failed to match any schema with compatible: ['marvell,armada-3700-neta']
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: ethernet-switch@1 (marvell,mv88e6085): ethernet-ports:ethernet-port@0: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/marvell,mv88e6xxx.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: ethernet-switch@1 (marvell,mv88e6085): ethernet-ports:ethernet-port@0: 'oneOf' conditional failed, one must be fixed:
   	'fixed-link' is a required property
   	'phy-handle' is a required property
   	'managed' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/marvell,mv88e6xxx.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: ethernet-switch@1 (marvell,mv88e6085): ethernet-ports:ethernet-port@2: Unevaluated properties are not allowed ('nvmem-cell-names', 'nvmem-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/marvell,mv88e6xxx.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: ethernet-switch@1 (marvell,mv88e6085): ethernet-ports:ethernet-port@3: Unevaluated properties are not allowed ('nvmem-cell-names', 'nvmem-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/marvell,mv88e6xxx.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: ethernet-switch@1 (marvell,mv88e6085): Unevaluated properties are not allowed ('dsa,member', 'ethernet-ports' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/marvell,mv88e6xxx.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: /soc/bus@d0000000/ethernet@40000: failed to match any schema with compatible: ['marvell,armada-3700-neta']
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: usb@58000 (marvell,armada3700-xhci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: /soc/bus@d0000000/system-controller@5d800: failed to match any schema with compatible: ['marvell,armada-3700-usb2-host-device-misc', 'syscon']
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: usb@5e000 (marvell,armada-3700-ehci): phy-names:0: 'usb' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
