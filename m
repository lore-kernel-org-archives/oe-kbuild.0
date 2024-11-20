Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30737F9D9
	for <oe-kbuild@lists.linux.dev>; Wed, 20 Nov 2024 16:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732120696; cv=none; b=OsgN2x5vS6/0Lne2Yd9a+hzwC2jHHLVxfoTaKTTG17P+OzvIjEuwsmFG+APvnDcFSqboJ4fXIk+lSUiJj6FS5AgS4S0/QeHCeAe5U3qBCbRaVU0b3qECtI6TRbdlgHwJhOcp3x++Uo6yz2SqDTFvIYqXqfOiU29ezcL5x2HqApg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732120696; c=relaxed/simple;
	bh=vqKLUdRYTWcGEt/PcdrGdRsUdwxq+KOMVR73hJapOdE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Va6pX+4XrUtyyvKpyS+DrS3rYIKcr6hdWzbYM2WynWse7pUGsYgvq24Synk3LTRCoVc+qQKiHBSjEhwFFUm2pDeYRvqOG6OGkZow0Q9VT+N3vUh8nML5QUN3MZRx90qvbZj/nQe4BE7SfgFXXx6oXaL4MTrZQR+Gsd9p8q0+q1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZVwYjdO7; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZVwYjdO7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732120694; x=1763656694;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vqKLUdRYTWcGEt/PcdrGdRsUdwxq+KOMVR73hJapOdE=;
  b=ZVwYjdO7ps2zxzVmGoAvI7fyejVjwnIuwlkfVsdsdYpFIMbcMaTAsbzm
   B3AWv+IOHeLN7B8sblDrTujkwiaKXup8IHwXI+vPoTfAGPul4TIOmvhOW
   brwG80nlCP4MdFBQgk7U54bbKwpi+CrPlCsn6YAGPRxmIoJ+DTqb8nvx9
   ++LagLifTmJDP2BmSo5LDuui798cnS3F4/1kdD+O52aENu0EGydXKq/qe
   sJf8j3ms5GAtu73onlm/Kvt47cZC7zPyWG30I5dECgzRLGx7EnYxuiwlV
   o+z7OEoPv9I0hd1g+C4paBjbRERUD+/91m3VirXVid53hnocv+fpSMR06
   w==;
X-CSE-ConnectionGUID: hbzmhW5WRTeNaApVxCoAWg==
X-CSE-MsgGUID: 3dTXjAUyQOCS1UIwgItZjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="32301506"
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; 
   d="scan'208";a="32301506"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 08:38:13 -0800
X-CSE-ConnectionGUID: P1fJkvjTSoKweiISXh2WGg==
X-CSE-MsgGUID: Pzb2bsDeT2O1YyQWOWV0nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; 
   d="scan'208";a="94028342"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 Nov 2024 08:38:12 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDniU-000117-1L;
	Wed, 20 Nov 2024 16:38:10 +0000
Date: Thu, 21 Nov 2024 00:37:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/usb/usbip/stub_rx.c:610 stub_recv_cmd_submit() error:
 uninitialized symbol 'is_tweaked'.
Message-ID: <202411210008.ckNEUVPx-lkp@intel.com>
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
TO: Simon Holesch <simon@holesch.de>
CC: Hongren Zheng <i@zenithal.me>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bf9aa14fc523d2763fc9a10672a709224e8fcaf4
commit: 8b6b386f9aa936ed0c190446c71cf59d4a507690 usbip: Don't submit special requests twice
date:   6 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 6 months ago
config: parisc-randconfig-r072-20241118 (https://download.01.org/0day-ci/archive/20241121/202411210008.ckNEUVPx-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411210008.ckNEUVPx-lkp@intel.com/

New smatch warnings:
drivers/usb/usbip/stub_rx.c:610 stub_recv_cmd_submit() error: uninitialized symbol 'is_tweaked'.

Old smatch warnings:
drivers/usb/usbip/stub_rx.c:461 stub_recv_xbuff() error: uninitialized symbol 'ret'.

vim +/is_tweaked +610 drivers/usb/usbip/stub_rx.c

ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  463  
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  464  static void stub_recv_cmd_submit(struct stub_device *sdev,
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  465  				 struct usbip_header *pdu)
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  466  {
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  467  	struct stub_priv *priv;
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  468  	struct usbip_device *ud = &sdev->ud;
2d8f4595d1f275 drivers/staging/usbip/stub_rx.c Max Vozeler        2011-01-12  469  	struct usb_device *udev = sdev->udev;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  470  	struct scatterlist *sgl = NULL, *sg;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  471  	void *buffer = NULL;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  472  	unsigned long long buf_len;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  473  	int nents;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  474  	int num_urbs = 1;
c6688ef9f29762 drivers/usb/usbip/stub_rx.c     Shuah Khan         2017-12-07  475  	int pipe = get_pipe(sdev, pdu);
8f36b3b4e1b58d drivers/usb/usbip/stub_rx.c     Shuah Khan         2022-08-23  476  	int use_sg = pdu->u.cmd_submit.transfer_flags & USBIP_URB_DMA_MAP_SG;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  477  	int support_sg = 1;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  478  	int np = 0;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  479  	int ret, i;
8b6b386f9aa936 drivers/usb/usbip/stub_rx.c     Simon Holesch      2024-05-19  480  	int is_tweaked;
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  481  
635f545a7e8be7 drivers/usb/usbip/stub_rx.c     Shuah Khan         2017-12-07  482  	if (pipe == -1)
635f545a7e8be7 drivers/usb/usbip/stub_rx.c     Shuah Khan         2017-12-07  483  		return;
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  484  
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  485  	/*
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  486  	 * Smatch reported the error case where use_sg is true and buf_len is 0.
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  487  	 * In this case, It adds SDEV_EVENT_ERROR_MALLOC and stub_priv will be
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  488  	 * released by stub event handler and connection will be shut down.
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  489  	 */
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  490  	priv = stub_priv_alloc(sdev, pdu);
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  491  	if (!priv)
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  492  		return;
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  493  
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  494  	buf_len = (unsigned long long)pdu->u.cmd_submit.transfer_buffer_length;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  495  
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  496  	if (use_sg && !buf_len) {
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  497  		dev_err(&udev->dev, "sg buffer with zero length\n");
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  498  		goto err_malloc;
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  499  	}
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  500  
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  501  	/* allocate urb transfer buffer, if needed */
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  502  	if (buf_len) {
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  503  		if (use_sg) {
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  504  			sgl = sgl_alloc(buf_len, GFP_KERNEL, &nents);
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  505  			if (!sgl)
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  506  				goto err_malloc;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  507  
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  508  			/* Check if the server's HCD supports SG */
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  509  			if (!udev->bus->sg_tablesize) {
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  510  				/*
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  511  				 * If the server's HCD doesn't support SG, break
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  512  				 * a single SG request into several URBs and map
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  513  				 * each SG list entry to corresponding URB
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  514  				 * buffer. The previously allocated SG list is
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  515  				 * stored in priv->sgl (If the server's HCD
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  516  				 * support SG, SG list is stored only in
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  517  				 * urb->sg) and it is used as an indicator that
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  518  				 * the server split single SG request into
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  519  				 * several URBs. Later, priv->sgl is used by
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  520  				 * stub_complete() and stub_send_ret_submit() to
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  521  				 * reassemble the divied URBs.
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  522  				 */
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  523  				support_sg = 0;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  524  				num_urbs = nents;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  525  				priv->completed_urbs = 0;
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  526  				pdu->u.cmd_submit.transfer_flags &=
8f36b3b4e1b58d drivers/usb/usbip/stub_rx.c     Shuah Khan         2022-08-23  527  								~USBIP_URB_DMA_MAP_SG;
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  528  			}
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  529  		} else {
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  530  			buffer = kzalloc(buf_len, GFP_KERNEL);
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  531  			if (!buffer)
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  532  				goto err_malloc;
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  533  		}
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  534  	}
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  535  
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  536  	/* allocate urb array */
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  537  	priv->num_urbs = num_urbs;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  538  	priv->urbs = kmalloc_array(num_urbs, sizeof(*priv->urbs), GFP_KERNEL);
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  539  	if (!priv->urbs)
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  540  		goto err_urbs;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  541  
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  542  	/* setup a urb */
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  543  	if (support_sg) {
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  544  		if (usb_pipeisoc(pipe))
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  545  			np = pdu->u.cmd_submit.number_of_packets;
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  546  
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  547  		priv->urbs[0] = usb_alloc_urb(np, GFP_KERNEL);
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  548  		if (!priv->urbs[0])
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  549  			goto err_urb;
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  550  
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  551  		if (buf_len) {
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  552  			if (use_sg) {
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  553  				priv->urbs[0]->sg = sgl;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  554  				priv->urbs[0]->num_sgs = nents;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  555  				priv->urbs[0]->transfer_buffer = NULL;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  556  			} else {
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  557  				priv->urbs[0]->transfer_buffer = buffer;
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  558  			}
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  559  		}
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  560  
c7f0089931dfae drivers/staging/usbip/stub_rx.c Bart Westgeest     2012-10-10  561  		/* copy urb setup packet */
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  562  		priv->urbs[0]->setup_packet = kmemdup(&pdu->u.cmd_submit.setup,
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  563  					8, GFP_KERNEL);
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  564  		if (!priv->urbs[0]->setup_packet) {
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  565  			usbip_event_add(ud, SDEV_EVENT_ERROR_MALLOC);
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  566  			return;
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  567  		}
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  568  
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  569  		usbip_pack_pdu(pdu, priv->urbs[0], USBIP_CMD_SUBMIT, 0);
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  570  	} else {
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  571  		for_each_sg(sgl, sg, nents, i) {
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  572  			priv->urbs[i] = usb_alloc_urb(0, GFP_KERNEL);
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  573  			/* The URBs which is previously allocated will be freed
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  574  			 * in stub_device_cleanup_urbs() if error occurs.
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  575  			 */
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  576  			if (!priv->urbs[i])
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  577  				goto err_urb;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  578  
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  579  			usbip_pack_pdu(pdu, priv->urbs[i], USBIP_CMD_SUBMIT, 0);
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  580  			priv->urbs[i]->transfer_buffer = sg_virt(sg);
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  581  			priv->urbs[i]->transfer_buffer_length = sg->length;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  582  		}
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  583  		priv->sgl = sgl;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  584  	}
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  585  
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  586  	for (i = 0; i < num_urbs; i++) {
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  587  		/* set other members from the base header of pdu */
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  588  		priv->urbs[i]->context = (void *) priv;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  589  		priv->urbs[i]->dev = udev;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  590  		priv->urbs[i]->pipe = pipe;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  591  		priv->urbs[i]->complete = stub_complete;
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  592  
8b6b386f9aa936 drivers/usb/usbip/stub_rx.c     Simon Holesch      2024-05-19  593  		/*
8b6b386f9aa936 drivers/usb/usbip/stub_rx.c     Simon Holesch      2024-05-19  594  		 * all URBs belong to a single PDU, so a global is_tweaked flag is
8b6b386f9aa936 drivers/usb/usbip/stub_rx.c     Simon Holesch      2024-05-19  595  		 * enough
8b6b386f9aa936 drivers/usb/usbip/stub_rx.c     Simon Holesch      2024-05-19  596  		 */
8b6b386f9aa936 drivers/usb/usbip/stub_rx.c     Simon Holesch      2024-05-19  597  		is_tweaked = tweak_special_requests(priv->urbs[i]);
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  598  
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  599  		masking_bogus_flags(priv->urbs[i]);
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  600  	}
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  601  
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  602  	if (stub_recv_xbuff(ud, priv) < 0)
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  603  		return;
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  604  
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  605  	if (usbip_recv_iso(ud, priv->urbs[0]) < 0)
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  606  		return;
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  607  
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  608  	/* urb is now ready to submit */
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  609  	for (i = 0; i < priv->num_urbs; i++) {
8b6b386f9aa936 drivers/usb/usbip/stub_rx.c     Simon Holesch      2024-05-19 @610  		if (!is_tweaked) {
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  611  			ret = usb_submit_urb(priv->urbs[i], GFP_KERNEL);
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  612  
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  613  			if (ret == 0)
b8868e45c5f895 drivers/staging/usbip/stub_rx.c Brian G. Merrell   2009-07-21  614  				usbip_dbg_stub_rx("submit urb ok, seqnum %u\n",
b8868e45c5f895 drivers/staging/usbip/stub_rx.c Brian G. Merrell   2009-07-21  615  						pdu->base.seqnum);
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  616  			else {
8c7003a3b4b4af drivers/usb/usbip/stub_rx.c     Alexander Popov    2016-04-28  617  				dev_err(&udev->dev, "submit_urb error, %d\n", ret);
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  618  				usbip_dump_header(pdu);
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  619  				usbip_dump_urb(priv->urbs[i]);
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  620  
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  621  				/*
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  622  				 * Pessimistic.
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  623  				 * This connection will be discarded.
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  624  				 */
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  625  				usbip_event_add(ud, SDEV_EVENT_ERROR_SUBMIT);
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  626  				break;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  627  			}
8b6b386f9aa936 drivers/usb/usbip/stub_rx.c     Simon Holesch      2024-05-19  628  		} else {
8b6b386f9aa936 drivers/usb/usbip/stub_rx.c     Simon Holesch      2024-05-19  629  			/*
8b6b386f9aa936 drivers/usb/usbip/stub_rx.c     Simon Holesch      2024-05-19  630  			 * An identical URB was already submitted in
8b6b386f9aa936 drivers/usb/usbip/stub_rx.c     Simon Holesch      2024-05-19  631  			 * tweak_special_requests(). Skip submitting this URB to not
8b6b386f9aa936 drivers/usb/usbip/stub_rx.c     Simon Holesch      2024-05-19  632  			 * duplicate the request.
8b6b386f9aa936 drivers/usb/usbip/stub_rx.c     Simon Holesch      2024-05-19  633  			 */
8b6b386f9aa936 drivers/usb/usbip/stub_rx.c     Simon Holesch      2024-05-19  634  			priv->urbs[i]->status = 0;
8b6b386f9aa936 drivers/usb/usbip/stub_rx.c     Simon Holesch      2024-05-19  635  			stub_complete(priv->urbs[i]);
8b6b386f9aa936 drivers/usb/usbip/stub_rx.c     Simon Holesch      2024-05-19  636  		}
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  637  	}
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  638  
b8868e45c5f895 drivers/staging/usbip/stub_rx.c Brian G. Merrell   2009-07-21  639  	usbip_dbg_stub_rx("Leave\n");
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  640  	return;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  641  
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  642  err_urb:
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  643  	kfree(priv->urbs);
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  644  err_urbs:
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  645  	kfree(buffer);
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  646  	sgl_free(sgl);
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  647  err_malloc:
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  648  	usbip_event_add(ud, SDEV_EVENT_ERROR_MALLOC);
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  649  }
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  650  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
