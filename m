Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BBC1F4C89
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Aug 2025 14:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756563825; cv=none; b=CFL4OzOgpOwOqu1vSxbhSSRAGMx1DCqnUiPWn3146iBuRDRwIJHvUr9P3iKsRFuIAwR1bc8jHITzFj/x/1HodAO35wqJ72GDiYA8KIJFJaxev4dz6qozL5qhTRHryC3m8hm1UsM3sX1vwlFRdL6yN63yjE7HWKN+jqWQ2+GTjes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756563825; c=relaxed/simple;
	bh=0v34rlNpXtSSOGapCINLL3Bb7H8YtC3qZWYSFag0tVc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uguDau/NjoaBg36SG1208bCfTkmoYrJWpeWrGyS006VJX+fcHK5wdSJyIAAFNzRt3mIA9U0I4TaZAw9na9jDHgFuW5vbNz7dQV5kLQ5jC50DpKJJHv4SFTxszWfii1q3gvmAjnoIKmeXImI5DoRG6qkNjT21/kVyx84depGCaEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GfVuGoo4; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GfVuGoo4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756563820; x=1788099820;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=0v34rlNpXtSSOGapCINLL3Bb7H8YtC3qZWYSFag0tVc=;
  b=GfVuGoo4BokvZxjF8VGCSvFel76LsvIXnqhCSaF1RLVgxBrLRdVZ9SFX
   k7at6Jyc5eLMYnlBzPFX8fzxdAEzyQK4geajAKk/xiDyuDsgvyZGR/eqz
   U173EcQNycUszoNu0GPy+YzPhn9JkPji+e5VQSzaAlutYyj/XV82V62E+
   2ybaaKqxs5D3zY4T8uaqtPWOCQVx0mGkMhD7jarhE354oKC0n5gli2/NR
   9R17gtz6uFnYVN/8AfTTdxX6fLj4x1JbApbCoYQvDa9kwhRxkcNuLBSq8
   EUOxFsAQM1ao/FSdV6Wk7zXXbM1l5Sl1y1jPgyo3Vwk8OwSJ5vg9NGiNv
   w==;
X-CSE-ConnectionGUID: yufASKDKTqSXhCB8VxrYew==
X-CSE-MsgGUID: 1tJ7VTh1QLO5rLZ3LLHiiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="58894098"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="58894098"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2025 07:23:39 -0700
X-CSE-ConnectionGUID: 1Qd04/SgQhiafJkplOqRBw==
X-CSE-MsgGUID: uP/LAV9MSTSqr/F5ZINesg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="171398044"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 30 Aug 2025 07:23:37 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usMUL-000VQl-0z;
	Sat, 30 Aug 2025 14:23:31 +0000
Date: Sat, 30 Aug 2025 22:22:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: crypto/tcrypt.c:2298 do_test() warn: Function too hairy.  No more
 merges.
Message-ID: <202508302256.V1N76x45-lkp@intel.com>
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
TO: Eric Biggers <ebiggers@google.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   11e7861d680c3757eab18ec0a474ff680e007dc4
commit: 3357b6c94569095f87a350bffa5a0a6e0c19c962 crypto: tcrypt - rename CRYPTO_TEST to CRYPTO_BENCHMARK
date:   4 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 4 months ago
config: i386-randconfig-141-20250830 (https://download.01.org/0day-ci/archive/20250830/202508302256.V1N76x45-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508302256.V1N76x45-lkp@intel.com/

smatch warnings:
crypto/tcrypt.c:2298 do_test() warn: Function too hairy.  No more merges.

vim +2298 crypto/tcrypt.c

01b323245e4f6d4 Herbert Xu             2008-07-31  1451  
4e234eed58518a8 Kees Cook              2018-04-26  1452  static int do_test(const char *alg, u32 type, u32 mask, int m, u32 num_mb)
01b323245e4f6d4 Herbert Xu             2008-07-31  1453  {
01b323245e4f6d4 Herbert Xu             2008-07-31  1454  	int i;
4e033a6bc70f094 Jarod Wilson           2009-05-27  1455  	int ret = 0;
01b323245e4f6d4 Herbert Xu             2008-07-31  1456  
01b323245e4f6d4 Herbert Xu             2008-07-31  1457  	switch (m) {
^1da177e4c3f415 Linus Torvalds         2005-04-16  1458  	case 0:
8606813a6c8997f Herbert Xu             2014-12-04  1459  		if (alg) {
8606813a6c8997f Herbert Xu             2014-12-04  1460  			if (!crypto_has_alg(alg, type,
8606813a6c8997f Herbert Xu             2014-12-04  1461  					    mask ?: CRYPTO_ALG_TYPE_MASK))
8606813a6c8997f Herbert Xu             2014-12-04  1462  				ret = -ENOENT;
8606813a6c8997f Herbert Xu             2014-12-04  1463  			break;
8606813a6c8997f Herbert Xu             2014-12-04  1464  		}
8606813a6c8997f Herbert Xu             2014-12-04  1465  
01b323245e4f6d4 Herbert Xu             2008-07-31  1466  		for (i = 1; i < 200; i++)
65c92cbb3f23656 Robert Elliott         2022-09-30  1467  			ret = min(ret, do_test(NULL, 0, 0, i, num_mb));
^1da177e4c3f415 Linus Torvalds         2005-04-16  1468  		break;
^1da177e4c3f415 Linus Torvalds         2005-04-16  1469  
^1da177e4c3f415 Linus Torvalds         2005-04-16  1470  	case 1:
65c92cbb3f23656 Robert Elliott         2022-09-30  1471  		ret = min(ret, tcrypt_test("md5"));
^1da177e4c3f415 Linus Torvalds         2005-04-16  1472  		break;
^1da177e4c3f415 Linus Torvalds         2005-04-16  1473  
^1da177e4c3f415 Linus Torvalds         2005-04-16  1474  	case 2:
65c92cbb3f23656 Robert Elliott         2022-09-30  1475  		ret = min(ret, tcrypt_test("sha1"));
^1da177e4c3f415 Linus Torvalds         2005-04-16  1476  		break;
^1da177e4c3f415 Linus Torvalds         2005-04-16  1477  
^1da177e4c3f415 Linus Torvalds         2005-04-16  1478  	case 3:
65c92cbb3f23656 Robert Elliott         2022-09-30  1479  		ret = min(ret, tcrypt_test("ecb(des)"));
65c92cbb3f23656 Robert Elliott         2022-09-30  1480  		ret = min(ret, tcrypt_test("cbc(des)"));
65c92cbb3f23656 Robert Elliott         2022-09-30  1481  		ret = min(ret, tcrypt_test("ctr(des)"));
^1da177e4c3f415 Linus Torvalds         2005-04-16  1482  		break;
^1da177e4c3f415 Linus Torvalds         2005-04-16  1483  
^1da177e4c3f415 Linus Torvalds         2005-04-16  1484  	case 4:
65c92cbb3f23656 Robert Elliott         2022-09-30  1485  		ret = min(ret, tcrypt_test("ecb(des3_ede)"));
65c92cbb3f23656 Robert Elliott         2022-09-30  1486  		ret = min(ret, tcrypt_test("cbc(des3_ede)"));
65c92cbb3f23656 Robert Elliott         2022-09-30  1487  		ret = min(ret, tcrypt_test("ctr(des3_ede)"));
^1da177e4c3f415 Linus Torvalds         2005-04-16  1488  		break;
^1da177e4c3f415 Linus Torvalds         2005-04-16  1489  
^1da177e4c3f415 Linus Torvalds         2005-04-16  1490  	case 5:
65c92cbb3f23656 Robert Elliott         2022-09-30  1491  		ret = min(ret, tcrypt_test("md4"));
^1da177e4c3f415 Linus Torvalds         2005-04-16  1492  		break;
^1da177e4c3f415 Linus Torvalds         2005-04-16  1493  
^1da177e4c3f415 Linus Torvalds         2005-04-16  1494  	case 6:
65c92cbb3f23656 Robert Elliott         2022-09-30  1495  		ret = min(ret, tcrypt_test("sha256"));
^1da177e4c3f415 Linus Torvalds         2005-04-16  1496  		break;
^1da177e4c3f415 Linus Torvalds         2005-04-16  1497  
^1da177e4c3f415 Linus Torvalds         2005-04-16  1498  	case 7:
65c92cbb3f23656 Robert Elliott         2022-09-30  1499  		ret = min(ret, tcrypt_test("ecb(blowfish)"));
65c92cbb3f23656 Robert Elliott         2022-09-30  1500  		ret = min(ret, tcrypt_test("cbc(blowfish)"));
65c92cbb3f23656 Robert Elliott         2022-09-30  1501  		ret = min(ret, tcrypt_test("ctr(blowfish)"));
^1da177e4c3f415 Linus Torvalds         2005-04-16  1502  		break;
^1da177e4c3f415 Linus Torvalds         2005-04-16  1503  
^1da177e4c3f415 Linus Torvalds         2005-04-16  1504  	case 8:
65c92cbb3f23656 Robert Elliott         2022-09-30  1505  		ret = min(ret, tcrypt_test("ecb(twofish)"));
65c92cbb3f23656 Robert Elliott         2022-09-30  1506  		ret = min(ret, tcrypt_test("cbc(twofish)"));
65c92cbb3f23656 Robert Elliott         2022-09-30  1507  		ret = min(ret, tcrypt_test("ctr(twofish)"));
65c92cbb3f23656 Robert Elliott         2022-09-30  1508  		ret = min(ret, tcrypt_test("lrw(twofish)"));
65c92cbb3f23656 Robert Elliott         2022-09-30  1509  		ret = min(ret, tcrypt_test("xts(twofish)"));
^1da177e4c3f415 Linus Torvalds         2005-04-16  1510  		break;
^1da177e4c3f415 Linus Torvalds         2005-04-16  1511  
^1da177e4c3f415 Linus Torvalds         2005-04-16  1512  	case 9:
65c92cbb3f23656 Robert Elliott         2022-09-30  1513  		ret = min(ret, tcrypt_test("ecb(serpent)"));
65c92cbb3f23656 Robert Elliott         2022-09-30  1514  		ret = min(ret, tcrypt_test("cbc(serpent)"));
65c92cbb3f23656 Robert Elliott         2022-09-30  1515  		ret = min(ret, tcrypt_test("ctr(serpent)"));
65c92cbb3f23656 Robert Elliott         2022-09-30  1516  		ret = min(ret, tcrypt_test("lrw(serpent)"));
65c92cbb3f23656 Robert Elliott         2022-09-30  1517  		ret = min(ret, tcrypt_test("xts(serpent)"));
^1da177e4c3f415 Linus Torvalds         2005-04-16  1518  		break;
^1da177e4c3f415 Linus Torvalds         2005-04-16  1519  
^1da177e4c3f415 Linus Torvalds         2005-04-16  1520  	case 10:
65c92cbb3f23656 Robert Elliott         2022-09-30  1521  		ret = min(ret, tcrypt_test("ecb(aes)"));
65c92cbb3f23656 Robert Elliott         2022-09-30  1522  		ret = min(ret, tcrypt_test("cbc(aes)"));
65c92cbb3f23656 Robert Elliott         2022-09-30  1523  		ret = min(ret, tcrypt_test("lrw(aes)"));
65c92cbb3f23656 Robert Elliott         2022-09-30  1524  		ret = min(ret, tcrypt_test("xts(aes)"));
65c92cbb3f23656 Robert Elliott         2022-09-30  1525  		ret = min(ret, tcrypt_test("ctr(aes)"));
65c92cbb3f23656 Robert Elliott         2022-09-30  1526  		ret = min(ret, tcrypt_test("rfc3686(ctr(aes))"));
65c92cbb3f23656 Robert Elliott         2022-09-30  1527  		ret = min(ret, tcrypt_test("xctr(aes)"));
^1da177e4c3f415 Linus Torvalds         2005-04-16  1528  		break;
^1da177e4c3f415 Linus Torvalds         2005-04-16  1529  
^1da177e4c3f415 Linus Torvalds         2005-04-16  1530  	case 11:
65c92cbb3f23656 Robert Elliott         2022-09-30  1531  		ret = min(ret, tcrypt_test("sha384"));
^1da177e4c3f415 Linus Torvalds         2005-04-16  1532  		break;
^1da177e4c3f415 Linus Torvalds         2005-04-16  1533  
^1da177e4c3f415 Linus Torvalds         2005-04-16  1534  	case 12:
65c92cbb3f23656 Robert Elliott         2022-09-30  1535  		ret = min(ret, tcrypt_test("sha512"));
^1da177e4c3f415 Linus Torvalds         2005-04-16  1536  		break;
^1da177e4c3f415 Linus Torvalds         2005-04-16  1537  
^1da177e4c3f415 Linus Torvalds         2005-04-16  1538  	case 13:
65c92cbb3f23656 Robert Elliott         2022-09-30  1539  		ret = min(ret, tcrypt_test("deflate"));
^1da177e4c3f415 Linus Torvalds         2005-04-16  1540  		break;
^1da177e4c3f415 Linus Torvalds         2005-04-16  1541  
^1da177e4c3f415 Linus Torvalds         2005-04-16  1542  	case 14:
65c92cbb3f23656 Robert Elliott         2022-09-30  1543  		ret = min(ret, tcrypt_test("ecb(cast5)"));
65c92cbb3f23656 Robert Elliott         2022-09-30  1544  		ret = min(ret, tcrypt_test("cbc(cast5)"));
65c92cbb3f23656 Robert Elliott         2022-09-30  1545  		ret = min(ret, tcrypt_test("ctr(cast5)"));
^1da177e4c3f415 Linus Torvalds         2005-04-16  1546  		break;
^1da177e4c3f415 Linus Torvalds         2005-04-16  1547  
^1da177e4c3f415 Linus Torvalds         2005-04-16  1548  	case 15:
65c92cbb3f23656 Robert Elliott         2022-09-30  1549  		ret = min(ret, tcrypt_test("ecb(cast6)"));
65c92cbb3f23656 Robert Elliott         2022-09-30  1550  		ret = min(ret, tcrypt_test("cbc(cast6)"));
65c92cbb3f23656 Robert Elliott         2022-09-30  1551  		ret = min(ret, tcrypt_test("ctr(cast6)"));
65c92cbb3f23656 Robert Elliott         2022-09-30  1552  		ret = min(ret, tcrypt_test("lrw(cast6)"));
65c92cbb3f23656 Robert Elliott         2022-09-30  1553  		ret = min(ret, tcrypt_test("xts(cast6)"));
^1da177e4c3f415 Linus Torvalds         2005-04-16  1554  		break;
^1da177e4c3f415 Linus Torvalds         2005-04-16  1555  
^1da177e4c3f415 Linus Torvalds         2005-04-16  1556  	case 16:
65c92cbb3f23656 Robert Elliott         2022-09-30  1557  		ret = min(ret, tcrypt_test("ecb(arc4)"));
^1da177e4c3f415 Linus Torvalds         2005-04-16  1558  		break;
^1da177e4c3f415 Linus Torvalds         2005-04-16  1559  
^1da177e4c3f415 Linus Torvalds         2005-04-16  1560  	case 17:
65c92cbb3f23656 Robert Elliott         2022-09-30  1561  		ret = min(ret, tcrypt_test("michael_mic"));
^1da177e4c3f415 Linus Torvalds         2005-04-16  1562  		break;
^1da177e4c3f415 Linus Torvalds         2005-04-16  1563  
^1da177e4c3f415 Linus Torvalds         2005-04-16  1564  	case 18:
65c92cbb3f23656 Robert Elliott         2022-09-30  1565  		ret = min(ret, tcrypt_test("crc32c"));
^1da177e4c3f415 Linus Torvalds         2005-04-16  1566  		break;
^1da177e4c3f415 Linus Torvalds         2005-04-16  1567  
^1da177e4c3f415 Linus Torvalds         2005-04-16  1568  	case 19:
65c92cbb3f23656 Robert Elliott         2022-09-30  1569  		ret = min(ret, tcrypt_test("ecb(tea)"));
^1da177e4c3f415 Linus Torvalds         2005-04-16  1570  		break;
^1da177e4c3f415 Linus Torvalds         2005-04-16  1571  
^1da177e4c3f415 Linus Torvalds         2005-04-16  1572  	case 20:
65c92cbb3f23656 Robert Elliott         2022-09-30  1573  		ret = min(ret, tcrypt_test("ecb(xtea)"));
^1da177e4c3f415 Linus Torvalds         2005-04-16  1574  		break;
^1da177e4c3f415 Linus Torvalds         2005-04-16  1575  
^1da177e4c3f415 Linus Torvalds         2005-04-16  1576  	case 21:
65c92cbb3f23656 Robert Elliott         2022-09-30  1577  		ret = min(ret, tcrypt_test("ecb(khazad)"));
^1da177e4c3f415 Linus Torvalds         2005-04-16  1578  		break;
^1da177e4c3f415 Linus Torvalds         2005-04-16  1579  
^1da177e4c3f415 Linus Torvalds         2005-04-16  1580  	case 22:
65c92cbb3f23656 Robert Elliott         2022-09-30  1581  		ret = min(ret, tcrypt_test("wp512"));
^1da177e4c3f415 Linus Torvalds         2005-04-16  1582  		break;
^1da177e4c3f415 Linus Torvalds         2005-04-16  1583  
^1da177e4c3f415 Linus Torvalds         2005-04-16  1584  	case 23:
65c92cbb3f23656 Robert Elliott         2022-09-30  1585  		ret = min(ret, tcrypt_test("wp384"));
^1da177e4c3f415 Linus Torvalds         2005-04-16  1586  		break;
^1da177e4c3f415 Linus Torvalds         2005-04-16  1587  
^1da177e4c3f415 Linus Torvalds         2005-04-16  1588  	case 24:
65c92cbb3f23656 Robert Elliott         2022-09-30  1589  		ret = min(ret, tcrypt_test("wp256"));
^1da177e4c3f415 Linus Torvalds         2005-04-16  1590  		break;
^1da177e4c3f415 Linus Torvalds         2005-04-16  1591  
^1da177e4c3f415 Linus Torvalds         2005-04-16  1592  	case 26:
65c92cbb3f23656 Robert Elliott         2022-09-30  1593  		ret = min(ret, tcrypt_test("ecb(anubis)"));
65c92cbb3f23656 Robert Elliott         2022-09-30  1594  		ret = min(ret, tcrypt_test("cbc(anubis)"));
^1da177e4c3f415 Linus Torvalds         2005-04-16  1595  		break;
^1da177e4c3f415 Linus Torvalds         2005-04-16  1596  
fb4f10ed50f01b0 Aaron Grothe           2005-09-01  1597  	case 30:
65c92cbb3f23656 Robert Elliott         2022-09-30  1598  		ret = min(ret, tcrypt_test("ecb(xeta)"));
fb4f10ed50f01b0 Aaron Grothe           2005-09-01  1599  		break;
fb4f10ed50f01b0 Aaron Grothe           2005-09-01  1600  
90831639a65592d David Howells          2006-12-16  1601  	case 31:
65c92cbb3f23656 Robert Elliott         2022-09-30  1602  		ret = min(ret, tcrypt_test("pcbc(fcrypt)"));
90831639a65592d David Howells          2006-12-16  1603  		break;
90831639a65592d David Howells          2006-12-16  1604  
02ab5a7056bd844 Noriaki TAKAMIYA       2007-01-24  1605  	case 32:
65c92cbb3f23656 Robert Elliott         2022-09-30  1606  		ret = min(ret, tcrypt_test("ecb(camellia)"));
65c92cbb3f23656 Robert Elliott         2022-09-30  1607  		ret = min(ret, tcrypt_test("cbc(camellia)"));
65c92cbb3f23656 Robert Elliott         2022-09-30  1608  		ret = min(ret, tcrypt_test("ctr(camellia)"));
65c92cbb3f23656 Robert Elliott         2022-09-30  1609  		ret = min(ret, tcrypt_test("lrw(camellia)"));
65c92cbb3f23656 Robert Elliott         2022-09-30  1610  		ret = min(ret, tcrypt_test("xts(camellia)"));
02ab5a7056bd844 Noriaki TAKAMIYA       2007-01-24  1611  		break;
93b5e86a6d13c5d Jussi Kivilinna        2013-04-08  1612  
cd12fb906d2591e Jonathan Lynch         2007-11-10  1613  	case 33:
65c92cbb3f23656 Robert Elliott         2022-09-30  1614  		ret = min(ret, tcrypt_test("sha224"));
cd12fb906d2591e Jonathan Lynch         2007-11-10  1615  		break;
02ab5a7056bd844 Noriaki TAKAMIYA       2007-01-24  1616  
8df213d9b520a4b Herbert Xu             2007-12-02  1617  	case 35:
65c92cbb3f23656 Robert Elliott         2022-09-30  1618  		ret = min(ret, tcrypt_test("gcm(aes)"));
8df213d9b520a4b Herbert Xu             2007-12-02  1619  		break;
8df213d9b520a4b Herbert Xu             2007-12-02  1620  
0b77abb3b2d0c2e Zoltan Sogor           2007-12-07  1621  	case 36:
65c92cbb3f23656 Robert Elliott         2022-09-30  1622  		ret = min(ret, tcrypt_test("lzo"));
0b77abb3b2d0c2e Zoltan Sogor           2007-12-07  1623  		break;
0b77abb3b2d0c2e Zoltan Sogor           2007-12-07  1624  
93cc74e078eed87 Joy Latten             2007-12-12  1625  	case 37:
65c92cbb3f23656 Robert Elliott         2022-09-30  1626  		ret = min(ret, tcrypt_test("ccm(aes)"));
93cc74e078eed87 Joy Latten             2007-12-12  1627  		break;
93cc74e078eed87 Joy Latten             2007-12-12  1628  
76cb9521795a167 Kevin Coffman          2008-03-24  1629  	case 38:
65c92cbb3f23656 Robert Elliott         2022-09-30  1630  		ret = min(ret, tcrypt_test("cts(cbc(aes))"));
76cb9521795a167 Kevin Coffman          2008-03-24  1631  		break;
76cb9521795a167 Kevin Coffman          2008-03-24  1632  
aa22cd7f67807eb Ard Biesheuvel         2021-05-20  1633          case 39:
65c92cbb3f23656 Robert Elliott         2022-09-30  1634  		ret = min(ret, tcrypt_test("xxhash64"));
aa22cd7f67807eb Ard Biesheuvel         2021-05-20  1635  		break;
aa22cd7f67807eb Ard Biesheuvel         2021-05-20  1636  
fd4adf1a0b1923f Adrian-Ken Rueegsegger 2008-05-07  1637          case 40:
65c92cbb3f23656 Robert Elliott         2022-09-30  1638  		ret = min(ret, tcrypt_test("rmd160"));
fd4adf1a0b1923f Adrian-Ken Rueegsegger 2008-05-07  1639  		break;
fd4adf1a0b1923f Adrian-Ken Rueegsegger 2008-05-07  1640  
aa22cd7f67807eb Ard Biesheuvel         2021-05-20  1641  	case 42:
65c92cbb3f23656 Robert Elliott         2022-09-30  1642  		ret = min(ret, tcrypt_test("blake2b-512"));
aa22cd7f67807eb Ard Biesheuvel         2021-05-20  1643  		break;
aa22cd7f67807eb Ard Biesheuvel         2021-05-20  1644  
01b323245e4f6d4 Herbert Xu             2008-07-31  1645  	case 43:
65c92cbb3f23656 Robert Elliott         2022-09-30  1646  		ret = min(ret, tcrypt_test("ecb(seed)"));
2998db37b5c6289 Adrian-Ken Rueegsegger 2008-05-09  1647  		break;
2998db37b5c6289 Adrian-Ken Rueegsegger 2008-05-09  1648  
5d667322a25ab4e Jarod Wilson           2009-05-04  1649  	case 45:
65c92cbb3f23656 Robert Elliott         2022-09-30  1650  		ret = min(ret, tcrypt_test("rfc4309(ccm(aes))"));
5d667322a25ab4e Jarod Wilson           2009-05-04  1651  		break;
5d667322a25ab4e Jarod Wilson           2009-05-04  1652  
54216bbd76aa394 Jussi Kivilinna        2012-09-21  1653  	case 46:
65c92cbb3f23656 Robert Elliott         2022-09-30  1654  		ret = min(ret, tcrypt_test("ghash"));
54216bbd76aa394 Jussi Kivilinna        2012-09-21  1655  		break;
54216bbd76aa394 Jussi Kivilinna        2012-09-21  1656  
79cc6ab8947bd23 raveendra padasalagi   2016-06-17  1657  	case 48:
65c92cbb3f23656 Robert Elliott         2022-09-30  1658  		ret = min(ret, tcrypt_test("sha3-224"));
79cc6ab8947bd23 raveendra padasalagi   2016-06-17  1659  		break;
79cc6ab8947bd23 raveendra padasalagi   2016-06-17  1660  
79cc6ab8947bd23 raveendra padasalagi   2016-06-17  1661  	case 49:
65c92cbb3f23656 Robert Elliott         2022-09-30  1662  		ret = min(ret, tcrypt_test("sha3-256"));
79cc6ab8947bd23 raveendra padasalagi   2016-06-17  1663  		break;
79cc6ab8947bd23 raveendra padasalagi   2016-06-17  1664  
79cc6ab8947bd23 raveendra padasalagi   2016-06-17  1665  	case 50:
65c92cbb3f23656 Robert Elliott         2022-09-30  1666  		ret = min(ret, tcrypt_test("sha3-384"));
79cc6ab8947bd23 raveendra padasalagi   2016-06-17  1667  		break;
79cc6ab8947bd23 raveendra padasalagi   2016-06-17  1668  
79cc6ab8947bd23 raveendra padasalagi   2016-06-17  1669  	case 51:
65c92cbb3f23656 Robert Elliott         2022-09-30  1670  		ret = min(ret, tcrypt_test("sha3-512"));
79cc6ab8947bd23 raveendra padasalagi   2016-06-17  1671  		break;
79cc6ab8947bd23 raveendra padasalagi   2016-06-17  1672  
b7e2753040a2fef Gilad Ben-Yossef       2017-08-21  1673  	case 52:
65c92cbb3f23656 Robert Elliott         2022-09-30  1674  		ret = min(ret, tcrypt_test("sm3"));
b7e2753040a2fef Gilad Ben-Yossef       2017-08-21  1675  		break;
b7e2753040a2fef Gilad Ben-Yossef       2017-08-21  1676  
25a0b9d4e512ea0 Vitaly Chikunov        2018-11-07  1677  	case 53:
65c92cbb3f23656 Robert Elliott         2022-09-30  1678  		ret = min(ret, tcrypt_test("streebog256"));
25a0b9d4e512ea0 Vitaly Chikunov        2018-11-07  1679  		break;
25a0b9d4e512ea0 Vitaly Chikunov        2018-11-07  1680  
25a0b9d4e512ea0 Vitaly Chikunov        2018-11-07  1681  	case 54:
65c92cbb3f23656 Robert Elliott         2022-09-30  1682  		ret = min(ret, tcrypt_test("streebog512"));
25a0b9d4e512ea0 Vitaly Chikunov        2018-11-07  1683  		break;
25a0b9d4e512ea0 Vitaly Chikunov        2018-11-07  1684  
357a753f5ec7ccd Tianjia Zhang          2021-08-13  1685  	case 55:
65c92cbb3f23656 Robert Elliott         2022-09-30  1686  		ret = min(ret, tcrypt_test("gcm(sm4)"));
357a753f5ec7ccd Tianjia Zhang          2021-08-13  1687  		break;
357a753f5ec7ccd Tianjia Zhang          2021-08-13  1688  
357a753f5ec7ccd Tianjia Zhang          2021-08-13  1689  	case 56:
65c92cbb3f23656 Robert Elliott         2022-09-30  1690  		ret = min(ret, tcrypt_test("ccm(sm4)"));
357a753f5ec7ccd Tianjia Zhang          2021-08-13  1691  		break;
357a753f5ec7ccd Tianjia Zhang          2021-08-13  1692  
f3c923a09c4c4f5 Nathan Huckleberry     2022-05-20  1693  	case 57:
65c92cbb3f23656 Robert Elliott         2022-09-30  1694  		ret = min(ret, tcrypt_test("polyval"));
f3c923a09c4c4f5 Nathan Huckleberry     2022-05-20  1695  		break;
f3c923a09c4c4f5 Nathan Huckleberry     2022-05-20  1696  
01ce31de7043e17 Taehee Yoo             2022-07-04  1697  	case 58:
65c92cbb3f23656 Robert Elliott         2022-09-30  1698  		ret = min(ret, tcrypt_test("gcm(aria)"));
01ce31de7043e17 Taehee Yoo             2022-07-04  1699  		break;
01ce31de7043e17 Taehee Yoo             2022-07-04  1700  
3c3836378dd578a Tianjia Zhang          2022-10-27  1701  	case 59:
3c3836378dd578a Tianjia Zhang          2022-10-27  1702  		ret = min(ret, tcrypt_test("cts(cbc(sm4))"));
3c3836378dd578a Tianjia Zhang          2022-10-27  1703  		break;
3c3836378dd578a Tianjia Zhang          2022-10-27  1704  
^1da177e4c3f415 Linus Torvalds         2005-04-16  1705  	case 100:
65c92cbb3f23656 Robert Elliott         2022-09-30  1706  		ret = min(ret, tcrypt_test("hmac(md5)"));
^1da177e4c3f415 Linus Torvalds         2005-04-16  1707  		break;
^1da177e4c3f415 Linus Torvalds         2005-04-16  1708  
^1da177e4c3f415 Linus Torvalds         2005-04-16  1709  	case 101:
65c92cbb3f23656 Robert Elliott         2022-09-30  1710  		ret = min(ret, tcrypt_test("hmac(sha1)"));
^1da177e4c3f415 Linus Torvalds         2005-04-16  1711  		break;
^1da177e4c3f415 Linus Torvalds         2005-04-16  1712  
^1da177e4c3f415 Linus Torvalds         2005-04-16  1713  	case 102:
65c92cbb3f23656 Robert Elliott         2022-09-30  1714  		ret = min(ret, tcrypt_test("hmac(sha256)"));
^1da177e4c3f415 Linus Torvalds         2005-04-16  1715  		break;
^1da177e4c3f415 Linus Torvalds         2005-04-16  1716  
a28091ae170cd06 Andrew Donofrio        2006-12-10  1717  	case 103:
65c92cbb3f23656 Robert Elliott         2022-09-30  1718  		ret = min(ret, tcrypt_test("hmac(sha384)"));
a28091ae170cd06 Andrew Donofrio        2006-12-10  1719  		break;
a28091ae170cd06 Andrew Donofrio        2006-12-10  1720  
a28091ae170cd06 Andrew Donofrio        2006-12-10  1721  	case 104:
65c92cbb3f23656 Robert Elliott         2022-09-30  1722  		ret = min(ret, tcrypt_test("hmac(sha512)"));
a28091ae170cd06 Andrew Donofrio        2006-12-10  1723  		break;
38ed9ab23b8614c Herbert Xu             2008-01-01  1724  
cd12fb906d2591e Jonathan Lynch         2007-11-10  1725  	case 105:
65c92cbb3f23656 Robert Elliott         2022-09-30  1726  		ret = min(ret, tcrypt_test("hmac(sha224)"));
cd12fb906d2591e Jonathan Lynch         2007-11-10  1727  		break;
^1da177e4c3f415 Linus Torvalds         2005-04-16  1728  
38ed9ab23b8614c Herbert Xu             2008-01-01  1729  	case 106:
65c92cbb3f23656 Robert Elliott         2022-09-30  1730  		ret = min(ret, tcrypt_test("xcbc(aes)"));
38ed9ab23b8614c Herbert Xu             2008-01-01  1731  		break;
38ed9ab23b8614c Herbert Xu             2008-01-01  1732  
fd4adf1a0b1923f Adrian-Ken Rueegsegger 2008-05-07  1733  	case 108:
65c92cbb3f23656 Robert Elliott         2022-09-30  1734  		ret = min(ret, tcrypt_test("hmac(rmd160)"));
fd4adf1a0b1923f Adrian-Ken Rueegsegger 2008-05-07  1735  		break;
fd4adf1a0b1923f Adrian-Ken Rueegsegger 2008-05-07  1736  
98eca72fa04a9bb raveendra padasalagi   2016-07-01  1737  	case 111:
65c92cbb3f23656 Robert Elliott         2022-09-30  1738  		ret = min(ret, tcrypt_test("hmac(sha3-224)"));
98eca72fa04a9bb raveendra padasalagi   2016-07-01  1739  		break;
98eca72fa04a9bb raveendra padasalagi   2016-07-01  1740  
98eca72fa04a9bb raveendra padasalagi   2016-07-01  1741  	case 112:
65c92cbb3f23656 Robert Elliott         2022-09-30  1742  		ret = min(ret, tcrypt_test("hmac(sha3-256)"));
98eca72fa04a9bb raveendra padasalagi   2016-07-01  1743  		break;
98eca72fa04a9bb raveendra padasalagi   2016-07-01  1744  
98eca72fa04a9bb raveendra padasalagi   2016-07-01  1745  	case 113:
65c92cbb3f23656 Robert Elliott         2022-09-30  1746  		ret = min(ret, tcrypt_test("hmac(sha3-384)"));
98eca72fa04a9bb raveendra padasalagi   2016-07-01  1747  		break;
98eca72fa04a9bb raveendra padasalagi   2016-07-01  1748  
98eca72fa04a9bb raveendra padasalagi   2016-07-01  1749  	case 114:
65c92cbb3f23656 Robert Elliott         2022-09-30  1750  		ret = min(ret, tcrypt_test("hmac(sha3-512)"));
98eca72fa04a9bb raveendra padasalagi   2016-07-01  1751  		break;
98eca72fa04a9bb raveendra padasalagi   2016-07-01  1752  
25a0b9d4e512ea0 Vitaly Chikunov        2018-11-07  1753  	case 115:
65c92cbb3f23656 Robert Elliott         2022-09-30  1754  		ret = min(ret, tcrypt_test("hmac(streebog256)"));
25a0b9d4e512ea0 Vitaly Chikunov        2018-11-07  1755  		break;
25a0b9d4e512ea0 Vitaly Chikunov        2018-11-07  1756  
25a0b9d4e512ea0 Vitaly Chikunov        2018-11-07  1757  	case 116:
65c92cbb3f23656 Robert Elliott         2022-09-30  1758  		ret = min(ret, tcrypt_test("hmac(streebog512)"));
25a0b9d4e512ea0 Vitaly Chikunov        2018-11-07  1759  		break;
25a0b9d4e512ea0 Vitaly Chikunov        2018-11-07  1760  
e08ca2da39db22d Jarod Wilson           2009-05-04  1761  	case 150:
65c92cbb3f23656 Robert Elliott         2022-09-30  1762  		ret = min(ret, tcrypt_test("ansi_cprng"));
e08ca2da39db22d Jarod Wilson           2009-05-04  1763  		break;
e08ca2da39db22d Jarod Wilson           2009-05-04  1764  
69435b94d01f491 Adrian Hoban           2010-11-04  1765  	case 151:
65c92cbb3f23656 Robert Elliott         2022-09-30  1766  		ret = min(ret, tcrypt_test("rfc4106(gcm(aes))"));
69435b94d01f491 Adrian Hoban           2010-11-04  1767  		break;
69435b94d01f491 Adrian Hoban           2010-11-04  1768  
e9b7441a9926b80 Jussi Kivilinna        2013-04-07  1769  	case 152:
65c92cbb3f23656 Robert Elliott         2022-09-30  1770  		ret = min(ret, tcrypt_test("rfc4543(gcm(aes))"));
e9b7441a9926b80 Jussi Kivilinna        2013-04-07  1771  		break;
e9b7441a9926b80 Jussi Kivilinna        2013-04-07  1772  
93b5e86a6d13c5d Jussi Kivilinna        2013-04-08  1773  	case 153:
65c92cbb3f23656 Robert Elliott         2022-09-30  1774  		ret = min(ret, tcrypt_test("cmac(aes)"));
93b5e86a6d13c5d Jussi Kivilinna        2013-04-08  1775  		break;
93b5e86a6d13c5d Jussi Kivilinna        2013-04-08  1776  
93b5e86a6d13c5d Jussi Kivilinna        2013-04-08  1777  	case 154:
65c92cbb3f23656 Robert Elliott         2022-09-30  1778  		ret = min(ret, tcrypt_test("cmac(des3_ede)"));
93b5e86a6d13c5d Jussi Kivilinna        2013-04-08  1779  		break;
93b5e86a6d13c5d Jussi Kivilinna        2013-04-08  1780  
bbf9c8934ba2bfd Horia Geanta           2013-11-28  1781  	case 155:
65c92cbb3f23656 Robert Elliott         2022-09-30  1782  		ret = min(ret, tcrypt_test("authenc(hmac(sha1),cbc(aes))"));
bbf9c8934ba2bfd Horia Geanta           2013-11-28  1783  		break;
bbf9c8934ba2bfd Horia Geanta           2013-11-28  1784  
bca4feb0d4fe2d5 Horia Geanta           2014-03-14  1785  	case 156:
65c92cbb3f23656 Robert Elliott         2022-09-30  1786  		ret = min(ret, tcrypt_test("authenc(hmac(md5),ecb(cipher_null))"));
bca4feb0d4fe2d5 Horia Geanta           2014-03-14  1787  		break;
bca4feb0d4fe2d5 Horia Geanta           2014-03-14  1788  
bca4feb0d4fe2d5 Horia Geanta           2014-03-14  1789  	case 157:
65c92cbb3f23656 Robert Elliott         2022-09-30  1790  		ret = min(ret, tcrypt_test("authenc(hmac(sha1),ecb(cipher_null))"));
bca4feb0d4fe2d5 Horia Geanta           2014-03-14  1791  		break;
357a753f5ec7ccd Tianjia Zhang          2021-08-13  1792  
357a753f5ec7ccd Tianjia Zhang          2021-08-13  1793  	case 158:
65c92cbb3f23656 Robert Elliott         2022-09-30  1794  		ret = min(ret, tcrypt_test("cbcmac(sm4)"));
357a753f5ec7ccd Tianjia Zhang          2021-08-13  1795  		break;
357a753f5ec7ccd Tianjia Zhang          2021-08-13  1796  
357a753f5ec7ccd Tianjia Zhang          2021-08-13  1797  	case 159:
65c92cbb3f23656 Robert Elliott         2022-09-30  1798  		ret = min(ret, tcrypt_test("cmac(sm4)"));
357a753f5ec7ccd Tianjia Zhang          2021-08-13  1799  		break;
357a753f5ec7ccd Tianjia Zhang          2021-08-13  1800  
3c3836378dd578a Tianjia Zhang          2022-10-27  1801  	case 160:
3c3836378dd578a Tianjia Zhang          2022-10-27  1802  		ret = min(ret, tcrypt_test("xcbc(sm4)"));
3c3836378dd578a Tianjia Zhang          2022-10-27  1803  		break;
3c3836378dd578a Tianjia Zhang          2022-10-27  1804  
5208ed2ca16526c Nitesh Lal             2014-05-21  1805  	case 181:
65c92cbb3f23656 Robert Elliott         2022-09-30  1806  		ret = min(ret, tcrypt_test("authenc(hmac(sha1),cbc(des))"));
5208ed2ca16526c Nitesh Lal             2014-05-21  1807  		break;
5208ed2ca16526c Nitesh Lal             2014-05-21  1808  	case 182:
65c92cbb3f23656 Robert Elliott         2022-09-30  1809  		ret = min(ret, tcrypt_test("authenc(hmac(sha1),cbc(des3_ede))"));
5208ed2ca16526c Nitesh Lal             2014-05-21  1810  		break;
5208ed2ca16526c Nitesh Lal             2014-05-21  1811  	case 183:
65c92cbb3f23656 Robert Elliott         2022-09-30  1812  		ret = min(ret, tcrypt_test("authenc(hmac(sha224),cbc(des))"));
5208ed2ca16526c Nitesh Lal             2014-05-21  1813  		break;
5208ed2ca16526c Nitesh Lal             2014-05-21  1814  	case 184:
65c92cbb3f23656 Robert Elliott         2022-09-30  1815  		ret = min(ret, tcrypt_test("authenc(hmac(sha224),cbc(des3_ede))"));
5208ed2ca16526c Nitesh Lal             2014-05-21  1816  		break;
5208ed2ca16526c Nitesh Lal             2014-05-21  1817  	case 185:
65c92cbb3f23656 Robert Elliott         2022-09-30  1818  		ret = min(ret, tcrypt_test("authenc(hmac(sha256),cbc(des))"));
5208ed2ca16526c Nitesh Lal             2014-05-21  1819  		break;
5208ed2ca16526c Nitesh Lal             2014-05-21  1820  	case 186:
65c92cbb3f23656 Robert Elliott         2022-09-30  1821  		ret = min(ret, tcrypt_test("authenc(hmac(sha256),cbc(des3_ede))"));
5208ed2ca16526c Nitesh Lal             2014-05-21  1822  		break;
5208ed2ca16526c Nitesh Lal             2014-05-21  1823  	case 187:
65c92cbb3f23656 Robert Elliott         2022-09-30  1824  		ret = min(ret, tcrypt_test("authenc(hmac(sha384),cbc(des))"));
5208ed2ca16526c Nitesh Lal             2014-05-21  1825  		break;
5208ed2ca16526c Nitesh Lal             2014-05-21  1826  	case 188:
65c92cbb3f23656 Robert Elliott         2022-09-30  1827  		ret = min(ret, tcrypt_test("authenc(hmac(sha384),cbc(des3_ede))"));
5208ed2ca16526c Nitesh Lal             2014-05-21  1828  		break;
5208ed2ca16526c Nitesh Lal             2014-05-21  1829  	case 189:
65c92cbb3f23656 Robert Elliott         2022-09-30  1830  		ret = min(ret, tcrypt_test("authenc(hmac(sha512),cbc(des))"));
5208ed2ca16526c Nitesh Lal             2014-05-21  1831  		break;
5208ed2ca16526c Nitesh Lal             2014-05-21  1832  	case 190:
65c92cbb3f23656 Robert Elliott         2022-09-30  1833  		ret = min(ret, tcrypt_test("authenc(hmac(sha512),cbc(des3_ede))"));
5208ed2ca16526c Nitesh Lal             2014-05-21  1834  		break;
cd83a8a7c3eaffe Gilad Ben-Yossef       2018-03-06  1835  	case 191:
65c92cbb3f23656 Robert Elliott         2022-09-30  1836  		ret = min(ret, tcrypt_test("ecb(sm4)"));
65c92cbb3f23656 Robert Elliott         2022-09-30  1837  		ret = min(ret, tcrypt_test("cbc(sm4)"));
65c92cbb3f23656 Robert Elliott         2022-09-30  1838  		ret = min(ret, tcrypt_test("ctr(sm4)"));
3c3836378dd578a Tianjia Zhang          2022-10-27  1839  		ret = min(ret, tcrypt_test("xts(sm4)"));
cd83a8a7c3eaffe Gilad Ben-Yossef       2018-03-06  1840  		break;
01ce31de7043e17 Taehee Yoo             2022-07-04  1841  	case 192:
65c92cbb3f23656 Robert Elliott         2022-09-30  1842  		ret = min(ret, tcrypt_test("ecb(aria)"));
65c92cbb3f23656 Robert Elliott         2022-09-30  1843  		ret = min(ret, tcrypt_test("cbc(aria)"));
65c92cbb3f23656 Robert Elliott         2022-09-30  1844  		ret = min(ret, tcrypt_test("ctr(aria)"));
01ce31de7043e17 Taehee Yoo             2022-07-04  1845  		break;
43a7885ec0dfca2 Vladis Dronov          2024-02-29  1846  	case 193:
43a7885ec0dfca2 Vladis Dronov          2024-02-29  1847  		ret = min(ret, tcrypt_test("ffdhe2048(dh)"));
43a7885ec0dfca2 Vladis Dronov          2024-02-29  1848  		break;
ebfd9bcf16e4aad Harald Welte           2005-06-22  1849  	case 200:
cba83564d112e4a Herbert Xu             2006-08-13  1850  		test_cipher_speed("ecb(aes)", ENCRYPT, sec, NULL, 0,
477035c2abdcff7 Sebastian Siewior      2008-03-11  1851  				speed_template_16_24_32);
cba83564d112e4a Herbert Xu             2006-08-13  1852  		test_cipher_speed("ecb(aes)", DECRYPT, sec, NULL, 0,
477035c2abdcff7 Sebastian Siewior      2008-03-11  1853  				speed_template_16_24_32);
cba83564d112e4a Herbert Xu             2006-08-13  1854  		test_cipher_speed("cbc(aes)", ENCRYPT, sec, NULL, 0,
477035c2abdcff7 Sebastian Siewior      2008-03-11  1855  				speed_template_16_24_32);
cba83564d112e4a Herbert Xu             2006-08-13  1856  		test_cipher_speed("cbc(aes)", DECRYPT, sec, NULL, 0,
477035c2abdcff7 Sebastian Siewior      2008-03-11  1857  				speed_template_16_24_32);
f3d1044cd0a9b42 Rik Snel               2006-11-29  1858  		test_cipher_speed("lrw(aes)", ENCRYPT, sec, NULL, 0,
477035c2abdcff7 Sebastian Siewior      2008-03-11  1859  				speed_template_32_40_48);
f3d1044cd0a9b42 Rik Snel               2006-11-29  1860  		test_cipher_speed("lrw(aes)", DECRYPT, sec, NULL, 0,
477035c2abdcff7 Sebastian Siewior      2008-03-11  1861  				speed_template_32_40_48);
f19f5111c94053b Rik Snel               2007-09-19  1862  		test_cipher_speed("xts(aes)", ENCRYPT, sec, NULL, 0,
b66ad0b7aa92e62 Horia Geantă           2017-07-19  1863  				speed_template_32_64);
f19f5111c94053b Rik Snel               2007-09-19  1864  		test_cipher_speed("xts(aes)", DECRYPT, sec, NULL, 0,
b66ad0b7aa92e62 Horia Geantă           2017-07-19  1865  				speed_template_32_64);
1503a24f53f153f Herbert Xu             2016-06-29  1866  		test_cipher_speed("cts(cbc(aes))", ENCRYPT, sec, NULL, 0,
1503a24f53f153f Herbert Xu             2016-06-29  1867  				speed_template_16_24_32);
1503a24f53f153f Herbert Xu             2016-06-29  1868  		test_cipher_speed("cts(cbc(aes))", DECRYPT, sec, NULL, 0,
1503a24f53f153f Herbert Xu             2016-06-29  1869  				speed_template_16_24_32);
9996e3421cae20a Jan Glauber            2011-04-26  1870  		test_cipher_speed("ctr(aes)", ENCRYPT, sec, NULL, 0,
9996e3421cae20a Jan Glauber            2011-04-26  1871  				speed_template_16_24_32);
9996e3421cae20a Jan Glauber            2011-04-26  1872  		test_cipher_speed("ctr(aes)", DECRYPT, sec, NULL, 0,
9996e3421cae20a Jan Glauber            2011-04-26  1873  				speed_template_16_24_32);
ebfd9bcf16e4aad Harald Welte           2005-06-22  1874  		break;
ebfd9bcf16e4aad Harald Welte           2005-06-22  1875  
ebfd9bcf16e4aad Harald Welte           2005-06-22  1876  	case 201:
cba83564d112e4a Herbert Xu             2006-08-13  1877  		test_cipher_speed("ecb(des3_ede)", ENCRYPT, sec,
da7f033ddc9fdeb Herbert Xu             2008-07-31  1878  				des3_speed_template, DES3_SPEED_VECTORS,
477035c2abdcff7 Sebastian Siewior      2008-03-11  1879  				speed_template_24);
cba83564d112e4a Herbert Xu             2006-08-13  1880  		test_cipher_speed("ecb(des3_ede)", DECRYPT, sec,
da7f033ddc9fdeb Herbert Xu             2008-07-31  1881  				des3_speed_template, DES3_SPEED_VECTORS,
477035c2abdcff7 Sebastian Siewior      2008-03-11  1882  				speed_template_24);
cba83564d112e4a Herbert Xu             2006-08-13  1883  		test_cipher_speed("cbc(des3_ede)", ENCRYPT, sec,
da7f033ddc9fdeb Herbert Xu             2008-07-31  1884  				des3_speed_template, DES3_SPEED_VECTORS,
477035c2abdcff7 Sebastian Siewior      2008-03-11  1885  				speed_template_24);
cba83564d112e4a Herbert Xu             2006-08-13  1886  		test_cipher_speed("cbc(des3_ede)", DECRYPT, sec,
da7f033ddc9fdeb Herbert Xu             2008-07-31  1887  				des3_speed_template, DES3_SPEED_VECTORS,
477035c2abdcff7 Sebastian Siewior      2008-03-11  1888  				speed_template_24);
87131507e1a60c4 Jussi Kivilinna        2014-06-09  1889  		test_cipher_speed("ctr(des3_ede)", ENCRYPT, sec,
87131507e1a60c4 Jussi Kivilinna        2014-06-09  1890  				des3_speed_template, DES3_SPEED_VECTORS,
87131507e1a60c4 Jussi Kivilinna        2014-06-09  1891  				speed_template_24);
87131507e1a60c4 Jussi Kivilinna        2014-06-09  1892  		test_cipher_speed("ctr(des3_ede)", DECRYPT, sec,
87131507e1a60c4 Jussi Kivilinna        2014-06-09  1893  				des3_speed_template, DES3_SPEED_VECTORS,
87131507e1a60c4 Jussi Kivilinna        2014-06-09  1894  				speed_template_24);
ebfd9bcf16e4aad Harald Welte           2005-06-22  1895  		break;
ebfd9bcf16e4aad Harald Welte           2005-06-22  1896  
ebfd9bcf16e4aad Harald Welte           2005-06-22  1897  	case 202:
cba83564d112e4a Herbert Xu             2006-08-13  1898  		test_cipher_speed("ecb(twofish)", ENCRYPT, sec, NULL, 0,
477035c2abdcff7 Sebastian Siewior      2008-03-11  1899  				speed_template_16_24_32);
cba83564d112e4a Herbert Xu             2006-08-13  1900  		test_cipher_speed("ecb(twofish)", DECRYPT, sec, NULL, 0,
477035c2abdcff7 Sebastian Siewior      2008-03-11  1901  				speed_template_16_24_32);
cba83564d112e4a Herbert Xu             2006-08-13  1902  		test_cipher_speed("cbc(twofish)", ENCRYPT, sec, NULL, 0,
477035c2abdcff7 Sebastian Siewior      2008-03-11  1903  				speed_template_16_24_32);
cba83564d112e4a Herbert Xu             2006-08-13  1904  		test_cipher_speed("cbc(twofish)", DECRYPT, sec, NULL, 0,
477035c2abdcff7 Sebastian Siewior      2008-03-11  1905  				speed_template_16_24_32);
ee5002a5497f321 Jussi Kivilinna        2011-09-26  1906  		test_cipher_speed("ctr(twofish)", ENCRYPT, sec, NULL, 0,
ee5002a5497f321 Jussi Kivilinna        2011-09-26  1907  				speed_template_16_24_32);
ee5002a5497f321 Jussi Kivilinna        2011-09-26  1908  		test_cipher_speed("ctr(twofish)", DECRYPT, sec, NULL, 0,
ee5002a5497f321 Jussi Kivilinna        2011-09-26  1909  				speed_template_16_24_32);
bee3a90ef5366b5 Jussi Kivilinna        2011-10-18  1910  		test_cipher_speed("lrw(twofish)", ENCRYPT, sec, NULL, 0,
bee3a90ef5366b5 Jussi Kivilinna        2011-10-18  1911  				speed_template_32_40_48);
bee3a90ef5366b5 Jussi Kivilinna        2011-10-18  1912  		test_cipher_speed("lrw(twofish)", DECRYPT, sec, NULL, 0,
bee3a90ef5366b5 Jussi Kivilinna        2011-10-18  1913  				speed_template_32_40_48);
131f754161bc01f Jussi Kivilinna        2011-10-18  1914  		test_cipher_speed("xts(twofish)", ENCRYPT, sec, NULL, 0,
131f754161bc01f Jussi Kivilinna        2011-10-18  1915  				speed_template_32_48_64);
131f754161bc01f Jussi Kivilinna        2011-10-18  1916  		test_cipher_speed("xts(twofish)", DECRYPT, sec, NULL, 0,
131f754161bc01f Jussi Kivilinna        2011-10-18  1917  				speed_template_32_48_64);
ebfd9bcf16e4aad Harald Welte           2005-06-22  1918  		break;
ebfd9bcf16e4aad Harald Welte           2005-06-22  1919  
ebfd9bcf16e4aad Harald Welte           2005-06-22  1920  	case 203:
cba83564d112e4a Herbert Xu             2006-08-13  1921  		test_cipher_speed("ecb(blowfish)", ENCRYPT, sec, NULL, 0,
477035c2abdcff7 Sebastian Siewior      2008-03-11  1922  				  speed_template_8_32);
cba83564d112e4a Herbert Xu             2006-08-13  1923  		test_cipher_speed("ecb(blowfish)", DECRYPT, sec, NULL, 0,
477035c2abdcff7 Sebastian Siewior      2008-03-11  1924  				  speed_template_8_32);
cba83564d112e4a Herbert Xu             2006-08-13  1925  		test_cipher_speed("cbc(blowfish)", ENCRYPT, sec, NULL, 0,
477035c2abdcff7 Sebastian Siewior      2008-03-11  1926  				  speed_template_8_32);
cba83564d112e4a Herbert Xu             2006-08-13  1927  		test_cipher_speed("cbc(blowfish)", DECRYPT, sec, NULL, 0,
477035c2abdcff7 Sebastian Siewior      2008-03-11  1928  				  speed_template_8_32);
7d47b86cfef808c Jussi Kivilinna        2011-09-02  1929  		test_cipher_speed("ctr(blowfish)", ENCRYPT, sec, NULL, 0,
7d47b86cfef808c Jussi Kivilinna        2011-09-02  1930  				  speed_template_8_32);
7d47b86cfef808c Jussi Kivilinna        2011-09-02  1931  		test_cipher_speed("ctr(blowfish)", DECRYPT, sec, NULL, 0,
7d47b86cfef808c Jussi Kivilinna        2011-09-02  1932  				  speed_template_8_32);
ebfd9bcf16e4aad Harald Welte           2005-06-22  1933  		break;
ebfd9bcf16e4aad Harald Welte           2005-06-22  1934  
ebfd9bcf16e4aad Harald Welte           2005-06-22  1935  	case 204:
cba83564d112e4a Herbert Xu             2006-08-13  1936  		test_cipher_speed("ecb(des)", ENCRYPT, sec, NULL, 0,
477035c2abdcff7 Sebastian Siewior      2008-03-11  1937  				  speed_template_8);
cba83564d112e4a Herbert Xu             2006-08-13  1938  		test_cipher_speed("ecb(des)", DECRYPT, sec, NULL, 0,
477035c2abdcff7 Sebastian Siewior      2008-03-11  1939  				  speed_template_8);
cba83564d112e4a Herbert Xu             2006-08-13  1940  		test_cipher_speed("cbc(des)", ENCRYPT, sec, NULL, 0,
477035c2abdcff7 Sebastian Siewior      2008-03-11  1941  				  speed_template_8);
cba83564d112e4a Herbert Xu             2006-08-13  1942  		test_cipher_speed("cbc(des)", DECRYPT, sec, NULL, 0,
477035c2abdcff7 Sebastian Siewior      2008-03-11  1943  				  speed_template_8);
ebfd9bcf16e4aad Harald Welte           2005-06-22  1944  		break;
ebfd9bcf16e4aad Harald Welte           2005-06-22  1945  
02ab5a7056bd844 Noriaki TAKAMIYA       2007-01-24  1946  	case 205:
02ab5a7056bd844 Noriaki TAKAMIYA       2007-01-24  1947  		test_cipher_speed("ecb(camellia)", ENCRYPT, sec, NULL, 0,
477035c2abdcff7 Sebastian Siewior      2008-03-11  1948  				speed_template_16_24_32);
02ab5a7056bd844 Noriaki TAKAMIYA       2007-01-24  1949  		test_cipher_speed("ecb(camellia)", DECRYPT, sec, NULL, 0,
477035c2abdcff7 Sebastian Siewior      2008-03-11  1950  				speed_template_16_24_32);
02ab5a7056bd844 Noriaki TAKAMIYA       2007-01-24  1951  		test_cipher_speed("cbc(camellia)", ENCRYPT, sec, NULL, 0,
477035c2abdcff7 Sebastian Siewior      2008-03-11  1952  				speed_template_16_24_32);
02ab5a7056bd844 Noriaki TAKAMIYA       2007-01-24  1953  		test_cipher_speed("cbc(camellia)", DECRYPT, sec, NULL, 0,
477035c2abdcff7 Sebastian Siewior      2008-03-11  1954  				speed_template_16_24_32);
4de5933780f897b Jussi Kivilinna        2012-03-05  1955  		test_cipher_speed("ctr(camellia)", ENCRYPT, sec, NULL, 0,
4de5933780f897b Jussi Kivilinna        2012-03-05  1956  				speed_template_16_24_32);
4de5933780f897b Jussi Kivilinna        2012-03-05  1957  		test_cipher_speed("ctr(camellia)", DECRYPT, sec, NULL, 0,
4de5933780f897b Jussi Kivilinna        2012-03-05  1958  				speed_template_16_24_32);
4de5933780f897b Jussi Kivilinna        2012-03-05  1959  		test_cipher_speed("lrw(camellia)", ENCRYPT, sec, NULL, 0,
4de5933780f897b Jussi Kivilinna        2012-03-05  1960  				speed_template_32_40_48);
4de5933780f897b Jussi Kivilinna        2012-03-05  1961  		test_cipher_speed("lrw(camellia)", DECRYPT, sec, NULL, 0,
4de5933780f897b Jussi Kivilinna        2012-03-05  1962  				speed_template_32_40_48);
4de5933780f897b Jussi Kivilinna        2012-03-05  1963  		test_cipher_speed("xts(camellia)", ENCRYPT, sec, NULL, 0,
4de5933780f897b Jussi Kivilinna        2012-03-05  1964  				speed_template_32_48_64);
4de5933780f897b Jussi Kivilinna        2012-03-05  1965  		test_cipher_speed("xts(camellia)", DECRYPT, sec, NULL, 0,
4de5933780f897b Jussi Kivilinna        2012-03-05  1966  				speed_template_32_48_64);
02ab5a7056bd844 Noriaki TAKAMIYA       2007-01-24  1967  		break;
02ab5a7056bd844 Noriaki TAKAMIYA       2007-01-24  1968  
7fb7fe4469d0b87 Jussi Kivilinna        2011-10-18  1969  	case 207:
7fb7fe4469d0b87 Jussi Kivilinna        2011-10-18  1970  		test_cipher_speed("ecb(serpent)", ENCRYPT, sec, NULL, 0,
7fb7fe4469d0b87 Jussi Kivilinna        2011-10-18  1971  				  speed_template_16_32);
7fb7fe4469d0b87 Jussi Kivilinna        2011-10-18  1972  		test_cipher_speed("ecb(serpent)", DECRYPT, sec, NULL, 0,
7fb7fe4469d0b87 Jussi Kivilinna        2011-10-18  1973  				  speed_template_16_32);
7fb7fe4469d0b87 Jussi Kivilinna        2011-10-18  1974  		test_cipher_speed("cbc(serpent)", ENCRYPT, sec, NULL, 0,
7fb7fe4469d0b87 Jussi Kivilinna        2011-10-18  1975  				  speed_template_16_32);
7fb7fe4469d0b87 Jussi Kivilinna        2011-10-18  1976  		test_cipher_speed("cbc(serpent)", DECRYPT, sec, NULL, 0,
7fb7fe4469d0b87 Jussi Kivilinna        2011-10-18  1977  				  speed_template_16_32);
7fb7fe4469d0b87 Jussi Kivilinna        2011-10-18  1978  		test_cipher_speed("ctr(serpent)", ENCRYPT, sec, NULL, 0,
7fb7fe4469d0b87 Jussi Kivilinna        2011-10-18  1979  				  speed_template_16_32);
7fb7fe4469d0b87 Jussi Kivilinna        2011-10-18  1980  		test_cipher_speed("ctr(serpent)", DECRYPT, sec, NULL, 0,
7fb7fe4469d0b87 Jussi Kivilinna        2011-10-18  1981  				  speed_template_16_32);
87aae4bfb2912d1 Jussi Kivilinna        2011-10-18  1982  		test_cipher_speed("lrw(serpent)", ENCRYPT, sec, NULL, 0,
87aae4bfb2912d1 Jussi Kivilinna        2011-10-18  1983  				  speed_template_32_48);
87aae4bfb2912d1 Jussi Kivilinna        2011-10-18  1984  		test_cipher_speed("lrw(serpent)", DECRYPT, sec, NULL, 0,
87aae4bfb2912d1 Jussi Kivilinna        2011-10-18  1985  				  speed_template_32_48);
5209c07ac3601cf Jussi Kivilinna        2011-10-18  1986  		test_cipher_speed("xts(serpent)", ENCRYPT, sec, NULL, 0,
5209c07ac3601cf Jussi Kivilinna        2011-10-18  1987  				  speed_template_32_64);
5209c07ac3601cf Jussi Kivilinna        2011-10-18  1988  		test_cipher_speed("xts(serpent)", DECRYPT, sec, NULL, 0,
5209c07ac3601cf Jussi Kivilinna        2011-10-18  1989  				  speed_template_32_64);
7fb7fe4469d0b87 Jussi Kivilinna        2011-10-18  1990  		break;
7fb7fe4469d0b87 Jussi Kivilinna        2011-10-18  1991  
31b4cd2907322bd Jussi Kivilinna        2012-06-12  1992  	case 208:
31b4cd2907322bd Jussi Kivilinna        2012-06-12  1993  		test_cipher_speed("ecb(arc4)", ENCRYPT, sec, NULL, 0,
31b4cd2907322bd Jussi Kivilinna        2012-06-12  1994  				  speed_template_8);
31b4cd2907322bd Jussi Kivilinna        2012-06-12  1995  		break;
31b4cd2907322bd Jussi Kivilinna        2012-06-12  1996  
a2c582609556298 Johannes Goetzfried    2012-07-11  1997  	case 209:
a2c582609556298 Johannes Goetzfried    2012-07-11  1998  		test_cipher_speed("ecb(cast5)", ENCRYPT, sec, NULL, 0,
a2c582609556298 Johannes Goetzfried    2012-07-11  1999  				  speed_template_8_16);
a2c582609556298 Johannes Goetzfried    2012-07-11  2000  		test_cipher_speed("ecb(cast5)", DECRYPT, sec, NULL, 0,
a2c582609556298 Johannes Goetzfried    2012-07-11  2001  				  speed_template_8_16);
a2c582609556298 Johannes Goetzfried    2012-07-11  2002  		test_cipher_speed("cbc(cast5)", ENCRYPT, sec, NULL, 0,
a2c582609556298 Johannes Goetzfried    2012-07-11  2003  				  speed_template_8_16);
a2c582609556298 Johannes Goetzfried    2012-07-11  2004  		test_cipher_speed("cbc(cast5)", DECRYPT, sec, NULL, 0,
a2c582609556298 Johannes Goetzfried    2012-07-11  2005  				  speed_template_8_16);
a2c582609556298 Johannes Goetzfried    2012-07-11  2006  		test_cipher_speed("ctr(cast5)", ENCRYPT, sec, NULL, 0,
a2c582609556298 Johannes Goetzfried    2012-07-11  2007  				  speed_template_8_16);
a2c582609556298 Johannes Goetzfried    2012-07-11  2008  		test_cipher_speed("ctr(cast5)", DECRYPT, sec, NULL, 0,
a2c582609556298 Johannes Goetzfried    2012-07-11  2009  				  speed_template_8_16);
a2c582609556298 Johannes Goetzfried    2012-07-11  2010  		break;
a2c582609556298 Johannes Goetzfried    2012-07-11  2011  
9b8b04051d0df1e Johannes Goetzfried    2012-07-11  2012  	case 210:
9b8b04051d0df1e Johannes Goetzfried    2012-07-11  2013  		test_cipher_speed("ecb(cast6)", ENCRYPT, sec, NULL, 0,
9b8b04051d0df1e Johannes Goetzfried    2012-07-11  2014  				  speed_template_16_32);
9b8b04051d0df1e Johannes Goetzfried    2012-07-11  2015  		test_cipher_speed("ecb(cast6)", DECRYPT, sec, NULL, 0,
9b8b04051d0df1e Johannes Goetzfried    2012-07-11  2016  				  speed_template_16_32);
9b8b04051d0df1e Johannes Goetzfried    2012-07-11  2017  		test_cipher_speed("cbc(cast6)", ENCRYPT, sec, NULL, 0,
9b8b04051d0df1e Johannes Goetzfried    2012-07-11  2018  				  speed_template_16_32);
9b8b04051d0df1e Johannes Goetzfried    2012-07-11  2019  		test_cipher_speed("cbc(cast6)", DECRYPT, sec, NULL, 0,
9b8b04051d0df1e Johannes Goetzfried    2012-07-11  2020  				  speed_template_16_32);
9b8b04051d0df1e Johannes Goetzfried    2012-07-11  2021  		test_cipher_speed("ctr(cast6)", ENCRYPT, sec, NULL, 0,
9b8b04051d0df1e Johannes Goetzfried    2012-07-11  2022  				  speed_template_16_32);
9b8b04051d0df1e Johannes Goetzfried    2012-07-11  2023  		test_cipher_speed("ctr(cast6)", DECRYPT, sec, NULL, 0,
9b8b04051d0df1e Johannes Goetzfried    2012-07-11  2024  				  speed_template_16_32);
9b8b04051d0df1e Johannes Goetzfried    2012-07-11  2025  		test_cipher_speed("lrw(cast6)", ENCRYPT, sec, NULL, 0,
9b8b04051d0df1e Johannes Goetzfried    2012-07-11  2026  				  speed_template_32_48);
9b8b04051d0df1e Johannes Goetzfried    2012-07-11  2027  		test_cipher_speed("lrw(cast6)", DECRYPT, sec, NULL, 0,
9b8b04051d0df1e Johannes Goetzfried    2012-07-11  2028  				  speed_template_32_48);
9b8b04051d0df1e Johannes Goetzfried    2012-07-11  2029  		test_cipher_speed("xts(cast6)", ENCRYPT, sec, NULL, 0,
9b8b04051d0df1e Johannes Goetzfried    2012-07-11  2030  				  speed_template_32_64);
9b8b04051d0df1e Johannes Goetzfried    2012-07-11  2031  		test_cipher_speed("xts(cast6)", DECRYPT, sec, NULL, 0,
9b8b04051d0df1e Johannes Goetzfried    2012-07-11  2032  				  speed_template_32_64);
9b8b04051d0df1e Johannes Goetzfried    2012-07-11  2033  		break;
9b8b04051d0df1e Johannes Goetzfried    2012-07-11  2034  
53f52d7aecb4cb3 Tim Chen               2013-12-11  2035  	case 211:
53f52d7aecb4cb3 Tim Chen               2013-12-11  2036  		test_aead_speed("rfc4106(gcm(aes))", ENCRYPT, sec,
425359aef47972b Ard Biesheuvel         2022-12-14  2037  				NULL, 0, 16, 16, aead_speed_template_20_28_36);
1425d2d17f7309c Vutla, Lokesh          2015-07-07  2038  		test_aead_speed("gcm(aes)", ENCRYPT, sec,
f18611da8683da1 Cyrille Pitchen        2015-11-17  2039  				NULL, 0, 16, 8, speed_template_16_24_32);
4431bd49530c737 Gilad Ben-Yossef       2017-12-17  2040  		test_aead_speed("rfc4106(gcm(aes))", DECRYPT, sec,
425359aef47972b Ard Biesheuvel         2022-12-14  2041  				NULL, 0, 16, 16, aead_speed_template_20_28_36);
4431bd49530c737 Gilad Ben-Yossef       2017-12-17  2042  		test_aead_speed("gcm(aes)", DECRYPT, sec,
4431bd49530c737 Gilad Ben-Yossef       2017-12-17  2043  				NULL, 0, 16, 8, speed_template_16_24_32);
53f52d7aecb4cb3 Tim Chen               2013-12-11  2044  		break;
53f52d7aecb4cb3 Tim Chen               2013-12-11  2045  
4e4aab63d7456fb Herbert Xu             2015-06-17  2046  	case 212:
4e4aab63d7456fb Herbert Xu             2015-06-17  2047  		test_aead_speed("rfc4309(ccm(aes))", ENCRYPT, sec,
34a1c740ea87b50 Herbert Xu             2015-07-09  2048  				NULL, 0, 16, 16, aead_speed_template_19);
4431bd49530c737 Gilad Ben-Yossef       2017-12-17  2049  		test_aead_speed("rfc4309(ccm(aes))", DECRYPT, sec,
4431bd49530c737 Gilad Ben-Yossef       2017-12-17  2050  				NULL, 0, 16, 16, aead_speed_template_19);
4e4aab63d7456fb Herbert Xu             2015-06-17  2051  		break;
4e4aab63d7456fb Herbert Xu             2015-06-17  2052  
2dce063a31ae6cb Martin Willi           2015-07-16  2053  	case 213:
2dce063a31ae6cb Martin Willi           2015-07-16  2054  		test_aead_speed("rfc7539esp(chacha20,poly1305)", ENCRYPT, sec,
2dce063a31ae6cb Martin Willi           2015-07-16  2055  				NULL, 0, 16, 8, aead_speed_template_36);
4431bd49530c737 Gilad Ben-Yossef       2017-12-17  2056  		test_aead_speed("rfc7539esp(chacha20,poly1305)", DECRYPT, sec,
4431bd49530c737 Gilad Ben-Yossef       2017-12-17  2057  				NULL, 0, 16, 8, aead_speed_template_36);
2dce063a31ae6cb Martin Willi           2015-07-16  2058  		break;
2dce063a31ae6cb Martin Willi           2015-07-16  2059  
2dce063a31ae6cb Martin Willi           2015-07-16  2060  	case 214:
2dce063a31ae6cb Martin Willi           2015-07-16  2061  		test_cipher_speed("chacha20", ENCRYPT, sec, NULL, 0,
2dce063a31ae6cb Martin Willi           2015-07-16  2062  				  speed_template_32);
2dce063a31ae6cb Martin Willi           2015-07-16  2063  		break;
2dce063a31ae6cb Martin Willi           2015-07-16  2064  
427988d981c4c20 Gilad Ben-Yossef       2017-12-17  2065  	case 215:
427988d981c4c20 Gilad Ben-Yossef       2017-12-17  2066  		test_mb_aead_speed("rfc4106(gcm(aes))", ENCRYPT, sec, NULL,
425359aef47972b Ard Biesheuvel         2022-12-14  2067  				   0, 16, 16, aead_speed_template_20_28_36, num_mb);
427988d981c4c20 Gilad Ben-Yossef       2017-12-17  2068  		test_mb_aead_speed("gcm(aes)", ENCRYPT, sec, NULL, 0, 16, 8,
427988d981c4c20 Gilad Ben-Yossef       2017-12-17  2069  				   speed_template_16_24_32, num_mb);
427988d981c4c20 Gilad Ben-Yossef       2017-12-17  2070  		test_mb_aead_speed("rfc4106(gcm(aes))", DECRYPT, sec, NULL,
425359aef47972b Ard Biesheuvel         2022-12-14  2071  				   0, 16, 16, aead_speed_template_20_28_36, num_mb);
427988d981c4c20 Gilad Ben-Yossef       2017-12-17  2072  		test_mb_aead_speed("gcm(aes)", DECRYPT, sec, NULL, 0, 16, 8,
427988d981c4c20 Gilad Ben-Yossef       2017-12-17  2073  				   speed_template_16_24_32, num_mb);
427988d981c4c20 Gilad Ben-Yossef       2017-12-17  2074  		break;
427988d981c4c20 Gilad Ben-Yossef       2017-12-17  2075  
427988d981c4c20 Gilad Ben-Yossef       2017-12-17  2076  	case 216:
427988d981c4c20 Gilad Ben-Yossef       2017-12-17  2077  		test_mb_aead_speed("rfc4309(ccm(aes))", ENCRYPT, sec, NULL, 0,
427988d981c4c20 Gilad Ben-Yossef       2017-12-17  2078  				   16, 16, aead_speed_template_19, num_mb);
427988d981c4c20 Gilad Ben-Yossef       2017-12-17  2079  		test_mb_aead_speed("rfc4309(ccm(aes))", DECRYPT, sec, NULL, 0,
427988d981c4c20 Gilad Ben-Yossef       2017-12-17  2080  				   16, 16, aead_speed_template_19, num_mb);
427988d981c4c20 Gilad Ben-Yossef       2017-12-17  2081  		break;
427988d981c4c20 Gilad Ben-Yossef       2017-12-17  2082  
427988d981c4c20 Gilad Ben-Yossef       2017-12-17  2083  	case 217:
427988d981c4c20 Gilad Ben-Yossef       2017-12-17  2084  		test_mb_aead_speed("rfc7539esp(chacha20,poly1305)", ENCRYPT,
427988d981c4c20 Gilad Ben-Yossef       2017-12-17  2085  				   sec, NULL, 0, 16, 8, aead_speed_template_36,
427988d981c4c20 Gilad Ben-Yossef       2017-12-17  2086  				   num_mb);
427988d981c4c20 Gilad Ben-Yossef       2017-12-17  2087  		test_mb_aead_speed("rfc7539esp(chacha20,poly1305)", DECRYPT,
427988d981c4c20 Gilad Ben-Yossef       2017-12-17  2088  				   sec, NULL, 0, 16, 8, aead_speed_template_36,
427988d981c4c20 Gilad Ben-Yossef       2017-12-17  2089  				   num_mb);
427988d981c4c20 Gilad Ben-Yossef       2017-12-17  2090  		break;
427988d981c4c20 Gilad Ben-Yossef       2017-12-17  2091  
95ba597367ddc26 Gilad Ben-Yossef       2018-09-20  2092  	case 218:
95ba597367ddc26 Gilad Ben-Yossef       2018-09-20  2093  		test_cipher_speed("ecb(sm4)", ENCRYPT, sec, NULL, 0,
95ba597367ddc26 Gilad Ben-Yossef       2018-09-20  2094  				speed_template_16);
95ba597367ddc26 Gilad Ben-Yossef       2018-09-20  2095  		test_cipher_speed("ecb(sm4)", DECRYPT, sec, NULL, 0,
95ba597367ddc26 Gilad Ben-Yossef       2018-09-20  2096  				speed_template_16);
95ba597367ddc26 Gilad Ben-Yossef       2018-09-20  2097  		test_cipher_speed("cbc(sm4)", ENCRYPT, sec, NULL, 0,
95ba597367ddc26 Gilad Ben-Yossef       2018-09-20  2098  				speed_template_16);
95ba597367ddc26 Gilad Ben-Yossef       2018-09-20  2099  		test_cipher_speed("cbc(sm4)", DECRYPT, sec, NULL, 0,
95ba597367ddc26 Gilad Ben-Yossef       2018-09-20  2100  				speed_template_16);
3c3836378dd578a Tianjia Zhang          2022-10-27  2101  		test_cipher_speed("cts(cbc(sm4))", ENCRYPT, sec, NULL, 0,
3c3836378dd578a Tianjia Zhang          2022-10-27  2102  				speed_template_16);
3c3836378dd578a Tianjia Zhang          2022-10-27  2103  		test_cipher_speed("cts(cbc(sm4))", DECRYPT, sec, NULL, 0,
3c3836378dd578a Tianjia Zhang          2022-10-27  2104  				speed_template_16);
95ba597367ddc26 Gilad Ben-Yossef       2018-09-20  2105  		test_cipher_speed("ctr(sm4)", ENCRYPT, sec, NULL, 0,
95ba597367ddc26 Gilad Ben-Yossef       2018-09-20  2106  				speed_template_16);
95ba597367ddc26 Gilad Ben-Yossef       2018-09-20  2107  		test_cipher_speed("ctr(sm4)", DECRYPT, sec, NULL, 0,
95ba597367ddc26 Gilad Ben-Yossef       2018-09-20  2108  				speed_template_16);
3c3836378dd578a Tianjia Zhang          2022-10-27  2109  		test_cipher_speed("xts(sm4)", ENCRYPT, sec, NULL, 0,
3c3836378dd578a Tianjia Zhang          2022-10-27  2110  				speed_template_32);
3c3836378dd578a Tianjia Zhang          2022-10-27  2111  		test_cipher_speed("xts(sm4)", DECRYPT, sec, NULL, 0,
3c3836378dd578a Tianjia Zhang          2022-10-27  2112  				speed_template_32);
95ba597367ddc26 Gilad Ben-Yossef       2018-09-20  2113  		break;
059c2a4d8e164dc Eric Biggers           2018-11-16  2114  
059c2a4d8e164dc Eric Biggers           2018-11-16  2115  	case 219:
059c2a4d8e164dc Eric Biggers           2018-11-16  2116  		test_cipher_speed("adiantum(xchacha12,aes)", ENCRYPT, sec, NULL,
059c2a4d8e164dc Eric Biggers           2018-11-16  2117  				  0, speed_template_32);
059c2a4d8e164dc Eric Biggers           2018-11-16  2118  		test_cipher_speed("adiantum(xchacha12,aes)", DECRYPT, sec, NULL,
059c2a4d8e164dc Eric Biggers           2018-11-16  2119  				  0, speed_template_32);
059c2a4d8e164dc Eric Biggers           2018-11-16  2120  		test_cipher_speed("adiantum(xchacha20,aes)", ENCRYPT, sec, NULL,
059c2a4d8e164dc Eric Biggers           2018-11-16  2121  				  0, speed_template_32);
059c2a4d8e164dc Eric Biggers           2018-11-16  2122  		test_cipher_speed("adiantum(xchacha20,aes)", DECRYPT, sec, NULL,
059c2a4d8e164dc Eric Biggers           2018-11-16  2123  				  0, speed_template_32);
059c2a4d8e164dc Eric Biggers           2018-11-16  2124  		break;
059c2a4d8e164dc Eric Biggers           2018-11-16  2125  
f975abb23c6f3e5 Ard Biesheuvel         2019-08-19  2126  	case 220:
f975abb23c6f3e5 Ard Biesheuvel         2019-08-19  2127  		test_acipher_speed("essiv(cbc(aes),sha256)",
f975abb23c6f3e5 Ard Biesheuvel         2019-08-19  2128  				  ENCRYPT, sec, NULL, 0,
f975abb23c6f3e5 Ard Biesheuvel         2019-08-19  2129  				  speed_template_16_24_32);
f975abb23c6f3e5 Ard Biesheuvel         2019-08-19  2130  		test_acipher_speed("essiv(cbc(aes),sha256)",
f975abb23c6f3e5 Ard Biesheuvel         2019-08-19  2131  				  DECRYPT, sec, NULL, 0,
f975abb23c6f3e5 Ard Biesheuvel         2019-08-19  2132  				  speed_template_16_24_32);
f975abb23c6f3e5 Ard Biesheuvel         2019-08-19  2133  		break;
f975abb23c6f3e5 Ard Biesheuvel         2019-08-19  2134  
97bcb161995548a Ard Biesheuvel         2019-07-03  2135  	case 221:
97bcb161995548a Ard Biesheuvel         2019-07-03  2136  		test_aead_speed("aegis128", ENCRYPT, sec,
97bcb161995548a Ard Biesheuvel         2019-07-03  2137  				NULL, 0, 16, 8, speed_template_16);
97bcb161995548a Ard Biesheuvel         2019-07-03  2138  		test_aead_speed("aegis128", DECRYPT, sec,
97bcb161995548a Ard Biesheuvel         2019-07-03  2139  				NULL, 0, 16, 8, speed_template_16);
97bcb161995548a Ard Biesheuvel         2019-07-03  2140  		break;
97bcb161995548a Ard Biesheuvel         2019-07-03  2141  
357a753f5ec7ccd Tianjia Zhang          2021-08-13  2142  	case 222:
357a753f5ec7ccd Tianjia Zhang          2021-08-13  2143  		test_aead_speed("gcm(sm4)", ENCRYPT, sec,
357a753f5ec7ccd Tianjia Zhang          2021-08-13  2144  				NULL, 0, 16, 8, speed_template_16);
357a753f5ec7ccd Tianjia Zhang          2021-08-13  2145  		test_aead_speed("gcm(sm4)", DECRYPT, sec,
357a753f5ec7ccd Tianjia Zhang          2021-08-13  2146  				NULL, 0, 16, 8, speed_template_16);
357a753f5ec7ccd Tianjia Zhang          2021-08-13  2147  		break;
357a753f5ec7ccd Tianjia Zhang          2021-08-13  2148  
357a753f5ec7ccd Tianjia Zhang          2021-08-13  2149  	case 223:
357a753f5ec7ccd Tianjia Zhang          2021-08-13  2150  		test_aead_speed("rfc4309(ccm(sm4))", ENCRYPT, sec,
357a753f5ec7ccd Tianjia Zhang          2021-08-13  2151  				NULL, 0, 16, 16, aead_speed_template_19);
357a753f5ec7ccd Tianjia Zhang          2021-08-13  2152  		test_aead_speed("rfc4309(ccm(sm4))", DECRYPT, sec,
357a753f5ec7ccd Tianjia Zhang          2021-08-13  2153  				NULL, 0, 16, 16, aead_speed_template_19);
357a753f5ec7ccd Tianjia Zhang          2021-08-13  2154  		break;
357a753f5ec7ccd Tianjia Zhang          2021-08-13  2155  
357a753f5ec7ccd Tianjia Zhang          2021-08-13  2156  	case 224:
357a753f5ec7ccd Tianjia Zhang          2021-08-13  2157  		test_mb_aead_speed("gcm(sm4)", ENCRYPT, sec, NULL, 0, 16, 8,
357a753f5ec7ccd Tianjia Zhang          2021-08-13  2158  				   speed_template_16, num_mb);
357a753f5ec7ccd Tianjia Zhang          2021-08-13  2159  		test_mb_aead_speed("gcm(sm4)", DECRYPT, sec, NULL, 0, 16, 8,
357a753f5ec7ccd Tianjia Zhang          2021-08-13  2160  				   speed_template_16, num_mb);
357a753f5ec7ccd Tianjia Zhang          2021-08-13  2161  		break;
357a753f5ec7ccd Tianjia Zhang          2021-08-13  2162  
357a753f5ec7ccd Tianjia Zhang          2021-08-13  2163  	case 225:
357a753f5ec7ccd Tianjia Zhang          2021-08-13  2164  		test_mb_aead_speed("rfc4309(ccm(sm4))", ENCRYPT, sec, NULL, 0,
357a753f5ec7ccd Tianjia Zhang          2021-08-13  2165  				   16, 16, aead_speed_template_19, num_mb);
357a753f5ec7ccd Tianjia Zhang          2021-08-13  2166  		test_mb_aead_speed("rfc4309(ccm(sm4))", DECRYPT, sec, NULL, 0,
357a753f5ec7ccd Tianjia Zhang          2021-08-13  2167  				   16, 16, aead_speed_template_19, num_mb);
357a753f5ec7ccd Tianjia Zhang          2021-08-13  2168  		break;
357a753f5ec7ccd Tianjia Zhang          2021-08-13  2169  
7ff554ced7c7d7c Nathan Huckleberry     2022-05-20  2170  	case 226:
7ff554ced7c7d7c Nathan Huckleberry     2022-05-20  2171  		test_cipher_speed("hctr2(aes)", ENCRYPT, sec, NULL,
7ff554ced7c7d7c Nathan Huckleberry     2022-05-20  2172  				  0, speed_template_32);
7ff554ced7c7d7c Nathan Huckleberry     2022-05-20  2173  		break;
7ff554ced7c7d7c Nathan Huckleberry     2022-05-20  2174  
01ce31de7043e17 Taehee Yoo             2022-07-04  2175  	case 227:
01ce31de7043e17 Taehee Yoo             2022-07-04  2176  		test_cipher_speed("ecb(aria)", ENCRYPT, sec, NULL, 0,
01ce31de7043e17 Taehee Yoo             2022-07-04  2177  				  speed_template_16_24_32);
01ce31de7043e17 Taehee Yoo             2022-07-04  2178  		test_cipher_speed("ecb(aria)", DECRYPT, sec, NULL, 0,
01ce31de7043e17 Taehee Yoo             2022-07-04  2179  				  speed_template_16_24_32);
01ce31de7043e17 Taehee Yoo             2022-07-04  2180  		test_cipher_speed("cbc(aria)", ENCRYPT, sec, NULL, 0,
01ce31de7043e17 Taehee Yoo             2022-07-04  2181  				  speed_template_16_24_32);
01ce31de7043e17 Taehee Yoo             2022-07-04  2182  		test_cipher_speed("cbc(aria)", DECRYPT, sec, NULL, 0,
01ce31de7043e17 Taehee Yoo             2022-07-04  2183  				  speed_template_16_24_32);
01ce31de7043e17 Taehee Yoo             2022-07-04  2184  		test_cipher_speed("ctr(aria)", ENCRYPT, sec, NULL, 0,
01ce31de7043e17 Taehee Yoo             2022-07-04  2185  				  speed_template_16_24_32);
01ce31de7043e17 Taehee Yoo             2022-07-04  2186  		test_cipher_speed("ctr(aria)", DECRYPT, sec, NULL, 0,
01ce31de7043e17 Taehee Yoo             2022-07-04  2187  				  speed_template_16_24_32);
01ce31de7043e17 Taehee Yoo             2022-07-04  2188  		break;
01ce31de7043e17 Taehee Yoo             2022-07-04  2189  
01ce31de7043e17 Taehee Yoo             2022-07-04  2190  	case 228:
01ce31de7043e17 Taehee Yoo             2022-07-04  2191  		test_aead_speed("gcm(aria)", ENCRYPT, sec,
01ce31de7043e17 Taehee Yoo             2022-07-04  2192  				NULL, 0, 16, 8, speed_template_16_24_32);
01ce31de7043e17 Taehee Yoo             2022-07-04  2193  		test_aead_speed("gcm(aria)", DECRYPT, sec,
01ce31de7043e17 Taehee Yoo             2022-07-04  2194  				NULL, 0, 16, 8, speed_template_16_24_32);
01ce31de7043e17 Taehee Yoo             2022-07-04  2195  		break;
01ce31de7043e17 Taehee Yoo             2022-07-04  2196  
c4b1ce72b5c9f7d Taehee Yoo             2022-09-16  2197  	case 229:
c4b1ce72b5c9f7d Taehee Yoo             2022-09-16  2198  		test_mb_aead_speed("gcm(aria)", ENCRYPT, sec, NULL, 0, 16, 8,
c4b1ce72b5c9f7d Taehee Yoo             2022-09-16  2199  				   speed_template_16, num_mb);
c4b1ce72b5c9f7d Taehee Yoo             2022-09-16  2200  		test_mb_aead_speed("gcm(aria)", DECRYPT, sec, NULL, 0, 16, 8,
c4b1ce72b5c9f7d Taehee Yoo             2022-09-16  2201  				   speed_template_16, num_mb);
c4b1ce72b5c9f7d Taehee Yoo             2022-09-16  2202  		break;
c4b1ce72b5c9f7d Taehee Yoo             2022-09-16  2203  
e805792851bcb0b Michal Ludvig          2006-05-30  2204  	case 300:
8606813a6c8997f Herbert Xu             2014-12-04  2205  		if (alg) {
8606813a6c8997f Herbert Xu             2014-12-04  2206  			test_hash_speed(alg, sec, generic_hash_speed_template);
8606813a6c8997f Herbert Xu             2014-12-04  2207  			break;
8606813a6c8997f Herbert Xu             2014-12-04  2208  		}
df561f6688fef77 Gustavo A. R. Silva    2020-08-23  2209  		fallthrough;
e805792851bcb0b Michal Ludvig          2006-05-30  2210  	case 301:
e9d41164e2fdd89 Herbert Xu             2006-08-19  2211  		test_hash_speed("md4", sec, generic_hash_speed_template);
e805792851bcb0b Michal Ludvig          2006-05-30  2212  		if (mode > 300 && mode < 400) break;
df561f6688fef77 Gustavo A. R. Silva    2020-08-23  2213  		fallthrough;
e805792851bcb0b Michal Ludvig          2006-05-30  2214  	case 302:
e9d41164e2fdd89 Herbert Xu             2006-08-19  2215  		test_hash_speed("md5", sec, generic_hash_speed_template);
e805792851bcb0b Michal Ludvig          2006-05-30  2216  		if (mode > 300 && mode < 400) break;
df561f6688fef77 Gustavo A. R. Silva    2020-08-23  2217  		fallthrough;
e805792851bcb0b Michal Ludvig          2006-05-30  2218  	case 303:
e9d41164e2fdd89 Herbert Xu             2006-08-19  2219  		test_hash_speed("sha1", sec, generic_hash_speed_template);
e805792851bcb0b Michal Ludvig          2006-05-30  2220  		if (mode > 300 && mode < 400) break;
df561f6688fef77 Gustavo A. R. Silva    2020-08-23  2221  		fallthrough;
e805792851bcb0b Michal Ludvig          2006-05-30  2222  	case 304:
e9d41164e2fdd89 Herbert Xu             2006-08-19  2223  		test_hash_speed("sha256", sec, generic_hash_speed_template);
e805792851bcb0b Michal Ludvig          2006-05-30  2224  		if (mode > 300 && mode < 400) break;
df561f6688fef77 Gustavo A. R. Silva    2020-08-23  2225  		fallthrough;
e805792851bcb0b Michal Ludvig          2006-05-30  2226  	case 305:
e9d41164e2fdd89 Herbert Xu             2006-08-19  2227  		test_hash_speed("sha384", sec, generic_hash_speed_template);
e805792851bcb0b Michal Ludvig          2006-05-30  2228  		if (mode > 300 && mode < 400) break;
df561f6688fef77 Gustavo A. R. Silva    2020-08-23  2229  		fallthrough;
e805792851bcb0b Michal Ludvig          2006-05-30  2230  	case 306:
e9d41164e2fdd89 Herbert Xu             2006-08-19  2231  		test_hash_speed("sha512", sec, generic_hash_speed_template);
e805792851bcb0b Michal Ludvig          2006-05-30  2232  		if (mode > 300 && mode < 400) break;
df561f6688fef77 Gustavo A. R. Silva    2020-08-23  2233  		fallthrough;
e805792851bcb0b Michal Ludvig          2006-05-30  2234  	case 307:
e9d41164e2fdd89 Herbert Xu             2006-08-19  2235  		test_hash_speed("wp256", sec, generic_hash_speed_template);
e805792851bcb0b Michal Ludvig          2006-05-30  2236  		if (mode > 300 && mode < 400) break;
df561f6688fef77 Gustavo A. R. Silva    2020-08-23  2237  		fallthrough;
e805792851bcb0b Michal Ludvig          2006-05-30  2238  	case 308:
e9d41164e2fdd89 Herbert Xu             2006-08-19  2239  		test_hash_speed("wp384", sec, generic_hash_speed_template);
e805792851bcb0b Michal Ludvig          2006-05-30  2240  		if (mode > 300 && mode < 400) break;
df561f6688fef77 Gustavo A. R. Silva    2020-08-23  2241  		fallthrough;
e805792851bcb0b Michal Ludvig          2006-05-30  2242  	case 309:
e9d41164e2fdd89 Herbert Xu             2006-08-19  2243  		test_hash_speed("wp512", sec, generic_hash_speed_template);
e805792851bcb0b Michal Ludvig          2006-05-30  2244  		if (mode > 300 && mode < 400) break;
df561f6688fef77 Gustavo A. R. Silva    2020-08-23  2245  		fallthrough;
cd12fb906d2591e Jonathan Lynch         2007-11-10  2246  	case 313:
cd12fb906d2591e Jonathan Lynch         2007-11-10  2247  		test_hash_speed("sha224", sec, generic_hash_speed_template);
cd12fb906d2591e Jonathan Lynch         2007-11-10  2248  		if (mode > 300 && mode < 400) break;
df561f6688fef77 Gustavo A. R. Silva    2020-08-23  2249  		fallthrough;
aa22cd7f67807eb Ard Biesheuvel         2021-05-20  2250  	case 314:
aa22cd7f67807eb Ard Biesheuvel         2021-05-20  2251  		test_hash_speed("xxhash64", sec, generic_hash_speed_template);
aa22cd7f67807eb Ard Biesheuvel         2021-05-20  2252  		if (mode > 300 && mode < 400) break;
aa22cd7f67807eb Ard Biesheuvel         2021-05-20  2253  		fallthrough;
fd4adf1a0b1923f Adrian-Ken Rueegsegger 2008-05-07  2254  	case 315:
fd4adf1a0b1923f Adrian-Ken Rueegsegger 2008-05-07  2255  		test_hash_speed("rmd160", sec, generic_hash_speed_template);
fd4adf1a0b1923f Adrian-Ken Rueegsegger 2008-05-07  2256  		if (mode > 300 && mode < 400) break;
df561f6688fef77 Gustavo A. R. Silva    2020-08-23  2257  		fallthrough;
aa22cd7f67807eb Ard Biesheuvel         2021-05-20  2258  	case 317:
aa22cd7f67807eb Ard Biesheuvel         2021-05-20  2259  		test_hash_speed("blake2b-512", sec, generic_hash_speed_template);
aa22cd7f67807eb Ard Biesheuvel         2021-05-20  2260  		if (mode > 300 && mode < 400) break;
aa22cd7f67807eb Ard Biesheuvel         2021-05-20  2261  		fallthrough;
18bcc9194da3c97 Ying Huang             2010-03-10  2262  	case 318:
ba974adb47f2063 Herbert Xu             2020-08-05  2263  		klen = 16;
ba974adb47f2063 Herbert Xu             2020-08-05  2264  		test_hash_speed("ghash", sec, generic_hash_speed_template);
18bcc9194da3c97 Ying Huang             2010-03-10  2265  		if (mode > 300 && mode < 400) break;
df561f6688fef77 Gustavo A. R. Silva    2020-08-23  2266  		fallthrough;
e3899e4df02720f Tim Chen               2012-09-27  2267  	case 319:
e3899e4df02720f Tim Chen               2012-09-27  2268  		test_hash_speed("crc32c", sec, generic_hash_speed_template);
e3899e4df02720f Tim Chen               2012-09-27  2269  		if (mode > 300 && mode < 400) break;
df561f6688fef77 Gustavo A. R. Silva    2020-08-23  2270  		fallthrough;
2dce063a31ae6cb Martin Willi           2015-07-16  2271  	case 321:
2dce063a31ae6cb Martin Willi           2015-07-16  2272  		test_hash_speed("poly1305", sec, poly1305_speed_template);
2dce063a31ae6cb Martin Willi           2015-07-16  2273  		if (mode > 300 && mode < 400) break;
df561f6688fef77 Gustavo A. R. Silva    2020-08-23  2274  		fallthrough;
79cc6ab8947bd23 raveendra padasalagi   2016-06-17  2275  	case 322:
79cc6ab8947bd23 raveendra padasalagi   2016-06-17  2276  		test_hash_speed("sha3-224", sec, generic_hash_speed_template);
79cc6ab8947bd23 raveendra padasalagi   2016-06-17  2277  		if (mode > 300 && mode < 400) break;
df561f6688fef77 Gustavo A. R. Silva    2020-08-23  2278  		fallthrough;
79cc6ab8947bd23 raveendra padasalagi   2016-06-17  2279  	case 323:
79cc6ab8947bd23 raveendra padasalagi   2016-06-17  2280  		test_hash_speed("sha3-256", sec, generic_hash_speed_template);
79cc6ab8947bd23 raveendra padasalagi   2016-06-17  2281  		if (mode > 300 && mode < 400) break;
df561f6688fef77 Gustavo A. R. Silva    2020-08-23  2282  		fallthrough;
79cc6ab8947bd23 raveendra padasalagi   2016-06-17  2283  	case 324:
79cc6ab8947bd23 raveendra padasalagi   2016-06-17  2284  		test_hash_speed("sha3-384", sec, generic_hash_speed_template);
79cc6ab8947bd23 raveendra padasalagi   2016-06-17  2285  		if (mode > 300 && mode < 400) break;
df561f6688fef77 Gustavo A. R. Silva    2020-08-23  2286  		fallthrough;
79cc6ab8947bd23 raveendra padasalagi   2016-06-17  2287  	case 325:
79cc6ab8947bd23 raveendra padasalagi   2016-06-17  2288  		test_hash_speed("sha3-512", sec, generic_hash_speed_template);
79cc6ab8947bd23 raveendra padasalagi   2016-06-17  2289  		if (mode > 300 && mode < 400) break;
df561f6688fef77 Gustavo A. R. Silva    2020-08-23  2290  		fallthrough;
b7e2753040a2fef Gilad Ben-Yossef       2017-08-21  2291  	case 326:
b7e2753040a2fef Gilad Ben-Yossef       2017-08-21  2292  		test_hash_speed("sm3", sec, generic_hash_speed_template);
b7e2753040a2fef Gilad Ben-Yossef       2017-08-21  2293  		if (mode > 300 && mode < 400) break;
df561f6688fef77 Gustavo A. R. Silva    2020-08-23  2294  		fallthrough;
25a0b9d4e512ea0 Vitaly Chikunov        2018-11-07  2295  	case 327:
25a0b9d4e512ea0 Vitaly Chikunov        2018-11-07  2296  		test_hash_speed("streebog256", sec,
25a0b9d4e512ea0 Vitaly Chikunov        2018-11-07  2297  				generic_hash_speed_template);
25a0b9d4e512ea0 Vitaly Chikunov        2018-11-07 @2298  		if (mode > 300 && mode < 400) break;
df561f6688fef77 Gustavo A. R. Silva    2020-08-23  2299  		fallthrough;
25a0b9d4e512ea0 Vitaly Chikunov        2018-11-07  2300  	case 328:
25a0b9d4e512ea0 Vitaly Chikunov        2018-11-07  2301  		test_hash_speed("streebog512", sec,
25a0b9d4e512ea0 Vitaly Chikunov        2018-11-07  2302  				generic_hash_speed_template);
25a0b9d4e512ea0 Vitaly Chikunov        2018-11-07  2303  		if (mode > 300 && mode < 400) break;
df561f6688fef77 Gustavo A. R. Silva    2020-08-23  2304  		fallthrough;
e805792851bcb0b Michal Ludvig          2006-05-30  2305  	case 399:
e805792851bcb0b Michal Ludvig          2006-05-30  2306  		break;
e805792851bcb0b Michal Ludvig          2006-05-30  2307  
beb63da739f7975 David S. Miller        2010-05-19  2308  	case 400:
8606813a6c8997f Herbert Xu             2014-12-04  2309  		if (alg) {
8606813a6c8997f Herbert Xu             2014-12-04  2310  			test_ahash_speed(alg, sec, generic_hash_speed_template);
8606813a6c8997f Herbert Xu             2014-12-04  2311  			break;
8606813a6c8997f Herbert Xu             2014-12-04  2312  		}
df561f6688fef77 Gustavo A. R. Silva    2020-08-23  2313  		fallthrough;
beb63da739f7975 David S. Miller        2010-05-19  2314  	case 401:
beb63da739f7975 David S. Miller        2010-05-19  2315  		test_ahash_speed("md4", sec, generic_hash_speed_template);
beb63da739f7975 David S. Miller        2010-05-19  2316  		if (mode > 400 && mode < 500) break;
df561f6688fef77 Gustavo A. R. Silva    2020-08-23  2317  		fallthrough;
beb63da739f7975 David S. Miller        2010-05-19  2318  	case 402:
beb63da739f7975 David S. Miller        2010-05-19  2319  		test_ahash_speed("md5", sec, generic_hash_speed_template);
beb63da739f7975 David S. Miller        2010-05-19  2320  		if (mode > 400 && mode < 500) break;
df561f6688fef77 Gustavo A. R. Silva    2020-08-23  2321  		fallthrough;
beb63da739f7975 David S. Miller        2010-05-19  2322  	case 403:
beb63da739f7975 David S. Miller        2010-05-19  2323  		test_ahash_speed("sha1", sec, generic_hash_speed_template);
beb63da739f7975 David S. Miller        2010-05-19  2324  		if (mode > 400 && mode < 500) break;
df561f6688fef77 Gustavo A. R. Silva    2020-08-23  2325  		fallthrough;
beb63da739f7975 David S. Miller        2010-05-19  2326  	case 404:
beb63da739f7975 David S. Miller        2010-05-19  2327  		test_ahash_speed("sha256", sec, generic_hash_speed_template);
beb63da739f7975 David S. Miller        2010-05-19  2328  		if (mode > 400 && mode < 500) break;
df561f6688fef77 Gustavo A. R. Silva    2020-08-23  2329  		fallthrough;
beb63da739f7975 David S. Miller        2010-05-19  2330  	case 405:
beb63da739f7975 David S. Miller        2010-05-19  2331  		test_ahash_speed("sha384", sec, generic_hash_speed_template);
beb63da739f7975 David S. Miller        2010-05-19  2332  		if (mode > 400 && mode < 500) break;
df561f6688fef77 Gustavo A. R. Silva    2020-08-23  2333  		fallthrough;
beb63da739f7975 David S. Miller        2010-05-19  2334  	case 406:
beb63da739f7975 David S. Miller        2010-05-19  2335  		test_ahash_speed("sha512", sec, generic_hash_speed_template);
beb63da739f7975 David S. Miller        2010-05-19  2336  		if (mode > 400 && mode < 500) break;
df561f6688fef77 Gustavo A. R. Silva    2020-08-23  2337  		fallthrough;
beb63da739f7975 David S. Miller        2010-05-19  2338  	case 407:
beb63da739f7975 David S. Miller        2010-05-19  2339  		test_ahash_speed("wp256", sec, generic_hash_speed_template);
beb63da739f7975 David S. Miller        2010-05-19  2340  		if (mode > 400 && mode < 500) break;
df561f6688fef77 Gustavo A. R. Silva    2020-08-23  2341  		fallthrough;
beb63da739f7975 David S. Miller        2010-05-19  2342  	case 408:
beb63da739f7975 David S. Miller        2010-05-19  2343  		test_ahash_speed("wp384", sec, generic_hash_speed_template);
beb63da739f7975 David S. Miller        2010-05-19  2344  		if (mode > 400 && mode < 500) break;
df561f6688fef77 Gustavo A. R. Silva    2020-08-23  2345  		fallthrough;
beb63da739f7975 David S. Miller        2010-05-19  2346  	case 409:
beb63da739f7975 David S. Miller        2010-05-19  2347  		test_ahash_speed("wp512", sec, generic_hash_speed_template);
beb63da739f7975 David S. Miller        2010-05-19  2348  		if (mode > 400 && mode < 500) break;
df561f6688fef77 Gustavo A. R. Silva    2020-08-23  2349  		fallthrough;
beb63da739f7975 David S. Miller        2010-05-19  2350  	case 413:
beb63da739f7975 David S. Miller        2010-05-19  2351  		test_ahash_speed("sha224", sec, generic_hash_speed_template);
beb63da739f7975 David S. Miller        2010-05-19  2352  		if (mode > 400 && mode < 500) break;
df561f6688fef77 Gustavo A. R. Silva    2020-08-23  2353  		fallthrough;
aa22cd7f67807eb Ard Biesheuvel         2021-05-20  2354  	case 414:
aa22cd7f67807eb Ard Biesheuvel         2021-05-20  2355  		test_ahash_speed("xxhash64", sec, generic_hash_speed_template);
aa22cd7f67807eb Ard Biesheuvel         2021-05-20  2356  		if (mode > 400 && mode < 500) break;
aa22cd7f67807eb Ard Biesheuvel         2021-05-20  2357  		fallthrough;
beb63da739f7975 David S. Miller        2010-05-19  2358  	case 415:
beb63da739f7975 David S. Miller        2010-05-19  2359  		test_ahash_speed("rmd160", sec, generic_hash_speed_template);
beb63da739f7975 David S. Miller        2010-05-19  2360  		if (mode > 400 && mode < 500) break;
df561f6688fef77 Gustavo A. R. Silva    2020-08-23  2361  		fallthrough;
aa22cd7f67807eb Ard Biesheuvel         2021-05-20  2362  	case 417:
aa22cd7f67807eb Ard Biesheuvel         2021-05-20  2363  		test_ahash_speed("blake2b-512", sec, generic_hash_speed_template);
aa22cd7f67807eb Ard Biesheuvel         2021-05-20  2364  		if (mode > 400 && mode < 500) break;
aa22cd7f67807eb Ard Biesheuvel         2021-05-20  2365  		fallthrough;
79cc6ab8947bd23 raveendra padasalagi   2016-06-17  2366  	case 418:
79cc6ab8947bd23 raveendra padasalagi   2016-06-17  2367  		test_ahash_speed("sha3-224", sec, generic_hash_speed_template);
79cc6ab8947bd23 raveendra padasalagi   2016-06-17  2368  		if (mode > 400 && mode < 500) break;
df561f6688fef77 Gustavo A. R. Silva    2020-08-23  2369  		fallthrough;
79cc6ab8947bd23 raveendra padasalagi   2016-06-17  2370  	case 419:
79cc6ab8947bd23 raveendra padasalagi   2016-06-17  2371  		test_ahash_speed("sha3-256", sec, generic_hash_speed_template);
79cc6ab8947bd23 raveendra padasalagi   2016-06-17  2372  		if (mode > 400 && mode < 500) break;
df561f6688fef77 Gustavo A. R. Silva    2020-08-23  2373  		fallthrough;
79cc6ab8947bd23 raveendra padasalagi   2016-06-17  2374  	case 420:
79cc6ab8947bd23 raveendra padasalagi   2016-06-17  2375  		test_ahash_speed("sha3-384", sec, generic_hash_speed_template);
79cc6ab8947bd23 raveendra padasalagi   2016-06-17  2376  		if (mode > 400 && mode < 500) break;
df561f6688fef77 Gustavo A. R. Silva    2020-08-23  2377  		fallthrough;
79cc6ab8947bd23 raveendra padasalagi   2016-06-17  2378  	case 421:
79cc6ab8947bd23 raveendra padasalagi   2016-06-17  2379  		test_ahash_speed("sha3-512", sec, generic_hash_speed_template);
79cc6ab8947bd23 raveendra padasalagi   2016-06-17  2380  		if (mode > 400 && mode < 500) break;
df561f6688fef77 Gustavo A. R. Silva    2020-08-23  2381  		fallthrough;
087bcd225c5656a Megha Dey              2016-06-23  2382  	case 422:
ba2c149d0812cee Tianjia Zhang          2022-01-07  2383  		test_ahash_speed("sm3", sec, generic_hash_speed_template);
ba2c149d0812cee Tianjia Zhang          2022-01-07  2384  		if (mode > 400 && mode < 500) break;
df561f6688fef77 Gustavo A. R. Silva    2020-08-23  2385  		fallthrough;
beb63da739f7975 David S. Miller        2010-05-19  2386  	case 499:
beb63da739f7975 David S. Miller        2010-05-19  2387  		break;
beb63da739f7975 David S. Miller        2010-05-19  2388  
3f3baf359dd3cc5 Jussi Kivilinna        2011-10-18  2389  	case 500:
3f3baf359dd3cc5 Jussi Kivilinna        2011-10-18  2390  		test_acipher_speed("ecb(aes)", ENCRYPT, sec, NULL, 0,
3f3baf359dd3cc5 Jussi Kivilinna        2011-10-18  2391  				   speed_template_16_24_32);
3f3baf359dd3cc5 Jussi Kivilinna        2011-10-18  2392  		test_acipher_speed("ecb(aes)", DECRYPT, sec, NULL, 0,
3f3baf359dd3cc5 Jussi Kivilinna        2011-10-18  2393  				   speed_template_16_24_32);
3f3baf359dd3cc5 Jussi Kivilinna        2011-10-18  2394  		test_acipher_speed("cbc(aes)", ENCRYPT, sec, NULL, 0,
3f3baf359dd3cc5 Jussi Kivilinna        2011-10-18  2395  				   speed_template_16_24_32);
3f3baf359dd3cc5 Jussi Kivilinna        2011-10-18  2396  		test_acipher_speed("cbc(aes)", DECRYPT, sec, NULL, 0,
3f3baf359dd3cc5 Jussi Kivilinna        2011-10-18  2397  				   speed_template_16_24_32);
3f3baf359dd3cc5 Jussi Kivilinna        2011-10-18  2398  		test_acipher_speed("lrw(aes)", ENCRYPT, sec, NULL, 0,
3f3baf359dd3cc5 Jussi Kivilinna        2011-10-18  2399  				   speed_template_32_40_48);
3f3baf359dd3cc5 Jussi Kivilinna        2011-10-18  2400  		test_acipher_speed("lrw(aes)", DECRYPT, sec, NULL, 0,
3f3baf359dd3cc5 Jussi Kivilinna        2011-10-18  2401  				   speed_template_32_40_48);
3f3baf359dd3cc5 Jussi Kivilinna        2011-10-18  2402  		test_acipher_speed("xts(aes)", ENCRYPT, sec, NULL, 0,
b66ad0b7aa92e62 Horia Geantă           2017-07-19  2403  				   speed_template_32_64);
3f3baf359dd3cc5 Jussi Kivilinna        2011-10-18  2404  		test_acipher_speed("xts(aes)", DECRYPT, sec, NULL, 0,
b66ad0b7aa92e62 Horia Geantă           2017-07-19  2405  				   speed_template_32_64);
1503a24f53f153f Herbert Xu             2016-06-29  2406  		test_acipher_speed("cts(cbc(aes))", ENCRYPT, sec, NULL, 0,
1503a24f53f153f Herbert Xu             2016-06-29  2407  				   speed_template_16_24_32);
1503a24f53f153f Herbert Xu             2016-06-29  2408  		test_acipher_speed("cts(cbc(aes))", DECRYPT, sec, NULL, 0,
1503a24f53f153f Herbert Xu             2016-06-29  2409  				   speed_template_16_24_32);
3f3baf359dd3cc5 Jussi Kivilinna        2011-10-18  2410  		test_acipher_speed("ctr(aes)", ENCRYPT, sec, NULL, 0,
3f3baf359dd3cc5 Jussi Kivilinna        2011-10-18  2411  				   speed_template_16_24_32);
3f3baf359dd3cc5 Jussi Kivilinna        2011-10-18  2412  		test_acipher_speed("ctr(aes)", DECRYPT, sec, NULL, 0,
3f3baf359dd3cc5 Jussi Kivilinna        2011-10-18  2413  				   speed_template_16_24_32);
69d3150cfc2075d Jussi Kivilinna        2012-12-28  2414  		test_acipher_speed("rfc3686(ctr(aes))", ENCRYPT, sec, NULL, 0,
69d3150cfc2075d Jussi Kivilinna        2012-12-28  2415  				   speed_template_20_28_36);
69d3150cfc2075d Jussi Kivilinna        2012-12-28  2416  		test_acipher_speed("rfc3686(ctr(aes))", DECRYPT, sec, NULL, 0,
69d3150cfc2075d Jussi Kivilinna        2012-12-28  2417  				   speed_template_20_28_36);
3f3baf359dd3cc5 Jussi Kivilinna        2011-10-18  2418  		break;
3f3baf359dd3cc5 Jussi Kivilinna        2011-10-18  2419  
3f3baf359dd3cc5 Jussi Kivilinna        2011-10-18  2420  	case 501:
3f3baf359dd3cc5 Jussi Kivilinna        2011-10-18  2421  		test_acipher_speed("ecb(des3_ede)", ENCRYPT, sec,
3f3baf359dd3cc5 Jussi Kivilinna        2011-10-18  2422  				   des3_speed_template, DES3_SPEED_VECTORS,
3f3baf359dd3cc5 Jussi Kivilinna        2011-10-18  2423  				   speed_template_24);
3f3baf359dd3cc5 Jussi Kivilinna        2011-10-18  2424  		test_acipher_speed("ecb(des3_ede)", DECRYPT, sec,
3f3baf359dd3cc5 Jussi Kivilinna        2011-10-18  2425  				   des3_speed_template, DES3_SPEED_VECTORS,
3f3baf359dd3cc5 Jussi Kivilinna        2011-10-18  2426  				   speed_template_24);
3f3baf359dd3cc5 Jussi Kivilinna        2011-10-18  2427  		test_acipher_speed("cbc(des3_ede)", ENCRYPT, sec,
3f3baf359dd3cc5 Jussi Kivilinna        2011-10-18  2428  				   des3_speed_template, DES3_SPEED_VECTORS,
3f3baf359dd3cc5 Jussi Kivilinna        2011-10-18  2429  				   speed_template_24);
3f3baf359dd3cc5 Jussi Kivilinna        2011-10-18  2430  		test_acipher_speed("cbc(des3_ede)", DECRYPT, sec,
3f3baf359dd3cc5 Jussi Kivilinna        2011-10-18  2431  				   des3_speed_template, DES3_SPEED_VECTORS,
3f3baf359dd3cc5 Jussi Kivilinna        2011-10-18  2432  				   speed_template_24);
3f3baf359dd3cc5 Jussi Kivilinna        2011-10-18  2433  		break;
3f3baf359dd3cc5 Jussi Kivilinna        2011-10-18  2434  
3f3baf359dd3cc5 Jussi Kivilinna        2011-10-18  2435  	case 502:
3f3baf359dd3cc5 Jussi Kivilinna        2011-10-18  2436  		test_acipher_speed("ecb(des)", ENCRYPT, sec, NULL, 0,
3f3baf359dd3cc5 Jussi Kivilinna        2011-10-18  2437  				   speed_template_8);
3f3baf359dd3cc5 Jussi Kivilinna        2011-10-18  2438  		test_acipher_speed("ecb(des)", DECRYPT, sec, NULL, 0,
3f3baf359dd3cc5 Jussi Kivilinna        2011-10-18  2439  				   speed_template_8);
3f3baf359dd3cc5 Jussi Kivilinna        2011-10-18  2440  		test_acipher_speed("cbc(des)", ENCRYPT, sec, NULL, 0,
3f3baf359dd3cc5 Jussi Kivilinna        2011-10-18  2441  				   speed_template_8);
3f3baf359dd3cc5 Jussi Kivilinna        2011-10-18  2442  		test_acipher_speed("cbc(des)", DECRYPT, sec, NULL, 0,
3f3baf359dd3cc5 Jussi Kivilinna        2011-10-18  2443  				   speed_template_8);
3f3baf359dd3cc5 Jussi Kivilinna        2011-10-18  2444  		break;
3f3baf359dd3cc5 Jussi Kivilinna        2011-10-18  2445  
7fb7fe4469d0b87 Jussi Kivilinna        2011-10-18  2446  	case 503:
7fb7fe4469d0b87 Jussi Kivilinna        2011-10-18  2447  		test_acipher_speed("ecb(serpent)", ENCRYPT, sec, NULL, 0,
7fb7fe4469d0b87 Jussi Kivilinna        2011-10-18  2448  				   speed_template_16_32);
7fb7fe4469d0b87 Jussi Kivilinna        2011-10-18  2449  		test_acipher_speed("ecb(serpent)", DECRYPT, sec, NULL, 0,
7fb7fe4469d0b87 Jussi Kivilinna        2011-10-18  2450  				   speed_template_16_32);
7fb7fe4469d0b87 Jussi Kivilinna        2011-10-18  2451  		test_acipher_speed("cbc(serpent)", ENCRYPT, sec, NULL, 0,
7fb7fe4469d0b87 Jussi Kivilinna        2011-10-18  2452  				   speed_template_16_32);
7fb7fe4469d0b87 Jussi Kivilinna        2011-10-18  2453  		test_acipher_speed("cbc(serpent)", DECRYPT, sec, NULL, 0,
7fb7fe4469d0b87 Jussi Kivilinna        2011-10-18  2454  				   speed_template_16_32);
7fb7fe4469d0b87 Jussi Kivilinna        2011-10-18  2455  		test_acipher_speed("ctr(serpent)", ENCRYPT, sec, NULL, 0,
7fb7fe4469d0b87 Jussi Kivilinna        2011-10-18  2456  				   speed_template_16_32);
7fb7fe4469d0b87 Jussi Kivilinna        2011-10-18  2457  		test_acipher_speed("ctr(serpent)", DECRYPT, sec, NULL, 0,
7fb7fe4469d0b87 Jussi Kivilinna        2011-10-18  2458  				   speed_template_16_32);
87aae4bfb2912d1 Jussi Kivilinna        2011-10-18  2459  		test_acipher_speed("lrw(serpent)", ENCRYPT, sec, NULL, 0,
87aae4bfb2912d1 Jussi Kivilinna        2011-10-18  2460  				   speed_template_32_48);
87aae4bfb2912d1 Jussi Kivilinna        2011-10-18  2461  		test_acipher_speed("lrw(serpent)", DECRYPT, sec, NULL, 0,
87aae4bfb2912d1 Jussi Kivilinna        2011-10-18  2462  				   speed_template_32_48);
5209c07ac3601cf Jussi Kivilinna        2011-10-18  2463  		test_acipher_speed("xts(serpent)", ENCRYPT, sec, NULL, 0,
5209c07ac3601cf Jussi Kivilinna        2011-10-18  2464  				   speed_template_32_64);
5209c07ac3601cf Jussi Kivilinna        2011-10-18  2465  		test_acipher_speed("xts(serpent)", DECRYPT, sec, NULL, 0,
5209c07ac3601cf Jussi Kivilinna        2011-10-18  2466  				   speed_template_32_64);
7fb7fe4469d0b87 Jussi Kivilinna        2011-10-18  2467  		break;
7fb7fe4469d0b87 Jussi Kivilinna        2011-10-18  2468  
107778b592576c0 Johannes Goetzfried    2012-05-28  2469  	case 504:
107778b592576c0 Johannes Goetzfried    2012-05-28  2470  		test_acipher_speed("ecb(twofish)", ENCRYPT, sec, NULL, 0,
107778b592576c0 Johannes Goetzfried    2012-05-28  2471  				   speed_template_16_24_32);
107778b592576c0 Johannes Goetzfried    2012-05-28  2472  		test_acipher_speed("ecb(twofish)", DECRYPT, sec, NULL, 0,
107778b592576c0 Johannes Goetzfried    2012-05-28  2473  				   speed_template_16_24_32);
107778b592576c0 Johannes Goetzfried    2012-05-28  2474  		test_acipher_speed("cbc(twofish)", ENCRYPT, sec, NULL, 0,
107778b592576c0 Johannes Goetzfried    2012-05-28  2475  				   speed_template_16_24_32);
107778b592576c0 Johannes Goetzfried    2012-05-28  2476  		test_acipher_speed("cbc(twofish)", DECRYPT, sec, NULL, 0,
107778b592576c0 Johannes Goetzfried    2012-05-28  2477  				   speed_template_16_24_32);
107778b592576c0 Johannes Goetzfried    2012-05-28  2478  		test_acipher_speed("ctr(twofish)", ENCRYPT, sec, NULL, 0,
107778b592576c0 Johannes Goetzfried    2012-05-28  2479  				   speed_template_16_24_32);
107778b592576c0 Johannes Goetzfried    2012-05-28  2480  		test_acipher_speed("ctr(twofish)", DECRYPT, sec, NULL, 0,
107778b592576c0 Johannes Goetzfried    2012-05-28  2481  				   speed_template_16_24_32);
107778b592576c0 Johannes Goetzfried    2012-05-28  2482  		test_acipher_speed("lrw(twofish)", ENCRYPT, sec, NULL, 0,
107778b592576c0 Johannes Goetzfried    2012-05-28  2483  				   speed_template_32_40_48);
107778b592576c0 Johannes Goetzfried    2012-05-28  2484  		test_acipher_speed("lrw(twofish)", DECRYPT, sec, NULL, 0,
107778b592576c0 Johannes Goetzfried    2012-05-28  2485  				   speed_template_32_40_48);
107778b592576c0 Johannes Goetzfried    2012-05-28  2486  		test_acipher_speed("xts(twofish)", ENCRYPT, sec, NULL, 0,
107778b592576c0 Johannes Goetzfried    2012-05-28  2487  				   speed_template_32_48_64);
107778b592576c0 Johannes Goetzfried    2012-05-28  2488  		test_acipher_speed("xts(twofish)", DECRYPT, sec, NULL, 0,
107778b592576c0 Johannes Goetzfried    2012-05-28  2489  				   speed_template_32_48_64);
107778b592576c0 Johannes Goetzfried    2012-05-28  2490  		break;
107778b592576c0 Johannes Goetzfried    2012-05-28  2491  
31b4cd2907322bd Jussi Kivilinna        2012-06-12  2492  	case 505:
31b4cd2907322bd Jussi Kivilinna        2012-06-12  2493  		test_acipher_speed("ecb(arc4)", ENCRYPT, sec, NULL, 0,
31b4cd2907322bd Jussi Kivilinna        2012-06-12  2494  				   speed_template_8);
31b4cd2907322bd Jussi Kivilinna        2012-06-12  2495  		break;
31b4cd2907322bd Jussi Kivilinna        2012-06-12  2496  
a2c582609556298 Johannes Goetzfried    2012-07-11  2497  	case 506:
a2c582609556298 Johannes Goetzfried    2012-07-11  2498  		test_acipher_speed("ecb(cast5)", ENCRYPT, sec, NULL, 0,
a2c582609556298 Johannes Goetzfried    2012-07-11  2499  				   speed_template_8_16);
a2c582609556298 Johannes Goetzfried    2012-07-11  2500  		test_acipher_speed("ecb(cast5)", DECRYPT, sec, NULL, 0,
a2c582609556298 Johannes Goetzfried    2012-07-11  2501  				   speed_template_8_16);
a2c582609556298 Johannes Goetzfried    2012-07-11  2502  		test_acipher_speed("cbc(cast5)", ENCRYPT, sec, NULL, 0,
a2c582609556298 Johannes Goetzfried    2012-07-11  2503  				   speed_template_8_16);
a2c582609556298 Johannes Goetzfried    2012-07-11  2504  		test_acipher_speed("cbc(cast5)", DECRYPT, sec, NULL, 0,
a2c582609556298 Johannes Goetzfried    2012-07-11  2505  				   speed_template_8_16);
a2c582609556298 Johannes Goetzfried    2012-07-11  2506  		test_acipher_speed("ctr(cast5)", ENCRYPT, sec, NULL, 0,
a2c582609556298 Johannes Goetzfried    2012-07-11  2507  				   speed_template_8_16);
a2c582609556298 Johannes Goetzfried    2012-07-11  2508  		test_acipher_speed("ctr(cast5)", DECRYPT, sec, NULL, 0,
a2c582609556298 Johannes Goetzfried    2012-07-11  2509  				   speed_template_8_16);
a2c582609556298 Johannes Goetzfried    2012-07-11  2510  		break;
a2c582609556298 Johannes Goetzfried    2012-07-11  2511  
9b8b04051d0df1e Johannes Goetzfried    2012-07-11  2512  	case 507:
9b8b04051d0df1e Johannes Goetzfried    2012-07-11  2513  		test_acipher_speed("ecb(cast6)", ENCRYPT, sec, NULL, 0,
9b8b04051d0df1e Johannes Goetzfried    2012-07-11  2514  				   speed_template_16_32);
9b8b04051d0df1e Johannes Goetzfried    2012-07-11  2515  		test_acipher_speed("ecb(cast6)", DECRYPT, sec, NULL, 0,
9b8b04051d0df1e Johannes Goetzfried    2012-07-11  2516  				   speed_template_16_32);
9b8b04051d0df1e Johannes Goetzfried    2012-07-11  2517  		test_acipher_speed("cbc(cast6)", ENCRYPT, sec, NULL, 0,
9b8b04051d0df1e Johannes Goetzfried    2012-07-11  2518  				   speed_template_16_32);
9b8b04051d0df1e Johannes Goetzfried    2012-07-11  2519  		test_acipher_speed("cbc(cast6)", DECRYPT, sec, NULL, 0,
9b8b04051d0df1e Johannes Goetzfried    2012-07-11  2520  				   speed_template_16_32);
9b8b04051d0df1e Johannes Goetzfried    2012-07-11  2521  		test_acipher_speed("ctr(cast6)", ENCRYPT, sec, NULL, 0,
9b8b04051d0df1e Johannes Goetzfried    2012-07-11  2522  				   speed_template_16_32);
9b8b04051d0df1e Johannes Goetzfried    2012-07-11  2523  		test_acipher_speed("ctr(cast6)", DECRYPT, sec, NULL, 0,
9b8b04051d0df1e Johannes Goetzfried    2012-07-11  2524  				   speed_template_16_32);
9b8b04051d0df1e Johannes Goetzfried    2012-07-11  2525  		test_acipher_speed("lrw(cast6)", ENCRYPT, sec, NULL, 0,
9b8b04051d0df1e Johannes Goetzfried    2012-07-11  2526  				   speed_template_32_48);
9b8b04051d0df1e Johannes Goetzfried    2012-07-11  2527  		test_acipher_speed("lrw(cast6)", DECRYPT, sec, NULL, 0,
9b8b04051d0df1e Johannes Goetzfried    2012-07-11  2528  				   speed_template_32_48);
9b8b04051d0df1e Johannes Goetzfried    2012-07-11  2529  		test_acipher_speed("xts(cast6)", ENCRYPT, sec, NULL, 0,
9b8b04051d0df1e Johannes Goetzfried    2012-07-11  2530  				   speed_template_32_64);
9b8b04051d0df1e Johannes Goetzfried    2012-07-11  2531  		test_acipher_speed("xts(cast6)", DECRYPT, sec, NULL, 0,
9b8b04051d0df1e Johannes Goetzfried    2012-07-11  2532  				   speed_template_32_64);
9b8b04051d0df1e Johannes Goetzfried    2012-07-11  2533  		break;
9b8b04051d0df1e Johannes Goetzfried    2012-07-11  2534  
bf9c5181865f1cc Jussi Kivilinna        2012-10-26  2535  	case 508:
bf9c5181865f1cc Jussi Kivilinna        2012-10-26  2536  		test_acipher_speed("ecb(camellia)", ENCRYPT, sec, NULL, 0,
bf9c5181865f1cc Jussi Kivilinna        2012-10-26  2537  				   speed_template_16_32);
bf9c5181865f1cc Jussi Kivilinna        2012-10-26  2538  		test_acipher_speed("ecb(camellia)", DECRYPT, sec, NULL, 0,
bf9c5181865f1cc Jussi Kivilinna        2012-10-26  2539  				   speed_template_16_32);
bf9c5181865f1cc Jussi Kivilinna        2012-10-26  2540  		test_acipher_speed("cbc(camellia)", ENCRYPT, sec, NULL, 0,
bf9c5181865f1cc Jussi Kivilinna        2012-10-26  2541  				   speed_template_16_32);
bf9c5181865f1cc Jussi Kivilinna        2012-10-26  2542  		test_acipher_speed("cbc(camellia)", DECRYPT, sec, NULL, 0,
bf9c5181865f1cc Jussi Kivilinna        2012-10-26  2543  				   speed_template_16_32);
bf9c5181865f1cc Jussi Kivilinna        2012-10-26  2544  		test_acipher_speed("ctr(camellia)", ENCRYPT, sec, NULL, 0,
bf9c5181865f1cc Jussi Kivilinna        2012-10-26  2545  				   speed_template_16_32);
bf9c5181865f1cc Jussi Kivilinna        2012-10-26  2546  		test_acipher_speed("ctr(camellia)", DECRYPT, sec, NULL, 0,
bf9c5181865f1cc Jussi Kivilinna        2012-10-26  2547  				   speed_template_16_32);
bf9c5181865f1cc Jussi Kivilinna        2012-10-26  2548  		test_acipher_speed("lrw(camellia)", ENCRYPT, sec, NULL, 0,
bf9c5181865f1cc Jussi Kivilinna        2012-10-26  2549  				   speed_template_32_48);
bf9c5181865f1cc Jussi Kivilinna        2012-10-26  2550  		test_acipher_speed("lrw(camellia)", DECRYPT, sec, NULL, 0,
bf9c5181865f1cc Jussi Kivilinna        2012-10-26  2551  				   speed_template_32_48);
bf9c5181865f1cc Jussi Kivilinna        2012-10-26  2552  		test_acipher_speed("xts(camellia)", ENCRYPT, sec, NULL, 0,
bf9c5181865f1cc Jussi Kivilinna        2012-10-26  2553  				   speed_template_32_64);
bf9c5181865f1cc Jussi Kivilinna        2012-10-26  2554  		test_acipher_speed("xts(camellia)", DECRYPT, sec, NULL, 0,
bf9c5181865f1cc Jussi Kivilinna        2012-10-26  2555  				   speed_template_32_64);
bf9c5181865f1cc Jussi Kivilinna        2012-10-26  2556  		break;
bf9c5181865f1cc Jussi Kivilinna        2012-10-26  2557  
ad8b7c3e92868dd Jussi Kivilinna        2013-04-13  2558  	case 509:
ad8b7c3e92868dd Jussi Kivilinna        2013-04-13  2559  		test_acipher_speed("ecb(blowfish)", ENCRYPT, sec, NULL, 0,
ad8b7c3e92868dd Jussi Kivilinna        2013-04-13  2560  				   speed_template_8_32);
ad8b7c3e92868dd Jussi Kivilinna        2013-04-13  2561  		test_acipher_speed("ecb(blowfish)", DECRYPT, sec, NULL, 0,
ad8b7c3e92868dd Jussi Kivilinna        2013-04-13  2562  				   speed_template_8_32);
ad8b7c3e92868dd Jussi Kivilinna        2013-04-13  2563  		test_acipher_speed("cbc(blowfish)", ENCRYPT, sec, NULL, 0,
ad8b7c3e92868dd Jussi Kivilinna        2013-04-13  2564  				   speed_template_8_32);
ad8b7c3e92868dd Jussi Kivilinna        2013-04-13  2565  		test_acipher_speed("cbc(blowfish)", DECRYPT, sec, NULL, 0,
ad8b7c3e92868dd Jussi Kivilinna        2013-04-13  2566  				   speed_template_8_32);
ad8b7c3e92868dd Jussi Kivilinna        2013-04-13  2567  		test_acipher_speed("ctr(blowfish)", ENCRYPT, sec, NULL, 0,
ad8b7c3e92868dd Jussi Kivilinna        2013-04-13  2568  				   speed_template_8_32);
ad8b7c3e92868dd Jussi Kivilinna        2013-04-13  2569  		test_acipher_speed("ctr(blowfish)", DECRYPT, sec, NULL, 0,
ad8b7c3e92868dd Jussi Kivilinna        2013-04-13  2570  				   speed_template_8_32);
ad8b7c3e92868dd Jussi Kivilinna        2013-04-13  2571  		break;
ad8b7c3e92868dd Jussi Kivilinna        2013-04-13  2572  
a7fc80bb22eb0f1 Tianjia Zhang          2021-07-20  2573  	case 518:
a7fc80bb22eb0f1 Tianjia Zhang          2021-07-20  2574  		test_acipher_speed("ecb(sm4)", ENCRYPT, sec, NULL, 0,
a7fc80bb22eb0f1 Tianjia Zhang          2021-07-20  2575  				speed_template_16);
a7fc80bb22eb0f1 Tianjia Zhang          2021-07-20  2576  		test_acipher_speed("ecb(sm4)", DECRYPT, sec, NULL, 0,
a7fc80bb22eb0f1 Tianjia Zhang          2021-07-20  2577  				speed_template_16);
a7fc80bb22eb0f1 Tianjia Zhang          2021-07-20  2578  		test_acipher_speed("cbc(sm4)", ENCRYPT, sec, NULL, 0,
a7fc80bb22eb0f1 Tianjia Zhang          2021-07-20  2579  				speed_template_16);
a7fc80bb22eb0f1 Tianjia Zhang          2021-07-20  2580  		test_acipher_speed("cbc(sm4)", DECRYPT, sec, NULL, 0,
a7fc80bb22eb0f1 Tianjia Zhang          2021-07-20  2581  				speed_template_16);
a7fc80bb22eb0f1 Tianjia Zhang          2021-07-20  2582  		test_acipher_speed("ctr(sm4)", ENCRYPT, sec, NULL, 0,
a7fc80bb22eb0f1 Tianjia Zhang          2021-07-20  2583  				speed_template_16);
a7fc80bb22eb0f1 Tianjia Zhang          2021-07-20  2584  		test_acipher_speed("ctr(sm4)", DECRYPT, sec, NULL, 0,
a7fc80bb22eb0f1 Tianjia Zhang          2021-07-20  2585  				speed_template_16);
3c3836378dd578a Tianjia Zhang          2022-10-27  2586  		test_acipher_speed("xts(sm4)", ENCRYPT, sec, NULL, 0,
3c3836378dd578a Tianjia Zhang          2022-10-27  2587  				speed_template_32);
3c3836378dd578a Tianjia Zhang          2022-10-27  2588  		test_acipher_speed("xts(sm4)", DECRYPT, sec, NULL, 0,
3c3836378dd578a Tianjia Zhang          2022-10-27  2589  				speed_template_32);
a7fc80bb22eb0f1 Tianjia Zhang          2021-07-20  2590  		break;
a7fc80bb22eb0f1 Tianjia Zhang          2021-07-20  2591  
c4b1ce72b5c9f7d Taehee Yoo             2022-09-16  2592  	case 519:
c4b1ce72b5c9f7d Taehee Yoo             2022-09-16  2593  		test_acipher_speed("ecb(aria)", ENCRYPT, sec, NULL, 0,
c4b1ce72b5c9f7d Taehee Yoo             2022-09-16  2594  				   speed_template_16_24_32);
c4b1ce72b5c9f7d Taehee Yoo             2022-09-16  2595  		test_acipher_speed("ecb(aria)", DECRYPT, sec, NULL, 0,
c4b1ce72b5c9f7d Taehee Yoo             2022-09-16  2596  				   speed_template_16_24_32);
c4b1ce72b5c9f7d Taehee Yoo             2022-09-16  2597  		test_acipher_speed("ctr(aria)", ENCRYPT, sec, NULL, 0,
c4b1ce72b5c9f7d Taehee Yoo             2022-09-16  2598  				   speed_template_16_24_32);
c4b1ce72b5c9f7d Taehee Yoo             2022-09-16  2599  		test_acipher_speed("ctr(aria)", DECRYPT, sec, NULL, 0,
c4b1ce72b5c9f7d Taehee Yoo             2022-09-16  2600  				   speed_template_16_24_32);
c4b1ce72b5c9f7d Taehee Yoo             2022-09-16  2601  		break;
c4b1ce72b5c9f7d Taehee Yoo             2022-09-16  2602  
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2603  	case 600:
7b3058eb3f3b04e Sergey Portnoy         2024-06-17  2604  		if (alg) {
7b3058eb3f3b04e Sergey Portnoy         2024-06-17  2605  			u8 speed_template[2] = {klen, 0};
7b3058eb3f3b04e Sergey Portnoy         2024-06-17  2606  			test_mb_skcipher_speed(alg, ENCRYPT, sec, NULL, 0,
7b3058eb3f3b04e Sergey Portnoy         2024-06-17  2607  					       speed_template, num_mb);
7b3058eb3f3b04e Sergey Portnoy         2024-06-17  2608  			test_mb_skcipher_speed(alg, DECRYPT, sec, NULL, 0,
7b3058eb3f3b04e Sergey Portnoy         2024-06-17  2609  					       speed_template, num_mb);
7b3058eb3f3b04e Sergey Portnoy         2024-06-17  2610  			break;
7b3058eb3f3b04e Sergey Portnoy         2024-06-17  2611  		}
7b3058eb3f3b04e Sergey Portnoy         2024-06-17  2612  
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2613  		test_mb_skcipher_speed("ecb(aes)", ENCRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2614  				       speed_template_16_24_32, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2615  		test_mb_skcipher_speed("ecb(aes)", DECRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2616  				       speed_template_16_24_32, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2617  		test_mb_skcipher_speed("cbc(aes)", ENCRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2618  				       speed_template_16_24_32, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2619  		test_mb_skcipher_speed("cbc(aes)", DECRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2620  				       speed_template_16_24_32, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2621  		test_mb_skcipher_speed("lrw(aes)", ENCRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2622  				       speed_template_32_40_48, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2623  		test_mb_skcipher_speed("lrw(aes)", DECRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2624  				       speed_template_32_40_48, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2625  		test_mb_skcipher_speed("xts(aes)", ENCRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2626  				       speed_template_32_64, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2627  		test_mb_skcipher_speed("xts(aes)", DECRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2628  				       speed_template_32_64, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2629  		test_mb_skcipher_speed("cts(cbc(aes))", ENCRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2630  				       speed_template_16_24_32, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2631  		test_mb_skcipher_speed("cts(cbc(aes))", DECRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2632  				       speed_template_16_24_32, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2633  		test_mb_skcipher_speed("ctr(aes)", ENCRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2634  				       speed_template_16_24_32, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2635  		test_mb_skcipher_speed("ctr(aes)", DECRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2636  				       speed_template_16_24_32, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2637  		test_mb_skcipher_speed("rfc3686(ctr(aes))", ENCRYPT, sec, NULL,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2638  				       0, speed_template_20_28_36, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2639  		test_mb_skcipher_speed("rfc3686(ctr(aes))", DECRYPT, sec, NULL,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2640  				       0, speed_template_20_28_36, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2641  		break;
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2642  
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2643  	case 601:
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2644  		test_mb_skcipher_speed("ecb(des3_ede)", ENCRYPT, sec,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2645  				       des3_speed_template, DES3_SPEED_VECTORS,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2646  				       speed_template_24, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2647  		test_mb_skcipher_speed("ecb(des3_ede)", DECRYPT, sec,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2648  				       des3_speed_template, DES3_SPEED_VECTORS,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2649  				       speed_template_24, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2650  		test_mb_skcipher_speed("cbc(des3_ede)", ENCRYPT, sec,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2651  				       des3_speed_template, DES3_SPEED_VECTORS,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2652  				       speed_template_24, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2653  		test_mb_skcipher_speed("cbc(des3_ede)", DECRYPT, sec,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2654  				       des3_speed_template, DES3_SPEED_VECTORS,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2655  				       speed_template_24, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2656  		break;
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2657  
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2658  	case 602:
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2659  		test_mb_skcipher_speed("ecb(des)", ENCRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2660  				       speed_template_8, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2661  		test_mb_skcipher_speed("ecb(des)", DECRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2662  				       speed_template_8, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2663  		test_mb_skcipher_speed("cbc(des)", ENCRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2664  				       speed_template_8, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2665  		test_mb_skcipher_speed("cbc(des)", DECRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2666  				       speed_template_8, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2667  		break;
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2668  
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2669  	case 603:
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2670  		test_mb_skcipher_speed("ecb(serpent)", ENCRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2671  				       speed_template_16_32, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2672  		test_mb_skcipher_speed("ecb(serpent)", DECRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2673  				       speed_template_16_32, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2674  		test_mb_skcipher_speed("cbc(serpent)", ENCRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2675  				       speed_template_16_32, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2676  		test_mb_skcipher_speed("cbc(serpent)", DECRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2677  				       speed_template_16_32, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2678  		test_mb_skcipher_speed("ctr(serpent)", ENCRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2679  				       speed_template_16_32, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2680  		test_mb_skcipher_speed("ctr(serpent)", DECRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2681  				       speed_template_16_32, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2682  		test_mb_skcipher_speed("lrw(serpent)", ENCRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2683  				       speed_template_32_48, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2684  		test_mb_skcipher_speed("lrw(serpent)", DECRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2685  				       speed_template_32_48, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2686  		test_mb_skcipher_speed("xts(serpent)", ENCRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2687  				       speed_template_32_64, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2688  		test_mb_skcipher_speed("xts(serpent)", DECRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2689  				       speed_template_32_64, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2690  		break;
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2691  
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2692  	case 604:
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2693  		test_mb_skcipher_speed("ecb(twofish)", ENCRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2694  				       speed_template_16_24_32, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2695  		test_mb_skcipher_speed("ecb(twofish)", DECRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2696  				       speed_template_16_24_32, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2697  		test_mb_skcipher_speed("cbc(twofish)", ENCRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2698  				       speed_template_16_24_32, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2699  		test_mb_skcipher_speed("cbc(twofish)", DECRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2700  				       speed_template_16_24_32, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2701  		test_mb_skcipher_speed("ctr(twofish)", ENCRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2702  				       speed_template_16_24_32, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2703  		test_mb_skcipher_speed("ctr(twofish)", DECRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2704  				       speed_template_16_24_32, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2705  		test_mb_skcipher_speed("lrw(twofish)", ENCRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2706  				       speed_template_32_40_48, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2707  		test_mb_skcipher_speed("lrw(twofish)", DECRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2708  				       speed_template_32_40_48, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2709  		test_mb_skcipher_speed("xts(twofish)", ENCRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2710  				       speed_template_32_48_64, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2711  		test_mb_skcipher_speed("xts(twofish)", DECRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2712  				       speed_template_32_48_64, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2713  		break;
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2714  
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2715  	case 605:
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2716  		test_mb_skcipher_speed("ecb(arc4)", ENCRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2717  				       speed_template_8, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2718  		break;
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2719  
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2720  	case 606:
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2721  		test_mb_skcipher_speed("ecb(cast5)", ENCRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2722  				       speed_template_8_16, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2723  		test_mb_skcipher_speed("ecb(cast5)", DECRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2724  				       speed_template_8_16, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2725  		test_mb_skcipher_speed("cbc(cast5)", ENCRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2726  				       speed_template_8_16, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2727  		test_mb_skcipher_speed("cbc(cast5)", DECRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2728  				       speed_template_8_16, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2729  		test_mb_skcipher_speed("ctr(cast5)", ENCRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2730  				       speed_template_8_16, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2731  		test_mb_skcipher_speed("ctr(cast5)", DECRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2732  				       speed_template_8_16, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2733  		break;
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2734  
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2735  	case 607:
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2736  		test_mb_skcipher_speed("ecb(cast6)", ENCRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2737  				       speed_template_16_32, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2738  		test_mb_skcipher_speed("ecb(cast6)", DECRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2739  				       speed_template_16_32, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2740  		test_mb_skcipher_speed("cbc(cast6)", ENCRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2741  				       speed_template_16_32, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2742  		test_mb_skcipher_speed("cbc(cast6)", DECRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2743  				       speed_template_16_32, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2744  		test_mb_skcipher_speed("ctr(cast6)", ENCRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2745  				       speed_template_16_32, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2746  		test_mb_skcipher_speed("ctr(cast6)", DECRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2747  				       speed_template_16_32, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2748  		test_mb_skcipher_speed("lrw(cast6)", ENCRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2749  				       speed_template_32_48, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2750  		test_mb_skcipher_speed("lrw(cast6)", DECRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2751  				       speed_template_32_48, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2752  		test_mb_skcipher_speed("xts(cast6)", ENCRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2753  				       speed_template_32_64, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2754  		test_mb_skcipher_speed("xts(cast6)", DECRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2755  				       speed_template_32_64, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2756  		break;
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2757  
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2758  	case 608:
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2759  		test_mb_skcipher_speed("ecb(camellia)", ENCRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2760  				       speed_template_16_32, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2761  		test_mb_skcipher_speed("ecb(camellia)", DECRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2762  				       speed_template_16_32, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2763  		test_mb_skcipher_speed("cbc(camellia)", ENCRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2764  				       speed_template_16_32, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2765  		test_mb_skcipher_speed("cbc(camellia)", DECRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2766  				       speed_template_16_32, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2767  		test_mb_skcipher_speed("ctr(camellia)", ENCRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2768  				       speed_template_16_32, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2769  		test_mb_skcipher_speed("ctr(camellia)", DECRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2770  				       speed_template_16_32, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2771  		test_mb_skcipher_speed("lrw(camellia)", ENCRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2772  				       speed_template_32_48, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2773  		test_mb_skcipher_speed("lrw(camellia)", DECRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2774  				       speed_template_32_48, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2775  		test_mb_skcipher_speed("xts(camellia)", ENCRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2776  				       speed_template_32_64, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2777  		test_mb_skcipher_speed("xts(camellia)", DECRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2778  				       speed_template_32_64, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2779  		break;
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2780  
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2781  	case 609:
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2782  		test_mb_skcipher_speed("ecb(blowfish)", ENCRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2783  				       speed_template_8_32, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2784  		test_mb_skcipher_speed("ecb(blowfish)", DECRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2785  				       speed_template_8_32, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2786  		test_mb_skcipher_speed("cbc(blowfish)", ENCRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2787  				       speed_template_8_32, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2788  		test_mb_skcipher_speed("cbc(blowfish)", DECRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2789  				       speed_template_8_32, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2790  		test_mb_skcipher_speed("ctr(blowfish)", ENCRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2791  				       speed_template_8_32, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2792  		test_mb_skcipher_speed("ctr(blowfish)", DECRYPT, sec, NULL, 0,
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2793  				       speed_template_8_32, num_mb);
e161c5930c150ab Gilad Ben-Yossef       2017-12-17  2794  		break;
c4b1ce72b5c9f7d Taehee Yoo             2022-09-16  2795  
c4b1ce72b5c9f7d Taehee Yoo             2022-09-16  2796  	case 610:
c4b1ce72b5c9f7d Taehee Yoo             2022-09-16  2797  		test_mb_skcipher_speed("ecb(aria)", ENCRYPT, sec, NULL, 0,
c4b1ce72b5c9f7d Taehee Yoo             2022-09-16  2798  				       speed_template_16_32, num_mb);
c4b1ce72b5c9f7d Taehee Yoo             2022-09-16  2799  		test_mb_skcipher_speed("ecb(aria)", DECRYPT, sec, NULL, 0,
c4b1ce72b5c9f7d Taehee Yoo             2022-09-16  2800  				       speed_template_16_32, num_mb);
c4b1ce72b5c9f7d Taehee Yoo             2022-09-16  2801  		test_mb_skcipher_speed("ctr(aria)", ENCRYPT, sec, NULL, 0,
c4b1ce72b5c9f7d Taehee Yoo             2022-09-16  2802  				       speed_template_16_32, num_mb);
c4b1ce72b5c9f7d Taehee Yoo             2022-09-16  2803  		test_mb_skcipher_speed("ctr(aria)", DECRYPT, sec, NULL, 0,
c4b1ce72b5c9f7d Taehee Yoo             2022-09-16  2804  				       speed_template_16_32, num_mb);
c4b1ce72b5c9f7d Taehee Yoo             2022-09-16  2805  		break;
c4b1ce72b5c9f7d Taehee Yoo             2022-09-16  2806  
^1da177e4c3f415 Linus Torvalds         2005-04-16  2807  	}
4e033a6bc70f094 Jarod Wilson           2009-05-27  2808  
4e033a6bc70f094 Jarod Wilson           2009-05-27  2809  	return ret;
^1da177e4c3f415 Linus Torvalds         2005-04-16  2810  }
^1da177e4c3f415 Linus Torvalds         2005-04-16  2811  

:::::: The code at line 2298 was first introduced by commit
:::::: 25a0b9d4e512ea04d80c84bd5e3b9e2722b92ec1 crypto: streebog - add Streebog test vectors

:::::: TO: Vitaly Chikunov <vt@altlinux.org>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
