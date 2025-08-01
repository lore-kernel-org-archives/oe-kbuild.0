Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212493398A
	for <oe-kbuild@lists.linux.dev>; Fri,  1 Aug 2025 01:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754013601; cv=none; b=bAGl4B4YSqXuXN7acQbMDbgGWQBxczCS5LjgbJl27dqRheVklEneUzkWNOBMqP3LRmbv3MHDFIcUewl8KGamY309k1lPVVEtMiNKt3KtCkxs8ubUaxP82BGLA/ftq852Jh7AS8PvpHi1EGAZku9fUtWKbb+QXxl68CCJFnt1928=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754013601; c=relaxed/simple;
	bh=MvOXbTfG+WC/VBQ5GuBWSjD6P+hJpLaq3SBHRdcqEhE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OXt74PruqndEnFRiBJ8sC4qD30kJM3wMQB4cM/BYtUNReONybmaZpEtUfHea2RxQpK8AUGB5qw1r7nqks3Fi/WhUOAVRKhSr09/g3lQ/fol4cyVPsIfztzt0YcPN4Ftp/9nxAB4SnEH1g96CePdQcKlwWD+4G8iVVU7QjTfclO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Unli4/Nv; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Unli4/Nv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754013600; x=1785549600;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MvOXbTfG+WC/VBQ5GuBWSjD6P+hJpLaq3SBHRdcqEhE=;
  b=Unli4/Nv0raz/peQR5mwVWZP1Q7qBP9VbLmyza7z1fE1jZS1KVw8JeRX
   u1E0hIFsN/hV2Ww1csD1BvZ+Y8Pz0uAeJFsavQu7p+ea4MDAfV9G91H9B
   xBiq8w2FmGkeLxYDgaU4AkdFa5TF0c79EfAP1KW5LrJ3KlS7l1ECCdJ7u
   p8le431iBvUTQIcYubscRONPBkzcoLY9HLTc69YJtG0tfxBBELubPg+HC
   fhe/dwhXZHV+jtca8bNpDGWJb8spn9zPjnw7gJnIO2Q68C6mR+ARxEhtJ
   hzuw+KfztmPx4GiJSbxCqclq+9yEFJ9sojuR874XiFdzErRA5y5ANCAA2
   A==;
X-CSE-ConnectionGUID: J8tX9sLCST+/RGvEmgyl1A==
X-CSE-MsgGUID: tBNh4K/XQcyRpKajDcVhtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56499909"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="56499909"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 19:00:00 -0700
X-CSE-ConnectionGUID: Gj44VEnjTCiDqZXllQui6Q==
X-CSE-MsgGUID: WpjmdLfbRl6BQw09XXZl+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="164218471"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 31 Jul 2025 18:59:59 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhf3s-0004Hu-0q;
	Fri, 01 Aug 2025 01:59:56 +0000
Date: Fri, 1 Aug 2025 09:59:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ld.lld: error: Function Import: link error: linking module flags
 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at
 1094840), and 'i32 1' from vmlinux.a(advansys.o at 1268120)
Message-ID: <202508010953.RiiABHSP-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6a68cec16b647791d448102376a7eec2820e874f
commit: 695ed93bb30e03e9f826ee70abdd83f970741a37 kbuild: fix Clang LTO with CONFIG_OBJTOOL=n
date:   6 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 6 months ago
config: riscv-randconfig-001-20250801 (https://download.01.org/0day-ci/archive/20250801/202508010953.RiiABHSP-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 8f09b03aebb71c154f3bbe725c29e3f47d37c26e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250801/202508010953.RiiABHSP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508010953.RiiABHSP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1094840), and 'i32 1' from vmlinux.a(advansys.o at 1268120)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1094840), and 'i32 1' from vmlinux.a(core.o at 1108160)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1094840), and 'i32 1' from vmlinux.a(ring_buffer.o at 1106120)
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1094840), and 'i32 1' from vmlinux.a(huge_memory.o at 1115360)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1094840), and 'i32 1' from vmlinux.a(trace.o at 1106180)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1094840), and 'i32 1' from vmlinux.a(slub.o at 1114640)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1094840), and 'i32 1' from vmlinux.a(mballoc.o at 1126280)
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1094840), and 'i32 1' from vmlinux.a(syscall.o at 1108220)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1094840), and 'i32 1' from vmlinux.a(page_alloc.o at 1114340)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1094840), and 'i32 1' from vmlinux.a(vmalloc.o at 1114100)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1094840), and 'i32 1' from vmlinux.a(segment.o at 1146140)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1094840), and 'i32 1' from vmlinux.a(spi.o at 1274360)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1094840), and 'i32 1' from vmlinux.a(core.o at 1271600)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1094840), and 'i32 1' from vmlinux.a(vmscan.o at 1112240)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1094840), and 'i32 1' from vmlinux.a(data.o at 1146020)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1094840), and 'i32 1' from vmlinux.a(memory.o at 1113380)
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1094840), and 'i32 1' from vmlinux.a(inode.o at 1126160)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1094840), and 'i32 1' from vmlinux.a(file.o at 1145540)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1094840), and 'i32 1' from vmlinux.a(core.o at 1110800)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1094840), and 'i32 1' from vmlinux.a(super.o at 1145780)
   ld.lld: error: too many errors emitted, stopping now (use --error-limit=0 to see all errors)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
