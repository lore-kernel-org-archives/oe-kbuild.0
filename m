Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A611ABEC5
	for <oe-kbuild@lists.linux.dev>; Tue, 29 Apr 2025 01:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745889582; cv=none; b=aoGtPoXlBV8e2JwZdeiwEThReW8HFPtW9gbSrpwlAB/uRmQVaY9E5jsTE05CXfIBAqNgRhZ8YtPgBjQ/ueX6AiRbP1kVFAP7c+m63hAExEpCEbaca9V5A4vHgUeReKSjWenqrZdPSz9FuB1R40xZHuk/ID0p/66AZVbTXM6Dn70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745889582; c=relaxed/simple;
	bh=2ieQzdA/1u145y2cF0dzmS1B8vHp3zkBqz4t7ue5wj8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n3xyVIuNB7pZDjWXuO/rvagGF+0qjlXlM4+PAUvkvsUsTaYefbF/l1i6fqAVVVXmD1xGOle1zFNpj3SDc7FSB0pSD80TDccm2TCLKpWvTUFRrfah9O/2cdQ7qhjI3fP2Yby9wuDg3SYCItvAyAwrdAWXI4Tfdf/JdrBRbIr0J4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IG2+f3dH; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IG2+f3dH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745889580; x=1777425580;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2ieQzdA/1u145y2cF0dzmS1B8vHp3zkBqz4t7ue5wj8=;
  b=IG2+f3dHTZBeihVV92ntJNSnw11ywvhtPfyvO+yx5LP8T2/k/CvnuY0f
   IJyJzOWj887VstNmWkImSzw9SQ8fI8RE3UH0U4S6aUi7XeiuYa5r6K1iF
   5COq3gYGwBpoJOn8exMTizbifKrXhAAl0APPCGlPl+A85vcFcG5OMkndG
   hjZT/zAb12s+AtwEhsCNFMBuaVqrs1iKIypAGBOxBSkWOKhHviwVT+/ld
   Yo9nkXnNSp2YHOmt8MEH4yM8MJtCZJfwNU63sEP0f9bdMsZ2yK9eNZ7C7
   6HNlSTL/GMCr9xBhigxngYGBZzVVsVPjSi+pugq0IHYP8TM7Em6P6oH/O
   Q==;
X-CSE-ConnectionGUID: tYncB9QkSPmJfWQ0/OG4hg==
X-CSE-MsgGUID: C08aYiV4QmuqYBhYDvmr4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="51313347"
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="51313347"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 18:19:39 -0700
X-CSE-ConnectionGUID: eOcRVKdGT/qJEQIIV1tehQ==
X-CSE-MsgGUID: Ye2CmyzXRvKZMFo6iA3MdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="164637888"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Apr 2025 18:19:39 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9ZdI-0000Ln-0F;
	Tue, 29 Apr 2025 01:19:36 +0000
Date: Tue, 29 Apr 2025 02:13:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000
 (loongson,ls2k-pci): i2s@7,0:interrupts:0:0: 78 is not one of [1, 2, 3, 4]
Message-ID: <202504290259.1kSRQIjn-lkp@intel.com>
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
TO: Binbin Zhou <zhoubinbin@loongson.cn>
CC: Huacai Chen <chenhuacai@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b4432656b36e5cc1d50a1f2dc15357543add530e
commit: 900f6267e9e39f9f601f5eaf0ea32d620b9130d2 LoongArch: dts: Add I2S support to Loongson-2K2000
date:   5 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 5 months ago
config: loongarch-randconfig-052-20250428 (https://download.01.org/0day-ci/archive/20250429/202504290259.1kSRQIjn-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.4.0
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504290259.1kSRQIjn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504290259.1kSRQIjn-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): usb@4,0:interrupts:0: [48, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): usb@19,0:interrupts:0:0: 22 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): usb@19,0:interrupts:0: [22, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): display@6,1:interrupts:0:0: 28 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): display@6,1:interrupts:0: [28, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): i2s@7,0:interrupts:0:0: 78 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): i2s@7,0:interrupts:0: [78, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): i2s@7,0:interrupts: [[78, 4], [79, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): sata@8,0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): sata@8,0:interrupts:0: [16, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-range', 'device_type', 'display@6,1', 'ethernet@3,0', 'ethernet@3,1', 'ethernet@3,2', 'i2s@7,0', 'msi-parent', 'pcie@10,0', 'pcie@9,0', 'pcie@a,0', 'pcie@b,0', 'pcie@c,0', 'pcie@d,0', 'pcie@e,0', 'pcie@f,0', 'sata@8,0', 'usb@19,0', 'usb@4,0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): ethernet@3,0:interrupts:0:0: 12 is not one of [1, 2, 3, 4]
--
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): usb@4,0:interrupts:0: [48, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): usb@19,0:interrupts:0:0: 22 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): usb@19,0:interrupts:0: [22, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): display@6,1:interrupts:0:0: 28 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): display@6,1:interrupts:0: [28, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): i2s@7,0:interrupts:0:0: 78 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): i2s@7,0:interrupts:0: [78, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): i2s@7,0:interrupts: [[78, 4], [79, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): sata@8,0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): sata@8,0:interrupts:0: [16, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
