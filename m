Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D442A7E
	for <oe-kbuild@lists.linux.dev>; Thu,  4 May 2023 12:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683203509; x=1714739509;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tY0u3xvaO2VXcSvKz3MYmslbqGmYWd50E3NisaWcAcE=;
  b=Zj+iVR+pTb6Qoca2I9MVd0C/TZqQRlw/EiXq9HYrquPOAROsakdYolRq
   9uN3fclNkt6wjUGl9u43Dz55KjmJ9/SrRq5EQehbxg1HvzUTsL3zJoXdu
   clKKUf3R/ixKiOUGpKOW/OpzWWVyS+ufadhBYzGN/n/xNqrFayn7JWjcT
   KaZ5M2GTXYXNB0vgS9YC2JpV8MSPw+lrwHwppROiHy6H1r1kseatUlhes
   L56xatsK/zOL9ewmwXnxJ9zJvNbqynBT6NFpC3hFJPbe0wEqwS6OtJRdI
   njNSmo1eQR+M/3pwbAU5gVvBhLgrtEVQb+jt2jsTWJmGdyZaSwKAn+nre
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="435226506"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="435226506"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2023 05:31:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="729777440"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="729777440"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 04 May 2023 05:31:25 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puY7I-0002ua-1h;
	Thu, 04 May 2023 12:31:24 +0000
Date: Thu, 4 May 2023 20:30:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [chrome-os:chromeos-6.1 37/53]
 drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c:186:6-9: ERROR:
 iterator variable bound on line 185 cannot be NULL
Message-ID: <202305042008.1xIoXUkb-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   721fe9ce306696fa78371815284a5329fe83d6ea
commit: a00c7f75bc3670d953d0a0666057f53b2d894792 [37/53] UPSTREAM: media: mediatek: vcodec: move lat_buf to the top of core list
:::::: branch date: 17 hours ago
:::::: commit date: 2 days ago
config: sparc64-randconfig-c003-20230430 (https://download.01.org/0day-ci/archive/20230504/202305042008.1xIoXUkb-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202305042008.1xIoXUkb-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c:186:6-9: ERROR: iterator variable bound on line 185 cannot be NULL

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
