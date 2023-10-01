Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA29C138D
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Oct 2023 06:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696141012; x=1727677012;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mTdZ35PVTmFjO+wTCr9FxsQQIfPCVDZCwBs/w32uQ8Q=;
  b=McltHHU7dbCT3YJ5L5LmFaooWZVKZfwaRReATjJwoqgmoIxZ9YxE4sJA
   2maLptAzUlSd6DHN+vMfCXeOLGq1UFWJ9/AziVBzTLSGwjXHhjNPOEqUu
   qbHSpAhtkWRaCU2a7gWDqUFwsPz3BI/2juIiK+DgSvZyK/+PITPkInm4T
   dM23hapJ+vt8C+S3eP+PkLsks4VX/vvfwDwiXj41ZNmyNRODXy7kds5rT
   64Uz4d749utdtnOg2CwIm8dDekgXurnYmjLfi8FhV0HjL7sCdZ05jQXIM
   VLFgYBovee+hjE5y+AxPrahQyZXWi5ZB6CINJ7cmMzMo9ZvGCoPzA26hd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="362761155"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="362761155"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2023 23:16:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="874065352"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="874065352"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 30 Sep 2023 23:16:50 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmpl1-0004p7-30;
	Sun, 01 Oct 2023 06:16:47 +0000
Date: Sun, 1 Oct 2023 14:16:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH RFC v6 net-next 14/17] p4tc: add set of P4TC table kfuncs
Message-ID: <202310011424.k8UpHU21-lkp@intel.com>
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
In-Reply-To: <20230930143542.101000-15-jhs@mojatatu.com>
References: <20230930143542.101000-15-jhs@mojatatu.com>
TO: Jamal Hadi Salim <jhs@mojatatu.com>

Hi Jamal,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Jamal-Hadi-Salim/net-sched-act_api-Introduce-dynamic-actions-list/20230930-231804
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230930143542.101000-15-jhs%40mojatatu.com
patch subject: [PATCH RFC v6 net-next 14/17] p4tc: add set of P4TC table kfuncs
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231001/202310011424.k8UpHU21-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202310011424.k8UpHU21-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> net/sched/p4tc/p4tc_bpf.c: linux/filter.h is included more than once.

vim +13 net/sched/p4tc/p4tc_bpf.c

  > 13	#include <linux/filter.h>
    14	#include <linux/mutex.h>
    15	#include <linux/types.h>
    16	#include <linux/btf_ids.h>
    17	#include <linux/net_namespace.h>
    18	#include <net/p4tc.h>
    19	#include <linux/netdevice.h>
    20	#include <net/sock.h>
  > 21	#include <linux/filter.h>
    22	#include <net/xdp.h>
    23	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
