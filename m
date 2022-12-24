Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC503D61
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Dec 2022 19:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671909529; x=1703445529;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d6NFLCqwIV6MiI0HrCmJG3AR0Lc7cgRQi3W1S/2iHwc=;
  b=DdnDnzorzKik3KMx/2HpF8xszJAx+Ldwf4wVCNjlxjdBosP7C+ijgjrr
   ZLQbeUl0JLGPR42aooOaOE72NSrS6ygEQT0mPaHhdKFoobk38Me765R/c
   msbq9Tav81QWJnzO5zxhVOrq7Ibbyr3l500y8b2nm95vK9wcfznTCWK+P
   Gy/slB4E0hdTOSVuBM6QkdXRkd9wvESkqFOvvSZx8GZZn3hWJHio+uyMM
   Y+decM7+3pvN8tshrCmFtDfrHGjoL+fkvGYEJa1wrhv3CS9g9j6YIvUGL
   p4FEwkHBR47HgNL3+nEZJHUhgZbJ8/tH9g6lho5qrMgNMmnCaogIGvOXT
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10571"; a="300122161"
X-IronPort-AV: E=Sophos;i="5.96,271,1665471600"; 
   d="scan'208";a="300122161"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2022 11:18:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10571"; a="715740778"
X-IronPort-AV: E=Sophos;i="5.96,271,1665471600"; 
   d="scan'208";a="715740778"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 24 Dec 2022 11:18:48 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p9A2h-000DYB-2G;
	Sat, 24 Dec 2022 19:18:47 +0000
Date: Sun, 25 Dec 2022 03:18:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-w-bpi-r2-4.14:6.1-cryptodev 74/77]
 utils/cryptodev/cryptodev-linux/lib/benchmark.h: sys/time.h is included more
 than once.
Message-ID: <202212250337.g35HVMpd-lkp@intel.com>
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
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 6.1-cryptodev
head:   43fc63239ed935f098937cf8243ea65fb95d88bd
commit: e84976bd6acce5a628ab878542556557ea1232b9 [74/77] cryptodev: add latest cryptodev-master from jan 7th 2022
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

includecheck warnings: (new ones prefixed by >>)
>> utils/cryptodev/cryptodev-linux/lib/benchmark.h: sys/time.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
