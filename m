Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB1015A3
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Jan 2023 01:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674090385; x=1705626385;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U1CkD5o0bmk57+LJTTWe0r5xkhD5fVlWHNe3HFCOFUI=;
  b=WBbjff8CHcU+Tn86BpL8rZo1ovTBoBGOIL++aE/Ts18jpi/gluWoGnPJ
   DJJSXa2UE2PjMNP/dKpqODHmv0ahg3fa5cmNiev4kC2AGv9lQe2SxsGgp
   BHjURoJXYB3EeT9z+B/ddAjSLLVLmVXRwvzeuNHn06SSg1sBWKhxXbQ0e
   WjbdooUgge+opvPtfFmTANR1Ox91Yxtzu2ANqP4p4nuMJsonJfwTyXc9F
   FWWMc0EqyVsp+t/nq/DTCit6zk0qO7It4/QKyU2x97MiesH22r846fddU
   xjVZ4VYDdZjuBuwJc7GRt7q2OAjPePKTtX+XA1Wj8tHEmueRQtwjn/J1B
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="308715828"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="308715828"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 17:06:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="609877314"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="609877314"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 18 Jan 2023 17:06:24 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIJNn-0000vE-1Z;
	Thu, 19 Jan 2023 01:06:23 +0000
Date: Thu, 19 Jan 2023 09:06:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [djwong-xfs:xfile-page-caching 183/266]
 fs/xfs/scrub/rmap_repair.c:401:1: warning: unused function 'is_rt_data_fork'
Message-ID: <202301190857.mZOaqPRE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "gcc: unused function warning for stub function"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git xfile-page-caching
head:   5ac6d5f53f18d0486ac3713be490eb8c186ff344
commit: ae88821b64c221d8f790cf93e60e28217fc4a03b [183/266] xfs: repair the rmapbt
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: x86_64-randconfig-a003 (https://download.01.org/0day-ci/archive/20230119/202301190857.mZOaqPRE-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/commit/?id=ae88821b64c221d8f790cf93e60e28217fc4a03b
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs xfile-page-caching
        git checkout ae88821b64c221d8f790cf93e60e28217fc4a03b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/xfs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/xfs/scrub/rmap_repair.c:401:1: warning: unused function 'is_rt_data_fork' [-Wunused-function]
   is_rt_data_fork(
   ^
   1 warning generated.


vim +/is_rt_data_fork +401 fs/xfs/scrub/rmap_repair.c

ae88821b64c221 Darrick J. Wong 2022-07-14  399  
ae88821b64c221 Darrick J. Wong 2022-07-14  400  static inline bool
ae88821b64c221 Darrick J. Wong 2022-07-14 @401  is_rt_data_fork(
ae88821b64c221 Darrick J. Wong 2022-07-14  402  	struct xfs_inode	*ip,
ae88821b64c221 Darrick J. Wong 2022-07-14  403  	int			whichfork)
ae88821b64c221 Darrick J. Wong 2022-07-14  404  {
ae88821b64c221 Darrick J. Wong 2022-07-14  405  	return XFS_IS_REALTIME_INODE(ip) && whichfork == XFS_DATA_FORK;
ae88821b64c221 Darrick J. Wong 2022-07-14  406  }
ae88821b64c221 Darrick J. Wong 2022-07-14  407  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
