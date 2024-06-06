Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C901953A7
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Jun 2024 10:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717669565; cv=none; b=fzRIxjevXYzZ+u27kOK5UeyZfEzoNyOuBlA6AKCLrjMihHqz7/y/d4jJpv+enrXoNShseJGYWMoFGnBZ4Pm4LCcJT7MIJfqyhxwf74hzv4a+2HLYlUjS7W04VZ7OOALANpPHp0foCMp/Z4Qxlzd+M2AmJ2TYAaEnLwS3Qp2cJvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717669565; c=relaxed/simple;
	bh=7C4rWGtFAz41w0g2ylCTn+zv76au3Cv/Wyjh3NDqg8E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=II8Nf07Evt0hpahQA2bTiMaNw5DgvAMVhL2A9rKLrOrpfXhEkJzCwq2irol99rudv3UfpX9KR1yzOAs+c9ZG0/Nqq2rk5NLn2XpPPV9ctlXWVH0l42WJZBDWMObej9NN+Oxpeytpk9CrnQDRBFouhhfbUofa/WBRqV3FFwIDVkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WXUBfBKd; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WXUBfBKd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717669563; x=1749205563;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7C4rWGtFAz41w0g2ylCTn+zv76au3Cv/Wyjh3NDqg8E=;
  b=WXUBfBKdG2DdvSMU9mCzqem7AhJD/WCSlPSenrSpRb+X9mNtA0LgLnlh
   dIP5pnQzXoCbDvi1TSjnkeFWS9med3RUgd0lamfZu7aCxSwNYHEWoYJyz
   7t4K7t5VkR9PSnx0FLkqy7QzdHBWb4IyahdmRPuj9i6A+8XFNyIz7bb0H
   JUo83uSQCcLPsI3PQHGe/yFFylub5maEmyTb7yy9dR1U/6qu0Y5unjKn0
   8G81a1183/ywSgYMkX/L77IMZrW8dToGv7Bfw9IMLfVxjphp80cRKu6EU
   9tnmCHlJJGUEiIUxxd/nA85jFnbbKTudLsDNl1S3bOfZmK0p1vo+C7RWM
   A==;
X-CSE-ConnectionGUID: apZ2I/MbSN6F+jSW7Vz7fA==
X-CSE-MsgGUID: GOI3nWGvSJqb7Svr6HFETw==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14068709"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; 
   d="scan'208";a="14068709"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 03:26:02 -0700
X-CSE-ConnectionGUID: 9UiWn87lSgi9vPoE1Av/7g==
X-CSE-MsgGUID: JcGivgcgRrmF7ynIophoqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; 
   d="scan'208";a="68731672"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 06 Jun 2024 03:26:01 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFAJi-0002ym-3C;
	Thu, 06 Jun 2024 10:25:58 +0000
Date: Thu, 6 Jun 2024 18:25:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v8 1/3] perf report: Support LLVM for addr2line()
Message-ID: <202406061836.rCHPTTLb-lkp@intel.com>
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
In-Reply-To: <20240602204208.735793-1-sesse@google.com>
References: <20240602204208.735793-1-sesse@google.com>
TO: "Steinar H. Gunderson" <sesse@google.com>
TO: acme@kernel.org
CC: linux-perf-users@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: irogers@google.com
CC: "Steinar H. Gunderson" <sesse@google.com>
CC: Arnaldo Carvalho de Melo <acme@redhat.com>

Hi Steinar,

kernel test robot noticed the following build errors:

[auto build test ERROR on perf-tools-next/perf-tools-next]
[also build test ERROR on tip/perf/core perf-tools/perf-tools linus/master v6.10-rc2 next-20240606]
[cannot apply to acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steinar-H-Gunderson/perf-annotate-split-out-read_symbol/20240603-044420
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/20240602204208.735793-1-sesse%40google.com
patch subject: [PATCH v8 1/3] perf report: Support LLVM for addr2line()
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240606/202406061836.rCHPTTLb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406061836.rCHPTTLb-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile.config:663: No libunwind found. Please install libunwind-dev[el] >= 1.1 and/or set LIBUNWIND_DIR
     PERF_VERSION = 6.10.rc1.gd3c83c542797
>> util/srcline.c:183:32: error: omitting the parameter name in a function definition is a C23 extension [-Werror,-Wc23-extensions]
     183 | void dso__free_a2l(struct dso *)
         |                                ^
   1 error generated.
   make[7]: *** [tools/build/Makefile.build:105: tools/perf/util/srcline.o] Error 1
   make[7]: *** Waiting for unfinished jobs....
   make[6]: *** [tools/build/Makefile.build:158: util] Error 2
   make[5]: *** [Makefile.perf:727: tools/perf/perf-in.o] Error 2
   make[5]: *** Waiting for unfinished jobs....
   make[4]: *** [Makefile.perf:264: sub-make] Error 2
   make[3]: *** [Makefile:70: all] Error 2


vim +183 tools/perf/util/srcline.c

d3c83c542797774 Steinar H. Gunderson 2024-06-02  182  
d3c83c542797774 Steinar H. Gunderson 2024-06-02 @183  void dso__free_a2l(struct dso *)
d3c83c542797774 Steinar H. Gunderson 2024-06-02  184  {
d3c83c542797774 Steinar H. Gunderson 2024-06-02  185  	/* Nothing to free. */
d3c83c542797774 Steinar H. Gunderson 2024-06-02  186  }
d3c83c542797774 Steinar H. Gunderson 2024-06-02  187  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
