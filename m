Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794252479;
	b=cBeBpGznN6FK97dLPZhUU34Zm1gR8SONN9Ie+WERv85lOiUZmaFdTPjb8enLvgtgcy01
	 aIPUFrEStyssgCoVc/GK9sTGnYpLl7x4xjBKN7Ws5y/+Jvej8GleIPs0fB7m/Sibk2XXE
	 fIh5AdDvLfOr6+ivsT4bzj/8ath9NUAK7yh3GCUuVe3pxuQDHOxOBXj436/bKHP0N3hGh
	 HU8UJDyih4LoPd7pFd7QDgNPyfYOZHdmfKM/qU0okj5accfBGM0T8P+wKzvNsUMlt2eAl
	 sElKlZat7o3/pRxwF/sq4c6hNgI3Lprk6o8V8StAX9f5qA3uh4Os+ZR5LPM4v0d7pDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794252479;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=tYINhBxwOg73Z38xysP/k9axUbOQSuWqztiRnd3ZkoE=;
	b=FB1X6xBj+xaYrxEeKskvKK/PxAw3tW+ImPCUoQc3n95recVbZVcJ36LonaJHAqUHMQk1
	 eYvjbci/6TVJd9O7abJC8ToaZG889jnYdqLmjVWIEcA3g1+vlmduZepkpGdxBmRqqAsTW
	 svK1rm9ogVqUJXwwLYF0yx7GW2NQvI3/87LYgY7iGs6n5QbfWFhOMcglg3qVHw1HtdJfT
	 HZgHjMnGnABt4h8ncu/gznmISqgRzM0lk8WPAB2YuO6TN+b2JUbZ3BNd0AINOEssM2pjW
	 Yf2kOFjyvxZJGx9vJrzgjttcQb8S2/utr7wz3fRem8zd2SZIkW3MlAbFd9MvoXT4zuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O7BDUgoB;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFAC606A31C
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Nov 2026 19:27:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CFAC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O7BDUgoB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794252479; x=1825788479;
  h=date:from:to:cc:subject:message-id;
  bh=IQ1bQ73T6P7/BfDeURoAU44V0drdpHLiUdqXNjzZQVQ=;
  b=O7BDUgoBhShR1mL9T5oiwQErVi1gJN22QFSuWPNgKj2PhzoYxN3z02Pr
   IHlh4ZAJYV/NK/jHOe+R69dHSzEH/0iErV/4IPiJecxhQ6LabDr+AsjtT
   cs+4PenJX8dQE/Rke4TU5h6E/WqKRsyJU7aaibOuLqKSkZbG0GpLgLAoy
   YEVM1CY3YrQ/wjDzXa5WdjMHZxcSjwLq84K5ADwUePelikKJoFAX9aHZO
   /QHA3QBfoOpnwo7mmomwxclit02BslTio8dbDzzBbvrgdfcvvKI3glud9
   pixRUV56CHNqLASOtFatVVw66/rdpK9QkRAnknGhTZ8YBWlgT8WurYwuV
   A==;
X-CSE-ConnectionGUID: k5Usced6T3yP0jscIe5Itw==
X-CSE-MsgGUID: TavEOpKCSNitCuzjuUB0Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3026240"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="3026240"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 11:27:59 -0800
X-CSE-ConnectionGUID: 5+D6MEmBTpyscL/LN2w/pg==
X-CSE-MsgGUID: AcHZ1BTFSdOFdP0EdXNaHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="8264613"
Received: from igk-lkp-server01.igk.intel.com (HELO 1db0d17a343c) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 09 Nov 2026 11:27:58 -0800
Received: from kbuild by 1db0d17a343c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQV23-000000000SR-3QlA;
	Mon, 09 Nov 2026 19:27:55 +0000
Date: Mon, 09 Nov 2026 20:27:11 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 87/242]
 arch/arm64/boot/dts/apple/t6030-j514s.dtb: spmi@364714000 (apple,t6030-spmi):
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202611092045.o8orGUs1-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   c46abf5713fa41e1574fb50c462f53392d6f5cd7
commit: da04d8c50639d4def50d7e2effd6cdbefa3c9226 [87/242] arm64: dts: apple: t6030: Add more hardware
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261109/202611092045.o8orGUs1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261109/202611092045.o8orGUs1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611092045.o8orGUs1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t6030.dtsi:582.28-586.6: Warning (unit_address_vs_reg): /soc/smc@36c400000/gpio@67500000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t6030.dtsi:588.32-592.6: Warning (unit_address_vs_reg): /soc/smc@36c400000/gpio@67700000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/apple/t6030-j514s.dtb: spmi@364714000 (apple,t6030-spmi): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6030-spmi' is not one of ['apple,t6020-spmi', 'apple,t8012-spmi', 'apple,t8015-spmi', 'apple,t8122-spmi']
   	'apple,t6030-spmi' is not one of ['apple,t8103-spmi', 'apple,t6000-spmi', 'apple,t8112-spmi']
   	'apple,spmi' was expected
   	from schema $id: http://devicetree.org/schemas/spmi/apple,spmi.yaml
>> arch/arm64/boot/dts/apple/t6030-j514s.dtb: /soc/spmi@364714000: failed to match any schema with compatible: ['apple,t6030-spmi', 'apple,t8103-spmi']
>> arch/arm64/boot/dts/apple/t6030-j514s.dtb: pmic@b (apple,chapel-pmic): compatible:0: 'apple,chapel-pmic' is not one of ['apple,maverick-pmic', 'apple,sera-pmic', 'apple,stowe-pmic']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml
>> arch/arm64/boot/dts/apple/t6030-j514s.dtb: /soc/spmi@364714000/pmic@b: failed to match any schema with compatible: ['apple,chapel-pmic', 'apple,spmi-nvmem']
>> arch/arm64/boot/dts/apple/t6030-j514s.dtb: smc@36c400000 (apple,t6030-smc): 'gpio@67500000', 'gpio@67700000' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
>> arch/arm64/boot/dts/apple/t6030-j514s.dtb: smc@36c400000 (apple,t6030-smc): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6030-smc' is not one of ['apple,t6020-smc', 'apple,t8122-smc']
   	'apple,t6030-smc' is not one of ['apple,t6000-smc', 'apple,t8103-smc', 'apple,t8112-smc']
   	'apple,smc' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
>> arch/arm64/boot/dts/apple/t6030-j514s.dtb: /soc/smc@36c400000: failed to match any schema with compatible: ['apple,t6030-smc', 'apple,t8103-smc']
>> arch/arm64/boot/dts/apple/t6030-j514s.dtb: /soc/smc@36c400000/gpio@67700000: failed to match any schema with compatible: ['apple,smc-low-gpio']
--
   arch/arm64/boot/dts/apple/t6030.dtsi:582.28-586.6: Warning (unit_address_vs_reg): /soc/smc@36c400000/gpio@67500000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t6030.dtsi:588.32-592.6: Warning (unit_address_vs_reg): /soc/smc@36c400000/gpio@67700000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/apple/t6030-j516s.dtb: spmi@364714000 (apple,t6030-spmi): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6030-spmi' is not one of ['apple,t6020-spmi', 'apple,t8012-spmi', 'apple,t8015-spmi', 'apple,t8122-spmi']
   	'apple,t6030-spmi' is not one of ['apple,t8103-spmi', 'apple,t6000-spmi', 'apple,t8112-spmi']
   	'apple,spmi' was expected
   	from schema $id: http://devicetree.org/schemas/spmi/apple,spmi.yaml
>> arch/arm64/boot/dts/apple/t6030-j516s.dtb: /soc/spmi@364714000: failed to match any schema with compatible: ['apple,t6030-spmi', 'apple,t8103-spmi']
>> arch/arm64/boot/dts/apple/t6030-j516s.dtb: pmic@b (apple,chapel-pmic): compatible:0: 'apple,chapel-pmic' is not one of ['apple,maverick-pmic', 'apple,sera-pmic', 'apple,stowe-pmic']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml
>> arch/arm64/boot/dts/apple/t6030-j516s.dtb: /soc/spmi@364714000/pmic@b: failed to match any schema with compatible: ['apple,chapel-pmic', 'apple,spmi-nvmem']
>> arch/arm64/boot/dts/apple/t6030-j516s.dtb: smc@36c400000 (apple,t6030-smc): 'gpio@67500000', 'gpio@67700000' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
>> arch/arm64/boot/dts/apple/t6030-j516s.dtb: smc@36c400000 (apple,t6030-smc): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6030-smc' is not one of ['apple,t6020-smc', 'apple,t8122-smc']
   	'apple,t6030-smc' is not one of ['apple,t6000-smc', 'apple,t8103-smc', 'apple,t8112-smc']
   	'apple,smc' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
>> arch/arm64/boot/dts/apple/t6030-j516s.dtb: /soc/smc@36c400000: failed to match any schema with compatible: ['apple,t6030-smc', 'apple,t8103-smc']
>> arch/arm64/boot/dts/apple/t6030-j516s.dtb: /soc/smc@36c400000/gpio@67700000: failed to match any schema with compatible: ['apple,smc-low-gpio']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
