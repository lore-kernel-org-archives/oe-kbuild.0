Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EEB3EC2E1
	for <oe-kbuild@lists.linux.dev>; Tue, 31 Mar 2026 21:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774993016; cv=none; b=rraYy8IaDWgX1kdzf2hFRy1MK1oCjSqD80lR7Qn7s0+05k3cXGd1XFy6sOF6qfzh9ec0kGXTM0qO2Y3KIxhbIAnwtW2koo0Nk4aOt1oo7BinrvKoBcIS5+hx/ibVTQsxDLGZgSrp3UswR2W+G05WtyZ9lAEZyRfJNUnl+Y12lNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774993016; c=relaxed/simple;
	bh=0u90iBGZY6D3Mc+75ylk6zOMgHe9+kJ1NrawOvp1RXM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lTIiySkhzj6zCzQxZGnz4M4kDRk1FZkuRzk1Zn2FJYQCtCUv1i14G00xFTxYa3Wgk1mwrfmXgq1cg/jPRH13TFQXABElA26k58sQgXRbA8DzSfIa3C67cJzDoc/7XHw58O+xkNokZGTBYjqxUBcqEy779Zw7OZ1yqpey/QlVA4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b50VknLw; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b50VknLw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774993013; x=1806529013;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0u90iBGZY6D3Mc+75ylk6zOMgHe9+kJ1NrawOvp1RXM=;
  b=b50VknLwJxMNBWEd/QrqNWINJZHkC+N1sZV5ehcJeh2s9InKVmIZBC6Q
   M3tD8A4TsbcQQCuML+Ju5ugU8sgUJsWPVSymoHEyhUw13mhBPCg+5dh3u
   kwgPy/2Q6FRYqVf623uAFLCvVQp11t6/wz+gIsN04zEwo+mg/mw6DpoO/
   4b80P3kjVMtb/ABOBRxJg0wCDT8xvuP5cfENrwKAvq3YM3TXQ7sE2gVoN
   7s4hiNyFRjHtK+CSdkMSRujg/DsS1TU9q0tSZ6OWilU/EoDLHhte2cfoT
   HdFsnhgFFwvWfOdJnnuT7oMcjKJYJZ9zFrEKbPQGCe98k2wOiyhFWF7O2
   A==;
X-CSE-ConnectionGUID: pw5+wkPBSoKOMGTTKzBAWg==
X-CSE-MsgGUID: es7M7EfjRWiyn1mrw8fr+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75057831"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="75057831"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 14:36:53 -0700
X-CSE-ConnectionGUID: qTYwQ50kQdux5C7vs9PS7g==
X-CSE-MsgGUID: Gk3gg+iCQrqyHdX7lZEdCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="226354017"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 31 Mar 2026 14:36:51 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7glV-000000008XZ-2Lax;
	Tue, 31 Mar 2026 21:36:49 +0000
Date: Tue, 31 Mar 2026 23:35:59 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: rtc: moxa,moxart-rtc: convert to json-schema
Message-ID: <202603312318.dkRDIuom-lkp@intel.com>
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
In-Reply-To: <20260329184615.454887-1-robyserbanpascu06@gmail.com>
References: <20260329184615.454887-1-robyserbanpascu06@gmail.com>
TO: "Serban-Pascu Robert" <robyserbanpascu06@gmail.com>
TO: alexandre.belloni@bootlin.com
CC: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: devicetree@vger.kernel.org
CC: linux-rtc@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: daniel.baluta@nxp.com
CC: "Serban-Pascu Robert" <robyserbanpascu06@gmail.com>

Hi Serban-Pascu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on abelloni/rtc-next]
[also build test WARNING on robh/for-next linus/master v7.0-rc6 next-20260330]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Serban-Pascu-Robert/dt-bindings-rtc-moxa-moxart-rtc-convert-to-json-schema/20260330-111814
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
patch link:    https://lore.kernel.org/r/20260329184615.454887-1-robyserbanpascu06%40gmail.com
patch subject: [PATCH] dt-bindings: rtc: moxa,moxart-rtc: convert to json-schema
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-2052-20260330 (https://download.01.org/0day-ci/archive/20260331/202603312318.dkRDIuom-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2025.13.dev9+g4cd3cdfac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603312318.dkRDIuom-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603312318.dkRDIuom-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/moxa/moxart-uc7112lx.dtb: interrupt-controller@98800000 (moxa,moxart-ic): 'interrupt-mask' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/faraday,ftintc010.yaml
   arch/arm/boot/dts/moxa/moxart-uc7112lx.dtb: gpio@98700000 (moxa,moxart-gpio): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/faraday,ftgpio010.yaml
   arch/arm/boot/dts/moxa/moxart-uc7112lx.dtb: gpio@98700000 (moxa,moxart-gpio): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/faraday,ftgpio010.yaml
   arch/arm/boot/dts/moxa/moxart-uc7112lx.dtb: gpio@98700000 (moxa,moxart-gpio): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/faraday,ftgpio010.yaml
>> arch/arm/boot/dts/moxa/moxart-uc7112lx.dtb: rtc (moxa,moxart-rtc): 'gpio-rtc-data', 'gpio-rtc-reset', 'gpio-rtc-sclk' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rtc/moxa,moxart-rtc.yaml
>> arch/arm/boot/dts/moxa/moxart-uc7112lx.dtb: rtc (moxa,moxart-rtc): 'rtc-sclk-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/rtc/moxa,moxart-rtc.yaml
>> arch/arm/boot/dts/moxa/moxart-uc7112lx.dtb: rtc (moxa,moxart-rtc): 'rtc-data-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/rtc/moxa,moxart-rtc.yaml
>> arch/arm/boot/dts/moxa/moxart-uc7112lx.dtb: rtc (moxa,moxart-rtc): 'rtc-reset-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/rtc/moxa,moxart-rtc.yaml
   arch/arm/boot/dts/moxa/moxart-uc7112lx.dtb: /soc/dma@90500000: failed to match any schema with compatible: ['moxa,moxart-dma']
   arch/arm/boot/dts/moxa/moxart-uc7112lx.dtb: /soc/mmc@98e00000: failed to match any schema with compatible: ['moxa,moxart-mmc']
   arch/arm/boot/dts/moxa/moxart-uc7112lx.dtb: /soc/mdio@90900090: failed to match any schema with compatible: ['moxa,moxart-mdio']
   arch/arm/boot/dts/moxa/moxart-uc7112lx.dtb: /soc/mdio@90900090/ethernet-phy@1: failed to match any schema with compatible: ['moxa,moxart-rtl8201cp', 'ethernet-phy-ieee802.3-c22']
   arch/arm/boot/dts/moxa/moxart-uc7112lx.dtb: ethernet-phy@1 (moxa,moxart-rtl8201cp): compatible: 'oneOf' conditional failed, one must be fixed:
   	['moxa,moxart-rtl8201cp', 'ethernet-phy-ieee802.3-c22'] is too long
   	'ethernet-phy-ieee802.3-c22' was expected
   	'ethernet-phy-ieee802.3-c45' was expected
   	'moxa,moxart-rtl8201cp' does not match '^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
