Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5267B15D0
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Sep 2023 04:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694234269; x=1725770269;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=EArY4qZ57QMrnTwh22BV7toI8J6hEAXtOunpZndYtNg=;
  b=lusw+w4BqsnNN1UzHvWsk1BF55YtcHr2cjw1mvmL7nng/odAomqux+Le
   P/2yNlpj8e+1BC4eXUBkyKuHvLKtEz6ST5JpMmHVz2nuAnPVxqnfc8SI9
   7KeorWk/KThz6Pkv34zDi9xcyyVnqIVLXVv3V9oxMmyvb119lBz1jhZca
   IzTbOdH7JynnrHRCIvaUpbQ2EauzRL7Rkm0nGTJlYnFOYh/YTYaO3ydFg
   UaAuX3d2Zu8FlzcWB4YyZxrMvkpGhaMZI1WRtV3h/O94+hFrqvY7J+b7m
   77jhmeOtDbjdLclV5AUfKKkfNKUUizxlLBOG+NGOZfQGl7ox/ol6AHYdq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="408773868"
X-IronPort-AV: E=Sophos;i="6.02,238,1688454000"; 
   d="scan'208";a="408773868"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 21:37:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="866336224"
X-IronPort-AV: E=Sophos;i="6.02,238,1688454000"; 
   d="scan'208";a="866336224"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 08 Sep 2023 21:37:44 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qepj4-0002vb-0U;
	Sat, 09 Sep 2023 04:37:42 +0000
Date: Sat, 9 Sep 2023 12:36:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/ceph/crypto.c:465 ceph_fname_to_usr() warn: variable dereferenced
 before IS_ERR check 'dir' (see line 403)
Message-ID: <202309091217.yhLAdT6K-lkp@intel.com>
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
head:   32bf43e4efdb87e0f7e90ba3883e07b8522322ad
commit: dd66df0053ef84add5e684df517aa9b498342381 ceph: add support for encrypted snapshot names
date:   2 weeks ago
:::::: branch date: 8 hours ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-161-20230909 (https://download.01.org/0day-ci/archive/20230909/202309091217.yhLAdT6K-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230909/202309091217.yhLAdT6K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309091217.yhLAdT6K-lkp@intel.com/

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
