Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E42570838
	for <oe-kbuild@lists.linux.dev>; Sat,  5 Apr 2025 17:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743875386; cv=none; b=hN6UY+FkaAWBTDcMRyK03t+Acra9pfvB3cRBRZQWj4b/DMesGcZ6a4KqDDHagLGIrzDoZTVPllPLMc9EKdUT7kZ5dDBm+e4kaKCCU2NR6DZq8u/jLYRbETW4DXwh1aR7aTVgKmRlSiBVgiUpE5D4Qe1OTca661bvE3d+MVCzhmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743875386; c=relaxed/simple;
	bh=h5o2JgPeDWttU3mMtwQq2DQMuVXmgrFWlR07QXCJqbs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iBA6XISOwnCSvsFpN+67k9AsEbrfwIR4E91zLygw9uWwy1NaRZW3qdvQSbfTDtIHGN7qj1l+eA4KecaKSN0app7d2N6dx2sEShQ9YpkcsoWVSvThaFcX9SNVsKH5Wf5vYmhM0ZtQt6erdoDoJ1Mx6GKjuZ4zoif8M1ZDXguTEGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mM2JIdUc; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mM2JIdUc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743875385; x=1775411385;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h5o2JgPeDWttU3mMtwQq2DQMuVXmgrFWlR07QXCJqbs=;
  b=mM2JIdUcVEWYd47T46c6B7ivDHaBxYspTB4l9GWLyd13ZDn1uf7qZ+L9
   VIt9rhwfVmfGIhjfST46c7t8y0YtnJqdhMoajjj1bTKLLFLY1+jpkHf5U
   u0twcyYXG6UTULZkBBLI8TxmeWIPFnufeRYcNbpHCvNGk6luYC6Ci/JlB
   0CCcpGgFLbZXSODDjxMBv63ekXYpUW25g0jJ5k1vVoAHzca5XJSUFr4LI
   dRmwRBbt34wE23Fu6mHb1ZsHhTB+JgkXwm1u9aGN4n8LgyYFdlSsBDwyM
   BcZ+ZNraiheemp2Gu6tdL4iebHwEEO9HtRTznP/ogCPibeqxSblzYyit5
   A==;
X-CSE-ConnectionGUID: WT/FBGWgQcqUHnxKmJk0zw==
X-CSE-MsgGUID: qea39K/yTaqGM7T3OFitJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11395"; a="45473058"
X-IronPort-AV: E=Sophos;i="6.15,191,1739865600"; 
   d="scan'208";a="45473058"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2025 10:49:44 -0700
X-CSE-ConnectionGUID: skgkshBaTMi968QFO0lTig==
X-CSE-MsgGUID: DgNEeV2EQW+5gka/VwmOQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,191,1739865600"; 
   d="scan'208";a="128066127"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 05 Apr 2025 10:49:43 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u17eH-0002Bn-0x;
	Sat, 05 Apr 2025 17:49:41 +0000
Date: Sun, 6 Apr 2025 01:48:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android16-6.12 18/18] drivers/dma-buf/dma-buf.c:56
 get_dmabuf_debugfs_data() error: uninitialized symbol 'ret'.
Message-ID: <202504060101.IHzYlc7K-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   2419132b8c991ece73c5a50f6f5c3eacab6077ef
commit: 4e54be02ffdb8819ccb4390b922690c1a9e55ce2 [18/18] ANDROID: dma-buf: Export API to iterate through dmabuf debugfs info
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: x86_64-randconfig-161-20250405 (https://download.01.org/0day-ci/archive/20250406/202504060101.IHzYlc7K-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202504060101.IHzYlc7K-lkp@intel.com/

smatch warnings:
drivers/dma-buf/dma-buf.c:56 get_dmabuf_debugfs_data() error: uninitialized symbol 'ret'.

vim +/ret +56 drivers/dma-buf/dma-buf.c

dbaf8b29f24687 Vijayanand Jitta   2021-02-25  39  
4e54be02ffdb88 Oreoluwa Babatunde 2025-04-02  40  int get_dmabuf_debugfs_data(int (*fn)(const struct dma_buf *, void *),
4e54be02ffdb88 Oreoluwa Babatunde 2025-04-02  41  			void *private)
4e54be02ffdb88 Oreoluwa Babatunde 2025-04-02  42  {
4e54be02ffdb88 Oreoluwa Babatunde 2025-04-02  43  	int ret;
4e54be02ffdb88 Oreoluwa Babatunde 2025-04-02  44  	struct dma_buf *dmabuf;
4e54be02ffdb88 Oreoluwa Babatunde 2025-04-02  45  
4e54be02ffdb88 Oreoluwa Babatunde 2025-04-02  46  	mutex_lock(&debugfs_list_mutex);
4e54be02ffdb88 Oreoluwa Babatunde 2025-04-02  47  
4e54be02ffdb88 Oreoluwa Babatunde 2025-04-02  48  	list_for_each_entry(dmabuf, &debugfs_list, list_node) {
4e54be02ffdb88 Oreoluwa Babatunde 2025-04-02  49  		ret = fn(dmabuf, private);
4e54be02ffdb88 Oreoluwa Babatunde 2025-04-02  50  		if (ret)
4e54be02ffdb88 Oreoluwa Babatunde 2025-04-02  51  			break;
4e54be02ffdb88 Oreoluwa Babatunde 2025-04-02  52  	}
4e54be02ffdb88 Oreoluwa Babatunde 2025-04-02  53  
4e54be02ffdb88 Oreoluwa Babatunde 2025-04-02  54  	mutex_unlock(&debugfs_list_mutex);
4e54be02ffdb88 Oreoluwa Babatunde 2025-04-02  55  
4e54be02ffdb88 Oreoluwa Babatunde 2025-04-02 @56  	return ret;
4e54be02ffdb88 Oreoluwa Babatunde 2025-04-02  57  }
4e54be02ffdb88 Oreoluwa Babatunde 2025-04-02  58  EXPORT_SYMBOL_NS_GPL(get_dmabuf_debugfs_data, DMA_BUF);
bfc7bc539392f6 Tvrtko Ursulin     2024-03-28  59  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
