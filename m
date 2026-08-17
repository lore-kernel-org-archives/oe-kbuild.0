Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7344D3C1093
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Aug 2026 08:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786957175; cv=none; b=Y8zVvqrT4fXraIRLurUxrAtX71wRbY12s4xgcVYPDNY7l474MnAsW5le9DzAkMRnh5GazkOUuwMfrPLIoxKeGOIRN9MoiqUFRkH3aV01Jn5VvTdKphOYbJ19FBUTXN19iTT9fg/gZyGDpFlv3kAbX0SYWIpveVHufTXY3uSIOok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786957175; c=relaxed/simple;
	bh=KwonOGEVVv1+nt6Usw20X1NwLNA7JGV7T9wX5g3pIc4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jKuzCo+PHPwMMZ3LSSfupX75bHHfzEGRIz4rhx4X479E3f3q65pMQwdo3Tcc/bEAaMldC0OiZ8CIhOzt+8bI3h9fQgAtMATGepBTCJP7Re8PapJKhbylGW2ISZwW65UMAtnGp+3DgK6du9TljLlOnomk58jy7b+estq5PFlnmiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dit/X/q0; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dit/X/q0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786957172; x=1818493172;
  h=date:from:to:cc:subject:message-id;
  bh=KwonOGEVVv1+nt6Usw20X1NwLNA7JGV7T9wX5g3pIc4=;
  b=Dit/X/q0pe2z+4UV87g+y+u2ZihFN17KXflBtvK+i0D4aVl11SqW60KV
   pUoWRH6GuNNl9bAJIcAzZzqyG7yUovEPyyVc87lm+MiGWXQ12cwQOVSeP
   Km56CWEOBQs6IijY3wsZgZXGO1iMsNwUWNCHPszqG5bhEteJcc3V+Klx0
   NWOKCujwkNOQHnzgc8wGn3TGYoj3bXoedhoxjY4XsFD+tryPhDrENqN5p
   YEOsnCCimulwiRTkciLOgGAV6z+SIX+wg00kM8PN6mYFUXKaMDxkB/2g3
   A/FOD6DbokQZoew9C/cV6wRiFs0ASgwjVXyuMh8E3MVgA/3fjaOzHJ8tm
   g==;
X-CSE-ConnectionGUID: ZsurAEkIQmqTHQSz86b5VA==
X-CSE-MsgGUID: LooqTgyeT2OAlQ4XXmxYjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="91299718"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="91299718"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 01:59:32 -0700
X-CSE-ConnectionGUID: zxsxd7zUQA2RxoPR3quwIw==
X-CSE-MsgGUID: lm4cUPqTRn+Owr4F8Avi6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="263520724"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 17 Aug 2026 01:59:30 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvtBo-000000006lt-12jt;
	Mon, 17 Aug 2026 08:59:28 +0000
Date: Mon, 17 Aug 2026 10:59:11 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: aes@0
 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202608171029.NFuwZmOa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Herbert Xu <herbert@gondor.apana.org.au>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3eb40771c00a8488fa6ed2cc1fe203477908bf38
commit: d0544657a28aade89e981bebdc116c628d750332 dt-bindings: crypto: Convert ti,omap2-aes to DT schema
date:   1 year, 2 months ago
:::::: branch date: 2 days ago
:::::: commit date: 1 year, 2 months ago
config: arm-randconfig-2052-20260813 (https://download.01.org/0day-ci/archive/20260817/202608171029.NFuwZmOa-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608171029.NFuwZmOa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d0544657a28a ("dt-bindings: crypto: Convert ti,omap2-aes to DT schema")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608171029.NFuwZmOa-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: crossbar@4a002a48 (ti,irq-crossbar): ti,irqs-safe-map: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/target-module@58000000/dss@0: failed to match any schema with compatible: ['ti,dra7-dss']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: dss@0 (ti,dra7-dss): syscon-pll-ctrl: b'\x00\x00\x00\x0e\x00\x00\x058' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/target-module@58000000/dss@0/target-module@1000/dispc@0: failed to match any schema with compatible: ['ti,dra7-dispc']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: dispc@0 (ti,dra7-dispc): syscon-pol: b'\x00\x00\x00\x0e\x00\x00\x054' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/target-module@58000000/dss@0/target-module@40000/encoder@0: failed to match any schema with compatible: ['ti,dra7-hdmi']
>> arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml
>> arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/target-module@5a000000/iva: failed to match any schema with compatible: ['ti,ivahd']
--
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: crossbar@4a002a48 (ti,irq-crossbar): ti,irqs-safe-map: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/target-module@58000000/dss@0: failed to match any schema with compatible: ['ti,dra7-dss']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: dss@0 (ti,dra7-dss): syscon-pll-ctrl: b'\x00\x00\x00\x0e\x00\x00\x058' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/target-module@58000000/dss@0/target-module@1000/dispc@0: failed to match any schema with compatible: ['ti,dra7-dispc']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: dispc@0 (ti,dra7-dispc): syscon-pol: b'\x00\x00\x00\x0e\x00\x00\x054' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/target-module@58000000/dss@0/target-module@40000/encoder@0: failed to match any schema with compatible: ['ti,dra7-hdmi']
>> arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml
>> arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/target-module@5a000000/iva: failed to match any schema with compatible: ['ti,ivahd']
--
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: crossbar@4a002a48 (ti,irq-crossbar): ti,irqs-safe-map: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/target-module@58000000/dss@0: failed to match any schema with compatible: ['ti,dra7-dss']
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: dss@0 (ti,dra7-dss): syscon-pll-ctrl: b'\x00\x00\x00\x0e\x00\x00\x058' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/target-module@58000000/dss@0/target-module@1000/dispc@0: failed to match any schema with compatible: ['ti,dra7-dispc']
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: dispc@0 (ti,dra7-dispc): syscon-pol: b'\x00\x00\x00\x0e\x00\x00\x054' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/target-module@58000000/dss@0/target-module@40000/encoder@0: failed to match any schema with compatible: ['ti,dra7-hdmi']
>> arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml
>> arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/target-module@5a000000/iva: failed to match any schema with compatible: ['ti,ivahd']
--
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: crossbar@4a002a48 (ti,irq-crossbar): ti,irqs-safe-map: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/target-module@58000000/dss@0: failed to match any schema with compatible: ['ti,dra7-dss']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: dss@0 (ti,dra7-dss): syscon-pll-ctrl: b'\x00\x00\x00\x0e\x00\x00\x058' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/target-module@58000000/dss@0/target-module@1000/dispc@0: failed to match any schema with compatible: ['ti,dra7-dispc']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: dispc@0 (ti,dra7-dispc): syscon-pol: b'\x00\x00\x00\x0e\x00\x00\x054' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/target-module@58000000/dss@0/target-module@40000/encoder@0: failed to match any schema with compatible: ['ti,dra7-hdmi']
>> arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml
>> arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/target-module@5a000000/iva: failed to match any schema with compatible: ['ti,ivahd']
--
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: crossbar@4a002a48 (ti,irq-crossbar): ti,irqs-safe-map: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/target-module@58000000/dss@0: failed to match any schema with compatible: ['ti,dra7-dss']
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: dss@0 (ti,dra7-dss): syscon-pll-ctrl: b'\x00\x00\x00\x0e\x00\x00\x058' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/target-module@58000000/dss@0/target-module@1000/dispc@0: failed to match any schema with compatible: ['ti,dra7-dispc']
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: dispc@0 (ti,dra7-dispc): syscon-pol: b'\x00\x00\x00\x0e\x00\x00\x054' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/target-module@58000000/dss@0/target-module@40000/encoder@0: failed to match any schema with compatible: ['ti,dra7-hdmi']
>> arch/arm/boot/dts/ti/omap/am574x-idk.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml
>> arch/arm/boot/dts/ti/omap/am574x-idk.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/target-module@5a000000/iva: failed to match any schema with compatible: ['ti,ivahd']
--
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: crossbar@4a002a48 (ti,irq-crossbar): ti,irqs-safe-map: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/target-module@58000000/dss@0: failed to match any schema with compatible: ['ti,dra7-dss']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: dss@0 (ti,dra7-dss): syscon-pll-ctrl: b'\x00\x00\x00\x0e\x00\x00\x058' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/target-module@58000000/dss@0/target-module@1000/dispc@0: failed to match any schema with compatible: ['ti,dra7-dispc']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: dispc@0 (ti,dra7-dispc): syscon-pol: b'\x00\x00\x00\x0e\x00\x00\x054' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/target-module@58000000/dss@0/target-module@40000/encoder@0: failed to match any schema with compatible: ['ti,dra7-hdmi']
>> arch/arm/boot/dts/ti/omap/dra7-evm.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml
>> arch/arm/boot/dts/ti/omap/dra7-evm.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/target-module@5a000000/iva: failed to match any schema with compatible: ['ti,ivahd']
--
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: crossbar@4a002a48 (ti,irq-crossbar): ti,irqs-safe-map: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/target-module@58000000/dss@0: failed to match any schema with compatible: ['ti,dra7-dss']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: dss@0 (ti,dra7-dss): syscon-pll-ctrl: b'\x00\x00\x00\x0e\x00\x00\x058' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/target-module@58000000/dss@0/target-module@1000/dispc@0: failed to match any schema with compatible: ['ti,dra7-dispc']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: dispc@0 (ti,dra7-dispc): syscon-pol: b'\x00\x00\x00\x0e\x00\x00\x054' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/target-module@58000000/dss@0/target-module@40000/encoder@0: failed to match any schema with compatible: ['ti,dra7-hdmi']
>> arch/arm/boot/dts/ti/omap/dra72-evm.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml
>> arch/arm/boot/dts/ti/omap/dra72-evm.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/target-module@5a000000/iva: failed to match any schema with compatible: ['ti,ivahd']
--
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: crossbar@4a002a48 (ti,irq-crossbar): ti,irqs-safe-map: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/target-module@58000000/dss@0: failed to match any schema with compatible: ['ti,dra7-dss']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: dss@0 (ti,dra7-dss): syscon-pll-ctrl: b'\x00\x00\x00\r\x00\x00\x058' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/target-module@58000000/dss@0/target-module@1000/dispc@0: failed to match any schema with compatible: ['ti,dra7-dispc']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: dispc@0 (ti,dra7-dispc): syscon-pol: b'\x00\x00\x00\r\x00\x00\x054' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/target-module@58000000/dss@0/target-module@40000/encoder@0: failed to match any schema with compatible: ['ti,dra7-hdmi']
>> arch/arm/boot/dts/ti/omap/dra71-evm.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml
>> arch/arm/boot/dts/ti/omap/dra71-evm.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/target-module@5a000000/iva: failed to match any schema with compatible: ['ti,ivahd']
--
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: crossbar@4a002a48 (ti,irq-crossbar): ti,irqs-safe-map: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/target-module@58000000/dss@0: failed to match any schema with compatible: ['ti,dra7-dss']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: dss@0 (ti,dra7-dss): syscon-pll-ctrl: b'\x00\x00\x00\x0e\x00\x00\x058' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/target-module@58000000/dss@0/target-module@1000/dispc@0: failed to match any schema with compatible: ['ti,dra7-dispc']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: dispc@0 (ti,dra7-dispc): syscon-pol: b'\x00\x00\x00\x0e\x00\x00\x054' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/target-module@58000000/dss@0/target-module@40000/encoder@0: failed to match any schema with compatible: ['ti,dra7-hdmi']
>> arch/arm/boot/dts/ti/omap/dra76-evm.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml
>> arch/arm/boot/dts/ti/omap/dra76-evm.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/target-module@5a000000/iva: failed to match any schema with compatible: ['ti,ivahd']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
