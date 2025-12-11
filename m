Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5022BDC3F
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Dec 2025 02:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765419814; cv=none; b=Asd5769cLHuoZbc5Yv3Qqdds+Laysgv5WX8g6kCKwdlzU33ZpWJuDYC+93IbntKWoUgeyQkH75KkaNdIN76w8OVhV1nhZkRHYReL9jM/NLHhFa94N/ZwcyBJ3DoBCZ7lAu33FWCvFvoF/rDOtEUjNNid0s08vJSMtfY+INEkTlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765419814; c=relaxed/simple;
	bh=PtJZqVDCo1sGYWk9gUlCXsp9tZfD/2GIFAoRJ/GcDR0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GXtyH/qc7B1/AHfEZFE6lPp7c3UYH7lnJ8i0Fe/Yl3eNLnbmo94F8dr9DB7Pkd8wyjYi6pXC+CEkQP+tThYJom+V0teNc11SdIs0AoDt+0CSRWRllG4bWV7TMUWLMnUdJsy4INUt1iyNTLxdIFtrlmyUpWO5WJEjx9cza4JkVJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PNZEsCbB; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PNZEsCbB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765419812; x=1796955812;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PtJZqVDCo1sGYWk9gUlCXsp9tZfD/2GIFAoRJ/GcDR0=;
  b=PNZEsCbB2ToIVhyi9ZPePXE/xrHESRVJP9+zZdVUtGLkdWdou+8Iwz39
   7Ar+EXmD9XbQFPeQ+GwLtXPVIla5zT+9+gbOK9DPhF9GXG7LW3CI9lCGZ
   yU9o6kENpmUslbGP7sYb7LPZ8BNLI5QVHF3EtwGgnYCS65IWN+CSEW/Py
   u+NAm+KFzuyExvhArRPnHEWGdzuh+7u6ydf1t6JRFA+WgpObFZZWjXDmq
   qKKWgVAByArVz8DLUce1X48z/4MxJ1AmlBGztTX18bOiTosfC9s2Q4605
   P/NR/drHPkqH+XrMAjK20kJqD8w3pGPO9CqtiHTco84dsvnhpsZA104eB
   g==;
X-CSE-ConnectionGUID: lwNCT9qITNSjh4Nasq495Q==
X-CSE-MsgGUID: sE2vOSGsRHqSrdbTJFOsdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="69984964"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="69984964"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 18:23:28 -0800
X-CSE-ConnectionGUID: Yc5B5ZE6TwOe7Sz2X3Vl6Q==
X-CSE-MsgGUID: X7tK7zJzTB2Zw3j04UKVdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="197487223"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Dec 2025 18:23:26 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTWKy-0000000041n-30wb;
	Thu, 11 Dec 2025 02:23:24 +0000
Date: Thu, 11 Dec 2025 10:22:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/cachefiles/namei.c:203 cachefiles_get_directory() warn: passing
 zero to 'ERR_PTR'
Message-ID: <202512111002.nWtkWQkS-lkp@intel.com>
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
TO: Marc Dionne <marc.dionne@auristor.com>
CC: Christian Brauner <brauner@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8c8081cc599fcafa25371d50959c17e154f9fd08
commit: 406fad7698f5bf21ab6b5ca195bf4b9e0b3990ed cachefiles: Fix oops in vfs_mkdir from cachefiles_get_directory
date:   9 months ago
:::::: branch date: 83 minutes ago
:::::: commit date: 9 months ago
config: sparc64-randconfig-r073-20251211 (https://download.01.org/0day-ci/archive/20251211/202512111002.nWtkWQkS-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512111002.nWtkWQkS-lkp@intel.com/

smatch warnings:
fs/cachefiles/namei.c:203 cachefiles_get_directory() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +203 fs/cachefiles/namei.c

169379eaef933c David Howells  2021-11-18   80  
32759f7d7af545 David Howells  2021-10-21   81  /*
32759f7d7af545 David Howells  2021-10-21   82   * get a subdirectory
32759f7d7af545 David Howells  2021-10-21   83   */
32759f7d7af545 David Howells  2021-10-21   84  struct dentry *cachefiles_get_directory(struct cachefiles_cache *cache,
32759f7d7af545 David Howells  2021-10-21   85  					struct dentry *dir,
32759f7d7af545 David Howells  2021-10-21   86  					const char *dirname,
32759f7d7af545 David Howells  2021-10-21   87  					bool *_is_new)
32759f7d7af545 David Howells  2021-10-21   88  {
32759f7d7af545 David Howells  2021-10-21   89  	struct dentry *subdir;
32759f7d7af545 David Howells  2021-10-21   90  	struct path path;
32759f7d7af545 David Howells  2021-10-21   91  	int ret;
32759f7d7af545 David Howells  2021-10-21   92  
32759f7d7af545 David Howells  2021-10-21   93  	_enter(",,%s", dirname);
32759f7d7af545 David Howells  2021-10-21   94  
32759f7d7af545 David Howells  2021-10-21   95  	/* search the current directory for the element name */
32759f7d7af545 David Howells  2021-10-21   96  	inode_lock_nested(d_inode(dir), I_MUTEX_PARENT);
32759f7d7af545 David Howells  2021-10-21   97  
32759f7d7af545 David Howells  2021-10-21   98  retry:
32759f7d7af545 David Howells  2021-10-21   99  	ret = cachefiles_inject_read_error();
32759f7d7af545 David Howells  2021-10-21  100  	if (ret == 0)
32759f7d7af545 David Howells  2021-10-21  101  		subdir = lookup_one_len(dirname, dir, strlen(dirname));
32759f7d7af545 David Howells  2021-10-21  102  	else
32759f7d7af545 David Howells  2021-10-21  103  		subdir = ERR_PTR(ret);
8c39b8bc82aafc David Howells  2022-01-14  104  	trace_cachefiles_lookup(NULL, dir, subdir);
32759f7d7af545 David Howells  2021-10-21  105  	if (IS_ERR(subdir)) {
32759f7d7af545 David Howells  2021-10-21  106  		trace_cachefiles_vfs_error(NULL, d_backing_inode(dir),
32759f7d7af545 David Howells  2021-10-21  107  					   PTR_ERR(subdir),
32759f7d7af545 David Howells  2021-10-21  108  					   cachefiles_trace_lookup_error);
32759f7d7af545 David Howells  2021-10-21  109  		if (PTR_ERR(subdir) == -ENOMEM)
32759f7d7af545 David Howells  2021-10-21  110  			goto nomem_d_alloc;
32759f7d7af545 David Howells  2021-10-21  111  		goto lookup_error;
32759f7d7af545 David Howells  2021-10-21  112  	}
32759f7d7af545 David Howells  2021-10-21  113  
32759f7d7af545 David Howells  2021-10-21  114  	_debug("subdir -> %pd %s",
32759f7d7af545 David Howells  2021-10-21  115  	       subdir, d_backing_inode(subdir) ? "positive" : "negative");
32759f7d7af545 David Howells  2021-10-21  116  
32759f7d7af545 David Howells  2021-10-21  117  	/* we need to create the subdir if it doesn't exist yet */
32759f7d7af545 David Howells  2021-10-21  118  	if (d_is_negative(subdir)) {
3929eca769b5a2 David Howells  2021-10-21  119  		ret = cachefiles_has_space(cache, 1, 0,
3929eca769b5a2 David Howells  2021-10-21  120  					   cachefiles_has_space_for_create);
32759f7d7af545 David Howells  2021-10-21  121  		if (ret < 0)
32759f7d7af545 David Howells  2021-10-21  122  			goto mkdir_error;
32759f7d7af545 David Howells  2021-10-21  123  
32759f7d7af545 David Howells  2021-10-21  124  		_debug("attempt mkdir");
32759f7d7af545 David Howells  2021-10-21  125  
32759f7d7af545 David Howells  2021-10-21  126  		path.mnt = cache->mnt;
32759f7d7af545 David Howells  2021-10-21  127  		path.dentry = dir;
32759f7d7af545 David Howells  2021-10-21  128  		ret = security_path_mkdir(&path, subdir, 0700);
32759f7d7af545 David Howells  2021-10-21  129  		if (ret < 0)
32759f7d7af545 David Howells  2021-10-21  130  			goto mkdir_error;
406fad7698f5bf Marc Dionne    2025-03-25  131  		ret = cachefiles_inject_write_error();
406fad7698f5bf Marc Dionne    2025-03-25  132  		if (ret == 0)
c54b386969a581 NeilBrown      2025-02-27  133  			subdir = vfs_mkdir(&nop_mnt_idmap, d_inode(dir), subdir, 0700);
406fad7698f5bf Marc Dionne    2025-03-25  134  		else
406fad7698f5bf Marc Dionne    2025-03-25  135  			subdir = ERR_PTR(ret);
c54b386969a581 NeilBrown      2025-02-27  136  		if (IS_ERR(subdir)) {
32759f7d7af545 David Howells  2021-10-21  137  			trace_cachefiles_vfs_error(NULL, d_inode(dir), ret,
32759f7d7af545 David Howells  2021-10-21  138  						   cachefiles_trace_mkdir_error);
32759f7d7af545 David Howells  2021-10-21  139  			goto mkdir_error;
32759f7d7af545 David Howells  2021-10-21  140  		}
8c39b8bc82aafc David Howells  2022-01-14  141  		trace_cachefiles_mkdir(dir, subdir);
32759f7d7af545 David Howells  2021-10-21  142  
c54b386969a581 NeilBrown      2025-02-27  143  		if (unlikely(d_unhashed(subdir) || d_is_negative(subdir))) {
c54b386969a581 NeilBrown      2025-02-27  144  			dput(subdir);
32759f7d7af545 David Howells  2021-10-21  145  			goto retry;
32759f7d7af545 David Howells  2021-10-21  146  		}
32759f7d7af545 David Howells  2021-10-21  147  		ASSERT(d_backing_inode(subdir));
32759f7d7af545 David Howells  2021-10-21  148  
32759f7d7af545 David Howells  2021-10-21  149  		_debug("mkdir -> %pd{ino=%lu}",
32759f7d7af545 David Howells  2021-10-21  150  		       subdir, d_backing_inode(subdir)->i_ino);
32759f7d7af545 David Howells  2021-10-21  151  		if (_is_new)
32759f7d7af545 David Howells  2021-10-21  152  			*_is_new = true;
32759f7d7af545 David Howells  2021-10-21  153  	}
32759f7d7af545 David Howells  2021-10-21  154  
32759f7d7af545 David Howells  2021-10-21  155  	/* Tell rmdir() it's not allowed to delete the subdir */
32759f7d7af545 David Howells  2021-10-21  156  	inode_lock(d_inode(subdir));
32759f7d7af545 David Howells  2021-10-21  157  	inode_unlock(d_inode(dir));
32759f7d7af545 David Howells  2021-10-21  158  
08d7a6fb7e44ae Miklos Szeredi 2022-09-24  159  	if (!__cachefiles_mark_inode_in_use(NULL, d_inode(subdir))) {
08d7a6fb7e44ae Miklos Szeredi 2022-09-24  160  		pr_notice("cachefiles: Inode already in use: %pd (B=%lx)\n",
08d7a6fb7e44ae Miklos Szeredi 2022-09-24  161  			  subdir, d_inode(subdir)->i_ino);
32759f7d7af545 David Howells  2021-10-21  162  		goto mark_error;
08d7a6fb7e44ae Miklos Szeredi 2022-09-24  163  	}
32759f7d7af545 David Howells  2021-10-21  164  
32759f7d7af545 David Howells  2021-10-21  165  	inode_unlock(d_inode(subdir));
32759f7d7af545 David Howells  2021-10-21  166  
32759f7d7af545 David Howells  2021-10-21  167  	/* we need to make sure the subdir is a directory */
32759f7d7af545 David Howells  2021-10-21  168  	ASSERT(d_backing_inode(subdir));
32759f7d7af545 David Howells  2021-10-21  169  
32759f7d7af545 David Howells  2021-10-21  170  	if (!d_can_lookup(subdir)) {
32759f7d7af545 David Howells  2021-10-21  171  		pr_err("%s is not a directory\n", dirname);
32759f7d7af545 David Howells  2021-10-21  172  		ret = -EIO;
32759f7d7af545 David Howells  2021-10-21  173  		goto check_error;
32759f7d7af545 David Howells  2021-10-21  174  	}
32759f7d7af545 David Howells  2021-10-21  175  
32759f7d7af545 David Howells  2021-10-21  176  	ret = -EPERM;
32759f7d7af545 David Howells  2021-10-21  177  	if (!(d_backing_inode(subdir)->i_opflags & IOP_XATTR) ||
32759f7d7af545 David Howells  2021-10-21  178  	    !d_backing_inode(subdir)->i_op->lookup ||
32759f7d7af545 David Howells  2021-10-21  179  	    !d_backing_inode(subdir)->i_op->mkdir ||
32759f7d7af545 David Howells  2021-10-21  180  	    !d_backing_inode(subdir)->i_op->rename ||
32759f7d7af545 David Howells  2021-10-21  181  	    !d_backing_inode(subdir)->i_op->rmdir ||
32759f7d7af545 David Howells  2021-10-21  182  	    !d_backing_inode(subdir)->i_op->unlink)
32759f7d7af545 David Howells  2021-10-21  183  		goto check_error;
32759f7d7af545 David Howells  2021-10-21  184  
32759f7d7af545 David Howells  2021-10-21  185  	_leave(" = [%lu]", d_backing_inode(subdir)->i_ino);
32759f7d7af545 David Howells  2021-10-21  186  	return subdir;
32759f7d7af545 David Howells  2021-10-21  187  
32759f7d7af545 David Howells  2021-10-21  188  check_error:
32759f7d7af545 David Howells  2021-10-21  189  	cachefiles_put_directory(subdir);
32759f7d7af545 David Howells  2021-10-21  190  	_leave(" = %d [check]", ret);
32759f7d7af545 David Howells  2021-10-21  191  	return ERR_PTR(ret);
32759f7d7af545 David Howells  2021-10-21  192  
32759f7d7af545 David Howells  2021-10-21  193  mark_error:
32759f7d7af545 David Howells  2021-10-21  194  	inode_unlock(d_inode(subdir));
32759f7d7af545 David Howells  2021-10-21  195  	dput(subdir);
32759f7d7af545 David Howells  2021-10-21  196  	return ERR_PTR(-EBUSY);
32759f7d7af545 David Howells  2021-10-21  197  
32759f7d7af545 David Howells  2021-10-21  198  mkdir_error:
32759f7d7af545 David Howells  2021-10-21  199  	inode_unlock(d_inode(dir));
c54b386969a581 NeilBrown      2025-02-27  200  	if (!IS_ERR(subdir))
32759f7d7af545 David Howells  2021-10-21  201  		dput(subdir);
32759f7d7af545 David Howells  2021-10-21  202  	pr_err("mkdir %s failed with error %d\n", dirname, ret);
32759f7d7af545 David Howells  2021-10-21 @203  	return ERR_PTR(ret);
32759f7d7af545 David Howells  2021-10-21  204  
32759f7d7af545 David Howells  2021-10-21  205  lookup_error:
32759f7d7af545 David Howells  2021-10-21  206  	inode_unlock(d_inode(dir));
32759f7d7af545 David Howells  2021-10-21  207  	ret = PTR_ERR(subdir);
32759f7d7af545 David Howells  2021-10-21  208  	pr_err("Lookup %s failed with error %d\n", dirname, ret);
32759f7d7af545 David Howells  2021-10-21  209  	return ERR_PTR(ret);
32759f7d7af545 David Howells  2021-10-21  210  
32759f7d7af545 David Howells  2021-10-21  211  nomem_d_alloc:
32759f7d7af545 David Howells  2021-10-21  212  	inode_unlock(d_inode(dir));
32759f7d7af545 David Howells  2021-10-21  213  	_leave(" = -ENOMEM");
32759f7d7af545 David Howells  2021-10-21  214  	return ERR_PTR(-ENOMEM);
32759f7d7af545 David Howells  2021-10-21  215  }
32759f7d7af545 David Howells  2021-10-21  216  

:::::: The code at line 203 was first introduced by commit
:::::: 32759f7d7af5454c616574190c388e1a59184f92 cachefiles: Implement a function to get/create a directory in the cache

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
