Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E479B38656D
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Jun 2026 21:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780434033; cv=none; b=Ml1cwyxlOnr8y8pT0BsAuXei4mfCUxxzj3OxCUcVFPJK9XrmTFLNRlyBLwGQhImu9UMTNYS/iqmUT52o5gz8Vyhr0g+dHg2P2e1v0bsWQgIyPHs+ScpkeIlsaNMw9fXX3MUUpcQZmPHlva+9opEndHYnAQQvYwqoz9y6++JLayI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780434033; c=relaxed/simple;
	bh=r2KmHx5RYR640O73tKMYogp5o/HXfcJCsHESQ2yUkAA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K1zldvUgJcc52g+W2V+aZVgkAOWj/eCLUkfsKuTTS+E/0J3FsRhkHUeSXVTCnhG6ycLU2aWz6ttofrNXb5JCNpVfxpPMpj+/fiUBDKhZtlXvLpHVCVJQ0qeleXOBWPPeyIawsZt1+tA/yNJ06IzeJY7ScY9rsj0eiBNtRSj98m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dVYxTGQF; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dVYxTGQF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780434032; x=1811970032;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r2KmHx5RYR640O73tKMYogp5o/HXfcJCsHESQ2yUkAA=;
  b=dVYxTGQFoLMohACen0mmKM7SaO2WNE3W7D6zF0L8y62oS+MumPHeiMEs
   as6UZVFRhQNyrYN1xwVAkOuFNHSeYwXPwDl/T2R1Pn8yFVZ+pcn+4uX/P
   aIY+LC/vcqg/RC9FJMan3ePB87D8EPxeRAKBKMY6bHil4YWSXbAxD0AB3
   taXXq3X3fw09XPn6wSijdJE2bftAmudakDp4Tq6nqu4omEPHFCA643DOD
   F+oeCcwBg+0uZ7oK4wsmtLGx74ONNyLxGPjGznkdnJuoiNJKj9UQz4ApY
   fwiwOfBMYc0LLGuQ3vlkNcuGmBr1aDDMDJTW+AXdwJbuLb09mHGq3721Z
   w==;
X-CSE-ConnectionGUID: VgSgUragQCmQUgkrrEYEhA==
X-CSE-MsgGUID: /rXpnZhwQLe+ds7BjaBCTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="83814589"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="83814589"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 14:00:31 -0700
X-CSE-ConnectionGUID: AbUrral+SwCKsJ94UUcl0A==
X-CSE-MsgGUID: F13V5Av1R+G0QL14FgMGew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="237662625"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 02 Jun 2026 14:00:30 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUWDs-000000001rJ-2dqg;
	Tue, 02 Jun 2026 21:00:28 +0000
Date: Tue, 2 Jun 2026 23:00:09 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH bpf-next v2 8/8] selftests/bpf: Avoid static LLVM linking
 for cross builds
Message-ID: <202606022207.PcDtt93e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260602-tools_build_fix_zero_init_bpf_only-v2-8-c76e5250ea1c@arm.com>
References: <20260602-tools_build_fix_zero_init_bpf_only-v2-8-c76e5250ea1c@arm.com>
TO: Leo Yan <leo.yan@arm.com>
TO: Quentin Monnet <qmo@kernel.org>
TO: Alexei Starovoitov <ast@kernel.org>
TO: Daniel Borkmann <daniel@iogearbox.net>
TO: Andrii Nakryiko <andrii@kernel.org>
TO: Martin KaFai Lau <martin.lau@linux.dev>
TO: Eduard Zingerman <eddyz87@gmail.com>
TO: Song Liu <song@kernel.org>
TO: Yonghong Song <yonghong.song@linux.dev>
TO: John Fastabend <john.fastabend@gmail.com>
TO: KP Singh <kpsingh@kernel.org>
TO: Stanislav Fomichev <sdf@fomichev.me>
TO: Hao Luo <haoluo@google.com>
TO: Jiri Olsa <jolsa@kernel.org>
TO: Shuah Khan <skhan@linuxfoundation.org>
TO: Lorenz Bauer <lmb@isovalent.com>
TO: Nathan Chancellor <nathan@kernel.org>
TO: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
TO: Bill Wendling <morbo@google.com>
TO: Justin Stitt <justinstitt@google.com>
CC: Arnaldo Carvalho de Melo <acme@kernel.org>
CC: Namhyung Kim <namhyung@kernel.org>
CC: Ian Rogers <irogers@google.com>
CC: James Clark <james.clark@linaro.org>
CC: Kees Cook <kees@kernel.org>
CC: bpf@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-kselftest@vger.kernel.org
CC: llvm@lists.linux.dev
CC: Leo Yan <leo.yan@arm.com>

Hi Leo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on b93c55b4932dd7e32dca8cf34a3443cc87a02906]

url:    https://github.com/intel-lab-lkp/linux/commits/Leo-Yan/bpftool-Pass-host-flags-to-bootstrap-libbpf/20260602-231100
base:   b93c55b4932dd7e32dca8cf34a3443cc87a02906
patch link:    https://lore.kernel.org/r/20260602-tools_build_fix_zero_init_bpf_only-v2-8-c76e5250ea1c%40arm.com
patch subject: [PATCH bpf-next v2 8/8] selftests/bpf: Avoid static LLVM linking for cross builds
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260602/202606022207.PcDtt93e-lkp@intel.com/config)
compiler: riscv64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606022207.PcDtt93e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606022207.PcDtt93e-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Makefile.config:577: No elfutils/debuginfod.h found, no debuginfo server support, please install libdebuginfod-dev/elfutils-debuginfod-client-devel or equivalent
   Makefile.config:964: No libllvm 13+ found, slower source file resolution, please install llvm-devel/llvm-dev
   Makefile.config:1160: Rust is not found. Test workloads with rust are disabled.
     PERF_VERSION = 7.1.rc5.g381f7c643a0a
>> cc1: warning: '-Wformat-y2k' ignored without '-Wformat' [-Wformat-y2k]
>> cc1: warning: '-Wformat-security' ignored without '-Wformat' [-Wformat-security]
   builtin-trace.c: In function 'syscall_arg__strtoul_btf_enum':
   builtin-trace.c:967:27: error: comparison of integer expressions of different signedness: 'int' and '__u32' {aka 'unsigned int'} [-Werror=sign-compare]
     967 |         for (int i = 0; i < btf_vlen(bt); ++i, ++be) {
         |                           ^
   util/btf.c: In function '__btf_type__find_member_by_name':
   util/btf.c:19:43: error: comparison of integer expressions of different signedness: 'int' and '__u32' {aka 'unsigned int'} [-Werror=sign-compare]
      19 |         for (i = 0, m = btf_members(t); i < btf_vlen(t); i++, m++) {
         |                                           ^
   cc1: all warnings being treated as errors
   make[4]: *** [tools/build/Makefile.build:95: util/btf.o] Error 1
   make[4]: *** Waiting for unfinished jobs....
   cc1: all warnings being treated as errors
   make[3]: *** [tools/build/Makefile.build:95: builtin-trace.o] Error 1
   make[3]: *** Waiting for unfinished jobs....
   make[3]: *** [tools/build/Makefile.build:158: util] Error 2
   make[2]: *** [Makefile.perf:802: perf-util-in.o] Error 2
   make[2]: *** Waiting for unfinished jobs....
   make[2]: *** [Makefile.perf:775: perf-in.o] Error 2
   make[1]: *** [Makefile.perf:288: sub-make] Error 2

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
