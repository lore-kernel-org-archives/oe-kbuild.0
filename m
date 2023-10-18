Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346D3BE5B
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Oct 2023 14:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="On3crwdI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697638916; x=1729174916;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ID+8YtRlwceEcj3Yvjl3Z/7KygREKi6fx6I2vQ/QZRc=;
  b=On3crwdIw0l80UG5bdjRf2iVYeP4NRM8QFU0y3I/p61G1kghBXPKL2s9
   nLSq6jKh1GHY333SwyAJ88pCwemg6DNg+ANCELK492DSdNiaTVuz0Fwj+
   gXTIk4o+5t4rtT6vmFrRmUEpCyNOqKMAbfYOAF3lKNdm5CCUHxmmWXZ9w
   +hg9CNDX7Eu9IXtZ/GXTFxiOzsyhSLvkkdQWEAOPC551DKm57oPdwucsv
   QpTUpUxPFbQhLehzCqYDtQExHtQa3rVXyXbTsem3KA8OsYB0rZpQA11uE
   93lrBlpMwq4O2ozJTTORcXw5dJrfJxG4DcORXvkBAZSzcsvjdOVqsOaRI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="389899481"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="389899481"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 07:21:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="873035257"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="873035257"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 18 Oct 2023 07:21:54 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qt7Qm-0000Ua-0I;
	Wed, 18 Oct 2023 14:21:52 +0000
Date: Wed, 18 Oct 2023 22:21:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/bpf/core.c:416:17: warning: '%s' directive argument is null
Message-ID: <202310182245.IQEYnH6c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: kernel/bpf/core.c:416:17: warning: '%s' directive argument is null [-Wformat-overflow=]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Yonghong Song <yhs@fb.com>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   06dc10eae55b5ceabfef287a7e5f16ceea204aa0
commit: f6161a8f3036caa45f225486be39783e99e0fa29 bpf: fix a compilation error when CONFIG_BPF_SYSCALL is not defined
date:   4 years, 11 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 4 years, 11 months ago
config: i386-randconfig-063-20230911 (https://download.01.org/0day-ci/archive/20231018/202310182245.IQEYnH6c-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231018/202310182245.IQEYnH6c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202310182245.IQEYnH6c-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/core.c:1030:65: warning: initialized field overwritten [-Woverride-init]
    1030 | #define BPF_INSN_3_LBL(x, y, z) [BPF_##x | BPF_##y | BPF_##z] = &&x##_##y##_##z
         |                                                                 ^~
   kernel/bpf/core.c:991:9: note: in expansion of macro 'BPF_INSN_3_LBL'
     991 |         INSN_3(LDX, MEM, H),                    \
         |         ^~~~~~
   kernel/bpf/core.c:1034:17: note: in expansion of macro 'BPF_INSN_MAP'
    1034 |                 BPF_INSN_MAP(BPF_INSN_2_LBL, BPF_INSN_3_LBL),
         |                 ^~~~~~~~~~~~
   kernel/bpf/core.c:1030:65: note: (near initialization for 'jumptable[105]')
    1030 | #define BPF_INSN_3_LBL(x, y, z) [BPF_##x | BPF_##y | BPF_##z] = &&x##_##y##_##z
         |                                                                 ^~
   kernel/bpf/core.c:991:9: note: in expansion of macro 'BPF_INSN_3_LBL'
     991 |         INSN_3(LDX, MEM, H),                    \
         |         ^~~~~~
   kernel/bpf/core.c:1034:17: note: in expansion of macro 'BPF_INSN_MAP'
    1034 |                 BPF_INSN_MAP(BPF_INSN_2_LBL, BPF_INSN_3_LBL),
         |                 ^~~~~~~~~~~~
   kernel/bpf/core.c:1030:65: warning: initialized field overwritten [-Woverride-init]
    1030 | #define BPF_INSN_3_LBL(x, y, z) [BPF_##x | BPF_##y | BPF_##z] = &&x##_##y##_##z
         |                                                                 ^~
   kernel/bpf/core.c:992:9: note: in expansion of macro 'BPF_INSN_3_LBL'
     992 |         INSN_3(LDX, MEM, W),                    \
         |         ^~~~~~
   kernel/bpf/core.c:1034:17: note: in expansion of macro 'BPF_INSN_MAP'
    1034 |                 BPF_INSN_MAP(BPF_INSN_2_LBL, BPF_INSN_3_LBL),
         |                 ^~~~~~~~~~~~
   kernel/bpf/core.c:1030:65: note: (near initialization for 'jumptable[97]')
    1030 | #define BPF_INSN_3_LBL(x, y, z) [BPF_##x | BPF_##y | BPF_##z] = &&x##_##y##_##z
         |                                                                 ^~
   kernel/bpf/core.c:992:9: note: in expansion of macro 'BPF_INSN_3_LBL'
     992 |         INSN_3(LDX, MEM, W),                    \
         |         ^~~~~~
   kernel/bpf/core.c:1034:17: note: in expansion of macro 'BPF_INSN_MAP'
    1034 |                 BPF_INSN_MAP(BPF_INSN_2_LBL, BPF_INSN_3_LBL),
         |                 ^~~~~~~~~~~~
   kernel/bpf/core.c:1030:65: warning: initialized field overwritten [-Woverride-init]
    1030 | #define BPF_INSN_3_LBL(x, y, z) [BPF_##x | BPF_##y | BPF_##z] = &&x##_##y##_##z
         |                                                                 ^~
   kernel/bpf/core.c:993:9: note: in expansion of macro 'BPF_INSN_3_LBL'
     993 |         INSN_3(LDX, MEM, DW),                   \
         |         ^~~~~~
   kernel/bpf/core.c:1034:17: note: in expansion of macro 'BPF_INSN_MAP'
    1034 |                 BPF_INSN_MAP(BPF_INSN_2_LBL, BPF_INSN_3_LBL),
         |                 ^~~~~~~~~~~~
   kernel/bpf/core.c:1030:65: note: (near initialization for 'jumptable[121]')
    1030 | #define BPF_INSN_3_LBL(x, y, z) [BPF_##x | BPF_##y | BPF_##z] = &&x##_##y##_##z
         |                                                                 ^~
   kernel/bpf/core.c:993:9: note: in expansion of macro 'BPF_INSN_3_LBL'
     993 |         INSN_3(LDX, MEM, DW),                   \
         |         ^~~~~~
   kernel/bpf/core.c:1034:17: note: in expansion of macro 'BPF_INSN_MAP'
    1034 |                 BPF_INSN_MAP(BPF_INSN_2_LBL, BPF_INSN_3_LBL),
         |                 ^~~~~~~~~~~~
   kernel/bpf/core.c:1030:65: warning: initialized field overwritten [-Woverride-init]
    1030 | #define BPF_INSN_3_LBL(x, y, z) [BPF_##x | BPF_##y | BPF_##z] = &&x##_##y##_##z
         |                                                                 ^~
   kernel/bpf/core.c:995:9: note: in expansion of macro 'BPF_INSN_3_LBL'
     995 |         INSN_3(LD, IMM, DW)
         |         ^~~~~~
   kernel/bpf/core.c:1034:17: note: in expansion of macro 'BPF_INSN_MAP'
    1034 |                 BPF_INSN_MAP(BPF_INSN_2_LBL, BPF_INSN_3_LBL),
         |                 ^~~~~~~~~~~~
   kernel/bpf/core.c:1030:65: note: (near initialization for 'jumptable[24]')
    1030 | #define BPF_INSN_3_LBL(x, y, z) [BPF_##x | BPF_##y | BPF_##z] = &&x##_##y##_##z
         |                                                                 ^~
   kernel/bpf/core.c:995:9: note: in expansion of macro 'BPF_INSN_3_LBL'
     995 |         INSN_3(LD, IMM, DW)
         |         ^~~~~~
   kernel/bpf/core.c:1034:17: note: in expansion of macro 'BPF_INSN_MAP'
    1034 |                 BPF_INSN_MAP(BPF_INSN_2_LBL, BPF_INSN_3_LBL),
         |                 ^~~~~~~~~~~~
   kernel/bpf/core.c:1036:45: warning: initialized field overwritten [-Woverride-init]
    1036 |                 [BPF_JMP | BPF_CALL_ARGS] = &&JMP_CALL_ARGS,
         |                                             ^~
   kernel/bpf/core.c:1036:45: note: (near initialization for 'jumptable[229]')
   kernel/bpf/core.c:1037:45: warning: initialized field overwritten [-Woverride-init]
    1037 |                 [BPF_JMP | BPF_TAIL_CALL] = &&JMP_TAIL_CALL,
         |                                             ^~
   kernel/bpf/core.c:1037:45: note: (near initialization for 'jumptable[245]')
   In file included from kernel/bpf/core.c:25:
   include/linux/filter.h:754:10: warning: cast between incompatible function types from 'u64 (*)(u64,  u64,  u64,  u64,  u64)' {aka 'long long unsigned int (*)(long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int)'} to 'u64 (*)(u64,  u64,  u64,  u64,  u64,  const struct bpf_insn *)' {aka 'long long unsigned int (*)(long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int,  const struct bpf_insn *)'} [-Wcast-function-type]
     754 |         ((u64 (*)(u64, u64, u64, u64, u64, const struct bpf_insn *)) \
         |          ^
   kernel/bpf/core.c:1171:27: note: in expansion of macro '__bpf_call_base_args'
    1171 |                 BPF_R0 = (__bpf_call_base_args + insn->imm)(BPF_R1, BPF_R2,
         |                           ^~~~~~~~~~~~~~~~~~~~
   kernel/bpf/core.c: At top level:
   kernel/bpf/core.c:1444:6: warning: no previous prototype for 'bpf_patch_call_args' [-Wmissing-prototypes]
    1444 | void bpf_patch_call_args(struct bpf_insn *insn, u32 stack_depth)
         |      ^~~~~~~~~~~~~~~~~~~
   In file included from kernel/bpf/core.c:25:
   kernel/bpf/core.c: In function 'bpf_patch_call_args':
   include/linux/filter.h:754:10: warning: cast between incompatible function types from 'u64 (*)(u64,  u64,  u64,  u64,  u64)' {aka 'long long unsigned int (*)(long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int)'} to 'u64 (*)(u64,  u64,  u64,  u64,  u64,  const struct bpf_insn *)' {aka 'long long unsigned int (*)(long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int,  const struct bpf_insn *)'} [-Wcast-function-type]
     754 |         ((u64 (*)(u64, u64, u64, u64, u64, const struct bpf_insn *)) \
         |          ^
   kernel/bpf/core.c:1449:17: note: in expansion of macro '__bpf_call_base_args'
    1449 |                 __bpf_call_base_args;
         |                 ^~~~~~~~~~~~~~~~~~~~
   kernel/bpf/core.c: In function 'bpf_get_prog_name':
>> kernel/bpf/core.c:416:17: warning: '%s' directive argument is null [-Wformat-overflow=]
     416 |                 snprintf(sym, (size_t)(end - sym), "_%s", func_name);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/core.c:1027: warning: Function parameter or member 'regs' not described in '___bpf_prog_run'
   kernel/bpf/core.c:1027: warning: Function parameter or member 'stack' not described in '___bpf_prog_run'
   kernel/bpf/core.c:1027: warning: Excess function parameter 'ctx' description in '___bpf_prog_run'


vim +416 kernel/bpf/core.c

74451e66d516c5 Daniel Borkmann  2017-02-16  391  
74451e66d516c5 Daniel Borkmann  2017-02-16  392  static void bpf_get_prog_name(const struct bpf_prog *prog, char *sym)
74451e66d516c5 Daniel Borkmann  2017-02-16  393  {
368211fb920a0b Martin KaFai Lau 2017-10-05  394  	const char *end = sym + KSYM_NAME_LEN;
838e96904ff3fc Yonghong Song    2018-11-19  395  	const struct btf_type *type;
838e96904ff3fc Yonghong Song    2018-11-19  396  	const char *func_name;
368211fb920a0b Martin KaFai Lau 2017-10-05  397  
74451e66d516c5 Daniel Borkmann  2017-02-16  398  	BUILD_BUG_ON(sizeof("bpf_prog_") +
368211fb920a0b Martin KaFai Lau 2017-10-05  399  		     sizeof(prog->tag) * 2 +
368211fb920a0b Martin KaFai Lau 2017-10-05  400  		     /* name has been null terminated.
368211fb920a0b Martin KaFai Lau 2017-10-05  401  		      * We should need +1 for the '_' preceding
368211fb920a0b Martin KaFai Lau 2017-10-05  402  		      * the name.  However, the null character
368211fb920a0b Martin KaFai Lau 2017-10-05  403  		      * is double counted between the name and the
368211fb920a0b Martin KaFai Lau 2017-10-05  404  		      * sizeof("bpf_prog_") above, so we omit
368211fb920a0b Martin KaFai Lau 2017-10-05  405  		      * the +1 here.
368211fb920a0b Martin KaFai Lau 2017-10-05  406  		      */
368211fb920a0b Martin KaFai Lau 2017-10-05  407  		     sizeof(prog->aux->name) > KSYM_NAME_LEN);
74451e66d516c5 Daniel Borkmann  2017-02-16  408  
74451e66d516c5 Daniel Borkmann  2017-02-16  409  	sym += snprintf(sym, KSYM_NAME_LEN, "bpf_prog_");
74451e66d516c5 Daniel Borkmann  2017-02-16  410  	sym  = bin2hex(sym, prog->tag, sizeof(prog->tag));
838e96904ff3fc Yonghong Song    2018-11-19  411  
838e96904ff3fc Yonghong Song    2018-11-19  412  	/* prog->aux->name will be ignored if full btf name is available */
838e96904ff3fc Yonghong Song    2018-11-19  413  	if (prog->aux->btf) {
838e96904ff3fc Yonghong Song    2018-11-19  414  		type = btf_type_by_id(prog->aux->btf, prog->aux->type_id);
838e96904ff3fc Yonghong Song    2018-11-19  415  		func_name = btf_name_by_offset(prog->aux->btf, type->name_off);
838e96904ff3fc Yonghong Song    2018-11-19 @416  		snprintf(sym, (size_t)(end - sym), "_%s", func_name);
838e96904ff3fc Yonghong Song    2018-11-19  417  		return;
838e96904ff3fc Yonghong Song    2018-11-19  418  	}
838e96904ff3fc Yonghong Song    2018-11-19  419  
368211fb920a0b Martin KaFai Lau 2017-10-05  420  	if (prog->aux->name[0])
368211fb920a0b Martin KaFai Lau 2017-10-05  421  		snprintf(sym, (size_t)(end - sym), "_%s", prog->aux->name);
368211fb920a0b Martin KaFai Lau 2017-10-05  422  	else
74451e66d516c5 Daniel Borkmann  2017-02-16  423  		*sym = 0;
74451e66d516c5 Daniel Borkmann  2017-02-16  424  }
74451e66d516c5 Daniel Borkmann  2017-02-16  425  

:::::: The code at line 416 was first introduced by commit
:::::: 838e96904ff3fc6c30e5ebbc611474669856e3c0 bpf: Introduce bpf_func_info

:::::: TO: Yonghong Song <yhs@fb.com>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
