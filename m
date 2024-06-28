Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752751C8FAB
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Jun 2024 18:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719600145; cv=none; b=LZpBNQrgtk+VboOWr+TtCtsqyH5W0W8y53kiW5YCmXMOgiQ+GSEYMmoa3rV9PI/RO0BoYX+Hst8et7zvXilIOkpPwh+OQFrBPPxfVFFSGMh95LiwIpyTCDB9ZCwCota12M5IItESDzdEiFU3He/lVxAq0dr+nLNSs8A81UYSfxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719600145; c=relaxed/simple;
	bh=YMTB4EwlwsI7FI3SNimVHIpBEOmvXq0SSaFy/GACL/s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wu94WWMmRpxWNNcwsQ88Od7L0jXR1qxKXXUuVDSCRHZVQ9nvbBZWTZwuS6226ixCF9zvgEL9i9kXTTS2vydp53xwmnNKUwTZ6R4yN0pJ1aG6DwJNbaDIXWiJIarqf3ac0YzXILrcZrEgsa015RixFKDr0s3d/tJeifQAUk2sPOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AaKEQUP+; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AaKEQUP+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719600141; x=1751136141;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YMTB4EwlwsI7FI3SNimVHIpBEOmvXq0SSaFy/GACL/s=;
  b=AaKEQUP+9UHyLBPXqSK/2ivHjQmgkKCTFWP0rGL793otWHgbNrWUaWXl
   IxCOuho74o8tUsxBxPz5+V081gdrNf6EpT45Bn1Y37f01QM0J8RlwANTY
   QKG6IoUE7HeBzTobZUbCu3VEMxfa/dgrz8H/zcOqpvvWV79GZyX8DjbUe
   5Qw56oyjIfl+N+lkbkAD2jF6Z8hhPm/qyVY3Ox74mnxb9nTmdX2hS+Vvr
   myGickcbmi9LV6cvPEmDDlvwha8xulG+J3cmgulzifOHwWT2qgI4hA5bF
   fPAkNRqjcGr68jsCO7jRnIN3xk8Gy30mqwFWrKFOcLkUF0B0cyt7s6QL2
   Q==;
X-CSE-ConnectionGUID: aH/k+51HSVWnpOIf7qZJXQ==
X-CSE-MsgGUID: gpy6+jO5TGuq/S0jnD3PAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="16930038"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; 
   d="scan'208";a="16930038"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 11:42:20 -0700
X-CSE-ConnectionGUID: h3r8nfo7QcKXBw5xZ4HsGw==
X-CSE-MsgGUID: 8usukFY0SpKSwNAaoWn1qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; 
   d="scan'208";a="44802034"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 28 Jun 2024 11:42:18 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sNGY3-000Hji-39;
	Fri, 28 Jun 2024 18:42:15 +0000
Date: Sat, 29 Jun 2024 02:41:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH v2 11/13] ata: libata-core: Reuse available ata_port
 print_ids
Message-ID: <202406290221.VULCV6Lt-lkp@intel.com>
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
In-Reply-To: <20240626180031.4050226-26-cassel@kernel.org>
References: <20240626180031.4050226-26-cassel@kernel.org>
TO: Niklas Cassel <cassel@kernel.org>
TO: Damien Le Moal <dlemoal@kernel.org>
TO: Niklas Cassel <cassel@kernel.org>
CC: linux-scsi@vger.kernel.org
CC: John Garry <john.g.garry@oracle.com>
CC: Jason Yan <yanaijie@huawei.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
CC: linux-ide@vger.kernel.org

Hi Niklas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.10-rc5 next-20240627]
[cannot apply to mkp-scsi/for-next jejb-scsi/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Niklas-Cassel/ata-libata-core-Fix-null-pointer-dereference-on-error/20240627-123023
base:   linus/master
patch link:    https://lore.kernel.org/r/20240626180031.4050226-26-cassel%40kernel.org
patch subject: [PATCH v2 11/13] ata: libata-core: Reuse available ata_port print_ids
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-101-20240628 (https://download.01.org/0day-ci/archive/20240629/202406290221.VULCV6Lt-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202406290221.VULCV6Lt-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/ata/libata-core.c:5467:5-17: WARNING: Unsigned expression compared with zero: ap -> print_id < 0

vim +5467 drivers/ata/libata-core.c

4fb37a25b976e8 drivers/ata/libata-core.c  Tejun Heo       2007-08-06  5443  
^1da177e4c3f41 drivers/scsi/libata-core.c Linus Torvalds  2005-04-16  5444  /**
f31871951b38da drivers/ata/libata-core.c  Tejun Heo       2007-04-17  5445   *	ata_port_alloc - allocate and initialize basic ATA port resources
f31871951b38da drivers/ata/libata-core.c  Tejun Heo       2007-04-17  5446   *	@host: ATA host this allocated port belongs to
^1da177e4c3f41 drivers/scsi/libata-core.c Linus Torvalds  2005-04-16  5447   *
f31871951b38da drivers/ata/libata-core.c  Tejun Heo       2007-04-17  5448   *	Allocate and initialize basic ATA port resources.
f31871951b38da drivers/ata/libata-core.c  Tejun Heo       2007-04-17  5449   *
f31871951b38da drivers/ata/libata-core.c  Tejun Heo       2007-04-17  5450   *	RETURNS:
f31871951b38da drivers/ata/libata-core.c  Tejun Heo       2007-04-17  5451   *	Allocate ATA port on success, NULL on failure.
0cba632b737fc2 drivers/scsi/libata-core.c Jeff Garzik     2005-05-30  5452   *
^1da177e4c3f41 drivers/scsi/libata-core.c Linus Torvalds  2005-04-16  5453   *	LOCKING:
f31871951b38da drivers/ata/libata-core.c  Tejun Heo       2007-04-17  5454   *	Inherited from calling layer (may sleep).
^1da177e4c3f41 drivers/scsi/libata-core.c Linus Torvalds  2005-04-16  5455   */
f31871951b38da drivers/ata/libata-core.c  Tejun Heo       2007-04-17  5456  struct ata_port *ata_port_alloc(struct ata_host *host)
^1da177e4c3f41 drivers/scsi/libata-core.c Linus Torvalds  2005-04-16  5457  {
f31871951b38da drivers/ata/libata-core.c  Tejun Heo       2007-04-17  5458  	struct ata_port *ap;
^1da177e4c3f41 drivers/scsi/libata-core.c Linus Torvalds  2005-04-16  5459  
f31871951b38da drivers/ata/libata-core.c  Tejun Heo       2007-04-17  5460  	ap = kzalloc(sizeof(*ap), GFP_KERNEL);
f31871951b38da drivers/ata/libata-core.c  Tejun Heo       2007-04-17  5461  	if (!ap)
f31871951b38da drivers/ata/libata-core.c  Tejun Heo       2007-04-17  5462  		return NULL;
f31871951b38da drivers/ata/libata-core.c  Tejun Heo       2007-04-17  5463  
7b3a24c57d2eed drivers/ata/libata-core.c  Maxime Bizon    2011-03-16  5464  	ap->pflags |= ATA_PFLAG_INITIALIZING | ATA_PFLAG_FROZEN;
cca3974e48607c drivers/ata/libata-core.c  Jeff Garzik     2006-08-24  5465  	ap->lock = &host->lock;
94908a6170de20 drivers/ata/libata-core.c  Niklas Cassel   2024-06-26  5466  	ap->print_id = ida_alloc_min(&ata_ida, 1, GFP_KERNEL);
94908a6170de20 drivers/ata/libata-core.c  Niklas Cassel   2024-06-26 @5467  	if (ap->print_id < 0) {
94908a6170de20 drivers/ata/libata-core.c  Niklas Cassel   2024-06-26  5468  		kfree(ap);
94908a6170de20 drivers/ata/libata-core.c  Niklas Cassel   2024-06-26  5469  		return NULL;
94908a6170de20 drivers/ata/libata-core.c  Niklas Cassel   2024-06-26  5470  	}
cca3974e48607c drivers/ata/libata-core.c  Jeff Garzik     2006-08-24  5471  	ap->host = host;
f31871951b38da drivers/ata/libata-core.c  Tejun Heo       2007-04-17  5472  	ap->dev = host->dev;
bd5d825c9434b8 drivers/scsi/libata-core.c Borislav Petkov 2006-06-11  5473  
ad72cf9885c536 drivers/ata/libata-core.c  Tejun Heo       2010-07-02  5474  	mutex_init(&ap->scsi_scan_mutex);
65f27f38446e19 drivers/ata/libata-core.c  David Howells   2006-11-22  5475  	INIT_DELAYED_WORK(&ap->hotplug_task, ata_scsi_hotplug);
6aa0365a3c8512 drivers/ata/libata-core.c  Damien Le Moal  2023-06-15  5476  	INIT_DELAYED_WORK(&ap->scsi_rescan_task, ata_scsi_dev_rescan);
a72ec4ce6d3ae9 drivers/scsi/libata-core.c Tejun Heo       2006-01-23  5477  	INIT_LIST_HEAD(&ap->eh_done_q);
c6cf9e99d1de5c drivers/scsi/libata-core.c Tejun Heo       2006-05-31  5478  	init_waitqueue_head(&ap->eh_wait_q);
45fabbb77bd95a drivers/ata/libata-core.c  Elias Oltmanns  2008-09-21  5479  	init_completion(&ap->park_req_pending);
b93ab338f7f0e3 drivers/ata/libata-core.c  Kees Cook       2017-10-16  5480  	timer_setup(&ap->fastdrain_timer, ata_eh_fastdrain_timerfn,
b93ab338f7f0e3 drivers/ata/libata-core.c  Kees Cook       2017-10-16  5481  		    TIMER_DEFERRABLE);
^1da177e4c3f41 drivers/scsi/libata-core.c Linus Torvalds  2005-04-16  5482  
838df6284c5444 drivers/scsi/libata-core.c Tejun Heo       2006-05-15  5483  	ap->cbl = ATA_CBL_NONE;
838df6284c5444 drivers/scsi/libata-core.c Tejun Heo       2006-05-15  5484  
8989805d6d176a drivers/ata/libata-core.c  Tejun Heo       2007-08-06  5485  	ata_link_init(ap, &ap->link, 0);
^1da177e4c3f41 drivers/scsi/libata-core.c Linus Torvalds  2005-04-16  5486  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
