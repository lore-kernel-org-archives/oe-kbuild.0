Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DE94AA1F7
	for <oe-kbuild@lists.linux.dev>; Fri, 11 Sep 2026 17:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789148148; cv=none; b=iDw/QTfUlsV5g1xGHqy5qDsDnNy111M+OYcbCVjoME0uENDLHE8vxts4Sl/KaJXtN44ZEdkBKkCr8XiST/9cDvrmysmhPwfvdbNCqQIKUNJVh8vf60HrFboNZUjMjyshcuxuWT8QfL+nIwFqV+XxKcqBdahI3pF6NttLtaO3nS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789148148; c=relaxed/simple;
	bh=2Dg+UI/ZNQJyfIuUXO7Krw7PSxcOaMKe8Q5eCTUkiW8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XTr+Lj7n2K+RysEn25qxYZN86mPGoB8ky3V8TkvM33l14wSx7OO60nhBFXUOSSsTbMQXDG3RyewUFfws96Joa2/GLSUt9UdRs8L5Tl7Ij+mC4pAIL8gy+AP+7uhKX1QJfPMvYkmfT8fIOTTYiG+hqh2mG3S7M0g/s23g9D0QdwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H7uXXvRp; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H7uXXvRp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789148142; x=1820684142;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2Dg+UI/ZNQJyfIuUXO7Krw7PSxcOaMKe8Q5eCTUkiW8=;
  b=H7uXXvRpBkIqNjSUZU9nzbI9KYbSixiQJWII0fgx5K7+ANRepeJf3QRL
   ckYCRBLSKm9TvJ3vdP4lklEpkb7Hlvgbvg4MUlZqlNZwvuf1DCuS7rmB+
   JyMxPwDABytTC0DFdeOHRjIk/Q19n8EVx1W+qvttPxKG1NyLxxqMPekSY
   UElwYw6y0btjcxV9cEoHwroHqGza5g9sz/ZLTs+NbBWAx08YpeIF6nnBs
   IOwKdxvJlRvsPQczkdPyGy63pZ5tCN089ACvpgkD7uwZVtcfu/lYnXP0Z
   WH1sjUswgtlTSJzAvKMhXmmrBtDVCdj+BCR2zhS36AAN0g5whzYDqsGou
   A==;
X-CSE-ConnectionGUID: 4u0PL2tiTk6I3UQEDvyUdQ==
X-CSE-MsgGUID: Xm8+5PKISYCkQJLO4PSuvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="92124255"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="92124255"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 10:35:39 -0700
X-CSE-ConnectionGUID: ZorG8CBASYmBHgr2laELVQ==
X-CSE-MsgGUID: /620oAoTRPCuiJhNyCdukw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="275498322"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 11 Sep 2026 10:35:38 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x559y-000000000qR-45Ul;
	Fri, 11 Sep 2026 17:35:34 +0000
Date: Fri, 11 Sep 2026 19:35:31 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] ARM: dts: helios4: add Wake-on-LAN gpio key
Message-ID: <202609111959.BEl7ZrsC-lkp@intel.com>
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
[also build test WARNING on linus/master v7.3-rc2 next-20260909]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rosen-Penev/ARM-dts-helios4-add-Wake-on-LAN-gpio-key/20260831-195311
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260901025311.955936-1-rosenp%40gmail.com
patch subject: [PATCH] ARM: dts: helios4: add Wake-on-LAN gpio key
:::::: branch date: 11 days ago
:::::: commit date: 11 days ago
config: arm-randconfig-2054-20260908 (https://download.01.org/0day-ci/archive/20260911/202609111959.BEl7ZrsC-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260911/202609111959.BEl7ZrsC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609111959.BEl7ZrsC-lkp@intel.com/

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
