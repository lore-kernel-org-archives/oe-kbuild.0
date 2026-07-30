Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063573B27FA
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Jul 2026 09:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785405566; cv=none; b=p1AgrXifQ1CdxyMyTayqGN32BSqMx595U+ZLp/vz2faZ5WQTyVovATOeGjyjyFTN6w/9liAf0ksji36/KMVoP8H2381QDHgfbhxGanGG5N+qYifjLb+oQDgjssxGmPHAU6VI6toEA3ef/k3xUKZ+hsxYhi+CfEmi1n0rXuSR/rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785405566; c=relaxed/simple;
	bh=r5+uxnMaHLs2wObvBwnxcHmosuW6nRaVewja2hjoT5Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CUwhwTrJ6F43tS3trb+/XNv0DRJYSxBa55RX1iZ75L88nrkddIQ8E+7Rh5xaXYJkkYQaF0p8/Y+JBgWGy12KMRkq3wWjlZYpMQEqXqedyTAYkcgofX+++vmfhuyv0scm331pisrW6ERSV06H0FrPJzaycTOewftclPBhJ4n9c9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W+TVjxMC; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W+TVjxMC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785405565; x=1816941565;
  h=date:from:to:cc:subject:message-id;
  bh=r5+uxnMaHLs2wObvBwnxcHmosuW6nRaVewja2hjoT5Q=;
  b=W+TVjxMCRmZSP6VDXaTEjPkPFyC4Ve5aGcohluBrC27cAKwcY4jji3BK
   R22RXTWj0GWz6ijcUCfLycvxOwJj0t3LHDpCx0v/baZ9FlrDc8C+IWaTy
   2L6Kk2ExO56ubFkz6o7068a/wA4r4kPvVbVzOGS704lL7UrILfkpX+zPI
   B/lzsptxEspxJvqBf6h+qN0PrGZG59ZFJYLllODlxLOdEwvxD6cQ7t3Vx
   KhuJeSzAoO1yVolG7OMhi6ijpek3nINAPtC7ABkgC6Np3UKnfJ6AGMM2P
   2SHALqlGQLG3j1BSW6Lv+lO9E8UM4Roarpt+3/OW6fbm6oVSDIBf63qkW
   w==;
X-CSE-ConnectionGUID: ROl1OcYFS4WvtEGCHP7T0g==
X-CSE-MsgGUID: cOsFgEzURj6pzs2kqUOMbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="108814040"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="108814040"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 02:59:24 -0700
X-CSE-ConnectionGUID: IVUwb4pJSkS9CnEqUbP+rg==
X-CSE-MsgGUID: 32emgGvDQvCKYYBzdAJ4cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="262209974"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 30 Jul 2026 02:59:23 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpNXt-000000002M0-2bEy;
	Thu, 30 Jul 2026 09:59:21 +0000
Date: Thu, 30 Jul 2026 11:59:10 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v7.3-armsoc/dts64 41/50]
 arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dtb: /soc/edp@27dc0000:
 failed to match any schema with compatible: ['rockchip,rk3576-edp']
Message-ID: <202607301111.qCZ8fceT-lkp@intel.com>
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
TO: Jiaxing Hu <gahing@gahingwoo.com>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v7.3-armsoc/dts64
head:   6d9430d58714909071853c0949cdc93756aa3ad4
commit: 44a48a23974b86d2c551afbabee15ad70b249df5 [41/50] arm64: dts: rockchip: Add ArmSoM CM5 and CM5-IO
:::::: branch date: 17 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2055-20260729 (https://download.01.org/0day-ci/archive/20260730/202607301111.qCZ8fceT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260730/202607301111.qCZ8fceT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607301111.qCZ8fceT-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dtb: /soc/edp@27dc0000: failed to match any schema with compatible: ['rockchip,rk3576-edp']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
