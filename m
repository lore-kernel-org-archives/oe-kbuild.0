Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0663D3B3
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Sep 2024 14:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725718732; cv=none; b=rKv6snu0ooYpTGkMYvkacbqwZGrtblRkVJ4cx3suGnjz+NJbAVxEQPD8lGol1Wx1yOnlwFck8iVnQfn9EU5feBxDyAOuUg7v/MDH4IraNMAkmRTCuiLN6b0+lAfkcDixslN+28BZssS4vZ++0OjMF7aimdatYywops9cPCR0kwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725718732; c=relaxed/simple;
	bh=YGC7r3Lxh8Hc/r0ho4U6tskB7qjWZeCATYxcvUKTM7k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HaiiNHBQRIVVmviSB+bOvmUXpFhVbTggnXVVXgtV3WfANCsUOSEEw3qGP5X4m9B5a5usfx8sAnRlKFgjar6ojPV+dj0Bg2rmIv6saB9dl7QowCoreijMSXb5RJ+tI41YSzj0IYQRQ0hanXisAVbXOMWDS1Clc9pqj90LVjeqHHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UChGHLYV; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UChGHLYV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725718727; x=1757254727;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YGC7r3Lxh8Hc/r0ho4U6tskB7qjWZeCATYxcvUKTM7k=;
  b=UChGHLYVurli5QFItF7WATPjLGC7gDFwG4huOx3+4VseSfT/SONgOffX
   Y1yCFYm/a5tArvrSJ3SSbsMrFvd25SR7pomCwyHJE821FzrOtL8JX0puf
   sSfA/Ge+aZvM6fu8hSbB2yV3lu9KfWBUtOgUUqAAT8y23ucsT715X5Fh2
   6tvJ+TqLjHLthwbPJz6/pfu92RFnZqBJk2/YchqdZiZ5XP66//0FR0qgl
   Jh5Sjf/ZotriLoPD6IReiBW+5JzGHWBp/E0+VX4hD0NOO1dOoGro7K7/d
   JjaFspDK3jPe7SeqBtYUPHaO87SPUbv6RMieJrCBAqzchvAVtNDG7RGSG
   Q==;
X-CSE-ConnectionGUID: B4aW29IuT4mjcAb24Deu+A==
X-CSE-MsgGUID: /xBfjtAhQuSWSpQkbngsvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="24574778"
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="24574778"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 07:18:47 -0700
X-CSE-ConnectionGUID: tAJCrk85RcCfYT4IaQfx6Q==
X-CSE-MsgGUID: 6Mo3YwxOQJefSiycxBgixQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="66015188"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 Sep 2024 07:18:45 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smwGx-000Ccl-0x;
	Sat, 07 Sep 2024 14:18:43 +0000
Date: Sat, 7 Sep 2024 22:17:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:b4/dts-cleanup 4/7]
 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:309.26-312.6: Warning
 (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s9-p1@d8: duplicate
 unit-address (also used in node /soc/efuse@fc4bc000/s10-p1@d8)
Message-ID: <202409072233.CDre2vI1-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Krzysztof Kozlowski <krzk@kernel.org>

Hi Krzysztof,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/krzk/linux b4/dts-cleanup
head:   d3e811c92a2277ee0c85de59d0db0016f8741fa6
commit: 157b4744263bd58b939b610cb1b53f9ec5cb8a5b [4/7] ARM: dts: qcom: drop underscore in node names
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-004-20240907 (https://download.01.org/0day-ci/archive/20240907/202409072233.CDre2vI1-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240907/202409072233.CDre2vI1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409072233.CDre2vI1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:92.9-95.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:264.26-267.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@d2: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@d2)
   arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:279.26-282.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1@d4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1@d4)
   arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:299.26-302.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1@d7: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode@d7)
>> arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:309.26-312.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s9-p1@d8: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s10-p1@d8)
   arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:334.26-337.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s2-p2@dc: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s3-p2@dc)
   arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:359.26-362.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s7-p2@e0: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s8-p2@e0)
>> arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:379.40-382.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s5-p2-backup@e3: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode-backup@e3)
>> arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:389.40-392.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s6-p2-backup@e4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s7-p2-backup@e4)
>> arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:424.41-427.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1-backup@442: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1-backup@442)
>> arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:439.41-442.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1-backup@444: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1-backup@444)
>> arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:464.41-467.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1-backup@448: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s9-p1-backup@448)
>> arch/arm/boot/dts/qcom/qcom-apq8084.dtsi:489.41-492.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p2-backup@44c: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p2-backup@44c)
--
   arch/arm/boot/dts/qcom/pm8941.dtsi:199.19-207.5: Warning (avoid_unnecessary_addr_size): /soc/spmi@fc4cf000/pm8941@1/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1955.28-2006.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:2026.28-2077.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922e00: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1252.26-1255.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@d2: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@d2)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1267.26-1270.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1@d4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1@d4)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1287.26-1290.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1@d7: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode@d7)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1297.26-1300.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s9-p1@d8: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s10-p1@d8)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1322.26-1325.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s2-p2@dc: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s3-p2@dc)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1347.26-1350.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s7-p2@e0: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s8-p2@e0)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1367.40-1370.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s5-p2-backup@e3: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode-backup@e3)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1377.40-1380.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s6-p2-backup@e4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s7-p2-backup@e4)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1412.41-1415.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1-backup@442: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1-backup@442)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1427.41-1430.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1-backup@444: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1-backup@444)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1452.41-1455.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1-backup@448: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s9-p1-backup@448)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1477.41-1480.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p2-backup@44c: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p2-backup@44c)
--
   arch/arm/boot/dts/qcom/pm8941.dtsi:199.19-207.5: Warning (avoid_unnecessary_addr_size): /soc/spmi@fc4cf000/pm8941@1/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1955.28-2006.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:2026.28-2077.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922e00: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1252.26-1255.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@d2: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@d2)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1267.26-1270.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1@d4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1@d4)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1287.26-1290.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1@d7: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode@d7)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1297.26-1300.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s9-p1@d8: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s10-p1@d8)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1322.26-1325.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s2-p2@dc: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s3-p2@dc)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1347.26-1350.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s7-p2@e0: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s8-p2@e0)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1367.40-1370.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s5-p2-backup@e3: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode-backup@e3)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1377.40-1380.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s6-p2-backup@e4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s7-p2-backup@e4)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1412.41-1415.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1-backup@442: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1-backup@442)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1427.41-1430.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1-backup@444: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1-backup@444)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1452.41-1455.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1-backup@448: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s9-p1-backup@448)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1477.41-1480.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p2-backup@44c: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p2-backup@44c)
--
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:2026.28-2077.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922e00: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1252.26-1255.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@d2: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@d2)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1267.26-1270.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1@d4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1@d4)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1287.26-1290.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1@d7: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode@d7)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1297.26-1300.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s9-p1@d8: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s10-p1@d8)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1322.26-1325.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s2-p2@dc: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s3-p2@dc)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1347.26-1350.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s7-p2@e0: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s8-p2@e0)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1367.40-1370.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s5-p2-backup@e3: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode-backup@e3)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1377.40-1380.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s6-p2-backup@e4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s7-p2-backup@e4)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1412.41-1415.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1-backup@442: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1-backup@442)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1427.41-1430.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1-backup@444: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1-backup@444)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1452.41-1455.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1-backup@448: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s9-p1-backup@448)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1477.41-1480.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p2-backup@44c: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p2-backup@44c)
--
   arch/arm/boot/dts/qcom/pm8941.dtsi:199.19-207.5: Warning (avoid_unnecessary_addr_size): /soc/spmi@fc4cf000/pm8941@1/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1955.28-2006.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:2026.28-2077.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922e00: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1252.26-1255.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@d2: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@d2)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1267.26-1270.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1@d4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1@d4)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1287.26-1290.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1@d7: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode@d7)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1297.26-1300.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s9-p1@d8: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s10-p1@d8)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1322.26-1325.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s2-p2@dc: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s3-p2@dc)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1347.26-1350.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s7-p2@e0: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s8-p2@e0)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1367.40-1370.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s5-p2-backup@e3: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode-backup@e3)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1377.40-1380.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s6-p2-backup@e4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s7-p2-backup@e4)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1412.41-1415.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1-backup@442: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1-backup@442)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1427.41-1430.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1-backup@444: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1-backup@444)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1452.41-1455.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1-backup@448: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s9-p1-backup@448)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1477.41-1480.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p2-backup@44c: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p2-backup@44c)
--
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1955.28-2006.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:2026.28-2077.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922e00: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1252.26-1255.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@d2: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@d2)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1267.26-1270.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1@d4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1@d4)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1287.26-1290.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1@d7: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode@d7)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1297.26-1300.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s9-p1@d8: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s10-p1@d8)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1322.26-1325.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s2-p2@dc: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s3-p2@dc)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1347.26-1350.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s7-p2@e0: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s8-p2@e0)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1367.40-1370.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s5-p2-backup@e3: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode-backup@e3)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1377.40-1380.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s6-p2-backup@e4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s7-p2-backup@e4)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1412.41-1415.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1-backup@442: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1-backup@442)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1427.41-1430.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1-backup@444: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1-backup@444)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1452.41-1455.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1-backup@448: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s9-p1-backup@448)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1477.41-1480.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p2-backup@44c: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p2-backup@44c)
--
   arch/arm/boot/dts/qcom/pm8941.dtsi:199.19-207.5: Warning (avoid_unnecessary_addr_size): /soc/spmi@fc4cf000/pm8941@1/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:2026.28-2077.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922e00: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1252.26-1255.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@d2: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@d2)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1267.26-1270.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1@d4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1@d4)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1287.26-1290.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1@d7: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode@d7)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1297.26-1300.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s9-p1@d8: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s10-p1@d8)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1322.26-1325.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s2-p2@dc: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s3-p2@dc)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1347.26-1350.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s7-p2@e0: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s8-p2@e0)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1367.40-1370.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s5-p2-backup@e3: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode-backup@e3)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1377.40-1380.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s6-p2-backup@e4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s7-p2-backup@e4)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1412.41-1415.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1-backup@442: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1-backup@442)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1427.41-1430.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1-backup@444: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1-backup@444)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1452.41-1455.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1-backup@448: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s9-p1-backup@448)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1477.41-1480.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p2-backup@44c: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p2-backup@44c)

vim +309 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi

98a295339e5654 arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-06-03    7  
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23    8  / {
abe60a3a7afb40 arch/arm/boot/dts/qcom-apq8084.dtsi      Rob Herring         2019-01-09    9  	#address-cells = <1>;
abe60a3a7afb40 arch/arm/boot/dts/qcom-apq8084.dtsi      Rob Herring         2019-01-09   10  	#size-cells = <1>;
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23   11  	model = "Qualcomm APQ 8084";
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23   12  	compatible = "qcom,apq8084";
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23   13  	interrupt-parent = <&intc>;
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23   14  
64ab88638af03b arch/arm/boot/dts/qcom-apq8084.dtsi      Andy Gross          2015-09-24   15  	reserved-memory {
64ab88638af03b arch/arm/boot/dts/qcom-apq8084.dtsi      Andy Gross          2015-09-24   16  		#address-cells = <1>;
64ab88638af03b arch/arm/boot/dts/qcom-apq8084.dtsi      Andy Gross          2015-09-24   17  		#size-cells = <1>;
64ab88638af03b arch/arm/boot/dts/qcom-apq8084.dtsi      Andy Gross          2015-09-24   18  		ranges;
64ab88638af03b arch/arm/boot/dts/qcom-apq8084.dtsi      Andy Gross          2015-09-24   19  
157b4744263bd5 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi Krzysztof Kozlowski 2024-09-05   20  		smem_mem: smem-region@fa00000 {
64ab88638af03b arch/arm/boot/dts/qcom-apq8084.dtsi      Andy Gross          2015-09-24   21  			reg = <0xfa00000 0x200000>;
64ab88638af03b arch/arm/boot/dts/qcom-apq8084.dtsi      Andy Gross          2015-09-24   22  			no-map;
64ab88638af03b arch/arm/boot/dts/qcom-apq8084.dtsi      Andy Gross          2015-09-24   23  		};
64ab88638af03b arch/arm/boot/dts/qcom-apq8084.dtsi      Andy Gross          2015-09-24   24  	};
64ab88638af03b arch/arm/boot/dts/qcom-apq8084.dtsi      Andy Gross          2015-09-24   25  
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23   26  	cpus {
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23   27  		#address-cells = <1>;
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23   28  		#size-cells = <0>;
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23   29  
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23   30  		cpu@0 {
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23   31  			device_type = "cpu";
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23   32  			compatible = "qcom,krait";
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23   33  			reg = <0>;
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23   34  			enable-method = "qcom,kpss-acc-v2";
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23   35  			next-level-cache = <&L2>;
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23   36  			qcom,acc = <&acc0>;
030e27f6c60d37 arch/arm/boot/dts/qcom-apq8084.dtsi      Lina Iyer           2015-03-25   37  			qcom,saw = <&saw0>;
d8664979e6ba97 arch/arm/boot/dts/qcom-apq8084.dtsi      Lina Iyer           2015-03-25   38  			cpu-idle-states = <&CPU_SPC>;
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23   39  		};
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23   40  
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23   41  		cpu@1 {
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23   42  			device_type = "cpu";
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23   43  			compatible = "qcom,krait";
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23   44  			reg = <1>;
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23   45  			enable-method = "qcom,kpss-acc-v2";
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23   46  			next-level-cache = <&L2>;
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23   47  			qcom,acc = <&acc1>;
030e27f6c60d37 arch/arm/boot/dts/qcom-apq8084.dtsi      Lina Iyer           2015-03-25   48  			qcom,saw = <&saw1>;
d8664979e6ba97 arch/arm/boot/dts/qcom-apq8084.dtsi      Lina Iyer           2015-03-25   49  			cpu-idle-states = <&CPU_SPC>;
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23   50  		};
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23   51  
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23   52  		cpu@2 {
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23   53  			device_type = "cpu";
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23   54  			compatible = "qcom,krait";
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23   55  			reg = <2>;
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23   56  			enable-method = "qcom,kpss-acc-v2";
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23   57  			next-level-cache = <&L2>;
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23   58  			qcom,acc = <&acc2>;
030e27f6c60d37 arch/arm/boot/dts/qcom-apq8084.dtsi      Lina Iyer           2015-03-25   59  			qcom,saw = <&saw2>;
d8664979e6ba97 arch/arm/boot/dts/qcom-apq8084.dtsi      Lina Iyer           2015-03-25   60  			cpu-idle-states = <&CPU_SPC>;
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23   61  		};
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23   62  
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23   63  		cpu@3 {
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23   64  			device_type = "cpu";
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23   65  			compatible = "qcom,krait";
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23   66  			reg = <3>;
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23   67  			enable-method = "qcom,kpss-acc-v2";
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23   68  			next-level-cache = <&L2>;
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23   69  			qcom,acc = <&acc3>;
030e27f6c60d37 arch/arm/boot/dts/qcom-apq8084.dtsi      Lina Iyer           2015-03-25   70  			qcom,saw = <&saw3>;
d8664979e6ba97 arch/arm/boot/dts/qcom-apq8084.dtsi      Lina Iyer           2015-03-25   71  			cpu-idle-states = <&CPU_SPC>;
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23   72  		};
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23   73  
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23   74  		L2: l2-cache {
891bcfe02470c7 arch/arm/boot/dts/qcom-apq8084.dtsi      Luca Weiss          2022-10-13   75  			compatible = "cache";
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23   76  			cache-level = <2>;
925a80af6106a5 arch/arm/boot/dts/qcom-apq8084.dtsi      Krzysztof Kozlowski 2023-04-16   77  			cache-unified;
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23   78  			qcom,saw = <&saw_l2>;
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23   79  		};
d8664979e6ba97 arch/arm/boot/dts/qcom-apq8084.dtsi      Lina Iyer           2015-03-25   80  
d8664979e6ba97 arch/arm/boot/dts/qcom-apq8084.dtsi      Lina Iyer           2015-03-25   81  		idle-states {
e48919dc1ed568 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi David Heidelberg    2023-12-03   82  			CPU_SPC: cpu-spc {
d8664979e6ba97 arch/arm/boot/dts/qcom-apq8084.dtsi      Lina Iyer           2015-03-25   83  				compatible = "qcom,idle-state-spc",
d8664979e6ba97 arch/arm/boot/dts/qcom-apq8084.dtsi      Lina Iyer           2015-03-25   84  						"arm,idle-state";
d8664979e6ba97 arch/arm/boot/dts/qcom-apq8084.dtsi      Lina Iyer           2015-03-25   85  				entry-latency-us = <150>;
d8664979e6ba97 arch/arm/boot/dts/qcom-apq8084.dtsi      Lina Iyer           2015-03-25   86  				exit-latency-us = <200>;
d8664979e6ba97 arch/arm/boot/dts/qcom-apq8084.dtsi      Lina Iyer           2015-03-25   87  				min-residency-us = <2000>;
d8664979e6ba97 arch/arm/boot/dts/qcom-apq8084.dtsi      Lina Iyer           2015-03-25   88  			};
d8664979e6ba97 arch/arm/boot/dts/qcom-apq8084.dtsi      Lina Iyer           2015-03-25   89  		};
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23   90  	};
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23   91  
abe60a3a7afb40 arch/arm/boot/dts/qcom-apq8084.dtsi      Rob Herring         2019-01-09   92  	memory {
abe60a3a7afb40 arch/arm/boot/dts/qcom-apq8084.dtsi      Rob Herring         2019-01-09   93  		device_type = "memory";
abe60a3a7afb40 arch/arm/boot/dts/qcom-apq8084.dtsi      Rob Herring         2019-01-09   94  		reg = <0x0 0x0>;
abe60a3a7afb40 arch/arm/boot/dts/qcom-apq8084.dtsi      Rob Herring         2019-01-09   95  	};
abe60a3a7afb40 arch/arm/boot/dts/qcom-apq8084.dtsi      Rob Herring         2019-01-09   96  
2b9b54666caba3 arch/arm/boot/dts/qcom-apq8084.dtsi      Andy Gross          2016-06-03   97  	firmware {
2b9b54666caba3 arch/arm/boot/dts/qcom-apq8084.dtsi      Andy Gross          2016-06-03   98  		scm {
363c1b04cfce56 arch/arm/boot/dts/qcom-apq8084.dtsi      David Heidelberg    2022-06-26   99  			compatible = "qcom,scm-apq8084", "qcom,scm";
2b9b54666caba3 arch/arm/boot/dts/qcom-apq8084.dtsi      Andy Gross          2016-06-03  100  			clocks = <&gcc GCC_CE1_CLK> , <&gcc GCC_CE1_AXI_CLK>, <&gcc GCC_CE1_AHB_CLK>;
2b9b54666caba3 arch/arm/boot/dts/qcom-apq8084.dtsi      Andy Gross          2016-06-03  101  			clock-names = "core", "bus", "iface";
2b9b54666caba3 arch/arm/boot/dts/qcom-apq8084.dtsi      Andy Gross          2016-06-03  102  		};
2b9b54666caba3 arch/arm/boot/dts/qcom-apq8084.dtsi      Andy Gross          2016-06-03  103  	};
2b9b54666caba3 arch/arm/boot/dts/qcom-apq8084.dtsi      Andy Gross          2016-06-03  104  
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  105  	thermal-zones {
88542b1d37dc8e arch/arm/boot/dts/qcom-apq8084.dtsi      David Heidelberg    2021-10-20  106  		cpu0-thermal {
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  107  			polling-delay-passive = <250>;
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  108  			polling-delay = <1000>;
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  109  
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  110  			thermal-sensors = <&tsens 5>;
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  111  
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  112  			trips {
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  113  				cpu_alert0: trip0 {
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  114  					temperature = <75000>;
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  115  					hysteresis = <2000>;
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  116  					type = "passive";
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  117  				};
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  118  				cpu_crit0: trip1 {
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  119  					temperature = <110000>;
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  120  					hysteresis = <2000>;
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  121  					type = "critical";
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  122  				};
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  123  			};
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  124  		};
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  125  
88542b1d37dc8e arch/arm/boot/dts/qcom-apq8084.dtsi      David Heidelberg    2021-10-20  126  		cpu1-thermal {
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  127  			polling-delay-passive = <250>;
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  128  			polling-delay = <1000>;
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  129  
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  130  			thermal-sensors = <&tsens 6>;
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  131  
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  132  			trips {
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  133  				cpu_alert1: trip0 {
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  134  					temperature = <75000>;
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  135  					hysteresis = <2000>;
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  136  					type = "passive";
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  137  				};
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  138  				cpu_crit1: trip1 {
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  139  					temperature = <110000>;
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  140  					hysteresis = <2000>;
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  141  					type = "critical";
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  142  				};
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  143  			};
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  144  		};
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  145  
88542b1d37dc8e arch/arm/boot/dts/qcom-apq8084.dtsi      David Heidelberg    2021-10-20  146  		cpu2-thermal {
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  147  			polling-delay-passive = <250>;
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  148  			polling-delay = <1000>;
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  149  
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  150  			thermal-sensors = <&tsens 7>;
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  151  
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  152  			trips {
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  153  				cpu_alert2: trip0 {
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  154  					temperature = <75000>;
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  155  					hysteresis = <2000>;
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  156  					type = "passive";
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  157  				};
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  158  				cpu_crit2: trip1 {
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  159  					temperature = <110000>;
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  160  					hysteresis = <2000>;
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  161  					type = "critical";
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  162  				};
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  163  			};
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  164  		};
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  165  
88542b1d37dc8e arch/arm/boot/dts/qcom-apq8084.dtsi      David Heidelberg    2021-10-20  166  		cpu3-thermal {
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  167  			polling-delay-passive = <250>;
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  168  			polling-delay = <1000>;
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  169  
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  170  			thermal-sensors = <&tsens 8>;
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  171  
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  172  			trips {
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  173  				cpu_alert3: trip0 {
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  174  					temperature = <75000>;
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  175  					hysteresis = <2000>;
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  176  					type = "passive";
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  177  				};
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  178  				cpu_crit3: trip1 {
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  179  					temperature = <110000>;
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  180  					hysteresis = <2000>;
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  181  					type = "critical";
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  182  				};
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  183  			};
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  184  		};
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  185  	};
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  186  
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23  187  	cpu-pmu {
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23  188  		compatible = "qcom,krait-pmu";
ced44b9da52d45 arch/arm/boot/dts/qcom-apq8084.dtsi      Victhor Foster      2019-12-22  189  		interrupts = <GIC_PPI 7 0xf04>;
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23  190  	};
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23  191  
30fc4212d54175 arch/arm/boot/dts/qcom-apq8084.dtsi      Stephen Boyd        2016-01-06  192  	clocks {
a91b2e690d4094 arch/arm/boot/dts/qcom-apq8084.dtsi      Ritesh Harjani      2016-11-21  193  		xo_board: xo_board {
30fc4212d54175 arch/arm/boot/dts/qcom-apq8084.dtsi      Stephen Boyd        2016-01-06  194  			compatible = "fixed-clock";
30fc4212d54175 arch/arm/boot/dts/qcom-apq8084.dtsi      Stephen Boyd        2016-01-06  195  			#clock-cells = <0>;
30fc4212d54175 arch/arm/boot/dts/qcom-apq8084.dtsi      Stephen Boyd        2016-01-06  196  			clock-frequency = <19200000>;
30fc4212d54175 arch/arm/boot/dts/qcom-apq8084.dtsi      Stephen Boyd        2016-01-06  197  		};
30fc4212d54175 arch/arm/boot/dts/qcom-apq8084.dtsi      Stephen Boyd        2016-01-06  198  
a91b2e690d4094 arch/arm/boot/dts/qcom-apq8084.dtsi      Ritesh Harjani      2016-11-21  199  		sleep_clk: sleep_clk {
30fc4212d54175 arch/arm/boot/dts/qcom-apq8084.dtsi      Stephen Boyd        2016-01-06  200  			compatible = "fixed-clock";
30fc4212d54175 arch/arm/boot/dts/qcom-apq8084.dtsi      Stephen Boyd        2016-01-06  201  			#clock-cells = <0>;
30fc4212d54175 arch/arm/boot/dts/qcom-apq8084.dtsi      Stephen Boyd        2016-01-06  202  			clock-frequency = <32768>;
30fc4212d54175 arch/arm/boot/dts/qcom-apq8084.dtsi      Stephen Boyd        2016-01-06  203  		};
30fc4212d54175 arch/arm/boot/dts/qcom-apq8084.dtsi      Stephen Boyd        2016-01-06  204  	};
30fc4212d54175 arch/arm/boot/dts/qcom-apq8084.dtsi      Stephen Boyd        2016-01-06  205  
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23  206  	timer {
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23  207  		compatible = "arm,armv7-timer";
ced44b9da52d45 arch/arm/boot/dts/qcom-apq8084.dtsi      Victhor Foster      2019-12-22  208  		interrupts = <GIC_PPI 2 0xf08>,
ced44b9da52d45 arch/arm/boot/dts/qcom-apq8084.dtsi      Victhor Foster      2019-12-22  209  			     <GIC_PPI 3 0xf08>,
ced44b9da52d45 arch/arm/boot/dts/qcom-apq8084.dtsi      Victhor Foster      2019-12-22  210  			     <GIC_PPI 4 0xf08>,
ced44b9da52d45 arch/arm/boot/dts/qcom-apq8084.dtsi      Victhor Foster      2019-12-22  211  			     <GIC_PPI 1 0xf08>;
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23  212  		clock-frequency = <19200000>;
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23  213  	};
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23  214  
64ab88638af03b arch/arm/boot/dts/qcom-apq8084.dtsi      Andy Gross          2015-09-24  215  	smem {
64ab88638af03b arch/arm/boot/dts/qcom-apq8084.dtsi      Andy Gross          2015-09-24  216  		compatible = "qcom,smem";
64ab88638af03b arch/arm/boot/dts/qcom-apq8084.dtsi      Andy Gross          2015-09-24  217  
64ab88638af03b arch/arm/boot/dts/qcom-apq8084.dtsi      Andy Gross          2015-09-24  218  		qcom,rpm-msg-ram = <&rpm_msg_ram>;
64ab88638af03b arch/arm/boot/dts/qcom-apq8084.dtsi      Andy Gross          2015-09-24  219  		memory-region = <&smem_mem>;
64ab88638af03b arch/arm/boot/dts/qcom-apq8084.dtsi      Andy Gross          2015-09-24  220  
64ab88638af03b arch/arm/boot/dts/qcom-apq8084.dtsi      Andy Gross          2015-09-24  221  		hwlocks = <&tcsr_mutex 3>;
64ab88638af03b arch/arm/boot/dts/qcom-apq8084.dtsi      Andy Gross          2015-09-24  222  	};
64ab88638af03b arch/arm/boot/dts/qcom-apq8084.dtsi      Andy Gross          2015-09-24  223  
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23  224  	soc: soc {
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23  225  		#address-cells = <1>;
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23  226  		#size-cells = <1>;
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23  227  		ranges;
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23  228  		compatible = "simple-bus";
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23  229  
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23  230  		intc: interrupt-controller@f9000000 {
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23  231  			compatible = "qcom,msm-qgic2";
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23  232  			interrupt-controller;
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23  233  			#interrupt-cells = <3>;
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23  234  			reg = <0xf9000000 0x1000>,
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23  235  			      <0xf9002000 0x1000>;
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23  236  		};
975fd0f6c3932b arch/arm/boot/dts/qcom-apq8084.dtsi      Georgi Djakov       2014-05-23  237  
53ced99d70c422 arch/arm/boot/dts/qcom-apq8084.dtsi      Andy Gross          2015-09-24  238  		apcs: syscon@f9011000 {
53ced99d70c422 arch/arm/boot/dts/qcom-apq8084.dtsi      Andy Gross          2015-09-24  239  			compatible = "syscon";
53ced99d70c422 arch/arm/boot/dts/qcom-apq8084.dtsi      Andy Gross          2015-09-24  240  			reg = <0xf9011000 0x1000>;
53ced99d70c422 arch/arm/boot/dts/qcom-apq8084.dtsi      Andy Gross          2015-09-24  241  		};
53ced99d70c422 arch/arm/boot/dts/qcom-apq8084.dtsi      Andy Gross          2015-09-24  242  
2850335673378a arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2022-07-26  243  		sram@fc190000 {
2850335673378a arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2022-07-26  244  			compatible = "qcom,apq8084-rpm-stats";
2850335673378a arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2022-07-26  245  			reg = <0xfc190000 0x10000>;
2850335673378a arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2022-07-26  246  		};
2850335673378a arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2022-07-26  247  
81fc54e62b5b39 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi Krzysztof Kozlowski 2024-06-23  248  		qfprom: efuse@fc4bc000 {
aaed15efce65c2 arch/arm/boot/dts/qcom-apq8084.dtsi      Krzysztof Kozlowski 2022-05-05  249  			compatible = "qcom,apq8084-qfprom", "qcom,qfprom";
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  250  			reg = <0xfc4bc000 0x1000>;
10193ad6d487e0 arch/arm/boot/dts/qcom-apq8084.dtsi      Krzysztof Kozlowski 2022-05-05  251  			#address-cells = <1>;
10193ad6d487e0 arch/arm/boot/dts/qcom-apq8084.dtsi      Krzysztof Kozlowski 2022-05-05  252  			#size-cells = <1>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  253  
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  254  			tsens_base1: base1@d0 {
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  255  				reg = <0xd0 0x1>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  256  				bits = <0 8>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  257  			};
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  258  
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  259  			tsens_s0_p1: s0-p1@d1 {
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  260  				reg = <0xd1 0x1>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  261  				bits = <0 6>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  262  			};
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  263  
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  264  			tsens_s1_p1: s1-p1@d2 {
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  265  				reg = <0xd1 0x2>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  266  				bits = <6 6>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  267  			};
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  268  
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  269  			tsens_s2_p1: s2-p1@d2 {
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  270  				reg = <0xd2 0x2>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  271  				bits = <4 6>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  272  			};
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  273  
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  274  			tsens_s3_p1: s3-p1@d3 {
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  275  				reg = <0xd3 0x1>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  276  				bits = <2 6>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  277  			};
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  278  
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  279  			tsens_s4_p1: s4-p1@d4 {
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  280  				reg = <0xd4 0x1>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  281  				bits = <0 6>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  282  			};
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  283  
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  284  			tsens_s5_p1: s5-p1@d4 {
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  285  				reg = <0xd4 0x2>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  286  				bits = <6 6>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  287  			};
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  288  
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  289  			tsens_s6_p1: s6-p1@d5 {
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  290  				reg = <0xd5 0x2>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  291  				bits = <4 6>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  292  			};
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  293  
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  294  			tsens_s7_p1: s7-p1@d6 {
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  295  				reg = <0xd6 0x1>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  296  				bits = <2 6>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  297  			};
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  298  
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  299  			tsens_s8_p1: s8-p1@d7 {
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  300  				reg = <0xd7 0x1>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  301  				bits = <0 6>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  302  			};
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  303  
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  304  			tsens_mode: mode@d7 {
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  305  				reg = <0xd7 0x1>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  306  				bits = <6 2>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  307  			};
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  308  
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01 @309  			tsens_s9_p1: s9-p1@d8 {
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  310  				reg = <0xd8 0x1>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  311  				bits = <0 6>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  312  			};
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  313  
157b4744263bd5 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi Krzysztof Kozlowski 2024-09-05  314  			tsens_s10_p1: s10-p1@d8 {
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  315  				reg = <0xd8 0x2>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  316  				bits = <6 6>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  317  			};
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  318  
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  319  			tsens_base2: base2@d9 {
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  320  				reg = <0xd9 0x2>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  321  				bits = <4 8>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  322  			};
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  323  
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  324  			tsens_s0_p2: s0-p2@da {
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  325  				reg = <0xda 0x2>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  326  				bits = <4 6>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  327  			};
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  328  
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  329  			tsens_s1_p2: s1-p2@db {
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  330  				reg = <0xdb 0x1>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  331  				bits = <2 6>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  332  			};
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  333  
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  334  			tsens_s2_p2: s2-p2@dc {
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  335  				reg = <0xdc 0x1>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  336  				bits = <0 6>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  337  			};
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  338  
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  339  			tsens_s3_p2: s3-p2@dc {
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  340  				reg = <0xdc 0x2>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  341  				bits = <6 6>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  342  			};
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  343  
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  344  			tsens_s4_p2: s4-p2@dd {
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  345  				reg = <0xdd 0x2>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  346  				bits = <4 6>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  347  			};
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  348  
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  349  			tsens_s5_p2: s5-p2@de {
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  350  				reg = <0xde 0x2>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  351  				bits = <2 6>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  352  			};
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  353  
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  354  			tsens_s6_p2: s6-p2@df {
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  355  				reg = <0xdf 0x1>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  356  				bits = <0 6>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  357  			};
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  358  
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  359  			tsens_s7_p2: s7-p2@e0 {
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  360  				reg = <0xe0 0x1>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  361  				bits = <0 6>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  362  			};
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  363  
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  364  			tsens_s8_p2: s8-p2@e0 {
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  365  				reg = <0xe0 0x2>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  366  				bits = <6 6>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  367  			};
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  368  
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  369  			tsens_s9_p2: s9-p2@e1 {
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  370  				reg = <0xe1 0x2>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  371  				bits = <4 6>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  372  			};
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  373  
157b4744263bd5 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi Krzysztof Kozlowski 2024-09-05  374  			tsens_s10_p2: s10-p2@e2 {
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  375  				reg = <0xe2 0x2>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  376  				bits = <2 6>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  377  			};
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  378  
157b4744263bd5 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi Krzysztof Kozlowski 2024-09-05 @379  			tsens_s5_p2_backup: s5-p2-backup@e3 {
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  380  				reg = <0xe3 0x2>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  381  				bits = <0 6>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  382  			};
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  383  
157b4744263bd5 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi Krzysztof Kozlowski 2024-09-05  384  			tsens_mode_backup: mode-backup@e3 {
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  385  				reg = <0xe3 0x1>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  386  				bits = <6 2>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  387  			};
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  388  
157b4744263bd5 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi Krzysztof Kozlowski 2024-09-05 @389  			tsens_s6_p2_backup: s6-p2-backup@e4 {
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  390  				reg = <0xe4 0x1>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  391  				bits = <0 6>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  392  			};
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  393  
157b4744263bd5 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi Krzysztof Kozlowski 2024-09-05  394  			tsens_s7_p2_backup: s7-p2-backup@e4 {
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  395  				reg = <0xe4 0x2>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  396  				bits = <6 6>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  397  			};
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  398  
157b4744263bd5 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi Krzysztof Kozlowski 2024-09-05  399  			tsens_s8_p2_backup: s8-p2-backup@e5 {
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  400  				reg = <0xe5 0x2>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  401  				bits = <4 6>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  402  			};
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  403  
157b4744263bd5 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi Krzysztof Kozlowski 2024-09-05  404  			tsens_s9_p2_backup: s9-p2-backup@e6 {
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  405  				reg = <0xe6 0x2>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  406  				bits = <2 6>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  407  			};
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  408  
157b4744263bd5 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi Krzysztof Kozlowski 2024-09-05  409  			tsens_s10_p2_backup: s10-p2-backup@e7 {
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  410  				reg = <0xe7 0x1>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  411  				bits = <0 6>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  412  			};
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  413  
157b4744263bd5 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi Krzysztof Kozlowski 2024-09-05  414  			tsens_base1_backup: base1-backup@440 {
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  415  				reg = <0x440 0x1>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  416  				bits = <0 8>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  417  			};
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  418  
157b4744263bd5 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi Krzysztof Kozlowski 2024-09-05  419  			tsens_s0_p1_backup: s0-p1-backup@441 {
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  420  				reg = <0x441 0x1>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  421  				bits = <0 6>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  422  			};
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  423  
157b4744263bd5 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi Krzysztof Kozlowski 2024-09-05 @424  			tsens_s1_p1_backup: s1-p1-backup@442 {
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  425  				reg = <0x441 0x2>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  426  				bits = <6 6>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  427  			};
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  428  
157b4744263bd5 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi Krzysztof Kozlowski 2024-09-05  429  			tsens_s2_p1_backup: s2-p1-backup@442 {
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  430  				reg = <0x442 0x2>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  431  				bits = <4 6>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  432  			};
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  433  
157b4744263bd5 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi Krzysztof Kozlowski 2024-09-05  434  			tsens_s3_p1_backup: s3-p1-backup@443 {
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  435  				reg = <0x443 0x1>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  436  				bits = <2 6>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  437  			};
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  438  
157b4744263bd5 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi Krzysztof Kozlowski 2024-09-05 @439  			tsens_s4_p1_backup: s4-p1-backup@444 {
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  440  				reg = <0x444 0x1>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  441  				bits = <0 6>;
226366b95a95f8 arch/arm/boot/dts/qcom-apq8084.dtsi      Rajendra Nayak      2016-08-17  442  			};
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  443  
157b4744263bd5 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi Krzysztof Kozlowski 2024-09-05  444  			tsens_s5_p1_backup: s5-p1-backup@444 {
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  445  				reg = <0x444 0x2>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  446  				bits = <6 6>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  447  			};
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  448  
157b4744263bd5 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi Krzysztof Kozlowski 2024-09-05  449  			tsens_s6_p1_backup: s6-p1-backup@445 {
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  450  				reg = <0x445 0x2>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  451  				bits = <4 6>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  452  			};
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  453  
157b4744263bd5 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi Krzysztof Kozlowski 2024-09-05  454  			tsens_s7_p1_backup: s7-p1-backup@446 {
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  455  				reg = <0x446 0x1>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  456  				bits = <2 6>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  457  			};
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  458  
157b4744263bd5 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi Krzysztof Kozlowski 2024-09-05  459  			tsens_use_backup: use-backup@447 {
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  460  				reg = <0x447 0x1>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  461  				bits = <5 3>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  462  			};
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  463  
157b4744263bd5 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi Krzysztof Kozlowski 2024-09-05 @464  			tsens_s8_p1_backup: s8-p1-backup@448 {
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  465  				reg = <0x448 0x1>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  466  				bits = <0 6>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  467  			};
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  468  
157b4744263bd5 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi Krzysztof Kozlowski 2024-09-05  469  			tsens_s9_p1_backup: s9-p1-backup@448 {
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  470  				reg = <0x448 0x2>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  471  				bits = <6 6>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  472  			};
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  473  
157b4744263bd5 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi Krzysztof Kozlowski 2024-09-05  474  			tsens_s10_p1_backup: s10-p1-backup@449 {
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  475  				reg = <0x449 0x2>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  476  				bits = <4 6>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  477  			};
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  478  
157b4744263bd5 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi Krzysztof Kozlowski 2024-09-05  479  			tsens_base2_backup: base2-backup@44a {
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  480  				reg = <0x44a 0x2>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  481  				bits = <2 8>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  482  			};
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  483  
157b4744263bd5 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi Krzysztof Kozlowski 2024-09-05  484  			tsens_s0_p2_backup: s0-p2-backup@44b {
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  485  				reg = <0x44b 0x3>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  486  				bits = <2 6>;
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  487  			};
1283b2e61a7a20 arch/arm/boot/dts/qcom-apq8084.dtsi      Dmitry Baryshkov    2023-01-01  488  
157b4744263bd5 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi Krzysztof Kozlowski 2024-09-05 @489  			tsens_s1_p2_backup: s1-p2-backup@44c {

:::::: The code at line 309 was first introduced by commit
:::::: 1283b2e61a7a2064e71f50f3f0821d6e56ced920 ARM: dts: qcom-apq8084: specify per-sensor calibration cells

:::::: TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
:::::: CC: Bjorn Andersson <andersson@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
