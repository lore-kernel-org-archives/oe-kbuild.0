Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0678F7D
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Jul 2023 13:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689601380; x=1721137380;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4D7siNTAV72Uhwp+LsIOxoUMj67QMm2XdrH3/8JQSaI=;
  b=F2c/KIwfY857tEJf0W28fyf0iFMDAoThYLsTPPWIyKA3xevu76X01Sd4
   9yq3IMn7OzjvBp/aVOa1gdSr/9gzSbtTINGINdm2N9PrmDeIfM/lb1CX5
   vPEU6CSxU9haxXv4q9OSKrsf4Il4A41DeusWM1RM3dWnIJ5LQhOXA3hJm
   LiStRAFQfgbSHwQNdCiUo1GgWqHYZrn5Y3HC3+odJ7oOfliLPIU6OMrqI
   HwBTAXGO/EQbnP4vYNdE/pOWS+AgTH5HOI4tqp6VtjpaMQ/8B+dU9+F21
   i9Iv+IG7tOu0hdvu5hiMAx41qewhxh4lcaaRxxY+AxkMA8tZL9IozAmXQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="363396647"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="363396647"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 06:42:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="969889334"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="969889334"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 17 Jul 2023 06:42:58 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLOV7-0009bA-2T;
	Mon, 17 Jul 2023 13:42:57 +0000
Date: Mon, 17 Jul 2023 21:42:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jolsa-perf:bpf_output_fix_reproducer 1/1]
 tools/testing/selftests/bpf/progs/krava.c: bpf/bpf_helpers.h is included
 more than once.
Message-ID: <202307172149.FcxVtCiE-lkp@intel.com>
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
TO: Jiri Olsa <jolsa@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf_output_fix_reproducer
head:   8054dcc634121b884c7c331329d61d93351d03b5
commit: 8054dcc634121b884c7c331329d61d93351d03b5 [1/1] reproducer
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230717/202307172149.FcxVtCiE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307172149.FcxVtCiE-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> tools/testing/selftests/bpf/progs/krava.c: bpf/bpf_helpers.h is included more than once.

vim +6 tools/testing/selftests/bpf/progs/krava.c

     3	
     4	#include <linux/bpf.h>
     5	#include <stdint.h>
   > 6	#include <bpf/bpf_helpers.h>
     7	#include "bpf_misc.h"
   > 8	#include <bpf/bpf_helpers.h>
     9	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
