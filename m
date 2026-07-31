Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69F13D1CB5
	for <oe-kbuild@lists.linux.dev>; Fri, 31 Jul 2026 10:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785492748; cv=none; b=PxLDuDhC7rM5/76Oo2hP9N25UXKcRKOLakCVoGjcgkvQs7ueLRlKv2DAgTVCqL5iHPIXoVqNVhuVfJ2wSy4aspNALsffPoxHRbVf2wHj0UkJdjFu4871FbNih/o7mOuSSEhlV5v0ea4ivyfdSaRgAJgj0mQZZeHW9bksW8d+qoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785492748; c=relaxed/simple;
	bh=4jw/D8rTvny0Gx5vjDE7EkObtMrg2weMtIkMnC+OrEI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Eug9vfJysVdHcY9PTIPkR8a2GCTFWndYN6ZrE0jyGgkwvVLByZPCZiZFSQxO9iUXdZB8f21NZdQnQ2RfLFQawh1+QzLvv0qYL4BhE+0pnkall8wnAQH8HvHEhQqTgknK4TD4oCEzm/Hx70Q2eS/E+f4m+3F8wPnRFVUcdhFw2No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YGn6qIco; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YGn6qIco"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785492740; x=1817028740;
  h=date:from:to:cc:subject:message-id;
  bh=4jw/D8rTvny0Gx5vjDE7EkObtMrg2weMtIkMnC+OrEI=;
  b=YGn6qIcoWRvR0Xl+NICJqjvmTMbG1BPn6Gw0tEVxR1K8vaJS8KmlarVO
   CtboeSKm3yUNP2vSfXzqEsRfngZi45o0Dw9ta9avmdWfSPUjdK/KBBxzC
   ny/fzlc0cSfkCY2xv/N4io7GATWSPua6pAhkYoSwxNddL0KMLjsn7ZHXl
   UPqA8yuDv+NxqrQdjyM2xYcJ6VdoD/zTQDDq5vTx8196UqRGwR9yC79DI
   TlQl0KuWf43ujCIjW35/TNNNisHMWlQ0pEwfYcvgPwTbBQn798GdMQdT/
   EWHaoN/OsZfGXjwCXubcNOAldomKtZWNmsKt91NfgbLgH5B9CVRcC1B/k
   Q==;
X-CSE-ConnectionGUID: V+2+Kl2dTc2vzR7JHAbLiA==
X-CSE-MsgGUID: QlACZCjCTXq/Zw97Lx8cfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="96705447"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="96705447"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 03:12:14 -0700
X-CSE-ConnectionGUID: cdDWoeYCTCClj3s9KNZlhw==
X-CSE-MsgGUID: y4oLxUcwQi6rrE6SMh/neQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="264354974"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 31 Jul 2026 03:12:13 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpkDr-000000002ko-0q2E;
	Fri, 31 Jul 2026 10:12:11 +0000
Date: Fri, 31 Jul 2026 12:11:50 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android16-6.12 1/1] htmldocs:
 ./include/linux/usb.h:765: warning: Function parameter or struct member ''
 not described in 'usb_device'
Message-ID: <202607311247.58axyqFW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "Function parameter or struct member '' not described in"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

Hi Guan-Yu,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   7d66c85503045527d51998c0f5a249c3fd209670
commit: 74bd9a178b015ab3edaf12e97918ce408e8f25a7 [1/1] BACKPORT: usb: core: use dedicated spinlock for offload state
:::::: branch date: 8 hours ago
:::::: commit date: 4 months ago
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260731/202607311247.58axyqFW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607311247.58axyqFW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ./include/linux/usb/typec_altmode.h:70: warning: Function parameter or struct member 'ANDROID_KABI_RESERVE(1' not described in 'typec_altmode_ops'
   ./include/linux/usb.h:278: warning: Function parameter or struct member 'ANDROID_KABI_RESERVE(1' not described in 'usb_interface'
   ./include/linux/usb.h:278: warning: Function parameter or struct member 'ANDROID_KABI_RESERVE(2' not described in 'usb_interface'
   ./include/linux/usb.h:278: warning: Function parameter or struct member 'ANDROID_KABI_RESERVE(3' not described in 'usb_interface'
   ./include/linux/usb.h:278: warning: Function parameter or struct member 'ANDROID_KABI_RESERVE(4' not described in 'usb_interface'
>> ./include/linux/usb.h:765: warning: Function parameter or struct member '' not described in 'usb_device'
   ./include/linux/usb.h:765: warning: Function parameter or struct member 'ANDROID_KABI_RESERVE(3' not described in 'usb_device'
   ./include/linux/usb.h:765: warning: Function parameter or struct member 'ANDROID_KABI_RESERVE(4' not described in 'usb_device'
>> ./include/linux/usb.h:765: warning: Excess struct member 'offload_at_suspend' description in 'usb_device'
>> ./include/linux/usb.h:765: warning: Excess struct member 'offload_pm_locked' description in 'usb_device'
   ./include/linux/usb.h:765: warning: Excess struct member 'offload_usage' description in 'usb_device'
>> ./include/linux/usb.h:765: warning: Excess struct member 'offload_lock' description in 'usb_device'
   ./include/linux/usb.h:1309: warning: Function parameter or struct member 'ANDROID_KABI_RESERVE(1' not described in 'usb_driver'
   ./include/linux/usb.h:1309: warning: Function parameter or struct member 'ANDROID_KABI_RESERVE(2' not described in 'usb_driver'
   ./include/linux/usb.h:1309: warning: Function parameter or struct member 'ANDROID_KABI_RESERVE(3' not described in 'usb_driver'
   ./include/linux/usb.h:1309: warning: Function parameter or struct member 'ANDROID_KABI_RESERVE(4' not described in 'usb_driver'
   ./include/linux/usb.h:1706: warning: Function parameter or struct member 'ANDROID_KABI_RESERVE(1' not described in 'urb'


vim +765 ./include/linux/usb.h

51e0a01206613ad Sarah Sharp          2012-02-20  592  
f476fbaba7b2051 Randy Dunlap         2008-02-13  593  /**
^1da177e4c3f415 Linus Torvalds       2005-04-16  594   * struct usb_device - kernel's representation of a USB device
f476fbaba7b2051 Randy Dunlap         2008-02-13  595   * @devnum: device number; address on a USB bus
f476fbaba7b2051 Randy Dunlap         2008-02-13  596   * @devpath: device ID string for use in messages (e.g., /port/...)
7206b00164a1c3c Sarah Sharp          2009-04-27  597   * @route: tree topology hex string for use with xHCI
f476fbaba7b2051 Randy Dunlap         2008-02-13  598   * @state: device state: configured, not attached, etc.
f476fbaba7b2051 Randy Dunlap         2008-02-13  599   * @speed: device speed: high/full/low (or error)
013eedb8c56e555 Mathias Nyman        2018-04-19  600   * @rx_lanes: number of rx lanes in use, USB 3.2 adds dual-lane support
013eedb8c56e555 Mathias Nyman        2018-04-19  601   * @tx_lanes: number of tx lanes in use, USB 3.2 adds dual-lane support
0299809be415567 Thinh Nguyen         2021-03-10  602   * @ssp_rate: SuperSpeed Plus phy signaling rate and lane count
f476fbaba7b2051 Randy Dunlap         2008-02-13  603   * @tt: Transaction Translator info; used with low/full speed dev, highspeed hub
f476fbaba7b2051 Randy Dunlap         2008-02-13  604   * @ttport: device port on that tt hub
f476fbaba7b2051 Randy Dunlap         2008-02-13  605   * @toggle: one bit for each endpoint, with ([0] = IN, [1] = OUT) endpoints
f476fbaba7b2051 Randy Dunlap         2008-02-13  606   * @parent: our hub, unless we're the root
f476fbaba7b2051 Randy Dunlap         2008-02-13  607   * @bus: bus we're part of
f476fbaba7b2051 Randy Dunlap         2008-02-13  608   * @ep0: endpoint 0 data (default control pipe)
f476fbaba7b2051 Randy Dunlap         2008-02-13  609   * @dev: generic device interface
f476fbaba7b2051 Randy Dunlap         2008-02-13  610   * @descriptor: USB device descriptor
3148bf041d169a0 Andiry Xu            2011-09-23  611   * @bos: USB device BOS descriptor set
f476fbaba7b2051 Randy Dunlap         2008-02-13  612   * @config: all of the device's configs
f476fbaba7b2051 Randy Dunlap         2008-02-13  613   * @actconfig: the active configuration
f476fbaba7b2051 Randy Dunlap         2008-02-13  614   * @ep_in: array of IN endpoints
f476fbaba7b2051 Randy Dunlap         2008-02-13  615   * @ep_out: array of OUT endpoints
f476fbaba7b2051 Randy Dunlap         2008-02-13  616   * @rawdescriptors: raw descriptors for each config
f476fbaba7b2051 Randy Dunlap         2008-02-13  617   * @bus_mA: Current available from the bus
f476fbaba7b2051 Randy Dunlap         2008-02-13  618   * @portnum: parent port number (origin 1)
f476fbaba7b2051 Randy Dunlap         2008-02-13  619   * @level: number of USB hub ancestors
4998f1efd1904dd Jim Lin              2019-06-03  620   * @devaddr: device address, XHCI: assigned by HW, others: same as devnum
f476fbaba7b2051 Randy Dunlap         2008-02-13  621   * @can_submit: URBs may be submitted
f476fbaba7b2051 Randy Dunlap         2008-02-13  622   * @persist_enabled:  USB_PERSIST enabled for this device
9c6d778800b921b Alan Stern           2022-08-26  623   * @reset_in_progress: the device is being reset
f476fbaba7b2051 Randy Dunlap         2008-02-13  624   * @have_langid: whether string_langid is valid
f476fbaba7b2051 Randy Dunlap         2008-02-13  625   * @authorized: policy has said we can use it;
f476fbaba7b2051 Randy Dunlap         2008-02-13  626   *	(user space) policy determines if we authorize this device to be
f476fbaba7b2051 Randy Dunlap         2008-02-13  627   *	used or not. By default, wired USB devices are authorized.
f476fbaba7b2051 Randy Dunlap         2008-02-13  628   *	WUSB devices are not, until we authorize them from user space.
f476fbaba7b2051 Randy Dunlap         2008-02-13  629   *	FIXME -- complete doc
3b52f128aeacc4b Inaky Perez-Gonzalez 2008-04-08  630   * @authenticated: Crypto authentication passed
f46a6e165197126 Mathias Nyman        2024-08-30  631   * @tunnel_mode: Connection native or tunneled over USB4
7d24fae116cfa62 Heikki Krogerus      2025-06-11  632   * @usb4_link: device link to the USB4 host interface
1ff4df56846d103 Andiry Xu            2011-09-23  633   * @lpm_capable: device supports LPM
e146caf303493c4 Mathias Nyman        2022-05-06  634   * @lpm_devinit_allow: Allow USB3 device initiated LPM, exit latency is in range
65580b4321eb36f Andiry Xu            2011-09-23  635   * @usb2_hw_lpm_capable: device can perform USB2 hardware LPM
a558ccdcc71c777 Mathias Nyman        2013-05-23  636   * @usb2_hw_lpm_besl_capable: device can perform USB2 hardware BESL LPM
de68bab4fa96014 Sarah Sharp          2013-09-30  637   * @usb2_hw_lpm_enabled: USB2 hardware LPM is enabled
de68bab4fa96014 Sarah Sharp          2013-09-30  638   * @usb2_hw_lpm_allowed: Userspace allows USB 2.0 LPM to be enabled
bf5ce5bf3cc7136 Lu Baolu             2015-11-14  639   * @usb3_lpm_u1_enabled: USB3 hardware U1 LPM enabled
bf5ce5bf3cc7136 Lu Baolu             2015-11-14  640   * @usb3_lpm_u2_enabled: USB3 hardware U2 LPM enabled
f476fbaba7b2051 Randy Dunlap         2008-02-13  641   * @string_langid: language ID for strings
f476fbaba7b2051 Randy Dunlap         2008-02-13  642   * @product: iProduct string, if present (static)
f476fbaba7b2051 Randy Dunlap         2008-02-13  643   * @manufacturer: iManufacturer string, if present (static)
f476fbaba7b2051 Randy Dunlap         2008-02-13  644   * @serial: iSerialNumber string, if present (static)
f476fbaba7b2051 Randy Dunlap         2008-02-13  645   * @filelist: usbfs files that are open to this device
f476fbaba7b2051 Randy Dunlap         2008-02-13  646   * @maxchild: number of ports if hub
f476fbaba7b2051 Randy Dunlap         2008-02-13  647   * @quirks: quirks of the whole device
f476fbaba7b2051 Randy Dunlap         2008-02-13  648   * @urbnum: number of URBs submitted for the whole device
f476fbaba7b2051 Randy Dunlap         2008-02-13  649   * @active_duration: total time device is not suspended
f476fbaba7b2051 Randy Dunlap         2008-02-13  650   * @connect_time: time device was first connected
f476fbaba7b2051 Randy Dunlap         2008-02-13  651   * @do_remote_wakeup:  remote wakeup should be enabled
f476fbaba7b2051 Randy Dunlap         2008-02-13  652   * @reset_resume: needs reset instead of resume
bfd1e910139be73 Alan Stern           2012-10-19  653   * @port_is_suspended: the upstream port is suspended (L2 or U3)
74bd9a178b015ab Guan-Yu Lin          2026-04-01  654   * @offload_at_suspend: Deprecated, kept for KABI compatibility.
74bd9a178b015ab Guan-Yu Lin          2026-04-01  655   * @offload_pm_locked: prevents offload_usage changes during PM transitions.
11464453482d23c Guan-Yu Lin          2025-09-16  656   * @offload_usage: number of offload activities happening on this usb device.
74bd9a178b015ab Guan-Yu Lin          2026-04-01  657   * @offload_lock: protects offload_usage and offload_pm_locked
c6515272b858742 Sarah Sharp          2009-04-27  658   * @slot_id: Slot ID assigned by xHCI
17f34867e98d2fb Mathias Nyman        2013-05-23  659   * @l1_params: best effor service latency for USB2 L1 LPM state, and L1 timeout.
1ea7e0e8e3d0f50 Sarah Sharp          2012-04-24  660   * @u1_params: exit latencies for USB3 U1 LPM state, and hub-initiated timeout.
1ea7e0e8e3d0f50 Sarah Sharp          2012-04-24  661   * @u2_params: exit latencies for USB3 U2 LPM state, and hub-initiated timeout.
1ea7e0e8e3d0f50 Sarah Sharp          2012-04-24  662   * @lpm_disable_count: Ref count used by usb_disable_lpm() and usb_enable_lpm()
1ea7e0e8e3d0f50 Sarah Sharp          2012-04-24  663   *	to keep track of the number of functions that require USB 3.0 Link Power
1ea7e0e8e3d0f50 Sarah Sharp          2012-04-24  664   *	Management to be disabled for this usb_device.  This count should only
1ea7e0e8e3d0f50 Sarah Sharp          2012-04-24  665   *	be manipulated by those functions, with the bandwidth_mutex is held.
886ee36e7205a7b Felipe Balbi         2017-12-14  666   * @hub_delay: cached value consisting of:
886ee36e7205a7b Felipe Balbi         2017-12-14  667   *	parent->hub_delay + wHubDelay + tTPTransmissionDelay (40ns)
886ee36e7205a7b Felipe Balbi         2017-12-14  668   *	Will be used as wValue for SetIsochDelay requests.
43ff98695cc0177 Randy Dunlap         2020-06-28  669   * @use_generic_driver: ask driver core to reprobe using the generic driver.
^1da177e4c3f415 Linus Torvalds       2005-04-16  670   *
f476fbaba7b2051 Randy Dunlap         2008-02-13  671   * Notes:
^1da177e4c3f415 Linus Torvalds       2005-04-16  672   * Usbcore drivers should not set usbdev->state directly.  Instead use
^1da177e4c3f415 Linus Torvalds       2005-04-16  673   * usb_set_device_state().
^1da177e4c3f415 Linus Torvalds       2005-04-16  674   */
^1da177e4c3f415 Linus Torvalds       2005-04-16  675  struct usb_device {
f476fbaba7b2051 Randy Dunlap         2008-02-13  676  	int		devnum;
f476fbaba7b2051 Randy Dunlap         2008-02-13  677  	char		devpath[16];
7206b00164a1c3c Sarah Sharp          2009-04-27  678  	u32		route;
f476fbaba7b2051 Randy Dunlap         2008-02-13  679  	enum usb_device_state	state;
f476fbaba7b2051 Randy Dunlap         2008-02-13  680  	enum usb_device_speed	speed;
013eedb8c56e555 Mathias Nyman        2018-04-19  681  	unsigned int		rx_lanes;
013eedb8c56e555 Mathias Nyman        2018-04-19  682  	unsigned int		tx_lanes;
0299809be415567 Thinh Nguyen         2021-03-10  683  	enum usb_ssp_rate	ssp_rate;
^1da177e4c3f415 Linus Torvalds       2005-04-16  684  
f476fbaba7b2051 Randy Dunlap         2008-02-13  685  	struct usb_tt	*tt;
f476fbaba7b2051 Randy Dunlap         2008-02-13  686  	int		ttport;
^1da177e4c3f415 Linus Torvalds       2005-04-16  687  
f476fbaba7b2051 Randy Dunlap         2008-02-13  688  	unsigned int toggle[2];
^1da177e4c3f415 Linus Torvalds       2005-04-16  689  
f476fbaba7b2051 Randy Dunlap         2008-02-13  690  	struct usb_device *parent;
f476fbaba7b2051 Randy Dunlap         2008-02-13  691  	struct usb_bus *bus;
^1da177e4c3f415 Linus Torvalds       2005-04-16  692  	struct usb_host_endpoint ep0;
^1da177e4c3f415 Linus Torvalds       2005-04-16  693  
f476fbaba7b2051 Randy Dunlap         2008-02-13  694  	struct device dev;
^1da177e4c3f415 Linus Torvalds       2005-04-16  695  
f476fbaba7b2051 Randy Dunlap         2008-02-13  696  	struct usb_device_descriptor descriptor;
3148bf041d169a0 Andiry Xu            2011-09-23  697  	struct usb_host_bos *bos;
f476fbaba7b2051 Randy Dunlap         2008-02-13  698  	struct usb_host_config *config;
^1da177e4c3f415 Linus Torvalds       2005-04-16  699  
f476fbaba7b2051 Randy Dunlap         2008-02-13  700  	struct usb_host_config *actconfig;
^1da177e4c3f415 Linus Torvalds       2005-04-16  701  	struct usb_host_endpoint *ep_in[16];
^1da177e4c3f415 Linus Torvalds       2005-04-16  702  	struct usb_host_endpoint *ep_out[16];
^1da177e4c3f415 Linus Torvalds       2005-04-16  703  
f476fbaba7b2051 Randy Dunlap         2008-02-13  704  	char **rawdescriptors;
^1da177e4c3f415 Linus Torvalds       2005-04-16  705  
f476fbaba7b2051 Randy Dunlap         2008-02-13  706  	unsigned short bus_mA;
f476fbaba7b2051 Randy Dunlap         2008-02-13  707  	u8 portnum;
f476fbaba7b2051 Randy Dunlap         2008-02-13  708  	u8 level;
4998f1efd1904dd Jim Lin              2019-06-03  709  	u8 devaddr;
55c527187c9d78f Alan Stern           2005-11-23  710  
f476fbaba7b2051 Randy Dunlap         2008-02-13  711  	unsigned can_submit:1;
f476fbaba7b2051 Randy Dunlap         2008-02-13  712  	unsigned persist_enabled:1;
9c6d778800b921b Alan Stern           2022-08-26  713  	unsigned reset_in_progress:1;
f476fbaba7b2051 Randy Dunlap         2008-02-13  714  	unsigned have_langid:1;
f476fbaba7b2051 Randy Dunlap         2008-02-13  715  	unsigned authorized:1;
3b52f128aeacc4b Inaky Perez-Gonzalez 2008-04-08  716  	unsigned authenticated:1;
1ff4df56846d103 Andiry Xu            2011-09-23  717  	unsigned lpm_capable:1;
e146caf303493c4 Mathias Nyman        2022-05-06  718  	unsigned lpm_devinit_allow:1;
65580b4321eb36f Andiry Xu            2011-09-23  719  	unsigned usb2_hw_lpm_capable:1;
a558ccdcc71c777 Mathias Nyman        2013-05-23  720  	unsigned usb2_hw_lpm_besl_capable:1;
65580b4321eb36f Andiry Xu            2011-09-23  721  	unsigned usb2_hw_lpm_enabled:1;
de68bab4fa96014 Sarah Sharp          2013-09-30  722  	unsigned usb2_hw_lpm_allowed:1;
bf5ce5bf3cc7136 Lu Baolu             2015-11-14  723  	unsigned usb3_lpm_u1_enabled:1;
bf5ce5bf3cc7136 Lu Baolu             2015-11-14  724  	unsigned usb3_lpm_u2_enabled:1;
f476fbaba7b2051 Randy Dunlap         2008-02-13  725  	int string_langid;
^1da177e4c3f415 Linus Torvalds       2005-04-16  726  
4f62efe67f077db Alan Stern           2005-10-24  727  	/* static strings from the device */
f476fbaba7b2051 Randy Dunlap         2008-02-13  728  	char *product;
f476fbaba7b2051 Randy Dunlap         2008-02-13  729  	char *manufacturer;
f476fbaba7b2051 Randy Dunlap         2008-02-13  730  	char *serial;
4f62efe67f077db Alan Stern           2005-10-24  731  
^1da177e4c3f415 Linus Torvalds       2005-04-16  732  	struct list_head filelist;
^1da177e4c3f415 Linus Torvalds       2005-04-16  733  
f476fbaba7b2051 Randy Dunlap         2008-02-13  734  	int maxchild;
645daaab0b6adc3 Alan Stern           2006-08-30  735  
f476fbaba7b2051 Randy Dunlap         2008-02-13  736  	u32 quirks;
f476fbaba7b2051 Randy Dunlap         2008-02-13  737  	atomic_t urbnum;
b5e795f8df42936 Alan Stern           2007-02-20  738  
f476fbaba7b2051 Randy Dunlap         2008-02-13  739  	unsigned long active_duration;
1512300689426cb Sarah Sharp          2007-12-21  740  
f476fbaba7b2051 Randy Dunlap         2008-02-13  741  	unsigned long connect_time;
f476fbaba7b2051 Randy Dunlap         2008-02-13  742  
f476fbaba7b2051 Randy Dunlap         2008-02-13  743  	unsigned do_remote_wakeup:1;
f476fbaba7b2051 Randy Dunlap         2008-02-13  744  	unsigned reset_resume:1;
bfd1e910139be73 Alan Stern           2012-10-19  745  	unsigned port_is_suspended:1;
f46a6e165197126 Mathias Nyman        2024-08-30  746  	enum usb_link_tunnel_mode tunnel_mode;
7d24fae116cfa62 Heikki Krogerus      2025-06-11  747  	struct device_link *usb4_link;
130eac4170859fb Arnd Bergmann        2023-03-28  748  
c6515272b858742 Sarah Sharp          2009-04-27  749  	int slot_id;
17f34867e98d2fb Mathias Nyman        2013-05-23  750  	struct usb2_lpm_parameters l1_params;
51e0a01206613ad Sarah Sharp          2012-02-20  751  	struct usb3_lpm_parameters u1_params;
51e0a01206613ad Sarah Sharp          2012-02-20  752  	struct usb3_lpm_parameters u2_params;
1ea7e0e8e3d0f50 Sarah Sharp          2012-04-24  753  	unsigned lpm_disable_count;
886ee36e7205a7b Felipe Balbi         2017-12-14  754  
886ee36e7205a7b Felipe Balbi         2017-12-14  755  	u16 hub_delay;
77419aa403ca139 Bastien Nocera       2019-10-16  756  	unsigned use_generic_driver:1;
75adb09e2fd9643 Greg Kroah-Hartman   2024-02-29  757  
74bd9a178b015ab Guan-Yu Lin          2026-04-01  758  	ANDROID_KABI_USE(1, struct {
74bd9a178b015ab Guan-Yu Lin          2026-04-01  759  		unsigned offload_at_suspend:1;
74bd9a178b015ab Guan-Yu Lin          2026-04-01  760  		unsigned offload_pm_locked:1;
74bd9a178b015ab Guan-Yu Lin          2026-04-01  761  	});
11464453482d23c Guan-Yu Lin          2025-09-16  762  	ANDROID_KABI_USE(2, int offload_usage);
75adb09e2fd9643 Greg Kroah-Hartman   2024-02-29  763  	ANDROID_KABI_RESERVE(3);
75adb09e2fd9643 Greg Kroah-Hartman   2024-02-29  764  	ANDROID_KABI_RESERVE(4);
^1da177e4c3f415 Linus Torvalds       2005-04-16 @765  };
^1da177e4c3f415 Linus Torvalds       2005-04-16  766  

:::::: The code at line 765 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
