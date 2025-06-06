Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF72623C513
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Jun 2025 22:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749250360; cv=none; b=n+5sXgpitkEhgcpgtercu9iySx574yN/xY/pdDhccFSEcuAFEvFDKFv04gRew3wFBqAvBqnOAebpCKoYMyqAxHw4uXR8eivxCuOf4XUq2e/56Wf4M3H1DTm9sREKrF28T6w761URjqFUu07Gq3zY2swOBSoT+0p2oNrLsQrtQWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749250360; c=relaxed/simple;
	bh=xmqTfA1fTFz/us+UCP9HdDKC8XwjjFYn4CEkAQDF4zU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HTukHhn+qUhWnsQGcU6HZI4bWqczjGICP9K2W2LkhmrX2KaIGB3Pcy+u2YaMsEaw9vNVFgZjUVpil8hfWv8uLPLXL4fnHzpYYqGb24e5/snUmzmnnN3zq4Pjve7NGupLOZHt745vLonxFuwLAo4+8oxVWOnkI91ly6XoMlInTSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MiJ046af; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MiJ046af"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749250358; x=1780786358;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xmqTfA1fTFz/us+UCP9HdDKC8XwjjFYn4CEkAQDF4zU=;
  b=MiJ046afernOtn7MebtIO3u7h51YAvFLJKoTZJ5GS455Jx7Fv9XCaapN
   7xEBWzzfUkfHVMZEaAmIO6g17AA61QsbHr/6cOOr2Et3uNmTZkZKQ3Kor
   4wMn16IxT1IntRpLTgAlCjhgS/qril8CwDbBSNOIROGla7E80fdehMX9e
   z7nOfQtrI3ri3jVknvb7tWs3LJd5299r5i3BbviXQmEe/ZBAltHWBZqj1
   wgLHqFEQXRvLD3cyBcfJnVNSBiN8ZyIff6GyHFZKUmSQad/Sk/CDxY+wX
   ujMhXH6nwYQbGghIyf7PAYIw5qCqk360zw7IkkuXA6y/SqiidooxlH5HZ
   A==;
X-CSE-ConnectionGUID: tQpnelsZS3atPDRL5ngPug==
X-CSE-MsgGUID: qPhZtOxSSqOWTthdXEo7LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="73939292"
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; 
   d="scan'208";a="73939292"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 15:52:36 -0700
X-CSE-ConnectionGUID: 8ENCYZnyQvaPVIIViAoMvA==
X-CSE-MsgGUID: a85zSygtTuaAkNRmYmKT+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; 
   d="scan'208";a="169138500"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Jun 2025 15:52:34 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNfvM-0005KC-2l;
	Fri, 06 Jun 2025 22:52:32 +0000
Date: Sat, 7 Jun 2025 06:51:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ld.lld: error: Function Import: link error: linking module flags
 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at
 870780), and 'i32 1' from vmlinux.a(mballoc.o at 901800)
Message-ID: <202506070617.O7yPB5MW-lkp@intel.com>
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
TO: Masahiro Yamada <masahiroy@kernel.org>

Hi Masahiro,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c0c9379f235df33a12ceae94370ad80c5278324d
commit: 695ed93bb30e03e9f826ee70abdd83f970741a37 kbuild: fix Clang LTO with CONFIG_OBJTOOL=n
date:   4 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 4 months ago
config: riscv-randconfig-001-20250607 (https://download.01.org/0day-ci/archive/20250607/202506070617.O7yPB5MW-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250607/202506070617.O7yPB5MW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506070617.O7yPB5MW-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 870780), and 'i32 1' from vmlinux.a(e1000_main.o at 975540)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 870780), and 'i32 1' from vmlinux.a(net-traces.o at 999960)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 870780), and 'i32 1' from vmlinux.a(hugetlb.o at 890520)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 870780), and 'i32 1' from vmlinux.a(trace.o at 881700)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 870780), and 'i32 1' from vmlinux.a(tcp.o at 1003740)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 870780), and 'i32 1' from vmlinux.a(skbuff.o at 997800)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 870780), and 'i32 1' from vmlinux.a(core.o at 973860)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 870780), and 'i32 1' from vmlinux.a(syscall.o at 883920)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 870780), and 'i32 1' from vmlinux.a(slub.o at 890400)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 870780), and 'i32 1' from vmlinux.a(super.o at 912660)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 870780), and 'i32 1' from vmlinux.a(filter.o at 998880)
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 870780), and 'i32 1' from vmlinux.a(mballoc.o at 901800)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 870780), and 'i32 1' from vmlinux.a(page_alloc.o at 890100)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 870780), and 'i32 1' from vmlinux.a(core.o at 886860)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 870780), and 'i32 1' from vmlinux.a(vmscan.o at 888060)
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 870780), and 'i32 1' from vmlinux.a(volumes.o at 913800)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 870780), and 'i32 1' from vmlinux.a(af_packet.o at 1009260)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 870780), and 'i32 1' from vmlinux.a(ring_buffer.o at 881640)
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 870780), and 'i32 1' from vmlinux.a(inode.o at 913260)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 870780), and 'i32 1' from vmlinux.a(core.o at 883860)
   ld.lld: error: too many errors emitted, stopping now (use --error-limit=0 to see all errors)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
