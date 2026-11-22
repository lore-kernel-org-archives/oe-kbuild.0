Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795336863;
	b=MHp6ktXOvxjreWI3k7h36QyE4p51tj7bFw7hvxxQlvi3q4X3IMF2bCZKAx0QFzFXcmpw
	 au6sEqiIpexfO/UqbiXl11r/Eb0hKPpNqLbvaj8NDR5MZ5MMfBwdyzE6+i8RWsPfd0umV
	 MWugf8FWy28WO2zo1fH7mKMq+We6eTNy+MmQZcQFSLqAG17ZytvUYs49vItFdCeOyH3Cp
	 th5yuXvgT1E4Q8OULpFvBWZgfXjbInxBdwxNbdODQgFo0NL0q9Uq7WQpxWnP3LSS+cFJm
	 BJCQJD+PQ7s52ytEGm/0ynjtNZClECqR+U1Qrsoi9VQpJu6qM5DUISQpcm2rzpn67ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795336863;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=oRJtdzy9Dqg4HAt9JqoaZSTxU6MzExlULkpynnchwhA=;
	b=a9TQupbOPVzpqew+Ap0PxCNp7H8mQzjC4SDuZHLXjmvKvY7mv4m2Ij7LmcxUKTV3Ho9I
	 x/nl9rxUhPJaojZujqerhb6i0NRJkg2b2xdYQIgyTizOGyXhkPGOvpF1QfJT8Ta6+dlRz
	 Ok3E0Y1uiufm7XivhUzfFWQidujUX9jkEe+N/IDyyWhO1NrsSRzNZ5meAOuOQpKU8e00r
	 PDWWalYds04/37mhZYJJWuqTX7TQhbHMxQvWEWX31cfwuLHg3DvFxJu3oOMlHGmeYl4ch
	 J9EEy2eQVl3VnmNY2VPbWbi/7jkBmfcZQVKy5bebZluTJLKQZRH5x7+KAuNllxnl4mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gAg1JuzF;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF49B606A320
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Nov 2026 08:41:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF49B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gAg1JuzF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795336862; x=1826872862;
  h=date:from:to:cc:subject:message-id;
  bh=nAIN5pyJAxZeVnzczZBE74jFKeJiIdaVZ9NcF+VymZQ=;
  b=gAg1JuzFX20+2YmNKhVAlreSCV1daYieFEqexSe5eq9yMbkMve21cpQX
   O47b4XAZTyKDLk9aLGSprtx1OKocWI86p+1l07zCqRRVzeZiG/FKGRDKW
   kkH/Onbbu+jHUnEzGXaWvimAHs4DZS7c9zPE2yw9TsAFipdvkHCvHhmlk
   xUBn0p6ki9LFbqayDr3aY8jg69h8ZfMv74d+ERhlla4GSiENUZY0K/52x
   M4VNuoX77hHBWJC/BqPssDFscLOG8An61AZrQMtrGU195vGMCkKZtQr08
   UGOzPQNb3q+9jA6yk4L+VFf5lWYXB/mza00n5LYwQNdH6+JPvZtZQd5kX
   w==;
X-CSE-ConnectionGUID: WuE3wjNjRuCBLBeogZaQsw==
X-CSE-MsgGUID: Sl69lSXPQXqZRHmbbSSLSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4059035"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="4059035"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 00:40:40 -0800
X-CSE-ConnectionGUID: S0TTZwqWTb2ObA6kUn2KbQ==
X-CSE-MsgGUID: XdPcoQarT4+ONfRm6TMJEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="11173918"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 22 Nov 2026 00:40:38 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xV37k-000000004XB-2urm;
	Sun, 22 Nov 2026 08:40:36 +0000
Date: Sun, 22 Nov 2026 09:39:48 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [bpf-next:master 38/59] csky-linux-ld: verifier.c:undefined
 reference to `bpf_prog_offload_verify_insn'
Message-ID: <20261122093108.1FbfUjSg-lkp@intel.com>
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
:::::: branch date: 9 hours ago
:::::: commit date: 28 hours ago
config: csky-randconfig-r2307-20261121 (https://download.01.org/0day-ci/archive/20261122/20261122093108.1FbfUjSg-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.2.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261122/20261122093108.1FbfUjSg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261122093108.1FbfUjSg-lkp@intel.com/

Note: the bpf-next/master HEAD 2bf3351c5f894697e8443eeef5333d4c4ce90cab builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   csky-linux-ld: kernel/bpf/verifier.o: in function `do_check_block':
   verifier.c:(.text+0x2c27a): undefined reference to `bpf_prog_offload_verify_insn'
>> csky-linux-ld: verifier.c:(.text+0x2c3f4): undefined reference to `bpf_prog_offload_verify_insn'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
