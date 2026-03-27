Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D243D6664
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Mar 2026 08:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774600276; cv=none; b=gmy8h/N0dM/dp/C9PpusWsFGh8+eRjpeftfp9BhhLrMADku3EG3AOTsf1aXqAMngflUamp44DVjvFz6Z9i/CsM0uXDih+RdTOG/09YTdb2Uu7ABB7rVCRU3T4o9Q61UiUKMa/BT/K5d5TpY1RRaUOUR7zmWnapN6mLkkjH0YY54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774600276; c=relaxed/simple;
	bh=YxqaW6KNuusenXVQ0QAbaAWyONpxLZJRuzATRZSloeY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Yz2NPLlB+PqWEgGEjjFB7GPhF6oONn3pvRS2DRrQjBGmbYc9OYUGwYzCR5GAd61HbG05j5YbV0EiAs66pLHL6jCCENRRgGAal+SiFBisEJk6ep4jF/g6ZTy/dMHfDTN+6k6zncMTtT37YljKePEIJ01bDL6NOnFAFkeEBiKzO5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=meJaioz0; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="meJaioz0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774600274; x=1806136274;
  h=date:from:to:cc:subject:message-id;
  bh=YxqaW6KNuusenXVQ0QAbaAWyONpxLZJRuzATRZSloeY=;
  b=meJaioz0Lvf74m3N3u8weWArWx1ZTEjKQwf2l49afleQYkxehyArzaVL
   +MnRDjTUgdU6G7MfbKsOkNzV4flSrvV9QXGcCeWAKj25oOPMcWlhAZ8Lt
   Ww51dbhyLmSlYfGFcxn56LiY9jNydpgcJ7pGoK1Q6FSqMdARogXPnG/yF
   p/KJ31UzX5yfROGjyHALHlaDvG4Dj3GBwXJMyEXWiOUkH/HGifPHSr7PM
   HxGLseL/Cvhe6Ot+mLSe6SsVCx8zXSdbDjD85SesFCGGxURonMvO75r14
   TKySNds8KS4Z6x0rQ95hnVX1bv/kcKTX17pNgYZQ9Do6/X28uCI7qzOmI
   w==;
X-CSE-ConnectionGUID: lXOsf7fiRoiJ8QIyWwjO8g==
X-CSE-MsgGUID: E6yn1pPARr2cc2n07KlSKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="87052344"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="87052344"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 01:31:13 -0700
X-CSE-ConnectionGUID: /RSpr4BVSJKU1hnyrwsCLA==
X-CSE-MsgGUID: ZXJNbEwRToSbXWU/j/hX2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="225258022"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 27 Mar 2026 01:31:13 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w62az-000000009yV-35sR;
	Fri, 27 Mar 2026 08:31:09 +0000
Date: Fri, 27 Mar 2026 16:30:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe:rw_iter 302/525] drivers/net/netdevsim/dev.c:258
 nsim_bus_dev_max_vfs_write() warn: potential spectre issue 'buf' [w]
Message-ID: <202603271609.rCLtihVE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   520344cda122ca1903fafb19768f56509e3db8b1
commit: aec95ff8ecb6046d9d493859c5c52a9179cdafbf [302/525] drivers/net/netdevsim: convert to read/write iterators
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: csky-randconfig-r073-20260327 (https://download.01.org/0day-ci/archive/20260327/202603271609.rCLtihVE-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603271609.rCLtihVE-lkp@intel.com/

smatch warnings:
drivers/net/netdevsim/dev.c:258 nsim_bus_dev_max_vfs_write() warn: potential spectre issue 'buf' [w]
drivers/net/netdevsim/fib.c:1384 nsim_nexthop_bucket_activity_write() warn: potential spectre issue 'buf' [w]

vim +/buf +258 drivers/net/netdevsim/dev.c

a3353ec3255437 Jakub Kicinski 2021-10-30  238  
aec95ff8ecb604 Jens Axboe     2024-04-06  239  static ssize_t nsim_bus_dev_max_vfs_write(struct kiocb *iocb,
aec95ff8ecb604 Jens Axboe     2024-04-06  240  					  struct iov_iter *from)
a3353ec3255437 Jakub Kicinski 2021-10-30  241  {
a3353ec3255437 Jakub Kicinski 2021-10-30  242  	struct nsim_vf_config *vfconfigs;
aec95ff8ecb604 Jens Axboe     2024-04-06  243  	size_t count = iov_iter_count(from);
a3353ec3255437 Jakub Kicinski 2021-10-30  244  	struct nsim_dev *nsim_dev;
a3353ec3255437 Jakub Kicinski 2021-10-30  245  	char buf[10];
a3353ec3255437 Jakub Kicinski 2021-10-30  246  	ssize_t ret;
a3353ec3255437 Jakub Kicinski 2021-10-30  247  	u32 val;
a3353ec3255437 Jakub Kicinski 2021-10-30  248  
aec95ff8ecb604 Jens Axboe     2024-04-06  249  	if (iocb->ki_pos != 0)
a3353ec3255437 Jakub Kicinski 2021-10-30  250  		return 0;
a3353ec3255437 Jakub Kicinski 2021-10-30  251  
a3353ec3255437 Jakub Kicinski 2021-10-30  252  	if (count >= sizeof(buf))
a3353ec3255437 Jakub Kicinski 2021-10-30  253  		return -ENOSPC;
a3353ec3255437 Jakub Kicinski 2021-10-30  254  
aec95ff8ecb604 Jens Axboe     2024-04-06  255  	ret = !copy_from_iter_full(buf, count, from);
a3353ec3255437 Jakub Kicinski 2021-10-30  256  	if (ret)
a3353ec3255437 Jakub Kicinski 2021-10-30  257  		return -EFAULT;
a3353ec3255437 Jakub Kicinski 2021-10-30 @258  	buf[count] = '\0';
a3353ec3255437 Jakub Kicinski 2021-10-30  259  
a3353ec3255437 Jakub Kicinski 2021-10-30  260  	ret = kstrtouint(buf, 10, &val);
a3353ec3255437 Jakub Kicinski 2021-10-30  261  	if (ret)
a3353ec3255437 Jakub Kicinski 2021-10-30  262  		return -EINVAL;
a3353ec3255437 Jakub Kicinski 2021-10-30  263  
a3353ec3255437 Jakub Kicinski 2021-10-30  264  	/* max_vfs limited by the maximum number of provided port indexes */
a3353ec3255437 Jakub Kicinski 2021-10-30  265  	if (val > NSIM_DEV_VF_PORT_INDEX_MAX - NSIM_DEV_VF_PORT_INDEX_BASE)
a3353ec3255437 Jakub Kicinski 2021-10-30  266  		return -ERANGE;
a3353ec3255437 Jakub Kicinski 2021-10-30  267  
69050f8d6d075d Kees Cook      2026-02-20  268  	vfconfigs = kzalloc_objs(struct nsim_vf_config, val,
a3353ec3255437 Jakub Kicinski 2021-10-30  269  				 GFP_KERNEL | __GFP_NOWARN);
a3353ec3255437 Jakub Kicinski 2021-10-30  270  	if (!vfconfigs)
a3353ec3255437 Jakub Kicinski 2021-10-30  271  		return -ENOMEM;
a3353ec3255437 Jakub Kicinski 2021-10-30  272  
aec95ff8ecb604 Jens Axboe     2024-04-06  273  	nsim_dev = iocb->ki_filp->private_data;
aff3a925094633 Jakub Kicinski 2022-03-18  274  	devl_lock(priv_to_devlink(nsim_dev));
a3353ec3255437 Jakub Kicinski 2021-10-30  275  	/* Reject if VFs are configured */
a3353ec3255437 Jakub Kicinski 2021-10-30  276  	if (nsim_dev_get_vfs(nsim_dev)) {
a3353ec3255437 Jakub Kicinski 2021-10-30  277  		ret = -EBUSY;
a3353ec3255437 Jakub Kicinski 2021-10-30  278  	} else {
a3353ec3255437 Jakub Kicinski 2021-10-30  279  		swap(nsim_dev->vfconfigs, vfconfigs);
a3353ec3255437 Jakub Kicinski 2021-10-30  280  		WRITE_ONCE(nsim_dev->nsim_bus_dev->max_vfs, val);
aec95ff8ecb604 Jens Axboe     2024-04-06  281  		iocb->ki_pos += count;
a3353ec3255437 Jakub Kicinski 2021-10-30  282  		ret = count;
a3353ec3255437 Jakub Kicinski 2021-10-30  283  	}
aff3a925094633 Jakub Kicinski 2022-03-18  284  	devl_unlock(priv_to_devlink(nsim_dev));
a3353ec3255437 Jakub Kicinski 2021-10-30  285  
a3353ec3255437 Jakub Kicinski 2021-10-30  286  	kfree(vfconfigs);
a3353ec3255437 Jakub Kicinski 2021-10-30  287  	return ret;
a3353ec3255437 Jakub Kicinski 2021-10-30  288  }
a3353ec3255437 Jakub Kicinski 2021-10-30  289  

:::::: The code at line 258 was first introduced by commit
:::::: a3353ec3255437f59537f9478ea5cd7107ba1ebf netdevsim: move max vf config to dev

:::::: TO: Jakub Kicinski <kuba@kernel.org>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
