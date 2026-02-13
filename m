Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BA32356A4
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Feb 2026 18:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771008535; cv=none; b=MHg0zu6XezBmLikKZsZhpazmsGSTJYQ+7zQm0NbAdJ3OnMv3xc8ObBAb7jB6NfQZu5Tz2QMv4oqYukgkHF3LqVILQna2AHc2rbBcqww7USCsXbPt/YyIVnD0ehWqE8WLkrlGXmkL+IT7uewrT9judYy9NWKRsuFxnlSz9s2vgw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771008535; c=relaxed/simple;
	bh=aJtgQBmEUpZqS4z7MgobkLsJdStvSHBQ/cLd3p7txyw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RZ1xZqZ4yO1E1qKzvmmSweQsNz4Z1V+pTdPpTIXQE023dq24s0sEPvQPkAMpM19PJFSedzRyJlTPrfoX4HaX/DIXsopAdWFds1C/7GNsDYPgG8RO3BJyyahR4H4/09t84Ay8RpgWfaVw1luQzOotZvpyfzgDAX9FSSqjYvt+1vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Do4clK+5; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Do4clK+5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771008531; x=1802544531;
  h=date:from:to:cc:subject:message-id;
  bh=aJtgQBmEUpZqS4z7MgobkLsJdStvSHBQ/cLd3p7txyw=;
  b=Do4clK+5EfGrvJvC8Dw1Rq/N2bRhNjF6VvMyIhEVYTaQB3WxJcHyBOXU
   BSD1r9ZmSI/6S2VEV45OhxD1TOeubZCr5g7DyLmz2U2KUWLzPHh3CTdoc
   U4JOciUs8qGtF3aoVC/f1HlVQVpqXd42L1F5c99epi/oGpB/W51jwSbXH
   XupP7FP4eC4lGz3QioybcRpY9monomUde5NxywUT/hUfNBYc73s43NKd0
   6cchamMoZwqFy6keKTjZOpCbdnvoHgA3xbc22jC1lIiQtmXYxbTdkR4sa
   lU1Nfxlm5oSobJwciIqF2nmSihdOcQ/dah4OV/U2gEtqSR9Ru8yFZWvoX
   Q==;
X-CSE-ConnectionGUID: 0O1g2owjRdGMcf5Rmg1Aqg==
X-CSE-MsgGUID: ur80+MjISRWF06mf1v9cAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="89611233"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="89611233"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 10:48:51 -0800
X-CSE-ConnectionGUID: j2zLnXaTQrycUEiVT42B0A==
X-CSE-MsgGUID: u+fs0cNJSRuo5J2E5oPDvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="212401441"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 13 Feb 2026 10:48:49 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqyDf-000000001eP-46Se;
	Fri, 13 Feb 2026 18:48:47 +0000
Date: Fri, 13 Feb 2026 19:48:06 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android15-6.6-lts 1/1]
 tools/include/linux/bitfield.h:166:38: error: implicit declaration of
 function 'cpu_to_le16'
Message-ID: <202602131939.L6aLa3RD-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android15-6.6-lts
head:   0e7b291077fcd133748e6b92b70fde0873dede68
commit: 64378caea949d24f479bc809f9890cba683bb131 [1/1] perf arm-spe: Extend branch operations
:::::: branch date: 7 hours ago
:::::: commit date: 5 weeks ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260213/202602131939.L6aLa3RD-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260213/202602131939.L6aLa3RD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602131939.L6aLa3RD-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile.config:558: No elfutils/debuginfod.h found, no debuginfo server support, please install libdebuginfod-dev/elfutils-debuginfod-client-devel or equivalent
   Makefile.config:647: No libunwind found. Please install libunwind-dev[el] >= 1.1 and/or set LIBUNWIND_DIR
     PERF_VERSION = 6.6.119.g64378caea949
   tools/perf/pmu-events/jevents.py:86: SyntaxWarning: invalid escape sequence '\ '
     all \ are for escaping, it then adjusts as it will have over counted
   builtin-record.c: In function 'cmd_record':
   builtin-record.c:4039:62: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
    4039 |                 rec->switch_output.filenames = calloc(sizeof(char *),
         |                                                              ^~~~
   builtin-record.c:4039:62: note: earlier argument should specify number of elements, later size of each element
   In file included from util/arm-spe-decoder/arm-spe-pkt-decoder.h:10,
                    from util/arm-spe-decoder/arm-spe-pkt-decoder.c:14:
   tools/include/linux/bitfield.h: In function 'le16_encode_bits':
>> tools/include/linux/bitfield.h:166:38: error: implicit declaration of function 'cpu_to_le16' [-Wimplicit-function-declaration]
     166 |         ____MAKE_OP(le##size,u##size,cpu_to_le##size,le##size##_to_cpu) \
         |                                      ^~~~~~~~~
   tools/include/linux/bitfield.h:149:16: note: in definition of macro '____MAKE_OP'
     149 |         return to((v & field_mask(field)) * field_multiplier(field));   \
         |                ^~
   tools/include/linux/bitfield.h:170:1: note: in expansion of macro '__MAKE_OP'
     170 | __MAKE_OP(16)
         | ^~~~~~~~~
   tools/include/linux/bitfield.h: In function 'le16_get_bits':
>> tools/include/linux/bitfield.h:166:54: error: implicit declaration of function 'le16_to_cpu' [-Wimplicit-function-declaration]
     166 |         ____MAKE_OP(le##size,u##size,cpu_to_le##size,le##size##_to_cpu) \
         |                                                      ^~
   tools/include/linux/bitfield.h:163:17: note: in definition of macro '____MAKE_OP'
     163 |         return (from(v) & field)/field_multiplier(field);               \
         |                 ^~~~
   tools/include/linux/bitfield.h:170:1: note: in expansion of macro '__MAKE_OP'
     170 | __MAKE_OP(16)
         | ^~~~~~~~~
   tools/include/linux/bitfield.h: In function 'be16_encode_bits':
>> tools/include/linux/bitfield.h:167:38: error: implicit declaration of function 'cpu_to_be16' [-Wimplicit-function-declaration]
     167 |         ____MAKE_OP(be##size,u##size,cpu_to_be##size,be##size##_to_cpu) \
         |                                      ^~~~~~~~~
   tools/include/linux/bitfield.h:149:16: note: in definition of macro '____MAKE_OP'
     149 |         return to((v & field_mask(field)) * field_multiplier(field));   \
         |                ^~
   tools/include/linux/bitfield.h:170:1: note: in expansion of macro '__MAKE_OP'
     170 | __MAKE_OP(16)
         | ^~~~~~~~~
   tools/include/linux/bitfield.h: In function 'be16_get_bits':
>> tools/include/linux/bitfield.h:167:54: error: implicit declaration of function 'be16_to_cpu' [-Wimplicit-function-declaration]
     167 |         ____MAKE_OP(be##size,u##size,cpu_to_be##size,be##size##_to_cpu) \
         |                                                      ^~
   tools/include/linux/bitfield.h:163:17: note: in definition of macro '____MAKE_OP'
     163 |         return (from(v) & field)/field_multiplier(field);               \
         |                 ^~~~
   tools/include/linux/bitfield.h:170:1: note: in expansion of macro '__MAKE_OP'
     170 | __MAKE_OP(16)
         | ^~~~~~~~~
   tools/include/linux/bitfield.h: In function 'le32_encode_bits':
>> tools/include/linux/bitfield.h:166:38: error: implicit declaration of function 'cpu_to_le32' [-Wimplicit-function-declaration]
     166 |         ____MAKE_OP(le##size,u##size,cpu_to_le##size,le##size##_to_cpu) \
         |                                      ^~~~~~~~~
   tools/include/linux/bitfield.h:149:16: note: in definition of macro '____MAKE_OP'
     149 |         return to((v & field_mask(field)) * field_multiplier(field));   \
         |                ^~
   tools/include/linux/bitfield.h:171:1: note: in expansion of macro '__MAKE_OP'
     171 | __MAKE_OP(32)
         | ^~~~~~~~~
   tools/include/linux/bitfield.h: In function 'le32_get_bits':
>> tools/include/linux/bitfield.h:166:54: error: implicit declaration of function 'le32_to_cpu' [-Wimplicit-function-declaration]
     166 |         ____MAKE_OP(le##size,u##size,cpu_to_le##size,le##size##_to_cpu) \
         |                                                      ^~
   tools/include/linux/bitfield.h:163:17: note: in definition of macro '____MAKE_OP'
     163 |         return (from(v) & field)/field_multiplier(field);               \
         |                 ^~~~
   tools/include/linux/bitfield.h:171:1: note: in expansion of macro '__MAKE_OP'
     171 | __MAKE_OP(32)
         | ^~~~~~~~~
   tools/include/linux/bitfield.h: In function 'be32_encode_bits':
>> tools/include/linux/bitfield.h:167:38: error: implicit declaration of function 'cpu_to_be32' [-Wimplicit-function-declaration]
     167 |         ____MAKE_OP(be##size,u##size,cpu_to_be##size,be##size##_to_cpu) \
         |                                      ^~~~~~~~~
   tools/include/linux/bitfield.h:149:16: note: in definition of macro '____MAKE_OP'
     149 |         return to((v & field_mask(field)) * field_multiplier(field));   \
         |                ^~
   tools/include/linux/bitfield.h:171:1: note: in expansion of macro '__MAKE_OP'
     171 | __MAKE_OP(32)
         | ^~~~~~~~~
   tools/include/linux/bitfield.h: In function 'be32_get_bits':
>> tools/include/linux/bitfield.h:167:54: error: implicit declaration of function 'be32_to_cpu' [-Wimplicit-function-declaration]
     167 |         ____MAKE_OP(be##size,u##size,cpu_to_be##size,be##size##_to_cpu) \
         |                                                      ^~
   tools/include/linux/bitfield.h:163:17: note: in definition of macro '____MAKE_OP'
     163 |         return (from(v) & field)/field_multiplier(field);               \
         |                 ^~~~
   tools/include/linux/bitfield.h:171:1: note: in expansion of macro '__MAKE_OP'
     171 | __MAKE_OP(32)
         | ^~~~~~~~~
   tools/include/linux/bitfield.h: In function 'le64_encode_bits':
>> tools/include/linux/bitfield.h:166:38: error: implicit declaration of function 'cpu_to_le64' [-Wimplicit-function-declaration]
     166 |         ____MAKE_OP(le##size,u##size,cpu_to_le##size,le##size##_to_cpu) \
         |                                      ^~~~~~~~~
   tools/include/linux/bitfield.h:149:16: note: in definition of macro '____MAKE_OP'
     149 |         return to((v & field_mask(field)) * field_multiplier(field));   \
         |                ^~
   tools/include/linux/bitfield.h:172:1: note: in expansion of macro '__MAKE_OP'
     172 | __MAKE_OP(64)
         | ^~~~~~~~~
   tools/include/linux/bitfield.h: In function 'le64_get_bits':
>> tools/include/linux/bitfield.h:166:54: error: implicit declaration of function 'le64_to_cpu' [-Wimplicit-function-declaration]
     166 |         ____MAKE_OP(le##size,u##size,cpu_to_le##size,le##size##_to_cpu) \
         |                                                      ^~
   tools/include/linux/bitfield.h:163:17: note: in definition of macro '____MAKE_OP'
     163 |         return (from(v) & field)/field_multiplier(field);               \
         |                 ^~~~
   tools/include/linux/bitfield.h:172:1: note: in expansion of macro '__MAKE_OP'
     172 | __MAKE_OP(64)
         | ^~~~~~~~~
   tools/include/linux/bitfield.h: In function 'be64_encode_bits':
>> tools/include/linux/bitfield.h:167:38: error: implicit declaration of function 'cpu_to_be64' [-Wimplicit-function-declaration]
     167 |         ____MAKE_OP(be##size,u##size,cpu_to_be##size,be##size##_to_cpu) \
         |                                      ^~~~~~~~~
   tools/include/linux/bitfield.h:149:16: note: in definition of macro '____MAKE_OP'
     149 |         return to((v & field_mask(field)) * field_multiplier(field));   \
         |                ^~
   tools/include/linux/bitfield.h:172:1: note: in expansion of macro '__MAKE_OP'
     172 | __MAKE_OP(64)
         | ^~~~~~~~~
   tools/include/linux/bitfield.h: In function 'be64_get_bits':
>> tools/include/linux/bitfield.h:167:54: error: implicit declaration of function 'be64_to_cpu' [-Wimplicit-function-declaration]
     167 |         ____MAKE_OP(be##size,u##size,cpu_to_be##size,be##size##_to_cpu) \
         |                                                      ^~
   tools/include/linux/bitfield.h:163:17: note: in definition of macro '____MAKE_OP'
     163 |         return (from(v) & field)/field_multiplier(field);               \
         |                 ^~~~
   tools/include/linux/bitfield.h:172:1: note: in expansion of macro '__MAKE_OP'
     172 | __MAKE_OP(64)
         | ^~~~~~~~~
   make[5]: *** [tools/build/Makefile.build:98: util/arm-spe-decoder/arm-spe-pkt-decoder.o] Error 1
   make[5]: *** Waiting for unfinished jobs....
   builtin-top.c: In function 'prompt_integer':
   builtin-top.c:360:21: error: allocation of insufficient size '0' for type 'char' with size '1' [-Werror=alloc-size]
     360 |         char *buf = malloc(0), *p;
         |                     ^~~~~~
   make[4]: *** [tools/build/Makefile.build:154: arm-spe-decoder] Error 2
   make[4]: *** Waiting for unfinished jobs....
   util/metricgroup.c: In function 'setup_metric_events':
   util/metricgroup.c:289:39: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
     289 |         metric_events = calloc(sizeof(void *), ids_size + 1);
         |                                       ^~~~
   util/metricgroup.c:289:39: note: earlier argument should specify number of elements, later size of each element
   util/synthetic-events.c: In function 'perf_event__synthesize_threads':
   util/synthetic-events.c:1042:44: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
    1042 |         synthesize_threads = calloc(sizeof(pthread_t), thread_nr);
         |                                            ^~~~~~~~~
   util/synthetic-events.c:1042:44: note: earlier argument should specify number of elements, later size of each element
   util/synthetic-events.c:1046:29: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
    1046 |         args = calloc(sizeof(*args), thread_nr);
         |                             ^
   util/synthetic-events.c:1046:29: note: earlier argument should specify number of elements, later size of each element
   util/hist.c: In function 'hist_entry__init':
   util/hist.c:494:49: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
     494 |                 he->res_samples = calloc(sizeof(struct res_sample),
         |                                                 ^~~~~~
   util/hist.c:494:49: note: earlier argument should specify number of elements, later size of each element
   cc1: all warnings being treated as errors
   make[3]: *** [tools/build/Makefile.build:97: builtin-top.o] Error 1
   make[3]: *** Waiting for unfinished jobs....
   cc1: all warnings being treated as errors
   make[4]: *** [tools/build/Makefile.build:97: util/metricgroup.o] Error 1
   cc1: all warnings being treated as errors
   make[3]: *** [tools/build/Makefile.build:97: builtin-record.o] Error 1
   cc1: all warnings being treated as errors
   make[4]: *** [tools/build/Makefile.build:97: util/synthetic-events.o] Error 1
   cc1: all warnings being treated as errors
   make[4]: *** [tools/build/Makefile.build:97: util/hist.o] Error 1
   make[3]: *** [tools/build/Makefile.build:154: util] Error 2
   make[2]: *** [Makefile.perf:691: perf-in.o] Error 2
   make[2]: *** Waiting for unfinished jobs....
   make[1]: *** [Makefile.perf:267: sub-make] Error 2


vim +/cpu_to_le16 +166 tools/include/linux/bitfield.h

590b949597b1e81 Ricardo Koller 2022-10-17   59  
590b949597b1e81 Ricardo Koller 2022-10-17   60  #define __BF_FIELD_CHECK(_mask, _reg, _val, _pfx)			\
590b949597b1e81 Ricardo Koller 2022-10-17   61  	({								\
590b949597b1e81 Ricardo Koller 2022-10-17   62  		BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),		\
590b949597b1e81 Ricardo Koller 2022-10-17   63  				 _pfx "mask is not constant");		\
590b949597b1e81 Ricardo Koller 2022-10-17   64  		BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero");	\
590b949597b1e81 Ricardo Koller 2022-10-17   65  		BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?		\
590b949597b1e81 Ricardo Koller 2022-10-17   66  				 ~((_mask) >> __bf_shf(_mask)) & (_val) : 0, \
590b949597b1e81 Ricardo Koller 2022-10-17   67  				 _pfx "value too large for the field"); \
590b949597b1e81 Ricardo Koller 2022-10-17   68  		BUILD_BUG_ON_MSG(__bf_cast_unsigned(_mask, _mask) >	\
590b949597b1e81 Ricardo Koller 2022-10-17   69  				 __bf_cast_unsigned(_reg, ~0ull),	\
590b949597b1e81 Ricardo Koller 2022-10-17   70  				 _pfx "type of reg too small for mask"); \
590b949597b1e81 Ricardo Koller 2022-10-17   71  		__BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +			\
590b949597b1e81 Ricardo Koller 2022-10-17   72  					      (1ULL << __bf_shf(_mask))); \
590b949597b1e81 Ricardo Koller 2022-10-17   73  	})
590b949597b1e81 Ricardo Koller 2022-10-17   74  
590b949597b1e81 Ricardo Koller 2022-10-17   75  /**
590b949597b1e81 Ricardo Koller 2022-10-17   76   * FIELD_MAX() - produce the maximum value representable by a field
590b949597b1e81 Ricardo Koller 2022-10-17   77   * @_mask: shifted mask defining the field's length and position
590b949597b1e81 Ricardo Koller 2022-10-17   78   *
590b949597b1e81 Ricardo Koller 2022-10-17   79   * FIELD_MAX() returns the maximum value that can be held in the field
590b949597b1e81 Ricardo Koller 2022-10-17   80   * specified by @_mask.
590b949597b1e81 Ricardo Koller 2022-10-17   81   */
590b949597b1e81 Ricardo Koller 2022-10-17   82  #define FIELD_MAX(_mask)						\
590b949597b1e81 Ricardo Koller 2022-10-17   83  	({								\
590b949597b1e81 Ricardo Koller 2022-10-17   84  		__BF_FIELD_CHECK(_mask, 0ULL, 0ULL, "FIELD_MAX: ");	\
590b949597b1e81 Ricardo Koller 2022-10-17   85  		(typeof(_mask))((_mask) >> __bf_shf(_mask));		\
590b949597b1e81 Ricardo Koller 2022-10-17   86  	})
590b949597b1e81 Ricardo Koller 2022-10-17   87  
590b949597b1e81 Ricardo Koller 2022-10-17   88  /**
590b949597b1e81 Ricardo Koller 2022-10-17   89   * FIELD_FIT() - check if value fits in the field
590b949597b1e81 Ricardo Koller 2022-10-17   90   * @_mask: shifted mask defining the field's length and position
590b949597b1e81 Ricardo Koller 2022-10-17   91   * @_val:  value to test against the field
590b949597b1e81 Ricardo Koller 2022-10-17   92   *
590b949597b1e81 Ricardo Koller 2022-10-17   93   * Return: true if @_val can fit inside @_mask, false if @_val is too big.
590b949597b1e81 Ricardo Koller 2022-10-17   94   */
590b949597b1e81 Ricardo Koller 2022-10-17   95  #define FIELD_FIT(_mask, _val)						\
590b949597b1e81 Ricardo Koller 2022-10-17   96  	({								\
590b949597b1e81 Ricardo Koller 2022-10-17   97  		__BF_FIELD_CHECK(_mask, 0ULL, 0ULL, "FIELD_FIT: ");	\
590b949597b1e81 Ricardo Koller 2022-10-17   98  		!((((typeof(_mask))_val) << __bf_shf(_mask)) & ~(_mask)); \
590b949597b1e81 Ricardo Koller 2022-10-17   99  	})
590b949597b1e81 Ricardo Koller 2022-10-17  100  
590b949597b1e81 Ricardo Koller 2022-10-17  101  /**
590b949597b1e81 Ricardo Koller 2022-10-17  102   * FIELD_PREP() - prepare a bitfield element
590b949597b1e81 Ricardo Koller 2022-10-17  103   * @_mask: shifted mask defining the field's length and position
590b949597b1e81 Ricardo Koller 2022-10-17  104   * @_val:  value to put in the field
590b949597b1e81 Ricardo Koller 2022-10-17  105   *
590b949597b1e81 Ricardo Koller 2022-10-17  106   * FIELD_PREP() masks and shifts up the value.  The result should
590b949597b1e81 Ricardo Koller 2022-10-17  107   * be combined with other fields of the bitfield using logical OR.
590b949597b1e81 Ricardo Koller 2022-10-17  108   */
590b949597b1e81 Ricardo Koller 2022-10-17  109  #define FIELD_PREP(_mask, _val)						\
590b949597b1e81 Ricardo Koller 2022-10-17  110  	({								\
590b949597b1e81 Ricardo Koller 2022-10-17  111  		__BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");	\
590b949597b1e81 Ricardo Koller 2022-10-17  112  		((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask);	\
590b949597b1e81 Ricardo Koller 2022-10-17  113  	})
590b949597b1e81 Ricardo Koller 2022-10-17  114  
590b949597b1e81 Ricardo Koller 2022-10-17  115  /**
590b949597b1e81 Ricardo Koller 2022-10-17  116   * FIELD_GET() - extract a bitfield element
590b949597b1e81 Ricardo Koller 2022-10-17  117   * @_mask: shifted mask defining the field's length and position
590b949597b1e81 Ricardo Koller 2022-10-17  118   * @_reg:  value of entire bitfield
590b949597b1e81 Ricardo Koller 2022-10-17  119   *
590b949597b1e81 Ricardo Koller 2022-10-17  120   * FIELD_GET() extracts the field specified by @_mask from the
590b949597b1e81 Ricardo Koller 2022-10-17  121   * bitfield passed in as @_reg by masking and shifting it down.
590b949597b1e81 Ricardo Koller 2022-10-17  122   */
590b949597b1e81 Ricardo Koller 2022-10-17  123  #define FIELD_GET(_mask, _reg)						\
590b949597b1e81 Ricardo Koller 2022-10-17  124  	({								\
590b949597b1e81 Ricardo Koller 2022-10-17  125  		__BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");	\
590b949597b1e81 Ricardo Koller 2022-10-17  126  		(typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask));	\
590b949597b1e81 Ricardo Koller 2022-10-17  127  	})
590b949597b1e81 Ricardo Koller 2022-10-17  128  
590b949597b1e81 Ricardo Koller 2022-10-17  129  extern void __compiletime_error("value doesn't fit into mask")
590b949597b1e81 Ricardo Koller 2022-10-17  130  __field_overflow(void);
590b949597b1e81 Ricardo Koller 2022-10-17  131  extern void __compiletime_error("bad bitfield mask")
590b949597b1e81 Ricardo Koller 2022-10-17  132  __bad_mask(void);
590b949597b1e81 Ricardo Koller 2022-10-17  133  static __always_inline u64 field_multiplier(u64 field)
590b949597b1e81 Ricardo Koller 2022-10-17  134  {
590b949597b1e81 Ricardo Koller 2022-10-17  135  	if ((field | (field - 1)) & ((field | (field - 1)) + 1))
590b949597b1e81 Ricardo Koller 2022-10-17  136  		__bad_mask();
590b949597b1e81 Ricardo Koller 2022-10-17  137  	return field & -field;
590b949597b1e81 Ricardo Koller 2022-10-17  138  }
590b949597b1e81 Ricardo Koller 2022-10-17  139  static __always_inline u64 field_mask(u64 field)
590b949597b1e81 Ricardo Koller 2022-10-17  140  {
590b949597b1e81 Ricardo Koller 2022-10-17  141  	return field / field_multiplier(field);
590b949597b1e81 Ricardo Koller 2022-10-17  142  }
590b949597b1e81 Ricardo Koller 2022-10-17  143  #define field_max(field)	((typeof(field))field_mask(field))
590b949597b1e81 Ricardo Koller 2022-10-17  144  #define ____MAKE_OP(type,base,to,from)					\
590b949597b1e81 Ricardo Koller 2022-10-17  145  static __always_inline __##type type##_encode_bits(base v, base field)	\
590b949597b1e81 Ricardo Koller 2022-10-17  146  {									\
590b949597b1e81 Ricardo Koller 2022-10-17  147  	if (__builtin_constant_p(v) && (v & ~field_mask(field)))	\
590b949597b1e81 Ricardo Koller 2022-10-17  148  		__field_overflow();					\
590b949597b1e81 Ricardo Koller 2022-10-17  149  	return to((v & field_mask(field)) * field_multiplier(field));	\
590b949597b1e81 Ricardo Koller 2022-10-17  150  }									\
590b949597b1e81 Ricardo Koller 2022-10-17  151  static __always_inline __##type type##_replace_bits(__##type old,	\
590b949597b1e81 Ricardo Koller 2022-10-17  152  					base val, base field)		\
590b949597b1e81 Ricardo Koller 2022-10-17  153  {									\
590b949597b1e81 Ricardo Koller 2022-10-17  154  	return (old & ~to(field)) | type##_encode_bits(val, field);	\
590b949597b1e81 Ricardo Koller 2022-10-17  155  }									\
590b949597b1e81 Ricardo Koller 2022-10-17  156  static __always_inline void type##p_replace_bits(__##type *p,		\
590b949597b1e81 Ricardo Koller 2022-10-17  157  					base val, base field)		\
590b949597b1e81 Ricardo Koller 2022-10-17  158  {									\
590b949597b1e81 Ricardo Koller 2022-10-17  159  	*p = (*p & ~to(field)) | type##_encode_bits(val, field);	\
590b949597b1e81 Ricardo Koller 2022-10-17  160  }									\
590b949597b1e81 Ricardo Koller 2022-10-17  161  static __always_inline base type##_get_bits(__##type v, base field)	\
590b949597b1e81 Ricardo Koller 2022-10-17  162  {									\
590b949597b1e81 Ricardo Koller 2022-10-17  163  	return (from(v) & field)/field_multiplier(field);		\
590b949597b1e81 Ricardo Koller 2022-10-17  164  }
590b949597b1e81 Ricardo Koller 2022-10-17  165  #define __MAKE_OP(size)							\
590b949597b1e81 Ricardo Koller 2022-10-17 @166  	____MAKE_OP(le##size,u##size,cpu_to_le##size,le##size##_to_cpu)	\
590b949597b1e81 Ricardo Koller 2022-10-17 @167  	____MAKE_OP(be##size,u##size,cpu_to_be##size,be##size##_to_cpu)	\
590b949597b1e81 Ricardo Koller 2022-10-17  168  	____MAKE_OP(u##size,u##size,,)
590b949597b1e81 Ricardo Koller 2022-10-17  169  ____MAKE_OP(u8,u8,,)
590b949597b1e81 Ricardo Koller 2022-10-17  170  __MAKE_OP(16)
590b949597b1e81 Ricardo Koller 2022-10-17  171  __MAKE_OP(32)
590b949597b1e81 Ricardo Koller 2022-10-17  172  __MAKE_OP(64)
590b949597b1e81 Ricardo Koller 2022-10-17  173  #undef __MAKE_OP
590b949597b1e81 Ricardo Koller 2022-10-17  174  #undef ____MAKE_OP
590b949597b1e81 Ricardo Koller 2022-10-17  175  

:::::: The code at line 166 was first introduced by commit
:::::: 590b949597b1e811d35df2f32021dd17d8e47f8c tools: Copy bitfield.h from the kernel sources

:::::: TO: Ricardo Koller <ricarkol@google.com>
:::::: CC: Marc Zyngier <maz@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
