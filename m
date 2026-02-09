Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FE51D6193
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Feb 2026 19:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770666357; cv=none; b=A/foy4daf+kGVH6XBt39CplESwnKUx/LlhWD/r2mlekmFLTJ1t+X2GhbApRksd8oQ98Mx2x21VdNjm2GKzLHb26Usb/LviT+FdN5MKd/n7OoXgWnM773Eit7+/EU6FUukNn3cQ1/iXb4dSXLyeV8VuxKRrxbA7XOJ67LiI/e/O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770666357; c=relaxed/simple;
	bh=obJxJvtTHeVKHOc6MogjhdGuO4vcMvliXG7Qcf/GbP4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b/VE+DOYpfieUaiqzRDnMVCgm9u/tIiTEide8gESideIj0ut/qfyJVOWCNthQ/eMh18lMkrWN1wP7pN3HLGjwiIWUejvXZWiBzMSZkvkhCFTf6Htn+nrhd1ZW7tfzRmB5mWbusqFgBrqFiVL6Kdf0Knb0AUENlGXvEIotBxlG+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Toi+x2J7; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Toi+x2J7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770666357; x=1802202357;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=obJxJvtTHeVKHOc6MogjhdGuO4vcMvliXG7Qcf/GbP4=;
  b=Toi+x2J77P/iACmYeDOKvraPFXFTmMFTjd8wrGVjm9znw89MrO8x7B+x
   wTtiw5R2vaXFTpSVkCaohCmdxqXT/PAuaGfH5eg49OwQX36ijZ/sdGvsP
   1y78B3qhJa0yKt1uzJTaWFYLkKEox97u80tFZO8MEKDDiWYD5KZOxtqeV
   njNxNrY+pJ11kMM63WJcZEQ0tuUBqYcDCRB0XLUJSUdkrlAThJa6XBmbl
   5oCyBWO3VmjFSX7Zw/eeUSTUT6MkDX4xlt6dk8ksimy7cUTKrQbfsljbw
   9X6WrQY5w+AVVPbMXsJqmoezWt7x+xM+TzdfN95Jg2UKrxD10YzUePmNa
   w==;
X-CSE-ConnectionGUID: 1fMk4lLfT02yJX/G5viyjw==
X-CSE-MsgGUID: JDG+4yaxTVCzHzBUZUv/HA==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="70803198"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="70803198"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 11:45:57 -0800
X-CSE-ConnectionGUID: yl6YzCG7TwWG+/A4ox+PpA==
X-CSE-MsgGUID: G5+bfxMtR9uEgp8VThLEQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="216206224"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Feb 2026 11:45:56 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpXCj-00000000oHU-1bpy;
	Mon, 09 Feb 2026 19:45:53 +0000
Date: Tue, 10 Feb 2026 03:45:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 bpf-next] bpf: Fix a potential use-after-free
Message-ID: <202602100352.IWGTID64-lkp@intel.com>
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
In-Reply-To: <20260209132904.63908-1-a.s.protopopov@gmail.com>
References: <20260209132904.63908-1-a.s.protopopov@gmail.com>
TO: Anton Protopopov <a.s.protopopov@gmail.com>
TO: bpf@vger.kernel.org
TO: Alexei Starovoitov <ast@kernel.org>
TO: Daniel Borkmann <daniel@iogearbox.net>
TO: Andrii Nakryiko <andrii@kernel.org>
CC: Anton Protopopov <a.s.protopopov@gmail.com>
CC: syzbot+5a0f1995634f7c1dadbf@syzkaller.appspotmail.com

Hi Anton,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Anton-Protopopov/bpf-Fix-a-potential-use-after-free/20260209-212515
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20260209132904.63908-1-a.s.protopopov%40gmail.com
patch subject: [PATCH v3 bpf-next] bpf: Fix a potential use-after-free
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: sh-randconfig-r072-20260209 (https://download.01.org/0day-ci/archive/20260210/202602100352.IWGTID64-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602100352.IWGTID64-lkp@intel.com/

smatch warnings:
kernel/bpf/verifier.c:21350 __add_used_btf() warn: missing error code 'ret'

vim +/ret +21350 kernel/bpf/verifier.c

541c3bad8dc51b Andrii Nakryiko  2021-01-11  21334  
76145f72553267 Anton Protopopov 2024-12-13  21335  /*
d1c01547fefc4e Anton Protopopov 2026-02-09  21336   * Add btf to the env->used_btfs array. If needed, refcount the
d1c01547fefc4e Anton Protopopov 2026-02-09  21337   * corresponding kernel module. To simplify caller's logic
d1c01547fefc4e Anton Protopopov 2026-02-09  21338   * in case of error or if btf was added before the function
d1c01547fefc4e Anton Protopopov 2026-02-09  21339   * decreases the btf refcount.
76145f72553267 Anton Protopopov 2024-12-13  21340   */
76145f72553267 Anton Protopopov 2024-12-13  21341  static int __add_used_btf(struct bpf_verifier_env *env, struct btf *btf)
76145f72553267 Anton Protopopov 2024-12-13  21342  {
76145f72553267 Anton Protopopov 2024-12-13  21343  	struct btf_mod_pair *btf_mod;
d1c01547fefc4e Anton Protopopov 2026-02-09  21344  	int ret = 0;
76145f72553267 Anton Protopopov 2024-12-13  21345  	int i;
76145f72553267 Anton Protopopov 2024-12-13  21346  
76145f72553267 Anton Protopopov 2024-12-13  21347  	/* check whether we recorded this BTF (and maybe module) already */
76145f72553267 Anton Protopopov 2024-12-13  21348  	for (i = 0; i < env->used_btf_cnt; i++)
76145f72553267 Anton Protopopov 2024-12-13  21349  		if (env->used_btfs[i].btf == btf)
d1c01547fefc4e Anton Protopopov 2026-02-09 @21350  			goto ret_put;
76145f72553267 Anton Protopopov 2024-12-13  21351  
dbe99ea541f023 Anton Protopopov 2025-08-16  21352  	if (env->used_btf_cnt >= MAX_USED_BTFS) {
dbe99ea541f023 Anton Protopopov 2025-08-16  21353  		verbose(env, "The total number of btfs per program has reached the limit of %u\n",
dbe99ea541f023 Anton Protopopov 2025-08-16  21354  			MAX_USED_BTFS);
d1c01547fefc4e Anton Protopopov 2026-02-09  21355  		ret = -E2BIG;
d1c01547fefc4e Anton Protopopov 2026-02-09  21356  		goto ret_put;
dbe99ea541f023 Anton Protopopov 2025-08-16  21357  	}
76145f72553267 Anton Protopopov 2024-12-13  21358  
76145f72553267 Anton Protopopov 2024-12-13  21359  	btf_mod = &env->used_btfs[env->used_btf_cnt];
76145f72553267 Anton Protopopov 2024-12-13  21360  	btf_mod->btf = btf;
76145f72553267 Anton Protopopov 2024-12-13  21361  	btf_mod->module = NULL;
76145f72553267 Anton Protopopov 2024-12-13  21362  
76145f72553267 Anton Protopopov 2024-12-13  21363  	/* if we reference variables from kernel module, bump its refcount */
76145f72553267 Anton Protopopov 2024-12-13  21364  	if (btf_is_module(btf)) {
76145f72553267 Anton Protopopov 2024-12-13  21365  		btf_mod->module = btf_try_get_module(btf);
76145f72553267 Anton Protopopov 2024-12-13  21366  		if (!btf_mod->module) {
d1c01547fefc4e Anton Protopopov 2026-02-09  21367  			ret = -ENXIO;
d1c01547fefc4e Anton Protopopov 2026-02-09  21368  			goto ret_put;
76145f72553267 Anton Protopopov 2024-12-13  21369  		}
76145f72553267 Anton Protopopov 2024-12-13  21370  	}
76145f72553267 Anton Protopopov 2024-12-13  21371  
d1c01547fefc4e Anton Protopopov 2026-02-09  21372  	env->used_btf_cnt++;
d1c01547fefc4e Anton Protopopov 2026-02-09  21373  	return 0;
d1c01547fefc4e Anton Protopopov 2026-02-09  21374  
d1c01547fefc4e Anton Protopopov 2026-02-09  21375  ret_put:
d1c01547fefc4e Anton Protopopov 2026-02-09  21376  	/* Either error or this BTF was already added */
d1c01547fefc4e Anton Protopopov 2026-02-09  21377  	btf_put(btf);
d1c01547fefc4e Anton Protopopov 2026-02-09  21378  	return ret;
76145f72553267 Anton Protopopov 2024-12-13  21379  }
76145f72553267 Anton Protopopov 2024-12-13  21380  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
