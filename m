Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6992E7199
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Feb 2026 04:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771044315; cv=none; b=Lz6/7A/ebl4+BEEtdJslWvSirR84zC3HWY6/Gl5vbGJIlJOjDAUNIErpi/L3rOeNiDw8zV8828sqGM4NZW7so2UBfIve1ix9RwgekjmK3IJKxk74ZRsNUwc6525CAJt2Zmm+wIH2y5ofRZ5R/QVZZkplc2m1C4ytxQ+tdDUBsiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771044315; c=relaxed/simple;
	bh=9XUaKWrZoTUrIhNqTa/H8buHXTkDLrr90NQBSkb4Krc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=D50Ju7D0HSzLOnZ3kJNwWKn4jyilQHcb8/51sO/finh7ff/HesUgSeNGYov7vaBdLiE7zfXhpEFHYiGLvOFdIgIp2O7LSqT+rB0PbTuXTY96a7vG5rEkRkgg6ug7E8KQleX+MtgG4gwh0Welg1ewPZ87tXaNeo1tBHdLTxKn1hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AwlkzHbL; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AwlkzHbL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771044312; x=1802580312;
  h=date:from:to:cc:subject:message-id;
  bh=9XUaKWrZoTUrIhNqTa/H8buHXTkDLrr90NQBSkb4Krc=;
  b=AwlkzHbLoVs3HsPxne9wgJjyg0SFGH/JlvTjr9Cq0wzMGhdjT9x5z3kx
   7kuRVpo9v5N4GU9K5KecWcOxXpM5VuJC6TsYccjudN0WapnfsoWYZgzr+
   OQCMW/LFZct7tZC8nI8PVorq7d6Mgxtz+n/JJVudsmwg57gG3BwaJo0kY
   qKoVFL8j64I51YEClj00/7y6fbZahDMtxLD1T222ql//HTx4jGwjA1IpT
   ah0YLJhzRJ/ynYQAKbw5hG6Iiipwv6PyyNyJFKIF7/P+jCtvsvmmn6JMl
   bk4D0FPsDjSh/ebVba4D4oRWZxx3Q65i+yzdy3Prf5M08oGuyBgCQ6Klk
   A==;
X-CSE-ConnectionGUID: ofgl3qJzRXiOGm3Fvq6RKA==
X-CSE-MsgGUID: JjTXH/jSRlqwKRaZ1ixEmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="97687809"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="97687809"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 20:45:11 -0800
X-CSE-ConnectionGUID: +Iw/eZDCQq+dxBLfRV6XYQ==
X-CSE-MsgGUID: RtomT6mYSEqfE4iZV9qerw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="212354214"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Feb 2026 20:45:10 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vr7Wm-00000000wEG-2UXB;
	Sat, 14 Feb 2026 04:45:08 +0000
Date: Sat, 14 Feb 2026 12:44:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [isilence:zcrx/test 2/7] io_uring/bpf-ops.c:45:28: sparse:
 sparse: unsigned value that used to be signed checked against zero?
Message-ID: <202602141254.ynPMDHbB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: io_uring/bpf-ops.c:45:28: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Pavel Begunkov <asml.silence@gmail.com>

tree:   https://github.com/isilence/linux zcrx/test
head:   9d9cdc9ae6c6d59154e68f65054d75893a749d14
commit: f9cf0331a4954f4f92b49175380b67633a574bb2 [2/7] io_uring/bpf-ops: implement loop_step with BPF struct_ops
:::::: branch date: 18 hours ago
:::::: commit date: 2 days ago
config: riscv-randconfig-r131-20260214 (https://download.01.org/0day-ci/archive/20260214/202602141254.ynPMDHbB-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602141254.ynPMDHbB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602141254.ynPMDHbB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> io_uring/bpf-ops.c:45:28: sparse: sparse: unsigned value that used to be signed checked against zero?
   io_uring/bpf-ops.c:45:21: sparse: signed value source

vim +45 io_uring/bpf-ops.c

f9cf0331a4954f Pavel Begunkov 2025-01-27  37  
f9cf0331a4954f Pavel Begunkov 2025-01-27  38  static int bpf_io_btf_struct_access(struct bpf_verifier_log *log,
f9cf0331a4954f Pavel Begunkov 2025-01-27  39  				    const struct bpf_reg_state *reg, int off,
f9cf0331a4954f Pavel Begunkov 2025-01-27  40  				    int size)
f9cf0331a4954f Pavel Begunkov 2025-01-27  41  {
f9cf0331a4954f Pavel Begunkov 2025-01-27  42  	const struct btf_type *t = btf_type_by_id(reg->btf, reg->btf_id);
f9cf0331a4954f Pavel Begunkov 2025-01-27  43  
f9cf0331a4954f Pavel Begunkov 2025-01-27  44  	if (t == loop_params_type) {
f9cf0331a4954f Pavel Begunkov 2025-01-27 @45  		if (off >= offsetof(struct iou_loop_params, cq_wait_idx) &&
f9cf0331a4954f Pavel Begunkov 2025-01-27  46  		    off + size <= offsetofend(struct iou_loop_params, cq_wait_idx))
f9cf0331a4954f Pavel Begunkov 2025-01-27  47  			return SCALAR_VALUE;
f9cf0331a4954f Pavel Begunkov 2025-01-27  48  	}
f9cf0331a4954f Pavel Begunkov 2025-01-27  49  
f9cf0331a4954f Pavel Begunkov 2025-01-27  50  	return -EACCES;
f9cf0331a4954f Pavel Begunkov 2025-01-27  51  }
f9cf0331a4954f Pavel Begunkov 2025-01-27  52  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
