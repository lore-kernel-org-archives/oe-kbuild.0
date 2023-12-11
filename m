Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E1B208C3
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Dec 2023 07:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gKy99poh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702280287; x=1733816287;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Nsbci1u+BxBm4Mel1d5WIZoTg7yMJOaQelewDp+MFdw=;
  b=gKy99pohuY6nNaISN+FVM5Chinr2sbx0M2c7oFfNJKI8dLnfcw652RtT
   fWgszjeysG9Fy22ST52srOuO9O9J0b2Vf/HwmCGxYsCo0nkb3dEiNaj2w
   vqtyQ+1ZhAiqfmO5ThVFflxSeOtCYqaA/h+8d3RmVGMtnR1b0eXgOEN+4
   3zfaYDuHoop72gOtlXsiQpzvKxxhIvbhcW/D09JsqrkFKCtJDDjJyx5Do
   yxTc9jaMdswqJEQLPRuIJg3fT4I/SFoKLUHZQeHTzbb7Agxu9h0t7oUFK
   xcrE7OI/Zgr84oIcYC1djGtoIFBCpISWcx6ob2cdoh0eZ5yLZHdg10gfu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="461085339"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; 
   d="scan'208";a="461085339"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 23:38:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; 
   d="scan'208";a="20980885"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 10 Dec 2023 23:38:03 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCarY-000Hma-27;
	Mon, 11 Dec 2023 07:38:00 +0000
Date: Mon, 11 Dec 2023 15:37:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/bcachefs/extents.c:273:28: sparse: sparse: invalid access past
 the end of 'lp' (60 64)
Message-ID: <202312111518.qliINogN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/bcachefs/extents.c:273:28: sparse: sparse: invalid access past the end of 'lp' (60 64)"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kent Overstreet <kmo@daterainc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a39b6ac3781d46ba18193c9dbb2110f31e9bffe9
commit: c2177e4da332df6fb91b08b874a79051f13897bc bcachefs: Improved extent merging
date:   7 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 7 weeks ago
config: powerpc-randconfig-r113-20231106 (https://download.01.org/0day-ci/archive/20231211/202312111518.qliINogN-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231211/202312111518.qliINogN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312111518.qliINogN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/bcachefs/extents.c: note: in included file (through fs/bcachefs/bcachefs.h):
   fs/bcachefs/bcachefs_format.h:1101:45: sparse: sparse: array of flexible structures
   fs/bcachefs/bcachefs_format.h:1116:42: sparse: sparse: array of flexible structures
   fs/bcachefs/extents.c:502:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] csum @@     got restricted __le32 [usertype] @@
   fs/bcachefs/extents.c:502:34: sparse:     expected unsigned int [usertype] csum
   fs/bcachefs/extents.c:502:34: sparse:     got restricted __le32 [usertype]
   fs/bcachefs/extents.c:507:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] csum_lo @@     got restricted __le64 [addressable] [usertype] lo @@
   fs/bcachefs/extents.c:507:41: sparse:     expected unsigned long long [usertype] csum_lo
   fs/bcachefs/extents.c:507:41: sparse:     got restricted __le64 [addressable] [usertype] lo
   fs/bcachefs/extents.c:508:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] csum_hi:16 @@     got restricted __le16 [usertype] @@
   fs/bcachefs/extents.c:508:41: sparse:     expected unsigned long long [usertype] csum_hi:16
   fs/bcachefs/extents.c:508:41: sparse:     got restricted __le16 [usertype]
   fs/bcachefs/extents.c: note: in included file:
   fs/bcachefs/bcachefs.h:795:9: sparse: sparse: array of flexible structures
   fs/bcachefs/extents.c:212:40: sparse: sparse: mixing different enum types:
   fs/bcachefs/extents.c:212:40: sparse:    unsigned int enum btree_id
   fs/bcachefs/extents.c:212:40: sparse:    unsigned int enum btree_node_type
   fs/bcachefs/extents.c: note: in included file (through fs/bcachefs/super-io.h, fs/bcachefs/checksum.h, fs/bcachefs/btree_io.h):
   fs/bcachefs/extents.h:145:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] csum @@
   fs/bcachefs/extents.h:145:44: sparse:     expected restricted __le32 [usertype]
   fs/bcachefs/extents.h:145:44: sparse:     got unsigned int const [usertype] csum
   fs/bcachefs/extents.h:159:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned long long const [usertype] csum_hi:16 @@
   fs/bcachefs/extents.h:159:44: sparse:     expected restricted __le16 [usertype]
   fs/bcachefs/extents.h:159:44: sparse:     got unsigned long long const [usertype] csum_hi:16
   fs/bcachefs/extents.h:145:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] csum @@
   fs/bcachefs/extents.h:145:44: sparse:     expected restricted __le32 [usertype]
   fs/bcachefs/extents.h:145:44: sparse:     got unsigned int const [usertype] csum
   fs/bcachefs/extents.h:159:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned long long const [usertype] csum_hi:16 @@
   fs/bcachefs/extents.h:159:44: sparse:     expected restricted __le16 [usertype]
   fs/bcachefs/extents.h:159:44: sparse:     got unsigned long long const [usertype] csum_hi:16
   fs/bcachefs/extents.h:145:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] csum @@
   fs/bcachefs/extents.h:145:44: sparse:     expected restricted __le32 [usertype]
   fs/bcachefs/extents.h:145:44: sparse:     got unsigned int const [usertype] csum
   fs/bcachefs/extents.h:159:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned long long const [usertype] csum_hi:16 @@
   fs/bcachefs/extents.h:159:44: sparse:     expected restricted __le16 [usertype]
   fs/bcachefs/extents.h:159:44: sparse:     got unsigned long long const [usertype] csum_hi:16
   fs/bcachefs/extents.h:145:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] csum @@
   fs/bcachefs/extents.h:145:44: sparse:     expected restricted __le32 [usertype]
   fs/bcachefs/extents.h:145:44: sparse:     got unsigned int const [usertype] csum
   fs/bcachefs/extents.h:159:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned long long const [usertype] csum_hi:16 @@
   fs/bcachefs/extents.h:159:44: sparse:     expected restricted __le16 [usertype]
   fs/bcachefs/extents.h:159:44: sparse:     got unsigned long long const [usertype] csum_hi:16
   fs/bcachefs/extents.h:145:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] csum @@
   fs/bcachefs/extents.h:145:44: sparse:     expected restricted __le32 [usertype]
   fs/bcachefs/extents.h:145:44: sparse:     got unsigned int const [usertype] csum
   fs/bcachefs/extents.h:159:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned long long const [usertype] csum_hi:16 @@
   fs/bcachefs/extents.h:159:44: sparse:     expected restricted __le16 [usertype]
   fs/bcachefs/extents.h:159:44: sparse:     got unsigned long long const [usertype] csum_hi:16
   fs/bcachefs/extents.h:145:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] csum @@
   fs/bcachefs/extents.h:145:44: sparse:     expected restricted __le32 [usertype]
   fs/bcachefs/extents.h:145:44: sparse:     got unsigned int const [usertype] csum
   fs/bcachefs/extents.h:159:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned long long const [usertype] csum_hi:16 @@
   fs/bcachefs/extents.h:159:44: sparse:     expected restricted __le16 [usertype]
   fs/bcachefs/extents.h:159:44: sparse:     got unsigned long long const [usertype] csum_hi:16
   fs/bcachefs/extents.h:145:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] csum @@
   fs/bcachefs/extents.h:145:44: sparse:     expected restricted __le32 [usertype]
   fs/bcachefs/extents.h:145:44: sparse:     got unsigned int const [usertype] csum
   fs/bcachefs/extents.h:159:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned long long const [usertype] csum_hi:16 @@
   fs/bcachefs/extents.h:159:44: sparse:     expected restricted __le16 [usertype]
   fs/bcachefs/extents.h:159:44: sparse:     got unsigned long long const [usertype] csum_hi:16
   fs/bcachefs/extents.h:145:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] csum @@
   fs/bcachefs/extents.h:145:44: sparse:     expected restricted __le32 [usertype]
   fs/bcachefs/extents.h:145:44: sparse:     got unsigned int const [usertype] csum
   fs/bcachefs/extents.h:159:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned long long const [usertype] csum_hi:16 @@
   fs/bcachefs/extents.h:159:44: sparse:     expected restricted __le16 [usertype]
   fs/bcachefs/extents.h:159:44: sparse:     got unsigned long long const [usertype] csum_hi:16
>> fs/bcachefs/extents.c:273:28: sparse: sparse: invalid access past the end of 'lp' (60 64)
>> fs/bcachefs/extents.c:273:57: sparse: sparse: invalid access past the end of 'rp' (60 64)
   fs/bcachefs/extents.h:145:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] csum @@
   fs/bcachefs/extents.h:145:44: sparse:     expected restricted __le32 [usertype]
   fs/bcachefs/extents.h:145:44: sparse:     got unsigned int const [usertype] csum
   fs/bcachefs/extents.h:159:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned long long const [usertype] csum_hi:16 @@
   fs/bcachefs/extents.h:159:44: sparse:     expected restricted __le16 [usertype]
   fs/bcachefs/extents.h:159:44: sparse:     got unsigned long long const [usertype] csum_hi:16
   fs/bcachefs/extents.h:145:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] csum @@
   fs/bcachefs/extents.h:145:44: sparse:     expected restricted __le32 [usertype]
   fs/bcachefs/extents.h:145:44: sparse:     got unsigned int const [usertype] csum
   fs/bcachefs/extents.h:159:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned long long const [usertype] csum_hi:16 @@
   fs/bcachefs/extents.h:159:44: sparse:     expected restricted __le16 [usertype]
   fs/bcachefs/extents.h:159:44: sparse:     got unsigned long long const [usertype] csum_hi:16
   fs/bcachefs/extents.h:145:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] csum @@
   fs/bcachefs/extents.h:145:44: sparse:     expected restricted __le32 [usertype]
   fs/bcachefs/extents.h:145:44: sparse:     got unsigned int const [usertype] csum
   fs/bcachefs/extents.h:159:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned long long const [usertype] csum_hi:16 @@
   fs/bcachefs/extents.h:159:44: sparse:     expected restricted __le16 [usertype]
   fs/bcachefs/extents.h:159:44: sparse:     got unsigned long long const [usertype] csum_hi:16
   fs/bcachefs/extents.h:145:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] csum @@
   fs/bcachefs/extents.h:145:44: sparse:     expected restricted __le32 [usertype]
   fs/bcachefs/extents.h:145:44: sparse:     got unsigned int const [usertype] csum
   fs/bcachefs/extents.h:159:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned long long const [usertype] csum_hi:16 @@
   fs/bcachefs/extents.h:159:44: sparse:     expected restricted __le16 [usertype]
   fs/bcachefs/extents.h:159:44: sparse:     got unsigned long long const [usertype] csum_hi:16
   fs/bcachefs/extents.h:145:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] csum @@
   fs/bcachefs/extents.h:145:44: sparse:     expected restricted __le32 [usertype]
   fs/bcachefs/extents.h:145:44: sparse:     got unsigned int const [usertype] csum
   fs/bcachefs/extents.h:159:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned long long const [usertype] csum_hi:16 @@
   fs/bcachefs/extents.h:159:44: sparse:     expected restricted __le16 [usertype]
   fs/bcachefs/extents.h:159:44: sparse:     got unsigned long long const [usertype] csum_hi:16
   fs/bcachefs/extents.h:145:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] csum @@
   fs/bcachefs/extents.h:145:44: sparse:     expected restricted __le32 [usertype]
   fs/bcachefs/extents.h:145:44: sparse:     got unsigned int const [usertype] csum
   fs/bcachefs/extents.h:159:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned long long const [usertype] csum_hi:16 @@
   fs/bcachefs/extents.h:159:44: sparse:     expected restricted __le16 [usertype]
   fs/bcachefs/extents.h:159:44: sparse:     got unsigned long long const [usertype] csum_hi:16
   fs/bcachefs/extents.h:145:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] csum @@
   fs/bcachefs/extents.h:145:44: sparse:     expected restricted __le32 [usertype]
   fs/bcachefs/extents.h:145:44: sparse:     got unsigned int const [usertype] csum
   fs/bcachefs/extents.h:159:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned long long const [usertype] csum_hi:16 @@
   fs/bcachefs/extents.h:159:44: sparse:     expected restricted __le16 [usertype]
   fs/bcachefs/extents.h:159:44: sparse:     got unsigned long long const [usertype] csum_hi:16
   fs/bcachefs/extents.h:145:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] csum @@
   fs/bcachefs/extents.h:145:44: sparse:     expected restricted __le32 [usertype]
   fs/bcachefs/extents.h:145:44: sparse:     got unsigned int const [usertype] csum
   fs/bcachefs/extents.h:159:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned long long const [usertype] csum_hi:16 @@
   fs/bcachefs/extents.h:159:44: sparse:     expected restricted __le16 [usertype]
   fs/bcachefs/extents.h:159:44: sparse:     got unsigned long long const [usertype] csum_hi:16
   fs/bcachefs/extents.h:145:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] csum @@
   fs/bcachefs/extents.h:145:44: sparse:     expected restricted __le32 [usertype]
   fs/bcachefs/extents.h:145:44: sparse:     got unsigned int const [usertype] csum
   fs/bcachefs/extents.h:159:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned long long const [usertype] csum_hi:16 @@
   fs/bcachefs/extents.h:159:44: sparse:     expected restricted __le16 [usertype]
   fs/bcachefs/extents.h:159:44: sparse:     got unsigned long long const [usertype] csum_hi:16
   fs/bcachefs/extents.h:145:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] csum @@
   fs/bcachefs/extents.h:145:44: sparse:     expected restricted __le32 [usertype]
   fs/bcachefs/extents.h:145:44: sparse:     got unsigned int const [usertype] csum
   fs/bcachefs/extents.h:159:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned long long const [usertype] csum_hi:16 @@
   fs/bcachefs/extents.h:159:44: sparse:     expected restricted __le16 [usertype]
   fs/bcachefs/extents.h:159:44: sparse:     got unsigned long long const [usertype] csum_hi:16
   fs/bcachefs/extents.h:145:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] csum @@
   fs/bcachefs/extents.h:145:44: sparse:     expected restricted __le32 [usertype]
   fs/bcachefs/extents.h:145:44: sparse:     got unsigned int const [usertype] csum
   fs/bcachefs/extents.h:159:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned long long const [usertype] csum_hi:16 @@
   fs/bcachefs/extents.h:159:44: sparse:     expected restricted __le16 [usertype]
   fs/bcachefs/extents.h:159:44: sparse:     got unsigned long long const [usertype] csum_hi:16
   fs/bcachefs/extents.h:145:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] csum @@
   fs/bcachefs/extents.h:145:44: sparse:     expected restricted __le32 [usertype]
   fs/bcachefs/extents.h:145:44: sparse:     got unsigned int const [usertype] csum
   fs/bcachefs/extents.h:159:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned long long const [usertype] csum_hi:16 @@
   fs/bcachefs/extents.h:159:44: sparse:     expected restricted __le16 [usertype]
   fs/bcachefs/extents.h:159:44: sparse:     got unsigned long long const [usertype] csum_hi:16
   fs/bcachefs/extents.h:145:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] csum @@
   fs/bcachefs/extents.h:145:44: sparse:     expected restricted __le32 [usertype]
   fs/bcachefs/extents.h:145:44: sparse:     got unsigned int const [usertype] csum
   fs/bcachefs/extents.h:159:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned long long const [usertype] csum_hi:16 @@
   fs/bcachefs/extents.h:159:44: sparse:     expected restricted __le16 [usertype]
   fs/bcachefs/extents.h:159:44: sparse:     got unsigned long long const [usertype] csum_hi:16
   fs/bcachefs/extents.h:145:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] csum @@
   fs/bcachefs/extents.h:145:44: sparse:     expected restricted __le32 [usertype]
   fs/bcachefs/extents.h:145:44: sparse:     got unsigned int const [usertype] csum
   fs/bcachefs/extents.h:159:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned long long const [usertype] csum_hi:16 @@
   fs/bcachefs/extents.h:159:44: sparse:     expected restricted __le16 [usertype]
   fs/bcachefs/extents.h:159:44: sparse:     got unsigned long long const [usertype] csum_hi:16
   fs/bcachefs/extents.c:652:41: sparse: sparse: invalid access past the end of 'p' (60 64)
   fs/bcachefs/extents.c:676:35: sparse: sparse: invalid access past the end of 'p' (60 64)
   fs/bcachefs/extents.h:145:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] csum @@
   fs/bcachefs/extents.h:145:44: sparse:     expected restricted __le32 [usertype]
   fs/bcachefs/extents.h:145:44: sparse:     got unsigned int const [usertype] csum
   fs/bcachefs/extents.h:159:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned long long const [usertype] csum_hi:16 @@
   fs/bcachefs/extents.h:159:44: sparse:     expected restricted __le16 [usertype]
   fs/bcachefs/extents.h:159:44: sparse:     got unsigned long long const [usertype] csum_hi:16
   fs/bcachefs/extents.h:145:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] csum @@
   fs/bcachefs/extents.h:145:44: sparse:     expected restricted __le32 [usertype]
   fs/bcachefs/extents.h:145:44: sparse:     got unsigned int const [usertype] csum
   fs/bcachefs/extents.h:159:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned long long const [usertype] csum_hi:16 @@
   fs/bcachefs/extents.h:159:44: sparse:     expected restricted __le16 [usertype]
   fs/bcachefs/extents.h:159:44: sparse:     got unsigned long long const [usertype] csum_hi:16
   fs/bcachefs/extents.h:145:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] csum @@
   fs/bcachefs/extents.h:145:44: sparse:     expected restricted __le32 [usertype]

vim +/lp +273 fs/bcachefs/extents.c

cd575ddf57af00 Kent Overstreet 2018-11-01  231  
59ba21d99fc7a1 Kent Overstreet 2021-04-28  232  bool bch2_extent_merge(struct bch_fs *c, struct bkey_s _l, struct bkey_s_c _r)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  233  {
4de774952b1296 Kent Overstreet 2019-11-16  234  	struct bkey_s_extent l = bkey_s_to_extent(_l);
59ba21d99fc7a1 Kent Overstreet 2021-04-28  235  	struct bkey_s_c_extent r = bkey_s_c_to_extent(_r);
c2177e4da332df Kent Overstreet 2021-05-15  236  	union bch_extent_entry *en_l;
c2177e4da332df Kent Overstreet 2021-05-15  237  	const union bch_extent_entry *en_r;
c2177e4da332df Kent Overstreet 2021-05-15  238  	struct extent_ptr_decoded lp, rp;
c2177e4da332df Kent Overstreet 2021-05-15  239  	bool use_right_ptr;
c2177e4da332df Kent Overstreet 2021-05-15  240  	struct bch_dev *ca;
a2753581f6c5c0 Kent Overstreet 2018-09-30  241  
4de774952b1296 Kent Overstreet 2019-11-16  242  	if (bkey_val_u64s(l.k) != bkey_val_u64s(r.k))
59ba21d99fc7a1 Kent Overstreet 2021-04-28  243  		return false;
a2753581f6c5c0 Kent Overstreet 2018-09-30  244  
4de774952b1296 Kent Overstreet 2019-11-16  245  	extent_for_each_entry(l, en_l) {
4de774952b1296 Kent Overstreet 2019-11-16  246  		en_r = vstruct_idx(r.v, (u64 *) en_l - l.v->_data);
4de774952b1296 Kent Overstreet 2019-11-16  247  
4de774952b1296 Kent Overstreet 2019-11-16  248  		if (extent_entry_type(en_l) != extent_entry_type(en_r))
59ba21d99fc7a1 Kent Overstreet 2021-04-28  249  			return false;
c2177e4da332df Kent Overstreet 2021-05-15  250  	}
4de774952b1296 Kent Overstreet 2019-11-16  251  
c2177e4da332df Kent Overstreet 2021-05-15  252  	en_l = l.v->start;
c2177e4da332df Kent Overstreet 2021-05-15  253  	en_r = r.v->start;
c2177e4da332df Kent Overstreet 2021-05-15  254  	lp.crc = bch2_extent_crc_unpack(l.k, NULL);
c2177e4da332df Kent Overstreet 2021-05-15  255  	rp.crc = bch2_extent_crc_unpack(r.k, NULL);
c2177e4da332df Kent Overstreet 2021-05-15  256  
c2177e4da332df Kent Overstreet 2021-05-15  257  	while (__bkey_ptr_next_decode(l.k, extent_entry_last(l), lp, en_l) &&
c2177e4da332df Kent Overstreet 2021-05-15  258  	       __bkey_ptr_next_decode(r.k, extent_entry_last(r), rp, en_r)) {
c2177e4da332df Kent Overstreet 2021-05-15  259  		if (lp.ptr.offset + lp.crc.offset + lp.crc.live_size !=
c2177e4da332df Kent Overstreet 2021-05-15  260  		    rp.ptr.offset + rp.crc.offset ||
c2177e4da332df Kent Overstreet 2021-05-15  261  		    lp.ptr.dev			!= rp.ptr.dev ||
c2177e4da332df Kent Overstreet 2021-05-15  262  		    lp.ptr.gen			!= rp.ptr.gen ||
c2177e4da332df Kent Overstreet 2021-05-15  263  		    lp.has_ec			!= rp.has_ec)
59ba21d99fc7a1 Kent Overstreet 2021-04-28  264  			return false;
4de774952b1296 Kent Overstreet 2019-11-16  265  
c2177e4da332df Kent Overstreet 2021-05-15  266  		/* Extents may not straddle buckets: */
c2177e4da332df Kent Overstreet 2021-05-15  267  		ca = bch_dev_bkey_exists(c, lp.ptr.dev);
c2177e4da332df Kent Overstreet 2021-05-15  268  		if (PTR_BUCKET_NR(ca, &lp.ptr) != PTR_BUCKET_NR(ca, &rp.ptr))
59ba21d99fc7a1 Kent Overstreet 2021-04-28  269  			return false;
4de774952b1296 Kent Overstreet 2019-11-16  270  
c2177e4da332df Kent Overstreet 2021-05-15  271  		if (lp.has_ec			!= rp.has_ec ||
c2177e4da332df Kent Overstreet 2021-05-15  272  		    (lp.has_ec &&
c2177e4da332df Kent Overstreet 2021-05-15 @273  		     (lp.ec.block		!= rp.ec.block ||
c2177e4da332df Kent Overstreet 2021-05-15  274  		      lp.ec.redundancy		!= rp.ec.redundancy ||
c2177e4da332df Kent Overstreet 2021-05-15  275  		      lp.ec.idx			!= rp.ec.idx)))
59ba21d99fc7a1 Kent Overstreet 2021-04-28  276  			return false;
4de774952b1296 Kent Overstreet 2019-11-16  277  
c2177e4da332df Kent Overstreet 2021-05-15  278  		if (lp.crc.compression_type	!= rp.crc.compression_type ||
c2177e4da332df Kent Overstreet 2021-05-15  279  		    lp.crc.nonce		!= rp.crc.nonce)
59ba21d99fc7a1 Kent Overstreet 2021-04-28  280  			return false;
4de774952b1296 Kent Overstreet 2019-11-16  281  
c2177e4da332df Kent Overstreet 2021-05-15  282  		if (lp.crc.offset + lp.crc.live_size + rp.crc.live_size <=
c2177e4da332df Kent Overstreet 2021-05-15  283  		    lp.crc.uncompressed_size) {
c2177e4da332df Kent Overstreet 2021-05-15  284  			/* can use left extent's crc entry */
c2177e4da332df Kent Overstreet 2021-05-15  285  		} else if (lp.crc.live_size <= rp.crc.offset ) {
c2177e4da332df Kent Overstreet 2021-05-15  286  			/* can use right extent's crc entry */
c2177e4da332df Kent Overstreet 2021-05-15  287  		} else {
c2177e4da332df Kent Overstreet 2021-05-15  288  			/* check if checksums can be merged: */
c2177e4da332df Kent Overstreet 2021-05-15  289  			if (lp.crc.csum_type		!= rp.crc.csum_type ||
c2177e4da332df Kent Overstreet 2021-05-15  290  			    lp.crc.nonce		!= rp.crc.nonce ||
c2177e4da332df Kent Overstreet 2021-05-15  291  			    crc_is_compressed(lp.crc) ||
c2177e4da332df Kent Overstreet 2021-05-15  292  			    !bch2_checksum_mergeable(lp.crc.csum_type))
59ba21d99fc7a1 Kent Overstreet 2021-04-28  293  				return false;
4de774952b1296 Kent Overstreet 2019-11-16  294  
c2177e4da332df Kent Overstreet 2021-05-15  295  			if (lp.crc.offset + lp.crc.live_size != lp.crc.compressed_size ||
c2177e4da332df Kent Overstreet 2021-05-15  296  			    rp.crc.offset)
59ba21d99fc7a1 Kent Overstreet 2021-04-28  297  				return false;
4de774952b1296 Kent Overstreet 2019-11-16  298  
c2177e4da332df Kent Overstreet 2021-05-15  299  			if (lp.crc.csum_type &&
c2177e4da332df Kent Overstreet 2021-05-15  300  			    lp.crc.uncompressed_size +
c2177e4da332df Kent Overstreet 2021-05-15  301  			    rp.crc.uncompressed_size > c->sb.encoded_extent_max)
59ba21d99fc7a1 Kent Overstreet 2021-04-28  302  				return false;
4de774952b1296 Kent Overstreet 2019-11-16  303  
c2177e4da332df Kent Overstreet 2021-05-15  304  			if (lp.crc.uncompressed_size + rp.crc.uncompressed_size >
4de774952b1296 Kent Overstreet 2019-11-16  305  			    bch2_crc_field_size_max[extent_entry_type(en_l)])
59ba21d99fc7a1 Kent Overstreet 2021-04-28  306  				return false;
4de774952b1296 Kent Overstreet 2019-11-16  307  		}
c2177e4da332df Kent Overstreet 2021-05-15  308  
c2177e4da332df Kent Overstreet 2021-05-15  309  		en_l = extent_entry_next(en_l);
c2177e4da332df Kent Overstreet 2021-05-15  310  		en_r = extent_entry_next(en_r);
a2753581f6c5c0 Kent Overstreet 2018-09-30  311  	}
cd575ddf57af00 Kent Overstreet 2018-11-01  312  
c2177e4da332df Kent Overstreet 2021-05-15  313  	use_right_ptr = false;
4de774952b1296 Kent Overstreet 2019-11-16  314  	extent_for_each_entry(l, en_l) {
4de774952b1296 Kent Overstreet 2019-11-16  315  		struct bch_extent_crc_unpacked crc_l, crc_r;
4de774952b1296 Kent Overstreet 2019-11-16  316  
4de774952b1296 Kent Overstreet 2019-11-16  317  		en_r = vstruct_idx(r.v, (u64 *) en_l - l.v->_data);
4de774952b1296 Kent Overstreet 2019-11-16  318  
c2177e4da332df Kent Overstreet 2021-05-15  319  		if (extent_entry_type(en_l) == BCH_EXTENT_ENTRY_ptr &&
c2177e4da332df Kent Overstreet 2021-05-15  320  		    use_right_ptr)
c2177e4da332df Kent Overstreet 2021-05-15  321  			en_l->ptr = en_r->ptr;
c2177e4da332df Kent Overstreet 2021-05-15  322  
4de774952b1296 Kent Overstreet 2019-11-16  323  		if (!extent_entry_is_crc(en_l))
4de774952b1296 Kent Overstreet 2019-11-16  324  			continue;
4de774952b1296 Kent Overstreet 2019-11-16  325  
c2177e4da332df Kent Overstreet 2021-05-15  326  		use_right_ptr = false;
c2177e4da332df Kent Overstreet 2021-05-15  327  
4de774952b1296 Kent Overstreet 2019-11-16  328  		crc_l = bch2_extent_crc_unpack(l.k, entry_to_crc(en_l));
4de774952b1296 Kent Overstreet 2019-11-16  329  		crc_r = bch2_extent_crc_unpack(r.k, entry_to_crc(en_r));
4de774952b1296 Kent Overstreet 2019-11-16  330  
c2177e4da332df Kent Overstreet 2021-05-15  331  		if (crc_l.offset + crc_l.live_size + crc_r.live_size <=
c2177e4da332df Kent Overstreet 2021-05-15  332  		    crc_l.uncompressed_size) {
c2177e4da332df Kent Overstreet 2021-05-15  333  			/* can use left extent's crc entry */
c2177e4da332df Kent Overstreet 2021-05-15  334  		} else if (crc_l.live_size <= crc_r.offset ) {
c2177e4da332df Kent Overstreet 2021-05-15  335  			/* can use right extent's crc entry */
c2177e4da332df Kent Overstreet 2021-05-15  336  			crc_r.offset -= crc_l.live_size;
c2177e4da332df Kent Overstreet 2021-05-15  337  			bch2_extent_crc_pack(entry_to_crc(en_l), crc_r,
c2177e4da332df Kent Overstreet 2021-05-15  338  					     extent_entry_type(en_l));
c2177e4da332df Kent Overstreet 2021-05-15  339  			use_right_ptr = true;
c2177e4da332df Kent Overstreet 2021-05-15  340  		} else {
4de774952b1296 Kent Overstreet 2019-11-16  341  			crc_l.csum = bch2_checksum_merge(crc_l.csum_type,
4de774952b1296 Kent Overstreet 2019-11-16  342  							 crc_l.csum,
4de774952b1296 Kent Overstreet 2019-11-16  343  							 crc_r.csum,
4de774952b1296 Kent Overstreet 2019-11-16  344  							 crc_r.uncompressed_size << 9);
4de774952b1296 Kent Overstreet 2019-11-16  345  
4de774952b1296 Kent Overstreet 2019-11-16  346  			crc_l.uncompressed_size	+= crc_r.uncompressed_size;
4de774952b1296 Kent Overstreet 2019-11-16  347  			crc_l.compressed_size	+= crc_r.compressed_size;
4de774952b1296 Kent Overstreet 2019-11-16  348  			bch2_extent_crc_pack(entry_to_crc(en_l), crc_l,
4de774952b1296 Kent Overstreet 2019-11-16  349  					     extent_entry_type(en_l));
1c6fdbd8f2465d Kent Overstreet 2017-03-16  350  		}
c2177e4da332df Kent Overstreet 2021-05-15  351  	}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  352  
4de774952b1296 Kent Overstreet 2019-11-16  353  	bch2_key_resize(l.k, l.k->size + r.k->size);
59ba21d99fc7a1 Kent Overstreet 2021-04-28  354  	return true;
4de774952b1296 Kent Overstreet 2019-11-16  355  }
4de774952b1296 Kent Overstreet 2019-11-16  356  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
