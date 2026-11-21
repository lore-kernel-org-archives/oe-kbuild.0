Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795251418;
	b=fUR7I8l32SijBAztRL2424jZqsyZ4EgQxfPg7fv3tBqPT73a6xXYAJE9P9CQGjyzcLy7
	 RxwcesyiLAO6/khI871MD6Vg7V3wpq+wqAlR5DiZn19NGjB/yPS+rHEkoLO522WZoEdAe
	 cLRVQL6sVyk02MEGtEvLyK/Vtdkq7Y2g3shQLcIfXYWgteiH66Jz6l0tUDG67ZgABfcuC
	 +HBdU3YLgZA2uS7XLLWOYPtrR1mieAAlcnIRgpTsKfkrXgjEpkdWU1UIr4422fx6h8V1W
	 GPU4YUr6dIvuhT92UQOeHt6ZI8jdzVH9T1D92oQkYfK174DuuLz9ODNc1qnkavMCIKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795251418;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=U2XvbpZ3bB4Emg+ROQcDZ8AoI/KZrfiXVbIy+AfnfxE=;
	b=TxycLI923W2AEyAG7fFeznPmfl3Cfzv8v2PBzcM/EppFmX1zQkZaa1Rb+K/9buk1XvIF
	 yfPNBZNNUGyTT8Bil1/nDhG6ICZU3HVQvSS/72wjWGDlSgAOwyRzWRaOHFprlWkb1MPX8
	 1AX9Mu+77ITfhjRkm/IbQqt04HUEwp7aiil4xph0/HWym0FKpJohBNXwvz/ucSesLY5Fi
	 vgGft4QdgwQcTE6e8bvsVOWRIJhPjmgxMOb5T+1LMQj+r3rCpuCpo9CPAwQDhcm9FZzQM
	 qWQ1RGbq0sAtMtndqnoQ3iYRsaAfrz5QL+Q34Kuo0km9jRPBMtXAEUbHUf+NITIho5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lehk4ozB;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E4B606A325
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Nov 2026 08:56:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12E4B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lehk4ozB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795251417; x=1826787417;
  h=date:from:to:cc:subject:message-id;
  bh=noIZjf8x3vyM8FINfTcAnqjh3GE1EUE7vIKtf4PZQ+I=;
  b=lehk4ozBeR0GsXB2QTXGVBHtIA1D3pnSHc4ull2DBaAO6rOBFhat0SKs
   /hVSl1iMgvapUVXq6iuqtVPidWlJTf8x5gz09ait/Z2dqe0sROpSUGUs0
   jig2++qDv9sKEGKwBD7IgNWN5JX383N/E64tqjf/LSvVK0AYJp3+IifgZ
   DMRKpZHbKb7hyv5Zl57bpLzMUeOdAYcwwDlevJleVQLMCh0iEDvil3Q4O
   KeNjn3MuZp1aBNIPl+Z/shFjOWmyjXjPZC2oEjRny1DZzU8RmRo/dStaa
   dzWjPIKaHYWkaq3OCakma7ZYUJwp79dpfRoWde3rUSrv+OiZcsHzLsMDZ
   w==;
X-CSE-ConnectionGUID: zK081TkaTs+RzRL2N4wTHw==
X-CSE-MsgGUID: Oy+4ddGrS7m4TbQmZ2mS1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4140369"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="4140369"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 00:56:57 -0800
X-CSE-ConnectionGUID: APy9S/GDQPquB4CfAQuEMQ==
X-CSE-MsgGUID: PaxzHECzTSmP9KGs625/Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="11007848"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 21 Nov 2026 00:56:54 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUgtw-000000004Hh-1hnf;
	Sat, 21 Nov 2026 08:56:52 +0000
Date: Sat, 21 Nov 2026 09:56:03 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [bpf-next:master 31/51] kernel/bpf/equation_join.c:690
 compute_trip_count() warn: check sign expansion for '*x'
Message-ID: <20261121094951.CeF2P1Bq-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
head:   9867c61abbd44f7053a871566b3d982f62c6d8dc
commit: b00adefb7a6570069114121ba99fef0c5eca9793 [31/51] bpf: Get the trip count from the trip index
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: microblaze-randconfig-2200-20261121 (https://download.01.org/0day-ci/archive/20261121/20261121094951.CeF2P1Bq-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261121094951.CeF2P1Bq-lkp@intel.com/

smatch warnings:
kernel/bpf/equation_join.c:690 compute_trip_count() warn: check sign expansion for '*x'

vim +690 kernel/bpf/equation_join.c

b00adefb7a65700 Alexei Starovoitov 2026-11-20  668  
b00adefb7a65700 Alexei Starovoitov 2026-11-20  669  /*
b00adefb7a65700 Alexei Starovoitov 2026-11-20  670   * "*@x @op @bound" holds in the trips that continue. In how many, if each adds @step to it?
b00adefb7a65700 Alexei Starovoitov 2026-11-20  671   * *@x becomes the end of the range in which they continue.
b00adefb7a65700 Alexei Starovoitov 2026-11-20  672   */
b00adefb7a65700 Alexei Starovoitov 2026-11-20  673  static u64 compute_trip_count(s64 step, u64 *x, u8 op, bool jmp32, struct scalar bound)
b00adefb7a65700 Alexei Starovoitov 2026-11-20  674  {
b00adefb7a65700 Alexei Starovoitov 2026-11-20  675  	struct cnum64 arc;
b00adefb7a65700 Alexei Starovoitov 2026-11-20  676  	struct scalar body_range;
b00adefb7a65700 Alexei Starovoitov 2026-11-20  677  	u64 left;
b00adefb7a65700 Alexei Starovoitov 2026-11-20  678  
b00adefb7a65700 Alexei Starovoitov 2026-11-20  679  	if (op == BPF_JNE && jmp32)
b00adefb7a65700 Alexei Starovoitov 2026-11-20  680  		scalar_set_const(&bound, bound.r32.base + (step > 0 ? bound.r32.size : 0));
b00adefb7a65700 Alexei Starovoitov 2026-11-20  681  	else if (op == BPF_JNE)
b00adefb7a65700 Alexei Starovoitov 2026-11-20  682  		scalar_set_const(&bound, bound.r64.base + (step > 0 ? bound.r64.size : 0));
b00adefb7a65700 Alexei Starovoitov 2026-11-20  683  	scalar_set_unknown(&body_range);
b00adefb7a65700 Alexei Starovoitov 2026-11-20  684  	scalars_refine_cond_op(&body_range, &bound, op, jmp32);
b00adefb7a65700 Alexei Starovoitov 2026-11-20  685  	arc = jmp32 ? (struct cnum64){ body_range.r32.base, body_range.r32.size } : body_range.r64;
b00adefb7a65700 Alexei Starovoitov 2026-11-20  686  	left = jmp32 ? (u32)(*x - arc.base) : *x - arc.base;
b00adefb7a65700 Alexei Starovoitov 2026-11-20  687  	if (left > arc.size)
b00adefb7a65700 Alexei Starovoitov 2026-11-20  688  		return 0;
b00adefb7a65700 Alexei Starovoitov 2026-11-20  689  	*x = arc.base + (step > 0 ? arc.size : 0);
b00adefb7a65700 Alexei Starovoitov 2026-11-20 @690  	*x = !jmp32 ? *x : op == bpf_signed_opcode(op) && op != BPF_JNE ? (s32)*x : (u32)*x;
b00adefb7a65700 Alexei Starovoitov 2026-11-20  691  	return min(div64_u64(step > 0 ? arc.size - left : left, abs64(step)), U64_MAX - 1) + 1;
b00adefb7a65700 Alexei Starovoitov 2026-11-20  692  }
b00adefb7a65700 Alexei Starovoitov 2026-11-20  693  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
