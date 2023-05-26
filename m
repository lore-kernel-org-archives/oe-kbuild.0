Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B7B742EE
	for <oe-kbuild@lists.linux.dev>; Fri, 26 May 2023 15:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685116237; x=1716652237;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rzKguH/uBSm4ZhhLgu59wjczIPrkhzfJlGWEY4XaKZc=;
  b=GdIc/g7hHdjRpw1vvVuRI1UITgZJvaXN9NAgalSGrKJF5STPtanmbAck
   k+Q1TlCFJDf0BpbJH30E6A7J1Ovyfs1nck7r3CX/YydQv+XrkAv1zyeas
   ofSi41TqDFT10ncRMW4U3GHIHboJYPT4ucePILr3Z+HfDxD0z9PdONeGV
   U0tRnC6qg7iUgX4c6HifWR0wTu4Ocr+0lz7eZS8maC/1+0jw6Fjfauv1s
   o4g8Of3JmDDNAKcqmkE3+DWxte5G9DXtPIX0qkvntEYEphiijElZZo4yM
   9UkK0QNbJgw3QaCSiB8K1GlQMjnaHg16xziDdx0HG/w2SeOMjKRlHLflg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="356613318"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; 
   d="scan'208";a="356613318"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 08:50:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="879579664"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; 
   d="scan'208";a="879579664"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 26 May 2023 08:50:36 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2Zi7-000JR6-1d;
	Fri, 26 May 2023 15:50:35 +0000
Date: Fri, 26 May 2023 23:49:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/ext2/dir.c:302 ext2_readdir() error: uninitialized symbol 'page'.
Message-ID: <202305262332.coAQAS4Z-lkp@intel.com>
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
TO: Al Viro <viro@zeniv.linux.org.uk>
CC: Jan Kara <jack@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git for_next
head:   f9171c63820d87f5c36eefbb3d096b0a4fca7ab9
commit: 34f8a4f29e1046ac3c9c33782349437c199b8f90 ext2_get_page(): saner type
date:   23 hours ago
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: i386-randconfig-m021-20230525 (https://download.01.org/0day-ci/archive/20230526/202305262332.coAQAS4Z-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202305262332.coAQAS4Z-lkp@intel.com/

New smatch warnings:
fs/ext2/dir.c:302 ext2_readdir() error: uninitialized symbol 'page'.

Old smatch warnings:
fs/ext2/dir.c:314 ext2_readdir() error: uninitialized symbol 'page'.
fs/ext2/dir.c:320 ext2_readdir() error: uninitialized symbol 'page'.

vim +/page +302 fs/ext2/dir.c

^1da177e4c3f41 Linus Torvalds      2005-04-16  255  
^1da177e4c3f41 Linus Torvalds      2005-04-16  256  static int
80886298c07234 Al Viro             2013-05-15  257  ext2_readdir(struct file *file, struct dir_context *ctx)
^1da177e4c3f41 Linus Torvalds      2005-04-16  258  {
80886298c07234 Al Viro             2013-05-15  259  	loff_t pos = ctx->pos;
80886298c07234 Al Viro             2013-05-15  260  	struct inode *inode = file_inode(file);
^1da177e4c3f41 Linus Torvalds      2005-04-16  261  	struct super_block *sb = inode->i_sb;
09cbfeaf1a5a67 Kirill A. Shutemov  2016-04-01  262  	unsigned int offset = pos & ~PAGE_MASK;
09cbfeaf1a5a67 Kirill A. Shutemov  2016-04-01  263  	unsigned long n = pos >> PAGE_SHIFT;
^1da177e4c3f41 Linus Torvalds      2005-04-16  264  	unsigned long npages = dir_pages(inode);
^1da177e4c3f41 Linus Torvalds      2005-04-16  265  	unsigned chunk_mask = ~(ext2_chunk_size(inode)-1);
c472c07bfed9c8 Goffredo Baroncelli 2018-02-01  266  	bool need_revalidate = !inode_eq_iversion(inode, file->f_version);
e108921894289d Phillip Potter      2019-01-21  267  	bool has_filetype;
^1da177e4c3f41 Linus Torvalds      2005-04-16  268  
^1da177e4c3f41 Linus Torvalds      2005-04-16  269  	if (pos > inode->i_size - EXT2_DIR_REC_LEN(1))
2d7f2ea9c98985 Al Viro             2006-03-15  270  		return 0;
^1da177e4c3f41 Linus Torvalds      2005-04-16  271  
e108921894289d Phillip Potter      2019-01-21  272  	has_filetype =
e108921894289d Phillip Potter      2019-01-21  273  		EXT2_HAS_INCOMPAT_FEATURE(sb, EXT2_FEATURE_INCOMPAT_FILETYPE);
^1da177e4c3f41 Linus Torvalds      2005-04-16  274  
^1da177e4c3f41 Linus Torvalds      2005-04-16  275  	for ( ; n < npages; n++, offset = 0) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  276  		ext2_dirent *de;
34f8a4f29e1046 Al Viro             2022-12-13  277  		struct page *page;
34f8a4f29e1046 Al Viro             2022-12-13  278  		char *kaddr = ext2_get_page(inode, n, 0, &page);
34f8a4f29e1046 Al Viro             2022-12-13  279  		char *limit;
^1da177e4c3f41 Linus Torvalds      2005-04-16  280  
34f8a4f29e1046 Al Viro             2022-12-13  281  		if (IS_ERR(kaddr)) {
605afd60ef6dde Harvey Harrison     2008-04-28  282  			ext2_error(sb, __func__,
^1da177e4c3f41 Linus Torvalds      2005-04-16  283  				   "bad page in #%lu",
^1da177e4c3f41 Linus Torvalds      2005-04-16  284  				   inode->i_ino);
09cbfeaf1a5a67 Kirill A. Shutemov  2016-04-01  285  			ctx->pos += PAGE_SIZE - offset;
34f8a4f29e1046 Al Viro             2022-12-13  286  			return PTR_ERR(kaddr);
^1da177e4c3f41 Linus Torvalds      2005-04-16  287  		}
2d7f2ea9c98985 Al Viro             2006-03-15  288  		if (unlikely(need_revalidate)) {
2d7f2ea9c98985 Al Viro             2006-03-15  289  			if (offset) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  290  				offset = ext2_validate_entry(kaddr, offset, chunk_mask);
09cbfeaf1a5a67 Kirill A. Shutemov  2016-04-01  291  				ctx->pos = (n<<PAGE_SHIFT) + offset;
2d7f2ea9c98985 Al Viro             2006-03-15  292  			}
e1d747d9b6728c Jeff Layton         2017-12-11  293  			file->f_version = inode_query_iversion(inode);
e1d747d9b6728c Jeff Layton         2017-12-11  294  			need_revalidate = false;
^1da177e4c3f41 Linus Torvalds      2005-04-16  295  		}
^1da177e4c3f41 Linus Torvalds      2005-04-16  296  		de = (ext2_dirent *)(kaddr+offset);
^1da177e4c3f41 Linus Torvalds      2005-04-16  297  		limit = kaddr + ext2_last_byte(inode, n) - EXT2_DIR_REC_LEN(1);
^1da177e4c3f41 Linus Torvalds      2005-04-16  298  		for ( ;(char*)de <= limit; de = ext2_next_entry(de)) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  299  			if (de->rec_len == 0) {
605afd60ef6dde Harvey Harrison     2008-04-28  300  				ext2_error(sb, __func__,
^1da177e4c3f41 Linus Torvalds      2005-04-16  301  					"zero-length directory entry");
782b76d7abdf02 Ira Weiny           2021-03-28 @302  				ext2_put_page(page, kaddr);
2d7f2ea9c98985 Al Viro             2006-03-15  303  				return -EIO;
^1da177e4c3f41 Linus Torvalds      2005-04-16  304  			}
^1da177e4c3f41 Linus Torvalds      2005-04-16  305  			if (de->inode) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  306  				unsigned char d_type = DT_UNKNOWN;
^1da177e4c3f41 Linus Torvalds      2005-04-16  307  
e108921894289d Phillip Potter      2019-01-21  308  				if (has_filetype)
e108921894289d Phillip Potter      2019-01-21  309  					d_type = fs_ftype_to_dtype(de->file_type);
^1da177e4c3f41 Linus Torvalds      2005-04-16  310  
80886298c07234 Al Viro             2013-05-15  311  				if (!dir_emit(ctx, de->name, de->name_len,
80886298c07234 Al Viro             2013-05-15  312  						le32_to_cpu(de->inode),
80886298c07234 Al Viro             2013-05-15  313  						d_type)) {
782b76d7abdf02 Ira Weiny           2021-03-28  314  					ext2_put_page(page, kaddr);
2d7f2ea9c98985 Al Viro             2006-03-15  315  					return 0;
^1da177e4c3f41 Linus Torvalds      2005-04-16  316  				}
^1da177e4c3f41 Linus Torvalds      2005-04-16  317  			}
80886298c07234 Al Viro             2013-05-15  318  			ctx->pos += ext2_rec_len_from_disk(de->rec_len);
^1da177e4c3f41 Linus Torvalds      2005-04-16  319  		}
782b76d7abdf02 Ira Weiny           2021-03-28  320  		ext2_put_page(page, kaddr);
^1da177e4c3f41 Linus Torvalds      2005-04-16  321  	}
2d7f2ea9c98985 Al Viro             2006-03-15  322  	return 0;
^1da177e4c3f41 Linus Torvalds      2005-04-16  323  }
^1da177e4c3f41 Linus Torvalds      2005-04-16  324  

:::::: The code at line 302 was first introduced by commit
:::::: 782b76d7abdf02b12c46ed6f1e9bf715569027f7 fs/ext2: Replace kmap() with kmap_local_page()

:::::: TO: Ira Weiny <ira.weiny@intel.com>
:::::: CC: Jan Kara <jack@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
