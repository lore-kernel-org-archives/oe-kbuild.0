Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDE4367
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Apr 2024 23:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713915771; cv=none; b=T3ZNZsO4VrWkUuCcG8piwK/mjhCk61kX8YprdJKLhMb3p4OZyOt61u4EhS7m7U7kZERTtAfxRmRsd57ITEYG6+9QNvKOQ0JoyeqpfHqJYGkdflSGT36WSWTvl4hJZ+aSpU4SXdU46kUxjHCmS6yDh5i6AOjbYNMHDAFu05bnVzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713915771; c=relaxed/simple;
	bh=pz7t5uph8Nt5F1xHEuzrD3ggEMGMtYxvFyhvJBzkNKo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BGiyXcACAaEcrYNZKx6NKXWCyqO+Zs+opd0OOg9mLAK22/6x40VqMQc467jQlRrpY6BEXjuv7X+ZRdtLKIcDFyPGkGpR8Ig+ShDBFWfPpjBcmMSbWi+02OIxIusXJhoFL8SqtDHXyOfm6Gb8poCYSj66x5O+IsDYi/jYyVJ62Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Utrpqq/4; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Utrpqq/4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713915769; x=1745451769;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pz7t5uph8Nt5F1xHEuzrD3ggEMGMtYxvFyhvJBzkNKo=;
  b=Utrpqq/49Y01jNH8EfVDkaEAje3RiFApEjfqGRqvN6jLXO0DkKgV58Ks
   EMjan8Q3uvqpzIpj+erZxrX8tgp3Q1hC0BjHaiZCenhJTRDiXx7F0S609
   asK1SlYdqJl5/F1GxH+3h2Eh16W2uttSAUMYs7KjgUtkR2tXUI0Ns8N7B
   vs/ZGjO8LPU0pPCVbR+K5lyJFURAKqmvaB2LzYPc4IxgvXwy42TARekMb
   Jov8A6+eV6JX/I8+IO/oJlpAEW0I9aTY4VrEt+ZX609M5/7+afyPVJmEe
   ywBPPNCHu14sG74oMvtx+K5MTbYXgwisN2xInItpcMvqjRFtfzMZb3d8F
   w==;
X-CSE-ConnectionGUID: h+tw2xsWSPWe2UBDVdZdag==
X-CSE-MsgGUID: wcfjMfY+T5+P8VSK2pyeiA==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="20930128"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="20930128"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 16:42:49 -0700
X-CSE-ConnectionGUID: n+UtCs9ISceaoOzh0tZUkQ==
X-CSE-MsgGUID: 51grEE30RtCobrYIFHVIjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="24526376"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Apr 2024 16:42:48 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzPmf-0000dY-2P;
	Tue, 23 Apr 2024 23:42:45 +0000
Date: Wed, 24 Apr 2024 07:42:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 3/6] perf test pmu: Refactor format test and exposed
 test APIs
Message-ID: <202404240706.4zQmkds8-lkp@intel.com>
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
In-Reply-To: <20240423031719.1941141-4-irogers@google.com>
References: <20240423031719.1941141-4-irogers@google.com>
TO: Ian Rogers <irogers@google.com>
TO: Kan Liang <kan.liang@linux.intel.com>
TO: Ingo Molnar <mingo@redhat.com>
TO: Arnaldo Carvalho de Melo <acme@kernel.org>
TO: Namhyung Kim <namhyung@kernel.org>
TO: Mark Rutland <mark.rutland@arm.com>
TO: Alexander Shishkin <alexander.shishkin@linux.intel.com>
TO: Jiri Olsa <jolsa@kernel.org>
TO: Ian Rogers <irogers@google.com>
TO: Adrian Hunter <adrian.hunter@intel.com>
TO: Jonathan Corbet <corbet@lwn.net>
TO: Bjorn Helgaas <helgaas@kernel.org>
TO: Randy Dunlap <rdunlap@infradead.org>
TO: Jing Zhang <renyu.zj@linux.alibaba.com>
TO: James Clark <james.clark@arm.com>
TO: Ravi Bangoria <ravi.bangoria@amd.com>
TO: linux-kernel@vger.kernel.org
TO: linux-perf-users@vger.kernel.org

Hi Ian,

kernel test robot noticed the following build errors:

[auto build test ERROR on perf-tools-next/perf-tools-next]
[also build test ERROR on tip/perf/core perf-tools/perf-tools linus/master v6.9-rc5 next-20240423]
[cannot apply to acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ian-Rogers/perf-test-pmu-events-Make-it-clearer-that-pmu-events-tests-json-events/20240423-112057
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/20240423031719.1941141-4-irogers%40google.com
patch subject: [PATCH v2 3/6] perf test pmu: Refactor format test and exposed test APIs
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240424/202404240706.4zQmkds8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202404240706.4zQmkds8-lkp@intel.com/

All errors (new ones prefixed by >>):

     PERF_VERSION = 6.8.g0bd63f75ebb5
   tests/pmu.c: In function 'test_pmu_get':
>> tests/pmu.c:84:9: error: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Werror=unused-result]
      84 |         write(file, "9999\n", 5);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
   make[7]: *** [tools/build/Makefile.build:106: tools/perf/tests/pmu.o] Error 1
   make[7]: *** Waiting for unfinished jobs....
   make[6]: *** [tools/build/Makefile.build:158: tests] Error 2
   make[6]: *** Waiting for unfinished jobs....
   make[5]: *** [Makefile.perf:727: tools/perf/perf-in.o] Error 2
   make[5]: *** Waiting for unfinished jobs....
   make[4]: *** [Makefile.perf:264: sub-make] Error 2
   make[3]: *** [Makefile:70: all] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
