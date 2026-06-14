Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C9E221DAE
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Jun 2026 01:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781401772; cv=none; b=MGNGqKl/vboPefs9q1AjbP63sR/bOgctKSCl6ehLXqInWm4nK6+/AGX3CkFWD408/521q3z4elKfLU72z3CsIp0u830kLIjyRkQpB7N+6AefqlREpa27mMh1Ja01SbfqYCshxzVDXUJQ6eWkc9yD7gAcVjNxWMFIdQ2jWGOjqSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781401772; c=relaxed/simple;
	bh=Qr9cjY31OGJgf8eLg/yWAfzSc1RqNS6Uqc52/jZtAXg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C7jCs2o/8lcsnnRJuNSz0MGKz2s9A8zPbyXy781PzXLapgFusDKw7veI6LyZgRR6pEjjXTus8xBiPNxh00wuieujycvQjAfXIJamOVK1Z4qG3CgX8DEK0oUXYLjmcB+KDzTErDUvGiTAihR5+PWCIbNOpFh8OgePMSNlIBN9HTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CadAH0yZ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CadAH0yZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781401770; x=1812937770;
  h=date:from:to:cc:subject:message-id;
  bh=Qr9cjY31OGJgf8eLg/yWAfzSc1RqNS6Uqc52/jZtAXg=;
  b=CadAH0yZLCPnhulLMA4u2uCz6HD8HyVVZKI3EylTbydFSlorz2qAHj67
   CqX3FsZCQzOrOgM2SGIRWG5ihc/zdbOLjUkEKIEThr0iC9fVlXYP92NYP
   BDdFYhJI6N6cBeQehKhRMA+tPAMlH7aijdZvUGOnFddTtsyCIFNA05QDN
   ZDLD07c5JQawN/OY5iAaxaGdeqnkFt7jAmAQ+K0hd9VFsJ5hWXOro5Usp
   B6XiDXcUvvvulxRhmcSyExJltyuH/96qIw9YrvsU4b92tL6EF4FYn0atl
   aUfxqjiCi14AH1pF1QZnd3om8YPt+EJ3ARIrBO66qqQtI/aFsIDrVAMDN
   w==;
X-CSE-ConnectionGUID: GvGew2AVRJ+8wFr+qigIkw==
X-CSE-MsgGUID: 5ort6yMnSpSM69E/fIi8yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11816"; a="85819393"
X-IronPort-AV: E=Sophos;i="6.24,203,1774335600"; 
   d="scan'208";a="85819393"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 18:49:30 -0700
X-CSE-ConnectionGUID: MIk28lJmSRq4c/8T6oRjuw==
X-CSE-MsgGUID: prKwjoCwQ/KXF2Gw1sTupA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,203,1774335600"; 
   d="scan'208";a="277350620"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 13 Jun 2026 18:49:28 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYZyY-000000004cb-1A9q;
	Sun, 14 Jun 2026 01:49:26 +0000
Date: Sun, 14 Jun 2026 03:49:09 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tamird:b4/bpf-ringbuf-callback 10/11] ringbuf.c:412:9:
 error: ISO C90 forbids mixed declarations and code
Message-ID: <202606140325.IV2DvOpj-lkp@intel.com>
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
TO: Tamir Duberstein <tamird@kernel.org>

tree:   https://github.com/tamird/linux b4/bpf-ringbuf-callback
head:   86c71f6b231e0611740aaab0d264f38d3713ccd8
commit: beab874d3a3d58feda17e6857e4c8cc2a8dd46d1 [10/11] libbpf: ringbuf: Add a caller-owned iterator
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260614/202606140325.IV2DvOpj-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260614/202606140325.IV2DvOpj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606140325.IV2DvOpj-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile.config:577: No elfutils/debuginfod.h found, no debuginfo server support, please install libdebuginfod-dev/elfutils-debuginfod-client-devel or equivalent
   Makefile.config:964: No libllvm 13+ found, slower source file resolution, please install llvm-devel/llvm-dev
   Makefile.config:1160: Rust is not found. Test workloads with rust are disabled.
     PERF_VERSION = 7.1.rc5.gbeab874d3a3d
   ringbuf.c: In function 'ringbuf_process_ring':
>> ringbuf.c:412:9: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
     412 |         struct ring_buffer_iter it
         |         ^~~~~~
   cc1: all warnings being treated as errors
   make[4]: *** [tools/build/Makefile.build:95: tools/perf/libbpf/staticobjs/ringbuf.o] Error 1
   make[4]: *** Waiting for unfinished jobs....
   ringbuf.c: In function 'ringbuf_process_ring':
>> ringbuf.c:412:9: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
     412 |         struct ring_buffer_iter it
         |         ^~~~~~
   cc1: all warnings being treated as errors
   make[5]: *** [tools/build/Makefile.build:95: tools/perf/util/bpf_skel/.tmp/bootstrap/libbpf/staticobjs/ringbuf.o] Error 1
   make[5]: *** Waiting for unfinished jobs....
   make[3]: *** [Makefile:152: tools/perf/libbpf/staticobjs/libbpf-in.o] Error 2
   make[2]: *** [Makefile.perf:964: tools/perf/libbpf/libbpf.a] Error 2
   make[2]: *** Waiting for unfinished jobs....
   make[4]: *** [Makefile:152: tools/perf/util/bpf_skel/.tmp/bootstrap/libbpf/staticobjs/libbpf-in.o] Error 2
   make[3]: *** [Makefile:48: tools/perf/util/bpf_skel/.tmp/bootstrap/libbpf/libbpf.a] Error 2
   make[2]: *** [Makefile.perf:1214: tools/perf/util/bpf_skel/.tmp/bootstrap/bpftool] Error 2
   make[1]: *** [Makefile.perf:288: sub-make] Error 2

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
