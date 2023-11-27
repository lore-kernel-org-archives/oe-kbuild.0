Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B5E31A7E
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Nov 2023 15:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EwoUzrcE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701098611; x=1732634611;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qc8f36O4cNMCcT3MVLKcPMkAtVqPiy09yT0Y1oxn+jA=;
  b=EwoUzrcEGdN4aVDEdo8CRCDavuTuIfkK8AgKmaLlo6q0KPRahDEBwm3k
   UVLGKI8pwoQYWaAbH58uWezRYYbKNNE7KDZh3gMGP7MbhqlEBrjmP7OFL
   QUPy29+yj39FCwWkUXPh/aibVDr0AnvmtMQL4lKL+UfxLYx15UMrsAF2t
   QNgepFN93mKb5XOp4sKm6ZIVMoVk1QgAOlY9Zh7DpWc7fF7nhd8dEzgZu
   5YSdBaKLMzkav73U5OrqrrTTVJOLSNMQjP4xEgMXJ+TJUxOFYtXG3Fv+2
   1YVrlUMtzto9QIYVTl8Q8fvfdR4aCPtKimMOMLXHSKMJx8qxKJ9e4QMcn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="5976908"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="5976908"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 07:23:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="744596171"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="744596171"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 27 Nov 2023 07:23:29 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7dSI-0006MY-28;
	Mon, 27 Nov 2023 15:23:26 +0000
Date: Mon, 27 Nov 2023 23:21:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] usbip: Don't submit special requests twice
Message-ID: <202311272056.1YVqFKFb-lkp@intel.com>
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
In-Reply-To: <20231126234839.52434-1-simon@holesch.de>
References: <20231126234839.52434-1-simon@holesch.de>
TO: Simon Holesch <simon@holesch.de>
TO: Valentina Manea <valentina.manea.m@gmail.com>
TO: Shuah Khan <skhan@linuxfoundation.org>
TO: Hongren Zheng <i@zenithal.me>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Simon Holesch <simon@holesch.de>
CC: linux-usb@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Simon,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus linus/master v6.7-rc3 next-20231127]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Simon-Holesch/usbip-Don-t-submit-special-requests-twice/20231127-075707
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20231126234839.52434-1-simon%40holesch.de
patch subject: [PATCH] usbip: Don't submit special requests twice
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: x86_64-randconfig-161-20231127 (https://download.01.org/0day-ci/archive/20231127/202311272056.1YVqFKFb-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231127/202311272056.1YVqFKFb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311272056.1YVqFKFb-lkp@intel.com/

New smatch warnings:
drivers/usb/usbip/stub_rx.c:601 stub_recv_cmd_submit() error: uninitialized symbol 'is_tweaked'.

Old smatch warnings:
drivers/usb/usbip/stub_rx.c:456 stub_recv_xbuff() error: uninitialized symbol 'ret'.

vim +/is_tweaked +601 drivers/usb/usbip/stub_rx.c

ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  458  
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  459  static void stub_recv_cmd_submit(struct stub_device *sdev,
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  460  				 struct usbip_header *pdu)
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  461  {
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  462  	struct stub_priv *priv;
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  463  	struct usbip_device *ud = &sdev->ud;
2d8f4595d1f275 drivers/staging/usbip/stub_rx.c Max Vozeler        2011-01-12  464  	struct usb_device *udev = sdev->udev;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  465  	struct scatterlist *sgl = NULL, *sg;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  466  	void *buffer = NULL;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  467  	unsigned long long buf_len;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  468  	int nents;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  469  	int num_urbs = 1;
c6688ef9f29762 drivers/usb/usbip/stub_rx.c     Shuah Khan         2017-12-07  470  	int pipe = get_pipe(sdev, pdu);
8f36b3b4e1b58d drivers/usb/usbip/stub_rx.c     Shuah Khan         2022-08-23  471  	int use_sg = pdu->u.cmd_submit.transfer_flags & USBIP_URB_DMA_MAP_SG;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  472  	int support_sg = 1;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  473  	int np = 0;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  474  	int ret, i;
5443a56d963af4 drivers/usb/usbip/stub_rx.c     Simon Holesch      2023-11-27  475  	int is_tweaked;
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  476  
635f545a7e8be7 drivers/usb/usbip/stub_rx.c     Shuah Khan         2017-12-07  477  	if (pipe == -1)
635f545a7e8be7 drivers/usb/usbip/stub_rx.c     Shuah Khan         2017-12-07  478  		return;
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  479  
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  480  	/*
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  481  	 * Smatch reported the error case where use_sg is true and buf_len is 0.
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  482  	 * In this case, It adds SDEV_EVENT_ERROR_MALLOC and stub_priv will be
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  483  	 * released by stub event handler and connection will be shut down.
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  484  	 */
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  485  	priv = stub_priv_alloc(sdev, pdu);
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  486  	if (!priv)
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  487  		return;
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  488  
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  489  	buf_len = (unsigned long long)pdu->u.cmd_submit.transfer_buffer_length;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  490  
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  491  	if (use_sg && !buf_len) {
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  492  		dev_err(&udev->dev, "sg buffer with zero length\n");
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  493  		goto err_malloc;
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  494  	}
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  495  
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  496  	/* allocate urb transfer buffer, if needed */
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  497  	if (buf_len) {
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  498  		if (use_sg) {
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  499  			sgl = sgl_alloc(buf_len, GFP_KERNEL, &nents);
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  500  			if (!sgl)
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  501  				goto err_malloc;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  502  
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  503  			/* Check if the server's HCD supports SG */
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  504  			if (!udev->bus->sg_tablesize) {
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  505  				/*
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  506  				 * If the server's HCD doesn't support SG, break
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  507  				 * a single SG request into several URBs and map
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  508  				 * each SG list entry to corresponding URB
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  509  				 * buffer. The previously allocated SG list is
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  510  				 * stored in priv->sgl (If the server's HCD
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  511  				 * support SG, SG list is stored only in
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  512  				 * urb->sg) and it is used as an indicator that
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  513  				 * the server split single SG request into
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  514  				 * several URBs. Later, priv->sgl is used by
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  515  				 * stub_complete() and stub_send_ret_submit() to
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  516  				 * reassemble the divied URBs.
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  517  				 */
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  518  				support_sg = 0;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  519  				num_urbs = nents;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  520  				priv->completed_urbs = 0;
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  521  				pdu->u.cmd_submit.transfer_flags &=
8f36b3b4e1b58d drivers/usb/usbip/stub_rx.c     Shuah Khan         2022-08-23  522  								~USBIP_URB_DMA_MAP_SG;
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  523  			}
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  524  		} else {
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  525  			buffer = kzalloc(buf_len, GFP_KERNEL);
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  526  			if (!buffer)
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  527  				goto err_malloc;
2a9125317b247f drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-11-11  528  		}
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  529  	}
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  530  
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  531  	/* allocate urb array */
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  532  	priv->num_urbs = num_urbs;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  533  	priv->urbs = kmalloc_array(num_urbs, sizeof(*priv->urbs), GFP_KERNEL);
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  534  	if (!priv->urbs)
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  535  		goto err_urbs;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  536  
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  537  	/* setup a urb */
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  538  	if (support_sg) {
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  539  		if (usb_pipeisoc(pipe))
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  540  			np = pdu->u.cmd_submit.number_of_packets;
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  541  
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  542  		priv->urbs[0] = usb_alloc_urb(np, GFP_KERNEL);
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  543  		if (!priv->urbs[0])
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  544  			goto err_urb;
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  545  
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  546  		if (buf_len) {
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  547  			if (use_sg) {
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  548  				priv->urbs[0]->sg = sgl;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  549  				priv->urbs[0]->num_sgs = nents;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  550  				priv->urbs[0]->transfer_buffer = NULL;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  551  			} else {
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  552  				priv->urbs[0]->transfer_buffer = buffer;
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  553  			}
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  554  		}
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  555  
c7f0089931dfae drivers/staging/usbip/stub_rx.c Bart Westgeest     2012-10-10  556  		/* copy urb setup packet */
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  557  		priv->urbs[0]->setup_packet = kmemdup(&pdu->u.cmd_submit.setup,
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  558  					8, GFP_KERNEL);
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  559  		if (!priv->urbs[0]->setup_packet) {
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  560  			usbip_event_add(ud, SDEV_EVENT_ERROR_MALLOC);
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  561  			return;
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  562  		}
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  563  
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  564  		usbip_pack_pdu(pdu, priv->urbs[0], USBIP_CMD_SUBMIT, 0);
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  565  	} else {
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  566  		for_each_sg(sgl, sg, nents, i) {
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  567  			priv->urbs[i] = usb_alloc_urb(0, GFP_KERNEL);
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  568  			/* The URBs which is previously allocated will be freed
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  569  			 * in stub_device_cleanup_urbs() if error occurs.
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  570  			 */
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  571  			if (!priv->urbs[i])
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  572  				goto err_urb;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  573  
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  574  			usbip_pack_pdu(pdu, priv->urbs[i], USBIP_CMD_SUBMIT, 0);
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  575  			priv->urbs[i]->transfer_buffer = sg_virt(sg);
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  576  			priv->urbs[i]->transfer_buffer_length = sg->length;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  577  		}
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  578  		priv->sgl = sgl;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  579  	}
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  580  
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  581  	for (i = 0; i < num_urbs; i++) {
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  582  		/* set other members from the base header of pdu */
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  583  		priv->urbs[i]->context = (void *) priv;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  584  		priv->urbs[i]->dev = udev;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  585  		priv->urbs[i]->pipe = pipe;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  586  		priv->urbs[i]->complete = stub_complete;
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  587  
5443a56d963af4 drivers/usb/usbip/stub_rx.c     Simon Holesch      2023-11-27  588  		is_tweaked = tweak_special_requests(priv->urbs[i]);
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  589  
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  590  		masking_bogus_flags(priv->urbs[i]);
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  591  	}
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  592  
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  593  	if (stub_recv_xbuff(ud, priv) < 0)
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  594  		return;
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  595  
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  596  	if (usbip_recv_iso(ud, priv->urbs[0]) < 0)
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  597  		return;
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  598  
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  599  	/* urb is now ready to submit */
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  600  	for (i = 0; i < priv->num_urbs; i++) {
5443a56d963af4 drivers/usb/usbip/stub_rx.c     Simon Holesch      2023-11-27 @601  		if (!is_tweaked) {
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  602  			ret = usb_submit_urb(priv->urbs[i], GFP_KERNEL);
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  603  
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  604  			if (ret == 0)
b8868e45c5f895 drivers/staging/usbip/stub_rx.c Brian G. Merrell   2009-07-21  605  				usbip_dbg_stub_rx("submit urb ok, seqnum %u\n",
b8868e45c5f895 drivers/staging/usbip/stub_rx.c Brian G. Merrell   2009-07-21  606  						pdu->base.seqnum);
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  607  			else {
8c7003a3b4b4af drivers/usb/usbip/stub_rx.c     Alexander Popov    2016-04-28  608  				dev_err(&udev->dev, "submit_urb error, %d\n", ret);
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  609  				usbip_dump_header(pdu);
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  610  				usbip_dump_urb(priv->urbs[i]);
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  611  
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  612  				/*
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  613  				 * Pessimistic.
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  614  				 * This connection will be discarded.
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  615  				 */
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  616  				usbip_event_add(ud, SDEV_EVENT_ERROR_SUBMIT);
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  617  				break;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  618  			}
5443a56d963af4 drivers/usb/usbip/stub_rx.c     Simon Holesch      2023-11-27  619  		} else {
5443a56d963af4 drivers/usb/usbip/stub_rx.c     Simon Holesch      2023-11-27  620  			/*
5443a56d963af4 drivers/usb/usbip/stub_rx.c     Simon Holesch      2023-11-27  621  			 * An identical URB was already submitted in
5443a56d963af4 drivers/usb/usbip/stub_rx.c     Simon Holesch      2023-11-27  622  			 * tweak_special_requests(). Skip submitting this URB to not
5443a56d963af4 drivers/usb/usbip/stub_rx.c     Simon Holesch      2023-11-27  623  			 * duplicate the request.
5443a56d963af4 drivers/usb/usbip/stub_rx.c     Simon Holesch      2023-11-27  624  			 */
5443a56d963af4 drivers/usb/usbip/stub_rx.c     Simon Holesch      2023-11-27  625  			priv->urbs[i]->status = 0;
5443a56d963af4 drivers/usb/usbip/stub_rx.c     Simon Holesch      2023-11-27  626  			stub_complete(priv->urbs[i]);
5443a56d963af4 drivers/usb/usbip/stub_rx.c     Simon Holesch      2023-11-27  627  		}
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  628  	}
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  629  
b8868e45c5f895 drivers/staging/usbip/stub_rx.c Brian G. Merrell   2009-07-21  630  	usbip_dbg_stub_rx("Leave\n");
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  631  	return;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  632  
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  633  err_urb:
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  634  	kfree(priv->urbs);
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  635  err_urbs:
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  636  	kfree(buffer);
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  637  	sgl_free(sgl);
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  638  err_malloc:
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  639  	usbip_event_add(ud, SDEV_EVENT_ERROR_MALLOC);
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  640  }
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  641  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
