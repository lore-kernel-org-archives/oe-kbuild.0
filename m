Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794538647;
	b=KdEsxrXOJfLdp2NmetwRu/dIiVhfdTYz69DSqOnkuX3aHmnGxozA8aqrvZQpjq0sjXbT
	 k86jbZfkqeX8LsxKDmsRlDuSDtDLgTXre5vKtFm56hOsEeRDfJHlzeOt71nzBxnE6M3L8
	 ux6q9l4qS826Op4emABsa5wj1ubCWyA5UP69LCKtVVLsDdfJlBDz5rHdy50TO70iTMaBv
	 qcBHUT65YdQBdqNm9owdBQU+nBHGkEQyfyGVvU8PD6RgIupGwi3ZYSTQ0OCpgYI7d8Mt/
	 Opyh6evummpCaRi8o1w1lm45JcQf8whD5Ta6X5AdF+GLrUm3s0ac9mfe4UtX3G38ayA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794538647;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=shDuZcAlCyylPluqZ7OsTy6ekIO5+hPu43XRgr8c4SM=;
	b=FaP+eoeif2SjA7o0N/qMhYxVVVQXEbDah84EB2ijh+R//y98FT16nsjf+RGFQI9R45wy
	 W0KPv/ZemuzAOgm9d4GSlHURli5xmZwNYDaxgKXe7IAK13+Kw53ivx0uUlIxbhr2fseVH
	 ALQPqxnuQ+Mi8aYedw8k/GDw6MJl8+CiV4dzop4MjhcQtmSuXNFVahLn+2jEHxZCrV34q
	 EgvfTY7MwQw3NebmMEtOeLKR94X7p7mvDMRzFl3LgdvfK24ydzymuLNeM1ktj4hjo3vBA
	 2HK0sote1xgQMUY45dbAjsG9H32Jokx/9Bf70eQO1rL8Cf+dTgkZYs9Zo8kNHXjsLUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YyyAxAxY;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B79606A31C
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Nov 2026 02:57:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8B79606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YyyAxAxY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794538647; x=1826074647;
  h=date:from:to:cc:subject:message-id;
  bh=R4EDWlRnnSI8WDiTzs/2KMQ3G+7xT1/GSBcyyiYNzYY=;
  b=YyyAxAxYLWI4tCaNA8yHVWBhAg+3URm1KK+XvT0hIiP9HieIrRRosfGq
   tyBnnhw2PH5MEE+2PszZnW+51es3oQRu7PgwP4vACklTUfir2auM0L/Pm
   FIqlejFSu0SlkOkANy9Q+rANteZV8hQQLvwKmJYjalOqjiQFW1wuppSA+
   qWVHwQcBFIAZ//GJSHsAcvqtHx3fQodPMbqWz3UntKrJdC/2rYIUTFHo3
   WBOfiqZ1MwFjhuqrpsdMCZK6Coy3zvAXm6ufMYkZRs/6QIGDuVJTzMFd3
   DtXkWhUP5VKYUIbrmRpx2DgQ8beHZiM2MQOdwg4OT670HYvSbVRHTLXT8
   g==;
X-CSE-ConnectionGUID: nxUaFyfUQ1eOKqwnykSnQQ==
X-CSE-MsgGUID: pe7UIal6QeCvglhuMzye5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3376395"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3376395"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 18:57:27 -0800
X-CSE-ConnectionGUID: PBD1ZjRJSyigR2vCjvEaBg==
X-CSE-MsgGUID: Wqo9S9lGRGS8VD+gZoUtxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="8809408"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 12 Nov 2026 18:57:25 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRhTf-0000000015T-0ARk;
	Fri, 13 Nov 2026 02:57:23 +0000
Date: Fri, 13 Nov 2026 03:56:42 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 90/242]
 arch/arm64/boot/dts/apple/t6030-j514s.dtb: cpufreq@210e20000
 (apple,t6030-cluster-cpufreq): compatible: 'oneOf' conditional failed, one
 must be fixed:
Message-ID: <202611130353.SGdmzGYY-lkp@intel.com>
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
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261113/202611130353.SGdmzGYY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261113/202611130353.SGdmzGYY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611130353.SGdmzGYY-lkp@intel.com/

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
