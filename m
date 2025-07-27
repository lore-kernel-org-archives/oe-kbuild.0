Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BF627726
	for <oe-kbuild@lists.linux.dev>; Sun, 27 Jul 2025 06:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753596430; cv=none; b=hMRZmGDN21V8xKwc5RhJe7z0sbjQmVJQ4UcdbPhcyPWCLe43rygm+K02TnEyhR+f1QFzzvSuNw+UWxjUEVIEmfLj3+DVadQhCkoHsUYtTH4LFqIfQdJqUXgpViWHPPQBvMLsLF9qk52xvvjL8prSjpBktGAjqGDwq7PMsXIktKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753596430; c=relaxed/simple;
	bh=g3pHtXNeGrDqdgfUQ95gnRsAZ11c2z98seBMSbE/GKs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ah9lmRZOk2+jZL+N1gKQAm6lEhj4yTGGy2iNb4qxiLXK1XKXDWBeMuQRTYm1N4WE5OQ17i/NOfNteXB1tqQXmRDJv+KDIiPfiIkG0SXVaKE3VQO5y1Iz0ShT2W+B7kT7MIWDt7MEkVszz0I8gAW+ruX0K02hXSAbs1TxVJ6on4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BNIKOjMO; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BNIKOjMO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753596428; x=1785132428;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g3pHtXNeGrDqdgfUQ95gnRsAZ11c2z98seBMSbE/GKs=;
  b=BNIKOjMOD9ecPzW3to4J7M/D6l8nzhBl6lzWsDb6Ld6Nr6izpaFL2PA6
   QRSosyhys5/WOWRm+aXRDpBuG0Fd1ynyzbh8qvQDogqPiOROqR6EAaTKu
   Kq1Ykkdu2AU5K7FiQBtx49yU3xqtjBkluOzZbRb/enLdvL+1g3qk15RxL
   bkc8Kuo6KoUfFrxiHMVdmQwOuKtIlA/XdGeCX47n7egBS2YoVd2tfpMcc
   PxSOjfQfuC3QvSQhvO8gFSo5YlkVqKJVZwYLxT0LgBgmCIHznV68KGpH6
   vB5498BVPM3WrJG9wt6TtyQ84k84alywvy+B24gg9WN+bMVcjbLTe8BE2
   g==;
X-CSE-ConnectionGUID: WydIYmdNS8KGp5VX8EFkjA==
X-CSE-MsgGUID: 04sycTOWQTSf493MNMAObg==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="66142331"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="66142331"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 23:07:07 -0700
X-CSE-ConnectionGUID: hoD58Nr3Q/6BNXBP4b3UIg==
X-CSE-MsgGUID: eMEYUyB4Qn6UThjRIwmFGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="161866663"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 26 Jul 2025 23:07:05 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufuXH-000MUl-1b;
	Sun, 27 Jul 2025 06:07:03 +0000
Date: Sun, 27 Jul 2025 14:06:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/1] dt-bindings: fsl: fsl,rcpm: reference
 power-domains.yaml
Message-ID: <202507271319.m2NdJjDy-lkp@intel.com>
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
In-Reply-To: <20250725055835.260930-1-alexander.stein@ew.tq-group.com>
References: <20250725055835.260930-1-alexander.stein@ew.tq-group.com>
TO: Alexander Stein <alexander.stein@ew.tq-group.com>
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Frank Li <Frank.Li@nxp.com>
CC: Alexander Stein <alexander.stein@ew.tq-group.com>
CC: linuxppc-dev@lists.ozlabs.org
CC: linux-arm-kernel@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Alexander,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.16-rc7 next-20250725]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Stein/dt-bindings-fsl-fsl-rcpm-reference-power-domains-yaml/20250725-140232
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250725055835.260930-1-alexander.stein%40ew.tq-group.com
patch subject: [PATCH 1/1] dt-bindings: fsl: fsl,rcpm: reference power-domains.yaml
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20250726 (https://download.01.org/0day-ci/archive/20250727/202507271319.m2NdJjDy-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250727/202507271319.m2NdJjDy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507271319.m2NdJjDy-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dtb: wakeup-controller@1ee2140 (fsl,ls1012a-rcpm): $nodename:0: 'wakeup-controller@1ee2140' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dtb: wakeup-controller@1ee2140 (fsl,ls1012a-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls1012a-frwy.dtb: wakeup-controller@1ee2140 (fsl,ls1012a-rcpm): $nodename:0: 'wakeup-controller@1ee2140' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1012a-frwy.dtb: wakeup-controller@1ee2140 (fsl,ls1012a-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls1012a-oxalis.dtb: wakeup-controller@1ee2140 (fsl,ls1012a-rcpm): $nodename:0: 'wakeup-controller@1ee2140' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1012a-oxalis.dtb: wakeup-controller@1ee2140 (fsl,ls1012a-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dtb: wakeup-controller@1ee2140 (fsl,ls1012a-rcpm): $nodename:0: 'wakeup-controller@1ee2140' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dtb: wakeup-controller@1ee2140 (fsl,ls1012a-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dtb: wakeup-controller@1ee2140 (fsl,ls1012a-rcpm): $nodename:0: 'wakeup-controller@1ee2140' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dtb: wakeup-controller@1ee2140 (fsl,ls1012a-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: wakeup-controller@1e34040 (fsl,ls1028a-rcpm): $nodename:0: 'wakeup-controller@1e34040' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: wakeup-controller@1e34040 (fsl,ls1028a-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: wakeup-controller@1e34040 (fsl,ls1028a-rcpm): $nodename:0: 'wakeup-controller@1e34040' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: wakeup-controller@1e34040 (fsl,ls1028a-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: wakeup-controller@1e34040 (fsl,ls1028a-rcpm): $nodename:0: 'wakeup-controller@1e34040' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: wakeup-controller@1e34040 (fsl,ls1028a-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: wakeup-controller@1e34040 (fsl,ls1028a-rcpm): $nodename:0: 'wakeup-controller@1e34040' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: wakeup-controller@1e34040 (fsl,ls1028a-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: wakeup-controller@1e34040 (fsl,ls1028a-rcpm): $nodename:0: 'wakeup-controller@1e34040' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: wakeup-controller@1e34040 (fsl,ls1028a-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: wakeup-controller@1e34040 (fsl,ls1028a-rcpm): $nodename:0: 'wakeup-controller@1e34040' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: wakeup-controller@1e34040 (fsl,ls1028a-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: wakeup-controller@1e34040 (fsl,ls1028a-rcpm): $nodename:0: 'wakeup-controller@1e34040' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: wakeup-controller@1e34040 (fsl,ls1028a-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: wakeup-controller@1e34040 (fsl,ls1028a-rcpm): $nodename:0: 'wakeup-controller@1e34040' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: wakeup-controller@1e34040 (fsl,ls1028a-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: wakeup-controller@1e34040 (fsl,ls1028a-rcpm): $nodename:0: 'wakeup-controller@1e34040' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: wakeup-controller@1e34040 (fsl,ls1028a-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: wakeup-controller@1ee2140 (fsl,ls1043a-rcpm): $nodename:0: 'wakeup-controller@1ee2140' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: wakeup-controller@1ee2140 (fsl,ls1043a-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: wakeup-controller@1ee2140 (fsl,ls1043a-rcpm): $nodename:0: 'wakeup-controller@1ee2140' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: wakeup-controller@1ee2140 (fsl,ls1043a-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a.dtsi:17.19-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@1550000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: wakeup-controller@1ee2140 (fsl,ls1043a-rcpm): $nodename:0: 'wakeup-controller@1ee2140' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: wakeup-controller@1ee2140 (fsl,ls1043a-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: wakeup-controller@1ee2140 (fsl,ls1046a-rcpm): $nodename:0: 'wakeup-controller@1ee2140' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: wakeup-controller@1ee2140 (fsl,ls1046a-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: wakeup-controller@1ee2140 (fsl,ls1046a-rcpm): $nodename:0: 'wakeup-controller@1ee2140' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: wakeup-controller@1ee2140 (fsl,ls1046a-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: wakeup-controller@1ee2140 (fsl,ls1046a-rcpm): $nodename:0: 'wakeup-controller@1ee2140' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: wakeup-controller@1ee2140 (fsl,ls1046a-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a.dtsi:17.19-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@1550000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: wakeup-controller@1ee2140 (fsl,ls1046a-rcpm): $nodename:0: 'wakeup-controller@1ee2140' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: wakeup-controller@1ee2140 (fsl,ls1046a-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: wakeup-controller@1e34040 (fsl,ls1088a-rcpm): $nodename:0: 'wakeup-controller@1e34040' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: wakeup-controller@1e34040 (fsl,ls1088a-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: wakeup-controller@1e34040 (fsl,ls1088a-rcpm): $nodename:0: 'wakeup-controller@1e34040' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: wakeup-controller@1e34040 (fsl,ls1088a-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts:309.19-358.4: Warning (avoid_unnecessary_addr_size): /soc/spi@20c0000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts:360.16-400.4: Warning (avoid_unnecessary_addr_size): /soc/spi@20c0000/flash@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dtb: wakeup-controller@1e34040 (fsl,ls1088a-rcpm): $nodename:0: 'wakeup-controller@1e34040' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dtb: wakeup-controller@1e34040 (fsl,ls1088a-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a.dtsi:17.19-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@20c0000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb: wakeup-controller@1e34040 (fsl,ls1088a-rcpm): $nodename:0: 'wakeup-controller@1e34040' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb: wakeup-controller@1e34040 (fsl,ls1088a-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: wakeup-controller@1e34040 (fsl,ls208xa-rcpm): $nodename:0: 'wakeup-controller@1e34040' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: wakeup-controller@1e34040 (fsl,ls208xa-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: wakeup-controller@1e34040 (fsl,ls208xa-rcpm): $nodename:0: 'wakeup-controller@1e34040' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: wakeup-controller@1e34040 (fsl,ls208xa-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: wakeup-controller@1e34040 (fsl,ls208xa-rcpm): $nodename:0: 'wakeup-controller@1e34040' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: wakeup-controller@1e34040 (fsl,ls208xa-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls2080a-simu.dtb: wakeup-controller@1e34040 (fsl,ls208xa-rcpm): $nodename:0: 'wakeup-controller@1e34040' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls2080a-simu.dtb: wakeup-controller@1e34040 (fsl,ls208xa-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: wakeup-controller@1e34040 (fsl,ls208xa-rcpm): $nodename:0: 'wakeup-controller@1e34040' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: wakeup-controller@1e34040 (fsl,ls208xa-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: wakeup-controller@1e34040 (fsl,ls208xa-rcpm): $nodename:0: 'wakeup-controller@1e34040' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: wakeup-controller@1e34040 (fsl,ls208xa-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi:1703.34-1775.5: Warning (avoid_unnecessary_addr_size): /soc/pinmux@70010012c: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: wakeup-controller@1e34040 (fsl,lx2160a-rcpm): $nodename:0: 'wakeup-controller@1e34040' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: wakeup-controller@1e34040 (fsl,lx2160a-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi:1703.34-1775.5: Warning (avoid_unnecessary_addr_size): /soc/pinmux@70010012c: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: wakeup-controller@1e34040 (fsl,lx2160a-rcpm): $nodename:0: 'wakeup-controller@1e34040' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: wakeup-controller@1e34040 (fsl,lx2160a-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi:1703.34-1775.5: Warning (avoid_unnecessary_addr_size): /soc/pinmux@70010012c: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: wakeup-controller@1e34040 (fsl,lx2160a-rcpm): $nodename:0: 'wakeup-controller@1e34040' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: wakeup-controller@1e34040 (fsl,lx2160a-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi:1703.34-1775.5: Warning (avoid_unnecessary_addr_size): /soc/pinmux@70010012c: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: wakeup-controller@1e34040 (fsl,lx2160a-rcpm): $nodename:0: 'wakeup-controller@1e34040' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: wakeup-controller@1e34040 (fsl,lx2160a-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi:1703.34-1775.5: Warning (avoid_unnecessary_addr_size): /soc/pinmux@70010012c: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: wakeup-controller@1e34040 (fsl,lx2160a-rcpm): $nodename:0: 'wakeup-controller@1e34040' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: wakeup-controller@1e34040 (fsl,lx2160a-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi:1703.34-1775.5: Warning (avoid_unnecessary_addr_size): /soc/pinmux@70010012c: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: wakeup-controller@1e34040 (fsl,lx2160a-rcpm): $nodename:0: 'wakeup-controller@1e34040' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: wakeup-controller@1e34040 (fsl,lx2160a-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi:1703.34-1775.5: Warning (avoid_unnecessary_addr_size): /soc/pinmux@70010012c: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: wakeup-controller@1e34040 (fsl,lx2160a-rcpm): $nodename:0: 'wakeup-controller@1e34040' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: wakeup-controller@1e34040 (fsl,lx2160a-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi:1703.34-1775.5: Warning (avoid_unnecessary_addr_size): /soc/pinmux@70010012c: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: wakeup-controller@1e34040 (fsl,lx2160a-rcpm): $nodename:0: 'wakeup-controller@1e34040' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: wakeup-controller@1e34040 (fsl,lx2160a-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi:41.18-55.4: Warning (avoid_unnecessary_addr_size): /soc/spi@20c0000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi:1703.34-1775.5: Warning (avoid_unnecessary_addr_size): /soc/pinmux@70010012c: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: wakeup-controller@1e34040 (fsl,lx2160a-rcpm): $nodename:0: 'wakeup-controller@1e34040' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: wakeup-controller@1e34040 (fsl,lx2160a-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: wakeup-controller@1e34040 (fsl,ls1028a-rcpm): $nodename:0: 'wakeup-controller@1e34040' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: wakeup-controller@1e34040 (fsl,ls1028a-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: wakeup-controller@1e34040 (fsl,ls1028a-rcpm): $nodename:0: 'wakeup-controller@1e34040' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: wakeup-controller@1e34040 (fsl,ls1028a-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: wakeup-controller@1e34040 (fsl,ls1028a-rcpm): $nodename:0: 'wakeup-controller@1e34040' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: wakeup-controller@1e34040 (fsl,ls1028a-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: wakeup-controller@1e34040 (fsl,ls1028a-rcpm): $nodename:0: 'wakeup-controller@1e34040' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: wakeup-controller@1e34040 (fsl,ls1028a-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: wakeup-controller@1e34040 (fsl,ls1028a-rcpm): $nodename:0: 'wakeup-controller@1e34040' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: wakeup-controller@1e34040 (fsl,ls1028a-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.dtb: wakeup-controller@1e34040 (fsl,lx2160a-rcpm): $nodename:0: 'wakeup-controller@1e34040' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.dtb: wakeup-controller@1e34040 (fsl,lx2160a-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
