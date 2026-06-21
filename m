Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15E336A008
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Jun 2026 14:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782052967; cv=none; b=eY7J7yp6perK74xCDnLrcT/5h2s5j1LqLvgdcAtL309Eq4SJngF2wdqMUySxS2Lyscy94RaYW3zW/QeSfry9EPjUbDqyvZZ25bM+zurH3cq2cZR4fN4vIJocueiqC7DbeBTQhGToFl2MjOZPKEfRci+J5oBR3bLCv5eJMKI9n9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782052967; c=relaxed/simple;
	bh=ZRJ5wcsYULhQe9BCXK1EMrXoVHK59m78F4ai+CYutCc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aILDWWeoUJnvacRKO4RPwl9dpsRWM6/WVJXrk+wvJQuJF6LsIMz8IXezxM33qIInpHWGF50ztIyJlJPoaHgp0BfVOwdKTsItMIJBrI88vjIgZUAaGfZYpUbdBdfIlOavDsxdTCafP1wviF/ZPpL9Q6J1Zgddra9By3K/MrWGSTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IBGiT8LQ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IBGiT8LQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782052965; x=1813588965;
  h=date:from:to:cc:subject:message-id;
  bh=ZRJ5wcsYULhQe9BCXK1EMrXoVHK59m78F4ai+CYutCc=;
  b=IBGiT8LQVRnaaOPcEBnywTl+Yihozi1GrvQZg+dmlBUEHTANOKfsK140
   c4RhnIMyzQumbK7nQCCy7/0jLmlh/5UKWFXJ5Frg0g+RwkkajFtZXJSq1
   3ISVnaPgZQX++8MqOIlLJGvhTIlEpeyJBtTPx7G+wm0WzRMVptJ6MRBfo
   wNlqnn4KdGqfzku3X8dECOolPglKQVmpW97QwHYmr7OZU7d3qOZL+00IW
   1tWbLvliOi+1fjFwnW+eY5NpUJRljUzPq66Ruz82dJNhKbQjwevZ3jZQb
   MCoy/1kwJdEy8DTkN9WtR1/FdP5UAdFr9h5yTFgaWfR5HUJbZDCNjXBlM
   g==;
X-CSE-ConnectionGUID: jM9H+GeuToCSeLKe5HwFjQ==
X-CSE-MsgGUID: U2oa2Qc6RM6Gq5275zqhGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="93168269"
X-IronPort-AV: E=Sophos;i="6.24,217,1774335600"; 
   d="scan'208";a="93168269"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2026 07:42:44 -0700
X-CSE-ConnectionGUID: pyLq3Ca/RwW1rjZGmiHEJw==
X-CSE-MsgGUID: LR01z7X/R8an5Jf7y1oabg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,217,1774335600"; 
   d="scan'208";a="254101699"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 21 Jun 2026 07:42:43 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbJNh-000000005sl-08JW;
	Sun, 21 Jun 2026 14:42:41 +0000
Date: Sun, 21 Jun 2026 16:42:33 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linusw-nomadik:b4/ux500-power-domains-v7-1 8/15]
 arch/arm/boot/dts/st/ste-snowball.dtb: soc (stericsson,db8500):
 power-controller: 'ranges' is a required property
Message-ID: <202606211609.heohG3Y5-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
TO: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git b4/ux500-power-domains-v7-1
head:   5c7e86c0a0a94d9f688526aea7499aa552102968
commit: d774ea1b93ab73faf741e56edf4039821550bf30 [8/15] ARM: dts: ux500: Rename power domains node
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-2051-20260619 (https://download.01.org/0day-ci/archive/20260621/202606211609.heohG3Y5-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260621/202606211609.heohG3Y5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606211609.heohG3Y5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/st/ste-snowball.dtb: soc (stericsson,db8500): replicator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: soc (stericsson,db8500): pmu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: soc (stericsson,db8500): regulator-gpio: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: soc (stericsson,db8500): sound: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: soc (stericsson,db8500): pinctrl: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/st/ste-snowball.dtb: soc (stericsson,db8500): power-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: /soc: failed to match any schema with compatible: ['stericsson,db8500', 'simple-bus']
   arch/arm/boot/dts/st/ste-snowball.dtb: soc (stericsson,db8500): regulator-gpio: {'compatible': ['regulator-gpio'], 'gpios': [[29, 4, 0]], 'enable-gpios': [[28, 25, 0]], 'enable-active-high': True, 'regulator-min-microvolt': [[1800000]], 'regulator-max-microvolt': [[2900000]], 'regulator-name': ['mmci-reg'], 'regulator-type': ['voltage'], 'startup-delay-us': [100], 'states': [[1800000, 1], [2900000, 0]], 'phandle': 120} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: /soc/backupram@80150000: failed to match any schema with compatible: ['ste,dbx500-backupram']
   arch/arm/boot/dts/st/ste-snowball.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: gpio@8012e000 (stericsson,db8500-gpio): Unevaluated properties are not allowed ('gpio-line-names' was unexpected)
--
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: thermal-zones: cpu-thermal:cooling-maps: 'contribution', 'cooling-device', 'trip' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: soc (stericsson,db8500): cache-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: soc (stericsson,db8500): dma-controller@801C0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: soc (stericsson,db8500): pinctrl: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: soc (stericsson,db8500): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: soc (stericsson,db8500): power-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: soc (stericsson,db8500): sound: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: soc (stericsson,db8500): pmu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: soc (stericsson,db8500): replicator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: /soc: failed to match any schema with compatible: ['stericsson,db8500', 'simple-bus']
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: /soc/backupram@80150000: failed to match any schema with compatible: ['ste,dbx500-backupram']
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
--
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: thermal-zones: cpu-thermal:cooling-maps: 'contribution', 'cooling-device', 'trip' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: soc (stericsson,db8500): dma-controller@801C0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: soc (stericsson,db8500): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: soc (stericsson,db8500): sound: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: soc (stericsson,db8500): pinctrl: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: soc (stericsson,db8500): power-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: soc (stericsson,db8500): pmu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: soc (stericsson,db8500): cache-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: soc (stericsson,db8500): replicator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: /soc: failed to match any schema with compatible: ['stericsson,db8500', 'simple-bus']
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: /soc/backupram@80150000: failed to match any schema with compatible: ['ste,dbx500-backupram']
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
--
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: / (st-ericsson,hrefv60+): thermistor@1: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: / (st-ericsson,hrefv60+): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 536870912]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: thermal-zones: cpu-thermal:cooling-maps: 'contribution', 'cooling-device', 'trip' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
>> arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: soc (stericsson,db8500): power-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: soc (stericsson,db8500): sound: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: soc (stericsson,db8500): dma-controller@801C0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: soc (stericsson,db8500): replicator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: soc (stericsson,db8500): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: soc (stericsson,db8500): pinctrl: 'ranges' is a required property
--
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: soc (stericsson,db8500): cache-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: soc (stericsson,db8500): pmu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: soc (stericsson,db8500): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: soc (stericsson,db8500): dma-controller@801C0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: soc (stericsson,db8500): pinctrl: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: soc (stericsson,db8500): power-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: soc (stericsson,db8500): replicator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: soc (stericsson,db8500): sound: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: /soc: failed to match any schema with compatible: ['stericsson,db8500', 'simple-bus']
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: /soc/backupram@80150000: failed to match any schema with compatible: ['ste,dbx500-backupram']
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio'] is too long
--
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: / (st-ericsson,href520): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 536870912]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: thermal-zones: cpu-thermal:cooling-maps: 'contribution', 'cooling-device', 'trip' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: soc (stericsson,db8500): pmu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: soc (stericsson,db8500): dma-controller@801C0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/st/ste-href520-tvk.dtb: soc (stericsson,db8500): power-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: soc (stericsson,db8500): cache-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: soc (stericsson,db8500): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: soc (stericsson,db8500): sound: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: soc (stericsson,db8500): replicator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: soc (stericsson,db8500): pinctrl: 'ranges' is a required property
--
   arch/arm/boot/dts/st/ste-dbx5x0.dtsi:560.20-566.5: Warning (simple_bus_reg): /soc/pinctrl: missing or empty reg/ranges property
   arch/arm/boot/dts/st/ste-dbx5x0.dtsi:605.32-616.5: Warning (simple_bus_reg): /soc/dma-controller@801C0000: simple-bus unit address format error, expected "801c0000"
   arch/arm/boot/dts/st/ste-dbx5x0.dtsi:1074.9-1077.5: Warning (simple_bus_reg): /soc/sound: missing or empty reg/ranges property
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: thermal-zones: cpu-thermal:cooling-maps: 'contribution', 'cooling-device', 'trip' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: soc (stericsson,db8500): pmu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: soc (stericsson,db8500): power-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: soc (stericsson,db8500): replicator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: soc (stericsson,db8500): cache-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: soc (stericsson,db8500): sound: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: soc (stericsson,db8500): pinctrl: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: soc (stericsson,db8500): clocks: 'ranges' is a required property
--
   arch/arm/boot/dts/st/ste-dbx5x0.dtsi:346.32-349.5: Warning (simple_bus_reg): /soc/power-controller: missing or empty reg/ranges property
   arch/arm/boot/dts/st/ste-dbx5x0.dtsi:351.10-389.5: Warning (simple_bus_reg): /soc/clocks: simple-bus unit address format error, expected "8012f000"
   arch/arm/boot/dts/st/ste-dbx5x0.dtsi:560.20-566.5: Warning (simple_bus_reg): /soc/pinctrl: missing or empty reg/ranges property
   arch/arm/boot/dts/st/ste-dbx5x0.dtsi:605.32-616.5: Warning (simple_bus_reg): /soc/dma-controller@801C0000: simple-bus unit address format error, expected "801c0000"
   arch/arm/boot/dts/st/ste-dbx5x0.dtsi:1074.9-1077.5: Warning (simple_bus_reg): /soc/sound: missing or empty reg/ranges property
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: thermal-zones: cpu-thermal:cooling-maps: 'contribution', 'cooling-device', 'trip' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: soc (stericsson,db8500): power-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: soc (stericsson,db8500): pinctrl: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: soc (stericsson,db8500): cache-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: soc (stericsson,db8500): sound: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: soc (stericsson,db8500): dma-controller@801C0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: soc (stericsson,db8500): replicator: 'ranges' is a required property
--
   arch/arm/boot/dts/st/ste-dbx5x0.dtsi:1074.9-1077.5: Warning (simple_bus_reg): /soc/sound: missing or empty reg/ranges property
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: / (samsung,gavini): regulator-gpio: {'compatible': ['regulator-fixed'], 'gpios': [[28, 1, 0]], 'enable-active-high': True, 'regulator-name': ['sd-level-translator'], 'regulator-min-microvolt': [[2900000]], 'regulator-max-microvolt': [[2900000]], 'regulator-type': ['voltage'], 'startup-delay-us': [200], 'pinctrl-names': ['default'], 'pinctrl-0': [[112]], 'phandle': 94} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: thermal-zones: cpu-thermal:cooling-maps: 'contribution', 'cooling-device', 'trip' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: soc (stericsson,db8500): replicator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: soc (stericsson,db8500): pinctrl: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: soc (stericsson,db8500): power-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: soc (stericsson,db8500): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: soc (stericsson,db8500): pmu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: soc (stericsson,db8500): cache-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: soc (stericsson,db8500): sound: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: soc (stericsson,db8500): dma-controller@801C0000: 'ranges' is a required property
--
   arch/arm/boot/dts/st/ste-dbx5x0.dtsi:605.32-616.5: Warning (simple_bus_reg): /soc/dma-controller@801C0000: simple-bus unit address format error, expected "801c0000"
   arch/arm/boot/dts/st/ste-dbx5x0.dtsi:1074.9-1077.5: Warning (simple_bus_reg): /soc/sound: missing or empty reg/ranges property
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: / (samsung,codina): regulator-gpio: {'compatible': ['regulator-fixed'], 'gpios': [[24, 23, 0]], 'enable-active-high': True, 'regulator-name': ['sd-level-translator'], 'regulator-min-microvolt': [[2900000]], 'regulator-max-microvolt': [[2900000]], 'regulator-type': ['voltage'], 'startup-delay-us': [200], 'pinctrl-names': ['default'], 'pinctrl-0': [[117]], 'phandle': 99} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: thermal-zones: cpu-thermal:cooling-maps: 'contribution', 'cooling-device', 'trip' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: soc (stericsson,db8500): replicator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: soc (stericsson,db8500): power-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: soc (stericsson,db8500): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: soc (stericsson,db8500): cache-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: soc (stericsson,db8500): sound: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: soc (stericsson,db8500): dma-controller@801C0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: soc (stericsson,db8500): pmu: 'ranges' is a required property
--
   arch/arm/boot/dts/st/ste-dbx5x0.dtsi:605.32-616.5: Warning (simple_bus_reg): /soc/dma-controller@801C0000: simple-bus unit address format error, expected "801c0000"
   arch/arm/boot/dts/st/ste-dbx5x0.dtsi:1074.9-1077.5: Warning (simple_bus_reg): /soc/sound: missing or empty reg/ranges property
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: / (samsung,codina-tmo): regulator-gpio: {'compatible': ['regulator-fixed'], 'gpios': [[24, 23, 0]], 'enable-active-high': True, 'regulator-name': ['sd-level-translator'], 'regulator-min-microvolt': [[2900000]], 'regulator-max-microvolt': [[2900000]], 'regulator-type': ['voltage'], 'startup-delay-us': [200], 'pinctrl-names': ['default'], 'pinctrl-0': [[109]], 'phandle': 91} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: thermal-zones: cpu-thermal:cooling-maps: 'contribution', 'cooling-device', 'trip' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: soc (stericsson,db8500): pinctrl: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: soc (stericsson,db8500): power-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: soc (stericsson,db8500): dma-controller@801C0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: soc (stericsson,db8500): pmu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: soc (stericsson,db8500): cache-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: soc (stericsson,db8500): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: soc (stericsson,db8500): sound: 'ranges' is a required property
--
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: / (samsung,skomer): regulator-gpio: {'compatible': ['regulator-fixed'], 'gpios': [[24, 23, 0]], 'enable-active-high': True, 'regulator-name': ['sd-level-translator'], 'regulator-min-microvolt': [[2900000]], 'regulator-max-microvolt': [[2900000]], 'regulator-type': ['voltage'], 'startup-delay-us': [200], 'pinctrl-names': ['default'], 'pinctrl-0': [[116]], 'phandle': 95} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: thermal-zones: cpu-thermal:cooling-maps: 'contribution', 'cooling-device', 'trip' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: soc (stericsson,db8500): pinctrl: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: soc (stericsson,db8500): dma-controller@801C0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: soc (stericsson,db8500): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: soc (stericsson,db8500): power-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: soc (stericsson,db8500): pmu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: soc (stericsson,db8500): sound: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: soc (stericsson,db8500): replicator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: soc (stericsson,db8500): cache-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: /soc: failed to match any schema with compatible: ['stericsson,db8500', 'simple-bus']
--
   arch/arm/boot/dts/st/ste-dbx5x0.dtsi:605.32-616.5: Warning (simple_bus_reg): /soc/dma-controller@801C0000: simple-bus unit address format error, expected "801c0000"
   arch/arm/boot/dts/st/ste-dbx5x0.dtsi:1074.9-1077.5: Warning (simple_bus_reg): /soc/sound: missing or empty reg/ranges property
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: / (samsung,kyle): regulator-gpio: {'compatible': ['regulator-fixed'], 'gpios': [[24, 23, 0]], 'enable-active-high': True, 'regulator-name': ['sd-level-translator'], 'regulator-min-microvolt': [[2900000]], 'regulator-max-microvolt': [[2900000]], 'regulator-type': ['voltage'], 'startup-delay-us': [200], 'pinctrl-names': ['default'], 'pinctrl-0': [[116]], 'phandle': 95} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: thermal-zones: cpu-thermal:cooling-maps: 'contribution', 'cooling-device', 'trip' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: soc (stericsson,db8500): pinctrl: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: soc (stericsson,db8500): power-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: soc (stericsson,db8500): pmu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: soc (stericsson,db8500): dma-controller@801C0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: soc (stericsson,db8500): cache-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: soc (stericsson,db8500): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: soc (stericsson,db8500): sound: 'ranges' is a required property

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
