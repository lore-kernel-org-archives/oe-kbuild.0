Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776F87F
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Apr 2023 06:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682143899; x=1713679899;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=BsoOc+O+Ox7Q8ZzFsEL1OD0iq3JUPhbv/Ft4EYGXTb4=;
  b=D5qGChKoyCRZPqy6W7ooOGp9ipPzxGA4muTuj759SG+8l0ITz8tI/+7p
   MLlylszmQbiX1Ais+NrCu4tGkpnvu08/e1utH9gbY3HeoJbHmz1e1TWgm
   qtf6g6efEaIPukLUq9CaF4BLiOLRnP/QOA3Kq9gckZmuGm0LQ7sRe+cMn
   vCpkc5GucfeLBWJH1HNPbKnJ4DsnN9dlDskQvNiLZ7t7ShYA481QHIeI/
   lxIhs7zirvHHWucH8Im/Vpy1bWJVwARiMWMBhMqk54HLFf0F797n3mwH+
   1h/pm+AF8cGqdjleFdAgrrTKxzDfTK9CwyPM2m0JZLIGWJDyb3wcz2jQI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="411407170"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="411407170"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 23:11:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="695160005"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="695160005"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 21 Apr 2023 23:11:37 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pq6TA-000h7U-24;
	Sat, 22 Apr 2023 06:11:36 +0000
Date: Sat, 22 Apr 2023 14:10:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 4023/13717]
 drivers/gpu/drm/i915/display/intel_psr.c:2865:0-23: WARNING:
 i915_edp_psr_debug_fops should be defined with DEFINE_DEBUGFS_ATTRIBUTE
Message-ID: <202304221450.5AjLV5Nt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Jani Nikula <jani.nikula@intel.com>
CC: "Jouni Högander" <jouni.hogander@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d3e1ee0e67e7603d36f4fa2fec6b881c01aabe89
commit: 5cc0de456749712c6840d5d9e5b3de1071932aa5 [4023/13717] drm/i915/psr: move PSR debugfs to intel_psr.c
:::::: branch date: 12 hours ago
:::::: commit date: 5 weeks ago
config: x86_64-randconfig-c002 (https://download.01.org/0day-ci/archive/20230422/202304221450.5AjLV5Nt-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202304221450.5AjLV5Nt-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/display/intel_psr.c:2865:0-23: WARNING: i915_edp_psr_debug_fops should be defined with DEFINE_DEBUGFS_ATTRIBUTE

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
