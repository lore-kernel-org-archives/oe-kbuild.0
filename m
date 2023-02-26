Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBBF190
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Feb 2023 02:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677379488; x=1708915488;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/1Hrz61fNZ7q5oQprqXOj7FsMaXjsHqqXpNqfMPa8ig=;
  b=VkgEs0rzvOg/7071NKSSA6JvcnGGDveZ2K1ymTvg67zUooyTBs1uNb52
   A11nog4L8Ost6MxumPVCiRzBzsmdX2JCfQmY1Uo0ahrpeUGm2wo8FBHlZ
   EVXgJsI/MsywMHgkU9BUJLjtilzuz0brLswmgcWoKzxqu45S+MZ6oh4eo
   x4L7V+yil5kMf0bti4K352OqtFXQVJtzXa6n35fWbldJDIzWi87V60k8N
   rlBMiwhc2gak3ykz+zuzEnc4+7ClHosenhDmlJrHLs5Iu+uNaL6Ze8kho
   AkpNwGlOG0IngaZkp9nHfto17gwb3aNCuHh+qzs6uDM6r8szq5WCgybpO
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="335151611"
X-IronPort-AV: E=Sophos;i="5.97,328,1669104000"; 
   d="scan'208";a="335151611"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2023 18:44:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="797157866"
X-IronPort-AV: E=Sophos;i="5.97,328,1669104000"; 
   d="scan'208";a="797157866"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 25 Feb 2023 18:44:47 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pW71q-0003Vz-1E;
	Sun, 26 Feb 2023 02:44:46 +0000
Date: Sun, 26 Feb 2023 10:44:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/sysv/dir.c:106 sysv_readdir() error: uninitialized symbol 'page'.
Message-ID: <202302261037.EI7SKoxF-lkp@intel.com>
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
TO: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
CC: Al Viro <viro@zeniv.linux.org.uk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1ec35eadc3b448c91a6b763371a7073444e95f9d
commit: 8dd6c7b2944ce349f06db763d7a2a90a0b83ba0d fs/sysv: Change the signature of dir_get_page()
date:   5 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 5 weeks ago
config: powerpc-randconfig-m031-20230226 (https://download.01.org/0day-ci/archive/20230226/202302261037.EI7SKoxF-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302261037.EI7SKoxF-lkp@intel.com/

New smatch warnings:
fs/sysv/dir.c:106 sysv_readdir() error: uninitialized symbol 'page'.

Old smatch warnings:
fs/sysv/dir.c:110 sysv_readdir() error: uninitialized symbol 'page'.

vim +/page +106 fs/sysv/dir.c

^1da177e4c3f41 Linus Torvalds        2005-04-16   70  
80886298c07234 Al Viro               2013-05-15   71  static int sysv_readdir(struct file *file, struct dir_context *ctx)
^1da177e4c3f41 Linus Torvalds        2005-04-16   72  {
80886298c07234 Al Viro               2013-05-15   73  	unsigned long pos = ctx->pos;
80886298c07234 Al Viro               2013-05-15   74  	struct inode *inode = file_inode(file);
^1da177e4c3f41 Linus Torvalds        2005-04-16   75  	struct super_block *sb = inode->i_sb;
^1da177e4c3f41 Linus Torvalds        2005-04-16   76  	unsigned long npages = dir_pages(inode);
80886298c07234 Al Viro               2013-05-15   77  	unsigned offset;
80886298c07234 Al Viro               2013-05-15   78  	unsigned long n;
^1da177e4c3f41 Linus Torvalds        2005-04-16   79  
80886298c07234 Al Viro               2013-05-15   80  	ctx->pos = pos = (pos + SYSV_DIRSIZE-1) & ~(SYSV_DIRSIZE-1);
^1da177e4c3f41 Linus Torvalds        2005-04-16   81  	if (pos >= inode->i_size)
80886298c07234 Al Viro               2013-05-15   82  		return 0;
80886298c07234 Al Viro               2013-05-15   83  
09cbfeaf1a5a67 Kirill A. Shutemov    2016-04-01   84  	offset = pos & ~PAGE_MASK;
09cbfeaf1a5a67 Kirill A. Shutemov    2016-04-01   85  	n = pos >> PAGE_SHIFT;
^1da177e4c3f41 Linus Torvalds        2005-04-16   86  
^1da177e4c3f41 Linus Torvalds        2005-04-16   87  	for ( ; n < npages; n++, offset = 0) {
^1da177e4c3f41 Linus Torvalds        2005-04-16   88  		char *kaddr, *limit;
^1da177e4c3f41 Linus Torvalds        2005-04-16   89  		struct sysv_dir_entry *de;
8dd6c7b2944ce3 Fabio M. De Francesco 2023-01-19   90  		struct page *page;
^1da177e4c3f41 Linus Torvalds        2005-04-16   91  
8dd6c7b2944ce3 Fabio M. De Francesco 2023-01-19   92  		kaddr = dir_get_page(inode, n, &page);
8dd6c7b2944ce3 Fabio M. De Francesco 2023-01-19   93  		if (IS_ERR(kaddr))
^1da177e4c3f41 Linus Torvalds        2005-04-16   94  			continue;
^1da177e4c3f41 Linus Torvalds        2005-04-16   95  		de = (struct sysv_dir_entry *)(kaddr+offset);
09cbfeaf1a5a67 Kirill A. Shutemov    2016-04-01   96  		limit = kaddr + PAGE_SIZE - SYSV_DIRSIZE;
80886298c07234 Al Viro               2013-05-15   97  		for ( ;(char*)de <= limit; de++, ctx->pos += sizeof(*de)) {
^1da177e4c3f41 Linus Torvalds        2005-04-16   98  			char *name = de->name;
^1da177e4c3f41 Linus Torvalds        2005-04-16   99  
^1da177e4c3f41 Linus Torvalds        2005-04-16  100  			if (!de->inode)
^1da177e4c3f41 Linus Torvalds        2005-04-16  101  				continue;
^1da177e4c3f41 Linus Torvalds        2005-04-16  102  
80886298c07234 Al Viro               2013-05-15  103  			if (!dir_emit(ctx, name, strnlen(name,SYSV_NAMELEN),
^1da177e4c3f41 Linus Torvalds        2005-04-16  104  					fs16_to_cpu(SYSV_SB(sb), de->inode),
80886298c07234 Al Viro               2013-05-15  105  					DT_UNKNOWN)) {
^1da177e4c3f41 Linus Torvalds        2005-04-16 @106  				dir_put_page(page);
80886298c07234 Al Viro               2013-05-15  107  				return 0;
^1da177e4c3f41 Linus Torvalds        2005-04-16  108  			}
^1da177e4c3f41 Linus Torvalds        2005-04-16  109  		}
^1da177e4c3f41 Linus Torvalds        2005-04-16  110  		dir_put_page(page);
^1da177e4c3f41 Linus Torvalds        2005-04-16  111  	}
^1da177e4c3f41 Linus Torvalds        2005-04-16  112  	return 0;
^1da177e4c3f41 Linus Torvalds        2005-04-16  113  }
^1da177e4c3f41 Linus Torvalds        2005-04-16  114  

:::::: The code at line 106 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
