Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F235E166F1A
	for <oe-kbuild@lists.linux.dev>; Mon, 18 Aug 2025 00:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755477394; cv=none; b=CkiMz2QurkcyX2q878gkmX4sQQGxkbsCR5Sy4MXg2yp1LnJiwgALM88LS2tiLBii+yh3uU6YLt7V1NPN0VCAt9gAzhUUahXezWpavUTkBvtZCZhCVmGoNx+05yhcUQ9SVLx/Gl1Ri6TYts9BP7Y/W+/lrjMGd8b2QnTdPoS7/rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755477394; c=relaxed/simple;
	bh=I/yhLMZnoUzmJOK6Xk5rNX97/M5daFfDcKCTqmtLQEA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pl8Ccjd/BphF8pqnYxXMHhPSdKoMenejf6sG26anbTOm2U0Z5Bk6CIGakVbklh2YzaOHjREiKRqHGR3oG5vfE72ltjAD4/cAND12EDQ/ZQZeVXCrBH+DlpeJuvshIPvuF2Geu92GbqsXPtCQfZ08xej1ojaaKA3Lmax/sqEXUcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OxgQNqHh; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OxgQNqHh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755477392; x=1787013392;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I/yhLMZnoUzmJOK6Xk5rNX97/M5daFfDcKCTqmtLQEA=;
  b=OxgQNqHh7pUX42DhMqe3EZw66ODQFBygTSLzY41NvBsFg1RK1WMhyrMy
   xzyJp/spPOKVHA8EUqmsQdifiTl9AkEnPniwBGflPgGW4GwjE0no0KK7x
   wXLWYTAXbbr1eiYpkBbh0AqZ9fVj6gWXSpJq+MwrxCA3jRIuqTgsIXSd2
   dRAAD3bwdUJv3FYwcyK2PLpByOZccDptAFXM4MqPy/xeuf9DiAkz8jTwj
   +rZhieYurmrlquqqLjT2mes7lebWvqQzVyKnPFBVy16mSN8nJPrxnFcjF
   +R2ryOjhf3Gj0suURQTvOZFmUAZtbLkUWKsY6/om7cpMZou9CD/dMmWt7
   w==;
X-CSE-ConnectionGUID: 6HKJ+HyxTyykeOXo7eYuLw==
X-CSE-MsgGUID: saxa8iFvSzWRep4iPaLSgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="69148815"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="69148815"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2025 17:36:31 -0700
X-CSE-ConnectionGUID: Ymp1DKThTdykgmKtv4LG3w==
X-CSE-MsgGUID: PZI16g0LSGumrQc9OQ5uvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="167833754"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 17 Aug 2025 17:36:30 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unnrQ-000Dnr-0I;
	Mon, 18 Aug 2025 00:36:28 +0000
Date: Mon, 18 Aug 2025 08:35:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v1 bpf-next 08/11] bpf, x86: add support for indirect
 jumps
Message-ID: <202508180805.aUCPtTuQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250816180631.952085-9-a.s.protopopov@gmail.com>
References: <20250816180631.952085-9-a.s.protopopov@gmail.com>
TO: Anton Protopopov <a.s.protopopov@gmail.com>
TO: bpf@vger.kernel.org
TO: Alexei Starovoitov <ast@kernel.org>
TO: Andrii Nakryiko <andrii@kernel.org>
TO: Anton Protopopov <aspsk@isovalent.com>
TO: Daniel Borkmann <daniel@iogearbox.net>
TO: Eduard Zingerman <eddyz87@gmail.com>
TO: Quentin Monnet <qmo@kernel.org>
TO: Yonghong Song <yonghong.song@linux.dev>

Hi Anton,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Anton-Protopopov/bpf-fix-the-return-value-of-push_stack/20250817-020411
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20250816180631.952085-9-a.s.protopopov%40gmail.com
patch subject: [PATCH v1 bpf-next 08/11] bpf, x86: add support for indirect jumps
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: x86_64-randconfig-161-20250818 (https://download.01.org/0day-ci/archive/20250818/202508180805.aUCPtTuQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508180805.aUCPtTuQ-lkp@intel.com/

smatch warnings:
kernel/bpf/verifier.c:17800 push_goto_x_edge() error: uninitialized symbol 'w'.
kernel/bpf/verifier.c:25013 compute_scc() warn: unsigned 'succ_cnt' is never less than zero.

vim +/w +17800 kernel/bpf/verifier.c

a34675076b990b Anton Protopopov 2025-08-16  17775  
a34675076b990b Anton Protopopov 2025-08-16  17776  static int push_goto_x_edge(int t, struct bpf_verifier_env *env, struct jt *jt)
a34675076b990b Anton Protopopov 2025-08-16  17777  {
a34675076b990b Anton Protopopov 2025-08-16  17778  	int *insn_stack = env->cfg.insn_stack;
a34675076b990b Anton Protopopov 2025-08-16  17779  	int *insn_state = env->cfg.insn_state;
a34675076b990b Anton Protopopov 2025-08-16  17780  	u16 prev;
a34675076b990b Anton Protopopov 2025-08-16  17781  	int w;
a34675076b990b Anton Protopopov 2025-08-16  17782  
a34675076b990b Anton Protopopov 2025-08-16  17783  	for (prev = GET_HIGH(insn_state[t]); prev < jt->off_cnt; prev++) {
a34675076b990b Anton Protopopov 2025-08-16  17784  		w = jt->off[prev];
a34675076b990b Anton Protopopov 2025-08-16  17785  
a34675076b990b Anton Protopopov 2025-08-16  17786  		/* EXPLORED || DISCOVERED */
a34675076b990b Anton Protopopov 2025-08-16  17787  		if (insn_state[w])
a34675076b990b Anton Protopopov 2025-08-16  17788  			continue;
a34675076b990b Anton Protopopov 2025-08-16  17789  
a34675076b990b Anton Protopopov 2025-08-16  17790  		break;
a34675076b990b Anton Protopopov 2025-08-16  17791  	}
a34675076b990b Anton Protopopov 2025-08-16  17792  
a34675076b990b Anton Protopopov 2025-08-16  17793  	if (prev == jt->off_cnt)
a34675076b990b Anton Protopopov 2025-08-16  17794  		return DONE_EXPLORING;
a34675076b990b Anton Protopopov 2025-08-16  17795  
a34675076b990b Anton Protopopov 2025-08-16  17796  	mark_prune_point(env, t);
a34675076b990b Anton Protopopov 2025-08-16  17797  
a34675076b990b Anton Protopopov 2025-08-16  17798  	if (env->cfg.cur_stack >= env->prog->len)
a34675076b990b Anton Protopopov 2025-08-16  17799  		return -E2BIG;
a34675076b990b Anton Protopopov 2025-08-16 @17800  	insn_stack[env->cfg.cur_stack++] = w;
a34675076b990b Anton Protopopov 2025-08-16  17801  
a34675076b990b Anton Protopopov 2025-08-16  17802  	mark_jmp_point(env, w);
a34675076b990b Anton Protopopov 2025-08-16  17803  
a34675076b990b Anton Protopopov 2025-08-16  17804  	SET_HIGH(insn_state[t], prev + 1);
a34675076b990b Anton Protopopov 2025-08-16  17805  	return KEEP_EXPLORING;
a34675076b990b Anton Protopopov 2025-08-16  17806  }
a34675076b990b Anton Protopopov 2025-08-16  17807  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
