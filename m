Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D75017EB
	for <oe-kbuild@lists.linux.dev>; Sun, 17 Dec 2023 05:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mV8s+G4H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702792231; x=1734328231;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U5afTGI9giVfG9P3Eg3qRMmvScUm0BFuiQHXgOOPz2Y=;
  b=mV8s+G4Hk2qwApHGRchAzRDRfoechS1MQobomzGAqM3GzqiLO0wQRloF
   vtDUtflQ5uId1XYdxEtTTO0X5Ka/AsV0CV2rughQUc9FymHISY0tudpvi
   jJ/YPHcVPYr0cizT+7u+H1VTN1U7Qq/oX6Lq+ICpV+GoWwgneckkKEgX5
   wfXwuBXLkX415ceBCYF0Q3vxRtcVbOiq6mSvaDKK87KJ9nxcP9P+goQij
   HXy7oXVJC4fG7KFpU3rFgQiGPMtf1kWKXZ3u6umIwrdPOYl3jf1gjoi0u
   +U7L85y+2QtgJkVH17AYWnSH2EjLgTxD7NQTgGg+LiSGkHlzXAcHcWvXp
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="398188339"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="398188339"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 21:50:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="16781361"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 16 Dec 2023 21:50:30 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEk2e-0002ia-09;
	Sun, 17 Dec 2023 05:50:26 +0000
Date: Sun, 17 Dec 2023 13:49:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/f2fs/inline.c:681:(.text+0x1584): relocation truncated to fit:
 R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
Message-ID: <202312171320.upoOyOfJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "csky general problem: relocation truncated to fit"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jeff Layton <jlayton@kernel.org>
CC: Christian Brauner <brauner@kernel.org>
CC: Jan Kara <jack@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3b8a9b2e6809d281890dd0a1102dc14d2cd11caf
commit: c62ebd3501cc2c78d4cc28a9b4cbdb17d199c6d6 f2fs: convert to ctime accessor functions
date:   5 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 5 months ago
config: csky-randconfig-r031-20230822 (https://download.01.org/0day-ci/archive/20231217/202312171320.upoOyOfJ-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312171320.upoOyOfJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312171320.upoOyOfJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/f2fs/inline.o: in function `f2fs_delete_inline_entry':
>> fs/f2fs/inline.c:681:(.text+0x1584): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   fs/f2fs/inline.c:688:(.text+0x15a0): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   fs/f2fs/inline.c:689:(.text+0x15ac): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   fs/f2fs/inline.c:691:(.text+0x15b4): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   fs/f2fs/inline.c:692:(.text+0x15be): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   fs/f2fs/inline.c:698:(.text+0x15e0): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   fs/f2fs/inline.c:699:(.text+0x15e8): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   fs/f2fs/inline.c:701:(.text+0x15f0): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   fs/f2fs/inline.c:701:(.text+0x15fe): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   fs/f2fs/inline.c:702:(.text+0x1606): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   fs/f2fs/inline.c:705:(.text+0x1612): additional relocation overflows omitted from the output


vim +681 fs/f2fs/inline.c

201a05be9628ae Chao Yu     2014-09-24  678  
201a05be9628ae Chao Yu     2014-09-24  679  void f2fs_delete_inline_entry(struct f2fs_dir_entry *dentry, struct page *page,
201a05be9628ae Chao Yu     2014-09-24  680  					struct inode *dir, struct inode *inode)
201a05be9628ae Chao Yu     2014-09-24 @681  {
76a9dd85d43b7b Chao Yu     2017-07-16  682  	struct f2fs_dentry_ptr d;
f247037120ecd3 Chao Yu     2017-07-19  683  	void *inline_dentry;
201a05be9628ae Chao Yu     2014-09-24  684  	int slots = GET_DENTRY_SLOTS(le16_to_cpu(dentry->name_len));
201a05be9628ae Chao Yu     2014-09-24  685  	unsigned int bit_pos;
201a05be9628ae Chao Yu     2014-09-24  686  	int i;
201a05be9628ae Chao Yu     2014-09-24  687  
201a05be9628ae Chao Yu     2014-09-24  688  	lock_page(page);
bae0ee7a767cee Chao Yu     2018-12-25  689  	f2fs_wait_on_page_writeback(page, NODE, true, true);
201a05be9628ae Chao Yu     2014-09-24  690  
f247037120ecd3 Chao Yu     2017-07-19  691  	inline_dentry = inline_data_addr(dir, page);
f247037120ecd3 Chao Yu     2017-07-19  692  	make_dentry_ptr_inline(dir, &d, inline_dentry);
76a9dd85d43b7b Chao Yu     2017-07-16  693  
76a9dd85d43b7b Chao Yu     2017-07-16  694  	bit_pos = dentry - d.dentry;
201a05be9628ae Chao Yu     2014-09-24  695  	for (i = 0; i < slots; i++)
76a9dd85d43b7b Chao Yu     2017-07-16  696  		__clear_bit_le(bit_pos + i, d.bitmap);
201a05be9628ae Chao Yu     2014-09-24  697  
201a05be9628ae Chao Yu     2014-09-24  698  	set_page_dirty(page);
9f7c45ccd6d434 Jaegeuk Kim 2016-06-01  699  	f2fs_put_page(page, 1);
201a05be9628ae Chao Yu     2014-09-24  700  
c62ebd3501cc2c Jeff Layton 2023-07-05  701  	dir->i_mtime = inode_set_ctime_current(dir);
7c45729a4d6d1c Jaegeuk Kim 2016-10-14  702  	f2fs_mark_inode_dirty_sync(dir, false);
201a05be9628ae Chao Yu     2014-09-24  703  
201a05be9628ae Chao Yu     2014-09-24  704  	if (inode)
9f7c45ccd6d434 Jaegeuk Kim 2016-06-01  705  		f2fs_drop_nlink(dir, inode);
201a05be9628ae Chao Yu     2014-09-24  706  }
201a05be9628ae Chao Yu     2014-09-24  707  

:::::: The code at line 681 was first introduced by commit
:::::: 201a05be9628ae58efe7638e0c7ae3937ec85273 f2fs: add key function to handle inline dir

:::::: TO: Chao Yu <chao2.yu@samsung.com>
:::::: CC: Jaegeuk Kim <jaegeuk@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
