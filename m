Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BA914F121
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Sep 2025 04:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757911340; cv=none; b=FpiXtdrURd1xDpc0FFQttK85fa0umNz/dVOcHRpAasmq+JXNzTQ49T+RRQQIBsLQqc0/0u1SVEzSkANX7SN4oKDGZKCds+FgJkWf+yXmZq4djyJbjO/R8OFPs/XNy19wnYHSoEj5uc8vjn4x1nRVF8SQfs6IzRPvm2uH3ht3VYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757911340; c=relaxed/simple;
	bh=/wYBlgvEOMcbJFsvYpJKFHLrO9EHOWDfVyfwdTF3O24=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qirIKFz6sDGS60KpV7JnoAat0Kv35dkIoBxlTStWy+467po2bIcMGDTIOw4pTCEaaGo+45mJlI5zyAG5PTIWv4rOQZZgwMZw6Oonl978g46meUSE5urC5SwOowxhp95EjtNEiuS5mexnBWj+t8zyqt6G3WAYLVJQqJ6FsaIWGaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gdN0GvOE; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gdN0GvOE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757911338; x=1789447338;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/wYBlgvEOMcbJFsvYpJKFHLrO9EHOWDfVyfwdTF3O24=;
  b=gdN0GvOEzvDYub3qGrzj/Yj7GUyfGbpVHiQYjod6zdRl+cdp68/rO6ue
   FdAXI/Q0nb36msa+lbb7FURsIzEbNanHDmRexaJGUSOH4IMhWCcMKnQDo
   jV81pOM2lQoPCLbgC5u+BigLXaJagcdUds0V7eHcWWvRdu2vJscFHtpd2
   oBZvY2P2eZzXxmL3Pket38Lw/faZ58P0a+WPoflDiAXaAnd/hxI2ixj86
   1a6875w0zI44KPfk7jQGF+w4kebuPMW4lXBrA86z1wdwU9UREIhuK6COQ
   GyCtAZdkMLuSLqYRKM8gCkSeJm4YvhejLtiO9ahtYdO9xqcmrboxjrgeG
   g==;
X-CSE-ConnectionGUID: fhB06eT9Q3+7Gj8YWaKIQA==
X-CSE-MsgGUID: 9ySgz0goRA2voIANSC0YMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="63791941"
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; 
   d="scan'208";a="63791941"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2025 21:42:18 -0700
X-CSE-ConnectionGUID: WHsJuvvLS/KSMS+EW/0w+Q==
X-CSE-MsgGUID: ZPLNICZmRAOWqbD9/rDX+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; 
   d="scan'208";a="179744691"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 14 Sep 2025 21:42:16 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uy12Y-0002xs-1L;
	Mon, 15 Sep 2025 04:42:11 +0000
Date: Mon, 15 Sep 2025 12:41:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 bpf-next 08/13] bpf, x86: add support for indirect
 jumps
Message-ID: <202509151233.O9xNiPJr-lkp@intel.com>
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
In-Reply-To: <20250913193922.1910480-9-a.s.protopopov@gmail.com>
References: <20250913193922.1910480-9-a.s.protopopov@gmail.com>
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

url:    https://github.com/intel-lab-lkp/linux/commits/Anton-Protopopov/bpf-fix-the-return-value-of-push_stack/20250914-033453
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20250913193922.1910480-9-a.s.protopopov%40gmail.com
patch subject: [PATCH v2 bpf-next 08/13] bpf, x86: add support for indirect jumps
:::::: branch date: 33 hours ago
:::::: commit date: 33 hours ago
config: openrisc-randconfig-r073-20250914 (https://download.01.org/0day-ci/archive/20250915/202509151233.O9xNiPJr-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509151233.O9xNiPJr-lkp@intel.com/

smatch warnings:
kernel/bpf/verifier.c:17798 push_gotox_edge() error: uninitialized symbol 'w'.

vim +/w +17798 kernel/bpf/verifier.c

26f913a1a3cc9e Anton Protopopov 2025-09-13  17773  
26f913a1a3cc9e Anton Protopopov 2025-09-13  17774  static int push_gotox_edge(int t, struct bpf_verifier_env *env, struct bpf_iarray *jt)
26f913a1a3cc9e Anton Protopopov 2025-09-13  17775  {
26f913a1a3cc9e Anton Protopopov 2025-09-13  17776  	int *insn_stack = env->cfg.insn_stack;
26f913a1a3cc9e Anton Protopopov 2025-09-13  17777  	int *insn_state = env->cfg.insn_state;
26f913a1a3cc9e Anton Protopopov 2025-09-13  17778  	u16 prev;
26f913a1a3cc9e Anton Protopopov 2025-09-13  17779  	int w;
26f913a1a3cc9e Anton Protopopov 2025-09-13  17780  
26f913a1a3cc9e Anton Protopopov 2025-09-13  17781  	for (prev = GET_HIGH(insn_state[t]); prev < jt->off_cnt; prev++) {
26f913a1a3cc9e Anton Protopopov 2025-09-13  17782  		w = jt->off[prev];
26f913a1a3cc9e Anton Protopopov 2025-09-13  17783  
26f913a1a3cc9e Anton Protopopov 2025-09-13  17784  		/* EXPLORED || DISCOVERED */
26f913a1a3cc9e Anton Protopopov 2025-09-13  17785  		if (insn_state[w])
26f913a1a3cc9e Anton Protopopov 2025-09-13  17786  			continue;
26f913a1a3cc9e Anton Protopopov 2025-09-13  17787  
26f913a1a3cc9e Anton Protopopov 2025-09-13  17788  		break;
26f913a1a3cc9e Anton Protopopov 2025-09-13  17789  	}
26f913a1a3cc9e Anton Protopopov 2025-09-13  17790  
26f913a1a3cc9e Anton Protopopov 2025-09-13  17791  	if (prev == jt->off_cnt)
26f913a1a3cc9e Anton Protopopov 2025-09-13  17792  		return DONE_EXPLORING;
26f913a1a3cc9e Anton Protopopov 2025-09-13  17793  
26f913a1a3cc9e Anton Protopopov 2025-09-13  17794  	mark_prune_point(env, t);
26f913a1a3cc9e Anton Protopopov 2025-09-13  17795  
26f913a1a3cc9e Anton Protopopov 2025-09-13  17796  	if (env->cfg.cur_stack >= env->prog->len)
26f913a1a3cc9e Anton Protopopov 2025-09-13  17797  		return -E2BIG;
26f913a1a3cc9e Anton Protopopov 2025-09-13 @17798  	insn_stack[env->cfg.cur_stack++] = w;
26f913a1a3cc9e Anton Protopopov 2025-09-13  17799  
26f913a1a3cc9e Anton Protopopov 2025-09-13  17800  	mark_jmp_point(env, w);
26f913a1a3cc9e Anton Protopopov 2025-09-13  17801  
26f913a1a3cc9e Anton Protopopov 2025-09-13  17802  	SET_HIGH(insn_state[t], prev + 1);
26f913a1a3cc9e Anton Protopopov 2025-09-13  17803  	return KEEP_EXPLORING;
26f913a1a3cc9e Anton Protopopov 2025-09-13  17804  }
26f913a1a3cc9e Anton Protopopov 2025-09-13  17805  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
