Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC691114
	for <oe-kbuild@lists.linux.dev>; Sat,  3 Aug 2024 18:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722709271; cv=none; b=BrVK6EVMUS0/RlnlBykQPavxPWCDHm46vx2VXnrUkyWLFP3wpjJfehW0dAAPbOhayF7wNUgz6JKHcndfOdMomYd1PtaQeZDky7yYPlcfu/Is5C8zRy8EH9NkbJou9TL4PL0oazD9F5AArzdTX7qE54v9cjCa8aVNgyGnQaZYvXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722709271; c=relaxed/simple;
	bh=YqCt8YcBhCxnqOXOXS3eOvMa7sV0EAtwzFbOpbFBOCw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RkzbFGKgOLXgvwJ8qFYIaz2fBE/ISPUSncVcg4/8ktgRYpgamXTBtOik6a5WgQ+bKWhZzpqVSg0YSQzz3wKiTBcaj2NgvuM2hUWY+HUQPaeSTAUbKbi72x74Qpmf129Inv6Toaq3ooAVH5F0nGiR23Uo2U7q1cFZ2PcQFDtM290=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TEYYPQDb; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TEYYPQDb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722709267; x=1754245267;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YqCt8YcBhCxnqOXOXS3eOvMa7sV0EAtwzFbOpbFBOCw=;
  b=TEYYPQDb9pyaNF2N+Ww7niXT77+K74wmG2+Ql9311F32Bajx4CX28hVx
   3pNdQoFYtieU9VPOc+qRwPEFGJo1ZfyAnmwQemDGcaoYrfbVwcWKZglHx
   d84PdN7PVmHG/64l0g7tp1ZCr7qpPPInSn4M45Og4tUcSO09KFaNSG6/O
   z7/CbyYnBh2Oxvpbo10C0z3l3SPF55BmFg5zhZ7hrpPIb2bGYTBEXxuX3
   cOOpvAjwabJHl4bvKZuy42TBdKx4k++QkqkzRkNm/zoUfYU47aaRIfR4k
   B1tK9Bmfh8d9KVhHrJjQMr41bDadK16i6nLyts/qWcXpV5CxCuPyfiUMV
   A==;
X-CSE-ConnectionGUID: AidPuA0cS0+ckTwFxlvNtA==
X-CSE-MsgGUID: LTSOz94nTQ22CI8q2Phbjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11153"; a="20885095"
X-IronPort-AV: E=Sophos;i="6.09,261,1716274800"; 
   d="scan'208";a="20885095"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2024 11:21:06 -0700
X-CSE-ConnectionGUID: 0girwjb5T9SoQyY5c3NbDQ==
X-CSE-MsgGUID: j66gHek0QCaxUG7kMsd0Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,261,1716274800"; 
   d="scan'208";a="93288332"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 03 Aug 2024 11:21:05 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saJNG-0000pS-2z;
	Sat, 03 Aug 2024 18:21:02 +0000
Date: Sun, 4 Aug 2024 02:20:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.12 50/52]
 arch/arm64/boot/dts/qcom/msm8216-samsung-fortuna3g.dtb: touchscreen@20:
 'linux,keycodes' does not match any of the regexes: 'pinctrl-[0-9]+'
Message-ID: <202408040225.uMz6ize3-lkp@intel.com>
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
TO: Raymond Hackley <raymondhackley@protonmail.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.12
head:   4e71c38244dbeb6619156b417d469771bba52b83
commit: ccf683fa0c9b5c53534030ddc9dd8a8603f715a0 [50/52] arm64: dts: qcom: msm8916-samsung-fortuna: Add touch keys
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-051-20240803 (https://download.01.org/0day-ci/archive/20240804/202408040225.uMz6ize3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240804/202408040225.uMz6ize3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408040225.uMz6ize3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1582.27-1630.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8916.dtsi:462.26-465.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:477.26-480.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:490.26-493.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:502.26-505.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1569.11-1579.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/msm8216-samsung-fortuna3g.dtb: magnetometer@12: 'mount-matrix' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/magnetometer/bosch,bmc150_magn.yaml#
>> arch/arm64/boot/dts/qcom/msm8216-samsung-fortuna3g.dtb: touchscreen@20: 'linux,keycodes' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/zinitix,bt400.yaml#
   arch/arm64/boot/dts/qcom/msm8216-samsung-fortuna3g.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-acc']
   arch/arm64/boot/dts/qcom/msm8216-samsung-fortuna3g.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-acc']
   arch/arm64/boot/dts/qcom/msm8216-samsung-fortuna3g.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-acc']
   arch/arm64/boot/dts/qcom/msm8216-samsung-fortuna3g.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-acc']
--
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1582.27-1630.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8916.dtsi:462.26-465.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:477.26-480.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:490.26-493.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:502.26-505.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1569.11-1579.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/msm8916-samsung-gprimeltecan.dtb: magnetometer@12: 'mount-matrix' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/magnetometer/bosch,bmc150_magn.yaml#
>> arch/arm64/boot/dts/qcom/msm8916-samsung-gprimeltecan.dtb: touchscreen@20: 'linux,keycodes' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/zinitix,bt400.yaml#
   arch/arm64/boot/dts/qcom/msm8916-samsung-gprimeltecan.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-acc']
   arch/arm64/boot/dts/qcom/msm8916-samsung-gprimeltecan.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-acc']
   arch/arm64/boot/dts/qcom/msm8916-samsung-gprimeltecan.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-acc']
   arch/arm64/boot/dts/qcom/msm8916-samsung-gprimeltecan.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-acc']
--
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1582.27-1630.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8916.dtsi:462.26-465.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:477.26-480.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:490.26-493.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:502.26-505.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1569.11-1579.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/msm8916-samsung-grandprimelte.dtb: magnetometer@12: 'mount-matrix' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/magnetometer/bosch,bmc150_magn.yaml#
>> arch/arm64/boot/dts/qcom/msm8916-samsung-grandprimelte.dtb: touchscreen@20: 'linux,keycodes' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/zinitix,bt400.yaml#
   arch/arm64/boot/dts/qcom/msm8916-samsung-grandprimelte.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-acc']
   arch/arm64/boot/dts/qcom/msm8916-samsung-grandprimelte.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-acc']
   arch/arm64/boot/dts/qcom/msm8916-samsung-grandprimelte.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-acc']
   arch/arm64/boot/dts/qcom/msm8916-samsung-grandprimelte.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-acc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
