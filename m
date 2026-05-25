Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB47123BD02
	for <oe-kbuild@lists.linux.dev>; Mon, 25 May 2026 17:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779729919; cv=none; b=oqEODq16r+ZYivBs2RwXofhuMUvOBTlZVrbhjdzdyefvUfVwE+Kud5joAba58aMiZVv1uySWO4nIbExYEJ6hztavyjfPeEuCAKA4GfA2GANnYoTA0twXwdgWylEiXitzkNDgmwbgxi4+1eDn+pkIzw0sBON8htmyD4UWsjiat98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779729919; c=relaxed/simple;
	bh=c2Gvc4etArsEJADgEkXuBqwmn8gG7K4Okhsv97kMMIM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TM4ySfZFjoP9A2F3erEZVo6r8ewUfzcjyasVHsmflJDv5BehMHJbCaelaMV2DpDXJP8oi15W11cr1p3rh7g/AzkJbwgVH/yEhDYznMLz9gG79Y5ip95vLUyn3NmttKwK7YA4f0Ihb6rkLHWgs/y/cukUoI1MgtSwLlzZuEXJYuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PfherDMi; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PfherDMi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779729917; x=1811265917;
  h=date:from:to:cc:subject:message-id;
  bh=c2Gvc4etArsEJADgEkXuBqwmn8gG7K4Okhsv97kMMIM=;
  b=PfherDMiV8eTMJdBHQCFNqTIFzjDcrPvSCT2sa5t97wHYiZI9A1XIFST
   7p62WfPnjRtJC9K3jips+YFvFS87+hTV36Ys2aYElZr1wKzLiG6XsJiOh
   ocAdkb5ap4/XHnoUdsi2EltqZ6Y+m+0BfgIa+2Je1P6kObhMvd4t79ZZX
   rh4igpeEpm/OWdAnt2P7OXTBh6t1Uzi3tohgS0nQNXMmH+uThmuw3z1v/
   sdNDMOpoA23MAEiltmamzWMnhsFwqJ4hfi8Nspnc6i99iDPlO4apVyjHz
   wSzCN6MX9lWKYeckt7AhR0quvQfIroKRF86ch8154rOfqD/SVKuAP5Vm1
   A==;
X-CSE-ConnectionGUID: EdlDS8VmRAOhL+QKNE/0MA==
X-CSE-MsgGUID: m/24iKQjTQKT+NFH6zR/aQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80608033"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="80608033"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 10:25:17 -0700
X-CSE-ConnectionGUID: ySfuzDrHSMyfFklc2xN/Dw==
X-CSE-MsgGUID: wTkMGzvDSGqh0CSjyjZ3Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="241507858"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 25 May 2026 10:25:16 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRZ3B-000000001hW-2oYD;
	Mon, 25 May 2026 17:25:13 +0000
Date: Tue, 26 May 2026 01:24:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 12590/13385] kernel/bpf/verifier.c:21350
 __add_used_btf() warn: missing error code 'ret'
Message-ID: <202605260132.eRR5tRmt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Anton Protopopov <a.s.protopopov@gmail.com>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d387b06f7c15b4639244ad66b4b0900c6a02b430
commit: ccd2d799ed4467c07f5ee18c2f5c59bcc990822c [12590/13385] bpf: Fix a potential use-after-free of BTF object
:::::: branch date: 76 minutes ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-161-20260523 (https://download.01.org/0day-ci/archive/20260526/202605260132.eRR5tRmt-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605260132.eRR5tRmt-lkp@intel.com/

smatch warnings:
kernel/bpf/verifier.c:21350 __add_used_btf() warn: missing error code 'ret'

vim +/ret +21350 kernel/bpf/verifier.c

541c3bad8dc51b Andrii Nakryiko  2021-01-11  21334  
76145f72553267 Anton Protopopov 2024-12-13  21335  /*
ccd2d799ed4467 Anton Protopopov 2026-02-09  21336   * Add btf to the env->used_btfs array. If needed, refcount the
ccd2d799ed4467 Anton Protopopov 2026-02-09  21337   * corresponding kernel module. To simplify caller's logic
ccd2d799ed4467 Anton Protopopov 2026-02-09  21338   * in case of error or if btf was added before the function
ccd2d799ed4467 Anton Protopopov 2026-02-09  21339   * decreases the btf refcount.
76145f72553267 Anton Protopopov 2024-12-13  21340   */
76145f72553267 Anton Protopopov 2024-12-13  21341  static int __add_used_btf(struct bpf_verifier_env *env, struct btf *btf)
76145f72553267 Anton Protopopov 2024-12-13  21342  {
76145f72553267 Anton Protopopov 2024-12-13  21343  	struct btf_mod_pair *btf_mod;
ccd2d799ed4467 Anton Protopopov 2026-02-09  21344  	int ret = 0;
76145f72553267 Anton Protopopov 2024-12-13  21345  	int i;
76145f72553267 Anton Protopopov 2024-12-13  21346  
76145f72553267 Anton Protopopov 2024-12-13  21347  	/* check whether we recorded this BTF (and maybe module) already */
76145f72553267 Anton Protopopov 2024-12-13  21348  	for (i = 0; i < env->used_btf_cnt; i++)
76145f72553267 Anton Protopopov 2024-12-13  21349  		if (env->used_btfs[i].btf == btf)
ccd2d799ed4467 Anton Protopopov 2026-02-09 @21350  			goto ret_put;
76145f72553267 Anton Protopopov 2024-12-13  21351  
dbe99ea541f023 Anton Protopopov 2025-08-16  21352  	if (env->used_btf_cnt >= MAX_USED_BTFS) {
dbe99ea541f023 Anton Protopopov 2025-08-16  21353  		verbose(env, "The total number of btfs per program has reached the limit of %u\n",
dbe99ea541f023 Anton Protopopov 2025-08-16  21354  			MAX_USED_BTFS);
ccd2d799ed4467 Anton Protopopov 2026-02-09  21355  		ret = -E2BIG;
ccd2d799ed4467 Anton Protopopov 2026-02-09  21356  		goto ret_put;
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
ccd2d799ed4467 Anton Protopopov 2026-02-09  21367  			ret = -ENXIO;
ccd2d799ed4467 Anton Protopopov 2026-02-09  21368  			goto ret_put;
76145f72553267 Anton Protopopov 2024-12-13  21369  		}
76145f72553267 Anton Protopopov 2024-12-13  21370  	}
76145f72553267 Anton Protopopov 2024-12-13  21371  
ccd2d799ed4467 Anton Protopopov 2026-02-09  21372  	env->used_btf_cnt++;
ccd2d799ed4467 Anton Protopopov 2026-02-09  21373  	return 0;
ccd2d799ed4467 Anton Protopopov 2026-02-09  21374  
ccd2d799ed4467 Anton Protopopov 2026-02-09  21375  ret_put:
ccd2d799ed4467 Anton Protopopov 2026-02-09  21376  	/* Either error or this BTF was already added */
ccd2d799ed4467 Anton Protopopov 2026-02-09  21377  	btf_put(btf);
ccd2d799ed4467 Anton Protopopov 2026-02-09  21378  	return ret;
76145f72553267 Anton Protopopov 2024-12-13  21379  }
76145f72553267 Anton Protopopov 2024-12-13  21380  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
