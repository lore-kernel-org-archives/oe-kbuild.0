Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428E4EDB
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Sep 2023 16:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694018802; x=1725554802;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vIIIvllLnQdMHhi/uho7K5UtTHoABCTX9T2z/WjR8FM=;
  b=BSzQGpUUDkTaAGz0CMn/n4xCWX3uMSduZbiMWxsffsBYGI1ctTrJVFk3
   Y5W2Uw/34NaFfOohFedPYDNOHOpIRCDZbHErF8VyzAAoYuefMX3MI1rUJ
   z7x3viSMYqNaM0MR68SzSKWIv5zaQo5Ek6e75dcI4JYKGcNBiqLTs5sM/
   9lJIeMjr39HxplOT5QDZbqD2Cwx8DzV6GgaWMaXEr1+0ukDTsTQfezXHA
   OGGyIh1Jrl7bD51as8Nkkb9uDAv4lKPgUbTjai5je7RglNpugyJq9xib1
   6VBoWIHIR2/C1JQzGBLAWteNVigvu/I8ZQ74r9S6SEYmUZSfoq0kw2wSh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="377031829"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="377031829"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 09:46:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="718328865"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="718328865"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 06 Sep 2023 09:46:39 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdvfp-0000PX-03;
	Wed, 06 Sep 2023 16:46:37 +0000
Date: Thu, 7 Sep 2023 00:46:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 13676/14040] fs/exfat/namei.c:393
 exfat_find_empty_entry() error: uninitialized symbol 'last_clu'.
Message-ID: <202309070030.1NQcyBUv-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Yuezhang Mo <Yuezhang.Mo@sony.com>
CC: Namjae Jeon <linkinjeon@kernel.org>
CC: Andy Wu <Andy.Wu@sony.com>
CC: Aoyama Wataru <wataru.aoyama@sony.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   66d9573193967138cd12e232d4b5bc2b57e0d1ac
commit: c48c235336c8a53227041fa00ea8183e4260d8a8 [13676/14040] exfat: support handle zero-size directory
:::::: branch date: 14 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20230906 (https://download.01.org/0day-ci/archive/20230907/202309070030.1NQcyBUv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230907/202309070030.1NQcyBUv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309070030.1NQcyBUv-lkp@intel.com/

New smatch warnings:
fs/exfat/namei.c:393 exfat_find_empty_entry() error: uninitialized symbol 'last_clu'.

Old smatch warnings:
fs/exfat/namei.c:1061 exfat_rename_file() warn: passing freed memory 'old_bh'
fs/exfat/namei.c:1066 exfat_rename_file() warn: passing freed memory 'new_bh'
fs/exfat/namei.c:1067 exfat_rename_file() warn: passing freed memory 'old_bh'
fs/exfat/namei.c:1142 exfat_move_file() warn: passing freed memory 'mov_bh'
fs/exfat/namei.c:1147 exfat_move_file() warn: passing freed memory 'new_bh'
fs/exfat/namei.c:1148 exfat_move_file() warn: passing freed memory 'mov_bh'

vim +/last_clu +393 fs/exfat/namei.c

5f2aa075070cf5 Namjae Jeon           2020-03-02  323  
5f2aa075070cf5 Namjae Jeon           2020-03-02  324  /* find empty directory entry.
5f2aa075070cf5 Namjae Jeon           2020-03-02  325   * if there isn't any empty slot, expand cluster chain.
5f2aa075070cf5 Namjae Jeon           2020-03-02  326   */
5f2aa075070cf5 Namjae Jeon           2020-03-02  327  static int exfat_find_empty_entry(struct inode *inode,
5f2aa075070cf5 Namjae Jeon           2020-03-02  328  		struct exfat_chain *p_dir, int num_entries)
5f2aa075070cf5 Namjae Jeon           2020-03-02  329  {
5f2aa075070cf5 Namjae Jeon           2020-03-02  330  	int dentry;
5f2aa075070cf5 Namjae Jeon           2020-03-02  331  	unsigned int ret, last_clu;
5f2aa075070cf5 Namjae Jeon           2020-03-02  332  	loff_t size = 0;
5f2aa075070cf5 Namjae Jeon           2020-03-02  333  	struct exfat_chain clu;
5f2aa075070cf5 Namjae Jeon           2020-03-02  334  	struct super_block *sb = inode->i_sb;
5f2aa075070cf5 Namjae Jeon           2020-03-02  335  	struct exfat_sb_info *sbi = EXFAT_SB(sb);
5f2aa075070cf5 Namjae Jeon           2020-03-02  336  	struct exfat_inode_info *ei = EXFAT_I(inode);
5f2aa075070cf5 Namjae Jeon           2020-03-02  337  	struct exfat_hint_femp hint_femp;
5f2aa075070cf5 Namjae Jeon           2020-03-02  338  
5f2aa075070cf5 Namjae Jeon           2020-03-02  339  	hint_femp.eidx = EXFAT_HINT_NONE;
5f2aa075070cf5 Namjae Jeon           2020-03-02  340  
5f2aa075070cf5 Namjae Jeon           2020-03-02  341  	if (ei->hint_femp.eidx != EXFAT_HINT_NONE) {
a7a241686c8f81 Tetsuhiro Kohada      2020-09-11  342  		hint_femp = ei->hint_femp;
5f2aa075070cf5 Namjae Jeon           2020-03-02  343  		ei->hint_femp.eidx = EXFAT_HINT_NONE;
5f2aa075070cf5 Namjae Jeon           2020-03-02  344  	}
5f2aa075070cf5 Namjae Jeon           2020-03-02  345  
5f2aa075070cf5 Namjae Jeon           2020-03-02  346  	while ((dentry = exfat_search_empty_slot(sb, &hint_femp, p_dir,
5f2aa075070cf5 Namjae Jeon           2020-03-02  347  					num_entries)) < 0) {
5f2aa075070cf5 Namjae Jeon           2020-03-02  348  		if (dentry == -EIO)
5f2aa075070cf5 Namjae Jeon           2020-03-02  349  			break;
5f2aa075070cf5 Namjae Jeon           2020-03-02  350  
5f2aa075070cf5 Namjae Jeon           2020-03-02  351  		if (exfat_check_max_dentries(inode))
5f2aa075070cf5 Namjae Jeon           2020-03-02  352  			return -ENOSPC;
5f2aa075070cf5 Namjae Jeon           2020-03-02  353  
c48c235336c8a5 Yuezhang Mo           2023-07-20  354  		/*
c48c235336c8a5 Yuezhang Mo           2023-07-20  355  		 * Allocate new cluster to this directory
c48c235336c8a5 Yuezhang Mo           2023-07-20  356  		 */
c48c235336c8a5 Yuezhang Mo           2023-07-20  357  		if (ei->start_clu != EXFAT_EOF_CLUSTER) {
5f2aa075070cf5 Namjae Jeon           2020-03-02  358  			/* we trust p_dir->size regardless of FAT type */
5f2aa075070cf5 Namjae Jeon           2020-03-02  359  			if (exfat_find_last_cluster(sb, p_dir, &last_clu))
5f2aa075070cf5 Namjae Jeon           2020-03-02  360  				return -EIO;
5f2aa075070cf5 Namjae Jeon           2020-03-02  361  
5f2aa075070cf5 Namjae Jeon           2020-03-02  362  			exfat_chain_set(&clu, last_clu + 1, 0, p_dir->flags);
c48c235336c8a5 Yuezhang Mo           2023-07-20  363  		} else {
c48c235336c8a5 Yuezhang Mo           2023-07-20  364  			/* This directory is empty */
c48c235336c8a5 Yuezhang Mo           2023-07-20  365  			exfat_chain_set(&clu, EXFAT_EOF_CLUSTER, 0,
c48c235336c8a5 Yuezhang Mo           2023-07-20  366  					ALLOC_NO_FAT_CHAIN);
c48c235336c8a5 Yuezhang Mo           2023-07-20  367  		}
5f2aa075070cf5 Namjae Jeon           2020-03-02  368  
5f2aa075070cf5 Namjae Jeon           2020-03-02  369  		/* allocate a cluster */
23befe490ba885 Hyeongseok Kim        2021-03-15  370  		ret = exfat_alloc_cluster(inode, 1, &clu, IS_DIRSYNC(inode));
5f2aa075070cf5 Namjae Jeon           2020-03-02  371  		if (ret)
5f2aa075070cf5 Namjae Jeon           2020-03-02  372  			return ret;
5f2aa075070cf5 Namjae Jeon           2020-03-02  373  
5f2aa075070cf5 Namjae Jeon           2020-03-02  374  		if (exfat_zeroed_cluster(inode, clu.dir))
5f2aa075070cf5 Namjae Jeon           2020-03-02  375  			return -EIO;
5f2aa075070cf5 Namjae Jeon           2020-03-02  376  
c48c235336c8a5 Yuezhang Mo           2023-07-20  377  		if (ei->start_clu == EXFAT_EOF_CLUSTER) {
c48c235336c8a5 Yuezhang Mo           2023-07-20  378  			ei->start_clu = clu.dir;
c48c235336c8a5 Yuezhang Mo           2023-07-20  379  			p_dir->dir = clu.dir;
c48c235336c8a5 Yuezhang Mo           2023-07-20  380  		}
c48c235336c8a5 Yuezhang Mo           2023-07-20  381  
5f2aa075070cf5 Namjae Jeon           2020-03-02  382  		/* append to the FAT chain */
5f2aa075070cf5 Namjae Jeon           2020-03-02  383  		if (clu.flags != p_dir->flags) {
5f2aa075070cf5 Namjae Jeon           2020-03-02  384  			/* no-fat-chain bit is disabled,
5f2aa075070cf5 Namjae Jeon           2020-03-02  385  			 * so fat-chain should be synced with alloc-bitmap
5f2aa075070cf5 Namjae Jeon           2020-03-02  386  			 */
5f2aa075070cf5 Namjae Jeon           2020-03-02  387  			exfat_chain_cont_cluster(sb, p_dir->dir, p_dir->size);
5f2aa075070cf5 Namjae Jeon           2020-03-02  388  			p_dir->flags = ALLOC_FAT_CHAIN;
5f2aa075070cf5 Namjae Jeon           2020-03-02  389  			hint_femp.cur.flags = ALLOC_FAT_CHAIN;
5f2aa075070cf5 Namjae Jeon           2020-03-02  390  		}
5f2aa075070cf5 Namjae Jeon           2020-03-02  391  
5f2aa075070cf5 Namjae Jeon           2020-03-02  392  		if (clu.flags == ALLOC_FAT_CHAIN)
5f2aa075070cf5 Namjae Jeon           2020-03-02 @393  			if (exfat_ent_set(sb, last_clu, clu.dir))
5f2aa075070cf5 Namjae Jeon           2020-03-02  394  				return -EIO;
5f2aa075070cf5 Namjae Jeon           2020-03-02  395  
e298c8a818a3e5 Yuezhang Mo           2022-11-07  396  		if (hint_femp.cur.dir == EXFAT_EOF_CLUSTER)
5f2aa075070cf5 Namjae Jeon           2020-03-02  397  			exfat_chain_set(&hint_femp.cur, clu.dir, 0, clu.flags);
e298c8a818a3e5 Yuezhang Mo           2022-11-07  398  
e298c8a818a3e5 Yuezhang Mo           2022-11-07  399  		hint_femp.count += sbi->dentries_per_clu;
e298c8a818a3e5 Yuezhang Mo           2022-11-07  400  
5f2aa075070cf5 Namjae Jeon           2020-03-02  401  		hint_femp.cur.size++;
5f2aa075070cf5 Namjae Jeon           2020-03-02  402  		p_dir->size++;
5f2aa075070cf5 Namjae Jeon           2020-03-02  403  		size = EXFAT_CLU_TO_B(p_dir->size, sbi);
5f2aa075070cf5 Namjae Jeon           2020-03-02  404  
5f2aa075070cf5 Namjae Jeon           2020-03-02  405  		/* directory inode should be updated in here */
5f2aa075070cf5 Namjae Jeon           2020-03-02  406  		i_size_write(inode, size);
7dee6f57d7f22a Christophe Vu-Brugier 2021-11-02  407  		ei->i_size_ondisk += sbi->cluster_size;
7dee6f57d7f22a Christophe Vu-Brugier 2021-11-02  408  		ei->i_size_aligned += sbi->cluster_size;
7dee6f57d7f22a Christophe Vu-Brugier 2021-11-02  409  		ei->flags = p_dir->flags;
39c1ce8eafc0ff Yuezhang Mo           2023-01-04  410  		inode->i_blocks += sbi->cluster_size >> 9;
5f2aa075070cf5 Namjae Jeon           2020-03-02  411  	}
5f2aa075070cf5 Namjae Jeon           2020-03-02  412  
5f2aa075070cf5 Namjae Jeon           2020-03-02  413  	return dentry;
5f2aa075070cf5 Namjae Jeon           2020-03-02  414  }
5f2aa075070cf5 Namjae Jeon           2020-03-02  415  

:::::: The code at line 393 was first introduced by commit
:::::: 5f2aa075070cf5b2e6aae011d5a3390408d7d913 exfat: add inode operations

:::::: TO: Namjae Jeon <namjae.jeon@samsung.com>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
