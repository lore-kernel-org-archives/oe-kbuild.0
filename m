Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5E7650
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Dec 2023 00:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a9Rru8T+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701822608; x=1733358608;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wSnCYFUm1Qx/S6KQNBoI/TsHGVJ9VVdlk2jmJYrBOl0=;
  b=a9Rru8T+6oHBBE8E9o7MQ9GU2LmgFG0gztwRtFLBgFtZYt9FrnitYauk
   Jv8cs5OtX52woH5RHI5OAvCpOsQdY7Fh4CGc8w9mzqqEkRNw8zxLXxG4F
   pt31LpDpn56g2ERZnzcUBaA1wVBQ1eUty3Jtx9ixVSx7S8zN0YO6QTwXW
   +na6zFO0cPwGLmiWa9VKNgZRSfnc6Q7t22l7NmE+ibu+nQmFXQOJH95kH
   anB4Tlx2VZquucTtYzPBnWRnQ2Fp+7DUU38Drr1AI/yFqRqnsN3urrohD
   3SQ+gm+H7FNAbXhLAvRvB1IRVvY+Zumtno/XgT1UxArFQ8uLmYiEA2qm/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="374163845"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="374163845"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 16:30:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="771112939"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="771112939"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 05 Dec 2023 16:30:04 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAfnd-0009xA-2I;
	Wed, 06 Dec 2023 00:30:01 +0000
Date: Wed, 6 Dec 2023 08:29:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>,
	Elena Reshetova <elena.reshetova@intel.com>
Subject: fs/smb/server/oplock.c:169:6-25: WARNING: atomic_dec_and_test
 variation before object free at line 172.
Message-ID: <202312060839.4Tog6nxp-lkp@intel.com>
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
TO: Steve French <stfrench@microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bee0e7762ad2c6025b9f5245c040fcc36ef2bde8
commit: 38c8a9a52082579090e34c033d439ed2cd1a462d smb: move client and server files to common directory fs/smb
date:   7 months ago
:::::: branch date: 27 hours ago
:::::: commit date: 7 months ago
config: um-randconfig-r061-20231202 (https://download.01.org/0day-ci/archive/20231206/202312060839.4Tog6nxp-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312060839.4Tog6nxp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312060839.4Tog6nxp-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/smb/server/oplock.c:169:6-25: WARNING: atomic_dec_and_test variation before object free at line 172.
--
>> fs/smb/server/oplock.c:882:14-15: WARNING opportunity for min()
   fs/smb/server/oplock.c:916:14-15: WARNING opportunity for min()

vim +169 fs/smb/server/oplock.c

e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16  166  
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16  167  void opinfo_put(struct oplock_info *opinfo)
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16  168  {
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16 @169  	if (!atomic_dec_and_test(&opinfo->refcount))
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16  170  		return;
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16  171  
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16 @172  	call_rcu(&opinfo->rcu_head, opinfo_free_rcu);
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16  173  }
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16  174  

:::::: The code at line 169 was first introduced by commit
:::::: e2f34481b24db2fd634b5edb0a5bd0e4d38cc6e9 cifsd: add server-side procedures for SMB3

:::::: TO: Namjae Jeon <namjae.jeon@samsung.com>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
