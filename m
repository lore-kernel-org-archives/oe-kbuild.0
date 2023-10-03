Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03399365
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Oct 2023 00:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696293970; x=1727829970;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HdmHRrMYK4MTzXSKUpPqT0dBPaV3aW8QA+xcmkOlAyk=;
  b=j1616V8efMLTLADZnWyIy2d1kciX/maNG0wiwJqd000Djx7xuCd8tQIU
   MoA+i3/c+hfHccp/R7IDMVdRMfwB1CKljsPRsH7qZEM0LUt7vezOL3vRK
   2U8WYTwVlbU8h/kBzEZv13Pnwhde73TbjF8sOBv6EtIzL+wAPML0SC18d
   jZExrV2NxedbvziEuzPWtdhYuA7Tv4xn37ykZVmbDkbaLzribeKlKq/Hi
   9o0xpY3isWWYsSkeAnr4MVaVPPokfD3R6xhptZOqqI7Z9U/xGScPOzUp1
   KOf66OWObBKT64pSGdsDXFZotx4lHOQb/CKJ9oyiMAwi9viSblPcOBB+i
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="1356766"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="1356766"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 17:46:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="1081828180"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="1081828180"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 02 Oct 2023 17:46:07 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnTY5-0006aD-1I;
	Tue, 03 Oct 2023 00:46:05 +0000
Date: Tue, 3 Oct 2023 08:45:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 8366/8790] fs/ntfs3/super.c:466:23: sparse:
 sparse: unknown escape sequence: '\%'
Message-ID: <202310030811.AVlq7H1p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/ntfs3/super.c:466:23: sparse: sparse: unknown escape sequence: '\%'"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   df964ce9ef9fea10cf131bf6bad8658fde7956f6
commit: d27e202b9ac416e52093edf8789614d93dbd6231 [8366/8790] fs/ntfs3: Add more info into /proc/fs/ntfs3/<dev>/volinfo
:::::: branch date: 4 days ago
:::::: commit date: 5 days ago
config: i386-randconfig-062-20231003 (https://download.01.org/0day-ci/archive/20231003/202310030811.AVlq7H1p-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231003/202310030811.AVlq7H1p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202310030811.AVlq7H1p-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/ntfs3/super.c:466:23: sparse: sparse: unknown escape sequence: '%'

vim +466 fs/ntfs3/super.c

7832e123490ac3 Konstantin Komarov 2023-05-08  447  
7832e123490ac3 Konstantin Komarov 2023-05-08  448  /*
7832e123490ac3 Konstantin Komarov 2023-05-08  449   * ntfs3_volinfo:
7832e123490ac3 Konstantin Komarov 2023-05-08  450   *
7832e123490ac3 Konstantin Komarov 2023-05-08  451   * The content of /proc/fs/ntfs3/<dev>/volinfo
7832e123490ac3 Konstantin Komarov 2023-05-08  452   *
7832e123490ac3 Konstantin Komarov 2023-05-08  453   * ntfs3.1
7832e123490ac3 Konstantin Komarov 2023-05-08  454   * cluster size
7832e123490ac3 Konstantin Komarov 2023-05-08  455   * number of clusters
d27e202b9ac416 Konstantin Komarov 2023-09-25  456   * total number of mft records
d27e202b9ac416 Konstantin Komarov 2023-09-25  457   * number of used mft records ~= number of files + folders
d27e202b9ac416 Konstantin Komarov 2023-09-25  458   * real state of ntfs "dirty"/"clean"
d27e202b9ac416 Konstantin Komarov 2023-09-25  459   * current state of ntfs "dirty"/"clean"
7832e123490ac3 Konstantin Komarov 2023-05-08  460  */
7832e123490ac3 Konstantin Komarov 2023-05-08  461  static int ntfs3_volinfo(struct seq_file *m, void *o)
7832e123490ac3 Konstantin Komarov 2023-05-08  462  {
7832e123490ac3 Konstantin Komarov 2023-05-08  463  	struct super_block *sb = m->private;
7832e123490ac3 Konstantin Komarov 2023-05-08  464  	struct ntfs_sb_info *sbi = sb->s_fs_info;
7832e123490ac3 Konstantin Komarov 2023-05-08  465  
d27e202b9ac416 Konstantin Komarov 2023-09-25 @466  	seq_printf(m, "ntfs%d.%d\n%u\n%zu\n\%zu\n%zu\n%s\n%s\n",
d27e202b9ac416 Konstantin Komarov 2023-09-25  467  		   sbi->volume.major_ver, sbi->volume.minor_ver,
d27e202b9ac416 Konstantin Komarov 2023-09-25  468  		   sbi->cluster_size, sbi->used.bitmap.nbits,
d27e202b9ac416 Konstantin Komarov 2023-09-25  469  		   sbi->mft.bitmap.nbits,
d27e202b9ac416 Konstantin Komarov 2023-09-25  470  		   sbi->mft.bitmap.nbits - wnd_zeroes(&sbi->mft.bitmap),
d27e202b9ac416 Konstantin Komarov 2023-09-25  471  		   sbi->volume.real_dirty ? "dirty" : "clean",
d27e202b9ac416 Konstantin Komarov 2023-09-25  472  		   (sbi->volume.flags & VOLUME_FLAG_DIRTY) ? "dirty" : "clean");
7832e123490ac3 Konstantin Komarov 2023-05-08  473  
7832e123490ac3 Konstantin Komarov 2023-05-08  474  	return 0;
7832e123490ac3 Konstantin Komarov 2023-05-08  475  }
7832e123490ac3 Konstantin Komarov 2023-05-08  476  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
