Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C59814A4F9
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Jun 2025 03:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750043051; cv=none; b=gZKxNmN2CKzHAFDhUx2gX1bM1PhIN7rbt2XTiP8VIDiHHupZnQveUHSB25IQwEDCvOlfQfU/d+X4Ym4S7UcjhVRTZTew5BvOUCGF7SFjh6qY6maM0O03psAlGRAtmG+qhsWZX4Uqq1vPXT8WcjQyeRJtkgzLcjZV7In0Y12R5Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750043051; c=relaxed/simple;
	bh=f2HmTcBU4MWOABJ6KNBQ3wxeRpqMdoBn/T5GfD5XEDI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=md3xWpJfM7pi8aVW4rA9bQ92zWdODWDo5pIaNhP/M/tVHEXoxQvykYPp6GrXLgVHdW2uZ4ynHy0W1iWcin6aijtrGcGamhyQOCs8ItrH5ZELadxDwYrtF0VnTEvBNtR7iQzJM6QAm3e3BSY3N/cEYY5ihKSO36ZPjnjQZ5eD65g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AM14bTOj; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AM14bTOj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750043049; x=1781579049;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=f2HmTcBU4MWOABJ6KNBQ3wxeRpqMdoBn/T5GfD5XEDI=;
  b=AM14bTOjJdeYTj03PpoQQsv2z6C9smgXj0ml1sZeY8RHtgfwXmaAC+Zk
   H3twwjUSTbPfATM40DATG0USQo1GmP/A3INl7CqBvSeHQTocK1mtKVAws
   9+7cJPxZGZQAiUdIsNbhYq2LGNZWctx192oIWXF/rucb8x4LHWfP+YdDn
   cDEnOEF18nCZOYBfAjQYrIJMV7gt62JBXdLorxsOAiyeDtTCBW6uFDb15
   CZrNRtvU4vQ2iQYESr3wslILuN8Pvwa4BUHHuzF9dArmNwi7Z3wINF8aF
   q7pX6OmzXvCjRa6fchzW7ZNIzMb5FRQ7lppMJIOP71ksrRsK/QE0DRY9n
   A==;
X-CSE-ConnectionGUID: 9xfGOgXHSFaidJmbq2IUSQ==
X-CSE-MsgGUID: xkHTgO3/SV6PXk2eEXzNoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52046599"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="52046599"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 20:04:09 -0700
X-CSE-ConnectionGUID: kvlV7mqXSRKePD33jbg6sg==
X-CSE-MsgGUID: e7yx8NtBS5etJTT81VXcYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="153649627"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 Jun 2025 20:04:08 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uR08j-000Ehg-2G;
	Mon, 16 Jun 2025 03:04:05 +0000
Date: Mon, 16 Jun 2025 11:03:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: msm8976-longcheer-l9360: Add
 initial device tree
Message-ID: <202506161012.nIwUkSxN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250615-bqx5plus-v2-4-72b45c84237d@apitzsch.eu>
References: <20250615-bqx5plus-v2-4-72b45c84237d@apitzsch.eu>
TO: "André Apitzsch via B4 Relay" <devnull+git.apitzsch.eu@kernel.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
TO: Marijn Suijten <marijn.suijten@somainline.org>
CC: ~postmarketos/upstreaming@lists.sr.ht
CC: phone-devel@vger.kernel.org
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: "André Apitzsch" <git@apitzsch.eu>

Hi André,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0bb71d301869446810a0b13d3da290bd455d7c78]

url:    https://github.com/intel-lab-lkp/linux/commits/Andr-Apitzsch-via-B4-Relay/arm64-dts-qcom-msm8976-Make-blsp_dma-controlled-remotely/20250616-043719
base:   0bb71d301869446810a0b13d3da290bd455d7c78
patch link:    https://lore.kernel.org/r/20250615-bqx5plus-v2-4-72b45c84237d%40apitzsch.eu
patch subject: [PATCH v2 4/4] arm64: dts: qcom: msm8976-longcheer-l9360: Add initial device tree
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: arm64-randconfig-004-20250616 (https://download.01.org/0day-ci/archive/20250616/202506161012.nIwUkSxN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250616/202506161012.nIwUkSxN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506161012.nIwUkSxN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/msm8976.dtsi:987.27-1061.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8976.dtsi:1063.27-1118.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8004.dtsi:14.23-23.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@200f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8950.dtsi:176.9-185.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@200f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/msm8976-longcheer-l9360.dts:111.20-139.4: Warning (avoid_unnecessary_addr_size): /soc@0/i2c@78b6000/led-controller@30: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8976.dtsi:510.27-513.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s0-p1@219: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s0-p2@219)
   arch/arm64/boot/dts/qcom/msm8976.dtsi:530.27-533.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s2-p1@21c: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s2-p2@21c)
   arch/arm64/boot/dts/qcom/msm8976.dtsi:555.27-558.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s4-p1@221: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s4-p2@221)
   arch/arm64/boot/dts/qcom/msm8976.dtsi:575.27-578.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s6-p1@224: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s6-p2@224)
   arch/arm64/boot/dts/qcom/msm8976.dtsi:595.25-598.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/mode@228: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s8-p1@228)
   arch/arm64/boot/dts/qcom/msm8976.dtsi:605.27-608.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s8-p2@229: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s9-p1@229)

vim +111 arch/arm64/boot/dts/qcom/msm8976-longcheer-l9360.dts

7d6bd12f08efbd André Apitzsch 2025-06-15  107  
7d6bd12f08efbd André Apitzsch 2025-06-15  108  &blsp1_i2c2 {
7d6bd12f08efbd André Apitzsch 2025-06-15  109  	status = "okay";
7d6bd12f08efbd André Apitzsch 2025-06-15  110  
7d6bd12f08efbd André Apitzsch 2025-06-15 @111  	led-controller@30 {
7d6bd12f08efbd André Apitzsch 2025-06-15  112  		compatible = "kinetic,ktd2026";
7d6bd12f08efbd André Apitzsch 2025-06-15  113  		reg = <0x30>;
7d6bd12f08efbd André Apitzsch 2025-06-15  114  		#address-cells = <1>;
7d6bd12f08efbd André Apitzsch 2025-06-15  115  		#size-cells = <0>;
7d6bd12f08efbd André Apitzsch 2025-06-15  116  
7d6bd12f08efbd André Apitzsch 2025-06-15  117  		multi-led {
7d6bd12f08efbd André Apitzsch 2025-06-15  118  			color = <LED_COLOR_ID_RGB>;
7d6bd12f08efbd André Apitzsch 2025-06-15  119  			function = LED_FUNCTION_STATUS;
7d6bd12f08efbd André Apitzsch 2025-06-15  120  
7d6bd12f08efbd André Apitzsch 2025-06-15  121  			#address-cells = <1>;
7d6bd12f08efbd André Apitzsch 2025-06-15  122  			#size-cells = <0>;
7d6bd12f08efbd André Apitzsch 2025-06-15  123  
7d6bd12f08efbd André Apitzsch 2025-06-15  124  			led@0 {
7d6bd12f08efbd André Apitzsch 2025-06-15  125  				reg = <0>;
7d6bd12f08efbd André Apitzsch 2025-06-15  126  				color = <LED_COLOR_ID_RED>;
7d6bd12f08efbd André Apitzsch 2025-06-15  127  			};
7d6bd12f08efbd André Apitzsch 2025-06-15  128  
7d6bd12f08efbd André Apitzsch 2025-06-15  129  			led@1 {
7d6bd12f08efbd André Apitzsch 2025-06-15  130  				reg = <1>;
7d6bd12f08efbd André Apitzsch 2025-06-15  131  				color = <LED_COLOR_ID_GREEN>;
7d6bd12f08efbd André Apitzsch 2025-06-15  132  			};
7d6bd12f08efbd André Apitzsch 2025-06-15  133  
7d6bd12f08efbd André Apitzsch 2025-06-15  134  			led@2 {
7d6bd12f08efbd André Apitzsch 2025-06-15  135  				reg = <2>;
7d6bd12f08efbd André Apitzsch 2025-06-15  136  				color = <LED_COLOR_ID_BLUE>;
7d6bd12f08efbd André Apitzsch 2025-06-15  137  			};
7d6bd12f08efbd André Apitzsch 2025-06-15  138  		};
7d6bd12f08efbd André Apitzsch 2025-06-15  139  	};
7d6bd12f08efbd André Apitzsch 2025-06-15  140  };
7d6bd12f08efbd André Apitzsch 2025-06-15  141  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
