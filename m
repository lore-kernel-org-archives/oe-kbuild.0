Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53CA7B
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Mar 2023 13:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678540375; x=1710076375;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L8ZBwl1vzqw7INQkqZxiqBxtjHHkiKfNjxs9H8irM4s=;
  b=cQ3Dm5cR91NoO5PBzocNJ5eYfHbYH0Hc6LrNI3/xjYAE4sTiiEP0eL0R
   eLkj+auSAmDOj8V4UGeALRNcnCOEROFGoMQn/DL77sWdx1iVVwyR7r1Rx
   QFf7o1ItCP/JoV8yEkn8gxlSH+W6RL4Ak1eg8KENGA8sUWN88Vz7+xDEW
   +3SzQdBsMwRQpyTTw0wrILODAFkGkVklzmUckUdiDhnENSTX0ZDrdmFUG
   r/I8VyZPJ2E4+NXEn4Mb+Qt56/W/TyVuPQtdzCpkGttO8CtbnYUY05Hxo
   2qkVMiZFbK9SdJE1jZpDK+VyIZES9aNXD8dHpFqP16wFOUvaSrmXouEwo
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="335601882"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; 
   d="scan'208";a="335601882"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 05:12:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="678148469"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; 
   d="scan'208";a="678148469"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 11 Mar 2023 05:12:52 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paz1n-0004a7-0y;
	Sat, 11 Mar 2023 13:12:51 +0000
Date: Sat, 11 Mar 2023 21:12:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [viro-vfs:work.minix 3/5] fs/minix/dir.c:132 minix_readdir() error:
 uninitialized symbol 'page'.
Message-ID: <202303112143.7AxcSmHl-lkp@intel.com>
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
TO: Al Viro <viro@zeniv.linux.org.uk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git work.minix
head:   3cec5b1ff1d58d58e01e42c3192090d4c4983245
commit: 87b5bea3ff49e45654ed90f99c89751d400e6762 [3/5] minixfs: change the signature of dir_get_page()
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: ia64-randconfig-m041-20230308 (https://download.01.org/0day-ci/archive/20230311/202303112143.7AxcSmHl-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303112143.7AxcSmHl-lkp@intel.com/

New smatch warnings:
fs/minix/dir.c:132 minix_readdir() error: uninitialized symbol 'page'.

Old smatch warnings:
fs/minix/dir.c:138 minix_readdir() error: uninitialized symbol 'page'.

vim +/page +132 fs/minix/dir.c

^1da177e4c3f41 Linus Torvalds     2005-04-16   88  
80886298c07234 Al Viro            2013-05-15   89  static int minix_readdir(struct file *file, struct dir_context *ctx)
^1da177e4c3f41 Linus Torvalds     2005-04-16   90  {
80886298c07234 Al Viro            2013-05-15   91  	struct inode *inode = file_inode(file);
^1da177e4c3f41 Linus Torvalds     2005-04-16   92  	struct super_block *sb = inode->i_sb;
^1da177e4c3f41 Linus Torvalds     2005-04-16   93  	struct minix_sb_info *sbi = minix_sb(sb);
^1da177e4c3f41 Linus Torvalds     2005-04-16   94  	unsigned chunk_size = sbi->s_dirsize;
80886298c07234 Al Viro            2013-05-15   95  	unsigned long npages = dir_pages(inode);
80886298c07234 Al Viro            2013-05-15   96  	unsigned long pos = ctx->pos;
80886298c07234 Al Viro            2013-05-15   97  	unsigned offset;
80886298c07234 Al Viro            2013-05-15   98  	unsigned long n;
^1da177e4c3f41 Linus Torvalds     2005-04-16   99  
642b704cd7a29b Dan Carpenter      2013-06-19  100  	ctx->pos = pos = ALIGN(pos, chunk_size);
^1da177e4c3f41 Linus Torvalds     2005-04-16  101  	if (pos >= inode->i_size)
80886298c07234 Al Viro            2013-05-15  102  		return 0;
80886298c07234 Al Viro            2013-05-15  103  
09cbfeaf1a5a67 Kirill A. Shutemov 2016-04-01  104  	offset = pos & ~PAGE_MASK;
09cbfeaf1a5a67 Kirill A. Shutemov 2016-04-01  105  	n = pos >> PAGE_SHIFT;
^1da177e4c3f41 Linus Torvalds     2005-04-16  106  
^1da177e4c3f41 Linus Torvalds     2005-04-16  107  	for ( ; n < npages; n++, offset = 0) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  108  		char *p, *kaddr, *limit;
87b5bea3ff49e4 Al Viro            2023-03-06  109  		struct page *page;
^1da177e4c3f41 Linus Torvalds     2005-04-16  110  
87b5bea3ff49e4 Al Viro            2023-03-06  111  		kaddr = dir_get_page(inode, n, &page);
87b5bea3ff49e4 Al Viro            2023-03-06  112  		if (IS_ERR(kaddr))
^1da177e4c3f41 Linus Torvalds     2005-04-16  113  			continue;
^1da177e4c3f41 Linus Torvalds     2005-04-16  114  		p = kaddr+offset;
^1da177e4c3f41 Linus Torvalds     2005-04-16  115  		limit = kaddr + minix_last_byte(inode, n) - chunk_size;
^1da177e4c3f41 Linus Torvalds     2005-04-16  116  		for ( ; p <= limit; p = minix_next_entry(p, sbi)) {
80886298c07234 Al Viro            2013-05-15  117  			const char *name;
80886298c07234 Al Viro            2013-05-15  118  			__u32 inumber;
939b00df0306bc Andries Brouwer    2007-02-12  119  			if (sbi->s_version == MINIX_V3) {
939b00df0306bc Andries Brouwer    2007-02-12  120  				minix3_dirent *de3 = (minix3_dirent *)p;
939b00df0306bc Andries Brouwer    2007-02-12  121  				name = de3->name;
939b00df0306bc Andries Brouwer    2007-02-12  122  				inumber = de3->inode;
939b00df0306bc Andries Brouwer    2007-02-12  123  	 		} else {
^1da177e4c3f41 Linus Torvalds     2005-04-16  124  				minix_dirent *de = (minix_dirent *)p;
939b00df0306bc Andries Brouwer    2007-02-12  125  				name = de->name;
939b00df0306bc Andries Brouwer    2007-02-12  126  				inumber = de->inode;
939b00df0306bc Andries Brouwer    2007-02-12  127  			}
939b00df0306bc Andries Brouwer    2007-02-12  128  			if (inumber) {
939b00df0306bc Andries Brouwer    2007-02-12  129  				unsigned l = strnlen(name, sbi->s_namelen);
80886298c07234 Al Viro            2013-05-15  130  				if (!dir_emit(ctx, name, l,
80886298c07234 Al Viro            2013-05-15  131  					      inumber, DT_UNKNOWN)) {
^1da177e4c3f41 Linus Torvalds     2005-04-16 @132  					dir_put_page(page);
80886298c07234 Al Viro            2013-05-15  133  					return 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  134  				}
^1da177e4c3f41 Linus Torvalds     2005-04-16  135  			}
80886298c07234 Al Viro            2013-05-15  136  			ctx->pos += chunk_size;
^1da177e4c3f41 Linus Torvalds     2005-04-16  137  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  138  		dir_put_page(page);
^1da177e4c3f41 Linus Torvalds     2005-04-16  139  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  140  	return 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  141  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  142  

:::::: The code at line 132 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
