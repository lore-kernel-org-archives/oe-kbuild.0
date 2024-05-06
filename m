Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8093715AD9C
	for <oe-kbuild@lists.linux.dev>; Mon,  6 May 2024 19:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715024521; cv=none; b=sCt0gemVaej/ccZSdLp17t65csjX/iXsr6A1dxDYetp9XdiRXdckD3/cpQDFQ1hzGmLl6Gbdo2SxMNPUSpxAhr8a51np9JdSf+YSPg6BTJHOADiC8UEa5SB43FpQim0rMH/3pwatolSZRnRpklY/2iRskDxLJNjCVK5ukWsR1Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715024521; c=relaxed/simple;
	bh=qQfpbnFs7KynRQMbJN9vOjhHnX3A8PoYTUjH6G/XAnY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N4gAEsvEpmHNVWELIQRisbpqOaSgFl1Lk0py+1bxofiS1BIpGB+leXkpz8X2aCyIE/r3ae6FgxwGhE4KpZYmAnem0kegWw8KOrhG2nrxGqhFpkBtLpONFhwquTDjQYKtqd3sd6qvJP2KH6M/EBptDiW0lyCs/jicvgJcB14SoJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XKmY5WpG; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XKmY5WpG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715024519; x=1746560519;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qQfpbnFs7KynRQMbJN9vOjhHnX3A8PoYTUjH6G/XAnY=;
  b=XKmY5WpGh5UAUDEgDIRpRsxevEAhfZEGYLTe33YW71CiMG/Zfil2eqWx
   MxlHYQbRwUhIMcQ9y5H31hiWM/bnkoKN6YJHoheJmcpbP6la3DqNTDDGE
   WW0qP4LKcSMTvlVGUNoZafT31Pr1oxV1ktDRWJT9CyBS74V2QdSkyTbkb
   cBqenhUYvWL4dx7jjzIas0oNpguWaiMZxSajnKtSrvscv+4N0cpinoEiP
   uy6ybRW/2pSAbCXdg86f/BnfCf9VGBH0XdUqSsPmL4TfZVliZshK/i+hl
   ohX04MpRv3As7afTW2+MzQalPnuis/0suTLB3r7Pi4/C1xJCz0NrdqevZ
   Q==;
X-CSE-ConnectionGUID: NpoLQaIVT+mk6eENpWyQPg==
X-CSE-MsgGUID: Sd1W780STK+jfh74Xhf1bQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="21464639"
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; 
   d="scan'208";a="21464639"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 12:41:56 -0700
X-CSE-ConnectionGUID: S5httfqITLGC1xgMKylzWQ==
X-CSE-MsgGUID: xJdtt5M9RiSb/NaaC/elWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; 
   d="scan'208";a="28148679"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 06 May 2024 12:41:56 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s44Dh-0000zV-0z;
	Mon, 06 May 2024 19:41:53 +0000
Date: Tue, 7 May 2024 03:41:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe-block:rw_iter 370/436] drivers/ntb/test/ntb_tool.c:931
 tool_peer_mw_trans_write() warn: potential spectre issue 'buf' [w]
Message-ID: <202405070322.f6YdlVym-lkp@intel.com>
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
commit: c4715d8e10867b89686048dfee09254b42eb1e6d [370/436] drivers/ntb: convert to read/write iterators
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: x86_64-randconfig-161-20240506 (https://download.01.org/0day-ci/archive/20240507/202405070322.f6YdlVym-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405070322.f6YdlVym-lkp@intel.com/

New smatch warnings:
drivers/ntb/test/ntb_tool.c:931 tool_peer_mw_trans_write() warn: potential spectre issue 'buf' [w]

Old smatch warnings:
drivers/ntb/test/ntb_tool.c:1263 tool_inmsg_read() error: uninitialized symbol 'pidx'.

vim +/buf +931 drivers/ntb/test/ntb_tool.c

717146a2a8cbf6 Logan Gunthorpe 2016-06-20  915  
c4715d8e10867b Jens Axboe      2024-04-06  916  static ssize_t tool_peer_mw_trans_write(struct kiocb *iocb,
c4715d8e10867b Jens Axboe      2024-04-06  917  					struct iov_iter *from)
717146a2a8cbf6 Logan Gunthorpe 2016-06-20  918  {
c4715d8e10867b Jens Axboe      2024-04-06  919  	struct tool_mw_wrap *outmw_wrap = iocb->ki_filp->private_data;
7f46c8b3a5523a Serge Semin     2017-12-06  920  	struct tool_mw *outmw = outmw_wrap->mw;
c4715d8e10867b Jens Axboe      2024-04-06  921  	size_t size = iov_iter_count(from);
7f46c8b3a5523a Serge Semin     2017-12-06  922  	size_t buf_size, wsize;
7f46c8b3a5523a Serge Semin     2017-12-06  923  	char buf[TOOL_BUF_LEN];
7f46c8b3a5523a Serge Semin     2017-12-06  924  	int ret, n;
7f46c8b3a5523a Serge Semin     2017-12-06  925  	u64 addr;
717146a2a8cbf6 Logan Gunthorpe 2016-06-20  926  
717146a2a8cbf6 Logan Gunthorpe 2016-06-20  927  	buf_size = min(size, (sizeof(buf) - 1));
c4715d8e10867b Jens Axboe      2024-04-06  928  	if (!copy_from_iter_full(buf, buf_size, from))
717146a2a8cbf6 Logan Gunthorpe 2016-06-20  929  		return -EFAULT;
717146a2a8cbf6 Logan Gunthorpe 2016-06-20  930  
717146a2a8cbf6 Logan Gunthorpe 2016-06-20 @931  	buf[buf_size] = '\0';
717146a2a8cbf6 Logan Gunthorpe 2016-06-20  932  
7f46c8b3a5523a Serge Semin     2017-12-06  933  	n = sscanf(buf, "%lli:%zi", &addr, &wsize);
7f46c8b3a5523a Serge Semin     2017-12-06  934  	if (n != 2)
7f46c8b3a5523a Serge Semin     2017-12-06  935  		return -EINVAL;
717146a2a8cbf6 Logan Gunthorpe 2016-06-20  936  
7f46c8b3a5523a Serge Semin     2017-12-06  937  	tool_free_peer_mw(outmw->tc, outmw->widx);
7f46c8b3a5523a Serge Semin     2017-12-06  938  	if (wsize) {
7f46c8b3a5523a Serge Semin     2017-12-06  939  		ret = tool_setup_peer_mw(outmw->tc, outmw_wrap->pidx,
7f46c8b3a5523a Serge Semin     2017-12-06  940  					 outmw->widx, addr, wsize);
7f46c8b3a5523a Serge Semin     2017-12-06  941  		if (ret)
7f46c8b3a5523a Serge Semin     2017-12-06  942  			return ret;
7f46c8b3a5523a Serge Semin     2017-12-06  943  	}
717146a2a8cbf6 Logan Gunthorpe 2016-06-20  944  
717146a2a8cbf6 Logan Gunthorpe 2016-06-20  945  	return size;
717146a2a8cbf6 Logan Gunthorpe 2016-06-20  946  }
717146a2a8cbf6 Logan Gunthorpe 2016-06-20  947  

:::::: The code at line 931 was first introduced by commit
:::::: 717146a2a8cbf6dbcb8fdf4ae7cddd2d6074161c ntb_tool: Postpone memory window initialization for the user

:::::: TO: Logan Gunthorpe <logang@deltatee.com>
:::::: CC: Jon Mason <jdmason@kudzu.us>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
