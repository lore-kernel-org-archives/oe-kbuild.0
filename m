Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D5F2EE60B
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Nov 2025 23:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764199054; cv=none; b=ngxpGYKI+IcF3U35il3M/ZHPOGTWfbC0AKlAx7szlhCVT5r/kofAO4prGbkM/aM1DX2OKduUrtPi5fNeHr/5PHgURNledS6d7K8FyJjFHJ9PG7LBw0aI99q0MIDdmrAN6l/7WakhE9J0IKNGuJWi0jTG0XI1hPt0JEsK9Aay4Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764199054; c=relaxed/simple;
	bh=OC2xWHM3G2RH5CwI9S7T0JmczNk0pPgpmzVB0D+Q/YA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H+mWHaMGSqRkGtKu5Wvkiw8uaD6Qj6LY0j3FUUPns/H1+RGRHe3EVQOduJUy5iQgrKFHK6PNPrbqRCEcsDdIiubgRftsQ6SvOd1HqQvxUk4lGhWaH71lhPGN26OkQBPEKRDPdf1khPkk0PkK2MZshGacq9s5L5j2oVfVKxkwxyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ba+9gwDx; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ba+9gwDx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764199052; x=1795735052;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=OC2xWHM3G2RH5CwI9S7T0JmczNk0pPgpmzVB0D+Q/YA=;
  b=Ba+9gwDxwvckrjjYWJx0ywOapIV+cXYIITyV/ItDcmFeHupkMWsyhc5q
   4DYsaaC8NIXb7GOeWrddPwV8rOx9Y/apzdemEWllYgZgTyY6+1hKg6M+f
   DXH2xUzQP2deuUcDvxKslGrvkytsy4U0JkhTNVJ+mZj8GWJ0dyxXk7mHa
   gZA7YjnA9QwBs3nK2LIJNd2riyxY01IZI49iRa/JPttrt+QLmcvbwNLCQ
   ozMlZOb3x260S0A2G6li59IJC4Uak3TwgaJdBZnr45pOCleH0qhckOhox
   pF7a0vcshAMVIz8J6Hc9MOgT1iV086jj4mTY5IAOK3967dW6HP/8Fba4m
   w==;
X-CSE-ConnectionGUID: WbW/1mmGTq2yXiVXVhIs0g==
X-CSE-MsgGUID: WqwzPDCEQUy3lv6ZPtEDyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="83853698"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="83853698"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 15:17:30 -0800
X-CSE-ConnectionGUID: aqWeTyvsQ3+4BgCIt+8mLg==
X-CSE-MsgGUID: BXlSLmQhSu+goGJUnzEvaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="193530287"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 26 Nov 2025 15:17:28 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOOlJ-000000003SH-24RG;
	Wed, 26 Nov 2025 23:17:25 +0000
Date: Thu, 27 Nov 2025 07:16:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [staging:staging-testing 18/27] drivers/gpib/common/gpib_os.c:816
 ibioctl() warn: inconsistent returns '&board->big_gpib_mutex'.
Message-ID: <202511270758.PUBaFZaS-lkp@intel.com>
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
CC: devel@driverdev.osuosl.org
TO: Dave Penkler <dpenkler@gmail.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

Hi Dave,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git staging-testing
head:   ea39cd0e42a2475fe273ac34579c98db732eefa4
commit: e6ab504633e4c06e35377ecf3c8cbc304de79858 [18/27] staging: gpib: Destage gpib
:::::: branch date: 10 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20251125 (https://download.01.org/0day-ci/archive/20251127/202511270758.PUBaFZaS-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511270758.PUBaFZaS-lkp@intel.com/

New smatch warnings:
drivers/gpib/common/gpib_os.c:816 ibioctl() warn: inconsistent returns '&board->big_gpib_mutex'.

Old smatch warnings:
drivers/gpib/common/gpib_os.c:1291 close_dev_ioctl() warn: potential spectre issue 'file_priv->descriptors' [r] (local cap)

vim +816 drivers/gpib/common/gpib_os.c

9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  610  
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  611  long ibioctl(struct file *filep, unsigned int cmd, unsigned long arg)
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  612  {
93c73ab1776fc06 drivers/staging/gpib/common/gpib_os.c Al Viro       2025-07-10  613  	unsigned int minor = iminor(file_inode(filep));
840459da1574dbf drivers/staging/gpib/common/gpib_os.c Michael Rubin 2025-03-19  614  	struct gpib_board *board;
c93577b9d4533af drivers/staging/gpib/common/gpib_os.c Michael Rubin 2025-04-08  615  	struct gpib_file_private *file_priv = filep->private_data;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  616  	long retval = -ENOTTY;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  617  
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  618  	if (minor >= GPIB_MAX_NUM_BOARDS) {
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  619  		pr_err("gpib: invalid minor number of device file\n");
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  620  		return -ENODEV;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  621  	}
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  622  	board = &board_array[minor];
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  623  
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  624  	if (mutex_lock_interruptible(&board->big_gpib_mutex))
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  625  		return -ERESTARTSYS;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  626  
141765729ea7c83 drivers/staging/gpib/common/gpib_os.c Dave Penkler  2025-02-14  627  	dev_dbg(board->gpib_dev, "ioctl %d, interface=%s, use=%d, onl=%d\n",
141765729ea7c83 drivers/staging/gpib/common/gpib_os.c Dave Penkler  2025-02-14  628  		cmd & 0xff,
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  629  		board->interface ? board->interface->name : "",
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  630  		board->use_count,
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  631  		board->online);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  632  
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  633  	switch (cmd) {
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  634  	case CFCBOARDTYPE:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  635  		retval = board_type_ioctl(file_priv, board, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  636  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  637  	case IBONL:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  638  		retval = online_ioctl(board, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  639  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  640  	default:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  641  		break;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  642  	}
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  643  	if (!board->interface) {
141765729ea7c83 drivers/staging/gpib/common/gpib_os.c Dave Penkler  2025-02-14  644  		dev_err(board->gpib_dev, "no gpib board configured\n");
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  645  		retval = -ENODEV;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  646  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  647  	}
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  648  	if (file_priv->got_module == 0)	{
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  649  		if (!try_module_get(board->provider_module)) {
141765729ea7c83 drivers/staging/gpib/common/gpib_os.c Dave Penkler  2025-02-14  650  			dev_err(board->gpib_dev, "try_module_get() failed\n");
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  651  			retval = -EIO;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  652  			goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  653  		}
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  654  		file_priv->got_module = 1;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  655  		board->use_count++;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  656  	}
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  657  	switch (cmd) {
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  658  	case CFCBASE:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  659  		retval = iobase_ioctl(&board->config, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  660  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  661  	case CFCIRQ:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  662  		retval = irq_ioctl(&board->config, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  663  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  664  	case CFCDMA:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  665  		retval = dma_ioctl(&board->config, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  666  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  667  	case IBAUTOSPOLL:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  668  		retval = autospoll_ioctl(board, file_priv, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  669  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  670  	case IBBOARD_INFO:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  671  		retval = board_info_ioctl(board, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  672  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  673  	case IBMUTEX:
79d1aa8cb769594 drivers/staging/gpib/common/gpib_os.c Paul Retourné 2025-04-11  674  		/*
79d1aa8cb769594 drivers/staging/gpib/common/gpib_os.c Paul Retourné 2025-04-11  675  		 * Need to unlock board->big_gpib_mutex before potentially locking board->user_mutex
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  676  		 * to maintain consistent locking order
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  677  		 */
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  678  		mutex_unlock(&board->big_gpib_mutex);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  679  		return mutex_ioctl(board, file_priv, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  680  	case IBPAD:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  681  		retval = pad_ioctl(board, file_priv, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  682  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  683  	case IBSAD:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  684  		retval = sad_ioctl(board, file_priv, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  685  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  686  	case IBSELECT_PCI:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  687  		retval = select_pci_ioctl(&board->config, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  688  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  689  	case IBSELECT_DEVICE_PATH:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  690  		retval = select_device_path_ioctl(&board->config, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  691  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  692  	default:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  693  		break;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  694  	}
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  695  
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  696  	if (!board->online) {
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  697  		retval = -EINVAL;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  698  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  699  	}
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  700  
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  701  	switch (cmd) {
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  702  	case IBEVENT:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  703  		retval = event_ioctl(board, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  704  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  705  	case IBCLOSEDEV:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  706  		retval = close_dev_ioctl(filep, board, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  707  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  708  	case IBOPENDEV:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  709  		retval = open_dev_ioctl(filep, board, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  710  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  711  	case IBSPOLL_BYTES:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  712  		retval = status_bytes_ioctl(board, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  713  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  714  	case IBWAIT:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  715  		retval = wait_ioctl(file_priv, board, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  716  		if (retval == -ERESTARTSYS)
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  717  			return retval;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  718  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  719  	case IBLINES:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  720  		retval = line_status_ioctl(board, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  721  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  722  	case IBLOC:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  723  		board->interface->return_to_local(board);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  724  		retval = 0;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  725  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  726  	default:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  727  		break;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  728  	}
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  729  
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  730  	spin_lock(&board->locking_pid_spinlock);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  731  	if (current->pid != board->locking_pid)	{
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  732  		spin_unlock(&board->locking_pid_spinlock);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  733  		retval = -EPERM;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  734  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  735  	}
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  736  	spin_unlock(&board->locking_pid_spinlock);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  737  
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  738  	switch (cmd) {
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  739  	case IB_T1_DELAY:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  740  		retval = t1_delay_ioctl(board, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  741  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  742  	case IBCAC:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  743  		retval = take_control_ioctl(board, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  744  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  745  	case IBCMD:
79d1aa8cb769594 drivers/staging/gpib/common/gpib_os.c Paul Retourné 2025-04-11  746  		/*
79d1aa8cb769594 drivers/staging/gpib/common/gpib_os.c Paul Retourné 2025-04-11  747  		 * IO ioctls can take a long time, we need to unlock board->big_gpib_mutex
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  748  		 * before we call them.
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  749  		 */
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  750  		mutex_unlock(&board->big_gpib_mutex);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  751  		return command_ioctl(file_priv, board, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  752  	case IBEOS:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  753  		retval = eos_ioctl(board, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  754  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  755  	case IBGTS:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  756  		retval = ibgts(board);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  757  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  758  	case IBPPC:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  759  		retval = ppc_ioctl(board, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  760  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  761  	case IBPP2_SET:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  762  		retval = set_local_ppoll_mode_ioctl(board, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  763  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  764  	case IBPP2_GET:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  765  		retval = get_local_ppoll_mode_ioctl(board, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  766  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  767  	case IBQUERY_BOARD_RSV:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  768  		retval = query_board_rsv_ioctl(board, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  769  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  770  	case IBRD:
79d1aa8cb769594 drivers/staging/gpib/common/gpib_os.c Paul Retourné 2025-04-11  771  		/*
79d1aa8cb769594 drivers/staging/gpib/common/gpib_os.c Paul Retourné 2025-04-11  772  		 * IO ioctls can take a long time, we need to unlock board->big_gpib_mutex
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  773  		 * before we call them.
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  774  		 */
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  775  		mutex_unlock(&board->big_gpib_mutex);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  776  		return read_ioctl(file_priv, board, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  777  	case IBRPP:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  778  		retval = parallel_poll_ioctl(board, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  779  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  780  	case IBRSC:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  781  		retval = request_system_control_ioctl(board, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  782  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  783  	case IBRSP:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  784  		retval = serial_poll_ioctl(board, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  785  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  786  	case IBRSV:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  787  		retval = request_service_ioctl(board, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  788  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  789  	case IBRSV2:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  790  		retval = request_service2_ioctl(board, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  791  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  792  	case IBSIC:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  793  		retval = interface_clear_ioctl(board, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  794  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  795  	case IBSRE:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  796  		retval = remote_enable_ioctl(board, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  797  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  798  	case IBTMO:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  799  		retval = timeout_ioctl(board, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  800  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  801  	case IBWRT:
79d1aa8cb769594 drivers/staging/gpib/common/gpib_os.c Paul Retourné 2025-04-11  802  		/*
79d1aa8cb769594 drivers/staging/gpib/common/gpib_os.c Paul Retourné 2025-04-11  803  		 * IO ioctls can take a long time, we need to unlock board->big_gpib_mutex
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  804  		 * before we call them.
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  805  		 */
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  806  		mutex_unlock(&board->big_gpib_mutex);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  807  		return write_ioctl(file_priv, board, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  808  	default:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  809  		retval = -ENOTTY;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  810  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  811  	}
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  812  
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  813  done:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  814  	mutex_unlock(&board->big_gpib_mutex);
a836d4ec8f83bbb drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-11-04  815  	dev_dbg(board->gpib_dev, "ioctl done status = 0x%lx\n", board->status);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18 @816  	return retval;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  817  }
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  818  

:::::: The code at line 816 was first introduced by commit
:::::: 9dde4559e93955ccc47d588f7fd051684d55c4e7 staging: gpib: Add GPIB common core driver

:::::: TO: Dave Penkler <dpenkler@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
