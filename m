Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1034611E5
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Aug 2026 16:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786725767; cv=none; b=PwN6E+traryZVBHX2bav7hqBaBMb0nj25Ierg5U8oY8m6hdPb/XguAaSj9rN4QKhB7ojxPuKvTF6KdeiE9PVE0qdFr/qYLD70QNBlXAdRHEjbR10eBB7rKmdlxSq1tv2wqt1HVAcVu6U4HzF7q2w14VxuF/hNDKNDg773jrtin0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786725767; c=relaxed/simple;
	bh=G6Fgb8PhGyZQ+fvOyfRHvho2cW0CuA2xHdWsh94ph6I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=n/ZGHgeF4d3x4XwiiXF66hKllEdaz0Z74XxMxyuo7aWyL/YzkgBUm2raNqOHLSYyHDk5Ow6LcT2slocVcVt4vYyakVwg5NXYlr7tTy/SNsv6VdML0X88/w7iA4DTlKCctKm0xMR7p+L45iXUfvU/5UswQM0tXlQmX5VyFNBpv9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JtYyPsOP; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JtYyPsOP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786725765; x=1818261765;
  h=date:from:to:cc:subject:message-id;
  bh=G6Fgb8PhGyZQ+fvOyfRHvho2cW0CuA2xHdWsh94ph6I=;
  b=JtYyPsOP9MogAobKlg0jW62h50PXvsOIYEfamOOV1Zh1fmYXxpGq75Q+
   OOEdT4hi2OL+kxzB12djOG0ytidxFP5firmMOotjeEx4CVyddou3L4XLD
   aTV/7fyZ5IKO0nxtVV0NFZ670NDtd7mcbaCXox2owrQBpBw3kAO3YsYxf
   JqF6p/E+6ytiA3ew/nkSFMzGH98CdoURGhaQDZIC8eLerYEZsOXDrWoe0
   7K1CRwZ8JEowxLu/L8CBBHblRQVXPNbd+JohyZp5o2yPNaAwegpjGE6/O
   HujtLMLdNKeqNn6JngtFDH+QaPvkH5t1Hjd4ONB7PSf8i5maCWHwmagx7
   Q==;
X-CSE-ConnectionGUID: mxnZHftETjGc5vMc9L5j/A==
X-CSE-MsgGUID: wZ0bGUhvTU+5KbRg7D4IBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="110091700"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="110091700"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 09:42:44 -0700
X-CSE-ConnectionGUID: fxRhA16zRuGP84bcl4a3VQ==
X-CSE-MsgGUID: H+Df4EUMS1ihKQu7KMW2uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="264312384"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 14 Aug 2026 09:42:44 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuuzS-000000006IT-06Tz;
	Fri, 14 Aug 2026 16:42:42 +0000
Date: Fri, 14 Aug 2026 18:42:03 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/rockchip/rk3399-rockpro64-screen.dtb:
 typec-portc@22 (fcs,fusb302): 'connector' is a required property
Message-ID: <202608141853.p9X5gseK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Peter Robinson <pbrobinson@gmail.com>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2f1baf1fc8929e6c48370be543ad028ac7ad4131
commit: e14491aaa6ff598bbe9d462e44c01ac65754f445 arm64: dts: rockchip: add overlay for RockPro64 screen
date:   1 year, 2 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 1 year, 2 months ago
config: arm64-randconfig-2054-20260813 (https://download.01.org/0day-ci/archive/20260814/202608141853.p9X5gseK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260814/202608141853.p9X5gseK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e14491aaa6ff ("arm64: dts: rockchip: add overlay for RockPro64 screen")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608141853.p9X5gseK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3399-rockpro64-screen.dtb: typec-portc@22 (fcs,fusb302): 'connector' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml
   arch/arm64/boot/dts/rockchip/rk3399-rockpro64-screen.dtb: spdif-dit (linux,spdif-dit): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/linux,spdif.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2-screen.dtb: typec-portc@22 (fcs,fusb302): 'connector' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml
   arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2-screen.dtb: spdif-dit (linux,spdif-dit): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/linux,spdif.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
