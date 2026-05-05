Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A99E264614
	for <oe-kbuild@lists.linux.dev>; Tue,  5 May 2026 17:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778001427; cv=none; b=oi2zVriUjvuaqfH3FRTskwPaDjVWSCPmz+QQVf0NNfbtedJfaHjGM1dBhr2dJGWG+lRm7+2ufko4B2FwZodnKu3LIcKt7m/G0mzFxHmNKgsotkn7mbUwZd3gEBS+g2Focs6TgbPbV7PYCr8wHqwKXxZFVSC4tAeuxlGVHSL4BKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778001427; c=relaxed/simple;
	bh=B+NFbhmw4vcBiluzlQDw5uAMTWnI+KUvBl9dySnGyDs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HqreXV16Ff0bdQzbRXd1GeXIyqmgUqqh7rxyeCvU2XWDf7yuoeNdTz2gXqG4y92af0L6HrTeciKeXRlFXOIIryuWGme/MbPr6AnVjHDcayWB2C7MLQq9WNgRDlalaQqA16H5gHyRO/uMcfSXUDiJCISuNWDxduprD4X45RmR3Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QF9E9jHG; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QF9E9jHG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778001424; x=1809537424;
  h=date:from:to:cc:subject:message-id;
  bh=B+NFbhmw4vcBiluzlQDw5uAMTWnI+KUvBl9dySnGyDs=;
  b=QF9E9jHGdkJSAb2H8Vy2yQvRsgcc5QUiEVU/+NoTcwftgNAz3DZ9z6YR
   drsbu9PDWb3jQqv3PmG5xIzfOgJUQI1cq287Xz0Xgiyj2f+3Z3kWfomtX
   HMDuHZbg4oHy8DQDmsQWtkG3HyhlFVgF2K6ELI9jLAWUZbarErf1jpIfz
   QuXxvFBMC/+r44dRQSTjaSdHdrJD4MdRuBR6gB2PXPGd0WDnN/+5QDa02
   mGsQt8QGd5MrSl5YmF1Sjs5CgGlqhHX6PUBVyy9rjCBV0rAJfOcpkglC4
   uZQMWi0o8Q/H5ExIfXOdJCLqKpXSZFcV4qJG0CF44FFnV9dpoRjQ8b6f5
   Q==;
X-CSE-ConnectionGUID: 1k7349XiR5ibUoWWKbLEdA==
X-CSE-MsgGUID: nru1Qg4LSWiuA7ZXmUB6Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="104332092"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; 
   d="scan'208";a="104332092"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 10:17:03 -0700
X-CSE-ConnectionGUID: xOdHdgDpSrKAYA/Ko/w5KA==
X-CSE-MsgGUID: Sq6LI8QfQgu1uHPMM30XSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; 
   d="scan'208";a="274009066"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 05 May 2026 10:17:02 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKJOF-000000006HV-3UKl;
	Tue, 05 May 2026 17:16:59 +0000
Date: Tue, 05 May 2026 19:16:20 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [boqun:rust-sync 9/12] ././include/linux/kconfig.h:26:72:
 error: expected string literal before numeric constant
Message-ID: <202605051943.loCLklg4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Boqun Feng <boqun@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git rust-sync
head:   5529e3c510be8f9dcb15d4fe821789d60cdd49d5
commit: 40c3e04e2248c0e5d78d23e6767a1c58d5678eac [9/12] preempt: x86: Avoid tracking NMI separately when 64BIT=y
:::::: branch date: 2 hours ago
:::::: commit date: 3 hours ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260505/202605051943.loCLklg4-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260505/202605051943.loCLklg4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605051943.loCLklg4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./arch/x86/include/asm/preempt.h:5,
                    from ./include/linux/preempt.h:92,
                    from ./include/linux/spinlock.h:56,
                    from ./include/linux/swait.h:7,
                    from ./include/linux/completion.h:12,
                    from ./include/linux/crypto.h:15,
                    from arch/x86/kernel/asm-offsets.c:9:
   ./arch/x86/include/asm/preempt.h: In function '__preempt_count_dec_and_test':
>> ././include/linux/kconfig.h:26:72: error: expected string literal before numeric constant
      26 | #define ____or(arg1_or_junk, y)         __take_second_arg(arg1_or_junk 1, y)
         |                                                                        ^
   ./arch/x86/include/asm/rmwcc.h:12:30: note: in definition of macro '__GEN_RMWcc'
      12 |         asm_inline volatile (fullop                                     \
         |                              ^~~~~~
   ./include/linux/args.h:25:24: note: in expansion of macro 'GEN_UNARY_RMWcc_4'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   ./arch/x86/include/asm/preempt.h:126:16: note: in expansion of macro 'GEN_UNARY_RMWcc'
     126 |         return GEN_UNARY_RMWcc(IS_ENABLED(CONFIG_PREEMPT_LONG) ? "decq":
         |                ^~~~~~~~~~~~~~~
   ././include/linux/kconfig.h:26:41: note: in expansion of macro '__take_second_arg'
      26 | #define ____or(arg1_or_junk, y)         __take_second_arg(arg1_or_junk 1, y)
         |                                         ^~~~~~~~~~~~~~~~~
   ././include/linux/kconfig.h:25:41: note: in expansion of macro '____or'
      25 | #define ___or(x, y)                     ____or(__ARG_PLACEHOLDER_##x, y)
         |                                         ^~~~~~
   ././include/linux/kconfig.h:24:41: note: in expansion of macro '___or'
      24 | #define __or(x, y)                      ___or(x, y)
         |                                         ^~~~~
   ././include/linux/kconfig.h:73:28: note: in expansion of macro '__or'
      73 | #define IS_ENABLED(option) __or(IS_BUILTIN(option), IS_MODULE(option))
         |                            ^~~~
   ./arch/x86/include/asm/preempt.h:126:32: note: in expansion of macro 'IS_ENABLED'
     126 |         return GEN_UNARY_RMWcc(IS_ENABLED(CONFIG_PREEMPT_LONG) ? "decq":
         |                                ^~~~~~~~~~
--
   In file included from arch/x86/include/asm/asm.h:130,
                    from arch/x86/include/asm/jump_label.h:7,
                    from include/linux/jump_label.h:106,
                    from arch/x86/include/asm/string_64.h:6,
                    from arch/x86/include/asm/string.h:8,
                    from include/linux/string.h:65,
                    from arch/x86/include/asm/io.h:38,
                    from include/linux/io.h:12,
                    from include/linux/libnvdimm.h:10,
                    from ../../../drivers/nvdimm/core.c:5:
>> arch/x86/include/asm/asm-offsets.h:1:10: fatal error: generated/asm-offsets.h: No such file or directory
       1 | #include <generated/asm-offsets.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +26 ././include/linux/kconfig.h

5e8754fd80b0a5 Masahiro Yamada 2016-06-14  23  
5e8754fd80b0a5 Masahiro Yamada 2016-06-14  24  #define __or(x, y)			___or(x, y)
5e8754fd80b0a5 Masahiro Yamada 2016-06-14  25  #define ___or(x, y)			____or(__ARG_PLACEHOLDER_##x, y)
5e8754fd80b0a5 Masahiro Yamada 2016-06-14 @26  #define ____or(arg1_or_junk, y)		__take_second_arg(arg1_or_junk 1, y)
5e8754fd80b0a5 Masahiro Yamada 2016-06-14  27  

:::::: The code at line 26 was first introduced by commit
:::::: 5e8754fd80b0a594f720f44d32bf28c7b06ba5a6 kconfig.h: allow to use IS_{ENABLE,REACHABLE} in macro expansion

:::::: TO: Masahiro Yamada <yamada.masahiro@socionext.com>
:::::: CC: Michal Marek <mmarek@suse.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
