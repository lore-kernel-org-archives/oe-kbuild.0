Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BEB1BF31
	for <oe-kbuild@lists.linux.dev>; Wed, 17 Jan 2024 10:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705488183; cv=none; b=KJElHtxloEY9bN7+JfXE4Y37WiGDRvOXinI9V+DHXq1RCHVbA/H+9wya0/O4hnbe8CKQG3IifHqQSzgTkvJVLextfnCe6CU+sGOmx3YcsoFv4/elycG7UX9tBW4zIV3canhim0y217meL9R4X4oJZxaE0e5WaoYAZD3YRwuwUf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705488183; c=relaxed/simple;
	bh=quFX7tQR4wrDm4vl1gDNCr2LNKfUw8dydchviMovrS4=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:X-IronPort-AV:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	b=OmEgH4kBu5xkhbb+t78JMhMm+X+LV8a2aQ4yeyDVeTefS987TK2AEdKjmp2JAPQnHneO7BGPy6Ysv60PNlPSNUomWjpQL1H0jdFqbTs9IpRu8hJ55i9Yf2G+8Gvixl3iOzcY6auW0daP1j4y2tkqAnP9LY/JobeJ61VeUSbsyhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ibRdQ9hH; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ibRdQ9hH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705488181; x=1737024181;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=quFX7tQR4wrDm4vl1gDNCr2LNKfUw8dydchviMovrS4=;
  b=ibRdQ9hHSSX20tuF/yh7BHxiG15rSHEBCg+DCJQFQueifz9lkKnBphsc
   HzUtb1uqA9mctybsvdPNYE3oTej/PpQo59GHzwMV/hiUKdSJoFTcHCPyv
   n4JxCesqtOtRhouym0NVfDV2vKC8PjxBNpp2JA0F4l6EC1wfgofXlcQkr
   igvdU37YKRZczTr3/2b9fvxgtyRj7orvMmlQa0+y9lmYBYaNPYJHwKvVQ
   UImqoi0ocW3EqyWeKYQvNSDl4NMzTaLMZbzixs1ON13mL+AAktGYoy+Fy
   DZ58EpjyASdlEvKnkttdr+ihZJLHsd/68pxcbzC/7THkW/gq0d/u12UfY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="21610276"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="21610276"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2024 02:43:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="854662486"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="854662486"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 17 Jan 2024 02:42:58 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQ3No-0001tW-1s;
	Wed, 17 Jan 2024 10:42:56 +0000
Date: Wed, 17 Jan 2024 18:42:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [zen:6.7/zen-sauce 8/31] fs/bcachefs/chardev.c:528:1: warning: the
 frame size of 1056 bytes is larger than 1024 bytes
Message-ID: <202401171828.NWEcP9pD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only Makefile file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: steven@liquorix.net

tree:   https://github.com/zen-kernel/zen-kernel 6.7/zen-sauce
head:   01ffb5c93fff64050b2eda359d20f812f62c91c3
commit: 47715d438aa7c28ae732ab8cce27b832e93b6b51 [8/31] ZEN: Disable stack conservation for GCC
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240117/202401171828.NWEcP9pD-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240117/202401171828.NWEcP9pD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401171828.NWEcP9pD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/chardev.c: In function 'bch2_ioctl_dev_usage':
>> fs/bcachefs/chardev.c:528:1: warning: the frame size of 1056 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     528 | }
         | ^


vim +528 fs/bcachefs/chardev.c

1c6fdbd8f2465d Kent Overstreet 2017-03-16  484  
22502ac23a2eaa Kent Overstreet 2019-12-16  485  static long bch2_ioctl_dev_usage(struct bch_fs *c,
22502ac23a2eaa Kent Overstreet 2019-12-16  486  				 struct bch_ioctl_dev_usage __user *user_arg)
22502ac23a2eaa Kent Overstreet 2019-12-16  487  {
22502ac23a2eaa Kent Overstreet 2019-12-16  488  	struct bch_ioctl_dev_usage arg;
22502ac23a2eaa Kent Overstreet 2019-12-16  489  	struct bch_dev_usage src;
22502ac23a2eaa Kent Overstreet 2019-12-16  490  	struct bch_dev *ca;
22502ac23a2eaa Kent Overstreet 2019-12-16  491  	unsigned i;
22502ac23a2eaa Kent Overstreet 2019-12-16  492  
22502ac23a2eaa Kent Overstreet 2019-12-16  493  	if (!test_bit(BCH_FS_STARTED, &c->flags))
22502ac23a2eaa Kent Overstreet 2019-12-16  494  		return -EINVAL;
22502ac23a2eaa Kent Overstreet 2019-12-16  495  
22502ac23a2eaa Kent Overstreet 2019-12-16  496  	if (copy_from_user(&arg, user_arg, sizeof(arg)))
22502ac23a2eaa Kent Overstreet 2019-12-16  497  		return -EFAULT;
22502ac23a2eaa Kent Overstreet 2019-12-16  498  
22502ac23a2eaa Kent Overstreet 2019-12-16  499  	if ((arg.flags & ~BCH_BY_INDEX) ||
22502ac23a2eaa Kent Overstreet 2019-12-16  500  	    arg.pad[0] ||
22502ac23a2eaa Kent Overstreet 2019-12-16  501  	    arg.pad[1] ||
22502ac23a2eaa Kent Overstreet 2019-12-16  502  	    arg.pad[2])
22502ac23a2eaa Kent Overstreet 2019-12-16  503  		return -EINVAL;
22502ac23a2eaa Kent Overstreet 2019-12-16  504  
22502ac23a2eaa Kent Overstreet 2019-12-16  505  	ca = bch2_device_lookup(c, arg.dev, arg.flags);
22502ac23a2eaa Kent Overstreet 2019-12-16  506  	if (IS_ERR(ca))
22502ac23a2eaa Kent Overstreet 2019-12-16  507  		return PTR_ERR(ca);
22502ac23a2eaa Kent Overstreet 2019-12-16  508  
3d080aa52f6c1b Kent Overstreet 2020-07-22  509  	src = bch2_dev_usage_read(ca);
22502ac23a2eaa Kent Overstreet 2019-12-16  510  
22502ac23a2eaa Kent Overstreet 2019-12-16  511  	arg.state		= ca->mi.state;
22502ac23a2eaa Kent Overstreet 2019-12-16  512  	arg.bucket_size		= ca->mi.bucket_size;
22502ac23a2eaa Kent Overstreet 2019-12-16  513  	arg.nr_buckets		= ca->mi.nbuckets - ca->mi.first_bucket;
822835ffeae411 Kent Overstreet 2022-04-01  514  	arg.buckets_ec		= src.buckets_ec;
22502ac23a2eaa Kent Overstreet 2019-12-16  515  
22502ac23a2eaa Kent Overstreet 2019-12-16  516  	for (i = 0; i < BCH_DATA_NR; i++) {
822835ffeae411 Kent Overstreet 2022-04-01  517  		arg.d[i].buckets	= src.d[i].buckets;
822835ffeae411 Kent Overstreet 2022-04-01  518  		arg.d[i].sectors	= src.d[i].sectors;
822835ffeae411 Kent Overstreet 2022-04-01  519  		arg.d[i].fragmented	= src.d[i].fragmented;
22502ac23a2eaa Kent Overstreet 2019-12-16  520  	}
22502ac23a2eaa Kent Overstreet 2019-12-16  521  
22502ac23a2eaa Kent Overstreet 2019-12-16  522  	percpu_ref_put(&ca->ref);
22502ac23a2eaa Kent Overstreet 2019-12-16  523  
301e0237cadfc7 Dan Carpenter   2023-09-14  524  	if (copy_to_user(user_arg, &arg, sizeof(arg)))
301e0237cadfc7 Dan Carpenter   2023-09-14  525  		return -EFAULT;
301e0237cadfc7 Dan Carpenter   2023-09-14  526  
301e0237cadfc7 Dan Carpenter   2023-09-14  527  	return 0;
1c6fdbd8f2465d Kent Overstreet 2017-03-16 @528  }
1c6fdbd8f2465d Kent Overstreet 2017-03-16  529  

:::::: The code at line 528 was first introduced by commit
:::::: 1c6fdbd8f2465ddfb73a01ec620cbf3d14044e1a bcachefs: Initial commit

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
