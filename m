Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDD9180
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Jan 2023 00:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674173011; x=1705709011;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=yGc+Z6xvZjPZXPK/WwGOORqVEkgqk7Y+SJvPRK02veY=;
  b=R2XFWztXJSu0maQxyZn0ifGqncja57fHD4f+YsPnXU1bzlhuqmPwLpzE
   oGXEGmyVyWFNJwa4Ec8Q2D6YSlZ2A12v/d5a0Zr82f1Sqs469xjMcLZ9Z
   bsxNNW5sJ+l084vgXNn24ldlhvLcd3q/11ShW6aaOOKMnelb+ufxzGhKL
   mKXPYfagrIYkid7RypZICe7CdrGEHhGvMZq8zg91XvbEvuOcPedQCgXM2
   qm6qZNIcDpesQoKaVNvuiY1EphGn51EERMvHo4/MSmOFSxkL/TMyiXhZ5
   dxoaQ31BZYyLqi1Z7nYf8zwlvhTxGGkBtHCCw5I46vl/87U1mca0Cl0ei
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="352723136"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; 
   d="scan'208";a="352723136"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 16:03:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="749144127"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; 
   d="scan'208";a="749144127"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 19 Jan 2023 16:03:29 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIesS-0001zc-37;
	Fri, 20 Jan 2023 00:03:28 +0000
Date: Fri, 20 Jan 2023 08:02:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/dsa/realtek/rtl8365mb.c:1349 rtl8365mb_stats_update()
 error: uninitialized symbol 'ret'.
Message-ID: <202301200752.U03l5x81-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Luiz Angelo Daros de Luca <luizluca@gmail.com>
CC: "Alvin Šipraga" <alsi@bang-olufsen.dk>
CC: Linus Walleij <linus.walleij@linaro.org>
CC: Florian Fainelli <f.fainelli@gmail.com>
CC: Vladimir Oltean <olteanv@gmail.com>

Hi Luiz,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d368967cb1039b5c4cccb62b5a4b9468c50cd143
commit: 319a70a5fea9590e9431dd57f56191996c4787f4 net: dsa: realtek-smi: move to subdirectory
date:   12 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 12 months ago
config: csky-randconfig-m041-20230119 (https://download.01.org/0day-ci/archive/20230120/202301200752.U03l5x81-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/net/dsa/realtek/rtl8365mb.c:1349 rtl8365mb_stats_update() error: uninitialized symbol 'ret'.

vim +/ret +1349 drivers/net/dsa/realtek/rtl8365mb.c

4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1306  
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1307  static void rtl8365mb_stats_update(struct realtek_smi *smi, int port)
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1308  {
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1309  	u64 cnt[RTL8365MB_MIB_END] = {
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1310  		[RTL8365MB_MIB_ifOutOctets] = 1,
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1311  		[RTL8365MB_MIB_ifOutUcastPkts] = 1,
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1312  		[RTL8365MB_MIB_ifOutMulticastPkts] = 1,
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1313  		[RTL8365MB_MIB_ifOutBroadcastPkts] = 1,
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1314  		[RTL8365MB_MIB_ifOutDiscards] = 1,
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1315  		[RTL8365MB_MIB_ifInOctets] = 1,
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1316  		[RTL8365MB_MIB_ifInUcastPkts] = 1,
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1317  		[RTL8365MB_MIB_ifInMulticastPkts] = 1,
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1318  		[RTL8365MB_MIB_ifInBroadcastPkts] = 1,
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1319  		[RTL8365MB_MIB_etherStatsDropEvents] = 1,
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1320  		[RTL8365MB_MIB_etherStatsCollisions] = 1,
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1321  		[RTL8365MB_MIB_etherStatsFragments] = 1,
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1322  		[RTL8365MB_MIB_etherStatsJabbers] = 1,
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1323  		[RTL8365MB_MIB_dot3StatsFCSErrors] = 1,
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1324  		[RTL8365MB_MIB_dot3StatsLateCollisions] = 1,
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1325  	};
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1326  	struct rtl8365mb *mb = smi->chip_data;
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1327  	struct rtnl_link_stats64 *stats;
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1328  	int ret;
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1329  	int i;
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1330  
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1331  	stats = &mb->ports[port].stats;
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1332  
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1333  	mutex_lock(&mb->mib_lock);
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1334  	for (i = 0; i < RTL8365MB_MIB_END; i++) {
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1335  		struct rtl8365mb_mib_counter *c = &rtl8365mb_mib_counters[i];
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1336  
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1337  		/* Only fetch required MIB counters (marked = 1 above) */
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1338  		if (!cnt[i])
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1339  			continue;
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1340  
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1341  		ret = rtl8365mb_mib_counter_read(smi, port, c->offset,
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1342  						 c->length, &cnt[i]);
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1343  		if (ret)
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1344  			break;
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1345  	}
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1346  	mutex_unlock(&mb->mib_lock);
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1347  
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1348  	/* Don't update statistics if there was an error reading the counters */
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18 @1349  	if (ret)
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1350  		return;
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1351  
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1352  	spin_lock(&mb->ports[port].stats_lock);
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1353  
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1354  	stats->rx_packets = cnt[RTL8365MB_MIB_ifInUcastPkts] +
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1355  			    cnt[RTL8365MB_MIB_ifInMulticastPkts] +
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1356  			    cnt[RTL8365MB_MIB_ifInBroadcastPkts] -
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1357  			    cnt[RTL8365MB_MIB_ifOutDiscards];
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1358  
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1359  	stats->tx_packets = cnt[RTL8365MB_MIB_ifOutUcastPkts] +
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1360  			    cnt[RTL8365MB_MIB_ifOutMulticastPkts] +
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1361  			    cnt[RTL8365MB_MIB_ifOutBroadcastPkts];
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1362  
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1363  	/* if{In,Out}Octets includes FCS - remove it */
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1364  	stats->rx_bytes = cnt[RTL8365MB_MIB_ifInOctets] - 4 * stats->rx_packets;
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1365  	stats->tx_bytes =
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1366  		cnt[RTL8365MB_MIB_ifOutOctets] - 4 * stats->tx_packets;
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1367  
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1368  	stats->rx_dropped = cnt[RTL8365MB_MIB_etherStatsDropEvents];
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1369  	stats->tx_dropped = cnt[RTL8365MB_MIB_ifOutDiscards];
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1370  
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1371  	stats->multicast = cnt[RTL8365MB_MIB_ifInMulticastPkts];
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1372  	stats->collisions = cnt[RTL8365MB_MIB_etherStatsCollisions];
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1373  
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1374  	stats->rx_length_errors = cnt[RTL8365MB_MIB_etherStatsFragments] +
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1375  				  cnt[RTL8365MB_MIB_etherStatsJabbers];
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1376  	stats->rx_crc_errors = cnt[RTL8365MB_MIB_dot3StatsFCSErrors];
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1377  	stats->rx_errors = stats->rx_length_errors + stats->rx_crc_errors;
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1378  
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1379  	stats->tx_aborted_errors = cnt[RTL8365MB_MIB_ifOutDiscards];
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1380  	stats->tx_window_errors = cnt[RTL8365MB_MIB_dot3StatsLateCollisions];
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1381  	stats->tx_errors = stats->tx_aborted_errors + stats->tx_window_errors;
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1382  
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1383  	spin_unlock(&mb->ports[port].stats_lock);
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1384  }
4af2950c50c863 drivers/net/dsa/rtl8365mb.c Alvin Šipraga 2021-10-18  1385  

:::::: The code at line 1349 was first introduced by commit
:::::: 4af2950c50c8634ed2865cf81e607034f78b84aa net: dsa: realtek-smi: add rtl8365mb subdriver for RTL8365MB-VC

:::::: TO: Alvin Šipraga <alsi@bang-olufsen.dk>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
