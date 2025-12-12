Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0ED521D3E4
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Dec 2025 21:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765575878; cv=none; b=TdGhs0jOvPjq1LSZEQJFwU7cPiLaFnVAEgEdIm75z/kTE2Gg+tNgEruwH4i6wXU+oi8XI/8IvRFf5ZA3DwJt2YneBOsG2H2ALGjbeAqhQPcXF62sCjRfQ7dSXJMH2RU0jD5mg26cLf0FDuS/fCx37609XxOdRWo+sEYVdd/caI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765575878; c=relaxed/simple;
	bh=nETDnljaN0wLTAgKi/KT8hL/rLQ5IBuglJlGh6DlfSA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SEmyZcrwnetwnnEaWdc1Awdv4UgIal/MhfBiHjbgz9PqbrjZ76+tUyEvLhU/RLk8bpLghKhlP+tHK9DPF9LvX+fNGaAJNyCXWItYSCbq5zyXFvbb+T/McaCvURfFqYCEmAKztjg8HFcqrOzrZ8WsIK9mefNyG5THRE7Pgiwy8uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hiWOfglA; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hiWOfglA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765575877; x=1797111877;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=nETDnljaN0wLTAgKi/KT8hL/rLQ5IBuglJlGh6DlfSA=;
  b=hiWOfglAEn8qYtieclyiFJjrpSF1wjLeBYoNeQcqBZzPsdR+t2iHqxKd
   ZG3KkE28WpNhfNRLTGgKqPC+V9FbfMbe+FvRqkkN8DabaEdtulyJMdXOA
   Zh0eUKhcJZJF9/Jk4y82odNr6rk4Y6QWcfd83LjhWftNVkZjZa4DzJW87
   WbhRuJaROI+hNLUmJME3/WnTezxe+MnXjgPqtH+DveguiTSZrwTN2D5VL
   lt6dslq1m+UnYMT51jjzld432bH9KNhQdqMzS9tst/Lwt6jVPJfPAYD6y
   ZYKJPBXUZ9PLUEUxkgrFo/+TBW0k7nGaIrg6vaP8Sq62/2Kl2IrnOerV/
   A==;
X-CSE-ConnectionGUID: 9C8L2XqISwCUkwTPPDHFlg==
X-CSE-MsgGUID: bEIgurDSRgStiXFn3/CutA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="78955203"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="78955203"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 13:44:34 -0800
X-CSE-ConnectionGUID: dLDVLEg5TL6gdo/3voTDCQ==
X-CSE-MsgGUID: RjA10m6RTBGe5VpQ6FjvDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="228246902"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Dec 2025 13:44:32 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUAw9-000000006f3-49hq;
	Fri, 12 Dec 2025 21:44:29 +0000
Date: Sat, 13 Dec 2025 05:44:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/i2c/busses/i2c-xiic.c:1320:1-7: preceding lock on line 1241
Message-ID: <202512130539.vMFLky2G-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
CC: Andi Shyti <andi.shyti@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   187d0801404f415f22c0b31531982c7ea97fa341
commit: e22daca457d5bec579f62ba84e826a51c26cce31 i2c: xiic: Add atomic transfer support
date:   11 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-103-20251212 (https://download.01.org/0day-ci/archive/20251213/202512130539.vMFLky2G-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202512130539.vMFLky2G-lkp@intel.com/

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
e22daca457d5be Manikanta Guntupalli 2024-12-10  1238  	if (i2c->atomic)
e22daca457d5be Manikanta Guntupalli 2024-12-10  1239  		spin_lock(&i2c->atomic_lock);
e22daca457d5be Manikanta Guntupalli 2024-12-10  1240  	else
77c680196791e7 Lars-Peter Clausen   2015-11-16 @1241  		mutex_lock(&i2c->lock);
b4c119dbc300c7 Shubhrajyoti Datta   2020-01-09  1242  
1d4a1adbed2582 Robert Hancock       2024-09-11  1243  	if (i2c->tx_msg || i2c->rx_msg) {
ee1691d0ae103b Marc Ferland         2024-05-13  1244  		dev_err(i2c->adap.dev.parent,
ee1691d0ae103b Marc Ferland         2024-05-13  1245  			"cannot start a transfer while busy\n");
1d4a1adbed2582 Robert Hancock       2024-09-11  1246  		ret = -EBUSY;
c119e7d00c9168 Marek Vasut          2021-08-23  1247  		goto out;
ee1691d0ae103b Marc Ferland         2024-05-13  1248  	}
c119e7d00c9168 Marek Vasut          2021-08-23  1249  
e22daca457d5be Manikanta Guntupalli 2024-12-10  1250  	i2c->atomic_xfer_state = STATE_DONE;
e22daca457d5be Manikanta Guntupalli 2024-12-10  1251  
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
e22daca457d5be Manikanta Guntupalli 2024-12-10  1278  
e22daca457d5be Manikanta Guntupalli 2024-12-10  1279  	if (!i2c->atomic)
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
e22daca457d5be Manikanta Guntupalli 2024-12-10  1315  	if (i2c->atomic)
e22daca457d5be Manikanta Guntupalli 2024-12-10  1316  		spin_unlock(&i2c->atomic_lock);
e22daca457d5be Manikanta Guntupalli 2024-12-10  1317  	else
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
