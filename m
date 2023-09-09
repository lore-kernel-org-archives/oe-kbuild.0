Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9905730FA8
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Sep 2023 06:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694240696; x=1725776696;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RliQl99uP542iPRH1LboW6gYz4H6szIE29a/O+uPWn8=;
  b=mbjB2k1WOh2TEK8zrn4g7llrGuWtoYh8+kHNTouy5SnwkXnUz6624Spr
   Dt9l+lUCoGgtK+RVQ7xLmvrlyuNZGdM1wP4zfrtmFG42BoSaivxS2StPJ
   rCKt8fytyCSLwTZaschLReyoEHojLJb0vtWKXkaS6J59kQnDiCLMJNgAl
   vktY2vv+Jl4oXgJQEd5bsUFvF/1/sQKX0nZgKAQuFZad4LFtrJ4pEx1Eh
   v+2qMJqyA8P8wbZMuhMJvAuyu+lbokwer3Y3hYFWRkBlCo71IXHOVJwRj
   ZD3epQtHoWqr3MlMlipab43tYX6viS0KXjgCbRifjyTseJHsfZ5Bn7C4o
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="362848408"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="362848408"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 23:24:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="771991048"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="771991048"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 08 Sep 2023 23:24:46 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qerOe-0002zn-1x;
	Sat, 09 Sep 2023 06:24:44 +0000
Date: Sat, 9 Sep 2023 14:24:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [amir73il:ovl_want_write 8/8] fs/overlayfs/copy_up.c:459
 ovl_set_origin_fh() warn: variable dereferenced before check 'fh' (see line
 458)
Message-ID: <202309091443.rCZuOntT-lkp@intel.com>
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
TO: Amir Goldstein <amir73il@gmail.com>

tree:   https://github.com/amir73il/linux ovl_want_write
head:   4ea9d9f55925f6631923f76831d8a2a850d3876e
commit: 4ea9d9f55925f6631923f76831d8a2a850d3876e [8/8] ovl: do not encode lower fh with upper sb_writers held
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: i386-randconfig-141-20230909 (https://download.01.org/0day-ci/archive/20230909/202309091443.rCZuOntT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230909/202309091443.rCZuOntT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309091443.rCZuOntT-lkp@intel.com/

smatch warnings:
fs/overlayfs/copy_up.c:459 ovl_set_origin_fh() warn: variable dereferenced before check 'fh' (see line 458)

vim +/fh +459 fs/overlayfs/copy_up.c

3a1e819b4e8021 Amir Goldstein 2017-03-30  449  
4ea9d9f55925f6 Amir Goldstein 2023-08-16  450  int ovl_set_origin_fh(struct ovl_fs *ofs, const struct ovl_fh *fh,
4ea9d9f55925f6 Amir Goldstein 2023-08-16  451  		      struct dentry *upper)
4ea9d9f55925f6 Amir Goldstein 2023-08-16  452  {
4ea9d9f55925f6 Amir Goldstein 2023-08-16  453  	int err;
4ea9d9f55925f6 Amir Goldstein 2023-08-16  454  
6266d465bde044 Miklos Szeredi 2017-05-18  455  	/*
6266d465bde044 Miklos Szeredi 2017-05-18  456  	 * Do not fail when upper doesn't support xattrs.
6266d465bde044 Miklos Szeredi 2017-05-18  457  	 */
a0c236b11706cc Amir Goldstein 2021-06-19 @458  	err = ovl_check_setxattr(ofs, upper, OVL_XATTR_ORIGIN, fh->buf,
cbe7fba8edfc8c Amir Goldstein 2019-11-15 @459  				 fh ? fh->fb.len : 0, 0);
3a1e819b4e8021 Amir Goldstein 2017-03-30  460  
6939f977c54a39 Miklos Szeredi 2020-12-14  461  	/* Ignore -EPERM from setting "user.*" on symlink/special */
6939f977c54a39 Miklos Szeredi 2020-12-14  462  	return err == -EPERM ? 0 : err;
3a1e819b4e8021 Amir Goldstein 2017-03-30  463  }
3a1e819b4e8021 Amir Goldstein 2017-03-30  464  

:::::: The code at line 459 was first introduced by commit
:::::: cbe7fba8edfc8cb8e621599e376f8ac5c224fa72 ovl: make sure that real fid is 32bit aligned in memory

:::::: TO: Amir Goldstein <amir73il@gmail.com>
:::::: CC: Miklos Szeredi <mszeredi@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
