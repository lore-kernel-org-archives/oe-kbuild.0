Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390BB79FD
	for <oe-kbuild@lists.linux.dev>; Sat,  6 Jan 2024 14:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U49JqGPq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704551523; x=1736087523;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=38l0B1kuAWMErfmMr8I1PAjKGFWGEZ7C9RFSvIuAZZk=;
  b=U49JqGPqh5HUHooYBC7Q/xCOV9v1WLYljZede3ozOF31eNZMxrkhb8q5
   MLgXa44R9nC8Z86sy+rsE2W25VxRwR36dXxlnica+VzE6uUsCuy51+i+8
   HHxJcGQC3aKPOq4pB9IItZeGfpbqDEFtsv7I57sRH0eKs5se3uef1hnAW
   rIn+OUv5GQWZnaFxP7lg74UzbyPd60uttBvQBr9eEp/b/qgMRz06liVTS
   fVKgB55As8QJhTtx27FBqpn3MYJ9RGztYv4uaAdCpiIv/OSBVdfiyX8GL
   A34g8IHF0MPPFj0xQkWL+E2WFXuNUdtedxIdkuk7txaI3mLWGO/RL+EDl
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10945"; a="377149978"
X-IronPort-AV: E=Sophos;i="6.04,337,1695711600"; 
   d="scan'208";a="377149978"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2024 06:31:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10945"; a="1112338604"
X-IronPort-AV: E=Sophos;i="6.04,337,1695711600"; 
   d="scan'208";a="1112338604"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 06 Jan 2024 06:31:57 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rM7iN-0002ZX-1B;
	Sat, 06 Jan 2024 14:31:55 +0000
Date: Sat, 6 Jan 2024 22:31:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/namei.c:1689 lookup_fast() warn: passing zero to 'ERR_PTR'
Message-ID: <202401062254.K5xfducr-lkp@intel.com>
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
TO: Al Viro <viro@zeniv.linux.org.uk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   95c8a35f1c017327eab3b6a2ff5c04255737c856
commit: 20e343571cefe31b3dba3e61c9b057781fbce40a lookup_fast(): take mount traversal into callers
date:   3 years, 10 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 3 years, 10 months ago
config: i386-randconfig-141-20240106 (https://download.01.org/0day-ci/archive/20240106/202401062254.K5xfducr-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202401062254.K5xfducr-lkp@intel.com/

New smatch warnings:
fs/namei.c:1689 lookup_fast() warn: passing zero to 'ERR_PTR'

Old smatch warnings:
fs/namei.c:1592 lookup_dcache() warn: passing zero to 'ERR_PTR'
fs/namei.c:2065 hash_name() error: uninitialized symbol 'bdata'.

vim +/ERR_PTR +1689 fs/namei.c

a32555466caee3 Al Viro           2012-03-30  1630  
20e343571cefe3 Al Viro           2020-01-09  1631  static struct dentry *lookup_fast(struct nameidata *nd,
20e343571cefe3 Al Viro           2020-01-09  1632  				  struct inode **inode,
254cf582127b20 Al Viro           2015-05-05  1633  			          unsigned *seqp)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1634  {
31e6b01f4183ff Nick Piggin       2011-01-07  1635  	struct dentry *dentry, *parent = nd->path.dentry;
5a18fff2090c3a Al Viro           2011-03-11  1636  	int status = 1;
9875cf806403fa David Howells     2011-01-14  1637  
b04f784e5d19ed Nick Piggin       2010-08-18  1638  	/*
b04f784e5d19ed Nick Piggin       2010-08-18  1639  	 * Rename seqlock is not required here because in the off chance
5d0f49c136b520 Al Viro           2016-03-05  1640  	 * of a false negative due to a concurrent rename, the caller is
5d0f49c136b520 Al Viro           2016-03-05  1641  	 * going to fall back to non-racy lookup.
b04f784e5d19ed Nick Piggin       2010-08-18  1642  	 */
31e6b01f4183ff Nick Piggin       2011-01-07  1643  	if (nd->flags & LOOKUP_RCU) {
31e6b01f4183ff Nick Piggin       2011-01-07  1644  		unsigned seq;
da53be12bbb4fa Linus Torvalds    2013-05-21  1645  		dentry = __d_lookup_rcu(parent, &nd->last, &seq);
5d0f49c136b520 Al Viro           2016-03-05  1646  		if (unlikely(!dentry)) {
4675ac39b5dd5f Al Viro           2017-01-09  1647  			if (unlazy_walk(nd))
20e343571cefe3 Al Viro           2020-01-09  1648  				return ERR_PTR(-ECHILD);
20e343571cefe3 Al Viro           2020-01-09  1649  			return NULL;
5d0f49c136b520 Al Viro           2016-03-05  1650  		}
5a18fff2090c3a Al Viro           2011-03-11  1651  
12f8ad4b0533d9 Linus Torvalds    2012-05-04  1652  		/*
12f8ad4b0533d9 Linus Torvalds    2012-05-04  1653  		 * This sequence count validates that the inode matches
12f8ad4b0533d9 Linus Torvalds    2012-05-04  1654  		 * the dentry name information from lookup.
12f8ad4b0533d9 Linus Torvalds    2012-05-04  1655  		 */
63afdfc781e10c David Howells     2015-05-06  1656  		*inode = d_backing_inode(dentry);
5d0f49c136b520 Al Viro           2016-03-05  1657  		if (unlikely(read_seqcount_retry(&dentry->d_seq, seq)))
20e343571cefe3 Al Viro           2020-01-09  1658  			return ERR_PTR(-ECHILD);
12f8ad4b0533d9 Linus Torvalds    2012-05-04  1659  
12f8ad4b0533d9 Linus Torvalds    2012-05-04  1660  		/*
12f8ad4b0533d9 Linus Torvalds    2012-05-04  1661  		 * This sequence count validates that the parent had no
12f8ad4b0533d9 Linus Torvalds    2012-05-04  1662  		 * changes while we did the lookup of the dentry above.
12f8ad4b0533d9 Linus Torvalds    2012-05-04  1663  		 *
12f8ad4b0533d9 Linus Torvalds    2012-05-04  1664  		 * The memory barrier in read_seqcount_begin of child is
12f8ad4b0533d9 Linus Torvalds    2012-05-04  1665  		 *  enough, we can use __read_seqcount_retry here.
12f8ad4b0533d9 Linus Torvalds    2012-05-04  1666  		 */
5d0f49c136b520 Al Viro           2016-03-05  1667  		if (unlikely(__read_seqcount_retry(&parent->d_seq, nd->seq)))
20e343571cefe3 Al Viro           2020-01-09  1668  			return ERR_PTR(-ECHILD);
5a18fff2090c3a Al Viro           2011-03-11  1669  
254cf582127b20 Al Viro           2015-05-05  1670  		*seqp = seq;
5d0f49c136b520 Al Viro           2016-03-05  1671  		status = d_revalidate(dentry, nd->flags);
c153007b7b7a65 Al Viro           2020-01-09  1672  		if (likely(status > 0))
20e343571cefe3 Al Viro           2020-01-09  1673  			return dentry;
4675ac39b5dd5f Al Viro           2017-01-09  1674  		if (unlazy_child(nd, dentry, seq))
20e343571cefe3 Al Viro           2020-01-09  1675  			return ERR_PTR(-ECHILD);
209a7fb2104f27 Al Viro           2017-01-09  1676  		if (unlikely(status == -ECHILD))
209a7fb2104f27 Al Viro           2017-01-09  1677  			/* we'd been told to redo it in non-rcu mode */
209a7fb2104f27 Al Viro           2017-01-09  1678  			status = d_revalidate(dentry, nd->flags);
5a18fff2090c3a Al Viro           2011-03-11  1679  	} else {
e97cdc87be5804 Al Viro           2013-01-24  1680  		dentry = __d_lookup(parent, &nd->last);
81e6f520898edb Al Viro           2012-03-30  1681  		if (unlikely(!dentry))
20e343571cefe3 Al Viro           2020-01-09  1682  			return NULL;
4ce16ef3fed92c Al Viro           2012-06-10  1683  		status = d_revalidate(dentry, nd->flags);
5a18fff2090c3a Al Viro           2011-03-11  1684  	}
5d0f49c136b520 Al Viro           2016-03-05  1685  	if (unlikely(status <= 0)) {
e9742b5332061b Al Viro           2016-03-05  1686  		if (!status)
5542aa2fa7f6cd Eric W. Biederman 2014-02-13  1687  			d_invalidate(dentry);
5a18fff2090c3a Al Viro           2011-03-11  1688  		dput(dentry);
20e343571cefe3 Al Viro           2020-01-09 @1689  		return ERR_PTR(status);
5a18fff2090c3a Al Viro           2011-03-11  1690  	}
20e343571cefe3 Al Viro           2020-01-09  1691  	return dentry;
697f514df10b0f Miklos Szeredi    2012-05-21  1692  }
697f514df10b0f Miklos Szeredi    2012-05-21  1693  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
