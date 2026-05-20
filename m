Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38A7E573
	for <oe-kbuild@lists.linux.dev>; Wed, 20 May 2026 00:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779238112; cv=none; b=M9oKa3Ag55CKZuCA56Yfd24qET1SoRUGJvb/uZlbv8u2OEFUt6XrUxqDTUvTkEsBEeO2DDeOnGJMtaSFIwVivAaIlEuD30XsoVaBr5ie9UyerSCMcjxQzKB4fwGS6/lMZPT3Fen0y9HyXzRWa8vdF+CYUSvp1jsvo2U1Wpl4b+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779238112; c=relaxed/simple;
	bh=6lGIbjrgDmQf69PJ68prcXDwPFS+bV2ItuXSiLlwfdI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TnFcIgB2IQyI2hUG2dCFz/bqNEnowRHv4AvIS67a61bmC8s8rax0ggHg13jz9Pg1GuMfApW7HQBXj6KhxF2/gSdbtsdoDfurEtl7pigdeQNuJm0T8WsG2PSu9n13hOGVxT35xh8TBdKUJko00Ds0PA8avKcJ7IgB+ti6oQicN1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UrQUERML; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UrQUERML"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779238102; x=1810774102;
  h=date:from:to:cc:subject:message-id;
  bh=6lGIbjrgDmQf69PJ68prcXDwPFS+bV2ItuXSiLlwfdI=;
  b=UrQUERMLG491CEzEmEH+3hKQqtHNItfSE3u++TLaee2gsjBzj2ZmZiZh
   xbhNHux5MTB5d+MyUoy1UBgIebhoa1Afj/DxsuoAkjG5mHWDtoMNDf3ji
   XYMvIsAYEN68B+XepxEl39eJq7bYokQ+K56ZyMPFrcbOK01Vlkrl1/grA
   jRI5gyceolzIePpaKcUj0P/H+t50TjBEQxxlJNLghDSyppiSyJxe9qNja
   ywRz+TkmQWue20C3slqnsPFOZRql6P+rYNmHzlz0h5sfMzh+PZHxUKlEk
   mjz96BWwI3hvN65CflyuYUvH1t1+peGfp4StlcCP+a8G7X3t6Dmu9VlCw
   w==;
X-CSE-ConnectionGUID: nAMIf5XATtiKrBtoWpMqTg==
X-CSE-MsgGUID: NY8UPOX3Q+uN/P8Svs739w==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="90429369"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="90429369"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 17:48:22 -0700
X-CSE-ConnectionGUID: 7HTi0LfkTOygzHkX0vr9iw==
X-CSE-MsgGUID: 9lyCUhCKTC+V1ysyLhyXcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="263461026"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 19 May 2026 17:48:18 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPV67-000000002ET-28dG;
	Wed, 20 May 2026 00:47:57 +0000
Date: Wed, 20 May 2026 08:47:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [akpm-mm:mm-nonmm-unstable 113/128]
 include/uapi/linux/swab.h:73:9: sparse: sparse: Trying to use reserved word
 'return' as identifier
Message-ID: <202605200819.NAtiZbCN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: include/uapi/linux/swab.h:73:9: sparse: sparse: Trying to use reserved word 'return' as identifier"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: David Hildenbrand <david@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: mm-commits@vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   d067a83c8063d1bdcbd9af8e1326d846f85138b8
commit: 6bd91fe379470799a6e439ea1535eddaa9b31fde [113/128] raid6: hide internals
:::::: branch date: 2 hours ago
:::::: commit date: 23 hours ago
config: powerpc-randconfig-r121-20260519 (https://download.01.org/0day-ci/archive/20260520/202605200819.NAtiZbCN-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605200819.NAtiZbCN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605200819.NAtiZbCN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/raid/raid6/powerpc/altivec1.c: note: in included file:
   ../lib/gcc/powerpc-linux/10.5.0/include/altivec.h:34:2: sparse: sparse: Use the "-maltivec" flag to enable PowerPC AltiVec support
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/vdso/processor.h, include/vdso/processor.h, arch/powerpc/include/asm/processor.h, ...):
   arch/powerpc/include/asm/feature-fixups.h:294:13: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/feature-fixups.h:294:13: sparse: sparse: got static_key_feature_checks_initialized
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/processor.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   arch/powerpc/include/asm/reg.h:1414:13: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/reg.h:1414:13: sparse: sparse: got strict_msr_control
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/asm-generic/rwonce.h, arch/powerpc/include/generated/asm/rwonce.h, include/linux/compiler.h, include/asm-generic/bug.h, ...):
   include/linux/kasan-checks.h:22:20: sparse: sparse: Expected ; at end of declaration
   include/linux/kasan-checks.h:22:20: sparse: sparse: got __kasan_check_read
   include/linux/kasan-checks.h:25:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/kasan-checks.h:25:1: sparse: sparse: got }
   include/linux/kasan-checks.h:29:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/kasan-checks.h:29:1: sparse: sparse: got }
   include/linux/kasan-checks.h:43:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/kasan-checks.h:43:1: sparse: sparse: got }
   include/linux/kasan-checks.h:47:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/kasan-checks.h:47:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, include/linux/bug.h, include/linux/thread_info.h, ...):
   include/linux/panic.h:20:13: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:20:13: sparse: sparse: got oops_may_print
   include/linux/panic.h:22:13: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:22:13: sparse: sparse: got panic_triggering_all_cpu_backtrace
   include/linux/panic.h:29:13: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:29:13: sparse: sparse: got panic_on_taint_nousertaint
   include/linux/panic.h:33:13: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:33:13: sparse: sparse: got crash_kexec_post_notifiers
   include/linux/panic.h:54:6: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:54:6: sparse: sparse: got panic_try_start
   include/linux/panic.h:56:6: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:56:6: sparse: sparse: got panic_in_progress
   include/linux/panic.h:57:6: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:57:6: sparse: sparse: got panic_on_this_cpu
   include/linux/panic.h:58:6: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:58:6: sparse: sparse: got panic_on_other_cpu
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/printk.h, include/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, include/linux/bug.h, ...):
   include/linux/init.h:165:13: sparse: sparse: Expected ; at end of declaration
   include/linux/init.h:165:13: sparse: sparse: got rodata_enabled
   include/linux/init.h:170:13: sparse: sparse: Expected ; at end of declaration
   include/linux/init.h:170:13: sparse: sparse: got initcall_debug
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/bits.h, include/linux/ratelimit_types.h, include/linux/printk.h, include/asm-generic/bug.h, ...):
   include/linux/overflow.h:45:42: sparse: sparse: Expected ; at end of declaration
   include/linux/overflow.h:45:42: sparse: sparse: got __must_check_overflow
   include/linux/overflow.h:48:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/overflow.h:48:1: sparse: sparse: got }
   include/linux/overflow.h:334:13: sparse: sparse: Expected ) in function declarator
   include/linux/overflow.h:334:13: sparse: sparse: got (
   include/linux/overflow.h:334:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/overflow.h:337:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/overflow.h:337:16: sparse: sparse: Expected ; at end of declaration
   include/linux/overflow.h:337:16: sparse: sparse: got bytes
   include/linux/overflow.h:338:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/overflow.h:338:1: sparse: sparse: got }
   include/linux/overflow.h:353:13: sparse: sparse: Expected ) in function declarator
   include/linux/overflow.h:353:13: sparse: sparse: got (
   include/linux/overflow.h:353:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/overflow.h:356:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/overflow.h:356:16: sparse: sparse: Expected ; at end of declaration
   include/linux/overflow.h:356:16: sparse: sparse: got bytes
   include/linux/overflow.h:357:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/overflow.h:357:1: sparse: sparse: got }
   include/linux/overflow.h:374:21: sparse: sparse: Expected ) in function declarator
   include/linux/overflow.h:374:21: sparse: sparse: got ==
   include/linux/overflow.h:374:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/overflow.h:378:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/overflow.h:378:16: sparse: sparse: Expected ; at end of declaration
   include/linux/overflow.h:378:16: sparse: sparse: got bytes
   include/linux/overflow.h:379:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/overflow.h:379:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/swab.h, include/uapi/linux/byteorder/big_endian.h, include/linux/byteorder/big_endian.h, ...):
   include/uapi/linux/swab.h:55:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:55:1: sparse: sparse: got }
   include/uapi/linux/swab.h:64:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:64:1: sparse: sparse: got }
   include/uapi/linux/swab.h:73:17: sparse: sparse: Expected ) in function declarator
   include/uapi/linux/swab.h:73:17: sparse: sparse: got (
>> include/uapi/linux/swab.h:73:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/uapi/linux/swab.h:77:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:77:1: sparse: sparse: got }
   include/uapi/linux/swab.h:86:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:86:1: sparse: sparse: got }
   include/uapi/linux/swab.h:95:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:95:1: sparse: sparse: got }
   include/uapi/linux/swab.h:143:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:143:1: sparse: sparse: got }
   include/uapi/linux/swab.h:178:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:178:1: sparse: sparse: got }
   include/uapi/linux/swab.h:191:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:191:1: sparse: sparse: got }
   include/uapi/linux/swab.h:204:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:204:1: sparse: sparse: got }
   include/uapi/linux/swab.h:219:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:219:1: sparse: sparse: got }
   include/uapi/linux/swab.h:234:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:234:1: sparse: sparse: got }
   include/uapi/linux/swab.h:247:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:247:1: sparse: sparse: got }
   include/uapi/linux/swab.h:259:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:259:1: sparse: sparse: got }
   include/uapi/linux/swab.h:272:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:272:1: sparse: sparse: got }
   include/uapi/linux/swab.h:287:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:287:1: sparse: sparse: got }
   include/uapi/linux/swab.h:302:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:302:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/uapi/linux/byteorder/big_endian.h, include/linux/byteorder/big_endian.h, arch/powerpc/include/uapi/asm/byteorder.h, ...):
   include/linux/swab.h:28:20: sparse: sparse: Expected ; at end of declaration
   include/linux/swab.h:28:20: sparse: sparse: got ++
   include/linux/swab.h:29:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/swab.h:29:9: sparse: sparse: got }
   include/linux/swab.h:36:20: sparse: sparse: Expected ; at end of declaration
   include/linux/swab.h:36:20: sparse: sparse: got ++
   include/linux/swab.h:37:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/swab.h:37:9: sparse: sparse: got }
   include/linux/swab.h:44:20: sparse: sparse: Expected ; at end of declaration
   include/linux/swab.h:44:20: sparse: sparse: got ++
   include/linux/swab.h:45:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/swab.h:45:9: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/byteorder/big_endian.h, arch/powerpc/include/uapi/asm/byteorder.h, arch/powerpc/include/asm/qspinlock_types.h, ...):
   include/uapi/linux/byteorder/big_endian.h:48:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/byteorder/big_endian.h:48:1: sparse: sparse: got }
   include/uapi/linux/byteorder/big_endian.h:52:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/byteorder/big_endian.h:52:1: sparse: sparse: got }
   include/uapi/linux/byteorder/big_endian.h:56:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/byteorder/big_endian.h:56:1: sparse: sparse: got }
   include/uapi/linux/byteorder/big_endian.h:60:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/byteorder/big_endian.h:60:1: sparse: sparse: got }
   include/uapi/linux/byteorder/big_endian.h:64:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/byteorder/big_endian.h:64:1: sparse: sparse: got }
   include/uapi/linux/byteorder/big_endian.h:68:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/byteorder/big_endian.h:68:1: sparse: sparse: got }
   include/uapi/linux/byteorder/big_endian.h:72:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/byteorder/big_endian.h:72:1: sparse: sparse: got }
   include/uapi/linux/byteorder/big_endian.h:76:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/byteorder/big_endian.h:76:1: sparse: sparse: got }
   include/uapi/linux/byteorder/big_endian.h:80:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/byteorder/big_endian.h:80:1: sparse: sparse: got }
   include/uapi/linux/byteorder/big_endian.h:84:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/byteorder/big_endian.h:84:1: sparse: sparse: got }
   include/uapi/linux/byteorder/big_endian.h:88:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/byteorder/big_endian.h:88:1: sparse: sparse: got }
   include/uapi/linux/byteorder/big_endian.h:92:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/byteorder/big_endian.h:92:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/byteorder/big_endian.h, arch/powerpc/include/uapi/asm/byteorder.h, arch/powerpc/include/asm/qspinlock_types.h, ...):
   include/linux/byteorder/generic.h:147:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:147:1: sparse: sparse: got }
   include/linux/byteorder/generic.h:152:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:152:1: sparse: sparse: got }
   include/linux/byteorder/generic.h:157:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:157:1: sparse: sparse: got }
   include/linux/byteorder/generic.h:164:20: sparse: sparse: Expected ; at end of declaration
   include/linux/byteorder/generic.h:164:20: sparse: sparse: got ++
   include/linux/byteorder/generic.h:165:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:165:9: sparse: sparse: got }
   include/linux/byteorder/generic.h:172:20: sparse: sparse: Expected ; at end of declaration
   include/linux/byteorder/generic.h:172:20: sparse: sparse: got ++
   include/linux/byteorder/generic.h:173:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:173:9: sparse: sparse: got }
   include/linux/byteorder/generic.h:180:20: sparse: sparse: Expected ; at end of declaration
   include/linux/byteorder/generic.h:180:20: sparse: sparse: got ++
   include/linux/byteorder/generic.h:181:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:181:9: sparse: sparse: got }
   include/linux/byteorder/generic.h:188:20: sparse: sparse: Expected ; at end of declaration
   include/linux/byteorder/generic.h:188:20: sparse: sparse: got ++
   include/linux/byteorder/generic.h:189:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:189:9: sparse: sparse: got }
   include/linux/byteorder/generic.h:196:16: sparse: sparse: Expected ) in function declarator
   include/linux/byteorder/generic.h:196:16: sparse: sparse: got =
>> include/linux/byteorder/generic.h:196:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   include/linux/byteorder/generic.h:196:23: sparse: sparse: Expected ; at end of declaration
   include/linux/byteorder/generic.h:196:23: sparse: sparse: got <
   include/linux/byteorder/generic.h:196:33: sparse: sparse: Expected ; at end of declaration
   include/linux/byteorder/generic.h:196:33: sparse: sparse: got ++
   include/linux/byteorder/generic.h:198:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:198:1: sparse: sparse: got }
   include/linux/byteorder/generic.h:204:16: sparse: sparse: Expected ) in function declarator
   include/linux/byteorder/generic.h:204:16: sparse: sparse: got =
   include/linux/byteorder/generic.h:204:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   include/linux/byteorder/generic.h:204:23: sparse: sparse: Expected ; at end of declaration
   include/linux/byteorder/generic.h:204:23: sparse: sparse: got <
   include/linux/byteorder/generic.h:204:33: sparse: sparse: Expected ; at end of declaration
   include/linux/byteorder/generic.h:204:33: sparse: sparse: got ++
   include/linux/byteorder/generic.h:206:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:206:1: sparse: sparse: got }
   include/linux/byteorder/generic.h:211:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:211:1: sparse: sparse: got }
   include/linux/byteorder/generic.h:216:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:216:1: sparse: sparse: got }
   include/linux/byteorder/generic.h:221:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:221:1: sparse: sparse: got }
   include/linux/byteorder/generic.h:227:16: sparse: sparse: Expected ) in function declarator
   include/linux/byteorder/generic.h:227:16: sparse: sparse: got =
   include/linux/byteorder/generic.h:227:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   include/linux/byteorder/generic.h:227:23: sparse: sparse: Expected ; at end of declaration
   include/linux/byteorder/generic.h:227:23: sparse: sparse: got <
   include/linux/byteorder/generic.h:227:31: sparse: sparse: Expected ; at end of declaration
   include/linux/byteorder/generic.h:227:31: sparse: sparse: got ++
   include/linux/byteorder/generic.h:229:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:229:1: sparse: sparse: got }
   include/linux/byteorder/generic.h:235:16: sparse: sparse: Expected ) in function declarator
   include/linux/byteorder/generic.h:235:16: sparse: sparse: got =
   include/linux/byteorder/generic.h:235:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   include/linux/byteorder/generic.h:235:23: sparse: sparse: Expected ; at end of declaration
   include/linux/byteorder/generic.h:235:23: sparse: sparse: got <
   include/linux/byteorder/generic.h:235:31: sparse: sparse: Expected ; at end of declaration
   include/linux/byteorder/generic.h:235:31: sparse: sparse: got ++
   include/linux/byteorder/generic.h:237:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:237:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/spinlock_types.h, include/linux/spinlock_types_raw.h, include/linux/ratelimit_types.h, ...):
   arch/powerpc/include/asm/qspinlock_types.h:23:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/qspinlock_types.h:23:9: sparse: sparse: got }
   arch/powerpc/include/asm/qspinlock_types.h:24:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/qspinlock_types.h:24:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/spinlock_types.h, include/linux/spinlock_types_raw.h, include/linux/ratelimit_types.h, ...):
   include/asm-generic/qrwlock_types.h:26:33: sparse: sparse: expected ; at end of declaration
   include/asm-generic/qrwlock_types.h:26:33: sparse: sparse: Expected } at end of specifier
   include/asm-generic/qrwlock_types.h:26:33: sparse: sparse: got wait_lock
   include/asm-generic/qrwlock_types.h:27:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/qrwlock_types.h:27:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/ratelimit_types.h, include/linux/printk.h, include/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, ...):
   include/linux/spinlock_types_raw.h:15:25: sparse: sparse: expected ; at end of declaration
   include/linux/spinlock_types_raw.h:15:25: sparse: sparse: Expected } at end of specifier
   include/linux/spinlock_types_raw.h:15:25: sparse: sparse: got raw_lock
   include/linux/spinlock_types_raw.h:23:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/spinlock_types_raw.h:23:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, include/linux/bug.h, include/linux/thread_info.h, ...):
   include/linux/printk.h:188:13: sparse: sparse: Expected ; at end of declaration
   include/linux/printk.h:188:13: sparse: sparse: got printk_timed_ratelimit
   include/linux/printk.h:208:13: sparse: sparse: Expected ; at end of declaration
   include/linux/printk.h:208:13: sparse: sparse: got nbcon_device_try_acquire
   include/linux/printk.h:211:6: sparse: sparse: Expected ; at end of declaration
   include/linux/printk.h:211:6: sparse: sparse: got pr_flush
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/cleanup.h, include/linux/jump_label.h, include/linux/dynamic_debug.h, include/linux/printk.h, ...):
   include/linux/err.h:76:33: sparse: sparse: Expected ; at end of declaration
   include/linux/err.h:76:33: sparse: sparse: got IS_ERR
   include/linux/err.h:79:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/err.h:79:1: sparse: sparse: got }
   include/linux/err.h:93:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/err.h:93:1: sparse: sparse: got }
   include/linux/err.h:106:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/err.h:106:1: sparse: sparse: got }
   include/linux/err.h:129:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   include/linux/err.h:130:17: sparse: sparse: Expected ; at end of declaration
   include/linux/err.h:130:17: sparse: sparse: got return
   include/linux/err.h:131:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/err.h:131:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/jump_label.h, include/linux/dynamic_debug.h, include/linux/printk.h, include/asm-generic/bug.h, ...):
   include/linux/cleanup.h:225:15: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cleanup.h:225:15: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/jump_label.h, include/linux/dynamic_debug.h, include/linux/printk.h, include/asm-generic/bug.h, ...):
   arch/powerpc/include/asm/jump_label.h:18:29: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/jump_label.h:18:29: sparse: sparse: got arch_static_branch
   arch/powerpc/include/asm/jump_label.h:28:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/jump_label.h:28:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/jump_label.h:28:16: sparse: sparse: got false
   arch/powerpc/include/asm/jump_label.h:29:6: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/jump_label.h:29:6: sparse: sparse: got :
   arch/powerpc/include/asm/jump_label.h:31:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/jump_label.h:31:1: sparse: sparse: got }
   arch/powerpc/include/asm/jump_label.h:43:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/jump_label.h:43:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/jump_label.h:43:16: sparse: sparse: got false
   arch/powerpc/include/asm/jump_label.h:44:6: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/jump_label.h:44:6: sparse: sparse: got :
   arch/powerpc/include/asm/jump_label.h:46:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/jump_label.h:46:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/dynamic_debug.h, include/linux/printk.h, include/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, ...):
   include/linux/jump_label.h:115:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:115:1: sparse: sparse: got }
--
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: got }
   include/asm-generic/bitops/generic-non-atomic.h:141:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/generic-non-atomic.h:141:1: sparse: sparse: got }
   include/asm-generic/bitops/generic-non-atomic.h:172:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/generic-non-atomic.h:172:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/generic-non-atomic.h:172:16: sparse: sparse: got !
   include/asm-generic/bitops/generic-non-atomic.h:173:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/generic-non-atomic.h:173:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, arch/powerpc/include/generated/asm/div64.h, ...):
   arch/powerpc/include/asm/bitops.h:85:29: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/bitops.h:85:29: sparse: sparse: got is_rlwinm_mask_valid
   arch/powerpc/include/asm/bitops.h:89:15: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:89:15: sparse: sparse: got &
   arch/powerpc/include/asm/bitops.h:89:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/bitops.h:91:11: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/bitops.h:91:11: sparse: sparse: got +=
   arch/powerpc/include/asm/bitops.h:93:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/bitops.h:93:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/bitops.h:93:16: sparse: sparse: got !
   arch/powerpc/include/asm/bitops.h:94:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:94:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:126:1: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:126:1: sparse: sparse: got 1
   arch/powerpc/include/asm/bitops.h:126:1: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/bitops.h:126:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:126:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:126:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:126:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: got 1
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:132:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:132:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:137:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:137:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:142:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:142:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:147:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:147:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:171:1: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:171:1: sparse: sparse: got &
   arch/powerpc/include/asm/bitops.h:171:1: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/bitops.h:171:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:171:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:173:1: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:173:1: sparse: sparse: got &
   arch/powerpc/include/asm/bitops.h:173:1: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/bitops.h:173:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:173:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:175:1: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:175:1: sparse: sparse: got &
   arch/powerpc/include/asm/bitops.h:175:1: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/bitops.h:175:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:175:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:183:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:183:13: sparse: sparse: got 1
   arch/powerpc/include/asm/bitops.h:183:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/bitops.h:195:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:195:9: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:206:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:206:9: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:209:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:209:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:215:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:215:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:222:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:222:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:228:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:228:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:234:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:234:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:251:21: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:251:21: sparse: sparse: got &
   arch/powerpc/include/asm/bitops.h:251:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/bitops.h:252:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:252:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:260:9: sparse: sparse: Expected ) in nested declarator
   arch/powerpc/include/asm/bitops.h:260:9: sparse: sparse: got &&
   arch/powerpc/include/asm/bitops.h:261:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:261:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/builtin-__ffs.h:14:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/builtin-__ffs.h:14:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, arch/powerpc/include/generated/asm/div64.h, ...):
   arch/powerpc/include/asm/bitops.h:283:33: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:283:33: sparse: sparse: got (
   arch/powerpc/include/asm/bitops.h:283:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/bitops.h:286:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/bitops.h:286:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/bitops.h:286:16: sparse: sparse: got 32
   arch/powerpc/include/asm/bitops.h:287:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:287:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/builtin-__fls.h:14:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/builtin-__fls.h:14:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
>> include/asm-generic/bitops/fls64.h:22:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/asm-generic/bitops/fls64.h:23:17: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/fls64.h:23:17: sparse: sparse: got return
>> include/asm-generic/bitops/fls64.h:24:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/fls64.h:24:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/fls64.h:24:16: sparse: sparse: got fls
   include/asm-generic/bitops/fls64.h:25:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/fls64.h:25:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/asm-generic/bitops/hweight.h, arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   include/asm-generic/bitops/arch_hweight.h:10:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/arch_hweight.h:10:1: sparse: sparse: got }
   include/asm-generic/bitops/arch_hweight.h:15:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/arch_hweight.h:15:1: sparse: sparse: got }
   include/asm-generic/bitops/arch_hweight.h:20:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/arch_hweight.h:20:1: sparse: sparse: got }
   include/asm-generic/bitops/arch_hweight.h:25:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/arch_hweight.h:25:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/asm-generic/bitops/instrumented-atomic.h, arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, ...):
   include/linux/instrumented.h:28:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:28:9: sparse: sparse: got ,
   include/linux/instrumented.h:29:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:29:1: sparse: sparse: got }
   include/linux/instrumented.h:42:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:42:9: sparse: sparse: got ,
   include/linux/instrumented.h:43:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:43:1: sparse: sparse: got }
   include/linux/instrumented.h:56:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:56:9: sparse: sparse: got ,
   include/linux/instrumented.h:57:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:57:1: sparse: sparse: got }
   include/linux/instrumented.h:65:21: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:65:21: sparse: sparse: got 0
>> include/linux/instrumented.h:65:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/instrumented.h:66:57: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:66:57: sparse: sparse: got }
   include/linux/instrumented.h:67:17: sparse: sparse: Expected ) in nested declarator
   include/linux/instrumented.h:67:17: sparse: sparse: got {
   include/linux/instrumented.h:67:17: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:67:17: sparse: sparse: got (
   include/linux/instrumented.h:67:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/instrumented.h:67:17: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:67:17: sparse: sparse: got !
   include/linux/instrumented.h:67:17: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:67:17: sparse: sparse: got }
   include/linux/instrumented.h:68:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:68:9: sparse: sparse: got }
   include/linux/instrumented.h:83:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:83:9: sparse: sparse: got ,
   include/linux/instrumented.h:85:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:85:1: sparse: sparse: got }
   include/linux/instrumented.h:98:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:98:9: sparse: sparse: got ,
   include/linux/instrumented.h:100:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:100:1: sparse: sparse: got }
   include/linux/instrumented.h:113:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:113:9: sparse: sparse: got ,
   include/linux/instrumented.h:115:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:115:1: sparse: sparse: got }
   include/linux/instrumented.h:130:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:130:9: sparse: sparse: got ,
   include/linux/instrumented.h:131:39: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:131:39: sparse: sparse: got ,
   include/linux/instrumented.h:132:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:132:1: sparse: sparse: got }
   include/linux/instrumented.h:147:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:147:9: sparse: sparse: got ,
   include/linux/instrumented.h:148:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:148:1: sparse: sparse: got }
   include/linux/instrumented.h:165:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:165:1: sparse: sparse: got }
   include/linux/instrumented.h:181:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:181:9: sparse: sparse: got ,
   include/linux/instrumented.h:182:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:182:9: sparse: sparse: got ,
   include/linux/instrumented.h:183:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:183:1: sparse: sparse: got }
   include/linux/instrumented.h:200:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:200:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/instrumented-atomic.h:30:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:30:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:43:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:43:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:59:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:59:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:71:43: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-atomic.h:71:43: sparse: sparse: got +
   include/asm-generic/bitops/instrumented-atomic.h:72:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/instrumented-atomic.h:72:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/instrumented-atomic.h:72:16: sparse: sparse: got arch_test_and_set_bit
   include/asm-generic/bitops/instrumented-atomic.h:73:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:73:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:85:43: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-atomic.h:85:43: sparse: sparse: got +
   include/asm-generic/bitops/instrumented-atomic.h:86:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/instrumented-atomic.h:86:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/instrumented-atomic.h:86:16: sparse: sparse: got arch_test_and_clear_bit
   include/asm-generic/bitops/instrumented-atomic.h:87:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:87:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:99:43: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-atomic.h:99:43: sparse: sparse: got +
   include/asm-generic/bitops/instrumented-atomic.h:100:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/instrumented-atomic.h:100:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/instrumented-atomic.h:100:16: sparse: sparse: got arch_test_and_change_bit
   include/asm-generic/bitops/instrumented-atomic.h:101:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:101:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/instrumented-lock.h:26:38: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-lock.h:26:38: sparse: sparse: got +
   include/asm-generic/bitops/instrumented-lock.h:28:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-lock.h:28:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-lock.h:42:31: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-lock.h:42:31: sparse: sparse: got +
   include/asm-generic/bitops/instrumented-lock.h:44:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-lock.h:44:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-lock.h:58:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/instrumented-lock.h:58:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/instrumented-lock.h:58:16: sparse: sparse: got arch_test_and_set_bit_lock
   include/asm-generic/bitops/instrumented-lock.h:59:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-lock.h:59:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-lock.h:79:45: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-lock.h:79:45: sparse: sparse: got (
   include/asm-generic/bitops/instrumented-lock.h:80:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/instrumented-lock.h:80:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/instrumented-lock.h:80:16: sparse: sparse: got arch_xor_unlock_is_negative_byte
   include/asm-generic/bitops/instrumented-lock.h:81:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-lock.h:81:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/le.h:22:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:22:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:27:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:27:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:32:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:32:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:37:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:37:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:42:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:42:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:47:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:47:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:52:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:52:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:57:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:57:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:62:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:62:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/sched.h:22:14: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/sched.h:22:14: sparse: sparse: got [
>> include/asm-generic/bitops/sched.h:22:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/asm-generic/bitops/sched.h:24:14: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/sched.h:24:14: sparse: sparse: got [
   include/asm-generic/bitops/sched.h:24:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/asm-generic/bitops/sched.h:26:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/sched.h:26:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/sched.h:26:16: sparse: sparse: got __ffs
   include/asm-generic/bitops/sched.h:30:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/sched.h:30:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/log2.h, include/asm-generic/div64.h, arch/powerpc/include/generated/asm/div64.h, include/linux/math.h, ...):
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'const_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/asm-generic/div64.h, arch/powerpc/include/generated/asm/div64.h, include/linux/math.h, include/linux/math64.h, ...):
   include/linux/log2.h:45:6: sparse: sparse: Expected ; at end of declaration
   include/linux/log2.h:45:6: sparse: sparse: got is_power_of_2
   include/linux/log2.h:48:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:48:1: sparse: sparse: got }
   include/linux/log2.h:58:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:58:1: sparse: sparse: got }
   include/linux/log2.h:68:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:68:1: sparse: sparse: got }
   include/linux/log2.h:202:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:202:1: sparse: sparse: got }
   include/linux/log2.h:230:26: sparse: sparse: Expected ) in function declarator
   include/linux/log2.h:230:26: sparse: sparse: got (
   include/linux/log2.h:230:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/log2.h:232:16: sparse: sparse: Expected ) in function declarator
   include/linux/log2.h:232:16: sparse: sparse: got (
   include/linux/log2.h:232:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/log2.h:233:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:233:1: sparse: sparse: got }
   include/linux/log2.h:270:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:270:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/generated/asm/div64.h, include/linux/math.h, include/linux/math64.h, include/linux/time64.h, ...):
   include/asm-generic/div64.h:151:14: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/div64.h:151:14: sparse: sparse: got no_ovf
>> include/asm-generic/div64.h:154:9: sparse: sparse: Trying to use reserved word 'if' as identifier
>> include/asm-generic/div64.h:154:13: sparse: sparse: missing type declaration for parameter 'no_ovf'
>> include/asm-generic/div64.h:161:11: sparse: sparse: Trying to use reserved word 'else' as identifier
   include/asm-generic/div64.h:161:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/div64.h:161:16: sparse: sparse: got {
   include/asm-generic/div64.h:166:19: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/div64.h:166:19: sparse: sparse: got +=
   include/asm-generic/div64.h:167:9: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/div64.h:167:9: sparse: sparse: got }
   include/asm-generic/div64.h:170:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/div64.h:170:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/math64.h, include/linux/time64.h, include/linux/restart_block.h, include/linux/thread_info.h, ...):
   include/vdso/math64.h:46:14: sparse: sparse: Expected ; at end of statement
   include/vdso/math64.h:46:14: sparse: sparse: got ovf
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/time64.h, include/linux/restart_block.h, include/linux/thread_info.h, arch/powerpc/include/asm/processor.h, ...):
   include/linux/math64.h:92:22: sparse: sparse: Expected ; at end of statement
   include/linux/math64.h:92:22: sparse: sparse: got ___bias
   include/linux/math64.h:286:21: sparse: sparse: Expected ; at end of statement
   include/linux/math64.h:286:21: sparse: sparse: got ___bias
   include/linux/math64.h:289:9: sparse: sparse: Expected ; at end of statement
   include/linux/math64.h:289:9: sparse: sparse: got ___bias
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/restart_block.h, include/linux/thread_info.h, arch/powerpc/include/asm/processor.h, include/linux/sched.h, ...):
   include/linux/time64.h:52:20: sparse: sparse: Expected ; at end of declaration
   include/linux/time64.h:52:20: sparse: sparse: got timespec64_is_epoch
   include/linux/time64.h:55:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/time64.h:55:1: sparse: sparse: got }
   include/linux/time64.h:66:16: sparse: sparse: Expected ) in function declarator
   include/linux/time64.h:66:16: sparse: sparse: got ->
   include/linux/time64.h:66:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/time64.h:68:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/time64.h:68:16: sparse: sparse: Expected ; at end of declaration
   include/linux/time64.h:68:16: sparse: sparse: got lhs
   include/linux/time64.h:69:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/time64.h:69:1: sparse: sparse: got }
   include/linux/time64.h:97:20: sparse: sparse: Expected ; at end of declaration
   include/linux/time64.h:97:20: sparse: sparse: got timespec64_valid
   include/linux/time64.h:103:13: sparse: sparse: Expected ) in function declarator
   include/linux/time64.h:103:13: sparse: sparse: got (
   include/linux/time64.h:103:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/time64.h:105:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/time64.h:105:16: sparse: sparse: Expected ; at end of declaration
   include/linux/time64.h:105:16: sparse: sparse: got true
   include/linux/time64.h:106:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/time64.h:106:1: sparse: sparse: got }
   include/linux/time64.h:113:13: sparse: sparse: Expected ) in function declarator
   include/linux/time64.h:113:13: sparse: sparse: got (
   include/linux/time64.h:113:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/time64.h:115:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/time64.h:115:16: sparse: sparse: Expected ; at end of declaration
   include/linux/time64.h:115:16: sparse: sparse: got true
   include/linux/time64.h:116:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/time64.h:116:1: sparse: sparse: got }
   include/linux/time64.h:123:13: sparse: sparse: Expected ) in function declarator
   include/linux/time64.h:123:13: sparse: sparse: got (
   include/linux/time64.h:123:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/time64.h:125:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/time64.h:125:16: sparse: sparse: Expected ; at end of declaration
   include/linux/time64.h:125:16: sparse: sparse: got true
   include/linux/time64.h:126:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/time64.h:126:1: sparse: sparse: got }
   include/linux/time64.h:141:15: sparse: sparse: Expected ) in function declarator
   include/linux/time64.h:141:15: sparse: sparse: got ->
   include/linux/time64.h:141:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/time64.h:144:17: sparse: sparse: Expected ) in function declarator
   include/linux/time64.h:144:17: sparse: sparse: got (
   include/linux/time64.h:144:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/time64.h:145:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/time64.h:145:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/thread_info.h, include/linux/thread_info.h, ...):
   include/linux/kstrtox.h:98:49: sparse: sparse: Expected ) in function declarator
   include/linux/kstrtox.h:98:49: sparse: sparse: got *
   include/linux/kstrtox.h:110:80: sparse: sparse: Expected ) in function declarator
   include/linux/kstrtox.h:110:80: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/thread_info.h, include/linux/thread_info.h, ...):
   include/linux/minmax.h:276:20: sparse: sparse: Expected ; at end of declaration
   include/linux/minmax.h:276:20: sparse: sparse: got in_range64
   include/linux/minmax.h:279:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/minmax.h:279:1: sparse: sparse: got }
   include/linux/minmax.h:284:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/minmax.h:284:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/thread_info.h, include/linux/thread_info.h, ...):
   include/linux/sprintf.h:25:13: sparse: sparse: Expected ; at end of declaration
   include/linux/sprintf.h:25:13: sparse: sparse: got no_hash_pointers
   include/linux/sprintf.h:26:34: sparse: sparse: Expected ) in function declarator
   include/linux/sprintf.h:26:34: sparse: sparse: got slub_debug
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/thread_info.h, include/linux/thread_info.h, ...):
   include/linux/kernel.h:162:13: sparse: sparse: Expected ; at end of declaration
   include/linux/kernel.h:162:13: sparse: sparse: got early_boot_irqs_disabled
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/thread_info.h, arch/powerpc/include/asm/processor.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/thread_info.h:171:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/thread_info.h:171:20: sparse: sparse: got test_thread_local_flags
   arch/powerpc/include/asm/thread_info.h:174:19: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/thread_info.h:174:19: sparse: sparse: got ->
   arch/powerpc/include/asm/thread_info.h:174:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/thread_info.h:175:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/thread_info.h:175:1: sparse: sparse: got }
   arch/powerpc/include/asm/thread_info.h:220:22: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/thread_info.h:220:22: sparse: sparse: got <=
   arch/powerpc/include/asm/thread_info.h:220:9: sparse: sparse: Trying to use reserved word 'while' as identifier
   arch/powerpc/include/asm/thread_info.h:225:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/thread_info.h:225:9: sparse: sparse: got }
   arch/powerpc/include/asm/thread_info.h:228:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/thread_info.h:228:1: sparse: sparse: got }
--
   lib/raid/raid6/powerpc/altivec2.c: note: in included file:
   ../lib/gcc/powerpc-linux/10.5.0/include/altivec.h:34:2: sparse: sparse: Use the "-maltivec" flag to enable PowerPC AltiVec support
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/vdso/processor.h, include/vdso/processor.h, arch/powerpc/include/asm/processor.h, ...):
   arch/powerpc/include/asm/feature-fixups.h:294:13: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/feature-fixups.h:294:13: sparse: sparse: got static_key_feature_checks_initialized
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/processor.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   arch/powerpc/include/asm/reg.h:1414:13: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/reg.h:1414:13: sparse: sparse: got strict_msr_control
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/asm-generic/rwonce.h, arch/powerpc/include/generated/asm/rwonce.h, include/linux/compiler.h, include/asm-generic/bug.h, ...):
   include/linux/kasan-checks.h:22:20: sparse: sparse: Expected ; at end of declaration
   include/linux/kasan-checks.h:22:20: sparse: sparse: got __kasan_check_read
   include/linux/kasan-checks.h:25:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/kasan-checks.h:25:1: sparse: sparse: got }
   include/linux/kasan-checks.h:29:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/kasan-checks.h:29:1: sparse: sparse: got }
   include/linux/kasan-checks.h:43:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/kasan-checks.h:43:1: sparse: sparse: got }
   include/linux/kasan-checks.h:47:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/kasan-checks.h:47:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, include/linux/bug.h, include/linux/thread_info.h, ...):
   include/linux/panic.h:20:13: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:20:13: sparse: sparse: got oops_may_print
   include/linux/panic.h:22:13: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:22:13: sparse: sparse: got panic_triggering_all_cpu_backtrace
   include/linux/panic.h:29:13: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:29:13: sparse: sparse: got panic_on_taint_nousertaint
   include/linux/panic.h:33:13: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:33:13: sparse: sparse: got crash_kexec_post_notifiers
   include/linux/panic.h:54:6: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:54:6: sparse: sparse: got panic_try_start
   include/linux/panic.h:56:6: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:56:6: sparse: sparse: got panic_in_progress
   include/linux/panic.h:57:6: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:57:6: sparse: sparse: got panic_on_this_cpu
   include/linux/panic.h:58:6: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:58:6: sparse: sparse: got panic_on_other_cpu
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/printk.h, include/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, include/linux/bug.h, ...):
   include/linux/init.h:165:13: sparse: sparse: Expected ; at end of declaration
   include/linux/init.h:165:13: sparse: sparse: got rodata_enabled
   include/linux/init.h:170:13: sparse: sparse: Expected ; at end of declaration
   include/linux/init.h:170:13: sparse: sparse: got initcall_debug
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/bits.h, include/linux/ratelimit_types.h, include/linux/printk.h, include/asm-generic/bug.h, ...):
   include/linux/overflow.h:45:42: sparse: sparse: Expected ; at end of declaration
   include/linux/overflow.h:45:42: sparse: sparse: got __must_check_overflow
   include/linux/overflow.h:48:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/overflow.h:48:1: sparse: sparse: got }
   include/linux/overflow.h:334:13: sparse: sparse: Expected ) in function declarator
   include/linux/overflow.h:334:13: sparse: sparse: got (
   include/linux/overflow.h:334:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/overflow.h:337:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/overflow.h:337:16: sparse: sparse: Expected ; at end of declaration
   include/linux/overflow.h:337:16: sparse: sparse: got bytes
   include/linux/overflow.h:338:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/overflow.h:338:1: sparse: sparse: got }
   include/linux/overflow.h:353:13: sparse: sparse: Expected ) in function declarator
   include/linux/overflow.h:353:13: sparse: sparse: got (
   include/linux/overflow.h:353:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/overflow.h:356:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/overflow.h:356:16: sparse: sparse: Expected ; at end of declaration
   include/linux/overflow.h:356:16: sparse: sparse: got bytes
   include/linux/overflow.h:357:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/overflow.h:357:1: sparse: sparse: got }
   include/linux/overflow.h:374:21: sparse: sparse: Expected ) in function declarator
   include/linux/overflow.h:374:21: sparse: sparse: got ==
   include/linux/overflow.h:374:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/overflow.h:378:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/overflow.h:378:16: sparse: sparse: Expected ; at end of declaration
   include/linux/overflow.h:378:16: sparse: sparse: got bytes
   include/linux/overflow.h:379:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/overflow.h:379:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/swab.h, include/uapi/linux/byteorder/big_endian.h, include/linux/byteorder/big_endian.h, ...):
   include/uapi/linux/swab.h:55:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:55:1: sparse: sparse: got }
   include/uapi/linux/swab.h:64:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:64:1: sparse: sparse: got }
   include/uapi/linux/swab.h:73:17: sparse: sparse: Expected ) in function declarator
   include/uapi/linux/swab.h:73:17: sparse: sparse: got (
>> include/uapi/linux/swab.h:73:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/uapi/linux/swab.h:77:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:77:1: sparse: sparse: got }
   include/uapi/linux/swab.h:86:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:86:1: sparse: sparse: got }
   include/uapi/linux/swab.h:95:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:95:1: sparse: sparse: got }
   include/uapi/linux/swab.h:143:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:143:1: sparse: sparse: got }
   include/uapi/linux/swab.h:178:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:178:1: sparse: sparse: got }
   include/uapi/linux/swab.h:191:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:191:1: sparse: sparse: got }
   include/uapi/linux/swab.h:204:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:204:1: sparse: sparse: got }
   include/uapi/linux/swab.h:219:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:219:1: sparse: sparse: got }
   include/uapi/linux/swab.h:234:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:234:1: sparse: sparse: got }
   include/uapi/linux/swab.h:247:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:247:1: sparse: sparse: got }
   include/uapi/linux/swab.h:259:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:259:1: sparse: sparse: got }
   include/uapi/linux/swab.h:272:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:272:1: sparse: sparse: got }
   include/uapi/linux/swab.h:287:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:287:1: sparse: sparse: got }
   include/uapi/linux/swab.h:302:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:302:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/uapi/linux/byteorder/big_endian.h, include/linux/byteorder/big_endian.h, arch/powerpc/include/uapi/asm/byteorder.h, ...):
   include/linux/swab.h:28:20: sparse: sparse: Expected ; at end of declaration
   include/linux/swab.h:28:20: sparse: sparse: got ++
   include/linux/swab.h:29:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/swab.h:29:9: sparse: sparse: got }
   include/linux/swab.h:36:20: sparse: sparse: Expected ; at end of declaration
   include/linux/swab.h:36:20: sparse: sparse: got ++
   include/linux/swab.h:37:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/swab.h:37:9: sparse: sparse: got }
   include/linux/swab.h:44:20: sparse: sparse: Expected ; at end of declaration
   include/linux/swab.h:44:20: sparse: sparse: got ++
   include/linux/swab.h:45:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/swab.h:45:9: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/byteorder/big_endian.h, arch/powerpc/include/uapi/asm/byteorder.h, arch/powerpc/include/asm/qspinlock_types.h, ...):
   include/uapi/linux/byteorder/big_endian.h:48:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/byteorder/big_endian.h:48:1: sparse: sparse: got }
   include/uapi/linux/byteorder/big_endian.h:52:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/byteorder/big_endian.h:52:1: sparse: sparse: got }
   include/uapi/linux/byteorder/big_endian.h:56:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/byteorder/big_endian.h:56:1: sparse: sparse: got }
   include/uapi/linux/byteorder/big_endian.h:60:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/byteorder/big_endian.h:60:1: sparse: sparse: got }
   include/uapi/linux/byteorder/big_endian.h:64:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/byteorder/big_endian.h:64:1: sparse: sparse: got }
   include/uapi/linux/byteorder/big_endian.h:68:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/byteorder/big_endian.h:68:1: sparse: sparse: got }
   include/uapi/linux/byteorder/big_endian.h:72:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/byteorder/big_endian.h:72:1: sparse: sparse: got }
   include/uapi/linux/byteorder/big_endian.h:76:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/byteorder/big_endian.h:76:1: sparse: sparse: got }
   include/uapi/linux/byteorder/big_endian.h:80:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/byteorder/big_endian.h:80:1: sparse: sparse: got }
   include/uapi/linux/byteorder/big_endian.h:84:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/byteorder/big_endian.h:84:1: sparse: sparse: got }
   include/uapi/linux/byteorder/big_endian.h:88:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/byteorder/big_endian.h:88:1: sparse: sparse: got }
   include/uapi/linux/byteorder/big_endian.h:92:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/byteorder/big_endian.h:92:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/byteorder/big_endian.h, arch/powerpc/include/uapi/asm/byteorder.h, arch/powerpc/include/asm/qspinlock_types.h, ...):
   include/linux/byteorder/generic.h:147:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:147:1: sparse: sparse: got }
   include/linux/byteorder/generic.h:152:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:152:1: sparse: sparse: got }
   include/linux/byteorder/generic.h:157:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:157:1: sparse: sparse: got }
   include/linux/byteorder/generic.h:164:20: sparse: sparse: Expected ; at end of declaration
   include/linux/byteorder/generic.h:164:20: sparse: sparse: got ++
   include/linux/byteorder/generic.h:165:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:165:9: sparse: sparse: got }
   include/linux/byteorder/generic.h:172:20: sparse: sparse: Expected ; at end of declaration
   include/linux/byteorder/generic.h:172:20: sparse: sparse: got ++
   include/linux/byteorder/generic.h:173:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:173:9: sparse: sparse: got }
   include/linux/byteorder/generic.h:180:20: sparse: sparse: Expected ; at end of declaration
   include/linux/byteorder/generic.h:180:20: sparse: sparse: got ++
   include/linux/byteorder/generic.h:181:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:181:9: sparse: sparse: got }
   include/linux/byteorder/generic.h:188:20: sparse: sparse: Expected ; at end of declaration
   include/linux/byteorder/generic.h:188:20: sparse: sparse: got ++
   include/linux/byteorder/generic.h:189:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:189:9: sparse: sparse: got }
   include/linux/byteorder/generic.h:196:16: sparse: sparse: Expected ) in function declarator
   include/linux/byteorder/generic.h:196:16: sparse: sparse: got =
>> include/linux/byteorder/generic.h:196:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   include/linux/byteorder/generic.h:196:23: sparse: sparse: Expected ; at end of declaration
   include/linux/byteorder/generic.h:196:23: sparse: sparse: got <
   include/linux/byteorder/generic.h:196:33: sparse: sparse: Expected ; at end of declaration
   include/linux/byteorder/generic.h:196:33: sparse: sparse: got ++
   include/linux/byteorder/generic.h:198:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:198:1: sparse: sparse: got }
   include/linux/byteorder/generic.h:204:16: sparse: sparse: Expected ) in function declarator
   include/linux/byteorder/generic.h:204:16: sparse: sparse: got =
   include/linux/byteorder/generic.h:204:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   include/linux/byteorder/generic.h:204:23: sparse: sparse: Expected ; at end of declaration
   include/linux/byteorder/generic.h:204:23: sparse: sparse: got <
   include/linux/byteorder/generic.h:204:33: sparse: sparse: Expected ; at end of declaration
   include/linux/byteorder/generic.h:204:33: sparse: sparse: got ++
   include/linux/byteorder/generic.h:206:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:206:1: sparse: sparse: got }
   include/linux/byteorder/generic.h:211:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:211:1: sparse: sparse: got }
   include/linux/byteorder/generic.h:216:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:216:1: sparse: sparse: got }
   include/linux/byteorder/generic.h:221:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:221:1: sparse: sparse: got }
   include/linux/byteorder/generic.h:227:16: sparse: sparse: Expected ) in function declarator
   include/linux/byteorder/generic.h:227:16: sparse: sparse: got =
   include/linux/byteorder/generic.h:227:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   include/linux/byteorder/generic.h:227:23: sparse: sparse: Expected ; at end of declaration
   include/linux/byteorder/generic.h:227:23: sparse: sparse: got <
   include/linux/byteorder/generic.h:227:31: sparse: sparse: Expected ; at end of declaration
   include/linux/byteorder/generic.h:227:31: sparse: sparse: got ++
   include/linux/byteorder/generic.h:229:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:229:1: sparse: sparse: got }
   include/linux/byteorder/generic.h:235:16: sparse: sparse: Expected ) in function declarator
   include/linux/byteorder/generic.h:235:16: sparse: sparse: got =
   include/linux/byteorder/generic.h:235:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   include/linux/byteorder/generic.h:235:23: sparse: sparse: Expected ; at end of declaration
   include/linux/byteorder/generic.h:235:23: sparse: sparse: got <
   include/linux/byteorder/generic.h:235:31: sparse: sparse: Expected ; at end of declaration
   include/linux/byteorder/generic.h:235:31: sparse: sparse: got ++
   include/linux/byteorder/generic.h:237:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:237:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/spinlock_types.h, include/linux/spinlock_types_raw.h, include/linux/ratelimit_types.h, ...):
   arch/powerpc/include/asm/qspinlock_types.h:23:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/qspinlock_types.h:23:9: sparse: sparse: got }
   arch/powerpc/include/asm/qspinlock_types.h:24:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/qspinlock_types.h:24:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/spinlock_types.h, include/linux/spinlock_types_raw.h, include/linux/ratelimit_types.h, ...):
   include/asm-generic/qrwlock_types.h:26:33: sparse: sparse: expected ; at end of declaration
   include/asm-generic/qrwlock_types.h:26:33: sparse: sparse: Expected } at end of specifier
   include/asm-generic/qrwlock_types.h:26:33: sparse: sparse: got wait_lock
   include/asm-generic/qrwlock_types.h:27:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/qrwlock_types.h:27:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/ratelimit_types.h, include/linux/printk.h, include/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, ...):
   include/linux/spinlock_types_raw.h:15:25: sparse: sparse: expected ; at end of declaration
   include/linux/spinlock_types_raw.h:15:25: sparse: sparse: Expected } at end of specifier
   include/linux/spinlock_types_raw.h:15:25: sparse: sparse: got raw_lock
   include/linux/spinlock_types_raw.h:23:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/spinlock_types_raw.h:23:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, include/linux/bug.h, include/linux/thread_info.h, ...):
   include/linux/printk.h:188:13: sparse: sparse: Expected ; at end of declaration
   include/linux/printk.h:188:13: sparse: sparse: got printk_timed_ratelimit
   include/linux/printk.h:208:13: sparse: sparse: Expected ; at end of declaration
   include/linux/printk.h:208:13: sparse: sparse: got nbcon_device_try_acquire
   include/linux/printk.h:211:6: sparse: sparse: Expected ; at end of declaration
   include/linux/printk.h:211:6: sparse: sparse: got pr_flush
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/cleanup.h, include/linux/jump_label.h, include/linux/dynamic_debug.h, include/linux/printk.h, ...):
   include/linux/err.h:76:33: sparse: sparse: Expected ; at end of declaration
   include/linux/err.h:76:33: sparse: sparse: got IS_ERR
   include/linux/err.h:79:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/err.h:79:1: sparse: sparse: got }
   include/linux/err.h:93:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/err.h:93:1: sparse: sparse: got }
   include/linux/err.h:106:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/err.h:106:1: sparse: sparse: got }
   include/linux/err.h:129:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   include/linux/err.h:130:17: sparse: sparse: Expected ; at end of declaration
   include/linux/err.h:130:17: sparse: sparse: got return
   include/linux/err.h:131:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/err.h:131:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/jump_label.h, include/linux/dynamic_debug.h, include/linux/printk.h, include/asm-generic/bug.h, ...):
   include/linux/cleanup.h:225:15: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cleanup.h:225:15: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/jump_label.h, include/linux/dynamic_debug.h, include/linux/printk.h, include/asm-generic/bug.h, ...):
   arch/powerpc/include/asm/jump_label.h:18:29: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/jump_label.h:18:29: sparse: sparse: got arch_static_branch
   arch/powerpc/include/asm/jump_label.h:28:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/jump_label.h:28:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/jump_label.h:28:16: sparse: sparse: got false
   arch/powerpc/include/asm/jump_label.h:29:6: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/jump_label.h:29:6: sparse: sparse: got :
   arch/powerpc/include/asm/jump_label.h:31:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/jump_label.h:31:1: sparse: sparse: got }
   arch/powerpc/include/asm/jump_label.h:43:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/jump_label.h:43:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/jump_label.h:43:16: sparse: sparse: got false
   arch/powerpc/include/asm/jump_label.h:44:6: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/jump_label.h:44:6: sparse: sparse: got :
   arch/powerpc/include/asm/jump_label.h:46:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/jump_label.h:46:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/dynamic_debug.h, include/linux/printk.h, include/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, ...):
   include/linux/jump_label.h:115:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:115:1: sparse: sparse: got }
--
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: got }
   include/asm-generic/bitops/generic-non-atomic.h:141:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/generic-non-atomic.h:141:1: sparse: sparse: got }
   include/asm-generic/bitops/generic-non-atomic.h:172:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/generic-non-atomic.h:172:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/generic-non-atomic.h:172:16: sparse: sparse: got !
   include/asm-generic/bitops/generic-non-atomic.h:173:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/generic-non-atomic.h:173:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, arch/powerpc/include/generated/asm/div64.h, ...):
   arch/powerpc/include/asm/bitops.h:85:29: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/bitops.h:85:29: sparse: sparse: got is_rlwinm_mask_valid
   arch/powerpc/include/asm/bitops.h:89:15: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:89:15: sparse: sparse: got &
   arch/powerpc/include/asm/bitops.h:89:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/bitops.h:91:11: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/bitops.h:91:11: sparse: sparse: got +=
   arch/powerpc/include/asm/bitops.h:93:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/bitops.h:93:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/bitops.h:93:16: sparse: sparse: got !
   arch/powerpc/include/asm/bitops.h:94:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:94:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:126:1: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:126:1: sparse: sparse: got 1
   arch/powerpc/include/asm/bitops.h:126:1: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/bitops.h:126:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:126:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:126:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:126:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: got 1
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:132:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:132:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:137:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:137:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:142:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:142:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:147:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:147:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:171:1: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:171:1: sparse: sparse: got &
   arch/powerpc/include/asm/bitops.h:171:1: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/bitops.h:171:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:171:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:173:1: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:173:1: sparse: sparse: got &
   arch/powerpc/include/asm/bitops.h:173:1: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/bitops.h:173:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:173:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:175:1: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:175:1: sparse: sparse: got &
   arch/powerpc/include/asm/bitops.h:175:1: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/bitops.h:175:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:175:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:183:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:183:13: sparse: sparse: got 1
   arch/powerpc/include/asm/bitops.h:183:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/bitops.h:195:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:195:9: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:206:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:206:9: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:209:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:209:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:215:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:215:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:222:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:222:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:228:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:228:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:234:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:234:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:251:21: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:251:21: sparse: sparse: got &
   arch/powerpc/include/asm/bitops.h:251:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/bitops.h:252:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:252:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:260:9: sparse: sparse: Expected ) in nested declarator
   arch/powerpc/include/asm/bitops.h:260:9: sparse: sparse: got &&
   arch/powerpc/include/asm/bitops.h:261:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:261:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/builtin-__ffs.h:14:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/builtin-__ffs.h:14:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, arch/powerpc/include/generated/asm/div64.h, ...):
   arch/powerpc/include/asm/bitops.h:283:33: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:283:33: sparse: sparse: got (
   arch/powerpc/include/asm/bitops.h:283:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/bitops.h:286:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/bitops.h:286:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/bitops.h:286:16: sparse: sparse: got 32
   arch/powerpc/include/asm/bitops.h:287:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:287:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/builtin-__fls.h:14:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/builtin-__fls.h:14:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
>> include/asm-generic/bitops/fls64.h:22:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/asm-generic/bitops/fls64.h:23:17: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/fls64.h:23:17: sparse: sparse: got return
>> include/asm-generic/bitops/fls64.h:24:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/fls64.h:24:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/fls64.h:24:16: sparse: sparse: got fls
   include/asm-generic/bitops/fls64.h:25:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/fls64.h:25:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/asm-generic/bitops/hweight.h, arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   include/asm-generic/bitops/arch_hweight.h:10:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/arch_hweight.h:10:1: sparse: sparse: got }
   include/asm-generic/bitops/arch_hweight.h:15:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/arch_hweight.h:15:1: sparse: sparse: got }
   include/asm-generic/bitops/arch_hweight.h:20:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/arch_hweight.h:20:1: sparse: sparse: got }
   include/asm-generic/bitops/arch_hweight.h:25:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/arch_hweight.h:25:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/asm-generic/bitops/instrumented-atomic.h, arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, ...):
   include/linux/instrumented.h:28:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:28:9: sparse: sparse: got ,
   include/linux/instrumented.h:29:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:29:1: sparse: sparse: got }
   include/linux/instrumented.h:42:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:42:9: sparse: sparse: got ,
   include/linux/instrumented.h:43:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:43:1: sparse: sparse: got }
   include/linux/instrumented.h:56:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:56:9: sparse: sparse: got ,
   include/linux/instrumented.h:57:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:57:1: sparse: sparse: got }
   include/linux/instrumented.h:65:21: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:65:21: sparse: sparse: got 0
>> include/linux/instrumented.h:65:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/instrumented.h:66:57: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:66:57: sparse: sparse: got }
   include/linux/instrumented.h:67:17: sparse: sparse: Expected ) in nested declarator
   include/linux/instrumented.h:67:17: sparse: sparse: got {
   include/linux/instrumented.h:67:17: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:67:17: sparse: sparse: got (
   include/linux/instrumented.h:67:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/instrumented.h:67:17: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:67:17: sparse: sparse: got !
   include/linux/instrumented.h:67:17: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:67:17: sparse: sparse: got }
   include/linux/instrumented.h:68:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:68:9: sparse: sparse: got }
   include/linux/instrumented.h:83:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:83:9: sparse: sparse: got ,
   include/linux/instrumented.h:85:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:85:1: sparse: sparse: got }
   include/linux/instrumented.h:98:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:98:9: sparse: sparse: got ,
   include/linux/instrumented.h:100:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:100:1: sparse: sparse: got }
   include/linux/instrumented.h:113:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:113:9: sparse: sparse: got ,
   include/linux/instrumented.h:115:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:115:1: sparse: sparse: got }
   include/linux/instrumented.h:130:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:130:9: sparse: sparse: got ,
   include/linux/instrumented.h:131:39: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:131:39: sparse: sparse: got ,
   include/linux/instrumented.h:132:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:132:1: sparse: sparse: got }
   include/linux/instrumented.h:147:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:147:9: sparse: sparse: got ,
   include/linux/instrumented.h:148:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:148:1: sparse: sparse: got }
   include/linux/instrumented.h:165:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:165:1: sparse: sparse: got }
   include/linux/instrumented.h:181:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:181:9: sparse: sparse: got ,
   include/linux/instrumented.h:182:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:182:9: sparse: sparse: got ,
   include/linux/instrumented.h:183:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:183:1: sparse: sparse: got }
   include/linux/instrumented.h:200:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:200:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/instrumented-atomic.h:30:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:30:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:43:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:43:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:59:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:59:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:71:43: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-atomic.h:71:43: sparse: sparse: got +
   include/asm-generic/bitops/instrumented-atomic.h:72:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/instrumented-atomic.h:72:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/instrumented-atomic.h:72:16: sparse: sparse: got arch_test_and_set_bit
   include/asm-generic/bitops/instrumented-atomic.h:73:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:73:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:85:43: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-atomic.h:85:43: sparse: sparse: got +
   include/asm-generic/bitops/instrumented-atomic.h:86:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/instrumented-atomic.h:86:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/instrumented-atomic.h:86:16: sparse: sparse: got arch_test_and_clear_bit
   include/asm-generic/bitops/instrumented-atomic.h:87:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:87:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:99:43: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-atomic.h:99:43: sparse: sparse: got +
   include/asm-generic/bitops/instrumented-atomic.h:100:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/instrumented-atomic.h:100:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/instrumented-atomic.h:100:16: sparse: sparse: got arch_test_and_change_bit
   include/asm-generic/bitops/instrumented-atomic.h:101:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:101:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/instrumented-lock.h:26:38: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-lock.h:26:38: sparse: sparse: got +
   include/asm-generic/bitops/instrumented-lock.h:28:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-lock.h:28:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-lock.h:42:31: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-lock.h:42:31: sparse: sparse: got +
   include/asm-generic/bitops/instrumented-lock.h:44:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-lock.h:44:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-lock.h:58:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/instrumented-lock.h:58:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/instrumented-lock.h:58:16: sparse: sparse: got arch_test_and_set_bit_lock
   include/asm-generic/bitops/instrumented-lock.h:59:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-lock.h:59:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-lock.h:79:45: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-lock.h:79:45: sparse: sparse: got (
   include/asm-generic/bitops/instrumented-lock.h:80:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/instrumented-lock.h:80:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/instrumented-lock.h:80:16: sparse: sparse: got arch_xor_unlock_is_negative_byte
   include/asm-generic/bitops/instrumented-lock.h:81:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-lock.h:81:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/le.h:22:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:22:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:27:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:27:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:32:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:32:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:37:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:37:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:42:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:42:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:47:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:47:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:52:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:52:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:57:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:57:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:62:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:62:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/sched.h:22:14: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/sched.h:22:14: sparse: sparse: got [
>> include/asm-generic/bitops/sched.h:22:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/asm-generic/bitops/sched.h:24:14: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/sched.h:24:14: sparse: sparse: got [
   include/asm-generic/bitops/sched.h:24:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/asm-generic/bitops/sched.h:26:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/sched.h:26:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/sched.h:26:16: sparse: sparse: got __ffs
   include/asm-generic/bitops/sched.h:30:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/sched.h:30:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/log2.h, include/asm-generic/div64.h, arch/powerpc/include/generated/asm/div64.h, include/linux/math.h, ...):
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'const_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/asm-generic/div64.h, arch/powerpc/include/generated/asm/div64.h, include/linux/math.h, include/linux/math64.h, ...):
   include/linux/log2.h:45:6: sparse: sparse: Expected ; at end of declaration
   include/linux/log2.h:45:6: sparse: sparse: got is_power_of_2
   include/linux/log2.h:48:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:48:1: sparse: sparse: got }
   include/linux/log2.h:58:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:58:1: sparse: sparse: got }
   include/linux/log2.h:68:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:68:1: sparse: sparse: got }
   include/linux/log2.h:202:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:202:1: sparse: sparse: got }
   include/linux/log2.h:230:26: sparse: sparse: Expected ) in function declarator
   include/linux/log2.h:230:26: sparse: sparse: got (
   include/linux/log2.h:230:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/log2.h:232:16: sparse: sparse: Expected ) in function declarator
   include/linux/log2.h:232:16: sparse: sparse: got (
   include/linux/log2.h:232:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/log2.h:233:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:233:1: sparse: sparse: got }
   include/linux/log2.h:270:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:270:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/generated/asm/div64.h, include/linux/math.h, include/linux/math64.h, include/linux/time64.h, ...):
   include/asm-generic/div64.h:151:14: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/div64.h:151:14: sparse: sparse: got no_ovf
>> include/asm-generic/div64.h:154:9: sparse: sparse: Trying to use reserved word 'if' as identifier
>> include/asm-generic/div64.h:154:13: sparse: sparse: missing type declaration for parameter 'no_ovf'
>> include/asm-generic/div64.h:161:11: sparse: sparse: Trying to use reserved word 'else' as identifier
   include/asm-generic/div64.h:161:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/div64.h:161:16: sparse: sparse: got {
   include/asm-generic/div64.h:166:19: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/div64.h:166:19: sparse: sparse: got +=
   include/asm-generic/div64.h:167:9: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/div64.h:167:9: sparse: sparse: got }
   include/asm-generic/div64.h:170:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/div64.h:170:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/math64.h, include/linux/time64.h, include/linux/restart_block.h, include/linux/thread_info.h, ...):
   include/vdso/math64.h:46:14: sparse: sparse: Expected ; at end of statement
   include/vdso/math64.h:46:14: sparse: sparse: got ovf
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/time64.h, include/linux/restart_block.h, include/linux/thread_info.h, arch/powerpc/include/asm/processor.h, ...):
   include/linux/math64.h:92:22: sparse: sparse: Expected ; at end of statement
   include/linux/math64.h:92:22: sparse: sparse: got ___bias
   include/linux/math64.h:286:21: sparse: sparse: Expected ; at end of statement
   include/linux/math64.h:286:21: sparse: sparse: got ___bias
   include/linux/math64.h:289:9: sparse: sparse: Expected ; at end of statement
   include/linux/math64.h:289:9: sparse: sparse: got ___bias
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/restart_block.h, include/linux/thread_info.h, arch/powerpc/include/asm/processor.h, include/linux/sched.h, ...):
   include/linux/time64.h:52:20: sparse: sparse: Expected ; at end of declaration
   include/linux/time64.h:52:20: sparse: sparse: got timespec64_is_epoch
   include/linux/time64.h:55:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/time64.h:55:1: sparse: sparse: got }
   include/linux/time64.h:66:16: sparse: sparse: Expected ) in function declarator
   include/linux/time64.h:66:16: sparse: sparse: got ->
   include/linux/time64.h:66:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/time64.h:68:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/time64.h:68:16: sparse: sparse: Expected ; at end of declaration
   include/linux/time64.h:68:16: sparse: sparse: got lhs
   include/linux/time64.h:69:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/time64.h:69:1: sparse: sparse: got }
   include/linux/time64.h:97:20: sparse: sparse: Expected ; at end of declaration
   include/linux/time64.h:97:20: sparse: sparse: got timespec64_valid
   include/linux/time64.h:103:13: sparse: sparse: Expected ) in function declarator
   include/linux/time64.h:103:13: sparse: sparse: got (
   include/linux/time64.h:103:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/time64.h:105:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/time64.h:105:16: sparse: sparse: Expected ; at end of declaration
   include/linux/time64.h:105:16: sparse: sparse: got true
   include/linux/time64.h:106:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/time64.h:106:1: sparse: sparse: got }
   include/linux/time64.h:113:13: sparse: sparse: Expected ) in function declarator
   include/linux/time64.h:113:13: sparse: sparse: got (
   include/linux/time64.h:113:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/time64.h:115:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/time64.h:115:16: sparse: sparse: Expected ; at end of declaration
   include/linux/time64.h:115:16: sparse: sparse: got true
   include/linux/time64.h:116:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/time64.h:116:1: sparse: sparse: got }
   include/linux/time64.h:123:13: sparse: sparse: Expected ) in function declarator
   include/linux/time64.h:123:13: sparse: sparse: got (
   include/linux/time64.h:123:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/time64.h:125:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/time64.h:125:16: sparse: sparse: Expected ; at end of declaration
   include/linux/time64.h:125:16: sparse: sparse: got true
   include/linux/time64.h:126:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/time64.h:126:1: sparse: sparse: got }
   include/linux/time64.h:141:15: sparse: sparse: Expected ) in function declarator
   include/linux/time64.h:141:15: sparse: sparse: got ->
   include/linux/time64.h:141:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/time64.h:144:17: sparse: sparse: Expected ) in function declarator
   include/linux/time64.h:144:17: sparse: sparse: got (
   include/linux/time64.h:144:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/time64.h:145:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/time64.h:145:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/thread_info.h, include/linux/thread_info.h, ...):
   include/linux/kstrtox.h:98:49: sparse: sparse: Expected ) in function declarator
   include/linux/kstrtox.h:98:49: sparse: sparse: got *
   include/linux/kstrtox.h:110:80: sparse: sparse: Expected ) in function declarator
   include/linux/kstrtox.h:110:80: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/thread_info.h, include/linux/thread_info.h, ...):
   include/linux/minmax.h:276:20: sparse: sparse: Expected ; at end of declaration
   include/linux/minmax.h:276:20: sparse: sparse: got in_range64
   include/linux/minmax.h:279:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/minmax.h:279:1: sparse: sparse: got }
   include/linux/minmax.h:284:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/minmax.h:284:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/thread_info.h, include/linux/thread_info.h, ...):
   include/linux/sprintf.h:25:13: sparse: sparse: Expected ; at end of declaration
   include/linux/sprintf.h:25:13: sparse: sparse: got no_hash_pointers
   include/linux/sprintf.h:26:34: sparse: sparse: Expected ) in function declarator
   include/linux/sprintf.h:26:34: sparse: sparse: got slub_debug
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/thread_info.h, include/linux/thread_info.h, ...):
   include/linux/kernel.h:162:13: sparse: sparse: Expected ; at end of declaration
   include/linux/kernel.h:162:13: sparse: sparse: got early_boot_irqs_disabled
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/thread_info.h, arch/powerpc/include/asm/processor.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/thread_info.h:171:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/thread_info.h:171:20: sparse: sparse: got test_thread_local_flags
   arch/powerpc/include/asm/thread_info.h:174:19: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/thread_info.h:174:19: sparse: sparse: got ->
   arch/powerpc/include/asm/thread_info.h:174:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/thread_info.h:175:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/thread_info.h:175:1: sparse: sparse: got }
   arch/powerpc/include/asm/thread_info.h:220:22: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/thread_info.h:220:22: sparse: sparse: got <=
   arch/powerpc/include/asm/thread_info.h:220:9: sparse: sparse: Trying to use reserved word 'while' as identifier
   arch/powerpc/include/asm/thread_info.h:225:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/thread_info.h:225:9: sparse: sparse: got }
   arch/powerpc/include/asm/thread_info.h:228:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/thread_info.h:228:1: sparse: sparse: got }
--
   lib/raid/raid6/powerpc/altivec4.c: note: in included file:
   ../lib/gcc/powerpc-linux/10.5.0/include/altivec.h:34:2: sparse: sparse: Use the "-maltivec" flag to enable PowerPC AltiVec support
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/vdso/processor.h, include/vdso/processor.h, arch/powerpc/include/asm/processor.h, ...):
   arch/powerpc/include/asm/feature-fixups.h:294:13: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/feature-fixups.h:294:13: sparse: sparse: got static_key_feature_checks_initialized
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/processor.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   arch/powerpc/include/asm/reg.h:1414:13: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/reg.h:1414:13: sparse: sparse: got strict_msr_control
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/asm-generic/rwonce.h, arch/powerpc/include/generated/asm/rwonce.h, include/linux/compiler.h, include/asm-generic/bug.h, ...):
   include/linux/kasan-checks.h:22:20: sparse: sparse: Expected ; at end of declaration
   include/linux/kasan-checks.h:22:20: sparse: sparse: got __kasan_check_read
   include/linux/kasan-checks.h:25:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/kasan-checks.h:25:1: sparse: sparse: got }
   include/linux/kasan-checks.h:29:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/kasan-checks.h:29:1: sparse: sparse: got }
   include/linux/kasan-checks.h:43:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/kasan-checks.h:43:1: sparse: sparse: got }
   include/linux/kasan-checks.h:47:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/kasan-checks.h:47:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, include/linux/bug.h, include/linux/thread_info.h, ...):
   include/linux/panic.h:20:13: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:20:13: sparse: sparse: got oops_may_print
   include/linux/panic.h:22:13: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:22:13: sparse: sparse: got panic_triggering_all_cpu_backtrace
   include/linux/panic.h:29:13: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:29:13: sparse: sparse: got panic_on_taint_nousertaint
   include/linux/panic.h:33:13: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:33:13: sparse: sparse: got crash_kexec_post_notifiers
   include/linux/panic.h:54:6: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:54:6: sparse: sparse: got panic_try_start
   include/linux/panic.h:56:6: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:56:6: sparse: sparse: got panic_in_progress
   include/linux/panic.h:57:6: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:57:6: sparse: sparse: got panic_on_this_cpu
   include/linux/panic.h:58:6: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:58:6: sparse: sparse: got panic_on_other_cpu
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/printk.h, include/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, include/linux/bug.h, ...):
   include/linux/init.h:165:13: sparse: sparse: Expected ; at end of declaration
   include/linux/init.h:165:13: sparse: sparse: got rodata_enabled
   include/linux/init.h:170:13: sparse: sparse: Expected ; at end of declaration
   include/linux/init.h:170:13: sparse: sparse: got initcall_debug
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/bits.h, include/linux/ratelimit_types.h, include/linux/printk.h, include/asm-generic/bug.h, ...):
   include/linux/overflow.h:45:42: sparse: sparse: Expected ; at end of declaration
   include/linux/overflow.h:45:42: sparse: sparse: got __must_check_overflow
   include/linux/overflow.h:48:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/overflow.h:48:1: sparse: sparse: got }
   include/linux/overflow.h:334:13: sparse: sparse: Expected ) in function declarator
   include/linux/overflow.h:334:13: sparse: sparse: got (
   include/linux/overflow.h:334:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/overflow.h:337:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/overflow.h:337:16: sparse: sparse: Expected ; at end of declaration
   include/linux/overflow.h:337:16: sparse: sparse: got bytes
   include/linux/overflow.h:338:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/overflow.h:338:1: sparse: sparse: got }
   include/linux/overflow.h:353:13: sparse: sparse: Expected ) in function declarator
   include/linux/overflow.h:353:13: sparse: sparse: got (
   include/linux/overflow.h:353:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/overflow.h:356:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/overflow.h:356:16: sparse: sparse: Expected ; at end of declaration
   include/linux/overflow.h:356:16: sparse: sparse: got bytes
   include/linux/overflow.h:357:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/overflow.h:357:1: sparse: sparse: got }
   include/linux/overflow.h:374:21: sparse: sparse: Expected ) in function declarator
   include/linux/overflow.h:374:21: sparse: sparse: got ==
   include/linux/overflow.h:374:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/overflow.h:378:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/overflow.h:378:16: sparse: sparse: Expected ; at end of declaration
   include/linux/overflow.h:378:16: sparse: sparse: got bytes
   include/linux/overflow.h:379:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/overflow.h:379:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/swab.h, include/uapi/linux/byteorder/big_endian.h, include/linux/byteorder/big_endian.h, ...):
   include/uapi/linux/swab.h:55:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:55:1: sparse: sparse: got }
   include/uapi/linux/swab.h:64:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:64:1: sparse: sparse: got }
   include/uapi/linux/swab.h:73:17: sparse: sparse: Expected ) in function declarator
   include/uapi/linux/swab.h:73:17: sparse: sparse: got (
>> include/uapi/linux/swab.h:73:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/uapi/linux/swab.h:77:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:77:1: sparse: sparse: got }
   include/uapi/linux/swab.h:86:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:86:1: sparse: sparse: got }
   include/uapi/linux/swab.h:95:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:95:1: sparse: sparse: got }
   include/uapi/linux/swab.h:143:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:143:1: sparse: sparse: got }
   include/uapi/linux/swab.h:178:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:178:1: sparse: sparse: got }
   include/uapi/linux/swab.h:191:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:191:1: sparse: sparse: got }
   include/uapi/linux/swab.h:204:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:204:1: sparse: sparse: got }
   include/uapi/linux/swab.h:219:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:219:1: sparse: sparse: got }
   include/uapi/linux/swab.h:234:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:234:1: sparse: sparse: got }
   include/uapi/linux/swab.h:247:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:247:1: sparse: sparse: got }
   include/uapi/linux/swab.h:259:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:259:1: sparse: sparse: got }
   include/uapi/linux/swab.h:272:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:272:1: sparse: sparse: got }
   include/uapi/linux/swab.h:287:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:287:1: sparse: sparse: got }
   include/uapi/linux/swab.h:302:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:302:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/uapi/linux/byteorder/big_endian.h, include/linux/byteorder/big_endian.h, arch/powerpc/include/uapi/asm/byteorder.h, ...):
   include/linux/swab.h:28:20: sparse: sparse: Expected ; at end of declaration
   include/linux/swab.h:28:20: sparse: sparse: got ++
   include/linux/swab.h:29:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/swab.h:29:9: sparse: sparse: got }
   include/linux/swab.h:36:20: sparse: sparse: Expected ; at end of declaration
   include/linux/swab.h:36:20: sparse: sparse: got ++
   include/linux/swab.h:37:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/swab.h:37:9: sparse: sparse: got }
   include/linux/swab.h:44:20: sparse: sparse: Expected ; at end of declaration
   include/linux/swab.h:44:20: sparse: sparse: got ++
   include/linux/swab.h:45:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/swab.h:45:9: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/byteorder/big_endian.h, arch/powerpc/include/uapi/asm/byteorder.h, arch/powerpc/include/asm/qspinlock_types.h, ...):
   include/uapi/linux/byteorder/big_endian.h:48:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/byteorder/big_endian.h:48:1: sparse: sparse: got }
   include/uapi/linux/byteorder/big_endian.h:52:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/byteorder/big_endian.h:52:1: sparse: sparse: got }
   include/uapi/linux/byteorder/big_endian.h:56:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/byteorder/big_endian.h:56:1: sparse: sparse: got }
   include/uapi/linux/byteorder/big_endian.h:60:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/byteorder/big_endian.h:60:1: sparse: sparse: got }
   include/uapi/linux/byteorder/big_endian.h:64:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/byteorder/big_endian.h:64:1: sparse: sparse: got }
   include/uapi/linux/byteorder/big_endian.h:68:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/byteorder/big_endian.h:68:1: sparse: sparse: got }
   include/uapi/linux/byteorder/big_endian.h:72:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/byteorder/big_endian.h:72:1: sparse: sparse: got }
   include/uapi/linux/byteorder/big_endian.h:76:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/byteorder/big_endian.h:76:1: sparse: sparse: got }
   include/uapi/linux/byteorder/big_endian.h:80:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/byteorder/big_endian.h:80:1: sparse: sparse: got }
   include/uapi/linux/byteorder/big_endian.h:84:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/byteorder/big_endian.h:84:1: sparse: sparse: got }
   include/uapi/linux/byteorder/big_endian.h:88:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/byteorder/big_endian.h:88:1: sparse: sparse: got }
   include/uapi/linux/byteorder/big_endian.h:92:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/byteorder/big_endian.h:92:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/byteorder/big_endian.h, arch/powerpc/include/uapi/asm/byteorder.h, arch/powerpc/include/asm/qspinlock_types.h, ...):
   include/linux/byteorder/generic.h:147:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:147:1: sparse: sparse: got }
   include/linux/byteorder/generic.h:152:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:152:1: sparse: sparse: got }
   include/linux/byteorder/generic.h:157:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:157:1: sparse: sparse: got }
   include/linux/byteorder/generic.h:164:20: sparse: sparse: Expected ; at end of declaration
   include/linux/byteorder/generic.h:164:20: sparse: sparse: got ++
   include/linux/byteorder/generic.h:165:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:165:9: sparse: sparse: got }
   include/linux/byteorder/generic.h:172:20: sparse: sparse: Expected ; at end of declaration
   include/linux/byteorder/generic.h:172:20: sparse: sparse: got ++
   include/linux/byteorder/generic.h:173:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:173:9: sparse: sparse: got }
   include/linux/byteorder/generic.h:180:20: sparse: sparse: Expected ; at end of declaration
   include/linux/byteorder/generic.h:180:20: sparse: sparse: got ++
   include/linux/byteorder/generic.h:181:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:181:9: sparse: sparse: got }
   include/linux/byteorder/generic.h:188:20: sparse: sparse: Expected ; at end of declaration
   include/linux/byteorder/generic.h:188:20: sparse: sparse: got ++
   include/linux/byteorder/generic.h:189:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:189:9: sparse: sparse: got }
   include/linux/byteorder/generic.h:196:16: sparse: sparse: Expected ) in function declarator
   include/linux/byteorder/generic.h:196:16: sparse: sparse: got =
>> include/linux/byteorder/generic.h:196:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   include/linux/byteorder/generic.h:196:23: sparse: sparse: Expected ; at end of declaration
   include/linux/byteorder/generic.h:196:23: sparse: sparse: got <
   include/linux/byteorder/generic.h:196:33: sparse: sparse: Expected ; at end of declaration
   include/linux/byteorder/generic.h:196:33: sparse: sparse: got ++
   include/linux/byteorder/generic.h:198:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:198:1: sparse: sparse: got }
   include/linux/byteorder/generic.h:204:16: sparse: sparse: Expected ) in function declarator
   include/linux/byteorder/generic.h:204:16: sparse: sparse: got =
   include/linux/byteorder/generic.h:204:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   include/linux/byteorder/generic.h:204:23: sparse: sparse: Expected ; at end of declaration
   include/linux/byteorder/generic.h:204:23: sparse: sparse: got <
   include/linux/byteorder/generic.h:204:33: sparse: sparse: Expected ; at end of declaration
   include/linux/byteorder/generic.h:204:33: sparse: sparse: got ++
   include/linux/byteorder/generic.h:206:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:206:1: sparse: sparse: got }
   include/linux/byteorder/generic.h:211:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:211:1: sparse: sparse: got }
   include/linux/byteorder/generic.h:216:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:216:1: sparse: sparse: got }
   include/linux/byteorder/generic.h:221:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:221:1: sparse: sparse: got }
   include/linux/byteorder/generic.h:227:16: sparse: sparse: Expected ) in function declarator
   include/linux/byteorder/generic.h:227:16: sparse: sparse: got =
   include/linux/byteorder/generic.h:227:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   include/linux/byteorder/generic.h:227:23: sparse: sparse: Expected ; at end of declaration
   include/linux/byteorder/generic.h:227:23: sparse: sparse: got <
   include/linux/byteorder/generic.h:227:31: sparse: sparse: Expected ; at end of declaration
   include/linux/byteorder/generic.h:227:31: sparse: sparse: got ++
   include/linux/byteorder/generic.h:229:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:229:1: sparse: sparse: got }
   include/linux/byteorder/generic.h:235:16: sparse: sparse: Expected ) in function declarator
   include/linux/byteorder/generic.h:235:16: sparse: sparse: got =
   include/linux/byteorder/generic.h:235:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   include/linux/byteorder/generic.h:235:23: sparse: sparse: Expected ; at end of declaration
   include/linux/byteorder/generic.h:235:23: sparse: sparse: got <
   include/linux/byteorder/generic.h:235:31: sparse: sparse: Expected ; at end of declaration
   include/linux/byteorder/generic.h:235:31: sparse: sparse: got ++
   include/linux/byteorder/generic.h:237:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:237:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/spinlock_types.h, include/linux/spinlock_types_raw.h, include/linux/ratelimit_types.h, ...):
   arch/powerpc/include/asm/qspinlock_types.h:23:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/qspinlock_types.h:23:9: sparse: sparse: got }
   arch/powerpc/include/asm/qspinlock_types.h:24:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/qspinlock_types.h:24:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/spinlock_types.h, include/linux/spinlock_types_raw.h, include/linux/ratelimit_types.h, ...):
   include/asm-generic/qrwlock_types.h:26:33: sparse: sparse: expected ; at end of declaration
   include/asm-generic/qrwlock_types.h:26:33: sparse: sparse: Expected } at end of specifier
   include/asm-generic/qrwlock_types.h:26:33: sparse: sparse: got wait_lock
   include/asm-generic/qrwlock_types.h:27:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/qrwlock_types.h:27:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/ratelimit_types.h, include/linux/printk.h, include/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, ...):
   include/linux/spinlock_types_raw.h:15:25: sparse: sparse: expected ; at end of declaration
   include/linux/spinlock_types_raw.h:15:25: sparse: sparse: Expected } at end of specifier
   include/linux/spinlock_types_raw.h:15:25: sparse: sparse: got raw_lock
   include/linux/spinlock_types_raw.h:23:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/spinlock_types_raw.h:23:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, include/linux/bug.h, include/linux/thread_info.h, ...):
   include/linux/printk.h:188:13: sparse: sparse: Expected ; at end of declaration
   include/linux/printk.h:188:13: sparse: sparse: got printk_timed_ratelimit
   include/linux/printk.h:208:13: sparse: sparse: Expected ; at end of declaration
   include/linux/printk.h:208:13: sparse: sparse: got nbcon_device_try_acquire
   include/linux/printk.h:211:6: sparse: sparse: Expected ; at end of declaration
   include/linux/printk.h:211:6: sparse: sparse: got pr_flush
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/cleanup.h, include/linux/jump_label.h, include/linux/dynamic_debug.h, include/linux/printk.h, ...):
   include/linux/err.h:76:33: sparse: sparse: Expected ; at end of declaration
   include/linux/err.h:76:33: sparse: sparse: got IS_ERR
   include/linux/err.h:79:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/err.h:79:1: sparse: sparse: got }
   include/linux/err.h:93:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/err.h:93:1: sparse: sparse: got }
   include/linux/err.h:106:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/err.h:106:1: sparse: sparse: got }
   include/linux/err.h:129:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   include/linux/err.h:130:17: sparse: sparse: Expected ; at end of declaration
   include/linux/err.h:130:17: sparse: sparse: got return
   include/linux/err.h:131:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/err.h:131:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/jump_label.h, include/linux/dynamic_debug.h, include/linux/printk.h, include/asm-generic/bug.h, ...):
   include/linux/cleanup.h:225:15: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cleanup.h:225:15: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/jump_label.h, include/linux/dynamic_debug.h, include/linux/printk.h, include/asm-generic/bug.h, ...):
   arch/powerpc/include/asm/jump_label.h:18:29: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/jump_label.h:18:29: sparse: sparse: got arch_static_branch
   arch/powerpc/include/asm/jump_label.h:28:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/jump_label.h:28:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/jump_label.h:28:16: sparse: sparse: got false
   arch/powerpc/include/asm/jump_label.h:29:6: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/jump_label.h:29:6: sparse: sparse: got :
   arch/powerpc/include/asm/jump_label.h:31:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/jump_label.h:31:1: sparse: sparse: got }
   arch/powerpc/include/asm/jump_label.h:43:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/jump_label.h:43:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/jump_label.h:43:16: sparse: sparse: got false
   arch/powerpc/include/asm/jump_label.h:44:6: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/jump_label.h:44:6: sparse: sparse: got :
   arch/powerpc/include/asm/jump_label.h:46:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/jump_label.h:46:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/dynamic_debug.h, include/linux/printk.h, include/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, ...):
   include/linux/jump_label.h:115:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:115:1: sparse: sparse: got }
--
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: got }
   include/asm-generic/bitops/generic-non-atomic.h:141:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/generic-non-atomic.h:141:1: sparse: sparse: got }
   include/asm-generic/bitops/generic-non-atomic.h:172:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/generic-non-atomic.h:172:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/generic-non-atomic.h:172:16: sparse: sparse: got !
   include/asm-generic/bitops/generic-non-atomic.h:173:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/generic-non-atomic.h:173:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, arch/powerpc/include/generated/asm/div64.h, ...):
   arch/powerpc/include/asm/bitops.h:85:29: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/bitops.h:85:29: sparse: sparse: got is_rlwinm_mask_valid
   arch/powerpc/include/asm/bitops.h:89:15: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:89:15: sparse: sparse: got &
   arch/powerpc/include/asm/bitops.h:89:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/bitops.h:91:11: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/bitops.h:91:11: sparse: sparse: got +=
   arch/powerpc/include/asm/bitops.h:93:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/bitops.h:93:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/bitops.h:93:16: sparse: sparse: got !
   arch/powerpc/include/asm/bitops.h:94:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:94:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:126:1: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:126:1: sparse: sparse: got 1
   arch/powerpc/include/asm/bitops.h:126:1: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/bitops.h:126:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:126:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:126:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:126:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: got 1
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:132:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:132:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:137:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:137:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:142:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:142:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:147:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:147:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:171:1: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:171:1: sparse: sparse: got &
   arch/powerpc/include/asm/bitops.h:171:1: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/bitops.h:171:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:171:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:173:1: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:173:1: sparse: sparse: got &
   arch/powerpc/include/asm/bitops.h:173:1: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/bitops.h:173:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:173:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:175:1: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:175:1: sparse: sparse: got &
   arch/powerpc/include/asm/bitops.h:175:1: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/bitops.h:175:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:175:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:183:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:183:13: sparse: sparse: got 1
   arch/powerpc/include/asm/bitops.h:183:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/bitops.h:195:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:195:9: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:206:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:206:9: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:209:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:209:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:215:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:215:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:222:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:222:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:228:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:228:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:234:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:234:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:251:21: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:251:21: sparse: sparse: got &
   arch/powerpc/include/asm/bitops.h:251:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/bitops.h:252:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:252:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:260:9: sparse: sparse: Expected ) in nested declarator
   arch/powerpc/include/asm/bitops.h:260:9: sparse: sparse: got &&
   arch/powerpc/include/asm/bitops.h:261:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:261:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/builtin-__ffs.h:14:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/builtin-__ffs.h:14:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, arch/powerpc/include/generated/asm/div64.h, ...):
   arch/powerpc/include/asm/bitops.h:283:33: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:283:33: sparse: sparse: got (
   arch/powerpc/include/asm/bitops.h:283:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/bitops.h:286:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/bitops.h:286:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/bitops.h:286:16: sparse: sparse: got 32
   arch/powerpc/include/asm/bitops.h:287:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:287:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/builtin-__fls.h:14:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/builtin-__fls.h:14:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
>> include/asm-generic/bitops/fls64.h:22:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/asm-generic/bitops/fls64.h:23:17: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/fls64.h:23:17: sparse: sparse: got return
>> include/asm-generic/bitops/fls64.h:24:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/fls64.h:24:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/fls64.h:24:16: sparse: sparse: got fls
   include/asm-generic/bitops/fls64.h:25:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/fls64.h:25:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/asm-generic/bitops/hweight.h, arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   include/asm-generic/bitops/arch_hweight.h:10:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/arch_hweight.h:10:1: sparse: sparse: got }
   include/asm-generic/bitops/arch_hweight.h:15:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/arch_hweight.h:15:1: sparse: sparse: got }
   include/asm-generic/bitops/arch_hweight.h:20:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/arch_hweight.h:20:1: sparse: sparse: got }
   include/asm-generic/bitops/arch_hweight.h:25:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/arch_hweight.h:25:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/asm-generic/bitops/instrumented-atomic.h, arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, ...):
   include/linux/instrumented.h:28:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:28:9: sparse: sparse: got ,
   include/linux/instrumented.h:29:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:29:1: sparse: sparse: got }
   include/linux/instrumented.h:42:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:42:9: sparse: sparse: got ,
   include/linux/instrumented.h:43:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:43:1: sparse: sparse: got }
   include/linux/instrumented.h:56:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:56:9: sparse: sparse: got ,
   include/linux/instrumented.h:57:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:57:1: sparse: sparse: got }
   include/linux/instrumented.h:65:21: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:65:21: sparse: sparse: got 0
>> include/linux/instrumented.h:65:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/instrumented.h:66:57: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:66:57: sparse: sparse: got }
   include/linux/instrumented.h:67:17: sparse: sparse: Expected ) in nested declarator
   include/linux/instrumented.h:67:17: sparse: sparse: got {
   include/linux/instrumented.h:67:17: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:67:17: sparse: sparse: got (
   include/linux/instrumented.h:67:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/instrumented.h:67:17: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:67:17: sparse: sparse: got !
   include/linux/instrumented.h:67:17: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:67:17: sparse: sparse: got }
   include/linux/instrumented.h:68:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:68:9: sparse: sparse: got }
   include/linux/instrumented.h:83:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:83:9: sparse: sparse: got ,
   include/linux/instrumented.h:85:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:85:1: sparse: sparse: got }
   include/linux/instrumented.h:98:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:98:9: sparse: sparse: got ,
   include/linux/instrumented.h:100:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:100:1: sparse: sparse: got }
   include/linux/instrumented.h:113:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:113:9: sparse: sparse: got ,
   include/linux/instrumented.h:115:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:115:1: sparse: sparse: got }
   include/linux/instrumented.h:130:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:130:9: sparse: sparse: got ,
   include/linux/instrumented.h:131:39: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:131:39: sparse: sparse: got ,
   include/linux/instrumented.h:132:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:132:1: sparse: sparse: got }
   include/linux/instrumented.h:147:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:147:9: sparse: sparse: got ,
   include/linux/instrumented.h:148:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:148:1: sparse: sparse: got }
   include/linux/instrumented.h:165:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:165:1: sparse: sparse: got }
   include/linux/instrumented.h:181:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:181:9: sparse: sparse: got ,
   include/linux/instrumented.h:182:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:182:9: sparse: sparse: got ,
   include/linux/instrumented.h:183:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:183:1: sparse: sparse: got }
   include/linux/instrumented.h:200:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:200:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/instrumented-atomic.h:30:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:30:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:43:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:43:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:59:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:59:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:71:43: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-atomic.h:71:43: sparse: sparse: got +
   include/asm-generic/bitops/instrumented-atomic.h:72:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/instrumented-atomic.h:72:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/instrumented-atomic.h:72:16: sparse: sparse: got arch_test_and_set_bit
   include/asm-generic/bitops/instrumented-atomic.h:73:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:73:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:85:43: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-atomic.h:85:43: sparse: sparse: got +
   include/asm-generic/bitops/instrumented-atomic.h:86:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/instrumented-atomic.h:86:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/instrumented-atomic.h:86:16: sparse: sparse: got arch_test_and_clear_bit
   include/asm-generic/bitops/instrumented-atomic.h:87:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:87:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:99:43: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-atomic.h:99:43: sparse: sparse: got +
   include/asm-generic/bitops/instrumented-atomic.h:100:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/instrumented-atomic.h:100:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/instrumented-atomic.h:100:16: sparse: sparse: got arch_test_and_change_bit
   include/asm-generic/bitops/instrumented-atomic.h:101:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:101:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/instrumented-lock.h:26:38: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-lock.h:26:38: sparse: sparse: got +
   include/asm-generic/bitops/instrumented-lock.h:28:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-lock.h:28:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-lock.h:42:31: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-lock.h:42:31: sparse: sparse: got +
   include/asm-generic/bitops/instrumented-lock.h:44:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-lock.h:44:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-lock.h:58:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/instrumented-lock.h:58:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/instrumented-lock.h:58:16: sparse: sparse: got arch_test_and_set_bit_lock
   include/asm-generic/bitops/instrumented-lock.h:59:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-lock.h:59:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-lock.h:79:45: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-lock.h:79:45: sparse: sparse: got (
   include/asm-generic/bitops/instrumented-lock.h:80:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/instrumented-lock.h:80:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/instrumented-lock.h:80:16: sparse: sparse: got arch_xor_unlock_is_negative_byte
   include/asm-generic/bitops/instrumented-lock.h:81:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-lock.h:81:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/le.h:22:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:22:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:27:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:27:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:32:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:32:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:37:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:37:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:42:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:42:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:47:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:47:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:52:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:52:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:57:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:57:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:62:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:62:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/sched.h:22:14: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/sched.h:22:14: sparse: sparse: got [
>> include/asm-generic/bitops/sched.h:22:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/asm-generic/bitops/sched.h:24:14: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/sched.h:24:14: sparse: sparse: got [
   include/asm-generic/bitops/sched.h:24:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/asm-generic/bitops/sched.h:26:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/sched.h:26:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/sched.h:26:16: sparse: sparse: got __ffs
   include/asm-generic/bitops/sched.h:30:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/sched.h:30:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/log2.h, include/asm-generic/div64.h, arch/powerpc/include/generated/asm/div64.h, include/linux/math.h, ...):
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'const_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/asm-generic/div64.h, arch/powerpc/include/generated/asm/div64.h, include/linux/math.h, include/linux/math64.h, ...):
   include/linux/log2.h:45:6: sparse: sparse: Expected ; at end of declaration
   include/linux/log2.h:45:6: sparse: sparse: got is_power_of_2
   include/linux/log2.h:48:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:48:1: sparse: sparse: got }
   include/linux/log2.h:58:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:58:1: sparse: sparse: got }
   include/linux/log2.h:68:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:68:1: sparse: sparse: got }
   include/linux/log2.h:202:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:202:1: sparse: sparse: got }
   include/linux/log2.h:230:26: sparse: sparse: Expected ) in function declarator
   include/linux/log2.h:230:26: sparse: sparse: got (
   include/linux/log2.h:230:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/log2.h:232:16: sparse: sparse: Expected ) in function declarator
   include/linux/log2.h:232:16: sparse: sparse: got (
   include/linux/log2.h:232:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/log2.h:233:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:233:1: sparse: sparse: got }
   include/linux/log2.h:270:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:270:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/generated/asm/div64.h, include/linux/math.h, include/linux/math64.h, include/linux/time64.h, ...):
   include/asm-generic/div64.h:151:14: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/div64.h:151:14: sparse: sparse: got no_ovf
>> include/asm-generic/div64.h:154:9: sparse: sparse: Trying to use reserved word 'if' as identifier
>> include/asm-generic/div64.h:154:13: sparse: sparse: missing type declaration for parameter 'no_ovf'
>> include/asm-generic/div64.h:161:11: sparse: sparse: Trying to use reserved word 'else' as identifier
   include/asm-generic/div64.h:161:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/div64.h:161:16: sparse: sparse: got {
   include/asm-generic/div64.h:166:19: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/div64.h:166:19: sparse: sparse: got +=
   include/asm-generic/div64.h:167:9: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/div64.h:167:9: sparse: sparse: got }
   include/asm-generic/div64.h:170:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/div64.h:170:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/math64.h, include/linux/time64.h, include/linux/restart_block.h, include/linux/thread_info.h, ...):
   include/vdso/math64.h:46:14: sparse: sparse: Expected ; at end of statement
   include/vdso/math64.h:46:14: sparse: sparse: got ovf
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/time64.h, include/linux/restart_block.h, include/linux/thread_info.h, arch/powerpc/include/asm/processor.h, ...):
   include/linux/math64.h:92:22: sparse: sparse: Expected ; at end of statement
   include/linux/math64.h:92:22: sparse: sparse: got ___bias
   include/linux/math64.h:286:21: sparse: sparse: Expected ; at end of statement
   include/linux/math64.h:286:21: sparse: sparse: got ___bias
   include/linux/math64.h:289:9: sparse: sparse: Expected ; at end of statement
   include/linux/math64.h:289:9: sparse: sparse: got ___bias
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/restart_block.h, include/linux/thread_info.h, arch/powerpc/include/asm/processor.h, include/linux/sched.h, ...):
   include/linux/time64.h:52:20: sparse: sparse: Expected ; at end of declaration
   include/linux/time64.h:52:20: sparse: sparse: got timespec64_is_epoch
   include/linux/time64.h:55:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/time64.h:55:1: sparse: sparse: got }
   include/linux/time64.h:66:16: sparse: sparse: Expected ) in function declarator
   include/linux/time64.h:66:16: sparse: sparse: got ->
   include/linux/time64.h:66:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/time64.h:68:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/time64.h:68:16: sparse: sparse: Expected ; at end of declaration
   include/linux/time64.h:68:16: sparse: sparse: got lhs
   include/linux/time64.h:69:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/time64.h:69:1: sparse: sparse: got }
   include/linux/time64.h:97:20: sparse: sparse: Expected ; at end of declaration
   include/linux/time64.h:97:20: sparse: sparse: got timespec64_valid
   include/linux/time64.h:103:13: sparse: sparse: Expected ) in function declarator
   include/linux/time64.h:103:13: sparse: sparse: got (
   include/linux/time64.h:103:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/time64.h:105:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/time64.h:105:16: sparse: sparse: Expected ; at end of declaration
   include/linux/time64.h:105:16: sparse: sparse: got true
   include/linux/time64.h:106:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/time64.h:106:1: sparse: sparse: got }
   include/linux/time64.h:113:13: sparse: sparse: Expected ) in function declarator
   include/linux/time64.h:113:13: sparse: sparse: got (
   include/linux/time64.h:113:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/time64.h:115:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/time64.h:115:16: sparse: sparse: Expected ; at end of declaration
   include/linux/time64.h:115:16: sparse: sparse: got true
   include/linux/time64.h:116:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/time64.h:116:1: sparse: sparse: got }
   include/linux/time64.h:123:13: sparse: sparse: Expected ) in function declarator
   include/linux/time64.h:123:13: sparse: sparse: got (
   include/linux/time64.h:123:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/time64.h:125:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/time64.h:125:16: sparse: sparse: Expected ; at end of declaration
   include/linux/time64.h:125:16: sparse: sparse: got true
   include/linux/time64.h:126:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/time64.h:126:1: sparse: sparse: got }
   include/linux/time64.h:141:15: sparse: sparse: Expected ) in function declarator
   include/linux/time64.h:141:15: sparse: sparse: got ->
   include/linux/time64.h:141:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/time64.h:144:17: sparse: sparse: Expected ) in function declarator
   include/linux/time64.h:144:17: sparse: sparse: got (
   include/linux/time64.h:144:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/time64.h:145:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/time64.h:145:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/thread_info.h, include/linux/thread_info.h, ...):
   include/linux/kstrtox.h:98:49: sparse: sparse: Expected ) in function declarator
   include/linux/kstrtox.h:98:49: sparse: sparse: got *
   include/linux/kstrtox.h:110:80: sparse: sparse: Expected ) in function declarator
   include/linux/kstrtox.h:110:80: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/thread_info.h, include/linux/thread_info.h, ...):
   include/linux/minmax.h:276:20: sparse: sparse: Expected ; at end of declaration
   include/linux/minmax.h:276:20: sparse: sparse: got in_range64
   include/linux/minmax.h:279:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/minmax.h:279:1: sparse: sparse: got }
   include/linux/minmax.h:284:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/minmax.h:284:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/thread_info.h, include/linux/thread_info.h, ...):
   include/linux/sprintf.h:25:13: sparse: sparse: Expected ; at end of declaration
   include/linux/sprintf.h:25:13: sparse: sparse: got no_hash_pointers
   include/linux/sprintf.h:26:34: sparse: sparse: Expected ) in function declarator
   include/linux/sprintf.h:26:34: sparse: sparse: got slub_debug
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/thread_info.h, include/linux/thread_info.h, ...):
   include/linux/kernel.h:162:13: sparse: sparse: Expected ; at end of declaration
   include/linux/kernel.h:162:13: sparse: sparse: got early_boot_irqs_disabled
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/thread_info.h, arch/powerpc/include/asm/processor.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/thread_info.h:171:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/thread_info.h:171:20: sparse: sparse: got test_thread_local_flags
   arch/powerpc/include/asm/thread_info.h:174:19: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/thread_info.h:174:19: sparse: sparse: got ->
   arch/powerpc/include/asm/thread_info.h:174:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/thread_info.h:175:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/thread_info.h:175:1: sparse: sparse: got }
   arch/powerpc/include/asm/thread_info.h:220:22: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/thread_info.h:220:22: sparse: sparse: got <=
   arch/powerpc/include/asm/thread_info.h:220:9: sparse: sparse: Trying to use reserved word 'while' as identifier
   arch/powerpc/include/asm/thread_info.h:225:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/thread_info.h:225:9: sparse: sparse: got }
   arch/powerpc/include/asm/thread_info.h:228:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/thread_info.h:228:1: sparse: sparse: got }
--
   lib/raid/raid6/powerpc/altivec8.c: note: in included file:
   ../lib/gcc/powerpc-linux/10.5.0/include/altivec.h:34:2: sparse: sparse: Use the "-maltivec" flag to enable PowerPC AltiVec support
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/vdso/processor.h, include/vdso/processor.h, arch/powerpc/include/asm/processor.h, ...):
   arch/powerpc/include/asm/feature-fixups.h:294:13: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/feature-fixups.h:294:13: sparse: sparse: got static_key_feature_checks_initialized
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/processor.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   arch/powerpc/include/asm/reg.h:1414:13: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/reg.h:1414:13: sparse: sparse: got strict_msr_control
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/asm-generic/rwonce.h, arch/powerpc/include/generated/asm/rwonce.h, include/linux/compiler.h, include/asm-generic/bug.h, ...):
   include/linux/kasan-checks.h:22:20: sparse: sparse: Expected ; at end of declaration
   include/linux/kasan-checks.h:22:20: sparse: sparse: got __kasan_check_read
   include/linux/kasan-checks.h:25:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/kasan-checks.h:25:1: sparse: sparse: got }
   include/linux/kasan-checks.h:29:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/kasan-checks.h:29:1: sparse: sparse: got }
   include/linux/kasan-checks.h:43:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/kasan-checks.h:43:1: sparse: sparse: got }
   include/linux/kasan-checks.h:47:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/kasan-checks.h:47:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, include/linux/bug.h, include/linux/thread_info.h, ...):
   include/linux/panic.h:20:13: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:20:13: sparse: sparse: got oops_may_print
   include/linux/panic.h:22:13: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:22:13: sparse: sparse: got panic_triggering_all_cpu_backtrace
   include/linux/panic.h:29:13: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:29:13: sparse: sparse: got panic_on_taint_nousertaint
   include/linux/panic.h:33:13: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:33:13: sparse: sparse: got crash_kexec_post_notifiers
   include/linux/panic.h:54:6: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:54:6: sparse: sparse: got panic_try_start
   include/linux/panic.h:56:6: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:56:6: sparse: sparse: got panic_in_progress
   include/linux/panic.h:57:6: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:57:6: sparse: sparse: got panic_on_this_cpu
   include/linux/panic.h:58:6: sparse: sparse: Expected ; at end of declaration
   include/linux/panic.h:58:6: sparse: sparse: got panic_on_other_cpu
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/printk.h, include/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, include/linux/bug.h, ...):
   include/linux/init.h:165:13: sparse: sparse: Expected ; at end of declaration
   include/linux/init.h:165:13: sparse: sparse: got rodata_enabled
   include/linux/init.h:170:13: sparse: sparse: Expected ; at end of declaration
   include/linux/init.h:170:13: sparse: sparse: got initcall_debug
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/bits.h, include/linux/ratelimit_types.h, include/linux/printk.h, include/asm-generic/bug.h, ...):
   include/linux/overflow.h:45:42: sparse: sparse: Expected ; at end of declaration
   include/linux/overflow.h:45:42: sparse: sparse: got __must_check_overflow
   include/linux/overflow.h:48:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/overflow.h:48:1: sparse: sparse: got }
   include/linux/overflow.h:334:13: sparse: sparse: Expected ) in function declarator
   include/linux/overflow.h:334:13: sparse: sparse: got (
   include/linux/overflow.h:334:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/overflow.h:337:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/overflow.h:337:16: sparse: sparse: Expected ; at end of declaration
   include/linux/overflow.h:337:16: sparse: sparse: got bytes
   include/linux/overflow.h:338:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/overflow.h:338:1: sparse: sparse: got }
   include/linux/overflow.h:353:13: sparse: sparse: Expected ) in function declarator
   include/linux/overflow.h:353:13: sparse: sparse: got (
   include/linux/overflow.h:353:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/overflow.h:356:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/overflow.h:356:16: sparse: sparse: Expected ; at end of declaration
   include/linux/overflow.h:356:16: sparse: sparse: got bytes
   include/linux/overflow.h:357:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/overflow.h:357:1: sparse: sparse: got }
   include/linux/overflow.h:374:21: sparse: sparse: Expected ) in function declarator
   include/linux/overflow.h:374:21: sparse: sparse: got ==
   include/linux/overflow.h:374:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/overflow.h:378:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/overflow.h:378:16: sparse: sparse: Expected ; at end of declaration
   include/linux/overflow.h:378:16: sparse: sparse: got bytes
   include/linux/overflow.h:379:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/overflow.h:379:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/swab.h, include/uapi/linux/byteorder/big_endian.h, include/linux/byteorder/big_endian.h, ...):
   include/uapi/linux/swab.h:55:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:55:1: sparse: sparse: got }
   include/uapi/linux/swab.h:64:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:64:1: sparse: sparse: got }
   include/uapi/linux/swab.h:73:17: sparse: sparse: Expected ) in function declarator
   include/uapi/linux/swab.h:73:17: sparse: sparse: got (
>> include/uapi/linux/swab.h:73:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/uapi/linux/swab.h:77:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:77:1: sparse: sparse: got }
   include/uapi/linux/swab.h:86:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:86:1: sparse: sparse: got }
   include/uapi/linux/swab.h:95:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:95:1: sparse: sparse: got }
   include/uapi/linux/swab.h:143:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:143:1: sparse: sparse: got }
   include/uapi/linux/swab.h:178:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:178:1: sparse: sparse: got }
   include/uapi/linux/swab.h:191:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:191:1: sparse: sparse: got }
   include/uapi/linux/swab.h:204:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:204:1: sparse: sparse: got }
   include/uapi/linux/swab.h:219:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:219:1: sparse: sparse: got }
   include/uapi/linux/swab.h:234:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:234:1: sparse: sparse: got }
   include/uapi/linux/swab.h:247:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:247:1: sparse: sparse: got }
   include/uapi/linux/swab.h:259:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:259:1: sparse: sparse: got }
   include/uapi/linux/swab.h:272:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:272:1: sparse: sparse: got }
   include/uapi/linux/swab.h:287:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:287:1: sparse: sparse: got }
   include/uapi/linux/swab.h:302:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/swab.h:302:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/uapi/linux/byteorder/big_endian.h, include/linux/byteorder/big_endian.h, arch/powerpc/include/uapi/asm/byteorder.h, ...):
   include/linux/swab.h:28:20: sparse: sparse: Expected ; at end of declaration
   include/linux/swab.h:28:20: sparse: sparse: got ++
   include/linux/swab.h:29:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/swab.h:29:9: sparse: sparse: got }
   include/linux/swab.h:36:20: sparse: sparse: Expected ; at end of declaration
   include/linux/swab.h:36:20: sparse: sparse: got ++
   include/linux/swab.h:37:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/swab.h:37:9: sparse: sparse: got }
   include/linux/swab.h:44:20: sparse: sparse: Expected ; at end of declaration
   include/linux/swab.h:44:20: sparse: sparse: got ++
   include/linux/swab.h:45:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/swab.h:45:9: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/byteorder/big_endian.h, arch/powerpc/include/uapi/asm/byteorder.h, arch/powerpc/include/asm/qspinlock_types.h, ...):
   include/uapi/linux/byteorder/big_endian.h:48:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/byteorder/big_endian.h:48:1: sparse: sparse: got }
   include/uapi/linux/byteorder/big_endian.h:52:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/byteorder/big_endian.h:52:1: sparse: sparse: got }
   include/uapi/linux/byteorder/big_endian.h:56:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/byteorder/big_endian.h:56:1: sparse: sparse: got }
   include/uapi/linux/byteorder/big_endian.h:60:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/byteorder/big_endian.h:60:1: sparse: sparse: got }
   include/uapi/linux/byteorder/big_endian.h:64:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/byteorder/big_endian.h:64:1: sparse: sparse: got }
   include/uapi/linux/byteorder/big_endian.h:68:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/byteorder/big_endian.h:68:1: sparse: sparse: got }
   include/uapi/linux/byteorder/big_endian.h:72:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/byteorder/big_endian.h:72:1: sparse: sparse: got }
   include/uapi/linux/byteorder/big_endian.h:76:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/byteorder/big_endian.h:76:1: sparse: sparse: got }
   include/uapi/linux/byteorder/big_endian.h:80:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/byteorder/big_endian.h:80:1: sparse: sparse: got }
   include/uapi/linux/byteorder/big_endian.h:84:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/byteorder/big_endian.h:84:1: sparse: sparse: got }
   include/uapi/linux/byteorder/big_endian.h:88:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/byteorder/big_endian.h:88:1: sparse: sparse: got }
   include/uapi/linux/byteorder/big_endian.h:92:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/byteorder/big_endian.h:92:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/byteorder/big_endian.h, arch/powerpc/include/uapi/asm/byteorder.h, arch/powerpc/include/asm/qspinlock_types.h, ...):
   include/linux/byteorder/generic.h:147:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:147:1: sparse: sparse: got }
   include/linux/byteorder/generic.h:152:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:152:1: sparse: sparse: got }
   include/linux/byteorder/generic.h:157:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:157:1: sparse: sparse: got }
   include/linux/byteorder/generic.h:164:20: sparse: sparse: Expected ; at end of declaration
   include/linux/byteorder/generic.h:164:20: sparse: sparse: got ++
   include/linux/byteorder/generic.h:165:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:165:9: sparse: sparse: got }
   include/linux/byteorder/generic.h:172:20: sparse: sparse: Expected ; at end of declaration
   include/linux/byteorder/generic.h:172:20: sparse: sparse: got ++
   include/linux/byteorder/generic.h:173:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:173:9: sparse: sparse: got }
   include/linux/byteorder/generic.h:180:20: sparse: sparse: Expected ; at end of declaration
   include/linux/byteorder/generic.h:180:20: sparse: sparse: got ++
   include/linux/byteorder/generic.h:181:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:181:9: sparse: sparse: got }
   include/linux/byteorder/generic.h:188:20: sparse: sparse: Expected ; at end of declaration
   include/linux/byteorder/generic.h:188:20: sparse: sparse: got ++
   include/linux/byteorder/generic.h:189:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:189:9: sparse: sparse: got }
   include/linux/byteorder/generic.h:196:16: sparse: sparse: Expected ) in function declarator
   include/linux/byteorder/generic.h:196:16: sparse: sparse: got =
>> include/linux/byteorder/generic.h:196:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   include/linux/byteorder/generic.h:196:23: sparse: sparse: Expected ; at end of declaration
   include/linux/byteorder/generic.h:196:23: sparse: sparse: got <
   include/linux/byteorder/generic.h:196:33: sparse: sparse: Expected ; at end of declaration
   include/linux/byteorder/generic.h:196:33: sparse: sparse: got ++
   include/linux/byteorder/generic.h:198:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:198:1: sparse: sparse: got }
   include/linux/byteorder/generic.h:204:16: sparse: sparse: Expected ) in function declarator
   include/linux/byteorder/generic.h:204:16: sparse: sparse: got =
   include/linux/byteorder/generic.h:204:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   include/linux/byteorder/generic.h:204:23: sparse: sparse: Expected ; at end of declaration
   include/linux/byteorder/generic.h:204:23: sparse: sparse: got <
   include/linux/byteorder/generic.h:204:33: sparse: sparse: Expected ; at end of declaration
   include/linux/byteorder/generic.h:204:33: sparse: sparse: got ++
   include/linux/byteorder/generic.h:206:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:206:1: sparse: sparse: got }
   include/linux/byteorder/generic.h:211:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:211:1: sparse: sparse: got }
   include/linux/byteorder/generic.h:216:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:216:1: sparse: sparse: got }
   include/linux/byteorder/generic.h:221:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:221:1: sparse: sparse: got }
   include/linux/byteorder/generic.h:227:16: sparse: sparse: Expected ) in function declarator
   include/linux/byteorder/generic.h:227:16: sparse: sparse: got =
   include/linux/byteorder/generic.h:227:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   include/linux/byteorder/generic.h:227:23: sparse: sparse: Expected ; at end of declaration
   include/linux/byteorder/generic.h:227:23: sparse: sparse: got <
   include/linux/byteorder/generic.h:227:31: sparse: sparse: Expected ; at end of declaration
   include/linux/byteorder/generic.h:227:31: sparse: sparse: got ++
   include/linux/byteorder/generic.h:229:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:229:1: sparse: sparse: got }
   include/linux/byteorder/generic.h:235:16: sparse: sparse: Expected ) in function declarator
   include/linux/byteorder/generic.h:235:16: sparse: sparse: got =
   include/linux/byteorder/generic.h:235:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   include/linux/byteorder/generic.h:235:23: sparse: sparse: Expected ; at end of declaration
   include/linux/byteorder/generic.h:235:23: sparse: sparse: got <
   include/linux/byteorder/generic.h:235:31: sparse: sparse: Expected ; at end of declaration
   include/linux/byteorder/generic.h:235:31: sparse: sparse: got ++
   include/linux/byteorder/generic.h:237:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/byteorder/generic.h:237:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/spinlock_types.h, include/linux/spinlock_types_raw.h, include/linux/ratelimit_types.h, ...):
   arch/powerpc/include/asm/qspinlock_types.h:23:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/qspinlock_types.h:23:9: sparse: sparse: got }
   arch/powerpc/include/asm/qspinlock_types.h:24:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/qspinlock_types.h:24:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/spinlock_types.h, include/linux/spinlock_types_raw.h, include/linux/ratelimit_types.h, ...):
   include/asm-generic/qrwlock_types.h:26:33: sparse: sparse: expected ; at end of declaration
   include/asm-generic/qrwlock_types.h:26:33: sparse: sparse: Expected } at end of specifier
   include/asm-generic/qrwlock_types.h:26:33: sparse: sparse: got wait_lock
   include/asm-generic/qrwlock_types.h:27:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/qrwlock_types.h:27:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/ratelimit_types.h, include/linux/printk.h, include/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, ...):
   include/linux/spinlock_types_raw.h:15:25: sparse: sparse: expected ; at end of declaration
   include/linux/spinlock_types_raw.h:15:25: sparse: sparse: Expected } at end of specifier
   include/linux/spinlock_types_raw.h:15:25: sparse: sparse: got raw_lock
   include/linux/spinlock_types_raw.h:23:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/spinlock_types_raw.h:23:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, include/linux/bug.h, include/linux/thread_info.h, ...):
   include/linux/printk.h:188:13: sparse: sparse: Expected ; at end of declaration
   include/linux/printk.h:188:13: sparse: sparse: got printk_timed_ratelimit
   include/linux/printk.h:208:13: sparse: sparse: Expected ; at end of declaration
   include/linux/printk.h:208:13: sparse: sparse: got nbcon_device_try_acquire
   include/linux/printk.h:211:6: sparse: sparse: Expected ; at end of declaration
   include/linux/printk.h:211:6: sparse: sparse: got pr_flush
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/cleanup.h, include/linux/jump_label.h, include/linux/dynamic_debug.h, include/linux/printk.h, ...):
   include/linux/err.h:76:33: sparse: sparse: Expected ; at end of declaration
   include/linux/err.h:76:33: sparse: sparse: got IS_ERR
   include/linux/err.h:79:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/err.h:79:1: sparse: sparse: got }
   include/linux/err.h:93:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/err.h:93:1: sparse: sparse: got }
   include/linux/err.h:106:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/err.h:106:1: sparse: sparse: got }
   include/linux/err.h:129:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   include/linux/err.h:130:17: sparse: sparse: Expected ; at end of declaration
   include/linux/err.h:130:17: sparse: sparse: got return
   include/linux/err.h:131:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/err.h:131:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/jump_label.h, include/linux/dynamic_debug.h, include/linux/printk.h, include/asm-generic/bug.h, ...):
   include/linux/cleanup.h:225:15: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cleanup.h:225:15: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/jump_label.h, include/linux/dynamic_debug.h, include/linux/printk.h, include/asm-generic/bug.h, ...):
   arch/powerpc/include/asm/jump_label.h:18:29: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/jump_label.h:18:29: sparse: sparse: got arch_static_branch
   arch/powerpc/include/asm/jump_label.h:28:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/jump_label.h:28:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/jump_label.h:28:16: sparse: sparse: got false
   arch/powerpc/include/asm/jump_label.h:29:6: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/jump_label.h:29:6: sparse: sparse: got :
   arch/powerpc/include/asm/jump_label.h:31:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/jump_label.h:31:1: sparse: sparse: got }
   arch/powerpc/include/asm/jump_label.h:43:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/jump_label.h:43:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/jump_label.h:43:16: sparse: sparse: got false
   arch/powerpc/include/asm/jump_label.h:44:6: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/jump_label.h:44:6: sparse: sparse: got :
   arch/powerpc/include/asm/jump_label.h:46:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/jump_label.h:46:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/dynamic_debug.h, include/linux/printk.h, include/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, ...):
   include/linux/jump_label.h:115:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:115:1: sparse: sparse: got }
--
   include/asm-generic/bitops/generic-non-atomic.h:140:23: sparse: sparse: got }
   include/asm-generic/bitops/generic-non-atomic.h:141:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/generic-non-atomic.h:141:1: sparse: sparse: got }
   include/asm-generic/bitops/generic-non-atomic.h:172:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/generic-non-atomic.h:172:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/generic-non-atomic.h:172:16: sparse: sparse: got !
   include/asm-generic/bitops/generic-non-atomic.h:173:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/generic-non-atomic.h:173:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, arch/powerpc/include/generated/asm/div64.h, ...):
   arch/powerpc/include/asm/bitops.h:85:29: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/bitops.h:85:29: sparse: sparse: got is_rlwinm_mask_valid
   arch/powerpc/include/asm/bitops.h:89:15: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:89:15: sparse: sparse: got &
   arch/powerpc/include/asm/bitops.h:89:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/bitops.h:91:11: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/bitops.h:91:11: sparse: sparse: got +=
   arch/powerpc/include/asm/bitops.h:93:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/bitops.h:93:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/bitops.h:93:16: sparse: sparse: got !
   arch/powerpc/include/asm/bitops.h:94:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:94:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:126:1: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:126:1: sparse: sparse: got 1
   arch/powerpc/include/asm/bitops.h:126:1: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/bitops.h:126:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:126:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:126:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:126:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: got 1
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:127:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:132:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:132:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:137:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:137:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:142:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:142:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:147:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:147:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:171:1: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:171:1: sparse: sparse: got &
   arch/powerpc/include/asm/bitops.h:171:1: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/bitops.h:171:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:171:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:173:1: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:173:1: sparse: sparse: got &
   arch/powerpc/include/asm/bitops.h:173:1: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/bitops.h:173:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:173:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:175:1: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:175:1: sparse: sparse: got &
   arch/powerpc/include/asm/bitops.h:175:1: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/bitops.h:175:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:175:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:183:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:183:13: sparse: sparse: got 1
   arch/powerpc/include/asm/bitops.h:183:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/bitops.h:195:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:195:9: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:206:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:206:9: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:209:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:209:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:215:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:215:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:222:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:222:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:228:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:228:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:234:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:234:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:251:21: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:251:21: sparse: sparse: got &
   arch/powerpc/include/asm/bitops.h:251:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/bitops.h:252:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:252:1: sparse: sparse: got }
   arch/powerpc/include/asm/bitops.h:260:9: sparse: sparse: Expected ) in nested declarator
   arch/powerpc/include/asm/bitops.h:260:9: sparse: sparse: got &&
   arch/powerpc/include/asm/bitops.h:261:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:261:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/builtin-__ffs.h:14:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/builtin-__ffs.h:14:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, arch/powerpc/include/generated/asm/div64.h, ...):
   arch/powerpc/include/asm/bitops.h:283:33: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/bitops.h:283:33: sparse: sparse: got (
   arch/powerpc/include/asm/bitops.h:283:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/bitops.h:286:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/bitops.h:286:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/bitops.h:286:16: sparse: sparse: got 32
   arch/powerpc/include/asm/bitops.h:287:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/bitops.h:287:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/builtin-__fls.h:14:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/builtin-__fls.h:14:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
>> include/asm-generic/bitops/fls64.h:22:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/asm-generic/bitops/fls64.h:23:17: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/fls64.h:23:17: sparse: sparse: got return
>> include/asm-generic/bitops/fls64.h:24:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/fls64.h:24:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/fls64.h:24:16: sparse: sparse: got fls
   include/asm-generic/bitops/fls64.h:25:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/fls64.h:25:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/asm-generic/bitops/hweight.h, arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   include/asm-generic/bitops/arch_hweight.h:10:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/arch_hweight.h:10:1: sparse: sparse: got }
   include/asm-generic/bitops/arch_hweight.h:15:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/arch_hweight.h:15:1: sparse: sparse: got }
   include/asm-generic/bitops/arch_hweight.h:20:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/arch_hweight.h:20:1: sparse: sparse: got }
   include/asm-generic/bitops/arch_hweight.h:25:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/arch_hweight.h:25:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/asm-generic/bitops/instrumented-atomic.h, arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, ...):
   include/linux/instrumented.h:28:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:28:9: sparse: sparse: got ,
   include/linux/instrumented.h:29:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:29:1: sparse: sparse: got }
   include/linux/instrumented.h:42:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:42:9: sparse: sparse: got ,
   include/linux/instrumented.h:43:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:43:1: sparse: sparse: got }
   include/linux/instrumented.h:56:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:56:9: sparse: sparse: got ,
   include/linux/instrumented.h:57:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:57:1: sparse: sparse: got }
   include/linux/instrumented.h:65:21: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:65:21: sparse: sparse: got 0
>> include/linux/instrumented.h:65:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/instrumented.h:66:57: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:66:57: sparse: sparse: got }
   include/linux/instrumented.h:67:17: sparse: sparse: Expected ) in nested declarator
   include/linux/instrumented.h:67:17: sparse: sparse: got {
   include/linux/instrumented.h:67:17: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:67:17: sparse: sparse: got (
   include/linux/instrumented.h:67:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/instrumented.h:67:17: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:67:17: sparse: sparse: got !
   include/linux/instrumented.h:67:17: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:67:17: sparse: sparse: got }
   include/linux/instrumented.h:68:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:68:9: sparse: sparse: got }
   include/linux/instrumented.h:83:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:83:9: sparse: sparse: got ,
   include/linux/instrumented.h:85:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:85:1: sparse: sparse: got }
   include/linux/instrumented.h:98:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:98:9: sparse: sparse: got ,
   include/linux/instrumented.h:100:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:100:1: sparse: sparse: got }
   include/linux/instrumented.h:113:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:113:9: sparse: sparse: got ,
   include/linux/instrumented.h:115:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:115:1: sparse: sparse: got }
   include/linux/instrumented.h:130:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:130:9: sparse: sparse: got ,
   include/linux/instrumented.h:131:39: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:131:39: sparse: sparse: got ,
   include/linux/instrumented.h:132:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:132:1: sparse: sparse: got }
   include/linux/instrumented.h:147:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:147:9: sparse: sparse: got ,
   include/linux/instrumented.h:148:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:148:1: sparse: sparse: got }
   include/linux/instrumented.h:165:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:165:1: sparse: sparse: got }
   include/linux/instrumented.h:181:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:181:9: sparse: sparse: got ,
   include/linux/instrumented.h:182:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:182:9: sparse: sparse: got ,
   include/linux/instrumented.h:183:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:183:1: sparse: sparse: got }
   include/linux/instrumented.h:200:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:200:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/instrumented-atomic.h:30:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:30:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:43:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:43:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:59:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:59:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:71:43: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-atomic.h:71:43: sparse: sparse: got +
   include/asm-generic/bitops/instrumented-atomic.h:72:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/instrumented-atomic.h:72:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/instrumented-atomic.h:72:16: sparse: sparse: got arch_test_and_set_bit
   include/asm-generic/bitops/instrumented-atomic.h:73:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:73:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:85:43: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-atomic.h:85:43: sparse: sparse: got +
   include/asm-generic/bitops/instrumented-atomic.h:86:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/instrumented-atomic.h:86:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/instrumented-atomic.h:86:16: sparse: sparse: got arch_test_and_clear_bit
   include/asm-generic/bitops/instrumented-atomic.h:87:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:87:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:99:43: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-atomic.h:99:43: sparse: sparse: got +
   include/asm-generic/bitops/instrumented-atomic.h:100:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/instrumented-atomic.h:100:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/instrumented-atomic.h:100:16: sparse: sparse: got arch_test_and_change_bit
   include/asm-generic/bitops/instrumented-atomic.h:101:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:101:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/instrumented-lock.h:26:38: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-lock.h:26:38: sparse: sparse: got +
   include/asm-generic/bitops/instrumented-lock.h:28:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-lock.h:28:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-lock.h:42:31: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-lock.h:42:31: sparse: sparse: got +
   include/asm-generic/bitops/instrumented-lock.h:44:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-lock.h:44:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-lock.h:58:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/instrumented-lock.h:58:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/instrumented-lock.h:58:16: sparse: sparse: got arch_test_and_set_bit_lock
   include/asm-generic/bitops/instrumented-lock.h:59:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-lock.h:59:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-lock.h:79:45: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-lock.h:79:45: sparse: sparse: got (
   include/asm-generic/bitops/instrumented-lock.h:80:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/instrumented-lock.h:80:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/instrumented-lock.h:80:16: sparse: sparse: got arch_xor_unlock_is_negative_byte
   include/asm-generic/bitops/instrumented-lock.h:81:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-lock.h:81:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/le.h:22:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:22:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:27:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:27:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:32:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:32:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:37:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:37:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:42:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:42:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:47:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:47:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:52:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:52:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:57:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:57:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:62:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:62:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/sched.h:22:14: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/sched.h:22:14: sparse: sparse: got [
>> include/asm-generic/bitops/sched.h:22:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/asm-generic/bitops/sched.h:24:14: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/sched.h:24:14: sparse: sparse: got [
   include/asm-generic/bitops/sched.h:24:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/asm-generic/bitops/sched.h:26:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/sched.h:26:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/sched.h:26:16: sparse: sparse: got __ffs
   include/asm-generic/bitops/sched.h:30:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/sched.h:30:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/log2.h, include/asm-generic/div64.h, arch/powerpc/include/generated/asm/div64.h, include/linux/math.h, ...):
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'const_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/asm-generic/div64.h, arch/powerpc/include/generated/asm/div64.h, include/linux/math.h, include/linux/math64.h, ...):
   include/linux/log2.h:45:6: sparse: sparse: Expected ; at end of declaration
   include/linux/log2.h:45:6: sparse: sparse: got is_power_of_2
   include/linux/log2.h:48:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:48:1: sparse: sparse: got }
   include/linux/log2.h:58:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:58:1: sparse: sparse: got }
   include/linux/log2.h:68:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:68:1: sparse: sparse: got }
   include/linux/log2.h:202:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:202:1: sparse: sparse: got }
   include/linux/log2.h:230:26: sparse: sparse: Expected ) in function declarator
   include/linux/log2.h:230:26: sparse: sparse: got (
   include/linux/log2.h:230:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/log2.h:232:16: sparse: sparse: Expected ) in function declarator
   include/linux/log2.h:232:16: sparse: sparse: got (
   include/linux/log2.h:232:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/log2.h:233:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:233:1: sparse: sparse: got }
   include/linux/log2.h:270:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:270:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/generated/asm/div64.h, include/linux/math.h, include/linux/math64.h, include/linux/time64.h, ...):
   include/asm-generic/div64.h:151:14: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/div64.h:151:14: sparse: sparse: got no_ovf
>> include/asm-generic/div64.h:154:9: sparse: sparse: Trying to use reserved word 'if' as identifier
>> include/asm-generic/div64.h:154:13: sparse: sparse: missing type declaration for parameter 'no_ovf'
>> include/asm-generic/div64.h:161:11: sparse: sparse: Trying to use reserved word 'else' as identifier
   include/asm-generic/div64.h:161:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/div64.h:161:16: sparse: sparse: got {
   include/asm-generic/div64.h:166:19: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/div64.h:166:19: sparse: sparse: got +=
   include/asm-generic/div64.h:167:9: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/div64.h:167:9: sparse: sparse: got }
   include/asm-generic/div64.h:170:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/div64.h:170:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/math64.h, include/linux/time64.h, include/linux/restart_block.h, include/linux/thread_info.h, ...):
   include/vdso/math64.h:46:14: sparse: sparse: Expected ; at end of statement
   include/vdso/math64.h:46:14: sparse: sparse: got ovf
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/time64.h, include/linux/restart_block.h, include/linux/thread_info.h, arch/powerpc/include/asm/processor.h, ...):
   include/linux/math64.h:92:22: sparse: sparse: Expected ; at end of statement
   include/linux/math64.h:92:22: sparse: sparse: got ___bias
   include/linux/math64.h:286:21: sparse: sparse: Expected ; at end of statement
   include/linux/math64.h:286:21: sparse: sparse: got ___bias
   include/linux/math64.h:289:9: sparse: sparse: Expected ; at end of statement
   include/linux/math64.h:289:9: sparse: sparse: got ___bias
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/restart_block.h, include/linux/thread_info.h, arch/powerpc/include/asm/processor.h, include/linux/sched.h, ...):
   include/linux/time64.h:52:20: sparse: sparse: Expected ; at end of declaration
   include/linux/time64.h:52:20: sparse: sparse: got timespec64_is_epoch
   include/linux/time64.h:55:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/time64.h:55:1: sparse: sparse: got }
   include/linux/time64.h:66:16: sparse: sparse: Expected ) in function declarator
   include/linux/time64.h:66:16: sparse: sparse: got ->
   include/linux/time64.h:66:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/time64.h:68:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/time64.h:68:16: sparse: sparse: Expected ; at end of declaration
   include/linux/time64.h:68:16: sparse: sparse: got lhs
   include/linux/time64.h:69:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/time64.h:69:1: sparse: sparse: got }
   include/linux/time64.h:97:20: sparse: sparse: Expected ; at end of declaration
   include/linux/time64.h:97:20: sparse: sparse: got timespec64_valid
   include/linux/time64.h:103:13: sparse: sparse: Expected ) in function declarator
   include/linux/time64.h:103:13: sparse: sparse: got (
   include/linux/time64.h:103:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/time64.h:105:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/time64.h:105:16: sparse: sparse: Expected ; at end of declaration
   include/linux/time64.h:105:16: sparse: sparse: got true
   include/linux/time64.h:106:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/time64.h:106:1: sparse: sparse: got }
   include/linux/time64.h:113:13: sparse: sparse: Expected ) in function declarator
   include/linux/time64.h:113:13: sparse: sparse: got (
   include/linux/time64.h:113:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/time64.h:115:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/time64.h:115:16: sparse: sparse: Expected ; at end of declaration
   include/linux/time64.h:115:16: sparse: sparse: got true
   include/linux/time64.h:116:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/time64.h:116:1: sparse: sparse: got }
   include/linux/time64.h:123:13: sparse: sparse: Expected ) in function declarator
   include/linux/time64.h:123:13: sparse: sparse: got (
   include/linux/time64.h:123:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/time64.h:125:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/time64.h:125:16: sparse: sparse: Expected ; at end of declaration
   include/linux/time64.h:125:16: sparse: sparse: got true
   include/linux/time64.h:126:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/time64.h:126:1: sparse: sparse: got }
   include/linux/time64.h:141:15: sparse: sparse: Expected ) in function declarator
   include/linux/time64.h:141:15: sparse: sparse: got ->
   include/linux/time64.h:141:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/time64.h:144:17: sparse: sparse: Expected ) in function declarator
   include/linux/time64.h:144:17: sparse: sparse: got (
   include/linux/time64.h:144:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/time64.h:145:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/time64.h:145:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/thread_info.h, include/linux/thread_info.h, ...):
   include/linux/kstrtox.h:98:49: sparse: sparse: Expected ) in function declarator
   include/linux/kstrtox.h:98:49: sparse: sparse: got *
   include/linux/kstrtox.h:110:80: sparse: sparse: Expected ) in function declarator
   include/linux/kstrtox.h:110:80: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/thread_info.h, include/linux/thread_info.h, ...):
   include/linux/minmax.h:276:20: sparse: sparse: Expected ; at end of declaration
   include/linux/minmax.h:276:20: sparse: sparse: got in_range64
   include/linux/minmax.h:279:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/minmax.h:279:1: sparse: sparse: got }
   include/linux/minmax.h:284:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/minmax.h:284:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/thread_info.h, include/linux/thread_info.h, ...):
   include/linux/sprintf.h:25:13: sparse: sparse: Expected ; at end of declaration
   include/linux/sprintf.h:25:13: sparse: sparse: got no_hash_pointers
   include/linux/sprintf.h:26:34: sparse: sparse: Expected ) in function declarator
   include/linux/sprintf.h:26:34: sparse: sparse: got slub_debug
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/thread_info.h, include/linux/thread_info.h, ...):
   include/linux/kernel.h:162:13: sparse: sparse: Expected ; at end of declaration
   include/linux/kernel.h:162:13: sparse: sparse: got early_boot_irqs_disabled
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/thread_info.h, arch/powerpc/include/asm/processor.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/thread_info.h:171:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/thread_info.h:171:20: sparse: sparse: got test_thread_local_flags
   arch/powerpc/include/asm/thread_info.h:174:19: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/thread_info.h:174:19: sparse: sparse: got ->
   arch/powerpc/include/asm/thread_info.h:174:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/thread_info.h:175:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/thread_info.h:175:1: sparse: sparse: got }
   arch/powerpc/include/asm/thread_info.h:220:22: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/thread_info.h:220:22: sparse: sparse: got <=
   arch/powerpc/include/asm/thread_info.h:220:9: sparse: sparse: Trying to use reserved word 'while' as identifier
   arch/powerpc/include/asm/thread_info.h:225:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/thread_info.h:225:9: sparse: sparse: got }
   arch/powerpc/include/asm/thread_info.h:228:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/thread_info.h:228:1: sparse: sparse: got }

vim +/return +73 include/uapi/linux/swab.h

607ca46e97a1b6 David Howells 2012-10-13   9  
607ca46e97a1b6 David Howells 2012-10-13  10  /*
607ca46e97a1b6 David Howells 2012-10-13  11   * casts are necessary for constants, because we never know how for sure
607ca46e97a1b6 David Howells 2012-10-13  12   * how U/UL/ULL map to __u16, __u32, __u64. At least not in a portable way.
607ca46e97a1b6 David Howells 2012-10-13  13   */
607ca46e97a1b6 David Howells 2012-10-13  14  #define ___constant_swab16(x) ((__u16)(				\
607ca46e97a1b6 David Howells 2012-10-13  15  	(((__u16)(x) & (__u16)0x00ffU) << 8) |			\
607ca46e97a1b6 David Howells 2012-10-13  16  	(((__u16)(x) & (__u16)0xff00U) >> 8)))
607ca46e97a1b6 David Howells 2012-10-13  17  
607ca46e97a1b6 David Howells 2012-10-13  18  #define ___constant_swab32(x) ((__u32)(				\
607ca46e97a1b6 David Howells 2012-10-13  19  	(((__u32)(x) & (__u32)0x000000ffUL) << 24) |		\
607ca46e97a1b6 David Howells 2012-10-13  20  	(((__u32)(x) & (__u32)0x0000ff00UL) <<  8) |		\
607ca46e97a1b6 David Howells 2012-10-13  21  	(((__u32)(x) & (__u32)0x00ff0000UL) >>  8) |		\
607ca46e97a1b6 David Howells 2012-10-13  22  	(((__u32)(x) & (__u32)0xff000000UL) >> 24)))
607ca46e97a1b6 David Howells 2012-10-13  23  
607ca46e97a1b6 David Howells 2012-10-13  24  #define ___constant_swab64(x) ((__u64)(				\
607ca46e97a1b6 David Howells 2012-10-13  25  	(((__u64)(x) & (__u64)0x00000000000000ffULL) << 56) |	\
607ca46e97a1b6 David Howells 2012-10-13  26  	(((__u64)(x) & (__u64)0x000000000000ff00ULL) << 40) |	\
607ca46e97a1b6 David Howells 2012-10-13  27  	(((__u64)(x) & (__u64)0x0000000000ff0000ULL) << 24) |	\
607ca46e97a1b6 David Howells 2012-10-13  28  	(((__u64)(x) & (__u64)0x00000000ff000000ULL) <<  8) |	\
607ca46e97a1b6 David Howells 2012-10-13  29  	(((__u64)(x) & (__u64)0x000000ff00000000ULL) >>  8) |	\
607ca46e97a1b6 David Howells 2012-10-13  30  	(((__u64)(x) & (__u64)0x0000ff0000000000ULL) >> 24) |	\
607ca46e97a1b6 David Howells 2012-10-13  31  	(((__u64)(x) & (__u64)0x00ff000000000000ULL) >> 40) |	\
607ca46e97a1b6 David Howells 2012-10-13  32  	(((__u64)(x) & (__u64)0xff00000000000000ULL) >> 56)))
607ca46e97a1b6 David Howells 2012-10-13  33  
607ca46e97a1b6 David Howells 2012-10-13  34  #define ___constant_swahw32(x) ((__u32)(			\
607ca46e97a1b6 David Howells 2012-10-13  35  	(((__u32)(x) & (__u32)0x0000ffffUL) << 16) |		\
607ca46e97a1b6 David Howells 2012-10-13  36  	(((__u32)(x) & (__u32)0xffff0000UL) >> 16)))
607ca46e97a1b6 David Howells 2012-10-13  37  
607ca46e97a1b6 David Howells 2012-10-13  38  #define ___constant_swahb32(x) ((__u32)(			\
607ca46e97a1b6 David Howells 2012-10-13  39  	(((__u32)(x) & (__u32)0x00ff00ffUL) << 8) |		\
607ca46e97a1b6 David Howells 2012-10-13  40  	(((__u32)(x) & (__u32)0xff00ff00UL) >> 8)))
607ca46e97a1b6 David Howells 2012-10-13  41  
607ca46e97a1b6 David Howells 2012-10-13  42  /*
607ca46e97a1b6 David Howells 2012-10-13  43   * Implement the following as inlines, but define the interface using
607ca46e97a1b6 David Howells 2012-10-13  44   * macros to allow constant folding when possible:
607ca46e97a1b6 David Howells 2012-10-13  45   * ___swab16, ___swab32, ___swab64, ___swahw32, ___swahb32
607ca46e97a1b6 David Howells 2012-10-13  46   */
607ca46e97a1b6 David Howells 2012-10-13  47  
607ca46e97a1b6 David Howells 2012-10-13  48  static inline __attribute_const__ __u16 __fswab16(__u16 val)
607ca46e97a1b6 David Howells 2012-10-13  49  {
7322dd755e7dd3 Arnd Bergmann 2016-05-05  50  #if defined (__arch_swab16)
607ca46e97a1b6 David Howells 2012-10-13  51  	return __arch_swab16(val);
607ca46e97a1b6 David Howells 2012-10-13  52  #else
607ca46e97a1b6 David Howells 2012-10-13  53  	return ___constant_swab16(val);
607ca46e97a1b6 David Howells 2012-10-13  54  #endif
607ca46e97a1b6 David Howells 2012-10-13 @55  }
607ca46e97a1b6 David Howells 2012-10-13  56  
607ca46e97a1b6 David Howells 2012-10-13  57  static inline __attribute_const__ __u32 __fswab32(__u32 val)
607ca46e97a1b6 David Howells 2012-10-13  58  {
7322dd755e7dd3 Arnd Bergmann 2016-05-05  59  #if defined(__arch_swab32)
607ca46e97a1b6 David Howells 2012-10-13  60  	return __arch_swab32(val);
607ca46e97a1b6 David Howells 2012-10-13  61  #else
607ca46e97a1b6 David Howells 2012-10-13  62  	return ___constant_swab32(val);
607ca46e97a1b6 David Howells 2012-10-13  63  #endif
607ca46e97a1b6 David Howells 2012-10-13  64  }
607ca46e97a1b6 David Howells 2012-10-13  65  
607ca46e97a1b6 David Howells 2012-10-13  66  static inline __attribute_const__ __u64 __fswab64(__u64 val)
607ca46e97a1b6 David Howells 2012-10-13  67  {
7322dd755e7dd3 Arnd Bergmann 2016-05-05  68  #if defined (__arch_swab64)
607ca46e97a1b6 David Howells 2012-10-13  69  	return __arch_swab64(val);
607ca46e97a1b6 David Howells 2012-10-13  70  #elif defined(__SWAB_64_THRU_32__)
607ca46e97a1b6 David Howells 2012-10-13  71  	__u32 h = val >> 32;
607ca46e97a1b6 David Howells 2012-10-13  72  	__u32 l = val & ((1ULL << 32) - 1);
607ca46e97a1b6 David Howells 2012-10-13 @73  	return (((__u64)__fswab32(l)) << 32) | ((__u64)(__fswab32(h)));
607ca46e97a1b6 David Howells 2012-10-13  74  #else
607ca46e97a1b6 David Howells 2012-10-13  75  	return ___constant_swab64(val);
607ca46e97a1b6 David Howells 2012-10-13  76  #endif
607ca46e97a1b6 David Howells 2012-10-13  77  }
607ca46e97a1b6 David Howells 2012-10-13  78  

:::::: The code at line 73 was first introduced by commit
:::::: 607ca46e97a1b6594b29647d98a32d545c24bdff UAPI: (Scripted) Disintegrate include/linux

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
