Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C145013C3
	for <oe-kbuild@lists.linux.dev>; Wed, 16 Sep 2026 13:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789565932; cv=none; b=jfdapQxkHoYo0T9JikmViTKsYSavAGjG7kbPrR3T/Rj9Uqcppx7uO1ir1w4DEFBdZnNadvJfFj7VTExyHZji5QMmBnPP5lxdaIFbOp2roq8IsI3JDrtHVzXmVq8iQ7IYjto4orbh8z5DoFoaBbCFk1jwIgw20dzASKD6M4J8unw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789565932; c=relaxed/simple;
	bh=wJVHetX+sEra/op7BXfYPdsdToLqP3NJ8g2U32soPjg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Abz465WEoArGqQ4lAidLEr5jwIp6ZHTWt2SPigyiRdK7XbMMXPfhFWY0FT/bCED1w0NviuAhtwt3+V+HsrKj9QdDsxC7UIALyKDor1jaVLboEAvx8lJ2STx3NwjsjrD3rSGYnYg1RQTzV/1U90sBBj8XpUra4LHQwYZolf6662Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f89ZXWaV; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f89ZXWaV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789565921; x=1821101921;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wJVHetX+sEra/op7BXfYPdsdToLqP3NJ8g2U32soPjg=;
  b=f89ZXWaVHenyxJo6YGJ63PKzjv8Um6in/XOrwX8Q/z2BCgesvd5GbziP
   Jn9Gn8FahdDJ0h+vrS4mrpopggdaSXVxvtbQJ+DaKiKC/iW9bOefqlf44
   9QOWO8vt4QXGp8a94iGfkkgwjztbgAlaU49D+uFFQDWWXV7V79g4oCGB1
   neWVKzUgUVsy+7cA3Uc08rO0mmDYdLrksYnvPDpEGtwfrY+0ZAiN3sf2Q
   Gck+XZYSGiotvnbPSudN7ALz1oAv3rNtaFsGHU8kG+oqWM/pfBC+bEOeY
   mEVA6Z9lsiIs4cikl8sp8rUlXzOTIiZIugJS6H6uL/czx2xM/J3BNAP70
   A==;
X-CSE-ConnectionGUID: Mzv9WQWxS2OJkJAd9UdT2g==
X-CSE-MsgGUID: hUJebxV9T862ymZm2RODGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="112709264"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="112709264"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 06:38:34 -0700
X-CSE-ConnectionGUID: iSov1l9MRii/LAdd3VcjXg==
X-CSE-MsgGUID: yURk3MbKRUWJ0nk7Ofal3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="277472820"
Received: from igk-lkp-server01.igk.intel.com (HELO fe5626a770c0) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 16 Sep 2026 06:38:33 -0700
Received: from kbuild by fe5626a770c0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6pqI-00000000095-2wKP;
	Wed, 16 Sep 2026 13:38:30 +0000
Date: Wed, 16 Sep 2026 15:37:54 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] ARM: dts: helios4: add Wake-on-LAN gpio key
Message-ID: <202609161442.5XFpyJD1-lkp@intel.com>
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
In-Reply-To: <20260901025311.955936-1-rosenp@gmail.com>
References: <20260901025311.955936-1-rosenp@gmail.com>
TO: Rosen Penev <rosenp@gmail.com>
TO: devicetree@vger.kernel.org
CC: Andrew Lunn <andrew@lunn.ch>
CC: Gregory Clement <gregory.clement@bootlin.com>
CC: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: linux-arm-kernel@lists.infradead.org
CC: 375, 38x, ...), linux-kernel@vger.kernel.org

Hi Rosen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v7.3-rc3 next-20260915]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rosen-Penev/ARM-dts-helios4-add-Wake-on-LAN-gpio-key/20260831-195311
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260901025311.955936-1-rosenp%40gmail.com
patch subject: [PATCH] ARM: dts: helios4: add Wake-on-LAN gpio key
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
config: arm-randconfig-2054-20260908 (https://download.01.org/0day-ci/archive/20260916/202609161442.5XFpyJD1-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260916/202609161442.5XFpyJD1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609161442.5XFpyJD1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/marvell/armada-388-helios4.dtb: usb3@f8000 (marvell,armada-380-xhci): reg: [[1015808, 16384], [1032192, 16384]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml
   arch/arm/boot/dts/marvell/armada-388-helios4.dtb: sa-sram0 (mmio-sram): $nodename:0: 'sa-sram0' does not match '^sram(@.*)?'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/marvell/armada-388-helios4.dtb: sa-sram1 (mmio-sram): $nodename:0: 'sa-sram1' does not match '^sram(@.*)?'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/marvell/armada-388-helios4.dtb: bm-bppi (mmio-sram): $nodename:0: 'bm-bppi' does not match '^sram(@.*)?'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/marvell/armada-388-helios4.dtb: pcie (marvell,armada-370-pcie): $nodename:0: 'pcie' does not match '^pcie?@'
   	from schema $id: http://devicetree.org/schemas/pci/marvell,kirkwood-pcie.yaml
>> arch/arm/boot/dts/marvell/armada-388-helios4.dtb: gpio-keys (gpio-keys): 'wol' does not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml
   arch/arm/boot/dts/marvell/armada-388-helios4.dtb: io-leds (gpio-leds): sata1-led:linux,default-trigger: 'oneOf' conditional failed, one must be fixed:
   	'ata1' is not one of ['backlight', 'default-on', 'heartbeat', 'disk-activity', 'disk-read', 'disk-write', 'timer', 'pattern', 'audio-micmute', 'audio-mute', 'bluetooth-power', 'flash', 'gpio', 'kbd-capslock', 'mtd', 'nand-disk', 'netdev', 'none', 'rc-feedback', 'torch', 'usb-gadget', 'usb-host', 'usbport']
   	'ata1' does not match '^cpu[0-9]*$'
   	'ata1' does not match '^hci[0-9]+-power$'
   	'ata1' does not match '^mmc[0-9]+$'
   	'ata1' does not match '^phy[0-9]+tx$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml
   arch/arm/boot/dts/marvell/armada-388-helios4.dtb: io-leds (gpio-leds): sata2-led:linux,default-trigger: 'oneOf' conditional failed, one must be fixed:
   	'ata2' is not one of ['backlight', 'default-on', 'heartbeat', 'disk-activity', 'disk-read', 'disk-write', 'timer', 'pattern', 'audio-micmute', 'audio-mute', 'bluetooth-power', 'flash', 'gpio', 'kbd-capslock', 'mtd', 'nand-disk', 'netdev', 'none', 'rc-feedback', 'torch', 'usb-gadget', 'usb-host', 'usbport']
--
   	'ata4' is not one of ['backlight', 'default-on', 'heartbeat', 'disk-activity', 'disk-read', 'disk-write', 'timer', 'pattern', 'audio-micmute', 'audio-mute', 'bluetooth-power', 'flash', 'gpio', 'kbd-capslock', 'mtd', 'nand-disk', 'netdev', 'none', 'rc-feedback', 'torch', 'usb-gadget', 'usb-host', 'usbport']
   	'ata4' does not match '^cpu[0-9]*$'
   	'ata4' does not match '^hci[0-9]+-power$'
   	'ata4' does not match '^mmc[0-9]+$'
   	'ata4' does not match '^phy[0-9]+tx$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml
   arch/arm/boot/dts/marvell/armada-388-helios4.dtb: usb2-phy (usb-nop-xceiv): 'vbus-regulator' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml
   arch/arm/boot/dts/marvell/armada-388-helios4.dtb: usb2-phy (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml
>> arch/arm/boot/dts/marvell/armada-388-helios4.dtb: usb2-phy (usb-nop-xceiv): vbus-regulator: b'\x00\x00\x00*' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/marvell/armada-388-helios4.dtb: usb3-phy (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
