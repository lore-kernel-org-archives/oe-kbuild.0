Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A587B1DBB13
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Aug 2025 15:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756568489; cv=none; b=JvY5fqBFdTjbg61U3jIKC4qyxmu0JpyjGLCC7rb1mvQuGfb/9fML07ABUMErP49nn9/ut4LfOMBJ1KENilFIibytm43xCfNncxgQ+ge26DCjkajh9NrtiCg81nljNxjHInYhcni91E6e5yo+QrbzcWj6p7fOpeGNLUjdLRJzVgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756568489; c=relaxed/simple;
	bh=PrjjgXQ9BppQwDHKHqjtdYIBClH20DnH4bRD4r04SPA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pjgHt9VhhGOr14Q4TC/AOdhLx7jWdunPrQRHukNPc0J4xMa4qOlXCw0pg54499kHzBjsKDQE9GCuc4HfE7AnCTHKNcXRLJNS26rjkOcXfgou2KN17hPyFAdln7oTNYCSWUmlrXcJnTYDC3Kotg304GfPzbSCdXtFonl3xN57nYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kjmFUWnu; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kjmFUWnu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756568488; x=1788104488;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PrjjgXQ9BppQwDHKHqjtdYIBClH20DnH4bRD4r04SPA=;
  b=kjmFUWnuukDtYpYNaQlPCtRGPMWc1rQ5BquFdy/maHb3T4wtmEjGPQS2
   Wmf7nvL9bwbO3iDQQ43Y99pxQSNWTGJ6JZ1f4DTEu9lE0EtuPZigVsJlv
   3bJU+NlVM2u04RzSalYrhbdHaq8Eb3IKun4CgCeDUGjWkrgny/N1IRmy/
   46xiXp8xn9by2w0o+HCCwP2U1syXzHiMk9g2OdLLc1i4DDO3DAyQVEaim
   OcNST9aVq2nX0z+3W/3puYVwI0ZYk135KUto2v/guRJjvSVWW5XWGpwui
   Pi+tVAV3MWm0XHIuUNLWal311o/BAMZYaLwbf16NhDO7P6zEbvi68khds
   g==;
X-CSE-ConnectionGUID: HVsFS8wLRfawRpm8bQ5iCw==
X-CSE-MsgGUID: Cbd/w6aFRD+CBF3Ikze2Vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="58933694"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="58933694"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2025 08:41:27 -0700
X-CSE-ConnectionGUID: k4Vq+sp6SMy+4lSVovWc4A==
X-CSE-MsgGUID: JoBX9w5FTDudxAh1986xRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="169912322"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 30 Aug 2025 08:41:26 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usNhV-000VT1-2G;
	Sat, 30 Aug 2025 15:41:13 +0000
Date: Sat, 30 Aug 2025 23:40:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: Convert apm,xgene-enet to
 DT schema
Message-ID: <202508302254.rLQ09wcc-lkp@intel.com>
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
In-Reply-To: <20250829202817.1271907-1-robh@kernel.org>
References: <20250829202817.1271907-1-robh@kernel.org>
TO: "Rob Herring (Arm)" <robh@kernel.org>
TO: Iyappan Subramanian <iyappan@os.amperecomputing.com>
TO: Keyur Chudgar <keyur@os.amperecomputing.com>
TO: Quan Nguyen <quan@os.amperecomputing.com>
TO: Andrew Lunn <andrew+netdev@lunn.ch>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Rob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring-Arm/dt-bindings-net-Convert-APM-XGene-MDIO-to-DT-schema/20250830-043036
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250829202817.1271907-1-robh%40kernel.org
patch subject: [PATCH net-next 1/2] dt-bindings: net: Convert apm,xgene-enet to DT schema
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: arm64-randconfig-051-20250830 (https://download.01.org/0day-ci/archive/20250830/202508302254.rLQ09wcc-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250830/202508302254.rLQ09wcc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508302254.rLQ09wcc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/pmu@78810000/pmucmc@7e8d0000: failed to match any schema with compatible: ['apm,xgene-pmu-mc']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/mailbox@10540000: failed to match any schema with compatible: ['apm,xgene-slimpro-mbox']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/i2cslimpro: failed to match any schema with compatible: ['apm,xgene-slimpro-i2c']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/hwmonslimpro: failed to match any schema with compatible: ['apm,xgene-slimpro-hwmon']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: mmc@1c000000 (arasan,sdhci-4.9a): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/rtc@10510000: failed to match any schema with compatible: ['apm,xgene-rtc']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/mdio@17020000: failed to match any schema with compatible: ['apm,xgene-mdio-rgmii']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: ethernet@17020000 (apm,xgene-enet): phy-handle:0: [36, 37] is too long
   	from schema $id: http://devicetree.org/schemas/net/apm,xgene-enet.yaml#
>> arch/arm64/boot/dts/apm/apm-mustang.dtb: ethernet@17020000 (apm,xgene-enet): Unevaluated properties are not allowed ('local-mac-address', 'phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/apm,xgene-enet.yaml#
   arch/arm64/boot/dts/apm/apm-mustang.dtb: ethernet@17020000 (apm,xgene-enet): phy-handle:0: [36, 37] is too long
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/dma@1f270000: failed to match any schema with compatible: ['apm,xgene-storm-dma']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
