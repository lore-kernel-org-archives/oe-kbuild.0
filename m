Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220C31E505
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Aug 2024 07:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722844400; cv=none; b=QfYDQ/ojJkM6qAyQxYAJmatvMEK7kmVXd1yqISGO9eUDwMjkle1qnfeBoFakE13wWwkXVWsZpGz8TdS5/3NHQePsNrD3H5vFJ2OClMMwzFZ9QLLeiay1XnKvuS44RT2nnuZKtC5UXly8LjoNJW8LuuZrLip6R8JolfBDkntS3bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722844400; c=relaxed/simple;
	bh=fpwGB8/CK0TkBub5Jz8+tNaFpWeto3U85x1ymcJ2Ix0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nDNMxnexJnYQTyx5k1Ck0qBgiA2qqq623HzB6J6FiBOgPh2RDIaS4dqnL+lf0PwwCg3Vq3sLLmiqZzttZO3Cai9sCI3bPCwcAXw40Sr4VnPnJ8mXy5ZD3l9JXgp2SeGrvQME2x9nj9wI//8p3i35UeOINOE2T+3t9/LnP/eZkUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IdanmELy; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IdanmELy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722844398; x=1754380398;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fpwGB8/CK0TkBub5Jz8+tNaFpWeto3U85x1ymcJ2Ix0=;
  b=IdanmELyqhd6eYVK7harjSUgFaUecfZ8hNOUoJ+qwee3JFPZHzAUyopZ
   KJ5ykmL39eWLN+rOF7hfZ74IxySID0mlp9mcv0X7o5/d6RUXeQKYLmXNn
   L4JPqPSzy3peW09qcC+iYFwsSlHsH/WpdgtVi2amJpuuit9V/w+eGCXr3
   xnmA9NFX11EfacXQWlpdmNJtIJ9RhTmMbYMaI1vrkQBjwuQIZuGvTWP3E
   EMFGXb6kGUbX2k9fld99WHOcXEx2uj/PVUOfkawFTw7w1lL1AIxLfFUDd
   p5RZ4oLpkWHToW+1c8tsxgMt4HlibxZqcvRtnCOW96Lh/fMSH3+ruAeuW
   w==;
X-CSE-ConnectionGUID: 9UwseF9BS2ykeuh/ISTdYg==
X-CSE-MsgGUID: vvGgMBTcTr2ylPsECYqT8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="38250604"
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; 
   d="scan'208";a="38250604"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 00:52:24 -0700
X-CSE-ConnectionGUID: S06IvHx6QqCmugSzntUfcw==
X-CSE-MsgGUID: AkFx5uujQUGpe+wJuhviyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; 
   d="scan'208";a="60894546"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 05 Aug 2024 00:52:23 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sasVw-0001nS-1r;
	Mon, 05 Aug 2024 07:52:20 +0000
Date: Mon, 5 Aug 2024 15:51:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v10 1/3] perf report: Support LLVM for addr2line()
Message-ID: <202408051506.paSer3wm-lkp@intel.com>
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
In-Reply-To: <20240803152008.2818485-1-sesse@google.com>
References: <20240803152008.2818485-1-sesse@google.com>
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
[also build test ERROR on tip/perf/core perf-tools/perf-tools linus/master v6.11-rc1 next-20240802]
[cannot apply to acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steinar-H-Gunderson/perf-annotate-split-out-read_symbol/20240804-004525
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/20240803152008.2818485-1-sesse%40google.com
patch subject: [PATCH v10 1/3] perf report: Support LLVM for addr2line()
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240805/202408051506.paSer3wm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408051506.paSer3wm-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile.config:671: No libunwind found. Please install libunwind-dev[el] >= 1.1 and/or set LIBUNWIND_DIR
     PERF_VERSION = 6.11.rc1.g9d7a19442d00
>> util/srcline.c:184:32: error: omitting the parameter name in a function definition is a C23 extension [-Werror,-Wc23-extensions]
     184 | void dso__free_a2l(struct dso *)
         |                                ^
   1 error generated.
   make[7]: *** [tools/build/Makefile.build:106: tools/perf/util/srcline.o] Error 1
   make[7]: *** Waiting for unfinished jobs....
   make[6]: *** [tools/build/Makefile.build:158: util] Error 2
   make[5]: *** [Makefile.perf:787: tools/perf/perf-util-in.o] Error 2
   make[5]: *** Waiting for unfinished jobs....
   make[4]: *** [Makefile.perf:290: sub-make] Error 2
   make[3]: *** [Makefile:76: all] Error 2


vim +184 tools/perf/util/srcline.c

9d7a19442d005a Steinar H. Gunderson 2024-08-03  183  
9d7a19442d005a Steinar H. Gunderson 2024-08-03 @184  void dso__free_a2l(struct dso *)
9d7a19442d005a Steinar H. Gunderson 2024-08-03  185  {
9d7a19442d005a Steinar H. Gunderson 2024-08-03  186  	/* Nothing to free. */
9d7a19442d005a Steinar H. Gunderson 2024-08-03  187  }
9d7a19442d005a Steinar H. Gunderson 2024-08-03  188  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
