Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FD1CA64
	for <oe-kbuild@lists.linux.dev>; Sun, 24 Dec 2023 17:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LsJD0pWD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703440266; x=1734976266;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jyRjaD7BEkAbhBSgV/n3QPFYNwrZzOYab/Xqk0H/ck8=;
  b=LsJD0pWDkXRwHILKBLwpESXfrI/DXVKvD+UgfCMqaukBcE7vCoy2hXXv
   aWDIKxo8p6d+BZM5j89zQjPlU2JJw7WHrDglFSgIVNPr1WWM20Wfz0Fse
   WT6eJ6EFVLbNbsmBvNHkmY9Id1IoViZV6VkEKK4v2AwXNjKjk5YEXE2ol
   PU8/kV4+WK6kquCCK7HZkmU10sE/ktvYKFBjOWl5PdMgglXhHkecRSbJ3
   XUvv2sPD26ObEKeEEorYHDvzVsLQgPDBtsJUY7OJc0CMuvtieX4/A487j
   Od4aEVA7C/owU18TYsBhw3CdEmDsEeFkXhsqWOwRbIuSp0dmk+3lXlRDC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="395136729"
X-IronPort-AV: E=Sophos;i="6.04,301,1695711600"; 
   d="scan'208";a="395136729"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2023 09:51:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="777565841"
X-IronPort-AV: E=Sophos;i="6.04,301,1695711600"; 
   d="scan'208";a="777565841"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 24 Dec 2023 09:51:03 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rHSc6-000CTN-2z;
	Sun, 24 Dec 2023 17:50:35 +0000
Date: Mon, 25 Dec 2023 01:49:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/proc/proc_sysctl.c:582 proc_sys_call_handler() warn: potential
 spectre issue 'kbuf' [w]
Message-ID: <202312250136.lZYzcSe9-lkp@intel.com>
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
TO: "Matthew Wilcox (Oracle)" <willy@infradead.org>
CC: Al Viro <viro@zeniv.linux.org.uk>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   861deac3b092f37b2c5e6871732f3e11486f7082
commit: 4bd6a7353ee14697fea645e941354976d2c4a452 sysctl: Convert to iter interfaces
date:   3 years, 4 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 3 years, 4 months ago
config: i386-randconfig-141-20231016 (https://download.01.org/0day-ci/archive/20231225/202312250136.lZYzcSe9-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312250136.lZYzcSe9-lkp@intel.com/

smatch warnings:
fs/proc/proc_sysctl.c:582 proc_sys_call_handler() warn: potential spectre issue 'kbuf' [w]

vim +/kbuf +582 fs/proc/proc_sysctl.c

77b14db502cb85 Eric W. Biederman       2007-02-14  543  
4bd6a7353ee146 Matthew Wilcox (Oracle  2020-09-03  544) static ssize_t proc_sys_call_handler(struct kiocb *iocb, struct iov_iter *iter,
4bd6a7353ee146 Matthew Wilcox (Oracle  2020-09-03  545) 		int write)
77b14db502cb85 Eric W. Biederman       2007-02-14  546  {
4bd6a7353ee146 Matthew Wilcox (Oracle  2020-09-03  547) 	struct inode *inode = file_inode(iocb->ki_filp);
9043476f726802 Al Viro                 2008-07-15  548  	struct ctl_table_header *head = grab_header(inode);
9043476f726802 Al Viro                 2008-07-15  549  	struct ctl_table *table = PROC_I(inode)->sysctl_entry;
4bd6a7353ee146 Matthew Wilcox (Oracle  2020-09-03  550) 	size_t count = iov_iter_count(iter);
4bd6a7353ee146 Matthew Wilcox (Oracle  2020-09-03  551) 	char *kbuf;
2a2da53b181bda David Howells           2007-10-25  552  	ssize_t error;
77b14db502cb85 Eric W. Biederman       2007-02-14  553  
9043476f726802 Al Viro                 2008-07-15  554  	if (IS_ERR(head))
9043476f726802 Al Viro                 2008-07-15  555  		return PTR_ERR(head);
77b14db502cb85 Eric W. Biederman       2007-02-14  556  
77b14db502cb85 Eric W. Biederman       2007-02-14  557  	/*
77b14db502cb85 Eric W. Biederman       2007-02-14  558  	 * At this point we know that the sysctl was not unregistered
77b14db502cb85 Eric W. Biederman       2007-02-14  559  	 * and won't be until we finish.
77b14db502cb85 Eric W. Biederman       2007-02-14  560  	 */
77b14db502cb85 Eric W. Biederman       2007-02-14  561  	error = -EPERM;
73f7ef435934e9 Eric W. Biederman       2012-11-16  562  	if (sysctl_perm(head, table, write ? MAY_WRITE : MAY_READ))
77b14db502cb85 Eric W. Biederman       2007-02-14  563  		goto out;
77b14db502cb85 Eric W. Biederman       2007-02-14  564  
9043476f726802 Al Viro                 2008-07-15  565  	/* if that can happen at all, it should be -EINVAL, not -EISDIR */
9043476f726802 Al Viro                 2008-07-15  566  	error = -EINVAL;
9043476f726802 Al Viro                 2008-07-15  567  	if (!table->proc_handler)
9043476f726802 Al Viro                 2008-07-15  568  		goto out;
9043476f726802 Al Viro                 2008-07-15  569  
ef9d965bc8b6fc Christoph Hellwig       2020-06-09  570  	/* don't even try if the size is too large */
d4d80e69927ab5 Matthew Wilcox (Oracle  2020-07-03  571) 	error = -ENOMEM;
d4d80e69927ab5 Matthew Wilcox (Oracle  2020-07-03  572) 	if (count >= KMALLOC_MAX_SIZE)
d4d80e69927ab5 Matthew Wilcox (Oracle  2020-07-03  573) 		goto out;
4bd6a7353ee146 Matthew Wilcox (Oracle  2020-09-03  574) 	kbuf = kzalloc(count + 1, GFP_KERNEL);
32927393dc1ccd Christoph Hellwig       2020-04-24  575  	if (!kbuf)
32927393dc1ccd Christoph Hellwig       2020-04-24  576  		goto out;
4bd6a7353ee146 Matthew Wilcox (Oracle  2020-09-03  577) 
4bd6a7353ee146 Matthew Wilcox (Oracle  2020-09-03  578) 	if (write) {
4bd6a7353ee146 Matthew Wilcox (Oracle  2020-09-03  579) 		error = -EFAULT;
4bd6a7353ee146 Matthew Wilcox (Oracle  2020-09-03  580) 		if (!copy_from_iter_full(kbuf, count, iter))
4bd6a7353ee146 Matthew Wilcox (Oracle  2020-09-03  581) 			goto out_free_buf;
4bd6a7353ee146 Matthew Wilcox (Oracle  2020-09-03 @582) 		kbuf[count] = '\0';
32927393dc1ccd Christoph Hellwig       2020-04-24  583  	}
32927393dc1ccd Christoph Hellwig       2020-04-24  584  
32927393dc1ccd Christoph Hellwig       2020-04-24  585  	error = BPF_CGROUP_RUN_PROG_SYSCTL(head, table, write, &kbuf, &count,
4bd6a7353ee146 Matthew Wilcox (Oracle  2020-09-03  586) 					   &iocb->ki_pos);
32927393dc1ccd Christoph Hellwig       2020-04-24  587  	if (error)
32927393dc1ccd Christoph Hellwig       2020-04-24  588  		goto out_free_buf;
7b146cebe30cb4 Andrey Ignatov          2019-02-27  589  
77b14db502cb85 Eric W. Biederman       2007-02-14  590  	/* careful: calling conventions are nasty here */
4bd6a7353ee146 Matthew Wilcox (Oracle  2020-09-03  591) 	error = table->proc_handler(table, write, kbuf, &count, &iocb->ki_pos);
32927393dc1ccd Christoph Hellwig       2020-04-24  592  	if (error)
32927393dc1ccd Christoph Hellwig       2020-04-24  593  		goto out_free_buf;
32927393dc1ccd Christoph Hellwig       2020-04-24  594  
32927393dc1ccd Christoph Hellwig       2020-04-24  595  	if (!write) {
32927393dc1ccd Christoph Hellwig       2020-04-24  596  		error = -EFAULT;
4bd6a7353ee146 Matthew Wilcox (Oracle  2020-09-03  597) 		if (copy_to_iter(kbuf, count, iter) < count)
32927393dc1ccd Christoph Hellwig       2020-04-24  598  			goto out_free_buf;
4e63acdff86465 Andrey Ignatov          2019-03-07  599  	}
4e63acdff86465 Andrey Ignatov          2019-03-07  600  
4e63acdff86465 Andrey Ignatov          2019-03-07  601  	error = count;
32927393dc1ccd Christoph Hellwig       2020-04-24  602  out_free_buf:
32927393dc1ccd Christoph Hellwig       2020-04-24  603  	kfree(kbuf);
77b14db502cb85 Eric W. Biederman       2007-02-14  604  out:
77b14db502cb85 Eric W. Biederman       2007-02-14  605  	sysctl_head_finish(head);
77b14db502cb85 Eric W. Biederman       2007-02-14  606  
77b14db502cb85 Eric W. Biederman       2007-02-14  607  	return error;
77b14db502cb85 Eric W. Biederman       2007-02-14  608  }
77b14db502cb85 Eric W. Biederman       2007-02-14  609  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
