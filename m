Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9936FBF
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Sep 2024 09:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726998830; cv=none; b=EJty6NzWPSBMQaPDT3VMMnqEt/j58ZBvkfenHvvX+oIeQ+5YfDSxpJHiOQdCrm74DYhAHdU/eXycMnsyB9HEahNL45lz57xkJ3T2mjJ14JAkRD1r9cabyuruM4/os9LZP8a86n5xM4X3M1K/GPLf2nQ5Ft/q81hixnfm8BE1H+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726998830; c=relaxed/simple;
	bh=83LjrMoXi5bCy3/3Tlwwfq0JrqaeOAGYD6YMGIU1wxs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mOZGq+cXSZebaQhca6CPzqTj4bA0uisEAmRJEQMbCVr9QPFvNZReQsarlIs4kTBlVLE73d5PTEWaaXKX5hvzf3UUw59pxjCy1YPcaIYCjsX2rXvbTlEbAhqaobdFGYYozN+JLJL68X4kXkoxEGk9ATXowvbw81YCwQ4a4Re3l1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bhISOBxh; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bhISOBxh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726998829; x=1758534829;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=83LjrMoXi5bCy3/3Tlwwfq0JrqaeOAGYD6YMGIU1wxs=;
  b=bhISOBxhnvFsqvp06zy7FRv2B6CCMzMOcxguyGMK+mHwuaPDTtrfcBUj
   fzOfuSeMlUxCCK/sqSjD5blVpT5Zf9F1xw7CRYqZ1sxjXgSAyI/xzlQHz
   YlUiLVVmw+JNNy9vx5LrXCpu0gtNpsax7Bb3lx15Rwnb7ywyYEYavp4x2
   pxoHOkPKw1FWO5fryNEtmfN5RxYfiBVMZeDdy7slQue/KZ2PzXVFLaU6P
   cGVNFNlEdgJ/qgUzpn6SVgBucZTsgohPRmVWkSepoUsgO0SyoMtasjQXi
   A6PaGA+9iesVVXQD5gqmVT1HfvoPGJTl7DF459CRsCcYoSJS1AsdBW9hS
   Q==;
X-CSE-ConnectionGUID: BoBhoqIMTHOvj8oVrnzNSg==
X-CSE-MsgGUID: 2FG2If6GSS+o/0PBHdvPuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="25902532"
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="25902532"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 02:53:48 -0700
X-CSE-ConnectionGUID: ZQY3yJgTS1uYsCer0d342Q==
X-CSE-MsgGUID: Uo0+lqSMRNaT1CBKhFhsBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="71602469"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 22 Sep 2024 02:53:47 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssJHk-000GBy-0A;
	Sun, 22 Sep 2024 09:53:44 +0000
Date: Sun, 22 Sep 2024 17:53:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe-block:rw_iter 417/448] drivers/media/rc/imon.c:975
 vfd_write() warn: potential spectre issue 'ictx->tx.data_buf' [w] (local
 cap)
Message-ID: <202409221755.yBSAvw6I-lkp@intel.com>
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
head:   7ef9d29ff0268d9fb68e3b1bf7548981d7a61307
commit: 0eb3a7fa4f8bd32020202434a317f27da27e5ec9 [417/448] media/rc: convert to read/write iterators
:::::: branch date: 3 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20240922 (https://download.01.org/0day-ci/archive/20240922/202409221755.yBSAvw6I-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409221755.yBSAvw6I-lkp@intel.com/

smatch warnings:
drivers/media/rc/imon.c:975 vfd_write() warn: potential spectre issue 'ictx->tx.data_buf' [w] (local cap)

vim +975 drivers/media/rc/imon.c

21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   927  
255940e642387f drivers/media/rc/imon.c Mauro Carvalho Chehab 2017-11-27   928  /*
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   929   * Writes data to the VFD.  The iMON VFD is 2x16 characters
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   930   * and requires data in 5 consecutive USB interrupt packets,
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   931   * each packet but the last carrying 7 bytes.
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   932   *
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   933   * I don't know if the VFD board supports features such as
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   934   * scrolling, clearing rows, blanking, etc. so at
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   935   * the caller must provide a full screen of data.  If fewer
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   936   * than 32 bytes are provided spaces will be appended to
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   937   * generate a full screen.
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   938   */
0eb3a7fa4f8bd3 drivers/media/rc/imon.c Jens Axboe            2024-04-09   939  static ssize_t vfd_write(struct kiocb *iocb, struct iov_iter *from)
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   940  {
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   941  	int i;
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   942  	int offset;
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   943  	int seq;
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   944  	int retval = 0;
0eb3a7fa4f8bd3 drivers/media/rc/imon.c Jens Axboe            2024-04-09   945  	struct imon_context *ictx = iocb->ki_filp->private_data;
c25895c7d6c957 drivers/media/rc/imon.c Colin Ian King        2017-09-05   946  	static const unsigned char vfd_packet6[] = {
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   947  		0x01, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF };
0eb3a7fa4f8bd3 drivers/media/rc/imon.c Jens Axboe            2024-04-09   948  	size_t n_bytes = iov_iter_count(from);
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   949  
db264d4c66c0fe drivers/media/rc/imon.c Tetsuo Handa          2022-05-02   950  	if (ictx->disconnected)
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   951  		return -ENODEV;
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   952  
813ceef062b53d drivers/media/rc/imon.c Gautam Menghani       2022-10-19   953  	if (mutex_lock_interruptible(&ictx->lock))
813ceef062b53d drivers/media/rc/imon.c Gautam Menghani       2022-10-19   954  		return -ERESTARTSYS;
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   955  
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   956  	if (!ictx->dev_present_intf0) {
47a09b082f7050 drivers/media/rc/imon.c Jarod Wilson          2011-07-14   957  		pr_err_ratelimited("no iMON device present\n");
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   958  		retval = -ENODEV;
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   959  		goto exit;
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   960  	}
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   961  
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   962  	if (n_bytes <= 0 || n_bytes > 32) {
47a09b082f7050 drivers/media/rc/imon.c Jarod Wilson          2011-07-14   963  		pr_err_ratelimited("invalid payload size\n");
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   964  		retval = -EINVAL;
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   965  		goto exit;
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   966  	}
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   967  
0eb3a7fa4f8bd3 drivers/media/rc/imon.c Jens Axboe            2024-04-09   968  	if (!copy_from_iter_full(ictx->tx.data_buf, n_bytes, from)) {
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   969  		retval = -EFAULT;
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   970  		goto exit;
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   971  	}
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   972  
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   973  	/* Pad with spaces */
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   974  	for (i = n_bytes; i < 32; ++i)
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16  @975  		ictx->tx.data_buf[i] = ' ';
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   976  
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   977  	for (i = 32; i < 35; ++i)
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   978  		ictx->tx.data_buf[i] = 0xFF;
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   979  
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   980  	offset = 0;
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   981  	seq = 0;
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   982  
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   983  	do {
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   984  		memcpy(ictx->usb_tx_buf, ictx->tx.data_buf + offset, 7);
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   985  		ictx->usb_tx_buf[7] = (unsigned char) seq;
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   986  
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   987  		retval = send_packet(ictx);
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   988  		if (retval) {
47a09b082f7050 drivers/media/rc/imon.c Jarod Wilson          2011-07-14   989  			pr_err_ratelimited("send packet #%d failed\n", seq / 2);
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   990  			goto exit;
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   991  		} else {
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   992  			seq += 2;
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   993  			offset += 7;
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   994  		}
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   995  
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   996  	} while (offset < 35);
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   997  
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   998  	/* Send packet #6 */
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16   999  	memcpy(ictx->usb_tx_buf, &vfd_packet6, sizeof(vfd_packet6));
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16  1000  	ictx->usb_tx_buf[7] = (unsigned char) seq;
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16  1001  	retval = send_packet(ictx);
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16  1002  	if (retval)
47a09b082f7050 drivers/media/rc/imon.c Jarod Wilson          2011-07-14  1003  		pr_err_ratelimited("send packet #%d failed\n", seq / 2);
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16  1004  
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16  1005  exit:
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16  1006  	mutex_unlock(&ictx->lock);
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16  1007  
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16  1008  	return (!retval) ? n_bytes : retval;
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16  1009  }
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson          2010-04-16  1010  

:::::: The code at line 975 was first introduced by commit
:::::: 21677cfc562a27e099719d413287bc8d1d24deb7 V4L/DVB: ir-core: add imon driver

:::::: TO: Jarod Wilson <jarod@redhat.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
