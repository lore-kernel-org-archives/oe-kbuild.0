Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A5036C5BB
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Mar 2026 03:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773198358; cv=none; b=UNSfdOELlwo8uCkNPcIh4TyaG2oRIz8N+RG65vRhDJU2FzwD1WwyV09lSq+tmP0q1TLpsD/yFEn+CQUuehnQ8G8ECuHpnd8poVysnt0IyPoMaakmN1GznRccsBAnFPq15cQgsHwGXU+ma3hFsXjiRbvvUz/bWkPI4XJPrrcKl8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773198358; c=relaxed/simple;
	bh=1MNlA/sPXBVhKBvXC9I2L/mhFMobTOVarkS5CvDQJG4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=TpLu9lYwlR9VSwvR1y+cfWQao86fxlzodKsZmQl19OEIPcpiiAQa8GHRsR5/EvEyASdNFL3pAtVuRCkje/GvFgmM9DlnYIfy1srJwTZ384MhZES7NFLYZN7TgGfkf1f6Omm+IfV0d3nErVUQvrPDVILKIUo4j+IpUJ8Ump1jIwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n0Dex5g9; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n0Dex5g9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773198357; x=1804734357;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1MNlA/sPXBVhKBvXC9I2L/mhFMobTOVarkS5CvDQJG4=;
  b=n0Dex5g9zkklc8BT/ljneHmS6lFpKV/u1q03IyBRY6RjpyRUtK5NZD6X
   p5g7yJF/IYTdQSncZhJlgQKLaMV7muRwb3S6fju8FTwDhaPy6gaG4LwwI
   YWdzl+4bams0aG8eU4dsdpKGa7xGp/xf9kC9Qq+kU0typiNVN/Te4RdAr
   gAHrTs/QbkdF7DM9pS6I4+TLrMlxSMllIjcyMvcxZ3JC4dyeg0XsqA9Mn
   CrDu9BEnuOS2Ql3Tl+MwwZcoGg0YxsRM1uv1YMnIU+sRoMtu0gxda9DFI
   3lzDqmq+4j+a8aUDwoHvhJk2cDJM+zlXxnMyVWNoJkqvOJxS5IlXdckQe
   A==;
X-CSE-ConnectionGUID: 0wA9cpUBSK+ex7GWf9nOBw==
X-CSE-MsgGUID: iKo19nBjTG2U29EBqJy9uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74447315"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="74447315"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 20:05:56 -0700
X-CSE-ConnectionGUID: O5rwOcSJS2ytbbWNN7lhfw==
X-CSE-MsgGUID: rWOi53q7TzqjFNKcb8/BeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="216621212"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Mar 2026 20:05:54 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w09tQ-000000000dC-0Swx;
	Wed, 11 Mar 2026 03:05:52 +0000
Date: Wed, 11 Mar 2026 11:05:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/dma-buf/dma-buf.c:841 dma_buf_get() warn: fd re-used
 after fget(): 'fd'
Message-ID: <202603111013.X9ii6rjb-lkp@intel.com>
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
head:   b4f0dd314b39ea154f62f3bd3115ed0470f9f71e
commit: 281a226314238e8adb08d11b765347687ffb38b9 dma-buf: add some tracepoi=
nts to debug.
date:   3 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-r071-20260310 (https://download.01.org/0day-ci/ar=
chive/20260311/202603111013.X9ii6rjb-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603111013.X9ii6rjb-lkp@intel.com/

smatch warnings:
drivers/dma-buf/dma-buf.c:841 dma_buf_get() warn: fd re-used after fget(): =
'fd'

vim +/fd +841 drivers/dma-buf/dma-buf.c

d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal   2011-12-26  815 =
=20
d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal   2011-12-26  816  /=
**
85804b70cca68d7 drivers/dma-buf/dma-buf.c Simona Vetter  2020-12-11  817   =
* dma_buf_get - returns the struct dma_buf related to an fd
85804b70cca68d7 drivers/dma-buf/dma-buf.c Simona Vetter  2020-12-11  818   =
* @fd:	[in]	fd associated with the struct dma_buf to be returned
d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal   2011-12-26  819   *
85804b70cca68d7 drivers/dma-buf/dma-buf.c Simona Vetter  2020-12-11  820   =
* On success, returns the struct dma_buf associated with an fd; uses
d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal   2011-12-26  821   =
* file's refcounting done by fget to increase refcount. returns ERR_PTR
d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal   2011-12-26  822   =
* otherwise.
d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal   2011-12-26  823   =
*/
d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal   2011-12-26  824  s=
truct dma_buf *dma_buf_get(int fd)
d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal   2011-12-26  825  {
d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal   2011-12-26  826  	=
struct file *file;
281a226314238e8 drivers/dma-buf/dma-buf.c gaoxiang17     2025-12-18  827  	=
struct dma_buf *dmabuf;
d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal   2011-12-26  828 =
=20
d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal   2011-12-26  829  	=
file =3D fget(fd);
d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal   2011-12-26  830 =
=20
d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal   2011-12-26  831  	=
if (!file)
d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal   2011-12-26  832  	=
	return ERR_PTR(-EBADF);
d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal   2011-12-26  833 =
=20
d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal   2011-12-26  834  	=
if (!is_dma_buf_file(file)) {
d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal   2011-12-26  835  	=
	fput(file);
d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal   2011-12-26  836  	=
	return ERR_PTR(-EINVAL);
d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal   2011-12-26  837  	}
d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal   2011-12-26  838 =
=20
281a226314238e8 drivers/dma-buf/dma-buf.c gaoxiang17     2025-12-18  839  	=
dmabuf =3D file->private_data;
281a226314238e8 drivers/dma-buf/dma-buf.c gaoxiang17     2025-12-18  840 =
=20
281a226314238e8 drivers/dma-buf/dma-buf.c gaoxiang17     2025-12-18 @841  	=
DMA_BUF_TRACE(trace_dma_buf_get, dmabuf, fd);
281a226314238e8 drivers/dma-buf/dma-buf.c gaoxiang17     2025-12-18  842 =
=20
281a226314238e8 drivers/dma-buf/dma-buf.c gaoxiang17     2025-12-18  843  	=
return dmabuf;
d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal   2011-12-26  844  }
cdd30ebb1b9f361 drivers/dma-buf/dma-buf.c Peter Zijlstra 2024-12-02  845  E=
XPORT_SYMBOL_NS_GPL(dma_buf_get, "DMA_BUF");
d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal   2011-12-26  846 =
=20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
