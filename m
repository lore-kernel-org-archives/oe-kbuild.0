Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3F0221DAE
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Dec 2025 15:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765811767; cv=none; b=OeXxze1Zeg3qek963Ur7OOigzpScA4zwt2H0S2+X8qrVZ2UtTow2jtU50pxNGhv4PAa4iTEllWksPx1dRrV0uRliAA7Jp2ks+ae2QiUbrrdpNtrxvj+R/iKlKC6dxwzESLIzQqyB8EaJJ1IdUpJj4ftgdKOPiR6DJzcLUa/9SYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765811767; c=relaxed/simple;
	bh=zTqG5nyZavoG5jwQPuoY825v5mhg/gJyesnH6sg1Q3Q=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XURVy0pYBF6j691rLIdZ+b/Nj+W5paQur7p2OMo+ELGz4qHbK4iYPydvbs9LTYZqQYg3ChQMhXZnFbcxp3iZR/+FledsGAOGma3uci35JCxcA1W8oqIGkDRnzyukZSlnG80CjHwzp1xfygJ/p2TZY40iBbFn0plPmvIJDlyJcRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hoxnqgnD; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hoxnqgnD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765811762; x=1797347762;
  h=date:from:to:subject:message-id:mime-version;
  bh=zTqG5nyZavoG5jwQPuoY825v5mhg/gJyesnH6sg1Q3Q=;
  b=hoxnqgnDT2g1R8L87/NxPrUOyf59+7s21eoVk/uQ4P4m43s24JT4B/Xc
   ClcX3mAClMJ9oqngi02DjmmbeqOB31QGmWzdpkHdncGXVMBhgXk62hgtz
   XJ0vuGIJHpJmAwud8tGwLm+Kzp+Kt77Gw/lBCicEGZ8cp/uUtUgkS3e1p
   ojETuUqEBFSMqmpmK7D2TZqIBDlDwavMTK9dENCPVOC62zxuu8x0VuJ9N
   iBK/ud7lgJSeYdTnec+SNz/6p7hapMqlP0x3YwU+qWYuZP/BPd2Bfd4mp
   BJbzxdYO3yugk3TfjFHD79B9sSeWVC1+Ie+TA4Ftdfy35VzPk7fYBBIFN
   Q==;
X-CSE-ConnectionGUID: Gp1QzvLGSOq55G+csmNrWw==
X-CSE-MsgGUID: nP3/wBOMR+GxYUNgXXfMlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="78025176"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="78025176"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 07:16:00 -0800
X-CSE-ConnectionGUID: 6sCEUskTRHWht+97fxiRMw==
X-CSE-MsgGUID: caAnqUHPQDCAM2W+gEgErQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="235138950"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 15 Dec 2025 07:16:00 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVAIn-000000002hQ-0ODu
	for oe-kbuild@lists.linux.dev;
	Mon, 15 Dec 2025 15:15:57 +0000
Date: Mon, 15 Dec 2025 16:14:58 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [leon-rdma:dmabuf-vfio-v10 2/3] checkpatch: WARNING:MINMAX: min()
 should probably be min_t(u64, SZ_4K, bar->info.size)
Message-ID: <202512151632.bDiWt4Vz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Leon Romanovsky <leonro@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dmabuf-vfio-v10
head:   f450671884de47b594f47ec6678edf47e8da57ff
commit: be9bf37d77ea9c2d9dad71982e2ce121074da2cd [2/3] vfio: selftests: Add DMABUF test
:::::: branch date: 31 minutes ago
:::::: commit date: 31 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20251215/202512151632.bDiWt4Vz-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:MINMAX: min() should probably be min_t(u64, SZ_4K, bar->info.size)
#210: FILE: tools/testing/selftests/vfio/vfio_dma_buf_test.c:178:
+	range.length = min((u64)SZ_4K, bar->info.size);

WARNING:MINMAX: min() should probably be min_t(u64, SZ_4K, bar->info.size)
#475: FILE: tools/testing/selftests/vfio/vfio_dma_buf_test.c:443:
+	range.length = min((u64)SZ_4K, bar->info.size);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
