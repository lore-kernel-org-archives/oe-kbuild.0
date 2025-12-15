Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F38130EF89
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Dec 2025 15:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765813351; cv=none; b=Z03t0n8ihFSvtJMCfhkKvDahl2CxtfX6Oz9Mssj7JeM/cX6+B+QrAu4bqi+lEisy3EgbMrjaS0IPEPwG16eO+YeGaBt1+vgH8ZhA12LmBxC/a+rzrBlJVlxE98xiVvUUykbLaEkzpnYzqKthfRNVs0ajpi83z1Cjaa6NvqqpU24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765813351; c=relaxed/simple;
	bh=gdRI86ktEquVCgTZIqM/GIpBwFJUOtEgla0q/Hf2DbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o33GEDgjPPYk4k1XcQ+/ZkbBaDVPzAdZDWJA3raqeVP+eHxtj6DQBwR3s6lphecCvW9qrUe2k5g3VyduE90vYceneDqmm6ntLi4iy3qyrQRsRhrAX8GHsi00/AN+4xuDjTGjDrc3eiHXd54ObxPNVzrgzoxBBAq0eMvELTkzrek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VULTRXIf; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VULTRXIf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765813349; x=1797349349;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gdRI86ktEquVCgTZIqM/GIpBwFJUOtEgla0q/Hf2DbQ=;
  b=VULTRXIfvX3QzCMd28nu18Td0YS+WI55Q4IZ30b+5AXsXpt9eq0/SokP
   i45R/Y85S6JMAiuKzrDg2PH2ds/GPiJE+D8mrMpVwWwo+OiSJef0UJ0FG
   HJeq+3uUUVZFb69ls7fHfPcFf1U/PaeEKbi3eW8BjlhGCFmJ5rBDMaaTg
   HW1N1DEIgb4Ytb+LORfNBCEAmCjctzGfsX/TPBlCSAEhq2zQVVh6iIOG5
   CrUmkX9rwPkBY9AiAgrjRV1kkyZt+JKt/bCt79a/ZeiXNtkiRCmEnXdBd
   DOrKjp7fH5PPqiKXV+SVA4wZhzRzDMDRlJsPGyaiX0yXCgN3BqVd6eirM
   Q==;
X-CSE-ConnectionGUID: 8Qa6mvRxTTOD8vpaNNK9pg==
X-CSE-MsgGUID: b6DCmQdJSYm8RqRvyjrIvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="70294257"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="70294257"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 07:42:28 -0800
X-CSE-ConnectionGUID: EhMm71cdSf+0paQXeq527w==
X-CSE-MsgGUID: 0DMnya3RRY2tlzLQsGIW5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="198581295"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 15 Dec 2025 07:42:27 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVAiP-000000000QX-0nsI;
	Mon, 15 Dec 2025 15:42:25 +0000
Date: Mon, 15 Dec 2025 23:42:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/scsi/storvsc_drv.c:841 storvsc_execute_vstor_op() warn:
 missing error code? 'ret'
Message-ID: <202512152354.fTXRyo8C-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Roman Kisel <romank@linux.microsoft.com>
CC: Wei Liu <wei.liu@kernel.org>
CC: Michael Kelley <mhklinux@outlook.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: f41ceff1748612b9e1538becc13dc2f1617d9d14 Drivers: hv: Enable VTL mode for arm64
date:   7 months ago
:::::: branch date: 2 days ago
:::::: commit date: 7 months ago
config: arm64-randconfig-r071-20251215 (https://download.01.org/0day-ci/archive/20251215/202512152354.fTXRyo8C-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512152354.fTXRyo8C-lkp@intel.com/

smatch warnings:
drivers/scsi/storvsc_drv.c:841 storvsc_execute_vstor_op() warn: missing error code? 'ret'

vim +/ret +841 drivers/scsi/storvsc_drv.c

dac582417bc449 drivers/scsi/storvsc_drv.c       K. Y. Srinivasan         2015-12-23  809  
59635018f9b7ae drivers/scsi/storvsc_drv.c       K. Y. Srinivasan         2015-12-23  810  
59635018f9b7ae drivers/scsi/storvsc_drv.c       K. Y. Srinivasan         2015-12-23  811  static int storvsc_execute_vstor_op(struct hv_device *device,
59635018f9b7ae drivers/scsi/storvsc_drv.c       K. Y. Srinivasan         2015-12-23  812  				    struct storvsc_cmd_request *request,
59635018f9b7ae drivers/scsi/storvsc_drv.c       K. Y. Srinivasan         2015-12-23  813  				    bool status_check)
8dcf37d446f103 drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan         2011-08-27  814  {
244808e0302953 drivers/scsi/storvsc_drv.c       Andrea Parri (Microsoft  2020-12-17  815) 	struct storvsc_device *stor_device;
8dcf37d446f103 drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan         2011-08-27  816  	struct vstor_packet *vstor_packet;
59635018f9b7ae drivers/scsi/storvsc_drv.c       K. Y. Srinivasan         2015-12-23  817  	int ret, t;
8dcf37d446f103 drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan         2011-08-27  818  
244808e0302953 drivers/scsi/storvsc_drv.c       Andrea Parri (Microsoft  2020-12-17  819) 	stor_device = get_out_stor_device(device);
244808e0302953 drivers/scsi/storvsc_drv.c       Andrea Parri (Microsoft  2020-12-17  820) 	if (!stor_device)
244808e0302953 drivers/scsi/storvsc_drv.c       Andrea Parri (Microsoft  2020-12-17  821) 		return -ENODEV;
244808e0302953 drivers/scsi/storvsc_drv.c       Andrea Parri (Microsoft  2020-12-17  822) 
8dcf37d446f103 drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan         2011-08-27  823  	vstor_packet = &request->vstor_packet;
8dcf37d446f103 drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan         2011-08-27  824  
8dcf37d446f103 drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan         2011-08-27  825  	init_completion(&request->wait_event);
8dcf37d446f103 drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan         2011-08-27  826  	vstor_packet->flags = REQUEST_COMPLETION_FLAG;
8dcf37d446f103 drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan         2011-08-27  827  
8dcf37d446f103 drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan         2011-08-27  828  	ret = vmbus_sendpacket(device->channel, vstor_packet,
86c8fb4d228ed8 drivers/scsi/storvsc_drv.c       Saurabh Sengar           2022-05-25  829  			       sizeof(struct vstor_packet),
bf5fd8cae3c8f0 drivers/scsi/storvsc_drv.c       Andrea Parri (Microsoft  2021-05-10  830) 			       VMBUS_RQST_INIT,
8dcf37d446f103 drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan         2011-08-27  831  			       VM_PKT_DATA_INBAND,
8dcf37d446f103 drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan         2011-08-27  832  			       VMBUS_DATA_PACKET_FLAG_COMPLETION_REQUESTED);
8dcf37d446f103 drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan         2011-08-27  833  	if (ret != 0)
dac582417bc449 drivers/scsi/storvsc_drv.c       K. Y. Srinivasan         2015-12-23  834  		return ret;
8dcf37d446f103 drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan         2011-08-27  835  
8dcf37d446f103 drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan         2011-08-27  836  	t = wait_for_completion_timeout(&request->wait_event, 5*HZ);
dac582417bc449 drivers/scsi/storvsc_drv.c       K. Y. Srinivasan         2015-12-23  837  	if (t == 0)
dac582417bc449 drivers/scsi/storvsc_drv.c       K. Y. Srinivasan         2015-12-23  838  		return -ETIMEDOUT;
8dcf37d446f103 drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan         2011-08-27  839  
59635018f9b7ae drivers/scsi/storvsc_drv.c       K. Y. Srinivasan         2015-12-23  840  	if (!status_check)
59635018f9b7ae drivers/scsi/storvsc_drv.c       K. Y. Srinivasan         2015-12-23 @841  		return ret;
59635018f9b7ae drivers/scsi/storvsc_drv.c       K. Y. Srinivasan         2015-12-23  842  
8dcf37d446f103 drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan         2011-08-27  843  	if (vstor_packet->operation != VSTOR_OPERATION_COMPLETE_IO ||
dac582417bc449 drivers/scsi/storvsc_drv.c       K. Y. Srinivasan         2015-12-23  844  	    vstor_packet->status != 0)
dac582417bc449 drivers/scsi/storvsc_drv.c       K. Y. Srinivasan         2015-12-23  845  		return -EINVAL;
8dcf37d446f103 drivers/staging/hv/storvsc_drv.c K. Y. Srinivasan         2011-08-27  846  
59635018f9b7ae drivers/scsi/storvsc_drv.c       K. Y. Srinivasan         2015-12-23  847  	return ret;
59635018f9b7ae drivers/scsi/storvsc_drv.c       K. Y. Srinivasan         2015-12-23  848  }
59635018f9b7ae drivers/scsi/storvsc_drv.c       K. Y. Srinivasan         2015-12-23  849  

:::::: The code at line 841 was first introduced by commit
:::::: 59635018f9b7ae8b3e304d7a5da6f628b5a1dcf6 storvsc: Refactor the code in storvsc_channel_init()

:::::: TO: K. Y. Srinivasan <kys@microsoft.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
