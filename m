Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7ED23A2
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Apr 2023 06:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681884521; x=1713420521;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1lrrs0sJvUFUDyjU09U5nLT9ltBCVgZoeLbEIbCl5Io=;
  b=cSpYNG+/gJce92SaCE8/9Kqpn5eQIK0HaOOFihIW6cDiGp8/51RxNTqt
   A4fM5rD6YoXZm4vLE2ljDgJOttn2l3dor0s7HV5kdN1sQHlnLDXXaXiUw
   zJYw/q2sEH8NN8JX1pzOFAe7oKt8v5zcF3UGHue5E8Y+7XyZfCqV0cRM4
   aI2ZtTk+mCto8yNSVTM6tjwgPMONe7pbV7edhiu11Aaiz1SI2aGNu38we
   QdjP5Z1yyIYswmrCx8FhtFQKu7qLQmAGyEuSltSPpX11O6Is/4p8kfRY8
   UFD/kTdWPJbjP4JZy58eZhgcYcgusDTNce06rsjj3hub/WXJ3zvRrPNYJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="408269857"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="408269857"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 23:08:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="693912318"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="693912318"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 18 Apr 2023 23:08:40 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pp0za-000ebI-1I;
	Wed, 19 Apr 2023 06:08:34 +0000
Date: Wed, 19 Apr 2023 14:07:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v5] usb: dwc3: debugfs: Prevent any register access when
 devices
Message-ID: <202304191354.gk7ee6Gf-lkp@intel.com>
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
In-Reply-To: <20230418121835.17550-1-quic_ugoswami@quicinc.com>
References: <20230418121835.17550-1-quic_ugoswami@quicinc.com>
TO: Udipto Goswami <quic_ugoswami@quicinc.com>
TO: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Pratham Pratap <quic_ppratap@quicinc.com>
CC: Jack Pham <quic_jackp@quicinc.com>
CC: linux-usb@vger.kernel.org
CC: Oliver Neukum <oneukum@suse.com>
CC: Johan Hovold <johan+linaro@kernel.org>
CC: Udipto Goswami <quic_ugoswami@quicinc.com>

Hi Udipto,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus westeri-thunderbolt/next linus/master v6.3-rc7 next-20230418]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Udipto-Goswami/usb-dwc3-debugfs-Prevent-any-register-access-when-devices/20230418-202039
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20230418121835.17550-1-quic_ugoswami%40quicinc.com
patch subject: [PATCH v5] usb: dwc3: debugfs: Prevent any register access when devices
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230419/202304191354.gk7ee6Gf-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304191354.gk7ee6Gf-lkp@intel.com/

smatch warnings:
drivers/usb/dwc3/debugfs.c:338 dwc3_lsp_show() warn: pm_runtime_get_sync() also returns 1 on success
drivers/usb/dwc3/debugfs.c:409 dwc3_mode_show() warn: pm_runtime_get_sync() also returns 1 on success
drivers/usb/dwc3/debugfs.c:485 dwc3_testmode_show() warn: pm_runtime_get_sync() also returns 1 on success
drivers/usb/dwc3/debugfs.c:555 dwc3_testmode_write() warn: pm_runtime_get_sync() also returns 1 on success
drivers/usb/dwc3/debugfs.c:586 dwc3_link_state_show() warn: pm_runtime_get_sync() also returns 1 on success
drivers/usb/dwc3/debugfs.c:649 dwc3_link_state_write() warn: pm_runtime_get_sync() also returns 1 on success
drivers/usb/dwc3/debugfs.c:702 dwc3_tx_fifo_size_show() warn: pm_runtime_get_sync() also returns 1 on success
drivers/usb/dwc3/debugfs.c:732 dwc3_rx_fifo_size_show() warn: pm_runtime_get_sync() also returns 1 on success
drivers/usb/dwc3/debugfs.c:761 dwc3_tx_request_queue_show() warn: pm_runtime_get_sync() also returns 1 on success
drivers/usb/dwc3/debugfs.c:784 dwc3_rx_request_queue_show() warn: pm_runtime_get_sync() also returns 1 on success
drivers/usb/dwc3/debugfs.c:807 dwc3_rx_info_queue_show() warn: pm_runtime_get_sync() also returns 1 on success
drivers/usb/dwc3/debugfs.c:830 dwc3_descriptor_fetch_queue_show() warn: pm_runtime_get_sync() also returns 1 on success
drivers/usb/dwc3/debugfs.c:853 dwc3_event_queue_show() warn: pm_runtime_get_sync() also returns 1 on success
drivers/usb/dwc3/debugfs.c:911 dwc3_trb_ring_show() warn: pm_runtime_get_sync() also returns 1 on success
drivers/usb/dwc3/debugfs.c:960 dwc3_ep_info_register_show() warn: pm_runtime_get_sync() also returns 1 on success

vim +338 drivers/usb/dwc3/debugfs.c

62ba09d6bb6330 Thinh Nguyen              2018-11-07  328  
62ba09d6bb6330 Thinh Nguyen              2018-11-07  329  static int dwc3_lsp_show(struct seq_file *s, void *unused)
62ba09d6bb6330 Thinh Nguyen              2018-11-07  330  {
62ba09d6bb6330 Thinh Nguyen              2018-11-07  331  	struct dwc3		*dwc = s->private;
62ba09d6bb6330 Thinh Nguyen              2018-11-07  332  	unsigned int		current_mode;
62ba09d6bb6330 Thinh Nguyen              2018-11-07  333  	unsigned long		flags;
62ba09d6bb6330 Thinh Nguyen              2018-11-07  334  	u32			reg;
86f75fd9ae2609 Udipto Goswami            2023-04-18  335  	int			ret;
86f75fd9ae2609 Udipto Goswami            2023-04-18  336  
86f75fd9ae2609 Udipto Goswami            2023-04-18  337  	ret = pm_runtime_get_sync(dwc->dev);
86f75fd9ae2609 Udipto Goswami            2023-04-18 @338  	if (!ret || ret < 0) {
86f75fd9ae2609 Udipto Goswami            2023-04-18  339  		pm_runtime_put(dwc->dev);
86f75fd9ae2609 Udipto Goswami            2023-04-18  340  		return 0;
86f75fd9ae2609 Udipto Goswami            2023-04-18  341  	}
62ba09d6bb6330 Thinh Nguyen              2018-11-07  342  
62ba09d6bb6330 Thinh Nguyen              2018-11-07  343  	spin_lock_irqsave(&dwc->lock, flags);
62ba09d6bb6330 Thinh Nguyen              2018-11-07  344  	reg = dwc3_readl(dwc->regs, DWC3_GSTS);
62ba09d6bb6330 Thinh Nguyen              2018-11-07  345  	current_mode = DWC3_GSTS_CURMOD(reg);
62ba09d6bb6330 Thinh Nguyen              2018-11-07  346  
62ba09d6bb6330 Thinh Nguyen              2018-11-07  347  	switch (current_mode) {
62ba09d6bb6330 Thinh Nguyen              2018-11-07  348  	case DWC3_GSTS_CURMOD_HOST:
62ba09d6bb6330 Thinh Nguyen              2018-11-07  349  		dwc3_host_lsp(s);
62ba09d6bb6330 Thinh Nguyen              2018-11-07  350  		break;
62ba09d6bb6330 Thinh Nguyen              2018-11-07  351  	case DWC3_GSTS_CURMOD_DEVICE:
62ba09d6bb6330 Thinh Nguyen              2018-11-07  352  		dwc3_gadget_lsp(s);
62ba09d6bb6330 Thinh Nguyen              2018-11-07  353  		break;
62ba09d6bb6330 Thinh Nguyen              2018-11-07  354  	default:
62ba09d6bb6330 Thinh Nguyen              2018-11-07  355  		seq_puts(s, "Mode is unknown, no LSP register printed\n");
62ba09d6bb6330 Thinh Nguyen              2018-11-07  356  		break;
62ba09d6bb6330 Thinh Nguyen              2018-11-07  357  	}
62ba09d6bb6330 Thinh Nguyen              2018-11-07  358  	spin_unlock_irqrestore(&dwc->lock, flags);
86f75fd9ae2609 Udipto Goswami            2023-04-18  359  	pm_runtime_put(dwc->dev);
62ba09d6bb6330 Thinh Nguyen              2018-11-07  360  
62ba09d6bb6330 Thinh Nguyen              2018-11-07  361  	return 0;
62ba09d6bb6330 Thinh Nguyen              2018-11-07  362  }
62ba09d6bb6330 Thinh Nguyen              2018-11-07  363  
62ba09d6bb6330 Thinh Nguyen              2018-11-07  364  static int dwc3_lsp_open(struct inode *inode, struct file *file)
62ba09d6bb6330 Thinh Nguyen              2018-11-07  365  {
62ba09d6bb6330 Thinh Nguyen              2018-11-07  366  	return single_open(file, dwc3_lsp_show, inode->i_private);
62ba09d6bb6330 Thinh Nguyen              2018-11-07  367  }
62ba09d6bb6330 Thinh Nguyen              2018-11-07  368  
62ba09d6bb6330 Thinh Nguyen              2018-11-07  369  static ssize_t dwc3_lsp_write(struct file *file, const char __user *ubuf,
62ba09d6bb6330 Thinh Nguyen              2018-11-07  370  			      size_t count, loff_t *ppos)
62ba09d6bb6330 Thinh Nguyen              2018-11-07  371  {
62ba09d6bb6330 Thinh Nguyen              2018-11-07  372  	struct seq_file		*s = file->private_data;
62ba09d6bb6330 Thinh Nguyen              2018-11-07  373  	struct dwc3		*dwc = s->private;
62ba09d6bb6330 Thinh Nguyen              2018-11-07  374  	unsigned long		flags;
62ba09d6bb6330 Thinh Nguyen              2018-11-07  375  	char			buf[32] = { 0 };
62ba09d6bb6330 Thinh Nguyen              2018-11-07  376  	u32			sel;
62ba09d6bb6330 Thinh Nguyen              2018-11-07  377  	int			ret;
62ba09d6bb6330 Thinh Nguyen              2018-11-07  378  
62ba09d6bb6330 Thinh Nguyen              2018-11-07  379  	if (copy_from_user(&buf, ubuf, min_t(size_t, sizeof(buf) - 1, count)))
62ba09d6bb6330 Thinh Nguyen              2018-11-07  380  		return -EFAULT;
62ba09d6bb6330 Thinh Nguyen              2018-11-07  381  
62ba09d6bb6330 Thinh Nguyen              2018-11-07  382  	ret = kstrtouint(buf, 0, &sel);
62ba09d6bb6330 Thinh Nguyen              2018-11-07  383  	if (ret)
62ba09d6bb6330 Thinh Nguyen              2018-11-07  384  		return ret;
62ba09d6bb6330 Thinh Nguyen              2018-11-07  385  
62ba09d6bb6330 Thinh Nguyen              2018-11-07  386  	spin_lock_irqsave(&dwc->lock, flags);
62ba09d6bb6330 Thinh Nguyen              2018-11-07  387  	dwc->dbg_lsp_select = sel;
62ba09d6bb6330 Thinh Nguyen              2018-11-07  388  	spin_unlock_irqrestore(&dwc->lock, flags);
62ba09d6bb6330 Thinh Nguyen              2018-11-07  389  
62ba09d6bb6330 Thinh Nguyen              2018-11-07  390  	return count;
62ba09d6bb6330 Thinh Nguyen              2018-11-07  391  }
62ba09d6bb6330 Thinh Nguyen              2018-11-07  392  
62ba09d6bb6330 Thinh Nguyen              2018-11-07  393  static const struct file_operations dwc3_lsp_fops = {
62ba09d6bb6330 Thinh Nguyen              2018-11-07  394  	.open			= dwc3_lsp_open,
62ba09d6bb6330 Thinh Nguyen              2018-11-07  395  	.write			= dwc3_lsp_write,
62ba09d6bb6330 Thinh Nguyen              2018-11-07  396  	.read			= seq_read,
62ba09d6bb6330 Thinh Nguyen              2018-11-07  397  	.llseek			= seq_lseek,
62ba09d6bb6330 Thinh Nguyen              2018-11-07  398  	.release		= single_release,
62ba09d6bb6330 Thinh Nguyen              2018-11-07  399  };
62ba09d6bb6330 Thinh Nguyen              2018-11-07  400  
0b9fe32deece53 Felipe Balbi              2011-10-17  401  static int dwc3_mode_show(struct seq_file *s, void *unused)
0b9fe32deece53 Felipe Balbi              2011-10-17  402  {
0b9fe32deece53 Felipe Balbi              2011-10-17  403  	struct dwc3		*dwc = s->private;
0b9fe32deece53 Felipe Balbi              2011-10-17  404  	unsigned long		flags;
0b9fe32deece53 Felipe Balbi              2011-10-17  405  	u32			reg;
86f75fd9ae2609 Udipto Goswami            2023-04-18  406  	int			ret;
86f75fd9ae2609 Udipto Goswami            2023-04-18  407  
86f75fd9ae2609 Udipto Goswami            2023-04-18  408  	ret = pm_runtime_get_sync(dwc->dev);
86f75fd9ae2609 Udipto Goswami            2023-04-18 @409  	if (!ret || ret < 0) {
86f75fd9ae2609 Udipto Goswami            2023-04-18  410  		pm_runtime_put(dwc->dev);
86f75fd9ae2609 Udipto Goswami            2023-04-18  411  		return 0;
86f75fd9ae2609 Udipto Goswami            2023-04-18  412  	}
0b9fe32deece53 Felipe Balbi              2011-10-17  413  
0b9fe32deece53 Felipe Balbi              2011-10-17  414  	spin_lock_irqsave(&dwc->lock, flags);
0b9fe32deece53 Felipe Balbi              2011-10-17  415  	reg = dwc3_readl(dwc->regs, DWC3_GCTL);
0b9fe32deece53 Felipe Balbi              2011-10-17  416  	spin_unlock_irqrestore(&dwc->lock, flags);
0b9fe32deece53 Felipe Balbi              2011-10-17  417  
0b9fe32deece53 Felipe Balbi              2011-10-17  418  	switch (DWC3_GCTL_PRTCAP(reg)) {
0b9fe32deece53 Felipe Balbi              2011-10-17  419  	case DWC3_GCTL_PRTCAP_HOST:
9ae0eb455b9136 Felipe Balbi              2020-08-13  420  		seq_puts(s, "host\n");
0b9fe32deece53 Felipe Balbi              2011-10-17  421  		break;
0b9fe32deece53 Felipe Balbi              2011-10-17  422  	case DWC3_GCTL_PRTCAP_DEVICE:
9ae0eb455b9136 Felipe Balbi              2020-08-13  423  		seq_puts(s, "device\n");
0b9fe32deece53 Felipe Balbi              2011-10-17  424  		break;
0b9fe32deece53 Felipe Balbi              2011-10-17  425  	case DWC3_GCTL_PRTCAP_OTG:
9ae0eb455b9136 Felipe Balbi              2020-08-13  426  		seq_puts(s, "otg\n");
0b9fe32deece53 Felipe Balbi              2011-10-17  427  		break;
0b9fe32deece53 Felipe Balbi              2011-10-17  428  	default:
0b9fe32deece53 Felipe Balbi              2011-10-17  429  		seq_printf(s, "UNKNOWN %08x\n", DWC3_GCTL_PRTCAP(reg));
0b9fe32deece53 Felipe Balbi              2011-10-17  430  	}
0b9fe32deece53 Felipe Balbi              2011-10-17  431  
86f75fd9ae2609 Udipto Goswami            2023-04-18  432  	pm_runtime_put(dwc->dev);
0b9fe32deece53 Felipe Balbi              2011-10-17  433  	return 0;
0b9fe32deece53 Felipe Balbi              2011-10-17  434  }
0b9fe32deece53 Felipe Balbi              2011-10-17  435  
0b9fe32deece53 Felipe Balbi              2011-10-17  436  static int dwc3_mode_open(struct inode *inode, struct file *file)
0b9fe32deece53 Felipe Balbi              2011-10-17  437  {
0b9fe32deece53 Felipe Balbi              2011-10-17  438  	return single_open(file, dwc3_mode_show, inode->i_private);
0b9fe32deece53 Felipe Balbi              2011-10-17  439  }
0b9fe32deece53 Felipe Balbi              2011-10-17  440  
0b9fe32deece53 Felipe Balbi              2011-10-17  441  static ssize_t dwc3_mode_write(struct file *file,
0b9fe32deece53 Felipe Balbi              2011-10-17  442  		const char __user *ubuf, size_t count, loff_t *ppos)
0b9fe32deece53 Felipe Balbi              2011-10-17  443  {
0b9fe32deece53 Felipe Balbi              2011-10-17  444  	struct seq_file		*s = file->private_data;
0b9fe32deece53 Felipe Balbi              2011-10-17  445  	struct dwc3		*dwc = s->private;
3140e8cbfec18e Sebastian Andrzej Siewior 2011-10-31  446  	u32			mode = 0;
0b9fe32deece53 Felipe Balbi              2011-10-17  447  	char			buf[32];
0b9fe32deece53 Felipe Balbi              2011-10-17  448  
0b9fe32deece53 Felipe Balbi              2011-10-17  449  	if (copy_from_user(&buf, ubuf, min_t(size_t, sizeof(buf) - 1, count)))
0b9fe32deece53 Felipe Balbi              2011-10-17  450  		return -EFAULT;
0b9fe32deece53 Felipe Balbi              2011-10-17  451  
5bde3f020a150a Li Jun                    2020-07-22  452  	if (dwc->dr_mode != USB_DR_MODE_OTG)
5bde3f020a150a Li Jun                    2020-07-22  453  		return count;
5bde3f020a150a Li Jun                    2020-07-22  454  
0b9fe32deece53 Felipe Balbi              2011-10-17  455  	if (!strncmp(buf, "host", 4))
b202c42cbf8120 Roger Quadros             2017-04-04  456  		mode = DWC3_GCTL_PRTCAP_HOST;
0b9fe32deece53 Felipe Balbi              2011-10-17  457  
0b9fe32deece53 Felipe Balbi              2011-10-17  458  	if (!strncmp(buf, "device", 6))
b202c42cbf8120 Roger Quadros             2017-04-04  459  		mode = DWC3_GCTL_PRTCAP_DEVICE;
0b9fe32deece53 Felipe Balbi              2011-10-17  460  
0b9fe32deece53 Felipe Balbi              2011-10-17  461  	if (!strncmp(buf, "otg", 3))
b202c42cbf8120 Roger Quadros             2017-04-04  462  		mode = DWC3_GCTL_PRTCAP_OTG;
0b9fe32deece53 Felipe Balbi              2011-10-17  463  
3140e8cbfec18e Sebastian Andrzej Siewior 2011-10-31  464  	dwc3_set_mode(dwc, mode);
41ce1456e1dbbc Roger Quadros             2017-04-04  465  
0b9fe32deece53 Felipe Balbi              2011-10-17  466  	return count;
0b9fe32deece53 Felipe Balbi              2011-10-17  467  }
0b9fe32deece53 Felipe Balbi              2011-10-17  468  
0b9fe32deece53 Felipe Balbi              2011-10-17  469  static const struct file_operations dwc3_mode_fops = {
0b9fe32deece53 Felipe Balbi              2011-10-17  470  	.open			= dwc3_mode_open,
0b9fe32deece53 Felipe Balbi              2011-10-17  471  	.write			= dwc3_mode_write,
0b9fe32deece53 Felipe Balbi              2011-10-17  472  	.read			= seq_read,
0b9fe32deece53 Felipe Balbi              2011-10-17  473  	.llseek			= seq_lseek,
0b9fe32deece53 Felipe Balbi              2011-10-17  474  	.release		= single_release,
0b9fe32deece53 Felipe Balbi              2011-10-17  475  };
0b9fe32deece53 Felipe Balbi              2011-10-17  476  
080d921fe7a8d2 Felipe Balbi              2012-01-02  477  static int dwc3_testmode_show(struct seq_file *s, void *unused)
080d921fe7a8d2 Felipe Balbi              2012-01-02  478  {
080d921fe7a8d2 Felipe Balbi              2012-01-02  479  	struct dwc3		*dwc = s->private;
080d921fe7a8d2 Felipe Balbi              2012-01-02  480  	unsigned long		flags;
080d921fe7a8d2 Felipe Balbi              2012-01-02  481  	u32			reg;
86f75fd9ae2609 Udipto Goswami            2023-04-18  482  	int			ret;
86f75fd9ae2609 Udipto Goswami            2023-04-18  483  
86f75fd9ae2609 Udipto Goswami            2023-04-18  484  	ret = pm_runtime_get_sync(dwc->dev);
86f75fd9ae2609 Udipto Goswami            2023-04-18 @485  	if (!ret || ret < 0) {
86f75fd9ae2609 Udipto Goswami            2023-04-18  486  		pm_runtime_put(dwc->dev);
86f75fd9ae2609 Udipto Goswami            2023-04-18  487  		return 0;
86f75fd9ae2609 Udipto Goswami            2023-04-18  488  	}
080d921fe7a8d2 Felipe Balbi              2012-01-02  489  
080d921fe7a8d2 Felipe Balbi              2012-01-02  490  	spin_lock_irqsave(&dwc->lock, flags);
080d921fe7a8d2 Felipe Balbi              2012-01-02  491  	reg = dwc3_readl(dwc->regs, DWC3_DCTL);
080d921fe7a8d2 Felipe Balbi              2012-01-02  492  	reg &= DWC3_DCTL_TSTCTRL_MASK;
080d921fe7a8d2 Felipe Balbi              2012-01-02  493  	reg >>= 1;
080d921fe7a8d2 Felipe Balbi              2012-01-02  494  	spin_unlock_irqrestore(&dwc->lock, flags);
080d921fe7a8d2 Felipe Balbi              2012-01-02  495  
080d921fe7a8d2 Felipe Balbi              2012-01-02  496  	switch (reg) {
080d921fe7a8d2 Felipe Balbi              2012-01-02  497  	case 0:
9ae0eb455b9136 Felipe Balbi              2020-08-13  498  		seq_puts(s, "no test\n");
080d921fe7a8d2 Felipe Balbi              2012-01-02  499  		break;
62fb45d317c5fa Greg Kroah-Hartman        2020-06-18  500  	case USB_TEST_J:
9ae0eb455b9136 Felipe Balbi              2020-08-13  501  		seq_puts(s, "test_j\n");
080d921fe7a8d2 Felipe Balbi              2012-01-02  502  		break;
62fb45d317c5fa Greg Kroah-Hartman        2020-06-18  503  	case USB_TEST_K:
9ae0eb455b9136 Felipe Balbi              2020-08-13  504  		seq_puts(s, "test_k\n");
080d921fe7a8d2 Felipe Balbi              2012-01-02  505  		break;
62fb45d317c5fa Greg Kroah-Hartman        2020-06-18  506  	case USB_TEST_SE0_NAK:
9ae0eb455b9136 Felipe Balbi              2020-08-13  507  		seq_puts(s, "test_se0_nak\n");
080d921fe7a8d2 Felipe Balbi              2012-01-02  508  		break;
62fb45d317c5fa Greg Kroah-Hartman        2020-06-18  509  	case USB_TEST_PACKET:
9ae0eb455b9136 Felipe Balbi              2020-08-13  510  		seq_puts(s, "test_packet\n");
080d921fe7a8d2 Felipe Balbi              2012-01-02  511  		break;
62fb45d317c5fa Greg Kroah-Hartman        2020-06-18  512  	case USB_TEST_FORCE_ENABLE:
9ae0eb455b9136 Felipe Balbi              2020-08-13  513  		seq_puts(s, "test_force_enable\n");
080d921fe7a8d2 Felipe Balbi              2012-01-02  514  		break;
080d921fe7a8d2 Felipe Balbi              2012-01-02  515  	default:
080d921fe7a8d2 Felipe Balbi              2012-01-02  516  		seq_printf(s, "UNKNOWN %d\n", reg);
080d921fe7a8d2 Felipe Balbi              2012-01-02  517  	}
080d921fe7a8d2 Felipe Balbi              2012-01-02  518  
86f75fd9ae2609 Udipto Goswami            2023-04-18  519  	pm_runtime_put(dwc->dev);
080d921fe7a8d2 Felipe Balbi              2012-01-02  520  	return 0;
080d921fe7a8d2 Felipe Balbi              2012-01-02  521  }
080d921fe7a8d2 Felipe Balbi              2012-01-02  522  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
