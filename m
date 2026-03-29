Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA01279DCC
	for <oe-kbuild@lists.linux.dev>; Sun, 29 Mar 2026 15:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774796721; cv=none; b=pEzFuAVsz9ftzQ/9XPJCf6BcSRf4dFPaSe/TybwLZH3l5P/aAFd/HI/R1W8xbx4ftLfJBM4RflYv0Pagj15S4qXkp6k0yZaEUqsY0yUgAyuuvGG6vG/eB/VXQzFeVqoxikdHcEZqrzDYbjX+WfdUHGpwDYUcUxOz58r1Tf2gSII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774796721; c=relaxed/simple;
	bh=eWlf0yXAlw+2QppnN7cmid53z+YUXgPNeyT6QswVnrA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n8PjMn6vnzy+nzW/nGFP1AQnIe5swmljY/8y0OgVIichE9h2rJu7vtq7+cG0R5OK+ZI7+XieS3ZOa+FSyY70I8a3/gKEyhia4IF99LnPKWMhQ8Cy20SSUDpK7DAVOh4o+foYfYH35sJNXWvBSTisI9qaw8Mv45IFJ85WdNK21WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GCMx3yC+; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GCMx3yC+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774796720; x=1806332720;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eWlf0yXAlw+2QppnN7cmid53z+YUXgPNeyT6QswVnrA=;
  b=GCMx3yC+miTT4oGRYGdS7B0Qowsz13TEENG9tWoym6Q9eEQD5KUOsKmH
   TMoWzGeZ11/4WWL3bae7jkxYeeSRIY4HWjN2cNF19tO99iRR9CFaheyCN
   9Y5W5yVmTKL4OFVB/wIKLvrMd7f0qoIN1enazySIre7bRUz6kjTEBjrEB
   xvyezKUGwvoAvB9ObYnTMAjmpvYiE9my0mIg4YmKC1TDvYz5dqKmGAtmz
   chEC0RKTDJ1kfy2k5ty3jCGlzUGHqvafJw7c25UUNRsmov39yH2/6edwi
   dO+9A0/yOnMDuVxeixmS7tu2/t+LkoQnj3fyjGAntK2YSXMvdia6QsUS8
   A==;
X-CSE-ConnectionGUID: zDdMkovCR8uNkZXCzU+BaA==
X-CSE-MsgGUID: DJ+v0vPpTyOiqXsO8s7b5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="75773126"
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="75773126"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2026 08:05:20 -0700
X-CSE-ConnectionGUID: cF+L1oaYRIuyTZtXuhlXtA==
X-CSE-MsgGUID: z6RpElvkTYu4DKyLfvZVMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="249031822"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 29 Mar 2026 08:05:18 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6rhT-000000007vh-318i;
	Sun, 29 Mar 2026 15:05:15 +0000
Date: Sun, 29 Mar 2026 17:04:18 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v5] perf utilities: cln_size header
Message-ID: <202603291618.3giyFism-lkp@intel.com>
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
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260328200442.134489-1-ricky.ringler@proton.me>
References: <20260328200442.134489-1-ricky.ringler@proton.me>
TO: Ricky Ringler <ricky.ringler@proton.me>
TO: namhyung@kernel.org
CC: irogers@google.com
CC: mingo@redhat.com
CC: acme@kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-perf-users@vger.kernel.org
CC: Ricky Ringler <ricky.ringler@proton.me>

Hi Ricky,

kernel test robot noticed the following build errors:

[auto build test ERROR on perf-tools-next/perf-tools-next]
[also build test ERROR on tip/perf/core perf-tools/perf-tools next-20260327]
[cannot apply to acme/perf/core linus/master v6.16-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ricky-Ringler/perf-utilities-cln_size-header/20260329-205729
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/20260328200442.134489-1-ricky.ringler%40proton.me
patch subject: [PATCH v5] perf utilities: cln_size header
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260329/202603291618.3giyFism-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260329/202603291618.3giyFism-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603291618.3giyFism-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile.config:576: No elfutils/debuginfod.h found, no debuginfo server support, please install libdebuginfod-dev/elfutils-debuginfod-client-devel or equivalent
   Makefile.config:963: No libllvm 13+ found, slower source file resolution, please install llvm-devel/llvm-dev
   Makefile.config:1159: Rust is not found. Test workloads with rust are disabled.
     PERF_VERSION = 7.0.rc4.ga971d40d4a8d
   util/header.c: In function 'write_cln_size':
>> util/header.c:1308:32: error: expected expression before '=' token
    1308 | #define DEFAULT_CACHELINE_SIZE = 64
         |                                ^
   util/header.c:1317:28: note: in expansion of macro 'DEFAULT_CACHELINE_SIZE'
    1317 |                 cln_size = DEFAULT_CACHELINE_SIZE;
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   make[4]: *** [tools/build/Makefile.build:95: util/header.o] Error 1
   make[4]: *** Waiting for unfinished jobs....
   make[3]: *** [tools/build/Makefile.build:158: util] Error 2
   make[2]: *** [Makefile.perf:797: perf-util-in.o] Error 2
   make[2]: *** Waiting for unfinished jobs....
   make[1]: *** [Makefile.perf:289: sub-make] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
