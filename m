Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6864B33EC
	for <oe-kbuild@lists.linux.dev>; Sat, 12 Apr 2025 02:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744425445; cv=none; b=ulWAbS3+RTJup02J+MxZHl1wu5fFI5c4pZk1H40zpwhmUUDPIYWExeM9Fq4ZFgunqwSEQRsTAqkn34hW8UH6nnOuCiWt5irxgWTdDkei706xnWI9O7CkPUSi9xCyGgXBlW9PIsd/K4DjbqjpQPSDLmhd/vt6CJCD0C0zEIGFJAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744425445; c=relaxed/simple;
	bh=teoRHEuty/YboL27pN+U+LqA4BRg3NamIOlUDEttePk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rL4QkECxu9vQhupjpgpVCf+/larfGGjZtBMjmq9sILOVns4qEasAct2l+/CVn7bw0VlTNYNATnalIReU9+aYetextpEfR39n0/K15ZToHhzXcqH0iBwkY1Xnrtb0vKhfOEQjEmPfvjaQf4My49b3pgnOK1TWBx6T0ei/5pgsf3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VX2Rto7b; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VX2Rto7b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744425442; x=1775961442;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=teoRHEuty/YboL27pN+U+LqA4BRg3NamIOlUDEttePk=;
  b=VX2Rto7bUL3Z1oHlq9ojQYuy85LNZ3VyzsnUL1MBmMfgiNxJek0PZaDi
   qs0iTs9H3Wk5b2GEKYn/KFtRgmsj0tx28lZB8DPOhV0lUCwGDj+IAETng
   G/5it4Xi6da7WXvf9Lfq8a2uODZgE6LsIt7nxS2zI2MdXnVIZb1py4bcm
   AeLR4uBdgSbanYtV+ny0X0ssWuCcVWHMweB+g5S1aL29nFLI7MRWX6jJ/
   aeDSyWELj8MtRU5+YW5lM/dTnFSPPWkAyATRbpgXpOjKFUwH7K4RMGU08
   eP/S9C9G9OrbslQcdz4DNyC+cmSYYXPQX5At/0kcc2XH5Rf5lgG0hK0gS
   A==;
X-CSE-ConnectionGUID: HhVfImBrSJq+AxExg38ZOA==
X-CSE-MsgGUID: 2Pu8ltw8RzGqn+uHs4AijQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="56645701"
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="56645701"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 19:37:21 -0700
X-CSE-ConnectionGUID: f3wF6OMMQVaoG5viANnlXw==
X-CSE-MsgGUID: KOpxFuBCSpOBrDpo3BH8Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="129111652"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Apr 2025 19:37:20 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3Qk9-000BWS-3C;
	Sat, 12 Apr 2025 02:37:17 +0000
Date: Sat, 12 Apr 2025 10:36:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:for-next 3/9] arch/arm64/boot/dts/microchip/sparx5_pcb125.dtb:
 cpu@0: 'cpu-release-addr' is a required property
Message-ID: <202504121246.r36BDZfp-lkp@intel.com>
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
CC: Sudeep Holla <sudeep.holla@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
head:   b7549ed5edc68e32f518679e1348970f2761637d
commit: 333ff6b5b1a80ca3ec5542ccbe3736d240ca7f86 [3/9] dt-bindings: arm/cpus: Add schemas for "enable-method" dependencies
:::::: branch date: 8 hours ago
:::::: commit date: 32 hours ago
config: arm64-randconfig-051-20250411 (https://download.01.org/0day-ci/archive/20250412/202504121246.r36BDZfp-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev6+gb64c5c3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250412/202504121246.r36BDZfp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504121246.r36BDZfp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/microchip/sparx5.dtsi:104.21-483.4: Warning (unit_address_vs_reg): /axi@600000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/microchip/sparx5.dtsi:124.30-138.5: Warning (unique_unit_address_if_enabled): /axi@600000000/syscon@600000000: duplicate unit-address (also used in node /axi@600000000/switch@600000000)
>> arch/arm64/boot/dts/microchip/sparx5_pcb125.dtb: cpu@0: 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb125.dtb: cpu@1: 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb125.dtb: syscon@600000000: mux-controller:#mux-control-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,sparx5-cpu-syscon.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb125.dtb: mux-controller: #mux-control-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mux/reg-mux.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb125.dtb: spi@600104000: num-cs: 16 is greater than the maximum of 4
   	from schema $id: http://devicetree.org/schemas/spi/snps,dw-apb-ssi.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb125.dtb: spi@600104000: Unevaluated properties are not allowed ('reg-shift' was unexpected)
--
   arch/arm64/boot/dts/microchip/sparx5.dtsi:104.21-483.4: Warning (unit_address_vs_reg): /axi@600000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/microchip/sparx5.dtsi:124.30-138.5: Warning (unique_unit_address_if_enabled): /axi@600000000/syscon@600000000: duplicate unit-address (also used in node /axi@600000000/switch@600000000)
>> arch/arm64/boot/dts/microchip/sparx5_pcb134_emmc.dtb: cpu@0: 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb134_emmc.dtb: cpu@1: 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb134_emmc.dtb: syscon@600000000: mux-controller:#mux-control-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,sparx5-cpu-syscon.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb134_emmc.dtb: mux-controller: #mux-control-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mux/reg-mux.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb134_emmc.dtb: spi@600104000: num-cs: 16 is greater than the maximum of 4
   	from schema $id: http://devicetree.org/schemas/spi/snps,dw-apb-ssi.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb134_emmc.dtb: spi@600104000: Unevaluated properties are not allowed ('reg-shift' was unexpected)
--
   arch/arm64/boot/dts/microchip/sparx5.dtsi:104.21-483.4: Warning (unit_address_vs_reg): /axi@600000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/microchip/sparx5.dtsi:124.30-138.5: Warning (unique_unit_address_if_enabled): /axi@600000000/syscon@600000000: duplicate unit-address (also used in node /axi@600000000/switch@600000000)
>> arch/arm64/boot/dts/microchip/sparx5_pcb135_emmc.dtb: cpu@0: 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb135_emmc.dtb: cpu@1: 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb135_emmc.dtb: syscon@600000000: mux-controller:#mux-control-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,sparx5-cpu-syscon.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb135_emmc.dtb: mux-controller: #mux-control-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mux/reg-mux.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb135_emmc.dtb: spi@600104000: num-cs: 16 is greater than the maximum of 4
   	from schema $id: http://devicetree.org/schemas/spi/snps,dw-apb-ssi.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb135_emmc.dtb: spi@600104000: Unevaluated properties are not allowed ('reg-shift' was unexpected)
--
   arch/arm64/boot/dts/qcom/msm8939.dtsi:495.26-498.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s6-p1@a1: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s6-p2@a1)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:515.26-518.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s8-p1@a4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s8-p2@a4)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:540.24-543.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/mode@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:550.26-553.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s0-p1@d1: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p1@d1)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:570.26-573.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s3-p1@d4)
>> arch/arm64/boot/dts/qcom/apq8039-t2.dtb: cpu@100: 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/qcom/apq8039-t2.dtb: cpu@101: 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/qcom/apq8039-t2.dtb: cpu@102: 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/qcom/apq8039-t2.dtb: cpu@103: 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/qcom/apq8039-t2.dtb: cpu@0: 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/qcom/apq8039-t2.dtb: cpu@1: 'cpu-release-addr' is a required property
--
   arch/arm64/boot/dts/qcom/msm8939.dtsi:1271.27-1320.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8939.dtsi:495.26-498.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s6-p1@a1: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s6-p2@a1)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:515.26-518.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s8-p1@a4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s8-p2@a4)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:540.24-543.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/mode@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:550.26-553.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s0-p1@d1: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p1@d1)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:570.26-573.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s3-p1@d4)
>> arch/arm64/boot/dts/qcom/msm8929-wingtech-wt82918hd.dtb: cpu@100: 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/qcom/msm8929-wingtech-wt82918hd.dtb: cpu@101: 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/qcom/msm8929-wingtech-wt82918hd.dtb: cpu@102: 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/qcom/msm8929-wingtech-wt82918hd.dtb: cpu@103: 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/qcom/msm8929-wingtech-wt82918hd.dtb: cpu@0: 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/qcom/msm8929-wingtech-wt82918hd.dtb: cpu@1: 'cpu-release-addr' is a required property
--
   arch/arm64/boot/dts/qcom/msm8939.dtsi:1271.27-1320.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8939.dtsi:495.26-498.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s6-p1@a1: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s6-p2@a1)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:515.26-518.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s8-p1@a4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s8-p2@a4)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:540.24-543.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/mode@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:550.26-553.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s0-p1@d1: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p1@d1)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:570.26-573.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s3-p1@d4)
>> arch/arm64/boot/dts/qcom/msm8939-huawei-kiwi.dtb: cpu@100: 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/qcom/msm8939-huawei-kiwi.dtb: cpu@101: 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/qcom/msm8939-huawei-kiwi.dtb: cpu@102: 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/qcom/msm8939-huawei-kiwi.dtb: cpu@103: 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/qcom/msm8939-huawei-kiwi.dtb: cpu@0: 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/qcom/msm8939-huawei-kiwi.dtb: cpu@1: 'cpu-release-addr' is a required property
--
   arch/arm64/boot/dts/qcom/msm8939.dtsi:1271.27-1320.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts:127.20-161.4: Warning (avoid_unnecessary_addr_size): /soc@0/i2c@78b6000/led-controller@30: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8939.dtsi:495.26-498.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s6-p1@a1: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s6-p2@a1)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:515.26-518.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s8-p1@a4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s8-p2@a4)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:540.24-543.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/mode@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:550.26-553.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s0-p1@d1: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p1@d1)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:570.26-573.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s3-p1@d4)
>> arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dtb: cpu@100: 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dtb: cpu@101: 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dtb: cpu@102: 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dtb: cpu@103: 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dtb: cpu@0: 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dtb: cpu@1: 'cpu-release-addr' is a required property
--
   arch/arm64/boot/dts/qcom/msm8939.dtsi:1271.27-1320.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8939.dtsi:495.26-498.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s6-p1@a1: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s6-p2@a1)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:515.26-518.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s8-p1@a4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s8-p2@a4)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:540.24-543.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/mode@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:550.26-553.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s0-p1@d1: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p1@d1)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:570.26-573.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s3-p1@d4)
>> arch/arm64/boot/dts/qcom/msm8939-samsung-a7.dtb: cpu@100: 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/qcom/msm8939-samsung-a7.dtb: cpu@101: 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/qcom/msm8939-samsung-a7.dtb: cpu@102: 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/qcom/msm8939-samsung-a7.dtb: cpu@103: 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/qcom/msm8939-samsung-a7.dtb: cpu@0: 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/qcom/msm8939-samsung-a7.dtb: cpu@1: 'cpu-release-addr' is a required property
--
   arch/arm64/boot/dts/qcom/msm8939.dtsi:495.26-498.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s6-p1@a1: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s6-p2@a1)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:515.26-518.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s8-p1@a4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s8-p2@a4)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:540.24-543.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/mode@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:550.26-553.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s0-p1@d1: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p1@d1)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:570.26-573.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s3-p1@d4)
>> arch/arm64/boot/dts/qcom/msm8939-sony-xperia-kanuti-tulip.dtb: cpu@100: 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/qcom/msm8939-sony-xperia-kanuti-tulip.dtb: cpu@101: 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/qcom/msm8939-sony-xperia-kanuti-tulip.dtb: cpu@102: 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/qcom/msm8939-sony-xperia-kanuti-tulip.dtb: cpu@103: 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/qcom/msm8939-sony-xperia-kanuti-tulip.dtb: cpu@0: 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/qcom/msm8939-sony-xperia-kanuti-tulip.dtb: cpu@1: 'cpu-release-addr' is a required property
--
   arch/arm64/boot/dts/qcom/msm8939.dtsi:1271.27-1320.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8939.dtsi:495.26-498.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s6-p1@a1: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s6-p2@a1)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:515.26-518.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s8-p1@a4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s8-p2@a4)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:540.24-543.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/mode@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:550.26-553.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s0-p1@d1: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p1@d1)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:570.26-573.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s3-p1@d4)
>> arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918.dtb: cpu@100: 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918.dtb: cpu@101: 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918.dtb: cpu@102: 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918.dtb: cpu@103: 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918.dtb: cpu@0: 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918.dtb: cpu@1: 'cpu-release-addr' is a required property
--
   arch/arm64/boot/dts/qcom/msm8939.dtsi:1271.27-1320.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8939.dtsi:495.26-498.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s6-p1@a1: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s6-p2@a1)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:515.26-518.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s8-p1@a4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s8-p2@a4)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:540.24-543.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/mode@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:550.26-553.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s0-p1@d1: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p1@d1)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:570.26-573.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s3-p1@d4)
>> arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918hd.dtb: cpu@100: 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918hd.dtb: cpu@101: 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918hd.dtb: cpu@102: 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918hd.dtb: cpu@103: 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918hd.dtb: cpu@0: 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918hd.dtb: cpu@1: 'cpu-release-addr' is a required property

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
