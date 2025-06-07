Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7151F139D0A
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Jun 2025 07:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749280883; cv=none; b=lcBoV5qro7u3+NN82sCCZc4zE+oRJrNN/MCNt1h5YZodMT6jMmWL6CMVtQh1wchRlTuit7CQsgaHpt0Q7turVdm3vuK+Zc9ME096RgNEZt2Vq0I2crRY1SLDmnTR5acdVCsRABx+KhMmuId4c73E6OW4HxVhNEU231rsOwUrmmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749280883; c=relaxed/simple;
	bh=fybndKPkQIMAnTHvsNsipsD9lsBA+m+WN9urMJ1FoAM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I8yFiBLx/3lAr8GlgjgGqz2tSjz/CL7uuhDfDZM8pBCgdAbQ4mQKM8YfZ5SNX+SdUsa4pyUaHx1uTRE17du0LpiqwP5R8C7VJwdOcqjVS/EP4AJQvEaArWsaEvvWp8+CakGVFYB4CXgFdZO30j+a5piVerSeqjQwApZzTjqQc+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mDhF7SOT; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mDhF7SOT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749280882; x=1780816882;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fybndKPkQIMAnTHvsNsipsD9lsBA+m+WN9urMJ1FoAM=;
  b=mDhF7SOTCNYJaaFIzTo7RaWcwCm7yaJ/pNdr83gqwIeS4mYFZq6fjzqN
   9kit1DmgR0lZtUYPIYgqAEhJE+OVGGwJGLorMl46VI8QyNqZnldVPpGjj
   AhHUhdIpdD3J3O7Bh6NY9Lde8bfxbTsBMlS7ZA/RHKekYJsBKvN+2CID9
   P8WDJBu+h3tUjKh52pMO8ZITkL0e/Zne/uJVQt1ZjQoLRs3HwfalMRrmU
   ZSePsXWU64ek2tPA8zfkb0Q3WAD18pMWTW35+Z+ZnsTtznqaaow6S6vxI
   OrJj2cXN8xSgYMRfajKYk88ZRpLf03jwAyiLsa+mnGuV45t8nkaOZbl80
   g==;
X-CSE-ConnectionGUID: Fje5kmDNQOuKXDgwHwue/g==
X-CSE-MsgGUID: oJFILAIKTwqRVgYYxZL+QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51289747"
X-IronPort-AV: E=Sophos;i="6.16,217,1744095600"; 
   d="scan'208";a="51289747"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2025 00:21:21 -0700
X-CSE-ConnectionGUID: lrWuTKt2SAWHaEsGbFuKIw==
X-CSE-MsgGUID: CPoJNVLASK+eYZYL6X1Yfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,217,1744095600"; 
   d="scan'208";a="176971605"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 Jun 2025 00:21:20 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNnrh-0005Wv-1n;
	Sat, 07 Jun 2025 07:21:17 +0000
Date: Sat, 7 Jun 2025 15:20:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC 03/13] objtool: Disassemble code with libopcodes instead of
 running objdump
Message-ID: <202506071438.NpC5O1aA-lkp@intel.com>
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
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20250607/202506071438.NpC5O1aA-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250607/202506071438.NpC5O1aA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506071438.NpC5O1aA-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/powerpc/decode.c: In function 'arch_reloc_size':
>> arch/powerpc/decode.c:131:5: warning: declaration of 'arch_disas_info_init' shadows a global declaration [-Wshadow]
     131 | int arch_disas_info_init(struct disassemble_info *dinfo)
         |     ^~~~~~~~~~~~~~~~~~~~
   In file included from tools/objtool/include/objtool/check.h:11,
                    from arch/powerpc/decode.c:5:
   tools/objtool/include/objtool/arch.h:107:5: note: shadowed declaration is here
     107 | int arch_disas_info_init(struct disassemble_info *dinfo);
         |     ^~~~~~~~~~~~~~~~~~~~
>> arch/powerpc/decode.c:131:1: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
     131 | int arch_disas_info_init(struct disassemble_info *dinfo)
         | ^~~
>> arch/powerpc/decode.c:136:1: error: expected declaration or statement at end of input
     136 | }
         | ^
   arch/powerpc/decode.c: At top level:
>> arch/powerpc/decode.c:131:5: warning: 'arch_disas_info_init' defined but not used [-Wunused-function]
     131 | int arch_disas_info_init(struct disassemble_info *dinfo)
         |     ^~~~~~~~~~~~~~~~~~~~
   make[6]: *** [tools/build/Makefile.build:86: tools/objtool/arch/powerpc/decode.o] Error 1
   In file included from disas.c:12:
   tools/include/tools/dis-asm-compat.h:10:6: error: redeclaration of 'enum disassembler_style'
      10 | enum disassembler_style {DISASSEMBLER_STYLE_NOT_EMPTY};
         |      ^~~~~~~~~~~~~~~~~~
   In file included from tools/objtool/include/objtool/arch.h:10,
                    from disas.c:6:
   /usr/include/dis-asm.h:53:6: note: originally defined here
      53 | enum disassembler_style
         |      ^~~~~~~~~~~~~~~~~~
   tools/include/tools/dis-asm-compat.h: In function 'init_disassemble_info_compat':
   tools/include/tools/dis-asm-compat.h:50:9: error: too few arguments to function 'init_disassemble_info'
      50 |         init_disassemble_info(info, stream,
         |         ^~~~~~~~~~~~~~~~~~~~~
   /usr/include/dis-asm.h:480:13: note: declared here
     480 | extern void init_disassemble_info (struct disassemble_info *dinfo, void *stream,
         |             ^~~~~~~~~~~~~~~~~~~~~
   make[5]: *** [tools/build/Makefile.build:86: tools/objtool/disas.o] Error 1
   make[6]: Target '__build' not remade because of errors.
   make[5]: *** [tools/build/Makefile.build:142: arch/powerpc] Error 2
   make[5]: Target '__build' not remade because of errors.
   make[4]: *** [Makefile:65: tools/objtool/objtool-in.o] Error 2
   make[4]: Target 'all' not remade because of errors.
   make[3]: *** [Makefile:73: objtool] Error 2
   make[2]: *** [Makefile:1448: tools/objtool] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
