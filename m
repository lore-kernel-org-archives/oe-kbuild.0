Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441F636D
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Mar 2023 10:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679135744; x=1710671744;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lh2bWG7HEScsPj/SDNrxyrBqW9ifGi0zlgBiAPMJwQ4=;
  b=hTFO0Z1fS+RtfaU4vHxSPx4ESNvalUUcJxRfCuZJ7beewZvqkWCESJ8G
   004T8avcLUqgTezKuylwvUQbqPipo2hLcjERiPoWHqABtN4hLhCKLhXsO
   qL2cajWdFvON5w2E2nqX/he3l3Oc3qohqYbbRhgjoSCjweGAhpf6xGk/6
   tP1L9e1XyTNhWEQT8Sy+UYYYnQLceoD7Sf7Ju+RxLIGJp37Fqwpe7x1Gr
   o7E9gIR0uJgmhbOXTfnMV5rN0KTgD51tu2exoCaz/hgpXsTrdLTugXh8Y
   i6tW3H4dzMP8hjBfYY+IXv4tfFNLdCtfnuN0MohsH43yeMGUD5kW/GOAu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="366131584"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="366131584"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 03:35:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="854753792"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="854753792"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 18 Mar 2023 03:35:42 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdTuX-000A0c-1T;
	Sat, 18 Mar 2023 10:35:41 +0000
Date: Sat, 18 Mar 2023 18:35:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [vfs-idmapping:b4/fs-tucked-mounts 5/6] fs/namespace.c:2437
 lock_mount_mountpoint() warn: inconsistent returns
 '&dentry->d_inode->i_rwsem'.
Message-ID: <202303181854.8isL7q7h-lkp@intel.com>
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
CC: Seth Forshee <sforshee@kernel.org>
TO: Christian Brauner <brauner@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/idmapping.git b4/fs-tucked-mounts
head:   9574d94575cd22b2ce0f138170083abce70f762e
commit: 2effb170ab9bcaf85b2babc8905a0e5f598a0b99 [5/6] fs: allow to tuck mounts explicitly
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230318/202303181854.8isL7q7h-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303181854.8isL7q7h-lkp@intel.com/

New smatch warnings:
fs/namespace.c:2437 lock_mount_mountpoint() warn: inconsistent returns '&dentry->d_inode->i_rwsem'.

Old smatch warnings:
fs/namespace.c:3311 finish_automount() warn: inconsistent returns '&dentry->d_inode->i_rwsem'.
fs/namespace.c:4261 mount_setattr_prepare() error: uninitialized symbol 'err'.

vim +2437 fs/namespace.c

b90fa9ae8f51f0 Ram Pai           2005-11-07  2381  
2effb170ab9bca Christian Brauner 2023-02-27  2382  /**
2effb170ab9bca Christian Brauner 2023-02-27  2383   * lock_mount_mountpoint - lock mount and mountpoint
2effb170ab9bca Christian Brauner 2023-02-27  2384   * @path: target path
2effb170ab9bca Christian Brauner 2023-02-27  2385   * @tuck: whether we intend to tuck a mount beneath @path
2effb170ab9bca Christian Brauner 2023-02-27  2386   *
2effb170ab9bca Christian Brauner 2023-02-27  2387   * Follow the mount stack on @path until the top mount is found.
2effb170ab9bca Christian Brauner 2023-02-27  2388   *
2effb170ab9bca Christian Brauner 2023-02-27  2389   * If we intend to mount on top of @path->mnt acquire the inode_lock()
2effb170ab9bca Christian Brauner 2023-02-27  2390   * for the top mount's ->mnt_root to protect against concurrent removal
2effb170ab9bca Christian Brauner 2023-02-27  2391   * of our prospective mountpoint from another mount namespace.
2effb170ab9bca Christian Brauner 2023-02-27  2392   *
2effb170ab9bca Christian Brauner 2023-02-27  2393   * If we intend to tuck beneath the top mount @m acquire the
2effb170ab9bca Christian Brauner 2023-02-27  2394   * inode_lock() on @m's mountpoint @mp on @m->mnt_parent. Otherwise we
2effb170ab9bca Christian Brauner 2023-02-27  2395   * risk racing with someone who unlinked @mp from another mount
2effb170ab9bca Christian Brauner 2023-02-27  2396   * namespace where @m doesn't have a child mount mounted @mp. We don't
2effb170ab9bca Christian Brauner 2023-02-27  2397   * care if @m->mnt_root/@path->dentry is removed (as long as
2effb170ab9bca Christian Brauner 2023-02-27  2398   * @path->dentry isn't equal to @m->mnt_mountpoint of course).
2effb170ab9bca Christian Brauner 2023-02-27  2399   *
2effb170ab9bca Christian Brauner 2023-02-27  2400   * Return: Either the target mountpoint on the top mount or the top
2effb170ab9bca Christian Brauner 2023-02-27  2401   *         mount's mountpoint.
2effb170ab9bca Christian Brauner 2023-02-27  2402   */
2effb170ab9bca Christian Brauner 2023-02-27  2403  static struct mountpoint *lock_mount_mountpoint(struct path *path, bool tuck)
b12cea9198fa99 Al Viro           2011-03-18  2404  {
b62db2954cb1e6 Christian Brauner 2023-02-27  2405  	struct vfsmount *mnt = path->mnt;
b62db2954cb1e6 Christian Brauner 2023-02-27  2406  	struct dentry *dentry;
b62db2954cb1e6 Christian Brauner 2023-02-27  2407  	struct mountpoint *mp;
b62db2954cb1e6 Christian Brauner 2023-02-27  2408  
b62db2954cb1e6 Christian Brauner 2023-02-27  2409  	for (;;) {
2effb170ab9bca Christian Brauner 2023-02-27  2410  		dentry = tuck ? real_mount(mnt)->mnt_mountpoint : path->dentry;
5955102c9984fa Al Viro           2016-01-22  2411  		inode_lock(dentry->d_inode);
84d17192d2afd5 Al Viro           2013-03-15  2412  		if (unlikely(cant_mount(dentry))) {
5955102c9984fa Al Viro           2016-01-22  2413  			inode_unlock(dentry->d_inode);
84d17192d2afd5 Al Viro           2013-03-15  2414  			return ERR_PTR(-ENOENT);
b12cea9198fa99 Al Viro           2011-03-18  2415  		}
b62db2954cb1e6 Christian Brauner 2023-02-27  2416  
97216be09efd41 Al Viro           2013-03-16  2417  		namespace_lock();
b62db2954cb1e6 Christian Brauner 2023-02-27  2418  
b12cea9198fa99 Al Viro           2011-03-18  2419  		mnt = lookup_mnt(path);
b62db2954cb1e6 Christian Brauner 2023-02-27  2420  		if (likely(!mnt))
b62db2954cb1e6 Christian Brauner 2023-02-27  2421  			break;
b62db2954cb1e6 Christian Brauner 2023-02-27  2422  
b62db2954cb1e6 Christian Brauner 2023-02-27  2423  		namespace_unlock();
b62db2954cb1e6 Christian Brauner 2023-02-27  2424  		inode_unlock(dentry->d_inode);
b62db2954cb1e6 Christian Brauner 2023-02-27  2425  		path_put(path);
b62db2954cb1e6 Christian Brauner 2023-02-27  2426  		path->mnt = mnt;
b62db2954cb1e6 Christian Brauner 2023-02-27  2427  		path->dentry = dget(mnt->mnt_root);
b62db2954cb1e6 Christian Brauner 2023-02-27  2428  	}
b62db2954cb1e6 Christian Brauner 2023-02-27  2429  
b62db2954cb1e6 Christian Brauner 2023-02-27  2430  	mp = get_mountpoint(dentry);
84d17192d2afd5 Al Viro           2013-03-15  2431  	if (IS_ERR(mp)) {
97216be09efd41 Al Viro           2013-03-16  2432  		namespace_unlock();
5955102c9984fa Al Viro           2016-01-22  2433  		inode_unlock(dentry->d_inode);
84d17192d2afd5 Al Viro           2013-03-15  2434  		return mp;
84d17192d2afd5 Al Viro           2013-03-15  2435  	}
b62db2954cb1e6 Christian Brauner 2023-02-27  2436  
84d17192d2afd5 Al Viro           2013-03-15 @2437  	return mp;
84d17192d2afd5 Al Viro           2013-03-15  2438  }
b12cea9198fa99 Al Viro           2011-03-18  2439  

:::::: The code at line 2437 was first introduced by commit
:::::: 84d17192d2afd52aeba88c71ae4959a015f56a38 get rid of full-hash scan on detaching vfsmounts

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
