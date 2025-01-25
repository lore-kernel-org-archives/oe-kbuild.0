Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6D21E7C01
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Jan 2025 23:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737848225; cv=none; b=PaHL5UTLeBoEZWHJVWDya1EQjQ4TS8FzP9srWm6FUod+l6GK87f6zL1lC8WVU17mMAx7785LQZLz2dPz1ePXCbH9+AmWc9aT2lFHcwQHlsukBSiaJtLxgfhX0Wq6Qgqg2KgSwRxJCB0ZV0uprF0aJ7qXCrRksl3kncc9GnQY4j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737848225; c=relaxed/simple;
	bh=N22TFK3BKQTPIN+wmlbHgsfBddsyrTSnae6QxpOnLpA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fFF4VBcaAtC7lBLgPzPo/1V7r0/NU0BnIPTlK5CBWYuc1pWRms9qVK6EJy+n3/fKWyiC3ojcFjR12P9mo3GIk4bWD1MxUgiFW10K0tZVoR/gXIP33O71Fgj9ZLGGfp4BUnXNPbJiufOezDEnZL0YgsfodNLGRWB3R5wLKiq5Qpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UbFFRMAz; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UbFFRMAz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737848222; x=1769384222;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N22TFK3BKQTPIN+wmlbHgsfBddsyrTSnae6QxpOnLpA=;
  b=UbFFRMAzZZeKL2nwg4W0TSErtT0DY9efo4F+4IIWR0cNV4WDLYcV71xQ
   211PiVVwjLFjljSHQnVco5bewl9PwQzBNMP3SJC6lwfy5zNRhK3KbyA8e
   YtY/rzkjBDoE1Ewd8njKcoYYwBvosbZgmvnDxO/JAdU6jyfTYnZ2IEIBf
   SL/mNGTJq1VraWdFi3BYJufHYRedN0lONdRx9pxePMa/HSsSVkQ3wpYfS
   BpKtkMCufJYkqtbApH9D7BR+WFtsTAKp89g57AVhWvSwkueWThRIHtNPc
   3Oo1T8aFqMxFheOhtT5ytIba8qDzKvNA8mGV7ET0XearfrGCqpiruzr8o
   Q==;
X-CSE-ConnectionGUID: 4s+4ZskITUO9YVLBKTSiMQ==
X-CSE-MsgGUID: 6CTKCjByR52yQb4+wYJmpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11326"; a="63705420"
X-IronPort-AV: E=Sophos;i="6.13,235,1732608000"; 
   d="scan'208";a="63705420"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 15:37:02 -0800
X-CSE-ConnectionGUID: 9cKIusxjTZ+i+PSGmS3jlA==
X-CSE-MsgGUID: 3QqoJYWZRFG0XvnQk7ohVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="145331357"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 25 Jan 2025 15:37:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbphy-000eL6-15;
	Sat, 25 Jan 2025 23:36:58 +0000
Date: Sun, 26 Jan 2025 07:36:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/scsi/mpi3mr/mpi3mr_os.c:4919:33: warning: '%d' directive
 writing between 1 and 3 bytes into a region of size between 1 and 32
Message-ID: <202501260717.Bljx1w3d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Shin'ichiro Kawasaki" <shinichiro.kawasaki@wdc.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Damien Le Moal <damien.lemoal@opensource.wdc.com>

Hi Shin'ichiro,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   405057718a1f9074133979a9f2ff0c9fa4a19948
commit: f0a43ba6c66cc0688e2748d986a1459fdd3442ef scsi: mpi3mr: Refer CONFIG_SCSI_MPI3MR in Makefile
date:   2 years, 1 month ago
:::::: branch date: 5 hours ago
:::::: commit date: 2 years, 1 month ago
config: csky-randconfig-r122-20240713 (https://download.01.org/0day-ci/archive/20250126/202501260717.Bljx1w3d-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250126/202501260717.Bljx1w3d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501260717.Bljx1w3d-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/scsi/mpi3mr/mpi3mr_os.c: In function 'mpi3mr_probe.part.0':
>> drivers/scsi/mpi3mr/mpi3mr_os.c:4919:33: warning: '%d' directive writing between 1 and 3 bytes into a region of size between 1 and 32 [-Wformat-overflow=]
    4919 |         sprintf(mrioc->name, "%s%d", mrioc->driver_name, mrioc->id);
         |                                 ^~
   drivers/scsi/mpi3mr/mpi3mr_os.c:4919:30: note: directive argument in the range [0, 255]
    4919 |         sprintf(mrioc->name, "%s%d", mrioc->driver_name, mrioc->id);
         |                              ^~~~~~
   drivers/scsi/mpi3mr/mpi3mr_os.c:4919:9: note: 'sprintf' output between 2 and 35 bytes into a destination of size 32
    4919 |         sprintf(mrioc->name, "%s%d", mrioc->driver_name, mrioc->id);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/mpi3mr/mpi3mr_os.c:4999:16: warning: '%d' directive output may be truncated writing between 1 and 3 bytes into a region of size between 1 and 32 [-Wformat-truncation=]
    4999 |             "%s%d_fwevt_wrkr", mrioc->driver_name, mrioc->id);
         |                ^~
   drivers/scsi/mpi3mr/mpi3mr_os.c:4999:13: note: directive argument in the range [0, 255]
    4999 |             "%s%d_fwevt_wrkr", mrioc->driver_name, mrioc->id);
         |             ^~~~~~~~~~~~~~~~~
   drivers/scsi/mpi3mr/mpi3mr_os.c:4998:9: note: 'snprintf' output between 13 and 46 bytes into a destination of size 32
    4998 |         snprintf(mrioc->fwevt_worker_name, sizeof(mrioc->fwevt_worker_name),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    4999 |             "%s%d_fwevt_wrkr", mrioc->driver_name, mrioc->id);
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/scsi/mpi3mr/mpi3mr_fw.c: In function 'mpi3mr_setup_isr':
>> drivers/scsi/mpi3mr/mpi3mr_fw.c:721:58: warning: '%d' directive output may be truncated writing between 1 and 3 bytes into a region of size between 1 and 32 [-Wformat-truncation=]
     721 |         snprintf(intr_info->name, MPI3MR_NAME_LENGTH, "%s%d-msix%d",
         |                                                          ^~
   In function 'mpi3mr_request_irq',
       inlined from 'mpi3mr_setup_isr' at drivers/scsi/mpi3mr/mpi3mr_fw.c:846:12:
   drivers/scsi/mpi3mr/mpi3mr_fw.c:721:55: note: directive argument in the range [0, 255]
     721 |         snprintf(intr_info->name, MPI3MR_NAME_LENGTH, "%s%d-msix%d",
         |                                                       ^~~~~~~~~~~~~
   drivers/scsi/mpi3mr/mpi3mr_fw.c:721:55: note: directive argument in the range [0, 65535]
   drivers/scsi/mpi3mr/mpi3mr_fw.c:721:9: note: 'snprintf' output between 8 and 45 bytes into a destination of size 32
     721 |         snprintf(intr_info->name, MPI3MR_NAME_LENGTH, "%s%d-msix%d",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     722 |             mrioc->driver_name, mrioc->id, index);
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/asm-generic/bug.h:22,
                    from arch/csky/include/asm/bug.h:18,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/csky/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/highmem.h:5,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/blkdev.h:9,
                    from drivers/scsi/mpi3mr/mpi3mr.h:13,
                    from drivers/scsi/mpi3mr/mpi3mr_fw.c:10:
   drivers/scsi/mpi3mr/mpi3mr_fw.c: In function 'mpi3mr_bring_ioc_ready':
   include/linux/kern_levels.h:5:25: warning: '%s' directive argument is null [-Wformat-overflow=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:429:25: note: in definition of macro 'printk_index_wrap'
     429 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:530:9: note: in expansion of macro 'printk'
     530 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:14:25: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO       KERN_SOH "6"    /* informational */
         |                         ^~~~~~~~
   include/linux/printk.h:530:16: note: in expansion of macro 'KERN_INFO'
     530 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~
   drivers/scsi/mpi3mr/mpi3mr_debug.h:48:9: note: in expansion of macro 'pr_info'
      48 |         pr_info("%s: " fmt, (ioc)->name, ##__VA_ARGS__)
         |         ^~~~~~~
   drivers/scsi/mpi3mr/mpi3mr_fw.c:1217:9: note: in expansion of macro 'ioc_info'
    1217 |         ioc_info(mrioc, "controller is in %s state during detection\n",
         |         ^~~~~~~~
   include/linux/kern_levels.h:5:25: warning: '%s' directive argument is null [-Wformat-overflow=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:429:25: note: in definition of macro 'printk_index_wrap'
     429 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:530:9: note: in expansion of macro 'printk'
     530 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:14:25: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO       KERN_SOH "6"    /* informational */
         |                         ^~~~~~~~
   include/linux/printk.h:530:16: note: in expansion of macro 'KERN_INFO'
     530 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~
   drivers/scsi/mpi3mr/mpi3mr_debug.h:48:9: note: in expansion of macro 'pr_info'
      48 |         pr_info("%s: " fmt, (ioc)->name, ##__VA_ARGS__)
         |         ^~~~~~~
   drivers/scsi/mpi3mr/mpi3mr_fw.c:1236:17: note: in expansion of macro 'ioc_info'
    1236 |                 ioc_info(mrioc,
         |                 ^~~~~~~~
   include/linux/kern_levels.h:5:25: warning: '%s' directive argument is null [-Wformat-overflow=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:429:25: note: in definition of macro 'printk_index_wrap'
     429 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:500:9: note: in expansion of macro 'printk'
     500 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:500:16: note: in expansion of macro 'KERN_ERR'
     500 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   drivers/scsi/mpi3mr/mpi3mr_debug.h:42:9: note: in expansion of macro 'pr_err'
      42 |         pr_err("%s: " fmt, (ioc)->name, ##__VA_ARGS__)
         |         ^~~~~~
   drivers/scsi/mpi3mr/mpi3mr_fw.c:1247:25: note: in expansion of macro 'ioc_err'
    1247 |                         ioc_err(mrioc,
         |                         ^~~~~~~
   drivers/scsi/mpi3mr/mpi3mr_fw.c: In function 'mpi3mr_start_watchdog':
>> drivers/scsi/mpi3mr/mpi3mr_fw.c:2545:60: warning: '%s' directive output may be truncated writing up to 31 bytes into a region of size 11 [-Wformat-truncation=]
    2545 |             sizeof(mrioc->watchdog_work_q_name), "watchdog_%s%d", mrioc->name,
         |                                                            ^~
   drivers/scsi/mpi3mr/mpi3mr_fw.c:2545:50: note: directive argument in the range [0, 255]
    2545 |             sizeof(mrioc->watchdog_work_q_name), "watchdog_%s%d", mrioc->name,
         |                                                  ^~~~~~~~~~~~~~~
   drivers/scsi/mpi3mr/mpi3mr_fw.c:2544:9: note: 'snprintf' output between 11 and 44 bytes into a destination of size 20
    2544 |         snprintf(mrioc->watchdog_work_q_name,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2545 |             sizeof(mrioc->watchdog_work_q_name), "watchdog_%s%d", mrioc->name,
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2546 |             mrioc->id);
         |             ~~~~~~~~~~


vim +4919 drivers/scsi/mpi3mr/mpi3mr_os.c

28cbe2f420d338 Kashyap Desai   2021-05-20  4881  
824a156633dfdb Kashyap Desai   2021-05-20  4882  /**
824a156633dfdb Kashyap Desai   2021-05-20  4883   * mpi3mr_probe - PCI probe callback
824a156633dfdb Kashyap Desai   2021-05-20  4884   * @pdev: PCI device instance
824a156633dfdb Kashyap Desai   2021-05-20  4885   * @id: PCI device ID details
824a156633dfdb Kashyap Desai   2021-05-20  4886   *
824a156633dfdb Kashyap Desai   2021-05-20  4887   * controller initialization routine. Checks the security status
824a156633dfdb Kashyap Desai   2021-05-20  4888   * of the controller and if it is invalid or tampered return the
824a156633dfdb Kashyap Desai   2021-05-20  4889   * probe without initializing the controller. Otherwise,
824a156633dfdb Kashyap Desai   2021-05-20  4890   * allocate per adapter instance through shost_priv and
824a156633dfdb Kashyap Desai   2021-05-20  4891   * initialize controller specific data structures, initializae
824a156633dfdb Kashyap Desai   2021-05-20  4892   * the controller hardware, add shost to the SCSI subsystem.
824a156633dfdb Kashyap Desai   2021-05-20  4893   *
824a156633dfdb Kashyap Desai   2021-05-20  4894   * Return: 0 on success, non-zero on failure.
824a156633dfdb Kashyap Desai   2021-05-20  4895   */
824a156633dfdb Kashyap Desai   2021-05-20  4896  
824a156633dfdb Kashyap Desai   2021-05-20  4897  static int
824a156633dfdb Kashyap Desai   2021-05-20  4898  mpi3mr_probe(struct pci_dev *pdev, const struct pci_device_id *id)
824a156633dfdb Kashyap Desai   2021-05-20  4899  {
824a156633dfdb Kashyap Desai   2021-05-20  4900  	struct mpi3mr_ioc *mrioc = NULL;
824a156633dfdb Kashyap Desai   2021-05-20  4901  	struct Scsi_Host *shost = NULL;
13ef29ea4aa065 Kashyap Desai   2021-05-20  4902  	int retval = 0, i;
824a156633dfdb Kashyap Desai   2021-05-20  4903  
28cbe2f420d338 Kashyap Desai   2021-05-20  4904  	if (osintfc_mrioc_security_status(pdev)) {
28cbe2f420d338 Kashyap Desai   2021-05-20  4905  		warn_non_secure_ctlr = 1;
28cbe2f420d338 Kashyap Desai   2021-05-20  4906  		return 1; /* For Invalid and Tampered device */
28cbe2f420d338 Kashyap Desai   2021-05-20  4907  	}
28cbe2f420d338 Kashyap Desai   2021-05-20  4908  
824a156633dfdb Kashyap Desai   2021-05-20  4909  	shost = scsi_host_alloc(&mpi3mr_driver_template,
824a156633dfdb Kashyap Desai   2021-05-20  4910  	    sizeof(struct mpi3mr_ioc));
824a156633dfdb Kashyap Desai   2021-05-20  4911  	if (!shost) {
824a156633dfdb Kashyap Desai   2021-05-20  4912  		retval = -ENODEV;
824a156633dfdb Kashyap Desai   2021-05-20  4913  		goto shost_failed;
824a156633dfdb Kashyap Desai   2021-05-20  4914  	}
824a156633dfdb Kashyap Desai   2021-05-20  4915  
824a156633dfdb Kashyap Desai   2021-05-20  4916  	mrioc = shost_priv(shost);
824a156633dfdb Kashyap Desai   2021-05-20  4917  	mrioc->id = mrioc_ids++;
824a156633dfdb Kashyap Desai   2021-05-20  4918  	sprintf(mrioc->driver_name, "%s", MPI3MR_DRIVER_NAME);
824a156633dfdb Kashyap Desai   2021-05-20 @4919  	sprintf(mrioc->name, "%s%d", mrioc->driver_name, mrioc->id);
824a156633dfdb Kashyap Desai   2021-05-20  4920  	INIT_LIST_HEAD(&mrioc->list);
824a156633dfdb Kashyap Desai   2021-05-20  4921  	spin_lock(&mrioc_list_lock);
824a156633dfdb Kashyap Desai   2021-05-20  4922  	list_add_tail(&mrioc->list, &mrioc_list);
824a156633dfdb Kashyap Desai   2021-05-20  4923  	spin_unlock(&mrioc_list_lock);
824a156633dfdb Kashyap Desai   2021-05-20  4924  
824a156633dfdb Kashyap Desai   2021-05-20  4925  	spin_lock_init(&mrioc->admin_req_lock);
824a156633dfdb Kashyap Desai   2021-05-20  4926  	spin_lock_init(&mrioc->reply_free_queue_lock);
824a156633dfdb Kashyap Desai   2021-05-20  4927  	spin_lock_init(&mrioc->sbq_lock);
13ef29ea4aa065 Kashyap Desai   2021-05-20  4928  	spin_lock_init(&mrioc->fwevt_lock);
13ef29ea4aa065 Kashyap Desai   2021-05-20  4929  	spin_lock_init(&mrioc->tgtdev_lock);
672ae26c82166d Kashyap Desai   2021-05-20  4930  	spin_lock_init(&mrioc->watchdog_lock);
023ab2a9b4edd4 Kashyap Desai   2021-05-20  4931  	spin_lock_init(&mrioc->chain_buf_lock);
125ad1e6b445e8 Sreekanth Reddy 2022-08-04  4932  	spin_lock_init(&mrioc->sas_node_lock);
824a156633dfdb Kashyap Desai   2021-05-20  4933  
13ef29ea4aa065 Kashyap Desai   2021-05-20  4934  	INIT_LIST_HEAD(&mrioc->fwevt_list);
13ef29ea4aa065 Kashyap Desai   2021-05-20  4935  	INIT_LIST_HEAD(&mrioc->tgtdev_list);
13ef29ea4aa065 Kashyap Desai   2021-05-20  4936  	INIT_LIST_HEAD(&mrioc->delayed_rmhs_list);
c1af985d27da2d Sreekanth Reddy 2021-12-20  4937  	INIT_LIST_HEAD(&mrioc->delayed_evtack_cmds_list);
125ad1e6b445e8 Sreekanth Reddy 2022-08-04  4938  	INIT_LIST_HEAD(&mrioc->sas_expander_list);
125ad1e6b445e8 Sreekanth Reddy 2022-08-04  4939  	INIT_LIST_HEAD(&mrioc->hba_port_table_list);
7188c03ff8849c Sreekanth Reddy 2022-08-04  4940  	INIT_LIST_HEAD(&mrioc->enclosure_list);
13ef29ea4aa065 Kashyap Desai   2021-05-20  4941  
fb9b04574f1478 Kashyap Desai   2021-05-20  4942  	mutex_init(&mrioc->reset_mutex);
824a156633dfdb Kashyap Desai   2021-05-20  4943  	mpi3mr_init_drv_cmd(&mrioc->init_cmds, MPI3MR_HOSTTAG_INITCMDS);
e844adb1fbdc41 Kashyap Desai   2021-05-20  4944  	mpi3mr_init_drv_cmd(&mrioc->host_tm_cmds, MPI3MR_HOSTTAG_BLK_TMS);
f5e6d5a3437610 Sumit Saxena    2022-04-29  4945  	mpi3mr_init_drv_cmd(&mrioc->bsg_cmds, MPI3MR_HOSTTAG_BSG_CMDS);
32d457d5a2af9b Sreekanth Reddy 2022-08-04  4946  	mpi3mr_init_drv_cmd(&mrioc->cfg_cmds, MPI3MR_HOSTTAG_CFG_CMDS);
2bd37e28491401 Sreekanth Reddy 2022-08-04  4947  	mpi3mr_init_drv_cmd(&mrioc->transport_cmds,
2bd37e28491401 Sreekanth Reddy 2022-08-04  4948  	    MPI3MR_HOSTTAG_TRANSPORT_CMDS);
672ae26c82166d Kashyap Desai   2021-05-20  4949  
13ef29ea4aa065 Kashyap Desai   2021-05-20  4950  	for (i = 0; i < MPI3MR_NUM_DEVRMCMD; i++)
13ef29ea4aa065 Kashyap Desai   2021-05-20  4951  		mpi3mr_init_drv_cmd(&mrioc->dev_rmhs_cmds[i],
13ef29ea4aa065 Kashyap Desai   2021-05-20  4952  		    MPI3MR_HOSTTAG_DEVRMCMD_MIN + i);
13ef29ea4aa065 Kashyap Desai   2021-05-20  4953  
c9566231cfaf44 Kashyap Desai   2021-05-20  4954  	if (pdev->revision)
c9566231cfaf44 Kashyap Desai   2021-05-20  4955  		mrioc->enable_segqueue = true;
824a156633dfdb Kashyap Desai   2021-05-20  4956  
fb9b04574f1478 Kashyap Desai   2021-05-20  4957  	init_waitqueue_head(&mrioc->reset_waitq);
824a156633dfdb Kashyap Desai   2021-05-20  4958  	mrioc->logging_level = logging_level;
824a156633dfdb Kashyap Desai   2021-05-20  4959  	mrioc->shost = shost;
824a156633dfdb Kashyap Desai   2021-05-20  4960  	mrioc->pdev = pdev;
f5e6d5a3437610 Sumit Saxena    2022-04-29  4961  	mrioc->stop_bsgs = 1;
824a156633dfdb Kashyap Desai   2021-05-20  4962  
824a156633dfdb Kashyap Desai   2021-05-20  4963  	/* init shost parameters */
824a156633dfdb Kashyap Desai   2021-05-20  4964  	shost->max_cmd_len = MPI3MR_MAX_CDB_LENGTH;
824a156633dfdb Kashyap Desai   2021-05-20  4965  	shost->max_lun = -1;
824a156633dfdb Kashyap Desai   2021-05-20  4966  	shost->unique_id = mrioc->id;
824a156633dfdb Kashyap Desai   2021-05-20  4967  
97e6ea6d78064e Sreekanth Reddy 2021-10-14  4968  	shost->max_channel = 0;
824a156633dfdb Kashyap Desai   2021-05-20  4969  	shost->max_id = 0xFFFFFFFF;
824a156633dfdb Kashyap Desai   2021-05-20  4970  
465191d6526a8e Sreekanth Reddy 2022-06-28  4971  	shost->host_tagset = 1;
465191d6526a8e Sreekanth Reddy 2022-06-28  4972  
74e1f30a286809 Kashyap Desai   2021-05-20  4973  	if (prot_mask >= 0)
74e1f30a286809 Kashyap Desai   2021-05-20  4974  		scsi_host_set_prot(shost, prot_mask);
74e1f30a286809 Kashyap Desai   2021-05-20  4975  	else {
74e1f30a286809 Kashyap Desai   2021-05-20  4976  		prot_mask = SHOST_DIF_TYPE1_PROTECTION
74e1f30a286809 Kashyap Desai   2021-05-20  4977  		    | SHOST_DIF_TYPE2_PROTECTION
74e1f30a286809 Kashyap Desai   2021-05-20  4978  		    | SHOST_DIF_TYPE3_PROTECTION;
74e1f30a286809 Kashyap Desai   2021-05-20  4979  		scsi_host_set_prot(shost, prot_mask);
74e1f30a286809 Kashyap Desai   2021-05-20  4980  	}
74e1f30a286809 Kashyap Desai   2021-05-20  4981  
74e1f30a286809 Kashyap Desai   2021-05-20  4982  	ioc_info(mrioc,
74e1f30a286809 Kashyap Desai   2021-05-20  4983  	    "%s :host protection capabilities enabled %s%s%s%s%s%s%s\n",
74e1f30a286809 Kashyap Desai   2021-05-20  4984  	    __func__,
74e1f30a286809 Kashyap Desai   2021-05-20  4985  	    (prot_mask & SHOST_DIF_TYPE1_PROTECTION) ? " DIF1" : "",
74e1f30a286809 Kashyap Desai   2021-05-20  4986  	    (prot_mask & SHOST_DIF_TYPE2_PROTECTION) ? " DIF2" : "",
74e1f30a286809 Kashyap Desai   2021-05-20  4987  	    (prot_mask & SHOST_DIF_TYPE3_PROTECTION) ? " DIF3" : "",
74e1f30a286809 Kashyap Desai   2021-05-20  4988  	    (prot_mask & SHOST_DIX_TYPE0_PROTECTION) ? " DIX0" : "",
74e1f30a286809 Kashyap Desai   2021-05-20  4989  	    (prot_mask & SHOST_DIX_TYPE1_PROTECTION) ? " DIX1" : "",
74e1f30a286809 Kashyap Desai   2021-05-20  4990  	    (prot_mask & SHOST_DIX_TYPE2_PROTECTION) ? " DIX2" : "",
74e1f30a286809 Kashyap Desai   2021-05-20  4991  	    (prot_mask & SHOST_DIX_TYPE3_PROTECTION) ? " DIX3" : "");
74e1f30a286809 Kashyap Desai   2021-05-20  4992  
74e1f30a286809 Kashyap Desai   2021-05-20  4993  	if (prot_guard_mask)
74e1f30a286809 Kashyap Desai   2021-05-20  4994  		scsi_host_set_guard(shost, (prot_guard_mask & 3));
74e1f30a286809 Kashyap Desai   2021-05-20  4995  	else
74e1f30a286809 Kashyap Desai   2021-05-20  4996  		scsi_host_set_guard(shost, SHOST_DIX_GUARD_CRC);
74e1f30a286809 Kashyap Desai   2021-05-20  4997  
13ef29ea4aa065 Kashyap Desai   2021-05-20  4998  	snprintf(mrioc->fwevt_worker_name, sizeof(mrioc->fwevt_worker_name),
13ef29ea4aa065 Kashyap Desai   2021-05-20  4999  	    "%s%d_fwevt_wrkr", mrioc->driver_name, mrioc->id);
13ef29ea4aa065 Kashyap Desai   2021-05-20  5000  	mrioc->fwevt_worker_thread = alloc_ordered_workqueue(
334ae6459aa38a Sreekanth Reddy 2022-02-18  5001  	    mrioc->fwevt_worker_name, 0);
13ef29ea4aa065 Kashyap Desai   2021-05-20  5002  	if (!mrioc->fwevt_worker_thread) {
13ef29ea4aa065 Kashyap Desai   2021-05-20  5003  		ioc_err(mrioc, "failure at %s:%d/%s()!\n",
13ef29ea4aa065 Kashyap Desai   2021-05-20  5004  		    __FILE__, __LINE__, __func__);
13ef29ea4aa065 Kashyap Desai   2021-05-20  5005  		retval = -ENODEV;
fe6db615156573 Sreekanth Reddy 2021-12-20  5006  		goto fwevtthread_failed;
13ef29ea4aa065 Kashyap Desai   2021-05-20  5007  	}
13ef29ea4aa065 Kashyap Desai   2021-05-20  5008  
824a156633dfdb Kashyap Desai   2021-05-20  5009  	mrioc->is_driver_loading = 1;
fe6db615156573 Sreekanth Reddy 2021-12-20  5010  	mrioc->cpu_count = num_online_cpus();
fe6db615156573 Sreekanth Reddy 2021-12-20  5011  	if (mpi3mr_setup_resources(mrioc)) {
fe6db615156573 Sreekanth Reddy 2021-12-20  5012  		ioc_err(mrioc, "setup resources failed\n");
fe6db615156573 Sreekanth Reddy 2021-12-20  5013  		retval = -ENODEV;
fe6db615156573 Sreekanth Reddy 2021-12-20  5014  		goto resource_alloc_failed;
fe6db615156573 Sreekanth Reddy 2021-12-20  5015  	}
fe6db615156573 Sreekanth Reddy 2021-12-20  5016  	if (mpi3mr_init_ioc(mrioc)) {
fe6db615156573 Sreekanth Reddy 2021-12-20  5017  		ioc_err(mrioc, "initializing IOC failed\n");
824a156633dfdb Kashyap Desai   2021-05-20  5018  		retval = -ENODEV;
fe6db615156573 Sreekanth Reddy 2021-12-20  5019  		goto init_ioc_failed;
824a156633dfdb Kashyap Desai   2021-05-20  5020  	}
824a156633dfdb Kashyap Desai   2021-05-20  5021  
824a156633dfdb Kashyap Desai   2021-05-20  5022  	shost->nr_hw_queues = mrioc->num_op_reply_q;
afd3a5793fe2a2 Sreekanth Reddy 2021-12-20  5023  	if (mrioc->active_poll_qcount)
afd3a5793fe2a2 Sreekanth Reddy 2021-12-20  5024  		shost->nr_maps = 3;
afd3a5793fe2a2 Sreekanth Reddy 2021-12-20  5025  
824a156633dfdb Kashyap Desai   2021-05-20  5026  	shost->can_queue = mrioc->max_host_ios;
824a156633dfdb Kashyap Desai   2021-05-20  5027  	shost->sg_tablesize = MPI3MR_SG_DEPTH;
fe6db615156573 Sreekanth Reddy 2021-12-20  5028  	shost->max_id = mrioc->facts.max_perids + 1;
824a156633dfdb Kashyap Desai   2021-05-20  5029  
824a156633dfdb Kashyap Desai   2021-05-20  5030  	retval = scsi_add_host(shost, &pdev->dev);
824a156633dfdb Kashyap Desai   2021-05-20  5031  	if (retval) {
824a156633dfdb Kashyap Desai   2021-05-20  5032  		ioc_err(mrioc, "failure at %s:%d/%s()!\n",
824a156633dfdb Kashyap Desai   2021-05-20  5033  		    __FILE__, __LINE__, __func__);
824a156633dfdb Kashyap Desai   2021-05-20  5034  		goto addhost_failed;
824a156633dfdb Kashyap Desai   2021-05-20  5035  	}
824a156633dfdb Kashyap Desai   2021-05-20  5036  
824a156633dfdb Kashyap Desai   2021-05-20  5037  	scsi_scan_host(shost);
4268fa7513655a Sumit Saxena    2022-04-29  5038  	mpi3mr_bsg_init(mrioc);
824a156633dfdb Kashyap Desai   2021-05-20  5039  	return retval;
824a156633dfdb Kashyap Desai   2021-05-20  5040  
824a156633dfdb Kashyap Desai   2021-05-20  5041  addhost_failed:
fe6db615156573 Sreekanth Reddy 2021-12-20  5042  	mpi3mr_stop_watchdog(mrioc);
fe6db615156573 Sreekanth Reddy 2021-12-20  5043  	mpi3mr_cleanup_ioc(mrioc);
fe6db615156573 Sreekanth Reddy 2021-12-20  5044  init_ioc_failed:
fe6db615156573 Sreekanth Reddy 2021-12-20  5045  	mpi3mr_free_mem(mrioc);
fe6db615156573 Sreekanth Reddy 2021-12-20  5046  	mpi3mr_cleanup_resources(mrioc);
fe6db615156573 Sreekanth Reddy 2021-12-20  5047  resource_alloc_failed:
13ef29ea4aa065 Kashyap Desai   2021-05-20  5048  	destroy_workqueue(mrioc->fwevt_worker_thread);
fe6db615156573 Sreekanth Reddy 2021-12-20  5049  fwevtthread_failed:
824a156633dfdb Kashyap Desai   2021-05-20  5050  	spin_lock(&mrioc_list_lock);
824a156633dfdb Kashyap Desai   2021-05-20  5051  	list_del(&mrioc->list);
824a156633dfdb Kashyap Desai   2021-05-20  5052  	spin_unlock(&mrioc_list_lock);
824a156633dfdb Kashyap Desai   2021-05-20  5053  	scsi_host_put(shost);
824a156633dfdb Kashyap Desai   2021-05-20  5054  shost_failed:
824a156633dfdb Kashyap Desai   2021-05-20  5055  	return retval;
824a156633dfdb Kashyap Desai   2021-05-20  5056  }
824a156633dfdb Kashyap Desai   2021-05-20  5057  

:::::: The code at line 4919 was first introduced by commit
:::::: 824a156633dfdb0e17979a0d0bb2c757d1bb949c scsi: mpi3mr: Base driver code

:::::: TO: Kashyap Desai <kashyap.desai@broadcom.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
