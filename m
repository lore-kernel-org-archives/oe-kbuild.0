Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F767261D
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Aug 2025 13:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755092305; cv=none; b=BK2Or8O4sumgMF/IELZK62wCqA35l0YQDOsWSM6INT+Ia+Ymgc+Djkd/cu3L5gli3jMR5fuPGtxwidJk24e50pU/KYx/KHNeS3yRJzmGhdrTp26zJzaauvR0hwq4J7npWnOXXa3lX4JUS3QgNlSsZbGNtYRSwBkKkCvRQWus3BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755092305; c=relaxed/simple;
	bh=JgKUW+pkoLzSlH3KPUGR8hNuv6N56BQ2eisYzeCPwew=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PXfaTdeYDkfNO2Gn83wHvPHiuP0iotrfQD4DEvBXhzD7YTMuL1JE+qIH56LIB04XRTVV3IFZgKYtoEE4/afHNViki7eKtEMHHHgUNiFdJars7Na5LlKbR2S/ha7f7wbyftlCGNDvDQCxMhiMu0bHrk+W5+AtZjJ57YrC05f/kWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dWC+q/rR; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dWC+q/rR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755092304; x=1786628304;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JgKUW+pkoLzSlH3KPUGR8hNuv6N56BQ2eisYzeCPwew=;
  b=dWC+q/rR9RlYPeJhMjVqofBNX7NBu57NUhltYL4jHZcp6N2YAWqhrz53
   Q7cMyO62w21URZAvgN3jYsFAf8DEOIEfYQ8rP/cILBBTtZSWYqnowmLSz
   I3lE2eIey9ilNWtwIFXSyAuFkhWrJIrRGjSGxEqLf512SPk/z7GGssEO5
   YmS1wmivYjnNZm1mK1jJDWqREmnhgQbBkAargW8j6San7T1fOIZew80ZT
   CduOg0ybQcOrJEZvNJZUU82UywGkohiVONxP9kOYDdIXH7UIG2EvRt4MD
   RSEINflAjhK/gCJsOPJcRqCzMMhVo+FyQUjcixO8OnJDiyMReKFB5II/h
   Q==;
X-CSE-ConnectionGUID: qv4m/hEPSsmaoDKsEn43PQ==
X-CSE-MsgGUID: fZI31OipQ7Kd+BOshrhrPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57531592"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="57531592"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 06:38:23 -0700
X-CSE-ConnectionGUID: U3qBjoa6TXiw0j1aKOpMxA==
X-CSE-MsgGUID: t8z+9HP+TSWZ/qJuvS8jgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="170607875"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 13 Aug 2025 06:38:23 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umBfY-0009wm-1n;
	Wed, 13 Aug 2025 13:37:47 +0000
Date: Wed, 13 Aug 2025 21:33:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: arm/cpus: Add missing Applied Micro CPU
 compatibles
Message-ID: <202508132128.vspiDfLS-lkp@intel.com>
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
In-Reply-To: <20250812181428.69490-1-robh@kernel.org>
References: <20250812181428.69490-1-robh@kernel.org>
TO: "Rob Herring (Arm)" <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Lorenzo Pieralisi <lpieralisi@kernel.org>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Rob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on krzk/for-next krzk-dt/for-next krzk-mem-ctrl/for-next linus/master v6.17-rc1 next-20250813]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring-Arm/dt-bindings-arm-cpus-Add-missing-Applied-Micro-CPU-compatibles/20250813-021632
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250812181428.69490-1-robh%40kernel.org
patch subject: [PATCH] dt-bindings: arm/cpus: Add missing Applied Micro CPU compatibles
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: arm64-randconfig-052-20250813 (https://download.01.org/0day-ci/archive/20250813/202508132128.vspiDfLS-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 3769ce013be2879bf0b329c14a16f5cb766f26ce)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250813/202508132128.vspiDfLS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508132128.vspiDfLS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apm/apm-shadowcat.dtsi:752.23-758.5: Warning (unique_unit_address_if_enabled): /soc/mdio@1f610000: duplicate unit-address (also used in node /soc/ethernet@1f610000)
   arch/arm64/boot/dts/apm/apm-shadowcat.dtsi:303.28-313.6: Warning (unique_unit_address_if_enabled): /soc/clocks/ahbclk@17000000: duplicate unit-address (also used in node /soc/clocks/rngpkaclk@17000000)
   arch/arm64/boot/dts/apm/apm-shadowcat.dtsi:315.32-325.6: Warning (unique_unit_address_if_enabled): /soc/clocks/sbapbclk@1704c000: duplicate unit-address (also used in node /soc/clocks/i2c4clk@1704c000)
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /: failed to match any schema with compatible: ['apm,merlin', 'apm,xgene-shadowcat']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /: failed to match any schema with compatible: ['apm,merlin', 'apm,xgene-shadowcat']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: / (apm,merlin): poweroff@10548010: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/arm64/boot/dts/apm/apm-merlin.dtb: cpu@0 (apm,strega): Unevaluated properties are not allowed ('#clock-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/apm/apm-merlin.dtb: cpu@1 (apm,strega): Unevaluated properties are not allowed ('#clock-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/apm/apm-merlin.dtb: cpu@100 (apm,strega): Unevaluated properties are not allowed ('#clock-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/apm/apm-merlin.dtb: cpu@101 (apm,strega): Unevaluated properties are not allowed ('#clock-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/apm/apm-merlin.dtb: cpu@200 (apm,strega): Unevaluated properties are not allowed ('#clock-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/apm/apm-merlin.dtb: cpu@201 (apm,strega): Unevaluated properties are not allowed ('#clock-cells' was unexpected)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
