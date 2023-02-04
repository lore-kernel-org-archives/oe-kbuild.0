Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295FE23A5
	for <oe-kbuild@lists.linux.dev>; Sat,  4 Feb 2023 13:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675515777; x=1707051777;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HA0DoKEA2Cm1TzD6HlzDdRK3Bq1x3QPDjxlzcObjamU=;
  b=ETHR0se0zdvgwiAXKF6Ezawbtl84qjtZN9i++CxRxbrLt+wA2VmsCouO
   CLy499Tc4zdMdlMj9agQgHKvXGhPdXZ0t8xEvEfI4JOA9Fb6BF5nYL5vS
   bLc5WXp0SIe9rnMXbpfXa7CJsQMyIiNaGN1hEnGTI4tDpRwwE/cnBAezR
   E+9HdAf/neCICja8bHj3oEKvrx0Ff+Xwzj6aQs++98SeBQnaFG8e45d7s
   BMJ/K4b+xjYUaFl4kxzw0Tq84ojsEbS2Omrt8cNbxktACBECms2ikvary
   3HNkvAZhO++jOAj/hSGcdXGo0trfGJW8iIsPOzt/A9IZRBNVR0zGpQ5Xc
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="415155951"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="415155951"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 05:02:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="643557856"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="643557856"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 04 Feb 2023 05:02:44 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOIBo-0001JW-05;
	Sat, 04 Feb 2023 13:02:44 +0000
Date: Sat, 4 Feb 2023 21:01:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 8855/10357]
 drivers/net/dsa/ocelot/felix.c:1278:3-14: ERROR: probable double put.
Message-ID: <202302042053.VVmn1Igz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Colin Foster <colin.foster@in-advantage.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Florian Fainelli <f.fainelli@gmail.com>
CC: Vladimir Oltean <vladimir.oltean@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4fafd96910add124586b549ad005dcd179de8a18
commit: de879a016a94a670fafeb3eb03b3d5803d81ab37 [8855/10357] net: dsa: felix: add functionality when not all ports are supported
:::::: branch date: 34 hours ago
:::::: commit date: 4 days ago
config: loongarch-randconfig-c004-20230204 (https://download.01.org/0day-ci/archive/20230204/202302042053.VVmn1Igz-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>

cocci warnings: (new ones prefixed by >>)
>> drivers/net/dsa/ocelot/felix.c:1278:3-14: ERROR: probable double put.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
