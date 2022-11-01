Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0231A21D79
	for <oe-kbuild@lists.linux.dev>; Tue,  1 Nov 2022 23:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667345132; x=1698881132;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=MlbKSUpInAd+QJ6Z7LjeUcoSJXShTKa9ioxoSP0r1oM=;
  b=Lm9ds+nef5kBKgdVZHBJcWg6x292lOnOoomifiuBS25Q7qH+2xXSJPO+
   9hhQnK6m0fgK4BHRfxqmoxp2j50/MNyYHyxkSUSiWKPDFu2tCubpKeMHG
   LP6XuZ+G9e+WdFhMR3i1wpUpXbz4SaLr6tw5M9cKSRH7WdDz5xbWKLd8i
   46pYRwXWE4i9fDlp7zweCV1pzgJqmE+SSFNbpYiRxlpozPDDW4dcZ/beH
   JfjSRQF1h/Pq55J7p8kPyQicJTusfdEhtKs/e4oiablhhq4Q2D+XVZiV+
   Cas4aKv7Pe2hicLIFytxh3K/1vp9cNd3NLTaCbUFidKfeNc8L/mEb9RJd
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="292575911"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; 
   d="scan'208";a="292575911"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2022 16:25:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="612022554"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; 
   d="scan'208";a="612022554"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 01 Nov 2022 16:25:29 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oq0dN-000EA4-0q;
	Tue, 01 Nov 2022 23:25:29 +0000
Date: Wed, 2 Nov 2022 07:24:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 1940/4533] crypto/tcrypt.c:2321 do_test() warn:
 Function too hairy.  No more merges.
Message-ID: <202211020712.S4rOkMJc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="ONWR0i6KleGaTbWL"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit


--ONWR0i6KleGaTbWL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Robert Elliott <elliott@hpe.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e9d267f752f8ff62f0111cea90e3ced4fc595b4f
commit: 65c92cbb3f2365627a10cf97560d51e88fb4e588 [1940/4533] crypto: tcrypt - fix return value for multiple subtests
:::::: branch date: 18 hours ago
:::::: commit date: 12 days ago
config: openrisc-randconfig-m031-20221101
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
crypto/tcrypt.c:2321 do_test() warn: Function too hairy.  No more merges.

vim +2321 crypto/tcrypt.c

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
2dce063a31ae6c Martin Willi           2015-07-16  2288  		if (mode > 300 && mode < 400) break;
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
e805792851bcb0 Michal Ludvig          2006-05-30 @2321  		break;
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

:::::: The code at line 2321 was first introduced by commit
:::::: e805792851bcb0bb42f0c8a352be64564c13e374 [CRYPTO] tcrypt: Speed benchmark support for digest algorithms

:::::: TO: Michal Ludvig <michal@logix.cz>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

--ONWR0i6KleGaTbWL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=config

#
# Automatically generated file; DO NOT EDIT.
# Linux/openrisc 6.1.0-rc1 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="or1k-linux-gcc (GCC) 12.1.0"
CONFIG_CC_IS_GCC=y
CONFIG_GCC_VERSION=120100
CONFIG_CLANG_VERSION=0
CONFIG_AS_IS_GNU=y
CONFIG_AS_VERSION=23800
CONFIG_LD_IS_BFD=y
CONFIG_LD_VERSION=23800
CONFIG_LLD_VERSION=0
CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
CONFIG_PAHOLE_VERSION=123
CONFIG_IRQ_WORK=y

#
# General setup
#
CONFIG_BROKEN_ON_SMP=y
CONFIG_INIT_ENV_ARG_LIMIT=32
CONFIG_COMPILE_TEST=y
# CONFIG_WERROR is not set
CONFIG_LOCALVERSION=""
CONFIG_BUILD_SALT=""
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
# CONFIG_SYSVIPC is not set
CONFIG_POSIX_MQUEUE=y
CONFIG_WATCH_QUEUE=y
CONFIG_CROSS_MEMORY_ATTACH=y
# CONFIG_USELIB is not set
# CONFIG_AUDIT is not set

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_PROBE=y
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_CHIP=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_SIM=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_GENERIC_MSI_IRQ=y
CONFIG_GENERIC_MSI_IRQ_DOMAIN=y
CONFIG_SPARSE_IRQ=y
# CONFIG_GENERIC_IRQ_DEBUGFS is not set
# end of IRQ subsystem

CONFIG_GENERIC_IRQ_MULTI_HANDLER=y
CONFIG_GENERIC_CLOCKEVENTS=y
CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=y

#
# Timers subsystem
#
CONFIG_TICK_ONESHOT=y
CONFIG_HZ_PERIODIC=y
# CONFIG_NO_HZ_IDLE is not set
# CONFIG_NO_HZ is not set
CONFIG_HIGH_RES_TIMERS=y
# end of Timers subsystem

CONFIG_BPF=y

#
# BPF subsystem
#
CONFIG_BPF_SYSCALL=y
# CONFIG_BPF_UNPRIV_DEFAULT_OFF is not set
# end of BPF subsystem

CONFIG_PREEMPT_NONE_BUILD=y
CONFIG_PREEMPT_NONE=y
# CONFIG_PREEMPT_VOLUNTARY is not set
# CONFIG_PREEMPT is not set
CONFIG_PREEMPT_COUNT=y

#
# CPU/Task time and stats accounting
#
CONFIG_TICK_CPU_ACCOUNTING=y
CONFIG_PSI=y
# CONFIG_PSI_DEFAULT_DISABLED is not set
# end of CPU/Task time and stats accounting

# CONFIG_CPU_ISOLATION is not set

#
# RCU Subsystem
#
CONFIG_TINY_RCU=y
# CONFIG_RCU_EXPERT is not set
CONFIG_SRCU=y
CONFIG_TINY_SRCU=y
CONFIG_TASKS_RCU_GENERIC=y
CONFIG_TASKS_TRACE_RCU=y
CONFIG_RCU_NEED_SEGCBLIST=y
# end of RCU Subsystem

CONFIG_IKCONFIG=m
# CONFIG_IKHEADERS is not set

#
# Scheduler features
#
# end of Scheduler features

CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough=5"
CONFIG_GCC12_NO_ARRAY_BOUNDS=y
CONFIG_CC_NO_ARRAY_BOUNDS=y
CONFIG_CGROUPS=y
CONFIG_PAGE_COUNTER=y
# CONFIG_CGROUP_FAVOR_DYNMODS is not set
CONFIG_MEMCG=y
# CONFIG_CGROUP_SCHED is not set
CONFIG_CGROUP_PIDS=y
# CONFIG_CGROUP_RDMA is not set
CONFIG_CGROUP_FREEZER=y
CONFIG_CGROUP_DEVICE=y
# CONFIG_CGROUP_CPUACCT is not set
CONFIG_CGROUP_BPF=y
CONFIG_CGROUP_MISC=y
# CONFIG_CGROUP_DEBUG is not set
CONFIG_SOCK_CGROUP_DATA=y
# CONFIG_SCHED_AUTOGROUP is not set
# CONFIG_SYSFS_DEPRECATED is not set
CONFIG_RELAY=y
# CONFIG_BLK_DEV_INITRD is not set
# CONFIG_BOOT_CONFIG is not set
CONFIG_INITRAMFS_PRESERVE_MTIME=y
CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
CONFIG_HAVE_UID16=y
CONFIG_EXPERT=y
# CONFIG_MULTIUSER is not set
# CONFIG_SGETMASK_SYSCALL is not set
CONFIG_SYSFS_SYSCALL=y
CONFIG_FHANDLE=y
CONFIG_POSIX_TIMERS=y
# CONFIG_PRINTK is not set
# CONFIG_BUG is not set
# CONFIG_ELF_CORE is not set
# CONFIG_BASE_FULL is not set
# CONFIG_FUTEX is not set
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_SHMEM=y
# CONFIG_AIO is not set
# CONFIG_IO_URING is not set
# CONFIG_ADVISE_SYSCALLS is not set
CONFIG_MEMBARRIER=y
CONFIG_KALLSYMS=y
CONFIG_KALLSYMS_ALL=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_KCMP=y
CONFIG_EMBEDDED=y
# CONFIG_PC104 is not set

#
# Kernel Performance Events And Counters
#
# end of Kernel Performance Events And Counters

CONFIG_SYSTEM_DATA_VERIFICATION=y
CONFIG_PROFILING=y
CONFIG_TRACEPOINTS=y
# end of General setup

CONFIG_OPENRISC=y
CONFIG_CPU_BIG_ENDIAN=y
CONFIG_MMU=y
CONFIG_GENERIC_HWEIGHT=y
CONFIG_NO_IOPORT_MAP=y
CONFIG_GENERIC_CSUM=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_LOCKDEP_SUPPORT=y

#
# Processor type and features
#
CONFIG_OR1K_1200=y
CONFIG_DCACHE_WRITETHROUGH=y
CONFIG_OPENRISC_BUILTIN_DTB=""

#
# Class II Instructions
#
CONFIG_OPENRISC_HAVE_INST_FF1=y
# CONFIG_OPENRISC_HAVE_INST_FL1 is not set
# CONFIG_OPENRISC_HAVE_INST_MUL is not set
# CONFIG_OPENRISC_HAVE_INST_DIV is not set
# CONFIG_OPENRISC_HAVE_INST_CMOV is not set
# CONFIG_OPENRISC_HAVE_INST_ROR is not set
# CONFIG_OPENRISC_HAVE_INST_RORI is not set
CONFIG_OPENRISC_HAVE_INST_SEXT=y
# end of Class II Instructions

# CONFIG_SMP is not set
# CONFIG_HZ_100 is not set
CONFIG_HZ_250=y
# CONFIG_HZ_300 is not set
# CONFIG_HZ_1000 is not set
CONFIG_HZ=250
CONFIG_SCHED_HRTICK=y
# CONFIG_OPENRISC_NO_SPR_SR_DSX is not set
# CONFIG_OPENRISC_HAVE_SHADOW_GPRS is not set
CONFIG_CMDLINE=""

#
# Debugging options
#
# CONFIG_JUMP_UPON_UNHANDLED_EXCEPTION is not set
CONFIG_OPENRISC_ESR_EXCEPTION_BUG_CHECK=y
# end of Debugging options
# end of Processor type and features

#
# General architecture-dependent options
#
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_ARCH_HAS_DMA_SET_UNCACHED=y
CONFIG_ARCH_HAS_DMA_CLEAR_UNCACHED=y
CONFIG_ARCH_32BIT_OFF_T=y
CONFIG_MMU_GATHER_NO_RANGE=y
CONFIG_MMU_GATHER_MERGE_VMAS=y
CONFIG_LTO_NONE=y
CONFIG_MODULES_USE_ELF_RELA=y
CONFIG_PGTABLE_LEVELS=2
CONFIG_PAGE_SIZE_LESS_THAN_64KB=y
CONFIG_PAGE_SIZE_LESS_THAN_256KB=y
CONFIG_COMPAT_32BIT_TIME=y
CONFIG_LOCK_EVENT_COUNTS=y

#
# GCOV-based kernel profiling
#
# CONFIG_GCOV_KERNEL is not set
# end of GCOV-based kernel profiling
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=1
CONFIG_MODULE_SIG_FORMAT=y
CONFIG_MODULES=y
CONFIG_MODULE_FORCE_LOAD=y
# CONFIG_MODULE_UNLOAD is not set
# CONFIG_MODVERSIONS is not set
# CONFIG_MODULE_SRCVERSION_ALL is not set
CONFIG_MODULE_SIG=y
CONFIG_MODULE_SIG_FORCE=y
CONFIG_MODULE_SIG_ALL=y
# CONFIG_MODULE_SIG_SHA1 is not set
# CONFIG_MODULE_SIG_SHA224 is not set
# CONFIG_MODULE_SIG_SHA256 is not set
CONFIG_MODULE_SIG_SHA384=y
# CONFIG_MODULE_SIG_SHA512 is not set
CONFIG_MODULE_SIG_HASH="sha384"
# CONFIG_MODULE_COMPRESS_NONE is not set
# CONFIG_MODULE_COMPRESS_GZIP is not set
CONFIG_MODULE_COMPRESS_XZ=y
# CONFIG_MODULE_COMPRESS_ZSTD is not set
CONFIG_MODULE_DECOMPRESS=y
CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS=y
CONFIG_MODPROBE_PATH="/sbin/modprobe"
CONFIG_MODULES_TREE_LOOKUP=y
# CONFIG_BLOCK is not set
CONFIG_ASN1=y
CONFIG_UNINLINE_SPIN_UNLOCK=y
CONFIG_ARCH_USE_QUEUED_RWLOCKS=y
CONFIG_FREEZER=y

#
# Executable file formats
#
# CONFIG_BINFMT_ELF is not set
# CONFIG_BINFMT_SCRIPT is not set
# CONFIG_BINFMT_MISC is not set
CONFIG_COREDUMP=y
# end of Executable file formats

#
# Memory Management options
#

#
# SLAB allocator options
#
# CONFIG_SLAB is not set
# CONFIG_SLUB is not set
CONFIG_SLOB=y
# end of SLAB allocator options

# CONFIG_SHUFFLE_PAGE_ALLOCATOR is not set
# CONFIG_COMPAT_BRK is not set
CONFIG_FLATMEM=y
CONFIG_EXCLUSIVE_SYSTEM_RAM=y
CONFIG_SPLIT_PTLOCK_CPUS=4
# CONFIG_COMPACTION is not set
CONFIG_PAGE_REPORTING=y
# CONFIG_KSM is not set
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_NEED_PER_CPU_KM=y
# CONFIG_CMA is not set
CONFIG_PAGE_IDLE_FLAG=y
# CONFIG_IDLE_PAGE_TRACKING is not set
# CONFIG_VM_EVENT_COUNTERS is not set
# CONFIG_PERCPU_STATS is not set
CONFIG_GUP_TEST=y
CONFIG_USERFAULTFD=y
# CONFIG_LRU_GEN is not set

#
# Data Access Monitoring
#
CONFIG_DAMON=y
# CONFIG_DAMON_VADDR is not set
CONFIG_DAMON_PADDR=y
CONFIG_DAMON_SYSFS=y
CONFIG_DAMON_RECLAIM=y
# CONFIG_DAMON_LRU_SORT is not set
# end of Data Access Monitoring
# end of Memory Management options

CONFIG_NET=y
CONFIG_SKB_EXTENSIONS=y

#
# Networking options
#
# CONFIG_PACKET is not set
CONFIG_UNIX=m
CONFIG_UNIX_SCM=y
CONFIG_AF_UNIX_OOB=y
CONFIG_UNIX_DIAG=m
CONFIG_XDP_SOCKETS=y
# CONFIG_XDP_SOCKETS_DIAG is not set
# CONFIG_INET is not set
# CONFIG_NETWORK_SECMARK is not set
CONFIG_NET_PTP_CLASSIFY=y
# CONFIG_NETWORK_PHY_TIMESTAMPING is not set
# CONFIG_NETFILTER is not set
CONFIG_ATM=m
CONFIG_ATM_LANE=m
CONFIG_STP=y
CONFIG_BRIDGE=y
# CONFIG_BRIDGE_MRP is not set
CONFIG_BRIDGE_CFM=y
# CONFIG_VLAN_8021Q is not set
CONFIG_LLC=y
CONFIG_LLC2=m
# CONFIG_ATALK is not set
CONFIG_X25=y
CONFIG_LAPB=y
CONFIG_PHONET=y
CONFIG_IEEE802154=y
# CONFIG_IEEE802154_NL802154_EXPERIMENTAL is not set
CONFIG_IEEE802154_SOCKET=m
# CONFIG_MAC802154 is not set
CONFIG_NET_SCHED=y

#
# Queueing/Scheduling
#
CONFIG_NET_SCH_CBQ=m
# CONFIG_NET_SCH_HTB is not set
# CONFIG_NET_SCH_HFSC is not set
CONFIG_NET_SCH_ATM=m
CONFIG_NET_SCH_PRIO=y
CONFIG_NET_SCH_MULTIQ=y
CONFIG_NET_SCH_RED=y
CONFIG_NET_SCH_SFB=y
# CONFIG_NET_SCH_SFQ is not set
CONFIG_NET_SCH_TEQL=y
# CONFIG_NET_SCH_TBF is not set
CONFIG_NET_SCH_CBS=y
CONFIG_NET_SCH_ETF=y
CONFIG_NET_SCH_TAPRIO=m
CONFIG_NET_SCH_GRED=y
CONFIG_NET_SCH_DSMARK=y
CONFIG_NET_SCH_NETEM=y
CONFIG_NET_SCH_DRR=m
CONFIG_NET_SCH_MQPRIO=y
# CONFIG_NET_SCH_SKBPRIO is not set
# CONFIG_NET_SCH_CHOKE is not set
CONFIG_NET_SCH_QFQ=y
# CONFIG_NET_SCH_CODEL is not set
CONFIG_NET_SCH_FQ_CODEL=m
# CONFIG_NET_SCH_CAKE is not set
CONFIG_NET_SCH_FQ=m
# CONFIG_NET_SCH_HHF is not set
CONFIG_NET_SCH_PIE=m
CONFIG_NET_SCH_FQ_PIE=m
# CONFIG_NET_SCH_INGRESS is not set
# CONFIG_NET_SCH_PLUG is not set
CONFIG_NET_SCH_ETS=m
CONFIG_NET_SCH_DEFAULT=y
# CONFIG_DEFAULT_FQ is not set
# CONFIG_DEFAULT_FQ_CODEL is not set
CONFIG_DEFAULT_FQ_PIE=y
# CONFIG_DEFAULT_PFIFO_FAST is not set
CONFIG_DEFAULT_NET_SCH="fq_pie"

#
# Classification
#
CONFIG_NET_CLS=y
# CONFIG_NET_CLS_BASIC is not set
CONFIG_NET_CLS_TCINDEX=m
CONFIG_NET_CLS_FW=m
# CONFIG_NET_CLS_U32 is not set
CONFIG_NET_CLS_RSVP=m
CONFIG_NET_CLS_RSVP6=y
# CONFIG_NET_CLS_FLOW is not set
CONFIG_NET_CLS_CGROUP=m
# CONFIG_NET_CLS_BPF is not set
CONFIG_NET_CLS_FLOWER=m
CONFIG_NET_CLS_MATCHALL=y
# CONFIG_NET_EMATCH is not set
CONFIG_NET_CLS_ACT=y
# CONFIG_NET_ACT_POLICE is not set
CONFIG_NET_ACT_GACT=y
# CONFIG_GACT_PROB is not set
CONFIG_NET_ACT_MIRRED=m
CONFIG_NET_ACT_SAMPLE=m
CONFIG_NET_ACT_NAT=y
CONFIG_NET_ACT_PEDIT=y
CONFIG_NET_ACT_SIMP=y
# CONFIG_NET_ACT_SKBEDIT is not set
# CONFIG_NET_ACT_MPLS is not set
CONFIG_NET_ACT_VLAN=y
# CONFIG_NET_ACT_BPF is not set
# CONFIG_NET_ACT_SKBMOD is not set
CONFIG_NET_ACT_IFE=y
CONFIG_NET_ACT_TUNNEL_KEY=y
CONFIG_NET_ACT_GATE=y
# CONFIG_NET_IFE_SKBMARK is not set
CONFIG_NET_IFE_SKBPRIO=m
CONFIG_NET_IFE_SKBTCINDEX=y
CONFIG_NET_TC_SKB_EXT=y
CONFIG_NET_SCH_FIFO=y
CONFIG_DCB=y
# CONFIG_DNS_RESOLVER is not set
# CONFIG_BATMAN_ADV is not set
# CONFIG_VSOCKETS is not set
# CONFIG_NETLINK_DIAG is not set
# CONFIG_MPLS is not set
# CONFIG_NET_NSH is not set
CONFIG_HSR=m
CONFIG_QRTR=m
CONFIG_QRTR_SMD=m
# CONFIG_QRTR_TUN is not set
CONFIG_QRTR_MHI=m
# CONFIG_CGROUP_NET_PRIO is not set
CONFIG_CGROUP_NET_CLASSID=y
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_BQL=y

#
# Network testing
#
# end of Network testing
# end of Networking options

# CONFIG_HAMRADIO is not set
# CONFIG_CAN is not set
# CONFIG_BT is not set
CONFIG_MCTP=y
# CONFIG_WIRELESS is not set
CONFIG_RFKILL=m
CONFIG_RFKILL_LEDS=y
# CONFIG_RFKILL_INPUT is not set
# CONFIG_RFKILL_GPIO is not set
CONFIG_NET_9P=m
CONFIG_NET_9P_FD=m
CONFIG_NET_9P_VIRTIO=m
CONFIG_NET_9P_DEBUG=y
# CONFIG_CAIF is not set
CONFIG_NFC=m
# CONFIG_NFC_DIGITAL is not set
CONFIG_NFC_NCI=m
# CONFIG_NFC_NCI_UART is not set
CONFIG_NFC_HCI=m
# CONFIG_NFC_SHDLC is not set

#
# Near Field Communication (NFC) devices
#
# CONFIG_NFC_VIRTUAL_NCI is not set
CONFIG_NFC_FDP=m
CONFIG_NFC_FDP_I2C=m
CONFIG_NFC_PN533=m
CONFIG_NFC_PN533_USB=m
CONFIG_NFC_PN533_I2C=m
CONFIG_NFC_PN532_UART=m
CONFIG_NFC_MRVL=m
CONFIG_NFC_MRVL_USB=m
# CONFIG_NFC_MRVL_I2C is not set
# CONFIG_NFC_ST_NCI_I2C is not set
CONFIG_NFC_NXP_NCI=m
CONFIG_NFC_NXP_NCI_I2C=m
CONFIG_NFC_S3FWRN5=m
# CONFIG_NFC_S3FWRN5_I2C is not set
CONFIG_NFC_S3FWRN82_UART=m
# end of Near Field Communication (NFC) devices

CONFIG_PSAMPLE=m
CONFIG_NET_IFE=y
# CONFIG_LWTUNNEL is not set
CONFIG_NET_SOCK_MSG=y
CONFIG_PAGE_POOL=y
# CONFIG_PAGE_POOL_STATS is not set
# CONFIG_FAILOVER is not set
CONFIG_ETHTOOL_NETLINK=y

#
# Device Drivers
#
CONFIG_HAVE_PCI=y
CONFIG_PCI=y
CONFIG_PCI_DOMAINS=y
CONFIG_PCI_DOMAINS_GENERIC=y
CONFIG_PCIEPORTBUS=y
CONFIG_HOTPLUG_PCI_PCIE=y
CONFIG_PCIEAER=y
# CONFIG_PCIEAER_INJECT is not set
CONFIG_PCIE_ECRC=y
CONFIG_PCIEASPM=y
CONFIG_PCIEASPM_DEFAULT=y
# CONFIG_PCIEASPM_POWERSAVE is not set
# CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
# CONFIG_PCIEASPM_PERFORMANCE is not set
CONFIG_PCIE_DPC=y
# CONFIG_PCIE_PTM is not set
CONFIG_PCI_MSI=y
CONFIG_PCI_MSI_IRQ_DOMAIN=y
# CONFIG_PCI_QUIRKS is not set
# CONFIG_PCI_DEBUG is not set
# CONFIG_PCI_STUB is not set
CONFIG_PCI_ATS=y
CONFIG_PCI_DOE=y
CONFIG_PCI_ECAM=y
# CONFIG_PCI_IOV is not set
CONFIG_PCI_PRI=y
# CONFIG_PCI_PASID is not set
# CONFIG_PCIE_BUS_TUNE_OFF is not set
# CONFIG_PCIE_BUS_DEFAULT is not set
CONFIG_PCIE_BUS_SAFE=y
# CONFIG_PCIE_BUS_PERFORMANCE is not set
# CONFIG_PCIE_BUS_PEER2PEER is not set
CONFIG_VGA_ARB=y
CONFIG_VGA_ARB_MAX_GPUS=16
CONFIG_HOTPLUG_PCI=y
# CONFIG_HOTPLUG_PCI_CPCI is not set
# CONFIG_HOTPLUG_PCI_SHPC is not set

#
# PCI controller drivers
#
# CONFIG_PCI_AARDVARK is not set
# CONFIG_PCIE_XILINX_NWL is not set
# CONFIG_PCI_FTPCI100 is not set
CONFIG_PCI_TEGRA=y
CONFIG_PCIE_RCAR_HOST=y
CONFIG_PCI_HOST_COMMON=y
# CONFIG_PCI_HOST_GENERIC is not set
CONFIG_PCIE_XILINX=y
CONFIG_PCIE_XILINX_CPM=y
# CONFIG_PCI_XGENE is not set
# CONFIG_PCI_V3_SEMI is not set
# CONFIG_PCI_VERSATILE is not set
CONFIG_PCIE_ALTERA=m
CONFIG_PCIE_ALTERA_MSI=m
CONFIG_PCI_HOST_THUNDER_PEM=y
# CONFIG_PCI_HOST_THUNDER_ECAM is not set
# CONFIG_PCIE_ROCKCHIP_HOST is not set
CONFIG_PCIE_MEDIATEK=y
CONFIG_PCIE_MEDIATEK_GEN3=m
# CONFIG_PCIE_BRCMSTB is not set
# CONFIG_PCIE_MICROCHIP_HOST is not set
CONFIG_PCIE_APPLE_MSI_DOORBELL_ADDR=0xfffff000
CONFIG_PCIE_APPLE=m
CONFIG_PCIE_MT7621=y

#
# DesignWare PCI Core Support
#
CONFIG_PCIE_DW=y
CONFIG_PCIE_DW_HOST=y
CONFIG_PCIE_DW_PLAT=y
CONFIG_PCIE_DW_PLAT_HOST=y
CONFIG_PCI_EXYNOS=m
CONFIG_PCI_IMX6=y
CONFIG_PCIE_SPEAR13XX=y
CONFIG_PCI_KEYSTONE=y
CONFIG_PCI_KEYSTONE_HOST=y
# CONFIG_PCI_LAYERSCAPE is not set
CONFIG_PCI_HISI=y
CONFIG_PCIE_QCOM=y
CONFIG_PCIE_ARMADA_8K=y
# CONFIG_PCIE_ARTPEC6_HOST is not set
CONFIG_PCIE_ROCKCHIP_DW_HOST=y
# CONFIG_PCIE_INTEL_GW is not set
CONFIG_PCIE_KEEMBAY=y
CONFIG_PCIE_KEEMBAY_HOST=y
CONFIG_PCIE_KIRIN=y
CONFIG_PCIE_HISI_STB=y
CONFIG_PCI_MESON=y
CONFIG_PCIE_TEGRA194=m
CONFIG_PCIE_TEGRA194_HOST=m
# CONFIG_PCIE_VISCONTI_HOST is not set
CONFIG_PCIE_UNIPHIER=y
# CONFIG_PCIE_AL is not set
# CONFIG_PCIE_FU740 is not set
# end of DesignWare PCI Core Support

#
# Mobiveil PCIe Core Support
#
CONFIG_PCIE_MOBIVEIL=y
CONFIG_PCIE_MOBIVEIL_HOST=y
CONFIG_PCIE_MOBIVEIL_PLAT=y
CONFIG_PCIE_LAYERSCAPE_GEN4=y
# end of Mobiveil PCIe Core Support

#
# Cadence PCIe controllers support
#
CONFIG_PCIE_CADENCE=y
CONFIG_PCIE_CADENCE_HOST=y
CONFIG_PCIE_CADENCE_PLAT=y
CONFIG_PCIE_CADENCE_PLAT_HOST=y
# CONFIG_PCI_J721E_HOST is not set
# end of Cadence PCIe controllers support
# end of PCI controller drivers

#
# PCI Endpoint
#
# CONFIG_PCI_ENDPOINT is not set
# end of PCI Endpoint

#
# PCI switch controller drivers
#
CONFIG_PCI_SW_SWITCHTEC=m
# end of PCI switch controller drivers

CONFIG_CXL_BUS=m
CONFIG_CXL_PCI=m
# CONFIG_CXL_MEM_RAW_COMMANDS is not set
CONFIG_CXL_MEM=m
CONFIG_CXL_PORT=m
# CONFIG_PCCARD is not set
CONFIG_RAPIDIO=m
CONFIG_RAPIDIO_TSI721=m
CONFIG_RAPIDIO_DISC_TIMEOUT=30
CONFIG_RAPIDIO_ENABLE_RX_TX_PORTS=y
# CONFIG_RAPIDIO_DEBUG is not set
CONFIG_RAPIDIO_ENUM_BASIC=m
# CONFIG_RAPIDIO_CHMAN is not set
# CONFIG_RAPIDIO_MPORT_CDEV is not set

#
# RapidIO Switch drivers
#
CONFIG_RAPIDIO_CPS_XX=m
CONFIG_RAPIDIO_CPS_GEN2=m
CONFIG_RAPIDIO_RXS_GEN3=m
# end of RapidIO Switch drivers

#
# Generic Driver Options
#
CONFIG_AUXILIARY_BUS=y
# CONFIG_UEVENT_HELPER is not set
CONFIG_DEVTMPFS=y
CONFIG_DEVTMPFS_MOUNT=y
CONFIG_DEVTMPFS_SAFE=y
# CONFIG_STANDALONE is not set
CONFIG_PREVENT_FIRMWARE_BUILD=y

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_FW_LOADER_PAGED_BUF=y
CONFIG_FW_LOADER_SYSFS=y
CONFIG_EXTRA_FIRMWARE=""
CONFIG_FW_LOADER_USER_HELPER=y
# CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
# CONFIG_FW_LOADER_COMPRESS is not set
CONFIG_FW_UPLOAD=y
# end of Firmware loader

CONFIG_WANT_DEV_COREDUMP=y
CONFIG_ALLOW_DEV_COREDUMP=y
CONFIG_DEV_COREDUMP=y
CONFIG_DEBUG_DRIVER=y
# CONFIG_DEBUG_DEVRES is not set
# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
# CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
CONFIG_GENERIC_CPU_DEVICES=y
CONFIG_SOC_BUS=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=y
CONFIG_REGMAP_SLIMBUS=y
CONFIG_REGMAP_SPMI=m
CONFIG_REGMAP_MMIO=y
CONFIG_REGMAP_IRQ=y
CONFIG_REGMAP_SCCB=y
CONFIG_DMA_SHARED_BUFFER=y
CONFIG_DMA_FENCE_TRACE=y
# end of Generic Driver Options

#
# Bus devices
#
# CONFIG_ARM_INTEGRATOR_LM is not set
CONFIG_BT1_APB=y
CONFIG_BT1_AXI=y
# CONFIG_HISILICON_LPC is not set
CONFIG_INTEL_IXP4XX_EB=y
# CONFIG_QCOM_EBI2 is not set
CONFIG_MHI_BUS=m
# CONFIG_MHI_BUS_DEBUG is not set
CONFIG_MHI_BUS_PCI_GENERIC=m
CONFIG_MHI_BUS_EP=m
# end of Bus devices

CONFIG_CONNECTOR=m

#
# Firmware Drivers
#

#
# ARM System Control and Management Interface Protocol
#
CONFIG_ARM_SCMI_PROTOCOL=m
CONFIG_ARM_SCMI_HAVE_TRANSPORT=y
CONFIG_ARM_SCMI_HAVE_SHMEM=y
CONFIG_ARM_SCMI_TRANSPORT_MAILBOX=y
# CONFIG_ARM_SCMI_TRANSPORT_VIRTIO is not set
CONFIG_ARM_SCMI_POWER_DOMAIN=y
CONFIG_ARM_SCMI_POWER_CONTROL=m
# end of ARM System Control and Management Interface Protocol

CONFIG_ARM_SCPI_PROTOCOL=y
CONFIG_ARM_SCPI_POWER_DOMAIN=m
CONFIG_FIRMWARE_MEMMAP=y
CONFIG_QCOM_SCM=y
CONFIG_QCOM_SCM_DOWNLOAD_MODE_DEFAULT=y
# CONFIG_TURRIS_MOX_RWTM is not set
CONFIG_BCM47XX_NVRAM=y
CONFIG_BCM47XX_SPROM=y
# CONFIG_TEE_BNXT_FW is not set
# CONFIG_GOOGLE_FIRMWARE is not set

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

# CONFIG_GNSS is not set
# CONFIG_MTD is not set
CONFIG_DTC=y
CONFIG_OF=y
# CONFIG_OF_UNITTEST is not set
CONFIG_OF_ALL_DTBS=y
CONFIG_OF_FLATTREE=y
CONFIG_OF_EARLY_FLATTREE=y
CONFIG_OF_KOBJ=y
CONFIG_OF_DYNAMIC=y
CONFIG_OF_ADDRESS=y
CONFIG_OF_IRQ=y
CONFIG_OF_RESERVED_MEM=y
# CONFIG_OF_OVERLAY is not set
CONFIG_PARPORT=y
CONFIG_PARPORT_PC=y
# CONFIG_PARPORT_SERIAL is not set
CONFIG_PARPORT_PC_FIFO=y
CONFIG_PARPORT_AX88796=y
CONFIG_PARPORT_1284=y
CONFIG_PARPORT_NOT_PC=y

#
# NVME Support
#
# end of NVME Support

#
# Misc devices
#
CONFIG_SENSORS_LIS3LV02D=y
CONFIG_AD525X_DPOT=m
CONFIG_AD525X_DPOT_I2C=m
CONFIG_DUMMY_IRQ=m
CONFIG_PHANTOM=m
CONFIG_TIFM_CORE=m
CONFIG_TIFM_7XX1=m
CONFIG_ICS932S401=m
CONFIG_ATMEL_SSC=y
CONFIG_ENCLOSURE_SERVICES=m
CONFIG_HI6421V600_IRQ=m
# CONFIG_HP_ILO is not set
CONFIG_QCOM_COINCELL=m
# CONFIG_QCOM_FASTRPC is not set
CONFIG_APDS9802ALS=m
CONFIG_ISL29003=y
CONFIG_ISL29020=m
CONFIG_SENSORS_TSL2550=m
CONFIG_SENSORS_BH1770=y
# CONFIG_SENSORS_APDS990X is not set
# CONFIG_HMC6352 is not set
CONFIG_DS1682=y
# CONFIG_PCH_PHUB is not set
# CONFIG_SRAM is not set
# CONFIG_DW_XDATA_PCIE is not set
CONFIG_PCI_ENDPOINT_TEST=y
CONFIG_XILINX_SDFEC=y
CONFIG_MISC_RTSX=y
# CONFIG_HISI_HIKEY_USB is not set
# CONFIG_OPEN_DICE is not set
CONFIG_VCPU_STALL_DETECTOR=y
CONFIG_C2PORT=y

#
# EEPROM support
#
CONFIG_EEPROM_AT24=y
# CONFIG_EEPROM_LEGACY is not set
CONFIG_EEPROM_MAX6875=y
CONFIG_EEPROM_93CX6=m
CONFIG_EEPROM_IDT_89HPESX=m
CONFIG_EEPROM_EE1004=y
# end of EEPROM support

CONFIG_CB710_CORE=m
CONFIG_CB710_DEBUG=y
CONFIG_CB710_DEBUG_ASSUMPTIONS=y

#
# Texas Instruments shared transport line discipline
#
CONFIG_TI_ST=m
# end of Texas Instruments shared transport line discipline

CONFIG_SENSORS_LIS3_I2C=y
# CONFIG_ALTERA_STAPL is not set
CONFIG_ECHO=y
CONFIG_BCM_VK=y
CONFIG_BCM_VK_TTY=y
# CONFIG_MISC_ALCOR_PCI is not set
CONFIG_MISC_RTSX_PCI=y
# CONFIG_MISC_RTSX_USB is not set
CONFIG_HABANA_AI=y
CONFIG_UACCE=m
# CONFIG_PVPANIC is not set
CONFIG_GP_PCI1XXXX=y
# end of Misc devices

#
# SCSI device support
#
# end of SCSI device support

CONFIG_FUSION=y
CONFIG_FUSION_MAX_SGE=128
# CONFIG_FUSION_LOGGING is not set

#
# IEEE 1394 (FireWire) support
#
CONFIG_FIREWIRE=m
CONFIG_FIREWIRE_OHCI=m
CONFIG_FIREWIRE_NOSY=m
# end of IEEE 1394 (FireWire) support

# CONFIG_NETDEVICES is not set

#
# Input device support
#
CONFIG_INPUT=y
CONFIG_INPUT_LEDS=y
CONFIG_INPUT_FF_MEMLESS=y
CONFIG_INPUT_SPARSEKMAP=m
CONFIG_INPUT_MATRIXKMAP=m

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=m
# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
# CONFIG_INPUT_JOYDEV is not set
CONFIG_INPUT_EVDEV=m
CONFIG_INPUT_EVBUG=m

#
# Input Device Drivers
#
# CONFIG_INPUT_KEYBOARD is not set
CONFIG_INPUT_MOUSE=y
CONFIG_MOUSE_PS2=m
# CONFIG_MOUSE_PS2_ALPS is not set
CONFIG_MOUSE_PS2_BYD=y
# CONFIG_MOUSE_PS2_LOGIPS2PP is not set
# CONFIG_MOUSE_PS2_SYNAPTICS is not set
# CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS is not set
# CONFIG_MOUSE_PS2_CYPRESS is not set
# CONFIG_MOUSE_PS2_TRACKPOINT is not set
# CONFIG_MOUSE_PS2_ELANTECH is not set
# CONFIG_MOUSE_PS2_SENTELIC is not set
# CONFIG_MOUSE_PS2_TOUCHKIT is not set
CONFIG_MOUSE_PS2_FOCALTECH=y
CONFIG_MOUSE_SERIAL=m
CONFIG_MOUSE_APPLETOUCH=y
CONFIG_MOUSE_BCM5974=m
CONFIG_MOUSE_CYAPA=m
CONFIG_MOUSE_ELAN_I2C=m
# CONFIG_MOUSE_ELAN_I2C_I2C is not set
# CONFIG_MOUSE_ELAN_I2C_SMBUS is not set
# CONFIG_MOUSE_VSXXXAA is not set
CONFIG_MOUSE_GPIO=y
CONFIG_MOUSE_SYNAPTICS_I2C=m
CONFIG_MOUSE_SYNAPTICS_USB=m
# CONFIG_INPUT_JOYSTICK is not set
CONFIG_INPUT_TABLET=y
# CONFIG_TABLET_USB_ACECAD is not set
CONFIG_TABLET_USB_AIPTEK=m
CONFIG_TABLET_USB_HANWANG=m
CONFIG_TABLET_USB_KBTAB=y
# CONFIG_TABLET_USB_PEGASUS is not set
# CONFIG_TABLET_SERIAL_WACOM4 is not set
# CONFIG_INPUT_TOUCHSCREEN is not set
CONFIG_INPUT_MISC=y
CONFIG_INPUT_88PM80X_ONKEY=m
CONFIG_INPUT_AD714X=y
CONFIG_INPUT_AD714X_I2C=y
CONFIG_INPUT_ATC260X_ONKEY=y
CONFIG_INPUT_ATMEL_CAPTOUCH=y
CONFIG_INPUT_BMA150=m
CONFIG_INPUT_E3X0_BUTTON=m
CONFIG_INPUT_PM8XXX_VIBRATOR=y
# CONFIG_INPUT_PMIC8XXX_PWRKEY is not set
CONFIG_INPUT_MAX77693_HAPTIC=m
# CONFIG_INPUT_MC13783_PWRBUTTON is not set
CONFIG_INPUT_MMA8450=y
# CONFIG_INPUT_GPIO_BEEPER is not set
CONFIG_INPUT_GPIO_DECODER=m
CONFIG_INPUT_GPIO_VIBRA=m
# CONFIG_INPUT_ATI_REMOTE2 is not set
CONFIG_INPUT_KEYSPAN_REMOTE=y
# CONFIG_INPUT_KXTJ9 is not set
CONFIG_INPUT_POWERMATE=y
# CONFIG_INPUT_YEALINK is not set
CONFIG_INPUT_CM109=m
CONFIG_INPUT_REGULATOR_HAPTIC=m
CONFIG_INPUT_TPS65218_PWRBUTTON=y
CONFIG_INPUT_AXP20X_PEK=y
# CONFIG_INPUT_TWL4030_PWRBUTTON is not set
# CONFIG_INPUT_TWL4030_VIBRA is not set
# CONFIG_INPUT_UINPUT is not set
CONFIG_INPUT_PALMAS_PWRBUTTON=m
CONFIG_INPUT_PCF50633_PMU=m
CONFIG_INPUT_PCF8574=y
# CONFIG_INPUT_PWM_BEEPER is not set
# CONFIG_INPUT_PWM_VIBRA is not set
CONFIG_INPUT_RK805_PWRKEY=m
CONFIG_INPUT_GPIO_ROTARY_ENCODER=y
CONFIG_INPUT_DA7280_HAPTICS=y
CONFIG_INPUT_DA9052_ONKEY=m
# CONFIG_INPUT_ADXL34X is not set
CONFIG_INPUT_IBM_PANEL=m
CONFIG_INPUT_IMS_PCU=m
# CONFIG_INPUT_IQS269A is not set
CONFIG_INPUT_IQS626A=m
CONFIG_INPUT_IQS7222=y
CONFIG_INPUT_CMA3000=y
CONFIG_INPUT_CMA3000_I2C=y
CONFIG_INPUT_DRV260X_HAPTICS=m
CONFIG_INPUT_DRV2665_HAPTICS=m
# CONFIG_INPUT_DRV2667_HAPTICS is not set
CONFIG_INPUT_HISI_POWERKEY=m
CONFIG_INPUT_RAVE_SP_PWRBUTTON=m
CONFIG_INPUT_SC27XX_VIBRA=m
CONFIG_INPUT_RT5120_PWRKEY=y
CONFIG_INPUT_STPMIC1_ONKEY=m
CONFIG_RMI4_CORE=y
CONFIG_RMI4_I2C=y
CONFIG_RMI4_SMB=m
CONFIG_RMI4_F03=y
CONFIG_RMI4_F03_SERIO=y
CONFIG_RMI4_2D_SENSOR=y
CONFIG_RMI4_F11=y
CONFIG_RMI4_F12=y
CONFIG_RMI4_F30=y
# CONFIG_RMI4_F34 is not set
# CONFIG_RMI4_F3A is not set
CONFIG_RMI4_F54=y
CONFIG_RMI4_F55=y

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_SERIO_SERPORT=m
CONFIG_SERIO_PARKBD=m
# CONFIG_SERIO_PCIPS2 is not set
CONFIG_SERIO_LIBPS2=m
# CONFIG_SERIO_RAW is not set
CONFIG_SERIO_ALTERA_PS2=m
CONFIG_SERIO_PS2MULT=y
CONFIG_SERIO_ARC_PS2=y
CONFIG_SERIO_APBPS2=y
CONFIG_SERIO_OLPC_APSP=y
CONFIG_SERIO_SUN4I_PS2=m
CONFIG_SERIO_GPIO_PS2=y
CONFIG_USERIO=y
# CONFIG_GAMEPORT is not set
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
CONFIG_TTY=y
# CONFIG_VT is not set
# CONFIG_UNIX98_PTYS is not set
CONFIG_LEGACY_PTYS=y
CONFIG_LEGACY_PTY_COUNT=256
# CONFIG_LDISC_AUTOLOAD is not set

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250=y
# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
CONFIG_SERIAL_8250_16550A_VARIANTS=y
# CONFIG_SERIAL_8250_FINTEK is not set
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_SERIAL_8250_PCI=m
CONFIG_SERIAL_8250_EXAR=m
# CONFIG_SERIAL_8250_MEN_MCB is not set
CONFIG_SERIAL_8250_NR_UARTS=4
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
# CONFIG_SERIAL_8250_EXTENDED is not set
# CONFIG_SERIAL_8250_ASPEED_VUART is not set
CONFIG_SERIAL_8250_DWLIB=y
# CONFIG_SERIAL_8250_FSL is not set
# CONFIG_SERIAL_8250_DW is not set
CONFIG_SERIAL_8250_EM=y
# CONFIG_SERIAL_8250_IOC3 is not set
CONFIG_SERIAL_8250_RT288X=y
CONFIG_SERIAL_8250_OMAP=m
# CONFIG_SERIAL_8250_LPC18XX is not set
CONFIG_SERIAL_8250_MT6577=m
# CONFIG_SERIAL_8250_UNIPHIER is not set
CONFIG_SERIAL_8250_INGENIC=y
CONFIG_SERIAL_8250_LPSS=m
CONFIG_SERIAL_8250_MID=m
# CONFIG_SERIAL_8250_PERICOM is not set
CONFIG_SERIAL_8250_PXA=m
CONFIG_SERIAL_8250_TEGRA=y
CONFIG_SERIAL_8250_BCM7271=y
# CONFIG_SERIAL_OF_PLATFORM is not set

#
# Non-8250 serial port support
#
# CONFIG_SERIAL_AMBA_PL010 is not set
CONFIG_SERIAL_ATMEL=y
# CONFIG_SERIAL_ATMEL_CONSOLE is not set
# CONFIG_SERIAL_ATMEL_PDC is not set
# CONFIG_SERIAL_ATMEL_TTYAT is not set
# CONFIG_SERIAL_MESON is not set
# CONFIG_SERIAL_CLPS711X is not set
CONFIG_SERIAL_SAMSUNG=y
CONFIG_SERIAL_SAMSUNG_UARTS_4=y
CONFIG_SERIAL_SAMSUNG_UARTS=4
CONFIG_SERIAL_SAMSUNG_CONSOLE=y
CONFIG_SERIAL_TEGRA=m
CONFIG_SERIAL_TEGRA_TCU=y
# CONFIG_SERIAL_TEGRA_TCU_CONSOLE is not set
# CONFIG_SERIAL_IMX is not set
# CONFIG_SERIAL_IMX_EARLYCON is not set
CONFIG_SERIAL_UARTLITE=y
# CONFIG_SERIAL_UARTLITE_CONSOLE is not set
CONFIG_SERIAL_UARTLITE_NR_UARTS=1
# CONFIG_SERIAL_SH_SCI is not set
CONFIG_SERIAL_HS_LPC32XX=y
CONFIG_SERIAL_HS_LPC32XX_CONSOLE=y
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
CONFIG_SERIAL_ICOM=y
# CONFIG_SERIAL_JSM is not set
# CONFIG_SERIAL_MSM is not set
# CONFIG_SERIAL_QCOM_GENI is not set
# CONFIG_SERIAL_VT8500 is not set
# CONFIG_SERIAL_OMAP is not set
# CONFIG_SERIAL_SIFIVE is not set
CONFIG_SERIAL_LANTIQ=y
CONFIG_SERIAL_LANTIQ_CONSOLE=y
CONFIG_SERIAL_SCCNXP=y
# CONFIG_SERIAL_SCCNXP_CONSOLE is not set
CONFIG_SERIAL_SC16IS7XX_CORE=m
CONFIG_SERIAL_SC16IS7XX=m
CONFIG_SERIAL_SC16IS7XX_I2C=y
CONFIG_SERIAL_TIMBERDALE=y
CONFIG_SERIAL_BCM63XX=y
# CONFIG_SERIAL_BCM63XX_CONSOLE is not set
CONFIG_SERIAL_ALTERA_JTAGUART=y
CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE=y
CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE_BYPASS=y
CONFIG_SERIAL_ALTERA_UART=m
CONFIG_SERIAL_ALTERA_UART_MAXPORTS=4
CONFIG_SERIAL_ALTERA_UART_BAUDRATE=115200
CONFIG_SERIAL_PCH_UART=y
CONFIG_SERIAL_PCH_UART_CONSOLE=y
CONFIG_SERIAL_MXS_AUART=y
CONFIG_SERIAL_MXS_AUART_CONSOLE=y
CONFIG_SERIAL_XILINX_PS_UART=m
CONFIG_SERIAL_MPS2_UART_CONSOLE=y
CONFIG_SERIAL_MPS2_UART=y
CONFIG_SERIAL_ARC=y
# CONFIG_SERIAL_ARC_CONSOLE is not set
CONFIG_SERIAL_ARC_NR_PORTS=1
# CONFIG_SERIAL_RP2 is not set
CONFIG_SERIAL_FSL_LPUART=m
CONFIG_SERIAL_FSL_LPUART_CONSOLE=y
CONFIG_SERIAL_CONEXANT_DIGICOLOR=m
# CONFIG_SERIAL_ST_ASC is not set
# CONFIG_SERIAL_MEN_Z135 is not set
CONFIG_SERIAL_SPRD=m
# CONFIG_SERIAL_STM32 is not set
# CONFIG_SERIAL_MVEBU_UART is not set
CONFIG_SERIAL_OWL=y
CONFIG_SERIAL_OWL_CONSOLE=y
CONFIG_SERIAL_RDA=y
# CONFIG_SERIAL_RDA_CONSOLE is not set
# CONFIG_SERIAL_MILBEAUT_USIO is not set
CONFIG_SERIAL_LITEUART=y
CONFIG_SERIAL_LITEUART_MAX_PORTS=1
CONFIG_SERIAL_LITEUART_CONSOLE=y
CONFIG_SERIAL_SUNPLUS=m
# CONFIG_SERIAL_SUNPLUS_CONSOLE is not set
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
CONFIG_SERIAL_NONSTANDARD=y
CONFIG_MOXA_INTELLIO=y
CONFIG_MOXA_SMARTIO=m
CONFIG_SYNCLINK_GT=y
CONFIG_N_HDLC=m
CONFIG_GOLDFISH_TTY=m
CONFIG_N_GSM=m
CONFIG_NOZOMI=y
CONFIG_NULL_TTY=y
CONFIG_HVC_DRIVER=y
# CONFIG_RPMSG_TTY is not set
CONFIG_SERIAL_DEV_BUS=y
# CONFIG_SERIAL_DEV_CTRL_TTYPORT is not set
# CONFIG_TTY_PRINTK is not set
CONFIG_PRINTER=m
# CONFIG_LP_CONSOLE is not set
CONFIG_PPDEV=m
CONFIG_VIRTIO_CONSOLE=y
CONFIG_IPMI_HANDLER=y
CONFIG_IPMI_PLAT_DATA=y
# CONFIG_IPMI_PANIC_EVENT is not set
CONFIG_IPMI_DEVICE_INTERFACE=m
CONFIG_IPMI_SI=y
CONFIG_IPMI_SSIF=y
CONFIG_IPMI_IPMB=m
CONFIG_IPMI_WATCHDOG=y
# CONFIG_IPMI_POWEROFF is not set
CONFIG_IPMI_KCS_BMC=m
CONFIG_ASPEED_KCS_IPMI_BMC=m
CONFIG_NPCM7XX_KCS_IPMI_BMC=m
# CONFIG_IPMI_KCS_BMC_CDEV_IPMI is not set
CONFIG_IPMI_KCS_BMC_SERIO=m
CONFIG_ASPEED_BT_IPMI_BMC=y
CONFIG_IPMB_DEVICE_INTERFACE=m
# CONFIG_HW_RANDOM is not set
CONFIG_APPLICOM=y
# CONFIG_DEVMEM is not set
CONFIG_DEVPORT=y
CONFIG_TCG_TPM=m
CONFIG_TCG_TIS_CORE=m
CONFIG_TCG_TIS=m
# CONFIG_TCG_TIS_I2C is not set
CONFIG_TCG_TIS_SYNQUACER=m
# CONFIG_TCG_TIS_I2C_CR50 is not set
# CONFIG_TCG_TIS_I2C_ATMEL is not set
CONFIG_TCG_TIS_I2C_INFINEON=m
CONFIG_TCG_TIS_I2C_NUVOTON=m
# CONFIG_TCG_VTPM_PROXY is not set
# CONFIG_TCG_TIS_ST33ZP24_I2C is not set
CONFIG_XILLYBUS_CLASS=y
CONFIG_XILLYBUS=y
CONFIG_XILLYBUS_PCIE=m
CONFIG_XILLYBUS_OF=m
CONFIG_XILLYUSB=m
CONFIG_RANDOM_TRUST_CPU=y
# CONFIG_RANDOM_TRUST_BOOTLOADER is not set
# end of Character devices

#
# I2C support
#
CONFIG_I2C=y
CONFIG_I2C_BOARDINFO=y
# CONFIG_I2C_COMPAT is not set
CONFIG_I2C_CHARDEV=y
CONFIG_I2C_MUX=y

#
# Multiplexer I2C Chip support
#
CONFIG_I2C_ARB_GPIO_CHALLENGE=y
CONFIG_I2C_MUX_GPIO=y
CONFIG_I2C_MUX_GPMUX=m
# CONFIG_I2C_MUX_LTC4306 is not set
# CONFIG_I2C_MUX_PCA9541 is not set
# CONFIG_I2C_MUX_PCA954x is not set
CONFIG_I2C_MUX_PINCTRL=m
CONFIG_I2C_MUX_REG=m
CONFIG_I2C_DEMUX_PINCTRL=y
# CONFIG_I2C_MUX_MLXCPLD is not set
# end of Multiplexer I2C Chip support

CONFIG_I2C_HELPER_AUTO=y
CONFIG_I2C_SMBUS=y
CONFIG_I2C_ALGOBIT=y
CONFIG_I2C_ALGOPCA=m

#
# I2C Hardware Bus support
#

#
# PC SMBus host controller drivers
#
CONFIG_I2C_CCGX_UCSI=m
CONFIG_I2C_ALI1535=m
CONFIG_I2C_ALI1563=m
CONFIG_I2C_ALI15X3=y
# CONFIG_I2C_AMD756 is not set
CONFIG_I2C_AMD8111=y
CONFIG_I2C_HIX5HD2=y
# CONFIG_I2C_I801 is not set
# CONFIG_I2C_ISCH is not set
CONFIG_I2C_PIIX4=y
CONFIG_I2C_NFORCE2=m
CONFIG_I2C_NVIDIA_GPU=m
# CONFIG_I2C_SIS5595 is not set
# CONFIG_I2C_SIS630 is not set
CONFIG_I2C_SIS96X=y
CONFIG_I2C_VIA=y
CONFIG_I2C_VIAPRO=y

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
CONFIG_I2C_ALTERA=m
CONFIG_I2C_ASPEED=m
# CONFIG_I2C_AT91 is not set
# CONFIG_I2C_AXXIA is not set
CONFIG_I2C_BCM2835=m
CONFIG_I2C_BCM_IPROC=m
CONFIG_I2C_BCM_KONA=m
CONFIG_I2C_BRCMSTB=m
CONFIG_I2C_CADENCE=y
CONFIG_I2C_CBUS_GPIO=m
CONFIG_I2C_DAVINCI=m
CONFIG_I2C_DESIGNWARE_CORE=m
# CONFIG_I2C_DESIGNWARE_SLAVE is not set
# CONFIG_I2C_DESIGNWARE_PLATFORM is not set
CONFIG_I2C_DESIGNWARE_PCI=m
CONFIG_I2C_DIGICOLOR=m
# CONFIG_I2C_EG20T is not set
CONFIG_I2C_EMEV2=m
CONFIG_I2C_EXYNOS5=m
CONFIG_I2C_GPIO=m
# CONFIG_I2C_GPIO_FAULT_INJECTOR is not set
# CONFIG_I2C_HIGHLANDER is not set
CONFIG_I2C_HISI=y
CONFIG_I2C_IMG=y
CONFIG_I2C_IMX=m
CONFIG_I2C_IMX_LPI2C=y
CONFIG_I2C_IOP3XX=y
# CONFIG_I2C_JZ4780 is not set
CONFIG_I2C_LPC2K=y
# CONFIG_I2C_MESON is not set
CONFIG_I2C_MICROCHIP_CORE=y
CONFIG_I2C_MT65XX=m
CONFIG_I2C_MT7621=y
CONFIG_I2C_MV64XXX=m
# CONFIG_I2C_MXS is not set
CONFIG_I2C_NPCM=y
# CONFIG_I2C_OCORES is not set
CONFIG_I2C_OMAP=m
CONFIG_I2C_OWL=m
CONFIG_I2C_APPLE=y
CONFIG_I2C_PCA_PLATFORM=m
CONFIG_I2C_PNX=m
CONFIG_I2C_PXA=y
CONFIG_I2C_PXA_SLAVE=y
CONFIG_I2C_QCOM_CCI=m
# CONFIG_I2C_QCOM_GENI is not set
CONFIG_I2C_QUP=m
# CONFIG_I2C_RIIC is not set
CONFIG_I2C_RK3X=m
CONFIG_I2C_RZV2M=y
CONFIG_I2C_S3C2410=y
CONFIG_I2C_SH_MOBILE=m
CONFIG_I2C_SIMTEC=m
CONFIG_I2C_SPRD=y
CONFIG_I2C_ST=m
CONFIG_I2C_STM32F4=m
# CONFIG_I2C_STM32F7 is not set
# CONFIG_I2C_SUN6I_P2WI is not set
CONFIG_I2C_SYNQUACER=y
# CONFIG_I2C_TEGRA_BPMP is not set
# CONFIG_I2C_UNIPHIER is not set
CONFIG_I2C_UNIPHIER_F=m
CONFIG_I2C_VERSATILE=y
CONFIG_I2C_WMT=y
CONFIG_I2C_XILINX=m
CONFIG_I2C_XLP9XX=m
CONFIG_I2C_RCAR=y

#
# External I2C/SMBus adapter drivers
#
CONFIG_I2C_DIOLAN_U2C=y
# CONFIG_I2C_DLN2 is not set
CONFIG_I2C_CP2615=m
# CONFIG_I2C_PARPORT is not set
CONFIG_I2C_PCI1XXXX=m
CONFIG_I2C_ROBOTFUZZ_OSIF=m
CONFIG_I2C_TAOS_EVM=m
# CONFIG_I2C_TINY_USB is not set
CONFIG_I2C_VIPERBOARD=m

#
# Other I2C/SMBus bus drivers
#
CONFIG_I2C_MLXCPLD=y
# CONFIG_I2C_VIRTIO is not set
# end of I2C Hardware Bus support

CONFIG_I2C_STUB=m
CONFIG_I2C_SLAVE=y
CONFIG_I2C_SLAVE_EEPROM=y
# CONFIG_I2C_SLAVE_TESTUNIT is not set
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
CONFIG_I2C_DEBUG_BUS=y
# end of I2C support

# CONFIG_I3C is not set
# CONFIG_SPI is not set
CONFIG_SPMI=m
CONFIG_SPMI_HISI3670=m
CONFIG_SPMI_MSM_PMIC_ARB=m
CONFIG_SPMI_MTK_PMIF=m
# CONFIG_HSI is not set
CONFIG_PPS=y
# CONFIG_PPS_DEBUG is not set
# CONFIG_NTP_PPS is not set

#
# PPS clients support
#
CONFIG_PPS_CLIENT_KTIMER=y
CONFIG_PPS_CLIENT_LDISC=m
CONFIG_PPS_CLIENT_PARPORT=y
CONFIG_PPS_CLIENT_GPIO=y

#
# PPS generators support
#

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK=y
CONFIG_PTP_1588_CLOCK_OPTIONAL=y
CONFIG_PTP_1588_CLOCK_DTE=m
CONFIG_PTP_1588_CLOCK_QORIQ=y

#
# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
#
CONFIG_PTP_1588_CLOCK_PCH=y
CONFIG_PTP_1588_CLOCK_IDT82P33=y
CONFIG_PTP_1588_CLOCK_IDTCM=y
# end of PTP clock support

CONFIG_PINCTRL=y
CONFIG_GENERIC_PINCTRL_GROUPS=y
CONFIG_PINMUX=y
CONFIG_GENERIC_PINMUX_FUNCTIONS=y
CONFIG_PINCONF=y
CONFIG_GENERIC_PINCONF=y
CONFIG_DEBUG_PINCTRL=y
# CONFIG_PINCTRL_AMD is not set
CONFIG_PINCTRL_AS3722=m
CONFIG_PINCTRL_AT91PIO4=y
CONFIG_PINCTRL_AXP209=y
# CONFIG_PINCTRL_BM1880 is not set
CONFIG_PINCTRL_CY8C95X0=m
CONFIG_PINCTRL_DA850_PUPD=m
CONFIG_PINCTRL_EQUILIBRIUM=y
# CONFIG_PINCTRL_INGENIC is not set
# CONFIG_PINCTRL_LPC18XX is not set
CONFIG_PINCTRL_MAX77620=m
CONFIG_PINCTRL_MCP23S08_I2C=m
CONFIG_PINCTRL_MCP23S08=m
CONFIG_PINCTRL_MICROCHIP_SGPIO=m
CONFIG_PINCTRL_OCELOT=m
# CONFIG_PINCTRL_PALMAS is not set
CONFIG_PINCTRL_PISTACHIO=y
CONFIG_PINCTRL_RK805=m
CONFIG_PINCTRL_ROCKCHIP=m
# CONFIG_PINCTRL_SINGLE is not set
CONFIG_PINCTRL_STMFX=y
# CONFIG_PINCTRL_SX150X is not set
CONFIG_PINCTRL_OWL=y
CONFIG_PINCTRL_S500=y
CONFIG_PINCTRL_S700=y
CONFIG_PINCTRL_S900=y
CONFIG_PINCTRL_ASPEED=y
CONFIG_PINCTRL_ASPEED_G4=y
# CONFIG_PINCTRL_ASPEED_G5 is not set
CONFIG_PINCTRL_ASPEED_G6=y
# CONFIG_PINCTRL_BCM281XX is not set
CONFIG_PINCTRL_BCM2835=y
# CONFIG_PINCTRL_BCM4908 is not set
CONFIG_PINCTRL_BCM63XX=y
# CONFIG_PINCTRL_BCM6318 is not set
# CONFIG_PINCTRL_BCM6328 is not set
CONFIG_PINCTRL_BCM6358=y
# CONFIG_PINCTRL_BCM6362 is not set
# CONFIG_PINCTRL_BCM6368 is not set
CONFIG_PINCTRL_BCM63268=y
CONFIG_PINCTRL_IPROC_GPIO=y
# CONFIG_PINCTRL_CYGNUS_MUX is not set
# CONFIG_PINCTRL_NS is not set
# CONFIG_PINCTRL_NSP_GPIO is not set
CONFIG_PINCTRL_NS2_MUX=y
# CONFIG_PINCTRL_NSP_MUX is not set
CONFIG_PINCTRL_BERLIN=y
CONFIG_PINCTRL_AS370=y
# CONFIG_PINCTRL_BERLIN_BG4CT is not set
CONFIG_PINCTRL_IMX=y
# CONFIG_PINCTRL_IMX8MM is not set
CONFIG_PINCTRL_IMX8MN=y
# CONFIG_PINCTRL_IMX8MP is not set
CONFIG_PINCTRL_IMX8MQ=y

#
# Intel pinctrl drivers
#
# end of Intel pinctrl drivers

#
# MediaTek pinctrl drivers
#
CONFIG_EINT_MTK=y
CONFIG_PINCTRL_MTK=y
CONFIG_PINCTRL_MTK_V2=y
CONFIG_PINCTRL_MTK_MOORE=y
CONFIG_PINCTRL_MTK_PARIS=y
# CONFIG_PINCTRL_MT2701 is not set
# CONFIG_PINCTRL_MT7623 is not set
CONFIG_PINCTRL_MT7629=y
CONFIG_PINCTRL_MT8135=y
CONFIG_PINCTRL_MT8127=y
CONFIG_PINCTRL_MT2712=y
CONFIG_PINCTRL_MT6765=y
# CONFIG_PINCTRL_MT6779 is not set
CONFIG_PINCTRL_MT6795=y
CONFIG_PINCTRL_MT6797=y
CONFIG_PINCTRL_MT7622=y
# CONFIG_PINCTRL_MT7986 is not set
CONFIG_PINCTRL_MT8167=y
CONFIG_PINCTRL_MT8173=y
CONFIG_PINCTRL_MT8183=y
# CONFIG_PINCTRL_MT8186 is not set
# CONFIG_PINCTRL_MT8188 is not set
# CONFIG_PINCTRL_MT8192 is not set
CONFIG_PINCTRL_MT8195=y
# CONFIG_PINCTRL_MT8365 is not set
CONFIG_PINCTRL_MT8516=y
CONFIG_PINCTRL_MT6397=y
# end of MediaTek pinctrl drivers

CONFIG_PINCTRL_MESON=m
# CONFIG_PINCTRL_WPCM450 is not set
# CONFIG_PINCTRL_NPCM7XX is not set
CONFIG_PINCTRL_PXA=y
CONFIG_PINCTRL_PXA25X=y
# CONFIG_PINCTRL_PXA27X is not set
# CONFIG_PINCTRL_MSM is not set
# CONFIG_PINCTRL_QCOM_SPMI_PMIC is not set
CONFIG_PINCTRL_QCOM_SSBI_PMIC=y
# CONFIG_PINCTRL_LPASS_LPI is not set

#
# Renesas pinctrl drivers
#
CONFIG_PINCTRL_RENESAS=y
CONFIG_PINCTRL_SH_PFC=y
CONFIG_PINCTRL_SH_PFC_GPIO=y
CONFIG_PINCTRL_SH_FUNC_GPIO=y
# CONFIG_PINCTRL_PFC_EMEV2 is not set
# CONFIG_PINCTRL_PFC_R8A77995 is not set
CONFIG_PINCTRL_PFC_R8A7794=y
# CONFIG_PINCTRL_PFC_R8A77990 is not set
CONFIG_PINCTRL_PFC_R8A7779=y
# CONFIG_PINCTRL_PFC_R8A7790 is not set
CONFIG_PINCTRL_PFC_R8A77950=y
# CONFIG_PINCTRL_PFC_R8A77951 is not set
# CONFIG_PINCTRL_PFC_R8A7778 is not set
CONFIG_PINCTRL_PFC_R8A7793=y
# CONFIG_PINCTRL_PFC_R8A7791 is not set
CONFIG_PINCTRL_PFC_R8A77965=y
CONFIG_PINCTRL_PFC_R8A77960=y
CONFIG_PINCTRL_PFC_R8A77961=y
# CONFIG_PINCTRL_PFC_R8A779F0 is not set
CONFIG_PINCTRL_PFC_R8A7792=y
# CONFIG_PINCTRL_PFC_R8A77980 is not set
CONFIG_PINCTRL_PFC_R8A77970=y
# CONFIG_PINCTRL_PFC_R8A779A0 is not set
# CONFIG_PINCTRL_PFC_R8A779G0 is not set
CONFIG_PINCTRL_PFC_R8A7740=y
CONFIG_PINCTRL_PFC_R8A73A4=y
CONFIG_PINCTRL_RZA1=y
CONFIG_PINCTRL_RZA2=y
# CONFIG_PINCTRL_RZG2L is not set
# CONFIG_PINCTRL_PFC_R8A77470 is not set
# CONFIG_PINCTRL_PFC_R8A7745 is not set
# CONFIG_PINCTRL_PFC_R8A7742 is not set
# CONFIG_PINCTRL_PFC_R8A7743 is not set
CONFIG_PINCTRL_PFC_R8A7744=y
CONFIG_PINCTRL_PFC_R8A774C0=y
CONFIG_PINCTRL_PFC_R8A774E1=y
# CONFIG_PINCTRL_PFC_R8A774A1 is not set
CONFIG_PINCTRL_PFC_R8A774B1=y
CONFIG_PINCTRL_RZN1=y
CONFIG_PINCTRL_RZV2M=y
CONFIG_PINCTRL_PFC_SH7203=y
# CONFIG_PINCTRL_PFC_SH7264 is not set
CONFIG_PINCTRL_PFC_SH7269=y
# CONFIG_PINCTRL_PFC_SH7720 is not set
CONFIG_PINCTRL_PFC_SH7722=y
# CONFIG_PINCTRL_PFC_SH7734 is not set
CONFIG_PINCTRL_PFC_SH7757=y
CONFIG_PINCTRL_PFC_SH7785=y
# CONFIG_PINCTRL_PFC_SH7786 is not set
CONFIG_PINCTRL_PFC_SH73A0=y
CONFIG_PINCTRL_PFC_SH7723=y
# CONFIG_PINCTRL_PFC_SH7724 is not set
CONFIG_PINCTRL_PFC_SHX3=y
# end of Renesas pinctrl drivers

CONFIG_PINCTRL_SAMSUNG=y
# CONFIG_PINCTRL_EXYNOS is not set
# CONFIG_PINCTRL_S3C24XX is not set
CONFIG_PINCTRL_S3C64XX=y
CONFIG_PINCTRL_SPRD=y
CONFIG_PINCTRL_SPRD_SC9860=y
CONFIG_PINCTRL_STARFIVE_JH7100=m
CONFIG_PINCTRL_STM32=y
CONFIG_PINCTRL_STM32F429=y
CONFIG_PINCTRL_STM32F469=y
CONFIG_PINCTRL_STM32F746=y
# CONFIG_PINCTRL_STM32F769 is not set
CONFIG_PINCTRL_STM32H743=y
CONFIG_PINCTRL_STM32MP135=y
CONFIG_PINCTRL_STM32MP157=y
CONFIG_PINCTRL_TI_IODELAY=m
# CONFIG_PINCTRL_UNIPHIER is not set
# CONFIG_PINCTRL_TMPV7700 is not set
CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_OF_GPIO=y
CONFIG_GPIOLIB_IRQCHIP=y
CONFIG_DEBUG_GPIO=y
# CONFIG_GPIO_SYSFS is not set
CONFIG_GPIO_CDEV=y
# CONFIG_GPIO_CDEV_V1 is not set
CONFIG_GPIO_GENERIC=y
CONFIG_GPIO_REGMAP=y

#
# Memory mapped GPIO drivers
#
CONFIG_GPIO_74XX_MMIO=y
CONFIG_GPIO_ALTERA=m
# CONFIG_GPIO_ASPEED is not set
# CONFIG_GPIO_ASPEED_SGPIO is not set
CONFIG_GPIO_ATH79=y
CONFIG_GPIO_RASPBERRYPI_EXP=y
# CONFIG_GPIO_BCM_KONA is not set
CONFIG_GPIO_BCM_XGS_IPROC=m
CONFIG_GPIO_BRCMSTB=m
# CONFIG_GPIO_CADENCE is not set
# CONFIG_GPIO_CLPS711X is not set
CONFIG_GPIO_DWAPB=m
CONFIG_GPIO_EIC_SPRD=y
# CONFIG_GPIO_EM is not set
CONFIG_GPIO_EXAR=m
CONFIG_GPIO_FTGPIO010=y
# CONFIG_GPIO_GENERIC_PLATFORM is not set
CONFIG_GPIO_GRGPIO=m
# CONFIG_GPIO_HISI is not set
CONFIG_GPIO_HLWD=m
CONFIG_GPIO_IOP=y
CONFIG_GPIO_LOGICVC=m
CONFIG_GPIO_LPC18XX=m
CONFIG_GPIO_LPC32XX=y
# CONFIG_GPIO_MB86S7X is not set
# CONFIG_GPIO_MENZ127 is not set
CONFIG_GPIO_MPC8XXX=y
# CONFIG_GPIO_MT7621 is not set
# CONFIG_GPIO_MXC is not set
# CONFIG_GPIO_MXS is not set
# CONFIG_GPIO_PMIC_EIC_SPRD is not set
CONFIG_GPIO_PXA=y
# CONFIG_GPIO_RCAR is not set
# CONFIG_GPIO_RDA is not set
# CONFIG_GPIO_ROCKCHIP is not set
CONFIG_GPIO_SAMA5D2_PIOBU=m
CONFIG_GPIO_SIFIVE=y
# CONFIG_GPIO_SNPS_CREG is not set
CONFIG_GPIO_SPRD=m
# CONFIG_GPIO_STP_XWAY is not set
CONFIG_GPIO_SYSCON=m
CONFIG_GPIO_TEGRA=y
CONFIG_GPIO_TEGRA186=y
CONFIG_GPIO_TS4800=y
CONFIG_GPIO_UNIPHIER=y
CONFIG_GPIO_VISCONTI=y
CONFIG_GPIO_VX855=m
# CONFIG_GPIO_WCD934X is not set
# CONFIG_GPIO_XGENE_SB is not set
CONFIG_GPIO_XILINX=m
CONFIG_GPIO_XLP=y
CONFIG_GPIO_AMD_FCH=m
CONFIG_GPIO_IDT3243X=y
# end of Memory mapped GPIO drivers

#
# I2C GPIO expanders
#
CONFIG_GPIO_ADNP=m
CONFIG_GPIO_GW_PLD=m
# CONFIG_GPIO_MAX7300 is not set
CONFIG_GPIO_MAX732X=y
# CONFIG_GPIO_MAX732X_IRQ is not set
# CONFIG_GPIO_PCA953X is not set
# CONFIG_GPIO_PCA9570 is not set
CONFIG_GPIO_PCF857X=y
# CONFIG_GPIO_TPIC2810 is not set
CONFIG_GPIO_TS4900=m
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
CONFIG_GPIO_ADP5520=y
CONFIG_GPIO_ARIZONA=m
CONFIG_GPIO_BD71815=m
CONFIG_GPIO_BD71828=m
# CONFIG_GPIO_BD9571MWV is not set
# CONFIG_GPIO_DA9052 is not set
CONFIG_GPIO_DLN2=m
# CONFIG_GPIO_MAX77620 is not set
CONFIG_GPIO_PALMAS=y
# CONFIG_GPIO_SL28CPLD is not set
CONFIG_GPIO_TC3589X=y
# CONFIG_GPIO_TIMBERDALE is not set
# CONFIG_GPIO_TPS65086 is not set
CONFIG_GPIO_TPS6586X=y
# CONFIG_GPIO_TPS65910 is not set
CONFIG_GPIO_TPS65912=m
CONFIG_GPIO_TWL4030=m
CONFIG_GPIO_UCB1400=m
# end of MFD GPIO expanders

#
# PCI GPIO expanders
#
CONFIG_GPIO_ML_IOH=m
# CONFIG_GPIO_PCH is not set
# CONFIG_GPIO_PCI_IDIO_16 is not set
CONFIG_GPIO_PCIE_IDIO_24=m
# CONFIG_GPIO_RDC321X is not set
# end of PCI GPIO expanders

#
# USB GPIO expanders
#
# CONFIG_GPIO_VIPERBOARD is not set
# end of USB GPIO expanders

#
# Virtual GPIO drivers
#
CONFIG_GPIO_AGGREGATOR=m
CONFIG_GPIO_MOCKUP=m
CONFIG_GPIO_VIRTIO=m
# CONFIG_GPIO_SIM is not set
# end of Virtual GPIO drivers

CONFIG_W1=y
# CONFIG_W1_CON is not set

#
# 1-wire Bus Masters
#
CONFIG_W1_MASTER_MATROX=y
# CONFIG_W1_MASTER_DS2490 is not set
# CONFIG_W1_MASTER_DS2482 is not set
CONFIG_W1_MASTER_MXC=m
CONFIG_W1_MASTER_DS1WM=m
CONFIG_W1_MASTER_GPIO=m
CONFIG_W1_MASTER_SGI=y
# end of 1-wire Bus Masters

#
# 1-wire Slaves
#
CONFIG_W1_SLAVE_THERM=m
# CONFIG_W1_SLAVE_SMEM is not set
CONFIG_W1_SLAVE_DS2405=y
CONFIG_W1_SLAVE_DS2408=y
CONFIG_W1_SLAVE_DS2408_READBACK=y
CONFIG_W1_SLAVE_DS2413=y
# CONFIG_W1_SLAVE_DS2406 is not set
# CONFIG_W1_SLAVE_DS2423 is not set
CONFIG_W1_SLAVE_DS2805=m
CONFIG_W1_SLAVE_DS2430=m
# CONFIG_W1_SLAVE_DS2431 is not set
CONFIG_W1_SLAVE_DS2433=y
CONFIG_W1_SLAVE_DS2433_CRC=y
CONFIG_W1_SLAVE_DS2438=y
CONFIG_W1_SLAVE_DS250X=y
CONFIG_W1_SLAVE_DS2780=y
CONFIG_W1_SLAVE_DS2781=m
CONFIG_W1_SLAVE_DS28E04=m
# CONFIG_W1_SLAVE_DS28E17 is not set
# end of 1-wire Slaves

CONFIG_POWER_RESET=y
CONFIG_POWER_RESET_AS3722=y
CONFIG_POWER_RESET_ATC260X=y
CONFIG_POWER_RESET_BRCMKONA=y
CONFIG_POWER_RESET_BRCMSTB=y
# CONFIG_POWER_RESET_GEMINI_POWEROFF is not set
CONFIG_POWER_RESET_GPIO=y
# CONFIG_POWER_RESET_GPIO_RESTART is not set
# CONFIG_POWER_RESET_OCELOT_RESET is not set
# CONFIG_POWER_RESET_PIIX4_POWEROFF is not set
# CONFIG_POWER_RESET_LTC2952 is not set
# CONFIG_POWER_RESET_MT6323 is not set
CONFIG_POWER_RESET_REGULATOR=y
# CONFIG_POWER_RESET_RESTART is not set
# CONFIG_POWER_RESET_TPS65086 is not set
# CONFIG_POWER_RESET_KEYSTONE is not set
# CONFIG_POWER_RESET_SYSCON is not set
# CONFIG_POWER_RESET_SYSCON_POWEROFF is not set
CONFIG_POWER_RESET_RMOBILE=m
CONFIG_REBOOT_MODE=y
CONFIG_SYSCON_REBOOT_MODE=y
CONFIG_POWER_RESET_SC27XX=m
# CONFIG_NVMEM_REBOOT_MODE is not set
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
CONFIG_POWER_SUPPLY_HWMON=y
# CONFIG_PDA_POWER is not set
CONFIG_GENERIC_ADC_BATTERY=y
CONFIG_IP5XXX_POWER=m
CONFIG_TEST_POWER=m
CONFIG_CHARGER_ADP5061=y
# CONFIG_BATTERY_ACT8945A is not set
CONFIG_BATTERY_CW2015=y
# CONFIG_BATTERY_DS2760 is not set
CONFIG_BATTERY_DS2780=y
CONFIG_BATTERY_DS2781=m
# CONFIG_BATTERY_DS2782 is not set
# CONFIG_BATTERY_LEGO_EV3 is not set
# CONFIG_BATTERY_SAMSUNG_SDI is not set
# CONFIG_BATTERY_SBS is not set
# CONFIG_CHARGER_SBS is not set
CONFIG_MANAGER_SBS=m
# CONFIG_BATTERY_BQ27XXX is not set
# CONFIG_BATTERY_DA9030 is not set
CONFIG_BATTERY_DA9052=m
CONFIG_CHARGER_DA9150=m
CONFIG_BATTERY_DA9150=m
# CONFIG_AXP20X_POWER is not set
CONFIG_BATTERY_MAX17040=m
CONFIG_BATTERY_MAX17042=m
# CONFIG_BATTERY_MAX1721X is not set
# CONFIG_BATTERY_TWL4030_MADC is not set
CONFIG_CHARGER_PCF50633=y
# CONFIG_BATTERY_RX51 is not set
CONFIG_CHARGER_ISP1704=m
# CONFIG_CHARGER_MAX8903 is not set
# CONFIG_CHARGER_TWL4030 is not set
CONFIG_CHARGER_LP8727=m
CONFIG_CHARGER_GPIO=y
CONFIG_CHARGER_MANAGER=y
# CONFIG_CHARGER_LT3651 is not set
# CONFIG_CHARGER_LTC4162L is not set
CONFIG_CHARGER_MAX14577=m
CONFIG_CHARGER_DETECTOR_MAX14656=y
CONFIG_CHARGER_MAX77693=m
CONFIG_CHARGER_MAX77976=y
CONFIG_CHARGER_MAX8998=m
CONFIG_CHARGER_MT6360=m
# CONFIG_CHARGER_QCOM_SMBB is not set
CONFIG_CHARGER_BQ2415X=m
CONFIG_CHARGER_BQ24190=m
CONFIG_CHARGER_BQ24257=y
# CONFIG_CHARGER_BQ24735 is not set
CONFIG_CHARGER_BQ2515X=y
CONFIG_CHARGER_BQ25890=m
CONFIG_CHARGER_BQ25980=y
CONFIG_CHARGER_BQ256XX=m
CONFIG_CHARGER_RK817=m
CONFIG_CHARGER_SMB347=m
CONFIG_CHARGER_TPS65217=y
CONFIG_BATTERY_GAUGE_LTC2941=y
CONFIG_BATTERY_GOLDFISH=y
CONFIG_BATTERY_RT5033=m
# CONFIG_CHARGER_RT9455 is not set
CONFIG_CHARGER_SC2731=y
# CONFIG_FUEL_GAUGE_SC27XX is not set
CONFIG_CHARGER_UCS1002=m
CONFIG_CHARGER_BD99954=m
CONFIG_RN5T618_POWER=m
# CONFIG_BATTERY_ACER_A500 is not set
CONFIG_BATTERY_UG3105=m
CONFIG_HWMON=y
CONFIG_HWMON_VID=y
# CONFIG_HWMON_DEBUG_CHIP is not set

#
# Native drivers
#
CONFIG_SENSORS_AD7414=m
CONFIG_SENSORS_AD7418=y
CONFIG_SENSORS_ADM1021=y
CONFIG_SENSORS_ADM1025=y
# CONFIG_SENSORS_ADM1026 is not set
CONFIG_SENSORS_ADM1029=m
# CONFIG_SENSORS_ADM1031 is not set
# CONFIG_SENSORS_ADM1177 is not set
# CONFIG_SENSORS_ADM9240 is not set
CONFIG_SENSORS_ADT7X10=m
CONFIG_SENSORS_ADT7410=m
# CONFIG_SENSORS_ADT7411 is not set
# CONFIG_SENSORS_ADT7462 is not set
# CONFIG_SENSORS_ADT7470 is not set
CONFIG_SENSORS_ADT7475=y
# CONFIG_SENSORS_AHT10 is not set
CONFIG_SENSORS_AQUACOMPUTER_D5NEXT=m
# CONFIG_SENSORS_AS370 is not set
CONFIG_SENSORS_ASC7621=y
# CONFIG_SENSORS_AXI_FAN_CONTROL is not set
# CONFIG_SENSORS_ARM_SCMI is not set
CONFIG_SENSORS_ARM_SCPI=y
# CONFIG_SENSORS_ASB100 is not set
CONFIG_SENSORS_ASPEED=m
CONFIG_SENSORS_ATXP1=y
CONFIG_SENSORS_BT1_PVT=m
# CONFIG_SENSORS_BT1_PVT_ALARMS is not set
CONFIG_SENSORS_CORSAIR_CPRO=y
# CONFIG_SENSORS_CORSAIR_PSU is not set
CONFIG_SENSORS_DS620=y
# CONFIG_SENSORS_DS1621 is not set
# CONFIG_SENSORS_DA9052_ADC is not set
CONFIG_SENSORS_I5K_AMB=m
# CONFIG_SENSORS_SPARX5 is not set
CONFIG_SENSORS_F71805F=y
CONFIG_SENSORS_F71882FG=y
# CONFIG_SENSORS_F75375S is not set
CONFIG_SENSORS_GSC=m
# CONFIG_SENSORS_MC13783_ADC is not set
CONFIG_SENSORS_FSCHMD=y
CONFIG_SENSORS_GL518SM=y
CONFIG_SENSORS_GL520SM=m
CONFIG_SENSORS_G760A=m
CONFIG_SENSORS_G762=y
CONFIG_SENSORS_GPIO_FAN=m
CONFIG_SENSORS_HIH6130=y
# CONFIG_SENSORS_IBMAEM is not set
CONFIG_SENSORS_IBMPEX=m
# CONFIG_SENSORS_IIO_HWMON is not set
CONFIG_SENSORS_IT87=m
CONFIG_SENSORS_JC42=m
CONFIG_SENSORS_POWR1220=m
CONFIG_SENSORS_LAN966X=m
# CONFIG_SENSORS_LINEAGE is not set
# CONFIG_SENSORS_LTC2945 is not set
CONFIG_SENSORS_LTC2947=y
CONFIG_SENSORS_LTC2947_I2C=y
# CONFIG_SENSORS_LTC2990 is not set
CONFIG_SENSORS_LTC2992=y
# CONFIG_SENSORS_LTC4151 is not set
CONFIG_SENSORS_LTC4215=y
# CONFIG_SENSORS_LTC4222 is not set
CONFIG_SENSORS_LTC4245=m
CONFIG_SENSORS_LTC4260=m
CONFIG_SENSORS_LTC4261=m
CONFIG_SENSORS_MAX127=m
# CONFIG_SENSORS_MAX16065 is not set
CONFIG_SENSORS_MAX1619=y
CONFIG_SENSORS_MAX1668=m
# CONFIG_SENSORS_MAX197 is not set
# CONFIG_SENSORS_MAX31730 is not set
# CONFIG_SENSORS_MAX31760 is not set
CONFIG_SENSORS_MAX6620=m
CONFIG_SENSORS_MAX6621=y
CONFIG_SENSORS_MAX6639=y
# CONFIG_SENSORS_MAX6642 is not set
# CONFIG_SENSORS_MAX6650 is not set
# CONFIG_SENSORS_MAX6697 is not set
CONFIG_SENSORS_MAX31790=y
CONFIG_SENSORS_MCP3021=y
# CONFIG_SENSORS_TC654 is not set
CONFIG_SENSORS_TPS23861=y
CONFIG_SENSORS_MR75203=y
CONFIG_SENSORS_LM63=m
CONFIG_SENSORS_LM73=m
# CONFIG_SENSORS_LM75 is not set
CONFIG_SENSORS_LM77=y
# CONFIG_SENSORS_LM78 is not set
CONFIG_SENSORS_LM80=m
CONFIG_SENSORS_LM83=m
# CONFIG_SENSORS_LM85 is not set
CONFIG_SENSORS_LM87=y
# CONFIG_SENSORS_LM90 is not set
# CONFIG_SENSORS_LM92 is not set
CONFIG_SENSORS_LM93=m
CONFIG_SENSORS_LM95234=m
# CONFIG_SENSORS_LM95241 is not set
CONFIG_SENSORS_LM95245=y
CONFIG_SENSORS_PC87360=m
# CONFIG_SENSORS_PC87427 is not set
CONFIG_SENSORS_NTC_THERMISTOR=y
CONFIG_SENSORS_NCT6683=m
# CONFIG_SENSORS_NCT6775 is not set
# CONFIG_SENSORS_NCT6775_I2C is not set
# CONFIG_SENSORS_NCT7802 is not set
# CONFIG_SENSORS_NPCM7XX is not set
# CONFIG_SENSORS_NSA320 is not set
CONFIG_SENSORS_NZXT_KRAKEN2=m
# CONFIG_SENSORS_NZXT_SMART2 is not set
CONFIG_SENSORS_OCC_P8_I2C=y
CONFIG_SENSORS_OCC=y
CONFIG_SENSORS_PCF8591=y
# CONFIG_SENSORS_PECI_CPUTEMP is not set
# CONFIG_SENSORS_PECI_DIMMTEMP is not set
CONFIG_PMBUS=m
CONFIG_SENSORS_PMBUS=m
CONFIG_SENSORS_ADM1266=m
CONFIG_SENSORS_ADM1275=m
CONFIG_SENSORS_BEL_PFE=m
# CONFIG_SENSORS_BPA_RS600 is not set
CONFIG_SENSORS_DELTA_AHE50DC_FAN=m
# CONFIG_SENSORS_FSP_3Y is not set
CONFIG_SENSORS_IBM_CFFPS=m
CONFIG_SENSORS_DPS920AB=m
CONFIG_SENSORS_INSPUR_IPSPS=m
CONFIG_SENSORS_IR35221=m
# CONFIG_SENSORS_IR36021 is not set
# CONFIG_SENSORS_IR38064 is not set
CONFIG_SENSORS_IRPS5401=m
CONFIG_SENSORS_ISL68137=m
# CONFIG_SENSORS_LM25066 is not set
CONFIG_SENSORS_LT7182S=m
CONFIG_SENSORS_LTC2978=m
CONFIG_SENSORS_LTC2978_REGULATOR=y
CONFIG_SENSORS_LTC3815=m
CONFIG_SENSORS_MAX15301=m
CONFIG_SENSORS_MAX16064=m
CONFIG_SENSORS_MAX16601=m
# CONFIG_SENSORS_MAX20730 is not set
# CONFIG_SENSORS_MAX20751 is not set
# CONFIG_SENSORS_MAX31785 is not set
# CONFIG_SENSORS_MAX34440 is not set
# CONFIG_SENSORS_MAX8688 is not set
# CONFIG_SENSORS_MP2888 is not set
CONFIG_SENSORS_MP2975=m
CONFIG_SENSORS_MP5023=m
CONFIG_SENSORS_PIM4328=m
# CONFIG_SENSORS_PLI1209BC is not set
CONFIG_SENSORS_PM6764TR=m
CONFIG_SENSORS_PXE1610=m
# CONFIG_SENSORS_Q54SJ108A2 is not set
CONFIG_SENSORS_STPDDC60=m
# CONFIG_SENSORS_TPS40422 is not set
# CONFIG_SENSORS_TPS53679 is not set
# CONFIG_SENSORS_TPS546D24 is not set
CONFIG_SENSORS_UCD9000=m
CONFIG_SENSORS_UCD9200=m
# CONFIG_SENSORS_XDPE152 is not set
CONFIG_SENSORS_XDPE122=m
CONFIG_SENSORS_XDPE122_REGULATOR=y
CONFIG_SENSORS_ZL6100=m
# CONFIG_SENSORS_PWM_FAN is not set
# CONFIG_SENSORS_RASPBERRYPI_HWMON is not set
# CONFIG_SENSORS_SL28CPLD is not set
CONFIG_SENSORS_SBTSI=y
CONFIG_SENSORS_SBRMI=y
# CONFIG_SENSORS_SHT15 is not set
CONFIG_SENSORS_SHT21=y
# CONFIG_SENSORS_SHT3x is not set
CONFIG_SENSORS_SHT4x=m
# CONFIG_SENSORS_SHTC1 is not set
CONFIG_SENSORS_SIS5595=y
CONFIG_SENSORS_SY7636A=m
CONFIG_SENSORS_DME1737=y
CONFIG_SENSORS_EMC1403=y
CONFIG_SENSORS_EMC2103=m
# CONFIG_SENSORS_EMC2305 is not set
CONFIG_SENSORS_EMC6W201=m
CONFIG_SENSORS_SMSC47M1=m
# CONFIG_SENSORS_SMSC47M192 is not set
CONFIG_SENSORS_SMSC47B397=m
# CONFIG_SENSORS_STTS751 is not set
CONFIG_SENSORS_SMM665=m
CONFIG_SENSORS_ADC128D818=y
CONFIG_SENSORS_ADS7828=m
# CONFIG_SENSORS_AMC6821 is not set
CONFIG_SENSORS_INA209=y
CONFIG_SENSORS_INA2XX=m
CONFIG_SENSORS_INA238=m
CONFIG_SENSORS_INA3221=y
CONFIG_SENSORS_TC74=y
CONFIG_SENSORS_THMC50=y
CONFIG_SENSORS_TMP102=m
CONFIG_SENSORS_TMP103=m
CONFIG_SENSORS_TMP108=m
CONFIG_SENSORS_TMP401=m
# CONFIG_SENSORS_TMP421 is not set
# CONFIG_SENSORS_TMP464 is not set
CONFIG_SENSORS_TMP513=y
CONFIG_SENSORS_VIA686A=m
# CONFIG_SENSORS_VT1211 is not set
CONFIG_SENSORS_VT8231=y
CONFIG_SENSORS_W83773G=y
CONFIG_SENSORS_W83781D=m
CONFIG_SENSORS_W83791D=m
CONFIG_SENSORS_W83792D=m
CONFIG_SENSORS_W83793=m
CONFIG_SENSORS_W83795=y
# CONFIG_SENSORS_W83795_FANCTRL is not set
CONFIG_SENSORS_W83L785TS=y
# CONFIG_SENSORS_W83L786NG is not set
CONFIG_SENSORS_W83627HF=m
CONFIG_SENSORS_W83627EHF=y
CONFIG_THERMAL=y
CONFIG_THERMAL_NETLINK=y
CONFIG_THERMAL_STATISTICS=y
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
CONFIG_THERMAL_HWMON=y
CONFIG_THERMAL_OF=y
CONFIG_THERMAL_WRITABLE_TRIPS=y
CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=y
# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
# CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
CONFIG_THERMAL_GOV_FAIR_SHARE=y
CONFIG_THERMAL_GOV_STEP_WISE=y
# CONFIG_THERMAL_GOV_BANG_BANG is not set
# CONFIG_THERMAL_GOV_USER_SPACE is not set
CONFIG_CPU_THERMAL=y
# CONFIG_DEVFREQ_THERMAL is not set
# CONFIG_THERMAL_EMULATION is not set
CONFIG_THERMAL_MMIO=m
# CONFIG_HISI_THERMAL is not set
# CONFIG_IMX_THERMAL is not set
CONFIG_IMX8MM_THERMAL=m
CONFIG_K3_THERMAL=y
# CONFIG_MAX77620_THERMAL is not set
# CONFIG_QORIQ_THERMAL is not set
CONFIG_SPEAR_THERMAL=y
CONFIG_SUN8I_THERMAL=y
# CONFIG_ROCKCHIP_THERMAL is not set
CONFIG_RCAR_THERMAL=m
CONFIG_RCAR_GEN3_THERMAL=m
CONFIG_RZG2L_THERMAL=y
# CONFIG_KIRKWOOD_THERMAL is not set
CONFIG_DOVE_THERMAL=m
CONFIG_ARMADA_THERMAL=y
CONFIG_DA9062_THERMAL=y
# CONFIG_MTK_THERMAL is not set

#
# Intel thermal drivers
#

#
# ACPI INT340X thermal drivers
#
# end of ACPI INT340X thermal drivers
# end of Intel thermal drivers

#
# Broadcom thermal drivers
#
CONFIG_BCM2711_THERMAL=y
CONFIG_BCM2835_THERMAL=y
CONFIG_BRCMSTB_THERMAL=m
CONFIG_BCM_NS_THERMAL=m
# CONFIG_BCM_SR_THERMAL is not set
# end of Broadcom thermal drivers

#
# Texas Instruments thermal drivers
#
CONFIG_TI_SOC_THERMAL=m
# CONFIG_TI_THERMAL is not set
# CONFIG_OMAP3_THERMAL is not set
# CONFIG_OMAP4_THERMAL is not set
# CONFIG_OMAP5_THERMAL is not set
CONFIG_DRA752_THERMAL=y
# end of Texas Instruments thermal drivers

#
# Samsung thermal drivers
#
# CONFIG_EXYNOS_THERMAL is not set
# end of Samsung thermal drivers

#
# NVIDIA Tegra thermal drivers
#
CONFIG_TEGRA_SOCTHERM=m
CONFIG_TEGRA_BPMP_THERMAL=y
# CONFIG_TEGRA30_TSENSOR is not set
# end of NVIDIA Tegra thermal drivers

CONFIG_GENERIC_ADC_THERMAL=m

#
# Qualcomm thermal drivers
#
CONFIG_QCOM_TSENS=m
CONFIG_QCOM_SPMI_ADC_TM5=m
# CONFIG_QCOM_SPMI_TEMP_ALARM is not set
# end of Qualcomm thermal drivers

CONFIG_UNIPHIER_THERMAL=m
# CONFIG_SPRD_THERMAL is not set
# CONFIG_WATCHDOG is not set
CONFIG_SSB_POSSIBLE=y
CONFIG_SSB=y
CONFIG_SSB_SPROM=y
CONFIG_SSB_PCIHOST_POSSIBLE=y
CONFIG_SSB_PCIHOST=y
# CONFIG_SSB_HOST_SOC is not set
CONFIG_SSB_DRIVER_PCICORE_POSSIBLE=y
CONFIG_SSB_DRIVER_PCICORE=y
CONFIG_SSB_DRIVER_GPIO=y
CONFIG_BCMA_POSSIBLE=y
# CONFIG_BCMA is not set

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
CONFIG_MFD_ACT8945A=m
CONFIG_MFD_SUN4I_GPADC=y
# CONFIG_MFD_AS3711 is not set
CONFIG_MFD_AS3722=m
CONFIG_PMIC_ADP5520=y
CONFIG_MFD_AAT2870_CORE=y
CONFIG_MFD_AT91_USART=y
CONFIG_MFD_ATMEL_FLEXCOM=m
# CONFIG_MFD_ATMEL_HLCDC is not set
CONFIG_MFD_ATMEL_SMC=y
CONFIG_MFD_BCM590XX=m
CONFIG_MFD_BD9571MWV=m
CONFIG_MFD_AXP20X=y
CONFIG_MFD_AXP20X_I2C=y
# CONFIG_MFD_MADERA is not set
CONFIG_MFD_ASIC3=y
CONFIG_PMIC_DA903X=y
CONFIG_PMIC_DA9052=y
CONFIG_MFD_DA9052_I2C=y
# CONFIG_MFD_DA9055 is not set
# CONFIG_MFD_DA9062 is not set
# CONFIG_MFD_DA9063 is not set
CONFIG_MFD_DA9150=m
CONFIG_MFD_DLN2=m
CONFIG_MFD_ENE_KB3930=y
CONFIG_MFD_EXYNOS_LPASS=y
CONFIG_MFD_GATEWORKS_GSC=y
CONFIG_MFD_MC13XXX=m
CONFIG_MFD_MC13XXX_I2C=m
CONFIG_MFD_MP2629=m
# CONFIG_MFD_MXS_LRADC is not set
CONFIG_MFD_MX25_TSADC=y
CONFIG_MFD_HI6421_PMIC=y
# CONFIG_MFD_HI6421_SPMI is not set
CONFIG_MFD_HI655X_PMIC=y
CONFIG_HTC_PASIC3=m
CONFIG_HTC_I2CPLD=y
CONFIG_LPC_ICH=m
CONFIG_LPC_SCH=y
CONFIG_MFD_IQS62X=m
# CONFIG_MFD_JANZ_CMODIO is not set
# CONFIG_MFD_KEMPLD is not set
CONFIG_MFD_88PM800=m
CONFIG_MFD_88PM805=y
# CONFIG_MFD_88PM860X is not set
CONFIG_MFD_MAX14577=y
CONFIG_MFD_MAX77620=y
# CONFIG_MFD_MAX77650 is not set
CONFIG_MFD_MAX77686=y
CONFIG_MFD_MAX77693=y
CONFIG_MFD_MAX77714=y
CONFIG_MFD_MAX77843=y
CONFIG_MFD_MAX8907=y
# CONFIG_MFD_MAX8925 is not set
# CONFIG_MFD_MAX8997 is not set
CONFIG_MFD_MAX8998=y
CONFIG_MFD_MT6360=m
# CONFIG_MFD_MT6370 is not set
CONFIG_MFD_MT6397=y
# CONFIG_MFD_MENF21BMC is not set
CONFIG_MFD_VIPERBOARD=m
CONFIG_MFD_NTXEC=m
# CONFIG_MFD_RETU is not set
CONFIG_MFD_PCF50633=y
CONFIG_PCF50633_ADC=m
# CONFIG_PCF50633_GPIO is not set
CONFIG_UCB1400_CORE=m
CONFIG_MFD_PM8XXX=y
# CONFIG_MFD_SPMI_PMIC is not set
CONFIG_MFD_SY7636A=m
# CONFIG_MFD_RDC321X is not set
CONFIG_MFD_RT4831=y
# CONFIG_MFD_RT5033 is not set
# CONFIG_MFD_RT5120 is not set
# CONFIG_MFD_RC5T583 is not set
CONFIG_MFD_RK808=m
CONFIG_MFD_RN5T618=m
CONFIG_MFD_SEC_CORE=m
CONFIG_MFD_SI476X_CORE=y
CONFIG_MFD_SIMPLE_MFD_I2C=y
CONFIG_MFD_SL28CPLD=y
CONFIG_MFD_SM501=m
# CONFIG_MFD_SM501_GPIO is not set
# CONFIG_MFD_SKY81452 is not set
# CONFIG_ABX500_CORE is not set
# CONFIG_MFD_STMPE is not set
# CONFIG_MFD_SUN6I_PRCM is not set
CONFIG_MFD_SYSCON=y
CONFIG_MFD_TI_AM335X_TSCADC=m
# CONFIG_MFD_LP3943 is not set
CONFIG_MFD_LP8788=y
# CONFIG_MFD_TI_LMU is not set
# CONFIG_MFD_OMAP_USB_HOST is not set
CONFIG_MFD_PALMAS=y
CONFIG_TPS6105X=m
CONFIG_TPS65010=m
CONFIG_TPS6507X=m
CONFIG_MFD_TPS65086=y
# CONFIG_MFD_TPS65090 is not set
CONFIG_MFD_TPS65217=y
# CONFIG_MFD_TI_LP873X is not set
# CONFIG_MFD_TI_LP87565 is not set
# CONFIG_MFD_TPS65218 is not set
CONFIG_MFD_TPS6586X=y
CONFIG_MFD_TPS65910=y
CONFIG_MFD_TPS65912=m
CONFIG_MFD_TPS65912_I2C=m
CONFIG_TWL4030_CORE=y
CONFIG_MFD_TWL4030_AUDIO=y
# CONFIG_TWL6040_CORE is not set
CONFIG_MFD_WL1273_CORE=m
CONFIG_MFD_LM3533=m
CONFIG_MFD_TIMBERDALE=y
CONFIG_MFD_TC3589X=y
CONFIG_MFD_TQMX86=m
CONFIG_MFD_VX855=m
# CONFIG_MFD_LOCHNAGAR is not set
CONFIG_MFD_ARIZONA=m
CONFIG_MFD_ARIZONA_I2C=m
# CONFIG_MFD_CS47L24 is not set
CONFIG_MFD_WM5102=y
# CONFIG_MFD_WM5110 is not set
CONFIG_MFD_WM8997=y
CONFIG_MFD_WM8998=y
# CONFIG_MFD_WM8400 is not set
# CONFIG_MFD_WM831X_I2C is not set
# CONFIG_MFD_WM8350_I2C is not set
# CONFIG_MFD_WM8994 is not set
# CONFIG_MFD_STW481X is not set
# CONFIG_MFD_ROHM_BD718XX is not set
CONFIG_MFD_ROHM_BD71828=y
CONFIG_MFD_ROHM_BD957XMUF=m
CONFIG_MFD_STM32_LPTIMER=y
CONFIG_MFD_STM32_TIMERS=y
CONFIG_MFD_STPMIC1=m
CONFIG_MFD_STMFX=y
CONFIG_MFD_WCD934X=y
CONFIG_MFD_ATC260X=y
CONFIG_MFD_ATC260X_I2C=y
# CONFIG_MFD_KHADAS_MCU is not set
CONFIG_MFD_ACER_A500_EC=y
# CONFIG_MFD_QCOM_PM8008 is not set
CONFIG_RAVE_SP_CORE=m
CONFIG_MFD_RSMU_I2C=m
# end of Multifunction device drivers

CONFIG_REGULATOR=y
# CONFIG_REGULATOR_DEBUG is not set
CONFIG_REGULATOR_FIXED_VOLTAGE=y
# CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
CONFIG_REGULATOR_USERSPACE_CONSUMER=m
CONFIG_REGULATOR_88PG86X=m
CONFIG_REGULATOR_88PM800=m
CONFIG_REGULATOR_ACT8865=y
CONFIG_REGULATOR_ACT8945A=m
# CONFIG_REGULATOR_AD5398 is not set
# CONFIG_REGULATOR_ANATOP is not set
CONFIG_REGULATOR_AAT2870=y
CONFIG_REGULATOR_ARM_SCMI=m
# CONFIG_REGULATOR_AS3722 is not set
CONFIG_REGULATOR_ATC260X=m
CONFIG_REGULATOR_AXP20X=y
CONFIG_REGULATOR_BCM590XX=m
# CONFIG_REGULATOR_BD71815 is not set
CONFIG_REGULATOR_BD71828=m
CONFIG_REGULATOR_BD9571MWV=m
CONFIG_REGULATOR_BD957XMUF=m
# CONFIG_REGULATOR_DA903X is not set
# CONFIG_REGULATOR_DA9052 is not set
# CONFIG_REGULATOR_DA9121 is not set
CONFIG_REGULATOR_DA9210=y
# CONFIG_REGULATOR_DA9211 is not set
CONFIG_REGULATOR_FAN53555=y
# CONFIG_REGULATOR_FAN53880 is not set
CONFIG_REGULATOR_GPIO=m
CONFIG_REGULATOR_HI6421=y
CONFIG_REGULATOR_HI6421V530=y
# CONFIG_REGULATOR_HI655X is not set
CONFIG_REGULATOR_ISL9305=y
# CONFIG_REGULATOR_ISL6271A is not set
CONFIG_REGULATOR_LP3971=m
CONFIG_REGULATOR_LP3972=m
CONFIG_REGULATOR_LP872X=m
CONFIG_REGULATOR_LP8755=y
CONFIG_REGULATOR_LP8788=y
CONFIG_REGULATOR_LTC3589=y
CONFIG_REGULATOR_LTC3676=y
# CONFIG_REGULATOR_MAX14577 is not set
# CONFIG_REGULATOR_MAX1586 is not set
CONFIG_REGULATOR_MAX77620=m
CONFIG_REGULATOR_MAX77650=m
CONFIG_REGULATOR_MAX8649=m
CONFIG_REGULATOR_MAX8660=m
CONFIG_REGULATOR_MAX8893=y
# CONFIG_REGULATOR_MAX8907 is not set
CONFIG_REGULATOR_MAX8952=m
CONFIG_REGULATOR_MAX8973=m
CONFIG_REGULATOR_MAX8998=m
CONFIG_REGULATOR_MAX20086=m
CONFIG_REGULATOR_MAX77686=m
CONFIG_REGULATOR_MAX77693=m
CONFIG_REGULATOR_MAX77802=y
CONFIG_REGULATOR_MAX77826=m
CONFIG_REGULATOR_MC13XXX_CORE=m
# CONFIG_REGULATOR_MC13783 is not set
CONFIG_REGULATOR_MC13892=m
# CONFIG_REGULATOR_MCP16502 is not set
CONFIG_REGULATOR_MP5416=y
CONFIG_REGULATOR_MP8859=y
# CONFIG_REGULATOR_MP886X is not set
CONFIG_REGULATOR_MPQ7920=m
CONFIG_REGULATOR_MT6311=y
CONFIG_REGULATOR_MT6315=m
# CONFIG_REGULATOR_MT6323 is not set
# CONFIG_REGULATOR_MT6331 is not set
CONFIG_REGULATOR_MT6332=m
CONFIG_REGULATOR_MT6358=m
CONFIG_REGULATOR_MT6359=m
CONFIG_REGULATOR_MT6360=m
CONFIG_REGULATOR_MT6380=m
CONFIG_REGULATOR_MT6397=m
# CONFIG_REGULATOR_PALMAS is not set
# CONFIG_REGULATOR_PBIAS is not set
CONFIG_REGULATOR_PCA9450=m
CONFIG_REGULATOR_PCF50633=m
# CONFIG_REGULATOR_PF8X00 is not set
CONFIG_REGULATOR_PFUZE100=y
CONFIG_REGULATOR_PV88060=m
CONFIG_REGULATOR_PV88080=y
CONFIG_REGULATOR_PV88090=y
CONFIG_REGULATOR_PWM=y
# CONFIG_REGULATOR_QCOM_RPMH is not set
CONFIG_REGULATOR_QCOM_SMD_RPM=y
CONFIG_REGULATOR_QCOM_SPMI=y
CONFIG_REGULATOR_QCOM_USB_VBUS=m
CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY=y
# CONFIG_REGULATOR_RK808 is not set
# CONFIG_REGULATOR_RN5T618 is not set
CONFIG_REGULATOR_ROHM=m
CONFIG_REGULATOR_RT4801=y
# CONFIG_REGULATOR_RT4831 is not set
CONFIG_REGULATOR_RT5190A=y
CONFIG_REGULATOR_RT5759=y
CONFIG_REGULATOR_RT6160=y
CONFIG_REGULATOR_RT6245=m
CONFIG_REGULATOR_RTQ2134=y
CONFIG_REGULATOR_RTMV20=m
# CONFIG_REGULATOR_RTQ6752 is not set
# CONFIG_REGULATOR_S2MPA01 is not set
CONFIG_REGULATOR_S2MPS11=y
CONFIG_REGULATOR_S5M8767=y
# CONFIG_REGULATOR_SC2731 is not set
CONFIG_REGULATOR_SLG51000=m
# CONFIG_REGULATOR_STM32_BOOSTER is not set
CONFIG_REGULATOR_STM32_VREFBUF=m
CONFIG_REGULATOR_STM32_PWR=y
CONFIG_REGULATOR_STPMIC1=m
CONFIG_REGULATOR_TI_ABB=m
# CONFIG_REGULATOR_STW481X_VMMC is not set
CONFIG_REGULATOR_SY7636A=m
CONFIG_REGULATOR_SY8106A=m
CONFIG_REGULATOR_SY8824X=y
CONFIG_REGULATOR_SY8827N=y
# CONFIG_REGULATOR_TPS51632 is not set
CONFIG_REGULATOR_TPS6105X=m
CONFIG_REGULATOR_TPS62360=m
# CONFIG_REGULATOR_TPS6286X is not set
CONFIG_REGULATOR_TPS65023=m
# CONFIG_REGULATOR_TPS6507X is not set
# CONFIG_REGULATOR_TPS65086 is not set
CONFIG_REGULATOR_TPS65132=y
CONFIG_REGULATOR_TPS65217=m
CONFIG_REGULATOR_TPS6586X=y
CONFIG_REGULATOR_TPS65910=y
CONFIG_REGULATOR_TPS65912=m
# CONFIG_REGULATOR_TPS68470 is not set
CONFIG_REGULATOR_TWL4030=y
CONFIG_REGULATOR_UNIPHIER=y
# CONFIG_REGULATOR_VCTRL is not set
CONFIG_REGULATOR_QCOM_LABIBB=y
CONFIG_RC_CORE=y
# CONFIG_BPF_LIRC_MODE2 is not set
CONFIG_LIRC=y
CONFIG_RC_MAP=y
CONFIG_RC_DECODERS=y
CONFIG_IR_IMON_DECODER=y
# CONFIG_IR_JVC_DECODER is not set
CONFIG_IR_MCE_KBD_DECODER=y
# CONFIG_IR_NEC_DECODER is not set
CONFIG_IR_RC5_DECODER=y
CONFIG_IR_RC6_DECODER=m
CONFIG_IR_RCMM_DECODER=m
CONFIG_IR_SANYO_DECODER=m
# CONFIG_IR_SHARP_DECODER is not set
# CONFIG_IR_SONY_DECODER is not set
CONFIG_IR_XMP_DECODER=y
CONFIG_RC_DEVICES=y
CONFIG_IR_ENE=m
# CONFIG_IR_FINTEK is not set
CONFIG_IR_GPIO_CIR=m
# CONFIG_IR_GPIO_TX is not set
CONFIG_IR_HIX5HD2=y
CONFIG_IR_IGORPLUGUSB=m
CONFIG_IR_IGUANA=m
CONFIG_IR_IMON=m
CONFIG_IR_IMON_RAW=m
# CONFIG_IR_ITE_CIR is not set
CONFIG_IR_MCEUSB=m
CONFIG_IR_MESON=m
CONFIG_IR_MESON_TX=y
CONFIG_IR_MTK=y
CONFIG_IR_NUVOTON=y
CONFIG_IR_PWM_TX=m
CONFIG_IR_REDRAT3=m
CONFIG_IR_RX51=m
CONFIG_IR_SERIAL=y
CONFIG_IR_SERIAL_TRANSMITTER=y
# CONFIG_IR_STREAMZAP is not set
CONFIG_IR_SUNXI=m
CONFIG_IR_TOY=y
# CONFIG_IR_TTUSBIR is not set
# CONFIG_IR_WINBOND_CIR is not set
CONFIG_RC_ATI_REMOTE=y
# CONFIG_RC_LOOPBACK is not set
# CONFIG_RC_ST is not set
CONFIG_RC_XBOX_DVD=m
CONFIG_IR_IMG=m
CONFIG_IR_IMG_RAW=y
# CONFIG_IR_IMG_HW is not set
CONFIG_CEC_CORE=y
CONFIG_CEC_NOTIFIER=y

#
# CEC support
#
# CONFIG_MEDIA_CEC_RC is not set
# CONFIG_MEDIA_CEC_SUPPORT is not set
# end of CEC support

CONFIG_MEDIA_SUPPORT=y
CONFIG_MEDIA_SUPPORT_FILTER=y
CONFIG_MEDIA_SUBDRV_AUTOSELECT=y

#
# Media device types
#
CONFIG_MEDIA_CAMERA_SUPPORT=y
CONFIG_MEDIA_ANALOG_TV_SUPPORT=y
# CONFIG_MEDIA_DIGITAL_TV_SUPPORT is not set
CONFIG_MEDIA_RADIO_SUPPORT=y
# CONFIG_MEDIA_SDR_SUPPORT is not set
# CONFIG_MEDIA_PLATFORM_SUPPORT is not set
CONFIG_MEDIA_TEST_SUPPORT=y
# end of Media device types

CONFIG_VIDEO_DEV=y
CONFIG_MEDIA_CONTROLLER=y

#
# Video4Linux options
#
CONFIG_VIDEO_V4L2_I2C=y
CONFIG_VIDEO_V4L2_SUBDEV_API=y
CONFIG_VIDEO_ADV_DEBUG=y
CONFIG_VIDEO_FIXED_MINOR_RANGES=y
CONFIG_VIDEO_TUNER=y
CONFIG_V4L2_MEM2MEM_DEV=m
CONFIG_V4L2_FWNODE=y
CONFIG_V4L2_ASYNC=y
CONFIG_VIDEOBUF_GEN=m
CONFIG_VIDEOBUF_DMA_SG=m
# end of Video4Linux options

#
# Media controller options
#
CONFIG_MEDIA_CONTROLLER_REQUEST_API=y
# end of Media controller options

#
# Media drivers
#

#
# Drivers filtered as selected at 'Filter media drivers'
#

#
# Media drivers
#
CONFIG_MEDIA_USB_SUPPORT=y

#
# Webcam devices
#
# CONFIG_USB_GSPCA is not set
CONFIG_USB_PWC=y
CONFIG_USB_PWC_DEBUG=y
CONFIG_USB_PWC_INPUT_EVDEV=y
CONFIG_USB_S2255=y
# CONFIG_VIDEO_USBTV is not set
# CONFIG_USB_VIDEO_CLASS is not set

#
# Analog TV USB devices
#
# CONFIG_VIDEO_GO7007 is not set
CONFIG_VIDEO_HDPVR=m
# CONFIG_VIDEO_PVRUSB2 is not set
CONFIG_VIDEO_STK1160_COMMON=m
CONFIG_VIDEO_STK1160=m

#
# Analog/digital TV USB devices
#
CONFIG_VIDEO_CX231XX=y
# CONFIG_VIDEO_CX231XX_RC is not set
CONFIG_VIDEO_CX231XX_ALSA=m

#
# Webcam, TV (analog/digital) USB devices
#
# CONFIG_VIDEO_EM28XX is not set
CONFIG_MEDIA_PCI_SUPPORT=y

#
# Media capture support
#
CONFIG_VIDEO_SOLO6X10=m
CONFIG_STA2X11_VIP=y
CONFIG_VIDEO_TW5864=m
CONFIG_VIDEO_TW68=y
# CONFIG_VIDEO_TW686X is not set
CONFIG_VIDEO_ZORAN=y
# CONFIG_VIDEO_ZORAN_DC30 is not set
# CONFIG_VIDEO_ZORAN_ZR36060 is not set

#
# Media capture/analog TV support
#
CONFIG_VIDEO_DT3155=y
# CONFIG_VIDEO_IVTV is not set

#
# Media capture/analog/hybrid TV support
#
CONFIG_VIDEO_BT848=m
CONFIG_VIDEO_CX25821=m
# CONFIG_VIDEO_CX25821_ALSA is not set
# CONFIG_VIDEO_CX88 is not set
# CONFIG_VIDEO_SAA7134 is not set
CONFIG_RADIO_ADAPTERS=m
CONFIG_RADIO_MAXIRADIO=m
CONFIG_RADIO_SAA7706H=m
# CONFIG_RADIO_SHARK is not set
CONFIG_RADIO_SHARK2=m
# CONFIG_RADIO_SI4713 is not set
CONFIG_RADIO_TEA575X=m
CONFIG_RADIO_TEA5764=m
CONFIG_RADIO_TEF6862=m
CONFIG_RADIO_TIMBERDALE=m
# CONFIG_RADIO_WL1273 is not set
CONFIG_USB_DSBR=m
CONFIG_USB_KEENE=m
CONFIG_USB_MA901=m
# CONFIG_USB_MR800 is not set
# CONFIG_USB_RAREMONO is not set
CONFIG_RADIO_SI470X=m
CONFIG_USB_SI470X=m
CONFIG_I2C_SI470X=m
CONFIG_RADIO_WL128X=m
CONFIG_V4L_RADIO_ISA_DRIVERS=y
# CONFIG_RADIO_AZTECH is not set
# CONFIG_RADIO_CADET is not set
CONFIG_RADIO_GEMTEK=m
CONFIG_RADIO_ISA=m
CONFIG_RADIO_RTRACK=m
CONFIG_RADIO_RTRACK2=m
CONFIG_RADIO_SF16FMI=m
CONFIG_RADIO_SF16FMR2=m
# CONFIG_RADIO_TERRATEC is not set
# CONFIG_RADIO_TRUST is not set
CONFIG_RADIO_TYPHOON=m
# CONFIG_RADIO_ZOLTRIX is not set
CONFIG_V4L_TEST_DRIVERS=y
# CONFIG_VIDEO_VIM2M is not set
CONFIG_VIDEO_VICODEC=m
# CONFIG_VIDEO_VIMC is not set
# CONFIG_VIDEO_VIVID is not set
CONFIG_VIDEO_CX2341X=y
CONFIG_VIDEO_TVEEPROM=y
CONFIG_VIDEOBUF2_CORE=y
CONFIG_VIDEOBUF2_V4L2=y
CONFIG_VIDEOBUF2_MEMOPS=y
CONFIG_VIDEOBUF2_DMA_CONTIG=y
CONFIG_VIDEOBUF2_VMALLOC=y
CONFIG_VIDEOBUF2_DMA_SG=y
# end of Media drivers

#
# Media ancillary drivers
#
CONFIG_MEDIA_ATTACH=y

#
# IR I2C driver auto-selected by 'Autoselect ancillary drivers'
#
# CONFIG_VIDEO_IR_I2C is not set

#
# Camera sensor devices
#
CONFIG_VIDEO_APTINA_PLL=m
CONFIG_VIDEO_CCS_PLL=m
CONFIG_VIDEO_AR0521=y
CONFIG_VIDEO_HI556=m
# CONFIG_VIDEO_HI846 is not set
CONFIG_VIDEO_HI847=y
CONFIG_VIDEO_IMX208=y
CONFIG_VIDEO_IMX214=y
CONFIG_VIDEO_IMX219=y
CONFIG_VIDEO_IMX258=y
# CONFIG_VIDEO_IMX274 is not set
CONFIG_VIDEO_IMX290=y
CONFIG_VIDEO_IMX319=m
CONFIG_VIDEO_IMX334=m
CONFIG_VIDEO_IMX335=y
CONFIG_VIDEO_IMX355=m
CONFIG_VIDEO_IMX412=y
CONFIG_VIDEO_MAX9271_LIB=y
CONFIG_VIDEO_MT9M001=m
CONFIG_VIDEO_MT9M032=m
CONFIG_VIDEO_MT9M111=y
CONFIG_VIDEO_MT9P031=m
CONFIG_VIDEO_MT9T001=m
CONFIG_VIDEO_MT9T112=y
# CONFIG_VIDEO_MT9V011 is not set
CONFIG_VIDEO_MT9V032=y
CONFIG_VIDEO_MT9V111=y
CONFIG_VIDEO_NOON010PC30=y
CONFIG_VIDEO_OG01A1B=y
CONFIG_VIDEO_OV02A10=m
CONFIG_VIDEO_OV08D10=y
CONFIG_VIDEO_OV13858=m
CONFIG_VIDEO_OV13B10=y
# CONFIG_VIDEO_OV2640 is not set
CONFIG_VIDEO_OV2659=y
CONFIG_VIDEO_OV2680=y
# CONFIG_VIDEO_OV2685 is not set
CONFIG_VIDEO_OV2740=m
# CONFIG_VIDEO_OV5640 is not set
# CONFIG_VIDEO_OV5645 is not set
# CONFIG_VIDEO_OV5647 is not set
CONFIG_VIDEO_OV5670=y
CONFIG_VIDEO_OV5675=y
CONFIG_VIDEO_OV5693=y
CONFIG_VIDEO_OV5695=y
CONFIG_VIDEO_OV6650=m
CONFIG_VIDEO_OV7251=m
CONFIG_VIDEO_OV7640=m
CONFIG_VIDEO_OV7670=y
CONFIG_VIDEO_OV772X=m
CONFIG_VIDEO_OV7740=y
CONFIG_VIDEO_OV8856=m
CONFIG_VIDEO_OV9282=y
CONFIG_VIDEO_OV9640=m
CONFIG_VIDEO_OV9650=y
# CONFIG_VIDEO_OV9734 is not set
CONFIG_VIDEO_RDACM20=y
CONFIG_VIDEO_RDACM21=y
CONFIG_VIDEO_RJ54N1=m
CONFIG_VIDEO_S5K4ECGX=m
# CONFIG_VIDEO_S5K5BAF is not set
CONFIG_VIDEO_S5K6A3=m
CONFIG_VIDEO_S5K6AA=m
CONFIG_VIDEO_SR030PC30=m
# CONFIG_VIDEO_VS6624 is not set
CONFIG_VIDEO_CCS=m
# CONFIG_VIDEO_ET8EK8 is not set
# CONFIG_VIDEO_M5MOLS is not set
# end of Camera sensor devices

#
# Lens drivers
#
CONFIG_VIDEO_AD5820=m
CONFIG_VIDEO_AK7375=y
CONFIG_VIDEO_DW9714=m
# CONFIG_VIDEO_DW9768 is not set
CONFIG_VIDEO_DW9807_VCM=y
# end of Lens drivers

#
# Flash devices
#
CONFIG_VIDEO_ADP1653=m
CONFIG_VIDEO_LM3560=y
CONFIG_VIDEO_LM3646=y
# end of Flash devices

#
# Audio decoders, processors and mixers
#
# CONFIG_VIDEO_CS3308 is not set
CONFIG_VIDEO_CS5345=m
CONFIG_VIDEO_CS53L32A=y
CONFIG_VIDEO_MSP3400=m
# CONFIG_VIDEO_SONY_BTF_MPX is not set
CONFIG_VIDEO_TDA7432=y
# CONFIG_VIDEO_TDA9840 is not set
CONFIG_VIDEO_TEA6415C=y
CONFIG_VIDEO_TEA6420=m
CONFIG_VIDEO_TLV320AIC23B=y
CONFIG_VIDEO_TVAUDIO=y
# CONFIG_VIDEO_UDA1342 is not set
CONFIG_VIDEO_VP27SMPX=y
CONFIG_VIDEO_WM8739=m
CONFIG_VIDEO_WM8775=y
# end of Audio decoders, processors and mixers

#
# RDS decoders
#
CONFIG_VIDEO_SAA6588=y
# end of RDS decoders

#
# Video decoders
#
CONFIG_VIDEO_ADV7180=y
CONFIG_VIDEO_ADV7183=y
CONFIG_VIDEO_ADV748X=m
CONFIG_VIDEO_ADV7604=m
# CONFIG_VIDEO_ADV7604_CEC is not set
CONFIG_VIDEO_ADV7842=y
# CONFIG_VIDEO_ADV7842_CEC is not set
CONFIG_VIDEO_BT819=m
CONFIG_VIDEO_BT856=y
# CONFIG_VIDEO_BT866 is not set
CONFIG_VIDEO_ISL7998X=y
CONFIG_VIDEO_KS0127=m
CONFIG_VIDEO_MAX9286=y
# CONFIG_VIDEO_ML86V7667 is not set
CONFIG_VIDEO_SAA7110=m
CONFIG_VIDEO_SAA711X=m
# CONFIG_VIDEO_TC358743 is not set
# CONFIG_VIDEO_TVP514X is not set
# CONFIG_VIDEO_TVP5150 is not set
# CONFIG_VIDEO_TVP7002 is not set
CONFIG_VIDEO_TW2804=y
# CONFIG_VIDEO_TW9903 is not set
# CONFIG_VIDEO_TW9906 is not set
CONFIG_VIDEO_TW9910=m
CONFIG_VIDEO_VPX3220=y

#
# Video and audio decoders
#
# CONFIG_VIDEO_SAA717X is not set
CONFIG_VIDEO_CX25840=y
# end of Video decoders

#
# Video encoders
#
CONFIG_VIDEO_AD9389B=y
CONFIG_VIDEO_ADV7170=y
CONFIG_VIDEO_ADV7175=y
# CONFIG_VIDEO_ADV7343 is not set
CONFIG_VIDEO_ADV7393=y
CONFIG_VIDEO_ADV7511=y
CONFIG_VIDEO_ADV7511_CEC=y
CONFIG_VIDEO_AK881X=y
CONFIG_VIDEO_SAA7127=m
CONFIG_VIDEO_SAA7185=m
CONFIG_VIDEO_THS8200=y
# end of Video encoders

#
# Video improvement chips
#
CONFIG_VIDEO_UPD64031A=y
CONFIG_VIDEO_UPD64083=y
# end of Video improvement chips

#
# Audio/Video compression chips
#
CONFIG_VIDEO_SAA6752HS=y
# end of Audio/Video compression chips

#
# SDR tuner chips
#
# end of SDR tuner chips

#
# Miscellaneous helper chips
#
CONFIG_VIDEO_I2C=y
# CONFIG_VIDEO_M52790 is not set
CONFIG_VIDEO_ST_MIPID02=m
CONFIG_VIDEO_THS7303=y
# end of Miscellaneous helper chips

CONFIG_MEDIA_TUNER=y

#
# Customize TV tuners
#
CONFIG_MEDIA_TUNER_E4000=y
CONFIG_MEDIA_TUNER_FC0011=m
CONFIG_MEDIA_TUNER_FC0012=y
# CONFIG_MEDIA_TUNER_FC0013 is not set
# CONFIG_MEDIA_TUNER_FC2580 is not set
CONFIG_MEDIA_TUNER_IT913X=y
CONFIG_MEDIA_TUNER_M88RS6000T=y
CONFIG_MEDIA_TUNER_MAX2165=m
CONFIG_MEDIA_TUNER_MC44S803=y
CONFIG_MEDIA_TUNER_MT2060=y
# CONFIG_MEDIA_TUNER_MT2063 is not set
CONFIG_MEDIA_TUNER_MT20XX=y
CONFIG_MEDIA_TUNER_MT2131=y
CONFIG_MEDIA_TUNER_MT2266=m
# CONFIG_MEDIA_TUNER_MXL301RF is not set
CONFIG_MEDIA_TUNER_MXL5005S=m
# CONFIG_MEDIA_TUNER_MXL5007T is not set
# CONFIG_MEDIA_TUNER_QM1D1B0004 is not set
CONFIG_MEDIA_TUNER_QM1D1C0042=y
CONFIG_MEDIA_TUNER_QT1010=y
CONFIG_MEDIA_TUNER_R820T=m
# CONFIG_MEDIA_TUNER_SI2157 is not set
CONFIG_MEDIA_TUNER_SIMPLE=y
CONFIG_MEDIA_TUNER_TDA18212=m
# CONFIG_MEDIA_TUNER_TDA18218 is not set
CONFIG_MEDIA_TUNER_TDA18250=y
CONFIG_MEDIA_TUNER_TDA18271=y
CONFIG_MEDIA_TUNER_TDA827X=y
CONFIG_MEDIA_TUNER_TDA8290=y
CONFIG_MEDIA_TUNER_TDA9887=y
CONFIG_MEDIA_TUNER_TEA5761=y
CONFIG_MEDIA_TUNER_TEA5767=y
# CONFIG_MEDIA_TUNER_TUA9001 is not set
CONFIG_MEDIA_TUNER_XC2028=y
CONFIG_MEDIA_TUNER_XC4000=y
CONFIG_MEDIA_TUNER_XC5000=y
# end of Customize TV tuners

#
# Tools to develop new frontends
#
# end of Media ancillary drivers

#
# Graphics support
#
CONFIG_APERTURE_HELPERS=y
# CONFIG_IMX_IPUV3_CORE is not set
CONFIG_DRM=y
CONFIG_DRM_MIPI_DSI=y
# CONFIG_DRM_DEBUG_MM is not set
CONFIG_DRM_KMS_HELPER=y
CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS=y
# CONFIG_DRM_DEBUG_MODESET_LOCK is not set
# CONFIG_DRM_FBDEV_EMULATION is not set
# CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
CONFIG_DRM_DP_AUX_BUS=y
CONFIG_DRM_DISPLAY_HELPER=y
CONFIG_DRM_DISPLAY_DP_HELPER=y
CONFIG_DRM_DISPLAY_HDCP_HELPER=y
CONFIG_DRM_DISPLAY_HDMI_HELPER=y
# CONFIG_DRM_DP_AUX_CHARDEV is not set
# CONFIG_DRM_DP_CEC is not set
CONFIG_DRM_TTM=y
CONFIG_DRM_VRAM_HELPER=y
CONFIG_DRM_TTM_HELPER=y
CONFIG_DRM_GEM_DMA_HELPER=y
CONFIG_DRM_GEM_SHMEM_HELPER=y
CONFIG_DRM_SCHED=y

#
# I2C encoder or helper chips
#
# CONFIG_DRM_I2C_CH7006 is not set
# CONFIG_DRM_I2C_SIL164 is not set
# CONFIG_DRM_I2C_NXP_TDA998X is not set
CONFIG_DRM_I2C_NXP_TDA9950=y
# end of I2C encoder or helper chips

#
# ARM devices
#
# CONFIG_DRM_HDLCD is not set
# CONFIG_DRM_MALI_DISPLAY is not set
# CONFIG_DRM_KOMEDA is not set
# end of ARM devices

CONFIG_DRM_RADEON=m
# CONFIG_DRM_RADEON_USERPTR is not set
# CONFIG_DRM_AMDGPU is not set
CONFIG_DRM_NOUVEAU=y
CONFIG_NOUVEAU_LEGACY_CTX_SUPPORT=y
CONFIG_NOUVEAU_DEBUG=5
CONFIG_NOUVEAU_DEBUG_DEFAULT=3
CONFIG_NOUVEAU_DEBUG_MMU=y
# CONFIG_NOUVEAU_DEBUG_PUSH is not set
# CONFIG_DRM_NOUVEAU_BACKLIGHT is not set
CONFIG_DRM_KMB_DISPLAY=y
# CONFIG_DRM_VGEM is not set
CONFIG_DRM_VKMS=m
# CONFIG_DRM_EXYNOS is not set
CONFIG_DRM_UDL=m
CONFIG_DRM_AST=y
CONFIG_DRM_MGAG200=y
CONFIG_DRM_RCAR_DW_HDMI=y
CONFIG_DRM_RCAR_USE_LVDS=y
# CONFIG_DRM_RCAR_MIPI_DSI is not set
CONFIG_DRM_SUN4I=m
# CONFIG_DRM_SUN4I_HDMI is not set
# CONFIG_DRM_SUN4I_BACKEND is not set
CONFIG_DRM_SUN6I_DSI=m
CONFIG_DRM_SUN8I_DW_HDMI=m
# CONFIG_DRM_SUN8I_MIXER is not set
# CONFIG_DRM_QXL is not set
# CONFIG_DRM_MSM is not set
CONFIG_DRM_PANEL=y

#
# Display Panels
#
CONFIG_DRM_PANEL_ARM_VERSATILE=y
CONFIG_DRM_PANEL_ASUS_Z00T_TM5P5_NT35596=y
CONFIG_DRM_PANEL_BOE_BF060Y8M_AJ0=m
# CONFIG_DRM_PANEL_BOE_HIMAX8279D is not set
CONFIG_DRM_PANEL_BOE_TV101WUM_NL6=y
CONFIG_DRM_PANEL_DSI_CM=m
# CONFIG_DRM_PANEL_LVDS is not set
# CONFIG_DRM_PANEL_EBBG_FT8719 is not set
CONFIG_DRM_PANEL_ELIDA_KD35T133=m
CONFIG_DRM_PANEL_FEIXIN_K101_IM2BA02=m
CONFIG_DRM_PANEL_FEIYANG_FY07024DI26A30D=m
CONFIG_DRM_PANEL_ILITEK_ILI9881C=m
CONFIG_DRM_PANEL_INNOLUX_P079ZCA=m
CONFIG_DRM_PANEL_JDI_LT070ME05000=m
CONFIG_DRM_PANEL_JDI_R63452=m
# CONFIG_DRM_PANEL_KHADAS_TS050 is not set
CONFIG_DRM_PANEL_KINGDISPLAY_KD097D04=m
CONFIG_DRM_PANEL_LEADTEK_LTK050H3146W=m
# CONFIG_DRM_PANEL_LEADTEK_LTK500HD1829 is not set
CONFIG_DRM_PANEL_NOVATEK_NT35510=y
# CONFIG_DRM_PANEL_NOVATEK_NT35560 is not set
CONFIG_DRM_PANEL_NOVATEK_NT35950=y
CONFIG_DRM_PANEL_NOVATEK_NT36672A=y
CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=m
CONFIG_DRM_PANEL_OLIMEX_LCD_OLINUXINO=m
CONFIG_DRM_PANEL_ORISETECH_OTM8009A=y
CONFIG_DRM_PANEL_OSD_OSD101T2587_53TS=m
CONFIG_DRM_PANEL_PANASONIC_VVX10F034N00=y
CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN=y
CONFIG_DRM_PANEL_RAYDIUM_RM67191=y
# CONFIG_DRM_PANEL_RAYDIUM_RM68200 is not set
CONFIG_DRM_PANEL_RONBO_RB070D30=m
CONFIG_DRM_PANEL_SAMSUNG_S6D16D0=m
CONFIG_DRM_PANEL_SAMSUNG_S6E3HA2=y
CONFIG_DRM_PANEL_SAMSUNG_S6E63J0X03=m
CONFIG_DRM_PANEL_SAMSUNG_S6E63M0=y
CONFIG_DRM_PANEL_SAMSUNG_S6E63M0_DSI=y
CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01=y
CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0=y
# CONFIG_DRM_PANEL_SAMSUNG_SOFEF00 is not set
# CONFIG_DRM_PANEL_SEIKO_43WVF1G is not set
CONFIG_DRM_PANEL_SHARP_LQ101R1SX01=y
# CONFIG_DRM_PANEL_SHARP_LS037V7DW01 is not set
CONFIG_DRM_PANEL_SHARP_LS043T1LE01=m
CONFIG_DRM_PANEL_SHARP_LS060T1SX01=y
CONFIG_DRM_PANEL_SITRONIX_ST7701=y
CONFIG_DRM_PANEL_SITRONIX_ST7703=m
CONFIG_DRM_PANEL_SONY_TULIP_TRULY_NT35521=y
CONFIG_DRM_PANEL_TDO_TL070WSH30=m
CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
CONFIG_DRM_PANEL_VISIONOX_RM69299=m
CONFIG_DRM_PANEL_XINPENG_XPP055C272=m
# end of Display Panels

CONFIG_DRM_BRIDGE=y
CONFIG_DRM_PANEL_BRIDGE=y

#
# Display Interface Bridges
#
CONFIG_DRM_CDNS_DSI=m
# CONFIG_DRM_CHIPONE_ICN6211 is not set
CONFIG_DRM_CHRONTEL_CH7033=m
CONFIG_DRM_CROS_EC_ANX7688=y
CONFIG_DRM_DISPLAY_CONNECTOR=y
CONFIG_DRM_FSL_LDB=m
# CONFIG_DRM_ITE_IT6505 is not set
# CONFIG_DRM_LONTIUM_LT8912B is not set
CONFIG_DRM_LONTIUM_LT9211=y
# CONFIG_DRM_LONTIUM_LT9611 is not set
CONFIG_DRM_LONTIUM_LT9611UXC=y
CONFIG_DRM_ITE_IT66121=m
# CONFIG_DRM_LVDS_CODEC is not set
CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW=y
# CONFIG_DRM_NWL_MIPI_DSI is not set
CONFIG_DRM_NXP_PTN3460=y
# CONFIG_DRM_PARADE_PS8622 is not set
CONFIG_DRM_PARADE_PS8640=y
CONFIG_DRM_SIL_SII8620=y
CONFIG_DRM_SII902X=m
CONFIG_DRM_SII9234=m
# CONFIG_DRM_SIMPLE_BRIDGE is not set
CONFIG_DRM_THINE_THC63LVD1024=y
CONFIG_DRM_TOSHIBA_TC358762=y
CONFIG_DRM_TOSHIBA_TC358764=m
CONFIG_DRM_TOSHIBA_TC358767=y
CONFIG_DRM_TOSHIBA_TC358768=m
CONFIG_DRM_TOSHIBA_TC358775=y
CONFIG_DRM_TI_DLPC3433=m
# CONFIG_DRM_TI_TFP410 is not set
CONFIG_DRM_TI_SN65DSI83=m
# CONFIG_DRM_TI_SN65DSI86 is not set
CONFIG_DRM_TI_TPD12S015=m
# CONFIG_DRM_ANALOGIX_ANX6345 is not set
# CONFIG_DRM_ANALOGIX_ANX78XX is not set
CONFIG_DRM_ANALOGIX_ANX7625=y
CONFIG_DRM_I2C_ADV7511=y
# CONFIG_DRM_I2C_ADV7511_CEC is not set
CONFIG_DRM_CDNS_MHDP8546=m
CONFIG_DRM_CDNS_MHDP8546_J721E=y
CONFIG_DRM_IMX8QM_LDB=m
CONFIG_DRM_IMX8QXP_LDB=m
# CONFIG_DRM_IMX8QXP_PIXEL_COMBINER is not set
CONFIG_DRM_IMX8QXP_PIXEL_LINK_TO_DPI=m
CONFIG_DRM_DW_HDMI=y
CONFIG_DRM_DW_HDMI_AHB_AUDIO=m
# CONFIG_DRM_DW_HDMI_GP_AUDIO is not set
CONFIG_DRM_DW_HDMI_CEC=y
# end of Display Interface Bridges

CONFIG_DRM_V3D=y
CONFIG_DRM_ETNAVIV=y
CONFIG_DRM_ETNAVIV_THERMAL=y
CONFIG_DRM_HISI_HIBMC=y
# CONFIG_DRM_LOGICVC is not set
CONFIG_DRM_MXS=y
CONFIG_DRM_MXSFB=m
# CONFIG_DRM_IMX_LCDIF is not set
CONFIG_DRM_ARCPGU=m
CONFIG_DRM_BOCHS=y
# CONFIG_DRM_CIRRUS_QEMU is not set
# CONFIG_DRM_GM12U320 is not set
CONFIG_DRM_SIMPLEDRM=y
CONFIG_DRM_PL111=m
CONFIG_DRM_LIMA=m
# CONFIG_DRM_ASPEED_GFX is not set
CONFIG_DRM_TIDSS=y
CONFIG_DRM_GUD=y
CONFIG_DRM_SSD130X=m
CONFIG_DRM_SSD130X_I2C=m
# CONFIG_DRM_SPRD is not set
CONFIG_DRM_LEGACY=y
CONFIG_DRM_TDFX=m
# CONFIG_DRM_R128 is not set
# CONFIG_DRM_MGA is not set
CONFIG_DRM_VIA=y
CONFIG_DRM_SAVAGE=m
CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=y
CONFIG_DRM_NOMODESET=y

#
# Frame buffer Devices
#
CONFIG_FB_CMDLINE=y
CONFIG_FB_NOTIFY=y
CONFIG_FB=y
# CONFIG_FIRMWARE_EDID is not set
CONFIG_FB_DDC=y
CONFIG_FB_CFB_FILLRECT=y
CONFIG_FB_CFB_COPYAREA=y
CONFIG_FB_CFB_IMAGEBLIT=y
CONFIG_FB_CFB_REV_PIXELS_IN_BYTE=y
CONFIG_FB_SYS_FILLRECT=y
CONFIG_FB_SYS_COPYAREA=y
CONFIG_FB_SYS_IMAGEBLIT=y
CONFIG_FB_FOREIGN_ENDIAN=y
# CONFIG_FB_BOTH_ENDIAN is not set
CONFIG_FB_BIG_ENDIAN=y
# CONFIG_FB_LITTLE_ENDIAN is not set
CONFIG_FB_SYS_FOPS=y
CONFIG_FB_DEFERRED_IO=y
CONFIG_FB_SVGALIB=y
CONFIG_FB_MACMODES=y
CONFIG_FB_BACKLIGHT=y
CONFIG_FB_MODE_HELPERS=y
CONFIG_FB_TILEBLITTING=y

#
# Frame buffer hardware drivers
#
# CONFIG_FB_CIRRUS is not set
# CONFIG_FB_PM2 is not set
# CONFIG_FB_CLPS711X is not set
CONFIG_FB_IMX=m
# CONFIG_FB_CYBER2000 is not set
# CONFIG_FB_ARC is not set
CONFIG_FB_CONTROL=y
CONFIG_FB_ASILIANT=y
# CONFIG_FB_IMSTT is not set
CONFIG_FB_UVESA=m
# CONFIG_FB_GBE is not set
CONFIG_FB_PVR2=m
# CONFIG_FB_OPENCORES is not set
# CONFIG_FB_S1D13XXX is not set
# CONFIG_FB_ATMEL is not set
CONFIG_FB_NVIDIA=y
CONFIG_FB_NVIDIA_I2C=y
CONFIG_FB_NVIDIA_DEBUG=y
CONFIG_FB_NVIDIA_BACKLIGHT=y
# CONFIG_FB_RIVA is not set
# CONFIG_FB_I740 is not set
# CONFIG_FB_MATROX is not set
# CONFIG_FB_RADEON is not set
CONFIG_FB_ATY128=m
CONFIG_FB_ATY128_BACKLIGHT=y
# CONFIG_FB_ATY is not set
CONFIG_FB_S3=m
# CONFIG_FB_S3_DDC is not set
CONFIG_FB_SAVAGE=m
# CONFIG_FB_SAVAGE_I2C is not set
CONFIG_FB_SAVAGE_ACCEL=y
# CONFIG_FB_SIS is not set
# CONFIG_FB_VIA is not set
CONFIG_FB_NEOMAGIC=y
CONFIG_FB_KYRO=y
CONFIG_FB_3DFX=m
CONFIG_FB_3DFX_ACCEL=y
# CONFIG_FB_3DFX_I2C is not set
# CONFIG_FB_VOODOO1 is not set
CONFIG_FB_VT8623=y
CONFIG_FB_TRIDENT=m
CONFIG_FB_ARK=y
CONFIG_FB_PM3=m
CONFIG_FB_CARMINE=y
# CONFIG_FB_CARMINE_DRAM_EVAL is not set
CONFIG_CARMINE_DRAM_CUSTOM=y
# CONFIG_FB_WM8505 is not set
CONFIG_FB_PXA168=y
# CONFIG_FB_W100 is not set
CONFIG_FB_SH_MOBILE_LCDC=y
CONFIG_FB_TMIO=m
# CONFIG_FB_TMIO_ACCELL is not set
CONFIG_FB_S3C=m
CONFIG_FB_S3C_DEBUG_REGWRITE=y
CONFIG_FB_SM501=m
# CONFIG_FB_SMSCUFX is not set
# CONFIG_FB_UDL is not set
CONFIG_FB_IBM_GXT4500=y
CONFIG_FB_GOLDFISH=m
CONFIG_FB_DA8XX=m
# CONFIG_FB_VIRTUAL is not set
CONFIG_FB_METRONOME=m
# CONFIG_FB_MB862XX is not set
CONFIG_FB_BROADSHEET=m
CONFIG_FB_SSD1307=m
CONFIG_FB_SM712=y
CONFIG_FB_OMAP2=m
# CONFIG_FB_OMAP2_DEBUG_SUPPORT is not set
CONFIG_FB_OMAP2_NUM_FBS=3
CONFIG_FB_OMAP2_DSS_INIT=y
CONFIG_FB_OMAP2_DSS=m
# CONFIG_FB_OMAP2_DSS_DEBUG is not set
# CONFIG_FB_OMAP2_DSS_DEBUGFS is not set
# CONFIG_FB_OMAP2_DSS_DPI is not set
CONFIG_FB_OMAP2_DSS_VENC=y
CONFIG_FB_OMAP2_DSS_HDMI_COMMON=y
# CONFIG_FB_OMAP4_DSS_HDMI is not set
CONFIG_FB_OMAP5_DSS_HDMI=y
CONFIG_FB_OMAP2_DSS_SDI=y
# CONFIG_FB_OMAP2_DSS_DSI is not set
CONFIG_FB_OMAP2_DSS_MIN_FCK_PER_PCK=0
CONFIG_FB_OMAP2_DSS_SLEEP_AFTER_VENC_RESET=y

#
# OMAPFB Panel and Encoder Drivers
#
CONFIG_FB_OMAP2_ENCODER_OPA362=m
CONFIG_FB_OMAP2_ENCODER_TFP410=m
# CONFIG_FB_OMAP2_ENCODER_TPD12S015 is not set
CONFIG_FB_OMAP2_CONNECTOR_DVI=m
CONFIG_FB_OMAP2_CONNECTOR_HDMI=m
CONFIG_FB_OMAP2_CONNECTOR_ANALOG_TV=m
CONFIG_FB_OMAP2_PANEL_DPI=m
CONFIG_FB_OMAP2_PANEL_SHARP_LS037V7DW01=m
# end of OMAPFB Panel and Encoder Drivers

CONFIG_MMP_DISP=m
CONFIG_MMP_DISP_CONTROLLER=y
CONFIG_MMP_FB=m
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
CONFIG_LCD_CLASS_DEVICE=m
# CONFIG_LCD_PLATFORM is not set
CONFIG_BACKLIGHT_CLASS_DEVICE=y
CONFIG_BACKLIGHT_KTD253=y
CONFIG_BACKLIGHT_LM3533=m
CONFIG_BACKLIGHT_OMAP1=y
CONFIG_BACKLIGHT_PWM=m
# CONFIG_BACKLIGHT_DA903X is not set
CONFIG_BACKLIGHT_DA9052=m
CONFIG_BACKLIGHT_QCOM_WLED=y
# CONFIG_BACKLIGHT_RT4831 is not set
# CONFIG_BACKLIGHT_ADP5520 is not set
# CONFIG_BACKLIGHT_ADP8860 is not set
CONFIG_BACKLIGHT_ADP8870=m
# CONFIG_BACKLIGHT_PCF50633 is not set
CONFIG_BACKLIGHT_AAT2870=m
CONFIG_BACKLIGHT_LM3630A=m
CONFIG_BACKLIGHT_LM3639=y
CONFIG_BACKLIGHT_LP855X=m
CONFIG_BACKLIGHT_LP8788=m
# CONFIG_BACKLIGHT_PANDORA is not set
# CONFIG_BACKLIGHT_TPS65217 is not set
# CONFIG_BACKLIGHT_GPIO is not set
CONFIG_BACKLIGHT_LV5207LP=m
CONFIG_BACKLIGHT_BD6107=y
CONFIG_BACKLIGHT_ARCXCNN=y
CONFIG_BACKLIGHT_RAVE_SP=m
# CONFIG_BACKLIGHT_LED is not set
# end of Backlight & LCD device support

CONFIG_VGASTATE=y
CONFIG_VIDEOMODE_HELPERS=y
CONFIG_HDMI=y
# CONFIG_LOGO is not set
# end of Graphics support

CONFIG_SOUND=m
CONFIG_SND=m
CONFIG_SND_TIMER=m
CONFIG_SND_PCM=m
CONFIG_SND_PCM_ELD=y
CONFIG_SND_PCM_IEC958=y
CONFIG_SND_HWDEP=m
CONFIG_SND_RAWMIDI=m
CONFIG_SND_JACK=y
CONFIG_SND_JACK_INPUT_DEV=y
# CONFIG_SND_OSSEMUL is not set
CONFIG_SND_PCM_TIMER=y
CONFIG_SND_HRTIMER=m
CONFIG_SND_DYNAMIC_MINORS=y
CONFIG_SND_MAX_CARDS=32
# CONFIG_SND_SUPPORT_OLD_API is not set
# CONFIG_SND_VERBOSE_PRINTK is not set
CONFIG_SND_CTL_FAST_LOOKUP=y
# CONFIG_SND_DEBUG is not set
CONFIG_SND_CTL_INPUT_VALIDATION=y
CONFIG_SND_VMASTER=y
CONFIG_SND_CTL_LED=m
# CONFIG_SND_SEQUENCER is not set
CONFIG_SND_MPU401_UART=m
CONFIG_SND_OPL3_LIB=m
CONFIG_SND_VX_LIB=m
CONFIG_SND_AC97_CODEC=m
# CONFIG_SND_DRIVERS is not set
CONFIG_SND_PCI=y
CONFIG_SND_AD1889=m
# CONFIG_SND_ATIIXP is not set
CONFIG_SND_ATIIXP_MODEM=m
CONFIG_SND_AU8810=m
# CONFIG_SND_AU8820 is not set
CONFIG_SND_AU8830=m
CONFIG_SND_AW2=m
CONFIG_SND_BT87X=m
# CONFIG_SND_BT87X_OVERCLOCK is not set
CONFIG_SND_CA0106=m
CONFIG_SND_CMIPCI=m
CONFIG_SND_OXYGEN_LIB=m
# CONFIG_SND_OXYGEN is not set
# CONFIG_SND_CS4281 is not set
# CONFIG_SND_CS46XX is not set
CONFIG_SND_CS5535AUDIO=m
CONFIG_SND_CTXFI=m
CONFIG_SND_DARLA20=m
CONFIG_SND_GINA20=m
CONFIG_SND_LAYLA20=m
CONFIG_SND_DARLA24=m
CONFIG_SND_GINA24=m
# CONFIG_SND_LAYLA24 is not set
CONFIG_SND_MONA=m
CONFIG_SND_MIA=m
CONFIG_SND_ECHO3G=m
CONFIG_SND_INDIGO=m
# CONFIG_SND_INDIGOIO is not set
# CONFIG_SND_INDIGODJ is not set
CONFIG_SND_INDIGOIOX=m
CONFIG_SND_INDIGODJX=m
# CONFIG_SND_ENS1370 is not set
# CONFIG_SND_ENS1371 is not set
CONFIG_SND_FM801=m
# CONFIG_SND_FM801_TEA575X_BOOL is not set
CONFIG_SND_HDSP=m
CONFIG_SND_HDSPM=m
CONFIG_SND_ICE1724=m
CONFIG_SND_INTEL8X0=m
CONFIG_SND_INTEL8X0M=m
# CONFIG_SND_KORG1212 is not set
# CONFIG_SND_LOLA is not set
# CONFIG_SND_MIXART is not set
# CONFIG_SND_NM256 is not set
CONFIG_SND_PCXHR=m
# CONFIG_SND_RIPTIDE is not set
CONFIG_SND_RME32=m
CONFIG_SND_RME96=m
# CONFIG_SND_RME9652 is not set
CONFIG_SND_SE6X=m
# CONFIG_SND_VIA82XX is not set
# CONFIG_SND_VIA82XX_MODEM is not set
# CONFIG_SND_VIRTUOSO is not set
CONFIG_SND_VX222=m
# CONFIG_SND_YMFPCI is not set

#
# HD-Audio
#
CONFIG_SND_HDA=m
CONFIG_SND_HDA_GENERIC_LEDS=y
CONFIG_SND_HDA_INTEL=m
# CONFIG_SND_HDA_HWDEP is not set
# CONFIG_SND_HDA_RECONFIG is not set
CONFIG_SND_HDA_INPUT_BEEP=y
CONFIG_SND_HDA_INPUT_BEEP_MODE=1
# CONFIG_SND_HDA_PATCH_LOADER is not set
# CONFIG_SND_HDA_CODEC_REALTEK is not set
CONFIG_SND_HDA_CODEC_ANALOG=m
CONFIG_SND_HDA_CODEC_SIGMATEL=m
# CONFIG_SND_HDA_CODEC_VIA is not set
CONFIG_SND_HDA_CODEC_HDMI=m
CONFIG_SND_HDA_CODEC_CIRRUS=m
# CONFIG_SND_HDA_CODEC_CS8409 is not set
CONFIG_SND_HDA_CODEC_CONEXANT=m
CONFIG_SND_HDA_CODEC_CA0110=m
CONFIG_SND_HDA_CODEC_CA0132=m
CONFIG_SND_HDA_CODEC_CA0132_DSP=y
CONFIG_SND_HDA_CODEC_CMEDIA=m
# CONFIG_SND_HDA_CODEC_SI3054 is not set
CONFIG_SND_HDA_GENERIC=m
# CONFIG_SND_HDA_INTEL_HDMI_SILENT_STREAM is not set
# end of HD-Audio

CONFIG_SND_HDA_CORE=m
CONFIG_SND_HDA_DSP_LOADER=y
CONFIG_SND_HDA_COMPONENT=y
CONFIG_SND_HDA_PREALLOC_SIZE=64
CONFIG_SND_INTEL_DSP_CONFIG=m
# CONFIG_SND_USB is not set
CONFIG_SND_FIREWIRE=y
CONFIG_SND_FIREWIRE_LIB=m
# CONFIG_SND_DICE is not set
# CONFIG_SND_OXFW is not set
CONFIG_SND_ISIGHT=m
# CONFIG_SND_FIREWORKS is not set
CONFIG_SND_BEBOB=m
CONFIG_SND_FIREWIRE_DIGI00X=m
# CONFIG_SND_FIREWIRE_TASCAM is not set
# CONFIG_SND_FIREWIRE_MOTU is not set
# CONFIG_SND_FIREFACE is not set
# CONFIG_SND_SOC is not set
CONFIG_SND_VIRTIO=m
CONFIG_AC97_BUS=m

#
# HID support
#
CONFIG_HID=y
# CONFIG_HID_BATTERY_STRENGTH is not set
CONFIG_HIDRAW=y
CONFIG_UHID=m
CONFIG_HID_GENERIC=m

#
# Special HID drivers
#
# CONFIG_HID_A4TECH is not set
# CONFIG_HID_ACCUTOUCH is not set
CONFIG_HID_ACRUX=m
CONFIG_HID_ACRUX_FF=y
# CONFIG_HID_APPLE is not set
# CONFIG_HID_APPLEIR is not set
# CONFIG_HID_ASUS is not set
CONFIG_HID_AUREAL=y
CONFIG_HID_BELKIN=m
CONFIG_HID_BETOP_FF=m
CONFIG_HID_BIGBEN_FF=m
CONFIG_HID_CHERRY=m
CONFIG_HID_CHICONY=m
CONFIG_HID_CORSAIR=m
CONFIG_HID_COUGAR=y
CONFIG_HID_MACALLY=m
# CONFIG_HID_PRODIKEYS is not set
CONFIG_HID_CMEDIA=m
CONFIG_HID_CP2112=m
CONFIG_HID_CREATIVE_SB0540=m
CONFIG_HID_CYPRESS=y
CONFIG_HID_DRAGONRISE=m
CONFIG_DRAGONRISE_FF=y
# CONFIG_HID_EMS_FF is not set
CONFIG_HID_ELAN=m
# CONFIG_HID_ELECOM is not set
CONFIG_HID_ELO=m
# CONFIG_HID_EZKEY is not set
CONFIG_HID_FT260=m
# CONFIG_HID_GEMBIRD is not set
CONFIG_HID_GFRM=y
CONFIG_HID_GLORIOUS=m
CONFIG_HID_HOLTEK=m
CONFIG_HOLTEK_FF=y
# CONFIG_HID_VIVALDI is not set
CONFIG_HID_GT683R=m
CONFIG_HID_KEYTOUCH=y
CONFIG_HID_KYE=y
CONFIG_HID_UCLOGIC=m
CONFIG_HID_WALTOP=y
CONFIG_HID_VIEWSONIC=y
CONFIG_HID_VRC2=m
CONFIG_HID_XIAOMI=m
CONFIG_HID_GYRATION=m
CONFIG_HID_ICADE=m
# CONFIG_HID_ITE is not set
# CONFIG_HID_JABRA is not set
CONFIG_HID_TWINHAN=y
CONFIG_HID_KENSINGTON=y
CONFIG_HID_LCPOWER=m
CONFIG_HID_LED=y
CONFIG_HID_LENOVO=m
CONFIG_HID_LETSKETCH=m
CONFIG_HID_LOGITECH=m
CONFIG_HID_LOGITECH_DJ=m
CONFIG_HID_LOGITECH_HIDPP=m
CONFIG_LOGITECH_FF=y
CONFIG_LOGIRUMBLEPAD2_FF=y
CONFIG_LOGIG940_FF=y
CONFIG_LOGIWHEELS_FF=y
# CONFIG_HID_MAGICMOUSE is not set
CONFIG_HID_MALTRON=y
# CONFIG_HID_MAYFLASH is not set
CONFIG_HID_MEGAWORLD_FF=m
# CONFIG_HID_REDRAGON is not set
CONFIG_HID_MICROSOFT=y
CONFIG_HID_MONTEREY=y
# CONFIG_HID_MULTITOUCH is not set
CONFIG_HID_NINTENDO=y
CONFIG_NINTENDO_FF=y
# CONFIG_HID_NTI is not set
CONFIG_HID_NTRIG=m
CONFIG_HID_ORTEK=y
CONFIG_HID_PANTHERLORD=y
# CONFIG_PANTHERLORD_FF is not set
# CONFIG_HID_PENMOUNT is not set
CONFIG_HID_PETALYNX=y
CONFIG_HID_PICOLCD=m
CONFIG_HID_PICOLCD_FB=y
CONFIG_HID_PICOLCD_BACKLIGHT=y
CONFIG_HID_PICOLCD_LCD=y
CONFIG_HID_PICOLCD_LEDS=y
# CONFIG_HID_PICOLCD_CIR is not set
CONFIG_HID_PLANTRONICS=y
CONFIG_HID_PXRC=y
# CONFIG_HID_RAZER is not set
CONFIG_HID_PRIMAX=y
# CONFIG_HID_RETRODE is not set
CONFIG_HID_ROCCAT=m
# CONFIG_HID_SAITEK is not set
# CONFIG_HID_SAMSUNG is not set
CONFIG_HID_SEMITEK=m
CONFIG_HID_SIGMAMICRO=m
CONFIG_HID_SONY=m
CONFIG_SONY_FF=y
CONFIG_HID_SPEEDLINK=m
# CONFIG_HID_STEAM is not set
CONFIG_HID_STEELSERIES=y
CONFIG_HID_SUNPLUS=m
CONFIG_HID_RMI=y
# CONFIG_HID_GREENASIA is not set
CONFIG_HID_SMARTJOYPLUS=y
CONFIG_SMARTJOYPLUS_FF=y
CONFIG_HID_TIVO=y
CONFIG_HID_TOPSEED=y
CONFIG_HID_TOPRE=m
CONFIG_HID_THINGM=m
CONFIG_HID_THRUSTMASTER=m
# CONFIG_THRUSTMASTER_FF is not set
CONFIG_HID_UDRAW_PS3=m
# CONFIG_HID_WACOM is not set
# CONFIG_HID_WIIMOTE is not set
# CONFIG_HID_XINMO is not set
CONFIG_HID_ZEROPLUS=m
# CONFIG_ZEROPLUS_FF is not set
CONFIG_HID_ZYDACRON=y
# CONFIG_HID_SENSOR_HUB is not set
CONFIG_HID_ALPS=y
CONFIG_HID_MCP2221=m
# end of Special HID drivers

#
# USB HID support
#
CONFIG_USB_HID=m
CONFIG_HID_PID=y
CONFIG_USB_HIDDEV=y

#
# USB HID Boot Protocol drivers
#
# CONFIG_USB_KBD is not set
# CONFIG_USB_MOUSE is not set
# end of USB HID Boot Protocol drivers
# end of USB HID support

#
# I2C HID support
#
CONFIG_I2C_HID_OF=y
CONFIG_I2C_HID_OF_ELAN=y
CONFIG_I2C_HID_OF_GOODIX=m
# end of I2C HID support

CONFIG_I2C_HID_CORE=y

#
# Intel ISH HID support
#
# end of Intel ISH HID support

#
# AMD SFH HID Support
#
CONFIG_AMD_SFH_HID=y
# end of AMD SFH HID Support
# end of HID support

CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
CONFIG_USB_COMMON=y
CONFIG_USB_LED_TRIG=y
CONFIG_USB_ULPI_BUS=y
# CONFIG_USB_CONN_GPIO is not set
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB=y
# CONFIG_USB_PCI is not set
# CONFIG_USB_ANNOUNCE_NEW_DEVICES is not set

#
# Miscellaneous USB options
#
CONFIG_USB_DEFAULT_PERSIST=y
CONFIG_USB_FEW_INIT_RETRIES=y
# CONFIG_USB_DYNAMIC_MINORS is not set
# CONFIG_USB_OTG_PRODUCTLIST is not set
# CONFIG_USB_OTG_DISABLE_EXTERNAL_HUB is not set
# CONFIG_USB_LEDS_TRIGGER_USBPORT is not set
CONFIG_USB_AUTOSUSPEND_DELAY=2
CONFIG_USB_MON=m

#
# USB Host Controller Drivers
#
CONFIG_USB_C67X00_HCD=y
# CONFIG_USB_XHCI_HCD is not set
# CONFIG_USB_BRCMSTB is not set
CONFIG_USB_EHCI_HCD=y
CONFIG_USB_EHCI_ROOT_HUB_TT=y
CONFIG_USB_EHCI_TT_NEWSCHED=y
# CONFIG_USB_EHCI_FSL is not set
CONFIG_USB_EHCI_HCD_NPCM7XX=y
CONFIG_USB_EHCI_HCD_OMAP=m
CONFIG_USB_EHCI_HCD_ORION=y
# CONFIG_USB_EHCI_HCD_SPEAR is not set
CONFIG_USB_EHCI_HCD_STI=y
CONFIG_USB_EHCI_HCD_AT91=y
# CONFIG_USB_EHCI_SH is not set
CONFIG_USB_EHCI_EXYNOS=y
# CONFIG_USB_EHCI_MV is not set
CONFIG_USB_CNS3XXX_EHCI=y
CONFIG_USB_EHCI_HCD_PLATFORM=y
CONFIG_USB_OXU210HP_HCD=m
# CONFIG_USB_ISP116X_HCD is not set
CONFIG_USB_ISP1362_HCD=y
# CONFIG_USB_FOTG210_HCD is not set
# CONFIG_USB_OHCI_HCD is not set
CONFIG_USB_U132_HCD=m
CONFIG_USB_SL811_HCD=m
CONFIG_USB_SL811_HCD_ISO=y
# CONFIG_USB_R8A66597_HCD is not set
# CONFIG_USB_HCD_SSB is not set
CONFIG_USB_HCD_TEST_MODE=y

#
# USB Device Class drivers
#
CONFIG_USB_ACM=m
CONFIG_USB_PRINTER=y
# CONFIG_USB_WDM is not set
CONFIG_USB_TMC=y

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
#

#
# also be needed; see USB_STORAGE Help for more info
#

#
# USB Imaging devices
#
CONFIG_USB_MDC800=m
CONFIG_USBIP_CORE=y
CONFIG_USBIP_VHCI_HCD=m
CONFIG_USBIP_VHCI_HC_PORTS=8
CONFIG_USBIP_VHCI_NR_HCS=1
CONFIG_USBIP_HOST=m
CONFIG_USBIP_DEBUG=y
CONFIG_USB_CDNS_SUPPORT=y
# CONFIG_USB_CDNS3 is not set
CONFIG_USB_MTU3=y
CONFIG_USB_MTU3_HOST=y
CONFIG_USB_MTU3_DEBUG=y
CONFIG_USB_MUSB_HDRC=y
CONFIG_USB_MUSB_HOST=y

#
# Platform Glue Layer
#
# CONFIG_USB_MUSB_DSPS is not set
# CONFIG_USB_MUSB_UX500 is not set
# CONFIG_USB_MUSB_MEDIATEK is not set
CONFIG_USB_MUSB_POLARFIRE_SOC=m

#
# MUSB DMA mode
#
# CONFIG_MUSB_PIO_ONLY is not set
# CONFIG_USB_INVENTRA_DMA is not set
# CONFIG_USB_DWC3 is not set
CONFIG_USB_DWC2=m
CONFIG_USB_DWC2_HOST=y

#
# Gadget/Dual-role mode requires USB Gadget support to be enabled
#
CONFIG_USB_DWC2_DEBUG=y
# CONFIG_USB_DWC2_VERBOSE is not set
CONFIG_USB_DWC2_TRACK_MISSED_SOFS=y
# CONFIG_USB_DWC2_DEBUG_PERIODIC is not set
# CONFIG_USB_CHIPIDEA is not set
# CONFIG_USB_ISP1760 is not set

#
# USB port drivers
#
CONFIG_USB_USS720=y
CONFIG_USB_SERIAL=m
# CONFIG_USB_SERIAL_GENERIC is not set
CONFIG_USB_SERIAL_SIMPLE=m
CONFIG_USB_SERIAL_AIRCABLE=m
CONFIG_USB_SERIAL_ARK3116=m
CONFIG_USB_SERIAL_BELKIN=m
# CONFIG_USB_SERIAL_CH341 is not set
# CONFIG_USB_SERIAL_WHITEHEAT is not set
# CONFIG_USB_SERIAL_DIGI_ACCELEPORT is not set
# CONFIG_USB_SERIAL_CP210X is not set
# CONFIG_USB_SERIAL_CYPRESS_M8 is not set
# CONFIG_USB_SERIAL_EMPEG is not set
CONFIG_USB_SERIAL_FTDI_SIO=m
# CONFIG_USB_SERIAL_VISOR is not set
# CONFIG_USB_SERIAL_IPAQ is not set
CONFIG_USB_SERIAL_IR=m
CONFIG_USB_SERIAL_EDGEPORT=m
# CONFIG_USB_SERIAL_EDGEPORT_TI is not set
CONFIG_USB_SERIAL_F81232=m
CONFIG_USB_SERIAL_F8153X=m
CONFIG_USB_SERIAL_GARMIN=m
CONFIG_USB_SERIAL_IPW=m
CONFIG_USB_SERIAL_IUU=m
CONFIG_USB_SERIAL_KEYSPAN_PDA=m
# CONFIG_USB_SERIAL_KEYSPAN is not set
CONFIG_USB_SERIAL_KLSI=m
CONFIG_USB_SERIAL_KOBIL_SCT=m
CONFIG_USB_SERIAL_MCT_U232=m
CONFIG_USB_SERIAL_METRO=m
CONFIG_USB_SERIAL_MOS7720=m
# CONFIG_USB_SERIAL_MOS7715_PARPORT is not set
CONFIG_USB_SERIAL_MOS7840=m
CONFIG_USB_SERIAL_MXUPORT=m
# CONFIG_USB_SERIAL_NAVMAN is not set
CONFIG_USB_SERIAL_PL2303=m
# CONFIG_USB_SERIAL_OTI6858 is not set
CONFIG_USB_SERIAL_QCAUX=m
CONFIG_USB_SERIAL_QUALCOMM=m
# CONFIG_USB_SERIAL_SPCP8X5 is not set
CONFIG_USB_SERIAL_SAFE=m
# CONFIG_USB_SERIAL_SAFE_PADDED is not set
CONFIG_USB_SERIAL_SIERRAWIRELESS=m
# CONFIG_USB_SERIAL_SYMBOL is not set
CONFIG_USB_SERIAL_TI=m
CONFIG_USB_SERIAL_CYBERJACK=m
CONFIG_USB_SERIAL_WWAN=m
CONFIG_USB_SERIAL_OPTION=m
# CONFIG_USB_SERIAL_OMNINET is not set
CONFIG_USB_SERIAL_OPTICON=m
# CONFIG_USB_SERIAL_XSENS_MT is not set
CONFIG_USB_SERIAL_WISHBONE=m
CONFIG_USB_SERIAL_SSU100=m
# CONFIG_USB_SERIAL_QT2 is not set
# CONFIG_USB_SERIAL_UPD78F0730 is not set
CONFIG_USB_SERIAL_XR=m
CONFIG_USB_SERIAL_DEBUG=m

#
# USB Miscellaneous drivers
#
# CONFIG_USB_EMI62 is not set
CONFIG_USB_EMI26=y
CONFIG_USB_ADUTUX=m
CONFIG_USB_SEVSEG=y
CONFIG_USB_LEGOTOWER=y
# CONFIG_USB_LCD is not set
# CONFIG_USB_CYPRESS_CY7C63 is not set
CONFIG_USB_CYTHERM=y
# CONFIG_USB_IDMOUSE is not set
CONFIG_USB_FTDI_ELAN=m
CONFIG_USB_APPLEDISPLAY=y
# CONFIG_USB_QCOM_EUD is not set
CONFIG_APPLE_MFI_FASTCHARGE=y
CONFIG_USB_SISUSBVGA=y
CONFIG_USB_LD=y
CONFIG_USB_TRANCEVIBRATOR=y
CONFIG_USB_IOWARRIOR=m
# CONFIG_USB_TEST is not set
# CONFIG_USB_EHSET_TEST_FIXTURE is not set
CONFIG_USB_ISIGHTFW=m
CONFIG_USB_YUREX=y
CONFIG_USB_EZUSB_FX2=m
# CONFIG_USB_HUB_USB251XB is not set
# CONFIG_USB_HSIC_USB3503 is not set
# CONFIG_USB_HSIC_USB4604 is not set
# CONFIG_USB_LINK_LAYER_TEST is not set
CONFIG_BRCM_USB_PINMAP=m
CONFIG_USB_ONBOARD_HUB=m
# CONFIG_USB_ATM is not set

#
# USB Physical Layer drivers
#
CONFIG_USB_PHY=y
CONFIG_KEYSTONE_USB_PHY=m
CONFIG_NOP_USB_XCEIV=m
# CONFIG_AM335X_PHY_USB is not set
CONFIG_USB_GPIO_VBUS=m
# CONFIG_USB_ISP1301 is not set
CONFIG_USB_TEGRA_PHY=y
CONFIG_USB_ULPI=y
CONFIG_USB_ULPI_VIEWPORT=y
# CONFIG_JZ4770_PHY is not set
# end of USB Physical Layer drivers

# CONFIG_USB_GADGET is not set
CONFIG_TYPEC=m
CONFIG_TYPEC_TCPM=m
# CONFIG_TYPEC_TCPCI is not set
CONFIG_TYPEC_FUSB302=m
# CONFIG_TYPEC_TPS6598X is not set
# CONFIG_TYPEC_ANX7411 is not set
CONFIG_TYPEC_RT1719=m
CONFIG_TYPEC_HD3SS3220=m
CONFIG_TYPEC_STUSB160X=m
CONFIG_TYPEC_QCOM_PMIC=m
# CONFIG_TYPEC_WUSB3801 is not set

#
# USB Type-C Multiplexer/DeMultiplexer Switch support
#
# CONFIG_TYPEC_MUX_FSA4480 is not set
# CONFIG_TYPEC_MUX_PI3USB30532 is not set
# end of USB Type-C Multiplexer/DeMultiplexer Switch support

#
# USB Type-C Alternate Mode drivers
#
CONFIG_TYPEC_DP_ALTMODE=m
# CONFIG_TYPEC_NVIDIA_ALTMODE is not set
# end of USB Type-C Alternate Mode drivers

CONFIG_USB_ROLE_SWITCH=y
CONFIG_MMC=m
CONFIG_PWRSEQ_EMMC=m
# CONFIG_PWRSEQ_SIMPLE is not set
# CONFIG_SDIO_UART is not set
CONFIG_MMC_TEST=m

#
# MMC/SD/SDIO Host Controller Drivers
#
CONFIG_MMC_DEBUG=y
# CONFIG_MMC_SDHCI is not set
# CONFIG_MMC_MESON_GX is not set
CONFIG_MMC_MESON_MX_SDHC=m
CONFIG_MMC_MESON_MX_SDIO=m
CONFIG_MMC_MOXART=m
# CONFIG_MMC_OMAP_HS is not set
# CONFIG_MMC_TIFM_SD is not set
CONFIG_MMC_DAVINCI=m
# CONFIG_MMC_S3C is not set
# CONFIG_MMC_TMIO is not set
# CONFIG_MMC_SDHI is not set
# CONFIG_MMC_UNIPHIER is not set
CONFIG_MMC_CB710=m
CONFIG_MMC_VIA_SDMMC=m
CONFIG_MMC_DW=m
CONFIG_MMC_DW_PLTFM=m
# CONFIG_MMC_DW_BLUEFIELD is not set
CONFIG_MMC_DW_EXYNOS=m
# CONFIG_MMC_DW_HI3798CV200 is not set
CONFIG_MMC_DW_K3=m
CONFIG_MMC_DW_PCI=m
CONFIG_MMC_SH_MMCIF=m
# CONFIG_MMC_VUB300 is not set
CONFIG_MMC_USHC=m
CONFIG_MMC_USDHI6ROL0=m
CONFIG_MMC_REALTEK_PCI=m
CONFIG_MMC_SUNXI=m
CONFIG_MMC_CQHCI=m
CONFIG_MMC_HSQ=m
# CONFIG_MMC_TOSHIBA_PCI is not set
CONFIG_MMC_BCM2835=m
CONFIG_MMC_MTK=m
CONFIG_MMC_OWL=m
CONFIG_MMC_LITEX=m
CONFIG_MEMSTICK=y
# CONFIG_MEMSTICK_DEBUG is not set

#
# MemoryStick drivers
#
CONFIG_MEMSTICK_UNSAFE_RESUME=y

#
# MemoryStick Host Controller Drivers
#
# CONFIG_MEMSTICK_TIFM_MS is not set
CONFIG_MEMSTICK_JMICRON_38X=y
# CONFIG_MEMSTICK_R592 is not set
# CONFIG_MEMSTICK_REALTEK_PCI is not set
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
# CONFIG_LEDS_CLASS_FLASH is not set
# CONFIG_LEDS_CLASS_MULTICOLOR is not set
# CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set

#
# LED drivers
#
CONFIG_LEDS_AN30259A=y
CONFIG_LEDS_ARIEL=m
# CONFIG_LEDS_AW2013 is not set
CONFIG_LEDS_BCM6328=m
CONFIG_LEDS_BCM6358=y
CONFIG_LEDS_LM3530=y
CONFIG_LEDS_LM3532=y
CONFIG_LEDS_LM3533=m
CONFIG_LEDS_LM3642=m
CONFIG_LEDS_LM3692X=y
# CONFIG_LEDS_MT6323 is not set
CONFIG_LEDS_S3C24XX=m
CONFIG_LEDS_COBALT_QUBE=y
# CONFIG_LEDS_COBALT_RAQ is not set
CONFIG_LEDS_PCA9532=m
CONFIG_LEDS_PCA9532_GPIO=y
# CONFIG_LEDS_GPIO is not set
CONFIG_LEDS_LP3944=y
CONFIG_LEDS_LP3952=m
CONFIG_LEDS_LP50XX=y
# CONFIG_LEDS_LP55XX_COMMON is not set
CONFIG_LEDS_LP8788=m
CONFIG_LEDS_LP8860=m
CONFIG_LEDS_PCA955X=m
CONFIG_LEDS_PCA955X_GPIO=y
# CONFIG_LEDS_PCA963X is not set
CONFIG_LEDS_DA903X=m
CONFIG_LEDS_DA9052=m
CONFIG_LEDS_PWM=y
CONFIG_LEDS_REGULATOR=m
# CONFIG_LEDS_BD2802 is not set
# CONFIG_LEDS_LT3593 is not set
CONFIG_LEDS_ADP5520=y
CONFIG_LEDS_MC13783=m
CONFIG_LEDS_NS2=m
# CONFIG_LEDS_NETXBIG is not set
CONFIG_LEDS_ASIC3=y
# CONFIG_LEDS_TCA6507 is not set
# CONFIG_LEDS_TLC591XX is not set
CONFIG_LEDS_LM355x=y
CONFIG_LEDS_OT200=m
# CONFIG_LEDS_IS31FL319X is not set
CONFIG_LEDS_IS31FL32XX=m

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
# CONFIG_LEDS_BLINKM is not set
CONFIG_LEDS_SYSCON=y
CONFIG_LEDS_PM8058=y
CONFIG_LEDS_MLXREG=y
CONFIG_LEDS_USER=m
CONFIG_LEDS_TI_LMU_COMMON=y
CONFIG_LEDS_LM3697=y
# CONFIG_LEDS_TPS6105X is not set
CONFIG_LEDS_IP30=m
# CONFIG_LEDS_ACER_A500 is not set
CONFIG_LEDS_BCM63138=y
# CONFIG_LEDS_LGM is not set

#
# Flash and Torch LED drivers
#

#
# RGB LED drivers
#

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
# CONFIG_LEDS_TRIGGER_TIMER is not set
CONFIG_LEDS_TRIGGER_ONESHOT=m
CONFIG_LEDS_TRIGGER_HEARTBEAT=y
CONFIG_LEDS_TRIGGER_BACKLIGHT=m
CONFIG_LEDS_TRIGGER_CPU=y
# CONFIG_LEDS_TRIGGER_ACTIVITY is not set
# CONFIG_LEDS_TRIGGER_GPIO is not set
CONFIG_LEDS_TRIGGER_DEFAULT_ON=m

#
# iptables trigger is under Netfilter config (LED target)
#
CONFIG_LEDS_TRIGGER_TRANSIENT=m
# CONFIG_LEDS_TRIGGER_CAMERA is not set
# CONFIG_LEDS_TRIGGER_PANIC is not set
CONFIG_LEDS_TRIGGER_NETDEV=m
CONFIG_LEDS_TRIGGER_PATTERN=m
CONFIG_LEDS_TRIGGER_AUDIO=m
CONFIG_LEDS_TRIGGER_TTY=m

#
# Simple LED drivers
#
# CONFIG_ACCESSIBILITY is not set
# CONFIG_RTC_CLASS is not set
# CONFIG_DMADEVICES is not set

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
# CONFIG_SW_SYNC is not set
# CONFIG_UDMABUF is not set
CONFIG_DMABUF_MOVE_NOTIFY=y
CONFIG_DMABUF_DEBUG=y
CONFIG_DMABUF_SELFTESTS=m
CONFIG_DMABUF_HEAPS=y
CONFIG_DMABUF_SYSFS_STATS=y
CONFIG_DMABUF_HEAPS_SYSTEM=y
# end of DMABUF options

CONFIG_AUXDISPLAY=y
CONFIG_CHARLCD=y
CONFIG_LINEDISP=m
CONFIG_HD44780_COMMON=y
# CONFIG_HD44780 is not set
# CONFIG_KS0108 is not set
# CONFIG_IMG_ASCII_LCD is not set
CONFIG_HT16K33=m
CONFIG_LCD2S=y
CONFIG_PARPORT_PANEL=y
CONFIG_PANEL_PARPORT=0
CONFIG_PANEL_PROFILE=5
CONFIG_PANEL_CHANGE_MESSAGE=y
CONFIG_PANEL_BOOT_MESSAGE=""
# CONFIG_CHARLCD_BL_OFF is not set
# CONFIG_CHARLCD_BL_ON is not set
CONFIG_CHARLCD_BL_FLASH=y
# CONFIG_PANEL is not set
CONFIG_UIO=y
CONFIG_UIO_CIF=y
# CONFIG_UIO_PDRV_GENIRQ is not set
CONFIG_UIO_DMEM_GENIRQ=y
# CONFIG_UIO_AEC is not set
CONFIG_UIO_SERCOS3=y
# CONFIG_UIO_PCI_GENERIC is not set
# CONFIG_UIO_NETX is not set
# CONFIG_UIO_PRUSS is not set
CONFIG_UIO_MF624=y
# CONFIG_UIO_DFL is not set
CONFIG_VFIO=m
CONFIG_VFIO_VIRQFD=m
# CONFIG_VFIO_NOIOMMU is not set
CONFIG_VFIO_PCI_CORE=m
CONFIG_VFIO_PCI_MMAP=y
CONFIG_VFIO_PCI_INTX=y
CONFIG_VFIO_PCI=m
# CONFIG_VFIO_PLATFORM is not set
CONFIG_VFIO_MDEV=m
CONFIG_IRQ_BYPASS_MANAGER=m
CONFIG_VIRT_DRIVERS=y
CONFIG_VIRTIO_ANCHOR=y
CONFIG_VIRTIO=y
# CONFIG_VIRTIO_MENU is not set
CONFIG_VDPA=m
CONFIG_VDPA_USER=m
CONFIG_IFCVF=m
# CONFIG_VP_VDPA is not set
CONFIG_VHOST_IOTLB=m
CONFIG_VHOST=m
CONFIG_VHOST_MENU=y
CONFIG_VHOST_NET=m
CONFIG_VHOST_VDPA=m
# CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set

#
# Microsoft Hyper-V guest support
#
# end of Microsoft Hyper-V guest support

# CONFIG_GREYBUS is not set
CONFIG_COMEDI=y
# CONFIG_COMEDI_DEBUG is not set
CONFIG_COMEDI_DEFAULT_BUF_SIZE_KB=2048
CONFIG_COMEDI_DEFAULT_BUF_MAXSIZE_KB=20480
CONFIG_COMEDI_MISC_DRIVERS=y
CONFIG_COMEDI_BOND=y
# CONFIG_COMEDI_TEST is not set
CONFIG_COMEDI_PARPORT=m
CONFIG_COMEDI_SSV_DNP=m
# CONFIG_COMEDI_ISA_DRIVERS is not set
# CONFIG_COMEDI_PCI_DRIVERS is not set
# CONFIG_COMEDI_USB_DRIVERS is not set
# CONFIG_COMEDI_8255_SA is not set
CONFIG_COMEDI_KCOMEDILIB=y
CONFIG_COMEDI_NI_ROUTING=m
CONFIG_COMEDI_TESTS=y
# CONFIG_COMEDI_TESTS_EXAMPLE is not set
CONFIG_COMEDI_TESTS_NI_ROUTES=m
# CONFIG_STAGING is not set
CONFIG_GOLDFISH=y
CONFIG_GOLDFISH_PIPE=y
# CONFIG_CHROME_PLATFORMS is not set
# CONFIG_MELLANOX_PLATFORM is not set
CONFIG_OLPC_XO175=y
CONFIG_SURFACE_PLATFORMS=y
CONFIG_HAVE_CLK=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y

#
# Clock driver for ARM Reference designs
#
CONFIG_CLK_ICST=y
CONFIG_CLK_SP810=y
# end of Clock driver for ARM Reference designs

# CONFIG_CLK_HSDK is not set
# CONFIG_COMMON_CLK_APPLE_NCO is not set
CONFIG_COMMON_CLK_MAX77686=m
# CONFIG_COMMON_CLK_MAX9485 is not set
CONFIG_COMMON_CLK_RK808=m
CONFIG_COMMON_CLK_HI655X=y
# CONFIG_COMMON_CLK_SCMI is not set
CONFIG_COMMON_CLK_SCPI=m
# CONFIG_COMMON_CLK_SI5341 is not set
CONFIG_COMMON_CLK_SI5351=y
CONFIG_COMMON_CLK_SI514=y
CONFIG_COMMON_CLK_SI544=m
CONFIG_COMMON_CLK_SI570=y
CONFIG_COMMON_CLK_BM1880=y
CONFIG_COMMON_CLK_CDCE706=y
CONFIG_COMMON_CLK_TPS68470=m
CONFIG_COMMON_CLK_CDCE925=y
# CONFIG_COMMON_CLK_CS2000_CP is not set
# CONFIG_COMMON_CLK_EN7523 is not set
# CONFIG_COMMON_CLK_FSL_FLEXSPI is not set
CONFIG_COMMON_CLK_FSL_SAI=y
CONFIG_COMMON_CLK_GEMINI=y
# CONFIG_COMMON_CLK_LAN966X is not set
# CONFIG_COMMON_CLK_ASPEED is not set
CONFIG_COMMON_CLK_S2MPS11=y
CONFIG_COMMON_CLK_AXI_CLKGEN=y
# CONFIG_CLK_QORIQ is not set
CONFIG_CLK_LS1028A_PLLDIG=m
CONFIG_COMMON_CLK_XGENE=y
CONFIG_COMMON_CLK_PALMAS=y
CONFIG_COMMON_CLK_PWM=y
CONFIG_COMMON_CLK_OXNAS=y
CONFIG_COMMON_CLK_RS9_PCIE=m
CONFIG_COMMON_CLK_VC5=m
CONFIG_COMMON_CLK_VC7=y
CONFIG_COMMON_CLK_MMP2_AUDIO=m
CONFIG_COMMON_CLK_BD718XX=y
CONFIG_COMMON_CLK_FIXED_MMIO=y
# CONFIG_CLK_ACTIONS is not set
CONFIG_CLK_BAIKAL_T1=y
CONFIG_CLK_BT1_CCU_PLL=y
# CONFIG_CLK_BT1_CCU_DIV is not set
CONFIG_CLK_BT1_CCU_RST=y
# CONFIG_CLK_BCM2711_DVP is not set
# CONFIG_CLK_BCM2835 is not set
CONFIG_CLK_BCM_63XX=y
# CONFIG_CLK_BCM_63XX_GATE is not set
# CONFIG_CLK_BCM_KONA is not set
CONFIG_COMMON_CLK_IPROC=y
CONFIG_CLK_BCM_CYGNUS=y
CONFIG_CLK_BCM_HR2=y
# CONFIG_CLK_BCM_NSP is not set
# CONFIG_CLK_BCM_NS2 is not set
# CONFIG_CLK_BCM_SR is not set
# CONFIG_CLK_RASPBERRYPI is not set
CONFIG_COMMON_CLK_HI3516CV300=y
CONFIG_COMMON_CLK_HI3519=y
CONFIG_COMMON_CLK_HI3559A=y
# CONFIG_COMMON_CLK_HI3660 is not set
# CONFIG_COMMON_CLK_HI3670 is not set
# CONFIG_COMMON_CLK_HI3798CV200 is not set
# CONFIG_COMMON_CLK_HI6220 is not set
CONFIG_RESET_HISI=y
# CONFIG_STUB_CLK_HI6220 is not set
CONFIG_STUB_CLK_HI3660=y
CONFIG_COMMON_CLK_BOSTON=y
CONFIG_MXC_CLK=y
CONFIG_CLK_IMX8MM=y
# CONFIG_CLK_IMX8MN is not set
CONFIG_CLK_IMX8MP=y
# CONFIG_CLK_IMX8MQ is not set
CONFIG_CLK_IMX8ULP=m
CONFIG_CLK_IMX93=y

#
# Ingenic SoCs drivers
#
CONFIG_INGENIC_CGU_COMMON=y
CONFIG_INGENIC_CGU_JZ4740=y
# CONFIG_INGENIC_CGU_JZ4725B is not set
# CONFIG_INGENIC_CGU_JZ4760 is not set
# CONFIG_INGENIC_CGU_JZ4770 is not set
CONFIG_INGENIC_CGU_JZ4780=y
CONFIG_INGENIC_CGU_X1000=y
# CONFIG_INGENIC_CGU_X1830 is not set
CONFIG_INGENIC_TCU_CLK=y
# end of Ingenic SoCs drivers

CONFIG_COMMON_CLK_KEYSTONE=y
CONFIG_TI_SYSCON_CLK=m

#
# Clock driver for MediaTek SoC
#
CONFIG_COMMON_CLK_MEDIATEK=y
CONFIG_COMMON_CLK_MT2701=y
CONFIG_COMMON_CLK_MT2701_MMSYS=y
CONFIG_COMMON_CLK_MT2701_IMGSYS=y
CONFIG_COMMON_CLK_MT2701_VDECSYS=y
CONFIG_COMMON_CLK_MT2701_HIFSYS=y
# CONFIG_COMMON_CLK_MT2701_ETHSYS is not set
# CONFIG_COMMON_CLK_MT2701_BDPSYS is not set
# CONFIG_COMMON_CLK_MT2701_AUDSYS is not set
CONFIG_COMMON_CLK_MT2701_G3DSYS=y
CONFIG_COMMON_CLK_MT2712=y
CONFIG_COMMON_CLK_MT2712_BDPSYS=y
CONFIG_COMMON_CLK_MT2712_IMGSYS=y
CONFIG_COMMON_CLK_MT2712_JPGDECSYS=y
# CONFIG_COMMON_CLK_MT2712_MFGCFG is not set
# CONFIG_COMMON_CLK_MT2712_MMSYS is not set
# CONFIG_COMMON_CLK_MT2712_VDECSYS is not set
CONFIG_COMMON_CLK_MT2712_VENCSYS=y
# CONFIG_COMMON_CLK_MT6765 is not set
CONFIG_COMMON_CLK_MT6779=m
# CONFIG_COMMON_CLK_MT6779_MMSYS is not set
# CONFIG_COMMON_CLK_MT6779_IMGSYS is not set
CONFIG_COMMON_CLK_MT6779_IPESYS=m
# CONFIG_COMMON_CLK_MT6779_CAMSYS is not set
# CONFIG_COMMON_CLK_MT6779_VDECSYS is not set
# CONFIG_COMMON_CLK_MT6779_VENCSYS is not set
CONFIG_COMMON_CLK_MT6779_MFGCFG=m
# CONFIG_COMMON_CLK_MT6779_AUDSYS is not set
CONFIG_COMMON_CLK_MT6795=m
CONFIG_COMMON_CLK_MT6795_MFGCFG=m
CONFIG_COMMON_CLK_MT6795_MMSYS=m
CONFIG_COMMON_CLK_MT6795_VDECSYS=m
# CONFIG_COMMON_CLK_MT6795_VENCSYS is not set
# CONFIG_COMMON_CLK_MT6797 is not set
# CONFIG_COMMON_CLK_MT7622 is not set
CONFIG_COMMON_CLK_MT7629=y
CONFIG_COMMON_CLK_MT7629_ETHSYS=y
# CONFIG_COMMON_CLK_MT7629_HIFSYS is not set
CONFIG_COMMON_CLK_MT7986=y
CONFIG_COMMON_CLK_MT7986_ETHSYS=y
CONFIG_COMMON_CLK_MT8135=y
# CONFIG_COMMON_CLK_MT8167 is not set
# CONFIG_COMMON_CLK_MT8173 is not set
# CONFIG_COMMON_CLK_MT8183 is not set
CONFIG_COMMON_CLK_MT8186=y
# CONFIG_COMMON_CLK_MT8192 is not set
CONFIG_COMMON_CLK_MT8195=y
CONFIG_COMMON_CLK_MT8365=m
CONFIG_COMMON_CLK_MT8365_APU=m
# CONFIG_COMMON_CLK_MT8365_CAM is not set
# CONFIG_COMMON_CLK_MT8365_MFG is not set
CONFIG_COMMON_CLK_MT8365_MMSYS=m
# CONFIG_COMMON_CLK_MT8365_VDEC is not set
CONFIG_COMMON_CLK_MT8365_VENC=m
CONFIG_COMMON_CLK_MT8516=y
CONFIG_COMMON_CLK_MT8516_AUDSYS=y
# end of Clock driver for MediaTek SoC

#
# Clock support for Amlogic platforms
#
# end of Clock support for Amlogic platforms

CONFIG_MSTAR_MSC313_MPLL=y
CONFIG_MCHP_CLK_MPFS=y
CONFIG_COMMON_CLK_PISTACHIO=y
# CONFIG_COMMON_CLK_QCOM is not set
CONFIG_CLK_MT7621=y
# CONFIG_CLK_RENESAS is not set
CONFIG_COMMON_CLK_SAMSUNG=y
# CONFIG_S3C64XX_COMMON_CLK is not set
# CONFIG_S5PV210_COMMON_CLK is not set
CONFIG_EXYNOS_3250_COMMON_CLK=y
CONFIG_EXYNOS_4_COMMON_CLK=y
# CONFIG_EXYNOS_5250_COMMON_CLK is not set
# CONFIG_EXYNOS_5260_COMMON_CLK is not set
# CONFIG_EXYNOS_5410_COMMON_CLK is not set
CONFIG_EXYNOS_5420_COMMON_CLK=y
# CONFIG_EXYNOS_ARM64_COMMON_CLK is not set
CONFIG_EXYNOS_AUDSS_CLK_CON=m
# CONFIG_EXYNOS_CLKOUT is not set
# CONFIG_S3C2410_COMMON_CLK is not set
CONFIG_S3C2412_COMMON_CLK=y
# CONFIG_S3C2443_COMMON_CLK is not set
# CONFIG_CLK_SIFIVE is not set
# CONFIG_CLK_INTEL_SOCFPGA is not set
CONFIG_SPRD_COMMON_CLK=y
# CONFIG_SPRD_SC9860_CLK is not set
CONFIG_SPRD_SC9863A_CLK=y
CONFIG_SPRD_UMS512_CLK=y
# CONFIG_CLK_STARFIVE_JH7100 is not set
# CONFIG_CLK_SUNXI is not set
CONFIG_SUNXI_CCU=y
CONFIG_SUNIV_F1C100S_CCU=m
CONFIG_SUN20I_D1_CCU=y
CONFIG_SUN20I_D1_R_CCU=y
CONFIG_SUN50I_A64_CCU=m
CONFIG_SUN50I_A100_CCU=y
CONFIG_SUN50I_A100_R_CCU=y
CONFIG_SUN50I_H6_CCU=m
CONFIG_SUN50I_H616_CCU=m
# CONFIG_SUN50I_H6_R_CCU is not set
# CONFIG_SUN4I_A10_CCU is not set
# CONFIG_SUN5I_CCU is not set
CONFIG_SUN6I_A31_CCU=m
CONFIG_SUN6I_RTC_CCU=y
CONFIG_SUN8I_A23_CCU=y
CONFIG_SUN8I_A33_CCU=m
# CONFIG_SUN8I_A83T_CCU is not set
CONFIG_SUN8I_H3_CCU=y
# CONFIG_SUN8I_V3S_CCU is not set
CONFIG_SUN8I_DE2_CCU=m
CONFIG_SUN8I_R40_CCU=m
# CONFIG_SUN9I_A80_CCU is not set
# CONFIG_SUN8I_R_CCU is not set
CONFIG_COMMON_CLK_TI_ADPLL=y
# CONFIG_CLK_UNIPHIER is not set
# CONFIG_COMMON_CLK_VISCONTI is not set
CONFIG_CLK_LGM_CGU=y
CONFIG_XILINX_VCU=y
# CONFIG_COMMON_CLK_XLNX_CLKWZRD is not set
CONFIG_COMMON_CLK_ZYNQMP=y
CONFIG_HWSPINLOCK=y
# CONFIG_HWSPINLOCK_OMAP is not set
# CONFIG_HWSPINLOCK_QCOM is not set
CONFIG_HWSPINLOCK_SPRD=m
# CONFIG_HWSPINLOCK_STM32 is not set
CONFIG_HWSPINLOCK_SUN6I=y
# CONFIG_HSEM_U8500 is not set

#
# Clock Source drivers
#
CONFIG_TIMER_OF=y
CONFIG_TIMER_PROBE=y
CONFIG_CLKSRC_MMIO=y
# CONFIG_BCM2835_TIMER is not set
CONFIG_BCM_KONA_TIMER=y
CONFIG_DAVINCI_TIMER=y
CONFIG_DIGICOLOR_TIMER=y
# CONFIG_OMAP_DM_TIMER is not set
CONFIG_DW_APB_TIMER=y
CONFIG_FTTMR010_TIMER=y
# CONFIG_IXP4XX_TIMER is not set
CONFIG_MESON6_TIMER=y
CONFIG_OWL_TIMER=y
# CONFIG_RDA_TIMER is not set
CONFIG_SUN4I_TIMER=y
# CONFIG_SUN5I_HSTIMER is not set
CONFIG_TEGRA_TIMER=y
# CONFIG_VT8500_TIMER is not set
CONFIG_NPCM7XX_TIMER=y
# CONFIG_CADENCE_TTC_TIMER is not set
CONFIG_ASM9260_TIMER=y
# CONFIG_CLKSRC_DBX500_PRCMU is not set
CONFIG_CLPS711X_TIMER=y
CONFIG_MXS_TIMER=y
# CONFIG_NSPIRE_TIMER is not set
CONFIG_INTEGRATOR_AP_TIMER=y
# CONFIG_CLKSRC_PISTACHIO is not set
CONFIG_CLKSRC_STM32_LP=y
CONFIG_ARMV7M_SYSTICK=y
CONFIG_ATMEL_PIT=y
# CONFIG_ATMEL_ST is not set
CONFIG_CLKSRC_SAMSUNG_PWM=y
# CONFIG_FSL_FTM_TIMER is not set
# CONFIG_OXNAS_RPS_TIMER is not set
# CONFIG_MTK_TIMER is not set
CONFIG_SPRD_TIMER=y
CONFIG_CLKSRC_JCORE_PIT=y
CONFIG_SH_TIMER_CMT=y
CONFIG_SH_TIMER_MTU2=y
# CONFIG_RENESAS_OSTM is not set
CONFIG_SH_TIMER_TMU=y
# CONFIG_EM_TIMER_STI is not set
# CONFIG_CLKSRC_PXA is not set
CONFIG_TIMER_IMX_SYS_CTR=y
CONFIG_CLKSRC_ST_LPC=y
# CONFIG_GXP_TIMER is not set
CONFIG_MSC313E_TIMER=y
# CONFIG_INGENIC_TIMER is not set
# CONFIG_INGENIC_SYSOST is not set
# CONFIG_INGENIC_OST is not set
CONFIG_MICROCHIP_PIT64B=y
# end of Clock Source drivers

CONFIG_MAILBOX=y
# CONFIG_IMX_MBOX is not set
CONFIG_PLATFORM_MHU=y
# CONFIG_ARMADA_37XX_RWTM_MBOX is not set
# CONFIG_ROCKCHIP_MBOX is not set
CONFIG_ALTERA_MBOX=y
CONFIG_HI3660_MBOX=y
CONFIG_HI6220_MBOX=y
CONFIG_MAILBOX_TEST=y
# CONFIG_POLARFIRE_SOC_MAILBOX is not set
CONFIG_QCOM_APCS_IPC=m
CONFIG_BCM_PDC_MBOX=m
CONFIG_STM32_IPCC=m
# CONFIG_MTK_ADSP_MBOX is not set
CONFIG_MTK_CMDQ_MBOX=y
# CONFIG_SUN6I_MSGBOX is not set
CONFIG_SPRD_MBOX=y
# CONFIG_QCOM_IPCC is not set
CONFIG_IOMMU_IOVA=m
CONFIG_IOMMU_API=y
CONFIG_IOMMU_SUPPORT=y

#
# Generic IOMMU Pagetable Support
#
CONFIG_IOMMU_IO_PGTABLE=y
CONFIG_IOMMU_IO_PGTABLE_ARMV7S=y
# CONFIG_IOMMU_IO_PGTABLE_ARMV7S_SELFTEST is not set
# end of Generic IOMMU Pagetable Support

CONFIG_IOMMU_DEBUGFS=y
# CONFIG_IOMMU_DEFAULT_DMA_STRICT is not set
# CONFIG_IOMMU_DEFAULT_DMA_LAZY is not set
CONFIG_IOMMU_DEFAULT_PASSTHROUGH=y
CONFIG_OF_IOMMU=y
# CONFIG_OMAP_IOMMU is not set
# CONFIG_ROCKCHIP_IOMMU is not set
# CONFIG_SUN50I_IOMMU is not set
CONFIG_S390_CCW_IOMMU=y
CONFIG_S390_AP_IOMMU=y
# CONFIG_MTK_IOMMU is not set
# CONFIG_SPRD_IOMMU is not set

#
# Remoteproc drivers
#
# CONFIG_REMOTEPROC is not set
# end of Remoteproc drivers

#
# Rpmsg drivers
#
CONFIG_RPMSG=y
# CONFIG_RPMSG_CHAR is not set
CONFIG_RPMSG_CTRL=m
CONFIG_RPMSG_NS=y
CONFIG_RPMSG_QCOM_GLINK=m
CONFIG_RPMSG_QCOM_GLINK_RPM=m
CONFIG_RPMSG_VIRTIO=y
# end of Rpmsg drivers

CONFIG_SOUNDWIRE=y

#
# SoundWire Devices
#

#
# SOC (System On Chip) specific Drivers
#

#
# Amlogic SoC drivers
#
CONFIG_MESON_CANVAS=m
CONFIG_MESON_CLK_MEASURE=y
CONFIG_MESON_GX_SOCINFO=y
CONFIG_MESON_MX_SOCINFO=y
# end of Amlogic SoC drivers

#
# Apple SoC drivers
#
# CONFIG_APPLE_RTKIT is not set
CONFIG_APPLE_SART=m
# end of Apple SoC drivers

#
# ASPEED SoC drivers
#
CONFIG_ASPEED_LPC_CTRL=y
CONFIG_ASPEED_LPC_SNOOP=m
CONFIG_ASPEED_UART_ROUTING=m
CONFIG_ASPEED_P2A_CTRL=y
CONFIG_ASPEED_SOCINFO=y
# end of ASPEED SoC drivers

# CONFIG_AT91_SOC_ID is not set
# CONFIG_AT91_SOC_SFR is not set

#
# Broadcom SoC drivers
#
# CONFIG_BCM2835_POWER is not set
# CONFIG_SOC_BCM63XX is not set
# CONFIG_SOC_BRCMSTB is not set
# CONFIG_BCM_PMB is not set
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
# CONFIG_QUICC_ENGINE is not set
CONFIG_DPAA2_CONSOLE=m
# end of NXP/Freescale QorIQ SoC drivers

#
# fujitsu SoC drivers
#
# end of fujitsu SoC drivers

#
# i.MX SoC drivers
#
CONFIG_SOC_IMX8M=y
CONFIG_SOC_IMX9=m
# end of i.MX SoC drivers

#
# IXP4xx SoC drivers
#
CONFIG_IXP4XX_QMGR=y
CONFIG_IXP4XX_NPE=m
# end of IXP4xx SoC drivers

#
# Enable LiteX SoC Builder specific drivers
#
CONFIG_LITEX=y
CONFIG_LITEX_SOC_CONTROLLER=y
# end of Enable LiteX SoC Builder specific drivers

#
# MediaTek SoC drivers
#
CONFIG_MTK_CMDQ=y
CONFIG_MTK_DEVAPC=y
CONFIG_MTK_INFRACFG=y
CONFIG_MTK_PMIC_WRAP=y
CONFIG_MTK_SCPSYS=y
CONFIG_MTK_MMSYS=y
# CONFIG_MTK_SVS is not set
# end of MediaTek SoC drivers

#
# Qualcomm SoC drivers
#
CONFIG_QCOM_COMMAND_DB=y
CONFIG_QCOM_GENI_SE=m
CONFIG_QCOM_GSBI=y
# CONFIG_QCOM_LLCC is not set
CONFIG_QCOM_PDR_HELPERS=m
CONFIG_QCOM_QMI_HELPERS=m
# CONFIG_QCOM_RPMH is not set
# CONFIG_QCOM_SMEM is not set
CONFIG_QCOM_SMD_RPM=y
CONFIG_QCOM_SPM=y
CONFIG_QCOM_WCNSS_CTRL=m
CONFIG_QCOM_APR=m
CONFIG_QCOM_ICC_BWMON=m
# end of Qualcomm SoC drivers

CONFIG_SOC_RENESAS=y
CONFIG_RST_RCAR=y
CONFIG_SYSC_RCAR=y
CONFIG_SYSC_RCAR_GEN4=y
# CONFIG_SYSC_R8A77995 is not set
# CONFIG_SYSC_R8A7794 is not set
# CONFIG_SYSC_R8A77990 is not set
CONFIG_SYSC_R8A7779=y
CONFIG_SYSC_R8A7790=y
# CONFIG_SYSC_R8A7795 is not set
CONFIG_SYSC_R8A7791=y
CONFIG_SYSC_R8A77965=y
# CONFIG_SYSC_R8A77960 is not set
# CONFIG_SYSC_R8A77961 is not set
CONFIG_SYSC_R8A779F0=y
# CONFIG_SYSC_R8A7792 is not set
# CONFIG_SYSC_R8A77980 is not set
CONFIG_SYSC_R8A77970=y
# CONFIG_SYSC_R8A779A0 is not set
# CONFIG_SYSC_R8A779G0 is not set
# CONFIG_SYSC_RMOBILE is not set
CONFIG_SYSC_R8A77470=y
# CONFIG_SYSC_R8A7745 is not set
# CONFIG_SYSC_R8A7742 is not set
# CONFIG_SYSC_R8A7743 is not set
# CONFIG_SYSC_R8A774C0 is not set
CONFIG_SYSC_R8A774E1=y
CONFIG_SYSC_R8A774A1=y
CONFIG_SYSC_R8A774B1=y
CONFIG_ROCKCHIP_GRF=y
CONFIG_ROCKCHIP_IODOMAIN=m
CONFIG_SOC_SAMSUNG=y
# CONFIG_EXYNOS_ASV_ARM is not set
CONFIG_EXYNOS_CHIPID=m
CONFIG_EXYNOS_USI=y
CONFIG_EXYNOS_PM_DOMAINS=y
# CONFIG_EXYNOS_REGULATOR_COUPLER is not set
CONFIG_SOC_TEGRA20_VOLTAGE_COUPLER=y
CONFIG_SOC_TEGRA30_VOLTAGE_COUPLER=y
# CONFIG_SOC_TI is not set
# CONFIG_UX500_SOC_ID is not set

#
# Xilinx SoC drivers
#
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

CONFIG_PM_DEVFREQ=y

#
# DEVFREQ Governors
#
CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=y
# CONFIG_DEVFREQ_GOV_PERFORMANCE is not set
CONFIG_DEVFREQ_GOV_POWERSAVE=m
CONFIG_DEVFREQ_GOV_USERSPACE=y
CONFIG_DEVFREQ_GOV_PASSIVE=y

#
# DEVFREQ Drivers
#
# CONFIG_ARM_EXYNOS_BUS_DEVFREQ is not set
CONFIG_ARM_IMX_BUS_DEVFREQ=y
# CONFIG_ARM_TEGRA_DEVFREQ is not set
CONFIG_ARM_MEDIATEK_CCI_DEVFREQ=y
CONFIG_ARM_SUN8I_A33_MBUS_DEVFREQ=y
# CONFIG_PM_DEVFREQ_EVENT is not set
CONFIG_EXTCON=y

#
# Extcon Device Drivers
#
CONFIG_EXTCON_ADC_JACK=m
CONFIG_EXTCON_FSA9480=m
CONFIG_EXTCON_GPIO=m
CONFIG_EXTCON_MAX14577=y
CONFIG_EXTCON_MAX3355=y
CONFIG_EXTCON_MAX77693=m
# CONFIG_EXTCON_MAX77843 is not set
CONFIG_EXTCON_PALMAS=m
CONFIG_EXTCON_PTN5150=m
CONFIG_EXTCON_QCOM_SPMI_MISC=m
CONFIG_EXTCON_RT8973A=y
CONFIG_EXTCON_SM5502=y
CONFIG_EXTCON_USB_GPIO=m
CONFIG_EXTCON_USBC_TUSB320=m
CONFIG_MEMORY=y
CONFIG_DDR=y
# CONFIG_ATMEL_SDRAMC is not set
CONFIG_ATMEL_EBI=y
CONFIG_BRCMSTB_DPFE=y
# CONFIG_BRCMSTB_MEMC is not set
CONFIG_BT1_L2_CTL=y
CONFIG_TI_AEMIF=m
CONFIG_TI_EMIF=y
CONFIG_OMAP_GPMC=y
# CONFIG_OMAP_GPMC_DEBUG is not set
CONFIG_FPGA_DFL_EMIF=m
# CONFIG_MVEBU_DEVBUS is not set
CONFIG_FSL_CORENET_CF=y
CONFIG_FSL_IFC=y
# CONFIG_JZ4780_NEMC is not set
# CONFIG_MTK_SMI is not set
CONFIG_DA8XX_DDRCTL=y
CONFIG_RENESAS_RPCIF=y
# CONFIG_STM32_FMC2_EBI is not set
CONFIG_SAMSUNG_MC=y
CONFIG_EXYNOS_SROM=y
# CONFIG_TEGRA_MC is not set
CONFIG_IIO=y
CONFIG_IIO_BUFFER=y
# CONFIG_IIO_BUFFER_CB is not set
CONFIG_IIO_BUFFER_DMA=y
CONFIG_IIO_BUFFER_DMAENGINE=y
CONFIG_IIO_BUFFER_HW_CONSUMER=y
CONFIG_IIO_KFIFO_BUF=y
CONFIG_IIO_TRIGGERED_BUFFER=y
CONFIG_IIO_CONFIGFS=m
CONFIG_IIO_TRIGGER=y
CONFIG_IIO_CONSUMERS_PER_TRIGGER=2
# CONFIG_IIO_SW_DEVICE is not set
CONFIG_IIO_SW_TRIGGER=m
CONFIG_IIO_TRIGGERED_EVENT=m

#
# Accelerometers
#
CONFIG_ADXL313=y
CONFIG_ADXL313_I2C=y
# CONFIG_ADXL345_I2C is not set
# CONFIG_ADXL355_I2C is not set
CONFIG_ADXL367=y
CONFIG_ADXL367_I2C=y
CONFIG_ADXL372=y
CONFIG_ADXL372_I2C=y
# CONFIG_BMA400 is not set
CONFIG_BMC150_ACCEL=y
CONFIG_BMC150_ACCEL_I2C=y
CONFIG_DA280=y
CONFIG_DA311=y
CONFIG_DMARD06=y
CONFIG_DMARD09=y
CONFIG_DMARD10=m
CONFIG_FXLS8962AF=y
CONFIG_FXLS8962AF_I2C=y
CONFIG_KXSD9=y
# CONFIG_KXSD9_I2C is not set
CONFIG_KXCJK1013=m
# CONFIG_MC3230 is not set
CONFIG_MMA7455=m
CONFIG_MMA7455_I2C=m
CONFIG_MMA7660=m
CONFIG_MMA8452=m
CONFIG_MMA9551_CORE=y
CONFIG_MMA9551=y
CONFIG_MMA9553=m
# CONFIG_MSA311 is not set
# CONFIG_MXC4005 is not set
# CONFIG_MXC6255 is not set
CONFIG_STK8312=m
CONFIG_STK8BA50=y
# end of Accelerometers

#
# Analog to digital converters
#
CONFIG_AD7091R5=y
CONFIG_AD7291=y
# CONFIG_AD7606_IFACE_PARALLEL is not set
CONFIG_AD799X=y
CONFIG_ADI_AXI_ADC=y
# CONFIG_ASPEED_ADC is not set
CONFIG_AT91_ADC=m
CONFIG_AT91_SAMA5D2_ADC=m
# CONFIG_AXP20X_ADC is not set
CONFIG_AXP288_ADC=y
CONFIG_BCM_IPROC_ADC=y
# CONFIG_BERLIN2_ADC is not set
CONFIG_CC10001_ADC=y
CONFIG_DA9150_GPADC=m
# CONFIG_DLN2_ADC is not set
CONFIG_ENVELOPE_DETECTOR=m
CONFIG_EXYNOS_ADC=m
CONFIG_FSL_MX25_ADC=m
CONFIG_HX711=m
CONFIG_INA2XX_ADC=m
# CONFIG_INGENIC_ADC is not set
# CONFIG_IMX7D_ADC is not set
# CONFIG_IMX8QXP_ADC is not set
# CONFIG_LP8788_ADC is not set
# CONFIG_LPC18XX_ADC is not set
CONFIG_LPC32XX_ADC=m
CONFIG_LTC2471=m
CONFIG_LTC2485=m
CONFIG_LTC2497=y
CONFIG_MAX1363=y
CONFIG_MAX9611=y
# CONFIG_MCP3422 is not set
CONFIG_MEDIATEK_MT6360_ADC=m
CONFIG_MEDIATEK_MT6577_AUXADC=y
CONFIG_MEN_Z188_ADC=y
CONFIG_MESON_SARADC=y
# CONFIG_MP2629_ADC is not set
CONFIG_NAU7802=m
CONFIG_NPCM_ADC=m
CONFIG_PALMAS_GPADC=m
CONFIG_QCOM_VADC_COMMON=y
CONFIG_QCOM_PM8XXX_XOADC=y
CONFIG_QCOM_SPMI_IADC=m
# CONFIG_QCOM_SPMI_VADC is not set
CONFIG_QCOM_SPMI_ADC5=m
CONFIG_RCAR_GYRO_ADC=y
CONFIG_RN5T618_ADC=m
# CONFIG_ROCKCHIP_SARADC is not set
CONFIG_RICHTEK_RTQ6056=y
CONFIG_RZG2L_ADC=m
# CONFIG_SC27XX_ADC is not set
CONFIG_SPEAR_ADC=y
CONFIG_SD_ADC_MODULATOR=m
CONFIG_STM32_ADC_CORE=y
# CONFIG_STM32_ADC is not set
CONFIG_STM32_DFSDM_CORE=m
# CONFIG_STM32_DFSDM_ADC is not set
# CONFIG_SUN4I_GPADC is not set
# CONFIG_TI_ADC081C is not set
CONFIG_TI_ADS1015=m
CONFIG_TI_AM335X_ADC=m
CONFIG_TWL4030_MADC=m
CONFIG_TWL6030_GPADC=m
CONFIG_VF610_ADC=m
# CONFIG_VIPERBOARD_ADC is not set
# CONFIG_XILINX_XADC is not set
CONFIG_XILINX_AMS=m
# end of Analog to digital converters

#
# Analog to digital and digital to analog converters
#
# end of Analog to digital and digital to analog converters

#
# Analog Front Ends
#
# CONFIG_IIO_RESCALE is not set
# end of Analog Front Ends

#
# Amplifiers
#
CONFIG_HMC425=y
# end of Amplifiers

#
# Capacitance to digital converters
#
CONFIG_AD7150=y
# CONFIG_AD7746 is not set
# end of Capacitance to digital converters

#
# Chemical Sensors
#
CONFIG_ATLAS_PH_SENSOR=y
CONFIG_ATLAS_EZO_SENSOR=y
# CONFIG_BME680 is not set
# CONFIG_CCS811 is not set
CONFIG_IAQCORE=y
CONFIG_PMS7003=m
CONFIG_SCD30_CORE=m
CONFIG_SCD30_I2C=m
# CONFIG_SCD30_SERIAL is not set
CONFIG_SCD4X=m
CONFIG_SENSIRION_SGP30=m
CONFIG_SENSIRION_SGP40=y
CONFIG_SPS30=m
CONFIG_SPS30_I2C=m
# CONFIG_SPS30_SERIAL is not set
CONFIG_SENSEAIR_SUNRISE_CO2=y
CONFIG_VZ89X=y
# end of Chemical Sensors

#
# Hid Sensor IIO Common
#
# end of Hid Sensor IIO Common

CONFIG_IIO_MS_SENSORS_I2C=m

#
# IIO SCMI Sensors
#
# CONFIG_IIO_SCMI is not set
# end of IIO SCMI Sensors

#
# SSP Sensor Common
#
# end of SSP Sensor Common

CONFIG_IIO_ST_SENSORS_I2C=m
CONFIG_IIO_ST_SENSORS_CORE=m

#
# Digital to analog converters
#
# CONFIG_AD5064 is not set
# CONFIG_AD5380 is not set
CONFIG_AD5446=y
CONFIG_AD5592R_BASE=m
CONFIG_AD5593R=m
CONFIG_AD5686=y
CONFIG_AD5696_I2C=y
CONFIG_DPOT_DAC=y
CONFIG_DS4424=m
CONFIG_LPC18XX_DAC=m
# CONFIG_M62332 is not set
# CONFIG_MAX517 is not set
# CONFIG_MAX5821 is not set
CONFIG_MCP4725=m
CONFIG_STM32_DAC=m
CONFIG_STM32_DAC_CORE=m
CONFIG_TI_DAC5571=m
CONFIG_VF610_DAC=y
# end of Digital to analog converters

#
# IIO dummy driver
#
# end of IIO dummy driver

#
# Filters
#
# end of Filters

#
# Frequency Synthesizers DDS/PLL
#

#
# Clock Generator/Distribution
#
# end of Clock Generator/Distribution

#
# Phase-Locked Loop (PLL) frequency synthesizers
#
# end of Phase-Locked Loop (PLL) frequency synthesizers
# end of Frequency Synthesizers DDS/PLL

#
# Digital gyroscope sensors
#
# CONFIG_BMG160 is not set
# CONFIG_FXAS21002C is not set
# CONFIG_MPU3050_I2C is not set
# CONFIG_IIO_ST_GYRO_3AXIS is not set
# CONFIG_ITG3200 is not set
# end of Digital gyroscope sensors

#
# Health Sensors
#

#
# Heart Rate Monitors
#
CONFIG_AFE4404=m
CONFIG_MAX30100=m
CONFIG_MAX30102=m
# end of Heart Rate Monitors
# end of Health Sensors

#
# Humidity sensors
#
CONFIG_AM2315=m
CONFIG_DHT11=m
CONFIG_HDC100X=y
CONFIG_HDC2010=y
# CONFIG_HTS221 is not set
# CONFIG_HTU21 is not set
# CONFIG_SI7005 is not set
# CONFIG_SI7020 is not set
# end of Humidity sensors

#
# Inertial measurement units
#
CONFIG_BMI160=y
CONFIG_BMI160_I2C=y
CONFIG_BOSCH_BNO055=y
CONFIG_BOSCH_BNO055_SERIAL=y
CONFIG_BOSCH_BNO055_I2C=m
CONFIG_FXOS8700=m
CONFIG_FXOS8700_I2C=m
CONFIG_KMX61=y
# CONFIG_INV_ICM42600_I2C is not set
CONFIG_INV_MPU6050_IIO=m
CONFIG_INV_MPU6050_I2C=m
# CONFIG_IIO_ST_LSM6DSX is not set
# end of Inertial measurement units

#
# Light sensors
#
CONFIG_ADJD_S311=m
CONFIG_ADUX1020=m
CONFIG_AL3010=m
CONFIG_AL3320A=m
CONFIG_APDS9300=y
# CONFIG_APDS9960 is not set
CONFIG_AS73211=y
CONFIG_BH1750=y
# CONFIG_BH1780 is not set
# CONFIG_CM32181 is not set
# CONFIG_CM3232 is not set
CONFIG_CM3323=y
# CONFIG_CM3605 is not set
# CONFIG_CM36651 is not set
CONFIG_GP2AP002=y
CONFIG_GP2AP020A00F=m
CONFIG_IQS621_ALS=m
CONFIG_SENSORS_ISL29018=m
CONFIG_SENSORS_ISL29028=y
CONFIG_ISL29125=m
CONFIG_JSA1212=m
# CONFIG_RPR0521 is not set
CONFIG_SENSORS_LM3533=m
CONFIG_LTR501=m
CONFIG_LTRF216A=y
# CONFIG_LV0104CS is not set
# CONFIG_MAX44000 is not set
# CONFIG_MAX44009 is not set
CONFIG_NOA1305=m
CONFIG_OPT3001=y
CONFIG_PA12203001=m
# CONFIG_SI1133 is not set
CONFIG_SI1145=y
# CONFIG_STK3310 is not set
CONFIG_ST_UVIS25=m
CONFIG_ST_UVIS25_I2C=m
# CONFIG_TCS3414 is not set
CONFIG_TCS3472=m
CONFIG_SENSORS_TSL2563=m
CONFIG_TSL2583=y
CONFIG_TSL2591=y
CONFIG_TSL2772=m
CONFIG_TSL4531=m
CONFIG_US5182D=y
CONFIG_VCNL4000=m
CONFIG_VCNL4035=m
# CONFIG_VEML6030 is not set
CONFIG_VEML6070=m
CONFIG_VL6180=y
CONFIG_ZOPT2201=m
# end of Light sensors

#
# Magnetometer sensors
#
CONFIG_AK8974=y
CONFIG_AK8975=y
CONFIG_AK09911=y
# CONFIG_BMC150_MAGN_I2C is not set
# CONFIG_MAG3110 is not set
CONFIG_MMC35240=y
# CONFIG_IIO_ST_MAGN_3AXIS is not set
# CONFIG_SENSORS_HMC5843_I2C is not set
# CONFIG_SENSORS_RM3100_I2C is not set
CONFIG_YAMAHA_YAS530=m
# end of Magnetometer sensors

#
# Multiplexers
#
CONFIG_IIO_MUX=m
# end of Multiplexers

#
# Inclinometer sensors
#
# end of Inclinometer sensors

#
# Triggers - standalone
#
CONFIG_IIO_HRTIMER_TRIGGER=m
CONFIG_IIO_INTERRUPT_TRIGGER=m
# CONFIG_IIO_STM32_LPTIMER_TRIGGER is not set
CONFIG_IIO_STM32_TIMER_TRIGGER=y
CONFIG_IIO_TIGHTLOOP_TRIGGER=m
CONFIG_IIO_SYSFS_TRIGGER=m
# end of Triggers - standalone

#
# Linear and angular position sensors
#
CONFIG_IQS624_POS=y
# end of Linear and angular position sensors

#
# Digital potentiometers
#
# CONFIG_AD5110 is not set
CONFIG_AD5272=m
# CONFIG_DS1803 is not set
CONFIG_MAX5432=y
# CONFIG_MCP4018 is not set
CONFIG_MCP4531=m
CONFIG_TPL0102=m
# end of Digital potentiometers

#
# Digital potentiostats
#
# CONFIG_LMP91000 is not set
# end of Digital potentiostats

#
# Pressure sensors
#
CONFIG_ABP060MG=y
# CONFIG_BMP280 is not set
# CONFIG_DLHL60D is not set
CONFIG_DPS310=m
# CONFIG_HP03 is not set
# CONFIG_ICP10100 is not set
CONFIG_MPL115=y
CONFIG_MPL115_I2C=y
CONFIG_MPL3115=y
CONFIG_MS5611=m
CONFIG_MS5611_I2C=m
CONFIG_MS5637=m
CONFIG_IIO_ST_PRESS=m
CONFIG_IIO_ST_PRESS_I2C=m
CONFIG_T5403=m
# CONFIG_HP206C is not set
CONFIG_ZPA2326=y
CONFIG_ZPA2326_I2C=y
# end of Pressure sensors

#
# Lightning sensors
#
# end of Lightning sensors

#
# Proximity and distance sensors
#
CONFIG_ISL29501=m
# CONFIG_LIDAR_LITE_V2 is not set
CONFIG_MB1232=m
CONFIG_PING=m
# CONFIG_RFD77402 is not set
CONFIG_SRF04=m
CONFIG_SX_COMMON=y
# CONFIG_SX9310 is not set
CONFIG_SX9324=y
CONFIG_SX9360=m
CONFIG_SX9500=y
CONFIG_SRF08=m
CONFIG_VCNL3020=m
CONFIG_VL53L0X_I2C=y
# end of Proximity and distance sensors

#
# Resolver to digital converters
#
# end of Resolver to digital converters

#
# Temperature sensors
#
CONFIG_IQS620AT_TEMP=y
CONFIG_MLX90614=m
CONFIG_MLX90632=m
CONFIG_TMP006=m
# CONFIG_TMP007 is not set
CONFIG_TMP117=y
# CONFIG_TSYS01 is not set
# CONFIG_TSYS02D is not set
# end of Temperature sensors

CONFIG_NTB=m
# CONFIG_NTB_MSI is not set
CONFIG_NTB_IDT=m
# CONFIG_NTB_EPF is not set
CONFIG_NTB_SWITCHTEC=m
CONFIG_NTB_PINGPONG=m
CONFIG_NTB_TOOL=m
# CONFIG_NTB_PERF is not set
# CONFIG_NTB_TRANSPORT is not set
CONFIG_PWM=y
CONFIG_PWM_SYSFS=y
CONFIG_PWM_DEBUG=y
CONFIG_PWM_ATMEL=m
CONFIG_PWM_ATMEL_TCB=m
CONFIG_PWM_BCM_IPROC=m
CONFIG_PWM_BCM_KONA=m
# CONFIG_PWM_BCM2835 is not set
CONFIG_PWM_BERLIN=m
# CONFIG_PWM_BRCMSTB is not set
CONFIG_PWM_CLK=y
CONFIG_PWM_CLPS711X=y
CONFIG_PWM_DWC=m
CONFIG_PWM_EP93XX=y
CONFIG_PWM_FSL_FTM=y
# CONFIG_PWM_HIBVT is not set
CONFIG_PWM_IMG=m
CONFIG_PWM_IMX1=m
CONFIG_PWM_IMX27=m
# CONFIG_PWM_IMX_TPM is not set
CONFIG_PWM_INTEL_LGM=y
CONFIG_PWM_IQS620A=m
# CONFIG_PWM_JZ4740 is not set
CONFIG_PWM_KEEMBAY=m
# CONFIG_PWM_LPC18XX_SCT is not set
CONFIG_PWM_LPC32XX=m
CONFIG_PWM_LPSS=m
# CONFIG_PWM_LPSS_PCI is not set
CONFIG_PWM_LPSS_PLATFORM=m
# CONFIG_PWM_MESON is not set
CONFIG_PWM_MTK_DISP=m
# CONFIG_PWM_MEDIATEK is not set
CONFIG_PWM_MXS=m
CONFIG_PWM_NTXEC=m
CONFIG_PWM_OMAP_DMTIMER=m
CONFIG_PWM_PCA9685=y
CONFIG_PWM_PXA=m
# CONFIG_PWM_RASPBERRYPI_POE is not set
CONFIG_PWM_RCAR=y
CONFIG_PWM_RENESAS_TPU=m
# CONFIG_PWM_ROCKCHIP is not set
CONFIG_PWM_SAMSUNG=m
CONFIG_PWM_SIFIVE=y
CONFIG_PWM_SL28CPLD=y
CONFIG_PWM_SPEAR=m
CONFIG_PWM_SPRD=m
CONFIG_PWM_STI=y
CONFIG_PWM_STM32=y
CONFIG_PWM_STM32_LP=m
# CONFIG_PWM_SUN4I is not set
CONFIG_PWM_SUNPLUS=y
# CONFIG_PWM_TEGRA is not set
# CONFIG_PWM_TIECAP is not set
# CONFIG_PWM_TIEHRPWM is not set
CONFIG_PWM_TWL=y
CONFIG_PWM_TWL_LED=y
# CONFIG_PWM_VISCONTI is not set
CONFIG_PWM_VT8500=m
CONFIG_PWM_XILINX=y

#
# IRQ chip support
#
CONFIG_IRQCHIP=y
# CONFIG_AL_FIC is not set
CONFIG_OR1K_PIC=y
CONFIG_JCORE_AIC=y
CONFIG_RENESAS_INTC_IRQPIN=y
CONFIG_RENESAS_IRQC=y
# CONFIG_RENESAS_RZA1_IRQC is not set
# CONFIG_RENESAS_RZG2L_IRQC is not set
CONFIG_SL28CPLD_INTC=y
CONFIG_TS4800_IRQ=y
# CONFIG_XILINX_INTC is not set
# CONFIG_INGENIC_TCU_IRQ is not set
# CONFIG_IRQ_UNIPHIER_AIDET is not set
CONFIG_MESON_IRQ_GPIO=m
CONFIG_IMX_IRQSTEER=y
CONFIG_IMX_INTMUX=y
# CONFIG_IMX_MU_MSI is not set
CONFIG_EXYNOS_IRQ_COMBINER=y
CONFIG_MST_IRQ=y
CONFIG_MCHP_EIC=y
CONFIG_SUNPLUS_SP7021_INTC=y
# end of IRQ chip support

# CONFIG_IPACK_BUS is not set
CONFIG_RESET_CONTROLLER=y
CONFIG_RESET_A10SR=m
CONFIG_RESET_ATH79=y
CONFIG_RESET_AXS10X=y
CONFIG_RESET_BCM6345=y
CONFIG_RESET_BERLIN=m
CONFIG_RESET_BRCMSTB=y
# CONFIG_RESET_BRCMSTB_RESCAL is not set
# CONFIG_RESET_HSDK is not set
CONFIG_RESET_IMX7=m
CONFIG_RESET_INTEL_GW=y
CONFIG_RESET_K210=y
# CONFIG_RESET_LANTIQ is not set
CONFIG_RESET_LPC18XX=y
# CONFIG_RESET_MCHP_SPARX5 is not set
CONFIG_RESET_MESON=y
# CONFIG_RESET_MESON_AUDIO_ARB is not set
# CONFIG_RESET_NPCM is not set
# CONFIG_RESET_PISTACHIO is not set
# CONFIG_RESET_POLARFIRE_SOC is not set
CONFIG_RESET_QCOM_AOSS=m
CONFIG_RESET_QCOM_PDC=y
CONFIG_RESET_RASPBERRYPI=y
# CONFIG_RESET_RZG2L_USBPHY_CTRL is not set
CONFIG_RESET_SCMI=m
CONFIG_RESET_SIMPLE=y
CONFIG_RESET_SOCFPGA=y
# CONFIG_RESET_STARFIVE_JH7100 is not set
CONFIG_RESET_SUNPLUS=y
# CONFIG_RESET_SUNXI is not set
CONFIG_RESET_TI_SCI=y
# CONFIG_RESET_TI_SYSCON is not set
CONFIG_RESET_TI_TPS380X=y
# CONFIG_RESET_TN48M_CPLD is not set
# CONFIG_RESET_UNIPHIER is not set
CONFIG_RESET_UNIPHIER_GLUE=m
# CONFIG_RESET_ZYNQ is not set
CONFIG_COMMON_RESET_HI3660=m
# CONFIG_COMMON_RESET_HI6220 is not set

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
CONFIG_GENERIC_PHY_MIPI_DPHY=y
CONFIG_PHY_LPC18XX_USB_OTG=y
# CONFIG_PHY_PISTACHIO_USB is not set
# CONFIG_PHY_XGENE is not set
CONFIG_USB_LGM_PHY=m
# CONFIG_PHY_CAN_TRANSCEIVER is not set
# CONFIG_PHY_SUN4I_USB is not set
CONFIG_PHY_SUN6I_MIPI_DPHY=y
CONFIG_PHY_SUN9I_USB=y
CONFIG_PHY_SUN50I_USB3=m
CONFIG_PHY_MESON8_HDMI_TX=y
CONFIG_PHY_MESON8B_USB2=y
CONFIG_PHY_MESON_GXL_USB2=y
CONFIG_PHY_MESON_G12A_MIPI_DPHY_ANALOG=y
CONFIG_PHY_MESON_G12A_USB2=y
CONFIG_PHY_MESON_G12A_USB3_PCIE=m
CONFIG_PHY_MESON_AXG_PCIE=m
CONFIG_PHY_MESON_AXG_MIPI_PCIE_ANALOG=y
CONFIG_PHY_MESON_AXG_MIPI_DPHY=m

#
# PHY drivers for Broadcom platforms
#
CONFIG_PHY_BCM63XX_USBH=y
CONFIG_PHY_CYGNUS_PCIE=y
CONFIG_PHY_BCM_SR_USB=y
CONFIG_BCM_KONA_USB2_PHY=y
CONFIG_PHY_BCM_NS_USB2=y
CONFIG_PHY_NS2_USB_DRD=y
CONFIG_PHY_BRCM_SATA=y
CONFIG_PHY_BRCM_USB=y
# CONFIG_PHY_BCM_SR_PCIE is not set
# end of PHY drivers for Broadcom platforms

# CONFIG_PHY_CADENCE_TORRENT is not set
# CONFIG_PHY_CADENCE_DPHY is not set
CONFIG_PHY_CADENCE_DPHY_RX=m
CONFIG_PHY_CADENCE_SIERRA=m
# CONFIG_PHY_CADENCE_SALVO is not set
CONFIG_PHY_FSL_IMX8MQ_USB=m
# CONFIG_PHY_MIXEL_LVDS_PHY is not set
CONFIG_PHY_MIXEL_MIPI_DPHY=y
CONFIG_PHY_FSL_IMX8M_PCIE=y
CONFIG_PHY_FSL_LYNX_28G=m
CONFIG_PHY_HI6220_USB=y
CONFIG_PHY_HI3660_USB=y
# CONFIG_PHY_HI3670_USB is not set
CONFIG_PHY_HI3670_PCIE=y
CONFIG_PHY_HISTB_COMBPHY=y
# CONFIG_PHY_HISI_INNO_USB2 is not set
CONFIG_PHY_INGENIC_USB=y
CONFIG_PHY_LANTIQ_VRX200_PCIE=m
CONFIG_PHY_LANTIQ_RCU_USB2=m
CONFIG_ARMADA375_USBCLUSTER_PHY=y
CONFIG_PHY_BERLIN_SATA=m
CONFIG_PHY_BERLIN_USB=y
# CONFIG_PHY_MVEBU_A3700_UTMI is not set
CONFIG_PHY_MVEBU_A38X_COMPHY=m
# CONFIG_PHY_MVEBU_CP110_UTMI is not set
CONFIG_PHY_PXA_28NM_HSIC=m
CONFIG_PHY_PXA_28NM_USB2=y
CONFIG_PHY_PXA_USB=m
CONFIG_PHY_MMP3_USB=m
CONFIG_PHY_MMP3_HSIC=y
CONFIG_PHY_MTK_PCIE=y
CONFIG_PHY_MTK_TPHY=m
# CONFIG_PHY_MTK_UFS is not set
# CONFIG_PHY_MTK_XSPHY is not set
# CONFIG_PHY_MTK_HDMI is not set
CONFIG_PHY_MTK_MIPI_DSI=y
CONFIG_PHY_MTK_DP=m
CONFIG_PHY_SPARX5_SERDES=m
# CONFIG_PHY_LAN966X_SERDES is not set
CONFIG_PHY_CPCAP_USB=y
CONFIG_PHY_MAPPHONE_MDM6600=y
CONFIG_PHY_OCELOT_SERDES=m
CONFIG_PHY_ATH79_USB=y
# CONFIG_PHY_QCOM_EDP is not set
# CONFIG_PHY_QCOM_IPQ4019_USB is not set
# CONFIG_PHY_QCOM_PCIE2 is not set
CONFIG_PHY_QCOM_QMP=m
CONFIG_PHY_QCOM_QUSB2=m
# CONFIG_PHY_QCOM_USB_HS is not set
CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=y
CONFIG_PHY_QCOM_USB_HSIC=y
CONFIG_PHY_QCOM_USB_HS_28NM=y
CONFIG_PHY_QCOM_USB_SS=m
CONFIG_PHY_QCOM_IPQ806X_USB=y
CONFIG_PHY_MT7621_PCI=y
CONFIG_PHY_RALINK_USB=m
# CONFIG_PHY_RCAR_GEN3_USB3 is not set
# CONFIG_PHY_ROCKCHIP_DPHY_RX0 is not set
CONFIG_PHY_ROCKCHIP_INNO_HDMI=y
# CONFIG_PHY_ROCKCHIP_INNO_USB2 is not set
# CONFIG_PHY_ROCKCHIP_INNO_CSIDPHY is not set
CONFIG_PHY_ROCKCHIP_INNO_DSIDPHY=m
CONFIG_PHY_ROCKCHIP_PCIE=m
# CONFIG_PHY_ROCKCHIP_SNPS_PCIE3 is not set
CONFIG_PHY_ROCKCHIP_TYPEC=m
CONFIG_PHY_EXYNOS_DP_VIDEO=m
CONFIG_PHY_EXYNOS_MIPI_VIDEO=y
CONFIG_PHY_EXYNOS_PCIE=y
CONFIG_PHY_SAMSUNG_UFS=m
CONFIG_PHY_SAMSUNG_USB2=y
CONFIG_PHY_S5PV210_USB2=y
# CONFIG_PHY_UNIPHIER_USB2 is not set
CONFIG_PHY_UNIPHIER_USB3=y
CONFIG_PHY_UNIPHIER_PCIE=y
CONFIG_PHY_UNIPHIER_AHCI=m
CONFIG_PHY_ST_SPEAR1310_MIPHY=y
# CONFIG_PHY_ST_SPEAR1340_MIPHY is not set
CONFIG_PHY_STIH407_USB=y
CONFIG_PHY_STM32_USBPHYC=y
# CONFIG_PHY_SUNPLUS_USB is not set
CONFIG_PHY_TEGRA194_P2U=m
CONFIG_PHY_DA8XX_USB=y
CONFIG_PHY_DM816X_USB=y
# CONFIG_PHY_AM654_SERDES is not set
# CONFIG_PHY_J721E_WIZ is not set
# CONFIG_OMAP_CONTROL_PHY is not set
# CONFIG_TI_PIPE3 is not set
# CONFIG_PHY_TUSB1210 is not set
# CONFIG_PHY_INTEL_KEEMBAY_EMMC is not set
CONFIG_PHY_INTEL_KEEMBAY_USB=y
CONFIG_PHY_INTEL_LGM_COMBO=y
CONFIG_PHY_INTEL_LGM_EMMC=y
CONFIG_PHY_INTEL_THUNDERBAY_EMMC=m
CONFIG_PHY_XILINX_ZYNQMP=y
# end of PHY Subsystem

# CONFIG_POWERCAP is not set
CONFIG_MCB=y
# CONFIG_MCB_PCI is not set
CONFIG_MCB_LPC=m
CONFIG_RAS=y
CONFIG_USB4=m
CONFIG_USB4_DEBUGFS_WRITE=y
CONFIG_USB4_DEBUGFS_MARGINING=y
CONFIG_USB4_DMA_TEST=m

#
# Android
#
# CONFIG_ANDROID_BINDER_IPC is not set
# end of Android

# CONFIG_DAX is not set
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y
# CONFIG_NVMEM_APPLE_EFUSES is not set
CONFIG_NVMEM_BCM_OCOTP=y
# CONFIG_NVMEM_BRCM_NVRAM is not set
CONFIG_NVMEM_IMX_IIM=m
CONFIG_NVMEM_IMX_OCOTP=y
CONFIG_NVMEM_JZ4780_EFUSE=y
CONFIG_NVMEM_LAN9662_OTPC=y
CONFIG_NVMEM_LAYERSCAPE_SFP=m
# CONFIG_NVMEM_LPC18XX_EEPROM is not set
CONFIG_NVMEM_LPC18XX_OTP=y
# CONFIG_NVMEM_MESON_MX_EFUSE is not set
# CONFIG_NVMEM_MICROCHIP_OTPC is not set
CONFIG_NVMEM_MTK_EFUSE=m
# CONFIG_NVMEM_MXS_OCOTP is not set
CONFIG_NVMEM_NINTENDO_OTP=y
CONFIG_NVMEM_QCOM_QFPROM=m
CONFIG_NVMEM_RAVE_SP_EEPROM=m
# CONFIG_NVMEM_RMEM is not set
# CONFIG_NVMEM_ROCKCHIP_EFUSE is not set
CONFIG_NVMEM_ROCKCHIP_OTP=y
# CONFIG_NVMEM_SC27XX_EFUSE is not set
# CONFIG_NVMEM_SNVS_LPGPR is not set
# CONFIG_NVMEM_SPMI_SDAM is not set
CONFIG_NVMEM_SPRD_EFUSE=m
CONFIG_NVMEM_STM32_ROMEM=m
# CONFIG_NVMEM_SUNPLUS_OCOTP is not set
# CONFIG_NVMEM_UNIPHIER_EFUSE is not set
CONFIG_NVMEM_VF610_OCOTP=y

#
# HW tracing support
#
CONFIG_STM=y
# CONFIG_STM_PROTO_BASIC is not set
CONFIG_STM_PROTO_SYS_T=y
CONFIG_STM_DUMMY=m
CONFIG_STM_SOURCE_CONSOLE=m
# CONFIG_STM_SOURCE_HEARTBEAT is not set
CONFIG_STM_SOURCE_FTRACE=m
CONFIG_INTEL_TH=y
CONFIG_INTEL_TH_PCI=m
CONFIG_INTEL_TH_GTH=y
# CONFIG_INTEL_TH_STH is not set
CONFIG_INTEL_TH_MSU=y
CONFIG_INTEL_TH_PTI=y
# CONFIG_INTEL_TH_DEBUG is not set
# end of HW tracing support

CONFIG_FPGA=m
CONFIG_FPGA_MGR_SOCFPGA=m
CONFIG_FPGA_MGR_SOCFPGA_A10=m
CONFIG_ALTERA_PR_IP_CORE=m
CONFIG_ALTERA_PR_IP_CORE_PLAT=m
CONFIG_FPGA_MGR_ALTERA_CVP=m
CONFIG_FPGA_MGR_ZYNQ_FPGA=m
CONFIG_FPGA_BRIDGE=m
# CONFIG_ALTERA_FREEZE_BRIDGE is not set
# CONFIG_XILINX_PR_DECOUPLER is not set
CONFIG_FPGA_REGION=m
# CONFIG_OF_FPGA_REGION is not set
CONFIG_FPGA_DFL=m
# CONFIG_FPGA_DFL_AFU is not set
CONFIG_FPGA_DFL_NIOS_INTEL_PAC_N3000=m
CONFIG_FPGA_DFL_PCI=m
CONFIG_FPGA_MGR_ZYNQMP_FPGA=m
CONFIG_FPGA_MGR_VERSAL_FPGA=m
# CONFIG_FSI is not set
CONFIG_TEE=y
CONFIG_MULTIPLEXER=m

#
# Multiplexer drivers
#
CONFIG_MUX_ADG792A=m
CONFIG_MUX_GPIO=m
CONFIG_MUX_MMIO=m
# end of Multiplexer drivers

CONFIG_PM_OPP=y
# CONFIG_SIOX is not set
CONFIG_SLIMBUS=y
# CONFIG_SLIM_QCOM_CTRL is not set
# CONFIG_INTERCONNECT is not set
# CONFIG_COUNTER is not set
CONFIG_MOST=m
CONFIG_MOST_USB_HDM=m
CONFIG_MOST_CDEV=m
CONFIG_MOST_SND=m
CONFIG_PECI=y
# CONFIG_PECI_CPU is not set
CONFIG_PECI_ASPEED=y
CONFIG_HTE=y
# end of Device Drivers

#
# File systems
#
# CONFIG_VALIDATE_FS_PARSER is not set
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
CONFIG_EXPORTFS_BLOCK_OPS=y
CONFIG_FILE_LOCKING=y
CONFIG_FS_ENCRYPTION=y
CONFIG_FS_VERITY=y
# CONFIG_FS_VERITY_DEBUG is not set
# CONFIG_FS_VERITY_BUILTIN_SIGNATURES is not set
CONFIG_FSNOTIFY=y
CONFIG_DNOTIFY=y
CONFIG_INOTIFY_USER=y
# CONFIG_FANOTIFY is not set
CONFIG_QUOTA=y
CONFIG_QUOTA_NETLINK_INTERFACE=y
CONFIG_PRINT_QUOTA_WARNING=y
# CONFIG_QUOTA_DEBUG is not set
CONFIG_QUOTA_TREE=y
CONFIG_QFMT_V1=y
CONFIG_QFMT_V2=y
CONFIG_QUOTACTL=y
# CONFIG_AUTOFS4_FS is not set
CONFIG_AUTOFS_FS=y
CONFIG_FUSE_FS=y
CONFIG_CUSE=y
CONFIG_VIRTIO_FS=y
CONFIG_OVERLAY_FS=m
CONFIG_OVERLAY_FS_REDIRECT_DIR=y
# CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW is not set
CONFIG_OVERLAY_FS_INDEX=y
CONFIG_OVERLAY_FS_METACOPY=y

#
# Caches
#
CONFIG_NETFS_SUPPORT=m
CONFIG_FSCACHE=m
# CONFIG_FSCACHE_DEBUG is not set
# end of Caches

#
# Pseudo filesystems
#
# CONFIG_PROC_FS is not set
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
CONFIG_TMPFS_POSIX_ACL=y
CONFIG_TMPFS_XATTR=y
CONFIG_MEMFD_CREATE=y
CONFIG_CONFIGFS_FS=y
# end of Pseudo filesystems

# CONFIG_MISC_FILESYSTEMS is not set
CONFIG_NETWORK_FILESYSTEMS=y
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
CONFIG_NLS_CODEPAGE_437=y
CONFIG_NLS_CODEPAGE_737=m
CONFIG_NLS_CODEPAGE_775=m
# CONFIG_NLS_CODEPAGE_850 is not set
CONFIG_NLS_CODEPAGE_852=m
CONFIG_NLS_CODEPAGE_855=m
CONFIG_NLS_CODEPAGE_857=m
# CONFIG_NLS_CODEPAGE_860 is not set
CONFIG_NLS_CODEPAGE_861=y
# CONFIG_NLS_CODEPAGE_862 is not set
# CONFIG_NLS_CODEPAGE_863 is not set
CONFIG_NLS_CODEPAGE_864=m
# CONFIG_NLS_CODEPAGE_865 is not set
CONFIG_NLS_CODEPAGE_866=y
# CONFIG_NLS_CODEPAGE_869 is not set
# CONFIG_NLS_CODEPAGE_936 is not set
# CONFIG_NLS_CODEPAGE_950 is not set
CONFIG_NLS_CODEPAGE_932=m
CONFIG_NLS_CODEPAGE_949=m
CONFIG_NLS_CODEPAGE_874=m
CONFIG_NLS_ISO8859_8=m
# CONFIG_NLS_CODEPAGE_1250 is not set
CONFIG_NLS_CODEPAGE_1251=m
# CONFIG_NLS_ASCII is not set
# CONFIG_NLS_ISO8859_1 is not set
CONFIG_NLS_ISO8859_2=y
CONFIG_NLS_ISO8859_3=m
CONFIG_NLS_ISO8859_4=y
CONFIG_NLS_ISO8859_5=y
# CONFIG_NLS_ISO8859_6 is not set
CONFIG_NLS_ISO8859_7=m
CONFIG_NLS_ISO8859_9=m
CONFIG_NLS_ISO8859_13=y
CONFIG_NLS_ISO8859_14=m
CONFIG_NLS_ISO8859_15=m
# CONFIG_NLS_KOI8_R is not set
CONFIG_NLS_KOI8_U=m
CONFIG_NLS_MAC_ROMAN=y
CONFIG_NLS_MAC_CELTIC=y
CONFIG_NLS_MAC_CENTEURO=m
CONFIG_NLS_MAC_CROATIAN=y
CONFIG_NLS_MAC_CYRILLIC=y
CONFIG_NLS_MAC_GAELIC=m
CONFIG_NLS_MAC_GREEK=m
CONFIG_NLS_MAC_ICELAND=y
CONFIG_NLS_MAC_INUIT=y
CONFIG_NLS_MAC_ROMANIAN=y
CONFIG_NLS_MAC_TURKISH=m
CONFIG_NLS_UTF8=y
CONFIG_UNICODE=m
CONFIG_UNICODE_NORMALIZATION_SELFTEST=m
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
CONFIG_KEYS_REQUEST_CACHE=y
CONFIG_PERSISTENT_KEYRINGS=y
CONFIG_TRUSTED_KEYS=m
# CONFIG_TRUSTED_KEYS_TPM is not set
CONFIG_TRUSTED_KEYS_TEE=y
CONFIG_ENCRYPTED_KEYS=m
# CONFIG_USER_DECRYPTED_DATA is not set
# CONFIG_KEY_DH_OPERATIONS is not set
CONFIG_KEY_NOTIFICATIONS=y
# CONFIG_SECURITY_DMESG_RESTRICT is not set
# CONFIG_SECURITYFS is not set
CONFIG_STATIC_USERMODEHELPER=y
CONFIG_STATIC_USERMODEHELPER_PATH="/sbin/usermode-helper"
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,integrity,bpf"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_CC_HAS_AUTO_VAR_INIT_PATTERN=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO_BARE=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO=y
CONFIG_INIT_STACK_NONE=y
# CONFIG_INIT_STACK_ALL_PATTERN is not set
# CONFIG_INIT_STACK_ALL_ZERO is not set
CONFIG_INIT_ON_ALLOC_DEFAULT_ON=y
CONFIG_INIT_ON_FREE_DEFAULT_ON=y
CONFIG_CC_HAS_ZERO_CALL_USED_REGS=y
# CONFIG_ZERO_CALL_USED_REGS is not set
# end of Memory initialization

CONFIG_RANDSTRUCT_NONE=y
# end of Kernel hardening options
# end of Security options

CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_SKCIPHER=y
CONFIG_CRYPTO_SKCIPHER2=y
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
CONFIG_CRYPTO_RNG=y
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_RNG_DEFAULT=y
CONFIG_CRYPTO_AKCIPHER2=y
CONFIG_CRYPTO_AKCIPHER=y
CONFIG_CRYPTO_KPP2=y
CONFIG_CRYPTO_KPP=y
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
# CONFIG_CRYPTO_USER is not set
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
CONFIG_CRYPTO_GF128MUL=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
CONFIG_CRYPTO_CRYPTD=y
CONFIG_CRYPTO_AUTHENC=m
CONFIG_CRYPTO_TEST=m
# end of Crypto core or helper

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=m
# CONFIG_CRYPTO_DH_RFC7919_GROUPS is not set
CONFIG_CRYPTO_ECC=m
# CONFIG_CRYPTO_ECDH is not set
# CONFIG_CRYPTO_ECDSA is not set
CONFIG_CRYPTO_ECRDSA=m
# CONFIG_CRYPTO_SM2 is not set
CONFIG_CRYPTO_CURVE25519=y
# end of Public-key cryptography

#
# Block ciphers
#
CONFIG_CRYPTO_AES=y
CONFIG_CRYPTO_AES_TI=m
# CONFIG_CRYPTO_ARIA is not set
CONFIG_CRYPTO_BLOWFISH=y
CONFIG_CRYPTO_BLOWFISH_COMMON=y
CONFIG_CRYPTO_CAMELLIA=y
CONFIG_CRYPTO_CAST_COMMON=m
# CONFIG_CRYPTO_CAST5 is not set
CONFIG_CRYPTO_CAST6=m
CONFIG_CRYPTO_DES=m
# CONFIG_CRYPTO_FCRYPT is not set
# CONFIG_CRYPTO_SERPENT is not set
CONFIG_CRYPTO_SM4=m
CONFIG_CRYPTO_SM4_GENERIC=m
CONFIG_CRYPTO_TWOFISH=m
CONFIG_CRYPTO_TWOFISH_COMMON=m
# end of Block ciphers

#
# Length-preserving ciphers and modes
#
# CONFIG_CRYPTO_ADIANTUM is not set
CONFIG_CRYPTO_CHACHA20=y
CONFIG_CRYPTO_CBC=y
# CONFIG_CRYPTO_CFB is not set
CONFIG_CRYPTO_CTR=y
CONFIG_CRYPTO_CTS=y
CONFIG_CRYPTO_ECB=m
# CONFIG_CRYPTO_HCTR2 is not set
CONFIG_CRYPTO_KEYWRAP=m
CONFIG_CRYPTO_LRW=m
CONFIG_CRYPTO_OFB=m
CONFIG_CRYPTO_PCBC=m
# CONFIG_CRYPTO_XTS is not set
# end of Length-preserving ciphers and modes

#
# AEAD (authenticated encryption with associated data) ciphers
#
CONFIG_CRYPTO_AEGIS128=y
CONFIG_CRYPTO_CHACHA20POLY1305=m
CONFIG_CRYPTO_CCM=y
CONFIG_CRYPTO_GCM=y
CONFIG_CRYPTO_SEQIV=m
CONFIG_CRYPTO_ECHAINIV=y
CONFIG_CRYPTO_ESSIV=m
# end of AEAD (authenticated encryption with associated data) ciphers

#
# Hashes, digests, and MACs
#
# CONFIG_CRYPTO_BLAKE2B is not set
# CONFIG_CRYPTO_CMAC is not set
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_MD4=m
CONFIG_CRYPTO_MD5=y
# CONFIG_CRYPTO_MICHAEL_MIC is not set
CONFIG_CRYPTO_POLY1305=y
# CONFIG_CRYPTO_RMD160 is not set
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
CONFIG_CRYPTO_SHA3=y
CONFIG_CRYPTO_SM3=m
CONFIG_CRYPTO_SM3_GENERIC=m
CONFIG_CRYPTO_STREEBOG=y
CONFIG_CRYPTO_VMAC=m
# CONFIG_CRYPTO_WP512 is not set
CONFIG_CRYPTO_XCBC=m
# CONFIG_CRYPTO_XXHASH is not set
# end of Hashes, digests, and MACs

#
# CRCs (cyclic redundancy checks)
#
# CONFIG_CRYPTO_CRC32C is not set
CONFIG_CRYPTO_CRC32=m
CONFIG_CRYPTO_CRCT10DIF=y
CONFIG_CRYPTO_CRC64_ROCKSOFT=m
# end of CRCs (cyclic redundancy checks)

#
# Compression
#
# CONFIG_CRYPTO_DEFLATE is not set
CONFIG_CRYPTO_LZO=y
CONFIG_CRYPTO_842=m
# CONFIG_CRYPTO_LZ4 is not set
CONFIG_CRYPTO_LZ4HC=y
CONFIG_CRYPTO_ZSTD=m
# end of Compression

#
# Random number generation
#
# CONFIG_CRYPTO_ANSI_CPRNG is not set
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
CONFIG_CRYPTO_DRBG_HASH=y
# CONFIG_CRYPTO_DRBG_CTR is not set
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
# end of Random number generation

#
# Userspace interface
#
CONFIG_CRYPTO_USER_API=y
CONFIG_CRYPTO_USER_API_HASH=m
# CONFIG_CRYPTO_USER_API_SKCIPHER is not set
# CONFIG_CRYPTO_USER_API_RNG is not set
CONFIG_CRYPTO_USER_API_AEAD=y
# CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE is not set
# end of Userspace interface

CONFIG_CRYPTO_HASH_INFO=y
# CONFIG_CRYPTO_HW is not set
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
CONFIG_X509_CERTIFICATE_PARSER=y
CONFIG_PKCS8_PRIVATE_KEY_PARSER=m
CONFIG_PKCS7_MESSAGE_PARSER=y
# CONFIG_PKCS7_TEST_KEY is not set
# CONFIG_SIGNED_PE_FILE_VERIFICATION is not set
CONFIG_FIPS_SIGNATURE_SELFTEST=y

#
# Certificates for signature checking
#
CONFIG_MODULE_SIG_KEY="certs/signing_key.pem"
CONFIG_MODULE_SIG_KEY_TYPE_RSA=y
# CONFIG_MODULE_SIG_KEY_TYPE_ECDSA is not set
CONFIG_SYSTEM_TRUSTED_KEYRING=y
CONFIG_SYSTEM_TRUSTED_KEYS=""
# CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
# CONFIG_SECONDARY_TRUSTED_KEYRING is not set
# CONFIG_SYSTEM_BLACKLIST_KEYRING is not set
# end of Certificates for signature checking

CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_LINEAR_RANGES=y
# CONFIG_PACKING is not set
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
CONFIG_CORDIC=y
CONFIG_PRIME_NUMBERS=m
CONFIG_RATIONAL=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_STMP_DEVICE=y

#
# Crypto library routines
#
CONFIG_CRYPTO_LIB_UTILS=y
CONFIG_CRYPTO_LIB_AES=y
CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
CONFIG_CRYPTO_LIB_CHACHA_GENERIC=y
CONFIG_CRYPTO_LIB_CHACHA=y
CONFIG_CRYPTO_LIB_CURVE25519_GENERIC=y
CONFIG_CRYPTO_LIB_CURVE25519=m
CONFIG_CRYPTO_LIB_DES=m
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=1
CONFIG_CRYPTO_LIB_POLY1305_GENERIC=y
CONFIG_CRYPTO_LIB_POLY1305=m
CONFIG_CRYPTO_LIB_CHACHA20POLY1305=m
CONFIG_CRYPTO_LIB_SHA1=y
CONFIG_CRYPTO_LIB_SHA256=y
# end of Crypto library routines

CONFIG_CRC_CCITT=m
CONFIG_CRC16=y
CONFIG_CRC_T10DIF=y
CONFIG_CRC64_ROCKSOFT=m
CONFIG_CRC_ITU_T=m
CONFIG_CRC32=y
CONFIG_CRC32_SELFTEST=m
CONFIG_CRC32_SLICEBY8=y
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
# CONFIG_CRC32_BIT is not set
CONFIG_CRC64=m
CONFIG_CRC4=y
# CONFIG_CRC7 is not set
# CONFIG_LIBCRC32C is not set
CONFIG_CRC8=y
CONFIG_XXHASH=m
CONFIG_RANDOM32_SELFTEST=y
CONFIG_842_COMPRESS=m
CONFIG_842_DECOMPRESS=m
CONFIG_LZO_COMPRESS=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4_COMPRESS=y
CONFIG_LZ4HC_COMPRESS=y
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_COMMON=m
CONFIG_ZSTD_COMPRESS=m
CONFIG_ZSTD_DECOMPRESS=m
CONFIG_XZ_DEC=y
CONFIG_XZ_DEC_X86=y
CONFIG_XZ_DEC_POWERPC=y
CONFIG_XZ_DEC_IA64=y
CONFIG_XZ_DEC_ARM=y
CONFIG_XZ_DEC_ARMTHUMB=y
# CONFIG_XZ_DEC_SPARC is not set
CONFIG_XZ_DEC_MICROLZMA=y
CONFIG_XZ_DEC_BCJ=y
CONFIG_XZ_DEC_TEST=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_INTERVAL_TREE=y
CONFIG_XARRAY_MULTI=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_DMA=y
CONFIG_DMA_OPS=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_DMA_DECLARE_COHERENT=y
CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE=y
CONFIG_DMA_API_DEBUG=y
# CONFIG_DMA_API_DEBUG_SG is not set
CONFIG_DMA_MAP_BENCHMARK=y
CONFIG_SGL_ALLOC=y
CONFIG_DQL=y
CONFIG_GLOB=y
CONFIG_GLOB_SELFTEST=y
CONFIG_NLATTR=y
CONFIG_GENERIC_ATOMIC64=y
CONFIG_CLZ_TAB=y
CONFIG_IRQ_POLL=y
CONFIG_MPILIB=y
CONFIG_LIBFDT=y
CONFIG_OID_REGISTRY=y
CONFIG_FONT_SUPPORT=m
CONFIG_FONT_8x16=y
CONFIG_FONT_AUTOSELECT=y
CONFIG_STACKDEPOT=y
CONFIG_REF_TRACKER=y
CONFIG_PARMAN=y
# CONFIG_OBJAGG is not set
# end of Library routines

CONFIG_POLYNOMIAL=m

#
# Kernel hacking
#

#
# printk and dmesg options
#
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
CONFIG_SYMBOLIC_ERRNAME=y
# end of printk and dmesg options

CONFIG_DEBUG_KERNEL=y
# CONFIG_DEBUG_MISC is not set

#
# Compile-time checks and compiler options
#
CONFIG_DEBUG_INFO=y
CONFIG_AS_HAS_NON_CONST_LEB128=y
# CONFIG_DEBUG_INFO_NONE is not set
CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
# CONFIG_DEBUG_INFO_DWARF4 is not set
# CONFIG_DEBUG_INFO_DWARF5 is not set
# CONFIG_DEBUG_INFO_REDUCED is not set
# CONFIG_DEBUG_INFO_COMPRESSED is not set
# CONFIG_DEBUG_INFO_SPLIT is not set
# CONFIG_DEBUG_INFO_BTF is not set
CONFIG_PAHOLE_HAS_SPLIT_BTF=y
CONFIG_GDB_SCRIPTS=y
CONFIG_FRAME_WARN=1024
# CONFIG_STRIP_ASM_SYMS is not set
# CONFIG_READABLE_ASM is not set
CONFIG_HEADERS_INSTALL=y
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
CONFIG_ARCH_WANT_FRAME_POINTERS=y
CONFIG_FRAME_POINTER=y
CONFIG_VMLINUX_MAP=y
CONFIG_DEBUG_FORCE_WEAK_PER_CPU=y
# end of Compile-time checks and compiler options

#
# Generic Kernel Debugging Instruments
#
# CONFIG_MAGIC_SYSRQ is not set
CONFIG_DEBUG_FS=y
# CONFIG_DEBUG_FS_ALLOW_ALL is not set
# CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
CONFIG_DEBUG_FS_ALLOW_NONE=y
CONFIG_UBSAN=y
CONFIG_CC_HAS_UBSAN_BOUNDS=y
CONFIG_UBSAN_BOUNDS=y
CONFIG_UBSAN_ONLY_BOUNDS=y
# CONFIG_UBSAN_SHIFT is not set
# CONFIG_UBSAN_DIV_ZERO is not set
CONFIG_UBSAN_UNREACHABLE=y
# CONFIG_UBSAN_BOOL is not set
# CONFIG_UBSAN_ENUM is not set
CONFIG_TEST_UBSAN=m
CONFIG_HAVE_KCSAN_COMPILER=y
# end of Generic Kernel Debugging Instruments

#
# Networking Debugging
#
CONFIG_NET_DEV_REFCNT_TRACKER=y
CONFIG_NET_NS_REFCNT_TRACKER=y
CONFIG_DEBUG_NET=y
# end of Networking Debugging

#
# Memory Debugging
#
CONFIG_PAGE_EXTENSION=y
CONFIG_DEBUG_PAGEALLOC=y
# CONFIG_DEBUG_PAGEALLOC_ENABLE_DEFAULT is not set
# CONFIG_PAGE_OWNER is not set
CONFIG_PAGE_POISONING=y
CONFIG_DEBUG_PAGE_REF=y
# CONFIG_DEBUG_OBJECTS is not set
# CONFIG_SHRINKER_DEBUG is not set
# CONFIG_DEBUG_STACK_USAGE is not set
# CONFIG_SCHED_STACK_END_CHECK is not set
CONFIG_DEBUG_VM_IRQSOFF=y
CONFIG_DEBUG_VM=y
CONFIG_DEBUG_VM_MAPLE_TREE=y
CONFIG_DEBUG_VM_RB=y
# CONFIG_DEBUG_VM_PGFLAGS is not set
# CONFIG_DEBUG_MEMORY_INIT is not set
CONFIG_HAVE_DEBUG_STACKOVERFLOW=y
# CONFIG_DEBUG_STACKOVERFLOW is not set
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
# end of Memory Debugging

CONFIG_DEBUG_SHIRQ=y

#
# Debug Oops, Lockups and Hangs
#
# CONFIG_PANIC_ON_OOPS is not set
CONFIG_PANIC_ON_OOPS_VALUE=0
CONFIG_PANIC_TIMEOUT=0
CONFIG_LOCKUP_DETECTOR=y
CONFIG_SOFTLOCKUP_DETECTOR=y
# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
# CONFIG_DETECT_HUNG_TASK is not set
# CONFIG_WQ_WATCHDOG is not set
CONFIG_TEST_LOCKUP=m
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
# end of Scheduler Debugging

CONFIG_DEBUG_TIMEKEEPING=y

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=y
CONFIG_PROVE_LOCKING=y
CONFIG_PROVE_RAW_LOCK_NESTING=y
CONFIG_LOCK_STAT=y
CONFIG_DEBUG_RT_MUTEXES=y
CONFIG_DEBUG_SPINLOCK=y
CONFIG_DEBUG_MUTEXES=y
CONFIG_DEBUG_WW_MUTEX_SLOWPATH=y
CONFIG_DEBUG_RWSEMS=y
CONFIG_DEBUG_LOCK_ALLOC=y
CONFIG_LOCKDEP=y
CONFIG_LOCKDEP_BITS=15
CONFIG_LOCKDEP_CHAINS_BITS=16
CONFIG_LOCKDEP_STACK_TRACE_BITS=19
CONFIG_LOCKDEP_STACK_TRACE_HASH_BITS=14
CONFIG_LOCKDEP_CIRCULAR_QUEUE_BITS=12
# CONFIG_DEBUG_LOCKDEP is not set
CONFIG_DEBUG_ATOMIC_SLEEP=y
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
CONFIG_LOCK_TORTURE_TEST=m
# CONFIG_WW_MUTEX_SELFTEST is not set
# CONFIG_SCF_TORTURE_TEST is not set
# end of Lock Debugging (spinlocks, mutexes, etc...)

CONFIG_TRACE_IRQFLAGS=y
CONFIG_DEBUG_IRQFLAGS=y
CONFIG_STACKTRACE=y
# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
CONFIG_DEBUG_KOBJECT=y

#
# Debug kernel data structures
#
CONFIG_DEBUG_LIST=y
# CONFIG_DEBUG_PLIST is not set
# CONFIG_DEBUG_SG is not set
CONFIG_DEBUG_NOTIFIERS=y
CONFIG_BUG_ON_DATA_CORRUPTION=y
CONFIG_DEBUG_MAPLE_TREE=y
# end of Debug kernel data structures

# CONFIG_DEBUG_CREDENTIALS is not set

#
# RCU Debugging
#
CONFIG_PROVE_RCU=y
CONFIG_TORTURE_TEST=y
CONFIG_RCU_SCALE_TEST=y
CONFIG_RCU_TORTURE_TEST=m
CONFIG_RCU_REF_SCALE_TEST=y
CONFIG_RCU_TRACE=y
CONFIG_RCU_EQS_DEBUG=y
# end of RCU Debugging

CONFIG_DEBUG_WQ_FORCE_RR_CPU=y
CONFIG_NOP_TRACER=y
CONFIG_TRACE_CLOCK=y
CONFIG_RING_BUFFER=y
CONFIG_EVENT_TRACING=y
CONFIG_CONTEXT_SWITCH_TRACER=y
CONFIG_PREEMPTIRQ_TRACEPOINTS=y
CONFIG_TRACING=y
CONFIG_TRACING_SUPPORT=y
# CONFIG_FTRACE is not set
# CONFIG_SAMPLES is not set

#
# openrisc Debugging
#
# end of openrisc Debugging

#
# Kernel Testing and Coverage
#
# CONFIG_KUNIT is not set
CONFIG_NOTIFIER_ERROR_INJECTION=m
CONFIG_OF_RECONFIG_NOTIFIER_ERROR_INJECT=m
CONFIG_NETDEV_NOTIFIER_ERROR_INJECT=m
CONFIG_FAULT_INJECTION=y
CONFIG_FAIL_PAGE_ALLOC=y
CONFIG_FAULT_INJECTION_USERCOPY=y
# CONFIG_FAULT_INJECTION_DEBUG_FS is not set
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
# CONFIG_RUNTIME_TESTING_MENU is not set
# end of Kernel Testing and Coverage

#
# Rust hacking
#
# end of Rust hacking

# CONFIG_WARN_MISSING_DOCUMENTS is not set
CONFIG_WARN_ABI_ERRORS=y
# end of Kernel hacking

--ONWR0i6KleGaTbWL--
