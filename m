Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B9F15E97
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Dec 2025 03:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765682387; cv=none; b=PqbqPDUOBJL3U8v8h3NghMMe62iYnRIRkXKqKpYHahjAxm69Fia5u+MOjb2tpjG9v84v/a5TbvF+e76Gg0NOOTMbXBwJi7ABh/e3UvhpdXa/lEJVNkxvAKWGSDpuZxDa4UQGwHhtwd5lBzqBT1GpyXCmtKWjaK0YomfS3CmWK1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765682387; c=relaxed/simple;
	bh=MaA08KeoI6j6On5JgN4FhQUgjr5ywR4Df9k69XiPgMM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mJaW9cSJClRWxoOJDAeP7PAhJZUigVI6Ljqj8WWgjQwePaELOPJf/G2dbT82i8493d6POvhdVKXvtxuR+hmefMJMdmUJae7LNLIHpZhMMS009lNBc3rIpSsqUQBawSoql2uz6RgI1D5RMCcWUH+Cj6RIBbgGEawrQY94gi3RSuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fRhD1J4r; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fRhD1J4r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765682386; x=1797218386;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MaA08KeoI6j6On5JgN4FhQUgjr5ywR4Df9k69XiPgMM=;
  b=fRhD1J4rNDJU3xwN6jexFTwgbhQFViVdGI07er9L02MRA9utCqzzZkbl
   ynjwC+S1BA0wExPNof4sdovpifqzXgJFE8wkD5POi29aCOXrw5Zi2G3zH
   gTzbkiNlE68CuNok/EZ3u99OEDpUifHJuqoAwDEsPYHesiw5bfuzu8cO+
   53E/WQwFhEgsnveZAZcEWRpRzhKdWfkb9EGZAAedCArC019Phu251YuYC
   jspCxQuRUNGpnZXVPLsxYPOI8nhPbtKfS1EVUx+LXF4xh9GzH4pub0Jfz
   DI1uswDNmUa0BxzVkmFqQ9Z0cDOKp75LgxfGBvVhx0/S07I7G24KYEcU0
   A==;
X-CSE-ConnectionGUID: FbWxYYxTS12jMwRQwEQ/nw==
X-CSE-MsgGUID: mWJfuP1pRMaUjGM63fUS4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67670104"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="67670104"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 19:19:45 -0800
X-CSE-ConnectionGUID: 4N/VjIHiR0G1quHn40s/YA==
X-CSE-MsgGUID: 5TkwfFhbSH+GAIUbHJUuSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="198257757"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Dec 2025 19:19:43 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUce5-000000008WT-15W7;
	Sun, 14 Dec 2025 03:19:41 +0000
Date: Sun, 14 Dec 2025 11:19:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/isdn/hardware/mISDN/hfcsusb.c:1327 tx_iso_complete() error:
 we previously assumed 'tx_skb' could be null (see line 1246)
Message-ID: <202512141119.RUH21oOT-lkp@intel.com>
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
TO: Tiwei Bie <tiwei.btw@antgroup.com>
CC: Johannes Berg <johannes.berg@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4a298a43f5e339f48d2dda0665c02b88ee9a4e03
commit: a0e2cb6a90634f3dc80f16e882a683ee5761b0b0 um: Add VFIO-based virtual PCI driver
date:   7 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 7 months ago
config: um-randconfig-r072-20251214 (https://download.01.org/0day-ci/archive/20251214/202512141119.RUH21oOT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512141119.RUH21oOT-lkp@intel.com/

smatch warnings:
drivers/isdn/hardware/mISDN/hfcsusb.c:1327 tx_iso_complete() error: we previously assumed 'tx_skb' could be null (see line 1246)
drivers/net/can/usb/kvaser_usb/kvaser_usb_leaf.c:1190 kvaser_usb_leaf_rx_error() error: we previously assumed 'cf' could be null (see line 1173)
drivers/net/ethernet/broadcom/bnxt/bnxt_tc.c:1556 bnxt_tc_add_flow() warn: missing unwind goto?
drivers/net/ethernet/fungible/funcore/fun_queue.c:518 fun_request_irq() warn: excess argument passed to 'snprintf'
drivers/net/ethernet/fungible/funeth/funeth_main.c:281 fun_alloc_qirq() warn: passing zero to 'ERR_PTR'
drivers/net/ethernet/sfc/falcon/efx.c:2370 ef4_reset_up() warn: missing error code 'rc'
drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:3535 ixgbe_request_msix_irqs() warn: 'entry->vector' from request_irq() not released on lines: 3535.
drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:9852 parse_tc_actions() warn: iterator 'i' not incremented

vim +/tx_skb +1327 drivers/isdn/hardware/mISDN/hfcsusb.c

69f52adb2d534a Karsten Keil              2009-01-09  1155  
69f52adb2d534a Karsten Keil              2009-01-09  1156  /* transmit completion routine for all ISO tx fifos */
69f52adb2d534a Karsten Keil              2009-01-09  1157  static void
69f52adb2d534a Karsten Keil              2009-01-09  1158  tx_iso_complete(struct urb *urb)
69f52adb2d534a Karsten Keil              2009-01-09  1159  {
69f52adb2d534a Karsten Keil              2009-01-09  1160  	struct iso_urb *context_iso_urb = (struct iso_urb *) urb->context;
69f52adb2d534a Karsten Keil              2009-01-09  1161  	struct usb_fifo *fifo = context_iso_urb->owner_fifo;
69f52adb2d534a Karsten Keil              2009-01-09  1162  	struct hfcsusb *hw = fifo->hw;
69f52adb2d534a Karsten Keil              2009-01-09  1163  	struct sk_buff *tx_skb;
69f52adb2d534a Karsten Keil              2009-01-09  1164  	int k, tx_offset, num_isoc_packets, sink, remain, current_len,
69f52adb2d534a Karsten Keil              2009-01-09  1165  		errcode, hdlc, i;
69f52adb2d534a Karsten Keil              2009-01-09  1166  	int *tx_idx;
6d1ee48fd0d8d2 Karsten Keil              2012-05-15  1167  	int frame_complete, fifon, status, fillempty = 0;
6d1ee48fd0d8d2 Karsten Keil              2012-05-15  1168  	__u8 threshbit, *p;
16630f54fe28fb Sebastian Andrzej Siewior 2018-06-20  1169  	unsigned long flags;
69f52adb2d534a Karsten Keil              2009-01-09  1170  
16630f54fe28fb Sebastian Andrzej Siewior 2018-06-20  1171  	spin_lock_irqsave(&hw->lock, flags);
69f52adb2d534a Karsten Keil              2009-01-09  1172  	if (fifo->stop_gracefull) {
69f52adb2d534a Karsten Keil              2009-01-09  1173  		fifo->stop_gracefull = 0;
69f52adb2d534a Karsten Keil              2009-01-09  1174  		fifo->active = 0;
16630f54fe28fb Sebastian Andrzej Siewior 2018-06-20  1175  		spin_unlock_irqrestore(&hw->lock, flags);
69f52adb2d534a Karsten Keil              2009-01-09  1176  		return;
69f52adb2d534a Karsten Keil              2009-01-09  1177  	}
69f52adb2d534a Karsten Keil              2009-01-09  1178  
69f52adb2d534a Karsten Keil              2009-01-09  1179  	if (fifo->dch) {
69f52adb2d534a Karsten Keil              2009-01-09  1180  		tx_skb = fifo->dch->tx_skb;
69f52adb2d534a Karsten Keil              2009-01-09  1181  		tx_idx = &fifo->dch->tx_idx;
69f52adb2d534a Karsten Keil              2009-01-09  1182  		hdlc = 1;
69f52adb2d534a Karsten Keil              2009-01-09  1183  	} else if (fifo->bch) {
69f52adb2d534a Karsten Keil              2009-01-09  1184  		tx_skb = fifo->bch->tx_skb;
69f52adb2d534a Karsten Keil              2009-01-09  1185  		tx_idx = &fifo->bch->tx_idx;
69f52adb2d534a Karsten Keil              2009-01-09  1186  		hdlc = test_bit(FLG_HDLC, &fifo->bch->Flags);
6d1ee48fd0d8d2 Karsten Keil              2012-05-15  1187  		if (!tx_skb && !hdlc &&
6d1ee48fd0d8d2 Karsten Keil              2012-05-15  1188  		    test_bit(FLG_FILLEMPTY, &fifo->bch->Flags))
6d1ee48fd0d8d2 Karsten Keil              2012-05-15  1189  			fillempty = 1;
69f52adb2d534a Karsten Keil              2009-01-09  1190  	} else {
69f52adb2d534a Karsten Keil              2009-01-09  1191  		printk(KERN_DEBUG "%s: %s: neither BCH nor DCH\n",
69f52adb2d534a Karsten Keil              2009-01-09  1192  		       hw->name, __func__);
16630f54fe28fb Sebastian Andrzej Siewior 2018-06-20  1193  		spin_unlock_irqrestore(&hw->lock, flags);
69f52adb2d534a Karsten Keil              2009-01-09  1194  		return;
69f52adb2d534a Karsten Keil              2009-01-09  1195  	}
69f52adb2d534a Karsten Keil              2009-01-09  1196  
69f52adb2d534a Karsten Keil              2009-01-09  1197  	fifon = fifo->fifonum;
69f52adb2d534a Karsten Keil              2009-01-09  1198  	status = urb->status;
69f52adb2d534a Karsten Keil              2009-01-09  1199  
69f52adb2d534a Karsten Keil              2009-01-09  1200  	tx_offset = 0;
69f52adb2d534a Karsten Keil              2009-01-09  1201  
69f52adb2d534a Karsten Keil              2009-01-09  1202  	/*
69f52adb2d534a Karsten Keil              2009-01-09  1203  	 * ISO transfer only partially completed,
69f52adb2d534a Karsten Keil              2009-01-09  1204  	 * look at individual frame status for details
69f52adb2d534a Karsten Keil              2009-01-09  1205  	 */
69f52adb2d534a Karsten Keil              2009-01-09  1206  	if (status == -EXDEV) {
69f52adb2d534a Karsten Keil              2009-01-09  1207  		if (debug & DBG_HFC_URB_ERROR)
69f52adb2d534a Karsten Keil              2009-01-09  1208  			printk(KERN_DEBUG "%s: %s: "
69f52adb2d534a Karsten Keil              2009-01-09  1209  			       "-EXDEV (%i) fifon (%d)\n",
69f52adb2d534a Karsten Keil              2009-01-09  1210  			       hw->name, __func__, status, fifon);
69f52adb2d534a Karsten Keil              2009-01-09  1211  
69f52adb2d534a Karsten Keil              2009-01-09  1212  		/* clear status, so go on with ISO transfers */
69f52adb2d534a Karsten Keil              2009-01-09  1213  		status = 0;
69f52adb2d534a Karsten Keil              2009-01-09  1214  	}
69f52adb2d534a Karsten Keil              2009-01-09  1215  
69f52adb2d534a Karsten Keil              2009-01-09  1216  	if (fifo->active && !status) {
69f52adb2d534a Karsten Keil              2009-01-09  1217  		/* is FifoFull-threshold set for our channel? */
69f52adb2d534a Karsten Keil              2009-01-09  1218  		threshbit = (hw->threshold_mask & (1 << fifon));
69f52adb2d534a Karsten Keil              2009-01-09  1219  		num_isoc_packets = iso_packets[fifon];
69f52adb2d534a Karsten Keil              2009-01-09  1220  
69f52adb2d534a Karsten Keil              2009-01-09  1221  		/* predict dataflow to avoid fifo overflow */
69f52adb2d534a Karsten Keil              2009-01-09  1222  		if (fifon >= HFCUSB_D_TX)
69f52adb2d534a Karsten Keil              2009-01-09  1223  			sink = (threshbit) ? SINK_DMIN : SINK_DMAX;
69f52adb2d534a Karsten Keil              2009-01-09  1224  		else
69f52adb2d534a Karsten Keil              2009-01-09  1225  			sink = (threshbit) ? SINK_MIN : SINK_MAX;
69f52adb2d534a Karsten Keil              2009-01-09  1226  		fill_isoc_urb(urb, fifo->hw->dev, fifo->pipe,
69f52adb2d534a Karsten Keil              2009-01-09  1227  			      context_iso_urb->buffer, num_isoc_packets,
69f52adb2d534a Karsten Keil              2009-01-09  1228  			      fifo->usb_packet_maxlen, fifo->intervall,
69f52adb2d534a Karsten Keil              2009-01-09  1229  			      (usb_complete_t)tx_iso_complete, urb->context);
69f52adb2d534a Karsten Keil              2009-01-09  1230  		memset(context_iso_urb->buffer, 0,
69f52adb2d534a Karsten Keil              2009-01-09  1231  		       sizeof(context_iso_urb->buffer));
69f52adb2d534a Karsten Keil              2009-01-09  1232  		frame_complete = 0;
69f52adb2d534a Karsten Keil              2009-01-09  1233  
69f52adb2d534a Karsten Keil              2009-01-09  1234  		for (k = 0; k < num_isoc_packets; ++k) {
69f52adb2d534a Karsten Keil              2009-01-09  1235  			/* analyze tx success of previous ISO packets */
69f52adb2d534a Karsten Keil              2009-01-09  1236  			if (debug & DBG_HFC_URB_ERROR) {
69f52adb2d534a Karsten Keil              2009-01-09  1237  				errcode = urb->iso_frame_desc[k].status;
69f52adb2d534a Karsten Keil              2009-01-09  1238  				if (errcode) {
69f52adb2d534a Karsten Keil              2009-01-09  1239  					printk(KERN_DEBUG "%s: %s: "
69f52adb2d534a Karsten Keil              2009-01-09  1240  					       "ISO packet %i, status: %i\n",
69f52adb2d534a Karsten Keil              2009-01-09  1241  					       hw->name, __func__, k, errcode);
69f52adb2d534a Karsten Keil              2009-01-09  1242  				}
69f52adb2d534a Karsten Keil              2009-01-09  1243  			}
69f52adb2d534a Karsten Keil              2009-01-09  1244  
69f52adb2d534a Karsten Keil              2009-01-09  1245  			/* Generate next ISO Packets */
69f52adb2d534a Karsten Keil              2009-01-09 @1246  			if (tx_skb)
69f52adb2d534a Karsten Keil              2009-01-09  1247  				remain = tx_skb->len - *tx_idx;
6d1ee48fd0d8d2 Karsten Keil              2012-05-15  1248  			else if (fillempty)
6d1ee48fd0d8d2 Karsten Keil              2012-05-15  1249  				remain = 15; /* > not complete */
69f52adb2d534a Karsten Keil              2009-01-09  1250  			else
69f52adb2d534a Karsten Keil              2009-01-09  1251  				remain = 0;
69f52adb2d534a Karsten Keil              2009-01-09  1252  
69f52adb2d534a Karsten Keil              2009-01-09  1253  			if (remain > 0) {
69f52adb2d534a Karsten Keil              2009-01-09  1254  				fifo->bit_line -= sink;
69f52adb2d534a Karsten Keil              2009-01-09  1255  				current_len = (0 - fifo->bit_line) / 8;
69f52adb2d534a Karsten Keil              2009-01-09  1256  				if (current_len > 14)
69f52adb2d534a Karsten Keil              2009-01-09  1257  					current_len = 14;
69f52adb2d534a Karsten Keil              2009-01-09  1258  				if (current_len < 0)
69f52adb2d534a Karsten Keil              2009-01-09  1259  					current_len = 0;
69f52adb2d534a Karsten Keil              2009-01-09  1260  				if (remain < current_len)
69f52adb2d534a Karsten Keil              2009-01-09  1261  					current_len = remain;
69f52adb2d534a Karsten Keil              2009-01-09  1262  
69f52adb2d534a Karsten Keil              2009-01-09  1263  				/* how much bit do we put on the line? */
69f52adb2d534a Karsten Keil              2009-01-09  1264  				fifo->bit_line += current_len * 8;
69f52adb2d534a Karsten Keil              2009-01-09  1265  
69f52adb2d534a Karsten Keil              2009-01-09  1266  				context_iso_urb->buffer[tx_offset] = 0;
69f52adb2d534a Karsten Keil              2009-01-09  1267  				if (current_len == remain) {
69f52adb2d534a Karsten Keil              2009-01-09  1268  					if (hdlc) {
69f52adb2d534a Karsten Keil              2009-01-09  1269  						/* signal frame completion */
69f52adb2d534a Karsten Keil              2009-01-09  1270  						context_iso_urb->
69f52adb2d534a Karsten Keil              2009-01-09  1271  							buffer[tx_offset] = 1;
69f52adb2d534a Karsten Keil              2009-01-09  1272  						/* add 2 byte flags and 16bit
69f52adb2d534a Karsten Keil              2009-01-09  1273  						 * CRC at end of ISDN frame */
69f52adb2d534a Karsten Keil              2009-01-09  1274  						fifo->bit_line += 32;
69f52adb2d534a Karsten Keil              2009-01-09  1275  					}
69f52adb2d534a Karsten Keil              2009-01-09  1276  					frame_complete = 1;
69f52adb2d534a Karsten Keil              2009-01-09  1277  				}
69f52adb2d534a Karsten Keil              2009-01-09  1278  
69f52adb2d534a Karsten Keil              2009-01-09  1279  				/* copy tx data to iso-urb buffer */
6d1ee48fd0d8d2 Karsten Keil              2012-05-15  1280  				p = context_iso_urb->buffer + tx_offset + 1;
6d1ee48fd0d8d2 Karsten Keil              2012-05-15  1281  				if (fillempty) {
6d1ee48fd0d8d2 Karsten Keil              2012-05-15  1282  					memset(p, fifo->bch->fill[0],
6d1ee48fd0d8d2 Karsten Keil              2012-05-15  1283  					       current_len);
6d1ee48fd0d8d2 Karsten Keil              2012-05-15  1284  				} else {
6d1ee48fd0d8d2 Karsten Keil              2012-05-15  1285  					memcpy(p, (tx_skb->data + *tx_idx),
6d1ee48fd0d8d2 Karsten Keil              2012-05-15  1286  					       current_len);
69f52adb2d534a Karsten Keil              2009-01-09  1287  					*tx_idx += current_len;
6d1ee48fd0d8d2 Karsten Keil              2012-05-15  1288  				}
69f52adb2d534a Karsten Keil              2009-01-09  1289  				urb->iso_frame_desc[k].offset = tx_offset;
69f52adb2d534a Karsten Keil              2009-01-09  1290  				urb->iso_frame_desc[k].length = current_len + 1;
69f52adb2d534a Karsten Keil              2009-01-09  1291  
69f52adb2d534a Karsten Keil              2009-01-09  1292  				/* USB data log for every D ISO out */
6d1ee48fd0d8d2 Karsten Keil              2012-05-15  1293  				if ((fifon == HFCUSB_D_RX) && !fillempty &&
69f52adb2d534a Karsten Keil              2009-01-09  1294  				    (debug & DBG_HFC_USB_VERBOSE)) {
69f52adb2d534a Karsten Keil              2009-01-09  1295  					printk(KERN_DEBUG
69f52adb2d534a Karsten Keil              2009-01-09  1296  					       "%s: %s (%d/%d) offs(%d) len(%d) ",
69f52adb2d534a Karsten Keil              2009-01-09  1297  					       hw->name, __func__,
69f52adb2d534a Karsten Keil              2009-01-09  1298  					       k, num_isoc_packets - 1,
69f52adb2d534a Karsten Keil              2009-01-09  1299  					       urb->iso_frame_desc[k].offset,
69f52adb2d534a Karsten Keil              2009-01-09  1300  					       urb->iso_frame_desc[k].length);
69f52adb2d534a Karsten Keil              2009-01-09  1301  
69f52adb2d534a Karsten Keil              2009-01-09  1302  					for (i = urb->iso_frame_desc[k].offset;
69f52adb2d534a Karsten Keil              2009-01-09  1303  					     i < (urb->iso_frame_desc[k].offset
69f52adb2d534a Karsten Keil              2009-01-09  1304  						  + urb->iso_frame_desc[k].length);
69f52adb2d534a Karsten Keil              2009-01-09  1305  					     i++)
69f52adb2d534a Karsten Keil              2009-01-09  1306  						printk("%x ",
69f52adb2d534a Karsten Keil              2009-01-09  1307  						       context_iso_urb->buffer[i]);
69f52adb2d534a Karsten Keil              2009-01-09  1308  
69f52adb2d534a Karsten Keil              2009-01-09  1309  					printk(" skb->len(%i) tx-idx(%d)\n",
69f52adb2d534a Karsten Keil              2009-01-09  1310  					       tx_skb->len, *tx_idx);
69f52adb2d534a Karsten Keil              2009-01-09  1311  				}
69f52adb2d534a Karsten Keil              2009-01-09  1312  
69f52adb2d534a Karsten Keil              2009-01-09  1313  				tx_offset += (current_len + 1);
69f52adb2d534a Karsten Keil              2009-01-09  1314  			} else {
69f52adb2d534a Karsten Keil              2009-01-09  1315  				urb->iso_frame_desc[k].offset = tx_offset++;
69f52adb2d534a Karsten Keil              2009-01-09  1316  				urb->iso_frame_desc[k].length = 1;
69f52adb2d534a Karsten Keil              2009-01-09  1317  				/* we lower data margin every msec */
69f52adb2d534a Karsten Keil              2009-01-09  1318  				fifo->bit_line -= sink;
69f52adb2d534a Karsten Keil              2009-01-09  1319  				if (fifo->bit_line < BITLINE_INF)
69f52adb2d534a Karsten Keil              2009-01-09  1320  					fifo->bit_line = BITLINE_INF;
69f52adb2d534a Karsten Keil              2009-01-09  1321  			}
69f52adb2d534a Karsten Keil              2009-01-09  1322  
69f52adb2d534a Karsten Keil              2009-01-09  1323  			if (frame_complete) {
69f52adb2d534a Karsten Keil              2009-01-09  1324  				frame_complete = 0;
69f52adb2d534a Karsten Keil              2009-01-09  1325  
69f52adb2d534a Karsten Keil              2009-01-09  1326  				if (debug & DBG_HFC_FIFO_VERBOSE) {
69f52adb2d534a Karsten Keil              2009-01-09 @1327  					printk(KERN_DEBUG  "%s: %s: "
69f52adb2d534a Karsten Keil              2009-01-09  1328  					       "fifon(%i) new TX len(%i): ",
69f52adb2d534a Karsten Keil              2009-01-09  1329  					       hw->name, __func__,
69f52adb2d534a Karsten Keil              2009-01-09  1330  					       fifon, tx_skb->len);
69f52adb2d534a Karsten Keil              2009-01-09  1331  					i = 0;
69f52adb2d534a Karsten Keil              2009-01-09  1332  					while (i < tx_skb->len)
69f52adb2d534a Karsten Keil              2009-01-09  1333  						printk("%02x ",
69f52adb2d534a Karsten Keil              2009-01-09  1334  						       tx_skb->data[i++]);
69f52adb2d534a Karsten Keil              2009-01-09  1335  					printk("\n");
69f52adb2d534a Karsten Keil              2009-01-09  1336  				}
69f52adb2d534a Karsten Keil              2009-01-09  1337  
ddc9648db162ee Yang Yingliang            2022-12-12  1338  				dev_consume_skb_irq(tx_skb);
69f52adb2d534a Karsten Keil              2009-01-09  1339  				tx_skb = NULL;
69f52adb2d534a Karsten Keil              2009-01-09  1340  				if (fifo->dch && get_next_dframe(fifo->dch))
69f52adb2d534a Karsten Keil              2009-01-09  1341  					tx_skb = fifo->dch->tx_skb;
69f52adb2d534a Karsten Keil              2009-01-09  1342  				else if (fifo->bch &&
8bfddfbe210086 Karsten Keil              2012-05-15  1343  					 get_next_bframe(fifo->bch))
69f52adb2d534a Karsten Keil              2009-01-09  1344  					tx_skb = fifo->bch->tx_skb;
69f52adb2d534a Karsten Keil              2009-01-09  1345  			}
69f52adb2d534a Karsten Keil              2009-01-09  1346  		}
69f52adb2d534a Karsten Keil              2009-01-09  1347  		errcode = usb_submit_urb(urb, GFP_ATOMIC);
69f52adb2d534a Karsten Keil              2009-01-09  1348  		if (errcode < 0) {
69f52adb2d534a Karsten Keil              2009-01-09  1349  			if (debug & DEBUG_HW)
69f52adb2d534a Karsten Keil              2009-01-09  1350  				printk(KERN_DEBUG
69f52adb2d534a Karsten Keil              2009-01-09  1351  				       "%s: %s: error submitting ISO URB: %d \n",
69f52adb2d534a Karsten Keil              2009-01-09  1352  				       hw->name, __func__, errcode);
69f52adb2d534a Karsten Keil              2009-01-09  1353  		}
69f52adb2d534a Karsten Keil              2009-01-09  1354  
69f52adb2d534a Karsten Keil              2009-01-09  1355  		/*
69f52adb2d534a Karsten Keil              2009-01-09  1356  		 * abuse DChannel tx iso completion to trigger NT mode state
69f52adb2d534a Karsten Keil              2009-01-09  1357  		 * changes tx_iso_complete is assumed to be called every
69f52adb2d534a Karsten Keil              2009-01-09  1358  		 * fifo->intervall (ms)
69f52adb2d534a Karsten Keil              2009-01-09  1359  		 */
69f52adb2d534a Karsten Keil              2009-01-09  1360  		if ((fifon == HFCUSB_D_TX) && (hw->protocol == ISDN_P_NT_S0)
69f52adb2d534a Karsten Keil              2009-01-09  1361  		    && (hw->timers & NT_ACTIVATION_TIMER)) {
69f52adb2d534a Karsten Keil              2009-01-09  1362  			if ((--hw->nt_timer) < 0)
69f52adb2d534a Karsten Keil              2009-01-09  1363  				schedule_event(&hw->dch, FLG_PHCHANGE);
69f52adb2d534a Karsten Keil              2009-01-09  1364  		}
69f52adb2d534a Karsten Keil              2009-01-09  1365  
69f52adb2d534a Karsten Keil              2009-01-09  1366  	} else {
69f52adb2d534a Karsten Keil              2009-01-09  1367  		if (status && (debug & DBG_HFC_URB_ERROR))
69f52adb2d534a Karsten Keil              2009-01-09  1368  			printk(KERN_DEBUG  "%s: %s: urb->status %s (%i)"
69f52adb2d534a Karsten Keil              2009-01-09  1369  			       "fifonum=%d\n",
69f52adb2d534a Karsten Keil              2009-01-09  1370  			       hw->name, __func__,
69f52adb2d534a Karsten Keil              2009-01-09  1371  			       symbolic(urb_errlist, status), status, fifon);
69f52adb2d534a Karsten Keil              2009-01-09  1372  	}
16630f54fe28fb Sebastian Andrzej Siewior 2018-06-20  1373  	spin_unlock_irqrestore(&hw->lock, flags);
69f52adb2d534a Karsten Keil              2009-01-09  1374  }
69f52adb2d534a Karsten Keil              2009-01-09  1375  

:::::: The code at line 1327 was first introduced by commit
:::::: 69f52adb2d534afc41fcc658f155e01f0b322f9e mISDN: Add HFC USB driver

:::::: TO: Karsten Keil <kkeil@suse.de>
:::::: CC: Karsten Keil <kkeil@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
