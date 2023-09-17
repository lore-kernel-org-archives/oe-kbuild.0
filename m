Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FF32594
	for <oe-kbuild@lists.linux.dev>; Sun, 17 Sep 2023 12:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694953655; x=1726489655;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ybc/LPhzPi3hFYJxt5ZOEwGBqIEut/gAYw1jJPG7tRY=;
  b=N9ov6h/tV8wIWBjIYkYR/NAAk+tw5rl4s9nHmx/kM+lCJgQCoOQh3SLZ
   jJGvRpJE9091RpoD4VDNh0kOpElTnXnZhywplwofkHhTt+2kJ7h0EtAwo
   4dIgtNFz7PZHvaudBlIv9TXfd6jJXVwAfeT81U+LmZcoH723WboSkvC0R
   w1ZswAPTs7HHoVQWO/fN5fOJxHubIscCL5NVtQqlR26OXW3pANQlyjg38
   NkF+VTOXX06tQSH0PVikveNuR/plCtOgufnWOG19wvhf+usnpV7GpTWJz
   Vg3V+sDhSvJBnz+5oamGu4DH1LBjdVMW3xXv4TyAluqQ2pS39fOp8rRd/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="410452933"
X-IronPort-AV: E=Sophos;i="6.02,154,1688454000"; 
   d="scan'208";a="410452933"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2023 05:27:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="745528874"
X-IronPort-AV: E=Sophos;i="6.02,154,1688454000"; 
   d="scan'208";a="745528874"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 17 Sep 2023 05:27:32 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhqs6-0005Ce-2R;
	Sun, 17 Sep 2023 12:27:30 +0000
Date: Sun, 17 Sep 2023 20:27:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/exfat/dir.c:874 exfat_get_dentry_set() warn: missing unwind goto?
Message-ID: <202309172025.exj2QAwk-lkp@intel.com>
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
TO: Yuezhang Mo <Yuezhang.Mo@sony.com>
CC: Namjae Jeon <linkinjeon@kernel.org>
CC: Andy Wu <Andy.Wu@sony.com>
CC: Aoyama Wataru <wataru.aoyama@sony.com>
CC: Sungjong Seo <sj1557.seo@samsung.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f0b0d403eabbe135d8dbb40ad5e41018947d336c
commit: 20914ff6dd56dd6b548bf5dd90bff09ef89999e4 exfat: move exfat_entry_set_cache from heap to stack
date:   9 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-161-20230913 (https://download.01.org/0day-ci/archive/20230917/202309172025.exj2QAwk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230917/202309172025.exj2QAwk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309172025.exj2QAwk-lkp@intel.com/

New smatch warnings:
fs/exfat/dir.c:874 exfat_get_dentry_set() warn: missing unwind goto?

Old smatch warnings:
fs/exfat/dir.c:163 exfat_readdir() warn: passing freed memory 'bh'
fs/exfat/dir.c:484 exfat_init_dir_entry() warn: passing freed memory 'bh'
fs/exfat/dir.c:549 exfat_init_ext_entry() warn: passing freed memory 'bh'
fs/exfat/dir.c:558 exfat_init_ext_entry() warn: passing freed memory 'bh'

vim +874 fs/exfat/dir.c

943af1fdacfebe Tetsuhiro Kohada      2020-05-20  802  
ca06197382bde0 Namjae Jeon           2020-03-02  803  /*
ca06197382bde0 Namjae Jeon           2020-03-02  804   * Returns a set of dentries for a file or dir.
ca06197382bde0 Namjae Jeon           2020-03-02  805   *
943af1fdacfebe Tetsuhiro Kohada      2020-05-20  806   * Note It provides a direct pointer to bh->data via exfat_get_dentry_cached().
943af1fdacfebe Tetsuhiro Kohada      2020-05-20  807   * User should call exfat_get_dentry_set() after setting 'modified' to apply
943af1fdacfebe Tetsuhiro Kohada      2020-05-20  808   * changes made in this entry set to the real device.
ca06197382bde0 Namjae Jeon           2020-03-02  809   *
ca06197382bde0 Namjae Jeon           2020-03-02  810   * in:
ca06197382bde0 Namjae Jeon           2020-03-02  811   *   sb+p_dir+entry: indicates a file/dir
ca06197382bde0 Namjae Jeon           2020-03-02  812   *   type:  specifies how many dentries should be included.
ca06197382bde0 Namjae Jeon           2020-03-02  813   * return:
ca06197382bde0 Namjae Jeon           2020-03-02  814   *   pointer of entry set on success,
ca06197382bde0 Namjae Jeon           2020-03-02  815   *   NULL on failure.
ca06197382bde0 Namjae Jeon           2020-03-02  816   */
20914ff6dd56dd Yuezhang Mo           2022-11-17  817  int exfat_get_dentry_set(struct exfat_entry_set_cache *es,
20914ff6dd56dd Yuezhang Mo           2022-11-17  818  		struct super_block *sb, struct exfat_chain *p_dir, int entry,
20914ff6dd56dd Yuezhang Mo           2022-11-17  819  		unsigned int type)
ca06197382bde0 Namjae Jeon           2020-03-02  820  {
943af1fdacfebe Tetsuhiro Kohada      2020-05-20  821  	int ret, i, num_bh;
ca06197382bde0 Namjae Jeon           2020-03-02  822  	unsigned int off, byte_offset, clu = 0;
ca06197382bde0 Namjae Jeon           2020-03-02  823  	sector_t sec;
ca06197382bde0 Namjae Jeon           2020-03-02  824  	struct exfat_sb_info *sbi = EXFAT_SB(sb);
943af1fdacfebe Tetsuhiro Kohada      2020-05-20  825  	struct exfat_dentry *ep;
943af1fdacfebe Tetsuhiro Kohada      2020-05-20  826  	int num_entries;
ca06197382bde0 Namjae Jeon           2020-03-02  827  	enum exfat_validate_dentry_mode mode = ES_MODE_STARTED;
ca06197382bde0 Namjae Jeon           2020-03-02  828  	struct buffer_head *bh;
ca06197382bde0 Namjae Jeon           2020-03-02  829  
ca06197382bde0 Namjae Jeon           2020-03-02  830  	if (p_dir->dir == DIR_DELETED) {
d1727d55c0327e Joe Perches           2020-04-24  831  		exfat_err(sb, "access to deleted dentry");
20914ff6dd56dd Yuezhang Mo           2022-11-17  832  		return -EIO;
ca06197382bde0 Namjae Jeon           2020-03-02  833  	}
ca06197382bde0 Namjae Jeon           2020-03-02  834  
ca06197382bde0 Namjae Jeon           2020-03-02  835  	byte_offset = EXFAT_DEN_TO_B(entry);
ca06197382bde0 Namjae Jeon           2020-03-02  836  	ret = exfat_walk_fat_chain(sb, p_dir, byte_offset, &clu);
ca06197382bde0 Namjae Jeon           2020-03-02  837  	if (ret)
20914ff6dd56dd Yuezhang Mo           2022-11-17  838  		return ret;
ca06197382bde0 Namjae Jeon           2020-03-02  839  
20914ff6dd56dd Yuezhang Mo           2022-11-17  840  	memset(es, 0, sizeof(*es));
943af1fdacfebe Tetsuhiro Kohada      2020-05-20  841  	es->sb = sb;
943af1fdacfebe Tetsuhiro Kohada      2020-05-20  842  	es->modified = false;
943af1fdacfebe Tetsuhiro Kohada      2020-05-20  843  
ca06197382bde0 Namjae Jeon           2020-03-02  844  	/* byte offset in cluster */
ca06197382bde0 Namjae Jeon           2020-03-02  845  	byte_offset = EXFAT_CLU_OFFSET(byte_offset, sbi);
ca06197382bde0 Namjae Jeon           2020-03-02  846  
ca06197382bde0 Namjae Jeon           2020-03-02  847  	/* byte offset in sector */
ca06197382bde0 Namjae Jeon           2020-03-02  848  	off = EXFAT_BLK_OFFSET(byte_offset, sb);
943af1fdacfebe Tetsuhiro Kohada      2020-05-20  849  	es->start_off = off;
a3ff29a95fde16 Yuezhang Mo           2022-11-09  850  	es->bh = es->__bh;
ca06197382bde0 Namjae Jeon           2020-03-02  851  
ca06197382bde0 Namjae Jeon           2020-03-02  852  	/* sector offset in cluster */
ca06197382bde0 Namjae Jeon           2020-03-02  853  	sec = EXFAT_B_TO_BLK(byte_offset, sb);
ca06197382bde0 Namjae Jeon           2020-03-02  854  	sec += exfat_cluster_to_sector(sbi, clu);
ca06197382bde0 Namjae Jeon           2020-03-02  855  
ca06197382bde0 Namjae Jeon           2020-03-02  856  	bh = sb_bread(sb, sec);
ca06197382bde0 Namjae Jeon           2020-03-02  857  	if (!bh)
20914ff6dd56dd Yuezhang Mo           2022-11-17  858  		return -EIO;
943af1fdacfebe Tetsuhiro Kohada      2020-05-20  859  	es->bh[es->num_bh++] = bh;
ca06197382bde0 Namjae Jeon           2020-03-02  860  
943af1fdacfebe Tetsuhiro Kohada      2020-05-20  861  	ep = exfat_get_dentry_cached(es, 0);
943af1fdacfebe Tetsuhiro Kohada      2020-05-20  862  	if (!exfat_validate_entry(exfat_get_entry_type(ep), &mode))
943af1fdacfebe Tetsuhiro Kohada      2020-05-20  863  		goto free_es;
ca06197382bde0 Namjae Jeon           2020-03-02  864  
ca06197382bde0 Namjae Jeon           2020-03-02  865  	num_entries = type == ES_ALL_ENTRIES ?
ca06197382bde0 Namjae Jeon           2020-03-02  866  		ep->dentry.file.num_ext + 1 : type;
ca06197382bde0 Namjae Jeon           2020-03-02  867  	es->num_entries = num_entries;
ca06197382bde0 Namjae Jeon           2020-03-02  868  
943af1fdacfebe Tetsuhiro Kohada      2020-05-20  869  	num_bh = EXFAT_B_TO_BLK_ROUND_UP(off + num_entries * DENTRY_SIZE, sb);
a3ff29a95fde16 Yuezhang Mo           2022-11-09  870  	if (num_bh > ARRAY_SIZE(es->__bh)) {
a3ff29a95fde16 Yuezhang Mo           2022-11-09  871  		es->bh = kmalloc_array(num_bh, sizeof(*es->bh), GFP_KERNEL);
a3ff29a95fde16 Yuezhang Mo           2022-11-09  872  		if (!es->bh) {
a3ff29a95fde16 Yuezhang Mo           2022-11-09  873  			brelse(bh);
20914ff6dd56dd Yuezhang Mo           2022-11-17 @874  			return -ENOMEM;
a3ff29a95fde16 Yuezhang Mo           2022-11-09  875  		}
a3ff29a95fde16 Yuezhang Mo           2022-11-09  876  		es->bh[0] = bh;
a3ff29a95fde16 Yuezhang Mo           2022-11-09  877  	}
a3ff29a95fde16 Yuezhang Mo           2022-11-09  878  
943af1fdacfebe Tetsuhiro Kohada      2020-05-20  879  	for (i = 1; i < num_bh; i++) {
ca06197382bde0 Namjae Jeon           2020-03-02  880  		/* get the next sector */
ca06197382bde0 Namjae Jeon           2020-03-02  881  		if (exfat_is_last_sector_in_cluster(sbi, sec)) {
943af1fdacfebe Tetsuhiro Kohada      2020-05-20  882  			if (p_dir->flags == ALLOC_NO_FAT_CHAIN)
ca06197382bde0 Namjae Jeon           2020-03-02  883  				clu++;
ca06197382bde0 Namjae Jeon           2020-03-02  884  			else if (exfat_get_next_cluster(sb, &clu))
ca06197382bde0 Namjae Jeon           2020-03-02  885  				goto free_es;
ca06197382bde0 Namjae Jeon           2020-03-02  886  			sec = exfat_cluster_to_sector(sbi, clu);
ca06197382bde0 Namjae Jeon           2020-03-02  887  		} else {
ca06197382bde0 Namjae Jeon           2020-03-02  888  			sec++;
ca06197382bde0 Namjae Jeon           2020-03-02  889  		}
ca06197382bde0 Namjae Jeon           2020-03-02  890  
ca06197382bde0 Namjae Jeon           2020-03-02  891  		bh = sb_bread(sb, sec);
ca06197382bde0 Namjae Jeon           2020-03-02  892  		if (!bh)
ca06197382bde0 Namjae Jeon           2020-03-02  893  			goto free_es;
943af1fdacfebe Tetsuhiro Kohada      2020-05-20  894  		es->bh[es->num_bh++] = bh;
ca06197382bde0 Namjae Jeon           2020-03-02  895  	}
ca06197382bde0 Namjae Jeon           2020-03-02  896  
6fa96cd5ad7a0c Christophe Vu-Brugier 2021-11-02  897  	/* validate cached dentries */
943af1fdacfebe Tetsuhiro Kohada      2020-05-20  898  	for (i = 1; i < num_entries; i++) {
943af1fdacfebe Tetsuhiro Kohada      2020-05-20  899  		ep = exfat_get_dentry_cached(es, i);
943af1fdacfebe Tetsuhiro Kohada      2020-05-20  900  		if (!exfat_validate_entry(exfat_get_entry_type(ep), &mode))
943af1fdacfebe Tetsuhiro Kohada      2020-05-20  901  			goto free_es;
943af1fdacfebe Tetsuhiro Kohada      2020-05-20  902  	}
20914ff6dd56dd Yuezhang Mo           2022-11-17  903  	return 0;
ca06197382bde0 Namjae Jeon           2020-03-02  904  
ca06197382bde0 Namjae Jeon           2020-03-02  905  free_es:
943af1fdacfebe Tetsuhiro Kohada      2020-05-20  906  	exfat_free_dentry_set(es, false);
20914ff6dd56dd Yuezhang Mo           2022-11-17  907  	return -EIO;
ca06197382bde0 Namjae Jeon           2020-03-02  908  }
ca06197382bde0 Namjae Jeon           2020-03-02  909  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
