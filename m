Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B751474CC
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Apr 2026 23:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776469396; cv=none; b=CBzth9b17WlTDxyjVVhhCOQVV1ygs+fHnKst/tBxZ3gC+43dqp9KJ3i+pGiCjvChzDFxhbJK5+MFWgMmid/ZKUIJguWJ+uQKW8dgLgmV04CzgXUm+gG0qJSvNs76dPXfAZVysAPbjgJvm4Obu503n2uBsoeEmRir8fU5frj3Xyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776469396; c=relaxed/simple;
	bh=I7PcAgbkvkkWoswj6W0sTyodzcb7f7qST97REB/NDaw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nuXEoMI9F06EJyGRXx7tkJnMBj50muoIandDHllCTBVXKs9cMhntCKo7w185pXZAFrVKcJvV1sYuTI4MCPaj0A+gGnJnHE6yWNu16n5IZU/brgkGm1uKQlucTKlEDGKOt6dlIQv5etl8hz7SLcEtY4OJhCXEplUy/JpGyZ1hXx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cHjJbxvE; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cHjJbxvE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776469394; x=1808005394;
  h=date:from:to:cc:subject:message-id;
  bh=I7PcAgbkvkkWoswj6W0sTyodzcb7f7qST97REB/NDaw=;
  b=cHjJbxvE/osU7cOatedFfT+jK3X/lACCYPE42k6gCARAmczWMRFK2+te
   YeQRm2gT/tSfjbF413twwt7NBXByROXoLsdTOh89roo6HZZ1RBxzICDeg
   /gwV/wm3zKjO0l1FNJpCv8ZmIaDy6qpbQgSU+rkdQETmjRpdAH2bGEqnj
   /E+OPsxdCDMp6xgImdE32rjpIejyo0NOOL0S6VW/eFpLjrhoNWAW29Y9X
   sIX6DtVfwtVoBC0iyS8YvAjhUjJZKMBYL3rzEga0MaPLjizavhR8pzRJ8
   /CpVSM7p55AA5mE0TqAHM2NiRBXbmqHVDxQw2D5h/spllabTUIqyYHw4t
   Q==;
X-CSE-ConnectionGUID: GWXGXpEpRxycIf16GeE+Og==
X-CSE-MsgGUID: rzRymtWkRYWNoQUxyCgsqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="81366311"
X-IronPort-AV: E=Sophos;i="6.23,185,1770624000"; 
   d="scan'208";a="81366311"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 16:43:13 -0700
X-CSE-ConnectionGUID: SMHFJoDMRIWxfCzKmwH2nw==
X-CSE-MsgGUID: +9cF498jTD23ZxK9LdzD7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,185,1770624000"; 
   d="scan'208";a="231037859"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 17 Apr 2026 16:43:12 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDsq5-000000001S9-3UZw;
	Fri, 17 Apr 2026 23:43:09 +0000
Date: Sat, 18 Apr 2026 01:42:14 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/virtio/virtio.c:697:12: warning:
 'virtio_device_reinit_noirq' defined but not used
Message-ID: <202604180130.MK1znjvl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Sungho Bae <baver.bae@lge.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Sungho-Bae/virtio-separate-PM-restore-and-reset_done-paths/20260417-225203
head:   62b66be518d5420bcec6a71ec8a05c590ed9f2df
commit: 2b934f5dd30f970f9b8edb861c16cc043e696c42 virtio: add noirq system sleep PM infrastructure
date:   9 hours ago
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260418/202604180130.MK1znjvl-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260418/202604180130.MK1znjvl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604180130.MK1znjvl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/virtio/virtio.c:697:12: warning: 'virtio_device_reinit_noirq' defined but not used [-Wunused-function]
     697 | static int virtio_device_reinit_noirq(struct virtio_device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/virtio/virtio.c:196:13: warning: 'virtio_config_core_enable_noirq' defined but not used [-Wunused-function]
     196 | static void virtio_config_core_enable_noirq(struct virtio_device *dev)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/virtio_device_reinit_noirq +697 drivers/virtio/virtio.c

a0ec4fb63f5ce1 Israel Rukshin 2024-11-27  695  
2b934f5dd30f97 Sungho Bae     2026-04-17  696  /* noirq-safe variant of virtio_device_reinit() */
2b934f5dd30f97 Sungho Bae     2026-04-17 @697  static int virtio_device_reinit_noirq(struct virtio_device *dev)
2b934f5dd30f97 Sungho Bae     2026-04-17  698  {
2b934f5dd30f97 Sungho Bae     2026-04-17  699  	struct virtio_driver *drv = drv_to_virtio(dev->dev.driver);
2b934f5dd30f97 Sungho Bae     2026-04-17  700  	int ret;
2b934f5dd30f97 Sungho Bae     2026-04-17  701  
2b934f5dd30f97 Sungho Bae     2026-04-17  702  	/*
2b934f5dd30f97 Sungho Bae     2026-04-17  703  	 * We always start by resetting the device, in case a previous
2b934f5dd30f97 Sungho Bae     2026-04-17  704  	 * driver messed it up.
2b934f5dd30f97 Sungho Bae     2026-04-17  705  	 */
2b934f5dd30f97 Sungho Bae     2026-04-17  706  	virtio_reset_device_noirq(dev);
2b934f5dd30f97 Sungho Bae     2026-04-17  707  
2b934f5dd30f97 Sungho Bae     2026-04-17  708  	/* Acknowledge that we've seen the device. */
2b934f5dd30f97 Sungho Bae     2026-04-17  709  	virtio_add_status_noirq(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE);
2b934f5dd30f97 Sungho Bae     2026-04-17  710  
2b934f5dd30f97 Sungho Bae     2026-04-17  711  	/*
2b934f5dd30f97 Sungho Bae     2026-04-17  712  	 * Maybe driver failed before freeze.
2b934f5dd30f97 Sungho Bae     2026-04-17  713  	 * Restore the failed status, for debugging.
2b934f5dd30f97 Sungho Bae     2026-04-17  714  	 */
2b934f5dd30f97 Sungho Bae     2026-04-17  715  	if (dev->failed)
2b934f5dd30f97 Sungho Bae     2026-04-17  716  		virtio_add_status_noirq(dev, VIRTIO_CONFIG_S_FAILED);
2b934f5dd30f97 Sungho Bae     2026-04-17  717  
2b934f5dd30f97 Sungho Bae     2026-04-17  718  	if (!drv)
2b934f5dd30f97 Sungho Bae     2026-04-17  719  		return 0;
2b934f5dd30f97 Sungho Bae     2026-04-17  720  
2b934f5dd30f97 Sungho Bae     2026-04-17  721  	/* We have a driver! */
2b934f5dd30f97 Sungho Bae     2026-04-17  722  	virtio_add_status_noirq(dev, VIRTIO_CONFIG_S_DRIVER);
2b934f5dd30f97 Sungho Bae     2026-04-17  723  
2b934f5dd30f97 Sungho Bae     2026-04-17  724  	ret = dev->config->finalize_features(dev);
2b934f5dd30f97 Sungho Bae     2026-04-17  725  	if (ret)
2b934f5dd30f97 Sungho Bae     2026-04-17  726  		return ret;
2b934f5dd30f97 Sungho Bae     2026-04-17  727  
2b934f5dd30f97 Sungho Bae     2026-04-17  728  	return virtio_features_ok_noirq(dev);
2b934f5dd30f97 Sungho Bae     2026-04-17  729  }
2b934f5dd30f97 Sungho Bae     2026-04-17  730  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
