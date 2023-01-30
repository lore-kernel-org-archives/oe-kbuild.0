Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F67644
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Jan 2023 06:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675061159; x=1706597159;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Uvapu9hgpj9kk7Ain9y8nY5F4zdI1YZMr5IT4j8nXwk=;
  b=DQgd59TcpuCqQacB9EqV5wFgNI6GqxjLKm+6YRYhJlW2jUbOZPu//Nek
   X+PMlpn70BF6W80xPTrZmjxcoP/Sf4+9yt1pqh8VFkKuT7Kp/2kCIS0ox
   vb8aSXeVsGMNpQTVGHsyHdCvbMGpTkXLTiNfLx0242k6ActYmxqrcQEMt
   hzkiITJOV/AjU6ftfgIeU8Ja6Ach71bz2Hsvkt26fyaHUOT6+yYKiFQnh
   ORS5MPmde2cjwpUj2edmPA+N2/UrwMdljfNYABqvVggavWCM+VX1M2vlN
   Y2BGv4bKjrfwin4wFXfsQrQdtnHabb19LY7nw5jy35vhMfS7VtL6o23ZW
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="413706632"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; 
   d="scan'208";a="413706632"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2023 22:45:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="732583358"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; 
   d="scan'208";a="732583358"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 29 Jan 2023 22:45:53 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMNvM-0003Sg-1y;
	Mon, 30 Jan 2023 06:45:52 +0000
Date: Mon, 30 Jan 2023 14:45:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/infiniband/ulp/ipoib/ipoib_main.c:333:2-10: WARNING: NULL
 check before dev_{put, hold} functions is not needed.
Message-ID: <202301301452.jacYfrpm-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Ziyang Xuan <william.xuanziyang@huawei.com>
CC: Julia Lawall <julia.lawall@inria.fr>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6d796c50f84ca79f1722bb131799e5a5710c4700
commit: bbd5c96850d9de535a83a3a3842dec2169cb31d1 scripts/coccinelle/free: add NULL test before dev_{put, hold} functions
date:   7 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 7 months ago
config: powerpc-randconfig-c034-20230129 (https://download.01.org/0day-ci/archive/20230130/202301301452.jacYfrpm-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@lip6.fr>

cocci warnings: (new ones prefixed by >>)
>> drivers/infiniband/ulp/ipoib/ipoib_main.c:333:2-10: WARNING: NULL check before dev_{put, hold} functions is not needed.
   drivers/infiniband/ulp/ipoib/ipoib_main.c:2007:2-9: WARNING: NULL check before dev_{put, hold} functions is not needed.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
