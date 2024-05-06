Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22847F462
	for <oe-kbuild@lists.linux.dev>; Mon,  6 May 2024 13:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715003136; cv=none; b=hQ6lj7CzIsrQF3W1TMuy8q8MAPxg9o9eNImOHDPmkbKDyyj5F0/Pu7BRyQxwPK4zfvN1aIFk+YSXaxEYD/poF0Lys4cGkIP0sR2SlAwYiSx0ORaZhyutHsu7xpvNy+qhVXifAxptGy/ZWaTtC6XlDhy3I2poduQYZex21tGgYPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715003136; c=relaxed/simple;
	bh=pTjy1Ir3L9A+YgYWM8t4+1bBEiJKCfx/8JqfLZVk5mY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uMhWKDkGhmlvaWc6J0QNHCq8WWOZ48ECgoHTKRKNm+O5AaSLDkCbGiAFnY1/m6YcyPvXWUvltd0Q0B88JJYRB/+rOoG173ZVD7hypKg4Lum1kcwGMvWW8qJJWWTN6UtI2YfO9gDLAw1NxzxQykA3/d6PR2INegRmItQivI/ihMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NmlQ16vO; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NmlQ16vO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715003134; x=1746539134;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pTjy1Ir3L9A+YgYWM8t4+1bBEiJKCfx/8JqfLZVk5mY=;
  b=NmlQ16vOeJJkRmiTxDOiAwtaIGEur8Ga30k10JXuSsuJ1MO9inFiuX0K
   bExwAVkdByUle2X15qwLPBzL5akHmLpAd0IYJoTjdmMWt2AdAXgcvIL1R
   pucb2RGLvlod80Ko2n6co9gecW7gGgQ2kMjwE0jCYUkaID9YEAwrl0o59
   UOWl5B01uJ47Yof79Py4LvUlrI/d6UyQT0Vnv7m3Ea6/FCB5gZyBKQJVx
   WKASCoevYsdt3NAKch0BGcOycdyl3TusLCogtkXGhQTaxFd5slm7LMw99
   bg0Yd9eSA3kDWgJf1jDSHOzlS6IInsy5WIn54hxLq4KkAAfGVsvSJ13Rj
   w==;
X-CSE-ConnectionGUID: OquJNknqT9GItDkG/wRhTQ==
X-CSE-MsgGUID: T3iDth97T8Cog9eRlw0E6g==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="10870706"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; 
   d="scan'208";a="10870706"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 06:45:34 -0700
X-CSE-ConnectionGUID: xT1qIu9jQYKkLUgpCAIiAQ==
X-CSE-MsgGUID: OfP4fPq6S2ikD6k1jhoALw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; 
   d="scan'208";a="28163342"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 May 2024 06:45:26 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3yei-0000h9-10;
	Mon, 06 May 2024 13:45:24 +0000
Date: Mon, 6 May 2024 21:45:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe-block:rw_iter 105/436]
 drivers/accel/habanalabs/common/debugfs.c:495 mmu_asid_va_write() warn:
 potential spectre issue 'kbuf' [w]
Message-ID: <202405062102.7g5iEAmE-lkp@intel.com>
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
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   76357cc68895161ff344c4524f2cd138bcedd4ce
commit: c0754af122e18f662e5fb94207a8f6b86acd5fdd [105/436] drivers/accel: convert to read/write iterators
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: x86_64-randconfig-161-20240506 (https://download.01.org/0day-ci/archive/20240506/202405062102.7g5iEAmE-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405062102.7g5iEAmE-lkp@intel.com/

smatch warnings:
drivers/accel/habanalabs/common/debugfs.c:495 mmu_asid_va_write() warn: potential spectre issue 'kbuf' [w]
drivers/accel/habanalabs/common/debugfs.c:558 mmu_ack_error_value_write() warn: potential spectre issue 'kbuf' [w]

vim +/kbuf +495 drivers/accel/habanalabs/common/debugfs.c

c216477363a37a drivers/misc/habanalabs/debugfs.c         Oded Gabbay    2019-02-16  479  
c0754af122e18f drivers/accel/habanalabs/common/debugfs.c Jens Axboe     2024-04-05  480  static ssize_t mmu_asid_va_write(struct kiocb *iocb, struct iov_iter *from)
c216477363a37a drivers/misc/habanalabs/debugfs.c         Oded Gabbay    2019-02-16  481  {
c0754af122e18f drivers/accel/habanalabs/common/debugfs.c Jens Axboe     2024-04-05  482  	struct seq_file *s = iocb->ki_filp->private_data;
c216477363a37a drivers/misc/habanalabs/debugfs.c         Oded Gabbay    2019-02-16  483  	struct hl_debugfs_entry *entry = s->private;
c216477363a37a drivers/misc/habanalabs/debugfs.c         Oded Gabbay    2019-02-16  484  	struct hl_dbg_device_entry *dev_entry = entry->dev_entry;
c216477363a37a drivers/misc/habanalabs/debugfs.c         Oded Gabbay    2019-02-16  485  	struct hl_device *hdev = dev_entry->hdev;
c0754af122e18f drivers/accel/habanalabs/common/debugfs.c Jens Axboe     2024-04-05  486  	size_t count = iov_iter_count(from);
c8c062e9671841 drivers/accel/habanalabs/common/debugfs.c Tal Risin      2024-01-31  487  	char kbuf[MMU_KBUF_SIZE] = {0};
c216477363a37a drivers/misc/habanalabs/debugfs.c         Oded Gabbay    2019-02-16  488  	char *c;
c216477363a37a drivers/misc/habanalabs/debugfs.c         Oded Gabbay    2019-02-16  489  	ssize_t rc;
c216477363a37a drivers/misc/habanalabs/debugfs.c         Oded Gabbay    2019-02-16  490  
8438846cce61e2 drivers/misc/habanalabs/debugfs.c         Jann Horn      2019-05-04  491  	if (count > sizeof(kbuf) - 1)
8438846cce61e2 drivers/misc/habanalabs/debugfs.c         Jann Horn      2019-05-04  492  		goto err;
c0754af122e18f drivers/accel/habanalabs/common/debugfs.c Jens Axboe     2024-04-05  493  	if (!copy_from_iter_full(kbuf, count, from))
c216477363a37a drivers/misc/habanalabs/debugfs.c         Oded Gabbay    2019-02-16  494  		goto err;
8438846cce61e2 drivers/misc/habanalabs/debugfs.c         Jann Horn      2019-05-04 @495  	kbuf[count] = 0;
c216477363a37a drivers/misc/habanalabs/debugfs.c         Oded Gabbay    2019-02-16  496  
c216477363a37a drivers/misc/habanalabs/debugfs.c         Oded Gabbay    2019-02-16  497  	c = strchr(kbuf, ' ');
c216477363a37a drivers/misc/habanalabs/debugfs.c         Oded Gabbay    2019-02-16  498  	if (!c)
c216477363a37a drivers/misc/habanalabs/debugfs.c         Oded Gabbay    2019-02-16  499  		goto err;
8438846cce61e2 drivers/misc/habanalabs/debugfs.c         Jann Horn      2019-05-04  500  	*c = '\0';
c216477363a37a drivers/misc/habanalabs/debugfs.c         Oded Gabbay    2019-02-16  501  
8438846cce61e2 drivers/misc/habanalabs/debugfs.c         Jann Horn      2019-05-04  502  	rc = kstrtouint(kbuf, 10, &dev_entry->mmu_asid);
c216477363a37a drivers/misc/habanalabs/debugfs.c         Oded Gabbay    2019-02-16  503  	if (rc)
c216477363a37a drivers/misc/habanalabs/debugfs.c         Oded Gabbay    2019-02-16  504  		goto err;
c216477363a37a drivers/misc/habanalabs/debugfs.c         Oded Gabbay    2019-02-16  505  
8438846cce61e2 drivers/misc/habanalabs/debugfs.c         Jann Horn      2019-05-04  506  	if (strncmp(c+1, "0x", 2))
c216477363a37a drivers/misc/habanalabs/debugfs.c         Oded Gabbay    2019-02-16  507  		goto err;
8438846cce61e2 drivers/misc/habanalabs/debugfs.c         Jann Horn      2019-05-04  508  	rc = kstrtoull(c+3, 16, &dev_entry->mmu_addr);
c216477363a37a drivers/misc/habanalabs/debugfs.c         Oded Gabbay    2019-02-16  509  	if (rc)
c216477363a37a drivers/misc/habanalabs/debugfs.c         Oded Gabbay    2019-02-16  510  		goto err;
c216477363a37a drivers/misc/habanalabs/debugfs.c         Oded Gabbay    2019-02-16  511  
c216477363a37a drivers/misc/habanalabs/debugfs.c         Oded Gabbay    2019-02-16  512  	return count;
c216477363a37a drivers/misc/habanalabs/debugfs.c         Oded Gabbay    2019-02-16  513  
c216477363a37a drivers/misc/habanalabs/debugfs.c         Oded Gabbay    2019-02-16  514  err:
c216477363a37a drivers/misc/habanalabs/debugfs.c         Oded Gabbay    2019-02-16  515  	dev_err(hdev->dev, "usage: echo <asid> <0xaddr> > mmu\n");
c216477363a37a drivers/misc/habanalabs/debugfs.c         Oded Gabbay    2019-02-16  516  
c216477363a37a drivers/misc/habanalabs/debugfs.c         Oded Gabbay    2019-02-16  517  	return -EINVAL;
c216477363a37a drivers/misc/habanalabs/debugfs.c         Oded Gabbay    2019-02-16  518  }
c216477363a37a drivers/misc/habanalabs/debugfs.c         Oded Gabbay    2019-02-16  519  
8aa1e1e605535a drivers/misc/habanalabs/common/debugfs.c  Moti Haimovski 2022-06-27  520  static int mmu_ack_error(struct seq_file *s, void *data)
8aa1e1e605535a drivers/misc/habanalabs/common/debugfs.c  Moti Haimovski 2022-06-27  521  {
8aa1e1e605535a drivers/misc/habanalabs/common/debugfs.c  Moti Haimovski 2022-06-27  522  	struct hl_debugfs_entry *entry = s->private;
8aa1e1e605535a drivers/misc/habanalabs/common/debugfs.c  Moti Haimovski 2022-06-27  523  	struct hl_dbg_device_entry *dev_entry = entry->dev_entry;
8aa1e1e605535a drivers/misc/habanalabs/common/debugfs.c  Moti Haimovski 2022-06-27  524  	struct hl_device *hdev = dev_entry->hdev;
8aa1e1e605535a drivers/misc/habanalabs/common/debugfs.c  Moti Haimovski 2022-06-27  525  	int rc;
8aa1e1e605535a drivers/misc/habanalabs/common/debugfs.c  Moti Haimovski 2022-06-27  526  
8aa1e1e605535a drivers/misc/habanalabs/common/debugfs.c  Moti Haimovski 2022-06-27  527  	if (!dev_entry->mmu_cap_mask) {
8aa1e1e605535a drivers/misc/habanalabs/common/debugfs.c  Moti Haimovski 2022-06-27  528  		dev_err(hdev->dev, "mmu_cap_mask is not set\n");
8aa1e1e605535a drivers/misc/habanalabs/common/debugfs.c  Moti Haimovski 2022-06-27  529  		goto err;
8aa1e1e605535a drivers/misc/habanalabs/common/debugfs.c  Moti Haimovski 2022-06-27  530  	}
8aa1e1e605535a drivers/misc/habanalabs/common/debugfs.c  Moti Haimovski 2022-06-27  531  
8aa1e1e605535a drivers/misc/habanalabs/common/debugfs.c  Moti Haimovski 2022-06-27  532  	rc = hdev->asic_funcs->ack_mmu_errors(hdev, dev_entry->mmu_cap_mask);
8aa1e1e605535a drivers/misc/habanalabs/common/debugfs.c  Moti Haimovski 2022-06-27  533  	if (rc)
8aa1e1e605535a drivers/misc/habanalabs/common/debugfs.c  Moti Haimovski 2022-06-27  534  		goto err;
8aa1e1e605535a drivers/misc/habanalabs/common/debugfs.c  Moti Haimovski 2022-06-27  535  
8aa1e1e605535a drivers/misc/habanalabs/common/debugfs.c  Moti Haimovski 2022-06-27  536  	return 0;
8aa1e1e605535a drivers/misc/habanalabs/common/debugfs.c  Moti Haimovski 2022-06-27  537  err:
8aa1e1e605535a drivers/misc/habanalabs/common/debugfs.c  Moti Haimovski 2022-06-27  538  	return -EINVAL;
8aa1e1e605535a drivers/misc/habanalabs/common/debugfs.c  Moti Haimovski 2022-06-27  539  }
8aa1e1e605535a drivers/misc/habanalabs/common/debugfs.c  Moti Haimovski 2022-06-27  540  
c0754af122e18f drivers/accel/habanalabs/common/debugfs.c Jens Axboe     2024-04-05  541  static ssize_t mmu_ack_error_value_write(struct kiocb *iocb,
c0754af122e18f drivers/accel/habanalabs/common/debugfs.c Jens Axboe     2024-04-05  542  					 struct iov_iter *from)
8aa1e1e605535a drivers/misc/habanalabs/common/debugfs.c  Moti Haimovski 2022-06-27  543  {
c0754af122e18f drivers/accel/habanalabs/common/debugfs.c Jens Axboe     2024-04-05  544  	struct seq_file *s = iocb->ki_filp->private_data;
8aa1e1e605535a drivers/misc/habanalabs/common/debugfs.c  Moti Haimovski 2022-06-27  545  	struct hl_debugfs_entry *entry = s->private;
8aa1e1e605535a drivers/misc/habanalabs/common/debugfs.c  Moti Haimovski 2022-06-27  546  	struct hl_dbg_device_entry *dev_entry = entry->dev_entry;
8aa1e1e605535a drivers/misc/habanalabs/common/debugfs.c  Moti Haimovski 2022-06-27  547  	struct hl_device *hdev = dev_entry->hdev;
c0754af122e18f drivers/accel/habanalabs/common/debugfs.c Jens Axboe     2024-04-05  548  	size_t count = iov_iter_count(from);
c8c062e9671841 drivers/accel/habanalabs/common/debugfs.c Tal Risin      2024-01-31  549  	char kbuf[MMU_KBUF_SIZE] = {0};
8aa1e1e605535a drivers/misc/habanalabs/common/debugfs.c  Moti Haimovski 2022-06-27  550  	ssize_t rc;
8aa1e1e605535a drivers/misc/habanalabs/common/debugfs.c  Moti Haimovski 2022-06-27  551  
8aa1e1e605535a drivers/misc/habanalabs/common/debugfs.c  Moti Haimovski 2022-06-27  552  	if (count > sizeof(kbuf) - 1)
8aa1e1e605535a drivers/misc/habanalabs/common/debugfs.c  Moti Haimovski 2022-06-27  553  		goto err;
8aa1e1e605535a drivers/misc/habanalabs/common/debugfs.c  Moti Haimovski 2022-06-27  554  
c0754af122e18f drivers/accel/habanalabs/common/debugfs.c Jens Axboe     2024-04-05  555  	if (!copy_from_iter(kbuf, count, from))
8aa1e1e605535a drivers/misc/habanalabs/common/debugfs.c  Moti Haimovski 2022-06-27  556  		goto err;
8aa1e1e605535a drivers/misc/habanalabs/common/debugfs.c  Moti Haimovski 2022-06-27  557  
8aa1e1e605535a drivers/misc/habanalabs/common/debugfs.c  Moti Haimovski 2022-06-27 @558  	kbuf[count] = 0;
8aa1e1e605535a drivers/misc/habanalabs/common/debugfs.c  Moti Haimovski 2022-06-27  559  
8aa1e1e605535a drivers/misc/habanalabs/common/debugfs.c  Moti Haimovski 2022-06-27  560  	if (strncmp(kbuf, "0x", 2))
8aa1e1e605535a drivers/misc/habanalabs/common/debugfs.c  Moti Haimovski 2022-06-27  561  		goto err;
8aa1e1e605535a drivers/misc/habanalabs/common/debugfs.c  Moti Haimovski 2022-06-27  562  
8aa1e1e605535a drivers/misc/habanalabs/common/debugfs.c  Moti Haimovski 2022-06-27  563  	rc = kstrtoull(kbuf, 16, &dev_entry->mmu_cap_mask);
8aa1e1e605535a drivers/misc/habanalabs/common/debugfs.c  Moti Haimovski 2022-06-27  564  	if (rc)
8aa1e1e605535a drivers/misc/habanalabs/common/debugfs.c  Moti Haimovski 2022-06-27  565  		goto err;
8aa1e1e605535a drivers/misc/habanalabs/common/debugfs.c  Moti Haimovski 2022-06-27  566  
8aa1e1e605535a drivers/misc/habanalabs/common/debugfs.c  Moti Haimovski 2022-06-27  567  	return count;
8aa1e1e605535a drivers/misc/habanalabs/common/debugfs.c  Moti Haimovski 2022-06-27  568  err:
8aa1e1e605535a drivers/misc/habanalabs/common/debugfs.c  Moti Haimovski 2022-06-27  569  	dev_err(hdev->dev, "usage: echo <0xmmu_cap_mask > > mmu_error\n");
8aa1e1e605535a drivers/misc/habanalabs/common/debugfs.c  Moti Haimovski 2022-06-27  570  
8aa1e1e605535a drivers/misc/habanalabs/common/debugfs.c  Moti Haimovski 2022-06-27  571  	return -EINVAL;
8aa1e1e605535a drivers/misc/habanalabs/common/debugfs.c  Moti Haimovski 2022-06-27  572  }
8aa1e1e605535a drivers/misc/habanalabs/common/debugfs.c  Moti Haimovski 2022-06-27  573  

:::::: The code at line 495 was first introduced by commit
:::::: 8438846cce61e284a22316c13aa4b63772963070 habanalabs: fix debugfs code

:::::: TO: Jann Horn <jannh@google.com>
:::::: CC: Oded Gabbay <oded.gabbay@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
