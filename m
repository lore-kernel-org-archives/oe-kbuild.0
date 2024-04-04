Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269D41CD2D
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Apr 2024 03:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712200107; cv=none; b=MHLX2f+VZNjCNYJdivn3jXps12zavmg1XJ/dPneXLJ7LzUixAzYhIVpILdKhXfg4M36tYsTAhzB3xbUseSHeLcZFPh9RMYke6m+X0fdH+2drd1wvgb0ojiEBnv06qEO7syjt+BlzgmaYXrXd1J2nWkWkEVwMHG9J8i/qOGEwgE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712200107; c=relaxed/simple;
	bh=6K9gR0S77plL7TPHF3ljpVcJ4atWI2xlan07HT6fmP0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QZ0uN6aSyVKC+XdB54smVQ8vuU0q5dR0j2DmVCes/bl+sEn3Q3/KB8yMOXegxkWkNN0laVoCFfbJQlZAPauw99aasGzR2WSVOLRZusUJF4oBNToEStLYS6nx7LZKrIb1CFP5LFBUhQbrR7sIelrpFA9mJg5VbHjhcGFncHlIx3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gSrpZ0H0; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gSrpZ0H0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712200105; x=1743736105;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6K9gR0S77plL7TPHF3ljpVcJ4atWI2xlan07HT6fmP0=;
  b=gSrpZ0H0SModueWed4ITl/awdFCC7zmrSfgoHM9qYAIIz4JT5WZeRf5r
   n8dOjKd2vuk3Zpn5p79ZRRzWXC8tx0dDkrkX/Tr3XTYfLjYIikpozcS9B
   LTpFOG8S2UAsMrubRMKLogK3vHpvhl7NI9tgNPwZMTEoKZXZPwGidBSEt
   QRX+lmobS63fPCItEFXyhkP3uzylPof0+4nBDnfw7/4TMtjeVUAyxJeJI
   3bMN1R9FdPNe6usUx1ExzFfCY1N9coyXgbZJ6zLo5J/RG1RI6aXrZuhq3
   48CWohScpr+Ow40HMU5eedBza1bswBRPMCVvWuiAi1JvrSo2FdStXdD8T
   w==;
X-CSE-ConnectionGUID: lQXFgyo3R5+H/wQ4Lem9AQ==
X-CSE-MsgGUID: wAMuqERLSSKDyg1ZWUT+OQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="10432579"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="10432579"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 20:08:24 -0700
X-CSE-ConnectionGUID: Tp3U+dAbTSyO1eMPbxuuag==
X-CSE-MsgGUID: DlniG7kOSWmdif1UGa6djQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="18577916"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 Apr 2024 20:08:23 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsDSf-0000Xa-15;
	Thu, 04 Apr 2024 03:08:21 +0000
Date: Thu, 4 Apr 2024 11:07:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [vivek-drm-tip:virtgpu_import_rfc 9/9]
 drivers/dma-buf/udmabuf.c:147:12-13: WARNING opportunity for min()
Message-ID: <202404041042.IN1DTfIl-lkp@intel.com>
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
TO: Vivek Kasireddy <vivek.kasireddy@intel.com>

tree:   https://gitlab.freedesktop.org/Vivek/drm-tip.git virtgpu_import_rfc
head:   2347bf8ba6d850818b830aa54bb75d4b892fb6a8
commit: 2347bf8ba6d850818b830aa54bb75d4b892fb6a8 [9/9] udmabuf: Implement UDMABUF_CREATE_LIST_FOR_PCIDEV ioctl
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-101-20240404 (https://download.01.org/0day-ci/archive/20240404/202404041042.IN1DTfIl-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202404041042.IN1DTfIl-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/dma-buf/udmabuf.c:147:12-13: WARNING opportunity for min()

vim +147 drivers/dma-buf/udmabuf.c

fbb0de795078190 Gerd Hoffmann   2018-08-27  133  
2347bf8ba6d8508 Vivek Kasireddy 2024-03-26  134  static int check_p2p_support(struct dma_buf_attachment *attach)
2347bf8ba6d8508 Vivek Kasireddy 2024-03-26  135  {
2347bf8ba6d8508 Vivek Kasireddy 2024-03-26  136  	struct udmabuf *ubuf = attach->dmabuf->priv;
2347bf8ba6d8508 Vivek Kasireddy 2024-03-26  137  	struct pci_dev *provider = ubuf->pdev;
2347bf8ba6d8508 Vivek Kasireddy 2024-03-26  138  	struct device *client = attach->dev;
2347bf8ba6d8508 Vivek Kasireddy 2024-03-26  139  	int ret = -1;
2347bf8ba6d8508 Vivek Kasireddy 2024-03-26  140  
2347bf8ba6d8508 Vivek Kasireddy 2024-03-26  141  	if (!provider)
2347bf8ba6d8508 Vivek Kasireddy 2024-03-26  142  		return 0;
2347bf8ba6d8508 Vivek Kasireddy 2024-03-26  143  
2347bf8ba6d8508 Vivek Kasireddy 2024-03-26  144  	if (attach->peer2peer)
2347bf8ba6d8508 Vivek Kasireddy 2024-03-26  145  		ret = pci_p2pdma_distance(provider, client, true);
2347bf8ba6d8508 Vivek Kasireddy 2024-03-26  146  
2347bf8ba6d8508 Vivek Kasireddy 2024-03-26 @147  	return ret < 0 ? ret : 0;
2347bf8ba6d8508 Vivek Kasireddy 2024-03-26  148  }
2347bf8ba6d8508 Vivek Kasireddy 2024-03-26  149  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
