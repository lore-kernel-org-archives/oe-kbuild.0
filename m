Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C3723A3
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Oct 2022 10:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666954776; x=1698490776;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gFE0LzoyZ+CsEEru1jAQsfU4yRDj8bIFwD7lfR/EUSM=;
  b=MWixgfT4LXdS9dmrdFD+tFKFfNiTsiFi+/5ibDe+bZfBDad3ETk9zBFG
   HgYi1dXLjNolGg6oXEI5qwLS0jtoOfYekzmZwv8tuU8A1bZXXpLVk/tz4
   ZwOVhQJce5A0uk9uCQtFj3Aart9KIt3UVGueH+okKwMRUdiICB3xGQZtz
   yCgsuivZNmzqx//TxiXMT1cPxjXAM+bBcXcEVkYyvvc+2pcpl3D6/WxOH
   bHrioEmD6gKJZxQhjl3MQa38FbBx+6YA7b9So2WOG9iYKk5Ed3k1g+DhH
   hOibIs86VWX1mEm3k0TTZp2Sw8mUfCC7dSH4YEZWG0RgciQS+s7mmN6Ve
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="372679031"
X-IronPort-AV: E=Sophos;i="5.95,220,1661842800"; 
   d="scan'208";a="372679031"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2022 03:59:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="610706827"
X-IronPort-AV: E=Sophos;i="5.95,220,1661842800"; 
   d="scan'208";a="610706827"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 28 Oct 2022 03:59:34 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ooN5J-0009pb-1J;
	Fri, 28 Oct 2022 10:59:33 +0000
Date: Fri, 28 Oct 2022 18:58:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 3110/4127]
 drivers/net/can/usb/kvaser_usb/kvaser_usb_core.c:555:6: warning: Redundant
 initialization for 'err'. The initialized value is overwritten before it is
 read. [redundantInitialization]
Message-ID: <202210281819.BZFwY8El-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/net/can/usb/kvaser_usb/kvaser_usb_core.c:555:6: warning: Redundant initialization for 'err'. The initialized value is overwritten before it is read. [redundantInitialization]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Jimmy Assarsson <extja@kvaser.com>
CC: "Marc Kleine-Budde" <mkl@pengutronix.de>
CC: Anssi Hannula <anssi.hannula@bitwise.fi>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fd8dab197cca2746e1fcd399a218eec5164726d4
commit: 39d3df6b0ea80f9b515c632ca07b39b1c156edee [3110/4127] can: kvaser_usb: Compare requested bittiming parameters with actual parameters in do_set_{,data}_bittiming
:::::: branch date: 7 hours ago
:::::: commit date: 2 days ago
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 39d3df6b0ea80f9b515c632ca07b39b1c156edee
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/net/can/usb/kvaser_usb/kvaser_usb_core.c:555:6: warning: Redundant initialization for 'err'. The initialized value is overwritten before it is read. [redundantInitialization]
    err = ops->dev_set_bittiming(netdev, &busparams);
        ^
   drivers/net/can/usb/kvaser_usb/kvaser_usb_core.c:544:10: note: err is initialized
    int err = -EOPNOTSUPP;
            ^
   drivers/net/can/usb/kvaser_usb/kvaser_usb_core.c:555:6: note: err is overwritten
    err = ops->dev_set_bittiming(netdev, &busparams);
        ^
--
>> drivers/net/ieee802154/mcr20a.c:388:54: warning: Operator '|' with one operand equal to zero is redundant. [badBitmaskCheck]
    .write_flag_mask = REGISTER_ACCESS | REGISTER_WRITE | IAR_INDEX,
                                                        ^
>> drivers/net/ethernet/microchip/lan743x_ethtool.c:442:33: warning: Parameter 'data' can be declared as pointer to const [constParameter]
       u32 offset, u32 length, u8 *data)
                                   ^
   drivers/net/ethernet/microchip/lan743x_ethtool.c:536:36: warning: Parameter 'data' can be declared as pointer to const [constParameter]
          u32 offset, u32 length, u8 *data)
                                      ^
>> drivers/net/phy/micrel.c:2043:9: warning: Uninitialized variable: ret [uninitvar]
    return ret;
           ^
   drivers/net/phy/micrel.c:2021:19: note: Assuming condition is false
    while (pair_mask && retries--) {
                     ^
   drivers/net/phy/micrel.c:2043:9: note: Uninitialized variable: ret
    return ret;
           ^
>> drivers/net/phy/micrel.c:2323:24: warning: Uninitialized variable: &rx_ts->seq_id [uninitvar]
     if (memcmp(&skb_sig, &rx_ts->seq_id, sizeof(rx_ts->seq_id)))
                          ^
--
>> drivers/net/ethernet/microchip/lan743x_main.c:532:6: warning: Redundant initialization for 'ret'. The initialized value is overwritten before it is read. [redundantInitialization]
    ret = pci_enable_msix_range(adapter->pdev,
        ^
   drivers/net/ethernet/microchip/lan743x_main.c:519:10: note: ret is initialized
    int ret = -ENODEV;
            ^
   drivers/net/ethernet/microchip/lan743x_main.c:532:6: note: ret is overwritten
    ret = pci_enable_msix_range(adapter->pdev,
        ^
>> drivers/net/ethernet/microchip/lan743x_main.c:3522:49: warning: Operator '|' with one operand equal to zero is redundant. [badBitmaskCheck]
         MAC_WUF_CFG_EN_ | MAC_WUF_CFG_TYPE_MCAST_ |
                                                   ^
   drivers/net/ethernet/microchip/lan743x_main.c:3534:49: warning: Operator '|' with one operand equal to zero is redundant. [badBitmaskCheck]
         MAC_WUF_CFG_EN_ | MAC_WUF_CFG_TYPE_MCAST_ |
                                                   ^
   drivers/net/ethernet/microchip/lan743x_main.c:3554:47: warning: Operator '|' with one operand equal to zero is redundant. [badBitmaskCheck]
         MAC_WUF_CFG_EN_ | MAC_WUF_CFG_TYPE_ALL_ |
                                                 ^

vim +/err +555 drivers/net/can/usb/kvaser_usb/kvaser_usb_core.c

7259124eac7d1b Jimmy Assarsson 2018-07-18  532  
39d3df6b0ea80f Jimmy Assarsson 2022-10-10  533  static int kvaser_usb_set_bittiming(struct net_device *netdev)
39d3df6b0ea80f Jimmy Assarsson 2022-10-10  534  {
39d3df6b0ea80f Jimmy Assarsson 2022-10-10  535  	struct kvaser_usb_net_priv *priv = netdev_priv(netdev);
39d3df6b0ea80f Jimmy Assarsson 2022-10-10  536  	struct kvaser_usb *dev = priv->dev;
39d3df6b0ea80f Jimmy Assarsson 2022-10-10  537  	const struct kvaser_usb_dev_ops *ops = dev->driver_info->ops;
39d3df6b0ea80f Jimmy Assarsson 2022-10-10  538  	struct can_bittiming *bt = &priv->can.bittiming;
39d3df6b0ea80f Jimmy Assarsson 2022-10-10  539  
39d3df6b0ea80f Jimmy Assarsson 2022-10-10  540  	struct kvaser_usb_busparams busparams;
39d3df6b0ea80f Jimmy Assarsson 2022-10-10  541  	int tseg1 = bt->prop_seg + bt->phase_seg1;
39d3df6b0ea80f Jimmy Assarsson 2022-10-10  542  	int tseg2 = bt->phase_seg2;
39d3df6b0ea80f Jimmy Assarsson 2022-10-10  543  	int sjw = bt->sjw;
39d3df6b0ea80f Jimmy Assarsson 2022-10-10  544  	int err = -EOPNOTSUPP;
39d3df6b0ea80f Jimmy Assarsson 2022-10-10  545  
39d3df6b0ea80f Jimmy Assarsson 2022-10-10  546  	busparams.bitrate = cpu_to_le32(bt->bitrate);
39d3df6b0ea80f Jimmy Assarsson 2022-10-10  547  	busparams.sjw = (u8)sjw;
39d3df6b0ea80f Jimmy Assarsson 2022-10-10  548  	busparams.tseg1 = (u8)tseg1;
39d3df6b0ea80f Jimmy Assarsson 2022-10-10  549  	busparams.tseg2 = (u8)tseg2;
39d3df6b0ea80f Jimmy Assarsson 2022-10-10  550  	if (priv->can.ctrlmode & CAN_CTRLMODE_3_SAMPLES)
39d3df6b0ea80f Jimmy Assarsson 2022-10-10  551  		busparams.nsamples = 3;
39d3df6b0ea80f Jimmy Assarsson 2022-10-10  552  	else
39d3df6b0ea80f Jimmy Assarsson 2022-10-10  553  		busparams.nsamples = 1;
39d3df6b0ea80f Jimmy Assarsson 2022-10-10  554  
39d3df6b0ea80f Jimmy Assarsson 2022-10-10 @555  	err = ops->dev_set_bittiming(netdev, &busparams);
39d3df6b0ea80f Jimmy Assarsson 2022-10-10  556  	if (err)
39d3df6b0ea80f Jimmy Assarsson 2022-10-10  557  		return err;
39d3df6b0ea80f Jimmy Assarsson 2022-10-10  558  
39d3df6b0ea80f Jimmy Assarsson 2022-10-10  559  	err = kvaser_usb_setup_rx_urbs(priv->dev);
39d3df6b0ea80f Jimmy Assarsson 2022-10-10  560  	if (err)
39d3df6b0ea80f Jimmy Assarsson 2022-10-10  561  		return err;
39d3df6b0ea80f Jimmy Assarsson 2022-10-10  562  
39d3df6b0ea80f Jimmy Assarsson 2022-10-10  563  	err = ops->dev_get_busparams(priv);
39d3df6b0ea80f Jimmy Assarsson 2022-10-10  564  	if (err) {
39d3df6b0ea80f Jimmy Assarsson 2022-10-10  565  		/* Treat EOPNOTSUPP as success */
39d3df6b0ea80f Jimmy Assarsson 2022-10-10  566  		if (err == -EOPNOTSUPP)
39d3df6b0ea80f Jimmy Assarsson 2022-10-10  567  			err = 0;
39d3df6b0ea80f Jimmy Assarsson 2022-10-10  568  		return err;
39d3df6b0ea80f Jimmy Assarsson 2022-10-10  569  	}
39d3df6b0ea80f Jimmy Assarsson 2022-10-10  570  
39d3df6b0ea80f Jimmy Assarsson 2022-10-10  571  	if (memcmp(&busparams, &priv->busparams_nominal,
39d3df6b0ea80f Jimmy Assarsson 2022-10-10  572  		   sizeof(priv->busparams_nominal)) != 0)
39d3df6b0ea80f Jimmy Assarsson 2022-10-10  573  		err = -EINVAL;
39d3df6b0ea80f Jimmy Assarsson 2022-10-10  574  
39d3df6b0ea80f Jimmy Assarsson 2022-10-10  575  	return err;
39d3df6b0ea80f Jimmy Assarsson 2022-10-10  576  }
39d3df6b0ea80f Jimmy Assarsson 2022-10-10  577  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
