Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0ECB176ADE
	for <oe-kbuild@lists.linux.dev>; Sat,  3 May 2025 04:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746248318; cv=none; b=c1BQVn7BAur2x9+JfhKikYFuvOMPdrp/kIkV8ov+3ofF/zCntGpR3qBoQjHRF4IszV6CMXyeRCx0JaKfHAEtL/s0yewOb8B17X2RXl7KaQ39B1jleBlPqlgBBk0heZo4D67x1UB2ETkLvZWi3EQLChNG8w7Cqq+JHKJ4rZQtb4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746248318; c=relaxed/simple;
	bh=RBPFqFNGQTX+YSjkw0uIPMp8AKlNdYwbuX04ZO0xTz4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jadDTf+TSrNc9q/QRouXSYa8y36In9g/3qJnU79+eOtVEfHKaa7bkQDu27+crmxGoRJgBcdjTOEQiPDafI65zNT9BDM5k2EfIFueXXYpS2Brr2xerg2qGWQuv3w/TB1nBHRDayTiGmGi/eWBD3OLRukPRokYYVqXUCyGsb6YcEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AQkEO9Mf; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AQkEO9Mf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746248315; x=1777784315;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RBPFqFNGQTX+YSjkw0uIPMp8AKlNdYwbuX04ZO0xTz4=;
  b=AQkEO9MfLRLmjhoxIak3Ui39mk41zySqVPctBmJKKv36cuJDYSCQ+4X3
   NpsbsUi3lOAvoRNZB8DZg4p1be1hA8p+hMdfUTXrkAExU2SPtP3iBZmV+
   Gbj7il9FTx7kMzE6EAiEVLvPX6O9IyfkBUy4xZ8yzRxPq3wF1YYuT1qTA
   K8hZ7CukIUrrAB6c21H68Pbcuo5vvDbyjr/9U9BbwtHzzyXl4Fb9SBA5o
   kcuySLf5dArdXC2TvlQcBxPEuuDk03P6ehcLQIlMyYTOCJ8J4u8oLVJLS
   k4CTf/U+2Jfq3C1be/0RGA4K6WIpZSB9M9+npHeFPEcENXS4JP9c2SX23
   g==;
X-CSE-ConnectionGUID: GO6YvufcQhWYJ1LLI1vhXg==
X-CSE-MsgGUID: Yf+pWGnMQ0SlYHmFFzXtfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="47823465"
X-IronPort-AV: E=Sophos;i="6.15,258,1739865600"; 
   d="scan'208";a="47823465"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 21:58:35 -0700
X-CSE-ConnectionGUID: BxlzA5OZSe+G0NG0SXDIsQ==
X-CSE-MsgGUID: p4jPRBH+SYulwPI4hFAoLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,258,1739865600"; 
   d="scan'208";a="158022488"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 02 May 2025 21:58:34 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uB4xL-0005CL-33;
	Sat, 03 May 2025 04:58:31 +0000
Date: Sat, 3 May 2025 12:57:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert-irq 19/44]
 arch/arm64/boot/dts/hisilicon/hip06-d03.dtb: mbigen_pcie@a0080000
 (hisilicon,mbigen-v2): 'intc_pcie0', 'intc_sas1', 'intc_sas2', 'intc_usb' do
 not match any of the regexes: 'pinctrl-[0-9]+'
Message-ID: <202505031230.l74vCa1f-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert-irq
head:   271e22adde83e0cc6fce40f70c5f660bf1a8e2e3
commit: a27a490fd711a07f6ff475f1004f1612c84d725b [19/44] dt-bindings: interrupt-controller: Convert hisilicon,mbigen-v2 to DT schema
:::::: branch date: 33 hours ago
:::::: commit date: 33 hours ago
config: arm64-randconfig-052-20250502 (https://download.01.org/0day-ci/archive/20250503/202505031230.l74vCa1f-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250503/202505031230.l74vCa1f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505031230.l74vCa1f-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/hisilicon/hip06-d03.dtb: /ethernet-0: failed to match any schema with compatible: ['hisilicon,hns-nic-v2']
   arch/arm64/boot/dts/hisilicon/hip06-d03.dtb: /ethernet-1: failed to match any schema with compatible: ['hisilicon,hns-nic-v2']
   arch/arm64/boot/dts/hisilicon/hip06-d03.dtb: /ethernet-4: failed to match any schema with compatible: ['hisilicon,hns-nic-v2']
   arch/arm64/boot/dts/hisilicon/hip06-d03.dtb: /ethernet-5: failed to match any schema with compatible: ['hisilicon,hns-nic-v2']
>> arch/arm64/boot/dts/hisilicon/hip06-d03.dtb: mbigen_pcie@a0080000 (hisilicon,mbigen-v2): 'intc_pcie0', 'intc_sas1', 'intc_sas2', 'intc_usb' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
   arch/arm64/boot/dts/hisilicon/hip06-d03.dtb: mbigen_pcie@a0080000 (hisilicon,mbigen-v2): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
   arch/arm64/boot/dts/hisilicon/hip06-d03.dtb: mbigen_pcie@a0080000 (hisilicon,mbigen-v2): 'msi-parent' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
>> arch/arm64/boot/dts/hisilicon/hip06-d03.dtb: mbigen_pcie@a0080000 (hisilicon,mbigen-v2): 'num-pins' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
   arch/arm64/boot/dts/hisilicon/hip06-d03.dtb: mbigen_pcie@a0080000 (hisilicon,mbigen-v2): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
>> arch/arm64/boot/dts/hisilicon/hip06-d03.dtb: mbigen_dsa@c0080000 (hisilicon,mbigen-v2): 'intc-sas0', 'intc_dsaf0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
   arch/arm64/boot/dts/hisilicon/hip06-d03.dtb: mbigen_dsa@c0080000 (hisilicon,mbigen-v2): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
>> arch/arm64/boot/dts/hisilicon/hip06-d03.dtb: mbigen_dsa@c0080000 (hisilicon,mbigen-v2): 'msi-parent' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
   arch/arm64/boot/dts/hisilicon/hip06-d03.dtb: mbigen_dsa@c0080000 (hisilicon,mbigen-v2): 'num-pins' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
   arch/arm64/boot/dts/hisilicon/hip06-d03.dtb: mbigen_dsa@c0080000 (hisilicon,mbigen-v2): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
   arch/arm64/boot/dts/hisilicon/hip06-d03.dtb: serial@2f8 (ns16550a): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arm64/boot/dts/hisilicon/hip06-d03.dtb: usb@a7030000 (generic-ohci): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
--
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /ethernet-0: failed to match any schema with compatible: ['hisilicon,hns-nic-v2']
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /ethernet-1: failed to match any schema with compatible: ['hisilicon,hns-nic-v2']
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /ethernet-2: failed to match any schema with compatible: ['hisilicon,hns-nic-v2']
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /ethernet-3: failed to match any schema with compatible: ['hisilicon,hns-nic-v2']
>> arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@60080000 (hisilicon,mbigen-v2): 'uart_intc' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@60080000 (hisilicon,mbigen-v2): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
>> arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@60080000 (hisilicon,mbigen-v2): 'msi-parent' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
>> arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@60080000 (hisilicon,mbigen-v2): 'num-pins' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@60080000 (hisilicon,mbigen-v2): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@a0080000 (hisilicon,mbigen-v2): 'intc_pcie2_a', 'intc_sas1', 'intc_sas2', 'intc_smmu_pcie', 'intc_usb' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
>> arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@a0080000 (hisilicon,mbigen-v2): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@a0080000 (hisilicon,mbigen-v2): 'msi-parent' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
>> arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@a0080000 (hisilicon,mbigen-v2): 'num-pins' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@a0080000 (hisilicon,mbigen-v2): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@d0080000 (hisilicon,mbigen-v2): 'intc_sec', 'intc_smmu_alg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
>> arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@d0080000 (hisilicon,mbigen-v2): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@d0080000 (hisilicon,mbigen-v2): 'msi-parent' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
>> arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@d0080000 (hisilicon,mbigen-v2): 'num-pins' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@d0080000 (hisilicon,mbigen-v2): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@8,d0080000 (hisilicon,mbigen-v2): 'intc_sec', 'intc_smmu_alg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@8,d0080000 (hisilicon,mbigen-v2): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@8,d0080000 (hisilicon,mbigen-v2): 'msi-parent' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@8,d0080000 (hisilicon,mbigen-v2): 'num-pins' is a required property
--
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@408,d0080000 (hisilicon,mbigen-v2): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@408,d0080000 (hisilicon,mbigen-v2): 'msi-parent' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@408,d0080000 (hisilicon,mbigen-v2): 'num-pins' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@408,d0080000 (hisilicon,mbigen-v2): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@c0080000 (hisilicon,mbigen-v2): 'intc-roce', 'intc-sas0', 'intc_dsaf0', 'intc_smmu_dsa' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
>> arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@c0080000 (hisilicon,mbigen-v2): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@c0080000 (hisilicon,mbigen-v2): 'msi-parent' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
>> arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@c0080000 (hisilicon,mbigen-v2): 'num-pins' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@c0080000 (hisilicon,mbigen-v2): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /soc/serial@602b0000: failed to match any schema with compatible: ['arm,sbsa-uart']
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: usb@a7030000 (generic-ohci): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: usb@a7020000 (generic-ehci): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: dsa_cpld@78000010 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
