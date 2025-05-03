Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5681991B6
	for <oe-kbuild@lists.linux.dev>; Sat,  3 May 2025 07:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746258401; cv=none; b=SS8iKztRa0DqbOoynyxBHQIWbuaoPnVbg9DrOaXaK4INJ+uFmXeMlGxxzreogjovYMgUMU94R7Eya5OqPnBB1EswHdhuimrMIcOq8OyHRcibISYshVZ8ooNjVa5WkK0ugv4wdapI86oKds2yFyXtPSd4VtfwqqrTBLgEw5vgh9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746258401; c=relaxed/simple;
	bh=tSDGnw73VfangGgIckq3gvfm/ciNQurXEy7MxqcJ3nk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N6K1cI1DSKJ5lOKtx898+kX193XXEW8hTd6FLexnTCZa1xi4I10RSWZNeRYaX5udkscZEO1HLIdyBF7Db4BYoVlZrquToQfEmaoXD9nROA2PEwDm1nUxPrPE+9Noq/KPPNZBInHC8JtORTgjv6PZadhM7tpU+0C00JZwrExLUc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wpzu+SMT; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wpzu+SMT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746258399; x=1777794399;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tSDGnw73VfangGgIckq3gvfm/ciNQurXEy7MxqcJ3nk=;
  b=Wpzu+SMT/Vw+QtGaJlbbtAS2IU56q5CIkM9vDTnF2v+JdkhDXJCbsRYX
   OJXAS8o3u0RN9LEVXv529iBFc6ZZSQa/S4bsgim51gva2AJQKlYBte+zN
   KF+dInmDNZLR6HhGd00JKJ++Y/9Qf1OuvwA2akEupLVNvcRQ2EOMhaxB3
   5ma1Qun21PLfQGL7MgTgCZ4U2ekOOFhMphTyBtSAm/8Xgl0c81PhxcDVL
   1ONsfvsJeoPPBUUbbWl58vROvQcPI9Nbm8tTgduSouQ/J2KHjjaleU3gG
   hJOTGArCGSz+bG66/CEvn4K8TGdbDxR0e0Y72+y/NtnOnQwbUW0chYUYt
   A==;
X-CSE-ConnectionGUID: AmJMfpFaREC2BXVcgjNhaQ==
X-CSE-MsgGUID: MNSIftrZQCC450qaZfJ9vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="59321714"
X-IronPort-AV: E=Sophos;i="6.15,258,1739865600"; 
   d="scan'208";a="59321714"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2025 00:46:38 -0700
X-CSE-ConnectionGUID: c4CYkO4oTgemHvp1Hop6mQ==
X-CSE-MsgGUID: A+sOf4zuR3K/GarNMf67hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,258,1739865600"; 
   d="scan'208";a="135142446"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 May 2025 00:46:36 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uB7Zy-0005Fl-0J;
	Sat, 03 May 2025 07:46:34 +0000
Date: Sat, 3 May 2025 15:46:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert-irq 19/44]
 arch/arm64/boot/dts/hisilicon/hip06-d03.dtb: mbigen_pcie@a0080000
 (hisilicon,mbigen-v2): 'interrupt-controller' is a required property
Message-ID: <202505031517.60GrWie6-lkp@intel.com>
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
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: arm64-randconfig-051-20250502 (https://download.01.org/0day-ci/archive/20250503/202505031517.60GrWie6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250503/202505031517.60GrWie6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505031517.60GrWie6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/hisilicon/hip06-d03.dtb: /ethernet-0: failed to match any schema with compatible: ['hisilicon,hns-nic-v2']
   arch/arm64/boot/dts/hisilicon/hip06-d03.dtb: /ethernet-1: failed to match any schema with compatible: ['hisilicon,hns-nic-v2']
   arch/arm64/boot/dts/hisilicon/hip06-d03.dtb: /ethernet-4: failed to match any schema with compatible: ['hisilicon,hns-nic-v2']
   arch/arm64/boot/dts/hisilicon/hip06-d03.dtb: /ethernet-5: failed to match any schema with compatible: ['hisilicon,hns-nic-v2']
   arch/arm64/boot/dts/hisilicon/hip06-d03.dtb: mbigen_pcie@a0080000 (hisilicon,mbigen-v2): 'intc_pcie0', 'intc_sas1', 'intc_sas2', 'intc_usb' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
>> arch/arm64/boot/dts/hisilicon/hip06-d03.dtb: mbigen_pcie@a0080000 (hisilicon,mbigen-v2): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
>> arch/arm64/boot/dts/hisilicon/hip06-d03.dtb: mbigen_pcie@a0080000 (hisilicon,mbigen-v2): 'msi-parent' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
   arch/arm64/boot/dts/hisilicon/hip06-d03.dtb: mbigen_pcie@a0080000 (hisilicon,mbigen-v2): 'num-pins' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
>> arch/arm64/boot/dts/hisilicon/hip06-d03.dtb: mbigen_pcie@a0080000 (hisilicon,mbigen-v2): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
   arch/arm64/boot/dts/hisilicon/hip06-d03.dtb: mbigen_dsa@c0080000 (hisilicon,mbigen-v2): 'intc-sas0', 'intc_dsaf0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
>> arch/arm64/boot/dts/hisilicon/hip06-d03.dtb: mbigen_dsa@c0080000 (hisilicon,mbigen-v2): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
   arch/arm64/boot/dts/hisilicon/hip06-d03.dtb: mbigen_dsa@c0080000 (hisilicon,mbigen-v2): 'msi-parent' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
>> arch/arm64/boot/dts/hisilicon/hip06-d03.dtb: mbigen_dsa@c0080000 (hisilicon,mbigen-v2): 'num-pins' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
>> arch/arm64/boot/dts/hisilicon/hip06-d03.dtb: mbigen_dsa@c0080000 (hisilicon,mbigen-v2): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
   arch/arm64/boot/dts/hisilicon/hip06-d03.dtb: serial@2f8 (ns16550a): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arm64/boot/dts/hisilicon/hip06-d03.dtb: usb@a7030000 (generic-ohci): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml#
   arch/arm64/boot/dts/hisilicon/hip06-d03.dtb: usb@a7020000 (generic-ehci): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm64/boot/dts/hisilicon/hip06-d03.dtb: sds_ctrl@c2200000 (syscon): compatible: ['syscon'] is too short
--
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /ethernet-0: failed to match any schema with compatible: ['hisilicon,hns-nic-v2']
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /ethernet-1: failed to match any schema with compatible: ['hisilicon,hns-nic-v2']
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /ethernet-2: failed to match any schema with compatible: ['hisilicon,hns-nic-v2']
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /ethernet-3: failed to match any schema with compatible: ['hisilicon,hns-nic-v2']
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@60080000 (hisilicon,mbigen-v2): 'uart_intc' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
>> arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@60080000 (hisilicon,mbigen-v2): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@60080000 (hisilicon,mbigen-v2): 'msi-parent' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@60080000 (hisilicon,mbigen-v2): 'num-pins' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
>> arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@60080000 (hisilicon,mbigen-v2): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
>> arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@a0080000 (hisilicon,mbigen-v2): 'intc_pcie2_a', 'intc_sas1', 'intc_sas2', 'intc_smmu_pcie', 'intc_usb' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@a0080000 (hisilicon,mbigen-v2): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
>> arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@a0080000 (hisilicon,mbigen-v2): 'msi-parent' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@a0080000 (hisilicon,mbigen-v2): 'num-pins' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
>> arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@a0080000 (hisilicon,mbigen-v2): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
>> arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@d0080000 (hisilicon,mbigen-v2): 'intc_sec', 'intc_smmu_alg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@d0080000 (hisilicon,mbigen-v2): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
>> arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@d0080000 (hisilicon,mbigen-v2): 'msi-parent' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@d0080000 (hisilicon,mbigen-v2): 'num-pins' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
>> arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@d0080000 (hisilicon,mbigen-v2): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@8,d0080000 (hisilicon,mbigen-v2): 'intc_sec', 'intc_smmu_alg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@8,d0080000 (hisilicon,mbigen-v2): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@8,d0080000 (hisilicon,mbigen-v2): 'msi-parent' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@8,d0080000 (hisilicon,mbigen-v2): 'num-pins' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@8,d0080000 (hisilicon,mbigen-v2): '#interrupt-cells' is a required property
--
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@408,d0080000 (hisilicon,mbigen-v2): 'intc_sec', 'intc_smmu_alg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@408,d0080000 (hisilicon,mbigen-v2): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@408,d0080000 (hisilicon,mbigen-v2): 'msi-parent' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@408,d0080000 (hisilicon,mbigen-v2): 'num-pins' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@408,d0080000 (hisilicon,mbigen-v2): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
>> arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@c0080000 (hisilicon,mbigen-v2): 'intc-roce', 'intc-sas0', 'intc_dsaf0', 'intc_smmu_dsa' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@c0080000 (hisilicon,mbigen-v2): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
>> arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@c0080000 (hisilicon,mbigen-v2): 'msi-parent' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@c0080000 (hisilicon,mbigen-v2): 'num-pins' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
>> arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: interrupt-controller@c0080000 (hisilicon,mbigen-v2): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/hisilicon,mbigen-v2.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /soc/serial@602b0000: failed to match any schema with compatible: ['arm,sbsa-uart']
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: usb@a7030000 (generic-ohci): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: usb@a7020000 (generic-ehci): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: dsa_cpld@78000010 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: sds_ctrl@c2200000 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
