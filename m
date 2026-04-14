Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0363770B
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Apr 2026 00:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776127377; cv=none; b=BKFqLvc7dePT2Wcz91rEhjUxHYrxO7HnpOFGXVCdG4gPRzvnjYugT8qHPRdwXHV6k4nYr0nKq6w+XlE7PG/M0DDZVM024mZTs7kw5DnqKH9MWrneHYGoM4XCeLk2s1+vekHa1blKVn5oJCHLc7UBswl5z1RP3ksLW0ObEOR09H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776127377; c=relaxed/simple;
	bh=mfTXysS8oes85LPaDlUp6aX+fB9PRt5K5Ox2/DRf4Nc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Z39rZ0TYmq/qZxTyLV5/lm41zYkPa8OMCzMrmIGk5Ol8beLK5fmNhhGgdLS124QpwHT4/fxfiMyAD0PDCrKRq9fxNhOOGuZYsENAfYhS6IpbmtfmOGr82L17O2/ofrwd8Dl+bo2UWgieNGrzVzJezKSM/y3BANoKnARuA8dClx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c3Beo/Oj; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c3Beo/Oj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776127374; x=1807663374;
  h=date:from:to:cc:subject:message-id;
  bh=mfTXysS8oes85LPaDlUp6aX+fB9PRt5K5Ox2/DRf4Nc=;
  b=c3Beo/OjOjsF/pfR7iNHnhrq5T3WxeaHVlmULHRyM5dlg1rKemxFNefu
   gxJurHecQTMlGKlqBYhYtZKGfs3lc13irvlipl051iLBtR6ozg13vexkb
   fbe6WUU5SYvyTFel74zInCEYQLL1hySlREouLj2cUPhUcp9Kfit+vPuha
   S5Vyu+QOtdmh9mHZyyG4L1Gd+YDvFU3ADOWOB3rA8Dt1RfR2KY0fbaZ3i
   hlXvlrKKyDzu11huUZxc1lU8sqKfCIk+1jiYapUw+xCJFhdwRKmmbidKR
   dIZwfAl4r6SCx2nxmZrlAQI5PWihy5CclI1pcQZZROG9VKbfKhM9BwtWe
   g==;
X-CSE-ConnectionGUID: Pw9vKuO9SIiJRcb9Rj+o1w==
X-CSE-MsgGUID: 5eZ9oGqHR++GNL/idhJlDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="77095814"
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; 
   d="scan'208";a="77095814"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 17:42:54 -0700
X-CSE-ConnectionGUID: jSyvt0m7RceVuxwN16ClrQ==
X-CSE-MsgGUID: dfDMJkq6SEWWHi5FfYKrgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; 
   d="scan'208";a="225207309"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 13 Apr 2026 17:42:53 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCRrf-000000000GD-37Zz;
	Tue, 14 Apr 2026 00:42:51 +0000
Date: Tue, 14 Apr 2026 02:42:08 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb:
 i2c@d4010800 (spacemit,k3-i2c): compatible:0: 'spacemit,k1-i2c' was expected
Message-ID: <202604140259.eKDaxKua-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Sandie Cao <sandie.cao@deepcomputing.io>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Sandie-Cao/dt-bindings-riscv-spacemit-add-deepcomputing-fml13v05/20260413-185456
head:   6ae3374cdc7e80624717990ed9c10355cdcdaae6
commit: 6ae3374cdc7e80624717990ed9c10355cdcdaae6 riscv: dts: spacemit: add DeepComputing FML13V05 board device tree
date:   14 hours ago
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: riscv-randconfig-2051-20260413 (https://download.01.org/0day-ci/archive/20260414/202604140259.eKDaxKua-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
dtschema: 2026.5.dev2+g3579443c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260414/202604140259.eKDaxKua-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604140259.eKDaxKua-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: /soc/ethernet@cac80000: failed to match any schema with compatible: ['spacemit,k3-dwmac', 'snps,dwmac-5.40a']
   arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: /soc/ethernet@cac80000: failed to match any schema with compatible: ['spacemit,k3-dwmac', 'snps,dwmac-5.40a']
   arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: /soc/ethernet@cac82000: failed to match any schema with compatible: ['spacemit,k3-dwmac', 'snps,dwmac-5.40a']
   arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: /soc/ethernet@cac82000: failed to match any schema with compatible: ['spacemit,k3-dwmac', 'snps,dwmac-5.40a']
   arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: /soc/ethernet@cac8e000: failed to match any schema with compatible: ['spacemit,k3-dwmac', 'snps,dwmac-5.40a']
   arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: /soc/ethernet@cac8e000: failed to match any schema with compatible: ['spacemit,k3-dwmac', 'snps,dwmac-5.40a']
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: i2c@d4010800 (spacemit,k3-i2c): compatible:0: 'spacemit,k1-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: i2c@d4010800 (spacemit,k3-i2c): compatible: ['spacemit,k3-i2c', 'spacemit,k1-i2c'] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: /soc/i2c@d4010800: failed to match any schema with compatible: ['spacemit,k3-i2c', 'spacemit,k1-i2c']
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: i2c@d4011000 (spacemit,k3-i2c): compatible:0: 'spacemit,k1-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: i2c@d4011000 (spacemit,k3-i2c): compatible: ['spacemit,k3-i2c', 'spacemit,k1-i2c'] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: /soc/i2c@d4011000: failed to match any schema with compatible: ['spacemit,k3-i2c', 'spacemit,k1-i2c']
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: i2c@d4012000 (spacemit,k3-i2c): compatible:0: 'spacemit,k1-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: i2c@d4012000 (spacemit,k3-i2c): compatible: ['spacemit,k3-i2c', 'spacemit,k1-i2c'] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: /soc/i2c@d4012000: failed to match any schema with compatible: ['spacemit,k3-i2c', 'spacemit,k1-i2c']
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: i2c@d4012800 (spacemit,k3-i2c): compatible:0: 'spacemit,k1-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: i2c@d4012800 (spacemit,k3-i2c): compatible: ['spacemit,k3-i2c', 'spacemit,k1-i2c'] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: /soc/i2c@d4012800: failed to match any schema with compatible: ['spacemit,k3-i2c', 'spacemit,k1-i2c']
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: i2c@d4013800 (spacemit,k3-i2c): compatible:0: 'spacemit,k1-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: i2c@d4013800 (spacemit,k3-i2c): compatible: ['spacemit,k3-i2c', 'spacemit,k1-i2c'] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: /soc/i2c@d4013800: failed to match any schema with compatible: ['spacemit,k3-i2c', 'spacemit,k1-i2c']
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: i2c@d4018800 (spacemit,k3-i2c): compatible:0: 'spacemit,k1-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: i2c@d4018800 (spacemit,k3-i2c): compatible: ['spacemit,k3-i2c', 'spacemit,k1-i2c'] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: /soc/i2c@d4018800: failed to match any schema with compatible: ['spacemit,k3-i2c', 'spacemit,k1-i2c']
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: i2c@d401d800 (spacemit,k3-i2c): compatible:0: 'spacemit,k1-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: i2c@d401d800 (spacemit,k3-i2c): compatible: ['spacemit,k3-i2c', 'spacemit,k1-i2c'] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: /soc/i2c@d401d800: failed to match any schema with compatible: ['spacemit,k3-i2c', 'spacemit,k1-i2c']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
