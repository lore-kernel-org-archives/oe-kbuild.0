Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CD078C73
	for <oe-kbuild@lists.linux.dev>; Mon,  8 Jul 2024 17:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720458456; cv=none; b=DZl8rx/3lKU+GpJu/TnOrpmo5qp9H74J1BHSbQvzz9ANkZxVq3bLBrItv3of2qMC1kKFCyXeMoNLN6e73HVCpMD33viinHXQBNBIhFYVK4jxHNGwjItgU/6JiNHO9TRkgVxbpbVTJV3WmgSyQ4UtDzq3hg+aUNEVsleyi2ROO30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720458456; c=relaxed/simple;
	bh=hEhl7VwdTxt6UEXTO3R+bGNXDJB4zox32sqeUC+Hg+M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n+51+oDWdz0zpsnhUZzHikBBVUG2bIcieXQd3WgU316nqI/iPEGm2v9O08kXXOT9qGkGHt+4SuQuHsFmmnEPB86+lZVpXYVgJ9vdouYGQpPIffSy4KUycMSPYrGtzJ/6Tviwc/0V/EpNPOZVhE57ZmAcgSbIOpS4PJJIwprAMdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cviXmgXL; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cviXmgXL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720458454; x=1751994454;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hEhl7VwdTxt6UEXTO3R+bGNXDJB4zox32sqeUC+Hg+M=;
  b=cviXmgXLY98//iCrILs3gagkjF7bRgWKf2nWOJPhXYaL8wliL95eIKHo
   7B2AMOIj6PTW4HYDBbJ5hcv27fxIlz9qM39nljyXxY2OKAt0+J6+kc7bS
   Wp2GvMlIvvBDoQirsz58vVedZG145IxGu+sVR6wF7Z48CxnI2w7tx1JjC
   f/JqNtB1SO3Pjvl3vNtgEVHdxMbEEULIa34aizzEYptyt6pticJgBWl1E
   nkGrtX8TY1enTCRwPpurR+A4DC2/f4mF+IlsoBtGXforr4146P8JqswbA
   Z0ZrWN3wosUbYJ5xUFFnK7hG6HcB7ZtADx6KfO4ET1OV52yWp+YsVKIQd
   w==;
X-CSE-ConnectionGUID: DAKmT22WTm+ZEInxM0ll1g==
X-CSE-MsgGUID: df7I1UhZSlqdBBpmTl+37Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="29072685"
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; 
   d="scan'208";a="29072685"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 10:07:34 -0700
X-CSE-ConnectionGUID: yfHIAuxpQYK8FWvFFtmNiw==
X-CSE-MsgGUID: /thaB1QgTJyPmQYHmiOMHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; 
   d="scan'208";a="47524581"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 08 Jul 2024 10:07:32 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQrpq-000VtM-1q;
	Mon, 08 Jul 2024 17:07:30 +0000
Date: Tue, 9 Jul 2024 01:07:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [soc:sunxi/dt 16/16]
 arch/riscv/boot/dts/allwinner/sun20i-d1-clockworkpi-v3.14.dtb:
 syscon@3000000: 'regulators@3000150' does not match any of the regexes:
 '^sram@[a-f0-9]+', 'pinctrl-[0-9]+'
Message-ID: <202407090156.fb9VmiVF-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
CC: arm@kernel.org
TO: Samuel Holland <samuel@sholland.org>
CC: "Chen-Yu Tsai" <wens@csie.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git sunxi/dt
head:   0ce1d34678e5d214746ee4887f9f7714c39e331f
commit: 0ce1d34678e5d214746ee4887f9f7714c39e331f [16/16] riscv: dts: allwinner: Add ClockworkPi and DevTerm devicetrees
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: riscv-randconfig-051-20240708 (https://download.01.org/0day-ci/archive/20240709/202407090156.fb9VmiVF-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407090156.fb9VmiVF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407090156.fb9VmiVF-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/allwinner/sun20i-d1-clockworkpi-v3.14.dtb: syscon@3000000: 'regulators@3000150' does not match any of the regexes: '^sram@[a-f0-9]+', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sram/allwinner,sun4i-a10-system-control.yaml#
--
>> arch/riscv/boot/dts/allwinner/sun20i-d1-devterm-v3.14.dtb: syscon@3000000: 'regulators@3000150' does not match any of the regexes: '^sram@[a-f0-9]+', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sram/allwinner,sun4i-a10-system-control.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
