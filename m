Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811013AD51C
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Jul 2026 12:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785068736; cv=none; b=ZwpK217YqhrEK7DV7F6DHamQ32JtdJVS2ukjesTBQ4asvwQ92jgcUaC+ZLc5+/E27uhyLugVA5rwXGPpurQ7cLj8+LtqsXMsvUajzjt27DMsLZ0pnR7PAq8hYbxATgjGveDnYFA2/2tEl1LxCEzc4AsBN+5PIFwfXiHDWHt1pho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785068736; c=relaxed/simple;
	bh=XY4JP6btTeXUq0Ixgs5MJ//jWRVLqCBTksmP3l9Eraw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jqcU16ps5Kv4R+LJE2vyWyljtesk4UxoGom5g9mE+3t5Smw/m0iZCmGqhvrv7Bs8QXGVgHmEn2QlkUag8tyiFxspbA5P3udH1SjxhzyN8jk5W4PqfnCUgSm4FOQ5FIKeDhP6srRYI/x4JWsUp8K0Y4rHWXkppqXXHxhwEUcKeys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gcuXdBPm; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gcuXdBPm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785068733; x=1816604733;
  h=date:from:to:cc:subject:message-id;
  bh=XY4JP6btTeXUq0Ixgs5MJ//jWRVLqCBTksmP3l9Eraw=;
  b=gcuXdBPmsXHygHSZOIOivR5ovNfbbHWkD6HByIiyJWgtEzwxHsCfAcld
   Is0C/R6VH7kmHK4h/JERcnlg8FKHjRddwrpGHc/GLkg6MBrCoGne6mUF+
   3QXmehY/dU+XtzfM0/cZu2mhiHoje5yV8JpRDV6+aSEF0sHvB4Rr/0ENr
   +9ZFlG9GuMUSADMWT0HuQ2NIuDMY9cAw/dWOkrZ0ON3qJJjTyaKHaZZPX
   /032IvTejYvGqWm8TtRmQT38HJiIx/lAwqaglDDPHgUvHM/6wzW/inFY+
   md6GsMWfXN1bzm/iJhGhn3uH1rqv1PZ+6gGlfqIGxXKOwREI9BoXizRJQ
   Q==;
X-CSE-ConnectionGUID: 42yX2QpuRxqxrwoC0Yfnhg==
X-CSE-MsgGUID: nyj9g0kfSPm/b31jYqM8qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11856"; a="97174669"
X-IronPort-AV: E=Sophos;i="6.25,186,1779174000"; 
   d="scan'208";a="97174669"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2026 05:25:31 -0700
X-CSE-ConnectionGUID: LdVp/suwRzSRhLRfzHS96g==
X-CSE-MsgGUID: POiByjb0TWOLqhPcmDVA8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,186,1779174000"; 
   d="scan'208";a="254835420"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 26 Jul 2026 05:25:29 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnxv5-000000001QY-3ANu;
	Sun, 26 Jul 2026 12:25:27 +0000
Date: Sun, 26 Jul 2026 14:24:54 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [spacemit:dt-for-next 19/21]
 arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: spi@d401c000
 (spacemit,k3-spi): compatible:0: 'spacemit,k1-spi' was expected
Message-ID: <202607261425.Ox3qGHRf-lkp@intel.com>
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
CC: Yixun Lan <dlan@kernel.org>
TO: Zhengyu He <hezhy472013@gmail.com>
CC: Yixun Lan <dlan@kernel.org>
CC: Cody Kang <cody.kang.hk@outlook.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git dt-for-next
head:   31efde747b5e5d2c185e06d872a9ef9b87f505ac
commit: 26e08208efc22ab7717018030e9c6d428adfc713 [19/21] riscv: dts: spacemit: add SPI controllers for K3
:::::: branch date: 4 hours ago
:::::: commit date: 23 hours ago
config: riscv-randconfig-2051-20260726 (https://download.01.org/0day-ci/archive/20260726/202607261425.Ox3qGHRf-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 9521d0c03324fb5950727522cdf71d94fd3f68b1)
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260726/202607261425.Ox3qGHRf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607261425.Ox3qGHRf-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: phy@1 (ethernet-phy-id001c.c916): $nodename:0: 'phy@1' does not match '^ethernet-phy(@[a-f0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml
   arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: phy@1 (ethernet-phy-id001c.c916): compatible: ['ethernet-phy-id001c.c916', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml
   arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: phy@1 (ethernet-phy-id001c.c916): Unevaluated properties are not allowed ('reg', 'reset-assert-us', 'reset-deassert-us', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: spi@d401c000 (spacemit,k3-spi): compatible:0: 'spacemit,k1-spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/spacemit,k1-spi.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: spi@d401c000 (spacemit,k3-spi): compatible: ['spacemit,k3-spi', 'spacemit,k1-spi'] is too long
   	from schema $id: http://devicetree.org/schemas/spi/spacemit,k1-spi.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: /soc/spi@d401c000: failed to match any schema with compatible: ['spacemit,k3-spi', 'spacemit,k1-spi']
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: spi@d4040000 (spacemit,k3-spi): compatible:0: 'spacemit,k1-spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/spacemit,k1-spi.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: spi@d4040000 (spacemit,k3-spi): compatible: ['spacemit,k3-spi', 'spacemit,k1-spi'] is too long
   	from schema $id: http://devicetree.org/schemas/spi/spacemit,k1-spi.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: /soc/spi@d4040000: failed to match any schema with compatible: ['spacemit,k3-spi', 'spacemit,k1-spi']
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: spi@d4040800 (spacemit,k3-spi): compatible:0: 'spacemit,k1-spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/spacemit,k1-spi.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: spi@d4040800 (spacemit,k3-spi): compatible: ['spacemit,k3-spi', 'spacemit,k1-spi'] is too long
   	from schema $id: http://devicetree.org/schemas/spi/spacemit,k1-spi.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: /soc/spi@d4040800: failed to match any schema with compatible: ['spacemit,k3-spi', 'spacemit,k1-spi']
--
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: spi@d401c000 (spacemit,k3-spi): compatible:0: 'spacemit,k1-spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/spacemit,k1-spi.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: spi@d401c000 (spacemit,k3-spi): compatible: ['spacemit,k3-spi', 'spacemit,k1-spi'] is too long
   	from schema $id: http://devicetree.org/schemas/spi/spacemit,k1-spi.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: /soc/spi@d401c000: failed to match any schema with compatible: ['spacemit,k3-spi', 'spacemit,k1-spi']
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: spi@d4040000 (spacemit,k3-spi): compatible:0: 'spacemit,k1-spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/spacemit,k1-spi.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: spi@d4040000 (spacemit,k3-spi): compatible: ['spacemit,k3-spi', 'spacemit,k1-spi'] is too long
   	from schema $id: http://devicetree.org/schemas/spi/spacemit,k1-spi.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: /soc/spi@d4040000: failed to match any schema with compatible: ['spacemit,k3-spi', 'spacemit,k1-spi']
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: spi@d4040800 (spacemit,k3-spi): compatible:0: 'spacemit,k1-spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/spacemit,k1-spi.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: spi@d4040800 (spacemit,k3-spi): compatible: ['spacemit,k3-spi', 'spacemit,k1-spi'] is too long
   	from schema $id: http://devicetree.org/schemas/spi/spacemit,k1-spi.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: /soc/spi@d4040800: failed to match any schema with compatible: ['spacemit,k3-spi', 'spacemit,k1-spi']
--
   arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: phy@1 (ethernet-phy-id001c.c916): $nodename:0: 'phy@1' does not match '^ethernet-phy(@[a-f0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml
   arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: phy@1 (ethernet-phy-id001c.c916): compatible: ['ethernet-phy-id001c.c916', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml
   arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: phy@1 (ethernet-phy-id001c.c916): Unevaluated properties are not allowed ('reg', 'reset-assert-us', 'reset-deassert-us', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: spi@d401c000 (spacemit,k3-spi): compatible:0: 'spacemit,k1-spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/spacemit,k1-spi.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: spi@d401c000 (spacemit,k3-spi): compatible: ['spacemit,k3-spi', 'spacemit,k1-spi'] is too long
   	from schema $id: http://devicetree.org/schemas/spi/spacemit,k1-spi.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: /soc/spi@d401c000: failed to match any schema with compatible: ['spacemit,k3-spi', 'spacemit,k1-spi']
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: spi@d4040000 (spacemit,k3-spi): compatible:0: 'spacemit,k1-spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/spacemit,k1-spi.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: spi@d4040000 (spacemit,k3-spi): compatible: ['spacemit,k3-spi', 'spacemit,k1-spi'] is too long
   	from schema $id: http://devicetree.org/schemas/spi/spacemit,k1-spi.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: /soc/spi@d4040000: failed to match any schema with compatible: ['spacemit,k3-spi', 'spacemit,k1-spi']
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: spi@d4040800 (spacemit,k3-spi): compatible:0: 'spacemit,k1-spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/spacemit,k1-spi.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: spi@d4040800 (spacemit,k3-spi): compatible: ['spacemit,k3-spi', 'spacemit,k1-spi'] is too long
   	from schema $id: http://devicetree.org/schemas/spi/spacemit,k1-spi.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: /soc/spi@d4040800: failed to match any schema with compatible: ['spacemit,k3-spi', 'spacemit,k1-spi']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
