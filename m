Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F5F317142
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Mar 2026 07:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773301612; cv=none; b=tYgISih0zK2fI7cDXfunB+TUMyW5qldAspWkwXA5+frSIKipF++51bX/6MR4eFTZE9g9l3zx/BSJwPKuu2yfskGicEtDbJAtRE8SvriiLXUZ8aLQ+g57ha6ArK9Q1BpfS0I0zho+07/ACGV7l1ALmqlae8EX+jPWPAw2ft6r1zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773301612; c=relaxed/simple;
	bh=dAuwVrf631JTNO7vg87J+8nAnKgG/gVjv1VkYcWNYp8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mCMz/1OfeC/W1xPlmlWDpNltvQBAhjmQNIW0089+OtSXTHOd7ELY29Sykj4OFMt4lKJ9ywYhb1ZFeFL2OkixbtlU3oyZGLmm2Shu5Ia6XoArWUx/UZeVlfiCUKpo/eGdqeBiPfLmF4ddaqMhQr0djEdKxUPos5NUe7K3Sml1FeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L2ejgHF/; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L2ejgHF/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773301611; x=1804837611;
  h=date:from:to:cc:subject:message-id;
  bh=dAuwVrf631JTNO7vg87J+8nAnKgG/gVjv1VkYcWNYp8=;
  b=L2ejgHF/Xs2lXVHgs5fOua/jVNZnIH6aIjoeY3R9+KEXFaD+dhazutaG
   xyroQqW28nCD0Ek1lwgXklHAyuKvbKDlmMrJfE8jegHV7/zUVl7mFFU+P
   xPSZzTMShKkAdrlUFKKkfBD8jOBDFwn/i0CIBzIQ89tBA/IJMt1VkVPS/
   WHXIiKNo2smg++6H7DIUEuqDsqUjPKzAb8txIEMTIXQL6PbuPVDU5Bb4e
   GgSjOtkD2gugLG+6axkZMOXCRq0cOJw8U1TvzEOVttLWzFqSw78KdytRD
   iL2e5X18zKEPhj6joUzxU68Lz3XVHLdCiDk6PoscDW6b4rl63jqHvJmQ2
   A==;
X-CSE-ConnectionGUID: xbnYay5CRBG/qZhPPXBnHg==
X-CSE-MsgGUID: 2f56OQXWRXKUyzYmL0x5Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="85471395"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="85471395"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 00:46:51 -0700
X-CSE-ConnectionGUID: rjhKdrmbQB2iSQ4CUn7CVA==
X-CSE-MsgGUID: QBpzoVodQFeCRvaMMLugwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="224880937"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Mar 2026 00:46:49 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0akp-000000002DO-0bXG;
	Thu, 12 Mar 2026 07:46:47 +0000
Date: Thu, 12 Mar 2026 15:46:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe:rw_iter 155/471] drivers/usb/chipidea/debug.c:89
 ci_port_test_write() warn: potential spectre issue 'buf' [w]
Message-ID: <202603121510.vaiHWvfx-lkp@intel.com>
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
commit: c08703a0ede98e3db453b782579c22892e8909ab [155/471] usb: chipidea: convert to read/write iterators
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: openrisc-randconfig-r071-20260307 (https://download.01.org/0day-ci/archive/20260312/202603121510.vaiHWvfx-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603121510.vaiHWvfx-lkp@intel.com/

smatch warnings:
drivers/usb/chipidea/debug.c:89 ci_port_test_write() warn: potential spectre issue 'buf' [w]

vim +/buf +89 drivers/usb/chipidea/debug.c

e443b333629f82c Alexander Shishkin  2012-05-11   70  
5722a8efc6c8979 Lee Jones           2020-07-03   71  /*
2d6512892c10655 Alexander Shishkin  2013-03-30   72   * ci_port_test_write: writes port test mode
e443b333629f82c Alexander Shishkin  2012-05-11   73   */
c08703a0ede98e3 Jens Axboe          2024-04-11   74  static ssize_t ci_port_test_write(struct kiocb *iocb, struct iov_iter *from)
e443b333629f82c Alexander Shishkin  2012-05-11   75  {
c08703a0ede98e3 Jens Axboe          2024-04-11   76  	struct seq_file *s = iocb->ki_filp->private_data;
c08703a0ede98e3 Jens Axboe          2024-04-11   77  	size_t count = iov_iter_count(from);
8e22978c57087aa Alexander Shishkin  2013-06-24   78  	struct ci_hdrc *ci = s->private;
e443b333629f82c Alexander Shishkin  2012-05-11   79  	unsigned long flags;
e443b333629f82c Alexander Shishkin  2012-05-11   80  	unsigned mode;
2d6512892c10655 Alexander Shishkin  2013-03-30   81  	char buf[32];
2d6512892c10655 Alexander Shishkin  2013-03-30   82  	int ret;
e443b333629f82c Alexander Shishkin  2012-05-11   83  
bd5fb0aec3dd7cd Heinrich Schuchardt 2015-04-28   84  	count = min_t(size_t, sizeof(buf) - 1, count);
c08703a0ede98e3 Jens Axboe          2024-04-11   85  	if (!copy_from_iter_full(buf, count, from))
2d6512892c10655 Alexander Shishkin  2013-03-30   86  		return -EFAULT;
e443b333629f82c Alexander Shishkin  2012-05-11   87  
bd5fb0aec3dd7cd Heinrich Schuchardt 2015-04-28   88  	/* sscanf requires a zero terminated string */
bd5fb0aec3dd7cd Heinrich Schuchardt 2015-04-28  @89  	buf[count] = '\0';
bd5fb0aec3dd7cd Heinrich Schuchardt 2015-04-28   90  
2d6512892c10655 Alexander Shishkin  2013-03-30   91  	if (sscanf(buf, "%u", &mode) != 1)
2d6512892c10655 Alexander Shishkin  2013-03-30   92  		return -EINVAL;
e443b333629f82c Alexander Shishkin  2012-05-11   93  
3c724888d2b1e08 Alan                2016-02-15   94  	if (mode > 255)
3c724888d2b1e08 Alan                2016-02-15   95  		return -EBADRQC;
3c724888d2b1e08 Alan                2016-02-15   96  
bc24937943d9f71 Li Jun              2015-07-29   97  	pm_runtime_get_sync(ci->dev);
26c696c678c4ce1 Richard Zhao        2012-07-07   98  	spin_lock_irqsave(&ci->lock, flags);
2d6512892c10655 Alexander Shishkin  2013-03-30   99  	ret = hw_port_test_set(ci, mode);
26c696c678c4ce1 Richard Zhao        2012-07-07  100  	spin_unlock_irqrestore(&ci->lock, flags);
bc24937943d9f71 Li Jun              2015-07-29  101  	pm_runtime_put_sync(ci->dev);
e443b333629f82c Alexander Shishkin  2012-05-11  102  
2d6512892c10655 Alexander Shishkin  2013-03-30  103  	return ret ? ret : count;
e443b333629f82c Alexander Shishkin  2012-05-11  104  }
2d6512892c10655 Alexander Shishkin  2013-03-30  105  

:::::: The code at line 89 was first introduced by commit
:::::: bd5fb0aec3dd7cde7ec4c397b10e55d4c9626d8d usb: chipidea: debug: avoid out of bound read

:::::: TO: Heinrich Schuchardt <xypron.glpk@gmx.de>
:::::: CC: Peter Chen <peter.chen@freescale.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
