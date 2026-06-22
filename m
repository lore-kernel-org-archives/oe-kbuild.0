Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F5C3B14B2
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Jun 2026 14:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782137771; cv=none; b=pXo4e7uUwrOjYrVB40UWVxQr+uk2TzFplawqTL6pbMUJWzv7CuPdGYPtUjG7B8mQxbIAnVNxX2NyBLQj2AoWA75jD3TVC+xmH0VfeNBC/p0+R5djQtDNdw44OP8O34bapNn7Q5h2qbFmarJIXeCgOnxsGgVRwaJSYS9NAbsrQ4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782137771; c=relaxed/simple;
	bh=HzBnNRK94roPvVtd0Jc0l01cvxuS26zC6Yzmn5XBxNg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pLBeZVZxckQm0bgrDu0is+aGeSxHjbAJr91jxIOgSjZWS6MA8hqmi1lcjguK6RF1D5grUBiFwFaM6puhRqNghB9wE4tl8UrsC7trgpdAcf/NMUadLvWeAEh8sn3qRcVXVVxPqqrJcR3aHN/vN09oRkeUB8XW/GOyvWFQ9Y9Nubs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bG2G6Y+8; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bG2G6Y+8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782137769; x=1813673769;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=HzBnNRK94roPvVtd0Jc0l01cvxuS26zC6Yzmn5XBxNg=;
  b=bG2G6Y+8QOhjVQExPcePKM3K8Po7RiE3TvJei9414VYTumAScfMDp4Rc
   loIOtppHb104z+2XheTpiENvJU9EIWtFEPu7vYIxvgRjjIgoioJqywhx8
   rCyuA0rRPefh9scE6ah8UFLkShTxEDDLkj09Q/LSJ8q1DvsuQDVAHpkVc
   W8q/cWQ/GwCEirCkIxHeh6lr2W321k3JDwj3xm/azks1HSsSvrgkfqDPE
   q9OB5gjnyMTvXtk7Z9SEUzSGndoH+VooXV2H57Wd/0MQnLI2crh+zSYeb
   DGVUtjZxcmAtxKsjy0Xtxz1z5ni+7tD0XaVPQderT9TCY9BwllNujdP6m
   Q==;
X-CSE-ConnectionGUID: wSOewbXqSYyPxp2Ft1GpNQ==
X-CSE-MsgGUID: VH84UimSQIiSJ1b6Ri2N8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="93233298"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="93233298"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 07:16:08 -0700
X-CSE-ConnectionGUID: BZ1eSNf0S2qLwej8Y3yFrA==
X-CSE-MsgGUID: O0q06RiRQOOihWsiYEZwaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="245091856"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 22 Jun 2026 07:16:07 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbfRV-000000001JC-0C6t;
	Mon, 22 Jun 2026 14:16:05 +0000
Date: Mon, 22 Jun 2026 22:15:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/dma-buf/dma-buf.c:841 dma_buf_get() warn: fd re-used
 after fget(): 'fd'
Message-ID: <202606222220.qGAdJwI9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: gaoxiang17 <gaoxiang17@xiaomi.com>
CC: "Christian K=C3=B6nig" <christian.koenig@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ef0c9f75a19532d7675384708fc8621e10850104
commit: 281a226314238e8adb08d11b765347687ffb38b9 dma-buf: add some tracepoi=
nts to debug.
date:   6 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 6 months ago
config: um-randconfig-r072-20260622 (https://download.01.org/0day-ci/archiv=
e/20260622/202606222220.qGAdJwI9-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 281a22631423 ("dma-buf: add some tracepoints to debug.")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606222220.qGAdJwI9-lkp@intel.com/

smatch warnings:
drivers/dma-buf/dma-buf.c:841 dma_buf_get() warn: fd re-used after fget(): =
'fd'

vim +/fd +841 drivers/dma-buf/dma-buf.c

d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal   2011-12-26  815 =20
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal   2011-12-26  816  /**
85804b70cca68d drivers/dma-buf/dma-buf.c Simona Vetter  2020-12-11  817   *=
 dma_buf_get - returns the struct dma_buf related to an fd
85804b70cca68d drivers/dma-buf/dma-buf.c Simona Vetter  2020-12-11  818   *=
 @fd:	[in]	fd associated with the struct dma_buf to be returned
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal   2011-12-26  819   *
85804b70cca68d drivers/dma-buf/dma-buf.c Simona Vetter  2020-12-11  820   *=
 On success, returns the struct dma_buf associated with an fd; uses
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal   2011-12-26  821   *=
 file's refcounting done by fget to increase refcount. returns ERR_PTR
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal   2011-12-26  822   *=
 otherwise.
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal   2011-12-26  823   */
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal   2011-12-26  824  st=
ruct dma_buf *dma_buf_get(int fd)
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal   2011-12-26  825  {
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal   2011-12-26  826  	s=
truct file *file;
281a226314238e drivers/dma-buf/dma-buf.c gaoxiang17     2025-12-18  827  	s=
truct dma_buf *dmabuf;
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal   2011-12-26  828 =20
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal   2011-12-26  829  	f=
ile =3D fget(fd);
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal   2011-12-26  830 =20
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal   2011-12-26  831  	i=
f (!file)
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal   2011-12-26  832  		=
return ERR_PTR(-EBADF);
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal   2011-12-26  833 =20
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal   2011-12-26  834  	i=
f (!is_dma_buf_file(file)) {
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal   2011-12-26  835  		=
fput(file);
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal   2011-12-26  836  		=
return ERR_PTR(-EINVAL);
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal   2011-12-26  837  	}
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal   2011-12-26  838 =20
281a226314238e drivers/dma-buf/dma-buf.c gaoxiang17     2025-12-18  839  	d=
mabuf =3D file->private_data;
281a226314238e drivers/dma-buf/dma-buf.c gaoxiang17     2025-12-18  840 =20
281a226314238e drivers/dma-buf/dma-buf.c gaoxiang17     2025-12-18 @841  	D=
MA_BUF_TRACE(trace_dma_buf_get, dmabuf, fd);
281a226314238e drivers/dma-buf/dma-buf.c gaoxiang17     2025-12-18  842 =20
281a226314238e drivers/dma-buf/dma-buf.c gaoxiang17     2025-12-18  843  	r=
eturn dmabuf;
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal   2011-12-26  844  }
cdd30ebb1b9f36 drivers/dma-buf/dma-buf.c Peter Zijlstra 2024-12-02  845  EX=
PORT_SYMBOL_NS_GPL(dma_buf_get, "DMA_BUF");
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal   2011-12-26  846 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
