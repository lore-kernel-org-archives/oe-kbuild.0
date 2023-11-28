Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D1810A0A
	for <oe-kbuild@lists.linux.dev>; Tue, 28 Nov 2023 05:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a/aH2FWW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701150987; x=1732686987;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5ywrWGWzN+gIS1iaWcG2M9SCzbpiIR+Z2X+jFEVLqzo=;
  b=a/aH2FWWKQzI9TcD4Xa7EPHbApWjYJ0ab3JJ/G6QkHh+QdmgGFoy96MH
   ZbGsrnoOD89R/i2tj4Lhh1S1RD5ItEHbSMHdyk/bdx4ZJvP4Rc8eDarYb
   7ZtQoo5HA2H/8HnnddbIcPASCajdA0OFqkjV5jr9OnRBmwJH5GbRyAriF
   b0CZKQTFtdlx8vIcjvZVRt4ph9MRy4JkQYcJ0VdWxHjxDs2zzwHeCT3Px
   XOO6+hcc9EA9H8Wg8vjVfQOvr1ZGPbWXUwnmJQmj4vfGXqUwoimVMbyJ1
   JafiqFoL8xiiO94+3tVO07xOow9AXmNkaP5bpNEMraQXjLfQrnC5sEBl5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="383239674"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="383239674"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 21:56:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="1099989742"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="1099989742"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 27 Nov 2023 21:56:25 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7r55-00074Y-00;
	Tue, 28 Nov 2023 05:56:23 +0000
Date: Tue, 28 Nov 2023 13:56:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [gustavoars:testing/next20231127-Warray-bounds 3/3]
 fs/bcachefs/chardev.c:570:44: warning: array subscript i is outside array
 bounds of 'struct bch_ioctl_dev_usage_type[0]'
Message-ID: <202311280933.lCa4jxa0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "has Makefile file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
CC: LKML <linux-kernel@vger.kernel.org>
TO: "Gustavo A. R. Silva" <gustavoars@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/next20231127-Warray-bounds
head:   cb7d8700da3e4c763ac30bfa34ee7dc143bd2758
commit: cb7d8700da3e4c763ac30bfa34ee7dc143bd2758 [3/3] Makefile: Enable -Warray-bounds globally
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20231128/202311280933.lCa4jxa0-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231128/202311280933.lCa4jxa0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311280933.lCa4jxa0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/chardev.c: In function 'bch2_ioctl_dev_usage_v2':
>> fs/bcachefs/chardev.c:570:44: warning: array subscript i is outside array bounds of 'struct bch_ioctl_dev_usage_type[0]' [-Warray-bounds=]
     570 |                 ret = copy_to_user_errcode(&user_arg->d[i], &t, sizeof(t));
         |                                            ^~~~~~~~~~~~~~~
   In file included from fs/bcachefs/chardev.c:5:
   fs/bcachefs/bcachefs_ioctl.h:316:42: note: while referencing 'd'
     316 |         struct bch_ioctl_dev_usage_type  d[0];
         |                                          ^


vim +570 fs/bcachefs/chardev.c

e1dde6a5c66159 Kent Overstreet 2023-11-23  527  
e1dde6a5c66159 Kent Overstreet 2023-11-23  528  static long bch2_ioctl_dev_usage_v2(struct bch_fs *c,
e1dde6a5c66159 Kent Overstreet 2023-11-23  529  				 struct bch_ioctl_dev_usage_v2 __user *user_arg)
e1dde6a5c66159 Kent Overstreet 2023-11-23  530  {
e1dde6a5c66159 Kent Overstreet 2023-11-23  531  	struct bch_ioctl_dev_usage_v2 arg;
e1dde6a5c66159 Kent Overstreet 2023-11-23  532  	struct bch_dev_usage src;
e1dde6a5c66159 Kent Overstreet 2023-11-23  533  	struct bch_dev *ca;
e1dde6a5c66159 Kent Overstreet 2023-11-23  534  	int ret = 0;
e1dde6a5c66159 Kent Overstreet 2023-11-23  535  
e1dde6a5c66159 Kent Overstreet 2023-11-23  536  	if (!test_bit(BCH_FS_STARTED, &c->flags))
e1dde6a5c66159 Kent Overstreet 2023-11-23  537  		return -EINVAL;
e1dde6a5c66159 Kent Overstreet 2023-11-23  538  
e1dde6a5c66159 Kent Overstreet 2023-11-23  539  	if (copy_from_user(&arg, user_arg, sizeof(arg)))
301e0237cadfc7 Dan Carpenter   2023-09-14  540  		return -EFAULT;
301e0237cadfc7 Dan Carpenter   2023-09-14  541  
e1dde6a5c66159 Kent Overstreet 2023-11-23  542  	if ((arg.flags & ~BCH_BY_INDEX) ||
e1dde6a5c66159 Kent Overstreet 2023-11-23  543  	    arg.pad[0] ||
e1dde6a5c66159 Kent Overstreet 2023-11-23  544  	    arg.pad[1] ||
e1dde6a5c66159 Kent Overstreet 2023-11-23  545  	    arg.pad[2])
e1dde6a5c66159 Kent Overstreet 2023-11-23  546  		return -EINVAL;
e1dde6a5c66159 Kent Overstreet 2023-11-23  547  
e1dde6a5c66159 Kent Overstreet 2023-11-23  548  	ca = bch2_device_lookup(c, arg.dev, arg.flags);
e1dde6a5c66159 Kent Overstreet 2023-11-23  549  	if (IS_ERR(ca))
e1dde6a5c66159 Kent Overstreet 2023-11-23  550  		return PTR_ERR(ca);
e1dde6a5c66159 Kent Overstreet 2023-11-23  551  
e1dde6a5c66159 Kent Overstreet 2023-11-23  552  	src = bch2_dev_usage_read(ca);
e1dde6a5c66159 Kent Overstreet 2023-11-23  553  
e1dde6a5c66159 Kent Overstreet 2023-11-23  554  	arg.state		= ca->mi.state;
e1dde6a5c66159 Kent Overstreet 2023-11-23  555  	arg.bucket_size		= ca->mi.bucket_size;
e1dde6a5c66159 Kent Overstreet 2023-11-23  556  	arg.nr_data_types	= min(arg.nr_data_types, BCH_DATA_NR);
e1dde6a5c66159 Kent Overstreet 2023-11-23  557  	arg.nr_buckets		= ca->mi.nbuckets - ca->mi.first_bucket;
e1dde6a5c66159 Kent Overstreet 2023-11-23  558  
e1dde6a5c66159 Kent Overstreet 2023-11-23  559  	ret = copy_to_user_errcode(user_arg, &arg, sizeof(arg));
e1dde6a5c66159 Kent Overstreet 2023-11-23  560  	if (ret)
e1dde6a5c66159 Kent Overstreet 2023-11-23  561  		goto err;
e1dde6a5c66159 Kent Overstreet 2023-11-23  562  
e1dde6a5c66159 Kent Overstreet 2023-11-23  563  	for (unsigned i = 0; i < arg.nr_data_types; i++) {
e1dde6a5c66159 Kent Overstreet 2023-11-23  564  		struct bch_ioctl_dev_usage_type t = {
e1dde6a5c66159 Kent Overstreet 2023-11-23  565  			.buckets	= src.d[i].buckets,
e1dde6a5c66159 Kent Overstreet 2023-11-23  566  			.sectors	= src.d[i].sectors,
e1dde6a5c66159 Kent Overstreet 2023-11-23  567  			.fragmented	= src.d[i].fragmented,
e1dde6a5c66159 Kent Overstreet 2023-11-23  568  		};
e1dde6a5c66159 Kent Overstreet 2023-11-23  569  
e1dde6a5c66159 Kent Overstreet 2023-11-23 @570  		ret = copy_to_user_errcode(&user_arg->d[i], &t, sizeof(t));
e1dde6a5c66159 Kent Overstreet 2023-11-23  571  		if (ret)
e1dde6a5c66159 Kent Overstreet 2023-11-23  572  			goto err;
e1dde6a5c66159 Kent Overstreet 2023-11-23  573  	}
e1dde6a5c66159 Kent Overstreet 2023-11-23  574  err:
e1dde6a5c66159 Kent Overstreet 2023-11-23  575  	percpu_ref_put(&ca->ref);
e1dde6a5c66159 Kent Overstreet 2023-11-23  576  	return ret;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  577  }
1c6fdbd8f2465d Kent Overstreet 2017-03-16  578  

:::::: The code at line 570 was first introduced by commit
:::::: e1dde6a5c66159611032d29c063714c0f207f2ba bcachefs: BCH_IOCTL_DEV_USAGE_V2

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
