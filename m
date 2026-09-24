Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB62C40B110
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Sep 2026 23:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790291641; cv=none; b=T1PhAlu0MlYLGkXLQO6vijvas7tZ1FQU5Pb06ZEaVuPKjKnK4IvYaXvuZ+cYqjskNMQC6PDWXqM6nm7dTlZfUG9xBjXPrZzFr6yopqu0x4ySeBbr829KIMvJGd3PLj4xqENkqtvP7XVlrrN9S3TxUCxCwxbEOLI4Lxbn3GVuRY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790291641; c=relaxed/simple;
	bh=VVX2dRYgTCJcXYCdg3hANnaNq2KBK3YSfbM+X3L6blc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mvCy7Ru/7YtQxgEa/b7lKqd9IVQxAKv4x8ZSVRHptCaqrN7R91LZyRveX28X/v9q7TPj0vh0V/dNHgoWEe0ye7w52P7PNWoWj3SCIFWl/uC/zxn/tixWZVvE6WdQlV3+zCNVY8tlaibzXz06xH3AEB778QaU2Ph6QSTQvfiC/II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CVKD2eAy; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CVKD2eAy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790291639; x=1821827639;
  h=date:from:to:cc:subject:message-id;
  bh=VVX2dRYgTCJcXYCdg3hANnaNq2KBK3YSfbM+X3L6blc=;
  b=CVKD2eAye1QL0PQ0RY6CQa4FjLJTmalLnTWzA+25T8KJeXMJw065GRWz
   7FjjLkNBa3MH3NMderzSTuFXrVDcf/nmuPmERumdt/oIwF8Y1KL36cdsp
   g5y21YgdSHr5q5EwwRxYFfzgH37UyP/YftvopFwFVY7GqXksVIu6xwUdd
   hESnE4UPMBezYVT88GWPMvoEb/6ZYlYmXvRIc5lO8VLArBhrVMaDA8xPo
   c/okeITdenzWwh1SycQalIk0YnWbdj3dMloser6fJqZYCmkMND5YR1Q0d
   M/W1Jn9++cAwxiEDIKjesCyjba7kjRKGj4T5RPAocIFPpOy5zNVgKPELd
   A==;
X-CSE-ConnectionGUID: o6cqzD02QX+bRIhZKlcS+g==
X-CSE-MsgGUID: iADTiLoFTgK5+pOOKQAulA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="108569266"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="108569266"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 16:13:58 -0700
X-CSE-ConnectionGUID: UPdm2ZIITMy2Vlt0u40btQ==
X-CSE-MsgGUID: uJN3bBljT5evCAJmIAPgMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="272003493"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 24 Sep 2026 16:13:57 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9sdW-000000000TD-2VVm;
	Thu, 24 Sep 2026 23:13:54 +0000
Date: Fri, 25 Sep 2026 01:13:46 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 9787/10113] kernel/bpf/verifier.c:6753
 check_func_ptr_read() warn: missing unwind goto?
Message-ID: <202609250112.LVBgdeoy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4c253ac4b29b8c6cc6fdef8f92d4facde62e63b9
commit: a04286f6d828870f2ad6b8eb18191b1b24a00f23 [9787/10113] bpf: Recognize pointers to functions in read-only maps
:::::: branch date: 4 hours ago
:::::: commit date: 17 hours ago
config: m68k-randconfig-r2202-20260924 (https://download.01.org/0day-ci/archive/20260925/202609250112.LVBgdeoy-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609250112.LVBgdeoy-lkp@intel.com/

smatch warnings:
kernel/bpf/verifier.c:6753 check_func_ptr_read() warn: missing unwind goto?

vim +6753 kernel/bpf/verifier.c

a04286f6d828870 Alexei Starovoitov 2026-09-24  6695  
a04286f6d828870 Alexei Starovoitov 2026-09-24  6696  /*
a04286f6d828870 Alexei Starovoitov 2026-09-24  6697   * A read from a frozen read-only map that has pointers to functions, see
a04286f6d828870 Alexei Starovoitov 2026-09-24  6698   * resolve_func_ptrs(). The bounds and var_off of the offset tell where the read
a04286f6d828870 Alexei Starovoitov 2026-09-24  6699   * is possible at, e.g. var_off is the stride of the elements of an array.
a04286f6d828870 Alexei Starovoitov 2026-09-24  6700   * A read of exactly one pointer yields PTR_TO_FUNC. When the offset is variable
a04286f6d828870 Alexei Starovoitov 2026-09-24  6701   * and only pointers can be read, which is how an element of a table of
a04286f6d828870 Alexei Starovoitov 2026-09-24  6702   * functions is loaded, the verification continues with each of them. Other
a04286f6d828870 Alexei Starovoitov 2026-09-24  6703   * reads that overlap with a pointer are rejected, because their result is not
a04286f6d828870 Alexei Starovoitov 2026-09-24  6704   * known until the program is jitted.
a04286f6d828870 Alexei Starovoitov 2026-09-24  6705   *
a04286f6d828870 Alexei Starovoitov 2026-09-24  6706   * Return -ENOENT if there are no pointers to functions in the bytes that are read.
a04286f6d828870 Alexei Starovoitov 2026-09-24  6707   */
a04286f6d828870 Alexei Starovoitov 2026-09-24  6708  static int check_func_ptr_read(struct bpf_verifier_env *env, struct bpf_reg_state *reg, int off,
a04286f6d828870 Alexei Starovoitov 2026-09-24  6709  			       int size, int value_regno)
a04286f6d828870 Alexei Starovoitov 2026-09-24  6710  {
a04286f6d828870 Alexei Starovoitov 2026-09-24  6711  	u64 min_off = reg_umin(reg) + off, max_off = reg_umax(reg) + off;
a04286f6d828870 Alexei Starovoitov 2026-09-24  6712  	struct tnum offs = tnum_add(reg->var_off, tnum_const(off));
a04286f6d828870 Alexei Starovoitov 2026-09-24  6713  	struct bpf_reg_state *regs = cur_regs(env);
a04286f6d828870 Alexei Starovoitov 2026-09-24  6714  	struct bpf_map *map = reg->map_ptr;
a04286f6d828870 Alexei Starovoitov 2026-09-24  6715  	struct bpf_verifier_state *branch;
a04286f6d828870 Alexei Starovoitov 2026-09-24  6716  	int subprog, targets[BPF_MAX_FUNC_PTR_TARGETS];
a04286f6d828870 Alexei Starovoitov 2026-09-24  6717  	struct bpf_func_ptr *ptrs;
a04286f6d828870 Alexei Starovoitov 2026-09-24  6718  	u32 i, cnt, n = 0;
a04286f6d828870 Alexei Starovoitov 2026-09-24  6719  	u64 o, lo, hi;
a04286f6d828870 Alexei Starovoitov 2026-09-24  6720  	int err;
a04286f6d828870 Alexei Starovoitov 2026-09-24  6721  
a04286f6d828870 Alexei Starovoitov 2026-09-24  6722  	ptrs = bpf_map_range_func_ptrs(env, map, min_off, max_off - min_off + size, &cnt);
a04286f6d828870 Alexei Starovoitov 2026-09-24  6723  	if (!ptrs)
a04286f6d828870 Alexei Starovoitov 2026-09-24  6724  		return -ENOENT;
a04286f6d828870 Alexei Starovoitov 2026-09-24  6725  	if (cnt > BPF_MAX_FUNC_PTR_RANGE)
a04286f6d828870 Alexei Starovoitov 2026-09-24  6726  		goto overlap;
a04286f6d828870 Alexei Starovoitov 2026-09-24  6727  
a04286f6d828870 Alexei Starovoitov 2026-09-24  6728  	for (i = 0; i < cnt; i++) {
a04286f6d828870 Alexei Starovoitov 2026-09-24  6729  		/* the offsets at which the read overlaps with the pointer */
a04286f6d828870 Alexei Starovoitov 2026-09-24  6730  		lo = ptrs[i].map_off >= size ? ptrs[i].map_off - size + 1 : 0;
a04286f6d828870 Alexei Starovoitov 2026-09-24  6731  		lo = max(lo, min_off);
a04286f6d828870 Alexei Starovoitov 2026-09-24  6732  		hi = min(ptrs[i].map_off + sizeof(u64) - 1, max_off);
a04286f6d828870 Alexei Starovoitov 2026-09-24  6733  		for (o = lo; o <= hi; o++) {
a04286f6d828870 Alexei Starovoitov 2026-09-24  6734  			if (!tnum_in(offs, tnum_const(o)))
a04286f6d828870 Alexei Starovoitov 2026-09-24  6735  				continue;
a04286f6d828870 Alexei Starovoitov 2026-09-24  6736  			if (o != ptrs[i].map_off || size != sizeof(u64) || value_regno < 0)
a04286f6d828870 Alexei Starovoitov 2026-09-24  6737  				goto overlap;
a04286f6d828870 Alexei Starovoitov 2026-09-24  6738  			if (n == BPF_MAX_FUNC_PTR_TARGETS) {
a04286f6d828870 Alexei Starovoitov 2026-09-24  6739  				verbose(env, "read from map '%s' may yield more than %d pointers to functions\n",
a04286f6d828870 Alexei Starovoitov 2026-09-24  6740  					map->name, BPF_MAX_FUNC_PTR_TARGETS);
a04286f6d828870 Alexei Starovoitov 2026-09-24  6741  				return -E2BIG;
a04286f6d828870 Alexei Starovoitov 2026-09-24  6742  			}
a04286f6d828870 Alexei Starovoitov 2026-09-24  6743  			subprog = bpf_find_subprog(env, ptrs[i].xlated_off);
a04286f6d828870 Alexei Starovoitov 2026-09-24  6744  			if (verifier_bug_if(subprog <= 0, env,
a04286f6d828870 Alexei Starovoitov 2026-09-24  6745  					    "no function at insn %u for map '%s' offset %u",
a04286f6d828870 Alexei Starovoitov 2026-09-24  6746  					    ptrs[i].xlated_off, map->name, ptrs[i].map_off))
a04286f6d828870 Alexei Starovoitov 2026-09-24  6747  				return -EFAULT;
a04286f6d828870 Alexei Starovoitov 2026-09-24  6748  			targets[n++] = subprog;
a04286f6d828870 Alexei Starovoitov 2026-09-24  6749  		}
a04286f6d828870 Alexei Starovoitov 2026-09-24  6750  	}
a04286f6d828870 Alexei Starovoitov 2026-09-24  6751  	/* pointers are next to what is read, e.g. the data of an array of vtables */
a04286f6d828870 Alexei Starovoitov 2026-09-24  6752  	if (!n)
a04286f6d828870 Alexei Starovoitov 2026-09-24 @6753  		return -ENOENT;
a04286f6d828870 Alexei Starovoitov 2026-09-24  6754  	/* either every offset that the read is possible at is a pointer or none */
a04286f6d828870 Alexei Starovoitov 2026-09-24  6755  	if (count_read_offsets(offs, min_off, max_off, n + 1) != n)
a04286f6d828870 Alexei Starovoitov 2026-09-24  6756  		goto overlap;
a04286f6d828870 Alexei Starovoitov 2026-09-24  6757  
a04286f6d828870 Alexei Starovoitov 2026-09-24  6758  	/* the map has the offset of the function until the program is jitted */
a04286f6d828870 Alexei Starovoitov 2026-09-24  6759  	err = require_callx_jit(env);
a04286f6d828870 Alexei Starovoitov 2026-09-24  6760  	if (err)
a04286f6d828870 Alexei Starovoitov 2026-09-24  6761  		return err;
a04286f6d828870 Alexei Starovoitov 2026-09-24  6762  
a04286f6d828870 Alexei Starovoitov 2026-09-24  6763  	for (i = 0; i < n - 1; i++) {
a04286f6d828870 Alexei Starovoitov 2026-09-24  6764  		branch = push_stack(env, env->insn_idx + 1, env->insn_idx,
a04286f6d828870 Alexei Starovoitov 2026-09-24  6765  				    env->cur_state->speculative);
a04286f6d828870 Alexei Starovoitov 2026-09-24  6766  		if (IS_ERR(branch))
a04286f6d828870 Alexei Starovoitov 2026-09-24  6767  			return PTR_ERR(branch);
a04286f6d828870 Alexei Starovoitov 2026-09-24  6768  		mark_reg_func_ptr(env, branch->frame[branch->curframe]->regs, value_regno,
a04286f6d828870 Alexei Starovoitov 2026-09-24  6769  				  targets[i]);
a04286f6d828870 Alexei Starovoitov 2026-09-24  6770  	}
a04286f6d828870 Alexei Starovoitov 2026-09-24  6771  	mark_reg_func_ptr(env, regs, value_regno, targets[n - 1]);
a04286f6d828870 Alexei Starovoitov 2026-09-24  6772  	return 0;
a04286f6d828870 Alexei Starovoitov 2026-09-24  6773  
a04286f6d828870 Alexei Starovoitov 2026-09-24  6774  overlap:
a04286f6d828870 Alexei Starovoitov 2026-09-24  6775  	verbose(env, "read of %d bytes at offset [%llu,%llu] of map '%s' overlaps with a pointer to a function\n",
a04286f6d828870 Alexei Starovoitov 2026-09-24  6776  		size, min_off, max_off, map->name);
a04286f6d828870 Alexei Starovoitov 2026-09-24  6777  	return -EACCES;
a04286f6d828870 Alexei Starovoitov 2026-09-24  6778  }
a04286f6d828870 Alexei Starovoitov 2026-09-24  6779  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
