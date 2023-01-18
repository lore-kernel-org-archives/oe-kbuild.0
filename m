Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701322F3A
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Jan 2023 13:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674048299; x=1705584299;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1+zV/ko6slbHpgVplWCzoofyuTV5q6bfAk8E9oh+Waw=;
  b=Nt7r/HF9om8WgJ9yDl4TYhkQ4E74xBbRvATrUt1UI/dU+VJ7GeMNHaCA
   XT07nA6xx5Hxy4K2zm86PiU5hB/haW23xiRNjEE/7Pq4O6hEWRLWyByh4
   BT8ka8nle0eBtSjMA7dJ1yCpMpkQPCoQOE0o653LR65f2yND1fszFlPIc
   GwxdqsEtKc/QazVeMJKxouyeMR+N0yFWNI6OpIZ0aDJpbFrCOxheISdzB
   DAJoniWWdrc3Rneiy3qYPOITTm2xjsMFct00P51+vrq4sxZseqIIYNy1p
   dfpxfgGjbyqHlxC0CAHALohWSx+thWvRjYJsnbvU09i/+0LUJxY13e6VD
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="352228303"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="352228303"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 05:24:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="833580392"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="833580392"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 18 Jan 2023 05:24:47 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pI8Qp-0000Kq-03;
	Wed, 18 Jan 2023 13:24:47 +0000
Date: Wed, 18 Jan 2023 21:23:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/vmwgfx/vmwgfx_msg.c:715:21: warning: unused function
 'mksstat_init_record'
Message-ID: <202301182109.EQrmq5XP-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Martin Krastev <krastevm@vmware.com>
CC: Zack Rusin <zackr@vmware.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c1649ec55708ae42091a2f1bca1ab49ecd722d55
commit: 9f808288ba88ac2a9582118343d4ca7e3d95dd43 drm/vmwgfx: Fix build issues in mksGuestStats discovered by the kernel test robot
date:   1 year, 7 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 1 year, 7 months ago
config: i386-buildonly-randconfig-r003-20230116 (https://download.01.org/0day-ci/archive/20230118/202301182109.EQrmq5XP-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9f808288ba88ac2a9582118343d4ca7e3d95dd43
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 9f808288ba88ac2a9582118343d4ca7e3d95dd43
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/vmwgfx/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/vmwgfx/vmwgfx_msg.c:715:21: warning: unused function 'mksstat_init_record' [-Wunused-function]
   static inline char *mksstat_init_record(mksstat_kern_stats_t stat_idx,
                       ^
   1 warning generated.


vim +/mksstat_init_record +715 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c

7a7a933edd6c3a6 Martin Krastev 2021-06-09  703  
7a7a933edd6c3a6 Martin Krastev 2021-06-09  704  /**
7a7a933edd6c3a6 Martin Krastev 2021-06-09  705   * mksstat_init_record: Initializes an MKSGuestStatCounter-based record
7a7a933edd6c3a6 Martin Krastev 2021-06-09  706   * for the respective mksGuestStat index.
7a7a933edd6c3a6 Martin Krastev 2021-06-09  707   *
7a7a933edd6c3a6 Martin Krastev 2021-06-09  708   * @stat_idx: Index of the MKSGuestStatCounter-based mksGuestStat record.
7a7a933edd6c3a6 Martin Krastev 2021-06-09  709   * @pstat: Pointer to array of MKSGuestStatCounterTime.
7a7a933edd6c3a6 Martin Krastev 2021-06-09  710   * @pinfo: Pointer to array of MKSGuestStatInfoEntry.
7a7a933edd6c3a6 Martin Krastev 2021-06-09  711   * @pstrs: Pointer to current end of the name/description sequence.
7a7a933edd6c3a6 Martin Krastev 2021-06-09  712   * Return: Pointer to the new end of the names/description sequence.
7a7a933edd6c3a6 Martin Krastev 2021-06-09  713   */
7a7a933edd6c3a6 Martin Krastev 2021-06-09  714  
7a7a933edd6c3a6 Martin Krastev 2021-06-09 @715  static inline char *mksstat_init_record(mksstat_kern_stats_t stat_idx,
7a7a933edd6c3a6 Martin Krastev 2021-06-09  716  	MKSGuestStatCounterTime *pstat, MKSGuestStatInfoEntry *pinfo, char *pstrs)
7a7a933edd6c3a6 Martin Krastev 2021-06-09  717  {
7a7a933edd6c3a6 Martin Krastev 2021-06-09  718  	char *const pstrd = pstrs + strlen(mksstat_kern_name_desc[stat_idx][0]) + 1;
7a7a933edd6c3a6 Martin Krastev 2021-06-09  719  	strcpy(pstrs, mksstat_kern_name_desc[stat_idx][0]);
7a7a933edd6c3a6 Martin Krastev 2021-06-09  720  	strcpy(pstrd, mksstat_kern_name_desc[stat_idx][1]);
7a7a933edd6c3a6 Martin Krastev 2021-06-09  721  
7a7a933edd6c3a6 Martin Krastev 2021-06-09  722  	pinfo[stat_idx].name.s = pstrs;
7a7a933edd6c3a6 Martin Krastev 2021-06-09  723  	pinfo[stat_idx].description.s = pstrd;
7a7a933edd6c3a6 Martin Krastev 2021-06-09  724  	pinfo[stat_idx].flags = MKS_GUEST_STAT_FLAG_NONE;
7a7a933edd6c3a6 Martin Krastev 2021-06-09  725  	pinfo[stat_idx].stat.counter = (MKSGuestStatCounter *)&pstat[stat_idx];
7a7a933edd6c3a6 Martin Krastev 2021-06-09  726  
7a7a933edd6c3a6 Martin Krastev 2021-06-09  727  	return pstrd + strlen(mksstat_kern_name_desc[stat_idx][1]) + 1;
7a7a933edd6c3a6 Martin Krastev 2021-06-09  728  }
7a7a933edd6c3a6 Martin Krastev 2021-06-09  729  

:::::: The code at line 715 was first introduced by commit
:::::: 7a7a933edd6c3a6d5d64e08093f2d564104cefcd drm/vmwgfx: Introduce VMware mks-guest-stats

:::::: TO: Martin Krastev <krastevm@vmware.com>
:::::: CC: Zack Rusin <zackr@vmware.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
