Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B27347A2
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Dec 2024 08:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735288623; cv=none; b=SGYtOa3FPRTHnzh5kqi5g1YscOtFi0UH6PIpH7gUs0IBv/XEJZYe16i6FBGGYjHRG5QWz0hBZtats6X2MpziGDJ5Y2KsnptfaKZXv62T5qaWbYfX1URBa4IT/i3sltF2v3VHCcYcn6qpRDzEYLuhP0Pb3PhmfY2c9ssHrVKXlh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735288623; c=relaxed/simple;
	bh=m3zqh0SrOG9QJ0xhvWP+VpTpiBXSOhn6aIfWlr5Ah78=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gLlwerLD86W33EZz6Fuuv4yH3/C9zVBnYF2L2Ka9aqFKl5iMSzgBt2emtWkUTjud0vwbR6gql9ZcK8HcFiajjfld2YOmHWxoypmqehLLnJh99/KA3c9BOzTHCIt6FY15+0u1Jb9RgwbLPEPkfRYBa1Zu2RRacENEi3msaTTKw6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OVDJ36cI; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OVDJ36cI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735288621; x=1766824621;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=m3zqh0SrOG9QJ0xhvWP+VpTpiBXSOhn6aIfWlr5Ah78=;
  b=OVDJ36cIpIU921Nj2iynxfx7QZVH8RaBfrhUlWuMz1k4sfp5MRPok1lo
   XORX3D1AeZTmXCOJ1iNQDatnAvrpWV+wW6bG+AXeN/HNvObeBK/iRzqzq
   tnwBXf6Wyphz058DUQg4+EnE6E9StDT1i9nK+Z2X7nZM5HmBnN659zYSu
   00QWC/D+1oEFVEMKGTNSX7R0nRdCmDsS/IT1Yj3yrmN67IOET/Rt6WdbW
   6LtKx+PZHUqhsFawjIZbg2tnACPnUYNdGaO/PcO0iLxxc3u4WJQ25Zm6j
   V9SGdHxWfPDC/JfTZ3afs5fbk5me4fcL5yrpzrXM98Dd+GGWwVDAiFezp
   Q==;
X-CSE-ConnectionGUID: j1H72iM7TIS5WBl+7I6uVA==
X-CSE-MsgGUID: xMiC7CdfTKOS2f9SVLDQ6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11297"; a="38539032"
X-IronPort-AV: E=Sophos;i="6.12,268,1728975600"; 
   d="scan'208";a="38539032"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 00:37:00 -0800
X-CSE-ConnectionGUID: Dd4vg4CvTkOr+242Xvzz6w==
X-CSE-MsgGUID: a1KiLzWVTMaYXQmO4JeCYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,268,1728975600"; 
   d="scan'208";a="99863690"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 27 Dec 2024 00:36:59 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tR5q5-00035i-10;
	Fri, 27 Dec 2024 08:36:57 +0000
Date: Fri, 27 Dec 2024 16:35:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [andi-shyti:i2c/i2c-host-next 26/31]
 drivers/i2c/busses/i2c-xiic.c:1320:1-7: preceding lock on line 1241
Message-ID: <202412271654.y9Jd0a0a-lkp@intel.com>
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
TO: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
CC: Andi Shyti <andi.shyti@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host-next
head:   53d20df22932cbdd290f5ed1a37c724203f751cd
commit: 45676f79c3589eaa7e3a1c2451c6cb0cd312e9da [26/31] i2c: xiic: Add atomic transfer support
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: i386-randconfig-052-20241227 (https://download.01.org/0day-ci/archive/20241227/202412271654.y9Jd0a0a-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412271654.y9Jd0a0a-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/i2c/busses/i2c-xiic.c:1320:1-7: preceding lock on line 1241
   drivers/i2c/busses/i2c-xiic.c:1320:1-7: preceding lock on line 1239

vim +1320 drivers/i2c/busses/i2c-xiic.c

e1d5b6598cdc33 Richard Röjfors      2010-02-11  1232  
c119e7d00c9168 Marek Vasut          2021-08-23  1233  static int xiic_start_xfer(struct xiic_i2c *i2c, struct i2c_msg *msgs, int num)
e1d5b6598cdc33 Richard Röjfors      2010-02-11  1234  {
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1235  	bool broken_read, max_read_len, smbus_blk_read;
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1236  	int ret, count;
c119e7d00c9168 Marek Vasut          2021-08-23  1237  
45676f79c3589e Manikanta Guntupalli 2024-12-10  1238  	if (i2c->atomic)
45676f79c3589e Manikanta Guntupalli 2024-12-10  1239  		spin_lock(&i2c->atomic_lock);
45676f79c3589e Manikanta Guntupalli 2024-12-10  1240  	else
77c680196791e7 Lars-Peter Clausen   2015-11-16 @1241  		mutex_lock(&i2c->lock);
b4c119dbc300c7 Shubhrajyoti Datta   2020-01-09  1242  
1d4a1adbed2582 Robert Hancock       2024-09-11  1243  	if (i2c->tx_msg || i2c->rx_msg) {
ee1691d0ae103b Marc Ferland         2024-05-13  1244  		dev_err(i2c->adap.dev.parent,
ee1691d0ae103b Marc Ferland         2024-05-13  1245  			"cannot start a transfer while busy\n");
1d4a1adbed2582 Robert Hancock       2024-09-11  1246  		ret = -EBUSY;
c119e7d00c9168 Marek Vasut          2021-08-23  1247  		goto out;
ee1691d0ae103b Marc Ferland         2024-05-13  1248  	}
c119e7d00c9168 Marek Vasut          2021-08-23  1249  
45676f79c3589e Manikanta Guntupalli 2024-12-10  1250  	i2c->atomic_xfer_state = STATE_DONE;
45676f79c3589e Manikanta Guntupalli 2024-12-10  1251  
1d4a1adbed2582 Robert Hancock       2024-09-11  1252  	/* In single master mode bus can only be busy, when in use by this
1d4a1adbed2582 Robert Hancock       2024-09-11  1253  	 * driver. If the register indicates bus being busy for some reason we
1d4a1adbed2582 Robert Hancock       2024-09-11  1254  	 * should ignore it, since bus will never be released and i2c will be
1d4a1adbed2582 Robert Hancock       2024-09-11  1255  	 * stuck forever.
1d4a1adbed2582 Robert Hancock       2024-09-11  1256  	 */
1d4a1adbed2582 Robert Hancock       2024-09-11  1257  	if (!i2c->singlemaster) {
1d4a1adbed2582 Robert Hancock       2024-09-11  1258  		ret = xiic_wait_not_busy(i2c);
1d4a1adbed2582 Robert Hancock       2024-09-11  1259  		if (ret) {
1d4a1adbed2582 Robert Hancock       2024-09-11  1260  			/* If the bus is stuck in a busy state, such as due to spurious low
1d4a1adbed2582 Robert Hancock       2024-09-11  1261  			 * pulses on the bus causing a false start condition to be detected,
1d4a1adbed2582 Robert Hancock       2024-09-11  1262  			 * then try to recover by re-initializing the controller and check
1d4a1adbed2582 Robert Hancock       2024-09-11  1263  			 * again if the bus is still busy.
1d4a1adbed2582 Robert Hancock       2024-09-11  1264  			 */
1d4a1adbed2582 Robert Hancock       2024-09-11  1265  			dev_warn(i2c->adap.dev.parent, "I2C bus busy timeout, reinitializing\n");
1d4a1adbed2582 Robert Hancock       2024-09-11  1266  			ret = xiic_reinit(i2c);
1d4a1adbed2582 Robert Hancock       2024-09-11  1267  			if (ret)
1d4a1adbed2582 Robert Hancock       2024-09-11  1268  				goto out;
1d4a1adbed2582 Robert Hancock       2024-09-11  1269  			ret = xiic_wait_not_busy(i2c);
1d4a1adbed2582 Robert Hancock       2024-09-11  1270  			if (ret)
1d4a1adbed2582 Robert Hancock       2024-09-11  1271  				goto out;
1d4a1adbed2582 Robert Hancock       2024-09-11  1272  		}
1d4a1adbed2582 Robert Hancock       2024-09-11  1273  	}
1d4a1adbed2582 Robert Hancock       2024-09-11  1274  
c119e7d00c9168 Marek Vasut          2021-08-23  1275  	i2c->tx_msg = msgs;
c119e7d00c9168 Marek Vasut          2021-08-23  1276  	i2c->rx_msg = NULL;
c119e7d00c9168 Marek Vasut          2021-08-23  1277  	i2c->nmsgs = num;
45676f79c3589e Manikanta Guntupalli 2024-12-10  1278  
45676f79c3589e Manikanta Guntupalli 2024-12-10  1279  	if (!i2c->atomic)
fdacc3c7405d1f Marek Vasut          2021-08-23  1280  		init_completion(&i2c->completion);
c119e7d00c9168 Marek Vasut          2021-08-23  1281  
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1282  	/* Decide standard mode or Dynamic mode */
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1283  	i2c->dynamic = true;
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1284  
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1285  	/* Initialize prev message type */
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1286  	i2c->prev_msg_tx = false;
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1287  
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1288  	/*
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1289  	 * Scan through nmsgs, use dynamic mode when none of the below three
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1290  	 * conditions occur. We need standard mode even if one condition holds
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1291  	 * true in the entire array of messages in a single transfer.
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1292  	 * If read transaction as dynamic mode is broken for delayed reads
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1293  	 * in xlnx,axi-iic-2.0 / xlnx,xps-iic-2.00.a IP versions.
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1294  	 * If read length is > 255 bytes.
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1295  	 * If smbus_block_read transaction.
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1296  	 */
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1297  	for (count = 0; count < i2c->nmsgs; count++) {
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1298  		broken_read = (i2c->quirks & DYNAMIC_MODE_READ_BROKEN_BIT) &&
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1299  				(i2c->tx_msg[count].flags & I2C_M_RD);
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1300  		max_read_len = (i2c->tx_msg[count].flags & I2C_M_RD) &&
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1301  				(i2c->tx_msg[count].len > MAX_READ_LENGTH_DYNAMIC);
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1302  		smbus_blk_read = (i2c->tx_msg[count].flags & I2C_M_RECV_LEN);
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1303  
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1304  		if (broken_read || max_read_len || smbus_blk_read) {
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1305  			i2c->dynamic = false;
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1306  			break;
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1307  		}
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1308  	}
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1309  
b4c119dbc300c7 Shubhrajyoti Datta   2020-01-09  1310  	ret = xiic_reinit(i2c);
b4c119dbc300c7 Shubhrajyoti Datta   2020-01-09  1311  	if (!ret)
e1d5b6598cdc33 Richard Röjfors      2010-02-11  1312  		__xiic_start_xfer(i2c);
b4c119dbc300c7 Shubhrajyoti Datta   2020-01-09  1313  
c119e7d00c9168 Marek Vasut          2021-08-23  1314  out:
45676f79c3589e Manikanta Guntupalli 2024-12-10  1315  	if (i2c->atomic)
45676f79c3589e Manikanta Guntupalli 2024-12-10  1316  		spin_unlock(&i2c->atomic_lock);
45676f79c3589e Manikanta Guntupalli 2024-12-10  1317  	else
77c680196791e7 Lars-Peter Clausen   2015-11-16  1318  		mutex_unlock(&i2c->lock);
b4c119dbc300c7 Shubhrajyoti Datta   2020-01-09  1319  
b4c119dbc300c7 Shubhrajyoti Datta   2020-01-09 @1320  	return ret;
e1d5b6598cdc33 Richard Röjfors      2010-02-11  1321  }
e1d5b6598cdc33 Richard Röjfors      2010-02-11  1322  

:::::: The code at line 1320 was first introduced by commit
:::::: b4c119dbc300c7a6ee2da70d5c7ba14747b35142 i2c: xiic: Add timeout to the rx fifo wait loop

:::::: TO: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
:::::: CC: Wolfram Sang <wsa@the-dreams.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
