Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C594B8F58
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Mar 2023 17:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679507335; x=1711043335;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7RmbOw8QTOeEbwQMnYF9MqgCIqfuhIfQwdOGejxv6VQ=;
  b=IdEBwkCH+Lha5dwGOe7IbpPBjXBPpHxr2PFf226ibmzzCl+rLweIu77H
   l6EZvfGs8HLdrRE24DgoQo2KJ82YAOWHMdC/AZbKdeUivWVbDSvJS5s+o
   Rquuxwpo5ZENmbEOekbFe9mqmNdFsNyhSOKRclQjbXYmO8Bimm/cgw014
   ukkavZAUzwx1N+Jl66IrAyplW9OWDu5jKSwCabSC+zkf8ptAT3JRnJxNo
   C+Nvv9JO1zHV76pPnbbx9RSFEOkccER/fbguJ4faWOJ+agXMPW7TbjZ7D
   RigvK4YyxVOsKF7U6Og8RXZAh2PsS7OhngKyzG0y8jxITbBCwc3hg+KSs
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="404179178"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; 
   d="scan'208";a="404179178"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 10:48:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="659262229"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; 
   d="scan'208";a="659262229"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 22 Mar 2023 10:48:54 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pf2Zs-000DXa-1J;
	Wed, 22 Mar 2023 17:48:48 +0000
Date: Thu, 23 Mar 2023 01:48:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] fs/buffer: Remove redundant assignment to err
Message-ID: <202303230149.cdrll0qe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/buffer.c:2639:1: sparse: sparse: unused label 'out'"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230322065949.29223-1-jiapeng.chong@linux.alibaba.com>
References: <20230322065949.29223-1-jiapeng.chong@linux.alibaba.com>
TO: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
TO: viro@zeniv.linux.org.uk
CC: brauner@kernel.org
CC: linux-fsdevel@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
CC: Abaci Robot <abaci@linux.alibaba.com>

Hi Jiapeng,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on vfs-idmapping/for-next]
[also build test WARNING on linus/master v6.3-rc3 next-20230322]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiapeng-Chong/fs-buffer-Remove-redundant-assignment-to-err/20230322-150022
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/idmapping.git for-next
patch link:    https://lore.kernel.org/r/20230322065949.29223-1-jiapeng.chong%40linux.alibaba.com
patch subject: [PATCH] fs/buffer: Remove redundant assignment to err
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: csky-randconfig-s051-20230322 (https://download.01.org/0day-ci/archive/20230323/202303230149.cdrll0qe-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/3e00c2b4797c228b1939a15506c9ab807d0fa809
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jiapeng-Chong/fs-buffer-Remove-redundant-assignment-to-err/20230322-150022
        git checkout 3e00c2b4797c228b1939a15506c9ab807d0fa809
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=csky SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303230149.cdrll0qe-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/buffer.c:2639:1: sparse: sparse: unused label 'out'

vim +/out +2639 fs/buffer.c

^1da177e4c3f41 Linus Torvalds     2005-04-16  2572  
^1da177e4c3f41 Linus Torvalds     2005-04-16  2573  int block_truncate_page(struct address_space *mapping,
^1da177e4c3f41 Linus Torvalds     2005-04-16  2574  			loff_t from, get_block_t *get_block)
^1da177e4c3f41 Linus Torvalds     2005-04-16  2575  {
09cbfeaf1a5a67 Kirill A. Shutemov 2016-04-01  2576  	pgoff_t index = from >> PAGE_SHIFT;
09cbfeaf1a5a67 Kirill A. Shutemov 2016-04-01  2577  	unsigned offset = from & (PAGE_SIZE-1);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2578  	unsigned blocksize;
54b21a7992a31d Andrew Morton      2006-01-08  2579  	sector_t iblock;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2580  	unsigned length, pos;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2581  	struct inode *inode = mapping->host;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2582  	struct page *page;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2583  	struct buffer_head *bh;
3e00c2b4797c22 Jiapeng Chong      2023-03-22  2584  	int err = 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2585  
93407472a21b82 Fabian Frederick   2017-02-27  2586  	blocksize = i_blocksize(inode);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2587  	length = offset & (blocksize - 1);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2588  
^1da177e4c3f41 Linus Torvalds     2005-04-16  2589  	/* Block boundary? Nothing to do */
^1da177e4c3f41 Linus Torvalds     2005-04-16  2590  	if (!length)
^1da177e4c3f41 Linus Torvalds     2005-04-16  2591  		return 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2592  
^1da177e4c3f41 Linus Torvalds     2005-04-16  2593  	length = blocksize - length;
09cbfeaf1a5a67 Kirill A. Shutemov 2016-04-01  2594  	iblock = (sector_t)index << (PAGE_SHIFT - inode->i_blkbits);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2595  	
^1da177e4c3f41 Linus Torvalds     2005-04-16  2596  	page = grab_cache_page(mapping, index);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2597  	if (!page)
3e00c2b4797c22 Jiapeng Chong      2023-03-22  2598  		return -ENOMEM;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2599  
^1da177e4c3f41 Linus Torvalds     2005-04-16  2600  	if (!page_has_buffers(page))
^1da177e4c3f41 Linus Torvalds     2005-04-16  2601  		create_empty_buffers(page, blocksize, 0);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2602  
^1da177e4c3f41 Linus Torvalds     2005-04-16  2603  	/* Find the buffer that contains "offset" */
^1da177e4c3f41 Linus Torvalds     2005-04-16  2604  	bh = page_buffers(page);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2605  	pos = blocksize;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2606  	while (offset >= pos) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  2607  		bh = bh->b_this_page;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2608  		iblock++;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2609  		pos += blocksize;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2610  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  2611  
^1da177e4c3f41 Linus Torvalds     2005-04-16  2612  	if (!buffer_mapped(bh)) {
b0cf2321c65991 Badari Pulavarty   2006-03-26  2613  		WARN_ON(bh->b_size != blocksize);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2614  		err = get_block(inode, iblock, bh, 0);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2615  		if (err)
^1da177e4c3f41 Linus Torvalds     2005-04-16  2616  			goto unlock;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2617  		/* unmapped? It's a hole - nothing to do */
^1da177e4c3f41 Linus Torvalds     2005-04-16  2618  		if (!buffer_mapped(bh))
^1da177e4c3f41 Linus Torvalds     2005-04-16  2619  			goto unlock;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2620  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  2621  
^1da177e4c3f41 Linus Torvalds     2005-04-16  2622  	/* Ok, it's mapped. Make sure it's up-to-date */
^1da177e4c3f41 Linus Torvalds     2005-04-16  2623  	if (PageUptodate(page))
^1da177e4c3f41 Linus Torvalds     2005-04-16  2624  		set_buffer_uptodate(bh);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2625  
33a266dda9fbbe David Chinner      2007-02-12  2626  	if (!buffer_uptodate(bh) && !buffer_delay(bh) && !buffer_unwritten(bh)) {
e7ea1129afab0e Zhang Yi           2022-09-01  2627  		err = bh_read(bh, 0);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2628  		/* Uhhuh. Read error. Complain and punt. */
e7ea1129afab0e Zhang Yi           2022-09-01  2629  		if (err < 0)
^1da177e4c3f41 Linus Torvalds     2005-04-16  2630  			goto unlock;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2631  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  2632  
eebd2aa355692a Christoph Lameter  2008-02-04  2633  	zero_user(page, offset, length);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2634  	mark_buffer_dirty(bh);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2635  
^1da177e4c3f41 Linus Torvalds     2005-04-16  2636  unlock:
^1da177e4c3f41 Linus Torvalds     2005-04-16  2637  	unlock_page(page);
09cbfeaf1a5a67 Kirill A. Shutemov 2016-04-01  2638  	put_page(page);
^1da177e4c3f41 Linus Torvalds     2005-04-16 @2639  out:
^1da177e4c3f41 Linus Torvalds     2005-04-16  2640  	return err;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2641  }
1fe72eaa0f46a0 H Hartley Sweeten  2009-09-22  2642  EXPORT_SYMBOL(block_truncate_page);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2643  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
