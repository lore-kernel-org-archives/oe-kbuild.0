Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249A0258EC2
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Mar 2026 04:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773290979; cv=none; b=sXruZp+mc2yCSG72fejZZt8nVabldzFZs5+vHGJ8I4sHwhhH7duRwlD00vyuHgxQlWc2XjiSOmBIC25SykVOKbWRGoisbutAWddjtsgda557DyN9f4L/HSCqN0eW6HzwfVITd8amYABeqRtGl1d8CwaGbFRR0dC1Ox3c0oVY0U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773290979; c=relaxed/simple;
	bh=XmUD97KB8rvTdfawiSUl76EUd84ZJacIwxiqamdGM30=;
	h=Date:From:To:Cc:Subject:Message-ID; b=E3XEjDa9o0xsB+zHXwutzOXCM1qXBj6rAizuFUF8riknqczkNadWyKTsAotj/8m5gDV0XG9IaB9QXuerM94i580AodpPhej54gH4hRk/l0VKAT5wekA2sl5psIXeS4OZUaeJGS4QGAhZthxrskfTb8atCFm54B2HUKJT39Fm2fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hb74g301; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hb74g301"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773290977; x=1804826977;
  h=date:from:to:cc:subject:message-id;
  bh=XmUD97KB8rvTdfawiSUl76EUd84ZJacIwxiqamdGM30=;
  b=Hb74g301DQzVZJhAGg5pJx9MRrcIjqhBJC/GC1bP7EDUUxeRRgvNcs6M
   t3DaRvx3NubUgfUVwO7ba0pOAhdNvRjuseX3urwXrShVb2o6ev0kK4fTA
   hIaUO26NTeuPJVSJQNW/oXico47RL/fS6EcvApPwxcL7WWETzbX+gutYy
   Fx/nZ1jwHKhypBID02IAhvWK/uDzkyy2sBjUC9GPjKkK58f4D7NYg/sC3
   oPJ4Axno7xFuVRTbHd3dh0OO5xtB+2S5NsNwWadsV0VvyjCV+5u39SasL
   4O5G+hlGLjeD3rfh1ogDVk67l8smjgzqMKm2unGbD+4XunbfdTq8FVTeG
   A==;
X-CSE-ConnectionGUID: IpVijNVvQaSaSNOq5y5J7w==
X-CSE-MsgGUID: rkH+Xyz7S8yWAshpOqjvuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="78225347"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="78225347"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 21:49:37 -0700
X-CSE-ConnectionGUID: Ijht3+v0TNiLrzvZHxbs+A==
X-CSE-MsgGUID: KXbS5mj4SA62nqV+98v76A==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Mar 2026 21:49:35 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0XzJ-0000000025T-0NJP;
	Thu, 12 Mar 2026 04:49:33 +0000
Date: Thu, 12 Mar 2026 12:48:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe:rw_iter 143/471]
 drivers/gpu/drm/loongson/lsdc_crtc.c:647 lsdc_crtc_man_op_write() warn:
 potential spectre issue 'buf' [w]
Message-ID: <202603121202.TPjZgGgX-lkp@intel.com>
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
head:   0a49759be1c3b29207758e467fdc1a90d0716d06
commit: 76dedd5c839e0bd2c29550f6a8491a5676f9b0f3 [143/471] drm/loongson: convert to read/write iterators
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: openrisc-randconfig-r071-20260307 (https://download.01.org/0day-ci/archive/20260312/202603121202.TPjZgGgX-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603121202.TPjZgGgX-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/loongson/lsdc_crtc.c:647 lsdc_crtc_man_op_write() warn: potential spectre issue 'buf' [w]

vim +/buf +647 drivers/gpu/drm/loongson/lsdc_crtc.c

f39db26c54281da Sui Jingfeng 2023-06-15  632  
76dedd5c839e0bd Jens Axboe   2024-04-09  633  static ssize_t lsdc_crtc_man_op_write(struct kiocb *iocb, struct iov_iter *from)
f39db26c54281da Sui Jingfeng 2023-06-15  634  {
76dedd5c839e0bd Jens Axboe   2024-04-09  635  	struct seq_file *m = iocb->ki_filp->private_data;
f39db26c54281da Sui Jingfeng 2023-06-15  636  	struct lsdc_crtc *lcrtc = m->private;
f39db26c54281da Sui Jingfeng 2023-06-15  637  	const struct lsdc_crtc_hw_ops *ops = lcrtc->hw_ops;
76dedd5c839e0bd Jens Axboe   2024-04-09  638  	size_t len = iov_iter_count(from);
f39db26c54281da Sui Jingfeng 2023-06-15  639  	char buf[16];
f39db26c54281da Sui Jingfeng 2023-06-15  640  
f39db26c54281da Sui Jingfeng 2023-06-15  641  	if (len > sizeof(buf) - 1)
f39db26c54281da Sui Jingfeng 2023-06-15  642  		return -EINVAL;
f39db26c54281da Sui Jingfeng 2023-06-15  643  
76dedd5c839e0bd Jens Axboe   2024-04-09  644  	if (!copy_from_iter_full(buf, len, from))
f39db26c54281da Sui Jingfeng 2023-06-15  645  		return -EFAULT;
f39db26c54281da Sui Jingfeng 2023-06-15  646  
f39db26c54281da Sui Jingfeng 2023-06-15 @647  	buf[len] = '\0';
f39db26c54281da Sui Jingfeng 2023-06-15  648  
f39db26c54281da Sui Jingfeng 2023-06-15  649  	if (sysfs_streq(buf, "soft_reset"))
f39db26c54281da Sui Jingfeng 2023-06-15  650  		ops->soft_reset(lcrtc);
f39db26c54281da Sui Jingfeng 2023-06-15  651  	else if (sysfs_streq(buf, "enable"))
f39db26c54281da Sui Jingfeng 2023-06-15  652  		ops->enable(lcrtc);
f39db26c54281da Sui Jingfeng 2023-06-15  653  	else if (sysfs_streq(buf, "disable"))
f39db26c54281da Sui Jingfeng 2023-06-15  654  		ops->disable(lcrtc);
f39db26c54281da Sui Jingfeng 2023-06-15  655  	else if (sysfs_streq(buf, "flip"))
f39db26c54281da Sui Jingfeng 2023-06-15  656  		ops->flip(lcrtc);
f39db26c54281da Sui Jingfeng 2023-06-15  657  	else if (sysfs_streq(buf, "clone"))
f39db26c54281da Sui Jingfeng 2023-06-15  658  		ops->clone(lcrtc);
f39db26c54281da Sui Jingfeng 2023-06-15  659  
f39db26c54281da Sui Jingfeng 2023-06-15  660  	return len;
f39db26c54281da Sui Jingfeng 2023-06-15  661  }
f39db26c54281da Sui Jingfeng 2023-06-15  662  

:::::: The code at line 647 was first introduced by commit
:::::: f39db26c54281da6a785259498ca74b5e470476f drm: Add kms driver for loongson display controller

:::::: TO: Sui Jingfeng <suijingfeng@loongson.cn>
:::::: CC: Sui Jingfeng <suijingfeng@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
