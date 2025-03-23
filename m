Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A42BA38
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Mar 2025 00:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742688454; cv=none; b=h7LJdsoq2/bXyAzzzXYZXpqy7j4mtJH1vf2mxech50PK0PSViqp3Xixi6WvaK01on3fm3GnXIesqu98tloGbKg/RmIo5/pLewow36eutGRxHSjBdbhEZtFmoQ1OMjyZ6fSSKU0BXP9qCUoiY1s2JGZiDZ5UPch+eZAjH50wlUwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742688454; c=relaxed/simple;
	bh=ucQgU+4EOfQr6ogOBryLTfKfJEWjJL0/zdOwC+aHRyU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t4Mf7AEjAieBkNk2SaYcBGH+HJu2TzaXhg0Enb37p4s2ANXTyY4odr6fqaZrsc41sb80vN2E+s+R+jsYAmG9PNFdz7njTkjL1gZMFCdL3a2HPXMbrd226AnnRW64vd7ET6VWyFHUCl/MuJWzYvawUkhNy9TaqZCTRWJucX1TZ8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NYlBJxnT; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NYlBJxnT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742688452; x=1774224452;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ucQgU+4EOfQr6ogOBryLTfKfJEWjJL0/zdOwC+aHRyU=;
  b=NYlBJxnTBUH+5fWOhXy2eon7WuU4QsqafWCf/VRN/QhdcAkEyRBZnDR+
   wFl//Bw1h50/lVArdpvl3EXK8IqeTA9cgbMN9Ct8M3IE7sjgUZzALr+c0
   iOAHg6QDWHWM5NkLrOIz8Ibl+6Rg0Z9vqpRcjxU4f0dnBftH0tOY2nqJv
   cCz0m1E7usG5+ad3aGROA7Ee0MccaOazFp2zO3zLnYrvBbzOkDSFedEb9
   jB9jWSkC8DqLtlaA49KEg/Lytlve2g7TvhZUHrEsho8k7hALedCIMKpzx
   Ymq9wcTti18tiYkb9Kve5Yk0A9KPi/XtqC7MV7cDZklDCNOC2zy5upCkn
   w==;
X-CSE-ConnectionGUID: DpFs7UbkQYmFCZRr/d4sFQ==
X-CSE-MsgGUID: 3cods4QVQ0SXA+a9e+8gVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11381"; a="43649513"
X-IronPort-AV: E=Sophos;i="6.14,268,1736841600"; 
   d="scan'208";a="43649513"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2025 17:07:31 -0700
X-CSE-ConnectionGUID: Md3MKXC7TS+SGS5i9rNE3g==
X-CSE-MsgGUID: Fsrmqc6QRJKyejW3mjQXHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,268,1736841600"; 
   d="scan'208";a="127857576"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 22 Mar 2025 17:07:30 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tw8sC-0002Sx-0W;
	Sun, 23 Mar 2025 00:07:28 +0000
Date: Sun, 23 Mar 2025 08:07:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
 55/76] arch/arm/boot/dts/qcom/qcom-apq8016-sbc.dtb:
 /soc@0/power-manager@b088000: failed to match any schema with compatible:
 ['qcom,msm8916-kpss-acc']
Message-ID: <202503230838.EOFNVpBy-lkp@intel.com>
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
TO: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://github.com/krzk/linux pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
head:   0f317f352994cb64676e93a4b91c8c7464f13c98
commit: 35f6fc60ebb2425c3947dc79c60af0c1c4962483 [55/76] arm64: dts: qcom: msm8916: Fix KPSS ACC compatible
:::::: branch date: 5 days ago
:::::: commit date: 10 days ago
config: arm-randconfig-052-20250318 (https://download.01.org/0day-ci/archive/20250323/202503230838.EOFNVpBy-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev5+g0f9dc23
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250323/202503230838.EOFNVpBy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503230838.EOFNVpBy-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   scripts/dtc/include-prefixes/arm64/qcom/msm8916.dtsi:1582.27-1630.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   scripts/dtc/include-prefixes/arm64/qcom/msm8916.dtsi:462.26-465.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   scripts/dtc/include-prefixes/arm64/qcom/msm8916.dtsi:477.26-480.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   scripts/dtc/include-prefixes/arm64/qcom/msm8916.dtsi:490.26-493.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   scripts/dtc/include-prefixes/arm64/qcom/msm8916.dtsi:502.26-505.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   scripts/dtc/include-prefixes/arm64/qcom/msm8916.dtsi:1569.11-1579.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm/boot/dts/qcom/qcom-apq8016-sbc.dtb: bridge@39: #sound-dai-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7533.yaml#
>> arch/arm/boot/dts/qcom/qcom-apq8016-sbc.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm/boot/dts/qcom/qcom-apq8016-sbc.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm/boot/dts/qcom/qcom-apq8016-sbc.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm/boot/dts/qcom/qcom-apq8016-sbc.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
--
   scripts/dtc/include-prefixes/arm64/qcom/msm8916.dtsi:1582.27-1630.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   scripts/dtc/include-prefixes/arm64/qcom/msm8916.dtsi:462.26-465.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   scripts/dtc/include-prefixes/arm64/qcom/msm8916.dtsi:477.26-480.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   scripts/dtc/include-prefixes/arm64/qcom/msm8916.dtsi:490.26-493.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   scripts/dtc/include-prefixes/arm64/qcom/msm8916.dtsi:502.26-505.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   scripts/dtc/include-prefixes/arm64/qcom/msm8916.dtsi:1569.11-1579.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm/boot/dts/qcom/qcom-msm8916-samsung-e5.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm/boot/dts/qcom/qcom-msm8916-samsung-e5.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm/boot/dts/qcom/qcom-msm8916-samsung-e5.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm/boot/dts/qcom/qcom-msm8916-samsung-e5.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
--
   scripts/dtc/include-prefixes/arm64/qcom/msm8916.dtsi:1582.27-1630.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   scripts/dtc/include-prefixes/arm64/qcom/msm8916.dtsi:462.26-465.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   scripts/dtc/include-prefixes/arm64/qcom/msm8916.dtsi:477.26-480.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   scripts/dtc/include-prefixes/arm64/qcom/msm8916.dtsi:490.26-493.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   scripts/dtc/include-prefixes/arm64/qcom/msm8916.dtsi:502.26-505.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   scripts/dtc/include-prefixes/arm64/qcom/msm8916.dtsi:1569.11-1579.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm/boot/dts/qcom/qcom-msm8916-samsung-e7.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm/boot/dts/qcom/qcom-msm8916-samsung-e7.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm/boot/dts/qcom/qcom-msm8916-samsung-e7.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm/boot/dts/qcom/qcom-msm8916-samsung-e7.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
--
   scripts/dtc/include-prefixes/arm64/qcom/msm8916.dtsi:462.26-465.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   scripts/dtc/include-prefixes/arm64/qcom/msm8916.dtsi:477.26-480.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   scripts/dtc/include-prefixes/arm64/qcom/msm8916.dtsi:490.26-493.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   scripts/dtc/include-prefixes/arm64/qcom/msm8916.dtsi:502.26-505.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   scripts/dtc/include-prefixes/arm64/qcom/msm8916.dtsi:1569.11-1579.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm/boot/dts/qcom/qcom-msm8916-samsung-grandmax.dtb: touchscreen@50: linux,keycodes: [580, 158] is too short
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/imagis,ist3038c.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8916-samsung-grandmax.dtb: touchscreen@50: linux,keycodes: False schema does not allow [580, 158]
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/imagis,ist3038c.yaml#
>> arch/arm/boot/dts/qcom/qcom-msm8916-samsung-grandmax.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm/boot/dts/qcom/qcom-msm8916-samsung-grandmax.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm/boot/dts/qcom/qcom-msm8916-samsung-grandmax.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm/boot/dts/qcom/qcom-msm8916-samsung-grandmax.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
--
   scripts/dtc/include-prefixes/arm64/qcom/msm8916.dtsi:462.26-465.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   scripts/dtc/include-prefixes/arm64/qcom/msm8916.dtsi:477.26-480.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   scripts/dtc/include-prefixes/arm64/qcom/msm8916.dtsi:490.26-493.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   scripts/dtc/include-prefixes/arm64/qcom/msm8916.dtsi:502.26-505.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   scripts/dtc/include-prefixes/arm64/qcom/msm8916.dtsi:1569.11-1579.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm/boot/dts/qcom/qcom-msm8916-samsung-serranove.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm/boot/dts/qcom/qcom-msm8916-samsung-serranove.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm/boot/dts/qcom/qcom-msm8916-samsung-serranove.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm/boot/dts/qcom/qcom-msm8916-samsung-serranove.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
