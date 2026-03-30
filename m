Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0CA4C6D
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Mar 2026 00:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774829772; cv=none; b=tl8RJu+bwUGmSCS70vh0Vm2AhpcoinoaGoyZKAYAAyCBWlUVrLFB/M0hQ/Kf2soEkasnGHsqgybYQwYFuBTS6KgtHogppaExd6y/EbdNp6B8zlaok0ap4Oq75hiM3HuKbj1NM5rNR8Mst3SvIfQskcz6ZLZ+KtYb3pHHmXb/Ksc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774829772; c=relaxed/simple;
	bh=KY04GoxBj2jXhQmJdTti24SgcYzAdrDz/9D2UBHmcUc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q6N1B5CJUUglI7lfaOiVWFckDrjrCvCM20i5mrp+uhtEJtCb2rcl9mEfpUYk3JnMTtkV+7d0oB5cJsUO/gpMvtOpNSmq3ZCtxAorD1mAi+UsdZT9mwgPyLnwVGAL2cHNxnYddWyIiu52X60+/Wcpy3MniNOP/sUiG2s5IRjWb88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LYWTv7gY; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LYWTv7gY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774829771; x=1806365771;
  h=date:from:to:cc:subject:message-id;
  bh=KY04GoxBj2jXhQmJdTti24SgcYzAdrDz/9D2UBHmcUc=;
  b=LYWTv7gYaJfYlaOqjsyfc8Rf8S1A6qyjMb3Sgt4/mqO0dgdGje2yJPqb
   YuJ1xwSFATMPbLsq248Af9vwan74j3kgjjpPv7jRnoVKjn+pb/fdYwLGv
   T4x7+gNg7nnBAOyfoj8Pym8KUp1IOvHOWrbvZjypGVCIG7LChbdE1An6L
   Zl0DZdC5bXZ2mIhtTqiuKII8P5+Ottk89fXVxTNqXMaj5nZ/1/1w8EebQ
   SZHVzVw67vXHW1WTjfsLAnnoGugY+Hp/m7gWJQaJCI4fY5cQuwR+syaSg
   dP488TrQ2N+/A2atpXD++HsjgcbViobBhi8J6ujGY08ClAm+jVbqS4ZaM
   g==;
X-CSE-ConnectionGUID: qFJS7pGwQgSpWOh9Ad84Nw==
X-CSE-MsgGUID: OpXWtDXEQ+qC2mteZGE30g==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="86511535"
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="86511535"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2026 17:16:10 -0700
X-CSE-ConnectionGUID: mc+SPwk3RhWNYr888Iyugw==
X-CSE-MsgGUID: PBIJvALYQMy96+hfha6IiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="225892184"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 Mar 2026 17:16:09 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w70IY-000000000RB-25x1;
	Mon, 30 Mar 2026 00:16:06 +0000
Date: Mon, 30 Mar 2026 08:15:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: scripts/mod/modpost.c:57:13: warning: variable 'extra_warn'
 set but not used
Message-ID: <202603300830.fbqcSGEA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
CC: Masahiro Yamada <masahiroy@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7aaa8047eafd0bd628065b15757d9b48c5f9c07d
commit: 6c6c1fc09de35f409f6971cb9e881103afe5dbe0 modpost: require a MODULE_DESCRIPTION()
date:   1 year ago
:::::: branch date: 86 minutes ago
:::::: commit date: 1 year ago
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20260330/202603300830.fbqcSGEA-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603300830.fbqcSGEA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603300830.fbqcSGEA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> scripts/mod/modpost.c:57:13: warning: variable 'extra_warn' set but not used [-Wunused-but-set-global]
      57 | static bool extra_warn;
         |             ^
   1 warning generated.
--
   scripts/dtc/dtc-lexer.lex.c:630:12: warning: variable 'dts_version' set but not used [-Wunused-but-set-global]
     630 | static int dts_version = 1;
         |            ^
   1 warning generated.
   scripts/sorttable.c:399:12: warning: variable 'long_size' set but not used [-Wunused-but-set-global]
     399 | static int long_size;
         |            ^
   1 warning generated.
>> scripts/mod/modpost.c:57:13: warning: variable 'extra_warn' set but not used [-Wunused-but-set-global]
      57 | static bool extra_warn;
         |             ^
   1 warning generated.
   In file included from arch/loongarch/kernel/asm-offsets.c:12:
   In file included from include/linux/kvm_host.h:45:
   In file included from arch/loongarch/include/asm/kvm_host.h:20:
   In file included from arch/loongarch/include/asm/kvm_mmu.h:11:
   arch/loongarch/include/asm/tlb.h:142:24: warning: default initialization of an object of type 'struct vm_area_struct' with const member leaves the object uninitialized [-Wdefault-const-init-field-unsafe]
     142 |         struct vm_area_struct vma;
         |                               ^
   include/linux/mm_types.h:707:20: note: member 'vm_flags' declared 'const' here
     707 |                 const vm_flags_t vm_flags;
         |                                  ^
   1 warning generated.


vim +/extra_warn +57 scripts/mod/modpost.c

0fd3fbadd9a85e3 Masahiro Yamada 2020-12-01  56  
20ff36856fe0087 Masahiro Yamada 2023-06-06 @57  static bool extra_warn;
20ff36856fe0087 Masahiro Yamada 2023-06-06  58  

:::::: The code at line 57 was first introduced by commit
:::::: 20ff36856fe00879f82de71fe6f1482ca1b72334 modpost: propagate W=1 build option to modpost

:::::: TO: Masahiro Yamada <masahiroy@kernel.org>
:::::: CC: Masahiro Yamada <masahiroy@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
