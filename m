Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B10E17E01E
	for <oe-kbuild@lists.linux.dev>; Fri, 23 Aug 2024 10:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724409868; cv=none; b=me7tDJxAGB+mSg0syvlEVWdwBmqSmhvBjJIp0oqaQqhmcyQcNkwtl2dA8s7hvXro98XAa7iKW1ClZFQ5f3U/SPVK/DcGUwZMEXUt2M8GAI9p9C0/wDMpcTwfY55mTYUyNutSeIx3hQaP5u55wo2NYSXo9F8mbK0edvPbcNIfInc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724409868; c=relaxed/simple;
	bh=Pj+27navgtxlVrCSrgMCtRPIpIx8eBfjW2dpfncZR+o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u0h/75DJN9E8WsijJGKzwBRzrGvXyZMDqKEHmxYxXes1gsd1/n5N6+ejRm/BJpXZfMcEBezLlpN+d3DOvc5vUXqFJwcLAz0uEWYKIdQ4jl0tNbngRMdBQ3QyQVxDpTzbguztgLXonZ99rZtDRGNelRW+V+sWGcdN/cGCXpzufow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SmeQFYiu; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SmeQFYiu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724409865; x=1755945865;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pj+27navgtxlVrCSrgMCtRPIpIx8eBfjW2dpfncZR+o=;
  b=SmeQFYiusW9KCIZT3Y8AozoWYvN0hrbDxSL8vxPFuqLyGgozSOZWTM+I
   vSCKhwRFQwJE+/vqVo57QJ1YguU3JdUJVtVLgQOkVxIB6lpiiBckg2BSt
   2IjE2zQjbvvv40LtJ3kCLvRpXm9kuS5ya6zu2WCoPA8k5kxBS04AWemGK
   9RUTMkI1aCbDhvJV3hMT+Q80D1xC5mRxVW4vEu9xzSd68uRmSfrHmGN1O
   eCP1VsUXaYLnBnqXoAhFi898pMnUL6fp+sZ+lcPO/mhQw9LOolBCHbI4k
   FLce+aXpoRBt2ub3OnJ5YJh4PmPTSdJrPGs0+yk7hn6kMhYbkjJcLbFmI
   w==;
X-CSE-ConnectionGUID: J9HE37HpSpuwyXhFs5a0+A==
X-CSE-MsgGUID: Nr9Zj1yqRduIOLSAveTZgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="33494252"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="33494252"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 03:44:24 -0700
X-CSE-ConnectionGUID: lBxoS9r3QTuLKImM2nuONQ==
X-CSE-MsgGUID: i5BMoZXLTMi2eYQYePF2OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="61440745"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 23 Aug 2024 03:44:25 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shRmI-000Dfk-2T;
	Fri, 23 Aug 2024 10:44:22 +0000
Date: Fri, 23 Aug 2024 18:43:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [perf-tools:tmp.perf-tools 1/1] error: command 'clang' failed with
 exit code 1
Message-ID: <202408231822.dWGP67uY-lkp@intel.com>
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
TO: Sedat Dilek <sedat.dilek@gmail.com>
CC: Namhyung Kim <namhyung@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools.git tmp.perf-tools
head:   cf36d63d7cc9a9770f69f44a10904e9fb0895fa9
commit: cf36d63d7cc9a9770f69f44a10904e9fb0895fa9 [1/1] perf tools: Fix a build error with clang 19
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240823/202408231822.dWGP67uY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408231822.dWGP67uY-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile.config:671: No libunwind found. Please install libunwind-dev[el] >= 1.1 and/or set LIBUNWIND_DIR
     PERF_VERSION = 6.11.rc4.gcf36d63d7cc9
   error: unknown warning option '-Wno-cast-function-type-mismatch'; did you mean '-Wno-cast-function-type-strict'? [-Werror,-Wunknown-warning-option]
>> error: command 'clang' failed with exit code 1
>> cp: cannot stat 'tools/perf/python_ext_build/lib/perf*.so': No such file or directory
   make[5]: *** [Makefile.perf:737: tools/perf/python/perf.cpython-311-x86_64-linux-gnu.so] Error 1
   make[4]: *** [Makefile.perf:290: sub-make] Error 2
   make[3]: *** [Makefile:70: all] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
