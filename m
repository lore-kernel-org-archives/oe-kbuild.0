Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E262E3704
	for <oe-kbuild@lists.linux.dev>; Sun,  6 Jul 2025 04:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751775553; cv=none; b=L8d5rTRo8RxHqtyrKi4QR6DSCo8/9Xz+k0c0rNjxfoQkGqEsOl36HiTBz56l2HQ2rN3wipf0eRyfJBK4iNhiHKgZ4e9ZrswF1aanK86wd+yzn2mzgFsGUsj1zjFBGkP1Oz7t0/G3sxvZ3HfrG/sp3cOd0CU8u905ze+7TU8ts4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751775553; c=relaxed/simple;
	bh=XjS/ubZDDdtIfrSz7xlqP8FqPCSswTPK6IisGN4uNJE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qg8ZSdioKPfVEybDwepWUbZqN6TddxsuorG/NbeMb+dQTrngW84abqvnOFcwpalz0MbImDUIBDtEkIo2AI/pMny0qbx41FJmxaYQT3oeHU/oFV9pOQKGImjYcmxcJ3xc23W3UEahOP91t2x9+/XOOK/chvN8mD86ShMSVrHSdCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TMg9LAPn; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TMg9LAPn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751775551; x=1783311551;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XjS/ubZDDdtIfrSz7xlqP8FqPCSswTPK6IisGN4uNJE=;
  b=TMg9LAPnCPuSArA/SBBbOGkqJanrH6UsIXLNlN3nQQa83poZvrWBT3gD
   ns8cqQuzdxJ3hx15znGjfbyr7QVigvz+UFfDvVYEM/zrlXuciKYF5FS7F
   yxfugajPiB7xZ31Fpmtf+XueXBl4FdyPLIQbaWufsxrSGujFnlAZHcUda
   OwTOM8PiOgB5tsiUzBBjfDiRnHcLBUob9bH4vx+h/gbc43BVYmjQO5Few
   dLW8tkPAp4xDmpBPYQVdvEJHHU+7123x7cqHgFicf+ghybQ+VeDsYR6PX
   YHkO2k/csPsxdR+FbLS6+dUPHZwRBM1NbCFXufwqN/L8gieqQigIrokS1
   g==;
X-CSE-ConnectionGUID: w1L6+01kRK2NlCHwjgwTaA==
X-CSE-MsgGUID: B4ikTN6KS82s+ffU+aqWhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11485"; a="53159185"
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="53159185"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2025 21:19:10 -0700
X-CSE-ConnectionGUID: LBjp/5QuTZyvyhk0p30knw==
X-CSE-MsgGUID: rKWEBDiVRCm3kCgvgpvSIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="160590632"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 Jul 2025 21:19:09 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYGqI-0004sR-2T;
	Sun, 06 Jul 2025 04:19:06 +0000
Date: Sun, 6 Jul 2025 12:19:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sunxi:sunxi/dt-for-6.17 5/6]
 arch/arm64/boot/dts/allwinner/sun50i-a100-allwinner-perf1.dtb:
 ethernet@5020000 (allwinner,sun50i-a100-emac): compatible: 'oneOf'
 conditional failed, one must be fixed:
Message-ID: <202507061228.3YCvQ5Km-lkp@intel.com>
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
TO: Paul Kocialkowski <paulk@sys-base.io>
CC: "Chen-Yu Tsai" <wens@csie.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi/dt-for-6.17
head:   1c5f20ebc46d9cf5fd19c343537de15aeeda2d36
commit: ce51ff18daca21723f97d22477416418dcfca8dc [5/6] arm64: dts: allwinner: a100: Add EMAC support
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20250706 (https://download.01.org/0day-ci/archive/20250706/202507061228.3YCvQ5Km-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250706/202507061228.3YCvQ5Km-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507061228.3YCvQ5Km-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi:102.6-631.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-a100-allwinner-perf1.dtb: ethernet@5020000 (allwinner,sun50i-a100-emac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['allwinner,sun50i-a100-emac', 'allwinner,sun50i-a64-emac'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'allwinner,sun50i-a100-emac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-emac0']
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/allwinner/sun50i-a100-allwinner-perf1.dtb: /soc/ethernet@5020000: failed to match any schema with compatible: ['allwinner,sun50i-a100-emac', 'allwinner,sun50i-a64-emac']
--
   arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi:102.6-631.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dtb: ethernet@5020000 (allwinner,sun50i-a100-emac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['allwinner,sun50i-a100-emac', 'allwinner,sun50i-a64-emac'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'allwinner,sun50i-a100-emac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-emac0']
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dtb: /soc/ethernet@5020000: failed to match any schema with compatible: ['allwinner,sun50i-a100-emac', 'allwinner,sun50i-a64-emac']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
