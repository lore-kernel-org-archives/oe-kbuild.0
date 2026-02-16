Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95394265CA6
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Feb 2026 14:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771250551; cv=none; b=InQv2NZk3nwHjcSSA53IRIlED2I2+SLoXPQ5KdfG7As7j1Qo1Tx+WVvbroGZadzN2D6qLG7JNAxOWPszTpUgmLR7JzqqcXxXU0ezKjezsf16DgmWLF/gc6VC8bcFQ9jeiW+ol0BTXebRqnP7HmmW92BeOqAaCz/W1fbQ959k9hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771250551; c=relaxed/simple;
	bh=ULdSam2+wdoY/z04zPbzbmfV+PR3sEoFc0mLhHZbppk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=acuMjTHLNF3fjMARCqtNSdwFcZ6+SXg12KrtetczoUbS99NyIqjvC/OLpZRhQ6R2EI0MxbX7qxXbLp44AfVoE+6O2mMmZRg7bbiW8yyXLheUAb0luX+0oA8zxq2m2t3zV5QklTq56SNnlQs2EO42YCQ9oYHj7jcANplYPeQiTSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cC0d+KPO; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cC0d+KPO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771250550; x=1802786550;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ULdSam2+wdoY/z04zPbzbmfV+PR3sEoFc0mLhHZbppk=;
  b=cC0d+KPOWXXey425dxNPqGO6OwejhK6GhLVtp5zrekCUb4giEnEvvulg
   aUwkKsFDXJ0HTAlL4Due3eGnWsFo8Z0HhJJCv2DIUakyMqzBz8MekHJ90
   pR2UQjlQADxqjxH3vHEiAZCScVN2YmRs3YDhjpjzg3rF13ucgqAQm+dop
   kTUgqzOxuDwWG/9oP55v3R8VLV3+nfXaulZnbSQNqGSq3M5gpW/bCR9KR
   vxo+R0lsCLSFINEfbj+mxkTJnvP6vbo5mek4bMn63F2O26LNsvbwffELw
   luCPOt0gZfULDuui7h9lhieBiyD2zSJNt1OQGaWZesj2K0BdkorC6OkbX
   A==;
X-CSE-ConnectionGUID: oXZhs9yERpyoDe7JjAEd7w==
X-CSE-MsgGUID: g2uy6dsUSxmtTzsK1pF0Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="59898260"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="59898260"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 06:02:29 -0800
X-CSE-ConnectionGUID: e9f2U4mvRcqICZv3fZUb0g==
X-CSE-MsgGUID: SqiOwlQ2Q/G8sP9tshkcVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="217765077"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 16 Feb 2026 06:02:28 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrzBB-000000002TJ-2d8i;
	Mon, 16 Feb 2026 14:02:25 +0000
Date: Mon, 16 Feb 2026 15:02:19 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 linux-next] perf parse-events: Fix big-endian
 'overwrite' by writing correct union member
Message-ID: <202602161544.xYy1FKz1-lkp@intel.com>
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
:::::: Manual check reason: "likely FALSE maybe-used-uninitialized warning on old compiler"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260216131050.2581963-1-tmricht@linux.ibm.com>
References: <20260216131050.2581963-1-tmricht@linux.ibm.com>
TO: Thomas Richter <tmricht@linux.ibm.com>
TO: linux-kernel@vger.kernel.org
TO: linux-s390@vger.kernel.org
TO: linux-perf-users@vger.kernel.org
TO: acme@kernel.org
TO: namhyung@kernel.org
TO: james.clark@linaro.org
TO: irogers@google.com
CC: agordeev@linux.ibm.com
CC: gor@linux.ibm.com
CC: sumanthk@linux.ibm.com
CC: hca@linux.ibm.com
CC: japo@linux.ibm.com
CC: Thomas Richter <tmricht@linux.ibm.com>

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20260213]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Richter/perf-parse-events-Fix-big-endian-overwrite-by-writing-correct-union-member/20260216-211324
base:   next-20260213
patch link:    https://lore.kernel.org/r/20260216131050.2581963-1-tmricht%40linux.ibm.com
patch subject: [PATCH v2 linux-next] perf parse-events: Fix big-endian 'overwrite' by writing correct union member
:::::: branch date: 41 minutes ago
:::::: commit date: 41 minutes ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260216/202602161544.xYy1FKz1-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260216/202602161544.xYy1FKz1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602161544.xYy1FKz1-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All errors (new ones prefixed by >>):

   Makefile.config:576: No elfutils/debuginfod.h found, no debuginfo server support, please install libdebuginfod-dev/elfutils-debuginfod-client-devel or equivalent
   Makefile.config:963: No libllvm 13+ found, slower source file resolution, please install llvm-devel/llvm-dev
   Makefile.config:1159: Rust is not found. Test workloads with rust are disabled.
     PERF_VERSION = 6.19.g7c2ce6903f76
   In function 'add_config_term',
       inlined from 'get_config_terms' at util/parse-events.c:1312:14:
>> util/parse-events.c:1140:28: error: 'val' may be used uninitialized [-Werror=maybe-uninitialized]
    1140 |                 t->val.val = val;
         |                 ~~~~~~~~~~~^~~~~
   util/parse-events.c: In function 'get_config_terms':
   util/parse-events.c:1215:21: note: 'val' was declared here
    1215 |                 u64 val;
         |                     ^~~
   cc1: all warnings being treated as errors
   make[4]: *** [tools/build/Makefile.build:93: util/parse-events.o] Error 1
   make[4]: *** Waiting for unfinished jobs....
   make[3]: *** [tools/build/Makefile.build:156: util] Error 2
   make[2]: *** [Makefile.perf:797: perf-util-in.o] Error 2
   make[2]: *** Waiting for unfinished jobs....
   make[1]: *** [Makefile.perf:289: sub-make] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
