Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA8C312815
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Oct 2025 16:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761584388; cv=none; b=hFKhOf7jlH9Fr9X9AmrEq4jCfyEaqJcj2zpI9Dl178mfFXJdb+93n1TP6d6fW7xPH1vuA2+/BzM9VDiwyX8qwVMkA+piVueeAQ/SO1zk41VokK1GOq/JK2SoEY1Gu6fJDIs2/T7S+LvNQfiRj3HvqxJVqZIv6smzbLQmgV5+eng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761584388; c=relaxed/simple;
	bh=x3l9tDpwRSpfzNsmPImnoqtuNqfYK5hQAYIqkwCsPMo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g29hHwSGJWaCYcBx4NAqEiKjSs1TKcjBA7r7INfvKNYOGbNgOJOs3nqhlbZifKiV9ZYkIDzzbzpfYd3QxBnCE4qWN05HaEp7bUuDOKM7qSooLcj9UO6Rgw4jTav6es7lS6oQCBzpeev1qOAtlj/EfmgjtX1JWOtXn51c1MW4BSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BZWgmbCG; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BZWgmbCG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761584388; x=1793120388;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x3l9tDpwRSpfzNsmPImnoqtuNqfYK5hQAYIqkwCsPMo=;
  b=BZWgmbCG0lXwBJAUPz1cuVnAInLRnJ/yR0YH62J2Kf5ofoYdPtX9Su+Y
   NHE5/qU9F6j/IP6grpOG0Oc0KqEBpFXAdMdvjz7MpKvUspi5ZxfnJY5oO
   weSXQAzEdahjFdg2BwbFVu68RABliPztTK7+M+EbEcaBaMr8M4nKTSbfk
   4QxsxZw9OWCw9UwEq5ItX9WuhezJ92viUUPXpHqL9XpogX8hHOz1f5wDE
   CWcyL7HIXF5UVl7Sqkg87NPVHvVtv+3OLaUDJgQ4jy6CrADVsljCdJnJz
   68H7vSZ1jh3qq2108XxnFCzs70v/5Ede/UQTzBj22+9fPZfaX+dRQe/0D
   w==;
X-CSE-ConnectionGUID: inSMyXafRuqsBPotMUYc1A==
X-CSE-MsgGUID: Ok2B+SVFQdyDdR/mGlXqxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73958944"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="73958944"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 09:59:47 -0700
X-CSE-ConnectionGUID: 1smLyuwxTQyXAqStigF+WA==
X-CSE-MsgGUID: ja8NFHSxRLyaqe78z/rrEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="208710048"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 27 Oct 2025 09:59:43 -0700
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vDQZJ-000000000MX-3aEe;
	Mon, 27 Oct 2025 16:59:41 +0000
Date: Mon, 27 Oct 2025 17:59:14 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: i2c-gpio-0
 (i2c-gpio): $nodename:0: 'i2c-gpio-0' does not match
 '^i2c(@.+|-[a-z0-9]+)?$'
Message-ID: <202510271755.F5FPuDP1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa
commit: 61a6ba233fe1198e9eacc9ca1d1cbdb27f70cee5 dt-bindings: Unify "fsl,liodn" type definitions
date:   11 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 11 months ago
config: loongarch-randconfig-2052-20251024 (https://download.01.org/0day-ci/archive/20251027/202510271755.F5FPuDP1-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
dtschema version: 2025.9.dev12+gd6be03029
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251027/202510271755.F5FPuDP1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510271755.F5FPuDP1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: i2c-gpio-0 (i2c-gpio): $nodename:0: 'i2c-gpio-0' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml
   arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: i2c-gpio-1 (i2c-gpio): $nodename:0: 'i2c-gpio-1' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml
>> arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): ethernet@3,0:interrupts:0:0: 12 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): ethernet@3,0:interrupts:0: [12, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): ethernet@3,0:interrupts: [[12, 4], [13, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): ethernet@3,1:interrupts:0:0: 14 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): ethernet@3,1:interrupts:0: [14, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): ethernet@3,1:interrupts: [[14, 4], [15, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): usb@4,1:interrupts:0:0: 18 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): usb@4,1:interrupts:0: [18, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): usb@4,2:interrupts:0:0: 19 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): usb@4,2:interrupts:0: [19, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): display@6,0:interrupts:0:0: 28 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): display@6,0:interrupts:0: [28, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): hda@7,0:interrupts:0: [4, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): sata@8,0:interrupts:0:0: 19 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): sata@8,0:interrupts:0: [19, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-range', 'device_type', 'display@6,0', 'ethernet@3,0', 'ethernet@3,1', 'hda@7,0', 'pcie@9,0', 'pcie@a,0', 'pcie@b,0', 'pcie@c,0', 'pcie@d,0', 'pcie@e,0', 'sata@8,0', 'usb@4,1', 'usb@4,2' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): ethernet@3,0:interrupts:0:0: 12 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): ethernet@3,0:interrupts:0: [12, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): ethernet@3,0:interrupts: [[12, 4], [13, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): ethernet@3,1:interrupts:0:0: 14 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): ethernet@3,1:interrupts:0: [14, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): ethernet@3,1:interrupts: [[14, 4], [15, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): usb@4,1:interrupts:0:0: 18 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): usb@4,1:interrupts:0: [18, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): usb@4,2:interrupts:0:0: 19 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): usb@4,2:interrupts:0: [19, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): display@6,0:interrupts:0:0: 28 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): display@6,0:interrupts:0: [28, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): hda@7,0:interrupts:0: [4, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): sata@8,0:interrupts:0:0: 19 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): sata@8,0:interrupts:0: [19, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
--
>> arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): ethernet@3,0:interrupts:0:0: 12 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): ethernet@3,0:interrupts:0: [12, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): ethernet@3,0:interrupts: [[12, 4], [13, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): ethernet@3,1:interrupts:0:0: 14 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): ethernet@3,1:interrupts:0: [14, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): ethernet@3,1:interrupts: [[14, 4], [15, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): ethernet@3,2:interrupts:0:0: 17 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): ethernet@3,2:interrupts:0: [17, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): ethernet@3,2:interrupts: [[17, 4], [18, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): usb@4,0:interrupts:0:0: 48 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): usb@4,0:interrupts:0: [48, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): usb@19,0:interrupts:0:0: 22 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): usb@19,0:interrupts:0: [22, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): display@6,1:interrupts:0:0: 28 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): display@6,1:interrupts:0: [28, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): hda@7,0:interrupts:0:0: 58 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): hda@7,0:interrupts:0: [58, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): sata@8,0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): sata@8,0:interrupts:0: [16, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-range', 'device_type', 'display@6,1', 'ethernet@3,0', 'ethernet@3,1', 'ethernet@3,2', 'hda@7,0', 'msi-parent', 'pcie@10,0', 'pcie@9,0', 'pcie@a,0', 'pcie@b,0', 'pcie@c,0', 'pcie@d,0', 'pcie@e,0', 'pcie@f,0', 'sata@8,0', 'usb@19,0', 'usb@4,0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): ethernet@3,0:interrupts:0:0: 12 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): ethernet@3,0:interrupts:0: [12, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): ethernet@3,0:interrupts: [[12, 4], [13, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): ethernet@3,1:interrupts:0:0: 14 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): ethernet@3,1:interrupts:0: [14, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): ethernet@3,1:interrupts: [[14, 4], [15, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): ethernet@3,2:interrupts:0:0: 17 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): ethernet@3,2:interrupts:0: [17, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): ethernet@3,2:interrupts: [[17, 4], [18, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): usb@4,0:interrupts:0:0: 48 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): usb@4,0:interrupts:0: [48, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): usb@19,0:interrupts:0:0: 22 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): usb@19,0:interrupts:0: [22, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): display@6,1:interrupts:0:0: 28 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): display@6,1:interrupts:0: [28, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): hda@7,0:interrupts:0:0: 58 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): hda@7,0:interrupts:0: [58, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): sata@8,0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): sata@8,0:interrupts:0: [16, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
