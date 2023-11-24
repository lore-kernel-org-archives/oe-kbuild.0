Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32972FC4A
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Nov 2023 15:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bm0OACSI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700840488; x=1732376488;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qsPIHRRgWAoBQz/tMdFrACJFDEbt7sk5jbTBxq514Q0=;
  b=Bm0OACSI8TPOd9rC2SIqTPypFxXrO97aifas4EzZUKF6+zCBQhuKNgWJ
   txBvL50A1NcOXHGuzh7HQMoHOHxkBiPsAJ2AbY6cThfgkDlcWoUaZZUfz
   4NPIv9rTnPN1diWPqK0uABDOJ5fNvrgNySJ2Mqi81Z4IQRSZElUHasrnY
   IonciIGx63wPHARSXOKgfkjMzG0SG70dhqWYV5jXTEStt5ZgFLrQhfnn8
   lWurqibPQ+kd/0ysU7RDN3Xlu8bfbwizxw0Vm+jgwvDQQhCnkaXgPu42B
   t6q+VJ8cliAtnaEypMm1WIDnfWNZlUsiAroSy7j8jC155JW3HmozMInvO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="423577108"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="423577108"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 07:41:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="833714376"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="833714376"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 24 Nov 2023 07:41:23 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6YIz-0002xy-1R;
	Fri, 24 Nov 2023 15:41:21 +0000
Date: Fri, 24 Nov 2023 23:41:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [viro-vfs:work.dcache-misc 10/18] fs/dcache.c:2062
 __d_obtain_alias() warn: variable dereferenced before check 'inode' (see
 line 2059)
Message-ID: <202311241915.3OrRNpQB-lkp@intel.com>
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
CC: linux-fsdevel@vger.kernel.org
TO: Al Viro <viro@zeniv.linux.org.uk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git work.dcache-misc
head:   0695819b3988e7e4d8099f8388244c1549d230cc
commit: 8a0af412cf8ba3a000a0e00c0c5dd411b9a0fc2a [10/18] kill d_instantate_anon(), fold __d_instantiate_anon() into remaining caller
:::::: branch date: 7 hours ago
:::::: commit date: 6 days ago
config: i386-randconfig-141-20231124 (https://download.01.org/0day-ci/archive/20231124/202311241915.3OrRNpQB-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20231124/202311241915.3OrRNpQB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311241915.3OrRNpQB-lkp@intel.com/

smatch warnings:
fs/dcache.c:2062 __d_obtain_alias() warn: variable dereferenced before check 'inode' (see line 2059)

vim +/inode +2062 fs/dcache.c

adc0e91ab142ab Al Viro           2012-01-08  2056  
f9c34674bc60e5 Miklos Szeredi    2018-01-19  2057  static struct dentry *__d_obtain_alias(struct inode *inode, bool disconnected)
f9c34674bc60e5 Miklos Szeredi    2018-01-19  2058  {
8a0af412cf8ba3 Al Viro           2023-11-18 @2059  	struct super_block *sb = inode->i_sb;
8a0af412cf8ba3 Al Viro           2023-11-18  2060  	struct dentry *new, *res;
f9c34674bc60e5 Miklos Szeredi    2018-01-19  2061  
f9c34674bc60e5 Miklos Szeredi    2018-01-19 @2062  	if (!inode)
f9c34674bc60e5 Miklos Szeredi    2018-01-19  2063  		return ERR_PTR(-ESTALE);
f9c34674bc60e5 Miklos Szeredi    2018-01-19  2064  	if (IS_ERR(inode))
f9c34674bc60e5 Miklos Szeredi    2018-01-19  2065  		return ERR_CAST(inode);
f9c34674bc60e5 Miklos Szeredi    2018-01-19  2066  
8a0af412cf8ba3 Al Viro           2023-11-18  2067  	res = d_find_any_alias(inode); /* existing alias? */
f9c34674bc60e5 Miklos Szeredi    2018-01-19  2068  	if (res)
8a0af412cf8ba3 Al Viro           2023-11-18  2069  		goto out;
f9c34674bc60e5 Miklos Szeredi    2018-01-19  2070  
8a0af412cf8ba3 Al Viro           2023-11-18  2071  	new = d_alloc_anon(sb);
8a0af412cf8ba3 Al Viro           2023-11-18  2072  	if (!new) {
f9c34674bc60e5 Miklos Szeredi    2018-01-19  2073  		res = ERR_PTR(-ENOMEM);
8a0af412cf8ba3 Al Viro           2023-11-18  2074  		goto out;
f9c34674bc60e5 Miklos Szeredi    2018-01-19  2075  	}
f9c34674bc60e5 Miklos Szeredi    2018-01-19  2076  
8a0af412cf8ba3 Al Viro           2023-11-18  2077  	security_d_instantiate(new, inode);
8a0af412cf8ba3 Al Viro           2023-11-18  2078  	spin_lock(&inode->i_lock);
8a0af412cf8ba3 Al Viro           2023-11-18  2079  	res = __d_find_any_alias(inode); /* recheck under lock */
8a0af412cf8ba3 Al Viro           2023-11-18  2080  	if (likely(!res)) { /* still no alias, attach a disconnected dentry */
8a0af412cf8ba3 Al Viro           2023-11-18  2081  		unsigned add_flags = d_flags_for_inode(inode);
8a0af412cf8ba3 Al Viro           2023-11-18  2082  
8a0af412cf8ba3 Al Viro           2023-11-18  2083  		if (disconnected)
8a0af412cf8ba3 Al Viro           2023-11-18  2084  			add_flags |= DCACHE_DISCONNECTED;
9308a6128d9074 Christoph Hellwig 2008-08-11  2085  
8a0af412cf8ba3 Al Viro           2023-11-18  2086  		spin_lock(&new->d_lock);
8a0af412cf8ba3 Al Viro           2023-11-18  2087  		__d_set_inode_and_type(new, inode, add_flags);
8a0af412cf8ba3 Al Viro           2023-11-18  2088  		hlist_add_head(&new->d_u.d_alias, &inode->i_dentry);
8a0af412cf8ba3 Al Viro           2023-11-18  2089  		if (!disconnected) {
8a0af412cf8ba3 Al Viro           2023-11-18  2090  			hlist_bl_lock(&sb->s_roots);
8a0af412cf8ba3 Al Viro           2023-11-18  2091  			hlist_bl_add_head(&new->d_hash, &sb->s_roots);
8a0af412cf8ba3 Al Viro           2023-11-18  2092  			hlist_bl_unlock(&sb->s_roots);
8a0af412cf8ba3 Al Viro           2023-11-18  2093  		}
8a0af412cf8ba3 Al Viro           2023-11-18  2094  		spin_unlock(&new->d_lock);
8a0af412cf8ba3 Al Viro           2023-11-18  2095  		spin_unlock(&inode->i_lock);
8a0af412cf8ba3 Al Viro           2023-11-18  2096  		inode = NULL; /* consumed by new->d_inode */
8a0af412cf8ba3 Al Viro           2023-11-18  2097  		res = new;
8a0af412cf8ba3 Al Viro           2023-11-18  2098  	} else {
8a0af412cf8ba3 Al Viro           2023-11-18  2099  		spin_unlock(&inode->i_lock);
8a0af412cf8ba3 Al Viro           2023-11-18  2100  		dput(new);
8a0af412cf8ba3 Al Viro           2023-11-18  2101  	}
8a0af412cf8ba3 Al Viro           2023-11-18  2102  
8a0af412cf8ba3 Al Viro           2023-11-18  2103   out:
9308a6128d9074 Christoph Hellwig 2008-08-11  2104  	iput(inode);
9308a6128d9074 Christoph Hellwig 2008-08-11  2105  	return res;
4ea3ada2955e45 Christoph Hellwig 2008-08-11  2106  }
1a0a397e41cb1b J. Bruce Fields   2014-02-14  2107  

:::::: The code at line 2062 was first introduced by commit
:::::: f9c34674bc60e5fc0af6ec6513517ed9182862b9 vfs: factor out helpers d_instantiate_anon() and d_alloc_anon()

:::::: TO: Miklos Szeredi <miklos@szeredi.hu>
:::::: CC: Miklos Szeredi <mszeredi@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
