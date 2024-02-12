Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FB96FAD
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Feb 2024 06:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707718176; cv=none; b=T2tzuoK9nuvx0H/Egwr6PwDnW8YDUQiVHg6UbhaUZtEHE7NvcBk3SFxJpEy1yiYM8jnApkO+ujRpuyo7rvT1AICdZSvXp/gEHBMfyMQwZuzLInKItb4ifVBO2rDlnLSNs6eTPhUMndgh53cZUBNpRTYEQ8pSi3jULcJ4E8HSeuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707718176; c=relaxed/simple;
	bh=B2sWXXjXtq7nVQsl8QZOMmFmGY0fg/1cDyIkKZ4PCRk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=syR0wO9OJS0CzdteIWoMkByPJo4LjaAh8RLYSGv4gOGT/JcKXnhKlUKVgZgOmuLr+lSE6azQtqT6i+7hgSifvUBjVf6nyGXWffNVXzROayjVjxiY7FbTyqFL+lnjxLKsyw5EzRN/g1AOyIsc3MxK8Z8zkSG2VwWdIFpnySYTPwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DwEf7vJi; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DwEf7vJi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707718174; x=1739254174;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B2sWXXjXtq7nVQsl8QZOMmFmGY0fg/1cDyIkKZ4PCRk=;
  b=DwEf7vJiXVw7E1Tbs87GWCxB85IznGFTHHA6HA5PxMsDXt+40fTsxQH8
   APtQ/7u/taj0qL6AlvbuiDD0Um8RSL8/LYFro5ow7eLtMekZW/Cc1mCoC
   1WzyHCFbAJpzvCFc3cUtF2l5/0NJ/NcMJpz3KRDOErIEKz/3bip2W9iSN
   0DlRgLSXEuF+A0iRpd6HLqFFAxTyq0y9bMXjLzzMcQcyuN58GXxgr5fwu
   wEZE59fhrDf4REq96DYYACkhoEqI22qh/S5HPXu6cnORGiVSYvCkY6L/5
   852DeWFNyQ1szOUmPnCXhAYSajjepiYsAZNqpW2epfpVntBXKY/VxX/UG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="1536627"
X-IronPort-AV: E=Sophos;i="6.05,262,1701158400"; 
   d="scan'208";a="1536627"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2024 22:09:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,262,1701158400"; 
   d="scan'208";a="7164750"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 Feb 2024 22:09:32 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZPVR-0006xo-28;
	Mon, 12 Feb 2024 06:09:29 +0000
Date: Mon, 12 Feb 2024 14:08:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [tnguy-next-queue:dev-queue 39/50]
 drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:1725:17-18: WARNING
 opportunity for min()
Message-ID: <202402121428.DCRg07VQ-lkp@intel.com>
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
CC: Intel Wired LAN <intel-wired-lan@lists.osuosl.org>
TO: Alan Brady <alan.brady@intel.com>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>
CC: Przemek Kitszel <przemyslaw.kitszel@intel.com>
CC: Igor Bagnucki <igor.bagnucki@intel.com>
CC: Joshua Hay <joshua.a.hay@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
head:   7c9b8de2aec60f9217e04a6b13f325b81aec00bd
commit: 5575e30f70ae83f6fc6fcd060c729fae02c9db77 [39/50] idpf: refactor vport virtchnl messages
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: mips-randconfig-r064-20240212 (https://download.01.org/0day-ci/archive/20240212/202402121428.DCRg07VQ-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202402121428.DCRg07VQ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:1725:17-18: WARNING opportunity for min()
   drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:1773:17-18: WARNING opportunity for min()
   drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:1749:17-18: WARNING opportunity for min()

vim +1725 drivers/net/ethernet/intel/idpf/idpf_virtchnl.c

ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  1703  
0fe45467a1041e Pavan Kumar Linga 2023-08-07  1704  /**
0fe45467a1041e Pavan Kumar Linga 2023-08-07  1705   * idpf_send_destroy_vport_msg - Send virtchnl destroy vport message
0fe45467a1041e Pavan Kumar Linga 2023-08-07  1706   * @vport: virtual port data structure
0fe45467a1041e Pavan Kumar Linga 2023-08-07  1707   *
0fe45467a1041e Pavan Kumar Linga 2023-08-07  1708   * Send virtchnl destroy vport message.  Returns 0 on success, negative on
0fe45467a1041e Pavan Kumar Linga 2023-08-07  1709   * failure.
0fe45467a1041e Pavan Kumar Linga 2023-08-07  1710   */
0fe45467a1041e Pavan Kumar Linga 2023-08-07  1711  int idpf_send_destroy_vport_msg(struct idpf_vport *vport)
0fe45467a1041e Pavan Kumar Linga 2023-08-07  1712  {
5575e30f70ae83 Alan Brady        2024-02-05  1713  	struct idpf_vc_xn_params xn_params = {};
0fe45467a1041e Pavan Kumar Linga 2023-08-07  1714  	struct virtchnl2_vport v_id;
5575e30f70ae83 Alan Brady        2024-02-05  1715  	ssize_t reply_sz;
0fe45467a1041e Pavan Kumar Linga 2023-08-07  1716  
0fe45467a1041e Pavan Kumar Linga 2023-08-07  1717  	v_id.vport_id = cpu_to_le32(vport->vport_id);
0fe45467a1041e Pavan Kumar Linga 2023-08-07  1718  
5575e30f70ae83 Alan Brady        2024-02-05  1719  	xn_params.vc_op = VIRTCHNL2_OP_DESTROY_VPORT;
5575e30f70ae83 Alan Brady        2024-02-05  1720  	xn_params.send_buf.iov_base = &v_id;
5575e30f70ae83 Alan Brady        2024-02-05  1721  	xn_params.send_buf.iov_len = sizeof(v_id);
5575e30f70ae83 Alan Brady        2024-02-05  1722  	xn_params.timeout_ms = IDPF_VC_XN_MIN_TIMEOUT_MSEC;
5575e30f70ae83 Alan Brady        2024-02-05  1723  	reply_sz = idpf_vc_xn_exec(vport->adapter, xn_params);
0fe45467a1041e Pavan Kumar Linga 2023-08-07  1724  
5575e30f70ae83 Alan Brady        2024-02-05 @1725  	return reply_sz < 0 ? reply_sz : 0;
0fe45467a1041e Pavan Kumar Linga 2023-08-07  1726  }
0fe45467a1041e Pavan Kumar Linga 2023-08-07  1727  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
