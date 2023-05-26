Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F462CA9
	for <oe-kbuild@lists.linux.dev>; Fri, 26 May 2023 20:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685134186; x=1716670186;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+yMVHYPiPcd+BLP+9P1cxU4aUow7+EWoF+CP4Wu+6Dc=;
  b=dM4NWHoN9Iv5kD/VZro3wFpqN2ug5XMCBRizYWAOCOexOZJFzQh9GB0u
   bwQprdfKPK4EpiRQB2YG42j+KU88Lbi1lNkcLmq8sv4G1D/2wEGhxJvA0
   pHyQNuhiugg1JGjzAQrqwC5g7GZugi4iL9ANCm6I7jG1taKw7Y2eMflPU
   DoTT76aR4UU/98jSESnpIb3/RUfqpsH6XyQsqTTJTc/fhPx9cjqjHl7CI
   vAUbMzCalkPXahp6bVX6UVNtEclIbcfbMX/VbumDdUJ6D34eHL68ics3i
   dIClnbZZmhjGFf34S1I5A1Y/Ff1lcTPfzB9rRK3RCKNhpwT2WzQZaYia+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="343798368"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; 
   d="scan'208";a="343798368"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 13:49:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="879658330"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; 
   d="scan'208";a="879658330"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 26 May 2023 13:49:44 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2eNb-000Jag-2R;
	Fri, 26 May 2023 20:49:43 +0000
Date: Sat, 27 May 2023 04:49:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/ext2/dir.c:712 ext2_empty_dir() error: uninitialized symbol
 'page'.
Message-ID: <202305270451.OMMpvetR-lkp@intel.com>
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
commit: faa9244f953448926a49022aadeccb8c53c18ae3 ext2_put_page(): accept any pointer within the page
date:   28 hours ago
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: i386-randconfig-m021-20230525 (https://download.01.org/0day-ci/archive/20230527/202305270451.OMMpvetR-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202305270451.OMMpvetR-lkp@intel.com/

New smatch warnings:
fs/ext2/dir.c:712 ext2_empty_dir() error: uninitialized symbol 'page'.

Old smatch warnings:
fs/ext2/dir.c:302 ext2_readdir() error: uninitialized symbol 'page'.
fs/ext2/dir.c:314 ext2_readdir() error: uninitialized symbol 'page'.
fs/ext2/dir.c:320 ext2_readdir() error: uninitialized symbol 'page'.
fs/ext2/dir.c:717 ext2_empty_dir() error: uninitialized symbol 'page'.

vim +/page +712 fs/ext2/dir.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  670  
^1da177e4c3f41 Linus Torvalds  2005-04-16  671  /*
^1da177e4c3f41 Linus Torvalds  2005-04-16  672   * routine to check that the specified directory is empty (for rmdir)
^1da177e4c3f41 Linus Torvalds  2005-04-16  673   */
^1da177e4c3f41 Linus Torvalds  2005-04-16  674  int ext2_empty_dir (struct inode * inode)
^1da177e4c3f41 Linus Torvalds  2005-04-16  675  {
faa9244f953448 Al Viro         2022-12-13  676  	struct page *page;
faa9244f953448 Al Viro         2022-12-13  677  	char *kaddr;
^1da177e4c3f41 Linus Torvalds  2005-04-16  678  	unsigned long i, npages = dir_pages(inode);
^1da177e4c3f41 Linus Torvalds  2005-04-16  679  
^1da177e4c3f41 Linus Torvalds  2005-04-16  680  	for (i = 0; i < npages; i++) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  681  		ext2_dirent *de;
^1da177e4c3f41 Linus Torvalds  2005-04-16  682  
faa9244f953448 Al Viro         2022-12-13  683  		kaddr = ext2_get_page(inode, i, 0, &page);
faa9244f953448 Al Viro         2022-12-13  684  		if (IS_ERR(kaddr))
27e714c007e4ad Al Viro         2022-11-26  685  			return 0;
^1da177e4c3f41 Linus Torvalds  2005-04-16  686  
^1da177e4c3f41 Linus Torvalds  2005-04-16  687  		de = (ext2_dirent *)kaddr;
^1da177e4c3f41 Linus Torvalds  2005-04-16  688  		kaddr += ext2_last_byte(inode, i) - EXT2_DIR_REC_LEN(1);
^1da177e4c3f41 Linus Torvalds  2005-04-16  689  
^1da177e4c3f41 Linus Torvalds  2005-04-16  690  		while ((char *)de <= kaddr) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  691  			if (de->rec_len == 0) {
605afd60ef6dde Harvey Harrison 2008-04-28  692  				ext2_error(inode->i_sb, __func__,
^1da177e4c3f41 Linus Torvalds  2005-04-16  693  					"zero-length directory entry");
^1da177e4c3f41 Linus Torvalds  2005-04-16  694  				printk("kaddr=%p, de=%p\n", kaddr, de);
^1da177e4c3f41 Linus Torvalds  2005-04-16  695  				goto not_empty;
^1da177e4c3f41 Linus Torvalds  2005-04-16  696  			}
^1da177e4c3f41 Linus Torvalds  2005-04-16  697  			if (de->inode != 0) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  698  				/* check for . and .. */
^1da177e4c3f41 Linus Torvalds  2005-04-16  699  				if (de->name[0] != '.')
^1da177e4c3f41 Linus Torvalds  2005-04-16  700  					goto not_empty;
^1da177e4c3f41 Linus Torvalds  2005-04-16  701  				if (de->name_len > 2)
^1da177e4c3f41 Linus Torvalds  2005-04-16  702  					goto not_empty;
^1da177e4c3f41 Linus Torvalds  2005-04-16  703  				if (de->name_len < 2) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  704  					if (de->inode !=
^1da177e4c3f41 Linus Torvalds  2005-04-16  705  					    cpu_to_le32(inode->i_ino))
^1da177e4c3f41 Linus Torvalds  2005-04-16  706  						goto not_empty;
^1da177e4c3f41 Linus Torvalds  2005-04-16  707  				} else if (de->name[1] != '.')
^1da177e4c3f41 Linus Torvalds  2005-04-16  708  					goto not_empty;
^1da177e4c3f41 Linus Torvalds  2005-04-16  709  			}
^1da177e4c3f41 Linus Torvalds  2005-04-16  710  			de = ext2_next_entry(de);
^1da177e4c3f41 Linus Torvalds  2005-04-16  711  		}
faa9244f953448 Al Viro         2022-12-13 @712  		ext2_put_page(page, kaddr);
^1da177e4c3f41 Linus Torvalds  2005-04-16  713  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  714  	return 1;
^1da177e4c3f41 Linus Torvalds  2005-04-16  715  
^1da177e4c3f41 Linus Torvalds  2005-04-16  716  not_empty:
faa9244f953448 Al Viro         2022-12-13  717  	ext2_put_page(page, kaddr);
^1da177e4c3f41 Linus Torvalds  2005-04-16  718  	return 0;
^1da177e4c3f41 Linus Torvalds  2005-04-16  719  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  720  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
