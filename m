Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B719227732
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Mar 2026 03:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773374217; cv=none; b=PSHufrtHoY2NMBo3hGb+mGUEqQyI8KaS4s4sVkwmmlqq2ucU3iu9xufaYpPR2/fXljFeBYVRChHyXkM98k6tHPundR3fZEMn1hO3qVH1lGmWFqbZNkIDjg/CoGMyKsxURlFEQINWXAtdN95+iSSlbIPQ08RV35wgdT5bZNyHUJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773374217; c=relaxed/simple;
	bh=bmvdOsbvsA5sMP8kD9nBz2BI5NF7VRJlGfPMeduT1Ac=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CuuV4Z1WhcH84aeXukf5KfCg3UHBuaAQERnvMkDPQup1zLm9Da2gUdh1QHPOByqNpW3Es6EbiCDMoygjZyw3MjgML5Z3NOihDV1oLNeruYF3g1V15LLrPnfWpAXh5ovdjIOz1Bpj9flfBuY6TuX151HeAhiuSkC+emyzOtZerS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S92iR5Jn; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S92iR5Jn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773374214; x=1804910214;
  h=date:from:to:cc:subject:message-id;
  bh=bmvdOsbvsA5sMP8kD9nBz2BI5NF7VRJlGfPMeduT1Ac=;
  b=S92iR5JnEo0dPOoJabc+oTupuY0aNOdIOUvK/vE4SVku1U/qzEqjZmBy
   FRXlvlrAaoQgo9B1JeVYRDfXsQXU76Tx3L6n6+wkS3VRH31lMoou9+GjH
   wYcaTj92jdHukvtIeJf4TBzffvu5leQbcJUBkVnFMreAPXx5Atpr6uKpA
   MPf+2j7rnNw6pvHCimib2CA+odgzdRwu+h/rT5QS/Z/+OM081FcFWyX37
   Q+zEUD3a/wjrYy8eL/V59IrPdH6SvFoAoVf/DLUcs1yZvxz5c4WWfHevD
   DnCkcgTG5hRfs+ka91sVfk1nOiAaabQUXNFRV8iTBDHS/8J5Csc5e6uDN
   A==;
X-CSE-ConnectionGUID: hf+ut59nT1aJxl2iWXSyBg==
X-CSE-MsgGUID: DitbJ27zSsmExTcSWj5naQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74560392"
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="74560392"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 20:56:54 -0700
X-CSE-ConnectionGUID: aV12DFnJRwG5cmSkKyN24A==
X-CSE-MsgGUID: pjZOuIdEQuG8eZ+PewpS3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="218793834"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Mar 2026 20:56:53 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0tdm-000000003Pv-2nY9;
	Fri, 13 Mar 2026 03:56:46 +0000
Date: Fri, 13 Mar 2026 11:56:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe:rw_iter 357/471] drivers/ntb/test/ntb_tool.c:931
 tool_peer_mw_trans_write() warn: potential spectre issue 'buf' [w]
Message-ID: <202603131108.MwjRtK17-lkp@intel.com>
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
commit: d444a597dc0bb08539298adb2b3f9b69fbf4d3e2 [357/471] drivers/ntb: convert to read/write iterators
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: openrisc-randconfig-r071-20260307 (https://download.01.org/0day-ci/archive/20260313/202603131108.MwjRtK17-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603131108.MwjRtK17-lkp@intel.com/

smatch warnings:
drivers/ntb/test/ntb_tool.c:931 tool_peer_mw_trans_write() warn: potential spectre issue 'buf' [w]

vim +/buf +931 drivers/ntb/test/ntb_tool.c

717146a2a8cbf6 Logan Gunthorpe 2016-06-20  915  
d444a597dc0bb0 Jens Axboe      2024-04-06  916  static ssize_t tool_peer_mw_trans_write(struct kiocb *iocb,
d444a597dc0bb0 Jens Axboe      2024-04-06  917  					struct iov_iter *from)
717146a2a8cbf6 Logan Gunthorpe 2016-06-20  918  {
d444a597dc0bb0 Jens Axboe      2024-04-06  919  	struct tool_mw_wrap *outmw_wrap = iocb->ki_filp->private_data;
7f46c8b3a5523a Serge Semin     2017-12-06  920  	struct tool_mw *outmw = outmw_wrap->mw;
d444a597dc0bb0 Jens Axboe      2024-04-06  921  	size_t size = iov_iter_count(from);
7f46c8b3a5523a Serge Semin     2017-12-06  922  	size_t buf_size, wsize;
7f46c8b3a5523a Serge Semin     2017-12-06  923  	char buf[TOOL_BUF_LEN];
7f46c8b3a5523a Serge Semin     2017-12-06  924  	int ret, n;
7f46c8b3a5523a Serge Semin     2017-12-06  925  	u64 addr;
717146a2a8cbf6 Logan Gunthorpe 2016-06-20  926  
717146a2a8cbf6 Logan Gunthorpe 2016-06-20  927  	buf_size = min(size, (sizeof(buf) - 1));
d444a597dc0bb0 Jens Axboe      2024-04-06  928  	if (!copy_from_iter_full(buf, buf_size, from))
717146a2a8cbf6 Logan Gunthorpe 2016-06-20  929  		return -EFAULT;
717146a2a8cbf6 Logan Gunthorpe 2016-06-20  930  
717146a2a8cbf6 Logan Gunthorpe 2016-06-20 @931  	buf[buf_size] = '\0';
717146a2a8cbf6 Logan Gunthorpe 2016-06-20  932  
21fbdc4d0b1e7f yangqixiao      2025-12-30  933  	n = sscanf(buf, "%llu:%zu", &addr, &wsize);
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
