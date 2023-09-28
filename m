Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D384F47C84
	for <oe-kbuild@lists.linux.dev>; Thu, 28 Sep 2023 14:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695912905; x=1727448905;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9xD4Sq5AABZJ8OpMdGGbJGGnKGYC7xlgvfSU0DK2Z38=;
  b=naMD20F6pDnEtkoNLxXMnGRWF1Axr2GNT9hOWYimNg7CtOQW4JtpZIV3
   mk9uXIwD0sxQGr0acFJ5353kg2Civ019MxcZxCvsGNw7cuTR4GllUMod0
   pJ1JjL2dGxSZbySOP2F9pT+bH/jEKAFvVKzH/Kap/DhlCDZnsc7EpDiHv
   7dEVs1OTOE1ga99YVl0OzxjjHbH/P8kLvGxJ7GE6Fjfk5syhmAGP31dTW
   izWWn/BxJ3mG4Wmb7z0rLo03ex0kfsqxnwYGpvMp23D9/KJIK6x4RTQew
   nV74gfHEN8hJFVK3J5bW2GAtwjRnyHN3xBjHY5sYDUtoG0/8CTRnV6aY3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="446232023"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; 
   d="scan'208";a="446232023"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 07:55:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="873319282"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; 
   d="scan'208";a="873319282"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 28 Sep 2023 07:55:01 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlsPr-0001ZZ-0f;
	Thu, 28 Sep 2023 14:54:59 +0000
Date: Thu, 28 Sep 2023 22:54:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/ceph/crypto.c:465 ceph_fname_to_usr() warn: variable dereferenced
 before IS_ERR check 'dir' (see line 403)
Message-ID: <202309282202.xZxGdvS3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Luís Henriques" <lhenriques@suse.de>
CC: Ilya Dryomov <idryomov@gmail.com>
CC: Jeff Layton <jlayton@kernel.org>
CC: Xiubo Li <xiubli@redhat.com>
CC: Milind Changire <mchangir@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   633b47cb009d09dc8f4ba9cdb3a0ca138809c7c7
commit: dd66df0053ef84add5e684df517aa9b498342381 ceph: add support for encrypted snapshot names
date:   5 weeks ago
:::::: branch date: 22 hours ago
:::::: commit date: 5 weeks ago
config: x86_64-randconfig-161-20230928 (https://download.01.org/0day-ci/archive/20230928/202309282202.xZxGdvS3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230928/202309282202.xZxGdvS3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309282202.xZxGdvS3-lkp@intel.com/

smatch warnings:
fs/ceph/crypto.c:465 ceph_fname_to_usr() warn: variable dereferenced before IS_ERR check 'dir' (see line 403)

vim +/dir +465 fs/ceph/crypto.c

af9ffa6df7e337 Xiubo Li       2022-03-14  364  
457117f077c674 Jeff Layton    2021-03-26  365  /**
457117f077c674 Jeff Layton    2021-03-26  366   * ceph_fname_to_usr - convert a filename for userland presentation
457117f077c674 Jeff Layton    2021-03-26  367   * @fname: ceph_fname to be converted
457117f077c674 Jeff Layton    2021-03-26  368   * @tname: temporary name buffer to use for conversion (may be NULL)
457117f077c674 Jeff Layton    2021-03-26  369   * @oname: where converted name should be placed
457117f077c674 Jeff Layton    2021-03-26  370   * @is_nokey: set to true if key wasn't available during conversion (may be NULL)
457117f077c674 Jeff Layton    2021-03-26  371   *
457117f077c674 Jeff Layton    2021-03-26  372   * Given a filename (usually from the MDS), format it for presentation to
457117f077c674 Jeff Layton    2021-03-26  373   * userland. If @parent is not encrypted, just pass it back as-is.
457117f077c674 Jeff Layton    2021-03-26  374   *
457117f077c674 Jeff Layton    2021-03-26  375   * Otherwise, base64 decode the string, and then ask fscrypt to format it
457117f077c674 Jeff Layton    2021-03-26  376   * for userland presentation.
457117f077c674 Jeff Layton    2021-03-26  377   *
457117f077c674 Jeff Layton    2021-03-26  378   * Returns 0 on success or negative error code on error.
457117f077c674 Jeff Layton    2021-03-26  379   */
457117f077c674 Jeff Layton    2021-03-26  380  int ceph_fname_to_usr(const struct ceph_fname *fname, struct fscrypt_str *tname,
457117f077c674 Jeff Layton    2021-03-26  381  		      struct fscrypt_str *oname, bool *is_nokey)
457117f077c674 Jeff Layton    2021-03-26  382  {
dd66df0053ef84 Luís Henriques 2022-08-25  383  	struct inode *dir = fname->dir;
457117f077c674 Jeff Layton    2021-03-26  384  	struct fscrypt_str _tname = FSTR_INIT(NULL, 0);
457117f077c674 Jeff Layton    2021-03-26  385  	struct fscrypt_str iname;
dd66df0053ef84 Luís Henriques 2022-08-25  386  	char *name = fname->name;
dd66df0053ef84 Luís Henriques 2022-08-25  387  	int name_len = fname->name_len;
dd66df0053ef84 Luís Henriques 2022-08-25  388  	int ret;
457117f077c674 Jeff Layton    2021-03-26  389  
457117f077c674 Jeff Layton    2021-03-26  390  	/* Sanity check that the resulting name will fit in the buffer */
457117f077c674 Jeff Layton    2021-03-26  391  	if (fname->name_len > NAME_MAX || fname->ctext_len > NAME_MAX)
457117f077c674 Jeff Layton    2021-03-26  392  		return -EIO;
457117f077c674 Jeff Layton    2021-03-26  393  
dd66df0053ef84 Luís Henriques 2022-08-25  394  	/* Handle the special case of snapshot names that start with '_' */
dd66df0053ef84 Luís Henriques 2022-08-25  395  	if ((ceph_snap(dir) == CEPH_SNAPDIR) && (name_len > 0) &&
dd66df0053ef84 Luís Henriques 2022-08-25  396  	    (name[0] == '_')) {
dd66df0053ef84 Luís Henriques 2022-08-25  397  		dir = parse_longname(dir, name, &name_len);
dd66df0053ef84 Luís Henriques 2022-08-25  398  		if (IS_ERR(dir))
dd66df0053ef84 Luís Henriques 2022-08-25  399  			return PTR_ERR(dir);
dd66df0053ef84 Luís Henriques 2022-08-25  400  		name++; /* skip initial '_' */
dd66df0053ef84 Luís Henriques 2022-08-25  401  	}
dd66df0053ef84 Luís Henriques 2022-08-25  402  
dd66df0053ef84 Luís Henriques 2022-08-25 @403  	if (!IS_ENCRYPTED(dir)) {
dd66df0053ef84 Luís Henriques 2022-08-25  404  		oname->name = fname->name;
dd66df0053ef84 Luís Henriques 2022-08-25  405  		oname->len = fname->name_len;
dd66df0053ef84 Luís Henriques 2022-08-25  406  		ret = 0;
dd66df0053ef84 Luís Henriques 2022-08-25  407  		goto out_inode;
dd66df0053ef84 Luís Henriques 2022-08-25  408  	}
dd66df0053ef84 Luís Henriques 2022-08-25  409  
dd66df0053ef84 Luís Henriques 2022-08-25  410  	ret = ceph_fscrypt_prepare_readdir(dir);
dd66df0053ef84 Luís Henriques 2022-08-25  411  	if (ret)
dd66df0053ef84 Luís Henriques 2022-08-25  412  		goto out_inode;
457117f077c674 Jeff Layton    2021-03-26  413  
457117f077c674 Jeff Layton    2021-03-26  414  	/*
457117f077c674 Jeff Layton    2021-03-26  415  	 * Use the raw dentry name as sent by the MDS instead of
457117f077c674 Jeff Layton    2021-03-26  416  	 * generating a nokey name via fscrypt.
457117f077c674 Jeff Layton    2021-03-26  417  	 */
dd66df0053ef84 Luís Henriques 2022-08-25  418  	if (!fscrypt_has_encryption_key(dir)) {
af9ffa6df7e337 Xiubo Li       2022-03-14  419  		if (fname->no_copy)
af9ffa6df7e337 Xiubo Li       2022-03-14  420  			oname->name = fname->name;
af9ffa6df7e337 Xiubo Li       2022-03-14  421  		else
457117f077c674 Jeff Layton    2021-03-26  422  			memcpy(oname->name, fname->name, fname->name_len);
457117f077c674 Jeff Layton    2021-03-26  423  		oname->len = fname->name_len;
457117f077c674 Jeff Layton    2021-03-26  424  		if (is_nokey)
457117f077c674 Jeff Layton    2021-03-26  425  			*is_nokey = true;
dd66df0053ef84 Luís Henriques 2022-08-25  426  		ret = 0;
dd66df0053ef84 Luís Henriques 2022-08-25  427  		goto out_inode;
457117f077c674 Jeff Layton    2021-03-26  428  	}
457117f077c674 Jeff Layton    2021-03-26  429  
457117f077c674 Jeff Layton    2021-03-26  430  	if (fname->ctext_len == 0) {
457117f077c674 Jeff Layton    2021-03-26  431  		int declen;
457117f077c674 Jeff Layton    2021-03-26  432  
457117f077c674 Jeff Layton    2021-03-26  433  		if (!tname) {
457117f077c674 Jeff Layton    2021-03-26  434  			ret = fscrypt_fname_alloc_buffer(NAME_MAX, &_tname);
457117f077c674 Jeff Layton    2021-03-26  435  			if (ret)
dd66df0053ef84 Luís Henriques 2022-08-25  436  				goto out_inode;
457117f077c674 Jeff Layton    2021-03-26  437  			tname = &_tname;
457117f077c674 Jeff Layton    2021-03-26  438  		}
457117f077c674 Jeff Layton    2021-03-26  439  
dd66df0053ef84 Luís Henriques 2022-08-25  440  		declen = ceph_base64_decode(name, name_len, tname->name);
457117f077c674 Jeff Layton    2021-03-26  441  		if (declen <= 0) {
457117f077c674 Jeff Layton    2021-03-26  442  			ret = -EIO;
457117f077c674 Jeff Layton    2021-03-26  443  			goto out;
457117f077c674 Jeff Layton    2021-03-26  444  		}
457117f077c674 Jeff Layton    2021-03-26  445  		iname.name = tname->name;
457117f077c674 Jeff Layton    2021-03-26  446  		iname.len = declen;
457117f077c674 Jeff Layton    2021-03-26  447  	} else {
457117f077c674 Jeff Layton    2021-03-26  448  		iname.name = fname->ctext;
457117f077c674 Jeff Layton    2021-03-26  449  		iname.len = fname->ctext_len;
457117f077c674 Jeff Layton    2021-03-26  450  	}
457117f077c674 Jeff Layton    2021-03-26  451  
dd66df0053ef84 Luís Henriques 2022-08-25  452  	ret = fscrypt_fname_disk_to_usr(dir, 0, 0, &iname, oname);
dd66df0053ef84 Luís Henriques 2022-08-25  453  	if (!ret && (dir != fname->dir)) {
dd66df0053ef84 Luís Henriques 2022-08-25  454  		char tmp_buf[CEPH_BASE64_CHARS(NAME_MAX)];
dd66df0053ef84 Luís Henriques 2022-08-25  455  
dd66df0053ef84 Luís Henriques 2022-08-25  456  		name_len = snprintf(tmp_buf, sizeof(tmp_buf), "_%.*s_%ld",
dd66df0053ef84 Luís Henriques 2022-08-25  457  				    oname->len, oname->name, dir->i_ino);
dd66df0053ef84 Luís Henriques 2022-08-25  458  		memcpy(oname->name, tmp_buf, name_len);
dd66df0053ef84 Luís Henriques 2022-08-25  459  		oname->len = name_len;
dd66df0053ef84 Luís Henriques 2022-08-25  460  	}
dd66df0053ef84 Luís Henriques 2022-08-25  461  
457117f077c674 Jeff Layton    2021-03-26  462  out:
457117f077c674 Jeff Layton    2021-03-26  463  	fscrypt_fname_free_buffer(&_tname);
dd66df0053ef84 Luís Henriques 2022-08-25  464  out_inode:
dd66df0053ef84 Luís Henriques 2022-08-25 @465  	if ((dir != fname->dir) && !IS_ERR(dir)) {
dd66df0053ef84 Luís Henriques 2022-08-25  466  		if ((dir->i_state & I_NEW))
dd66df0053ef84 Luís Henriques 2022-08-25  467  			discard_new_inode(dir);
dd66df0053ef84 Luís Henriques 2022-08-25  468  		else
dd66df0053ef84 Luís Henriques 2022-08-25  469  			iput(dir);
dd66df0053ef84 Luís Henriques 2022-08-25  470  	}
457117f077c674 Jeff Layton    2021-03-26  471  	return ret;
457117f077c674 Jeff Layton    2021-03-26  472  }
14e034a61c908d Luís Henriques 2022-11-29  473  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
