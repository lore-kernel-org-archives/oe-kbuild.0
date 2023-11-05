Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B734117E9
	for <oe-kbuild@lists.linux.dev>; Sun,  5 Nov 2023 00:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZZ6TXeJN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699142585; x=1730678585;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=KvF94kZelKvkUHlssHoTpVQmoJLoWhFIV/2QMVw3rw8=;
  b=ZZ6TXeJNhclC57nCqcwNm9bUtt7fFaB0QgQ7pmOdoaG23XTuSVMLlRsG
   p/w2xBh/dvlXpf7IP6dKBMb1se28vROYHnVhzw/ub6QVIuXkOtpCYE4Uk
   UfZ6N2AHOu6L2OagC8zt+ZtqZqFwgb7WZBCP0za81+QoialSaIjmO5idR
   6UvHhDsOUj6PnXj8aEQunniG/37cUVkT7otjMoPVEYfL3waEaWl9bJU4N
   7vsBG03jVLDSsflUeMiZ63pSExZCvYfKzJ29Fe9ugqsOKQ58htOc6XSsm
   3DPHS7Fd9qyke3lEYLQWt5IDjYJNY1LtqH2y6vChJdobdzkLYWeub9yGy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="379507941"
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="379507941"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2023 17:03:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="738443859"
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="738443859"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 04 Nov 2023 17:03:02 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzQbT-0004pY-2j;
	Sun, 05 Nov 2023 00:02:59 +0000
Date: Sun, 5 Nov 2023 08:02:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: crypto/tcrypt.c:2288 do_test() warn: Function too hairy.  No more
 merges.
Message-ID: <202311050732.d4Xb1skq-lkp@intel.com>
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
TO: Robert Elliott <elliott@hpe.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   aea6bf908d730b01bd264a8821159db9463c111c
commit: 65c92cbb3f2365627a10cf97560d51e88fb4e588 crypto: tcrypt - fix return value for multiple subtests
date:   1 year ago
:::::: branch date: 4 hours ago
:::::: commit date: 1 year ago
config: x86_64-randconfig-161-20231102 (https://download.01.org/0day-ci/archive/20231105/202311050732.d4Xb1skq-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231105/202311050732.d4Xb1skq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311050732.d4Xb1skq-lkp@intel.com/

smatch warnings:
crypto/tcrypt.c:2288 do_test() warn: Function too hairy.  No more merges.

vim +2288 crypto/tcrypt.c

01b323245e4f6d Herbert Xu             2008-07-31  1458  
4e234eed58518a Kees Cook              2018-04-26  1459  static int do_test(const char *alg, u32 type, u32 mask, int m, u32 num_mb)
01b323245e4f6d Herbert Xu             2008-07-31  1460  {
01b323245e4f6d Herbert Xu             2008-07-31  1461  	int i;
4e033a6bc70f09 Jarod Wilson           2009-05-27  1462  	int ret = 0;
01b323245e4f6d Herbert Xu             2008-07-31  1463  
01b323245e4f6d Herbert Xu             2008-07-31  1464  	switch (m) {
^1da177e4c3f41 Linus Torvalds         2005-04-16  1465  	case 0:
8606813a6c8997 Herbert Xu             2014-12-04  1466  		if (alg) {
8606813a6c8997 Herbert Xu             2014-12-04  1467  			if (!crypto_has_alg(alg, type,
8606813a6c8997 Herbert Xu             2014-12-04  1468  					    mask ?: CRYPTO_ALG_TYPE_MASK))
8606813a6c8997 Herbert Xu             2014-12-04  1469  				ret = -ENOENT;
8606813a6c8997 Herbert Xu             2014-12-04  1470  			break;
8606813a6c8997 Herbert Xu             2014-12-04  1471  		}
8606813a6c8997 Herbert Xu             2014-12-04  1472  
01b323245e4f6d Herbert Xu             2008-07-31  1473  		for (i = 1; i < 200; i++)
65c92cbb3f2365 Robert Elliott         2022-09-30  1474  			ret = min(ret, do_test(NULL, 0, 0, i, num_mb));
^1da177e4c3f41 Linus Torvalds         2005-04-16  1475  		break;
^1da177e4c3f41 Linus Torvalds         2005-04-16  1476  
^1da177e4c3f41 Linus Torvalds         2005-04-16  1477  	case 1:
65c92cbb3f2365 Robert Elliott         2022-09-30  1478  		ret = min(ret, tcrypt_test("md5"));
^1da177e4c3f41 Linus Torvalds         2005-04-16  1479  		break;
^1da177e4c3f41 Linus Torvalds         2005-04-16  1480  
^1da177e4c3f41 Linus Torvalds         2005-04-16  1481  	case 2:
65c92cbb3f2365 Robert Elliott         2022-09-30  1482  		ret = min(ret, tcrypt_test("sha1"));
^1da177e4c3f41 Linus Torvalds         2005-04-16  1483  		break;
^1da177e4c3f41 Linus Torvalds         2005-04-16  1484  
^1da177e4c3f41 Linus Torvalds         2005-04-16  1485  	case 3:
65c92cbb3f2365 Robert Elliott         2022-09-30  1486  		ret = min(ret, tcrypt_test("ecb(des)"));
65c92cbb3f2365 Robert Elliott         2022-09-30  1487  		ret = min(ret, tcrypt_test("cbc(des)"));
65c92cbb3f2365 Robert Elliott         2022-09-30  1488  		ret = min(ret, tcrypt_test("ctr(des)"));
^1da177e4c3f41 Linus Torvalds         2005-04-16  1489  		break;
^1da177e4c3f41 Linus Torvalds         2005-04-16  1490  
^1da177e4c3f41 Linus Torvalds         2005-04-16  1491  	case 4:
65c92cbb3f2365 Robert Elliott         2022-09-30  1492  		ret = min(ret, tcrypt_test("ecb(des3_ede)"));
65c92cbb3f2365 Robert Elliott         2022-09-30  1493  		ret = min(ret, tcrypt_test("cbc(des3_ede)"));
65c92cbb3f2365 Robert Elliott         2022-09-30  1494  		ret = min(ret, tcrypt_test("ctr(des3_ede)"));
^1da177e4c3f41 Linus Torvalds         2005-04-16  1495  		break;
^1da177e4c3f41 Linus Torvalds         2005-04-16  1496  
^1da177e4c3f41 Linus Torvalds         2005-04-16  1497  	case 5:
65c92cbb3f2365 Robert Elliott         2022-09-30  1498  		ret = min(ret, tcrypt_test("md4"));
^1da177e4c3f41 Linus Torvalds         2005-04-16  1499  		break;
^1da177e4c3f41 Linus Torvalds         2005-04-16  1500  
^1da177e4c3f41 Linus Torvalds         2005-04-16  1501  	case 6:
65c92cbb3f2365 Robert Elliott         2022-09-30  1502  		ret = min(ret, tcrypt_test("sha256"));
^1da177e4c3f41 Linus Torvalds         2005-04-16  1503  		break;
^1da177e4c3f41 Linus Torvalds         2005-04-16  1504  
^1da177e4c3f41 Linus Torvalds         2005-04-16  1505  	case 7:
65c92cbb3f2365 Robert Elliott         2022-09-30  1506  		ret = min(ret, tcrypt_test("ecb(blowfish)"));
65c92cbb3f2365 Robert Elliott         2022-09-30  1507  		ret = min(ret, tcrypt_test("cbc(blowfish)"));
65c92cbb3f2365 Robert Elliott         2022-09-30  1508  		ret = min(ret, tcrypt_test("ctr(blowfish)"));
^1da177e4c3f41 Linus Torvalds         2005-04-16  1509  		break;
^1da177e4c3f41 Linus Torvalds         2005-04-16  1510  
^1da177e4c3f41 Linus Torvalds         2005-04-16  1511  	case 8:
65c92cbb3f2365 Robert Elliott         2022-09-30  1512  		ret = min(ret, tcrypt_test("ecb(twofish)"));
65c92cbb3f2365 Robert Elliott         2022-09-30  1513  		ret = min(ret, tcrypt_test("cbc(twofish)"));
65c92cbb3f2365 Robert Elliott         2022-09-30  1514  		ret = min(ret, tcrypt_test("ctr(twofish)"));
65c92cbb3f2365 Robert Elliott         2022-09-30  1515  		ret = min(ret, tcrypt_test("lrw(twofish)"));
65c92cbb3f2365 Robert Elliott         2022-09-30  1516  		ret = min(ret, tcrypt_test("xts(twofish)"));
^1da177e4c3f41 Linus Torvalds         2005-04-16  1517  		break;
^1da177e4c3f41 Linus Torvalds         2005-04-16  1518  
^1da177e4c3f41 Linus Torvalds         2005-04-16  1519  	case 9:
65c92cbb3f2365 Robert Elliott         2022-09-30  1520  		ret = min(ret, tcrypt_test("ecb(serpent)"));
65c92cbb3f2365 Robert Elliott         2022-09-30  1521  		ret = min(ret, tcrypt_test("cbc(serpent)"));
65c92cbb3f2365 Robert Elliott         2022-09-30  1522  		ret = min(ret, tcrypt_test("ctr(serpent)"));
65c92cbb3f2365 Robert Elliott         2022-09-30  1523  		ret = min(ret, tcrypt_test("lrw(serpent)"));
65c92cbb3f2365 Robert Elliott         2022-09-30  1524  		ret = min(ret, tcrypt_test("xts(serpent)"));
^1da177e4c3f41 Linus Torvalds         2005-04-16  1525  		break;
^1da177e4c3f41 Linus Torvalds         2005-04-16  1526  
^1da177e4c3f41 Linus Torvalds         2005-04-16  1527  	case 10:
65c92cbb3f2365 Robert Elliott         2022-09-30  1528  		ret = min(ret, tcrypt_test("ecb(aes)"));
65c92cbb3f2365 Robert Elliott         2022-09-30  1529  		ret = min(ret, tcrypt_test("cbc(aes)"));
65c92cbb3f2365 Robert Elliott         2022-09-30  1530  		ret = min(ret, tcrypt_test("lrw(aes)"));
65c92cbb3f2365 Robert Elliott         2022-09-30  1531  		ret = min(ret, tcrypt_test("xts(aes)"));
65c92cbb3f2365 Robert Elliott         2022-09-30  1532  		ret = min(ret, tcrypt_test("ctr(aes)"));
65c92cbb3f2365 Robert Elliott         2022-09-30  1533  		ret = min(ret, tcrypt_test("rfc3686(ctr(aes))"));
65c92cbb3f2365 Robert Elliott         2022-09-30  1534  		ret = min(ret, tcrypt_test("ofb(aes)"));
65c92cbb3f2365 Robert Elliott         2022-09-30  1535  		ret = min(ret, tcrypt_test("cfb(aes)"));
65c92cbb3f2365 Robert Elliott         2022-09-30  1536  		ret = min(ret, tcrypt_test("xctr(aes)"));
^1da177e4c3f41 Linus Torvalds         2005-04-16  1537  		break;
^1da177e4c3f41 Linus Torvalds         2005-04-16  1538  
^1da177e4c3f41 Linus Torvalds         2005-04-16  1539  	case 11:
65c92cbb3f2365 Robert Elliott         2022-09-30  1540  		ret = min(ret, tcrypt_test("sha384"));
^1da177e4c3f41 Linus Torvalds         2005-04-16  1541  		break;
^1da177e4c3f41 Linus Torvalds         2005-04-16  1542  
^1da177e4c3f41 Linus Torvalds         2005-04-16  1543  	case 12:
65c92cbb3f2365 Robert Elliott         2022-09-30  1544  		ret = min(ret, tcrypt_test("sha512"));
^1da177e4c3f41 Linus Torvalds         2005-04-16  1545  		break;
^1da177e4c3f41 Linus Torvalds         2005-04-16  1546  
^1da177e4c3f41 Linus Torvalds         2005-04-16  1547  	case 13:
65c92cbb3f2365 Robert Elliott         2022-09-30  1548  		ret = min(ret, tcrypt_test("deflate"));
^1da177e4c3f41 Linus Torvalds         2005-04-16  1549  		break;
^1da177e4c3f41 Linus Torvalds         2005-04-16  1550  
^1da177e4c3f41 Linus Torvalds         2005-04-16  1551  	case 14:
65c92cbb3f2365 Robert Elliott         2022-09-30  1552  		ret = min(ret, tcrypt_test("ecb(cast5)"));
65c92cbb3f2365 Robert Elliott         2022-09-30  1553  		ret = min(ret, tcrypt_test("cbc(cast5)"));
65c92cbb3f2365 Robert Elliott         2022-09-30  1554  		ret = min(ret, tcrypt_test("ctr(cast5)"));
^1da177e4c3f41 Linus Torvalds         2005-04-16  1555  		break;
^1da177e4c3f41 Linus Torvalds         2005-04-16  1556  
^1da177e4c3f41 Linus Torvalds         2005-04-16  1557  	case 15:
65c92cbb3f2365 Robert Elliott         2022-09-30  1558  		ret = min(ret, tcrypt_test("ecb(cast6)"));
65c92cbb3f2365 Robert Elliott         2022-09-30  1559  		ret = min(ret, tcrypt_test("cbc(cast6)"));
65c92cbb3f2365 Robert Elliott         2022-09-30  1560  		ret = min(ret, tcrypt_test("ctr(cast6)"));
65c92cbb3f2365 Robert Elliott         2022-09-30  1561  		ret = min(ret, tcrypt_test("lrw(cast6)"));
65c92cbb3f2365 Robert Elliott         2022-09-30  1562  		ret = min(ret, tcrypt_test("xts(cast6)"));
^1da177e4c3f41 Linus Torvalds         2005-04-16  1563  		break;
^1da177e4c3f41 Linus Torvalds         2005-04-16  1564  
^1da177e4c3f41 Linus Torvalds         2005-04-16  1565  	case 16:
65c92cbb3f2365 Robert Elliott         2022-09-30  1566  		ret = min(ret, tcrypt_test("ecb(arc4)"));
^1da177e4c3f41 Linus Torvalds         2005-04-16  1567  		break;
^1da177e4c3f41 Linus Torvalds         2005-04-16  1568  
^1da177e4c3f41 Linus Torvalds         2005-04-16  1569  	case 17:
65c92cbb3f2365 Robert Elliott         2022-09-30  1570  		ret = min(ret, tcrypt_test("michael_mic"));
^1da177e4c3f41 Linus Torvalds         2005-04-16  1571  		break;
^1da177e4c3f41 Linus Torvalds         2005-04-16  1572  
^1da177e4c3f41 Linus Torvalds         2005-04-16  1573  	case 18:
65c92cbb3f2365 Robert Elliott         2022-09-30  1574  		ret = min(ret, tcrypt_test("crc32c"));
^1da177e4c3f41 Linus Torvalds         2005-04-16  1575  		break;
^1da177e4c3f41 Linus Torvalds         2005-04-16  1576  
^1da177e4c3f41 Linus Torvalds         2005-04-16  1577  	case 19:
65c92cbb3f2365 Robert Elliott         2022-09-30  1578  		ret = min(ret, tcrypt_test("ecb(tea)"));
^1da177e4c3f41 Linus Torvalds         2005-04-16  1579  		break;
^1da177e4c3f41 Linus Torvalds         2005-04-16  1580  
^1da177e4c3f41 Linus Torvalds         2005-04-16  1581  	case 20:
65c92cbb3f2365 Robert Elliott         2022-09-30  1582  		ret = min(ret, tcrypt_test("ecb(xtea)"));
^1da177e4c3f41 Linus Torvalds         2005-04-16  1583  		break;
^1da177e4c3f41 Linus Torvalds         2005-04-16  1584  
^1da177e4c3f41 Linus Torvalds         2005-04-16  1585  	case 21:
65c92cbb3f2365 Robert Elliott         2022-09-30  1586  		ret = min(ret, tcrypt_test("ecb(khazad)"));
^1da177e4c3f41 Linus Torvalds         2005-04-16  1587  		break;
^1da177e4c3f41 Linus Torvalds         2005-04-16  1588  
^1da177e4c3f41 Linus Torvalds         2005-04-16  1589  	case 22:
65c92cbb3f2365 Robert Elliott         2022-09-30  1590  		ret = min(ret, tcrypt_test("wp512"));
^1da177e4c3f41 Linus Torvalds         2005-04-16  1591  		break;
^1da177e4c3f41 Linus Torvalds         2005-04-16  1592  
^1da177e4c3f41 Linus Torvalds         2005-04-16  1593  	case 23:
65c92cbb3f2365 Robert Elliott         2022-09-30  1594  		ret = min(ret, tcrypt_test("wp384"));
^1da177e4c3f41 Linus Torvalds         2005-04-16  1595  		break;
^1da177e4c3f41 Linus Torvalds         2005-04-16  1596  
^1da177e4c3f41 Linus Torvalds         2005-04-16  1597  	case 24:
65c92cbb3f2365 Robert Elliott         2022-09-30  1598  		ret = min(ret, tcrypt_test("wp256"));
^1da177e4c3f41 Linus Torvalds         2005-04-16  1599  		break;
^1da177e4c3f41 Linus Torvalds         2005-04-16  1600  
^1da177e4c3f41 Linus Torvalds         2005-04-16  1601  	case 26:
65c92cbb3f2365 Robert Elliott         2022-09-30  1602  		ret = min(ret, tcrypt_test("ecb(anubis)"));
65c92cbb3f2365 Robert Elliott         2022-09-30  1603  		ret = min(ret, tcrypt_test("cbc(anubis)"));
^1da177e4c3f41 Linus Torvalds         2005-04-16  1604  		break;
^1da177e4c3f41 Linus Torvalds         2005-04-16  1605  
fb4f10ed50f01b Aaron Grothe           2005-09-01  1606  	case 30:
65c92cbb3f2365 Robert Elliott         2022-09-30  1607  		ret = min(ret, tcrypt_test("ecb(xeta)"));
fb4f10ed50f01b Aaron Grothe           2005-09-01  1608  		break;
fb4f10ed50f01b Aaron Grothe           2005-09-01  1609  
90831639a65592 David Howells          2006-12-16  1610  	case 31:
65c92cbb3f2365 Robert Elliott         2022-09-30  1611  		ret = min(ret, tcrypt_test("pcbc(fcrypt)"));
90831639a65592 David Howells          2006-12-16  1612  		break;
90831639a65592 David Howells          2006-12-16  1613  
02ab5a7056bd84 Noriaki TAKAMIYA       2007-01-24  1614  	case 32:
65c92cbb3f2365 Robert Elliott         2022-09-30  1615  		ret = min(ret, tcrypt_test("ecb(camellia)"));
65c92cbb3f2365 Robert Elliott         2022-09-30  1616  		ret = min(ret, tcrypt_test("cbc(camellia)"));
65c92cbb3f2365 Robert Elliott         2022-09-30  1617  		ret = min(ret, tcrypt_test("ctr(camellia)"));
65c92cbb3f2365 Robert Elliott         2022-09-30  1618  		ret = min(ret, tcrypt_test("lrw(camellia)"));
65c92cbb3f2365 Robert Elliott         2022-09-30  1619  		ret = min(ret, tcrypt_test("xts(camellia)"));
02ab5a7056bd84 Noriaki TAKAMIYA       2007-01-24  1620  		break;
93b5e86a6d13c5 Jussi Kivilinna        2013-04-08  1621  
cd12fb906d2591 Jonathan Lynch         2007-11-10  1622  	case 33:
65c92cbb3f2365 Robert Elliott         2022-09-30  1623  		ret = min(ret, tcrypt_test("sha224"));
cd12fb906d2591 Jonathan Lynch         2007-11-10  1624  		break;
02ab5a7056bd84 Noriaki TAKAMIYA       2007-01-24  1625  
8df213d9b520a4 Herbert Xu             2007-12-02  1626  	case 35:
65c92cbb3f2365 Robert Elliott         2022-09-30  1627  		ret = min(ret, tcrypt_test("gcm(aes)"));
8df213d9b520a4 Herbert Xu             2007-12-02  1628  		break;
8df213d9b520a4 Herbert Xu             2007-12-02  1629  
0b77abb3b2d0c2 Zoltan Sogor           2007-12-07  1630  	case 36:
65c92cbb3f2365 Robert Elliott         2022-09-30  1631  		ret = min(ret, tcrypt_test("lzo"));
0b77abb3b2d0c2 Zoltan Sogor           2007-12-07  1632  		break;
0b77abb3b2d0c2 Zoltan Sogor           2007-12-07  1633  
93cc74e078eed8 Joy Latten             2007-12-12  1634  	case 37:
65c92cbb3f2365 Robert Elliott         2022-09-30  1635  		ret = min(ret, tcrypt_test("ccm(aes)"));
93cc74e078eed8 Joy Latten             2007-12-12  1636  		break;
93cc74e078eed8 Joy Latten             2007-12-12  1637  
76cb9521795a16 Kevin Coffman          2008-03-24  1638  	case 38:
65c92cbb3f2365 Robert Elliott         2022-09-30  1639  		ret = min(ret, tcrypt_test("cts(cbc(aes))"));
76cb9521795a16 Kevin Coffman          2008-03-24  1640  		break;
76cb9521795a16 Kevin Coffman          2008-03-24  1641  
aa22cd7f67807e Ard Biesheuvel         2021-05-20  1642          case 39:
65c92cbb3f2365 Robert Elliott         2022-09-30  1643  		ret = min(ret, tcrypt_test("xxhash64"));
aa22cd7f67807e Ard Biesheuvel         2021-05-20  1644  		break;
aa22cd7f67807e Ard Biesheuvel         2021-05-20  1645  
fd4adf1a0b1923 Adrian-Ken Rueegsegger 2008-05-07  1646          case 40:
65c92cbb3f2365 Robert Elliott         2022-09-30  1647  		ret = min(ret, tcrypt_test("rmd160"));
fd4adf1a0b1923 Adrian-Ken Rueegsegger 2008-05-07  1648  		break;
fd4adf1a0b1923 Adrian-Ken Rueegsegger 2008-05-07  1649  
aa22cd7f67807e Ard Biesheuvel         2021-05-20  1650  	case 42:
65c92cbb3f2365 Robert Elliott         2022-09-30  1651  		ret = min(ret, tcrypt_test("blake2b-512"));
aa22cd7f67807e Ard Biesheuvel         2021-05-20  1652  		break;
aa22cd7f67807e Ard Biesheuvel         2021-05-20  1653  
01b323245e4f6d Herbert Xu             2008-07-31  1654  	case 43:
65c92cbb3f2365 Robert Elliott         2022-09-30  1655  		ret = min(ret, tcrypt_test("ecb(seed)"));
2998db37b5c628 Adrian-Ken Rueegsegger 2008-05-09  1656  		break;
2998db37b5c628 Adrian-Ken Rueegsegger 2008-05-09  1657  
5d667322a25ab4 Jarod Wilson           2009-05-04  1658  	case 45:
65c92cbb3f2365 Robert Elliott         2022-09-30  1659  		ret = min(ret, tcrypt_test("rfc4309(ccm(aes))"));
5d667322a25ab4 Jarod Wilson           2009-05-04  1660  		break;
5d667322a25ab4 Jarod Wilson           2009-05-04  1661  
54216bbd76aa39 Jussi Kivilinna        2012-09-21  1662  	case 46:
65c92cbb3f2365 Robert Elliott         2022-09-30  1663  		ret = min(ret, tcrypt_test("ghash"));
54216bbd76aa39 Jussi Kivilinna        2012-09-21  1664  		break;
54216bbd76aa39 Jussi Kivilinna        2012-09-21  1665  
68411521cc6055 Herbert Xu             2013-09-07  1666  	case 47:
65c92cbb3f2365 Robert Elliott         2022-09-30  1667  		ret = min(ret, tcrypt_test("crct10dif"));
68411521cc6055 Herbert Xu             2013-09-07  1668  		break;
68411521cc6055 Herbert Xu             2013-09-07  1669  
79cc6ab8947bd2 raveendra padasalagi   2016-06-17  1670  	case 48:
65c92cbb3f2365 Robert Elliott         2022-09-30  1671  		ret = min(ret, tcrypt_test("sha3-224"));
79cc6ab8947bd2 raveendra padasalagi   2016-06-17  1672  		break;
79cc6ab8947bd2 raveendra padasalagi   2016-06-17  1673  
79cc6ab8947bd2 raveendra padasalagi   2016-06-17  1674  	case 49:
65c92cbb3f2365 Robert Elliott         2022-09-30  1675  		ret = min(ret, tcrypt_test("sha3-256"));
79cc6ab8947bd2 raveendra padasalagi   2016-06-17  1676  		break;
79cc6ab8947bd2 raveendra padasalagi   2016-06-17  1677  
79cc6ab8947bd2 raveendra padasalagi   2016-06-17  1678  	case 50:
65c92cbb3f2365 Robert Elliott         2022-09-30  1679  		ret = min(ret, tcrypt_test("sha3-384"));
79cc6ab8947bd2 raveendra padasalagi   2016-06-17  1680  		break;
79cc6ab8947bd2 raveendra padasalagi   2016-06-17  1681  
79cc6ab8947bd2 raveendra padasalagi   2016-06-17  1682  	case 51:
65c92cbb3f2365 Robert Elliott         2022-09-30  1683  		ret = min(ret, tcrypt_test("sha3-512"));
79cc6ab8947bd2 raveendra padasalagi   2016-06-17  1684  		break;
79cc6ab8947bd2 raveendra padasalagi   2016-06-17  1685  
b7e2753040a2fe Gilad Ben-Yossef       2017-08-21  1686  	case 52:
65c92cbb3f2365 Robert Elliott         2022-09-30  1687  		ret = min(ret, tcrypt_test("sm3"));
b7e2753040a2fe Gilad Ben-Yossef       2017-08-21  1688  		break;
b7e2753040a2fe Gilad Ben-Yossef       2017-08-21  1689  
25a0b9d4e512ea Vitaly Chikunov        2018-11-07  1690  	case 53:
65c92cbb3f2365 Robert Elliott         2022-09-30  1691  		ret = min(ret, tcrypt_test("streebog256"));
25a0b9d4e512ea Vitaly Chikunov        2018-11-07  1692  		break;
25a0b9d4e512ea Vitaly Chikunov        2018-11-07  1693  
25a0b9d4e512ea Vitaly Chikunov        2018-11-07  1694  	case 54:
65c92cbb3f2365 Robert Elliott         2022-09-30  1695  		ret = min(ret, tcrypt_test("streebog512"));
25a0b9d4e512ea Vitaly Chikunov        2018-11-07  1696  		break;
25a0b9d4e512ea Vitaly Chikunov        2018-11-07  1697  
357a753f5ec7cc Tianjia Zhang          2021-08-13  1698  	case 55:
65c92cbb3f2365 Robert Elliott         2022-09-30  1699  		ret = min(ret, tcrypt_test("gcm(sm4)"));
357a753f5ec7cc Tianjia Zhang          2021-08-13  1700  		break;
357a753f5ec7cc Tianjia Zhang          2021-08-13  1701  
357a753f5ec7cc Tianjia Zhang          2021-08-13  1702  	case 56:
65c92cbb3f2365 Robert Elliott         2022-09-30  1703  		ret = min(ret, tcrypt_test("ccm(sm4)"));
357a753f5ec7cc Tianjia Zhang          2021-08-13  1704  		break;
357a753f5ec7cc Tianjia Zhang          2021-08-13  1705  
f3c923a09c4c4f Nathan Huckleberry     2022-05-20  1706  	case 57:
65c92cbb3f2365 Robert Elliott         2022-09-30  1707  		ret = min(ret, tcrypt_test("polyval"));
f3c923a09c4c4f Nathan Huckleberry     2022-05-20  1708  		break;
f3c923a09c4c4f Nathan Huckleberry     2022-05-20  1709  
01ce31de7043e1 Taehee Yoo             2022-07-04  1710  	case 58:
65c92cbb3f2365 Robert Elliott         2022-09-30  1711  		ret = min(ret, tcrypt_test("gcm(aria)"));
01ce31de7043e1 Taehee Yoo             2022-07-04  1712  		break;
01ce31de7043e1 Taehee Yoo             2022-07-04  1713  
^1da177e4c3f41 Linus Torvalds         2005-04-16  1714  	case 100:
65c92cbb3f2365 Robert Elliott         2022-09-30  1715  		ret = min(ret, tcrypt_test("hmac(md5)"));
^1da177e4c3f41 Linus Torvalds         2005-04-16  1716  		break;
^1da177e4c3f41 Linus Torvalds         2005-04-16  1717  
^1da177e4c3f41 Linus Torvalds         2005-04-16  1718  	case 101:
65c92cbb3f2365 Robert Elliott         2022-09-30  1719  		ret = min(ret, tcrypt_test("hmac(sha1)"));
^1da177e4c3f41 Linus Torvalds         2005-04-16  1720  		break;
^1da177e4c3f41 Linus Torvalds         2005-04-16  1721  
^1da177e4c3f41 Linus Torvalds         2005-04-16  1722  	case 102:
65c92cbb3f2365 Robert Elliott         2022-09-30  1723  		ret = min(ret, tcrypt_test("hmac(sha256)"));
^1da177e4c3f41 Linus Torvalds         2005-04-16  1724  		break;
^1da177e4c3f41 Linus Torvalds         2005-04-16  1725  
a28091ae170cd0 Andrew Donofrio        2006-12-10  1726  	case 103:
65c92cbb3f2365 Robert Elliott         2022-09-30  1727  		ret = min(ret, tcrypt_test("hmac(sha384)"));
a28091ae170cd0 Andrew Donofrio        2006-12-10  1728  		break;
a28091ae170cd0 Andrew Donofrio        2006-12-10  1729  
a28091ae170cd0 Andrew Donofrio        2006-12-10  1730  	case 104:
65c92cbb3f2365 Robert Elliott         2022-09-30  1731  		ret = min(ret, tcrypt_test("hmac(sha512)"));
a28091ae170cd0 Andrew Donofrio        2006-12-10  1732  		break;
38ed9ab23b8614 Herbert Xu             2008-01-01  1733  
cd12fb906d2591 Jonathan Lynch         2007-11-10  1734  	case 105:
65c92cbb3f2365 Robert Elliott         2022-09-30  1735  		ret = min(ret, tcrypt_test("hmac(sha224)"));
cd12fb906d2591 Jonathan Lynch         2007-11-10  1736  		break;
^1da177e4c3f41 Linus Torvalds         2005-04-16  1737  
38ed9ab23b8614 Herbert Xu             2008-01-01  1738  	case 106:
65c92cbb3f2365 Robert Elliott         2022-09-30  1739  		ret = min(ret, tcrypt_test("xcbc(aes)"));
38ed9ab23b8614 Herbert Xu             2008-01-01  1740  		break;
38ed9ab23b8614 Herbert Xu             2008-01-01  1741  
fd4adf1a0b1923 Adrian-Ken Rueegsegger 2008-05-07  1742  	case 108:
65c92cbb3f2365 Robert Elliott         2022-09-30  1743  		ret = min(ret, tcrypt_test("hmac(rmd160)"));
fd4adf1a0b1923 Adrian-Ken Rueegsegger 2008-05-07  1744  		break;
fd4adf1a0b1923 Adrian-Ken Rueegsegger 2008-05-07  1745  
f1939f7c56456d Shane Wang             2009-09-02  1746  	case 109:
65c92cbb3f2365 Robert Elliott         2022-09-30  1747  		ret = min(ret, tcrypt_test("vmac64(aes)"));
f1939f7c56456d Shane Wang             2009-09-02  1748  		break;
93b5e86a6d13c5 Jussi Kivilinna        2013-04-08  1749  
98eca72fa04a9b raveendra padasalagi   2016-07-01  1750  	case 111:
65c92cbb3f2365 Robert Elliott         2022-09-30  1751  		ret = min(ret, tcrypt_test("hmac(sha3-224)"));
98eca72fa04a9b raveendra padasalagi   2016-07-01  1752  		break;
98eca72fa04a9b raveendra padasalagi   2016-07-01  1753  
98eca72fa04a9b raveendra padasalagi   2016-07-01  1754  	case 112:
65c92cbb3f2365 Robert Elliott         2022-09-30  1755  		ret = min(ret, tcrypt_test("hmac(sha3-256)"));
98eca72fa04a9b raveendra padasalagi   2016-07-01  1756  		break;
98eca72fa04a9b raveendra padasalagi   2016-07-01  1757  
98eca72fa04a9b raveendra padasalagi   2016-07-01  1758  	case 113:
65c92cbb3f2365 Robert Elliott         2022-09-30  1759  		ret = min(ret, tcrypt_test("hmac(sha3-384)"));
98eca72fa04a9b raveendra padasalagi   2016-07-01  1760  		break;
98eca72fa04a9b raveendra padasalagi   2016-07-01  1761  
98eca72fa04a9b raveendra padasalagi   2016-07-01  1762  	case 114:
65c92cbb3f2365 Robert Elliott         2022-09-30  1763  		ret = min(ret, tcrypt_test("hmac(sha3-512)"));
98eca72fa04a9b raveendra padasalagi   2016-07-01  1764  		break;
98eca72fa04a9b raveendra padasalagi   2016-07-01  1765  
25a0b9d4e512ea Vitaly Chikunov        2018-11-07  1766  	case 115:
65c92cbb3f2365 Robert Elliott         2022-09-30  1767  		ret = min(ret, tcrypt_test("hmac(streebog256)"));
25a0b9d4e512ea Vitaly Chikunov        2018-11-07  1768  		break;
25a0b9d4e512ea Vitaly Chikunov        2018-11-07  1769  
25a0b9d4e512ea Vitaly Chikunov        2018-11-07  1770  	case 116:
65c92cbb3f2365 Robert Elliott         2022-09-30  1771  		ret = min(ret, tcrypt_test("hmac(streebog512)"));
25a0b9d4e512ea Vitaly Chikunov        2018-11-07  1772  		break;
25a0b9d4e512ea Vitaly Chikunov        2018-11-07  1773  
e08ca2da39db22 Jarod Wilson           2009-05-04  1774  	case 150:
65c92cbb3f2365 Robert Elliott         2022-09-30  1775  		ret = min(ret, tcrypt_test("ansi_cprng"));
e08ca2da39db22 Jarod Wilson           2009-05-04  1776  		break;
e08ca2da39db22 Jarod Wilson           2009-05-04  1777  
69435b94d01f49 Adrian Hoban           2010-11-04  1778  	case 151:
65c92cbb3f2365 Robert Elliott         2022-09-30  1779  		ret = min(ret, tcrypt_test("rfc4106(gcm(aes))"));
69435b94d01f49 Adrian Hoban           2010-11-04  1780  		break;
69435b94d01f49 Adrian Hoban           2010-11-04  1781  
e9b7441a9926b8 Jussi Kivilinna        2013-04-07  1782  	case 152:
65c92cbb3f2365 Robert Elliott         2022-09-30  1783  		ret = min(ret, tcrypt_test("rfc4543(gcm(aes))"));
e9b7441a9926b8 Jussi Kivilinna        2013-04-07  1784  		break;
e9b7441a9926b8 Jussi Kivilinna        2013-04-07  1785  
93b5e86a6d13c5 Jussi Kivilinna        2013-04-08  1786  	case 153:
65c92cbb3f2365 Robert Elliott         2022-09-30  1787  		ret = min(ret, tcrypt_test("cmac(aes)"));
93b5e86a6d13c5 Jussi Kivilinna        2013-04-08  1788  		break;
93b5e86a6d13c5 Jussi Kivilinna        2013-04-08  1789  
93b5e86a6d13c5 Jussi Kivilinna        2013-04-08  1790  	case 154:
65c92cbb3f2365 Robert Elliott         2022-09-30  1791  		ret = min(ret, tcrypt_test("cmac(des3_ede)"));
93b5e86a6d13c5 Jussi Kivilinna        2013-04-08  1792  		break;
93b5e86a6d13c5 Jussi Kivilinna        2013-04-08  1793  
bbf9c8934ba2bf Horia Geanta           2013-11-28  1794  	case 155:
65c92cbb3f2365 Robert Elliott         2022-09-30  1795  		ret = min(ret, tcrypt_test("authenc(hmac(sha1),cbc(aes))"));
bbf9c8934ba2bf Horia Geanta           2013-11-28  1796  		break;
bbf9c8934ba2bf Horia Geanta           2013-11-28  1797  
bca4feb0d4fe2d Horia Geanta           2014-03-14  1798  	case 156:
65c92cbb3f2365 Robert Elliott         2022-09-30  1799  		ret = min(ret, tcrypt_test("authenc(hmac(md5),ecb(cipher_null))"));
bca4feb0d4fe2d Horia Geanta           2014-03-14  1800  		break;
bca4feb0d4fe2d Horia Geanta           2014-03-14  1801  
bca4feb0d4fe2d Horia Geanta           2014-03-14  1802  	case 157:
65c92cbb3f2365 Robert Elliott         2022-09-30  1803  		ret = min(ret, tcrypt_test("authenc(hmac(sha1),ecb(cipher_null))"));
bca4feb0d4fe2d Horia Geanta           2014-03-14  1804  		break;
357a753f5ec7cc Tianjia Zhang          2021-08-13  1805  
357a753f5ec7cc Tianjia Zhang          2021-08-13  1806  	case 158:
65c92cbb3f2365 Robert Elliott         2022-09-30  1807  		ret = min(ret, tcrypt_test("cbcmac(sm4)"));
357a753f5ec7cc Tianjia Zhang          2021-08-13  1808  		break;
357a753f5ec7cc Tianjia Zhang          2021-08-13  1809  
357a753f5ec7cc Tianjia Zhang          2021-08-13  1810  	case 159:
65c92cbb3f2365 Robert Elliott         2022-09-30  1811  		ret = min(ret, tcrypt_test("cmac(sm4)"));
357a753f5ec7cc Tianjia Zhang          2021-08-13  1812  		break;
357a753f5ec7cc Tianjia Zhang          2021-08-13  1813  
5208ed2ca16526 Nitesh Lal             2014-05-21  1814  	case 181:
65c92cbb3f2365 Robert Elliott         2022-09-30  1815  		ret = min(ret, tcrypt_test("authenc(hmac(sha1),cbc(des))"));
5208ed2ca16526 Nitesh Lal             2014-05-21  1816  		break;
5208ed2ca16526 Nitesh Lal             2014-05-21  1817  	case 182:
65c92cbb3f2365 Robert Elliott         2022-09-30  1818  		ret = min(ret, tcrypt_test("authenc(hmac(sha1),cbc(des3_ede))"));
5208ed2ca16526 Nitesh Lal             2014-05-21  1819  		break;
5208ed2ca16526 Nitesh Lal             2014-05-21  1820  	case 183:
65c92cbb3f2365 Robert Elliott         2022-09-30  1821  		ret = min(ret, tcrypt_test("authenc(hmac(sha224),cbc(des))"));
5208ed2ca16526 Nitesh Lal             2014-05-21  1822  		break;
5208ed2ca16526 Nitesh Lal             2014-05-21  1823  	case 184:
65c92cbb3f2365 Robert Elliott         2022-09-30  1824  		ret = min(ret, tcrypt_test("authenc(hmac(sha224),cbc(des3_ede))"));
5208ed2ca16526 Nitesh Lal             2014-05-21  1825  		break;
5208ed2ca16526 Nitesh Lal             2014-05-21  1826  	case 185:
65c92cbb3f2365 Robert Elliott         2022-09-30  1827  		ret = min(ret, tcrypt_test("authenc(hmac(sha256),cbc(des))"));
5208ed2ca16526 Nitesh Lal             2014-05-21  1828  		break;
5208ed2ca16526 Nitesh Lal             2014-05-21  1829  	case 186:
65c92cbb3f2365 Robert Elliott         2022-09-30  1830  		ret = min(ret, tcrypt_test("authenc(hmac(sha256),cbc(des3_ede))"));
5208ed2ca16526 Nitesh Lal             2014-05-21  1831  		break;
5208ed2ca16526 Nitesh Lal             2014-05-21  1832  	case 187:
65c92cbb3f2365 Robert Elliott         2022-09-30  1833  		ret = min(ret, tcrypt_test("authenc(hmac(sha384),cbc(des))"));
5208ed2ca16526 Nitesh Lal             2014-05-21  1834  		break;
5208ed2ca16526 Nitesh Lal             2014-05-21  1835  	case 188:
65c92cbb3f2365 Robert Elliott         2022-09-30  1836  		ret = min(ret, tcrypt_test("authenc(hmac(sha384),cbc(des3_ede))"));
5208ed2ca16526 Nitesh Lal             2014-05-21  1837  		break;
5208ed2ca16526 Nitesh Lal             2014-05-21  1838  	case 189:
65c92cbb3f2365 Robert Elliott         2022-09-30  1839  		ret = min(ret, tcrypt_test("authenc(hmac(sha512),cbc(des))"));
5208ed2ca16526 Nitesh Lal             2014-05-21  1840  		break;
5208ed2ca16526 Nitesh Lal             2014-05-21  1841  	case 190:
65c92cbb3f2365 Robert Elliott         2022-09-30  1842  		ret = min(ret, tcrypt_test("authenc(hmac(sha512),cbc(des3_ede))"));
5208ed2ca16526 Nitesh Lal             2014-05-21  1843  		break;
cd83a8a7c3eaff Gilad Ben-Yossef       2018-03-06  1844  	case 191:
65c92cbb3f2365 Robert Elliott         2022-09-30  1845  		ret = min(ret, tcrypt_test("ecb(sm4)"));
65c92cbb3f2365 Robert Elliott         2022-09-30  1846  		ret = min(ret, tcrypt_test("cbc(sm4)"));
65c92cbb3f2365 Robert Elliott         2022-09-30  1847  		ret = min(ret, tcrypt_test("cfb(sm4)"));
65c92cbb3f2365 Robert Elliott         2022-09-30  1848  		ret = min(ret, tcrypt_test("ctr(sm4)"));
cd83a8a7c3eaff Gilad Ben-Yossef       2018-03-06  1849  		break;
01ce31de7043e1 Taehee Yoo             2022-07-04  1850  	case 192:
65c92cbb3f2365 Robert Elliott         2022-09-30  1851  		ret = min(ret, tcrypt_test("ecb(aria)"));
65c92cbb3f2365 Robert Elliott         2022-09-30  1852  		ret = min(ret, tcrypt_test("cbc(aria)"));
65c92cbb3f2365 Robert Elliott         2022-09-30  1853  		ret = min(ret, tcrypt_test("cfb(aria)"));
65c92cbb3f2365 Robert Elliott         2022-09-30  1854  		ret = min(ret, tcrypt_test("ctr(aria)"));
01ce31de7043e1 Taehee Yoo             2022-07-04  1855  		break;
ebfd9bcf16e4aa Harald Welte           2005-06-22  1856  	case 200:
cba83564d112e4 Herbert Xu             2006-08-13  1857  		test_cipher_speed("ecb(aes)", ENCRYPT, sec, NULL, 0,
477035c2abdcff Sebastian Siewior      2008-03-11  1858  				speed_template_16_24_32);
cba83564d112e4 Herbert Xu             2006-08-13  1859  		test_cipher_speed("ecb(aes)", DECRYPT, sec, NULL, 0,
477035c2abdcff Sebastian Siewior      2008-03-11  1860  				speed_template_16_24_32);
cba83564d112e4 Herbert Xu             2006-08-13  1861  		test_cipher_speed("cbc(aes)", ENCRYPT, sec, NULL, 0,
477035c2abdcff Sebastian Siewior      2008-03-11  1862  				speed_template_16_24_32);
cba83564d112e4 Herbert Xu             2006-08-13  1863  		test_cipher_speed("cbc(aes)", DECRYPT, sec, NULL, 0,
477035c2abdcff Sebastian Siewior      2008-03-11  1864  				speed_template_16_24_32);
f3d1044cd0a9b4 Rik Snel               2006-11-29  1865  		test_cipher_speed("lrw(aes)", ENCRYPT, sec, NULL, 0,
477035c2abdcff Sebastian Siewior      2008-03-11  1866  				speed_template_32_40_48);
f3d1044cd0a9b4 Rik Snel               2006-11-29  1867  		test_cipher_speed("lrw(aes)", DECRYPT, sec, NULL, 0,
477035c2abdcff Sebastian Siewior      2008-03-11  1868  				speed_template_32_40_48);
f19f5111c94053 Rik Snel               2007-09-19  1869  		test_cipher_speed("xts(aes)", ENCRYPT, sec, NULL, 0,
b66ad0b7aa92e6 Horia Geantă           2017-07-19  1870  				speed_template_32_64);
f19f5111c94053 Rik Snel               2007-09-19  1871  		test_cipher_speed("xts(aes)", DECRYPT, sec, NULL, 0,
b66ad0b7aa92e6 Horia Geantă           2017-07-19  1872  				speed_template_32_64);
1503a24f53f153 Herbert Xu             2016-06-29  1873  		test_cipher_speed("cts(cbc(aes))", ENCRYPT, sec, NULL, 0,
1503a24f53f153 Herbert Xu             2016-06-29  1874  				speed_template_16_24_32);
1503a24f53f153 Herbert Xu             2016-06-29  1875  		test_cipher_speed("cts(cbc(aes))", DECRYPT, sec, NULL, 0,
1503a24f53f153 Herbert Xu             2016-06-29  1876  				speed_template_16_24_32);
9996e3421cae20 Jan Glauber            2011-04-26  1877  		test_cipher_speed("ctr(aes)", ENCRYPT, sec, NULL, 0,
9996e3421cae20 Jan Glauber            2011-04-26  1878  				speed_template_16_24_32);
9996e3421cae20 Jan Glauber            2011-04-26  1879  		test_cipher_speed("ctr(aes)", DECRYPT, sec, NULL, 0,
9996e3421cae20 Jan Glauber            2011-04-26  1880  				speed_template_16_24_32);
7da66670775d20 Dmitry Baryshkov       2018-10-20  1881  		test_cipher_speed("cfb(aes)", ENCRYPT, sec, NULL, 0,
7da66670775d20 Dmitry Baryshkov       2018-10-20  1882  				speed_template_16_24_32);
7da66670775d20 Dmitry Baryshkov       2018-10-20  1883  		test_cipher_speed("cfb(aes)", DECRYPT, sec, NULL, 0,
7da66670775d20 Dmitry Baryshkov       2018-10-20  1884  				speed_template_16_24_32);
ebfd9bcf16e4aa Harald Welte           2005-06-22  1885  		break;
ebfd9bcf16e4aa Harald Welte           2005-06-22  1886  
ebfd9bcf16e4aa Harald Welte           2005-06-22  1887  	case 201:
cba83564d112e4 Herbert Xu             2006-08-13  1888  		test_cipher_speed("ecb(des3_ede)", ENCRYPT, sec,
da7f033ddc9fde Herbert Xu             2008-07-31  1889  				des3_speed_template, DES3_SPEED_VECTORS,
477035c2abdcff Sebastian Siewior      2008-03-11  1890  				speed_template_24);
cba83564d112e4 Herbert Xu             2006-08-13  1891  		test_cipher_speed("ecb(des3_ede)", DECRYPT, sec,
da7f033ddc9fde Herbert Xu             2008-07-31  1892  				des3_speed_template, DES3_SPEED_VECTORS,
477035c2abdcff Sebastian Siewior      2008-03-11  1893  				speed_template_24);
cba83564d112e4 Herbert Xu             2006-08-13  1894  		test_cipher_speed("cbc(des3_ede)", ENCRYPT, sec,
da7f033ddc9fde Herbert Xu             2008-07-31  1895  				des3_speed_template, DES3_SPEED_VECTORS,
477035c2abdcff Sebastian Siewior      2008-03-11  1896  				speed_template_24);
cba83564d112e4 Herbert Xu             2006-08-13  1897  		test_cipher_speed("cbc(des3_ede)", DECRYPT, sec,
da7f033ddc9fde Herbert Xu             2008-07-31  1898  				des3_speed_template, DES3_SPEED_VECTORS,
477035c2abdcff Sebastian Siewior      2008-03-11  1899  				speed_template_24);
87131507e1a60c Jussi Kivilinna        2014-06-09  1900  		test_cipher_speed("ctr(des3_ede)", ENCRYPT, sec,
87131507e1a60c Jussi Kivilinna        2014-06-09  1901  				des3_speed_template, DES3_SPEED_VECTORS,
87131507e1a60c Jussi Kivilinna        2014-06-09  1902  				speed_template_24);
87131507e1a60c Jussi Kivilinna        2014-06-09  1903  		test_cipher_speed("ctr(des3_ede)", DECRYPT, sec,
87131507e1a60c Jussi Kivilinna        2014-06-09  1904  				des3_speed_template, DES3_SPEED_VECTORS,
87131507e1a60c Jussi Kivilinna        2014-06-09  1905  				speed_template_24);
ebfd9bcf16e4aa Harald Welte           2005-06-22  1906  		break;
ebfd9bcf16e4aa Harald Welte           2005-06-22  1907  
ebfd9bcf16e4aa Harald Welte           2005-06-22  1908  	case 202:
cba83564d112e4 Herbert Xu             2006-08-13  1909  		test_cipher_speed("ecb(twofish)", ENCRYPT, sec, NULL, 0,
477035c2abdcff Sebastian Siewior      2008-03-11  1910  				speed_template_16_24_32);
cba83564d112e4 Herbert Xu             2006-08-13  1911  		test_cipher_speed("ecb(twofish)", DECRYPT, sec, NULL, 0,
477035c2abdcff Sebastian Siewior      2008-03-11  1912  				speed_template_16_24_32);
cba83564d112e4 Herbert Xu             2006-08-13  1913  		test_cipher_speed("cbc(twofish)", ENCRYPT, sec, NULL, 0,
477035c2abdcff Sebastian Siewior      2008-03-11  1914  				speed_template_16_24_32);
cba83564d112e4 Herbert Xu             2006-08-13  1915  		test_cipher_speed("cbc(twofish)", DECRYPT, sec, NULL, 0,
477035c2abdcff Sebastian Siewior      2008-03-11  1916  				speed_template_16_24_32);
ee5002a5497f32 Jussi Kivilinna        2011-09-26  1917  		test_cipher_speed("ctr(twofish)", ENCRYPT, sec, NULL, 0,
ee5002a5497f32 Jussi Kivilinna        2011-09-26  1918  				speed_template_16_24_32);
ee5002a5497f32 Jussi Kivilinna        2011-09-26  1919  		test_cipher_speed("ctr(twofish)", DECRYPT, sec, NULL, 0,
ee5002a5497f32 Jussi Kivilinna        2011-09-26  1920  				speed_template_16_24_32);
bee3a90ef5366b Jussi Kivilinna        2011-10-18  1921  		test_cipher_speed("lrw(twofish)", ENCRYPT, sec, NULL, 0,
bee3a90ef5366b Jussi Kivilinna        2011-10-18  1922  				speed_template_32_40_48);
bee3a90ef5366b Jussi Kivilinna        2011-10-18  1923  		test_cipher_speed("lrw(twofish)", DECRYPT, sec, NULL, 0,
bee3a90ef5366b Jussi Kivilinna        2011-10-18  1924  				speed_template_32_40_48);
131f754161bc01 Jussi Kivilinna        2011-10-18  1925  		test_cipher_speed("xts(twofish)", ENCRYPT, sec, NULL, 0,
131f754161bc01 Jussi Kivilinna        2011-10-18  1926  				speed_template_32_48_64);
131f754161bc01 Jussi Kivilinna        2011-10-18  1927  		test_cipher_speed("xts(twofish)", DECRYPT, sec, NULL, 0,
131f754161bc01 Jussi Kivilinna        2011-10-18  1928  				speed_template_32_48_64);
ebfd9bcf16e4aa Harald Welte           2005-06-22  1929  		break;
ebfd9bcf16e4aa Harald Welte           2005-06-22  1930  
ebfd9bcf16e4aa Harald Welte           2005-06-22  1931  	case 203:
cba83564d112e4 Herbert Xu             2006-08-13  1932  		test_cipher_speed("ecb(blowfish)", ENCRYPT, sec, NULL, 0,
477035c2abdcff Sebastian Siewior      2008-03-11  1933  				  speed_template_8_32);
cba83564d112e4 Herbert Xu             2006-08-13  1934  		test_cipher_speed("ecb(blowfish)", DECRYPT, sec, NULL, 0,
477035c2abdcff Sebastian Siewior      2008-03-11  1935  				  speed_template_8_32);
cba83564d112e4 Herbert Xu             2006-08-13  1936  		test_cipher_speed("cbc(blowfish)", ENCRYPT, sec, NULL, 0,
477035c2abdcff Sebastian Siewior      2008-03-11  1937  				  speed_template_8_32);
cba83564d112e4 Herbert Xu             2006-08-13  1938  		test_cipher_speed("cbc(blowfish)", DECRYPT, sec, NULL, 0,
477035c2abdcff Sebastian Siewior      2008-03-11  1939  				  speed_template_8_32);
7d47b86cfef808 Jussi Kivilinna        2011-09-02  1940  		test_cipher_speed("ctr(blowfish)", ENCRYPT, sec, NULL, 0,
7d47b86cfef808 Jussi Kivilinna        2011-09-02  1941  				  speed_template_8_32);
7d47b86cfef808 Jussi Kivilinna        2011-09-02  1942  		test_cipher_speed("ctr(blowfish)", DECRYPT, sec, NULL, 0,
7d47b86cfef808 Jussi Kivilinna        2011-09-02  1943  				  speed_template_8_32);
ebfd9bcf16e4aa Harald Welte           2005-06-22  1944  		break;
ebfd9bcf16e4aa Harald Welte           2005-06-22  1945  
ebfd9bcf16e4aa Harald Welte           2005-06-22  1946  	case 204:
cba83564d112e4 Herbert Xu             2006-08-13  1947  		test_cipher_speed("ecb(des)", ENCRYPT, sec, NULL, 0,
477035c2abdcff Sebastian Siewior      2008-03-11  1948  				  speed_template_8);
cba83564d112e4 Herbert Xu             2006-08-13  1949  		test_cipher_speed("ecb(des)", DECRYPT, sec, NULL, 0,
477035c2abdcff Sebastian Siewior      2008-03-11  1950  				  speed_template_8);
cba83564d112e4 Herbert Xu             2006-08-13  1951  		test_cipher_speed("cbc(des)", ENCRYPT, sec, NULL, 0,
477035c2abdcff Sebastian Siewior      2008-03-11  1952  				  speed_template_8);
cba83564d112e4 Herbert Xu             2006-08-13  1953  		test_cipher_speed("cbc(des)", DECRYPT, sec, NULL, 0,
477035c2abdcff Sebastian Siewior      2008-03-11  1954  				  speed_template_8);
ebfd9bcf16e4aa Harald Welte           2005-06-22  1955  		break;
ebfd9bcf16e4aa Harald Welte           2005-06-22  1956  
02ab5a7056bd84 Noriaki TAKAMIYA       2007-01-24  1957  	case 205:
02ab5a7056bd84 Noriaki TAKAMIYA       2007-01-24  1958  		test_cipher_speed("ecb(camellia)", ENCRYPT, sec, NULL, 0,
477035c2abdcff Sebastian Siewior      2008-03-11  1959  				speed_template_16_24_32);
02ab5a7056bd84 Noriaki TAKAMIYA       2007-01-24  1960  		test_cipher_speed("ecb(camellia)", DECRYPT, sec, NULL, 0,
477035c2abdcff Sebastian Siewior      2008-03-11  1961  				speed_template_16_24_32);
02ab5a7056bd84 Noriaki TAKAMIYA       2007-01-24  1962  		test_cipher_speed("cbc(camellia)", ENCRYPT, sec, NULL, 0,
477035c2abdcff Sebastian Siewior      2008-03-11  1963  				speed_template_16_24_32);
02ab5a7056bd84 Noriaki TAKAMIYA       2007-01-24  1964  		test_cipher_speed("cbc(camellia)", DECRYPT, sec, NULL, 0,
477035c2abdcff Sebastian Siewior      2008-03-11  1965  				speed_template_16_24_32);
4de5933780f897 Jussi Kivilinna        2012-03-05  1966  		test_cipher_speed("ctr(camellia)", ENCRYPT, sec, NULL, 0,
4de5933780f897 Jussi Kivilinna        2012-03-05  1967  				speed_template_16_24_32);
4de5933780f897 Jussi Kivilinna        2012-03-05  1968  		test_cipher_speed("ctr(camellia)", DECRYPT, sec, NULL, 0,
4de5933780f897 Jussi Kivilinna        2012-03-05  1969  				speed_template_16_24_32);
4de5933780f897 Jussi Kivilinna        2012-03-05  1970  		test_cipher_speed("lrw(camellia)", ENCRYPT, sec, NULL, 0,
4de5933780f897 Jussi Kivilinna        2012-03-05  1971  				speed_template_32_40_48);
4de5933780f897 Jussi Kivilinna        2012-03-05  1972  		test_cipher_speed("lrw(camellia)", DECRYPT, sec, NULL, 0,
4de5933780f897 Jussi Kivilinna        2012-03-05  1973  				speed_template_32_40_48);
4de5933780f897 Jussi Kivilinna        2012-03-05  1974  		test_cipher_speed("xts(camellia)", ENCRYPT, sec, NULL, 0,
4de5933780f897 Jussi Kivilinna        2012-03-05  1975  				speed_template_32_48_64);
4de5933780f897 Jussi Kivilinna        2012-03-05  1976  		test_cipher_speed("xts(camellia)", DECRYPT, sec, NULL, 0,
4de5933780f897 Jussi Kivilinna        2012-03-05  1977  				speed_template_32_48_64);
02ab5a7056bd84 Noriaki TAKAMIYA       2007-01-24  1978  		break;
02ab5a7056bd84 Noriaki TAKAMIYA       2007-01-24  1979  
7fb7fe4469d0b8 Jussi Kivilinna        2011-10-18  1980  	case 207:
7fb7fe4469d0b8 Jussi Kivilinna        2011-10-18  1981  		test_cipher_speed("ecb(serpent)", ENCRYPT, sec, NULL, 0,
7fb7fe4469d0b8 Jussi Kivilinna        2011-10-18  1982  				  speed_template_16_32);
7fb7fe4469d0b8 Jussi Kivilinna        2011-10-18  1983  		test_cipher_speed("ecb(serpent)", DECRYPT, sec, NULL, 0,
7fb7fe4469d0b8 Jussi Kivilinna        2011-10-18  1984  				  speed_template_16_32);
7fb7fe4469d0b8 Jussi Kivilinna        2011-10-18  1985  		test_cipher_speed("cbc(serpent)", ENCRYPT, sec, NULL, 0,
7fb7fe4469d0b8 Jussi Kivilinna        2011-10-18  1986  				  speed_template_16_32);
7fb7fe4469d0b8 Jussi Kivilinna        2011-10-18  1987  		test_cipher_speed("cbc(serpent)", DECRYPT, sec, NULL, 0,
7fb7fe4469d0b8 Jussi Kivilinna        2011-10-18  1988  				  speed_template_16_32);
7fb7fe4469d0b8 Jussi Kivilinna        2011-10-18  1989  		test_cipher_speed("ctr(serpent)", ENCRYPT, sec, NULL, 0,
7fb7fe4469d0b8 Jussi Kivilinna        2011-10-18  1990  				  speed_template_16_32);
7fb7fe4469d0b8 Jussi Kivilinna        2011-10-18  1991  		test_cipher_speed("ctr(serpent)", DECRYPT, sec, NULL, 0,
7fb7fe4469d0b8 Jussi Kivilinna        2011-10-18  1992  				  speed_template_16_32);
87aae4bfb2912d Jussi Kivilinna        2011-10-18  1993  		test_cipher_speed("lrw(serpent)", ENCRYPT, sec, NULL, 0,
87aae4bfb2912d Jussi Kivilinna        2011-10-18  1994  				  speed_template_32_48);
87aae4bfb2912d Jussi Kivilinna        2011-10-18  1995  		test_cipher_speed("lrw(serpent)", DECRYPT, sec, NULL, 0,
87aae4bfb2912d Jussi Kivilinna        2011-10-18  1996  				  speed_template_32_48);
5209c07ac3601c Jussi Kivilinna        2011-10-18  1997  		test_cipher_speed("xts(serpent)", ENCRYPT, sec, NULL, 0,
5209c07ac3601c Jussi Kivilinna        2011-10-18  1998  				  speed_template_32_64);
5209c07ac3601c Jussi Kivilinna        2011-10-18  1999  		test_cipher_speed("xts(serpent)", DECRYPT, sec, NULL, 0,
5209c07ac3601c Jussi Kivilinna        2011-10-18  2000  				  speed_template_32_64);
7fb7fe4469d0b8 Jussi Kivilinna        2011-10-18  2001  		break;
7fb7fe4469d0b8 Jussi Kivilinna        2011-10-18  2002  
31b4cd2907322b Jussi Kivilinna        2012-06-12  2003  	case 208:
31b4cd2907322b Jussi Kivilinna        2012-06-12  2004  		test_cipher_speed("ecb(arc4)", ENCRYPT, sec, NULL, 0,
31b4cd2907322b Jussi Kivilinna        2012-06-12  2005  				  speed_template_8);
31b4cd2907322b Jussi Kivilinna        2012-06-12  2006  		break;
31b4cd2907322b Jussi Kivilinna        2012-06-12  2007  
a2c58260955629 Johannes Goetzfried    2012-07-11  2008  	case 209:
a2c58260955629 Johannes Goetzfried    2012-07-11  2009  		test_cipher_speed("ecb(cast5)", ENCRYPT, sec, NULL, 0,
a2c58260955629 Johannes Goetzfried    2012-07-11  2010  				  speed_template_8_16);
a2c58260955629 Johannes Goetzfried    2012-07-11  2011  		test_cipher_speed("ecb(cast5)", DECRYPT, sec, NULL, 0,
a2c58260955629 Johannes Goetzfried    2012-07-11  2012  				  speed_template_8_16);
a2c58260955629 Johannes Goetzfried    2012-07-11  2013  		test_cipher_speed("cbc(cast5)", ENCRYPT, sec, NULL, 0,
a2c58260955629 Johannes Goetzfried    2012-07-11  2014  				  speed_template_8_16);
a2c58260955629 Johannes Goetzfried    2012-07-11  2015  		test_cipher_speed("cbc(cast5)", DECRYPT, sec, NULL, 0,
a2c58260955629 Johannes Goetzfried    2012-07-11  2016  				  speed_template_8_16);
a2c58260955629 Johannes Goetzfried    2012-07-11  2017  		test_cipher_speed("ctr(cast5)", ENCRYPT, sec, NULL, 0,
a2c58260955629 Johannes Goetzfried    2012-07-11  2018  				  speed_template_8_16);
a2c58260955629 Johannes Goetzfried    2012-07-11  2019  		test_cipher_speed("ctr(cast5)", DECRYPT, sec, NULL, 0,
a2c58260955629 Johannes Goetzfried    2012-07-11  2020  				  speed_template_8_16);
a2c58260955629 Johannes Goetzfried    2012-07-11  2021  		break;
a2c58260955629 Johannes Goetzfried    2012-07-11  2022  
9b8b04051d0df1 Johannes Goetzfried    2012-07-11  2023  	case 210:
9b8b04051d0df1 Johannes Goetzfried    2012-07-11  2024  		test_cipher_speed("ecb(cast6)", ENCRYPT, sec, NULL, 0,
9b8b04051d0df1 Johannes Goetzfried    2012-07-11  2025  				  speed_template_16_32);
9b8b04051d0df1 Johannes Goetzfried    2012-07-11  2026  		test_cipher_speed("ecb(cast6)", DECRYPT, sec, NULL, 0,
9b8b04051d0df1 Johannes Goetzfried    2012-07-11  2027  				  speed_template_16_32);
9b8b04051d0df1 Johannes Goetzfried    2012-07-11  2028  		test_cipher_speed("cbc(cast6)", ENCRYPT, sec, NULL, 0,
9b8b04051d0df1 Johannes Goetzfried    2012-07-11  2029  				  speed_template_16_32);
9b8b04051d0df1 Johannes Goetzfried    2012-07-11  2030  		test_cipher_speed("cbc(cast6)", DECRYPT, sec, NULL, 0,
9b8b04051d0df1 Johannes Goetzfried    2012-07-11  2031  				  speed_template_16_32);
9b8b04051d0df1 Johannes Goetzfried    2012-07-11  2032  		test_cipher_speed("ctr(cast6)", ENCRYPT, sec, NULL, 0,
9b8b04051d0df1 Johannes Goetzfried    2012-07-11  2033  				  speed_template_16_32);
9b8b04051d0df1 Johannes Goetzfried    2012-07-11  2034  		test_cipher_speed("ctr(cast6)", DECRYPT, sec, NULL, 0,
9b8b04051d0df1 Johannes Goetzfried    2012-07-11  2035  				  speed_template_16_32);
9b8b04051d0df1 Johannes Goetzfried    2012-07-11  2036  		test_cipher_speed("lrw(cast6)", ENCRYPT, sec, NULL, 0,
9b8b04051d0df1 Johannes Goetzfried    2012-07-11  2037  				  speed_template_32_48);
9b8b04051d0df1 Johannes Goetzfried    2012-07-11  2038  		test_cipher_speed("lrw(cast6)", DECRYPT, sec, NULL, 0,
9b8b04051d0df1 Johannes Goetzfried    2012-07-11  2039  				  speed_template_32_48);
9b8b04051d0df1 Johannes Goetzfried    2012-07-11  2040  		test_cipher_speed("xts(cast6)", ENCRYPT, sec, NULL, 0,
9b8b04051d0df1 Johannes Goetzfried    2012-07-11  2041  				  speed_template_32_64);
9b8b04051d0df1 Johannes Goetzfried    2012-07-11  2042  		test_cipher_speed("xts(cast6)", DECRYPT, sec, NULL, 0,
9b8b04051d0df1 Johannes Goetzfried    2012-07-11  2043  				  speed_template_32_64);
9b8b04051d0df1 Johannes Goetzfried    2012-07-11  2044  		break;
9b8b04051d0df1 Johannes Goetzfried    2012-07-11  2045  
53f52d7aecb4cb Tim Chen               2013-12-11  2046  	case 211:
53f52d7aecb4cb Tim Chen               2013-12-11  2047  		test_aead_speed("rfc4106(gcm(aes))", ENCRYPT, sec,
34a1c740ea87b5 Herbert Xu             2015-07-09  2048  				NULL, 0, 16, 16, aead_speed_template_20);
1425d2d17f7309 Vutla, Lokesh          2015-07-07  2049  		test_aead_speed("gcm(aes)", ENCRYPT, sec,
f18611da8683da Cyrille Pitchen        2015-11-17  2050  				NULL, 0, 16, 8, speed_template_16_24_32);
4431bd49530c73 Gilad Ben-Yossef       2017-12-17  2051  		test_aead_speed("rfc4106(gcm(aes))", DECRYPT, sec,
4431bd49530c73 Gilad Ben-Yossef       2017-12-17  2052  				NULL, 0, 16, 16, aead_speed_template_20);
4431bd49530c73 Gilad Ben-Yossef       2017-12-17  2053  		test_aead_speed("gcm(aes)", DECRYPT, sec,
4431bd49530c73 Gilad Ben-Yossef       2017-12-17  2054  				NULL, 0, 16, 8, speed_template_16_24_32);
53f52d7aecb4cb Tim Chen               2013-12-11  2055  		break;
53f52d7aecb4cb Tim Chen               2013-12-11  2056  
4e4aab63d7456f Herbert Xu             2015-06-17  2057  	case 212:
4e4aab63d7456f Herbert Xu             2015-06-17  2058  		test_aead_speed("rfc4309(ccm(aes))", ENCRYPT, sec,
34a1c740ea87b5 Herbert Xu             2015-07-09  2059  				NULL, 0, 16, 16, aead_speed_template_19);
4431bd49530c73 Gilad Ben-Yossef       2017-12-17  2060  		test_aead_speed("rfc4309(ccm(aes))", DECRYPT, sec,
4431bd49530c73 Gilad Ben-Yossef       2017-12-17  2061  				NULL, 0, 16, 16, aead_speed_template_19);
4e4aab63d7456f Herbert Xu             2015-06-17  2062  		break;
4e4aab63d7456f Herbert Xu             2015-06-17  2063  
2dce063a31ae6c Martin Willi           2015-07-16  2064  	case 213:
2dce063a31ae6c Martin Willi           2015-07-16  2065  		test_aead_speed("rfc7539esp(chacha20,poly1305)", ENCRYPT, sec,
2dce063a31ae6c Martin Willi           2015-07-16  2066  				NULL, 0, 16, 8, aead_speed_template_36);
4431bd49530c73 Gilad Ben-Yossef       2017-12-17  2067  		test_aead_speed("rfc7539esp(chacha20,poly1305)", DECRYPT, sec,
4431bd49530c73 Gilad Ben-Yossef       2017-12-17  2068  				NULL, 0, 16, 8, aead_speed_template_36);
2dce063a31ae6c Martin Willi           2015-07-16  2069  		break;
2dce063a31ae6c Martin Willi           2015-07-16  2070  
2dce063a31ae6c Martin Willi           2015-07-16  2071  	case 214:
2dce063a31ae6c Martin Willi           2015-07-16  2072  		test_cipher_speed("chacha20", ENCRYPT, sec, NULL, 0,
2dce063a31ae6c Martin Willi           2015-07-16  2073  				  speed_template_32);
2dce063a31ae6c Martin Willi           2015-07-16  2074  		break;
2dce063a31ae6c Martin Willi           2015-07-16  2075  
427988d981c4c2 Gilad Ben-Yossef       2017-12-17  2076  	case 215:
427988d981c4c2 Gilad Ben-Yossef       2017-12-17  2077  		test_mb_aead_speed("rfc4106(gcm(aes))", ENCRYPT, sec, NULL,
427988d981c4c2 Gilad Ben-Yossef       2017-12-17  2078  				   0, 16, 16, aead_speed_template_20, num_mb);
427988d981c4c2 Gilad Ben-Yossef       2017-12-17  2079  		test_mb_aead_speed("gcm(aes)", ENCRYPT, sec, NULL, 0, 16, 8,
427988d981c4c2 Gilad Ben-Yossef       2017-12-17  2080  				   speed_template_16_24_32, num_mb);
427988d981c4c2 Gilad Ben-Yossef       2017-12-17  2081  		test_mb_aead_speed("rfc4106(gcm(aes))", DECRYPT, sec, NULL,
427988d981c4c2 Gilad Ben-Yossef       2017-12-17  2082  				   0, 16, 16, aead_speed_template_20, num_mb);
427988d981c4c2 Gilad Ben-Yossef       2017-12-17  2083  		test_mb_aead_speed("gcm(aes)", DECRYPT, sec, NULL, 0, 16, 8,
427988d981c4c2 Gilad Ben-Yossef       2017-12-17  2084  				   speed_template_16_24_32, num_mb);
427988d981c4c2 Gilad Ben-Yossef       2017-12-17  2085  		break;
427988d981c4c2 Gilad Ben-Yossef       2017-12-17  2086  
427988d981c4c2 Gilad Ben-Yossef       2017-12-17  2087  	case 216:
427988d981c4c2 Gilad Ben-Yossef       2017-12-17  2088  		test_mb_aead_speed("rfc4309(ccm(aes))", ENCRYPT, sec, NULL, 0,
427988d981c4c2 Gilad Ben-Yossef       2017-12-17  2089  				   16, 16, aead_speed_template_19, num_mb);
427988d981c4c2 Gilad Ben-Yossef       2017-12-17  2090  		test_mb_aead_speed("rfc4309(ccm(aes))", DECRYPT, sec, NULL, 0,
427988d981c4c2 Gilad Ben-Yossef       2017-12-17  2091  				   16, 16, aead_speed_template_19, num_mb);
427988d981c4c2 Gilad Ben-Yossef       2017-12-17  2092  		break;
427988d981c4c2 Gilad Ben-Yossef       2017-12-17  2093  
427988d981c4c2 Gilad Ben-Yossef       2017-12-17  2094  	case 217:
427988d981c4c2 Gilad Ben-Yossef       2017-12-17  2095  		test_mb_aead_speed("rfc7539esp(chacha20,poly1305)", ENCRYPT,
427988d981c4c2 Gilad Ben-Yossef       2017-12-17  2096  				   sec, NULL, 0, 16, 8, aead_speed_template_36,
427988d981c4c2 Gilad Ben-Yossef       2017-12-17  2097  				   num_mb);
427988d981c4c2 Gilad Ben-Yossef       2017-12-17  2098  		test_mb_aead_speed("rfc7539esp(chacha20,poly1305)", DECRYPT,
427988d981c4c2 Gilad Ben-Yossef       2017-12-17  2099  				   sec, NULL, 0, 16, 8, aead_speed_template_36,
427988d981c4c2 Gilad Ben-Yossef       2017-12-17  2100  				   num_mb);
427988d981c4c2 Gilad Ben-Yossef       2017-12-17  2101  		break;
427988d981c4c2 Gilad Ben-Yossef       2017-12-17  2102  
95ba597367ddc2 Gilad Ben-Yossef       2018-09-20  2103  	case 218:
95ba597367ddc2 Gilad Ben-Yossef       2018-09-20  2104  		test_cipher_speed("ecb(sm4)", ENCRYPT, sec, NULL, 0,
95ba597367ddc2 Gilad Ben-Yossef       2018-09-20  2105  				speed_template_16);
95ba597367ddc2 Gilad Ben-Yossef       2018-09-20  2106  		test_cipher_speed("ecb(sm4)", DECRYPT, sec, NULL, 0,
95ba597367ddc2 Gilad Ben-Yossef       2018-09-20  2107  				speed_template_16);
95ba597367ddc2 Gilad Ben-Yossef       2018-09-20  2108  		test_cipher_speed("cbc(sm4)", ENCRYPT, sec, NULL, 0,
95ba597367ddc2 Gilad Ben-Yossef       2018-09-20  2109  				speed_template_16);
95ba597367ddc2 Gilad Ben-Yossef       2018-09-20  2110  		test_cipher_speed("cbc(sm4)", DECRYPT, sec, NULL, 0,
95ba597367ddc2 Gilad Ben-Yossef       2018-09-20  2111  				speed_template_16);
a7fc80bb22eb0f Tianjia Zhang          2021-07-20  2112  		test_cipher_speed("cfb(sm4)", ENCRYPT, sec, NULL, 0,
a7fc80bb22eb0f Tianjia Zhang          2021-07-20  2113  				speed_template_16);
a7fc80bb22eb0f Tianjia Zhang          2021-07-20  2114  		test_cipher_speed("cfb(sm4)", DECRYPT, sec, NULL, 0,
a7fc80bb22eb0f Tianjia Zhang          2021-07-20  2115  				speed_template_16);
95ba597367ddc2 Gilad Ben-Yossef       2018-09-20  2116  		test_cipher_speed("ctr(sm4)", ENCRYPT, sec, NULL, 0,
95ba597367ddc2 Gilad Ben-Yossef       2018-09-20  2117  				speed_template_16);
95ba597367ddc2 Gilad Ben-Yossef       2018-09-20  2118  		test_cipher_speed("ctr(sm4)", DECRYPT, sec, NULL, 0,
95ba597367ddc2 Gilad Ben-Yossef       2018-09-20  2119  				speed_template_16);
95ba597367ddc2 Gilad Ben-Yossef       2018-09-20  2120  		break;
059c2a4d8e164d Eric Biggers           2018-11-16  2121  
059c2a4d8e164d Eric Biggers           2018-11-16  2122  	case 219:
059c2a4d8e164d Eric Biggers           2018-11-16  2123  		test_cipher_speed("adiantum(xchacha12,aes)", ENCRYPT, sec, NULL,
059c2a4d8e164d Eric Biggers           2018-11-16  2124  				  0, speed_template_32);
059c2a4d8e164d Eric Biggers           2018-11-16  2125  		test_cipher_speed("adiantum(xchacha12,aes)", DECRYPT, sec, NULL,
059c2a4d8e164d Eric Biggers           2018-11-16  2126  				  0, speed_template_32);
059c2a4d8e164d Eric Biggers           2018-11-16  2127  		test_cipher_speed("adiantum(xchacha20,aes)", ENCRYPT, sec, NULL,
059c2a4d8e164d Eric Biggers           2018-11-16  2128  				  0, speed_template_32);
059c2a4d8e164d Eric Biggers           2018-11-16  2129  		test_cipher_speed("adiantum(xchacha20,aes)", DECRYPT, sec, NULL,
059c2a4d8e164d Eric Biggers           2018-11-16  2130  				  0, speed_template_32);
059c2a4d8e164d Eric Biggers           2018-11-16  2131  		break;
059c2a4d8e164d Eric Biggers           2018-11-16  2132  
f975abb23c6f3e Ard Biesheuvel         2019-08-19  2133  	case 220:
f975abb23c6f3e Ard Biesheuvel         2019-08-19  2134  		test_acipher_speed("essiv(cbc(aes),sha256)",
f975abb23c6f3e Ard Biesheuvel         2019-08-19  2135  				  ENCRYPT, sec, NULL, 0,
f975abb23c6f3e Ard Biesheuvel         2019-08-19  2136  				  speed_template_16_24_32);
f975abb23c6f3e Ard Biesheuvel         2019-08-19  2137  		test_acipher_speed("essiv(cbc(aes),sha256)",
f975abb23c6f3e Ard Biesheuvel         2019-08-19  2138  				  DECRYPT, sec, NULL, 0,
f975abb23c6f3e Ard Biesheuvel         2019-08-19  2139  				  speed_template_16_24_32);
f975abb23c6f3e Ard Biesheuvel         2019-08-19  2140  		break;
f975abb23c6f3e Ard Biesheuvel         2019-08-19  2141  
97bcb161995548 Ard Biesheuvel         2019-07-03  2142  	case 221:
97bcb161995548 Ard Biesheuvel         2019-07-03  2143  		test_aead_speed("aegis128", ENCRYPT, sec,
97bcb161995548 Ard Biesheuvel         2019-07-03  2144  				NULL, 0, 16, 8, speed_template_16);
97bcb161995548 Ard Biesheuvel         2019-07-03  2145  		test_aead_speed("aegis128", DECRYPT, sec,
97bcb161995548 Ard Biesheuvel         2019-07-03  2146  				NULL, 0, 16, 8, speed_template_16);
97bcb161995548 Ard Biesheuvel         2019-07-03  2147  		break;
97bcb161995548 Ard Biesheuvel         2019-07-03  2148  
357a753f5ec7cc Tianjia Zhang          2021-08-13  2149  	case 222:
357a753f5ec7cc Tianjia Zhang          2021-08-13  2150  		test_aead_speed("gcm(sm4)", ENCRYPT, sec,
357a753f5ec7cc Tianjia Zhang          2021-08-13  2151  				NULL, 0, 16, 8, speed_template_16);
357a753f5ec7cc Tianjia Zhang          2021-08-13  2152  		test_aead_speed("gcm(sm4)", DECRYPT, sec,
357a753f5ec7cc Tianjia Zhang          2021-08-13  2153  				NULL, 0, 16, 8, speed_template_16);
357a753f5ec7cc Tianjia Zhang          2021-08-13  2154  		break;
357a753f5ec7cc Tianjia Zhang          2021-08-13  2155  
357a753f5ec7cc Tianjia Zhang          2021-08-13  2156  	case 223:
357a753f5ec7cc Tianjia Zhang          2021-08-13  2157  		test_aead_speed("rfc4309(ccm(sm4))", ENCRYPT, sec,
357a753f5ec7cc Tianjia Zhang          2021-08-13  2158  				NULL, 0, 16, 16, aead_speed_template_19);
357a753f5ec7cc Tianjia Zhang          2021-08-13  2159  		test_aead_speed("rfc4309(ccm(sm4))", DECRYPT, sec,
357a753f5ec7cc Tianjia Zhang          2021-08-13  2160  				NULL, 0, 16, 16, aead_speed_template_19);
357a753f5ec7cc Tianjia Zhang          2021-08-13  2161  		break;
357a753f5ec7cc Tianjia Zhang          2021-08-13  2162  
357a753f5ec7cc Tianjia Zhang          2021-08-13  2163  	case 224:
357a753f5ec7cc Tianjia Zhang          2021-08-13  2164  		test_mb_aead_speed("gcm(sm4)", ENCRYPT, sec, NULL, 0, 16, 8,
357a753f5ec7cc Tianjia Zhang          2021-08-13  2165  				   speed_template_16, num_mb);
357a753f5ec7cc Tianjia Zhang          2021-08-13  2166  		test_mb_aead_speed("gcm(sm4)", DECRYPT, sec, NULL, 0, 16, 8,
357a753f5ec7cc Tianjia Zhang          2021-08-13  2167  				   speed_template_16, num_mb);
357a753f5ec7cc Tianjia Zhang          2021-08-13  2168  		break;
357a753f5ec7cc Tianjia Zhang          2021-08-13  2169  
357a753f5ec7cc Tianjia Zhang          2021-08-13  2170  	case 225:
357a753f5ec7cc Tianjia Zhang          2021-08-13  2171  		test_mb_aead_speed("rfc4309(ccm(sm4))", ENCRYPT, sec, NULL, 0,
357a753f5ec7cc Tianjia Zhang          2021-08-13  2172  				   16, 16, aead_speed_template_19, num_mb);
357a753f5ec7cc Tianjia Zhang          2021-08-13  2173  		test_mb_aead_speed("rfc4309(ccm(sm4))", DECRYPT, sec, NULL, 0,
357a753f5ec7cc Tianjia Zhang          2021-08-13  2174  				   16, 16, aead_speed_template_19, num_mb);
357a753f5ec7cc Tianjia Zhang          2021-08-13  2175  		break;
357a753f5ec7cc Tianjia Zhang          2021-08-13  2176  
7ff554ced7c7d7 Nathan Huckleberry     2022-05-20  2177  	case 226:
7ff554ced7c7d7 Nathan Huckleberry     2022-05-20  2178  		test_cipher_speed("hctr2(aes)", ENCRYPT, sec, NULL,
7ff554ced7c7d7 Nathan Huckleberry     2022-05-20  2179  				  0, speed_template_32);
7ff554ced7c7d7 Nathan Huckleberry     2022-05-20  2180  		break;
7ff554ced7c7d7 Nathan Huckleberry     2022-05-20  2181  
01ce31de7043e1 Taehee Yoo             2022-07-04  2182  	case 227:
01ce31de7043e1 Taehee Yoo             2022-07-04  2183  		test_cipher_speed("ecb(aria)", ENCRYPT, sec, NULL, 0,
01ce31de7043e1 Taehee Yoo             2022-07-04  2184  				  speed_template_16_24_32);
01ce31de7043e1 Taehee Yoo             2022-07-04  2185  		test_cipher_speed("ecb(aria)", DECRYPT, sec, NULL, 0,
01ce31de7043e1 Taehee Yoo             2022-07-04  2186  				  speed_template_16_24_32);
01ce31de7043e1 Taehee Yoo             2022-07-04  2187  		test_cipher_speed("cbc(aria)", ENCRYPT, sec, NULL, 0,
01ce31de7043e1 Taehee Yoo             2022-07-04  2188  				  speed_template_16_24_32);
01ce31de7043e1 Taehee Yoo             2022-07-04  2189  		test_cipher_speed("cbc(aria)", DECRYPT, sec, NULL, 0,
01ce31de7043e1 Taehee Yoo             2022-07-04  2190  				  speed_template_16_24_32);
01ce31de7043e1 Taehee Yoo             2022-07-04  2191  		test_cipher_speed("cfb(aria)", ENCRYPT, sec, NULL, 0,
01ce31de7043e1 Taehee Yoo             2022-07-04  2192  				  speed_template_16_24_32);
01ce31de7043e1 Taehee Yoo             2022-07-04  2193  		test_cipher_speed("cfb(aria)", DECRYPT, sec, NULL, 0,
01ce31de7043e1 Taehee Yoo             2022-07-04  2194  				  speed_template_16_24_32);
01ce31de7043e1 Taehee Yoo             2022-07-04  2195  		test_cipher_speed("ctr(aria)", ENCRYPT, sec, NULL, 0,
01ce31de7043e1 Taehee Yoo             2022-07-04  2196  				  speed_template_16_24_32);
01ce31de7043e1 Taehee Yoo             2022-07-04  2197  		test_cipher_speed("ctr(aria)", DECRYPT, sec, NULL, 0,
01ce31de7043e1 Taehee Yoo             2022-07-04  2198  				  speed_template_16_24_32);
01ce31de7043e1 Taehee Yoo             2022-07-04  2199  		break;
01ce31de7043e1 Taehee Yoo             2022-07-04  2200  
01ce31de7043e1 Taehee Yoo             2022-07-04  2201  	case 228:
01ce31de7043e1 Taehee Yoo             2022-07-04  2202  		test_aead_speed("gcm(aria)", ENCRYPT, sec,
01ce31de7043e1 Taehee Yoo             2022-07-04  2203  				NULL, 0, 16, 8, speed_template_16_24_32);
01ce31de7043e1 Taehee Yoo             2022-07-04  2204  		test_aead_speed("gcm(aria)", DECRYPT, sec,
01ce31de7043e1 Taehee Yoo             2022-07-04  2205  				NULL, 0, 16, 8, speed_template_16_24_32);
01ce31de7043e1 Taehee Yoo             2022-07-04  2206  		break;
01ce31de7043e1 Taehee Yoo             2022-07-04  2207  
c4b1ce72b5c9f7 Taehee Yoo             2022-09-16  2208  	case 229:
c4b1ce72b5c9f7 Taehee Yoo             2022-09-16  2209  		test_mb_aead_speed("gcm(aria)", ENCRYPT, sec, NULL, 0, 16, 8,
c4b1ce72b5c9f7 Taehee Yoo             2022-09-16  2210  				   speed_template_16, num_mb);
c4b1ce72b5c9f7 Taehee Yoo             2022-09-16  2211  		test_mb_aead_speed("gcm(aria)", DECRYPT, sec, NULL, 0, 16, 8,
c4b1ce72b5c9f7 Taehee Yoo             2022-09-16  2212  				   speed_template_16, num_mb);
c4b1ce72b5c9f7 Taehee Yoo             2022-09-16  2213  		break;
c4b1ce72b5c9f7 Taehee Yoo             2022-09-16  2214  
e805792851bcb0 Michal Ludvig          2006-05-30  2215  	case 300:
8606813a6c8997 Herbert Xu             2014-12-04  2216  		if (alg) {
8606813a6c8997 Herbert Xu             2014-12-04  2217  			test_hash_speed(alg, sec, generic_hash_speed_template);
8606813a6c8997 Herbert Xu             2014-12-04  2218  			break;
8606813a6c8997 Herbert Xu             2014-12-04  2219  		}
df561f6688fef7 Gustavo A. R. Silva    2020-08-23  2220  		fallthrough;
e805792851bcb0 Michal Ludvig          2006-05-30  2221  	case 301:
e9d41164e2fdd8 Herbert Xu             2006-08-19  2222  		test_hash_speed("md4", sec, generic_hash_speed_template);
e805792851bcb0 Michal Ludvig          2006-05-30  2223  		if (mode > 300 && mode < 400) break;
df561f6688fef7 Gustavo A. R. Silva    2020-08-23  2224  		fallthrough;
e805792851bcb0 Michal Ludvig          2006-05-30  2225  	case 302:
e9d41164e2fdd8 Herbert Xu             2006-08-19  2226  		test_hash_speed("md5", sec, generic_hash_speed_template);
e805792851bcb0 Michal Ludvig          2006-05-30  2227  		if (mode > 300 && mode < 400) break;
df561f6688fef7 Gustavo A. R. Silva    2020-08-23  2228  		fallthrough;
e805792851bcb0 Michal Ludvig          2006-05-30  2229  	case 303:
e9d41164e2fdd8 Herbert Xu             2006-08-19  2230  		test_hash_speed("sha1", sec, generic_hash_speed_template);
e805792851bcb0 Michal Ludvig          2006-05-30  2231  		if (mode > 300 && mode < 400) break;
df561f6688fef7 Gustavo A. R. Silva    2020-08-23  2232  		fallthrough;
e805792851bcb0 Michal Ludvig          2006-05-30  2233  	case 304:
e9d41164e2fdd8 Herbert Xu             2006-08-19  2234  		test_hash_speed("sha256", sec, generic_hash_speed_template);
e805792851bcb0 Michal Ludvig          2006-05-30  2235  		if (mode > 300 && mode < 400) break;
df561f6688fef7 Gustavo A. R. Silva    2020-08-23  2236  		fallthrough;
e805792851bcb0 Michal Ludvig          2006-05-30  2237  	case 305:
e9d41164e2fdd8 Herbert Xu             2006-08-19  2238  		test_hash_speed("sha384", sec, generic_hash_speed_template);
e805792851bcb0 Michal Ludvig          2006-05-30  2239  		if (mode > 300 && mode < 400) break;
df561f6688fef7 Gustavo A. R. Silva    2020-08-23  2240  		fallthrough;
e805792851bcb0 Michal Ludvig          2006-05-30  2241  	case 306:
e9d41164e2fdd8 Herbert Xu             2006-08-19  2242  		test_hash_speed("sha512", sec, generic_hash_speed_template);
e805792851bcb0 Michal Ludvig          2006-05-30  2243  		if (mode > 300 && mode < 400) break;
df561f6688fef7 Gustavo A. R. Silva    2020-08-23  2244  		fallthrough;
e805792851bcb0 Michal Ludvig          2006-05-30  2245  	case 307:
e9d41164e2fdd8 Herbert Xu             2006-08-19  2246  		test_hash_speed("wp256", sec, generic_hash_speed_template);
e805792851bcb0 Michal Ludvig          2006-05-30  2247  		if (mode > 300 && mode < 400) break;
df561f6688fef7 Gustavo A. R. Silva    2020-08-23  2248  		fallthrough;
e805792851bcb0 Michal Ludvig          2006-05-30  2249  	case 308:
e9d41164e2fdd8 Herbert Xu             2006-08-19  2250  		test_hash_speed("wp384", sec, generic_hash_speed_template);
e805792851bcb0 Michal Ludvig          2006-05-30  2251  		if (mode > 300 && mode < 400) break;
df561f6688fef7 Gustavo A. R. Silva    2020-08-23  2252  		fallthrough;
e805792851bcb0 Michal Ludvig          2006-05-30  2253  	case 309:
e9d41164e2fdd8 Herbert Xu             2006-08-19  2254  		test_hash_speed("wp512", sec, generic_hash_speed_template);
e805792851bcb0 Michal Ludvig          2006-05-30  2255  		if (mode > 300 && mode < 400) break;
df561f6688fef7 Gustavo A. R. Silva    2020-08-23  2256  		fallthrough;
cd12fb906d2591 Jonathan Lynch         2007-11-10  2257  	case 313:
cd12fb906d2591 Jonathan Lynch         2007-11-10  2258  		test_hash_speed("sha224", sec, generic_hash_speed_template);
cd12fb906d2591 Jonathan Lynch         2007-11-10  2259  		if (mode > 300 && mode < 400) break;
df561f6688fef7 Gustavo A. R. Silva    2020-08-23  2260  		fallthrough;
aa22cd7f67807e Ard Biesheuvel         2021-05-20  2261  	case 314:
aa22cd7f67807e Ard Biesheuvel         2021-05-20  2262  		test_hash_speed("xxhash64", sec, generic_hash_speed_template);
aa22cd7f67807e Ard Biesheuvel         2021-05-20  2263  		if (mode > 300 && mode < 400) break;
aa22cd7f67807e Ard Biesheuvel         2021-05-20  2264  		fallthrough;
fd4adf1a0b1923 Adrian-Ken Rueegsegger 2008-05-07  2265  	case 315:
fd4adf1a0b1923 Adrian-Ken Rueegsegger 2008-05-07  2266  		test_hash_speed("rmd160", sec, generic_hash_speed_template);
fd4adf1a0b1923 Adrian-Ken Rueegsegger 2008-05-07  2267  		if (mode > 300 && mode < 400) break;
df561f6688fef7 Gustavo A. R. Silva    2020-08-23  2268  		fallthrough;
aa22cd7f67807e Ard Biesheuvel         2021-05-20  2269  	case 317:
aa22cd7f67807e Ard Biesheuvel         2021-05-20  2270  		test_hash_speed("blake2b-512", sec, generic_hash_speed_template);
aa22cd7f67807e Ard Biesheuvel         2021-05-20  2271  		if (mode > 300 && mode < 400) break;
aa22cd7f67807e Ard Biesheuvel         2021-05-20  2272  		fallthrough;
18bcc9194da3c9 Huang Ying             2010-03-10  2273  	case 318:
ba974adb47f206 Herbert Xu             2020-08-05  2274  		klen = 16;
ba974adb47f206 Herbert Xu             2020-08-05  2275  		test_hash_speed("ghash", sec, generic_hash_speed_template);
18bcc9194da3c9 Huang Ying             2010-03-10  2276  		if (mode > 300 && mode < 400) break;
df561f6688fef7 Gustavo A. R. Silva    2020-08-23  2277  		fallthrough;
e3899e4df02720 Tim Chen               2012-09-27  2278  	case 319:
e3899e4df02720 Tim Chen               2012-09-27  2279  		test_hash_speed("crc32c", sec, generic_hash_speed_template);
e3899e4df02720 Tim Chen               2012-09-27  2280  		if (mode > 300 && mode < 400) break;
df561f6688fef7 Gustavo A. R. Silva    2020-08-23  2281  		fallthrough;
68411521cc6055 Herbert Xu             2013-09-07  2282  	case 320:
68411521cc6055 Herbert Xu             2013-09-07  2283  		test_hash_speed("crct10dif", sec, generic_hash_speed_template);
68411521cc6055 Herbert Xu             2013-09-07  2284  		if (mode > 300 && mode < 400) break;
df561f6688fef7 Gustavo A. R. Silva    2020-08-23  2285  		fallthrough;
2dce063a31ae6c Martin Willi           2015-07-16  2286  	case 321:
2dce063a31ae6c Martin Willi           2015-07-16  2287  		test_hash_speed("poly1305", sec, poly1305_speed_template);
2dce063a31ae6c Martin Willi           2015-07-16 @2288  		if (mode > 300 && mode < 400) break;
df561f6688fef7 Gustavo A. R. Silva    2020-08-23  2289  		fallthrough;
79cc6ab8947bd2 raveendra padasalagi   2016-06-17  2290  	case 322:
79cc6ab8947bd2 raveendra padasalagi   2016-06-17  2291  		test_hash_speed("sha3-224", sec, generic_hash_speed_template);
79cc6ab8947bd2 raveendra padasalagi   2016-06-17  2292  		if (mode > 300 && mode < 400) break;
df561f6688fef7 Gustavo A. R. Silva    2020-08-23  2293  		fallthrough;
79cc6ab8947bd2 raveendra padasalagi   2016-06-17  2294  	case 323:
79cc6ab8947bd2 raveendra padasalagi   2016-06-17  2295  		test_hash_speed("sha3-256", sec, generic_hash_speed_template);
79cc6ab8947bd2 raveendra padasalagi   2016-06-17  2296  		if (mode > 300 && mode < 400) break;
df561f6688fef7 Gustavo A. R. Silva    2020-08-23  2297  		fallthrough;
79cc6ab8947bd2 raveendra padasalagi   2016-06-17  2298  	case 324:
79cc6ab8947bd2 raveendra padasalagi   2016-06-17  2299  		test_hash_speed("sha3-384", sec, generic_hash_speed_template);
79cc6ab8947bd2 raveendra padasalagi   2016-06-17  2300  		if (mode > 300 && mode < 400) break;
df561f6688fef7 Gustavo A. R. Silva    2020-08-23  2301  		fallthrough;
79cc6ab8947bd2 raveendra padasalagi   2016-06-17  2302  	case 325:
79cc6ab8947bd2 raveendra padasalagi   2016-06-17  2303  		test_hash_speed("sha3-512", sec, generic_hash_speed_template);
79cc6ab8947bd2 raveendra padasalagi   2016-06-17  2304  		if (mode > 300 && mode < 400) break;
df561f6688fef7 Gustavo A. R. Silva    2020-08-23  2305  		fallthrough;
b7e2753040a2fe Gilad Ben-Yossef       2017-08-21  2306  	case 326:
b7e2753040a2fe Gilad Ben-Yossef       2017-08-21  2307  		test_hash_speed("sm3", sec, generic_hash_speed_template);
b7e2753040a2fe Gilad Ben-Yossef       2017-08-21  2308  		if (mode > 300 && mode < 400) break;
df561f6688fef7 Gustavo A. R. Silva    2020-08-23  2309  		fallthrough;
25a0b9d4e512ea Vitaly Chikunov        2018-11-07  2310  	case 327:
25a0b9d4e512ea Vitaly Chikunov        2018-11-07  2311  		test_hash_speed("streebog256", sec,
25a0b9d4e512ea Vitaly Chikunov        2018-11-07  2312  				generic_hash_speed_template);
25a0b9d4e512ea Vitaly Chikunov        2018-11-07  2313  		if (mode > 300 && mode < 400) break;
df561f6688fef7 Gustavo A. R. Silva    2020-08-23  2314  		fallthrough;
25a0b9d4e512ea Vitaly Chikunov        2018-11-07  2315  	case 328:
25a0b9d4e512ea Vitaly Chikunov        2018-11-07  2316  		test_hash_speed("streebog512", sec,
25a0b9d4e512ea Vitaly Chikunov        2018-11-07  2317  				generic_hash_speed_template);
25a0b9d4e512ea Vitaly Chikunov        2018-11-07  2318  		if (mode > 300 && mode < 400) break;
df561f6688fef7 Gustavo A. R. Silva    2020-08-23  2319  		fallthrough;
e805792851bcb0 Michal Ludvig          2006-05-30  2320  	case 399:
e805792851bcb0 Michal Ludvig          2006-05-30  2321  		break;
e805792851bcb0 Michal Ludvig          2006-05-30  2322  
beb63da739f797 David S. Miller        2010-05-19  2323  	case 400:
8606813a6c8997 Herbert Xu             2014-12-04  2324  		if (alg) {
8606813a6c8997 Herbert Xu             2014-12-04  2325  			test_ahash_speed(alg, sec, generic_hash_speed_template);
8606813a6c8997 Herbert Xu             2014-12-04  2326  			break;
8606813a6c8997 Herbert Xu             2014-12-04  2327  		}
df561f6688fef7 Gustavo A. R. Silva    2020-08-23  2328  		fallthrough;
beb63da739f797 David S. Miller        2010-05-19  2329  	case 401:
beb63da739f797 David S. Miller        2010-05-19  2330  		test_ahash_speed("md4", sec, generic_hash_speed_template);
beb63da739f797 David S. Miller        2010-05-19  2331  		if (mode > 400 && mode < 500) break;
df561f6688fef7 Gustavo A. R. Silva    2020-08-23  2332  		fallthrough;
beb63da739f797 David S. Miller        2010-05-19  2333  	case 402:
beb63da739f797 David S. Miller        2010-05-19  2334  		test_ahash_speed("md5", sec, generic_hash_speed_template);
beb63da739f797 David S. Miller        2010-05-19  2335  		if (mode > 400 && mode < 500) break;
df561f6688fef7 Gustavo A. R. Silva    2020-08-23  2336  		fallthrough;
beb63da739f797 David S. Miller        2010-05-19  2337  	case 403:
beb63da739f797 David S. Miller        2010-05-19  2338  		test_ahash_speed("sha1", sec, generic_hash_speed_template);
beb63da739f797 David S. Miller        2010-05-19  2339  		if (mode > 400 && mode < 500) break;
df561f6688fef7 Gustavo A. R. Silva    2020-08-23  2340  		fallthrough;
beb63da739f797 David S. Miller        2010-05-19  2341  	case 404:
beb63da739f797 David S. Miller        2010-05-19  2342  		test_ahash_speed("sha256", sec, generic_hash_speed_template);
beb63da739f797 David S. Miller        2010-05-19  2343  		if (mode > 400 && mode < 500) break;
df561f6688fef7 Gustavo A. R. Silva    2020-08-23  2344  		fallthrough;
beb63da739f797 David S. Miller        2010-05-19  2345  	case 405:
beb63da739f797 David S. Miller        2010-05-19  2346  		test_ahash_speed("sha384", sec, generic_hash_speed_template);
beb63da739f797 David S. Miller        2010-05-19  2347  		if (mode > 400 && mode < 500) break;
df561f6688fef7 Gustavo A. R. Silva    2020-08-23  2348  		fallthrough;
beb63da739f797 David S. Miller        2010-05-19  2349  	case 406:
beb63da739f797 David S. Miller        2010-05-19  2350  		test_ahash_speed("sha512", sec, generic_hash_speed_template);
beb63da739f797 David S. Miller        2010-05-19  2351  		if (mode > 400 && mode < 500) break;
df561f6688fef7 Gustavo A. R. Silva    2020-08-23  2352  		fallthrough;
beb63da739f797 David S. Miller        2010-05-19  2353  	case 407:
beb63da739f797 David S. Miller        2010-05-19  2354  		test_ahash_speed("wp256", sec, generic_hash_speed_template);
beb63da739f797 David S. Miller        2010-05-19  2355  		if (mode > 400 && mode < 500) break;
df561f6688fef7 Gustavo A. R. Silva    2020-08-23  2356  		fallthrough;
beb63da739f797 David S. Miller        2010-05-19  2357  	case 408:
beb63da739f797 David S. Miller        2010-05-19  2358  		test_ahash_speed("wp384", sec, generic_hash_speed_template);
beb63da739f797 David S. Miller        2010-05-19  2359  		if (mode > 400 && mode < 500) break;
df561f6688fef7 Gustavo A. R. Silva    2020-08-23  2360  		fallthrough;
beb63da739f797 David S. Miller        2010-05-19  2361  	case 409:
beb63da739f797 David S. Miller        2010-05-19  2362  		test_ahash_speed("wp512", sec, generic_hash_speed_template);
beb63da739f797 David S. Miller        2010-05-19  2363  		if (mode > 400 && mode < 500) break;
df561f6688fef7 Gustavo A. R. Silva    2020-08-23  2364  		fallthrough;
beb63da739f797 David S. Miller        2010-05-19  2365  	case 413:
beb63da739f797 David S. Miller        2010-05-19  2366  		test_ahash_speed("sha224", sec, generic_hash_speed_template);
beb63da739f797 David S. Miller        2010-05-19  2367  		if (mode > 400 && mode < 500) break;
df561f6688fef7 Gustavo A. R. Silva    2020-08-23  2368  		fallthrough;
aa22cd7f67807e Ard Biesheuvel         2021-05-20  2369  	case 414:
aa22cd7f67807e Ard Biesheuvel         2021-05-20  2370  		test_ahash_speed("xxhash64", sec, generic_hash_speed_template);
aa22cd7f67807e Ard Biesheuvel         2021-05-20  2371  		if (mode > 400 && mode < 500) break;
aa22cd7f67807e Ard Biesheuvel         2021-05-20  2372  		fallthrough;
beb63da739f797 David S. Miller        2010-05-19  2373  	case 415:
beb63da739f797 David S. Miller        2010-05-19  2374  		test_ahash_speed("rmd160", sec, generic_hash_speed_template);
beb63da739f797 David S. Miller        2010-05-19  2375  		if (mode > 400 && mode < 500) break;
df561f6688fef7 Gustavo A. R. Silva    2020-08-23  2376  		fallthrough;
aa22cd7f67807e Ard Biesheuvel         2021-05-20  2377  	case 417:
aa22cd7f67807e Ard Biesheuvel         2021-05-20  2378  		test_ahash_speed("blake2b-512", sec, generic_hash_speed_template);
aa22cd7f67807e Ard Biesheuvel         2021-05-20  2379  		if (mode > 400 && mode < 500) break;
aa22cd7f67807e Ard Biesheuvel         2021-05-20  2380  		fallthrough;
79cc6ab8947bd2 raveendra padasalagi   2016-06-17  2381  	case 418:
79cc6ab8947bd2 raveendra padasalagi   2016-06-17  2382  		test_ahash_speed("sha3-224", sec, generic_hash_speed_template);
79cc6ab8947bd2 raveendra padasalagi   2016-06-17  2383  		if (mode > 400 && mode < 500) break;
df561f6688fef7 Gustavo A. R. Silva    2020-08-23  2384  		fallthrough;
79cc6ab8947bd2 raveendra padasalagi   2016-06-17  2385  	case 419:
79cc6ab8947bd2 raveendra padasalagi   2016-06-17  2386  		test_ahash_speed("sha3-256", sec, generic_hash_speed_template);
79cc6ab8947bd2 raveendra padasalagi   2016-06-17  2387  		if (mode > 400 && mode < 500) break;
df561f6688fef7 Gustavo A. R. Silva    2020-08-23  2388  		fallthrough;
79cc6ab8947bd2 raveendra padasalagi   2016-06-17  2389  	case 420:
79cc6ab8947bd2 raveendra padasalagi   2016-06-17  2390  		test_ahash_speed("sha3-384", sec, generic_hash_speed_template);
79cc6ab8947bd2 raveendra padasalagi   2016-06-17  2391  		if (mode > 400 && mode < 500) break;
df561f6688fef7 Gustavo A. R. Silva    2020-08-23  2392  		fallthrough;
79cc6ab8947bd2 raveendra padasalagi   2016-06-17  2393  	case 421:
79cc6ab8947bd2 raveendra padasalagi   2016-06-17  2394  		test_ahash_speed("sha3-512", sec, generic_hash_speed_template);
79cc6ab8947bd2 raveendra padasalagi   2016-06-17  2395  		if (mode > 400 && mode < 500) break;
df561f6688fef7 Gustavo A. R. Silva    2020-08-23  2396  		fallthrough;
087bcd225c5656 Megha Dey              2016-06-23  2397  	case 422:
ba2c149d0812ce Tianjia Zhang          2022-01-07  2398  		test_ahash_speed("sm3", sec, generic_hash_speed_template);
ba2c149d0812ce Tianjia Zhang          2022-01-07  2399  		if (mode > 400 && mode < 500) break;
df561f6688fef7 Gustavo A. R. Silva    2020-08-23  2400  		fallthrough;
beb63da739f797 David S. Miller        2010-05-19  2401  	case 499:
beb63da739f797 David S. Miller        2010-05-19  2402  		break;
beb63da739f797 David S. Miller        2010-05-19  2403  
3f3baf359dd3cc Jussi Kivilinna        2011-10-18  2404  	case 500:
3f3baf359dd3cc Jussi Kivilinna        2011-10-18  2405  		test_acipher_speed("ecb(aes)", ENCRYPT, sec, NULL, 0,
3f3baf359dd3cc Jussi Kivilinna        2011-10-18  2406  				   speed_template_16_24_32);
3f3baf359dd3cc Jussi Kivilinna        2011-10-18  2407  		test_acipher_speed("ecb(aes)", DECRYPT, sec, NULL, 0,
3f3baf359dd3cc Jussi Kivilinna        2011-10-18  2408  				   speed_template_16_24_32);
3f3baf359dd3cc Jussi Kivilinna        2011-10-18  2409  		test_acipher_speed("cbc(aes)", ENCRYPT, sec, NULL, 0,
3f3baf359dd3cc Jussi Kivilinna        2011-10-18  2410  				   speed_template_16_24_32);
3f3baf359dd3cc Jussi Kivilinna        2011-10-18  2411  		test_acipher_speed("cbc(aes)", DECRYPT, sec, NULL, 0,
3f3baf359dd3cc Jussi Kivilinna        2011-10-18  2412  				   speed_template_16_24_32);
3f3baf359dd3cc Jussi Kivilinna        2011-10-18  2413  		test_acipher_speed("lrw(aes)", ENCRYPT, sec, NULL, 0,
3f3baf359dd3cc Jussi Kivilinna        2011-10-18  2414  				   speed_template_32_40_48);
3f3baf359dd3cc Jussi Kivilinna        2011-10-18  2415  		test_acipher_speed("lrw(aes)", DECRYPT, sec, NULL, 0,
3f3baf359dd3cc Jussi Kivilinna        2011-10-18  2416  				   speed_template_32_40_48);
3f3baf359dd3cc Jussi Kivilinna        2011-10-18  2417  		test_acipher_speed("xts(aes)", ENCRYPT, sec, NULL, 0,
b66ad0b7aa92e6 Horia Geantă           2017-07-19  2418  				   speed_template_32_64);
3f3baf359dd3cc Jussi Kivilinna        2011-10-18  2419  		test_acipher_speed("xts(aes)", DECRYPT, sec, NULL, 0,
b66ad0b7aa92e6 Horia Geantă           2017-07-19  2420  				   speed_template_32_64);
1503a24f53f153 Herbert Xu             2016-06-29  2421  		test_acipher_speed("cts(cbc(aes))", ENCRYPT, sec, NULL, 0,
1503a24f53f153 Herbert Xu             2016-06-29  2422  				   speed_template_16_24_32);
1503a24f53f153 Herbert Xu             2016-06-29  2423  		test_acipher_speed("cts(cbc(aes))", DECRYPT, sec, NULL, 0,
1503a24f53f153 Herbert Xu             2016-06-29  2424  				   speed_template_16_24_32);
3f3baf359dd3cc Jussi Kivilinna        2011-10-18  2425  		test_acipher_speed("ctr(aes)", ENCRYPT, sec, NULL, 0,
3f3baf359dd3cc Jussi Kivilinna        2011-10-18  2426  				   speed_template_16_24_32);
3f3baf359dd3cc Jussi Kivilinna        2011-10-18  2427  		test_acipher_speed("ctr(aes)", DECRYPT, sec, NULL, 0,
3f3baf359dd3cc Jussi Kivilinna        2011-10-18  2428  				   speed_template_16_24_32);
de197533485c09 Nicolas Royer          2012-07-01  2429  		test_acipher_speed("cfb(aes)", ENCRYPT, sec, NULL, 0,
de197533485c09 Nicolas Royer          2012-07-01  2430  				   speed_template_16_24_32);
de197533485c09 Nicolas Royer          2012-07-01  2431  		test_acipher_speed("cfb(aes)", DECRYPT, sec, NULL, 0,
de197533485c09 Nicolas Royer          2012-07-01  2432  				   speed_template_16_24_32);
de197533485c09 Nicolas Royer          2012-07-01  2433  		test_acipher_speed("ofb(aes)", ENCRYPT, sec, NULL, 0,
de197533485c09 Nicolas Royer          2012-07-01  2434  				   speed_template_16_24_32);
de197533485c09 Nicolas Royer          2012-07-01  2435  		test_acipher_speed("ofb(aes)", DECRYPT, sec, NULL, 0,
de197533485c09 Nicolas Royer          2012-07-01  2436  				   speed_template_16_24_32);
69d3150cfc2075 Jussi Kivilinna        2012-12-28  2437  		test_acipher_speed("rfc3686(ctr(aes))", ENCRYPT, sec, NULL, 0,
69d3150cfc2075 Jussi Kivilinna        2012-12-28  2438  				   speed_template_20_28_36);
69d3150cfc2075 Jussi Kivilinna        2012-12-28  2439  		test_acipher_speed("rfc3686(ctr(aes))", DECRYPT, sec, NULL, 0,
69d3150cfc2075 Jussi Kivilinna        2012-12-28  2440  				   speed_template_20_28_36);
3f3baf359dd3cc Jussi Kivilinna        2011-10-18  2441  		break;
3f3baf359dd3cc Jussi Kivilinna        2011-10-18  2442  
3f3baf359dd3cc Jussi Kivilinna        2011-10-18  2443  	case 501:
3f3baf359dd3cc Jussi Kivilinna        2011-10-18  2444  		test_acipher_speed("ecb(des3_ede)", ENCRYPT, sec,
3f3baf359dd3cc Jussi Kivilinna        2011-10-18  2445  				   des3_speed_template, DES3_SPEED_VECTORS,
3f3baf359dd3cc Jussi Kivilinna        2011-10-18  2446  				   speed_template_24);
3f3baf359dd3cc Jussi Kivilinna        2011-10-18  2447  		test_acipher_speed("ecb(des3_ede)", DECRYPT, sec,
3f3baf359dd3cc Jussi Kivilinna        2011-10-18  2448  				   des3_speed_template, DES3_SPEED_VECTORS,
3f3baf359dd3cc Jussi Kivilinna        2011-10-18  2449  				   speed_template_24);
3f3baf359dd3cc Jussi Kivilinna        2011-10-18  2450  		test_acipher_speed("cbc(des3_ede)", ENCRYPT, sec,
3f3baf359dd3cc Jussi Kivilinna        2011-10-18  2451  				   des3_speed_template, DES3_SPEED_VECTORS,
3f3baf359dd3cc Jussi Kivilinna        2011-10-18  2452  				   speed_template_24);
3f3baf359dd3cc Jussi Kivilinna        2011-10-18  2453  		test_acipher_speed("cbc(des3_ede)", DECRYPT, sec,
3f3baf359dd3cc Jussi Kivilinna        2011-10-18  2454  				   des3_speed_template, DES3_SPEED_VECTORS,
3f3baf359dd3cc Jussi Kivilinna        2011-10-18  2455  				   speed_template_24);
de197533485c09 Nicolas Royer          2012-07-01  2456  		test_acipher_speed("cfb(des3_ede)", ENCRYPT, sec,
de197533485c09 Nicolas Royer          2012-07-01  2457  				   des3_speed_template, DES3_SPEED_VECTORS,
de197533485c09 Nicolas Royer          2012-07-01  2458  				   speed_template_24);
de197533485c09 Nicolas Royer          2012-07-01  2459  		test_acipher_speed("cfb(des3_ede)", DECRYPT, sec,
de197533485c09 Nicolas Royer          2012-07-01  2460  				   des3_speed_template, DES3_SPEED_VECTORS,
de197533485c09 Nicolas Royer          2012-07-01  2461  				   speed_template_24);
de197533485c09 Nicolas Royer          2012-07-01  2462  		test_acipher_speed("ofb(des3_ede)", ENCRYPT, sec,
de197533485c09 Nicolas Royer          2012-07-01  2463  				   des3_speed_template, DES3_SPEED_VECTORS,
de197533485c09 Nicolas Royer          2012-07-01  2464  				   speed_template_24);
de197533485c09 Nicolas Royer          2012-07-01  2465  		test_acipher_speed("ofb(des3_ede)", DECRYPT, sec,
de197533485c09 Nicolas Royer          2012-07-01  2466  				   des3_speed_template, DES3_SPEED_VECTORS,
de197533485c09 Nicolas Royer          2012-07-01  2467  				   speed_template_24);
3f3baf359dd3cc Jussi Kivilinna        2011-10-18  2468  		break;
3f3baf359dd3cc Jussi Kivilinna        2011-10-18  2469  
3f3baf359dd3cc Jussi Kivilinna        2011-10-18  2470  	case 502:
3f3baf359dd3cc Jussi Kivilinna        2011-10-18  2471  		test_acipher_speed("ecb(des)", ENCRYPT, sec, NULL, 0,
3f3baf359dd3cc Jussi Kivilinna        2011-10-18  2472  				   speed_template_8);
3f3baf359dd3cc Jussi Kivilinna        2011-10-18  2473  		test_acipher_speed("ecb(des)", DECRYPT, sec, NULL, 0,
3f3baf359dd3cc Jussi Kivilinna        2011-10-18  2474  				   speed_template_8);
3f3baf359dd3cc Jussi Kivilinna        2011-10-18  2475  		test_acipher_speed("cbc(des)", ENCRYPT, sec, NULL, 0,
3f3baf359dd3cc Jussi Kivilinna        2011-10-18  2476  				   speed_template_8);
3f3baf359dd3cc Jussi Kivilinna        2011-10-18  2477  		test_acipher_speed("cbc(des)", DECRYPT, sec, NULL, 0,
3f3baf359dd3cc Jussi Kivilinna        2011-10-18  2478  				   speed_template_8);
de197533485c09 Nicolas Royer          2012-07-01  2479  		test_acipher_speed("cfb(des)", ENCRYPT, sec, NULL, 0,
de197533485c09 Nicolas Royer          2012-07-01  2480  				   speed_template_8);
de197533485c09 Nicolas Royer          2012-07-01  2481  		test_acipher_speed("cfb(des)", DECRYPT, sec, NULL, 0,
de197533485c09 Nicolas Royer          2012-07-01  2482  				   speed_template_8);
de197533485c09 Nicolas Royer          2012-07-01  2483  		test_acipher_speed("ofb(des)", ENCRYPT, sec, NULL, 0,
de197533485c09 Nicolas Royer          2012-07-01  2484  				   speed_template_8);
de197533485c09 Nicolas Royer          2012-07-01  2485  		test_acipher_speed("ofb(des)", DECRYPT, sec, NULL, 0,
de197533485c09 Nicolas Royer          2012-07-01  2486  				   speed_template_8);
3f3baf359dd3cc Jussi Kivilinna        2011-10-18  2487  		break;
3f3baf359dd3cc Jussi Kivilinna        2011-10-18  2488  
7fb7fe4469d0b8 Jussi Kivilinna        2011-10-18  2489  	case 503:
7fb7fe4469d0b8 Jussi Kivilinna        2011-10-18  2490  		test_acipher_speed("ecb(serpent)", ENCRYPT, sec, NULL, 0,
7fb7fe4469d0b8 Jussi Kivilinna        2011-10-18  2491  				   speed_template_16_32);
7fb7fe4469d0b8 Jussi Kivilinna        2011-10-18  2492  		test_acipher_speed("ecb(serpent)", DECRYPT, sec, NULL, 0,
7fb7fe4469d0b8 Jussi Kivilinna        2011-10-18  2493  				   speed_template_16_32);
7fb7fe4469d0b8 Jussi Kivilinna        2011-10-18  2494  		test_acipher_speed("cbc(serpent)", ENCRYPT, sec, NULL, 0,
7fb7fe4469d0b8 Jussi Kivilinna        2011-10-18  2495  				   speed_template_16_32);
7fb7fe4469d0b8 Jussi Kivilinna        2011-10-18  2496  		test_acipher_speed("cbc(serpent)", DECRYPT, sec, NULL, 0,
7fb7fe4469d0b8 Jussi Kivilinna        2011-10-18  2497  				   speed_template_16_32);
7fb7fe4469d0b8 Jussi Kivilinna        2011-10-18  2498  		test_acipher_speed("ctr(serpent)", ENCRYPT, sec, NULL, 0,
7fb7fe4469d0b8 Jussi Kivilinna        2011-10-18  2499  				   speed_template_16_32);
7fb7fe4469d0b8 Jussi Kivilinna        2011-10-18  2500  		test_acipher_speed("ctr(serpent)", DECRYPT, sec, NULL, 0,
7fb7fe4469d0b8 Jussi Kivilinna        2011-10-18  2501  				   speed_template_16_32);
87aae4bfb2912d Jussi Kivilinna        2011-10-18  2502  		test_acipher_speed("lrw(serpent)", ENCRYPT, sec, NULL, 0,
87aae4bfb2912d Jussi Kivilinna        2011-10-18  2503  				   speed_template_32_48);
87aae4bfb2912d Jussi Kivilinna        2011-10-18  2504  		test_acipher_speed("lrw(serpent)", DECRYPT, sec, NULL, 0,
87aae4bfb2912d Jussi Kivilinna        2011-10-18  2505  				   speed_template_32_48);
5209c07ac3601c Jussi Kivilinna        2011-10-18  2506  		test_acipher_speed("xts(serpent)", ENCRYPT, sec, NULL, 0,
5209c07ac3601c Jussi Kivilinna        2011-10-18  2507  				   speed_template_32_64);
5209c07ac3601c Jussi Kivilinna        2011-10-18  2508  		test_acipher_speed("xts(serpent)", DECRYPT, sec, NULL, 0,
5209c07ac3601c Jussi Kivilinna        2011-10-18  2509  				   speed_template_32_64);
7fb7fe4469d0b8 Jussi Kivilinna        2011-10-18  2510  		break;
7fb7fe4469d0b8 Jussi Kivilinna        2011-10-18  2511  
107778b592576c Johannes Goetzfried    2012-05-28  2512  	case 504:
107778b592576c Johannes Goetzfried    2012-05-28  2513  		test_acipher_speed("ecb(twofish)", ENCRYPT, sec, NULL, 0,
107778b592576c Johannes Goetzfried    2012-05-28  2514  				   speed_template_16_24_32);
107778b592576c Johannes Goetzfried    2012-05-28  2515  		test_acipher_speed("ecb(twofish)", DECRYPT, sec, NULL, 0,
107778b592576c Johannes Goetzfried    2012-05-28  2516  				   speed_template_16_24_32);
107778b592576c Johannes Goetzfried    2012-05-28  2517  		test_acipher_speed("cbc(twofish)", ENCRYPT, sec, NULL, 0,
107778b592576c Johannes Goetzfried    2012-05-28  2518  				   speed_template_16_24_32);
107778b592576c Johannes Goetzfried    2012-05-28  2519  		test_acipher_speed("cbc(twofish)", DECRYPT, sec, NULL, 0,
107778b592576c Johannes Goetzfried    2012-05-28  2520  				   speed_template_16_24_32);
107778b592576c Johannes Goetzfried    2012-05-28  2521  		test_acipher_speed("ctr(twofish)", ENCRYPT, sec, NULL, 0,
107778b592576c Johannes Goetzfried    2012-05-28  2522  				   speed_template_16_24_32);
107778b592576c Johannes Goetzfried    2012-05-28  2523  		test_acipher_speed("ctr(twofish)", DECRYPT, sec, NULL, 0,
107778b592576c Johannes Goetzfried    2012-05-28  2524  				   speed_template_16_24_32);
107778b592576c Johannes Goetzfried    2012-05-28  2525  		test_acipher_speed("lrw(twofish)", ENCRYPT, sec, NULL, 0,
107778b592576c Johannes Goetzfried    2012-05-28  2526  				   speed_template_32_40_48);
107778b592576c Johannes Goetzfried    2012-05-28  2527  		test_acipher_speed("lrw(twofish)", DECRYPT, sec, NULL, 0,
107778b592576c Johannes Goetzfried    2012-05-28  2528  				   speed_template_32_40_48);
107778b592576c Johannes Goetzfried    2012-05-28  2529  		test_acipher_speed("xts(twofish)", ENCRYPT, sec, NULL, 0,
107778b592576c Johannes Goetzfried    2012-05-28  2530  				   speed_template_32_48_64);
107778b592576c Johannes Goetzfried    2012-05-28  2531  		test_acipher_speed("xts(twofish)", DECRYPT, sec, NULL, 0,
107778b592576c Johannes Goetzfried    2012-05-28  2532  				   speed_template_32_48_64);
107778b592576c Johannes Goetzfried    2012-05-28  2533  		break;
107778b592576c Johannes Goetzfried    2012-05-28  2534  
31b4cd2907322b Jussi Kivilinna        2012-06-12  2535  	case 505:
31b4cd2907322b Jussi Kivilinna        2012-06-12  2536  		test_acipher_speed("ecb(arc4)", ENCRYPT, sec, NULL, 0,
31b4cd2907322b Jussi Kivilinna        2012-06-12  2537  				   speed_template_8);
31b4cd2907322b Jussi Kivilinna        2012-06-12  2538  		break;
31b4cd2907322b Jussi Kivilinna        2012-06-12  2539  
a2c58260955629 Johannes Goetzfried    2012-07-11  2540  	case 506:
a2c58260955629 Johannes Goetzfried    2012-07-11  2541  		test_acipher_speed("ecb(cast5)", ENCRYPT, sec, NULL, 0,
a2c58260955629 Johannes Goetzfried    2012-07-11  2542  				   speed_template_8_16);
a2c58260955629 Johannes Goetzfried    2012-07-11  2543  		test_acipher_speed("ecb(cast5)", DECRYPT, sec, NULL, 0,
a2c58260955629 Johannes Goetzfried    2012-07-11  2544  				   speed_template_8_16);
a2c58260955629 Johannes Goetzfried    2012-07-11  2545  		test_acipher_speed("cbc(cast5)", ENCRYPT, sec, NULL, 0,
a2c58260955629 Johannes Goetzfried    2012-07-11  2546  				   speed_template_8_16);
a2c58260955629 Johannes Goetzfried    2012-07-11  2547  		test_acipher_speed("cbc(cast5)", DECRYPT, sec, NULL, 0,
a2c58260955629 Johannes Goetzfried    2012-07-11  2548  				   speed_template_8_16);
a2c58260955629 Johannes Goetzfried    2012-07-11  2549  		test_acipher_speed("ctr(cast5)", ENCRYPT, sec, NULL, 0,
a2c58260955629 Johannes Goetzfried    2012-07-11  2550  				   speed_template_8_16);
a2c58260955629 Johannes Goetzfried    2012-07-11  2551  		test_acipher_speed("ctr(cast5)", DECRYPT, sec, NULL, 0,
a2c58260955629 Johannes Goetzfried    2012-07-11  2552  				   speed_template_8_16);
a2c58260955629 Johannes Goetzfried    2012-07-11  2553  		break;
a2c58260955629 Johannes Goetzfried    2012-07-11  2554  
9b8b04051d0df1 Johannes Goetzfried    2012-07-11  2555  	case 507:
9b8b04051d0df1 Johannes Goetzfried    2012-07-11  2556  		test_acipher_speed("ecb(cast6)", ENCRYPT, sec, NULL, 0,
9b8b04051d0df1 Johannes Goetzfried    2012-07-11  2557  				   speed_template_16_32);
9b8b04051d0df1 Johannes Goetzfried    2012-07-11  2558  		test_acipher_speed("ecb(cast6)", DECRYPT, sec, NULL, 0,
9b8b04051d0df1 Johannes Goetzfried    2012-07-11  2559  				   speed_template_16_32);
9b8b04051d0df1 Johannes Goetzfried    2012-07-11  2560  		test_acipher_speed("cbc(cast6)", ENCRYPT, sec, NULL, 0,
9b8b04051d0df1 Johannes Goetzfried    2012-07-11  2561  				   speed_template_16_32);
9b8b04051d0df1 Johannes Goetzfried    2012-07-11  2562  		test_acipher_speed("cbc(cast6)", DECRYPT, sec, NULL, 0,
9b8b04051d0df1 Johannes Goetzfried    2012-07-11  2563  				   speed_template_16_32);
9b8b04051d0df1 Johannes Goetzfried    2012-07-11  2564  		test_acipher_speed("ctr(cast6)", ENCRYPT, sec, NULL, 0,
9b8b04051d0df1 Johannes Goetzfried    2012-07-11  2565  				   speed_template_16_32);
9b8b04051d0df1 Johannes Goetzfried    2012-07-11  2566  		test_acipher_speed("ctr(cast6)", DECRYPT, sec, NULL, 0,
9b8b04051d0df1 Johannes Goetzfried    2012-07-11  2567  				   speed_template_16_32);
9b8b04051d0df1 Johannes Goetzfried    2012-07-11  2568  		test_acipher_speed("lrw(cast6)", ENCRYPT, sec, NULL, 0,
9b8b04051d0df1 Johannes Goetzfried    2012-07-11  2569  				   speed_template_32_48);
9b8b04051d0df1 Johannes Goetzfried    2012-07-11  2570  		test_acipher_speed("lrw(cast6)", DECRYPT, sec, NULL, 0,
9b8b04051d0df1 Johannes Goetzfried    2012-07-11  2571  				   speed_template_32_48);
9b8b04051d0df1 Johannes Goetzfried    2012-07-11  2572  		test_acipher_speed("xts(cast6)", ENCRYPT, sec, NULL, 0,
9b8b04051d0df1 Johannes Goetzfried    2012-07-11  2573  				   speed_template_32_64);
9b8b04051d0df1 Johannes Goetzfried    2012-07-11  2574  		test_acipher_speed("xts(cast6)", DECRYPT, sec, NULL, 0,
9b8b04051d0df1 Johannes Goetzfried    2012-07-11  2575  				   speed_template_32_64);
9b8b04051d0df1 Johannes Goetzfried    2012-07-11  2576  		break;
9b8b04051d0df1 Johannes Goetzfried    2012-07-11  2577  
bf9c5181865f1c Jussi Kivilinna        2012-10-26  2578  	case 508:
bf9c5181865f1c Jussi Kivilinna        2012-10-26  2579  		test_acipher_speed("ecb(camellia)", ENCRYPT, sec, NULL, 0,
bf9c5181865f1c Jussi Kivilinna        2012-10-26  2580  				   speed_template_16_32);
bf9c5181865f1c Jussi Kivilinna        2012-10-26  2581  		test_acipher_speed("ecb(camellia)", DECRYPT, sec, NULL, 0,
bf9c5181865f1c Jussi Kivilinna        2012-10-26  2582  				   speed_template_16_32);
bf9c5181865f1c Jussi Kivilinna        2012-10-26  2583  		test_acipher_speed("cbc(camellia)", ENCRYPT, sec, NULL, 0,
bf9c5181865f1c Jussi Kivilinna        2012-10-26  2584  				   speed_template_16_32);
bf9c5181865f1c Jussi Kivilinna        2012-10-26  2585  		test_acipher_speed("cbc(camellia)", DECRYPT, sec, NULL, 0,
bf9c5181865f1c Jussi Kivilinna        2012-10-26  2586  				   speed_template_16_32);
bf9c5181865f1c Jussi Kivilinna        2012-10-26  2587  		test_acipher_speed("ctr(camellia)", ENCRYPT, sec, NULL, 0,
bf9c5181865f1c Jussi Kivilinna        2012-10-26  2588  				   speed_template_16_32);
bf9c5181865f1c Jussi Kivilinna        2012-10-26  2589  		test_acipher_speed("ctr(camellia)", DECRYPT, sec, NULL, 0,
bf9c5181865f1c Jussi Kivilinna        2012-10-26  2590  				   speed_template_16_32);
bf9c5181865f1c Jussi Kivilinna        2012-10-26  2591  		test_acipher_speed("lrw(camellia)", ENCRYPT, sec, NULL, 0,
bf9c5181865f1c Jussi Kivilinna        2012-10-26  2592  				   speed_template_32_48);
bf9c5181865f1c Jussi Kivilinna        2012-10-26  2593  		test_acipher_speed("lrw(camellia)", DECRYPT, sec, NULL, 0,
bf9c5181865f1c Jussi Kivilinna        2012-10-26  2594  				   speed_template_32_48);
bf9c5181865f1c Jussi Kivilinna        2012-10-26  2595  		test_acipher_speed("xts(camellia)", ENCRYPT, sec, NULL, 0,
bf9c5181865f1c Jussi Kivilinna        2012-10-26  2596  				   speed_template_32_64);
bf9c5181865f1c Jussi Kivilinna        2012-10-26  2597  		test_acipher_speed("xts(camellia)", DECRYPT, sec, NULL, 0,
bf9c5181865f1c Jussi Kivilinna        2012-10-26  2598  				   speed_template_32_64);
bf9c5181865f1c Jussi Kivilinna        2012-10-26  2599  		break;
bf9c5181865f1c Jussi Kivilinna        2012-10-26  2600  
ad8b7c3e92868d Jussi Kivilinna        2013-04-13  2601  	case 509:
ad8b7c3e92868d Jussi Kivilinna        2013-04-13  2602  		test_acipher_speed("ecb(blowfish)", ENCRYPT, sec, NULL, 0,
ad8b7c3e92868d Jussi Kivilinna        2013-04-13  2603  				   speed_template_8_32);
ad8b7c3e92868d Jussi Kivilinna        2013-04-13  2604  		test_acipher_speed("ecb(blowfish)", DECRYPT, sec, NULL, 0,
ad8b7c3e92868d Jussi Kivilinna        2013-04-13  2605  				   speed_template_8_32);
ad8b7c3e92868d Jussi Kivilinna        2013-04-13  2606  		test_acipher_speed("cbc(blowfish)", ENCRYPT, sec, NULL, 0,
ad8b7c3e92868d Jussi Kivilinna        2013-04-13  2607  				   speed_template_8_32);
ad8b7c3e92868d Jussi Kivilinna        2013-04-13  2608  		test_acipher_speed("cbc(blowfish)", DECRYPT, sec, NULL, 0,
ad8b7c3e92868d Jussi Kivilinna        2013-04-13  2609  				   speed_template_8_32);
ad8b7c3e92868d Jussi Kivilinna        2013-04-13  2610  		test_acipher_speed("ctr(blowfish)", ENCRYPT, sec, NULL, 0,
ad8b7c3e92868d Jussi Kivilinna        2013-04-13  2611  				   speed_template_8_32);
ad8b7c3e92868d Jussi Kivilinna        2013-04-13  2612  		test_acipher_speed("ctr(blowfish)", DECRYPT, sec, NULL, 0,
ad8b7c3e92868d Jussi Kivilinna        2013-04-13  2613  				   speed_template_8_32);
ad8b7c3e92868d Jussi Kivilinna        2013-04-13  2614  		break;
ad8b7c3e92868d Jussi Kivilinna        2013-04-13  2615  
a7fc80bb22eb0f Tianjia Zhang          2021-07-20  2616  	case 518:
a7fc80bb22eb0f Tianjia Zhang          2021-07-20  2617  		test_acipher_speed("ecb(sm4)", ENCRYPT, sec, NULL, 0,
a7fc80bb22eb0f Tianjia Zhang          2021-07-20  2618  				speed_template_16);
a7fc80bb22eb0f Tianjia Zhang          2021-07-20  2619  		test_acipher_speed("ecb(sm4)", DECRYPT, sec, NULL, 0,
a7fc80bb22eb0f Tianjia Zhang          2021-07-20  2620  				speed_template_16);
a7fc80bb22eb0f Tianjia Zhang          2021-07-20  2621  		test_acipher_speed("cbc(sm4)", ENCRYPT, sec, NULL, 0,
a7fc80bb22eb0f Tianjia Zhang          2021-07-20  2622  				speed_template_16);
a7fc80bb22eb0f Tianjia Zhang          2021-07-20  2623  		test_acipher_speed("cbc(sm4)", DECRYPT, sec, NULL, 0,
a7fc80bb22eb0f Tianjia Zhang          2021-07-20  2624  				speed_template_16);
a7fc80bb22eb0f Tianjia Zhang          2021-07-20  2625  		test_acipher_speed("cfb(sm4)", ENCRYPT, sec, NULL, 0,
a7fc80bb22eb0f Tianjia Zhang          2021-07-20  2626  				speed_template_16);
a7fc80bb22eb0f Tianjia Zhang          2021-07-20  2627  		test_acipher_speed("cfb(sm4)", DECRYPT, sec, NULL, 0,
a7fc80bb22eb0f Tianjia Zhang          2021-07-20  2628  				speed_template_16);
a7fc80bb22eb0f Tianjia Zhang          2021-07-20  2629  		test_acipher_speed("ctr(sm4)", ENCRYPT, sec, NULL, 0,
a7fc80bb22eb0f Tianjia Zhang          2021-07-20  2630  				speed_template_16);
a7fc80bb22eb0f Tianjia Zhang          2021-07-20  2631  		test_acipher_speed("ctr(sm4)", DECRYPT, sec, NULL, 0,
a7fc80bb22eb0f Tianjia Zhang          2021-07-20  2632  				speed_template_16);
a7fc80bb22eb0f Tianjia Zhang          2021-07-20  2633  		break;
a7fc80bb22eb0f Tianjia Zhang          2021-07-20  2634  
c4b1ce72b5c9f7 Taehee Yoo             2022-09-16  2635  	case 519:
c4b1ce72b5c9f7 Taehee Yoo             2022-09-16  2636  		test_acipher_speed("ecb(aria)", ENCRYPT, sec, NULL, 0,
c4b1ce72b5c9f7 Taehee Yoo             2022-09-16  2637  				   speed_template_16_24_32);
c4b1ce72b5c9f7 Taehee Yoo             2022-09-16  2638  		test_acipher_speed("ecb(aria)", DECRYPT, sec, NULL, 0,
c4b1ce72b5c9f7 Taehee Yoo             2022-09-16  2639  				   speed_template_16_24_32);
c4b1ce72b5c9f7 Taehee Yoo             2022-09-16  2640  		test_acipher_speed("ctr(aria)", ENCRYPT, sec, NULL, 0,
c4b1ce72b5c9f7 Taehee Yoo             2022-09-16  2641  				   speed_template_16_24_32);
c4b1ce72b5c9f7 Taehee Yoo             2022-09-16  2642  		test_acipher_speed("ctr(aria)", DECRYPT, sec, NULL, 0,
c4b1ce72b5c9f7 Taehee Yoo             2022-09-16  2643  				   speed_template_16_24_32);
c4b1ce72b5c9f7 Taehee Yoo             2022-09-16  2644  		break;
c4b1ce72b5c9f7 Taehee Yoo             2022-09-16  2645  
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2646  	case 600:
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2647  		test_mb_skcipher_speed("ecb(aes)", ENCRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2648  				       speed_template_16_24_32, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2649  		test_mb_skcipher_speed("ecb(aes)", DECRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2650  				       speed_template_16_24_32, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2651  		test_mb_skcipher_speed("cbc(aes)", ENCRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2652  				       speed_template_16_24_32, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2653  		test_mb_skcipher_speed("cbc(aes)", DECRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2654  				       speed_template_16_24_32, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2655  		test_mb_skcipher_speed("lrw(aes)", ENCRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2656  				       speed_template_32_40_48, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2657  		test_mb_skcipher_speed("lrw(aes)", DECRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2658  				       speed_template_32_40_48, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2659  		test_mb_skcipher_speed("xts(aes)", ENCRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2660  				       speed_template_32_64, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2661  		test_mb_skcipher_speed("xts(aes)", DECRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2662  				       speed_template_32_64, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2663  		test_mb_skcipher_speed("cts(cbc(aes))", ENCRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2664  				       speed_template_16_24_32, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2665  		test_mb_skcipher_speed("cts(cbc(aes))", DECRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2666  				       speed_template_16_24_32, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2667  		test_mb_skcipher_speed("ctr(aes)", ENCRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2668  				       speed_template_16_24_32, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2669  		test_mb_skcipher_speed("ctr(aes)", DECRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2670  				       speed_template_16_24_32, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2671  		test_mb_skcipher_speed("cfb(aes)", ENCRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2672  				       speed_template_16_24_32, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2673  		test_mb_skcipher_speed("cfb(aes)", DECRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2674  				       speed_template_16_24_32, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2675  		test_mb_skcipher_speed("ofb(aes)", ENCRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2676  				       speed_template_16_24_32, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2677  		test_mb_skcipher_speed("ofb(aes)", DECRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2678  				       speed_template_16_24_32, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2679  		test_mb_skcipher_speed("rfc3686(ctr(aes))", ENCRYPT, sec, NULL,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2680  				       0, speed_template_20_28_36, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2681  		test_mb_skcipher_speed("rfc3686(ctr(aes))", DECRYPT, sec, NULL,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2682  				       0, speed_template_20_28_36, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2683  		break;
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2684  
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2685  	case 601:
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2686  		test_mb_skcipher_speed("ecb(des3_ede)", ENCRYPT, sec,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2687  				       des3_speed_template, DES3_SPEED_VECTORS,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2688  				       speed_template_24, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2689  		test_mb_skcipher_speed("ecb(des3_ede)", DECRYPT, sec,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2690  				       des3_speed_template, DES3_SPEED_VECTORS,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2691  				       speed_template_24, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2692  		test_mb_skcipher_speed("cbc(des3_ede)", ENCRYPT, sec,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2693  				       des3_speed_template, DES3_SPEED_VECTORS,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2694  				       speed_template_24, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2695  		test_mb_skcipher_speed("cbc(des3_ede)", DECRYPT, sec,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2696  				       des3_speed_template, DES3_SPEED_VECTORS,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2697  				       speed_template_24, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2698  		test_mb_skcipher_speed("cfb(des3_ede)", ENCRYPT, sec,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2699  				       des3_speed_template, DES3_SPEED_VECTORS,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2700  				       speed_template_24, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2701  		test_mb_skcipher_speed("cfb(des3_ede)", DECRYPT, sec,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2702  				       des3_speed_template, DES3_SPEED_VECTORS,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2703  				       speed_template_24, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2704  		test_mb_skcipher_speed("ofb(des3_ede)", ENCRYPT, sec,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2705  				       des3_speed_template, DES3_SPEED_VECTORS,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2706  				       speed_template_24, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2707  		test_mb_skcipher_speed("ofb(des3_ede)", DECRYPT, sec,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2708  				       des3_speed_template, DES3_SPEED_VECTORS,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2709  				       speed_template_24, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2710  		break;
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2711  
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2712  	case 602:
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2713  		test_mb_skcipher_speed("ecb(des)", ENCRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2714  				       speed_template_8, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2715  		test_mb_skcipher_speed("ecb(des)", DECRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2716  				       speed_template_8, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2717  		test_mb_skcipher_speed("cbc(des)", ENCRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2718  				       speed_template_8, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2719  		test_mb_skcipher_speed("cbc(des)", DECRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2720  				       speed_template_8, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2721  		test_mb_skcipher_speed("cfb(des)", ENCRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2722  				       speed_template_8, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2723  		test_mb_skcipher_speed("cfb(des)", DECRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2724  				       speed_template_8, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2725  		test_mb_skcipher_speed("ofb(des)", ENCRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2726  				       speed_template_8, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2727  		test_mb_skcipher_speed("ofb(des)", DECRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2728  				       speed_template_8, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2729  		break;
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2730  
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2731  	case 603:
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2732  		test_mb_skcipher_speed("ecb(serpent)", ENCRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2733  				       speed_template_16_32, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2734  		test_mb_skcipher_speed("ecb(serpent)", DECRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2735  				       speed_template_16_32, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2736  		test_mb_skcipher_speed("cbc(serpent)", ENCRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2737  				       speed_template_16_32, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2738  		test_mb_skcipher_speed("cbc(serpent)", DECRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2739  				       speed_template_16_32, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2740  		test_mb_skcipher_speed("ctr(serpent)", ENCRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2741  				       speed_template_16_32, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2742  		test_mb_skcipher_speed("ctr(serpent)", DECRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2743  				       speed_template_16_32, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2744  		test_mb_skcipher_speed("lrw(serpent)", ENCRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2745  				       speed_template_32_48, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2746  		test_mb_skcipher_speed("lrw(serpent)", DECRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2747  				       speed_template_32_48, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2748  		test_mb_skcipher_speed("xts(serpent)", ENCRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2749  				       speed_template_32_64, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2750  		test_mb_skcipher_speed("xts(serpent)", DECRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2751  				       speed_template_32_64, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2752  		break;
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2753  
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2754  	case 604:
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2755  		test_mb_skcipher_speed("ecb(twofish)", ENCRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2756  				       speed_template_16_24_32, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2757  		test_mb_skcipher_speed("ecb(twofish)", DECRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2758  				       speed_template_16_24_32, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2759  		test_mb_skcipher_speed("cbc(twofish)", ENCRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2760  				       speed_template_16_24_32, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2761  		test_mb_skcipher_speed("cbc(twofish)", DECRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2762  				       speed_template_16_24_32, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2763  		test_mb_skcipher_speed("ctr(twofish)", ENCRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2764  				       speed_template_16_24_32, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2765  		test_mb_skcipher_speed("ctr(twofish)", DECRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2766  				       speed_template_16_24_32, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2767  		test_mb_skcipher_speed("lrw(twofish)", ENCRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2768  				       speed_template_32_40_48, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2769  		test_mb_skcipher_speed("lrw(twofish)", DECRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2770  				       speed_template_32_40_48, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2771  		test_mb_skcipher_speed("xts(twofish)", ENCRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2772  				       speed_template_32_48_64, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2773  		test_mb_skcipher_speed("xts(twofish)", DECRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2774  				       speed_template_32_48_64, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2775  		break;
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2776  
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2777  	case 605:
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2778  		test_mb_skcipher_speed("ecb(arc4)", ENCRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2779  				       speed_template_8, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2780  		break;
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2781  
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2782  	case 606:
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2783  		test_mb_skcipher_speed("ecb(cast5)", ENCRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2784  				       speed_template_8_16, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2785  		test_mb_skcipher_speed("ecb(cast5)", DECRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2786  				       speed_template_8_16, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2787  		test_mb_skcipher_speed("cbc(cast5)", ENCRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2788  				       speed_template_8_16, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2789  		test_mb_skcipher_speed("cbc(cast5)", DECRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2790  				       speed_template_8_16, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2791  		test_mb_skcipher_speed("ctr(cast5)", ENCRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2792  				       speed_template_8_16, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2793  		test_mb_skcipher_speed("ctr(cast5)", DECRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2794  				       speed_template_8_16, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2795  		break;
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2796  
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2797  	case 607:
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2798  		test_mb_skcipher_speed("ecb(cast6)", ENCRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2799  				       speed_template_16_32, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2800  		test_mb_skcipher_speed("ecb(cast6)", DECRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2801  				       speed_template_16_32, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2802  		test_mb_skcipher_speed("cbc(cast6)", ENCRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2803  				       speed_template_16_32, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2804  		test_mb_skcipher_speed("cbc(cast6)", DECRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2805  				       speed_template_16_32, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2806  		test_mb_skcipher_speed("ctr(cast6)", ENCRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2807  				       speed_template_16_32, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2808  		test_mb_skcipher_speed("ctr(cast6)", DECRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2809  				       speed_template_16_32, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2810  		test_mb_skcipher_speed("lrw(cast6)", ENCRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2811  				       speed_template_32_48, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2812  		test_mb_skcipher_speed("lrw(cast6)", DECRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2813  				       speed_template_32_48, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2814  		test_mb_skcipher_speed("xts(cast6)", ENCRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2815  				       speed_template_32_64, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2816  		test_mb_skcipher_speed("xts(cast6)", DECRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2817  				       speed_template_32_64, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2818  		break;
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2819  
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2820  	case 608:
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2821  		test_mb_skcipher_speed("ecb(camellia)", ENCRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2822  				       speed_template_16_32, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2823  		test_mb_skcipher_speed("ecb(camellia)", DECRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2824  				       speed_template_16_32, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2825  		test_mb_skcipher_speed("cbc(camellia)", ENCRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2826  				       speed_template_16_32, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2827  		test_mb_skcipher_speed("cbc(camellia)", DECRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2828  				       speed_template_16_32, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2829  		test_mb_skcipher_speed("ctr(camellia)", ENCRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2830  				       speed_template_16_32, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2831  		test_mb_skcipher_speed("ctr(camellia)", DECRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2832  				       speed_template_16_32, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2833  		test_mb_skcipher_speed("lrw(camellia)", ENCRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2834  				       speed_template_32_48, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2835  		test_mb_skcipher_speed("lrw(camellia)", DECRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2836  				       speed_template_32_48, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2837  		test_mb_skcipher_speed("xts(camellia)", ENCRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2838  				       speed_template_32_64, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2839  		test_mb_skcipher_speed("xts(camellia)", DECRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2840  				       speed_template_32_64, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2841  		break;
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2842  
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2843  	case 609:
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2844  		test_mb_skcipher_speed("ecb(blowfish)", ENCRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2845  				       speed_template_8_32, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2846  		test_mb_skcipher_speed("ecb(blowfish)", DECRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2847  				       speed_template_8_32, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2848  		test_mb_skcipher_speed("cbc(blowfish)", ENCRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2849  				       speed_template_8_32, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2850  		test_mb_skcipher_speed("cbc(blowfish)", DECRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2851  				       speed_template_8_32, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2852  		test_mb_skcipher_speed("ctr(blowfish)", ENCRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2853  				       speed_template_8_32, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2854  		test_mb_skcipher_speed("ctr(blowfish)", DECRYPT, sec, NULL, 0,
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2855  				       speed_template_8_32, num_mb);
e161c5930c150a Gilad Ben-Yossef       2017-12-17  2856  		break;
c4b1ce72b5c9f7 Taehee Yoo             2022-09-16  2857  
c4b1ce72b5c9f7 Taehee Yoo             2022-09-16  2858  	case 610:
c4b1ce72b5c9f7 Taehee Yoo             2022-09-16  2859  		test_mb_skcipher_speed("ecb(aria)", ENCRYPT, sec, NULL, 0,
c4b1ce72b5c9f7 Taehee Yoo             2022-09-16  2860  				       speed_template_16_32, num_mb);
c4b1ce72b5c9f7 Taehee Yoo             2022-09-16  2861  		test_mb_skcipher_speed("ecb(aria)", DECRYPT, sec, NULL, 0,
c4b1ce72b5c9f7 Taehee Yoo             2022-09-16  2862  				       speed_template_16_32, num_mb);
c4b1ce72b5c9f7 Taehee Yoo             2022-09-16  2863  		test_mb_skcipher_speed("ctr(aria)", ENCRYPT, sec, NULL, 0,
c4b1ce72b5c9f7 Taehee Yoo             2022-09-16  2864  				       speed_template_16_32, num_mb);
c4b1ce72b5c9f7 Taehee Yoo             2022-09-16  2865  		test_mb_skcipher_speed("ctr(aria)", DECRYPT, sec, NULL, 0,
c4b1ce72b5c9f7 Taehee Yoo             2022-09-16  2866  				       speed_template_16_32, num_mb);
c4b1ce72b5c9f7 Taehee Yoo             2022-09-16  2867  		break;
c4b1ce72b5c9f7 Taehee Yoo             2022-09-16  2868  
^1da177e4c3f41 Linus Torvalds         2005-04-16  2869  	}
4e033a6bc70f09 Jarod Wilson           2009-05-27  2870  
4e033a6bc70f09 Jarod Wilson           2009-05-27  2871  	return ret;
^1da177e4c3f41 Linus Torvalds         2005-04-16  2872  }
^1da177e4c3f41 Linus Torvalds         2005-04-16  2873  

:::::: The code at line 2288 was first introduced by commit
:::::: 2dce063a31ae6cbaf39964663fc59d10bef38d15 crypto: tcrypt - Add ChaCha20/Poly1305 speed tests

:::::: TO: Martin Willi <martin@strongswan.org>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
