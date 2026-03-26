Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC37348860
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Mar 2026 09:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774517839; cv=none; b=KcQdI8nysl7LVzaNIhPiDuwkYitilo2zTPUouetT2ZY6nQ0+f0cv6v3IMBnXkXLm6AkLq8IOgsM28thVS4kYcTbCNBxRnrnhgm3tsX8gR4TtHCh7eLUftYLApVREWB9QteYXSCU1sr7bRm25C2Me8vZfhCm+Ip+l8LNGsFDbQlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774517839; c=relaxed/simple;
	bh=mcZT0/uOL7VmqDzwttISaIzbOvcP/kIQQXxg9sxoO6E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=b6c6b8Iu+YiGo4zUGxrhRhvwCovH4mNf5/2+mUe2mTzkVH8IYGmMeiqEyiGFfta3wiXd4cSW10RMvWGsmYLpdrb7cgxWDQWUAwokTzqzwYG6khp13DD3xfb7obkLg2OCNZIXBpZpYTuHD799Qg61WmPSBfGCNbUsAVC/BO0c+PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X8qrHRrk; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X8qrHRrk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774517838; x=1806053838;
  h=date:from:to:cc:subject:message-id;
  bh=mcZT0/uOL7VmqDzwttISaIzbOvcP/kIQQXxg9sxoO6E=;
  b=X8qrHRrkd64JNBZZ7lAP3XdB7AzeIJHm4n9XfGF9C9pxJJibwEIObk5h
   NUKWhXEDNuKONZflHDtO/BaS8I0nQqhoILkKw61mSSnEu3LF4FEQz6IDD
   /bcngt89VILPan9byjD+L+g+FvNx7B3rZxr9BBW5VHbHA/XrTFLuJlQON
   2aIV5WQ3bX0EBNlsQIlVcyaPMPIFX0goUG6Yow9rFazZNb8//teoWbCFO
   jEKHoIRFfUGNE1BZ+FI/6esngHwzfM7YH48EYkctGyjxRfapNk/5s4kev
   mkJbP4bl20gyTWphrHb5a/sm3XGylArJ1VkUD98JkmZqHh+wvwwcUEjfX
   Q==;
X-CSE-ConnectionGUID: t1gJ0NSbSn6mN5pqsJMhrw==
X-CSE-MsgGUID: 0t5A43W0Q6uIZPSeymwtYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="78166272"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="78166272"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 02:37:17 -0700
X-CSE-ConnectionGUID: SrJ9FEnwRjCjvW7obfsVPA==
X-CSE-MsgGUID: ok6m5x85SiCm3T4VK7LKqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="229721608"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 26 Mar 2026 02:37:15 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5h9N-000000008jF-0PnN;
	Thu, 26 Mar 2026 09:37:13 +0000
Date: Thu, 26 Mar 2026 17:36:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe:rw_iter 492/525] kernel/sched/psi.c:1556 psi_write()
 warn: potential spectre issue 'buf' [w]
Message-ID: <202603261744.GyycPJWm-lkp@intel.com>
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
head:   d5f290ca006c2bdabff8aa383fd3cf9cf9194259
commit: d7ac12f1381ba682dc4eff47d1716229d6cd5606 [492/525] sched/psi: convert proc_write to ->proc_write_iter()
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: sparc-randconfig-r072-20260326 (https://download.01.org/0day-ci/archive/20260326/202603261744.GyycPJWm-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603261744.GyycPJWm-lkp@intel.com/

smatch warnings:
kernel/sched/psi.c:1556 psi_write() warn: potential spectre issue 'buf' [w]

vim +/buf +1556 kernel/sched/psi.c

5102bb1c9f8285 Suren Baghdasaryan 2022-01-19  1536  
d7ac12f1381ba6 Jens Axboe         2026-03-18  1537  static ssize_t psi_write(struct kiocb *iocb, struct iov_iter *from,
d7ac12f1381ba6 Jens Axboe         2026-03-18  1538  			 enum psi_res res)
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1539  {
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1540  	char buf[32];
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1541  	size_t buf_size;
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1542  	struct seq_file *seq;
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1543  	struct psi_trigger *new;
d7ac12f1381ba6 Jens Axboe         2026-03-18  1544  	size_t nbytes = iov_iter_count(from);
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1545  
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1546  	if (static_branch_likely(&psi_disabled))
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1547  		return -EOPNOTSUPP;
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1548  
6fcca0fa48118e Suren Baghdasaryan 2020-02-03  1549  	if (!nbytes)
6fcca0fa48118e Suren Baghdasaryan 2020-02-03  1550  		return -EINVAL;
6fcca0fa48118e Suren Baghdasaryan 2020-02-03  1551  
4adcdcea717cb2 Miles Chen         2019-09-12  1552  	buf_size = min(nbytes, sizeof(buf));
d7ac12f1381ba6 Jens Axboe         2026-03-18  1553  	if (!copy_from_iter_full(buf, buf_size, from))
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1554  		return -EFAULT;
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1555  
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14 @1556  	buf[buf_size - 1] = '\0';
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1557  
d7ac12f1381ba6 Jens Axboe         2026-03-18  1558  	seq = iocb->ki_filp->private_data;
a06247c6804f1a Suren Baghdasaryan 2022-01-11  1559  
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1560  	/* Take seq->lock to protect seq->private from concurrent writes */
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1561  	mutex_lock(&seq->lock);
a06247c6804f1a Suren Baghdasaryan 2022-01-11  1562  
a06247c6804f1a Suren Baghdasaryan 2022-01-11  1563  	/* Allow only one trigger per file descriptor */
a06247c6804f1a Suren Baghdasaryan 2022-01-11  1564  	if (seq->private) {
a06247c6804f1a Suren Baghdasaryan 2022-01-11  1565  		mutex_unlock(&seq->lock);
a06247c6804f1a Suren Baghdasaryan 2022-01-11  1566  		return -EBUSY;
a06247c6804f1a Suren Baghdasaryan 2022-01-11  1567  	}
a06247c6804f1a Suren Baghdasaryan 2022-01-11  1568  
d7ac12f1381ba6 Jens Axboe         2026-03-18  1569  	new = psi_trigger_create(&psi_system, buf, res, iocb->ki_filp, NULL);
a06247c6804f1a Suren Baghdasaryan 2022-01-11  1570  	if (IS_ERR(new)) {
a06247c6804f1a Suren Baghdasaryan 2022-01-11  1571  		mutex_unlock(&seq->lock);
a06247c6804f1a Suren Baghdasaryan 2022-01-11  1572  		return PTR_ERR(new);
a06247c6804f1a Suren Baghdasaryan 2022-01-11  1573  	}
a06247c6804f1a Suren Baghdasaryan 2022-01-11  1574  
a06247c6804f1a Suren Baghdasaryan 2022-01-11  1575  	smp_store_release(&seq->private, new);
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1576  	mutex_unlock(&seq->lock);
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1577  
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1578  	return nbytes;
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1579  }
0e94682b73bfa6 Suren Baghdasaryan 2019-05-14  1580  

:::::: The code at line 1556 was first introduced by commit
:::::: 0e94682b73bfa6c44c98af7a26771c9c08c055d5 psi: introduce psi monitor

:::::: TO: Suren Baghdasaryan <surenb@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
