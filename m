Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75494A5E
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Mar 2023 05:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678426317; x=1709962317;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SpaVtBiClynmD2rhvW6QUeo3WK5QMRxMyruX0dXrAkE=;
  b=n25TubNWxnYpp1/5lnJzMuAFroMd89G1jU4OErONektNUx+r4NNH+32d
   kJUY/OZc6Jhds6XuD92o1lpgoO4mbsmeAh7Nfmq2BkSZGgB8RQe/i/CEK
   YGU2euJzl5SHdoZ6iB+xcyH+VoPyvZMQBaofkbgFFPgYowbeLfO6OdJXd
   W5ZAPeC1MkbjNjbuV9I8Jn0waUUWfZyPOLH6U56VD7r+1BMRst6GlcEWs
   Haym4rbB2xiKoI+gEPik+180H9bl/gGuESg0Po7Tkm2nwyTX9sgfwGpyY
   /MD+bU4f9i6gbBeRUQWLqoqCcEZGfbG0OE3gBk++T8E2n3nirvzz9YQk8
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="338206343"
X-IronPort-AV: E=Sophos;i="5.98,248,1673942400"; 
   d="scan'208";a="338206343"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 21:31:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="801454825"
X-IronPort-AV: E=Sophos;i="5.98,248,1673942400"; 
   d="scan'208";a="801454825"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 09 Mar 2023 21:31:55 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paVMA-0003Xl-2L;
	Fri, 10 Mar 2023 05:31:54 +0000
Date: Fri, 10 Mar 2023 13:31:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/proc/proc_sysctl.c:602 proc_sys_call_handler() warn: potential
 spectre issue 'kbuf' [w]
Message-ID: <202303101337.lFvFviOy-lkp@intel.com>
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
TO: Hyeonggon Yoo <42.hyeyoo@gmail.com>
CC: Vlastimil Babka <vbabka@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   44889ba56cbb3d51154660ccd15818bc77276696
commit: d6a71648dbc0ca5520cba16a8fdce8d37ae74218 mm/slab: kmalloc: pass requests larger than order-1 page to page allocator
date:   7 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 7 months ago
config: ia64-randconfig-m041-20230308 (https://download.01.org/0day-ci/archive/20230310/202303101337.lFvFviOy-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303101337.lFvFviOy-lkp@intel.com/

smatch warnings:
fs/proc/proc_sysctl.c:602 proc_sys_call_handler() warn: potential spectre issue 'kbuf' [w]

vim +/kbuf +602 fs/proc/proc_sysctl.c

77b14db502cb85 Eric W. Biederman       2007-02-14  563  
4bd6a7353ee146 Matthew Wilcox (Oracle  2020-09-03  564) static ssize_t proc_sys_call_handler(struct kiocb *iocb, struct iov_iter *iter,
4bd6a7353ee146 Matthew Wilcox (Oracle  2020-09-03  565) 		int write)
77b14db502cb85 Eric W. Biederman       2007-02-14  566  {
4bd6a7353ee146 Matthew Wilcox (Oracle  2020-09-03  567) 	struct inode *inode = file_inode(iocb->ki_filp);
9043476f726802 Al Viro                 2008-07-15  568  	struct ctl_table_header *head = grab_header(inode);
9043476f726802 Al Viro                 2008-07-15  569  	struct ctl_table *table = PROC_I(inode)->sysctl_entry;
4bd6a7353ee146 Matthew Wilcox (Oracle  2020-09-03  570) 	size_t count = iov_iter_count(iter);
4bd6a7353ee146 Matthew Wilcox (Oracle  2020-09-03  571) 	char *kbuf;
2a2da53b181bda David Howells           2007-10-25  572  	ssize_t error;
77b14db502cb85 Eric W. Biederman       2007-02-14  573  
9043476f726802 Al Viro                 2008-07-15  574  	if (IS_ERR(head))
9043476f726802 Al Viro                 2008-07-15  575  		return PTR_ERR(head);
77b14db502cb85 Eric W. Biederman       2007-02-14  576  
77b14db502cb85 Eric W. Biederman       2007-02-14  577  	/*
77b14db502cb85 Eric W. Biederman       2007-02-14  578  	 * At this point we know that the sysctl was not unregistered
77b14db502cb85 Eric W. Biederman       2007-02-14  579  	 * and won't be until we finish.
77b14db502cb85 Eric W. Biederman       2007-02-14  580  	 */
77b14db502cb85 Eric W. Biederman       2007-02-14  581  	error = -EPERM;
73f7ef435934e9 Eric W. Biederman       2012-11-16  582  	if (sysctl_perm(head, table, write ? MAY_WRITE : MAY_READ))
77b14db502cb85 Eric W. Biederman       2007-02-14  583  		goto out;
77b14db502cb85 Eric W. Biederman       2007-02-14  584  
9043476f726802 Al Viro                 2008-07-15  585  	/* if that can happen at all, it should be -EINVAL, not -EISDIR */
9043476f726802 Al Viro                 2008-07-15  586  	error = -EINVAL;
9043476f726802 Al Viro                 2008-07-15  587  	if (!table->proc_handler)
9043476f726802 Al Viro                 2008-07-15  588  		goto out;
9043476f726802 Al Viro                 2008-07-15  589  
ef9d965bc8b6fc Christoph Hellwig       2020-06-09  590  	/* don't even try if the size is too large */
d4d80e69927ab5 Matthew Wilcox (Oracle  2020-07-03  591) 	error = -ENOMEM;
d4d80e69927ab5 Matthew Wilcox (Oracle  2020-07-03  592) 	if (count >= KMALLOC_MAX_SIZE)
d4d80e69927ab5 Matthew Wilcox (Oracle  2020-07-03  593) 		goto out;
4508943794efdd Josef Bacik             2021-02-25  594  	kbuf = kvzalloc(count + 1, GFP_KERNEL);
32927393dc1ccd Christoph Hellwig       2020-04-24  595  	if (!kbuf)
32927393dc1ccd Christoph Hellwig       2020-04-24  596  		goto out;
4bd6a7353ee146 Matthew Wilcox (Oracle  2020-09-03  597) 
4bd6a7353ee146 Matthew Wilcox (Oracle  2020-09-03  598) 	if (write) {
4bd6a7353ee146 Matthew Wilcox (Oracle  2020-09-03  599) 		error = -EFAULT;
4bd6a7353ee146 Matthew Wilcox (Oracle  2020-09-03  600) 		if (!copy_from_iter_full(kbuf, count, iter))
4bd6a7353ee146 Matthew Wilcox (Oracle  2020-09-03  601) 			goto out_free_buf;
4bd6a7353ee146 Matthew Wilcox (Oracle  2020-09-03 @602) 		kbuf[count] = '\0';
32927393dc1ccd Christoph Hellwig       2020-04-24  603  	}
32927393dc1ccd Christoph Hellwig       2020-04-24  604  
32927393dc1ccd Christoph Hellwig       2020-04-24  605  	error = BPF_CGROUP_RUN_PROG_SYSCTL(head, table, write, &kbuf, &count,
4bd6a7353ee146 Matthew Wilcox (Oracle  2020-09-03  606) 					   &iocb->ki_pos);
32927393dc1ccd Christoph Hellwig       2020-04-24  607  	if (error)
32927393dc1ccd Christoph Hellwig       2020-04-24  608  		goto out_free_buf;
7b146cebe30cb4 Andrey Ignatov          2019-02-27  609  
77b14db502cb85 Eric W. Biederman       2007-02-14  610  	/* careful: calling conventions are nasty here */
4bd6a7353ee146 Matthew Wilcox (Oracle  2020-09-03  611) 	error = table->proc_handler(table, write, kbuf, &count, &iocb->ki_pos);
32927393dc1ccd Christoph Hellwig       2020-04-24  612  	if (error)
32927393dc1ccd Christoph Hellwig       2020-04-24  613  		goto out_free_buf;
32927393dc1ccd Christoph Hellwig       2020-04-24  614  
32927393dc1ccd Christoph Hellwig       2020-04-24  615  	if (!write) {
32927393dc1ccd Christoph Hellwig       2020-04-24  616  		error = -EFAULT;
4bd6a7353ee146 Matthew Wilcox (Oracle  2020-09-03  617) 		if (copy_to_iter(kbuf, count, iter) < count)
32927393dc1ccd Christoph Hellwig       2020-04-24  618  			goto out_free_buf;
4e63acdff86465 Andrey Ignatov          2019-03-07  619  	}
4e63acdff86465 Andrey Ignatov          2019-03-07  620  
4e63acdff86465 Andrey Ignatov          2019-03-07  621  	error = count;
32927393dc1ccd Christoph Hellwig       2020-04-24  622  out_free_buf:
4508943794efdd Josef Bacik             2021-02-25  623  	kvfree(kbuf);
77b14db502cb85 Eric W. Biederman       2007-02-14  624  out:
77b14db502cb85 Eric W. Biederman       2007-02-14  625  	sysctl_head_finish(head);
77b14db502cb85 Eric W. Biederman       2007-02-14  626  
77b14db502cb85 Eric W. Biederman       2007-02-14  627  	return error;
77b14db502cb85 Eric W. Biederman       2007-02-14  628  }
77b14db502cb85 Eric W. Biederman       2007-02-14  629  

:::::: The code at line 602 was first introduced by commit
:::::: 4bd6a7353ee14697fea645e941354976d2c4a452 sysctl: Convert to iter interfaces

:::::: TO: Matthew Wilcox (Oracle) <willy@infradead.org>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
