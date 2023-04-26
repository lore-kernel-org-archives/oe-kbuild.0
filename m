Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5221C37
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Apr 2023 09:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682500970; x=1714036970;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pk9nIKzh3QGD08QQ518/cSojmCXBT6fZqu46WQtZj9o=;
  b=j5iq/tLXBUVuAGHLjL1HCeRKXaGMX2jfNcQtC1i8Ipx80sfICJNk6lLH
   h/VmqCTbwl6wFkszhQoMhABllXYtEn3+4/MhTGqM6lH8+RshoYj2x9+jO
   KHlE5VBZgiezxwTNlshJezZy73F0JOYFAAmfLlK3YbVjvQcIUYYJDDCEo
   guYKrRtg8F0aknTjr2LuhtrobPY5OgHY2elxuE2x9xRqRDRY1DUm2YT1P
   1slctlfSd0IepsNQ3Sv6cm3E2ZUz8cWwEtEsCbE0pCcedrnxepIRQXg/M
   9xrdPPzG+s6+/ud16MPnN4yjyzgmXBBPsrwLsohg6aJu0eooQ2O4ELDs/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="327375968"
X-IronPort-AV: E=Sophos;i="5.99,227,1677571200"; 
   d="scan'208";a="327375968"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2023 02:22:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="687874623"
X-IronPort-AV: E=Sophos;i="5.99,227,1677571200"; 
   d="scan'208";a="687874623"
Received: from lkp-server01.sh.intel.com (HELO 98ee5a99fc83) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 26 Apr 2023 02:22:48 -0700
Received: from kbuild by 98ee5a99fc83 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prbMI-0000Kk-1Y;
	Wed, 26 Apr 2023 09:22:42 +0000
Date: Wed, 26 Apr 2023 17:21:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:xfile-page-caching 187/293] fs/super.c:1748
 __freeze_super() warn: inconsistent returns '&sb->s_umount'.
Message-ID: <202304261733.ffWAw4s9-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git xfile-page-caching
head:   69839640c25abcba17f4ab837ecb39fceae17082
commit: a97da76ed5256d692a02ece01b4032dbf68cbf89 [187/293] vfs: allow filesystem freeze callers to denote who froze the fs
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230426/202304261733.ffWAw4s9-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304261733.ffWAw4s9-lkp@intel.com/

smatch warnings:
fs/super.c:1748 __freeze_super() warn: inconsistent returns '&sb->s_umount'.

vim +1748 fs/super.c

5accdf82ba25ca Jan Kara        2012-06-12  1640  
18e9e5104fcd9a Josef Bacik     2010-03-23  1641  /**
a97da76ed5256d Darrick J. Wong 2023-04-20  1642   * __freeze_super - lock the filesystem and force it into a consistent state
7000d3c424e5bb Randy Dunlap    2010-05-24  1643   * @sb: the super to lock
a97da76ed5256d Darrick J. Wong 2023-04-20  1644   * @cookie: magic value telling us who tried to freeze the fs
18e9e5104fcd9a Josef Bacik     2010-03-23  1645   *
18e9e5104fcd9a Josef Bacik     2010-03-23  1646   * Syncs the super to make sure the filesystem is consistent and calls the fs's
18e9e5104fcd9a Josef Bacik     2010-03-23  1647   * freeze_fs.  Subsequent calls to this without first thawing the fs will return
18e9e5104fcd9a Josef Bacik     2010-03-23  1648   * -EBUSY.
5accdf82ba25ca Jan Kara        2012-06-12  1649   *
a97da76ed5256d Darrick J. Wong 2023-04-20  1650   * If a filesystem freeze is initiated, the sb->s_writers.freeze_cookie value
a97da76ed5256d Darrick J. Wong 2023-04-20  1651   * is set to the @cookie.  The filesystem can only be thawed with the same
a97da76ed5256d Darrick J. Wong 2023-04-20  1652   * cookie value.
a97da76ed5256d Darrick J. Wong 2023-04-20  1653   *
5accdf82ba25ca Jan Kara        2012-06-12  1654   * During this function, sb->s_writers.frozen goes through these values:
5accdf82ba25ca Jan Kara        2012-06-12  1655   *
5accdf82ba25ca Jan Kara        2012-06-12  1656   * SB_UNFROZEN: File system is normal, all writes progress as usual.
5accdf82ba25ca Jan Kara        2012-06-12  1657   *
5accdf82ba25ca Jan Kara        2012-06-12  1658   * SB_FREEZE_WRITE: The file system is in the process of being frozen.  New
5accdf82ba25ca Jan Kara        2012-06-12  1659   * writes should be blocked, though page faults are still allowed. We wait for
5accdf82ba25ca Jan Kara        2012-06-12  1660   * all writes to complete and then proceed to the next stage.
5accdf82ba25ca Jan Kara        2012-06-12  1661   *
5accdf82ba25ca Jan Kara        2012-06-12  1662   * SB_FREEZE_PAGEFAULT: Freezing continues. Now also page faults are blocked
5accdf82ba25ca Jan Kara        2012-06-12  1663   * but internal fs threads can still modify the filesystem (although they
5accdf82ba25ca Jan Kara        2012-06-12  1664   * should not dirty new pages or inodes), writeback can run etc. After waiting
5accdf82ba25ca Jan Kara        2012-06-12  1665   * for all running page faults we sync the filesystem which will clean all
5accdf82ba25ca Jan Kara        2012-06-12  1666   * dirty pages and inodes (no new dirty pages or inodes can be created when
5accdf82ba25ca Jan Kara        2012-06-12  1667   * sync is running).
5accdf82ba25ca Jan Kara        2012-06-12  1668   *
5accdf82ba25ca Jan Kara        2012-06-12  1669   * SB_FREEZE_FS: The file system is frozen. Now all internal sources of fs
5accdf82ba25ca Jan Kara        2012-06-12  1670   * modification are blocked (e.g. XFS preallocation truncation on inode
5accdf82ba25ca Jan Kara        2012-06-12  1671   * reclaim). This is usually implemented by blocking new transactions for
5accdf82ba25ca Jan Kara        2012-06-12  1672   * filesystems that have them and need this additional guard. After all
5accdf82ba25ca Jan Kara        2012-06-12  1673   * internal writers are finished we call ->freeze_fs() to finish filesystem
5accdf82ba25ca Jan Kara        2012-06-12  1674   * freezing. Then we transition to SB_FREEZE_COMPLETE state. This state is
5accdf82ba25ca Jan Kara        2012-06-12  1675   * mostly auxiliary for filesystems to verify they do not modify frozen fs.
5accdf82ba25ca Jan Kara        2012-06-12  1676   *
5accdf82ba25ca Jan Kara        2012-06-12  1677   * sb->s_writers.frozen is protected by sb->s_umount.
18e9e5104fcd9a Josef Bacik     2010-03-23  1678   */
a97da76ed5256d Darrick J. Wong 2023-04-20  1679  static int __freeze_super(struct super_block *sb, unsigned long cookie)
18e9e5104fcd9a Josef Bacik     2010-03-23  1680  {
18e9e5104fcd9a Josef Bacik     2010-03-23  1681  	int ret;
18e9e5104fcd9a Josef Bacik     2010-03-23  1682  
18e9e5104fcd9a Josef Bacik     2010-03-23  1683  	atomic_inc(&sb->s_active);
18e9e5104fcd9a Josef Bacik     2010-03-23  1684  	down_write(&sb->s_umount);
5accdf82ba25ca Jan Kara        2012-06-12  1685  	if (sb->s_writers.frozen != SB_UNFROZEN) {
18e9e5104fcd9a Josef Bacik     2010-03-23  1686  		deactivate_locked_super(sb);
18e9e5104fcd9a Josef Bacik     2010-03-23  1687  		return -EBUSY;
18e9e5104fcd9a Josef Bacik     2010-03-23  1688  	}
18e9e5104fcd9a Josef Bacik     2010-03-23  1689  
e462ec50cb5fad David Howells   2017-07-17  1690  	if (!(sb->s_flags & SB_BORN)) {
dabe0dc194d5d5 Al Viro         2012-01-03  1691  		up_write(&sb->s_umount);
dabe0dc194d5d5 Al Viro         2012-01-03  1692  		return 0;	/* sic - it's "nothing to do" */
dabe0dc194d5d5 Al Viro         2012-01-03  1693  	}
dabe0dc194d5d5 Al Viro         2012-01-03  1694  
a97da76ed5256d Darrick J. Wong 2023-04-20  1695  	sb->s_writers.freeze_cookie = cookie;
bc98a42c1f7d0f David Howells   2017-07-17  1696  	if (sb_rdonly(sb)) {
5accdf82ba25ca Jan Kara        2012-06-12  1697  		/* Nothing to do really... */
5accdf82ba25ca Jan Kara        2012-06-12  1698  		sb->s_writers.frozen = SB_FREEZE_COMPLETE;
18e9e5104fcd9a Josef Bacik     2010-03-23  1699  		up_write(&sb->s_umount);
18e9e5104fcd9a Josef Bacik     2010-03-23  1700  		return 0;
18e9e5104fcd9a Josef Bacik     2010-03-23  1701  	}
18e9e5104fcd9a Josef Bacik     2010-03-23  1702  
5accdf82ba25ca Jan Kara        2012-06-12  1703  	sb->s_writers.frozen = SB_FREEZE_WRITE;
5accdf82ba25ca Jan Kara        2012-06-12  1704  	/* Release s_umount to preserve sb_start_write -> s_umount ordering */
5accdf82ba25ca Jan Kara        2012-06-12  1705  	up_write(&sb->s_umount);
5accdf82ba25ca Jan Kara        2012-06-12  1706  	sb_wait_write(sb, SB_FREEZE_WRITE);
8129ed29644bf5 Oleg Nesterov   2015-08-11  1707  	down_write(&sb->s_umount);
5accdf82ba25ca Jan Kara        2012-06-12  1708  
5accdf82ba25ca Jan Kara        2012-06-12  1709  	/* Now we go and block page faults... */
5accdf82ba25ca Jan Kara        2012-06-12  1710  	sb->s_writers.frozen = SB_FREEZE_PAGEFAULT;
5accdf82ba25ca Jan Kara        2012-06-12  1711  	sb_wait_write(sb, SB_FREEZE_PAGEFAULT);
5accdf82ba25ca Jan Kara        2012-06-12  1712  
5accdf82ba25ca Jan Kara        2012-06-12  1713  	/* All writers are done so after syncing there won't be dirty data */
2719c7160dcfaa Darrick J. Wong 2022-01-30  1714  	ret = sync_filesystem(sb);
2719c7160dcfaa Darrick J. Wong 2022-01-30  1715  	if (ret) {
a97da76ed5256d Darrick J. Wong 2023-04-20  1716  		sb->s_writers.freeze_cookie = 0;
2719c7160dcfaa Darrick J. Wong 2022-01-30  1717  		sb->s_writers.frozen = SB_UNFROZEN;
2719c7160dcfaa Darrick J. Wong 2022-01-30  1718  		sb_freeze_unlock(sb, SB_FREEZE_PAGEFAULT);
2719c7160dcfaa Darrick J. Wong 2022-01-30  1719  		wake_up(&sb->s_writers.wait_unfrozen);
2719c7160dcfaa Darrick J. Wong 2022-01-30  1720  		deactivate_locked_super(sb);
2719c7160dcfaa Darrick J. Wong 2022-01-30  1721  		return ret;
2719c7160dcfaa Darrick J. Wong 2022-01-30  1722  	}
18e9e5104fcd9a Josef Bacik     2010-03-23  1723  
5accdf82ba25ca Jan Kara        2012-06-12  1724  	/* Now wait for internal filesystem counter */
5accdf82ba25ca Jan Kara        2012-06-12  1725  	sb->s_writers.frozen = SB_FREEZE_FS;
5accdf82ba25ca Jan Kara        2012-06-12  1726  	sb_wait_write(sb, SB_FREEZE_FS);
18e9e5104fcd9a Josef Bacik     2010-03-23  1727  
18e9e5104fcd9a Josef Bacik     2010-03-23  1728  	if (sb->s_op->freeze_fs) {
18e9e5104fcd9a Josef Bacik     2010-03-23  1729  		ret = sb->s_op->freeze_fs(sb);
18e9e5104fcd9a Josef Bacik     2010-03-23  1730  		if (ret) {
18e9e5104fcd9a Josef Bacik     2010-03-23  1731  			printk(KERN_ERR
18e9e5104fcd9a Josef Bacik     2010-03-23  1732  				"VFS:Filesystem freeze failed\n");
a97da76ed5256d Darrick J. Wong 2023-04-20  1733  			sb->s_writers.freeze_cookie = 0;
5accdf82ba25ca Jan Kara        2012-06-12  1734  			sb->s_writers.frozen = SB_UNFROZEN;
2719c7160dcfaa Darrick J. Wong 2022-01-30  1735  			sb_freeze_unlock(sb, SB_FREEZE_FS);
5accdf82ba25ca Jan Kara        2012-06-12  1736  			wake_up(&sb->s_writers.wait_unfrozen);
18e9e5104fcd9a Josef Bacik     2010-03-23  1737  			deactivate_locked_super(sb);
18e9e5104fcd9a Josef Bacik     2010-03-23  1738  			return ret;
18e9e5104fcd9a Josef Bacik     2010-03-23  1739  		}
18e9e5104fcd9a Josef Bacik     2010-03-23  1740  	}
5accdf82ba25ca Jan Kara        2012-06-12  1741  	/*
89f39af129382a Oleg Nesterov   2016-09-26  1742  	 * For debugging purposes so that fs can warn if it sees write activity
89f39af129382a Oleg Nesterov   2016-09-26  1743  	 * when frozen is set to SB_FREEZE_COMPLETE, and for thaw_super().
5accdf82ba25ca Jan Kara        2012-06-12  1744  	 */
5accdf82ba25ca Jan Kara        2012-06-12  1745  	sb->s_writers.frozen = SB_FREEZE_COMPLETE;
f1a9622037cd37 Oleg Nesterov   2016-09-26  1746  	lockdep_sb_freeze_release(sb);
18e9e5104fcd9a Josef Bacik     2010-03-23  1747  	up_write(&sb->s_umount);
18e9e5104fcd9a Josef Bacik     2010-03-23 @1748  	return 0;
18e9e5104fcd9a Josef Bacik     2010-03-23  1749  }
a97da76ed5256d Darrick J. Wong 2023-04-20  1750  

:::::: The code at line 1748 was first introduced by commit
:::::: 18e9e5104fcd9a973ffe3eed3816c87f2a1b6cd2 Introduce freeze_super and thaw_super for the fsfreeze ioctl

:::::: TO: Josef Bacik <josef@redhat.com>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
