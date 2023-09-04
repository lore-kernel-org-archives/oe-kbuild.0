Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBBE3D6A
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Sep 2023 00:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693785662; x=1725321662;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vD6lcJSSVex4ZjOwzvUXoggwIZV2luSBy7XjHVfmmUM=;
  b=lltVLo5xJoLTOl1enTIVt0PkvTI8WJ43FJm8Xsn8kslf35hVXpWk7ulx
   C2N1U8jmlXb+PilvJ+c6snOW/kRyOP6N501VpnmXTvrAOz2papeG/WxZ3
   Gum5vsJ/h6SMJvKKB2SmeltOP8zvRUDs3PNsT6QT/oAGxj69ouLe+T+nX
   wCOhDbBLZL2iym/7jKvRcpBMcbHPQSge9W+pwIhPR1dAqkw11UKpLRtMv
   HB6tW5WsV9bgbLnTcHJzB+QE+yG3OucxyGY9D8SX4XeWWmumjGWYZYfA4
   Z6j+tYUkfZBDI96XeKzCT+W2M4+Ym+/BZ5prM7TbDopAinWA49vai7wlA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="355986443"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="355986443"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2023 17:01:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="855410129"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="855410129"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 03 Sep 2023 17:00:59 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcx1V-0003W3-32;
	Mon, 04 Sep 2023 00:00:57 +0000
Date: Mon, 4 Sep 2023 08:00:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [intel-lts:6.1/linux 1/1]
 drivers/gpu/drm/i915/gt/iov/intel_iov_ggtt.c:146
 intel_iov_ggtt_vf_flush_ptes() error: uninitialized symbol 'err'.
Message-ID: <202309040728.ibOunJ8W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Piotr Piórkowski" <piotr.piorkowski@intel.com>
CC: Junxiao Chang <junxiao.chang@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 6.1/linux
head:   bcf6f14318c852a7319cf3ebeb0978432e314c0e
commit: bcf6f14318c852a7319cf3ebeb0978432e314c0e [1/1] drm/i915/gt/iov: Add MTL WA for update VF GGTT via VF2PF relay
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-161-20230903 (https://download.01.org/0day-ci/archive/20230904/202309040728.ibOunJ8W-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230904/202309040728.ibOunJ8W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309040728.ibOunJ8W-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/i915/gt/iov/intel_iov_ggtt.c:146 intel_iov_ggtt_vf_flush_ptes() error: uninitialized symbol 'err'.

vim +/err +146 drivers/gpu/drm/i915/gt/iov/intel_iov_ggtt.c

bcf6f14318c852 Piotr Piórkowski 2023-07-21  132  
bcf6f14318c852 Piotr Piórkowski 2023-07-21  133  int intel_iov_ggtt_vf_flush_ptes(struct intel_iov *iov)
bcf6f14318c852 Piotr Piórkowski 2023-07-21  134  {
bcf6f14318c852 Piotr Piórkowski 2023-07-21  135  	struct intel_iov_vf_ggtt_ptes *buffer = &iov->vf.ptes_buffer;
bcf6f14318c852 Piotr Piórkowski 2023-07-21  136  	int err;
bcf6f14318c852 Piotr Piórkowski 2023-07-21  137  
bcf6f14318c852 Piotr Piórkowski 2023-07-21  138  	GEM_BUG_ON(!intel_iov_is_vf(iov));
bcf6f14318c852 Piotr Piórkowski 2023-07-21  139  
bcf6f14318c852 Piotr Piórkowski 2023-07-21  140  	if (!buffer->count)
bcf6f14318c852 Piotr Piórkowski 2023-07-21  141  		return 0;
bcf6f14318c852 Piotr Piórkowski 2023-07-21  142  
bcf6f14318c852 Piotr Piórkowski 2023-07-21  143  	intel_iov_query_update_ggtt_ptes(iov);
bcf6f14318c852 Piotr Piórkowski 2023-07-21  144  	buffer->count = 0;
bcf6f14318c852 Piotr Piórkowski 2023-07-21  145  
bcf6f14318c852 Piotr Piórkowski 2023-07-21 @146  	return err;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
