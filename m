Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D63728AAE7
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Jun 2025 17:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749230536; cv=none; b=F+pYw9ZytBcXHRIy6hYljhgyeCzLOa4pDKpPs+CFtMIU5vl89vQoVuo60Cbl4SvICK6xtwdvl1LQhExIQwea5UewfUpE7cPPItrroxBTcd1p5zvA1kNNc/MrxvWP/qE6DmmrAMbdwdTRQwp0fUC4okCntZuaBKQe40JKNGgZd5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749230536; c=relaxed/simple;
	bh=tu129dhPQ2uPkTdRLq5/Os2HqG4d1JEtZCLZ7HK6R+I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZEYyxtZ4j/7WLF2SBPL1etGGFP3qXCoeM1RhLMAYPGxynbya43DxzAT7Q+a0yHltSJ+3vItqmb/LhJiUD6ge5Ek++SeACn8TMEha2u7gONowgYGd6vWg4Op5RYFzg+luVhbgA0GmCHankmPl3QGCzcsw/3ObAYof6ZofXpfYkwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ntL3WHOt; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ntL3WHOt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749230532; x=1780766532;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tu129dhPQ2uPkTdRLq5/Os2HqG4d1JEtZCLZ7HK6R+I=;
  b=ntL3WHOtRqLH3H0wga7E/PYziHeR+HTBxYmy4MZfd0msCrgwsWQZ/bj8
   qgQIB3F3LjzF8Jq6i26CA2cZO/QWoSptB2NQ7nqVj55ReimDYwlPsQIt0
   H6URNW0R13+vu0X0+oAwU7V5dX7UgYvYsVMp2s2c2CMePAoExewt5E9Q/
   Q6Vk7ITaOUKkeV+Q9lsqw9s+BaPpPmaqW/YBEUK/GiAwA3O6r255AP6OQ
   9SPEmqrwSTXP8C5EXxI0KNcKtZIg51+njU4fXUucLJTmRqY+dtfBtIhmn
   wzgoA+0z/sr6KwGmCWryC2VjXkUilDAKE95rJX5ONZig5Ee/UAHR1og8+
   Q==;
X-CSE-ConnectionGUID: /hOv89FXQ7CZzjQKav8vKw==
X-CSE-MsgGUID: BXc5DgIuSiapEXH2ieFs7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="68829836"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; 
   d="scan'208";a="68829836"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 10:22:11 -0700
X-CSE-ConnectionGUID: ZXKU1sDtSsC+xBlV3h4V3A==
X-CSE-MsgGUID: 6BZhkf+dSVWUZLn5RRDYdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; 
   d="scan'208";a="183077948"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 06 Jun 2025 10:22:11 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNalb-0005A1-2A;
	Fri, 06 Jun 2025 17:22:07 +0000
Date: Sat, 7 Jun 2025 01:21:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC 03/13] objtool: Disassemble code with libopcodes instead of
 running objdump
Message-ID: <202506070147.yRx7HyNf-lkp@intel.com>
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
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250606153440.865808-4-alexandre.chartre@oracle.com>
References: <20250606153440.865808-4-alexandre.chartre@oracle.com>
TO: Alexandre Chartre <alexandre.chartre@oracle.com>

Hi Alexandre,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.15 next-20250606]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandre-Chartre/objtool-Move-disassembly-functions-to-a-separated-file/20250606-233948
base:   linus/master
patch link:    https://lore.kernel.org/r/20250606153440.865808-4-alexandre.chartre%40oracle.com
patch subject: [RFC 03/13] objtool: Disassemble code with libopcodes instead of running objdump
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20250607/202506070147.yRx7HyNf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506070147.yRx7HyNf-lkp@intel.com/

All errors (new ones prefixed by >>):

   1 error generated.
   make[2]: *** [scripts/Makefile.build:98: scripts/mod/devicetable-offsets.s] Error 1
   make[2]: Target 'scripts/mod/' not remade because of errors.
   make[1]: *** [Makefile:1278: prepare0] Error 2
   In file included from disas.c:12:
>> tools/include/tools/dis-asm-compat.h:10:6: error: redefinition of 'disassembler_style'
      10 | enum disassembler_style {DISASSEMBLER_STYLE_NOT_EMPTY};
         |      ^
   /usr/include/dis-asm.h:53:6: note: previous definition is here
      53 | enum disassembler_style
         |      ^
   In file included from disas.c:12:
>> tools/include/tools/dis-asm-compat.h:51:23: error: too few arguments to function call, expected 4, have 3
      50 |         init_disassemble_info(info, stream,
         |         ~~~~~~~~~~~~~~~~~~~~~
      51 |                               unstyled_func);
         |                                            ^
   /usr/include/dis-asm.h:480:13: note: 'init_disassemble_info' declared here


vim +/disassembler_style +10 tools/include/tools/dis-asm-compat.h

a45b3d6926231c Andres Freund 2022-07-31   7  
a45b3d6926231c Andres Freund 2022-07-31   8  /* define types for older binutils version, to centralize ifdef'ery a bit */
a45b3d6926231c Andres Freund 2022-07-31   9  #ifndef DISASM_INIT_STYLED
a45b3d6926231c Andres Freund 2022-07-31 @10  enum disassembler_style {DISASSEMBLER_STYLE_NOT_EMPTY};
a45b3d6926231c Andres Freund 2022-07-31  11  typedef int (*fprintf_styled_ftype) (void *, enum disassembler_style, const char*, ...);
a45b3d6926231c Andres Freund 2022-07-31  12  #endif
a45b3d6926231c Andres Freund 2022-07-31  13  
a45b3d6926231c Andres Freund 2022-07-31  14  /*
a45b3d6926231c Andres Freund 2022-07-31  15   * Trivial fprintf wrapper to be used as the fprintf_styled_func argument to
a45b3d6926231c Andres Freund 2022-07-31  16   * init_disassemble_info_compat() when normal fprintf suffices.
a45b3d6926231c Andres Freund 2022-07-31  17   */
a45b3d6926231c Andres Freund 2022-07-31  18  static inline int fprintf_styled(void *out,
a45b3d6926231c Andres Freund 2022-07-31  19  				 enum disassembler_style style,
a45b3d6926231c Andres Freund 2022-07-31  20  				 const char *fmt, ...)
a45b3d6926231c Andres Freund 2022-07-31  21  {
a45b3d6926231c Andres Freund 2022-07-31  22  	va_list args;
a45b3d6926231c Andres Freund 2022-07-31  23  	int r;
a45b3d6926231c Andres Freund 2022-07-31  24  
a45b3d6926231c Andres Freund 2022-07-31  25  	(void)style;
a45b3d6926231c Andres Freund 2022-07-31  26  
a45b3d6926231c Andres Freund 2022-07-31  27  	va_start(args, fmt);
a45b3d6926231c Andres Freund 2022-07-31  28  	r = vfprintf(out, fmt, args);
a45b3d6926231c Andres Freund 2022-07-31  29  	va_end(args);
a45b3d6926231c Andres Freund 2022-07-31  30  
a45b3d6926231c Andres Freund 2022-07-31  31  	return r;
a45b3d6926231c Andres Freund 2022-07-31  32  }
a45b3d6926231c Andres Freund 2022-07-31  33  
a45b3d6926231c Andres Freund 2022-07-31  34  /*
a45b3d6926231c Andres Freund 2022-07-31  35   * Wrapper for init_disassemble_info() that hides version
a45b3d6926231c Andres Freund 2022-07-31  36   * differences. Depending on binutils version and architecture either
a45b3d6926231c Andres Freund 2022-07-31  37   * fprintf_func or fprintf_styled_func will be called.
a45b3d6926231c Andres Freund 2022-07-31  38   */
a45b3d6926231c Andres Freund 2022-07-31  39  static inline void init_disassemble_info_compat(struct disassemble_info *info,
a45b3d6926231c Andres Freund 2022-07-31  40  						void *stream,
a45b3d6926231c Andres Freund 2022-07-31  41  						fprintf_ftype unstyled_func,
a45b3d6926231c Andres Freund 2022-07-31  42  						fprintf_styled_ftype styled_func)
a45b3d6926231c Andres Freund 2022-07-31  43  {
a45b3d6926231c Andres Freund 2022-07-31  44  #ifdef DISASM_INIT_STYLED
a45b3d6926231c Andres Freund 2022-07-31  45  	init_disassemble_info(info, stream,
a45b3d6926231c Andres Freund 2022-07-31  46  			      unstyled_func,
a45b3d6926231c Andres Freund 2022-07-31  47  			      styled_func);
a45b3d6926231c Andres Freund 2022-07-31  48  #else
a45b3d6926231c Andres Freund 2022-07-31  49  	(void)styled_func;
a45b3d6926231c Andres Freund 2022-07-31  50  	init_disassemble_info(info, stream,
a45b3d6926231c Andres Freund 2022-07-31 @51  			      unstyled_func);
a45b3d6926231c Andres Freund 2022-07-31  52  #endif
a45b3d6926231c Andres Freund 2022-07-31  53  }
a45b3d6926231c Andres Freund 2022-07-31  54  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
