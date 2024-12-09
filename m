Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68920156991
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 04:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733718014; cv=none; b=qA19aL/gyPJZh/AisSPc1P4FflDycYUUo/Ly24/vTkun6/T/qijJMgWRyHyCyMSTQwS1tNWC24jSqD/yjM4n05T6wrcWTjeRek0o3bfPvvFhrwzG1U0gexG3HOL6/r3kkvm/XfWuaoTHRB85UlTFXN8cL5/b9mhokVju7jOF3ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733718014; c=relaxed/simple;
	bh=mw3L9At59grsJAeFosZBSo6mj4WunvmMkcLz6hLuDxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cUMAn6xV9lU4WQlYu8xgynDga8HsuubEpj6Y/+dWRBAQ5N3/dmzcGRy96VsfzjY+iDgSVZcHWnDC565xQoOHiRP6HdF6JyD7LOMKndmOz+/QGz7FWWpyzBa1BzrMY6BWl11VnvCTqjwQvc8xhLo6U+6TxHOBBQMJH2MSo59Vlbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bSoSHwlj; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bSoSHwlj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733718013; x=1765254013;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mw3L9At59grsJAeFosZBSo6mj4WunvmMkcLz6hLuDxQ=;
  b=bSoSHwlj+IKXdeDGNOdSOaDDmXz1P99a2JakW/2td+g6qCHuIvuoSLfd
   0W/UoIu8xJari1ph9xIJvfFvp+Y3KoiBYKH2WisbkKGxMIaK3iIHei0mF
   w8oOmJyJnqtaxJ3rdqcUomvmzU1i952z6vuDKMZ1NMqeCS/xncoRpE+QR
   ae/yXw9c1t1iWmCfrzfmWr9J+zEgw2d8QNyij1BDaJULwf2YTWz5M472W
   pztsdm+OVU1ezl5su8spAJcAM5exeRyzZwHxyVlgjrRr6sQQdNZw53NHJ
   2jEtPPNAA4uJtc6Ctqc5eMuDrpkeYgHXChuWe0BBTvSSNo9OEF0P9b3wh
   w==;
X-CSE-ConnectionGUID: /vvoa3lwTiiW1lckQUQ/ow==
X-CSE-MsgGUID: tQaAq7qgSNWitxR4MvdxCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="33915901"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="33915901"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:20:10 -0800
X-CSE-ConnectionGUID: dGgS0D4cR0msfs0flRdnoQ==
X-CSE-MsgGUID: OcXhrF0cTlql1elJMHP6+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="95300259"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 Dec 2024 20:20:08 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVFe-0003pl-2k;
	Mon, 09 Dec 2024 04:20:06 +0000
Date: Mon, 9 Dec 2024 12:19:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/staging/gpib/common/gpib_os.c:871 ibioctl() warn:
 inconsistent returns '&board->big_gpib_mutex'.
Message-ID: <202412072053.WNj69og0-lkp@intel.com>
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
TO: Dave Penkler <dpenkler@gmail.com>

Hi Dave,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b5f217084ab3ddd4bdd03cd437f8e3b7e2d1f5b6
commit: 165e8cc3cfec9ef51f3376b0d49b115294f34f3b staging: gpib: Add KBUILD files for GPIB drivers
date:   8 weeks ago
:::::: branch date: 14 hours ago
:::::: commit date: 8 weeks ago
config: riscv-randconfig-r073-20241207 (https://download.01.org/0day-ci/archive/20241207/202412072053.WNj69og0-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412072053.WNj69og0-lkp@intel.com/

New smatch warnings:
drivers/staging/gpib/common/gpib_os.c:871 ibioctl() warn: inconsistent returns '&board->big_gpib_mutex'.

Old smatch warnings:
drivers/staging/gpib/common/gpib_os.c:889 board_type_ioctl() warn: maybe return -EFAULT instead of the bytes remaining?
drivers/staging/gpib/common/gpib_os.c:1340 close_dev_ioctl() warn: potential spectre issue 'file_priv->descriptors' [r] (local cap)

vim +871 drivers/staging/gpib/common/gpib_os.c

9dde4559e93955 Dave Penkler 2024-09-18  665  
9dde4559e93955 Dave Penkler 2024-09-18  666  long ibioctl(struct file *filep, unsigned int cmd, unsigned long arg)
9dde4559e93955 Dave Penkler 2024-09-18  667  {
9dde4559e93955 Dave Penkler 2024-09-18  668  	unsigned int minor = iminor(filep->f_path.dentry->d_inode);
9dde4559e93955 Dave Penkler 2024-09-18  669  	gpib_board_t *board;
9dde4559e93955 Dave Penkler 2024-09-18  670  	gpib_file_private_t *file_priv = filep->private_data;
9dde4559e93955 Dave Penkler 2024-09-18  671  	long retval = -ENOTTY;
9dde4559e93955 Dave Penkler 2024-09-18  672  
9dde4559e93955 Dave Penkler 2024-09-18  673  	if (minor >= GPIB_MAX_NUM_BOARDS) {
9dde4559e93955 Dave Penkler 2024-09-18  674  		pr_err("gpib: invalid minor number of device file\n");
9dde4559e93955 Dave Penkler 2024-09-18  675  		return -ENODEV;
9dde4559e93955 Dave Penkler 2024-09-18  676  	}
9dde4559e93955 Dave Penkler 2024-09-18  677  	board = &board_array[minor];
9dde4559e93955 Dave Penkler 2024-09-18  678  
9dde4559e93955 Dave Penkler 2024-09-18  679  	if (mutex_lock_interruptible(&board->big_gpib_mutex))
9dde4559e93955 Dave Penkler 2024-09-18  680  		return -ERESTARTSYS;
9dde4559e93955 Dave Penkler 2024-09-18  681  
9dde4559e93955 Dave Penkler 2024-09-18  682  	GPIB_DPRINTK("pid %i, minor %i, ioctl %d, interface=%s, use=%d, onl=%d\n",
9dde4559e93955 Dave Penkler 2024-09-18  683  		     current->pid, minor, cmd & 0xff,
9dde4559e93955 Dave Penkler 2024-09-18  684  		     board->interface ? board->interface->name : "",
9dde4559e93955 Dave Penkler 2024-09-18  685  		     board->use_count,
9dde4559e93955 Dave Penkler 2024-09-18  686  		     board->online);
9dde4559e93955 Dave Penkler 2024-09-18  687  
9dde4559e93955 Dave Penkler 2024-09-18  688  	switch (cmd) {
9dde4559e93955 Dave Penkler 2024-09-18  689  	case CFCBOARDTYPE:
9dde4559e93955 Dave Penkler 2024-09-18  690  		retval = board_type_ioctl(file_priv, board, arg);
9dde4559e93955 Dave Penkler 2024-09-18  691  		goto done;
9dde4559e93955 Dave Penkler 2024-09-18  692  	case IBONL:
9dde4559e93955 Dave Penkler 2024-09-18  693  		retval = online_ioctl(board, arg);
9dde4559e93955 Dave Penkler 2024-09-18  694  		goto done;
9dde4559e93955 Dave Penkler 2024-09-18  695  	default:
9dde4559e93955 Dave Penkler 2024-09-18  696  		break;
9dde4559e93955 Dave Penkler 2024-09-18  697  	}
9dde4559e93955 Dave Penkler 2024-09-18  698  	if (!board->interface) {
9dde4559e93955 Dave Penkler 2024-09-18  699  		pr_err("gpib: no gpib board configured on /dev/gpib%i\n", minor);
9dde4559e93955 Dave Penkler 2024-09-18  700  		retval = -ENODEV;
9dde4559e93955 Dave Penkler 2024-09-18  701  		goto done;
9dde4559e93955 Dave Penkler 2024-09-18  702  	}
9dde4559e93955 Dave Penkler 2024-09-18  703  	if (file_priv->got_module == 0)	{
9dde4559e93955 Dave Penkler 2024-09-18  704  		if (!try_module_get(board->provider_module)) {
9dde4559e93955 Dave Penkler 2024-09-18  705  			pr_err("gpib: try_module_get() failed\n");
9dde4559e93955 Dave Penkler 2024-09-18  706  			retval = -EIO;
9dde4559e93955 Dave Penkler 2024-09-18  707  			goto done;
9dde4559e93955 Dave Penkler 2024-09-18  708  		}
9dde4559e93955 Dave Penkler 2024-09-18  709  		file_priv->got_module = 1;
9dde4559e93955 Dave Penkler 2024-09-18  710  		board->use_count++;
9dde4559e93955 Dave Penkler 2024-09-18  711  	}
9dde4559e93955 Dave Penkler 2024-09-18  712  	switch (cmd) {
9dde4559e93955 Dave Penkler 2024-09-18  713  	case CFCBASE:
9dde4559e93955 Dave Penkler 2024-09-18  714  		retval = iobase_ioctl(&board->config, arg);
9dde4559e93955 Dave Penkler 2024-09-18  715  		goto done;
9dde4559e93955 Dave Penkler 2024-09-18  716  	case CFCIRQ:
9dde4559e93955 Dave Penkler 2024-09-18  717  		retval = irq_ioctl(&board->config, arg);
9dde4559e93955 Dave Penkler 2024-09-18  718  		goto done;
9dde4559e93955 Dave Penkler 2024-09-18  719  	case CFCDMA:
9dde4559e93955 Dave Penkler 2024-09-18  720  		retval = dma_ioctl(&board->config, arg);
9dde4559e93955 Dave Penkler 2024-09-18  721  		goto done;
9dde4559e93955 Dave Penkler 2024-09-18  722  	case IBAUTOSPOLL:
9dde4559e93955 Dave Penkler 2024-09-18  723  		retval = autospoll_ioctl(board, file_priv, arg);
9dde4559e93955 Dave Penkler 2024-09-18  724  		goto done;
9dde4559e93955 Dave Penkler 2024-09-18  725  	case IBBOARD_INFO:
9dde4559e93955 Dave Penkler 2024-09-18  726  		retval = board_info_ioctl(board, arg);
9dde4559e93955 Dave Penkler 2024-09-18  727  		goto done;
9dde4559e93955 Dave Penkler 2024-09-18  728  	case IBMUTEX:
9dde4559e93955 Dave Penkler 2024-09-18  729  		/* Need to unlock board->big_gpib_mutex before potentially locking board->user_mutex
9dde4559e93955 Dave Penkler 2024-09-18  730  		 *  to maintain consistent locking order
9dde4559e93955 Dave Penkler 2024-09-18  731  		 */
9dde4559e93955 Dave Penkler 2024-09-18  732  		mutex_unlock(&board->big_gpib_mutex);
9dde4559e93955 Dave Penkler 2024-09-18  733  		return mutex_ioctl(board, file_priv, arg);
9dde4559e93955 Dave Penkler 2024-09-18  734  	case IBPAD:
9dde4559e93955 Dave Penkler 2024-09-18  735  		retval = pad_ioctl(board, file_priv, arg);
9dde4559e93955 Dave Penkler 2024-09-18  736  		goto done;
9dde4559e93955 Dave Penkler 2024-09-18  737  	case IBSAD:
9dde4559e93955 Dave Penkler 2024-09-18  738  		retval = sad_ioctl(board, file_priv, arg);
9dde4559e93955 Dave Penkler 2024-09-18  739  		goto done;
9dde4559e93955 Dave Penkler 2024-09-18  740  	case IBSELECT_PCI:
9dde4559e93955 Dave Penkler 2024-09-18  741  		retval = select_pci_ioctl(&board->config, arg);
9dde4559e93955 Dave Penkler 2024-09-18  742  		goto done;
9dde4559e93955 Dave Penkler 2024-09-18  743  	case IBSELECT_DEVICE_PATH:
9dde4559e93955 Dave Penkler 2024-09-18  744  		retval = select_device_path_ioctl(&board->config, arg);
9dde4559e93955 Dave Penkler 2024-09-18  745  		goto done;
9dde4559e93955 Dave Penkler 2024-09-18  746  	default:
9dde4559e93955 Dave Penkler 2024-09-18  747  		break;
9dde4559e93955 Dave Penkler 2024-09-18  748  	}
9dde4559e93955 Dave Penkler 2024-09-18  749  
9dde4559e93955 Dave Penkler 2024-09-18  750  	if (!board->online) {
9dde4559e93955 Dave Penkler 2024-09-18  751  		pr_err("gpib: ioctl %i invalid for offline board\n",
9dde4559e93955 Dave Penkler 2024-09-18  752  		       cmd & 0xff);
9dde4559e93955 Dave Penkler 2024-09-18  753  		retval = -EINVAL;
9dde4559e93955 Dave Penkler 2024-09-18  754  		goto done;
9dde4559e93955 Dave Penkler 2024-09-18  755  	}
9dde4559e93955 Dave Penkler 2024-09-18  756  
9dde4559e93955 Dave Penkler 2024-09-18  757  	switch (cmd) {
9dde4559e93955 Dave Penkler 2024-09-18  758  	case IBEVENT:
9dde4559e93955 Dave Penkler 2024-09-18  759  		retval = event_ioctl(board, arg);
9dde4559e93955 Dave Penkler 2024-09-18  760  		goto done;
9dde4559e93955 Dave Penkler 2024-09-18  761  	case IBCLOSEDEV:
9dde4559e93955 Dave Penkler 2024-09-18  762  		retval = close_dev_ioctl(filep, board, arg);
9dde4559e93955 Dave Penkler 2024-09-18  763  		goto done;
9dde4559e93955 Dave Penkler 2024-09-18  764  	case IBOPENDEV:
9dde4559e93955 Dave Penkler 2024-09-18  765  		retval = open_dev_ioctl(filep, board, arg);
9dde4559e93955 Dave Penkler 2024-09-18  766  		goto done;
9dde4559e93955 Dave Penkler 2024-09-18  767  	case IBSPOLL_BYTES:
9dde4559e93955 Dave Penkler 2024-09-18  768  		retval = status_bytes_ioctl(board, arg);
9dde4559e93955 Dave Penkler 2024-09-18  769  		goto done;
9dde4559e93955 Dave Penkler 2024-09-18  770  	case IBWAIT:
9dde4559e93955 Dave Penkler 2024-09-18  771  		retval = wait_ioctl(file_priv, board, arg);
9dde4559e93955 Dave Penkler 2024-09-18  772  		if (retval == -ERESTARTSYS)
9dde4559e93955 Dave Penkler 2024-09-18  773  			return retval;
9dde4559e93955 Dave Penkler 2024-09-18  774  		goto done;
9dde4559e93955 Dave Penkler 2024-09-18  775  	case IBLINES:
9dde4559e93955 Dave Penkler 2024-09-18  776  		retval = line_status_ioctl(board, arg);
9dde4559e93955 Dave Penkler 2024-09-18  777  		goto done;
9dde4559e93955 Dave Penkler 2024-09-18  778  	case IBLOC:
9dde4559e93955 Dave Penkler 2024-09-18  779  		board->interface->return_to_local(board);
9dde4559e93955 Dave Penkler 2024-09-18  780  		retval = 0;
9dde4559e93955 Dave Penkler 2024-09-18  781  		goto done;
9dde4559e93955 Dave Penkler 2024-09-18  782  	default:
9dde4559e93955 Dave Penkler 2024-09-18  783  		break;
9dde4559e93955 Dave Penkler 2024-09-18  784  	}
9dde4559e93955 Dave Penkler 2024-09-18  785  
9dde4559e93955 Dave Penkler 2024-09-18  786  	spin_lock(&board->locking_pid_spinlock);
9dde4559e93955 Dave Penkler 2024-09-18  787  	if (current->pid != board->locking_pid)	{
9dde4559e93955 Dave Penkler 2024-09-18  788  		spin_unlock(&board->locking_pid_spinlock);
9dde4559e93955 Dave Penkler 2024-09-18  789  		pr_err("gpib: need to hold board lock to perform ioctl %i\n",
9dde4559e93955 Dave Penkler 2024-09-18  790  		       cmd & 0xff);
9dde4559e93955 Dave Penkler 2024-09-18  791  		retval = -EPERM;
9dde4559e93955 Dave Penkler 2024-09-18  792  		goto done;
9dde4559e93955 Dave Penkler 2024-09-18  793  	}
9dde4559e93955 Dave Penkler 2024-09-18  794  	spin_unlock(&board->locking_pid_spinlock);
9dde4559e93955 Dave Penkler 2024-09-18  795  
9dde4559e93955 Dave Penkler 2024-09-18  796  	switch (cmd) {
9dde4559e93955 Dave Penkler 2024-09-18  797  	case IB_T1_DELAY:
9dde4559e93955 Dave Penkler 2024-09-18  798  		retval = t1_delay_ioctl(board, arg);
9dde4559e93955 Dave Penkler 2024-09-18  799  		goto done;
9dde4559e93955 Dave Penkler 2024-09-18  800  	case IBCAC:
9dde4559e93955 Dave Penkler 2024-09-18  801  		retval = take_control_ioctl(board, arg);
9dde4559e93955 Dave Penkler 2024-09-18  802  		goto done;
9dde4559e93955 Dave Penkler 2024-09-18  803  	case IBCMD:
9dde4559e93955 Dave Penkler 2024-09-18  804  		/* IO ioctls can take a long time, we need to unlock board->big_gpib_mutex
9dde4559e93955 Dave Penkler 2024-09-18  805  		 *  before we call them.
9dde4559e93955 Dave Penkler 2024-09-18  806  		 */
9dde4559e93955 Dave Penkler 2024-09-18  807  		mutex_unlock(&board->big_gpib_mutex);
9dde4559e93955 Dave Penkler 2024-09-18  808  		return command_ioctl(file_priv, board, arg);
9dde4559e93955 Dave Penkler 2024-09-18  809  	case IBEOS:
9dde4559e93955 Dave Penkler 2024-09-18  810  		retval = eos_ioctl(board, arg);
9dde4559e93955 Dave Penkler 2024-09-18  811  		goto done;
9dde4559e93955 Dave Penkler 2024-09-18  812  	case IBGTS:
9dde4559e93955 Dave Penkler 2024-09-18  813  		retval = ibgts(board);
9dde4559e93955 Dave Penkler 2024-09-18  814  		goto done;
9dde4559e93955 Dave Penkler 2024-09-18  815  	case IBPPC:
9dde4559e93955 Dave Penkler 2024-09-18  816  		retval = ppc_ioctl(board, arg);
9dde4559e93955 Dave Penkler 2024-09-18  817  		goto done;
9dde4559e93955 Dave Penkler 2024-09-18  818  	case IBPP2_SET:
9dde4559e93955 Dave Penkler 2024-09-18  819  		retval = set_local_ppoll_mode_ioctl(board, arg);
9dde4559e93955 Dave Penkler 2024-09-18  820  		goto done;
9dde4559e93955 Dave Penkler 2024-09-18  821  	case IBPP2_GET:
9dde4559e93955 Dave Penkler 2024-09-18  822  		retval = get_local_ppoll_mode_ioctl(board, arg);
9dde4559e93955 Dave Penkler 2024-09-18  823  		goto done;
9dde4559e93955 Dave Penkler 2024-09-18  824  	case IBQUERY_BOARD_RSV:
9dde4559e93955 Dave Penkler 2024-09-18  825  		retval = query_board_rsv_ioctl(board, arg);
9dde4559e93955 Dave Penkler 2024-09-18  826  		goto done;
9dde4559e93955 Dave Penkler 2024-09-18  827  	case IBRD:
9dde4559e93955 Dave Penkler 2024-09-18  828  		/* IO ioctls can take a long time, we need to unlock board->big_gpib_mutex
9dde4559e93955 Dave Penkler 2024-09-18  829  		 *  before we call them.
9dde4559e93955 Dave Penkler 2024-09-18  830  		 */
9dde4559e93955 Dave Penkler 2024-09-18  831  		mutex_unlock(&board->big_gpib_mutex);
9dde4559e93955 Dave Penkler 2024-09-18  832  		return read_ioctl(file_priv, board, arg);
9dde4559e93955 Dave Penkler 2024-09-18  833  	case IBRPP:
9dde4559e93955 Dave Penkler 2024-09-18  834  		retval = parallel_poll_ioctl(board, arg);
9dde4559e93955 Dave Penkler 2024-09-18  835  		goto done;
9dde4559e93955 Dave Penkler 2024-09-18  836  	case IBRSC:
9dde4559e93955 Dave Penkler 2024-09-18  837  		retval = request_system_control_ioctl(board, arg);
9dde4559e93955 Dave Penkler 2024-09-18  838  		goto done;
9dde4559e93955 Dave Penkler 2024-09-18  839  	case IBRSP:
9dde4559e93955 Dave Penkler 2024-09-18  840  		retval = serial_poll_ioctl(board, arg);
9dde4559e93955 Dave Penkler 2024-09-18  841  		goto done;
9dde4559e93955 Dave Penkler 2024-09-18  842  	case IBRSV:
9dde4559e93955 Dave Penkler 2024-09-18  843  		retval = request_service_ioctl(board, arg);
9dde4559e93955 Dave Penkler 2024-09-18  844  		goto done;
9dde4559e93955 Dave Penkler 2024-09-18  845  	case IBRSV2:
9dde4559e93955 Dave Penkler 2024-09-18  846  		retval = request_service2_ioctl(board, arg);
9dde4559e93955 Dave Penkler 2024-09-18  847  		goto done;
9dde4559e93955 Dave Penkler 2024-09-18  848  	case IBSIC:
9dde4559e93955 Dave Penkler 2024-09-18  849  		retval = interface_clear_ioctl(board, arg);
9dde4559e93955 Dave Penkler 2024-09-18  850  		goto done;
9dde4559e93955 Dave Penkler 2024-09-18  851  	case IBSRE:
9dde4559e93955 Dave Penkler 2024-09-18  852  		retval = remote_enable_ioctl(board, arg);
9dde4559e93955 Dave Penkler 2024-09-18  853  		goto done;
9dde4559e93955 Dave Penkler 2024-09-18  854  	case IBTMO:
9dde4559e93955 Dave Penkler 2024-09-18  855  		retval = timeout_ioctl(board, arg);
9dde4559e93955 Dave Penkler 2024-09-18  856  		goto done;
9dde4559e93955 Dave Penkler 2024-09-18  857  	case IBWRT:
9dde4559e93955 Dave Penkler 2024-09-18  858  		/* IO ioctls can take a long time, we need to unlock board->big_gpib_mutex
9dde4559e93955 Dave Penkler 2024-09-18  859  		 *  before we call them.
9dde4559e93955 Dave Penkler 2024-09-18  860  		 */
9dde4559e93955 Dave Penkler 2024-09-18  861  		mutex_unlock(&board->big_gpib_mutex);
9dde4559e93955 Dave Penkler 2024-09-18  862  		return write_ioctl(file_priv, board, arg);
9dde4559e93955 Dave Penkler 2024-09-18  863  	default:
9dde4559e93955 Dave Penkler 2024-09-18  864  		retval = -ENOTTY;
9dde4559e93955 Dave Penkler 2024-09-18  865  		goto done;
9dde4559e93955 Dave Penkler 2024-09-18  866  	}
9dde4559e93955 Dave Penkler 2024-09-18  867  
9dde4559e93955 Dave Penkler 2024-09-18  868  done:
9dde4559e93955 Dave Penkler 2024-09-18  869  	mutex_unlock(&board->big_gpib_mutex);
9dde4559e93955 Dave Penkler 2024-09-18  870  	GPIB_DPRINTK("ioctl done status = 0x%lx\n", board->status);
9dde4559e93955 Dave Penkler 2024-09-18 @871  	return retval;
9dde4559e93955 Dave Penkler 2024-09-18  872  }
9dde4559e93955 Dave Penkler 2024-09-18  873  

:::::: The code at line 871 was first introduced by commit
:::::: 9dde4559e93955ccc47d588f7fd051684d55c4e7 staging: gpib: Add GPIB common core driver

:::::: TO: Dave Penkler <dpenkler@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
