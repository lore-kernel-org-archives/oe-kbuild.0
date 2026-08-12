Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5AE4322EC
	for <oe-kbuild@lists.linux.dev>; Wed, 12 Aug 2026 13:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786542010; cv=none; b=OWr+jnZFoslPPDUz+LuJincWhrFk/mhLHGkNlNB/mlofiqxnRjGeb9wI6yjLmYALhAiIPBqWZAywm+h/IMMP9kskcTjh6oyVT+tmTD1+Zx1FtltUj1H5DEB0/mTNC7VLeuf+oKU/a31xwj9/8dukc9HWNSjs6Q2/BoMQetaYWto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786542010; c=relaxed/simple;
	bh=/4dybuTtX+TVF/rAY+ElOqeWPJS/GCYqR4tfd3AP8gw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sJWWPqQFOS6D9uTydlksYW6LWVe9xo0nVCH06wNTlRZYisM3SgjxnM9av+mo+g1NHeNWPd+2PfnLJHHyb927JnuyISGY7/DvPTDSJ6MggX4rMsA7pyBRUEQlcQB7CSKS/gAEYws2ZyUAu04vjXnVjBrAh1fnMkcv2DMaERdgOcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G5LYwWTf; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G5LYwWTf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786542006; x=1818078006;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/4dybuTtX+TVF/rAY+ElOqeWPJS/GCYqR4tfd3AP8gw=;
  b=G5LYwWTftB8zg16s8oGXzGL1CTh5XLTuusHXr/Qm/nhrB/hQrMgC95Sy
   yFp1Qf2BTNm9p8/EY+HmK9SL3wuH07B/jvfshNTv1wwNaxt3u94erWV9M
   Y0nXvUoYcaGKZK9u+Mkq/nsa/J1WvCJ+Yvm8S7cdW2Frq9rtlUZuQrGCP
   I0kbS9ZJdFqRiJ5i4H6yBZ1Zgn/b51+6dsWAgw40vy+IG8kzRMMmbwuYp
   gF3Ab/FPZQx/q8ruf7lClW12PGOo2JjypyI1xzIZnP1dJiFDMtm45fH6c
   +uZ0pqtigLORFv5ZmunZCQBf4UC5wE2IcOSyixnPzHO6NwkjXvThVuwwO
   g==;
X-CSE-ConnectionGUID: AQtqugcoQtWOtRVrF64OqA==
X-CSE-MsgGUID: ekBrH+bKTIuhcZqpv0Wo+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="90911545"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="90911545"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 06:40:03 -0700
X-CSE-ConnectionGUID: EjFvaeuGSaaIgOPyfq32rw==
X-CSE-MsgGUID: lT9rVqbaQyiLxqxzpRfeDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="268806307"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 12 Aug 2026 06:40:02 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wu9BY-000000005qs-26ip;
	Wed, 12 Aug 2026 13:40:00 +0000
Date: Wed, 12 Aug 2026 15:39:13 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: leds: lacie,ns2-leds: Convert to DT schema
Message-ID: <202608121549.88E5f7bu-lkp@intel.com>
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
In-Reply-To: <20260701175330.1645927-1-ninadnaik07@gmail.com>
References: <20260701175330.1645927-1-ninadnaik07@gmail.com>
TO: Ninad Naik <ninadnaik07@gmail.com>
TO: lee@kernel.org
TO: pavel@kernel.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
CC: linux-leds@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: me@brighamcampbell.com
CC: linux-kernel-mentees@lists.linux.dev
CC: skhan@linuxfoundation.org
CC: Ninad Naik <ninadnaik07@gmail.com>

Hi Ninad,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v7.2-rc6]
[also build test WARNING on linus/master]
[cannot apply to lee-leds/for-leds-next next-20260811]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ninad-Naik/dt-bindings-leds-lacie-ns2-leds-Convert-to-DT-schema/20260810-032423
base:   v7.2-rc6
patch link:    https://lore.kernel.org/r/20260701175330.1645927-1-ninadnaik07%40gmail.com
patch subject: [PATCH] dt-bindings: leds: lacie,ns2-leds: Convert to DT schema
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-2051-20260811 (https://download.01.org/0day-ci/archive/20260812/202608121549.88E5f7bu-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 85c730242e741f79bf7ca543bdf496dfb89a7f22)
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260812/202608121549.88E5f7bu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608121549.88E5f7bu-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/marvell/armada-370-seagate-nas-4bay.dtb: mvsdio@d4000 (marvell,orion-sdio): $nodename:0: 'mvsdio@d4000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,orion-sdio.yaml
   arch/arm/boot/dts/marvell/armada-370-seagate-nas-4bay.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-370-seagate-nas-4bay.dtb: /soc/internal-regs/cpu-config@21000: failed to match any schema with compatible: ['marvell,armada-370-cpu-config']
   arch/arm/boot/dts/marvell/armada-370-seagate-nas-4bay.dtb: /soc/internal-regs/audio-controller@30000: failed to match any schema with compatible: ['marvell,armada370-audio']
   arch/arm/boot/dts/marvell/armada-370-seagate-nas-4bay.dtb: /soc/bootrom: failed to match any schema with compatible: ['marvell,bootrom']
   arch/arm/boot/dts/marvell/armada-370-seagate-nas-4bay.dtb: sa-sram (mmio-sram): 'reg-names' does not match any of the regexes: '^([a-z0-9]+-)*sram(-section)?@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/marvell/armada-370-seagate-nas-4bay.dtb: sa-sram (mmio-sram): $nodename:0: 'sa-sram' does not match '^sram(@.*)?'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm/boot/dts/marvell/armada-370-seagate-nas-4bay.dtb: leds-ns2 (lacie,ns2-leds): 'white-sata2', 'white-sata3' do not match any of the regexes: '^led(-[0-9a-z]+)?$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/lacie,ns2-leds.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-d2net.dtb: regulators (simple-bus): $nodename:0: 'regulators' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-d2net.dtb: regulators (simple-bus): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/kirkwood-d2net.dtb: regulators (simple-bus): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml
   arch/arm/boot/dts/marvell/kirkwood-d2net.dtb: regulator@1 (regulator-fixed): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fixed-regulator.yaml
   arch/arm/boot/dts/marvell/kirkwood-d2net.dtb: /netxbig-leds: failed to match any schema with compatible: ['lacie,netxbig-leds']
>> arch/arm/boot/dts/marvell/kirkwood-d2net.dtb: ns2-leds (lacie,ns2-leds): 'blue-sata' does not match any of the regexes: '^led(-[0-9a-z]+)?$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/lacie,ns2-leds.yaml
--
   arch/arm/boot/dts/marvell/kirkwood-is2.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-is2.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-is2.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'aspeed,ast2700-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'olpc,xo1-rtc', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-is2.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible: ['marvell,kirkwood-rtc', 'marvell,orion-rtc'] is too long
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-is2.dtb: /ocp@f1000000/rtc@10300: failed to match any schema with compatible: ['marvell,kirkwood-rtc', 'marvell,orion-rtc']
   arch/arm/boot/dts/marvell/kirkwood-is2.dtb: mvsdio@90000 (marvell,orion-sdio): $nodename:0: 'mvsdio@90000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,orion-sdio.yaml
>> arch/arm/boot/dts/marvell/kirkwood-is2.dtb: ns2-leds (lacie,ns2-leds): 'blue-sata' does not match any of the regexes: '^led(-[0-9a-z]+)?$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/lacie,ns2-leds.yaml
--
   arch/arm/boot/dts/marvell/kirkwood-ns2.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-ns2.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-ns2.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'aspeed,ast2700-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'olpc,xo1-rtc', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-ns2.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible: ['marvell,kirkwood-rtc', 'marvell,orion-rtc'] is too long
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-ns2.dtb: /ocp@f1000000/rtc@10300: failed to match any schema with compatible: ['marvell,kirkwood-rtc', 'marvell,orion-rtc']
   arch/arm/boot/dts/marvell/kirkwood-ns2.dtb: mvsdio@90000 (marvell,orion-sdio): $nodename:0: 'mvsdio@90000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,orion-sdio.yaml
>> arch/arm/boot/dts/marvell/kirkwood-ns2.dtb: ns2-leds (lacie,ns2-leds): 'blue-sata' does not match any of the regexes: '^led(-[0-9a-z]+)?$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/lacie,ns2-leds.yaml
--
   arch/arm/boot/dts/marvell/kirkwood-ns2max.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-ns2max.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-ns2max.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'aspeed,ast2700-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'olpc,xo1-rtc', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-ns2max.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible: ['marvell,kirkwood-rtc', 'marvell,orion-rtc'] is too long
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-ns2max.dtb: /ocp@f1000000/rtc@10300: failed to match any schema with compatible: ['marvell,kirkwood-rtc', 'marvell,orion-rtc']
   arch/arm/boot/dts/marvell/kirkwood-ns2max.dtb: mvsdio@90000 (marvell,orion-sdio): $nodename:0: 'mvsdio@90000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,orion-sdio.yaml
>> arch/arm/boot/dts/marvell/kirkwood-ns2max.dtb: ns2-leds (lacie,ns2-leds): 'blue-sata' does not match any of the regexes: '^led(-[0-9a-z]+)?$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/lacie,ns2-leds.yaml
--
   arch/arm/boot/dts/marvell/kirkwood-ns2mini.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-ns2mini.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-ns2mini.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'aspeed,ast2700-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'dallas,m41t00', 'dfrobot,sd2405al', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'olpc,xo1-rtc', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xicor,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-ns2mini.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible: ['marvell,kirkwood-rtc', 'marvell,orion-rtc'] is too long
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml
   arch/arm/boot/dts/marvell/kirkwood-ns2mini.dtb: /ocp@f1000000/rtc@10300: failed to match any schema with compatible: ['marvell,kirkwood-rtc', 'marvell,orion-rtc']
   arch/arm/boot/dts/marvell/kirkwood-ns2mini.dtb: mvsdio@90000 (marvell,orion-sdio): $nodename:0: 'mvsdio@90000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,orion-sdio.yaml
>> arch/arm/boot/dts/marvell/kirkwood-ns2mini.dtb: ns2-leds (lacie,ns2-leds): 'blue-sata' does not match any of the regexes: '^led(-[0-9a-z]+)?$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/lacie,ns2-leds.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
