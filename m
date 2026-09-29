Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E50323394A
	for <oe-kbuild@lists.linux.dev>; Tue, 29 Sep 2026 17:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790701477; cv=none; b=HWdDy1QOFrIccHSluoSorQIeLH7yIGKCLzs2uzSP/uzzYAXIRvNHtlcvx30xk1cTJcERUOz9r9eSMH46qbxPQfPmqmP8Hjeg2ZYCTDCQHbQjlfBBWuSAsMUKvJg1sXOFx4qPuqJo87K3ekhP8n8uv/4EIixTDfUnvqxdNuMScx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790701477; c=relaxed/simple;
	bh=qNtcoVwvR64L72BQkQ1dpSQEPNOEjuzdqZWamJOIrMU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OrH52T/a/xt2cbmbQ1hJQ3NuOcPH62qqScPKQwqLeu88/Aq0e0WxEF0Rd/RQXe9pN7IvVU1JHC9jhEmJ5kwE4/XmB134e2IfcRLc6gq3Y0ubT9XvCu+YqdYfOErBXGw2e1bkkP7xV4LGajXxtmPmOIQZ3IRmzVnMQ1EsRc5zpVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A/7bZZiD; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A/7bZZiD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790701475; x=1822237475;
  h=date:from:to:cc:subject:message-id;
  bh=qNtcoVwvR64L72BQkQ1dpSQEPNOEjuzdqZWamJOIrMU=;
  b=A/7bZZiDoz+2ae4bE22Ub4O4LMvEC5GYKXRXNTDtIKLPBI4L+gRCXRYo
   QHG9oqHPsqPOxlXTZEPvvTj3++WHfWw1UBH7GZLFw7+M0DXByISsnX4nc
   jEXVI9yTUpUv5ueqYUxhe9n9khEN57wMYknrtSQVZqlth27V+zBasoHCz
   bSSji6PcMIsUMClvcHht1MpL3jEQXHYJEQWJcD3BbJOeRKYsYHNurPAD7
   NuMcbMMf2p4qXlbtiuABEThyu5lRQ0PQH7gqhQ1weV6RrGCW4W/59314X
   oaBx3Ak/oS7iP9KSXu2dVKdxeaC+V7qe5Wy03+2zXr7f31oMjAccAfKNR
   w==;
X-CSE-ConnectionGUID: 0o70k/xvS7iXRiPWHqwKPw==
X-CSE-MsgGUID: smjxXIbwSaO8Le0jSv4G4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="91448321"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="91448321"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 10:04:34 -0700
X-CSE-ConnectionGUID: GT3Y11PqSFG5LJ3Liyx+PA==
X-CSE-MsgGUID: nsIf1sToRtq7Gxj22Av6dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="303393680"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 29 Sep 2026 10:04:33 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBbFn-000000001UB-0Gkq;
	Tue, 29 Sep 2026 17:04:31 +0000
Date: Tue, 29 Sep 2026 19:04:02 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/scsi/imm.c:1249 __imm_attach() warn: '&dev->list'
 not removed from list
Message-ID: <202609291842.qkVR2lXE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Dongdong Hao <doubled@leap-io-kernel.com>
CC: "Martin K. Petersen (Oracle)" <mkp@kernel.org>
CC: Damien Le Moal <dlemoal@kernel.org>
CC: Hannes Reinecke <hare@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6f8319e3e9a44dd537d17f41565a8453c560a581
commit: 5597088c9e79c94905367c580bb3ff21136b084a scsi: leapraid: Add new SCSI driver
date:   8 weeks ago
:::::: branch date: 14 hours ago
:::::: commit date: 8 weeks ago
config: alpha-randconfig-r2200-20260929 (https://download.01.org/0day-ci/archive/20260929/202609291842.qkVR2lXE-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 5597088c9e79 ("scsi: leapraid: Add new SCSI driver")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609291842.qkVR2lXE-lkp@intel.com/

New smatch warnings:
drivers/scsi/imm.c:1249 __imm_attach() warn: '&dev->list' not removed from list

Old smatch warnings:
internal error: arch/alpha/include/asm/io_trivial.h:12 SQL error #2: near "and": syntax error
internal error: arch/alpha/include/asm/io_trivial.h:12 SQL: 'select * from return_states where  and type = 1044 and parameter = -1 and key = '$' limit 1;'

vim +1249 drivers/scsi/imm.c

a290dd57926cb0 Sudip Mukherjee 2016-01-05  1148  
^1da177e4c3f41 Linus Torvalds  2005-04-16  1149  static int __imm_attach(struct parport *pb)
^1da177e4c3f41 Linus Torvalds  2005-04-16  1150  {
^1da177e4c3f41 Linus Torvalds  2005-04-16  1151  	struct Scsi_Host *host;
a290dd57926cb0 Sudip Mukherjee 2016-01-05  1152  	imm_struct *dev, *temp;
7259f0d05d595b Peter Zijlstra  2006-10-29  1153  	DECLARE_WAIT_QUEUE_HEAD_ONSTACK(waiting);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1154  	DEFINE_WAIT(wait);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1155  	int ports;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1156  	int err = -ENOMEM;
a290dd57926cb0 Sudip Mukherjee 2016-01-05  1157  	struct pardev_cb imm_cb;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1158  
^1da177e4c3f41 Linus Torvalds  2005-04-16  1159  	init_waitqueue_head(&waiting);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1160  
bf4afc53b77aea Linus Torvalds  2026-02-21  1161  	dev = kzalloc_obj(imm_struct);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1162  	if (!dev)
^1da177e4c3f41 Linus Torvalds  2005-04-16  1163  		return -ENOMEM;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1164  
^1da177e4c3f41 Linus Torvalds  2005-04-16  1165  
^1da177e4c3f41 Linus Torvalds  2005-04-16  1166  	dev->base = -1;
b0597fd5a95383 Alex Henrie     2023-08-30  1167  	dev->mode = mode < IMM_UNKNOWN ? mode : IMM_AUTODETECT;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1168  	INIT_LIST_HEAD(&dev->list);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1169  
a290dd57926cb0 Sudip Mukherjee 2016-01-05  1170  	temp = find_parent();
a290dd57926cb0 Sudip Mukherjee 2016-01-05  1171  	if (temp)
a290dd57926cb0 Sudip Mukherjee 2016-01-05  1172  		dev->dev_no = temp->dev_no + 1;
a290dd57926cb0 Sudip Mukherjee 2016-01-05  1173  
a290dd57926cb0 Sudip Mukherjee 2016-01-05  1174  	memset(&imm_cb, 0, sizeof(imm_cb));
a290dd57926cb0 Sudip Mukherjee 2016-01-05  1175  	imm_cb.private = dev;
a290dd57926cb0 Sudip Mukherjee 2016-01-05  1176  	imm_cb.wakeup = imm_wakeup;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1177  
a290dd57926cb0 Sudip Mukherjee 2016-01-05  1178  	dev->dev = parport_register_dev_model(pb, "imm", &imm_cb, dev->dev_no);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1179  	if (!dev->dev)
^1da177e4c3f41 Linus Torvalds  2005-04-16  1180  		goto out;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1181  
^1da177e4c3f41 Linus Torvalds  2005-04-16  1182  
^1da177e4c3f41 Linus Torvalds  2005-04-16  1183  	/* Claim the bus so it remembers what we do to the control
^1da177e4c3f41 Linus Torvalds  2005-04-16  1184  	 * registers. [ CTR and ECP ]
^1da177e4c3f41 Linus Torvalds  2005-04-16  1185  	 */
^1da177e4c3f41 Linus Torvalds  2005-04-16  1186  	err = -EBUSY;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1187  	dev->waiting = &waiting;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1188  	prepare_to_wait(&waiting, &wait, TASK_UNINTERRUPTIBLE);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1189  	if (imm_pb_claim(dev))
^1da177e4c3f41 Linus Torvalds  2005-04-16  1190  		schedule_timeout(3 * HZ);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1191  	if (dev->wanted) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  1192  		printk(KERN_ERR "imm%d: failed to claim parport because "
^1da177e4c3f41 Linus Torvalds  2005-04-16  1193  			"a pardevice is owning the port for too long "
^1da177e4c3f41 Linus Torvalds  2005-04-16  1194  			"time!\n", pb->number);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1195  		imm_pb_dismiss(dev);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1196  		dev->waiting = NULL;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1197  		finish_wait(&waiting, &wait);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1198  		goto out1;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1199  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  1200  	dev->waiting = NULL;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1201  	finish_wait(&waiting, &wait);
b0597fd5a95383 Alex Henrie     2023-08-30  1202  	dev->base = dev->dev->port->base;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1203  	dev->base_hi = dev->dev->port->base_hi;
b0597fd5a95383 Alex Henrie     2023-08-30  1204  	w_ctr(dev->base, 0x0c);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1205  
^1da177e4c3f41 Linus Torvalds  2005-04-16  1206  	/* Done configuration */
^1da177e4c3f41 Linus Torvalds  2005-04-16  1207  
^1da177e4c3f41 Linus Torvalds  2005-04-16  1208  	err = imm_init(dev);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1209  
^1da177e4c3f41 Linus Torvalds  2005-04-16  1210  	imm_pb_release(dev);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1211  
^1da177e4c3f41 Linus Torvalds  2005-04-16  1212  	if (err)
^1da177e4c3f41 Linus Torvalds  2005-04-16  1213  		goto out1;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1214  
^1da177e4c3f41 Linus Torvalds  2005-04-16  1215  	/* now the glue ... */
^1da177e4c3f41 Linus Torvalds  2005-04-16  1216  	if (dev->mode == IMM_NIBBLE || dev->mode == IMM_PS2)
^1da177e4c3f41 Linus Torvalds  2005-04-16  1217  		ports = 3;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1218  	else
^1da177e4c3f41 Linus Torvalds  2005-04-16  1219  		ports = 8;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1220  
c4028958b6ecad David Howells   2006-11-22  1221  	INIT_DELAYED_WORK(&dev->imm_tq, imm_interrupt);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1222  
^1da177e4c3f41 Linus Torvalds  2005-04-16  1223  	err = -ENOMEM;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1224  	host = scsi_host_alloc(&imm_template, sizeof(imm_struct *));
^1da177e4c3f41 Linus Torvalds  2005-04-16  1225  	if (!host)
^1da177e4c3f41 Linus Torvalds  2005-04-16  1226  		goto out1;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1227  	host->io_port = pb->base;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1228  	host->n_io_port = ports;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1229  	host->dma_channel = -1;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1230  	host->unique_id = pb->number;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1231  	*(imm_struct **)&host->hostdata = dev;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1232  	dev->host = host;
a290dd57926cb0 Sudip Mukherjee 2016-01-05  1233  	if (!temp)
^1da177e4c3f41 Linus Torvalds  2005-04-16  1234  		list_add_tail(&dev->list, &imm_hosts);
a290dd57926cb0 Sudip Mukherjee 2016-01-05  1235  	else
a290dd57926cb0 Sudip Mukherjee 2016-01-05  1236  		list_add_tail(&dev->list, &temp->list);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1237  	err = scsi_add_host(host, NULL);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1238  	if (err)
^1da177e4c3f41 Linus Torvalds  2005-04-16  1239  		goto out2;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1240  	scsi_scan_host(host);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1241  	return 0;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1242  
^1da177e4c3f41 Linus Torvalds  2005-04-16  1243  out2:
^1da177e4c3f41 Linus Torvalds  2005-04-16  1244  	list_del_init(&dev->list);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1245  	scsi_host_put(host);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1246  out1:
^1da177e4c3f41 Linus Torvalds  2005-04-16  1247  	parport_unregister_device(dev->dev);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1248  out:
^1da177e4c3f41 Linus Torvalds  2005-04-16 @1249  	kfree(dev);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1250  	return err;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1251  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  1252  

:::::: The code at line 1249 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
