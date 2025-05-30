Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE7D2222D5
	for <oe-kbuild@lists.linux.dev>; Fri, 30 May 2025 10:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748601371; cv=none; b=JEih3gN55ygjxIivHsM3EHzAnzjZdmE6w/TAZzek2JSJUL7tJAgE/L+u+zsgcm0+5Gq6YsJtG9Et7SGzqEAs/aZSnkVLYvhku/+BLhn/htDvZDVPaIM3fvi9NmWxuL8sF+u23WZvEcWUtTSkHmSObeQXonZdwrxHjkbSCb5fKRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748601371; c=relaxed/simple;
	bh=SyRZBXMkC61uNSzxgKwHETnx5A4rICDgV+lCp7lxFSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rXMd4QKEKJ4bWMgZ5Aw9ibjp0A9n/cgpeK7k6e5Rd0WOwgT1FMHWP95WvawLdquRI7BexH8bRX591jo7NSIUrMgc6DCCNOKMDtif3elUiItkdZLaaHct1mmtquZ4/bnQxIkaWCysA+r5Io61+Hzmti524vIwoutWOQuEYpmMluE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PAhzoCGV; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PAhzoCGV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748601370; x=1780137370;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SyRZBXMkC61uNSzxgKwHETnx5A4rICDgV+lCp7lxFSQ=;
  b=PAhzoCGVH9aPJUJ56JeCLDvzGLuaGek4bBdt7T2nTqVUqATCm/ECjKeU
   ByJh+LicpHmPY3xTHFQGz1ASVYMSCWPrnianWktVMbGB0M4dvv41YRrva
   ykqXvfdbc0dawpf1UYpPcw8Wk1PGVBMQckHTa/+OJRovoA5LV2SvsTPXm
   wFwQwqN0Xaga2KztkTcHJcadFeucIgP3oY5170X2x2QVfqRIlqjYpQsSl
   lT370ME3J/6LxeSiQimqWpJPqUarjW0eSVHVd7V+txXM6+jmS1BF1Qt7E
   4UnIOyz01CbDUq7XhySQLQEErsJErKdbNGdIPuz9irrDYYNDGl3Tg0fpp
   Q==;
X-CSE-ConnectionGUID: 2G93cvYUTXGDo13Z9gpjZg==
X-CSE-MsgGUID: xE9nANz8Qwq0p3IVwq+bSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50837040"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="50837040"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 03:36:07 -0700
X-CSE-ConnectionGUID: SLSMi6NRTR2JOzUAC1vNdQ==
X-CSE-MsgGUID: xtueh++YQCSIC+cZIKAv4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="174724018"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 30 May 2025 03:36:05 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKx5n-000XYc-0H;
	Fri, 30 May 2025 10:36:03 +0000
Date: Fri, 30 May 2025 18:35:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: net: dsa: microchip: add bit-banged SMI
 example
Message-ID: <202505301810.gNOn2u8O-lkp@intel.com>
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
In-Reply-To: <20250528203152.628818-1-corentin.guillevic@smile.fr>
References: <20250528203152.628818-1-corentin.guillevic@smile.fr>
TO: Corentin Guillevic <corentin.guillevic@smile.fr>
TO: Woojung Huh <woojung.huh@microchip.com>
TO: UNGLinuxDriver@microchip.com
TO: Andrew Lunn <andrew@lunn.ch>
TO: Vladimir Oltean <olteanv@gmail.com>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Marek Vasut <marex@denx.de>
CC: Corentin Guillevic <corentin.guillevic@smile.fr>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Corentin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.15 next-20250530]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Corentin-Guillevic/dt-bindings-net-dsa-microchip-add-bit-banged-SMI-example/20250529-043300
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250528203152.628818-1-corentin.guillevic%40smile.fr
patch subject: [PATCH] dt-bindings: net: dsa: microchip: add bit-banged SMI example
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20250530 (https://download.01.org/0day-ci/archive/20250530/202505301810.gNOn2u8O-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250530/202505301810.gNOn2u8O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505301810.gNOn2u8O-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dtb: cpu@1 (arm,cortex-a53): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dtb: cpu@2 (arm,cortex-a53): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dtb: cpu@2 (arm,cortex-a53): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dtb: cpu@3 (arm,cortex-a53): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dtb: cpu@3 (arm,cortex-a53): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dtb: /soc@0/bus@30800000/i2c@30a40000/switch@5f: failed to match any schema with compatible: ['microchip,ksz9897']
--
   arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: cpu@1 (arm,cortex-a53): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: cpu@2 (arm,cortex-a53): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: cpu@2 (arm,cortex-a53): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: cpu@3 (arm,cortex-a53): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: cpu@3 (arm,cortex-a53): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: /soc@0/bus@30800000/i2c@30a50000/switch@5f: failed to match any schema with compatible: ['microchip,ksz9893']
--
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: cpu@1 (arm,cortex-a53): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: cpu@2 (arm,cortex-a53): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: cpu@2 (arm,cortex-a53): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: cpu@3 (arm,cortex-a53): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: cpu@3 (arm,cortex-a53): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: /soc@0/bus@30800000/i2c@30a50000/switch@5f: failed to match any schema with compatible: ['microchip,ksz9893']
--
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dtb: cpu@1 (arm,cortex-a53): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dtb: cpu@2 (arm,cortex-a53): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dtb: cpu@2 (arm,cortex-a53): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dtb: cpu@3 (arm,cortex-a53): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dtb: cpu@3 (arm,cortex-a53): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dtb: /soc@0/bus@30800000/i2c@30a50000/switch@5f: failed to match any schema with compatible: ['microchip,ksz9893']
--
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: cpu@1 (arm,cortex-a53): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: cpu@2 (arm,cortex-a53): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: cpu@2 (arm,cortex-a53): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: cpu@3 (arm,cortex-a53): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: cpu@3 (arm,cortex-a53): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: /soc@0/bus@30800000/i2c@30a50000/switch@5f: failed to match any schema with compatible: ['microchip,ksz9893']
--
   arch/arm64/boot/dts/freescale/imx8mp-skov-revc-bd500.dtb: cpu@1 (arm,cortex-a53): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revc-bd500.dtb: cpu@2 (arm,cortex-a53): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revc-bd500.dtb: cpu@2 (arm,cortex-a53): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revc-bd500.dtb: cpu@3 (arm,cortex-a53): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revc-bd500.dtb: cpu@3 (arm,cortex-a53): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revc-bd500.dtb: /soc@0/bus@30800000/i2c@30a50000/switch@5f: failed to match any schema with compatible: ['microchip,ksz9893']
--
   arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtb: cpu@1 (arm,cortex-a53): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtb: cpu@2 (arm,cortex-a53): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtb: cpu@2 (arm,cortex-a53): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtb: cpu@3 (arm,cortex-a53): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtb: cpu@3 (arm,cortex-a53): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtb: /soc@0/bus@30800000/i2c@30a50000/switch@5f: failed to match any schema with compatible: ['microchip,ksz9893']
--
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb: cpu@1 (arm,cortex-a53): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb: cpu@2 (arm,cortex-a53): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb: cpu@2 (arm,cortex-a53): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb: cpu@3 (arm,cortex-a53): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb: cpu@3 (arm,cortex-a53): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb: /soc@0/bus@30800000/i2c@30a30000/switch@5f: failed to match any schema with compatible: ['microchip,ksz9897']
--
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb: cpu@1 (arm,cortex-a53): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb: cpu@2 (arm,cortex-a53): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb: cpu@2 (arm,cortex-a53): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb: cpu@3 (arm,cortex-a53): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb: cpu@3 (arm,cortex-a53): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb: /soc@0/bus@30800000/i2c@30a30000/switch@5f: failed to match any schema with compatible: ['microchip,ksz9897']
--
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-rpidsi.dtb: cpu@1 (arm,cortex-a53): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-rpidsi.dtb: cpu@2 (arm,cortex-a53): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-rpidsi.dtb: cpu@2 (arm,cortex-a53): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-rpidsi.dtb: cpu@3 (arm,cortex-a53): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-rpidsi.dtb: cpu@3 (arm,cortex-a53): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-rpidsi.dtb: /soc@0/bus@30800000/i2c@30a30000/switch@5f: failed to match any schema with compatible: ['microchip,ksz9897']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
