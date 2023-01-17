Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786FA1FB2
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Jan 2023 08:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673942902; x=1705478902;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0aXpA/ToFXkIU3lG2n27I5mJPxRhmaN1kGtgt05TaKs=;
  b=GONuyBtHkVauo4IZ49AGyh7Ig6OHUWQqlENS1Gt/MZw7H9lcR7kAd+Bq
   itT4jjZH1ex215qitWcOZT1YV2VGKA/g3sKVPNJ6knkCbK+NnjMRSBs/s
   nR7RdGnBvsfGUh9W/rXB1XSGkSabSzlK8gcH52rzIabtBHhl0fBLkaEax
   kZBhGP6zoC0Nf0AOBRZHEouUH+Bmzcbi6RgvcK+n16WTpw0eyh/7otDon
   g7o60hFfxBC3DYv4Z5jP9Us7gZO2mt9s0/e3PzoKbc3TLbDRrNjrkdh0O
   ekqC8mqknLx/HLzSN/N07v867jaGRRMbK6PfFrfSkvE3ONZUqJduln+16
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="325915717"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; 
   d="scan'208";a="325915717"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2023 00:08:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="904560550"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; 
   d="scan'208";a="904560550"
Received: from lkp-server02.sh.intel.com (HELO f57cd993bc73) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 17 Jan 2023 00:08:20 -0800
Received: from kbuild by f57cd993bc73 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pHh11-00015O-2A;
	Tue, 17 Jan 2023 08:08:19 +0000
Date: Tue, 17 Jan 2023 16:08:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 4223/5186]
 drivers/firmware/arm_scmi/bus.c:156:24: warning: Uninitialized variable:
 victim->id_table [uninitvar]
Message-ID: <202301171510.v4Oopzik-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/firmware/arm_scmi/bus.c:156:24: warning: Uninitialized variable: victim->id_table [uninitvar]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Cristian Marussi <cristian.marussi@arm.com>
CC: Sudeep Holla <sudeep.holla@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9ce08dd7ea24253aac5fd2519f9aea27dfb390c9
commit: 3dd039056f8d8dd2ee5909bac5298f14ffca6428 [4223/5186] firmware: arm_scmi: Refactor protocol device creation
:::::: branch date: 4 hours ago
:::::: commit date: 34 hours ago
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 3dd039056f8d8dd2ee5909bac5298f14ffca6428
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/firmware/arm_scmi/bus.c:156:24: warning: Uninitialized variable: victim->id_table [uninitvar]
      if (!strcmp(victim->id_table->name, id_table->name)) {
                          ^
--
>> drivers/gpio/gpio-mxc.c:550:31: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
     if ((port->wakeup_pads & (1 << i))) {
                                 ^
   drivers/gpio/gpio-mxc.c:549:16: note: Assuming that condition 'i<32' is not redundant
    for (i = 0; i < 32; i++) {
                  ^
   drivers/gpio/gpio-mxc.c:550:31: note: Shift
     if ((port->wakeup_pads & (1 << i))) {
                                 ^
>> drivers/gpio/gpio-mxc.c:550:31: warning: Signed integer overflow for expression '1<<i'. [integerOverflow]
     if ((port->wakeup_pads & (1 << i))) {
                                 ^
   drivers/gpio/gpio-mxc.c:549:16: note: Assuming that condition 'i<32' is not redundant
    for (i = 0; i < 32; i++) {
                  ^
   drivers/gpio/gpio-mxc.c:550:31: note: Integer overflow
     if ((port->wakeup_pads & (1 << i))) {
                                 ^
>> drivers/gpio/gpio-mxc.c:293:32: warning: Uninitialized variable: port->hwdata [uninitvar]
     irq_msk = readl(port->base + GPIO_IMR);
                                  ^
>> drivers/gpio/gpio-mxc.c:596:22: warning: Uninitialized variables: port.node, port.clk, port.irq, port.irq_high, port.domain, port.gc, port.dev, port.both_edges, port.gpio_saved_reg, port.power_off, port.wakeup_pads, port.is_pad_wakeup, port.hwdata [uninitvar]
     mxc_gpio_save_regs(port);
                        ^
>> drivers/gpio/gpio-mxc.c:615:25: warning: Uninitialized variables: port.node, port.irq, port.irq_high, port.domain, port.gc, port.dev, port.both_edges, port.gpio_saved_reg, port.power_off, port.wakeup_pads, port.is_pad_wakeup, port.hwdata [uninitvar]
     mxc_gpio_restore_regs(port);
                           ^
   drivers/gpio/gpio-mxc.c:611:7: note: Assuming condition is false
     if (ret) {
         ^
   drivers/gpio/gpio-mxc.c:615:25: note: Uninitialized variables: port.node, port.irq, port.irq_high, port.domain, port.gc, port.dev, port.both_edges, port.gpio_saved_reg, port.power_off, port.wakeup_pads, port.is_pad_wakeup, port.hwdata
     mxc_gpio_restore_regs(port);
                           ^
--
>> drivers/firmware/arm_scmi/virtio.c:341:12: warning: Uninitialized variable: msg->poll_status [uninitvar]
     if (msg->poll_status == VIO_MSG_NOT_POLLED)
              ^
   drivers/firmware/arm_scmi/virtio.c:322:6: note: Assuming condition is false
    if (!scmi_vio_channel_acquire(vioch))
        ^
   drivers/firmware/arm_scmi/virtio.c:341:12: note: Uninitialized variable: msg->poll_status
     if (msg->poll_status == VIO_MSG_NOT_POLLED)
              ^

vim +156 drivers/firmware/arm_scmi/bus.c

3dd039056f8d8d Cristian Marussi 2022-12-22  132  
3dd039056f8d8d Cristian Marussi 2022-12-22  133  /**
3dd039056f8d8d Cristian Marussi 2022-12-22  134   * scmi_protocol_device_unrequest  - Helper to unrequest a device
3dd039056f8d8d Cristian Marussi 2022-12-22  135   *
3dd039056f8d8d Cristian Marussi 2022-12-22  136   * @id_table: A protocol/name pair descriptor for the device to be unrequested.
3dd039056f8d8d Cristian Marussi 2022-12-22  137   *
3dd039056f8d8d Cristian Marussi 2022-12-22  138   * The unrequested device, described by the provided id_table, is at first
3dd039056f8d8d Cristian Marussi 2022-12-22  139   * removed from the IDR @scmi_requested_devices and then the removal is
3dd039056f8d8d Cristian Marussi 2022-12-22  140   * advertised to any registered party via the @scmi_requested_devices_nh
3dd039056f8d8d Cristian Marussi 2022-12-22  141   * notification chain.
3dd039056f8d8d Cristian Marussi 2022-12-22  142   */
3dd039056f8d8d Cristian Marussi 2022-12-22  143  static void scmi_protocol_device_unrequest(const struct scmi_device_id *id_table)
3dd039056f8d8d Cristian Marussi 2022-12-22  144  {
3dd039056f8d8d Cristian Marussi 2022-12-22  145  	struct list_head *phead;
3dd039056f8d8d Cristian Marussi 2022-12-22  146  
3dd039056f8d8d Cristian Marussi 2022-12-22  147  	pr_debug("Unrequesting SCMI device (%s) for protocol %x\n",
3dd039056f8d8d Cristian Marussi 2022-12-22  148  		 id_table->name, id_table->protocol_id);
3dd039056f8d8d Cristian Marussi 2022-12-22  149  
3dd039056f8d8d Cristian Marussi 2022-12-22  150  	mutex_lock(&scmi_requested_devices_mtx);
3dd039056f8d8d Cristian Marussi 2022-12-22  151  	phead = idr_find(&scmi_requested_devices, id_table->protocol_id);
3dd039056f8d8d Cristian Marussi 2022-12-22  152  	if (phead) {
3dd039056f8d8d Cristian Marussi 2022-12-22  153  		struct scmi_requested_dev *victim, *tmp;
3dd039056f8d8d Cristian Marussi 2022-12-22  154  
3dd039056f8d8d Cristian Marussi 2022-12-22  155  		list_for_each_entry_safe(victim, tmp, phead, node) {
3dd039056f8d8d Cristian Marussi 2022-12-22 @156  			if (!strcmp(victim->id_table->name, id_table->name)) {
3dd039056f8d8d Cristian Marussi 2022-12-22  157  				list_del(&victim->node);
3dd039056f8d8d Cristian Marussi 2022-12-22  158  
3dd039056f8d8d Cristian Marussi 2022-12-22  159  				mutex_unlock(&scmi_requested_devices_mtx);
3dd039056f8d8d Cristian Marussi 2022-12-22  160  				blocking_notifier_call_chain(&scmi_requested_devices_nh,
3dd039056f8d8d Cristian Marussi 2022-12-22  161  							     SCMI_BUS_NOTIFY_DEVICE_UNREQUEST,
3dd039056f8d8d Cristian Marussi 2022-12-22  162  							     (void *)victim->id_table);
3dd039056f8d8d Cristian Marussi 2022-12-22  163  				kfree(victim);
3dd039056f8d8d Cristian Marussi 2022-12-22  164  				mutex_lock(&scmi_requested_devices_mtx);
3dd039056f8d8d Cristian Marussi 2022-12-22  165  				break;
3dd039056f8d8d Cristian Marussi 2022-12-22  166  			}
3dd039056f8d8d Cristian Marussi 2022-12-22  167  		}
3dd039056f8d8d Cristian Marussi 2022-12-22  168  
3dd039056f8d8d Cristian Marussi 2022-12-22  169  		if (list_empty(phead)) {
3dd039056f8d8d Cristian Marussi 2022-12-22  170  			idr_remove(&scmi_requested_devices,
3dd039056f8d8d Cristian Marussi 2022-12-22  171  				   id_table->protocol_id);
3dd039056f8d8d Cristian Marussi 2022-12-22  172  			kfree(phead);
3dd039056f8d8d Cristian Marussi 2022-12-22  173  		}
3dd039056f8d8d Cristian Marussi 2022-12-22  174  	}
3dd039056f8d8d Cristian Marussi 2022-12-22  175  	mutex_unlock(&scmi_requested_devices_mtx);
3dd039056f8d8d Cristian Marussi 2022-12-22  176  }
3dd039056f8d8d Cristian Marussi 2022-12-22  177  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
