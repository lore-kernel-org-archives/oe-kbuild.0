Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A35E139D
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Dec 2024 00:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735000145; cv=none; b=a885ntbMTVUCHfS0RLXZfAKDVQEw7TxmNFTaPs0uZfUchTZqd3jFCRz38/YBfUfL9HYKverEe5eHBLJuc4oclTQ8e8eQLnhxz9nXPSuXjfHh1a9cVdVcytM/zywydAJNrNdswfjL9fy8A+7Tsu+E7S7e8i/IZsbP+Htz1JWiQFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735000145; c=relaxed/simple;
	bh=5cPJcj1h4+5ToqM1bt1V2WKEjn9XO2r8bcPp1f1oi2g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MkFkhJO46mBDjAHPs8qTUdXjQ54Gm5yLH17kwS0VgOak7kMEvGjbI5kNz2Ap2oMx7hYWV+vbhLkTmuO175xxclvE2UrbBZ4TEMTae+KMbx0YjPaulbbzkn9HVTUYBNT35efPyalMPG1zam1CZyMAVHCB8yD9vb4qlPMCyP1Pl+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=erD+t8D1; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="erD+t8D1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735000143; x=1766536143;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5cPJcj1h4+5ToqM1bt1V2WKEjn9XO2r8bcPp1f1oi2g=;
  b=erD+t8D1vU/Mu7apadYArAv7YoaPFlxyEjCH3FzwXz4a6ImyZzQuvsEc
   YsF1f3t0ehApP8Jsb1eAPoEqLypq3GA1Bd+nb3jHmZli91hwyp0mVFbrM
   9JxTTqR6YE+vT1dch39JgxSZwcoKIobw+MwEk0VcqfuyUnRSyM3wNYvai
   tl86R36REPyEj+77jmXzdbrV0GP3BcXp/WDUYbZrMETXW7I4oGMfUAmKb
   zlMkNIAIq3bnwd2PDMO+vW/BSpvX/tB2dMRb0suMEr0lUNyqPrfB/SzhF
   fvQ5CU3ARZTIvco4iO9Ao8RFUNtmUc6Dp4bK3/9oRPgbE7CGh5waP/aSH
   g==;
X-CSE-ConnectionGUID: 2NL5XPoITj62NN+Yi3FPLQ==
X-CSE-MsgGUID: 75Km3vskSFGmIYJpJyX7dA==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="35688596"
X-IronPort-AV: E=Sophos;i="6.12,258,1728975600"; 
   d="scan'208";a="35688596"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 16:29:02 -0800
X-CSE-ConnectionGUID: p2rnle4wTYWSFU+1Cf/uGA==
X-CSE-MsgGUID: OgxFlJozT6OIvY6VGyJ2ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100175043"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 23 Dec 2024 16:29:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPsnD-0000j5-1n;
	Tue, 24 Dec 2024 00:28:59 +0000
Date: Tue, 24 Dec 2024 08:28:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-integrator:b4/ixp4xx-netgear-wgr826v 3/9]
 arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wgr826v.dtb:
 /soc/usb@c800b000: failed to match any schema with compatible:
 ['intel,ixp4xx-udc']
Message-ID: <202412240834.kF73ILHS-lkp@intel.com>
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
TO: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/ixp4xx-netgear-wgr826v
head:   417131a0c509bba7b4db3f1301a0205ebb4ab0d6
commit: 6eb7bf44970b29ea5202340d81c9af406f0cf7c9 [3/9] ARM: dts: Add Netgear WGR826V Device Tree
:::::: branch date: 3 days ago
:::::: commit date: 2 weeks ago
config: arm-randconfig-051-20241221 (https://download.01.org/0day-ci/archive/20241224/202412240834.kF73ILHS-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241224/202412240834.kF73ILHS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412240834.kF73ILHS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wgr826v.dtb: ethernet@c800c000: 'intel,npe' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/intel,ixp4xx-ethernet.yaml#
>> arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wgr826v.dtb: /soc/usb@c800b000: failed to match any schema with compatible: ['intel,ixp4xx-udc']
>> arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wgr826v.dtb: /spi/switch@0: failed to match any schema with compatible: ['micrel,ks8995']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
