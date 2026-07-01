Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197F239280D
	for <oe-kbuild@lists.linux.dev>; Wed,  1 Jul 2026 05:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782884442; cv=none; b=GuW8+xlC9tdjcxB+pCh9zmWTXXnvwEvSen5/pX5aJTOKDylblf+GzUUkkXGnYaOlRlv+bz4jAqNf0LSs9ysw3PgNCWib6cw23FrBHMPc9A9nB+bWUW7URojhh7QdA4Ixl2WHVpAK5tDY1rCWFsaEdJ52/6gG/hGsLQJjSxWcW9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782884442; c=relaxed/simple;
	bh=tVYr//ue0uiV6kWwwv1vp3X23dlYXAF1uD7+euRrCMo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=apeEZYZtsl1FBvZvRfSQ6HotvWifrmTRIX2gtGBo9vYxuAp4DxbCzUGBvAwOgMXbZD6BbTDjVmDU4/Q6aaWKR7/Ah1EmioHrGPZgXskkZfLfhu9uQI1vLeXaGiahUgwQDWydwYC5daHu+T7Z+yuWnOUJyX1t8OBAckNLiM/jTuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z1wYZAR2; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z1wYZAR2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782884433; x=1814420433;
  h=date:from:to:cc:subject:message-id;
  bh=tVYr//ue0uiV6kWwwv1vp3X23dlYXAF1uD7+euRrCMo=;
  b=Z1wYZAR2gTiiVSjdOHlX4blgLhiJUrbso34KrQhUvpx+cxKJ6szs/LmE
   VHIwGdEI+JTj1GAEfSee7HdIC2K6XNuwCKGX/fkWiNL3FP5DOeW03zujs
   cnz1MU8BtlhKiY2TYMpsweP/jboCbVjDoGogMDsr/GSvqb1k2CA/jTc0h
   mIKZhfwMDC44SSgtDfiYU+t1DJrHfS7Z9haDg2mwPvSpjDqZ+/KHbsfPC
   jhkmsQyyqk44fcbpFKbP4qdLVm/D/3iVdt+HEkDHBU6DYX6bR6J2MYQXI
   tNS9Yn43R5TWvHpPToH/RRCF7ssu48Gl8O3r41YwruCi0uKWbsa0Ejky5
   w==;
X-CSE-ConnectionGUID: DdwSJHKMRICz9piSN9Bbfg==
X-CSE-MsgGUID: XqZbyQE7TnetV69LLR/4TA==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="83805028"
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="83805028"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 22:40:32 -0700
X-CSE-ConnectionGUID: AUtip/+rRE2/TOQtnAeusQ==
X-CSE-MsgGUID: kjZl9BWDQ5WG/iRugUaxtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="254382615"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 30 Jun 2026 22:40:31 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wengT-000000000gL-21mw;
	Wed, 01 Jul 2026 05:40:29 +0000
Date: Wed, 01 Jul 2026 07:40:27 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: util/capstone.c:221:20: error: implicit declaration of
 function 'machine__normalized_is'
Message-ID: <202607010724.pfcFkbFf-lkp@intel.com>
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
TO: Tengda Wu <wutengda@huaweicloud.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Tengda-Wu/perf-capstone-Fix-kernel-map-reference-count-leak/20260701-120354
head:   1b0c96bd2f84ba4e2ab6d1e383fd209277cfab9c
commit: 08ab88c2e4780e47a5053b0719c5ad1208c35194 perf capstone: Fix arm64 jump/adrp disassembly mismatch with objdump
date:   2 hours ago
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260701/202607010724.pfcFkbFf-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260701/202607010724.pfcFkbFf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607010724.pfcFkbFf-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile.config:564: No elfutils/debuginfod.h found, no debuginfo server support, please install libdebuginfod-dev/elfutils-debuginfod-client-devel or equivalent
   Makefile.config:1044: No babeltrace2 found, disables 'perf data' CTF format support, please install libbabeltrace2-dev[el]
   Makefile.config:1134: Rust is not found. Test workloads with rust are disabled.
     PERF_VERSION = 7.2.rc1.g08ab88c2e478
   cc1: warning: '-Wformat-y2k' ignored without '-Wformat' [-Wformat-y2k]
   cc1: warning: '-Wformat-security' ignored without '-Wformat' [-Wformat-security]
   util/capstone.c: In function 'capstone_init':
>> util/capstone.c:221:20: error: implicit declaration of function 'machine__normalized_is' [-Wimplicit-function-declaration]
     221 |         } else if (machine__normalized_is(machine, "arm64")) {
         |                    ^~~~~~~~~~~~~~~~~~~~~~
>> util/capstone.c:221:43: error: 'machine' undeclared (first use in this function)
     221 |         } else if (machine__normalized_is(machine, "arm64")) {
         |                                           ^~~~~~~
   util/capstone.c:221:43: note: each undeclared identifier is reported only once for each function it appears in
   make[4]: *** [tools/build/Makefile.build:95: util/capstone.o] Error 1
   make[4]: *** Waiting for unfinished jobs....
   make[3]: *** [tools/build/Makefile.build:158: util] Error 2
   make[2]: *** [Makefile.perf:576: perf-util-in.o] Error 2
   make[2]: *** Waiting for unfinished jobs....
   make[1]: *** [Makefile.perf:288: sub-make] Error 2

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
