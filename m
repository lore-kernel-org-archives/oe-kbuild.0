Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC870BE66
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Dec 2023 02:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BIf0JZpO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702261645; x=1733797645;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/goVtNE3hAfMiVHkIVQCwwWBZHNGgdQrmm2o2gOML6Q=;
  b=BIf0JZpOb8LymyuuFaT2d5MY2p5yr6seAc2yOFIpZ6KTmcCCVc9/jmrp
   E0nZS0I3OxKlNPgE1P12k9wfKzXWQdoQuiCkMcwn8AgoOz26M0cCMyxhg
   UvefrHxF/DSBErVwB24XrdVMEsVNd0OZyKPrADtcRr53CDs4AzutYcaG/
   4RW9Bke8MsYpH0OSHRx7YE7M1kX78uxCHlhkCDlYFVylTElmUg8kZgOBt
   YSX31EZb9en6uzeDctMeuCd0N28KfJaYwVu7evNn4HY5eOz2X3mH+4b1c
   7+PxKSJoaikzWgJx8RBEBSCiZ2fFhkmCHXsE8Z2+VzQUEn5cIddDeCKv2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="374088053"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="374088053"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 18:27:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="801822508"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="801822508"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 10 Dec 2023 18:27:23 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCW0u-000HXW-2c;
	Mon, 11 Dec 2023 02:27:20 +0000
Date: Mon, 11 Dec 2023 10:26:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/bcachefs/extents.c:707:41: sparse: sparse: invalid access past
 the end of 'p' (60 64)
Message-ID: <202312111019.RYUsa49h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/bcachefs/extents.c:707:41: sparse: sparse: invalid access past the end of 'p' (60 64)"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kent Overstreet <kmo@daterainc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a39b6ac3781d46ba18193c9dbb2110f31e9bffe9
commit: 7f4e1d5d0faff0d72e9f6708bf98488d76533846 bcachefs: KEY_TYPE_alloc_v2
date:   7 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 7 weeks ago
config: powerpc-randconfig-r113-20231106 (https://download.01.org/0day-ci/archive/20231211/202312111019.RYUsa49h-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231211/202312111019.RYUsa49h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312111019.RYUsa49h-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
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
>> fs/bcachefs/extents.c:707:41: sparse: sparse: invalid access past the end of 'p' (60 64)
   fs/bcachefs/extents.c:731:35: sparse: sparse: invalid access past the end of 'p' (60 64)
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

vim +/p +707 fs/bcachefs/extents.c

1c6fdbd8f2465d Kent Overstreet 2017-03-16  694  
35a067b42dcfd8 Kent Overstreet 2020-12-14  695  unsigned bch2_bkey_replicas(struct bch_fs *c, struct bkey_s_c k)
35a067b42dcfd8 Kent Overstreet 2020-12-14  696  {
35a067b42dcfd8 Kent Overstreet 2020-12-14  697  	struct bkey_ptrs_c ptrs = bch2_bkey_ptrs_c(k);
35a067b42dcfd8 Kent Overstreet 2020-12-14  698  	const union bch_extent_entry *entry;
35a067b42dcfd8 Kent Overstreet 2020-12-14  699  	struct extent_ptr_decoded p;
35a067b42dcfd8 Kent Overstreet 2020-12-14  700  	unsigned replicas = 0;
35a067b42dcfd8 Kent Overstreet 2020-12-14  701  
35a067b42dcfd8 Kent Overstreet 2020-12-14  702  	bkey_for_each_ptr_decode(k.k, ptrs, p, entry) {
35a067b42dcfd8 Kent Overstreet 2020-12-14  703  		if (p.ptr.cached)
35a067b42dcfd8 Kent Overstreet 2020-12-14  704  			continue;
35a067b42dcfd8 Kent Overstreet 2020-12-14  705  
7f4e1d5d0faff0 Kent Overstreet 2021-01-22  706  		if (p.has_ec)
7f4e1d5d0faff0 Kent Overstreet 2021-01-22 @707  			replicas += p.ec.redundancy;
35a067b42dcfd8 Kent Overstreet 2020-12-14  708  
35a067b42dcfd8 Kent Overstreet 2020-12-14  709  		replicas++;
35a067b42dcfd8 Kent Overstreet 2020-12-14  710  
35a067b42dcfd8 Kent Overstreet 2020-12-14  711  	}
35a067b42dcfd8 Kent Overstreet 2020-12-14  712  
35a067b42dcfd8 Kent Overstreet 2020-12-14  713  	return replicas;
35a067b42dcfd8 Kent Overstreet 2020-12-14  714  }
35a067b42dcfd8 Kent Overstreet 2020-12-14  715  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
