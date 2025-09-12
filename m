Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A9D28DC4
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Sep 2025 18:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757701407; cv=none; b=abLYScznb5SxqZot8WMnnyC+UlUEnul1FoeFXWw4SeXgWW/pjxYnM7ZJXWHE89LHvFspsOHZ2Z10I8aF01govNqr1VHRvLfVyEoCbTSovLdw9CtRPMSTKXIoFM5ljdRhvtLBX1qAwCwLxEseP2covLOTVazuYWI4dbucVRcKp0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757701407; c=relaxed/simple;
	bh=R1UFnv9ahSRtHquTafowfm5tm6xIoo9cO/jjeqZCMHw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cdxQoUBdRDDEOU2jivufqgdAd5Ooz2s/sVgNU+74HwKcisOXsR/4ejVDFDtTP9HGvSaeNqSesKEKb3aHIf76cnr7Bvu2dA2hd3Bod/cfEzTGrA5XOtEsBMett3KS3f9vkMWKN4/y4khJcUldmXZ+9fp/FEBKjUaRIwnF4/6rnsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ExzcBOU7; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ExzcBOU7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757701406; x=1789237406;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R1UFnv9ahSRtHquTafowfm5tm6xIoo9cO/jjeqZCMHw=;
  b=ExzcBOU7/kvlACa/YRhr7BnwJh2NyEOZUUkWMPbepY9TzpcKaHtLj0Qj
   n1EopW64WBWrXXhO63VP8EU5xTkqsUyR6grDoJLv385OV1QJtBQCQOJW/
   SOfDZ3HZVPBEhkT9/jZNNcGM4fqyWELX205VkFBQhXusR+nEg+MQX3Ge6
   XZk+CRpNX7/kU7cxNBQ9CRE1uDlYEBPGituKTETPdKbLp7hgczGV1KsNx
   S4275NnhgjfI5pZQ6hG7A5kjcoNoJB3t1SpYayGxJnK0jyoQPqWrctL3X
   vhQRlGp2zkzY1+E3Qz0A0os7YV1l5Bt7A1nxjdMbL1/d2mqkNcY6FVu5G
   w==;
X-CSE-ConnectionGUID: mIuDVZktQM2Yw+afDTPWIQ==
X-CSE-MsgGUID: upH6ydDGSD2oHzQyouF/GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="59279503"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="59279503"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 11:23:25 -0700
X-CSE-ConnectionGUID: 8pfn1K5cQ7aIkWONKeEpUQ==
X-CSE-MsgGUID: LzmovL58T+yP5MjYxvSpZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="173944270"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 12 Sep 2025 11:23:24 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ux8Qc-0001AQ-1L;
	Fri, 12 Sep 2025 18:23:22 +0000
Date: Sat, 13 Sep 2025 02:22:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [morimoto:x5h-upstream-2025-09-12 6/13]
 arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0718000
 (renesas,hscif-r8a78000): compatible: 'oneOf' conditional failed, one must
 be fixed:
Message-ID: <202509130238.VM1q3Ihx-lkp@intel.com>
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
TO: Hai Pham <hai.pham.ud@renesas.com>
CC: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: Vinh Nguyen <vinh.nguyen.xz@renesas.com>
CC: Takeshi Kihara <takeshi.kihara.df@renesas.com>
CC: Khanh Le <khanh.le.xr@renesas.com>
CC: Huy Bui <huy.bui.wm@renesas.com>
CC: Phong Hoang <phong.hoang.wz@renesas.com>

tree:   https://github.com/morimoto/linux x5h-upstream-2025-09-12
head:   0eb95c8741433390cd9b90399428fdddcbb54b7b
commit: a2abdec2af0287e433eab131e0cb53dd6a4344d0 [6/13] arm64: dts: renesas: R8A78000: Add initial Ironhide support
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: arm64-randconfig-052-20250912 (https://download.01.org/0day-ci/archive/20250913/202509130238.VM1q3Ihx-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 21857ae337e0892a5522b6e7337899caa61de2a6)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250913/202509130238.VM1q3Ihx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509130238.VM1q3Ihx-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'renesas,hscif-r8a78000' is not one of ['renesas,hscif-r8a7778', 'renesas,hscif-r8a7779']
   	'renesas,hscif-r8a78000' is not one of ['renesas,hscif-r8a7742', 'renesas,hscif-r8a7743', 'renesas,hscif-r8a7744', 'renesas,hscif-r8a7745', 'renesas,hscif-r8a77470', 'renesas,hscif-r8a7790', 'renesas,hscif-r8a7791', 'renesas,hscif-r8a7792', 'renesas,hscif-r8a7793', 'renesas,hscif-r8a7794']
   	'renesas,hscif-r8a78000' is not one of ['renesas,hscif-r8a774a1', 'renesas,hscif-r8a774b1', 'renesas,hscif-r8a774c0', 'renesas,hscif-r8a774e1', 'renesas,hscif-r8a7795', 'renesas,hscif-r8a7796', 'renesas,hscif-r8a77961', 'renesas,hscif-r8a77965', 'renesas,hscif-r8a77970', 'renesas,hscif-r8a77980', 'renesas,hscif-r8a77990', 'renesas,hscif-r8a77995']
   	'renesas,hscif-r8a78000' is not one of ['renesas,hscif-r8a779a0', 'renesas,hscif-r8a779f0', 'renesas,hscif-r8a779g0', 'renesas,hscif-r8a779h0']
   	'renesas,rcar-gen1-hscif' was expected
   	'renesas,rcar-gen2-hscif' was expected
   	'renesas,rcar-gen3-hscif' was expected
   	'renesas,rcar-gen4-hscif' was expected
   	'renesas,rcar-gen5-hscif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0718000 (renesas,hscif-r8a78000): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,hscif-r8a78000', 'renesas,hscif'] is too short
   	'renesas,hscif-r8a78000' is not one of ['renesas,hscif-r8a7778', 'renesas,hscif-r8a7779']
   	'renesas,hscif-r8a78000' is not one of ['renesas,hscif-r8a7742', 'renesas,hscif-r8a7743', 'renesas,hscif-r8a7744', 'renesas,hscif-r8a7745', 'renesas,hscif-r8a77470', 'renesas,hscif-r8a7790', 'renesas,hscif-r8a7791', 'renesas,hscif-r8a7792', 'renesas,hscif-r8a7793', 'renesas,hscif-r8a7794']
   	'renesas,hscif-r8a78000' is not one of ['renesas,hscif-r8a774a1', 'renesas,hscif-r8a774b1', 'renesas,hscif-r8a774c0', 'renesas,hscif-r8a774e1', 'renesas,hscif-r8a7795', 'renesas,hscif-r8a7796', 'renesas,hscif-r8a77961', 'renesas,hscif-r8a77965', 'renesas,hscif-r8a77970', 'renesas,hscif-r8a77980', 'renesas,hscif-r8a77990', 'renesas,hscif-r8a77995']
   	'renesas,hscif-r8a78000' is not one of ['renesas,hscif-r8a779a0', 'renesas,hscif-r8a779f0', 'renesas,hscif-r8a779g0', 'renesas,hscif-r8a779h0']
   	'renesas,rcar-gen1-hscif' was expected
   	'renesas,rcar-gen2-hscif' was expected
   	'renesas,rcar-gen3-hscif' was expected
   	'renesas,rcar-gen4-hscif' was expected
   	'renesas,rcar-gen5-hscif' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
