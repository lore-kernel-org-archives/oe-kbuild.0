Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5511FC3
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Jul 2025 18:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753380238; cv=none; b=kRQtm7p1kMLB0Ty10WEVu6/N3Rcp5jD+0BovNQF8i+OFncUJ38YGl1GdWqp4ht8GmN/yP2xVvNSUqEItnyeJVzZJy/U+lvUGbL07JyYvW7R10+6pnuqjHAsIaAu5YQKQX4Al3cwfFExJt3Hnqq4CIei5i2h3vzQm2snDR2Ajf/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753380238; c=relaxed/simple;
	bh=+kVIaCIPB88LHOGVp4v+JXMEn4Hz+VwTpzoR/VWxkOc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PFv/5I0/3vv+zKZenCHJ5hbkrljpPs0hixwEJC25u4czJCQLcONNlw9Di/HAqXuPagP+4t4fMkacn9yQYeyATm9ycF8ESMHaqzm4jw8by1KbxKffJ9vD+0Fl2uiW5kI6Xe0xFQddLuwNB7DISjLgSy9+M6Ta5jLdKRL5QRSey/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lPJ6/3IO; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lPJ6/3IO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753380234; x=1784916234;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+kVIaCIPB88LHOGVp4v+JXMEn4Hz+VwTpzoR/VWxkOc=;
  b=lPJ6/3IOOVb5UEI5y2l10zOoWhtjwzI8PgVclpRufyNmWyWiS+ROp4Mi
   36GcTIESOiRB8Sjdx0+dYI/ZWydc4uTE++Acl9B0Vzvx//vsDPCMZAkNz
   o46OXuI0nQhX1Q/E8NtQ/u7M715+MhRAqhANaZuEg+D5BqBU7/gY1t7UK
   HRMuekaGOsUodALHbWKXXDFUsmNh/XuBovUKU2VDu8LB+0Fjz7lJoJNz9
   oDskUjcolxMnxKDRHCz274lIM0AC++KJsUHn2UjqC/bVrnAQsde6iRkoM
   IbL0FjmBSvyor8C2ZqDHKy4wmZkkyACCuZfm/1tSRB5PRuOoCAUiPCY3L
   A==;
X-CSE-ConnectionGUID: wBgz+HGqRmC9X/vsZmMrhw==
X-CSE-MsgGUID: lNbW+06oQVucUQ1ZDu+qQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="59526355"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; 
   d="scan'208";a="59526355"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2025 11:03:54 -0700
X-CSE-ConnectionGUID: 9kJhb47nSP+fGUFyysJURg==
X-CSE-MsgGUID: pgtB9gkFRJSsHAkJqaO4/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; 
   d="scan'208";a="165889086"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 24 Jul 2025 11:03:53 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uf0IH-000Khz-2i;
	Thu, 24 Jul 2025 18:03:49 +0000
Date: Fri, 25 Jul 2025 02:02:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [pci:dt-bindings 12/12] arch/arm64/boot/dts/qcom/qcs9100-ride.dtb:
 pcie@1c00000 (qcom,pcie-sa8775p): reset-names: ['pci'] is too short
Message-ID: <202507250153.Rhr1mNmJ-lkp@intel.com>
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
CC: linux-pci@vger.kernel.org
TO: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
CC: Manivannan Sadhasivam <mani@kernel.org>
CC: "Rob Herring (Arm)" <robh@kernel.org>
CC: Johan Hovold <johan+linaro@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git dt-bindings
head:   10e7298dc0f14c52d9b5c52fb52558f567815b7c
commit: 10e7298dc0f14c52d9b5c52fb52558f567815b7c [12/12] dt-bindings: PCI: qcom,pcie-sa8775p: Document 'link_down' reset
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: arm64-randconfig-051-20250724 (https://download.01.org/0day-ci/archive/20250725/202507250153.Rhr1mNmJ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250725/202507250153.Rhr1mNmJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507250153.Rhr1mNmJ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: display-controller@ae01000 (qcom,sa8775p-dpu): clock-names:0: 'nrt_bus' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: display-controller@ae01000 (qcom,sa8775p-dpu): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: pcie@1c00000 (qcom,pcie-sa8775p): reset-names: ['pci'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: pcie@1c00000 (qcom,pcie-sa8775p): resets: [[51, 7]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: pcie@1c10000 (qcom,pcie-sa8775p): reset-names: ['pci'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: pcie@1c10000 (qcom,pcie-sa8775p): resets: [[51, 12]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmumx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmucx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
--
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: display-controller@ae01000 (qcom,sa8775p-dpu): clock-names:0: 'nrt_bus' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: display-controller@ae01000 (qcom,sa8775p-dpu): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: pcie@1c00000 (qcom,pcie-sa8775p): reset-names: ['pci'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: pcie@1c00000 (qcom,pcie-sa8775p): resets: [[51, 7]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: pcie@1c10000 (qcom,pcie-sa8775p): reset-names: ['pci'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: pcie@1c10000 (qcom,pcie-sa8775p): resets: [[51, 12]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmumx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmucx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
--
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: display-controller@ae01000 (qcom,sa8775p-dpu): clock-names:0: 'nrt_bus' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: display-controller@ae01000 (qcom,sa8775p-dpu): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: pcie@1c00000 (qcom,pcie-sa8775p): reset-names: ['pci'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: pcie@1c00000 (qcom,pcie-sa8775p): resets: [[51, 7]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: pcie@1c10000 (qcom,pcie-sa8775p): reset-names: ['pci'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: pcie@1c10000 (qcom,pcie-sa8775p): resets: [[51, 12]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmumx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmucx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
--
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: display-controller@ae01000 (qcom,sa8775p-dpu): clock-names:0: 'nrt_bus' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: display-controller@ae01000 (qcom,sa8775p-dpu): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: pcie@1c00000 (qcom,pcie-sa8775p): reset-names: ['pci'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: pcie@1c00000 (qcom,pcie-sa8775p): resets: [[51, 7]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: pcie@1c10000 (qcom,pcie-sa8775p): reset-names: ['pci'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: pcie@1c10000 (qcom,pcie-sa8775p): resets: [[51, 12]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmumx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmucx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
