Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F702571C7
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Mar 2026 16:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773849616; cv=none; b=vC6ua6srPxerX/06w8L73YTxS72YL8v23OZT7LXBW+f9n3BYiqWIYpMEQoAC2J7I0NaMPcy4PkjFg67BpF+G7yfv6B60TjSBSiOvl3xCqfXKnz7AKzjMdG/I1PHIVoL9iWizTRsRiHJpcVqE152SA3nC+Pmi3wJD9Yf1fmIsPis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773849616; c=relaxed/simple;
	bh=9BB5Nsbe+vm/EiDl9I06n4g2ubq36N2nO34vtHfFBbM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pGSC/Cc8s3mqTmyr1+cNbqh4zwxIqfL7FA7DB860YSpdEsbSDGEJlgRe6P2mY+15L0wMP3eFASmeAu25WiCRCUAYQKO/YWDaGOGHWAAUudpMxc+3RfYLPYiO4/7cE051OJvRM2i3SURpwmfaGUW6qBF/2LTUprbVdPGXjwn4kFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hp88C2ZU; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hp88C2ZU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773849611; x=1805385611;
  h=date:from:to:cc:subject:message-id;
  bh=9BB5Nsbe+vm/EiDl9I06n4g2ubq36N2nO34vtHfFBbM=;
  b=Hp88C2ZU2f9VlKfLOxF61BGh0CV1V0JIewqlRaBv6W+sIPrCYubsXcRU
   jYLFRRI33gMuwPbtG0bAxNGaLo3YdK23CQRQUDwMD9RVXLq+8Nc7D7MO8
   rW0ZrWEJOpHgmMpCb8oUeYSFvhdCi8esDw7Viq+Y8OzpyWSZgVk9XLk5E
   at68WOgfMd1TzuyG8bzeLgK/0sXYzZu2zPAeG7Vm849K+4Bg7m2BDQO3S
   /ySUFcLKtlgInovjlapkU+Oblj1gcM2QuAX4DwEvbsmPhzRCKRFM5jM1M
   WK09VuufGBr5HqmED7Z1P3w1IweAV2W41mYrzrPsJIajJwoNdnPAoYOj+
   Q==;
X-CSE-ConnectionGUID: oQoMbhUwQW6ygzS7KXMWMw==
X-CSE-MsgGUID: BLzOdFwmSFegrUe43z7Rvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="78767624"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="78767624"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 09:00:10 -0700
X-CSE-ConnectionGUID: EdH+NnAOQA+I6jlMN3LYag==
X-CSE-MsgGUID: QULgw7GhQ1Oqn5+We+4csQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="218679421"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Mar 2026 09:00:08 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2tJV-0000000034h-3kBq;
	Wed, 18 Mar 2026 16:00:05 +0000
Date: Wed, 18 Mar 2026 23:59:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe:rw_iter 407/469] drivers/media/rc/imon.c:982
 vfd_write() warn: potential spectre issue 'ictx->tx.data_buf' [w] (local cap)
Message-ID: <202603182333.VCIt4zxW-lkp@intel.com>
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
head:   62678cb3ae1da26563d6ccca83852ce4826f683e
commit: 4315aded538749a5f15097dc1c91a6759360193a [407/469] media/rc: convert to read/write iterators
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: i386-randconfig-141-20260318 (https://download.01.org/0day-ci/archive/20260318/202603182333.VCIt4zxW-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603182333.VCIt4zxW-lkp@intel.com/

smatch warnings:
drivers/media/rc/imon.c:982 vfd_write() warn: potential spectre issue 'ictx->tx.data_buf' [w] (local cap)

vim +982 drivers/media/rc/imon.c

21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   932  
255940e642387f drivers/media/rc/imon.c Mauro Carvalho Chehab 2017-11-27   933  /*
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   934   * Writes data to the VFD.  The iMON VFD is 2x16 characters
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   935   * and requires data in 5 consecutive USB interrupt packets,
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   936   * each packet but the last carrying 7 bytes.
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   937   *
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   938   * I don't know if the VFD board supports features such as
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   939   * scrolling, clearing rows, blanking, etc. so at
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   940   * the caller must provide a full screen of data.  If fewer
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   941   * than 32 bytes are provided spaces will be appended to
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   942   * generate a full screen.
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   943   */
4315aded538749 drivers/media/rc/imon.c Jens Axboe            2024-04-09   944  static ssize_t vfd_write(struct kiocb *iocb, struct iov_iter *from)
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   945  {
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   946  	int i;
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   947  	int offset;
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   948  	int seq;
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   949  	int retval = 0;
4315aded538749 drivers/media/rc/imon.c Jens Axboe            2024-04-09   950  	struct imon_context *ictx = iocb->ki_filp->private_data;
c25895c7d6c957 drivers/media/rc/imon.c Colin Ian King        2017-09-05   951  	static const unsigned char vfd_packet6[] = {
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   952  		0x01, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF };
4315aded538749 drivers/media/rc/imon.c Jens Axboe            2024-04-09   953  	size_t n_bytes = iov_iter_count(from);
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   954  
813ceef062b53d drivers/media/rc/imon.c Gautam Menghani       2022-10-19   955  	if (mutex_lock_interruptible(&ictx->lock))
813ceef062b53d drivers/media/rc/imon.c Gautam Menghani       2022-10-19   956  		return -ERESTARTSYS;
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   957  
fa0f61cc1d8281 drivers/media/rc/imon.c Larshin Sergey        2025-07-29   958  	if (ictx->disconnected) {
fa0f61cc1d8281 drivers/media/rc/imon.c Larshin Sergey        2025-07-29   959  		retval = -ENODEV;
fa0f61cc1d8281 drivers/media/rc/imon.c Larshin Sergey        2025-07-29   960  		goto exit;
fa0f61cc1d8281 drivers/media/rc/imon.c Larshin Sergey        2025-07-29   961  	}
fa0f61cc1d8281 drivers/media/rc/imon.c Larshin Sergey        2025-07-29   962  
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   963  	if (!ictx->dev_present_intf0) {
47a09b082f7050 drivers/media/rc/imon.c Jarod Wilson          2011-07-14   964  		pr_err_ratelimited("no iMON device present\n");
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   965  		retval = -ENODEV;
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   966  		goto exit;
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   967  	}
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   968  
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   969  	if (n_bytes <= 0 || n_bytes > 32) {
47a09b082f7050 drivers/media/rc/imon.c Jarod Wilson          2011-07-14   970  		pr_err_ratelimited("invalid payload size\n");
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   971  		retval = -EINVAL;
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   972  		goto exit;
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   973  	}
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   974  
4315aded538749 drivers/media/rc/imon.c Jens Axboe            2024-04-09   975  	if (!copy_from_iter_full(ictx->tx.data_buf, n_bytes, from)) {
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   976  		retval = -EFAULT;
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   977  		goto exit;
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   978  	}
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   979  
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   980  	/* Pad with spaces */
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   981  	for (i = n_bytes; i < 32; ++i)
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16  @982  		ictx->tx.data_buf[i] = ' ';
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   983  
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   984  	for (i = 32; i < 35; ++i)
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   985  		ictx->tx.data_buf[i] = 0xFF;
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   986  
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   987  	offset = 0;
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   988  	seq = 0;
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   989  
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   990  	do {
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   991  		memcpy(ictx->usb_tx_buf, ictx->tx.data_buf + offset, 7);
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   992  		ictx->usb_tx_buf[7] = (unsigned char) seq;
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   993  
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   994  		retval = send_packet(ictx);
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   995  		if (retval) {
47a09b082f7050 drivers/media/rc/imon.c Jarod Wilson          2011-07-14   996  			pr_err_ratelimited("send packet #%d failed\n", seq / 2);
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   997  			goto exit;
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   998  		} else {
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   999  			seq += 2;
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16  1000  			offset += 7;
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16  1001  		}
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16  1002  
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16  1003  	} while (offset < 35);
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16  1004  
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16  1005  	/* Send packet #6 */
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16  1006  	memcpy(ictx->usb_tx_buf, &vfd_packet6, sizeof(vfd_packet6));
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16  1007  	ictx->usb_tx_buf[7] = (unsigned char) seq;
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16  1008  	retval = send_packet(ictx);
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16  1009  	if (retval)
47a09b082f7050 drivers/media/rc/imon.c Jarod Wilson          2011-07-14  1010  		pr_err_ratelimited("send packet #%d failed\n", seq / 2);
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16  1011  
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16  1012  exit:
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16  1013  	mutex_unlock(&ictx->lock);
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16  1014  
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16  1015  	return (!retval) ? n_bytes : retval;
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16  1016  }
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16  1017  

:::::: The code at line 982 was first introduced by commit
:::::: 21677cfc562a27e099719d413287bc8d1d24deb7 V4L/DVB: ir-core: add imon driver

:::::: TO: Jarod Wilson <jarod@redhat.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
