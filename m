Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674B36110
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Mar 2023 18:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678905724; x=1710441724;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HuhiX0Ze30F3hxffmL7IHyDy+nxzqnONXIEiIMcog4Q=;
  b=d9KJ1N/xIF+hyBTLeEgEXYjkJGc9WEZNIL00wA1R9+ndvpxZnzAQwjQN
   6QcbNfhxjEBjzwpz3gIZ4W4KZqzaTvmKx2PsvrksP2rsvCI3SomuIRVfi
   57jSwH6ott0Se82R8nEJJ0xKxlLGKm23Q2WGqQmSdFS9Qa2stLGy4b8lC
   CO86FoOZzMosvMZLOzRZumK2KssX22o5Y4jG+eITHXbdVjcPktO1sxqvX
   mkV61eztTBKIE3TxuA2vYM0YfahXFQnDneQZIuBZC5XSfw4MR2EtLhi98
   HKdZj44o8xe17AkjQ4X+9pxdV12+FkaILL5yfdM2PttRPNFZZdXh+53vx
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="337813025"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="337813025"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 11:42:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="629563563"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="629563563"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 15 Mar 2023 11:42:02 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcW4X-0007xD-27;
	Wed, 15 Mar 2023 18:42:01 +0000
Date: Thu, 16 Mar 2023 02:41:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [viro-vfs:work.ufs 3/11] fs/ufs/dir.c:478 ufs_readdir() error:
 uninitialized symbol 'page'.
Message-ID: <202303160214.sN8lsEYv-lkp@intel.com>
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
CC: linux-fsdevel@vger.kernel.org
TO: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
CC: Al Viro <viro@zeniv.linux.org.uk>
CC: Ira Weiny <ira.weiny@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git work.ufs
head:   8cb6e1dc54ab443291f96227e68c4686612be0b2
commit: 390b88821448baf680fb768dbaa6ade0e6a0c9c8 [3/11] fs/ufs: Change the signature of ufs_get_page()
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: ia64-randconfig-m031-20230312 (https://download.01.org/0day-ci/archive/20230316/202303160214.sN8lsEYv-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303160214.sN8lsEYv-lkp@intel.com/

New smatch warnings:
fs/ufs/dir.c:478 ufs_readdir() error: uninitialized symbol 'page'.

Old smatch warnings:
fs/ufs/dir.c:484 ufs_readdir() error: uninitialized symbol 'page'.

vim +/page +478 fs/ufs/dir.c

b71034e5e67d15 Evgeniy Dushistov     2006-06-25  417  
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  418  
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  419  /*
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  420   * This is blatantly stolen from ext2fs
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  421   */
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  422  static int
80886298c07234 Al Viro               2013-05-15  423  ufs_readdir(struct file *file, struct dir_context *ctx)
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  424  {
80886298c07234 Al Viro               2013-05-15  425  	loff_t pos = ctx->pos;
80886298c07234 Al Viro               2013-05-15  426  	struct inode *inode = file_inode(file);
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  427  	struct super_block *sb = inode->i_sb;
09cbfeaf1a5a67 Kirill A. Shutemov    2016-04-01  428  	unsigned int offset = pos & ~PAGE_MASK;
09cbfeaf1a5a67 Kirill A. Shutemov    2016-04-01  429  	unsigned long n = pos >> PAGE_SHIFT;
5d754ced150e39 Fabian Frederick      2015-05-24  430  	unsigned long npages = dir_pages(inode);
f336953bfdee8d Evgeniy Dushistov     2007-02-08  431  	unsigned chunk_mask = ~(UFS_SB(sb)->s_uspi->s_dirblksize - 1);
c472c07bfed9c8 Goffredo Baroncelli   2018-02-01  432  	bool need_revalidate = !inode_eq_iversion(inode, file->f_version);
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  433  	unsigned flags = UFS_SB(sb)->s_flags;
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  434  
abf5d15fd2e525 Evgeniy Dushistov     2006-06-25  435  	UFSD("BEGIN\n");
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  436  
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  437  	if (pos > inode->i_size - UFS_DIR_REC_LEN(1))
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  438  		return 0;
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  439  
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  440  	for ( ; n < npages; n++, offset = 0) {
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  441  		char *kaddr, *limit;
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  442  		struct ufs_dir_entry *de;
390b88821448ba Fabio M. De Francesco 2022-12-29  443  		struct page *page;
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  444  
390b88821448ba Fabio M. De Francesco 2022-12-29  445  		kaddr = ufs_get_page(inode, n, &page);
390b88821448ba Fabio M. De Francesco 2022-12-29  446  		if (IS_ERR(kaddr)) {
9746077a71d01b Harvey Harrison       2008-04-28  447  			ufs_error(sb, __func__,
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  448  				  "bad page in #%lu",
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  449  				  inode->i_ino);
09cbfeaf1a5a67 Kirill A. Shutemov    2016-04-01  450  			ctx->pos += PAGE_SIZE - offset;
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  451  			return -EIO;
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  452  		}
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  453  		if (unlikely(need_revalidate)) {
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  454  			if (offset) {
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  455  				offset = ufs_validate_entry(sb, kaddr, offset, chunk_mask);
09cbfeaf1a5a67 Kirill A. Shutemov    2016-04-01  456  				ctx->pos = (n<<PAGE_SHIFT) + offset;
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  457  			}
bb8c2d66bc6f7d Jeff Layton           2017-12-11  458  			file->f_version = inode_query_iversion(inode);
bb8c2d66bc6f7d Jeff Layton           2017-12-11  459  			need_revalidate = false;
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  460  		}
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  461  		de = (struct ufs_dir_entry *)(kaddr+offset);
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  462  		limit = kaddr + ufs_last_byte(inode, n) - UFS_DIR_REC_LEN(1);
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  463  		for ( ;(char*)de <= limit; de = ufs_next_entry(sb, de)) {
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  464  			if (de->d_ino) {
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  465  				unsigned char d_type = DT_UNKNOWN;
^1da177e4c3f41 Linus Torvalds        2005-04-16  466  
abf5d15fd2e525 Evgeniy Dushistov     2006-06-25  467  				UFSD("filldir(%s,%u)\n", de->d_name,
abf5d15fd2e525 Evgeniy Dushistov     2006-06-25  468  				      fs32_to_cpu(sb, de->d_ino));
abf5d15fd2e525 Evgeniy Dushistov     2006-06-25  469  				UFSD("namlen %u\n", ufs_get_de_namlen(sb, de));
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  470  
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  471  				if ((flags & UFS_DE_MASK) == UFS_DE_44BSD)
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  472  					d_type = de->d_u.d_44.d_type;
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  473  
80886298c07234 Al Viro               2013-05-15  474  				if (!dir_emit(ctx, de->d_name,
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  475  					       ufs_get_de_namlen(sb, de),
80886298c07234 Al Viro               2013-05-15  476  					       fs32_to_cpu(sb, de->d_ino),
80886298c07234 Al Viro               2013-05-15  477  					       d_type)) {
b71034e5e67d15 Evgeniy Dushistov     2006-06-25 @478  					ufs_put_page(page);
^1da177e4c3f41 Linus Torvalds        2005-04-16  479  					return 0;
^1da177e4c3f41 Linus Torvalds        2005-04-16  480  				}
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  481  			}
80886298c07234 Al Viro               2013-05-15  482  			ctx->pos += fs16_to_cpu(sb, de->d_reclen);
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  483  		}
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  484  		ufs_put_page(page);
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  485  	}
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  486  	return 0;
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  487  }
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  488  

:::::: The code at line 478 was first introduced by commit
:::::: b71034e5e67d1577424cebe7bbb7d0ce134a4cd8 [PATCH] ufs: directory and page cache: from blocks to pages

:::::: TO: Evgeniy Dushistov <dushistov@mail.ru>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
