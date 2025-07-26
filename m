Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FE1184E
	for <oe-kbuild@lists.linux.dev>; Sat, 26 Jul 2025 08:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753518923; cv=none; b=Pm/BH9bYRybIvjdJvRY4kdfDjhDz6DEB4J58j655Pn66l7Rt8pDiUntqPY/aaiENwBWw08PrPf8OJlzpwrLygcn17ZqR0/y35CYhS6NfUvo7eEaOl4EbKNnO1msGPzw/98JHDL5gzSN4Z7nj8sBSBzzjue/yiSJCktS8a5sxtbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753518923; c=relaxed/simple;
	bh=JOtSgl3HHrJYrn76SfaNbRR13tesvp4Bnfh9TLQvJX4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YmEwx8zUH394sZwxxHXwcbf3wf7Kr2D3kImrP2+vxq0fel7RUlGWqvLr5IgXVNqXvbFqahosTN3r/7s9aB9gI7RlUpJISe8wj4fE5kMykHEHAwU/AUI2QXDZuibXRkoOxr/FWM6Ciiu/bpI0/5zR1t+LrOxtujSyRRRm/NQPh9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I3o0eHf4; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I3o0eHf4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753518923; x=1785054923;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JOtSgl3HHrJYrn76SfaNbRR13tesvp4Bnfh9TLQvJX4=;
  b=I3o0eHf47ofOAO91qqhvq/5jL4IGHNuZx8mkgqa2rzFovjvO/DcY3Iek
   VNiFBC1k0g6b47ve2HegoBlKI0u55aStUEyqIcsh+KWr/vQPN1s2KEKtP
   dmMUyQSitprNNGB98qhhrX5anxiAY8v3E035UlyvoEQmYjDlEm93/WxBE
   zYj5N+ZGqkjLCbmr7NqpytJlTurJPuZ2KAnIwXZqCi9W0elIYAQ+f8dEN
   PEW7/IWrx0T0ig8LZ3+igA6jvYbBdgtaAyFeBfyvF0J231HhFuf0OCRvs
   5MCzPI6DFhGmN1LQUTW4RObnIlgRace5O8ecFfNK5MkEP+KIbYaK06GEs
   w==;
X-CSE-ConnectionGUID: n0JtIf1LR9ubYJUNwT+/Iw==
X-CSE-MsgGUID: ocyEQ1H0ST+L6+EJitTBmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="55541980"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="55541980"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 01:35:22 -0700
X-CSE-ConnectionGUID: pIYVr4bmTpeF+xLbf7PvkQ==
X-CSE-MsgGUID: lhXn4VSaSpKnWIdOxkLRvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="165551503"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa003.fm.intel.com with ESMTP; 26 Jul 2025 01:35:21 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufaNC-0000Fj-28;
	Sat, 26 Jul 2025 08:35:18 +0000
Date: Sat, 26 Jul 2025 10:35:17 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: vmlinux.o: warning: objtool: shrink_node+0x8fa: sibling call from
 callable instruction with modified stack frame
Message-ID: <202507261000.QADqAFWV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5f33ebd2018ced2600b3fad2f8e2052498eb4072
commit: 3724062ca2b1364f02cf44dbea1a552227844ad1 objtool: Ignore dangling jump table entries
date:   6 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 6 months ago
config: x86_64-buildonly-randconfig-2001-20250720 (https://download.01.org/0day-ci/archive/20250726/202507261000.QADqAFWV-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250726/202507261000.QADqAFWV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507261000.QADqAFWV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: ia32_setup_rt_frame+0x139: call to write_comp_data.llvm.15143929695534535488() with UACCESS enabled
   vmlinux.o: warning: objtool: __sanitizer_cov_trace_cmp1+0x11: call to write_comp_data.llvm.15143929695534535488() with UACCESS enabled
   vmlinux.o: warning: objtool: __sanitizer_cov_trace_cmp2+0x14: call to write_comp_data.llvm.15143929695534535488() with UACCESS enabled
   vmlinux.o: warning: objtool: __sanitizer_cov_trace_cmp4+0x14: call to write_comp_data.llvm.15143929695534535488() with UACCESS enabled
   vmlinux.o: warning: objtool: __sanitizer_cov_trace_cmp8+0x13: call to write_comp_data.llvm.15143929695534535488() with UACCESS enabled
   vmlinux.o: warning: objtool: __sanitizer_cov_trace_const_cmp1+0x14: call to write_comp_data.llvm.15143929695534535488() with UACCESS enabled
   vmlinux.o: warning: objtool: __sanitizer_cov_trace_const_cmp2+0x14: call to write_comp_data.llvm.15143929695534535488() with UACCESS enabled
   vmlinux.o: warning: objtool: __sanitizer_cov_trace_const_cmp4+0x14: call to write_comp_data.llvm.15143929695534535488() with UACCESS enabled
   vmlinux.o: warning: objtool: __sanitizer_cov_trace_const_cmp8+0x13: call to write_comp_data.llvm.15143929695534535488() with UACCESS enabled
   vmlinux.o: warning: objtool: __sanitizer_cov_trace_switch+0x5a: call to write_comp_data.llvm.15143929695534535488() with UACCESS enabled
   vmlinux.o: warning: objtool: ___bpf_prog_run+0x6d: sibling call from callable instruction with modified stack frame
>> vmlinux.o: warning: objtool: shrink_node+0x8fa: sibling call from callable instruction with modified stack frame

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
