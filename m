Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC783B2A0
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Nov 2025 21:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764279170; cv=none; b=UqPZ9HYneI3RYeBb3G7NG43luznjbSYkqdTqSs3gjM/OaQN9clnTvZCuV8O0FfhP6tXpXToyaDUYv50/41whkhjybPeYv+ChSD7okFEWYaprUSNlyrHt5jjlmn6NtBL9Zrc2k5IGP58HskX85NeNIFHCK/RxFLSJJA++grG0Kco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764279170; c=relaxed/simple;
	bh=Rb4SgLYfFRAPl83vVSBLKTPbrenE5JLPLEFevotkSxc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SB9mAHkw2eeurtCOnbstRCHjcMGLzxAw60ibMtHI1mHe4isuZbQonAfo8Sr86bY6fJ422SV5pJ+9uhlrX/bSFEbgWlyGmB347Zp0FwKn6IBmFDPAM+dSFwuUIbNC+kvKedrH+WFDl7nCjgYr/oH9M3z5RR1OQqs8c9aJBbemIPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k/4362Z3; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k/4362Z3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764279168; x=1795815168;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rb4SgLYfFRAPl83vVSBLKTPbrenE5JLPLEFevotkSxc=;
  b=k/4362Z365a88lL4UWSFHf9gdmThrdpJzm3GzLHqOnzGP6CHTHNR8kwE
   MdMQECj86kSRuNk5nRuszWPXhQE4jl/vpsjtoKOlT/zNl2ekUgSUeXhuS
   kv2VHFiZj4Se5sjmlvXg7QLW5by/GZXaea+cqcYrVuPGbka10DF1BgBmR
   TSGWuwGYpK/JvL4K0M1n+Zl3w6Euos3kkLUiHQTek9fk5XSJpkUssK84V
   q+CX91Jh48nTsl3Q1MAK1tXKt8+NrkWlzasWOynE7Wdyvzzz62EXSduFD
   bMTEcYBnr8aWTOtmJ5g4B9hcSGWlfMHPbbNebTolPWkzO082QmibB7PiM
   A==;
X-CSE-ConnectionGUID: 5B1ib2uORIegI/8U9NRkSg==
X-CSE-MsgGUID: rTBxEogLRG+VEEvMAjDOSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66487333"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="66487333"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 13:32:47 -0800
X-CSE-ConnectionGUID: J2AzLla2Ru6jyPYii4S+Fg==
X-CSE-MsgGUID: q9m591o2TiqFs+1sDwR+Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="193204753"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 27 Nov 2025 13:32:46 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOjbX-000000001qn-2tdt;
	Thu, 27 Nov 2025 21:32:43 +0000
Date: Thu, 27 Nov 2025 22:31:56 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mkl-can-next:testing 30/30]
 arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: can@2010c000
 (microchip,mpfs-can): 'resets' is a required property
Message-ID: <202511272231.sAOQPKu6-lkp@intel.com>
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
CC: linux-can@vger.kernel.org
TO: Conor Dooley <conor.dooley@microchip.com>
CC: "Marc Kleine-Budde" <mkl@pengutronix.de>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mkl/linux-can-next.git testing
head:   9aea35eb98a6560daf85a2ae9cbd482a66e4d076
commit: 9aea35eb98a6560daf85a2ae9cbd482a66e4d076 [30/30] dt-bindings: can: mpfs: document resets
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: riscv-randconfig-2051-20251127 (https://download.01.org/0day-ci/archive/20251127/202511272231.sAOQPKu6-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 226765b60cc54e03386f38874a177c906f5aa6e7)
dtschema version: 2025.9.dev21+gaa859412c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251127/202511272231.sAOQPKu6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511272231.sAOQPKu6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: can@2010c000 (microchip,mpfs-can): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/can/microchip,mpfs-can.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
