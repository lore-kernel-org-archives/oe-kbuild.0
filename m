Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EAE30CD95
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Oct 2026 18:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791655442; cv=none; b=bmddBrFzI0Ue6k3AjGblLLrhYJbHtEd2gJ3rDZ8AKx4xcQxjO1vmyniJHcVptNGjLki5PjvjawlRAQ9AvK6gbsoOduB0agNzwygQPRbcVDUGdyV4QeiiYx/OBZugt4kewn6x99vs4WikF9PLyiNGD25fKuD14A+91U2pVfUUWC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791655442; c=relaxed/simple;
	bh=f+WjlFfmqOxeUsJbIt+Rm6647dztuzOwPQqAW97b0Jc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FYSWiNKCrqEiWPtaNbCsoJhmHlgeN71K4gACgtt8GeYK67BjdixTADJnbOsxpa28w3MpoAh3IkDjeBfW0glk9GA8LqXUAXKzsCVm85KysWkgt1g7OLbgESBtRguh9QnNuSXz2IMIEC2bXWyYo7k2UHwE1XRtM1fqIJqek/x1DPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=il3iElrc; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="il3iElrc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791655440; x=1823191440;
  h=date:from:to:cc:subject:message-id;
  bh=f+WjlFfmqOxeUsJbIt+Rm6647dztuzOwPQqAW97b0Jc=;
  b=il3iElrc1jTHdsJS3gozohYwrqvDn25WzFbM4nCcuR3yVY2hxgHY6L1P
   8d0YvSA6YE8C/hBLyI2WjtvMk3gdu9HR2a5iSE2AYmzJZyyhKzlJS9QJY
   3ANFVLJjq3sYM40PUUyfplxPZ4I4Qjd1bUV0yL02LduLClFaDkDmHCbVd
   /XFEdU/t2vy4H+sAzcnxRJVGoQd+a7he3fyWzWV5vONV/E0z2Se3yEk1+
   nAr7A+SQmJGYQBdxptc+MqfFV8s7KmpXtejU5Bbp8u63VP4ZLrRxXDT/w
   2dpiLwCYow47hjnLSibBq5FTqsCK1+B5TvRrnEk9S5P5SVZcCd1+/9bku
   w==;
X-CSE-ConnectionGUID: qMXoPwLTRsKSRm6tQ+YqQQ==
X-CSE-MsgGUID: IhtT1spaTBCq1TUEf3TJYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11931"; a="434069"
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="434069"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2026 11:03:59 -0700
X-CSE-ConnectionGUID: ygp3cxX5RH+vYLVaLq7NGw==
X-CSE-MsgGUID: P5EFXjDQQPuHs8I94zldBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="652152"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 10 Oct 2026 11:03:58 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFbQJ-000000009Aj-3w5r;
	Sat, 10 Oct 2026 18:03:55 +0000
Date: Sat, 10 Oct 2026 20:03:12 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mm:for-test 5/6] ERROR: modpost: __ex_table+0x24c4
 references non-executable section '.data..once'
Message-ID: <202610101938.BzY4SwQy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "riscv arch toolchain issue"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: David Hildenbrand <david@kernel.org>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: "David Hildenbrand (Arm)" <david@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mm/linux.git for-test
head:   869bd0f4e161f22c2108d4001055eb571f31980e
commit: 5e738813733891baf904e415d53424c22f23aff4 [5/6] Merge https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable into for-next
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: riscv-randconfig-r2100-20261010 (https://download.01.org/0day-ci/archive/20261010/202610101938.BzY4SwQy-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261010/202610101938.BzY4SwQy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610101938.BzY4SwQy-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: __ex_table+0x2134 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x213c (section: __ex_table) -> 0x375ff2 (section: .debug_str)
ERROR: modpost: __ex_table+0x213c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2140 (section: __ex_table) -> __efistub_ (section: .debug_str)
ERROR: modpost: __ex_table+0x2140 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2148 (section: __ex_table) -> __efistub_ (section: .debug_str)
ERROR: modpost: __ex_table+0x2148 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x214c (section: __ex_table) -> 0xed (section: .debug_str)
ERROR: modpost: __ex_table+0x214c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2154 (section: __ex_table) -> 0x7366b5 (section: .debug_str)
ERROR: modpost: __ex_table+0x2154 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2158 (section: __ex_table) -> 0x73660f (section: .debug_str)
ERROR: modpost: __ex_table+0x2158 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2160 (section: __ex_table) -> __efistub_ (section: .debug_str)
ERROR: modpost: __ex_table+0x2160 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2164 (section: __ex_table) -> __efistub_ (section: .debug_str)
ERROR: modpost: __ex_table+0x2164 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x216c (section: __ex_table) -> 0x60f276 (section: .debug_str)
ERROR: modpost: __ex_table+0x216c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2170 (section: __ex_table) -> 0x40a4f1 (section: .debug_str)
ERROR: modpost: __ex_table+0x2170 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2178 (section: __ex_table) -> __efistub_ (section: .debug_str)
ERROR: modpost: __ex_table+0x2178 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x217c (section: __ex_table) -> 0x85e8d5 (section: .debug_str)
ERROR: modpost: __ex_table+0x217c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2184 (section: __ex_table) -> 0x8a832f (section: .debug_str)
ERROR: modpost: __ex_table+0x2184 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2188 (section: __ex_table) -> 0x24e5d8 (section: .debug_str)
ERROR: modpost: __ex_table+0x2188 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2190 (section: __ex_table) -> __efistub_ (section: .debug_str)
ERROR: modpost: __ex_table+0x2190 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2194 (section: __ex_table) -> 0x93c9e (section: .debug_str)
ERROR: modpost: __ex_table+0x2194 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x219c (section: __ex_table) -> 0x3bf92e (section: .debug_str)
ERROR: modpost: __ex_table+0x219c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21a0 (section: __ex_table) -> 0x204615 (section: .debug_str)
ERROR: modpost: __ex_table+0x21a0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21a8 (section: __ex_table) -> __efistub_ (section: .debug_str)
ERROR: modpost: __ex_table+0x21a8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21ac (section: __ex_table) -> 0x204615 (section: .debug_str)
ERROR: modpost: __ex_table+0x21ac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21b4 (section: __ex_table) -> 0x4a415 (section: .debug_str)
ERROR: modpost: __ex_table+0x21b4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21b8 (section: __ex_table) -> __efistub_ (section: .debug_str)
ERROR: modpost: __ex_table+0x21b8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21c0 (section: __ex_table) -> 0x60f303 (section: .debug_str)
ERROR: modpost: __ex_table+0x21c0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21c4 (section: __ex_table) -> 0x659e7b (section: .debug_str)
ERROR: modpost: __ex_table+0x21c4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21cc (section: __ex_table) -> 0x8a7c1e (section: .debug_str)
ERROR: modpost: __ex_table+0x21cc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21d0 (section: __ex_table) -> 0x204d47 (section: .debug_str)
ERROR: modpost: __ex_table+0x21d0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21d8 (section: __ex_table) -> 0x4e8672 (section: .debug_str)
ERROR: modpost: __ex_table+0x21d8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21dc (section: __ex_table) -> 0x32bf27 (section: .debug_str)
ERROR: modpost: __ex_table+0x21dc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21e4 (section: __ex_table) -> 0x24e575 (section: .debug_str)
ERROR: modpost: __ex_table+0x21e4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21e8 (section: __ex_table) -> 0x2987ff (section: .debug_str)
ERROR: modpost: __ex_table+0x21e8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21f0 (section: __ex_table) -> 0x3bfeef (section: .debug_str)
ERROR: modpost: __ex_table+0x21f0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21f4 (section: __ex_table) -> 0x53235c (section: .debug_str)
ERROR: modpost: __ex_table+0x21f4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21fc (section: __ex_table) -> __efistub_ (section: .debug_str)
ERROR: modpost: __ex_table+0x21fc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2200 (section: __ex_table) -> 0x78107d (section: .debug_str)
ERROR: modpost: __ex_table+0x2200 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2208 (section: __ex_table) -> 0x3bfe3a (section: .debug_str)
ERROR: modpost: __ex_table+0x2208 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x220c (section: __ex_table) -> 0x60f12e (section: .debug_str)
ERROR: modpost: __ex_table+0x220c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2214 (section: __ex_table) -> trace_ocfs2_calc_refcount_meta_credits.______f.224 (section: _ftrace_annotated_branch)
ERROR: modpost: __ex_table+0x2214 references non-executable section '_ftrace_annotated_branch'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2220 (section: __ex_table) -> 0xea97f9 (section: .debug_loc)
ERROR: modpost: __ex_table+0x2220 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2224 (section: __ex_table) -> 0xea9891 (section: .debug_loc)
ERROR: modpost: __ex_table+0x2224 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x222c (section: __ex_table) -> 0xeaadbb (section: .debug_loc)
ERROR: modpost: __ex_table+0x222c references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2230 (section: __ex_table) -> 0xeaae61 (section: .debug_loc)
ERROR: modpost: __ex_table+0x2230 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2238 (section: __ex_table) -> 0xeabc05 (section: .debug_loc)
ERROR: modpost: __ex_table+0x2238 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x223c (section: __ex_table) -> 0xeabcb6 (section: .debug_loc)
ERROR: modpost: __ex_table+0x223c references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2244 (section: __ex_table) -> 0xeb13c9 (section: .debug_loc)
ERROR: modpost: __ex_table+0x2244 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2248 (section: __ex_table) -> 0xeb143a (section: .debug_loc)
ERROR: modpost: __ex_table+0x2248 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2250 (section: __ex_table) -> 0xeb1a49 (section: .debug_loc)
ERROR: modpost: __ex_table+0x2250 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2254 (section: __ex_table) -> 0xeb1ada (section: .debug_loc)
ERROR: modpost: __ex_table+0x2254 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x226c (section: __ex_table) -> trylock_buffer.______f (section: _ftrace_annotated_branch)
ERROR: modpost: __ex_table+0x226c references non-executable section '_ftrace_annotated_branch'
WARNING: modpost: vmlinux: section mismatch in reference: 0x238c (section: __ex_table) -> IS_ERR.______f (section: _ftrace_annotated_branch)
ERROR: modpost: __ex_table+0x238c references non-executable section '_ftrace_annotated_branch'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24c4 (section: __ex_table) -> trace_ocfs2_iterate_xattr_buckets.__already_done (section: .data..once)
>> ERROR: modpost: __ex_table+0x24c4 references non-executable section '.data..once'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24e4 (section: __ex_table) -> 0x47994 (section: __bug_table)
ERROR: modpost: __ex_table+0x24e4 references non-executable section '__bug_table'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24e8 (section: __ex_table) -> trace_ocfs2_add_new_xattr_cluster_begin.______f.310 (section: _ftrace_annotated_branch)
ERROR: modpost: __ex_table+0x24e8 references non-executable section '_ftrace_annotated_branch'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24fc (section: __ex_table) -> 0xc45c (section: __jump_table)
ERROR: modpost: __ex_table+0x24fc references non-executable section '__jump_table'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2508 (section: __ex_table) -> 0x4e8aaa (section: .debug_str)
ERROR: modpost: __ex_table+0x2508 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x250c (section: __ex_table) -> 0x37641e (section: .debug_str)
ERROR: modpost: __ex_table+0x250c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2514 (section: __ex_table) -> 0x3765d4 (section: .debug_str)
ERROR: modpost: __ex_table+0x2514 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2518 (section: __ex_table) -> 0x3bff06 (section: .debug_str)
ERROR: modpost: __ex_table+0x2518 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2520 (section: __ex_table) -> 0x7811bb (section: .debug_str)
ERROR: modpost: __ex_table+0x2520 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2524 (section: __ex_table) -> 0x127013 (section: .debug_str)
ERROR: modpost: __ex_table+0x2524 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x252c (section: __ex_table) -> __efistub_ (section: .debug_str)
ERROR: modpost: __ex_table+0x252c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2530 (section: __ex_table) -> 0x6ed62b (section: .debug_str)
ERROR: modpost: __ex_table+0x2530 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2538 (section: __ex_table) -> 0x24e341 (section: .debug_str)
ERROR: modpost: __ex_table+0x2538 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x253c (section: __ex_table) -> 0x6ed53f (section: .debug_str)
ERROR: modpost: __ex_table+0x253c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2544 (section: __ex_table) -> 0x4e8bfd (section: .debug_str)
ERROR: modpost: __ex_table+0x2544 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2548 (section: __ex_table) -> 0x376587 (section: .debug_str)
ERROR: modpost: __ex_table+0x2548 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2550 (section: __ex_table) -> 0x624c2 (section: .debug_str)
ERROR: modpost: __ex_table+0x2550 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2554 (section: __ex_table) -> 0x3d82f9 (section: .debug_str)
ERROR: modpost: __ex_table+0x2554 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x255c (section: __ex_table) -> 0x185a1 (section: .debug_str)
ERROR: modpost: __ex_table+0x255c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2560 (section: __ex_table) -> 0x501431 (section: .debug_str)
ERROR: modpost: __ex_table+0x2560 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2568 (section: __ex_table) -> 0x82cf24 (section: .debug_str)
ERROR: modpost: __ex_table+0x2568 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x256c (section: __ex_table) -> 0x876b95 (section: .debug_str)
ERROR: modpost: __ex_table+0x256c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2574 (section: __ex_table) -> 0x2b0e8d (section: .debug_str)
ERROR: modpost: __ex_table+0x2574 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2578 (section: __ex_table) -> 0x1d2c50 (section: .debug_str)
ERROR: modpost: __ex_table+0x2578 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2580 (section: __ex_table) -> 0x46c6b8 (section: .debug_str)
ERROR: modpost: __ex_table+0x2580 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2584 (section: __ex_table) -> 0x7da88f (section: .debug_str)
ERROR: modpost: __ex_table+0x2584 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2604 (section: __ex_table) -> 0x7369cb (section: .debug_str)
ERROR: modpost: __ex_table+0x2604 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2608 (section: __ex_table) -> 0x8f25d5 (section: .debug_str)
ERROR: modpost: __ex_table+0x2608 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2610 (section: __ex_table) -> 0x57bdeb (section: .debug_str)
ERROR: modpost: __ex_table+0x2610 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2614 (section: __ex_table) -> 0x5c5a37 (section: .debug_str)
ERROR: modpost: __ex_table+0x2614 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x261c (section: __ex_table) -> 0xf233cb (section: .debug_loc)
ERROR: modpost: __ex_table+0x261c references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2620 (section: __ex_table) -> 0xf2341a (section: .debug_loc)
ERROR: modpost: __ex_table+0x2620 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2628 (section: __ex_table) -> 0xf23443 (section: .debug_loc)
ERROR: modpost: __ex_table+0x2628 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x262c (section: __ex_table) -> 0xf2341a (section: .debug_loc)
ERROR: modpost: __ex_table+0x262c references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2634 (section: __ex_table) -> 0xf234f5 (section: .debug_loc)
ERROR: modpost: __ex_table+0x2634 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2638 (section: __ex_table) -> 0xf2341a (section: .debug_loc)
ERROR: modpost: __ex_table+0x2638 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2640 (section: __ex_table) -> 0xf25239 (section: .debug_loc)
ERROR: modpost: __ex_table+0x2640 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2644 (section: __ex_table) -> 0xf25289 (section: .debug_loc)
ERROR: modpost: __ex_table+0x2644 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x264c (section: __ex_table) -> 0xf27537 (section: .debug_loc)
ERROR: modpost: __ex_table+0x264c references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2650 (section: __ex_table) -> 0xf27587 (section: .debug_loc)
ERROR: modpost: __ex_table+0x2650 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2658 (section: __ex_table) -> 0xf277b8 (section: .debug_loc)
ERROR: modpost: __ex_table+0x2658 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x265c (section: __ex_table) -> 0xf2780f (section: .debug_loc)
ERROR: modpost: __ex_table+0x265c references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2664 (section: __ex_table) -> 0xf27a45 (section: .debug_loc)
ERROR: modpost: __ex_table+0x2664 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2668 (section: __ex_table) -> 0xf27aae (section: .debug_loc)
ERROR: modpost: __ex_table+0x2668 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x26a0 (section: __ex_table) -> 0x2e1f66 (section: .debug_str)
ERROR: modpost: __ex_table+0x26a0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x26a4 (section: __ex_table) -> 0x2e1f6b (section: .debug_str)
ERROR: modpost: __ex_table+0x26a4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x26ac (section: __ex_table) -> 0x5c52de (section: .debug_str)
ERROR: modpost: __ex_table+0x26ac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x26b0 (section: __ex_table) -> 0xd3 (section: .debug_str)
ERROR: modpost: __ex_table+0x26b0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x26b8 (section: __ex_table) -> 0x4a81e (section: .debug_str)
ERROR: modpost: __ex_table+0x26b8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x26bc (section: __ex_table) -> 0x85e6cc (section: .debug_str)
ERROR: modpost: __ex_table+0x26bc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x26c4 (section: __ex_table) -> 0x8f20d2 (section: .debug_str)
ERROR: modpost: __ex_table+0x26c4 references non-executable section '.debug_str'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
