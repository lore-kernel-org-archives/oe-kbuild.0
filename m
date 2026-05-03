Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA750282F16
	for <oe-kbuild@lists.linux.dev>; Sun,  3 May 2026 09:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777799495; cv=none; b=kKoRIxVfDYhptlHuYB6BC/R7JCEWkqaoV5Rzy58ADjiue34+K/ryHg/9q4HzNC2t1oebzTIdwXW/4Xd3ozjGUDZ0fi43Py8FmWAwZkWX8W4URtKQ278gZVzdgUe7mzk1vQoCqLQB9gExVBV8C3bkRfUTyQU6Tuk7bz0+uT0mX5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777799495; c=relaxed/simple;
	bh=3lFrn2rn2G8/wOhjY5mNEG08b+BXiSKoDWlUxNfmfmE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AkSVfk621bes6ezFimESWIPD+yIhGkhEU8Rqjxl65mbGQ8VwwwCvzWamW4JHB9+39M+8ygRhl5XLvyHLlt+xBDfFs967uT/SzuXb3cLUVcqGPYUPBhtYNw88gXVC73hAOtcD6Rs6Qwe2FTGS+z5sLLTUpzyobWteXVBqBWqlc24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bEhHxqVZ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bEhHxqVZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777799494; x=1809335494;
  h=date:from:to:cc:subject:message-id;
  bh=3lFrn2rn2G8/wOhjY5mNEG08b+BXiSKoDWlUxNfmfmE=;
  b=bEhHxqVZk4NrZ/DHyOd8janPa0rEoqvMnG57aMrlBvXu+j584qKy54ct
   b5Oqxij8Ck3/tom1cl31Kuui9hyZC1cvm/t/xV6lX05EQvmAAB99NZ9+J
   zkmKJGvJpniMfhq5qbLsSlIq+Y4WM6z/MxzjfSWGSQ/PfsOwYxT4w71gA
   hWgL7tjOtediBOuLEEl2it2hfpm+zcHpdHgzZVowIbeV6t5v+Hpd4Ibi4
   Q7K3J9ygB20wDFy7Vhi4Fbh7tf266+oyw2LC9kgoIK2vEySgcKX1d5U7s
   CADo11DG6IefhT74WiQNiYhySD6w4Fx+LDEchE58hlCVPQJU3uHKavC8M
   w==;
X-CSE-ConnectionGUID: gDh7P8IpROmrrqLkIbbdpA==
X-CSE-MsgGUID: sOT3pIb7SMKFaREZmhxz+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="101358615"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="101358615"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 02:11:33 -0700
X-CSE-ConnectionGUID: pheR5CClTki12xifIeK+MQ==
X-CSE-MsgGUID: w5T7iHPMSlGlvWd+cvloWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="258608133"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 May 2026 02:11:31 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJSrI-000000002PB-3pgj;
	Sun, 03 May 2026 09:11:28 +0000
Date: Sun, 03 May 2026 17:11:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 1128/2395]
 drivers/usb/serial/oti6858.c:747 oti6858_read_int_callback() error: calling
 'spin_unlock_irqrestore()' with bogus flags
Message-ID: <202605031744.pbTxSj9d-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b9303e6bff706758c167af686b5315ad00233bf8
commit: 3b58fbbdf385303fd611abc522579c541e282b8d [1128/2395] workqueue: check kvov_mode change inside workqueue
:::::: branch date: 3 days ago
:::::: commit date: 6 days ago
config: i386-randconfig-141-20260503 (https://download.01.org/0day-ci/archive/20260503/202605031744.pbTxSj9d-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605031744.pbTxSj9d-lkp@intel.com/

New smatch warnings:
drivers/usb/serial/oti6858.c:747 oti6858_read_int_callback() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/thunderbolt/nhi.c:311 ring_work() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/metro-usb.c:150 metrousb_read_int_callback() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/metro-usb.c:288 metrousb_tiocmget() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/metro-usb.c:318 metrousb_tiocmset() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/ir-usb.c:278 ir_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/garmin_gps.c:309 pkt_pop() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/garmin_gps.c:326 pkt_clear() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/garmin_gps.c:1014 garmin_write_bulk() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/opticon.c:263 opticon_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/opticon.c:316 opticon_tiocmget() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/generic.c:192 usb_serial_generic_write_start() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/generic.c:192 usb_serial_generic_write_start() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/ti_usb_3410_5052.c:1231 ti_bulk_in_callback() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/vfio/pci/vfio_pci_intrs.c:201 vfio_pci_intx_unmask_handler() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/iuu_phoenix.c:692 iuu_uart_read_callback() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/arm/display/komeda/komeda_crtc.c:162 komeda_crtc_prepare() warn: 'mdev->aclk' from clk_prepare_enable() not released on lines: 162.
drivers/usb/serial/usb_wwan.c:195 usb_wwan_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/io_ti.c:1785 edge_bulk_in_callback() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/mxser.c:749 mxser_activate() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/class/usblp.c:517 usblp_poll() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/misc/cardreader/rtsx_pcr.c:324 rtsx_pci_add_cmd() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/misc/cardreader/rtsx_pcr.c:381 rtsx_pci_send_cmd() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/misc/cardreader/rtsx_pcr.c:501 rtsx_pci_dma_transfer() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/sierra.c:452 sierra_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/host/xhci-hub.c:1314 xhci_hub_control() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/host/xhci-hub.c:1808 xhci_bus_suspend() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/host/xhci-hub.c:1956 xhci_bus_resume() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/host/xhci.c:1721 xhci_urb_enqueue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/host/xhci.c:3457 xhci_endpoint_reset() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/host/xhci.c:3750 xhci_alloc_streams() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/host/xhci.c:3862 xhci_free_streams() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/host/xhci.c:4005 xhci_discover_or_reset_device() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/host/xhci.c:4743 xhci_set_usb2_hardware_lpm() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/cypress_m8.c:1124 cypress_read_int_callback() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpib/fmh_gpib/fmh_gpib.c:296 lacs_or_read_ready() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpib/fmh_gpib/fmh_gpib.c:823 fmh_gpib_dma_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2983 amdgpu_vm_lock_by_pasid() error: calling 'spin_unlock_irqrestore()' with bogus flags
mm/slub.c:3700 alloc_single_from_new_slab() error: calling 'spin_unlock_irqrestore()' with bogus flags

Old smatch warnings:
drivers/usb/serial/ir-usb.c:304 ir_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/generic.c:167 usb_serial_generic_write_start() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/generic.c:172 usb_serial_generic_write_start() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/generic.c:182 usb_serial_generic_write_start() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/arm/display/komeda/komeda_crtc.c:321 komeda_crtc_flush_and_wait_for_flip_done() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/mxser.c:798 mxser_activate() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/misc/cardreader/rtsx_pcr.c:386 rtsx_pci_send_cmd() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/misc/cardreader/rtsx_pcr.c:506 rtsx_pci_dma_transfer() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/sierra.c:491 sierra_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/sierra.c:497 sierra_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/sierra.c:515 sierra_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/host/xhci-hub.c:1448 xhci_hub_control() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/host/xhci-hub.c:1599 xhci_hub_control() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/host/xhci.c:4009 xhci_discover_or_reset_device() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpib/fmh_gpib/fmh_gpib.c:1475 fmh_gpib_attach_impl() warn: 'e_priv->fifo_base' from ioremap() not released on lines: 1450,1456,1464.
drivers/gpib/fmh_gpib/fmh_gpib.c:1475 fmh_gpib_attach_impl() warn: 'irq' from request_irq() not released on lines: 1464.
drivers/gpib/fmh_gpib/fmh_gpib.c:1475 fmh_gpib_attach_impl() warn: 'nec_priv->mmiobase' from ioremap() not released on lines: 1429,1435,1442,1450,1456,1464.
drivers/gpib/fmh_gpib/fmh_gpib.c:1475 fmh_gpib_attach_impl() warn: 'res->start' from __request_region() not released on lines: 1421,1429,1435,1442,1450,1456,1464.
drivers/gpib/fmh_gpib/fmh_gpib.c:1475 fmh_gpib_attach_impl() warn: 'res->start' from __request_region() not released on lines: 1442,1450,1456,1464.
drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:851 amdgpu_vm_flush() error: we previously assumed 'ring->funcs->emit_vm_flush' could be null (see line 813)

vim +747 drivers/usb/serial/oti6858.c

49cdee0ed0fce9 Kees Lemmens       2007-03-27  638  
49cdee0ed0fce9 Kees Lemmens       2007-03-27  639  static void oti6858_read_int_callback(struct urb *urb)
49cdee0ed0fce9 Kees Lemmens       2007-03-27  640  {
cdc97792289179 Ming Lei           2008-02-24  641  	struct usb_serial_port *port =  urb->context;
49cdee0ed0fce9 Kees Lemmens       2007-03-27  642  	struct oti6858_private *priv = usb_get_serial_port_data(port);
49cdee0ed0fce9 Kees Lemmens       2007-03-27  643  	int transient = 0, can_recv = 0, resubmit = 1;
78c26aebd9f4d2 Greg Kroah-Hartman 2007-06-15  644  	int status = urb->status;
49cdee0ed0fce9 Kees Lemmens       2007-03-27  645  
78c26aebd9f4d2 Greg Kroah-Hartman 2007-06-15  646  	switch (status) {
49cdee0ed0fce9 Kees Lemmens       2007-03-27  647  	case 0:
49cdee0ed0fce9 Kees Lemmens       2007-03-27  648  		/* success */
49cdee0ed0fce9 Kees Lemmens       2007-03-27  649  		break;
49cdee0ed0fce9 Kees Lemmens       2007-03-27  650  	case -ECONNRESET:
49cdee0ed0fce9 Kees Lemmens       2007-03-27  651  	case -ENOENT:
49cdee0ed0fce9 Kees Lemmens       2007-03-27  652  	case -ESHUTDOWN:
49cdee0ed0fce9 Kees Lemmens       2007-03-27  653  		/* this urb is terminated, clean up */
8c8e87bc23acb4 Greg Kroah-Hartman 2012-09-14  654  		dev_dbg(&urb->dev->dev, "%s(): urb shutting down with status: %d\n",
441b62c1edb986 Harvey Harrison    2008-03-03  655  			__func__, status);
49cdee0ed0fce9 Kees Lemmens       2007-03-27  656  		return;
49cdee0ed0fce9 Kees Lemmens       2007-03-27  657  	default:
8c8e87bc23acb4 Greg Kroah-Hartman 2012-09-14  658  		dev_dbg(&urb->dev->dev, "%s(): nonzero urb status received: %d\n",
441b62c1edb986 Harvey Harrison    2008-03-03  659  			__func__, status);
49cdee0ed0fce9 Kees Lemmens       2007-03-27  660  		break;
49cdee0ed0fce9 Kees Lemmens       2007-03-27  661  	}
49cdee0ed0fce9 Kees Lemmens       2007-03-27  662  
78c26aebd9f4d2 Greg Kroah-Hartman 2007-06-15  663  	if (status == 0 && urb->actual_length == OTI6858_CTRL_PKT_SIZE) {
49cdee0ed0fce9 Kees Lemmens       2007-03-27  664  		struct oti6858_control_pkt *xs = urb->transfer_buffer;
49cdee0ed0fce9 Kees Lemmens       2007-03-27  665  		unsigned long flags;
49cdee0ed0fce9 Kees Lemmens       2007-03-27  666  
49cdee0ed0fce9 Kees Lemmens       2007-03-27  667  		spin_lock_irqsave(&priv->lock, flags);
49cdee0ed0fce9 Kees Lemmens       2007-03-27  668  
49cdee0ed0fce9 Kees Lemmens       2007-03-27  669  		if (!priv->transient) {
49cdee0ed0fce9 Kees Lemmens       2007-03-27  670  			if (!OTI6858_CTRL_EQUALS_PENDING(xs, priv)) {
49cdee0ed0fce9 Kees Lemmens       2007-03-27  671  				if (xs->rx_bytes_avail == 0) {
49cdee0ed0fce9 Kees Lemmens       2007-03-27  672  					priv->transient = 4;
49cdee0ed0fce9 Kees Lemmens       2007-03-27  673  					priv->setup_done = 0;
49cdee0ed0fce9 Kees Lemmens       2007-03-27  674  					resubmit = 0;
8c8e87bc23acb4 Greg Kroah-Hartman 2012-09-14  675  					dev_dbg(&port->dev, "%s(): scheduling setup_line()\n", __func__);
49cdee0ed0fce9 Kees Lemmens       2007-03-27  676  					schedule_delayed_work(&priv->delayed_setup_work, 0);
49cdee0ed0fce9 Kees Lemmens       2007-03-27  677  				}
49cdee0ed0fce9 Kees Lemmens       2007-03-27  678  			}
49cdee0ed0fce9 Kees Lemmens       2007-03-27  679  		} else {
49cdee0ed0fce9 Kees Lemmens       2007-03-27  680  			if (OTI6858_CTRL_EQUALS_PENDING(xs, priv)) {
49cdee0ed0fce9 Kees Lemmens       2007-03-27  681  				priv->transient = 0;
49cdee0ed0fce9 Kees Lemmens       2007-03-27  682  			} else if (!priv->setup_done) {
49cdee0ed0fce9 Kees Lemmens       2007-03-27  683  				resubmit = 0;
49cdee0ed0fce9 Kees Lemmens       2007-03-27  684  			} else if (--priv->transient == 0) {
49cdee0ed0fce9 Kees Lemmens       2007-03-27  685  				if (xs->rx_bytes_avail == 0) {
49cdee0ed0fce9 Kees Lemmens       2007-03-27  686  					priv->transient = 4;
49cdee0ed0fce9 Kees Lemmens       2007-03-27  687  					priv->setup_done = 0;
49cdee0ed0fce9 Kees Lemmens       2007-03-27  688  					resubmit = 0;
8c8e87bc23acb4 Greg Kroah-Hartman 2012-09-14  689  					dev_dbg(&port->dev, "%s(): scheduling setup_line()\n", __func__);
49cdee0ed0fce9 Kees Lemmens       2007-03-27  690  					schedule_delayed_work(&priv->delayed_setup_work, 0);
49cdee0ed0fce9 Kees Lemmens       2007-03-27  691  				}
49cdee0ed0fce9 Kees Lemmens       2007-03-27  692  			}
49cdee0ed0fce9 Kees Lemmens       2007-03-27  693  		}
49cdee0ed0fce9 Kees Lemmens       2007-03-27  694  
49cdee0ed0fce9 Kees Lemmens       2007-03-27  695  		if (!priv->transient) {
1acc36e9c8dcd4 Johan Hovold       2014-01-02  696  			u8 delta = xs->pin_state ^ priv->status.pin_state;
1acc36e9c8dcd4 Johan Hovold       2014-01-02  697  
bd6383c81d5f33 Johan Hovold       2014-01-02  698  			if (delta & PIN_MSR_MASK) {
bd6383c81d5f33 Johan Hovold       2014-01-02  699  				if (delta & PIN_CTS)
bd6383c81d5f33 Johan Hovold       2014-01-02  700  					port->icount.cts++;
bd6383c81d5f33 Johan Hovold       2014-01-02  701  				if (delta & PIN_DSR)
bd6383c81d5f33 Johan Hovold       2014-01-02  702  					port->icount.dsr++;
bd6383c81d5f33 Johan Hovold       2014-01-02  703  				if (delta & PIN_RI)
bd6383c81d5f33 Johan Hovold       2014-01-02  704  					port->icount.rng++;
bd6383c81d5f33 Johan Hovold       2014-01-02  705  				if (delta & PIN_DCD)
bd6383c81d5f33 Johan Hovold       2014-01-02  706  					port->icount.dcd++;
bd6383c81d5f33 Johan Hovold       2014-01-02  707  
215f6f04668e80 Johan Hovold       2013-03-21  708  				wake_up_interruptible(&port->port.delta_msr_wait);
bd6383c81d5f33 Johan Hovold       2014-01-02  709  			}
1acc36e9c8dcd4 Johan Hovold       2014-01-02  710  
49cdee0ed0fce9 Kees Lemmens       2007-03-27  711  			memcpy(&priv->status, xs, OTI6858_CTRL_PKT_SIZE);
49cdee0ed0fce9 Kees Lemmens       2007-03-27  712  		}
49cdee0ed0fce9 Kees Lemmens       2007-03-27  713  
49cdee0ed0fce9 Kees Lemmens       2007-03-27  714  		if (!priv->transient && xs->rx_bytes_avail != 0) {
49cdee0ed0fce9 Kees Lemmens       2007-03-27  715  			can_recv = xs->rx_bytes_avail;
49cdee0ed0fce9 Kees Lemmens       2007-03-27  716  			priv->flags.read_urb_in_use = 1;
49cdee0ed0fce9 Kees Lemmens       2007-03-27  717  		}
49cdee0ed0fce9 Kees Lemmens       2007-03-27  718  
49cdee0ed0fce9 Kees Lemmens       2007-03-27  719  		transient = priv->transient;
49cdee0ed0fce9 Kees Lemmens       2007-03-27  720  		spin_unlock_irqrestore(&priv->lock, flags);
49cdee0ed0fce9 Kees Lemmens       2007-03-27  721  	}
49cdee0ed0fce9 Kees Lemmens       2007-03-27  722  
49cdee0ed0fce9 Kees Lemmens       2007-03-27  723  	if (can_recv) {
49cdee0ed0fce9 Kees Lemmens       2007-03-27  724  		int result;
49cdee0ed0fce9 Kees Lemmens       2007-03-27  725  
49cdee0ed0fce9 Kees Lemmens       2007-03-27  726  		result = usb_submit_urb(port->read_urb, GFP_ATOMIC);
49cdee0ed0fce9 Kees Lemmens       2007-03-27  727  		if (result != 0) {
49cdee0ed0fce9 Kees Lemmens       2007-03-27  728  			priv->flags.read_urb_in_use = 0;
49cdee0ed0fce9 Kees Lemmens       2007-03-27  729  			dev_err(&port->dev, "%s(): usb_submit_urb() failed,"
441b62c1edb986 Harvey Harrison    2008-03-03  730  					" error %d\n", __func__, result);
49cdee0ed0fce9 Kees Lemmens       2007-03-27  731  		} else {
49cdee0ed0fce9 Kees Lemmens       2007-03-27  732  			resubmit = 0;
49cdee0ed0fce9 Kees Lemmens       2007-03-27  733  		}
49cdee0ed0fce9 Kees Lemmens       2007-03-27  734  	} else if (!transient) {
49cdee0ed0fce9 Kees Lemmens       2007-03-27  735  		unsigned long flags;
28f27dcbd255b4 Johan Hovold       2010-05-16  736  		int count;
28f27dcbd255b4 Johan Hovold       2010-05-16  737  
28f27dcbd255b4 Johan Hovold       2010-05-16  738  		spin_lock_irqsave(&port->lock, flags);
28f27dcbd255b4 Johan Hovold       2010-05-16  739  		count = kfifo_len(&port->write_fifo);
28f27dcbd255b4 Johan Hovold       2010-05-16  740  		spin_unlock_irqrestore(&port->lock, flags);
49cdee0ed0fce9 Kees Lemmens       2007-03-27  741  
49cdee0ed0fce9 Kees Lemmens       2007-03-27  742  		spin_lock_irqsave(&priv->lock, flags);
28f27dcbd255b4 Johan Hovold       2010-05-16  743  		if (priv->flags.write_urb_in_use == 0 && count != 0) {
49cdee0ed0fce9 Kees Lemmens       2007-03-27  744  			schedule_delayed_work(&priv->delayed_write_work, 0);
49cdee0ed0fce9 Kees Lemmens       2007-03-27  745  			resubmit = 0;
49cdee0ed0fce9 Kees Lemmens       2007-03-27  746  		}
49cdee0ed0fce9 Kees Lemmens       2007-03-27 @747  		spin_unlock_irqrestore(&priv->lock, flags);
49cdee0ed0fce9 Kees Lemmens       2007-03-27  748  	}
49cdee0ed0fce9 Kees Lemmens       2007-03-27  749  
49cdee0ed0fce9 Kees Lemmens       2007-03-27  750  	if (resubmit) {
49cdee0ed0fce9 Kees Lemmens       2007-03-27  751  		int result;
49cdee0ed0fce9 Kees Lemmens       2007-03-27  752  

:::::: The code at line 747 was first introduced by commit
:::::: 49cdee0ed0fce9e1bda81f5dcad8d5cce6aec983 USB: oti6858 usb-serial driver (in Nokia CA-42 cable)

:::::: TO: Kees Lemmens <C.W.J.Lemmens@ewi.tudelft.nl>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
