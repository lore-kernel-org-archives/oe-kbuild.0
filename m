Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD84367B63
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Jul 2026 08:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785398906; cv=none; b=eR7itKLsCYrcCgizsCQE4wbmkPU8ESiHIDKviOgO0MwFp8+NQPmzK6G0xzTLOE5FN7jLgMLB0lkskOWmghI2aD5fWO6KGcpFof2fe6wFlCk76SfCDhU9ZPHqJSbJgJdBSXPlCCUp8VMzl5A/P6cM+q7XEictPUM0qjIemEbyvuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785398906; c=relaxed/simple;
	bh=2Qzq29OanK6HMAUByfxEXtYlq5PIw4EvRykvO8R9eng=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XfJtSd8BsvoZ6eOEqy1OI4j3kWrZ4McoEsl2c6IiEqZs8fRTwPxJC0OTsXea39OUVfJ8Bd/JTBZo2Nk7ISxjnT/T+gAc4cMr6cthroM7jC7NPkU7V1QRYgftNjqM2S4zPT/9PqFxgxMKEw2QA5dB5+O98cEmIPATt77pbtpaDZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GZQKpc+y; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GZQKpc+y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785398904; x=1816934904;
  h=date:from:to:cc:subject:message-id;
  bh=2Qzq29OanK6HMAUByfxEXtYlq5PIw4EvRykvO8R9eng=;
  b=GZQKpc+yTU0bnxPcupLRrizmfy3ByCc7sGosfkto3POqq1sqzKQvYoat
   /Ood1xqWPeiNZRzcN/E3KcKFmHqt7VPhJNgFRMSkYNtFc6iQnWKJu7Cuq
   VHwSL/AYWXN0dKE46bVcmVXth/NEgftSW4sRCEgGf4+rlal2YIou74+LI
   oM+bYAxKvHrgc8sHAROL0xVVGoik1Mw458Gq3rMiY4FIW41rB0mqCnkGk
   106uIpludt8xVVwpbOmiY8Z4M1nyMtbkBNBWil+Jw2g/MQSnHCYAcYyef
   BJGXl4IJwmtHwLXJX25jhiyXu9x6QZXwMogk1ZTPKd4Gi42G6boPhlevb
   w==;
X-CSE-ConnectionGUID: /BSYCA3zRXW5DW0S5K6MIw==
X-CSE-MsgGUID: Q22OXuyFTg2i7IGWzXE/AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="97387558"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="97387558"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 01:08:23 -0700
X-CSE-ConnectionGUID: jZrLJ6o1QS2TWpTBXcEzxA==
X-CSE-MsgGUID: gBv/WcFdTI2eqgQDFdtY7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="256900628"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 30 Jul 2026 01:08:23 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpLoS-000000002La-3eLw;
	Thu, 30 Jul 2026 08:08:20 +0000
Date: Thu, 30 Jul 2026 10:07:27 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v7.3-armsoc/dts64 35/50]
 arch/arm64/boot/dts/rockchip/rk3588-vicharak-vaaman2.dtb: edp@fdec0000
 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
Message-ID: <202607301023.3DKLgg68-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
TO: Hrushiraj Gandhi <hrushirajg23@gmail.com>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v7.3-armsoc/dts64
head:   6d9430d58714909071853c0949cdc93756aa3ad4
commit: 896e4c4508b66f9b4c9ff12b536bd1a031621aa5 [35/50] arm64: dts: rockchip: Add Vicharak Vaaman2 board
:::::: branch date: 16 hours ago
:::::: commit date: 6 days ago
config: arm64-randconfig-2055-20260729 (https://download.01.org/0day-ci/archive/20260730/202607301023.3DKLgg68-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260730/202607301023.3DKLgg68-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607301023.3DKLgg68-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3588-vicharak-vaaman2.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-vicharak-vaaman2.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
