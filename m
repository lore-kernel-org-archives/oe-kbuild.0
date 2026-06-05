Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3D640F8C2
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Jun 2026 06:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780642453; cv=none; b=CVG/ZxaYU3hyq503N2pk03+l4qP+M0w17oosJ/9CiPZ6hVM4Ho0UBHOMwhzo0Hyi1WnWKEbLwHyrWl3+v++qMYBJscHcwL9ZivkoER9k9WXhQ07Uf9QnlaSdJ6kk9ldLjV2pHaMgZNLBGvJUV+5CHh/7PcqJ3+8KI5rgARedupA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780642453; c=relaxed/simple;
	bh=go0VwK0uAC4ut6GINh9z3raSUPwR3P37WeJ9DnuAsiI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=apJD3Y4pDsfNAUkFj0I6ZN5niY5+B6jmIHFiayuBfXd0VMsL+/k/rHn7iaEqnm/3HJ0L1u5fTVOeOMtRX2YwOUh9h34vJhB3vk6KpyFbvpM1fGQ9ONjv3Yk9uyHMYjmSQj6XwGfc0G+SGkmKTnLRO7akdY3k/DuQvlFVICOAzjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XTlFna7M; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XTlFna7M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780642452; x=1812178452;
  h=date:from:to:cc:subject:message-id;
  bh=go0VwK0uAC4ut6GINh9z3raSUPwR3P37WeJ9DnuAsiI=;
  b=XTlFna7MpTYKrlWkD8T5C4s4G9hYt0mnxOe/DkciJ0JGgewU+132FXov
   Gd3QcfBMJTVPvo09UsPAn7bohqUDf/UDZB0JwbJr3vxr9Fseb6zhAkj/Q
   g7yjg4lWIJkHFdBN8s/i0aTsLju/dA9tiKdGgJslzRspQ22LP3emcwns1
   v68K8SrqG49PlS9mXzOO20GvxLXY/K5b0njP1gzCdbef2MKS7NLcfiw97
   yaVXJ0NpMTb98PncvvkeomZO42/mdexkpYQU5x1e9bLxV/mJC77fQMilq
   6wF3ykllYyZHq1vyaZjpk4ggqWQVHDp4KiC2XKeAh9ePOC9hG1fuVmkOp
   Q==;
X-CSE-ConnectionGUID: F5FuIOzJSTGEFid5x5/M2w==
X-CSE-MsgGUID: 5fXdOD3ERvyfw3ZlryObZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81474437"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="81474437"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 23:54:11 -0700
X-CSE-ConnectionGUID: 8M7TM7W7Qz6n0ZpKrrhciA==
X-CSE-MsgGUID: utVSc/2nSOCAf8OvzMh4AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="238412204"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 04 Jun 2026 23:54:10 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVORU-000000002Ux-1JqB;
	Fri, 05 Jun 2026 06:54:08 +0000
Date: Fri, 05 Jun 2026 08:54:02 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android14-kiwi-6.1 141/141]
 load_address.c:81:25: warning: incompatible implicit declaration of built-in
 function 'strstr'
Message-ID: <202606050822.H4sXUrqz-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

Hi Kees,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   67ea062394211e4dd4752419d3c4579e796b53bb
commit: add3a49ae91a1f6390b3fbf14a7ec9c6231bfbd6 [141/141] selftests/exec: Build both static and non-static load_address tests
:::::: branch date: 15 hours ago
:::::: commit date: 1 year ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260605/202606050822.H4sXUrqz-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606050822.H4sXUrqz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606050822.H4sXUrqz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   load_address.c: In function 'main':
   load_address.c:65:69: error: implicit declaration of function 'strerror'; did you mean 'perror'? [-Wimplicit-function-declaration]
      65 |                 ksft_exit_fail_msg("FAILED: /proc/self/maps: %s\n", strerror(errno));
         |                                                                     ^~~~~~~~
         |                                                                     perror
   load_address.c:81:25: error: implicit declaration of function 'strstr' [-Wimplicit-function-declaration]
      81 |         interp_needed = strstr(argv[0], ".static.") == NULL;
         |                         ^~~~~~
   load_address.c:10:1: note: include '<string.h>' or provide a declaration of 'strstr'
       9 | #include "../kselftest.h"
     +++ |+#include <string.h>
      10 | 
>> load_address.c:81:25: warning: incompatible implicit declaration of built-in function 'strstr' [-Wbuiltin-declaration-mismatch]
      81 |         interp_needed = strstr(argv[0], ".static.") == NULL;
         |                         ^~~~~~
   load_address.c:81:25: note: include '<string.h>' or provide a declaration of 'strstr'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
