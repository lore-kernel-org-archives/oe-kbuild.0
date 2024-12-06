Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554632206A5
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Dec 2024 18:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733508428; cv=none; b=Bt63Nm5i5Fy0eAJjrOWi29V3US5hRe2OwEehfvuYau5qRiVviVQgabaz2WuHoZhdpPjEOFKF4wAWvrqZ8qdzhWXpAUtdDa1IB9Dm+xD4k+ZZWpaFsOUf5ZniUxbz/g+SOIbKAqteDmWl8uifoK4HPLghajNtKbsyP2DekouvOLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733508428; c=relaxed/simple;
	bh=CEjNNmoHs4nCf4SLTNPr5/OeJV8QiM0L3Q9ocZuvfHw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q4Il0WTdFT6f2RtjhL7zcXKO9SdHCptdq/qDWqBIYMBav/Z1sNwMsUbZ8AdcozCrF0pBMFfzrDQAXJp8i5belyZQASuNy62DzmU0rjK5JWkmzIPGy2ICSXpnZRTmMDqE4TCwhM3jBgWFSA3on5SCAKvlSoeLfjc+cxCt1vd1NKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GUVYxW0o; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GUVYxW0o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733508427; x=1765044427;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CEjNNmoHs4nCf4SLTNPr5/OeJV8QiM0L3Q9ocZuvfHw=;
  b=GUVYxW0ot7x6FqW4wwZI5cXbiayzYEZNuoXHefpqkYO6kzF0C0SeRBFl
   8Me/QsxXLhISoNDOKevANytSCqySsPgCj2MOH7eZEVC4itbg7IdeYIfn2
   XjYafUnf5t8roBbbXQKqi621jmxVlWj6GY2hkpsoZthbEdjdUOqPH6pjr
   WsRKNPw0FllP5z79qBtQbE80ngfuzvg9ZxjAscV/orJA3kv+gKl19tA8k
   UiwL2Muoly80DB9a4iyQE0FW1nnEdctoTNDgf6Zhd9lUyxlKjBh28WRtV
   RGm5IxGVGFjwU+kl1X6LApChdhGDwF9WysouX41R5BZmhppAR2GEG8eM0
   A==;
X-CSE-ConnectionGUID: 511X/8TUT/6ceIn9E08M5g==
X-CSE-MsgGUID: 4XxoCGgcRuqZtIz/F7di0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="33793672"
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="33793672"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2024 10:07:06 -0800
X-CSE-ConnectionGUID: JU2iudAxSCGMBr8Tbx1+Tg==
X-CSE-MsgGUID: KyU4J1CpRRSVd4veGsz4kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="94567760"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 06 Dec 2024 10:07:05 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJcjG-00029V-14;
	Fri, 06 Dec 2024 18:07:02 +0000
Date: Sat, 7 Dec 2024 02:06:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [zen:6.12/zen-sauce 8/31] fs/bcachefs/chardev.c:615:1: warning: the
 frame size of 1100 bytes is larger than 1024 bytes
Message-ID: <202412070149.K5cFZ28J-lkp@intel.com>
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

tree:   https://github.com/zen-kernel/zen-kernel 6.12/zen-sauce
head:   856c3874536c066b0f02b38b24092610692959ff
commit: 87b0cab8d8701db7754e5778b93ff83ffc64c7ae [8/31] ZEN: Disable stack conservation for GCC
:::::: branch date: 18 hours ago
:::::: commit date: 3 weeks ago
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241207/202412070149.K5cFZ28J-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412070149.K5cFZ28J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412070149.K5cFZ28J-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/chardev.c: In function 'bch2_ioctl_dev_usage':
>> fs/bcachefs/chardev.c:615:1: warning: the frame size of 1100 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     615 | }
         | ^
--
   fs/bcachefs/fsck.c: In function 'reattach_inode':
>> fs/bcachefs/fsck.c:483:1: warning: the frame size of 1048 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     483 | }
         | ^


vim +615 fs/bcachefs/chardev.c

8863d1e092005d5 Kent Overstreet 2024-03-01  574  
e6674decb219599 Kent Overstreet 2023-11-23  575  /* obsolete, didn't allow for new data types: */
22502ac23a2eaa3 Kent Overstreet 2019-12-16  576  static long bch2_ioctl_dev_usage(struct bch_fs *c,
22502ac23a2eaa3 Kent Overstreet 2019-12-16  577  				 struct bch_ioctl_dev_usage __user *user_arg)
22502ac23a2eaa3 Kent Overstreet 2019-12-16  578  {
22502ac23a2eaa3 Kent Overstreet 2019-12-16  579  	struct bch_ioctl_dev_usage arg;
22502ac23a2eaa3 Kent Overstreet 2019-12-16  580  	struct bch_dev_usage src;
22502ac23a2eaa3 Kent Overstreet 2019-12-16  581  	struct bch_dev *ca;
22502ac23a2eaa3 Kent Overstreet 2019-12-16  582  	unsigned i;
22502ac23a2eaa3 Kent Overstreet 2019-12-16  583  
3c471b65889aa22 Kent Overstreet 2023-11-26  584  	if (!test_bit(BCH_FS_started, &c->flags))
22502ac23a2eaa3 Kent Overstreet 2019-12-16  585  		return -EINVAL;
22502ac23a2eaa3 Kent Overstreet 2019-12-16  586  
22502ac23a2eaa3 Kent Overstreet 2019-12-16  587  	if (copy_from_user(&arg, user_arg, sizeof(arg)))
22502ac23a2eaa3 Kent Overstreet 2019-12-16  588  		return -EFAULT;
22502ac23a2eaa3 Kent Overstreet 2019-12-16  589  
22502ac23a2eaa3 Kent Overstreet 2019-12-16  590  	if ((arg.flags & ~BCH_BY_INDEX) ||
22502ac23a2eaa3 Kent Overstreet 2019-12-16  591  	    arg.pad[0] ||
22502ac23a2eaa3 Kent Overstreet 2019-12-16  592  	    arg.pad[1] ||
22502ac23a2eaa3 Kent Overstreet 2019-12-16  593  	    arg.pad[2])
22502ac23a2eaa3 Kent Overstreet 2019-12-16  594  		return -EINVAL;
22502ac23a2eaa3 Kent Overstreet 2019-12-16  595  
22502ac23a2eaa3 Kent Overstreet 2019-12-16  596  	ca = bch2_device_lookup(c, arg.dev, arg.flags);
22502ac23a2eaa3 Kent Overstreet 2019-12-16  597  	if (IS_ERR(ca))
22502ac23a2eaa3 Kent Overstreet 2019-12-16  598  		return PTR_ERR(ca);
22502ac23a2eaa3 Kent Overstreet 2019-12-16  599  
3d080aa52f6c1bf Kent Overstreet 2020-07-22  600  	src = bch2_dev_usage_read(ca);
22502ac23a2eaa3 Kent Overstreet 2019-12-16  601  
22502ac23a2eaa3 Kent Overstreet 2019-12-16  602  	arg.state		= ca->mi.state;
22502ac23a2eaa3 Kent Overstreet 2019-12-16  603  	arg.bucket_size		= ca->mi.bucket_size;
22502ac23a2eaa3 Kent Overstreet 2019-12-16  604  	arg.nr_buckets		= ca->mi.nbuckets - ca->mi.first_bucket;
22502ac23a2eaa3 Kent Overstreet 2019-12-16  605  
2612e29142ff718 Kent Overstreet 2023-11-23  606  	for (i = 0; i < ARRAY_SIZE(arg.d); i++) {
822835ffeae411b Kent Overstreet 2022-04-01  607  		arg.d[i].buckets	= src.d[i].buckets;
822835ffeae411b Kent Overstreet 2022-04-01  608  		arg.d[i].sectors	= src.d[i].sectors;
822835ffeae411b Kent Overstreet 2022-04-01  609  		arg.d[i].fragmented	= src.d[i].fragmented;
22502ac23a2eaa3 Kent Overstreet 2019-12-16  610  	}
22502ac23a2eaa3 Kent Overstreet 2019-12-16  611  
f295298b8c6413f Kent Overstreet 2024-05-03  612  	bch2_dev_put(ca);
22502ac23a2eaa3 Kent Overstreet 2019-12-16  613  
e6674decb219599 Kent Overstreet 2023-11-23  614  	return copy_to_user_errcode(user_arg, &arg, sizeof(arg));
e6674decb219599 Kent Overstreet 2023-11-23 @615  }
e6674decb219599 Kent Overstreet 2023-11-23  616  

:::::: The code at line 615 was first introduced by commit
:::::: e6674decb2195999ae9fe074bf048ba91e336144 bcachefs: BCH_IOCTL_DEV_USAGE_V2

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
