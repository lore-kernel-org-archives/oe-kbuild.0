Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795297824;
	b=3mkvkFoN1E/Zmri7j0/Wn9/D47k0KWE7BPtxe0tFeOlFdMSG3FoQ9fbZOHvElvk8If0U
	 IqKUo49pzIB2O+NCXS6SMBJNg9Plf/RZFjDK09/rzlt4RA8/89TN85BOiWArl5317cxD3
	 O+P6l4eWC8lA/D0btWmcf/R+flPv5ORWZIxtvj7/P/pA5eky9LcSiy4b4NrbGmaKbt/kG
	 PmkCwEjo/f3nh8eWW/ejXwkWeg/IyAZwFtxxTznJc8RCaJ/2Bhs8AIzWaaeEw4+7A0SIw
	 ugXZKvDSX1TL4eAAvDc0XNjOA+359MOYzjfNvhQBm5eMO3Xm7P666tzHrZOg2yJSsjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795297824;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=jZzgfPaVB2tzUxRvzbnk1aHTARnm5DZuamfyVr0IX4g=;
	b=JO95xxEIKk2q0RrlDyusv0bf7VEu/ePhlFWypmnMCPEZRAg6rvT2L5ZObAVw0an6STzq
	 AUns4d+tvXNIEAbpSGG8/sZcas2/8gZLxoUiw4UHda2yJuEtO98L9ZSc7OUWjemyX2lZE
	 RLKWv/i9AsullRIw4Lz4+con4RyaYtm36U2l3YiEFe2rzxrFX4SekWwAq+2VqTkKKC6xI
	 2OnXH3cErEE51/6cVLmBlMDau06Ve7ts7tEov1IsRRZpTETXoZ606zpnK1d+WTnJlADvz
	 S4Rlcj7UUX2txzZd4kWupaTVjkEVub62oNp50JTOWjskdR4Hlgj24K7BaqVwbNsRhgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fyB3YEv5;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B910606A682
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Nov 2026 21:50:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B910606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fyB3YEv5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795297822; x=1826833822;
  h=date:from:to:cc:subject:message-id;
  bh=pqqrC0f5m47f+yD8m40PpxPut8Hjep2n0I0Ny+kh/J8=;
  b=fyB3YEv5Qa/vJDWgiYzktJuQgP8UBPnllhpmgxvPI745OlRabSgltioN
   zrPrRPDD5hOA9qKXmcIOUf/w7+nfkjigVDpEAXDZz4nAANWmnjB3uIiBt
   SQj1G3KnaKgOOTayNlnDIfdqZKTMZIRsjfgZZaRlAI05xkmrq3xDMEo+R
   dLqU1mgFMAG0+3bz6JhAxtKNKSKrx9ilLfAikJtCOWVFE0dt2ZHaKpipL
   dZ1PIl1TmzSx2FEKgGN/fuLDb3FuNsyF6Gz9Sx7uW49JPmFD1VgnE5NrW
   /jtEEJdk/aR32Z0Cxz87Zk/bSanVcCXv7Qs4rWlW1EzG6cI0gwHRHNb+i
   Q==;
X-CSE-ConnectionGUID: v5YK74iWSdmU5+twn+vcyA==
X-CSE-MsgGUID: mYOD5T9UQRy5q8sfitHCCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4026990"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4026990"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 13:50:21 -0800
X-CSE-ConnectionGUID: fRVaB3TvSkOcYUpPGcHwBQ==
X-CSE-MsgGUID: pjxoTfGGSGq0Gat5vRGhOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="12679024"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 21 Nov 2026 13:50:20 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUsyP-000000004Np-3lUe;
	Sat, 21 Nov 2026 21:50:17 +0000
Date: Sat, 21 Nov 2026 22:50:09 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [bpf-next:master 38/51] verifier.c:(.text+0x2313c):
 dangerous relocation: unsupported relocation
Message-ID: <20261121224554.IsNYE7Fs-lkp@intel.com>
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
head:   9867c61abbd44f7053a871566b3d982f62c6d8dc
commit: 09c84023b0b4ef040548929859de81177a15bab2 [38/51] bpf: Verify in passes
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: arm-randconfig-r2103-20261121 (https://download.01.org/0day-ci/archive/20261121/20261121224554.IsNYE7Fs-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/20261121224554.IsNYE7Fs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261121224554.IsNYE7Fs-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: kernel/bpf/verifier.o: in function `do_check_block':
   verifier.c:(.text+0x2313c): undefined reference to `bpf_prog_offload_verify_insn'
   arm-linux-gnueabi-ld: (bpf_prog_offload_verify_insn): Unknown destination type (ARM/Thumb) in kernel/bpf/verifier.o
>> verifier.c:(.text+0x2313c): dangerous relocation: unsupported relocation

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
