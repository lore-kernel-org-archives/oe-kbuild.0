Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794952480;
	b=CL63c2Z/bMm8jxG9kKAji0zSjgHAt8/ZjLwmN32yZhKgcdONHR/yTe2zttxufUNvU303
	 mJ4KtC3I6msdmMC+kHbV5O9HzF6ZkuWy1sKUb7B9xc5vxg0Fr3ZlLS0J0WNWLIzurkXc7
	 hgP3Ay/JHB6ohkqSthZ6vfycUvZNsSjMzktiSYGaLABHdY/LCdtRihIg4tihRSiCxsbiR
	 y641LHfE3JWD0OTV8gmR0JTk/iQ8HhgCNW/WIRR59Gb9UQmENBdBlCHpBFaIRMKCFTz4N
	 utF3MMu6mxkqF00ERnGhmEDdj8FYMYidxmq8DohiKhHljBujSy3BFhADAczsstJ82kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794952480;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=i5zLxtMxFAHLP/BHPyqhTrlvykYMT0ZRe8AQ0aGfqRQ=;
	b=g9s6f+RUgksgRHc5/ADVmCadrY/vHGY10iS3eixCbDA/bNmcCTZnGwQlfT8BwGJJSlNE
	 E8gw3RR3WSfJs2jwmzbYDbDP2YQbrMWQVkQJ5mNB0Dy4ZrFTja0VXx+3pB3MsXEtPwWIT
	 YIbthf+eCgHDDARgwCWT3lN1/e79PNu8CuykCK3HQo+5Ftros4SD2u3IwIuvS7zsxz/dy
	 +GmhPVZPZft7rjuSa2JrTgqI1gNTaUO7CulnnTkFUq/2dKeeRsQNRBk/FA82jxb6A7PyV
	 W7qJh4h18tRxwJBz3IYdtlyVjNJ4Ej/ShPE8VmARYu5W3XAPba5cxdnMx6IkL8IGf7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Fz0OqoYP;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F4E606A31C
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Nov 2026 21:54:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87F4E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Fz0OqoYP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794952479; x=1826488479;
  h=date:from:to:cc:subject:message-id;
  bh=o46MLZBfxWzPY8OrX+9H2/TyJ2ndJoDgPPYfGNe7a8E=;
  b=Fz0OqoYPr5gyciiNwZZpZJpvloA4fDsNmH6U6dxMW9O9HVweB1AqNfK3
   AnBAXiDrLhHcjUmzNWIgJISr5v2yA9B5MYENl4VyZCcmGPU2e9ajYn9YH
   YRBfZSJR9s1BxciN1mg4vcMMMfPCb9n9lHhnKqTZ2oRhT3+Qz2xHiiYZ9
   3pvaI37ketYjl97iK0K/d/uIwu9Ztbzkz+i/lId0IXo2EdnVokiW6XU4e
   kPa+NFbq00SSqfVTLgUWaQVR9YAZmeZCouCxueKV2l7jzNuWZvfTfrUEg
   QzAdbyV8CPW0+dtRQrutqH7XVEr21m1bwE5yNuMDcExwVNoBVIzONsvc2
   Q==;
X-CSE-ConnectionGUID: n062qkaTSD27KNZPlhDVsA==
X-CSE-MsgGUID: p6g9LaXfQ72URv26S/t87w==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3784219"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3784219"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 13:54:39 -0800
X-CSE-ConnectionGUID: hRdDLXsNSFm57hZuCGe9eA==
X-CSE-MsgGUID: 0cNT4xcmR6Stv53LXmfscw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="10201608"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 17 Nov 2026 13:54:39 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTR8N-000000003CY-39hQ;
	Tue, 17 Nov 2026 21:54:35 +0000
Date: Tue, 17 Nov 2026 22:54:09 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android16-6.12-lts 152/152]
 reuseport_bpf_numa.c:111:8: error: unknown type name 'bool'
Message-ID: <20261117224728.dIe1dxGB-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12-lts
head:   c5e3d3a3d3b60eb95c36e3c49dbfe7a34c220c5a
commit: 14b39ed41b930d65901ec4fd4e4f1e7e72317c37 [152/152] selftests: net: reuseport_bpf_numa: consider cpuless numa node
:::::: branch date: 3 days ago
:::::: commit date: 7 days ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261117/20261117224728.dIe1dxGB-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/20261117224728.dIe1dxGB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261117224728.dIe1dxGB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> reuseport_bpf_numa.c:111:8: error: unknown type name 'bool'
     111 | static bool is_cpuless_node(int node_id)
         |        ^~~~
   reuseport_bpf_numa.c:27:1: note: 'bool' is defined in header '<stdbool.h>'; this is probably fixable by adding '#include <stdbool.h>'
      26 | #include "../kselftest.h"
     +++ |+#include <stdbool.h>
      27 | 
   reuseport_bpf_numa.c: In function 'is_cpuless_node':
   reuseport_bpf_numa.c:114:9: error: unknown type name 'bool'
     114 |         bool ret = false;
         |         ^~~~
   reuseport_bpf_numa.c:114:9: note: 'bool' is defined in header '<stdbool.h>'; this is probably fixable by adding '#include <stdbool.h>'
>> reuseport_bpf_numa.c:114:20: error: 'false' undeclared (first use in this function)
     114 |         bool ret = false;
         |                    ^~~~~
   reuseport_bpf_numa.c:114:20: note: 'false' is defined in header '<stdbool.h>'; this is probably fixable by adding '#include <stdbool.h>'
   reuseport_bpf_numa.c:114:20: note: each undeclared identifier is reported only once for each function it appears in
>> reuseport_bpf_numa.c:121:23: error: 'true' undeclared (first use in this function)
     121 |                 ret = true;
         |                       ^~~~
   reuseport_bpf_numa.c:121:23: note: 'true' is defined in header '<stdbool.h>'; this is probably fixable by adding '#include <stdbool.h>'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
