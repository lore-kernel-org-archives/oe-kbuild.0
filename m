Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446601;
	b=hVAP+/V87TcKFkfh+EwMLfByQOkC9ouY0HCKr3gE4r2iokLGeszh8qOushJTTqTW8Crl
	 a1UfS5oUIOmQxCzHoyZZSK4opTL2TvS3B2cXD7UQnUtjD99P0P+OhFUyCA257Qz4M0ai4
	 Nue1I3t7Es74BOg0PW1hn9i4DWGy3+eRD0N3dvyNEeI8QpmEkT/ROZ7hJ3V4QjYTe3vYM
	 YuQ4XYaMc6So05DjvtxCW1SCCKHvrhIsSGQC2hXwpteyiQxcBKtjW4D6LVOaQ7PQUAfBo
	 CRmTGOUj0MwTYRRLhMANUeW5jdEkZO9Lyws37qGZk0gGdDjb/3Riz4phuMznKvlVvHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446601;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=v+Jw0r1n22Y4EvzAkI+5Xe9/QrQ5bAYJYENf9rBtCZE=;
	b=x8H1ou6Lr1RyAC2qc27ln5Vty1DZc3DzuTIKVv/UtuBxxGtLNFs9gEUSX20qPO438LNk
	 3yePg3otOY+5d2zg7i9cUPscbPiMrB7o4mkVvwv/MNqEdQjRbeVRisu2Y/ckX2wn3jpqA
	 LfOswwTaAHPKwx1Zr8W9v7MNvaTga5eJwgo5XP1z7xtzY8rDd7bOh36KemE63FL9WGi3g
	 5zaN1kV40r/yKvGwYHcbota+OSgHE1n3GqrWbbQwyF6RJppL4O+PQrH/arNS4a1dzCzAX
	 4XsZNn9wR4R8SC6Incd/KNWAAWgjN5xwZikpEos+XgzyYkq4DF5AlVypA7iXXMkXnlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IpL2AAe4;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC83606A321
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Nov 2026 01:23:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CC83606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IpL2AAe4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794446600; x=1825982600;
  h=date:from:to:cc:subject:message-id;
  bh=CndxSL6yqKnFl0qt1F58iq2j8ymJURJATdwIdUe/2u8=;
  b=IpL2AAe42Qfs2r88DpVZjcZ50dckKwQbYCQk587gWCclkapw6PraKKNY
   /EklnK6J+uKwnv1K2dTG3U5tQmxgKJk3TVDxA+TZTlMvWMbwu9mEoFfg3
   DjtUBWE8OsQudS1NB7904sKB3BHSIEoG66kEdHepMEM5WsvXysh6MACMW
   xcjaihRVpjhDmNqcVOHhscBXXcmxJNG4K3bz6295HinO3O+4l+3TPFm1b
   kAkwFhJXGOWeQ9QyqnuzSL+bDqQyMNg/XtUNuUOXN6flHJQkxTS4lGAJF
   l8Qu+B9WoJxyqwfhtkwwRaRemb+R3VMZ+28dpj0Jcb1mbsJnhx99bA7yq
   A==;
X-CSE-ConnectionGUID: 1vX5SjL4SZyvI4VMAgrYzg==
X-CSE-MsgGUID: npgloVxvSEukc0BjJVbdHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3317880"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3317880"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 17:23:19 -0800
X-CSE-ConnectionGUID: nsNftt0XR4aYrmLlItM2Ew==
X-CSE-MsgGUID: Sb7HNK4rTParKslAG+96Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="8615359"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 11 Nov 2026 17:23:18 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRJX2-000000000m3-1Uo2;
	Thu, 12 Nov 2026 01:23:16 +0000
Date: Thu, 12 Nov 2026 02:22:38 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 90/242]
 arch/arm64/boot/dts/apple/t6030-j514s.dtb: cpufreq@210e20000
 (apple,t6030-cluster-cpufreq): compatible: 'oneOf' conditional failed, one
 must be fixed:
Message-ID: <202611120230.qDyCLt17-lkp@intel.com>
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
commit: 4ee0078987cdb3c93979a9076f72706c5ef70e76 [90/242] arm64: dts: arm64: apple: t6030: Add CPU frequency scaling support
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261112/202611120230.qDyCLt17-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261112/202611120230.qDyCLt17-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611120230.qDyCLt17-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t6030.dtsi:770.28-774.6: Warning (unit_address_vs_reg): /soc/smc@36c400000/gpio@67500000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t6030.dtsi:776.32-780.6: Warning (unit_address_vs_reg): /soc/smc@36c400000/gpio@67700000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/apple/t6030-j514s.dtb: cpufreq@210e20000 (apple,t6030-cluster-cpufreq): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t6030-cluster-cpufreq', 'apple,t8112-cluster-cpufreq'] is too short
   	['apple,t6030-cluster-cpufreq', 'apple,t8112-cluster-cpufreq'] is too long
   	'apple,t6030-cluster-cpufreq' is not one of ['apple,t8103-cluster-cpufreq', 'apple,t8112-cluster-cpufreq']
   	'apple,t6030-cluster-cpufreq' is not one of ['apple,s8000-cluster-cpufreq', 'apple,t8010-cluster-cpufreq', 'apple,t8015-cluster-cpufreq', 'apple,t6000-cluster-cpufreq']
   	'apple,t7000-cluster-cpufreq' was expected
   	'apple,s5l8960x-cluster-cpufreq' was expected
   	'apple,t6020-cluster-cpufreq' was expected
   	'apple,cluster-cpufreq' was expected
   	'apple,t8103-cluster-cpufreq' was expected
   	from schema $id: http://devicetree.org/schemas/cpufreq/apple,cluster-cpufreq.yaml
>> arch/arm64/boot/dts/apple/t6030-j514s.dtb: /soc/cpufreq@210e20000: failed to match any schema with compatible: ['apple,t6030-cluster-cpufreq', 'apple,t8112-cluster-cpufreq']
>> arch/arm64/boot/dts/apple/t6030-j514s.dtb: cpufreq@211e20000 (apple,t6030-cluster-cpufreq): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t6030-cluster-cpufreq', 'apple,t8112-cluster-cpufreq'] is too short
   	['apple,t6030-cluster-cpufreq', 'apple,t8112-cluster-cpufreq'] is too long
   	'apple,t6030-cluster-cpufreq' is not one of ['apple,t8103-cluster-cpufreq', 'apple,t8112-cluster-cpufreq']
   	'apple,t6030-cluster-cpufreq' is not one of ['apple,s8000-cluster-cpufreq', 'apple,t8010-cluster-cpufreq', 'apple,t8015-cluster-cpufreq', 'apple,t6000-cluster-cpufreq']
   	'apple,t7000-cluster-cpufreq' was expected
   	'apple,s5l8960x-cluster-cpufreq' was expected
   	'apple,t6020-cluster-cpufreq' was expected
   	'apple,cluster-cpufreq' was expected
   	'apple,t8103-cluster-cpufreq' was expected
   	from schema $id: http://devicetree.org/schemas/cpufreq/apple,cluster-cpufreq.yaml
>> arch/arm64/boot/dts/apple/t6030-j514s.dtb: /soc/cpufreq@211e20000: failed to match any schema with compatible: ['apple,t6030-cluster-cpufreq', 'apple,t8112-cluster-cpufreq']
   arch/arm64/boot/dts/apple/t6030-j514s.dtb: spmi@364714000 (apple,t6030-spmi): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6030-spmi' is not one of ['apple,t6020-spmi', 'apple,t8012-spmi', 'apple,t8015-spmi', 'apple,t8122-spmi']
   	'apple,t6030-spmi' is not one of ['apple,t8103-spmi', 'apple,t6000-spmi', 'apple,t8112-spmi']
   	'apple,spmi' was expected
   	from schema $id: http://devicetree.org/schemas/spmi/apple,spmi.yaml
   arch/arm64/boot/dts/apple/t6030-j514s.dtb: /soc/spmi@364714000: failed to match any schema with compatible: ['apple,t6030-spmi', 'apple,t8103-spmi']
   arch/arm64/boot/dts/apple/t6030-j514s.dtb: pmic@b (apple,chapel-pmic): compatible:0: 'apple,chapel-pmic' is not one of ['apple,maverick-pmic', 'apple,sera-pmic', 'apple,stowe-pmic']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml
   arch/arm64/boot/dts/apple/t6030-j514s.dtb: /soc/spmi@364714000/pmic@b: failed to match any schema with compatible: ['apple,chapel-pmic', 'apple,spmi-nvmem']
   arch/arm64/boot/dts/apple/t6030-j514s.dtb: smc@36c400000 (apple,t6030-smc): 'gpio@67500000', 'gpio@67700000' do not match any of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm64/boot/dts/apple/t6030.dtsi:770.28-774.6: Warning (unit_address_vs_reg): /soc/smc@36c400000/gpio@67500000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t6030.dtsi:776.32-780.6: Warning (unit_address_vs_reg): /soc/smc@36c400000/gpio@67700000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/apple/t6030-j516s.dtb: cpufreq@210e20000 (apple,t6030-cluster-cpufreq): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t6030-cluster-cpufreq', 'apple,t8112-cluster-cpufreq'] is too short
   	['apple,t6030-cluster-cpufreq', 'apple,t8112-cluster-cpufreq'] is too long
   	'apple,t6030-cluster-cpufreq' is not one of ['apple,t8103-cluster-cpufreq', 'apple,t8112-cluster-cpufreq']
   	'apple,t6030-cluster-cpufreq' is not one of ['apple,s8000-cluster-cpufreq', 'apple,t8010-cluster-cpufreq', 'apple,t8015-cluster-cpufreq', 'apple,t6000-cluster-cpufreq']
   	'apple,t7000-cluster-cpufreq' was expected
   	'apple,s5l8960x-cluster-cpufreq' was expected
   	'apple,t6020-cluster-cpufreq' was expected
   	'apple,cluster-cpufreq' was expected
   	'apple,t8103-cluster-cpufreq' was expected
   	from schema $id: http://devicetree.org/schemas/cpufreq/apple,cluster-cpufreq.yaml
>> arch/arm64/boot/dts/apple/t6030-j516s.dtb: /soc/cpufreq@210e20000: failed to match any schema with compatible: ['apple,t6030-cluster-cpufreq', 'apple,t8112-cluster-cpufreq']
>> arch/arm64/boot/dts/apple/t6030-j516s.dtb: cpufreq@211e20000 (apple,t6030-cluster-cpufreq): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t6030-cluster-cpufreq', 'apple,t8112-cluster-cpufreq'] is too short
   	['apple,t6030-cluster-cpufreq', 'apple,t8112-cluster-cpufreq'] is too long
   	'apple,t6030-cluster-cpufreq' is not one of ['apple,t8103-cluster-cpufreq', 'apple,t8112-cluster-cpufreq']
   	'apple,t6030-cluster-cpufreq' is not one of ['apple,s8000-cluster-cpufreq', 'apple,t8010-cluster-cpufreq', 'apple,t8015-cluster-cpufreq', 'apple,t6000-cluster-cpufreq']
   	'apple,t7000-cluster-cpufreq' was expected
   	'apple,s5l8960x-cluster-cpufreq' was expected
   	'apple,t6020-cluster-cpufreq' was expected
   	'apple,cluster-cpufreq' was expected
   	'apple,t8103-cluster-cpufreq' was expected
   	from schema $id: http://devicetree.org/schemas/cpufreq/apple,cluster-cpufreq.yaml
>> arch/arm64/boot/dts/apple/t6030-j516s.dtb: /soc/cpufreq@211e20000: failed to match any schema with compatible: ['apple,t6030-cluster-cpufreq', 'apple,t8112-cluster-cpufreq']
   arch/arm64/boot/dts/apple/t6030-j516s.dtb: spmi@364714000 (apple,t6030-spmi): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6030-spmi' is not one of ['apple,t6020-spmi', 'apple,t8012-spmi', 'apple,t8015-spmi', 'apple,t8122-spmi']
   	'apple,t6030-spmi' is not one of ['apple,t8103-spmi', 'apple,t6000-spmi', 'apple,t8112-spmi']
   	'apple,spmi' was expected
   	from schema $id: http://devicetree.org/schemas/spmi/apple,spmi.yaml
   arch/arm64/boot/dts/apple/t6030-j516s.dtb: /soc/spmi@364714000: failed to match any schema with compatible: ['apple,t6030-spmi', 'apple,t8103-spmi']
   arch/arm64/boot/dts/apple/t6030-j516s.dtb: pmic@b (apple,chapel-pmic): compatible:0: 'apple,chapel-pmic' is not one of ['apple,maverick-pmic', 'apple,sera-pmic', 'apple,stowe-pmic']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml
   arch/arm64/boot/dts/apple/t6030-j516s.dtb: /soc/spmi@364714000/pmic@b: failed to match any schema with compatible: ['apple,chapel-pmic', 'apple,spmi-nvmem']
   arch/arm64/boot/dts/apple/t6030-j516s.dtb: smc@36c400000 (apple,t6030-smc): 'gpio@67500000', 'gpio@67700000' do not match any of the regexes: '^pinctrl-[0-9]+$'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
