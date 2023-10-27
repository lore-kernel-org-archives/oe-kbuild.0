Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286643D90
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Oct 2023 03:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KloAX4/s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698378486; x=1729914486;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EL3PYS9DCYdptscBzBVJRnH6JbFCY9+o5BHCx94u8CQ=;
  b=KloAX4/sSywWIq7ajppqidvXpsN4y1zzhrr1LMP/dkGBO3YJe7jY918B
   ZezdIUJBflFYsxI9lUq/rsDGqUyXUTd/ZYjtm0DaRUHi9+pKBf6WB/+zD
   D1rf8rgSpLsyOVLYKIvsXTd4Z+Dsq4gukxFMCytFw6mGc7HpZQMx8bNMm
   TAyRklr0HSnF0UMQeyq3oA7kp7oWVoyzoVRlZh5xhMVWfTaIC0AXKQIPh
   0coNZVVbYFDqw1jXpoYb01KQMlwWR+67QYZjkwXXW4GTtPFw7KS8QhwZs
   nSySWm+kI+LsdKz7MQqxNyjAJgvcNUqgt7A873/Pmq3wHUhch7+VlvoxL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="367048210"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="367048210"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 20:48:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="883064257"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="883064257"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 26 Oct 2023 20:48:03 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwDpI-000APD-0d;
	Fri, 27 Oct 2023 03:48:00 +0000
Date: Fri, 27 Oct 2023 11:47:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] jfs: fix slab-out-of-bounds Read in dtSearch
Message-ID: <202310271151.oY2S3sDA-lkp@intel.com>
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
In-Reply-To: <20231016171130.15952-1-ghandatmanas@gmail.com>
References: <20231016171130.15952-1-ghandatmanas@gmail.com>
TO: Manas Ghandat <ghandatmanas@gmail.com>
TO: dave.kleikamp@oracle.com
TO: shaggy@kernel.org
CC: Manas Ghandat <ghandatmanas@gmail.com>
CC: Linux-kernel-mentees@lists.linuxfoundation.org
CC: jfs-discussion@lists.sourceforge.net
CC: linux-kernel@vger.kernel.org
CC: syzbot+9924e2a08d9ba0fd4ce2@syzkaller.appspotmail.com

Hi Manas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kleikamp-shaggy/jfs-next]
[also build test WARNING on linus/master v6.6-rc7 next-20231026]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Manas-Ghandat/jfs-fix-slab-out-of-bounds-Read-in-dtSearch/20231017-152500
base:   https://github.com/kleikamp/linux-shaggy jfs-next
patch link:    https://lore.kernel.org/r/20231016171130.15952-1-ghandatmanas%40gmail.com
patch subject: [PATCH] jfs: fix slab-out-of-bounds Read in dtSearch
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: i386-randconfig-141-20231022 (https://download.01.org/0day-ci/archive/20231027/202310271151.oY2S3sDA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231027/202310271151.oY2S3sDA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310271151.oY2S3sDA-lkp@intel.com/

smatch warnings:
fs/jfs/jfs_dtree.c:636 dtSearch() warn: impossible condition '(stbl[index] > 128) => ((-128)-127 > 128)'

vim +636 fs/jfs/jfs_dtree.c

^1da177e4c3f41 Linus Torvalds   2005-04-16  555  
^1da177e4c3f41 Linus Torvalds   2005-04-16  556  /*
^1da177e4c3f41 Linus Torvalds   2005-04-16  557   *	dtSearch()
^1da177e4c3f41 Linus Torvalds   2005-04-16  558   *
^1da177e4c3f41 Linus Torvalds   2005-04-16  559   * function:
^1da177e4c3f41 Linus Torvalds   2005-04-16  560   *	Search for the entry with specified key
^1da177e4c3f41 Linus Torvalds   2005-04-16  561   *
^1da177e4c3f41 Linus Torvalds   2005-04-16  562   * parameter:
^1da177e4c3f41 Linus Torvalds   2005-04-16  563   *
^1da177e4c3f41 Linus Torvalds   2005-04-16  564   * return: 0 - search result on stack, leaf page pinned;
^1da177e4c3f41 Linus Torvalds   2005-04-16  565   *	   errno - I/O error
^1da177e4c3f41 Linus Torvalds   2005-04-16  566   */
^1da177e4c3f41 Linus Torvalds   2005-04-16  567  int dtSearch(struct inode *ip, struct component_name * key, ino_t * data,
^1da177e4c3f41 Linus Torvalds   2005-04-16  568  	     struct btstack * btstack, int flag)
^1da177e4c3f41 Linus Torvalds   2005-04-16  569  {
^1da177e4c3f41 Linus Torvalds   2005-04-16  570  	int rc = 0;
^1da177e4c3f41 Linus Torvalds   2005-04-16  571  	int cmp = 1;		/* init for empty page */
^1da177e4c3f41 Linus Torvalds   2005-04-16  572  	s64 bn;
^1da177e4c3f41 Linus Torvalds   2005-04-16  573  	struct metapage *mp;
^1da177e4c3f41 Linus Torvalds   2005-04-16  574  	dtpage_t *p;
^1da177e4c3f41 Linus Torvalds   2005-04-16  575  	s8 *stbl;
^1da177e4c3f41 Linus Torvalds   2005-04-16  576  	int base, index, lim;
^1da177e4c3f41 Linus Torvalds   2005-04-16  577  	struct btframe *btsp;
^1da177e4c3f41 Linus Torvalds   2005-04-16  578  	pxd_t *pxd;
^1da177e4c3f41 Linus Torvalds   2005-04-16  579  	int psize = 288;	/* initial in-line directory */
^1da177e4c3f41 Linus Torvalds   2005-04-16  580  	ino_t inumber;
^1da177e4c3f41 Linus Torvalds   2005-04-16  581  	struct component_name ciKey;
^1da177e4c3f41 Linus Torvalds   2005-04-16  582  	struct super_block *sb = ip->i_sb;
^1da177e4c3f41 Linus Torvalds   2005-04-16  583  
6da2ec56059c3c Kees Cook        2018-06-12  584  	ciKey.name = kmalloc_array(JFS_NAME_MAX + 1, sizeof(wchar_t),
6da2ec56059c3c Kees Cook        2018-06-12  585  				   GFP_NOFS);
09aaa749f637b1 Joe Perches      2007-11-13  586  	if (!ciKey.name) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  587  		rc = -ENOMEM;
^1da177e4c3f41 Linus Torvalds   2005-04-16  588  		goto dtSearch_Exit2;
^1da177e4c3f41 Linus Torvalds   2005-04-16  589  	}
^1da177e4c3f41 Linus Torvalds   2005-04-16  590  
^1da177e4c3f41 Linus Torvalds   2005-04-16  591  
^1da177e4c3f41 Linus Torvalds   2005-04-16  592  	/* uppercase search key for c-i directory */
^1da177e4c3f41 Linus Torvalds   2005-04-16  593  	UniStrcpy(ciKey.name, key->name);
^1da177e4c3f41 Linus Torvalds   2005-04-16  594  	ciKey.namlen = key->namlen;
^1da177e4c3f41 Linus Torvalds   2005-04-16  595  
^1da177e4c3f41 Linus Torvalds   2005-04-16  596  	/* only uppercase if case-insensitive support is on */
^1da177e4c3f41 Linus Torvalds   2005-04-16  597  	if ((JFS_SBI(sb)->mntflag & JFS_OS2) == JFS_OS2) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  598  		ciToUpper(&ciKey);
^1da177e4c3f41 Linus Torvalds   2005-04-16  599  	}
^1da177e4c3f41 Linus Torvalds   2005-04-16  600  	BT_CLR(btstack);	/* reset stack */
^1da177e4c3f41 Linus Torvalds   2005-04-16  601  
^1da177e4c3f41 Linus Torvalds   2005-04-16  602  	/* init level count for max pages to split */
^1da177e4c3f41 Linus Torvalds   2005-04-16  603  	btstack->nsplit = 1;
^1da177e4c3f41 Linus Torvalds   2005-04-16  604  
^1da177e4c3f41 Linus Torvalds   2005-04-16  605  	/*
^1da177e4c3f41 Linus Torvalds   2005-04-16  606  	 *	search down tree from root:
^1da177e4c3f41 Linus Torvalds   2005-04-16  607  	 *
^1da177e4c3f41 Linus Torvalds   2005-04-16  608  	 * between two consecutive entries of <Ki, Pi> and <Kj, Pj> of
^1da177e4c3f41 Linus Torvalds   2005-04-16  609  	 * internal page, child page Pi contains entry with k, Ki <= K < Kj.
^1da177e4c3f41 Linus Torvalds   2005-04-16  610  	 *
^1da177e4c3f41 Linus Torvalds   2005-04-16  611  	 * if entry with search key K is not found
^1da177e4c3f41 Linus Torvalds   2005-04-16  612  	 * internal page search find the entry with largest key Ki
^1da177e4c3f41 Linus Torvalds   2005-04-16  613  	 * less than K which point to the child page to search;
^1da177e4c3f41 Linus Torvalds   2005-04-16  614  	 * leaf page search find the entry with smallest key Kj
^1da177e4c3f41 Linus Torvalds   2005-04-16  615  	 * greater than K so that the returned index is the position of
^1da177e4c3f41 Linus Torvalds   2005-04-16  616  	 * the entry to be shifted right for insertion of new entry.
^1da177e4c3f41 Linus Torvalds   2005-04-16  617  	 * for empty tree, search key is greater than any key of the tree.
^1da177e4c3f41 Linus Torvalds   2005-04-16  618  	 *
^1da177e4c3f41 Linus Torvalds   2005-04-16  619  	 * by convention, root bn = 0.
^1da177e4c3f41 Linus Torvalds   2005-04-16  620  	 */
^1da177e4c3f41 Linus Torvalds   2005-04-16  621  	for (bn = 0;;) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  622  		/* get/pin the page to search */
^1da177e4c3f41 Linus Torvalds   2005-04-16  623  		DT_GETPAGE(ip, bn, mp, psize, p, rc);
^1da177e4c3f41 Linus Torvalds   2005-04-16  624  		if (rc)
^1da177e4c3f41 Linus Torvalds   2005-04-16  625  			goto dtSearch_Exit1;
^1da177e4c3f41 Linus Torvalds   2005-04-16  626  
^1da177e4c3f41 Linus Torvalds   2005-04-16  627  		/* get sorted entry table of the page */
^1da177e4c3f41 Linus Torvalds   2005-04-16  628  		stbl = DT_GETSTBL(p);
^1da177e4c3f41 Linus Torvalds   2005-04-16  629  
^1da177e4c3f41 Linus Torvalds   2005-04-16  630  		/*
^1da177e4c3f41 Linus Torvalds   2005-04-16  631  		 * binary search with search key K on the current page.
^1da177e4c3f41 Linus Torvalds   2005-04-16  632  		 */
^1da177e4c3f41 Linus Torvalds   2005-04-16  633  		for (base = 0, lim = p->header.nextindex; lim; lim >>= 1) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  634  			index = base + (lim >> 1);
^1da177e4c3f41 Linus Torvalds   2005-04-16  635  
7812e358b5edde Manas Ghandat    2023-10-16 @636  			if (stbl[index] > 128 || stbl[index] < 0)
7812e358b5edde Manas Ghandat    2023-10-16  637  				goto out;
7812e358b5edde Manas Ghandat    2023-10-16  638  
^1da177e4c3f41 Linus Torvalds   2005-04-16  639  			if (p->header.flag & BT_LEAF) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  640  				/* uppercase leaf name to compare */
^1da177e4c3f41 Linus Torvalds   2005-04-16  641  				cmp =
^1da177e4c3f41 Linus Torvalds   2005-04-16  642  				    ciCompare(&ciKey, p, stbl[index],
^1da177e4c3f41 Linus Torvalds   2005-04-16  643  					      JFS_SBI(sb)->mntflag);
^1da177e4c3f41 Linus Torvalds   2005-04-16  644  			} else {
^1da177e4c3f41 Linus Torvalds   2005-04-16  645  				/* router key is in uppercase */
^1da177e4c3f41 Linus Torvalds   2005-04-16  646  
^1da177e4c3f41 Linus Torvalds   2005-04-16  647  				cmp = dtCompare(&ciKey, p, stbl[index]);
^1da177e4c3f41 Linus Torvalds   2005-04-16  648  
^1da177e4c3f41 Linus Torvalds   2005-04-16  649  
^1da177e4c3f41 Linus Torvalds   2005-04-16  650  			}
^1da177e4c3f41 Linus Torvalds   2005-04-16  651  			if (cmp == 0) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  652  				/*
^1da177e4c3f41 Linus Torvalds   2005-04-16  653  				 *	search hit
^1da177e4c3f41 Linus Torvalds   2005-04-16  654  				 */
^1da177e4c3f41 Linus Torvalds   2005-04-16  655  				/* search hit - leaf page:
^1da177e4c3f41 Linus Torvalds   2005-04-16  656  				 * return the entry found
^1da177e4c3f41 Linus Torvalds   2005-04-16  657  				 */
^1da177e4c3f41 Linus Torvalds   2005-04-16  658  				if (p->header.flag & BT_LEAF) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  659  					inumber = le32_to_cpu(
^1da177e4c3f41 Linus Torvalds   2005-04-16  660  			((struct ldtentry *) & p->slot[stbl[index]])->inumber);
^1da177e4c3f41 Linus Torvalds   2005-04-16  661  
^1da177e4c3f41 Linus Torvalds   2005-04-16  662  					/*
^1da177e4c3f41 Linus Torvalds   2005-04-16  663  					 * search for JFS_LOOKUP
^1da177e4c3f41 Linus Torvalds   2005-04-16  664  					 */
^1da177e4c3f41 Linus Torvalds   2005-04-16  665  					if (flag == JFS_LOOKUP) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  666  						*data = inumber;
^1da177e4c3f41 Linus Torvalds   2005-04-16  667  						rc = 0;
^1da177e4c3f41 Linus Torvalds   2005-04-16  668  						goto out;
^1da177e4c3f41 Linus Torvalds   2005-04-16  669  					}
^1da177e4c3f41 Linus Torvalds   2005-04-16  670  
^1da177e4c3f41 Linus Torvalds   2005-04-16  671  					/*
^1da177e4c3f41 Linus Torvalds   2005-04-16  672  					 * search for JFS_CREATE
^1da177e4c3f41 Linus Torvalds   2005-04-16  673  					 */
^1da177e4c3f41 Linus Torvalds   2005-04-16  674  					if (flag == JFS_CREATE) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  675  						*data = inumber;
^1da177e4c3f41 Linus Torvalds   2005-04-16  676  						rc = -EEXIST;
^1da177e4c3f41 Linus Torvalds   2005-04-16  677  						goto out;
^1da177e4c3f41 Linus Torvalds   2005-04-16  678  					}
^1da177e4c3f41 Linus Torvalds   2005-04-16  679  
^1da177e4c3f41 Linus Torvalds   2005-04-16  680  					/*
^1da177e4c3f41 Linus Torvalds   2005-04-16  681  					 * search for JFS_REMOVE or JFS_RENAME
^1da177e4c3f41 Linus Torvalds   2005-04-16  682  					 */
^1da177e4c3f41 Linus Torvalds   2005-04-16  683  					if ((flag == JFS_REMOVE ||
^1da177e4c3f41 Linus Torvalds   2005-04-16  684  					     flag == JFS_RENAME) &&
^1da177e4c3f41 Linus Torvalds   2005-04-16  685  					    *data != inumber) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  686  						rc = -ESTALE;
^1da177e4c3f41 Linus Torvalds   2005-04-16  687  						goto out;
^1da177e4c3f41 Linus Torvalds   2005-04-16  688  					}
^1da177e4c3f41 Linus Torvalds   2005-04-16  689  
^1da177e4c3f41 Linus Torvalds   2005-04-16  690  					/*
^1da177e4c3f41 Linus Torvalds   2005-04-16  691  					 * JFS_REMOVE|JFS_FINDDIR|JFS_RENAME
^1da177e4c3f41 Linus Torvalds   2005-04-16  692  					 */
^1da177e4c3f41 Linus Torvalds   2005-04-16  693  					/* save search result */
^1da177e4c3f41 Linus Torvalds   2005-04-16  694  					*data = inumber;
^1da177e4c3f41 Linus Torvalds   2005-04-16  695  					btsp = btstack->top;
^1da177e4c3f41 Linus Torvalds   2005-04-16  696  					btsp->bn = bn;
^1da177e4c3f41 Linus Torvalds   2005-04-16  697  					btsp->index = index;
^1da177e4c3f41 Linus Torvalds   2005-04-16  698  					btsp->mp = mp;
^1da177e4c3f41 Linus Torvalds   2005-04-16  699  
^1da177e4c3f41 Linus Torvalds   2005-04-16  700  					rc = 0;
^1da177e4c3f41 Linus Torvalds   2005-04-16  701  					goto dtSearch_Exit1;
^1da177e4c3f41 Linus Torvalds   2005-04-16  702  				}
^1da177e4c3f41 Linus Torvalds   2005-04-16  703  
^1da177e4c3f41 Linus Torvalds   2005-04-16  704  				/* search hit - internal page:
^1da177e4c3f41 Linus Torvalds   2005-04-16  705  				 * descend/search its child page
^1da177e4c3f41 Linus Torvalds   2005-04-16  706  				 */
^1da177e4c3f41 Linus Torvalds   2005-04-16  707  				goto getChild;
^1da177e4c3f41 Linus Torvalds   2005-04-16  708  			}
^1da177e4c3f41 Linus Torvalds   2005-04-16  709  
^1da177e4c3f41 Linus Torvalds   2005-04-16  710  			if (cmp > 0) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  711  				base = index + 1;
^1da177e4c3f41 Linus Torvalds   2005-04-16  712  				--lim;
^1da177e4c3f41 Linus Torvalds   2005-04-16  713  			}
^1da177e4c3f41 Linus Torvalds   2005-04-16  714  		}
^1da177e4c3f41 Linus Torvalds   2005-04-16  715  
^1da177e4c3f41 Linus Torvalds   2005-04-16  716  		/*
^1da177e4c3f41 Linus Torvalds   2005-04-16  717  		 *	search miss
^1da177e4c3f41 Linus Torvalds   2005-04-16  718  		 *
^1da177e4c3f41 Linus Torvalds   2005-04-16  719  		 * base is the smallest index with key (Kj) greater than
^1da177e4c3f41 Linus Torvalds   2005-04-16  720  		 * search key (K) and may be zero or (maxindex + 1) index.
^1da177e4c3f41 Linus Torvalds   2005-04-16  721  		 */
^1da177e4c3f41 Linus Torvalds   2005-04-16  722  		/*
^1da177e4c3f41 Linus Torvalds   2005-04-16  723  		 * search miss - leaf page
^1da177e4c3f41 Linus Torvalds   2005-04-16  724  		 *
^1da177e4c3f41 Linus Torvalds   2005-04-16  725  		 * return location of entry (base) where new entry with
^1da177e4c3f41 Linus Torvalds   2005-04-16  726  		 * search key K is to be inserted.
^1da177e4c3f41 Linus Torvalds   2005-04-16  727  		 */
^1da177e4c3f41 Linus Torvalds   2005-04-16  728  		if (p->header.flag & BT_LEAF) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  729  			/*
^1da177e4c3f41 Linus Torvalds   2005-04-16  730  			 * search for JFS_LOOKUP, JFS_REMOVE, or JFS_RENAME
^1da177e4c3f41 Linus Torvalds   2005-04-16  731  			 */
^1da177e4c3f41 Linus Torvalds   2005-04-16  732  			if (flag == JFS_LOOKUP || flag == JFS_REMOVE ||
^1da177e4c3f41 Linus Torvalds   2005-04-16  733  			    flag == JFS_RENAME) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  734  				rc = -ENOENT;
^1da177e4c3f41 Linus Torvalds   2005-04-16  735  				goto out;
^1da177e4c3f41 Linus Torvalds   2005-04-16  736  			}
^1da177e4c3f41 Linus Torvalds   2005-04-16  737  
^1da177e4c3f41 Linus Torvalds   2005-04-16  738  			/*
^1da177e4c3f41 Linus Torvalds   2005-04-16  739  			 * search for JFS_CREATE|JFS_FINDDIR:
^1da177e4c3f41 Linus Torvalds   2005-04-16  740  			 *
^1da177e4c3f41 Linus Torvalds   2005-04-16  741  			 * save search result
^1da177e4c3f41 Linus Torvalds   2005-04-16  742  			 */
^1da177e4c3f41 Linus Torvalds   2005-04-16  743  			*data = 0;
^1da177e4c3f41 Linus Torvalds   2005-04-16  744  			btsp = btstack->top;
^1da177e4c3f41 Linus Torvalds   2005-04-16  745  			btsp->bn = bn;
^1da177e4c3f41 Linus Torvalds   2005-04-16  746  			btsp->index = base;
^1da177e4c3f41 Linus Torvalds   2005-04-16  747  			btsp->mp = mp;
^1da177e4c3f41 Linus Torvalds   2005-04-16  748  
^1da177e4c3f41 Linus Torvalds   2005-04-16  749  			rc = 0;
^1da177e4c3f41 Linus Torvalds   2005-04-16  750  			goto dtSearch_Exit1;
^1da177e4c3f41 Linus Torvalds   2005-04-16  751  		}
^1da177e4c3f41 Linus Torvalds   2005-04-16  752  
^1da177e4c3f41 Linus Torvalds   2005-04-16  753  		/*
^1da177e4c3f41 Linus Torvalds   2005-04-16  754  		 * search miss - internal page
^1da177e4c3f41 Linus Torvalds   2005-04-16  755  		 *
^1da177e4c3f41 Linus Torvalds   2005-04-16  756  		 * if base is non-zero, decrement base by one to get the parent
^1da177e4c3f41 Linus Torvalds   2005-04-16  757  		 * entry of the child page to search.
^1da177e4c3f41 Linus Torvalds   2005-04-16  758  		 */
^1da177e4c3f41 Linus Torvalds   2005-04-16  759  		index = base ? base - 1 : base;
^1da177e4c3f41 Linus Torvalds   2005-04-16  760  
^1da177e4c3f41 Linus Torvalds   2005-04-16  761  		/*
^1da177e4c3f41 Linus Torvalds   2005-04-16  762  		 * go down to child page
^1da177e4c3f41 Linus Torvalds   2005-04-16  763  		 */
^1da177e4c3f41 Linus Torvalds   2005-04-16  764  	      getChild:
^1da177e4c3f41 Linus Torvalds   2005-04-16  765  		/* update max. number of pages to split */
^1da177e4c3f41 Linus Torvalds   2005-04-16  766  		if (BT_STACK_FULL(btstack)) {
3a4fa0a25da816 Robert P. J. Day 2007-10-19  767  			/* Something's corrupted, mark filesystem dirty so
^1da177e4c3f41 Linus Torvalds   2005-04-16  768  			 * chkdsk will fix it.
^1da177e4c3f41 Linus Torvalds   2005-04-16  769  			 */
eb8630d7d2fd13 Joe Perches      2013-06-04  770  			jfs_error(sb, "stack overrun!\n");
^1da177e4c3f41 Linus Torvalds   2005-04-16  771  			BT_STACK_DUMP(btstack);
^1da177e4c3f41 Linus Torvalds   2005-04-16  772  			rc = -EIO;
^1da177e4c3f41 Linus Torvalds   2005-04-16  773  			goto out;
^1da177e4c3f41 Linus Torvalds   2005-04-16  774  		}
^1da177e4c3f41 Linus Torvalds   2005-04-16  775  		btstack->nsplit++;
^1da177e4c3f41 Linus Torvalds   2005-04-16  776  
^1da177e4c3f41 Linus Torvalds   2005-04-16  777  		/* push (bn, index) of the parent page/entry */
^1da177e4c3f41 Linus Torvalds   2005-04-16  778  		BT_PUSH(btstack, bn, index);
^1da177e4c3f41 Linus Torvalds   2005-04-16  779  
^1da177e4c3f41 Linus Torvalds   2005-04-16  780  		/* get the child page block number */
^1da177e4c3f41 Linus Torvalds   2005-04-16  781  		pxd = (pxd_t *) & p->slot[stbl[index]];
^1da177e4c3f41 Linus Torvalds   2005-04-16  782  		bn = addressPXD(pxd);
^1da177e4c3f41 Linus Torvalds   2005-04-16  783  		psize = lengthPXD(pxd) << JFS_SBI(ip->i_sb)->l2bsize;
^1da177e4c3f41 Linus Torvalds   2005-04-16  784  
^1da177e4c3f41 Linus Torvalds   2005-04-16  785  		/* unpin the parent page */
^1da177e4c3f41 Linus Torvalds   2005-04-16  786  		DT_PUTPAGE(mp);
^1da177e4c3f41 Linus Torvalds   2005-04-16  787  	}
^1da177e4c3f41 Linus Torvalds   2005-04-16  788  
^1da177e4c3f41 Linus Torvalds   2005-04-16  789        out:
^1da177e4c3f41 Linus Torvalds   2005-04-16  790  	DT_PUTPAGE(mp);
^1da177e4c3f41 Linus Torvalds   2005-04-16  791  
^1da177e4c3f41 Linus Torvalds   2005-04-16  792        dtSearch_Exit1:
^1da177e4c3f41 Linus Torvalds   2005-04-16  793  
^1da177e4c3f41 Linus Torvalds   2005-04-16  794  	kfree(ciKey.name);
^1da177e4c3f41 Linus Torvalds   2005-04-16  795  
^1da177e4c3f41 Linus Torvalds   2005-04-16  796        dtSearch_Exit2:
^1da177e4c3f41 Linus Torvalds   2005-04-16  797  
^1da177e4c3f41 Linus Torvalds   2005-04-16  798  	return rc;
^1da177e4c3f41 Linus Torvalds   2005-04-16  799  }
^1da177e4c3f41 Linus Torvalds   2005-04-16  800  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
