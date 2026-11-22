Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795313107;
	b=rrOm2zw79RxA1QYu8T0OG04NyfCTr/E7liAL36k11KbR/IUdmi9UnYNsLMemuhd3jfdQ
	 jvYrNgmItgBAMrUDRtupnSCPUFM1TqkODiHuF7RCSF5uksqyFqjqlT1msMnSMBgQJkouz
	 F+qx8aVPE9UXXkIqU6TmT9OPhPQtIu8Ab5GB5tuFyCDHinKAPCXgJZzNjN9IY44QxqIsR
	 HWqZ/9ZFpsG4il7hCaOxaVlFjNdQbhoVEHWwGmb3bKRH9j8cqgBTzigOaE/BCXLtb8RHk
	 CToEQ0/9ictSFsjCvQRv1mS/HvR17slBfCbNrOXUczLCtQ9BA5YHrZAhDoMhYYtTIxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795313107;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=s2gmN13DuslX/pCsWkPN6UVpQWKbA75csxoR8rhy4u4=;
	b=qiPgGH2j9im4mkrAPUbKYCHbn+UT0E9icc526dkCki2TPkxXPe0LX0IxwbSrahSvnuNj
	 k6h+ZOA2yUw4PzEu/gch/c8qAFjVmBpHvsKnMyCJOvQJknL1atwiBpxa4PIXi62bVNwO4
	 nt410QqAD38+nS5pBbS9nENS9mtPbhxqNvrw2i9oIdPwACgPQ79E8hizUleJBbcLz0gOu
	 6vtWip26v5whcIV4/Lc8NXVHioIQzAY90vibR9xMJuX4Z3iGQkYoomDVCNDgKi7t5jnRF
	 ubERmRm3Lb31jOI0LjUUYPqZb+jOENV0wrYjn5SDKHVyGaZHmlGCmB3OiEdCORe3OgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XGoE6eyO;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6ACA606A320
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Nov 2026 02:05:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6ACA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XGoE6eyO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795313106; x=1826849106;
  h=date:from:to:cc:subject:message-id;
  bh=v4PaF56RY018fFNKWN97NdMzeD27cySud42KySAg7W4=;
  b=XGoE6eyOKBqQcihj8XripDye79GpKu1DERd089CfX7B9zDE9jCQ/mOA1
   ttj6PL4r5aJCZO9UYxWnHW0kT4klvNAWpfWQy9JiW5fanrB+trojrSSKp
   Cg9vTpJuEqpQMVViVZRHFbcUsVXroIXXdPvDnU891r+p5LFpH1M8+cOga
   JhpftNCTHpirDS/r9STOY1tTbmucQ+qDpAe2cPvuluNdRX28gBUsypsQo
   TURfDsLN1dPew9gFGeNH5AlYG3Brrw0EdjpXHI66l57kAh+2ie9DMUxRc
   /XbSiGEdm/xXPbS4Hdm/X35muYYvpEGRHPd3aXI2H9bM2G8Jg3VTwDIcd
   A==;
X-CSE-ConnectionGUID: QbtZ6+LESLqz/s7yFI4zCQ==
X-CSE-MsgGUID: 4m9o3DvJSc+CkkCN+uD3jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4195976"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="4195976"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 18:05:06 -0800
X-CSE-ConnectionGUID: haaNBT8qSuKyl6t1ZD/9lw==
X-CSE-MsgGUID: BOJjtgiaTui/Zc4nKHuioA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="10979219"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 21 Nov 2026 18:05:05 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUwwx-000000004SX-0Sea;
	Sun, 22 Nov 2026 02:05:03 +0000
Date: Sun, 22 Nov 2026 03:05:00 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [bpf-next:master 38/59] xtensa-linux-ld:
 verifier.c:undefined reference to `bpf_prog_offload_verify_insn'
Message-ID: <20261122030206.iS1CZ2nY-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "too many reports for this commit"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
head:   2bf3351c5f894697e8443eeef5333d4c4ce90cab
commit: 09c84023b0b4ef040548929859de81177a15bab2 [38/59] bpf: Verify in passes
:::::: branch date: 3 hours ago
:::::: commit date: 22 hours ago
config: xtensa-randconfig-r2304-20261121 (https://download.01.org/0day-ci/archive/20261122/20261122030206.iS1CZ2nY-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261122/20261122030206.iS1CZ2nY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261122030206.iS1CZ2nY-lkp@intel.com/

Note: the bpf-next/master HEAD 2bf3351c5f894697e8443eeef5333d4c4ce90cab builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   xtensa-linux-ld: kernel/bpf/verifier.o: in function `scalar_alu':
   verifier.c:(.text+0x28a28): undefined reference to `bpf_prog_offload_verify_insn'
>> xtensa-linux-ld: verifier.c:(.text+0x28d12): undefined reference to `bpf_prog_offload_verify_insn'
   xtensa-linux-ld: kernel/bpf/verifier.o: in function `do_check_insn':
   verifier.c:(.text+0x2b5b8): undefined reference to `bpf_prog_offload_verifier_prep'
   xtensa-linux-ld: kernel/bpf/verifier.o: in function `do_check_block':
   verifier.c:(.text+0x2ba77): undefined reference to `bpf_prog_offload_verifier_prep'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
