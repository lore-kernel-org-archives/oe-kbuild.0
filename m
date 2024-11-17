Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86ED5464A
	for <oe-kbuild@lists.linux.dev>; Sun, 17 Nov 2024 16:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731859251; cv=none; b=uJEMFtwjGCLRWTtO2TNAk2C/RvqnWhYvwb5YvforQDkB8uqtP0na3vXy/rbmWGKtsZX56K2+7bNZGSoPYczF1nU5nrMz/E1gMOswcB9nXeWMqf2zLsePQ3HH1iqGRKfLgsOfPtq7vRN+apvsrQfRZGZ9mWM4+bx+vhHrEAXCSZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731859251; c=relaxed/simple;
	bh=EpTJYsJaVjZDJGOg6qUPJf5AIH9wYkHxENjfN+AXBGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bSDQMS/o/LtLEMzS/F1+5OEf3jg2JcDRdFO1uGMuUPbl9LwFBDo9vcrzn6JAqHtU8sXyipd6nAv9yykuisNNKOJJMSn3RNNud+nhwCbGdqfFImQ0hjWPUgWi3TW2awTKmLI+CdMGycY8rFvfIOdkjNLbWYOAO1jevMdZuK5anpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A+A0uwM9; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A+A0uwM9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731859250; x=1763395250;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EpTJYsJaVjZDJGOg6qUPJf5AIH9wYkHxENjfN+AXBGQ=;
  b=A+A0uwM9BloJhnRuHog4z6M5/ZVJmZ6z3amL0rTvtXk9a020rNgqksTq
   MGEVfzXBsSYL3oP37oyjHTaBNVFErmdyVPRhEOXhKHRmmOSFg2cSshdrK
   ykUvXAl1dcpnQxfRG1w2dMCPlaVwBlqzxxtXVvlqpWS1duKmyKNGHI0QU
   ak8fz1v9iPuNNki/NSLM7wErQx+eqcLu3rjqmOXx/R7n/YWLW+zb6wBRU
   +MSez/mBc9RItXZH+E2s0Fo05tALXNDAkhQQVMnsNXzvCuZP8Tnd+9P91
   ONMc5eyXzAHhHC1Dr611WkK0ZFVGhD4fIQzhVyiUMPThsSc/pcrErcKVa
   g==;
X-CSE-ConnectionGUID: a5N9QwZ9Qxq/nGCIY7BKLg==
X-CSE-MsgGUID: 5MfAe7UJSJOat46IkJ5L7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="34673530"
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="34673530"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 08:00:49 -0800
X-CSE-ConnectionGUID: +4Y42TfDSNS465ei/MvXng==
X-CSE-MsgGUID: awrcHkt4QUOJVi5QAADP9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="93843778"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Nov 2024 08:00:48 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tChhd-0001s9-2k;
	Sun, 17 Nov 2024 16:00:45 +0000
Date: Mon, 18 Nov 2024 00:00:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [chenhuacai-loongson:loongarch-next 6/8]
 arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000:
 i2s@7,0:interrupts:0:0: 78 is not one of [1, 2, 3, 4]
Message-ID: <202411172334.CCz38YyW-lkp@intel.com>
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
TO: Binbin Zhou <zhoubinbin@loongson.cn>
CC: Huacai Chen <chenhuacai@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git loongarch-next
head:   66b31c6222ee988c7a708b0bb83e35e064f498f1
commit: 9fb195ccbfb7c1377f3a72c272cd003db13b20c5 [6/8] LoongArch: dts: Add I2S support to Loongson-2K2000
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
config: loongarch-randconfig-051-20241117 (https://download.01.org/0day-ci/archive/20241117/202411172334.CCz38YyW-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev1+gcabb5b9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411172334.CCz38YyW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411172334.CCz38YyW-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000: usb@4,0:interrupts:0: [48, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000: usb@19,0:interrupts:0:0: 22 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000: usb@19,0:interrupts:0: [22, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000: display@6,1:interrupts:0:0: 28 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000: display@6,1:interrupts:0: [28, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000: i2s@7,0:interrupts:0:0: 78 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000: i2s@7,0:interrupts:0: [78, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000: i2s@7,0:interrupts: [[78, 4], [79, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000: sata@8,0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000: sata@8,0:interrupts:0: [16, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-range', 'device_type', 'display@6,1', 'ethernet@3,0', 'ethernet@3,1', 'ethernet@3,2', 'i2s@7,0', 'msi-parent', 'pcie@10,0', 'pcie@9,0', 'pcie@a,0', 'pcie@b,0', 'pcie@c,0', 'pcie@d,0', 'pcie@e,0', 'pcie@f,0', 'sata@8,0', 'usb@19,0', 'usb@4,0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000: ethernet@3,0:interrupts:0:0: 12 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000: ethernet@3,0:interrupts:0: [12, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000: ethernet@3,0:interrupts: [[12, 4], [13, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000: ethernet@3,1:interrupts:0:0: 14 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000: ethernet@3,1:interrupts:0: [14, 4] is too long
--
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000: usb@4,0:interrupts:0: [48, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000: usb@19,0:interrupts:0:0: 22 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000: usb@19,0:interrupts:0: [22, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000: display@6,1:interrupts:0:0: 28 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000: display@6,1:interrupts:0: [28, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000: i2s@7,0:interrupts:0:0: 78 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000: i2s@7,0:interrupts:0: [78, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000: i2s@7,0:interrupts: [[78, 4], [79, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000: sata@8,0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000: sata@8,0:interrupts:0: [16, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
