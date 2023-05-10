Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFFA19937
	for <oe-kbuild@lists.linux.dev>; Wed, 10 May 2023 07:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683702383; x=1715238383;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CYJrjzN1GzAPPokZuqWHWesruxjdWY9SySCJbOh5wl8=;
  b=RY7M7V786LtxP7JG6egVgof6ry1GciGgMM2UqV4MgY4zCtR0CmpMc4Mx
   xe5EVUFb0hjzZEjiQodornfcFWZa8n24A2o04YXLYrlHerMM8It2RHSkt
   BoGUUCZYgbsz4s/OuGG9Xxdg+mbyb/WguSayjKTRo6SusXLISOWMLU/gl
   zYLO+WTcL5QuTNiQ4XP2N9kGkpwxLfuqjA31avaYQoG6ohw8LbiJ0AxXG
   dvW5qoLJH9MCk492Mh68RjhKIEix3q0m+xQnkTUQkEXRszyD2pcvRfM/S
   9HIIOXaQy/1pz/XwRfT6UPmfzgUUMVj0LUvdwuv4aQu1z5pZYC0t/+o2d
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="347608461"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="347608461"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 00:06:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="729842660"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="729842660"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 10 May 2023 00:06:21 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwdu0-000316-20;
	Wed, 10 May 2023 07:06:20 +0000
Date: Wed, 10 May 2023 15:05:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v8] usb: dwc3: debugfs: Prevent any register access when
 devices is runtime suspended
Message-ID: <202305101451.V2D0cM4S-lkp@intel.com>
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
In-Reply-To: <20230504045052.22347-1-quic_ugoswami@quicinc.com>
References: <20230504045052.22347-1-quic_ugoswami@quicinc.com>
TO: Udipto Goswami <quic_ugoswami@quicinc.com>
TO: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Pratham Pratap <quic_ppratap@quicinc.com>
CC: Jack Pham <quic_jackp@quicinc.com>
CC: Johan Hovold <johan+linaro@kernel.org>
CC: Oliver Neukum <oneukum@suse.com>
CC: linux-usb@vger.kernel.org
CC: Udipto Goswami <quic_ugoswami@quicinc.com>

Hi Udipto,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus johan-usb-serial/usb-next johan-usb-serial/usb-linus linus/master v6.4-rc1 next-20230509]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Udipto-Goswami/usb-dwc3-debugfs-Prevent-any-register-access-when-devices-is-runtime-suspended/20230504-125225
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20230504045052.22347-1-quic_ugoswami%40quicinc.com
patch subject: [PATCH v8] usb: dwc3: debugfs: Prevent any register access when devices is runtime suspended
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230510/202305101451.V2D0cM4S-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305101451.V2D0cM4S-lkp@intel.com/

New smatch warnings:
drivers/usb/dwc3/debugfs.c:647 dwc3_link_state_write() warn: missing error code? 'ret'
drivers/usb/dwc3/debugfs.c:720 dwc3_rx_fifo_size_show() warn: curly braces intended?
drivers/usb/dwc3/debugfs.c:722 dwc3_rx_fifo_size_show() warn: inconsistent indenting
drivers/usb/dwc3/debugfs.c:722 dwc3_rx_fifo_size_show() warn: ignoring unreachable code.

Old smatch warnings:
drivers/usb/dwc3/debugfs.c:657 dwc3_link_state_write() warn: missing error code? 'ret'

vim +/ret +647 drivers/usb/dwc3/debugfs.c

138801aaa566ec Felipe Balbi   2012-01-02  607  
138801aaa566ec Felipe Balbi   2012-01-02  608  static ssize_t dwc3_link_state_write(struct file *file,
138801aaa566ec Felipe Balbi   2012-01-02  609  		const char __user *ubuf, size_t count, loff_t *ppos)
138801aaa566ec Felipe Balbi   2012-01-02  610  {
138801aaa566ec Felipe Balbi   2012-01-02  611  	struct seq_file		*s = file->private_data;
138801aaa566ec Felipe Balbi   2012-01-02  612  	struct dwc3		*dwc = s->private;
138801aaa566ec Felipe Balbi   2012-01-02  613  	unsigned long		flags;
138801aaa566ec Felipe Balbi   2012-01-02  614  	enum dwc3_link_state	state = 0;
138801aaa566ec Felipe Balbi   2012-01-02  615  	char			buf[32];
0d36dede457873 Thinh Nguyen   2018-11-07  616  	u32			reg;
0d36dede457873 Thinh Nguyen   2018-11-07  617  	u8			speed;
1c53edaeee3338 Udipto Goswami 2023-05-04  618  	int			ret;
138801aaa566ec Felipe Balbi   2012-01-02  619  
138801aaa566ec Felipe Balbi   2012-01-02  620  	if (copy_from_user(&buf, ubuf, min_t(size_t, sizeof(buf) - 1, count)))
138801aaa566ec Felipe Balbi   2012-01-02  621  		return -EFAULT;
138801aaa566ec Felipe Balbi   2012-01-02  622  
138801aaa566ec Felipe Balbi   2012-01-02  623  	if (!strncmp(buf, "SS.Disabled", 11))
138801aaa566ec Felipe Balbi   2012-01-02  624  		state = DWC3_LINK_STATE_SS_DIS;
138801aaa566ec Felipe Balbi   2012-01-02  625  	else if (!strncmp(buf, "Rx.Detect", 9))
138801aaa566ec Felipe Balbi   2012-01-02  626  		state = DWC3_LINK_STATE_RX_DET;
138801aaa566ec Felipe Balbi   2012-01-02  627  	else if (!strncmp(buf, "SS.Inactive", 11))
138801aaa566ec Felipe Balbi   2012-01-02  628  		state = DWC3_LINK_STATE_SS_INACT;
138801aaa566ec Felipe Balbi   2012-01-02  629  	else if (!strncmp(buf, "Recovery", 8))
138801aaa566ec Felipe Balbi   2012-01-02  630  		state = DWC3_LINK_STATE_RECOV;
138801aaa566ec Felipe Balbi   2012-01-02  631  	else if (!strncmp(buf, "Compliance", 10))
138801aaa566ec Felipe Balbi   2012-01-02  632  		state = DWC3_LINK_STATE_CMPLY;
138801aaa566ec Felipe Balbi   2012-01-02  633  	else if (!strncmp(buf, "Loopback", 8))
138801aaa566ec Felipe Balbi   2012-01-02  634  		state = DWC3_LINK_STATE_LPBK;
138801aaa566ec Felipe Balbi   2012-01-02  635  	else
138801aaa566ec Felipe Balbi   2012-01-02  636  		return -EINVAL;
138801aaa566ec Felipe Balbi   2012-01-02  637  
1c53edaeee3338 Udipto Goswami 2023-05-04  638  	ret = pm_runtime_resume_and_get(dwc->dev);
1c53edaeee3338 Udipto Goswami 2023-05-04  639  	if (ret < 0)
1c53edaeee3338 Udipto Goswami 2023-05-04  640  		return ret;
1c53edaeee3338 Udipto Goswami 2023-05-04  641  
138801aaa566ec Felipe Balbi   2012-01-02  642  	spin_lock_irqsave(&dwc->lock, flags);
d102444cac1564 Thinh Nguyen   2018-11-07  643  	reg = dwc3_readl(dwc->regs, DWC3_GSTS);
d102444cac1564 Thinh Nguyen   2018-11-07  644  	if (DWC3_GSTS_CURMOD(reg) != DWC3_GSTS_CURMOD_DEVICE) {
d102444cac1564 Thinh Nguyen   2018-11-07  645  		spin_unlock_irqrestore(&dwc->lock, flags);
1c53edaeee3338 Udipto Goswami 2023-05-04  646  		pm_runtime_put_sync(dwc->dev);
1c53edaeee3338 Udipto Goswami 2023-05-04 @647  		return ret;
d102444cac1564 Thinh Nguyen   2018-11-07  648  	}
d102444cac1564 Thinh Nguyen   2018-11-07  649  
0d36dede457873 Thinh Nguyen   2018-11-07  650  	reg = dwc3_readl(dwc->regs, DWC3_DSTS);
0d36dede457873 Thinh Nguyen   2018-11-07  651  	speed = reg & DWC3_DSTS_CONNECTSPD;
0d36dede457873 Thinh Nguyen   2018-11-07  652  
0d36dede457873 Thinh Nguyen   2018-11-07  653  	if (speed < DWC3_DSTS_SUPERSPEED &&
0d36dede457873 Thinh Nguyen   2018-11-07  654  	    state != DWC3_LINK_STATE_RECOV) {
0d36dede457873 Thinh Nguyen   2018-11-07  655  		spin_unlock_irqrestore(&dwc->lock, flags);
1c53edaeee3338 Udipto Goswami 2023-05-04  656  		pm_runtime_put_sync(dwc->dev);
1c53edaeee3338 Udipto Goswami 2023-05-04  657  		return ret;
0d36dede457873 Thinh Nguyen   2018-11-07  658  	}
0d36dede457873 Thinh Nguyen   2018-11-07  659  
138801aaa566ec Felipe Balbi   2012-01-02  660  	dwc3_gadget_set_link_state(dwc, state);
138801aaa566ec Felipe Balbi   2012-01-02  661  	spin_unlock_irqrestore(&dwc->lock, flags);
138801aaa566ec Felipe Balbi   2012-01-02  662  
1c53edaeee3338 Udipto Goswami 2023-05-04  663  	pm_runtime_put_sync(dwc->dev);
138801aaa566ec Felipe Balbi   2012-01-02  664  	return count;
138801aaa566ec Felipe Balbi   2012-01-02  665  }
138801aaa566ec Felipe Balbi   2012-01-02  666  
138801aaa566ec Felipe Balbi   2012-01-02  667  static const struct file_operations dwc3_link_state_fops = {
138801aaa566ec Felipe Balbi   2012-01-02  668  	.open			= dwc3_link_state_open,
138801aaa566ec Felipe Balbi   2012-01-02  669  	.write			= dwc3_link_state_write,
138801aaa566ec Felipe Balbi   2012-01-02  670  	.read			= seq_read,
138801aaa566ec Felipe Balbi   2012-01-02  671  	.llseek			= seq_lseek,
138801aaa566ec Felipe Balbi   2012-01-02  672  	.release		= single_release,
138801aaa566ec Felipe Balbi   2012-01-02  673  };
138801aaa566ec Felipe Balbi   2012-01-02  674  
818ec3aba883f5 Felipe Balbi   2016-04-14  675  struct dwc3_ep_file_map {
6d5b53c1fd5c3d Felipe Balbi   2018-02-15  676  	const char name[25];
6d5b53c1fd5c3d Felipe Balbi   2018-02-15  677  	const struct file_operations *const fops;
818ec3aba883f5 Felipe Balbi   2016-04-14  678  };
818ec3aba883f5 Felipe Balbi   2016-04-14  679  
2c85a1817e4ba0 Thinh Nguyen   2018-11-07  680  static int dwc3_tx_fifo_size_show(struct seq_file *s, void *unused)
818ec3aba883f5 Felipe Balbi   2016-04-14  681  {
818ec3aba883f5 Felipe Balbi   2016-04-14  682  	struct dwc3_ep		*dep = s->private;
818ec3aba883f5 Felipe Balbi   2016-04-14  683  	struct dwc3		*dwc = dep->dwc;
818ec3aba883f5 Felipe Balbi   2016-04-14  684  	unsigned long		flags;
d00be779cc5016 Thinh Nguyen   2021-03-27  685  	u32			mdwidth;
818ec3aba883f5 Felipe Balbi   2016-04-14  686  	u32			val;
1c53edaeee3338 Udipto Goswami 2023-05-04  687  	int			ret;
1c53edaeee3338 Udipto Goswami 2023-05-04  688  
1c53edaeee3338 Udipto Goswami 2023-05-04  689  	ret = pm_runtime_resume_and_get(dwc->dev);
1c53edaeee3338 Udipto Goswami 2023-05-04  690  	if (ret < 0)
1c53edaeee3338 Udipto Goswami 2023-05-04  691  		return ret;
818ec3aba883f5 Felipe Balbi   2016-04-14  692  
818ec3aba883f5 Felipe Balbi   2016-04-14  693  	spin_lock_irqsave(&dwc->lock, flags);
2c85a1817e4ba0 Thinh Nguyen   2018-11-07  694  	val = dwc3_core_fifo_space(dep, DWC3_TXFIFO);
0f874f79dc81ae Thinh Nguyen   2018-11-07  695  
0f874f79dc81ae Thinh Nguyen   2018-11-07  696  	/* Convert to bytes */
d00be779cc5016 Thinh Nguyen   2021-03-27  697  	mdwidth = dwc3_mdwidth(dwc);
4244ba02edb850 Thinh Nguyen   2020-04-11  698  
4244ba02edb850 Thinh Nguyen   2020-04-11  699  	val *= mdwidth;
0f874f79dc81ae Thinh Nguyen   2018-11-07  700  	val >>= 3;
818ec3aba883f5 Felipe Balbi   2016-04-14  701  	seq_printf(s, "%u\n", val);
818ec3aba883f5 Felipe Balbi   2016-04-14  702  	spin_unlock_irqrestore(&dwc->lock, flags);
818ec3aba883f5 Felipe Balbi   2016-04-14  703  
1c53edaeee3338 Udipto Goswami 2023-05-04  704  	pm_runtime_put_sync(dwc->dev);
818ec3aba883f5 Felipe Balbi   2016-04-14  705  	return 0;
818ec3aba883f5 Felipe Balbi   2016-04-14  706  }
818ec3aba883f5 Felipe Balbi   2016-04-14  707  
2c85a1817e4ba0 Thinh Nguyen   2018-11-07  708  static int dwc3_rx_fifo_size_show(struct seq_file *s, void *unused)
818ec3aba883f5 Felipe Balbi   2016-04-14  709  {
818ec3aba883f5 Felipe Balbi   2016-04-14  710  	struct dwc3_ep		*dep = s->private;
818ec3aba883f5 Felipe Balbi   2016-04-14  711  	struct dwc3		*dwc = dep->dwc;
818ec3aba883f5 Felipe Balbi   2016-04-14  712  	unsigned long		flags;
d00be779cc5016 Thinh Nguyen   2021-03-27  713  	u32			mdwidth;
818ec3aba883f5 Felipe Balbi   2016-04-14  714  	u32			val;
1c53edaeee3338 Udipto Goswami 2023-05-04  715  	int			ret;
1c53edaeee3338 Udipto Goswami 2023-05-04  716  
1c53edaeee3338 Udipto Goswami 2023-05-04  717  	ret = pm_runtime_resume_and_get(dwc->dev);
1c53edaeee3338 Udipto Goswami 2023-05-04  718  	if (ret < 0)
1c53edaeee3338 Udipto Goswami 2023-05-04  719  		pm_runtime_put_sync(dwc->dev);
1c53edaeee3338 Udipto Goswami 2023-05-04 @720  		return ret;
818ec3aba883f5 Felipe Balbi   2016-04-14  721  
818ec3aba883f5 Felipe Balbi   2016-04-14 @722  	spin_lock_irqsave(&dwc->lock, flags);
2c85a1817e4ba0 Thinh Nguyen   2018-11-07  723  	val = dwc3_core_fifo_space(dep, DWC3_RXFIFO);
0f874f79dc81ae Thinh Nguyen   2018-11-07  724  
0f874f79dc81ae Thinh Nguyen   2018-11-07  725  	/* Convert to bytes */
d00be779cc5016 Thinh Nguyen   2021-03-27  726  	mdwidth = dwc3_mdwidth(dwc);
4244ba02edb850 Thinh Nguyen   2020-04-11  727  
4244ba02edb850 Thinh Nguyen   2020-04-11  728  	val *= mdwidth;
0f874f79dc81ae Thinh Nguyen   2018-11-07  729  	val >>= 3;
818ec3aba883f5 Felipe Balbi   2016-04-14  730  	seq_printf(s, "%u\n", val);
818ec3aba883f5 Felipe Balbi   2016-04-14  731  	spin_unlock_irqrestore(&dwc->lock, flags);
818ec3aba883f5 Felipe Balbi   2016-04-14  732  
1c53edaeee3338 Udipto Goswami 2023-05-04  733  	pm_runtime_put_sync(dwc->dev);
818ec3aba883f5 Felipe Balbi   2016-04-14  734  	return 0;
818ec3aba883f5 Felipe Balbi   2016-04-14  735  }
818ec3aba883f5 Felipe Balbi   2016-04-14  736  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
