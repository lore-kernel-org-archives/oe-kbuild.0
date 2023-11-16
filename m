Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91531C2C0
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Nov 2023 04:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bAEYr7qa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700108685; x=1731644685;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dga7eP7NJA4d6K50L4rTevro5VryT7Alzg8rDSg3lQU=;
  b=bAEYr7qawQ4WAwk0wyTebXrn5UoXCKI3twddUr/bXmzFH/GKuT+Qko/Y
   f15tDSDOWo/ear9DB2IJ/oXzBqEv1VcAEvgetYu5u05UsDevQ6pdWHp5B
   fVBI8fRgcXOeaN+SFDNmapYAc06ELLoRiJQcXaL6a3STCZv5WZ89TFXyi
   X2L/+YOSKVB8iR0ApMipYvAmUQoflen98JATfbYJQRTgJ5qtdcY8nDc0E
   AF3QGENkoaGz6AGaM/XazceyVkejfoONSQbzA0VrvPV2n2ZEAP80T+Ba5
   RF2oE+voUHCC2u1bPBRNiGU0LlsrYSDPsH1uJJCWgRK5R6ZwZxgqUpimh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="12562772"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; 
   d="scan'208";a="12562772"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 20:24:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="908994831"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; 
   d="scan'208";a="908994831"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 15 Nov 2023 20:24:43 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3Tvl-0001Hq-1a;
	Thu, 16 Nov 2023 04:24:41 +0000
Date: Thu, 16 Nov 2023 12:24:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/ntfs3/super.c:466:23: sparse: sparse: unknown escape sequence:
 '\%'
Message-ID: <202311161236.EAcQgGJg-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c
commit: d27e202b9ac416e52093edf8789614d93dbd6231 fs/ntfs3: Add more info into /proc/fs/ntfs3/<dev>/volinfo
date:   7 weeks ago
:::::: branch date: 23 hours ago
:::::: commit date: 7 weeks ago
config: x86_64-randconfig-a012-20230530 (https://download.01.org/0day-ci/archive/20231116/202311161236.EAcQgGJg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311161236.EAcQgGJg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311161236.EAcQgGJg-lkp@intel.com/

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
