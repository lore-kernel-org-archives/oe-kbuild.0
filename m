Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1755CB660
	for <oe-kbuild@lists.linux.dev>; Sun, 24 Nov 2024 18:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732473653; cv=none; b=Fa/VNTL+pHyLmhrzLTEpu6IrOivM9V36Trm6LFE0nnr67L+PSrsBOzTnSOiTdmfLMas9hhYDXEBNovW6lPt830x3cnf46rMWJAHWcYyHz0Wd0+8cdvbJ2dSWC3qCjKGViXrNty/le0IsPuAV1WURVObNTljIkUjdQlV2dKDVWME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732473653; c=relaxed/simple;
	bh=Cm/W/H8hAO2Hi2i0vQNKjOiVpwL+kHVr9UnW3LKcxdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lCBF8RpvCfJitB8MueOtxov4DlfhkwOPiVjdFvcKxQdrNfexxuYlVHqW+vUUzy+UR8bfyGEJ8ufwxCHUEyWfOyRyad47eYCk3tfKo8RwzUbxG9TP7rqnxfw7K+kxpiHRwxka078a+9Yv+NXtbmt4cRArZRpxZcdJC8mmoKnpsD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LwN1CGAT; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LwN1CGAT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732473651; x=1764009651;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Cm/W/H8hAO2Hi2i0vQNKjOiVpwL+kHVr9UnW3LKcxdQ=;
  b=LwN1CGATc2sq9N7jcc+v8aoDwpPW7PwoV32PHlY8z+BF2tagmVAOzth0
   tTZWBFHdJPN3QfvG8XVNoUPDKoaq+wGVT/cu0CZSwl5lKYgUdTvUmZa5X
   maXebU0B0HdNY9UECBrccRAUpDDRNPPpFK58sr765g8P0MDVJG1uYifQ2
   lPunTvl350BeISBBt8LPbh6sm7gzzpnwjf06SGa+xrt6zBfQMxdYTMYRE
   otp+b0zlH92CBjt1GbzClA4vh4FM32YQcFdtg+t9Mn+spB6kJC79ggY/G
   Vy12j25Zgy83CvH30OsC3+6tCFmgidwW3vA0bKr3lkysd9cd2R3k2jGIU
   w==;
X-CSE-ConnectionGUID: 7ANEXYzHQHScC+UbBjileA==
X-CSE-MsgGUID: gpI5Sz+aQVKL2NX/KfgIbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="36487161"
X-IronPort-AV: E=Sophos;i="6.12,181,1728975600"; 
   d="scan'208";a="36487161"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2024 10:40:50 -0800
X-CSE-ConnectionGUID: yAXkAHD9RPeIQxN9ANRdiQ==
X-CSE-MsgGUID: EguFO5T8QIybDGpBPU7q1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,181,1728975600"; 
   d="scan'208";a="91484149"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 24 Nov 2024 10:40:48 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFHXK-00059v-2o;
	Sun, 24 Nov 2024 18:40:46 +0000
Date: Mon, 25 Nov 2024 02:40:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 12070/12501]
 drivers/i2c/busses/i2c-xiic.c:1326:1-7: preceding lock on line 1247
Message-ID: <202411250217.5VQHIVVl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
CC: Andi Shyti <andi.shyti@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   cfba9f07a1d6aeca38f47f1f472cfb0ba133d341
commit: 8bba86687c0b6a22f05ed4a7398c519d3796bc74 [12070/12501] i2c: xiic: Add atomic transfer support
:::::: branch date: 3 days ago
:::::: commit date: 5 days ago
config: i386-randconfig-051-20241124 (https://download.01.org/0day-ci/archive/20241125/202411250217.5VQHIVVl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202411250217.5VQHIVVl-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/i2c/busses/i2c-xiic.c:1326:1-7: preceding lock on line 1247
   drivers/i2c/busses/i2c-xiic.c:1326:1-7: preceding lock on line 1245

vim +1326 drivers/i2c/busses/i2c-xiic.c

e1d5b6598cdc33 Richard Röjfors      2010-02-11  1238  
c119e7d00c9168 Marek Vasut          2021-08-23  1239  static int xiic_start_xfer(struct xiic_i2c *i2c, struct i2c_msg *msgs, int num)
e1d5b6598cdc33 Richard Röjfors      2010-02-11  1240  {
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1241  	bool broken_read, max_read_len, smbus_blk_read;
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1242  	int ret, count;
c119e7d00c9168 Marek Vasut          2021-08-23  1243  
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  1244  	if (i2c->atomic)
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  1245  		spin_lock(&i2c->atomic_lock);
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  1246  	else
77c680196791e7 Lars-Peter Clausen   2015-11-16 @1247  		mutex_lock(&i2c->lock);
b4c119dbc300c7 Shubhrajyoti Datta   2020-01-09  1248  
1d4a1adbed2582 Robert Hancock       2024-09-11  1249  	if (i2c->tx_msg || i2c->rx_msg) {
ee1691d0ae103b Marc Ferland         2024-05-13  1250  		dev_err(i2c->adap.dev.parent,
ee1691d0ae103b Marc Ferland         2024-05-13  1251  			"cannot start a transfer while busy\n");
1d4a1adbed2582 Robert Hancock       2024-09-11  1252  		ret = -EBUSY;
c119e7d00c9168 Marek Vasut          2021-08-23  1253  		goto out;
ee1691d0ae103b Marc Ferland         2024-05-13  1254  	}
c119e7d00c9168 Marek Vasut          2021-08-23  1255  
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  1256  	i2c->atomic_xfer_state = STATE_DONE;
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  1257  
1d4a1adbed2582 Robert Hancock       2024-09-11  1258  	/* In single master mode bus can only be busy, when in use by this
1d4a1adbed2582 Robert Hancock       2024-09-11  1259  	 * driver. If the register indicates bus being busy for some reason we
1d4a1adbed2582 Robert Hancock       2024-09-11  1260  	 * should ignore it, since bus will never be released and i2c will be
1d4a1adbed2582 Robert Hancock       2024-09-11  1261  	 * stuck forever.
1d4a1adbed2582 Robert Hancock       2024-09-11  1262  	 */
1d4a1adbed2582 Robert Hancock       2024-09-11  1263  	if (!i2c->singlemaster) {
1d4a1adbed2582 Robert Hancock       2024-09-11  1264  		ret = xiic_wait_not_busy(i2c);
1d4a1adbed2582 Robert Hancock       2024-09-11  1265  		if (ret) {
1d4a1adbed2582 Robert Hancock       2024-09-11  1266  			/* If the bus is stuck in a busy state, such as due to spurious low
1d4a1adbed2582 Robert Hancock       2024-09-11  1267  			 * pulses on the bus causing a false start condition to be detected,
1d4a1adbed2582 Robert Hancock       2024-09-11  1268  			 * then try to recover by re-initializing the controller and check
1d4a1adbed2582 Robert Hancock       2024-09-11  1269  			 * again if the bus is still busy.
1d4a1adbed2582 Robert Hancock       2024-09-11  1270  			 */
1d4a1adbed2582 Robert Hancock       2024-09-11  1271  			dev_warn(i2c->adap.dev.parent, "I2C bus busy timeout, reinitializing\n");
1d4a1adbed2582 Robert Hancock       2024-09-11  1272  			ret = xiic_reinit(i2c);
1d4a1adbed2582 Robert Hancock       2024-09-11  1273  			if (ret)
1d4a1adbed2582 Robert Hancock       2024-09-11  1274  				goto out;
1d4a1adbed2582 Robert Hancock       2024-09-11  1275  			ret = xiic_wait_not_busy(i2c);
1d4a1adbed2582 Robert Hancock       2024-09-11  1276  			if (ret)
1d4a1adbed2582 Robert Hancock       2024-09-11  1277  				goto out;
1d4a1adbed2582 Robert Hancock       2024-09-11  1278  		}
1d4a1adbed2582 Robert Hancock       2024-09-11  1279  	}
1d4a1adbed2582 Robert Hancock       2024-09-11  1280  
c119e7d00c9168 Marek Vasut          2021-08-23  1281  	i2c->tx_msg = msgs;
c119e7d00c9168 Marek Vasut          2021-08-23  1282  	i2c->rx_msg = NULL;
c119e7d00c9168 Marek Vasut          2021-08-23  1283  	i2c->nmsgs = num;
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  1284  
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  1285  	if (!i2c->atomic)
fdacc3c7405d1f Marek Vasut          2021-08-23  1286  		init_completion(&i2c->completion);
c119e7d00c9168 Marek Vasut          2021-08-23  1287  
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1288  	/* Decide standard mode or Dynamic mode */
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1289  	i2c->dynamic = true;
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1290  
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1291  	/* Initialize prev message type */
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1292  	i2c->prev_msg_tx = false;
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1293  
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1294  	/*
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1295  	 * Scan through nmsgs, use dynamic mode when none of the below three
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1296  	 * conditions occur. We need standard mode even if one condition holds
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1297  	 * true in the entire array of messages in a single transfer.
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1298  	 * If read transaction as dynamic mode is broken for delayed reads
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1299  	 * in xlnx,axi-iic-2.0 / xlnx,xps-iic-2.00.a IP versions.
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1300  	 * If read length is > 255 bytes.
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1301  	 * If smbus_block_read transaction.
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1302  	 */
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1303  	for (count = 0; count < i2c->nmsgs; count++) {
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1304  		broken_read = (i2c->quirks & DYNAMIC_MODE_READ_BROKEN_BIT) &&
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1305  				(i2c->tx_msg[count].flags & I2C_M_RD);
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1306  		max_read_len = (i2c->tx_msg[count].flags & I2C_M_RD) &&
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1307  				(i2c->tx_msg[count].len > MAX_READ_LENGTH_DYNAMIC);
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1308  		smbus_blk_read = (i2c->tx_msg[count].flags & I2C_M_RECV_LEN);
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1309  
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1310  		if (broken_read || max_read_len || smbus_blk_read) {
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1311  			i2c->dynamic = false;
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1312  			break;
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1313  		}
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1314  	}
2fd5cf352efa0c Raviteja Narayanam   2023-02-02  1315  
b4c119dbc300c7 Shubhrajyoti Datta   2020-01-09  1316  	ret = xiic_reinit(i2c);
b4c119dbc300c7 Shubhrajyoti Datta   2020-01-09  1317  	if (!ret)
e1d5b6598cdc33 Richard Röjfors      2010-02-11  1318  		__xiic_start_xfer(i2c);
b4c119dbc300c7 Shubhrajyoti Datta   2020-01-09  1319  
c119e7d00c9168 Marek Vasut          2021-08-23  1320  out:
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  1321  	if (i2c->atomic)
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  1322  		spin_unlock(&i2c->atomic_lock);
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  1323  	else
77c680196791e7 Lars-Peter Clausen   2015-11-16  1324  		mutex_unlock(&i2c->lock);
b4c119dbc300c7 Shubhrajyoti Datta   2020-01-09  1325  
b4c119dbc300c7 Shubhrajyoti Datta   2020-01-09 @1326  	return ret;
e1d5b6598cdc33 Richard Röjfors      2010-02-11  1327  }
e1d5b6598cdc33 Richard Röjfors      2010-02-11  1328  

:::::: The code at line 1326 was first introduced by commit
:::::: b4c119dbc300c7a6ee2da70d5c7ba14747b35142 i2c: xiic: Add timeout to the rx fifo wait loop

:::::: TO: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
:::::: CC: Wolfram Sang <wsa@the-dreams.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
