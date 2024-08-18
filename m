Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CF623AD
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Aug 2024 05:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723960268; cv=none; b=Ew/KMfVvB8j2bGX5m0Qu7y9kpUwobMD/cWlGRp/rVEztnwHgMGBfCedhAYIo4xiUUE8vJbS+iFtAyzzOW8w+0KZU2OvafNaEoVw3AQvxqe0dEFicuYFKDyoyYaT84pLpdyQYNxmjFNZA/u9MIcp26UuxFol84qIQICoB14sEEJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723960268; c=relaxed/simple;
	bh=OGVlm5oWFDwmrHq0lXu9gXCNJYT74dmxlx2r6JdkkFc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=su80aRpnXxjcjeVtNYgM5lb8gmugXo8+R0x4kvHop7SOJ+JuvpCrPfhnbjqAxeAkxxfcxctzm8pHDL41TuK4xnGGgdtb6t+vOqVV5nXeHy2j68aMJ+WawEAGWt0UuPOrYxILH9pnHIs4DMu0mWyJziAQpxLDNHMwf3Ff2ui5R3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WAcQ8a/6; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WAcQ8a/6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723960263; x=1755496263;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OGVlm5oWFDwmrHq0lXu9gXCNJYT74dmxlx2r6JdkkFc=;
  b=WAcQ8a/6S7lIZdRyAbP1+/Vp6boykHBpdCg/7sNcaX1xnHGSK0bbZRmI
   04YBYmuzGO5E/T4/DitiiIfEeOOnINVa6GTutmAIf09zlEYktomdkPY9Z
   ezGa2fht+Tg3DpQ9soGdw78koG1XrGDBBfcwJRj/LanGsv1wc4Lyid3Kg
   W21I9J5HRg6x/5wLXgCBQbpCBwbAty0hCPNVavb+Fac5C0lytDpYVjz0f
   EiaW4vv+Y/5HYugseMuiiOR798VSIYJywy10EnWoBEmG1LyCSXYIi3jLv
   f2Ac2MXizI8+e9gHDeTcMDD2+kz8xKsBAnVJaxWCGzp9hlYpXQWPrZK9f
   g==;
X-CSE-ConnectionGUID: i9xPMtxcR3+AcvJvp+nLyw==
X-CSE-MsgGUID: g5TRcSkbSOehWk/g9EzVqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11167"; a="39674088"
X-IronPort-AV: E=Sophos;i="6.10,156,1719903600"; 
   d="scan'208";a="39674088"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2024 22:51:03 -0700
X-CSE-ConnectionGUID: jtFTmvVoRBOTQHNnRLU+GQ==
X-CSE-MsgGUID: uYdtfGJETDiXyVt22YyoBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,156,1719903600"; 
   d="scan'208";a="65011713"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Aug 2024 22:51:01 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sfYod-000830-11;
	Sun, 18 Aug 2024 05:50:59 +0000
Date: Sun, 18 Aug 2024 13:50:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: net/ethtool/ioctl.c:1506:1-7: preceding lock on line 1385
Message-ID: <202408181315.kEeDkBqj-lkp@intel.com>
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
TO: Edward Cree <ecree.xilinx@gmail.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Przemek Kitszel <przemyslaw.kitszel@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c3f2d783a459980eafd24c5af94ccd56a615961f
commit: 87925151191b64d9623e63ccf11e517eacc99d7d net: ethtool: add a mutex protecting RSS contexts
date:   7 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 7 weeks ago
config: i386-randconfig-051-20240818 (https://download.01.org/0day-ci/archive/20240818/202408181315.kEeDkBqj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202408181315.kEeDkBqj-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> net/ethtool/ioctl.c:1506:1-7: preceding lock on line 1385

vim +1506 net/ethtool/ioctl.c

3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1276  
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1277  static noinline_for_stack int ethtool_set_rxfh(struct net_device *dev,
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1278  					       void __user *useraddr)
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1279  {
fb6e30a72539ce net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1280  	u32 rss_cfg_offset = offsetof(struct ethtool_rxfh, rss_config[0]);
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1281  	const struct ethtool_ops *ops = dev->ethtool_ops;
fb6e30a72539ce net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1282  	u32 dev_indir_size = 0, dev_key_size = 0, i;
fb6e30a72539ce net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1283  	struct ethtool_rxfh_param rxfh_dev = {};
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1284  	struct ethtool_rxfh_context *ctx = NULL;
fb6e30a72539ce net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1285  	struct netlink_ext_ack *extack = NULL;
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1286  	struct ethtool_rxnfc rx_rings;
f062a3844845d2 net/core/ethtool.c  Ben Hutchings   2014-05-15  1287  	struct ethtool_rxfh rxfh;
87925151191b64 net/ethtool/ioctl.c Edward Cree     2024-06-27  1288  	bool locked = false; /* dev->ethtool->rss_lock taken */
fb6e30a72539ce net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1289  	u32 indir_bytes = 0;
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1290  	bool create = false;
fb6e30a72539ce net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1291  	u8 *rss_config;
fb6e30a72539ce net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1292  	int ret;
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1293  
892311f66f2411 net/core/ethtool.c  Eyal Perry      2014-12-02  1294  	if (!ops->get_rxnfc || !ops->set_rxfh)
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1295  		return -EOPNOTSUPP;
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1296  
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1297  	if (ops->get_rxfh_indir_size)
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1298  		dev_indir_size = ops->get_rxfh_indir_size(dev);
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1299  	if (ops->get_rxfh_key_size)
d340c862e76081 net/core/ethtool.c  Dan Carpenter   2015-02-20  1300  		dev_key_size = ops->get_rxfh_key_size(dev);
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1301  
f062a3844845d2 net/core/ethtool.c  Ben Hutchings   2014-05-15  1302  	if (copy_from_user(&rxfh, useraddr, sizeof(rxfh)))
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1303  		return -EFAULT;
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1304  
f062a3844845d2 net/core/ethtool.c  Ben Hutchings   2014-05-15  1305  	/* Check that reserved fields are 0 for now */
13e59344fb9d3c net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1306  	if (rxfh.rsvd8[0] || rxfh.rsvd8[1] || rxfh.rsvd32)
f062a3844845d2 net/core/ethtool.c  Ben Hutchings   2014-05-15  1307  		return -EINVAL;
84a1d9c4820080 net/core/ethtool.c  Edward Cree     2018-03-08  1308  	/* Most drivers don't handle rss_context, check it's 0 as well */
dcd8dbf9e734eb net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1309  	if (rxfh.rss_context && !ops->cap_rss_ctx_supported)
84a1d9c4820080 net/core/ethtool.c  Edward Cree     2018-03-08  1310  		return -EOPNOTSUPP;
13e59344fb9d3c net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1311  	/* Check input data transformation capabilities */
948f97f9d8d2aa net/ethtool/ioctl.c Ahmed Zaki      2024-01-04  1312  	if (rxfh.input_xfrm && rxfh.input_xfrm != RXH_XFRM_SYM_XOR &&
948f97f9d8d2aa net/ethtool/ioctl.c Ahmed Zaki      2024-01-04  1313  	    rxfh.input_xfrm != RXH_XFRM_NO_CHANGE)
948f97f9d8d2aa net/ethtool/ioctl.c Ahmed Zaki      2024-01-04  1314  		return -EINVAL;
13e59344fb9d3c net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1315  	if ((rxfh.input_xfrm & RXH_XFRM_SYM_XOR) &&
13e59344fb9d3c net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1316  	    !ops->cap_rss_sym_xor_supported)
13e59344fb9d3c net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1317  		return -EOPNOTSUPP;
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1318  	create = rxfh.rss_context == ETH_RXFH_CONTEXT_ALLOC;
f062a3844845d2 net/core/ethtool.c  Ben Hutchings   2014-05-15  1319  
892311f66f2411 net/core/ethtool.c  Eyal Perry      2014-12-02  1320  	/* If either indir, hash key or function is valid, proceed further.
0dd415d155050f net/ethtool/ioctl.c Ahmed Zaki      2023-12-21  1321  	 * Must request at least one change: indir size, hash key, function
0dd415d155050f net/ethtool/ioctl.c Ahmed Zaki      2023-12-21  1322  	 * or input transformation.
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1323  	 */
f062a3844845d2 net/core/ethtool.c  Ben Hutchings   2014-05-15  1324  	if ((rxfh.indir_size &&
f062a3844845d2 net/core/ethtool.c  Ben Hutchings   2014-05-15  1325  	     rxfh.indir_size != ETH_RXFH_INDIR_NO_CHANGE &&
f062a3844845d2 net/core/ethtool.c  Ben Hutchings   2014-05-15  1326  	     rxfh.indir_size != dev_indir_size) ||
f062a3844845d2 net/core/ethtool.c  Ben Hutchings   2014-05-15  1327  	    (rxfh.key_size && (rxfh.key_size != dev_key_size)) ||
f062a3844845d2 net/core/ethtool.c  Ben Hutchings   2014-05-15  1328  	    (rxfh.indir_size == ETH_RXFH_INDIR_NO_CHANGE &&
0dd415d155050f net/ethtool/ioctl.c Ahmed Zaki      2023-12-21  1329  	     rxfh.key_size == 0 && rxfh.hfunc == ETH_RSS_HASH_NO_CHANGE &&
0dd415d155050f net/ethtool/ioctl.c Ahmed Zaki      2023-12-21  1330  	     rxfh.input_xfrm == RXH_XFRM_NO_CHANGE))
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1331  		return -EINVAL;
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1332  
f062a3844845d2 net/core/ethtool.c  Ben Hutchings   2014-05-15  1333  	if (rxfh.indir_size != ETH_RXFH_INDIR_NO_CHANGE)
fb6e30a72539ce net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1334  		indir_bytes = dev_indir_size * sizeof(rxfh_dev.indir[0]);
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1335  
f062a3844845d2 net/core/ethtool.c  Ben Hutchings   2014-05-15  1336  	rss_config = kzalloc(indir_bytes + rxfh.key_size, GFP_USER);
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1337  	if (!rss_config)
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1338  		return -ENOMEM;
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1339  
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1340  	rx_rings.cmd = ETHTOOL_GRXRINGS;
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1341  	ret = ops->get_rxnfc(dev, &rx_rings, NULL);
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1342  	if (ret)
7850f63f162051 net/core/ethtool.c  Ben Hutchings   2011-12-15  1343  		goto out;
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1344  
84a1d9c4820080 net/core/ethtool.c  Edward Cree     2018-03-08  1345  	/* rxfh.indir_size == 0 means reset the indir table to default (master
84a1d9c4820080 net/core/ethtool.c  Edward Cree     2018-03-08  1346  	 * context) or delete the context (other RSS contexts).
f062a3844845d2 net/core/ethtool.c  Ben Hutchings   2014-05-15  1347  	 * rxfh.indir_size == ETH_RXFH_INDIR_NO_CHANGE means leave it unchanged.
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1348  	 */
f062a3844845d2 net/core/ethtool.c  Ben Hutchings   2014-05-15  1349  	if (rxfh.indir_size &&
f062a3844845d2 net/core/ethtool.c  Ben Hutchings   2014-05-15  1350  	    rxfh.indir_size != ETH_RXFH_INDIR_NO_CHANGE) {
fb6e30a72539ce net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1351  		rxfh_dev.indir = (u32 *)rss_config;
fb6e30a72539ce net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1352  		rxfh_dev.indir_size = dev_indir_size;
fb6e30a72539ce net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1353  		ret = ethtool_copy_validate_indir(rxfh_dev.indir,
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1354  						  useraddr + rss_cfg_offset,
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1355  						  &rx_rings,
f062a3844845d2 net/core/ethtool.c  Ben Hutchings   2014-05-15  1356  						  rxfh.indir_size);
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1357  		if (ret)
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1358  			goto out;
f062a3844845d2 net/core/ethtool.c  Ben Hutchings   2014-05-15  1359  	} else if (rxfh.indir_size == 0) {
84a1d9c4820080 net/core/ethtool.c  Edward Cree     2018-03-08  1360  		if (rxfh.rss_context == 0) {
fb6e30a72539ce net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1361  			u32 *indir;
fb6e30a72539ce net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1362  
fb6e30a72539ce net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1363  			rxfh_dev.indir = (u32 *)rss_config;
fb6e30a72539ce net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1364  			rxfh_dev.indir_size = dev_indir_size;
fb6e30a72539ce net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1365  			indir = rxfh_dev.indir;
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1366  			for (i = 0; i < dev_indir_size; i++)
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1367  				indir[i] = ethtool_rxfh_indir_default(i, rx_rings.data);
84a1d9c4820080 net/core/ethtool.c  Edward Cree     2018-03-08  1368  		} else {
dcd8dbf9e734eb net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1369  			rxfh_dev.rss_delete = true;
84a1d9c4820080 net/core/ethtool.c  Edward Cree     2018-03-08  1370  		}
7850f63f162051 net/core/ethtool.c  Ben Hutchings   2011-12-15  1371  	}
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1372  
f062a3844845d2 net/core/ethtool.c  Ben Hutchings   2014-05-15  1373  	if (rxfh.key_size) {
fb6e30a72539ce net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1374  		rxfh_dev.key_size = dev_key_size;
fb6e30a72539ce net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1375  		rxfh_dev.key = rss_config + indir_bytes;
fb6e30a72539ce net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1376  		if (copy_from_user(rxfh_dev.key,
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1377  				   useraddr + rss_cfg_offset + indir_bytes,
f062a3844845d2 net/core/ethtool.c  Ben Hutchings   2014-05-15  1378  				   rxfh.key_size)) {
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1379  			ret = -EFAULT;
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1380  			goto out;
7850f63f162051 net/core/ethtool.c  Ben Hutchings   2011-12-15  1381  		}
278bc4296bd64f net/core/ethtool.c  Ben Hutchings   2011-12-15  1382  	}
7850f63f162051 net/core/ethtool.c  Ben Hutchings   2011-12-15  1383  
87925151191b64 net/ethtool/ioctl.c Edward Cree     2024-06-27  1384  	if (rxfh.rss_context) {
87925151191b64 net/ethtool/ioctl.c Edward Cree     2024-06-27 @1385  		mutex_lock(&dev->ethtool->rss_lock);
87925151191b64 net/ethtool/ioctl.c Edward Cree     2024-06-27  1386  		locked = true;
87925151191b64 net/ethtool/ioctl.c Edward Cree     2024-06-27  1387  	}
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1388  	if (create) {
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1389  		if (rxfh_dev.rss_delete) {
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1390  			ret = -EINVAL;
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1391  			goto out;
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1392  		}
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1393  		ctx = kzalloc(ethtool_rxfh_context_size(dev_indir_size,
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1394  							dev_key_size,
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1395  							ops->rxfh_priv_size),
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1396  			      GFP_KERNEL_ACCOUNT);
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1397  		if (!ctx) {
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1398  			ret = -ENOMEM;
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1399  			goto out;
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1400  		}
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1401  		ctx->indir_size = dev_indir_size;
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1402  		ctx->key_size = dev_key_size;
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1403  		ctx->priv_size = ops->rxfh_priv_size;
847a8ab186767b net/ethtool/ioctl.c Edward Cree     2024-06-27  1404  		/* Initialise to an empty context */
847a8ab186767b net/ethtool/ioctl.c Edward Cree     2024-06-27  1405  		ctx->hfunc = ETH_RSS_HASH_NO_CHANGE;
847a8ab186767b net/ethtool/ioctl.c Edward Cree     2024-06-27  1406  		ctx->input_xfrm = RXH_XFRM_NO_CHANGE;
847a8ab186767b net/ethtool/ioctl.c Edward Cree     2024-06-27  1407  		if (ops->create_rxfh_context) {
847a8ab186767b net/ethtool/ioctl.c Edward Cree     2024-06-27  1408  			u32 limit = ops->rxfh_max_context_id ?: U32_MAX;
847a8ab186767b net/ethtool/ioctl.c Edward Cree     2024-06-27  1409  			u32 ctx_id;
847a8ab186767b net/ethtool/ioctl.c Edward Cree     2024-06-27  1410  
847a8ab186767b net/ethtool/ioctl.c Edward Cree     2024-06-27  1411  			/* driver uses new API, core allocates ID */
847a8ab186767b net/ethtool/ioctl.c Edward Cree     2024-06-27  1412  			ret = xa_alloc(&dev->ethtool->rss_ctx, &ctx_id, ctx,
847a8ab186767b net/ethtool/ioctl.c Edward Cree     2024-06-27  1413  				       XA_LIMIT(1, limit), GFP_KERNEL_ACCOUNT);
847a8ab186767b net/ethtool/ioctl.c Edward Cree     2024-06-27  1414  			if (ret < 0) {
847a8ab186767b net/ethtool/ioctl.c Edward Cree     2024-06-27  1415  				kfree(ctx);
847a8ab186767b net/ethtool/ioctl.c Edward Cree     2024-06-27  1416  				goto out;
847a8ab186767b net/ethtool/ioctl.c Edward Cree     2024-06-27  1417  			}
847a8ab186767b net/ethtool/ioctl.c Edward Cree     2024-06-27  1418  			WARN_ON(!ctx_id); /* can't happen */
847a8ab186767b net/ethtool/ioctl.c Edward Cree     2024-06-27  1419  			rxfh.rss_context = ctx_id;
847a8ab186767b net/ethtool/ioctl.c Edward Cree     2024-06-27  1420  		}
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1421  	} else if (rxfh.rss_context) {
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1422  		ctx = xa_load(&dev->ethtool->rss_ctx, rxfh.rss_context);
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1423  		if (!ctx) {
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1424  			ret = -ENOENT;
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1425  			goto out;
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1426  		}
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1427  	}
fb6e30a72539ce net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1428  	rxfh_dev.hfunc = rxfh.hfunc;
dcd8dbf9e734eb net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1429  	rxfh_dev.rss_context = rxfh.rss_context;
13e59344fb9d3c net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1430  	rxfh_dev.input_xfrm = rxfh.input_xfrm;
fb6e30a72539ce net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1431  
847a8ab186767b net/ethtool/ioctl.c Edward Cree     2024-06-27  1432  	if (rxfh.rss_context && ops->create_rxfh_context) {
847a8ab186767b net/ethtool/ioctl.c Edward Cree     2024-06-27  1433  		if (create)
30a32cdf6b1303 net/ethtool/ioctl.c Edward Cree     2024-06-27  1434  			ret = ops->create_rxfh_context(dev, ctx, &rxfh_dev,
30a32cdf6b1303 net/ethtool/ioctl.c Edward Cree     2024-06-27  1435  						       extack);
847a8ab186767b net/ethtool/ioctl.c Edward Cree     2024-06-27  1436  		else if (rxfh_dev.rss_delete)
847a8ab186767b net/ethtool/ioctl.c Edward Cree     2024-06-27  1437  			ret = ops->remove_rxfh_context(dev, ctx,
30a32cdf6b1303 net/ethtool/ioctl.c Edward Cree     2024-06-27  1438  						       rxfh.rss_context,
30a32cdf6b1303 net/ethtool/ioctl.c Edward Cree     2024-06-27  1439  						       extack);
847a8ab186767b net/ethtool/ioctl.c Edward Cree     2024-06-27  1440  		else
30a32cdf6b1303 net/ethtool/ioctl.c Edward Cree     2024-06-27  1441  			ret = ops->modify_rxfh_context(dev, ctx, &rxfh_dev,
30a32cdf6b1303 net/ethtool/ioctl.c Edward Cree     2024-06-27  1442  						       extack);
847a8ab186767b net/ethtool/ioctl.c Edward Cree     2024-06-27  1443  	} else {
fb6e30a72539ce net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1444  		ret = ops->set_rxfh(dev, &rxfh_dev, extack);
847a8ab186767b net/ethtool/ioctl.c Edward Cree     2024-06-27  1445  	}
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1446  	if (ret) {
847a8ab186767b net/ethtool/ioctl.c Edward Cree     2024-06-27  1447  		if (create) {
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1448  			/* failed to create, free our new tracking entry */
847a8ab186767b net/ethtool/ioctl.c Edward Cree     2024-06-27  1449  			if (ops->create_rxfh_context)
847a8ab186767b net/ethtool/ioctl.c Edward Cree     2024-06-27  1450  				xa_erase(&dev->ethtool->rss_ctx, rxfh.rss_context);
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1451  			kfree(ctx);
847a8ab186767b net/ethtool/ioctl.c Edward Cree     2024-06-27  1452  		}
d4ab4286276fcd net/core/ethtool.c  Keller, Jacob E 2016-02-08  1453  		goto out;
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1454  	}
d4ab4286276fcd net/core/ethtool.c  Keller, Jacob E 2016-02-08  1455  
84a1d9c4820080 net/core/ethtool.c  Edward Cree     2018-03-08  1456  	if (copy_to_user(useraddr + offsetof(struct ethtool_rxfh, rss_context),
dcd8dbf9e734eb net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1457  			 &rxfh_dev.rss_context, sizeof(rxfh_dev.rss_context)))
84a1d9c4820080 net/core/ethtool.c  Edward Cree     2018-03-08  1458  		ret = -EFAULT;
84a1d9c4820080 net/core/ethtool.c  Edward Cree     2018-03-08  1459  
dcd8dbf9e734eb net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1460  	if (!rxfh_dev.rss_context) {
d4ab4286276fcd net/core/ethtool.c  Keller, Jacob E 2016-02-08  1461  		/* indicate whether rxfh was set to default */
d4ab4286276fcd net/core/ethtool.c  Keller, Jacob E 2016-02-08  1462  		if (rxfh.indir_size == 0)
d4ab4286276fcd net/core/ethtool.c  Keller, Jacob E 2016-02-08  1463  			dev->priv_flags &= ~IFF_RXFH_CONFIGURED;
d4ab4286276fcd net/core/ethtool.c  Keller, Jacob E 2016-02-08  1464  		else if (rxfh.indir_size != ETH_RXFH_INDIR_NO_CHANGE)
d4ab4286276fcd net/core/ethtool.c  Keller, Jacob E 2016-02-08  1465  			dev->priv_flags |= IFF_RXFH_CONFIGURED;
84a1d9c4820080 net/core/ethtool.c  Edward Cree     2018-03-08  1466  	}
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1467  	/* Update rss_ctx tracking */
847a8ab186767b net/ethtool/ioctl.c Edward Cree     2024-06-27  1468  	if (create && !ops->create_rxfh_context) {
847a8ab186767b net/ethtool/ioctl.c Edward Cree     2024-06-27  1469  		/* driver uses old API, it chose context ID */
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1470  		if (WARN_ON(xa_load(&dev->ethtool->rss_ctx, rxfh.rss_context))) {
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1471  			/* context ID reused, our tracking is screwed */
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1472  			kfree(ctx);
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1473  			goto out;
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1474  		}
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1475  		/* Allocate the exact ID the driver gave us */
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1476  		if (xa_is_err(xa_store(&dev->ethtool->rss_ctx, rxfh.rss_context,
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1477  				       ctx, GFP_KERNEL))) {
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1478  			kfree(ctx);
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1479  			goto out;
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1480  		}
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1481  	}
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1482  	if (rxfh_dev.rss_delete) {
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1483  		WARN_ON(xa_erase(&dev->ethtool->rss_ctx, rxfh.rss_context) != ctx);
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1484  		kfree(ctx);
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1485  	} else if (ctx) {
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1486  		if (rxfh_dev.indir) {
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1487  			for (i = 0; i < dev_indir_size; i++)
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1488  				ethtool_rxfh_context_indir(ctx)[i] = rxfh_dev.indir[i];
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1489  			ctx->indir_configured = 1;
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1490  		}
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1491  		if (rxfh_dev.key) {
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1492  			memcpy(ethtool_rxfh_context_key(ctx), rxfh_dev.key,
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1493  			       dev_key_size);
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1494  			ctx->key_configured = 1;
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1495  		}
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1496  		if (rxfh_dev.hfunc != ETH_RSS_HASH_NO_CHANGE)
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1497  			ctx->hfunc = rxfh_dev.hfunc;
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1498  		if (rxfh_dev.input_xfrm != RXH_XFRM_NO_CHANGE)
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1499  			ctx->input_xfrm = rxfh_dev.input_xfrm;
eac9122f0c41b8 net/ethtool/ioctl.c Edward Cree     2024-06-27  1500  	}
a5b6ee291e39e2 net/core/ethtool.c  Ben Hutchings   2010-06-30  1501  
a5b6ee291e39e2 net/core/ethtool.c  Ben Hutchings   2010-06-30  1502  out:
87925151191b64 net/ethtool/ioctl.c Edward Cree     2024-06-27  1503  	if (locked)
87925151191b64 net/ethtool/ioctl.c Edward Cree     2024-06-27  1504  		mutex_unlock(&dev->ethtool->rss_lock);
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1505  	kfree(rss_config);
a5b6ee291e39e2 net/core/ethtool.c  Ben Hutchings   2010-06-30 @1506  	return ret;
a5b6ee291e39e2 net/core/ethtool.c  Ben Hutchings   2010-06-30  1507  }
a5b6ee291e39e2 net/core/ethtool.c  Ben Hutchings   2010-06-30  1508  

:::::: The code at line 1506 was first introduced by commit
:::::: a5b6ee291e39e285e021cf251dbcf770c83cd74e ethtool: Add support for control of RX flow hash indirection

:::::: TO: Ben Hutchings <bhutchings@solarflare.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
