Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B3615E90
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Jun 2025 09:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751101545; cv=none; b=LHZbcm0Mwqk70hUT+YV2dCnCg1QgDgMlf0jj9xJdgWidMrNkGHE+ZWMoRh5iNJTv2UHk49NMBA/NJHmuE+WPBqaiHB9WWbSZ+Bqok4mv9j6W+4a3o6kAi/VgmFDWaRlm2kCe1RRazsZly1otj9vvAKTq+uZCJh7z6kEQ2vGPiMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751101545; c=relaxed/simple;
	bh=gcqYHPBczMq0VI8p3yeNGkMPqvw7OKplXxlj38BBKw4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gblIgx3IeO7hvzIKm3PkQo1PU7Rgh4pZ+CFeAw8sppB8Cd+ZcL1fOWn8dvzS+c1w3g99cUQH0tUE1a7Ij5xidf3EACRe2JOtc3jx5cX2qcEdL1B5y+9jzQJfxN8BxNddj7FEcuNo55xyNf/4bK/Mte1H3eeJbWF2uuBZOUS7x8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H+4sb6Gh; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H+4sb6Gh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751101543; x=1782637543;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=gcqYHPBczMq0VI8p3yeNGkMPqvw7OKplXxlj38BBKw4=;
  b=H+4sb6Gh9Xxqnw9+j3IpQJXI581ZyjamaZ7FHRaP70vuFAcmQKMkdz2j
   qgjufgHiLVYqvO5/5f+NMlyDIm5FiKSr1+6T4bkoQoJ33IpQdC0iW4AEp
   0Er1ZRO8jCmKULhLuo2gNa/bF/hY89Ws/WhQoTQfGXVaQLwLObk5SLD0T
   Ab3WIE2kuuHL/HpCvwfBmQ6OnQjkBNZWAMFnRtO8kDJk4wMiMt1ZHl0LF
   EsO14iaKon9bXXRP26RUJuoA/k57bbkN1pqds+JN4b/NU7lbHnhyIQEol
   FYsfB1EprvY8BsSKeF66lnjEZMmwgII56/vVIr5fZkKSneMltvbydTfrW
   w==;
X-CSE-ConnectionGUID: Pqd4okKuQJS+Htn8n5GBBw==
X-CSE-MsgGUID: 1/ntDp13Q/qVX20xidnsyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53271881"
X-IronPort-AV: E=Sophos;i="6.16,272,1744095600"; 
   d="scan'208";a="53271881"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 02:05:42 -0700
X-CSE-ConnectionGUID: rCn4tiUUQ2KfLDoPbyv46A==
X-CSE-MsgGUID: YFuWYTrSRYmoNrCTkyKlew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,272,1744095600"; 
   d="scan'208";a="158501715"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Jun 2025 02:05:41 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVRVC-000WwY-37;
	Sat, 28 Jun 2025 09:05:38 +0000
Date: Sat, 28 Jun 2025 17:04:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 2617/5998] drivers/net/dsa/b53/b53_common.c:1885
 b53_arl_op() error: uninitialized symbol 'fwd_entry'.
Message-ID: <202506281631.qxLRO5eu-lkp@intel.com>
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
TO: Florian Fainelli <f.fainelli@gmail.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: "Álvaro Fernández Rojas" <noltari@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2aeda9592360c200085898a258c4754bfe879921
commit: c45655386e532c85ff1d679fc2aa40b3aaff9916 [2617/5998] net: dsa: b53: add support for FDB operations on 5325/5365
:::::: branch date: 24 hours ago
:::::: commit date: 10 days ago
config: powerpc64-randconfig-r072-20250627 (https://download.01.org/0day-ci/archive/20250628/202506281631.qxLRO5eu-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e04c938cc08a90ae60440ce22d072ebc69d67ee8)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506281631.qxLRO5eu-lkp@intel.com/

smatch warnings:
drivers/net/dsa/b53/b53_common.c:1885 b53_arl_op() error: uninitialized symbol 'fwd_entry'.

vim +/fwd_entry +1885 drivers/net/dsa/b53/b53_common.c

c45655386e532c Florian Fainelli       2025-06-14  1805  
1da6df85c6fbed Florian Fainelli       2016-06-09  1806  static int b53_arl_op(struct b53_device *dev, int op, int port,
1da6df85c6fbed Florian Fainelli       2016-06-09  1807  		      const unsigned char *addr, u16 vid, bool is_valid)
1da6df85c6fbed Florian Fainelli       2016-06-09  1808  {
1da6df85c6fbed Florian Fainelli       2016-06-09  1809  	struct b53_arl_entry ent;
1da6df85c6fbed Florian Fainelli       2016-06-09  1810  	u32 fwd_entry;
1da6df85c6fbed Florian Fainelli       2016-06-09  1811  	u64 mac, mac_vid = 0;
1da6df85c6fbed Florian Fainelli       2016-06-09  1812  	u8 idx = 0;
1da6df85c6fbed Florian Fainelli       2016-06-09  1813  	int ret;
1da6df85c6fbed Florian Fainelli       2016-06-09  1814  
1da6df85c6fbed Florian Fainelli       2016-06-09  1815  	/* Convert the array into a 64-bit MAC */
4b92ea81cca38e Florian Fainelli       2017-01-05  1816  	mac = ether_addr_to_u64(addr);
1da6df85c6fbed Florian Fainelli       2016-06-09  1817  
1da6df85c6fbed Florian Fainelli       2016-06-09  1818  	/* Perform a read for the given MAC and VID */
1da6df85c6fbed Florian Fainelli       2016-06-09  1819  	b53_write48(dev, B53_ARLIO_PAGE, B53_MAC_ADDR_IDX, mac);
0cbec9aef5a861 Álvaro Fernández Rojas 2025-06-14  1820  	if (!is5325m(dev))
1da6df85c6fbed Florian Fainelli       2016-06-09  1821  		b53_write16(dev, B53_ARLIO_PAGE, B53_VLAN_ID_IDX, vid);
1da6df85c6fbed Florian Fainelli       2016-06-09  1822  
1da6df85c6fbed Florian Fainelli       2016-06-09  1823  	/* Issue a read operation for this MAC */
1da6df85c6fbed Florian Fainelli       2016-06-09  1824  	ret = b53_arl_rw_op(dev, 1);
1da6df85c6fbed Florian Fainelli       2016-06-09  1825  	if (ret)
1da6df85c6fbed Florian Fainelli       2016-06-09  1826  		return ret;
1da6df85c6fbed Florian Fainelli       2016-06-09  1827  
c45655386e532c Florian Fainelli       2025-06-14  1828  	if (is5325(dev) || is5365(dev))
c45655386e532c Florian Fainelli       2025-06-14  1829  		ret = b53_arl_read_25(dev, mac, vid, &ent, &idx);
c45655386e532c Florian Fainelli       2025-06-14  1830  	else
ef2a0bd99b1549 Florian Fainelli       2020-04-30  1831  		ret = b53_arl_read(dev, mac, vid, &ent, &idx);
ef2a0bd99b1549 Florian Fainelli       2020-04-30  1832  
1da6df85c6fbed Florian Fainelli       2016-06-09  1833  	/* If this is a read, just finish now */
1da6df85c6fbed Florian Fainelli       2016-06-09  1834  	if (op)
1da6df85c6fbed Florian Fainelli       2016-06-09  1835  		return ret;
1da6df85c6fbed Florian Fainelli       2016-06-09  1836  
6344dbde6a27d1 Florian Fainelli       2020-04-20  1837  	switch (ret) {
774d977abfd024 Tom Rix                2020-08-21  1838  	case -ETIMEDOUT:
774d977abfd024 Tom Rix                2020-08-21  1839  		return ret;
6344dbde6a27d1 Florian Fainelli       2020-04-20  1840  	case -ENOSPC:
6344dbde6a27d1 Florian Fainelli       2020-04-20  1841  		dev_dbg(dev->dev, "{%pM,%.4d} no space left in ARL\n",
6344dbde6a27d1 Florian Fainelli       2020-04-20  1842  			addr, vid);
6344dbde6a27d1 Florian Fainelli       2020-04-20  1843  		return is_valid ? ret : 0;
6344dbde6a27d1 Florian Fainelli       2020-04-20  1844  	case -ENOENT:
1da6df85c6fbed Florian Fainelli       2016-06-09  1845  		/* We could not find a matching MAC, so reset to a new entry */
6344dbde6a27d1 Florian Fainelli       2020-04-20  1846  		dev_dbg(dev->dev, "{%pM,%.4d} not found, using idx: %d\n",
6344dbde6a27d1 Florian Fainelli       2020-04-20  1847  			addr, vid, idx);
1da6df85c6fbed Florian Fainelli       2016-06-09  1848  		fwd_entry = 0;
6344dbde6a27d1 Florian Fainelli       2020-04-20  1849  		break;
6344dbde6a27d1 Florian Fainelli       2020-04-20  1850  	default:
6344dbde6a27d1 Florian Fainelli       2020-04-20  1851  		dev_dbg(dev->dev, "{%pM,%.4d} found, using idx: %d\n",
6344dbde6a27d1 Florian Fainelli       2020-04-20  1852  			addr, vid, idx);
6344dbde6a27d1 Florian Fainelli       2020-04-20  1853  		break;
1da6df85c6fbed Florian Fainelli       2016-06-09  1854  	}
1da6df85c6fbed Florian Fainelli       2016-06-09  1855  
5d65b64a3d9701 Florian Fainelli       2019-10-24  1856  	/* For multicast address, the port is a bitmask and the validity
5d65b64a3d9701 Florian Fainelli       2019-10-24  1857  	 * is determined by having at least one port being still active
5d65b64a3d9701 Florian Fainelli       2019-10-24  1858  	 */
5d65b64a3d9701 Florian Fainelli       2019-10-24  1859  	if (!is_multicast_ether_addr(addr)) {
1da6df85c6fbed Florian Fainelli       2016-06-09  1860  		ent.port = port;
1da6df85c6fbed Florian Fainelli       2016-06-09  1861  		ent.is_valid = is_valid;
5d65b64a3d9701 Florian Fainelli       2019-10-24  1862  	} else {
5d65b64a3d9701 Florian Fainelli       2019-10-24  1863  		if (is_valid)
5d65b64a3d9701 Florian Fainelli       2019-10-24  1864  			ent.port |= BIT(port);
5d65b64a3d9701 Florian Fainelli       2019-10-24  1865  		else
5d65b64a3d9701 Florian Fainelli       2019-10-24  1866  			ent.port &= ~BIT(port);
5d65b64a3d9701 Florian Fainelli       2019-10-24  1867  
5d65b64a3d9701 Florian Fainelli       2019-10-24  1868  		ent.is_valid = !!(ent.port);
5d65b64a3d9701 Florian Fainelli       2019-10-24  1869  	}
5d65b64a3d9701 Florian Fainelli       2019-10-24  1870  
1da6df85c6fbed Florian Fainelli       2016-06-09  1871  	ent.vid = vid;
1da6df85c6fbed Florian Fainelli       2016-06-09  1872  	ent.is_static = true;
5d65b64a3d9701 Florian Fainelli       2019-10-24  1873  	ent.is_age = false;
1da6df85c6fbed Florian Fainelli       2016-06-09  1874  	memcpy(ent.mac, addr, ETH_ALEN);
c45655386e532c Florian Fainelli       2025-06-14  1875  	if (is5325(dev) || is5365(dev))
c45655386e532c Florian Fainelli       2025-06-14  1876  		b53_arl_from_entry_25(&mac_vid, &ent);
c45655386e532c Florian Fainelli       2025-06-14  1877  	else
1da6df85c6fbed Florian Fainelli       2016-06-09  1878  		b53_arl_from_entry(&mac_vid, &fwd_entry, &ent);
1da6df85c6fbed Florian Fainelli       2016-06-09  1879  
1da6df85c6fbed Florian Fainelli       2016-06-09  1880  	b53_write64(dev, B53_ARLIO_PAGE,
1da6df85c6fbed Florian Fainelli       2016-06-09  1881  		    B53_ARLTBL_MAC_VID_ENTRY(idx), mac_vid);
c45655386e532c Florian Fainelli       2025-06-14  1882  
c45655386e532c Florian Fainelli       2025-06-14  1883  	if (!is5325(dev) && !is5365(dev))
1da6df85c6fbed Florian Fainelli       2016-06-09  1884  		b53_write32(dev, B53_ARLIO_PAGE,
1da6df85c6fbed Florian Fainelli       2016-06-09 @1885  			    B53_ARLTBL_DATA_ENTRY(idx), fwd_entry);
1da6df85c6fbed Florian Fainelli       2016-06-09  1886  
1da6df85c6fbed Florian Fainelli       2016-06-09  1887  	return b53_arl_rw_op(dev, 0);
1da6df85c6fbed Florian Fainelli       2016-06-09  1888  }
1da6df85c6fbed Florian Fainelli       2016-06-09  1889  

:::::: The code at line 1885 was first introduced by commit
:::::: 1da6df85c6fbed8f39c56eadcae7fa75a7a0c635 net: dsa: b53: Implement ARL add/del/dump operations

:::::: TO: Florian Fainelli <f.fainelli@gmail.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
