Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE346204F93
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Jan 2025 11:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736507451; cv=none; b=swuSFu5WwCgI8swlAvpN1tyN4kq/MdXsv2P+JxjqT1fLjYf+W4GQoQrBgU/eT918atOTlqNbJhmvVoZMa9C9UUh0MgMd0FdXlGzjOfM0bohuKcZAnYiTO9Me+RJyXb1REiSGNKvyMz1fPxMOJE5MykfQVoHreRPLjbRfoQXPzk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736507451; c=relaxed/simple;
	bh=ZXOvv0VXJgvdDkBPJYruboTNsn4IHiB7y+lYCTorcwE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C7cx7EDH+AT9HgA7Eyy/i3gIHkqSG3S8NZ5xqEVgUBR0X3H2BsO4+cZrzFUaf57j8ztMsVJxA9zaKjLxceeshr/U5vWDxmN4Qo0ait1PBFQ9MkpfVcqzux0pQNPZp0dZrToqGtDRoxAveGTimVpKzOod0OhI85jVUclNmsYruBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DzR7F7y+; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DzR7F7y+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736507450; x=1768043450;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZXOvv0VXJgvdDkBPJYruboTNsn4IHiB7y+lYCTorcwE=;
  b=DzR7F7y+XmbffTlL22whtJRLAlRGP1sQwIDdNcHaKK74OJZ6GWx0yl8R
   00DQK5b0SsI/GKcS3Xz+DDczl62vASsqRbeMohK+do91YHAN48C6oQG/J
   YOElo6dqCQ8Xjl300gA3ZFqRZx+8hLMpGzL4gI2MUVmsMyVz5p8jPBSEM
   QJexcDexd1prDqAqiMypcMQq5uyXPDvPj7fPTyWLuG058Jn1AthT2SgZG
   ozO2TleMpLolcJ4bO2Hl9+GSE3c4Y4SO8A49QX0e1hFPdVb7Bt9em6AZK
   jIq5bPL3m5wF7wJomXr8as04DmAMGd84IsB5kK3tYRwAdqSf8DVd5H4oP
   g==;
X-CSE-ConnectionGUID: QGBB4DrBRYyri7aHOAlmkQ==
X-CSE-MsgGUID: lRoPQc8kQ0qzqcC/IUqY1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36958484"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="36958484"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 03:10:49 -0800
X-CSE-ConnectionGUID: Fax/O5QbSxuSZd0KmB+tjg==
X-CSE-MsgGUID: 1tzlNkYZR4mRKFJid9H1wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="103493015"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 Jan 2025 03:10:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWCua-000J6F-2e;
	Fri, 10 Jan 2025 11:10:44 +0000
Date: Fri, 10 Jan 2025 19:10:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
 6/46] arch/arm/boot/dts/qcom/qcom-ipq8064-ap148.dtb: pinmux@800000:
 Unevaluated properties are not allowed ('#address-cells' was unexpected)
Message-ID: <202501101927.V2NwbcLG-lkp@intel.com>
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
TO: Ansuel Smith <ansuelsmth@gmail.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://github.com/krzk/linux pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
head:   5c0b085f7946d60c3b805a93cb5cbd7d766a0617
commit: 331b0a673a694b2371646e4de698d7c67d5c4597 [6/46] ARM: dts: qcom: fix dtc warning for missing #address-cells for ipq8064
:::::: branch date: 2 days ago
:::::: commit date: 5 weeks ago
config: arm-randconfig-053-20250109 (https://download.01.org/0day-ci/archive/20250110/202501101927.V2NwbcLG-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501101927.V2NwbcLG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501101927.V2NwbcLG-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi:274.9-277.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/qcom/qcom-ipq8064-ap148.dtb: /: memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq8064-ap148.dtb: rpm@108000: 'clock-controller', 'clock-names', 'clocks' do not match any of the regexes: '^regulators(-[01])?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpm.yaml#
>> arch/arm/boot/dts/qcom/qcom-ipq8064-ap148.dtb: pinmux@800000: Unevaluated properties are not allowed ('#address-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,ipq8064-pinctrl.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq8064-ap148.dtb: syscon@3000000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq8064-ap148.dtb: amba: $nodename:0: 'amba' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq8064-ap148.dtb: syscon@1bb00000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq8064-ap148.dtb: leds: led-0:linux,default-trigger: 'oneOf' conditional failed, one must be fixed:
   	'usbdev' is not one of ['backlight', 'default-on', 'heartbeat', 'disk-activity', 'disk-read', 'disk-write', 'timer', 'pattern', 'audio-micmute', 'audio-mute', 'bluetooth-power', 'flash', 'kbd-capslock', 'mtd', 'nand-disk', 'netdev', 'none', 'rc-feedback', 'torch', 'usb-gadget', 'usb-host', 'usbport']
   	'usbdev' does not match '^cpu[0-9]*$'
--
   arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi:274.9-277.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi:643.24-666.5: Warning (unique_unit_address_if_enabled): /soc/usb@110f8800: duplicate unit-address (also used in node /soc/phy@110f8800)
   arch/arm/boot/dts/qcom/qcom-ipq8064-rb3011.dtb: /: memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq8064-rb3011.dtb: rpm@108000: 'clock-controller', 'clock-names', 'clocks' do not match any of the regexes: '^regulators(-[01])?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpm.yaml#
>> arch/arm/boot/dts/qcom/qcom-ipq8064-rb3011.dtb: pinmux@800000: Unevaluated properties are not allowed ('#address-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,ipq8064-pinctrl.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq8064-rb3011.dtb: syscon@3000000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq8064-rb3011.dtb: usb@110f8800: 'interrupt-names' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq8064-rb3011.dtb: usb@110f8800: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq8064-rb3011.dtb: amba: $nodename:0: 'amba' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
