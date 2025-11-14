Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C9B2F4A00
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Nov 2025 06:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763102885; cv=none; b=WS8YDdvQBE6aUCLfjPtyd/5Tlh+hcbtIJO2iPXS0xUKnqE/FhrvxitnRcknitLci0hNRPQ7lz9qFWZVpUJpv+62VwZU1i5NUTddM4rgyAG4g+2RXpno36ioQFZmsJ/UmQCrRbletxgN8NJ/WhC3eAVbAHcDZDoq8Q4TGgHxsqt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763102885; c=relaxed/simple;
	bh=lBZgbmgMG/hvtAQzdacExJZk0vdGzLEkM+dsGC1ItpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kL1P6uVupaViP4lF/KYJIrx7zRlTYcXyraFyWpiiUBw7c2YLPSQICsJ7NKkFhqx3Wh/rARnqdES+bRFqPcIjI93i+OTaeHp6mk6pnG3zAl4NmHhcfaEd37Pnz1Cr/gDSLJcQXLZ+OkYvfAYOdMOjtTd6PlZhj1xEMkO5elFIjow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U6SaeaNp; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U6SaeaNp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763102883; x=1794638883;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lBZgbmgMG/hvtAQzdacExJZk0vdGzLEkM+dsGC1ItpQ=;
  b=U6SaeaNp2FCIbXasaVeFvV067JkK/MYlDP12cS1x4nfZ9vKRuCmEH6db
   z9gzW72dZzlO/o5V4B7utT/ydL9pAItm2+LOMCfGrtbPR8mnvrHhgruZo
   Md1NFSwv0q39gm0I4TQ6fZR5rSbaPWqGELL5MK/wTseLTDXlU9Qi+idSe
   PgbSZaC+cRPKHhmCPTy5uzcgW2SmMuOXHdbVaKs2eC8qPVOD3MgCreEU9
   nwsUhD/BjDBDGWvvW3PzdD6Gp524FtsyTE47nyy13beGbC+A2yEuy/hQi
   lm8PphETLIOiLC21lLN2QsAYUPGiLPhTdD4t0HwXstpHgV43/HVYc7JA6
   A==;
X-CSE-ConnectionGUID: 76cD8rA+SgK/C3jYSjyWNQ==
X-CSE-MsgGUID: knC1imrZRV2F53IlhY9K6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="82829289"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="82829289"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 22:48:01 -0800
X-CSE-ConnectionGUID: yREOET9HSN2pu7QXoZkZvA==
X-CSE-MsgGUID: qI1a5v/oT0C0Ys1Uj6lDuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="190485404"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Nov 2025 22:47:59 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJnbB-0006G3-1o;
	Fri, 14 Nov 2025 06:47:57 +0000
Date: Fri, 14 Nov 2025 14:47:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [brauner-github:work.ovl.cred.guard 21/46] fs/overlayfs/inode.c:458
 do_ovl_get_acl() error: uninitialized symbol 'acl'.
Message-ID: <202511141318.wsQRKgJz-lkp@intel.com>
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
CC: Christian Brauner <christianvanbrauner@gmail.com>
TO: Christian Brauner <brauner@kernel.org>

tree:   https://github.com/brauner/linux.git work.ovl.cred.guard
head:   74fa97e66e24a79a77ee469a7e8305f2013edd1f
commit: 2691d5cc6a749352693d00e7d612cbdf2484dcb8 [21/46] ovl: port do_ovl_get_acl() to cred guard
:::::: branch date: 9 hours ago
:::::: commit date: 18 hours ago
config: parisc-randconfig-r072-20251114 (https://download.01.org/0day-ci/archive/20251114/202511141318.wsQRKgJz-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511141318.wsQRKgJz-lkp@intel.com/

New smatch warnings:
fs/overlayfs/inode.c:458 do_ovl_get_acl() error: uninitialized symbol 'acl'.

Old smatch warnings:
fs/overlayfs/inode.c:280 ovl_getattr() error: uninitialized symbol 'err'.
fs/overlayfs/inode.c:1204 ovl_get_inode() error: we previously assumed 'lowerpath' could be null (see line 1201)

vim +/acl +458 fs/overlayfs/inode.c

6c0a8bfb84af8f Christian Brauner 2022-09-22  414  
1aa5fef575a839 Christian Brauner 2022-07-06  415  /*
1aa5fef575a839 Christian Brauner 2022-07-06  416   * When the relevant layer is an idmapped mount we need to take the idmapping
1aa5fef575a839 Christian Brauner 2022-07-06  417   * of the layer into account and translate any ACL_{GROUP,USER} values
1aa5fef575a839 Christian Brauner 2022-07-06  418   * according to the idmapped mount.
1aa5fef575a839 Christian Brauner 2022-07-06  419   *
1aa5fef575a839 Christian Brauner 2022-07-06  420   * We cannot alter the ACLs returned from the relevant layer as that would
1aa5fef575a839 Christian Brauner 2022-07-06  421   * alter the cached values filesystem wide for the lower filesystem. Instead we
1aa5fef575a839 Christian Brauner 2022-07-06  422   * can clone the ACLs and then apply the relevant idmapping of the layer.
1aa5fef575a839 Christian Brauner 2022-07-06  423   *
1aa5fef575a839 Christian Brauner 2022-07-06  424   * This is obviously only relevant when idmapped layers are used.
1aa5fef575a839 Christian Brauner 2022-07-06  425   */
77435322777d8a Christian Brauner 2023-01-13  426  struct posix_acl *do_ovl_get_acl(struct mnt_idmap *idmap,
6c0a8bfb84af8f Christian Brauner 2022-09-22  427  				 struct inode *inode, int type,
6c0a8bfb84af8f Christian Brauner 2022-09-22  428  				 bool rcu, bool noperm)
39a25b2b37629f Vivek Goyal       2016-07-01  429  {
f4e19e595cc2e7 Zhihao Cheng      2023-05-16  430  	struct inode *realinode;
6c0a8bfb84af8f Christian Brauner 2022-09-22  431  	struct posix_acl *acl;
1aa5fef575a839 Christian Brauner 2022-07-06  432  	struct path realpath;
39a25b2b37629f Vivek Goyal       2016-07-01  433  
1aa5fef575a839 Christian Brauner 2022-07-06  434  	/* Careful in RCU walk mode */
f4e19e595cc2e7 Zhihao Cheng      2023-05-16  435  	realinode = ovl_i_path_real(inode, &realpath);
f4e19e595cc2e7 Zhihao Cheng      2023-05-16  436  	if (!realinode) {
1aa5fef575a839 Christian Brauner 2022-07-06  437  		WARN_ON(!rcu);
1aa5fef575a839 Christian Brauner 2022-07-06  438  		return ERR_PTR(-ECHILD);
1aa5fef575a839 Christian Brauner 2022-07-06  439  	}
1aa5fef575a839 Christian Brauner 2022-07-06  440  
f4e19e595cc2e7 Zhihao Cheng      2023-05-16  441  	if (!IS_POSIXACL(realinode))
f4e19e595cc2e7 Zhihao Cheng      2023-05-16  442  		return NULL;
f4e19e595cc2e7 Zhihao Cheng      2023-05-16  443  
1aa5fef575a839 Christian Brauner 2022-07-06  444  	if (rcu) {
6c0a8bfb84af8f Christian Brauner 2022-09-22  445  		/*
6c0a8bfb84af8f Christian Brauner 2022-09-22  446  		 * If the layer is idmapped drop out of RCU path walk
6c0a8bfb84af8f Christian Brauner 2022-09-22  447  		 * so we can clone the ACLs.
6c0a8bfb84af8f Christian Brauner 2022-09-22  448  		 */
6c0a8bfb84af8f Christian Brauner 2022-09-22  449  		if (is_idmapped_mnt(realpath.mnt))
6c0a8bfb84af8f Christian Brauner 2022-09-22  450  			return ERR_PTR(-ECHILD);
6c0a8bfb84af8f Christian Brauner 2022-09-22  451  
1aa5fef575a839 Christian Brauner 2022-07-06  452  		acl = get_cached_acl_rcu(realinode, type);
1aa5fef575a839 Christian Brauner 2022-07-06  453  	} else {
2691d5cc6a7493 Christian Brauner 2025-11-12  454  		with_ovl_creds(inode->i_sb)
6c0a8bfb84af8f Christian Brauner 2022-09-22  455  			acl = ovl_get_acl_path(&realpath, posix_acl_xattr_name(type), noperm);
1aa5fef575a839 Christian Brauner 2022-07-06  456  	}
1aa5fef575a839 Christian Brauner 2022-07-06  457  
6c0a8bfb84af8f Christian Brauner 2022-09-22 @458  	return acl;
39a25b2b37629f Vivek Goyal       2016-07-01  459  }
0e641857322f4d Christian Brauner 2022-09-22  460  

:::::: The code at line 458 was first introduced by commit
:::::: 6c0a8bfb84af8f3d1960e6905eace59d6488d270 ovl: implement get acl method

:::::: TO: Christian Brauner <brauner@kernel.org>
:::::: CC: Christian Brauner (Microsoft) <brauner@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
