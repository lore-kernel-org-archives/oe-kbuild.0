Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E02B10E7
	for <oe-kbuild@lists.linux.dev>; Sun,  9 Apr 2023 08:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681029929; x=1712565929;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1k26I2PJ1eEhxZQQHbs96JC945RvWrYD05yBPGZzjGs=;
  b=IhYHUae6jvKHTsvn2/T3u8LhGtQF/TcebyC91NmBUDykZaa1tamf8Cai
   nJOm+r7QzHW1+y0nJyxU448ygHKBbP5CDfZai39JCX+C4s/9imBkLhE8S
   QTJUm1LPnU1WnmnR2YemnBixKx1SUCn6pq3dtZv9H25MlFvS4V3bgLBfo
   ENu10zP6LrSQ8S0vviN+YM7fTNfckTN47q4CBQ4kaTlH+5FO8K2zVQYmk
   s4kDtZmYAtYPnALvePKmlxXbqrhRgzKZyjmcUcrfS7uVSq0NZc8vbLzGs
   pEJnZyRFwrvt/JRe61W2GURpS4ALOZMgIKdhKJFgCCQbLzikbkiBZQLYu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10674"; a="343211402"
X-IronPort-AV: E=Sophos;i="5.98,331,1673942400"; 
   d="scan'208";a="343211402"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2023 01:45:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10674"; a="720508852"
X-IronPort-AV: E=Sophos;i="5.98,331,1673942400"; 
   d="scan'208";a="720508852"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 09 Apr 2023 01:45:27 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1plQfu-000UQz-1Z;
	Sun, 09 Apr 2023 08:45:26 +0000
Date: Sun, 9 Apr 2023 16:44:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:pptrs-online-parent-repair 67/72]
 fs/xfs/scrub/dir_repair.c:825 xrep_dir_dump_tempdir() error: uninitialized
 symbol 'error'.
Message-ID: <202304091600.EeF4cLbd-lkp@intel.com>
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
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git pptrs-online-parent-repair
head:   fee9424c142b24fc3bc25e7ba5023aad692b9e2c
commit: 20a92e46fe80c2b704a9745406390ba785e84210 [67/72] xfs: compare generated and existing dirents
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: csky-randconfig-m031-20230409 (https://download.01.org/0day-ci/archive/20230409/202304091600.EeF4cLbd-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304091600.EeF4cLbd-lkp@intel.com/

smatch warnings:
fs/xfs/scrub/dir_repair.c:825 xrep_dir_dump_tempdir() error: uninitialized symbol 'error'.

vim +/error +825 fs/xfs/scrub/dir_repair.c

dcb484bdb5855e Darrick J. Wong 2023-03-24  748  
20a92e46fe80c2 Darrick J. Wong 2023-03-24  749  /*
20a92e46fe80c2 Darrick J. Wong 2023-03-24  750   * Dump a dirent from the temporary dir and check it against the dir we're
20a92e46fe80c2 Darrick J. Wong 2023-03-24  751   * rebuilding.  We are not committing any of this.
20a92e46fe80c2 Darrick J. Wong 2023-03-24  752   */
dcb484bdb5855e Darrick J. Wong 2023-03-24  753  STATIC int
dcb484bdb5855e Darrick J. Wong 2023-03-24  754  xrep_dir_dump_tempdir(
dcb484bdb5855e Darrick J. Wong 2023-03-24  755  	struct xfs_scrub	*sc,
dcb484bdb5855e Darrick J. Wong 2023-03-24  756  	struct xfs_inode	*dp,
dcb484bdb5855e Darrick J. Wong 2023-03-24  757  	xfs_dir2_dataptr_t	dapos,
dcb484bdb5855e Darrick J. Wong 2023-03-24  758  	const struct xfs_name	*name,
dcb484bdb5855e Darrick J. Wong 2023-03-24  759  	xfs_ino_t		ino,
dcb484bdb5855e Darrick J. Wong 2023-03-24  760  	void			*priv)
dcb484bdb5855e Darrick J. Wong 2023-03-24  761  {
dcb484bdb5855e Darrick J. Wong 2023-03-24  762  	struct xrep_dir		*rd = priv;
20a92e46fe80c2 Darrick J. Wong 2023-03-24  763  	xfs_ino_t		child_ino;
dcb484bdb5855e Darrick J. Wong 2023-03-24  764  	bool			child_dirent = true;
20a92e46fe80c2 Darrick J. Wong 2023-03-24  765  	bool			compare_dirent = true;
20a92e46fe80c2 Darrick J. Wong 2023-03-24  766  	int			error;
dcb484bdb5855e Darrick J. Wong 2023-03-24  767  
dcb484bdb5855e Darrick J. Wong 2023-03-24  768  	/*
dcb484bdb5855e Darrick J. Wong 2023-03-24  769  	 * The tempdir was created with a dotdot entry pointing to the root
dcb484bdb5855e Darrick J. Wong 2023-03-24  770  	 * directory.  Substitute whatever inode number we found during the
dcb484bdb5855e Darrick J. Wong 2023-03-24  771  	 * filesystem scan.
dcb484bdb5855e Darrick J. Wong 2023-03-24  772  	 *
dcb484bdb5855e Darrick J. Wong 2023-03-24  773  	 * The tempdir was also created with a dot entry pointing to itself.
dcb484bdb5855e Darrick J. Wong 2023-03-24  774  	 * Substitute the inode number of the directory being repaired.  A
dcb484bdb5855e Darrick J. Wong 2023-03-24  775  	 * prerequisite for the real repair code is a patchset to allow dir
dcb484bdb5855e Darrick J. Wong 2023-03-24  776  	 * callers to set the owner (and dot entry in the case of sf -> block
dcb484bdb5855e Darrick J. Wong 2023-03-24  777  	 * conversion) explicitly.
dcb484bdb5855e Darrick J. Wong 2023-03-24  778  	 *
dcb484bdb5855e Darrick J. Wong 2023-03-24  779  	 * I've chosen not to port the owner setting patchset or the swapext
dcb484bdb5855e Darrick J. Wong 2023-03-24  780  	 * patchset for this PoC, which is why we build the tempdir, compare
dcb484bdb5855e Darrick J. Wong 2023-03-24  781  	 * the contents, and drop the tempdir.
dcb484bdb5855e Darrick J. Wong 2023-03-24  782  	 */
dcb484bdb5855e Darrick J. Wong 2023-03-24  783  	if (xrep_dir_samename(name, &xfs_name_dotdot)) {
dcb484bdb5855e Darrick J. Wong 2023-03-24  784  		child_dirent = false;
dcb484bdb5855e Darrick J. Wong 2023-03-24  785  		ino = rd->parent_ino;
dcb484bdb5855e Darrick J. Wong 2023-03-24  786  	}
dcb484bdb5855e Darrick J. Wong 2023-03-24  787  	if (xrep_dir_samename(name, &xfs_name_dot)) {
dcb484bdb5855e Darrick J. Wong 2023-03-24  788  		child_dirent = false;
20a92e46fe80c2 Darrick J. Wong 2023-03-24  789  		compare_dirent = false;
dcb484bdb5855e Darrick J. Wong 2023-03-24  790  		ino = sc->ip->i_ino;
dcb484bdb5855e Darrick J. Wong 2023-03-24  791  	}
dcb484bdb5855e Darrick J. Wong 2023-03-24  792  
dcb484bdb5855e Darrick J. Wong 2023-03-24  793  	trace_xrep_dir_dumpname(sc->tempip, name, ino);
dcb484bdb5855e Darrick J. Wong 2023-03-24  794  
20a92e46fe80c2 Darrick J. Wong 2023-03-24  795  	/* Check that the dir being repaired has the same entry. */
20a92e46fe80c2 Darrick J. Wong 2023-03-24  796  	if (compare_dirent) {
20a92e46fe80c2 Darrick J. Wong 2023-03-24  797  		error = xchk_dir_lookup(sc, sc->ip, name, &child_ino);
20a92e46fe80c2 Darrick J. Wong 2023-03-24  798  		if (error == -ENOENT) {
20a92e46fe80c2 Darrick J. Wong 2023-03-24  799  			trace_xrep_dir_checkname(sc->ip, name, NULLFSINO);
20a92e46fe80c2 Darrick J. Wong 2023-03-24  800  			ASSERT(error != -ENOENT);
20a92e46fe80c2 Darrick J. Wong 2023-03-24  801  			return -EFSCORRUPTED;
20a92e46fe80c2 Darrick J. Wong 2023-03-24  802  		}
20a92e46fe80c2 Darrick J. Wong 2023-03-24  803  		if (error)
20a92e46fe80c2 Darrick J. Wong 2023-03-24  804  			return error;
20a92e46fe80c2 Darrick J. Wong 2023-03-24  805  
20a92e46fe80c2 Darrick J. Wong 2023-03-24  806  		if (ino != child_ino) {
20a92e46fe80c2 Darrick J. Wong 2023-03-24  807  			trace_xrep_dir_checkname(sc->ip, name, child_ino);
20a92e46fe80c2 Darrick J. Wong 2023-03-24  808  			ASSERT(ino == child_ino);
20a92e46fe80c2 Darrick J. Wong 2023-03-24  809  			return -EFSCORRUPTED;
20a92e46fe80c2 Darrick J. Wong 2023-03-24  810  		}
20a92e46fe80c2 Darrick J. Wong 2023-03-24  811  	}
20a92e46fe80c2 Darrick J. Wong 2023-03-24  812  
dcb484bdb5855e Darrick J. Wong 2023-03-24  813  	/*
dcb484bdb5855e Darrick J. Wong 2023-03-24  814  	 * Set ourselves up to free every dirent in the tempdir because
dcb484bdb5855e Darrick J. Wong 2023-03-24  815  	 * directory inactivation won't do it for us.  The rest of the online
dcb484bdb5855e Darrick J. Wong 2023-03-24  816  	 * fsck patchset provides us a means to swap the directory structure
dcb484bdb5855e Darrick J. Wong 2023-03-24  817  	 * and reap it responsibly, but I didn't feel like porting all that.
dcb484bdb5855e Darrick J. Wong 2023-03-24  818  	 */
dcb484bdb5855e Darrick J. Wong 2023-03-24  819  	if (child_dirent) {
dcb484bdb5855e Darrick J. Wong 2023-03-24  820  		mutex_lock(&rd->lock);
dcb484bdb5855e Darrick J. Wong 2023-03-24  821  		error = xrep_dir_remove_dirent(rd, name, ino);
dcb484bdb5855e Darrick J. Wong 2023-03-24  822  		mutex_unlock(&rd->lock);
dcb484bdb5855e Darrick J. Wong 2023-03-24  823  	}
dcb484bdb5855e Darrick J. Wong 2023-03-24  824  
dcb484bdb5855e Darrick J. Wong 2023-03-24 @825  	return error;
dcb484bdb5855e Darrick J. Wong 2023-03-24  826  }
dcb484bdb5855e Darrick J. Wong 2023-03-24  827  

:::::: The code at line 825 was first introduced by commit
:::::: dcb484bdb5855e6180734b7c26604a98534259fe xfs: reconstruct directories from parent pointers

:::::: TO: Darrick J. Wong <djwong@kernel.org>
:::::: CC: Darrick J. Wong <djwong@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
