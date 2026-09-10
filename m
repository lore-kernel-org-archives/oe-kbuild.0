Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3984B4A3D3A
	for <oe-kbuild@lists.linux.dev>; Thu, 10 Sep 2026 15:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789055014; cv=none; b=ah88E0WJIpW1yZQtP5eHt1gzVMf1iqIkyPhms4fasHvmfb+LiCqOQKgRi1kyY+iPMPAL7vo2doizX32xL5OuxRuXLX5vNZdh+0LgkHpUOvmt16Ng7jto8Et00TLK0gGYYHcJU8IDdqPK41j29SiCXW4uMywBAkXTS6UEnC5IRKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789055014; c=relaxed/simple;
	bh=kq8Pld9WK+/3jAl6b7y9XIJjg0kkfPE+re8rNoFV6tQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BmJxSBU8nfvwBScQJzI6zIFsKglZoG7KHti8/rSckGSlHc3hEIeeuwYI4M0Bv3N3eh/QytBfXhiKvH5WS2bsWT6UJM6grQGTn8obFkCybF9H0z66POa7rc49XrasIHE4wSMxvfmSWz+aUCUambBJsect8kr3RkbBfgJX+v4n21I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D4CBS0/O; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D4CBS0/O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789055013; x=1820591013;
  h=date:from:to:cc:subject:message-id;
  bh=kq8Pld9WK+/3jAl6b7y9XIJjg0kkfPE+re8rNoFV6tQ=;
  b=D4CBS0/OiPTuonCYMvljNma4+zH2QRhRL0rvrrRhp6c/qsOwnJekZzl0
   J4Xesrx2wyI2t+kNRNVswXkiy2vcmMVw2iDmAaBmRSSCTggLep03Arolm
   FzaBMb6eIOYq05IDOboZXdjniyafl3ni44XwjkacVfFuJhqessel5ksJK
   x8c/EtGiMmogemnKVgpsO1kwUKcLXh8gDPpFQbknd+gaOOd4dzKDUdwxe
   NwcDy7k5yfU4HxoAeWSo2SbEjHX5LRNiN75CWrqkziM6lu0UhACGiO/68
   fWg4PsIh3a7HxWKDKRBPR159ry3USYymygclF3qhH20k7nkpn7eoosUVq
   A==;
X-CSE-ConnectionGUID: OD4Lmi+7S6Cki6c00OlTKQ==
X-CSE-MsgGUID: m4NvGLRmRgOWJC57FMIUgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="112280552"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="112280552"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 08:43:33 -0700
X-CSE-ConnectionGUID: ZJohYxgTS7K+7s9kGQRXFQ==
X-CSE-MsgGUID: rzY1IHEkS9C/SpX+vfP4zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="295152006"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 10 Sep 2026 08:43:32 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4gvx-000000000RB-2nLQ;
	Thu, 10 Sep 2026 15:43:29 +0000
Date: Thu, 10 Sep 2026 17:42:41 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt070tm041.dtb: /
 (skov,imx8mp-skov-revc-jutouch-jt070tm041): compatible: 'oneOf' conditional
 failed, one must be fixed:
Message-ID: <202609101414.jfH5bY42-lkp@intel.com>
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
TO: Steffen Trumtrar <s.trumtrar@pengutronix.de>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Steffen-Trumtrar/arm64-dts-freescale-imx8mp-skov-fix-sort-order/20260831-101738
head:   036120e16d67057ee45f6bc34cf6b121536434a5
commit: 036120e16d67057ee45f6bc34cf6b121536434a5 arm64: dts: imx8mp-skov: support new 7inch panel board
date:   10 days ago
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: arm64-randconfig-2055-20260907 (https://download.01.org/0day-ci/archive/20260910/202609101414.jfH5bY42-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project b1f20dd48e11439d5a592662b407e07d8213ffee)
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609101414.jfH5bY42-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609101414.jfH5bY42-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt070tm041.dtb: / (skov,imx8mp-skov-revc-jutouch-jt070tm041): compatible: 'oneOf' conditional failed, one must be fixed:
   	['skov,imx8mp-skov-revc-jutouch-jt070tm041', 'skov,imx8mp-skov-revc-touch', 'fsl,imx8mp'] is too long
   	['skov,imx8mp-skov-revc-jutouch-jt070tm041', 'skov,imx8mp-skov-revc-touch', 'fsl,imx8mp'] is too short
>> 	arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt070tm041.dtb: / (skov,imx8mp-skov-revc-jutouch-jt070tm041): compatible: 'oneOf' conditional failed, one must be fixed:
   		'skov,imx8mp-skov-revc-jutouch-jt070tm041' is not one of ['tq,imx8dxp-tqma8xdp-mba8xx']
   		'skov,imx8mp-skov-revc-jutouch-jt070tm041' is not one of ['tq,imx8qxp-tqma8xqp-mba8xx']
   		'tq,imx8dxp-tqma8xdp' was expected
   		'tq,imx8qxp-tqma8xqp' was expected
   		'fsl,imx8dxp' was expected
   		'fsl,imx8qxp' was expected
>> 	arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt070tm041.dtb: / (skov,imx8mp-skov-revc-jutouch-jt070tm041): compatible: 'oneOf' conditional failed, one must be fixed:
   		'skov,imx8mp-skov-revc-jutouch-jt070tm041' is not one of ['tq,imx8qxp-tqma8xqps-mb-smarc-2']
   		'skov,imx8mp-skov-revc-jutouch-jt070tm041' is not one of ['tq,imx8dxp-tqma8xdps-mb-smarc-2']
   		'tq,imx8qxp-tqma8xqps' was expected
   		'tq,imx8dxp-tqma8xdps' was expected
   		'fsl,imx8qxp' was expected
   		'fsl,imx8dxp' was expected
   	'skov,imx8mp-skov-revc-jutouch-jt070tm041' is not one of ['armadeus,imx1-apf9328', 'fsl,imx1ads']
   	'skov,imx8mp-skov-revc-jutouch-jt070tm041' is not one of ['creative,x-fi3', 'fsl,imx23-evk', 'fsl,stmp378x-devb', 'olimex,imx23-olinuxino', 'sandisk,sansa_fuze_plus']
   	'skov,imx8mp-skov-revc-jutouch-jt070tm041' is not one of ['fsl,imx25-pdk', 'karo,imx25-tx25']
   	'skov,imx8mp-skov-revc-jutouch-jt070tm041' is not one of ['eukrea,mbimxsd25-baseboard']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
