Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8331E2E92DA
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Sep 2025 08:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757751890; cv=none; b=ADV6N4leeOUSCwqcpqGQs7yhbBYQfQJ/XVPmONgTqpyqECP+7U1EbV6iLPMHl0DOAH6JXnZgvRWRto8A9JVJdm/6tk6cFk+E2F2RFKoQ6PEKKwITbVUj/ZVzfWRJZ38NTLY8k/hSbUtinkNb8opHMG+MeENemQPY5Xs6kAc/BYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757751890; c=relaxed/simple;
	bh=osNX+Bou78CDgQzeqP0bRkQl24ZIUej5V4gwv2gAuyc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G65OrYVFps7nWhb4IIZ4DbXUzAo2pP2gn+b8OMQ+XCkyn5+WC5dzLsbIVyObtCOjlEgkD6wbDwQ5ASRNxVhTINK/YPTwRNbGbYc/NNbIM/LcRpURnIpuBFqGTOdqtvCwvd4AqjMHAJXnTNvMlbFBqS4Ho/TtIHODHQ8MN4LTXz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NqBoANHB; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NqBoANHB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757751887; x=1789287887;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=osNX+Bou78CDgQzeqP0bRkQl24ZIUej5V4gwv2gAuyc=;
  b=NqBoANHBFNQ6LWYY0aNhBiYBdMPtuo22fP5wAI7fhJCayiwFbLPDBn9w
   QNxVRif5/sa2AT+GorkEBQOWFrFWh03XZxZfdEHqIfT1k/Qtf/3crCIz3
   61SS7lJN3EzxMyNoZPnilGZS0QWR0oD6wOpkREStzede7WmSIfOpayPBd
   Fi97Wdumekr9l6fSwb+e600v3aFzOQOGAUcBdBh9NKx+n95PiWy9cs5ze
   PFEZhiuKhTIetFlL+2BIU1phgs6676RlpgxwyiephdQ0GUKzpP8N0UNUg
   aVf731gsM70nGyYMl4TPHuJ1pFjhWdTMj7WXiF4NrDo0+sCyv0HGZp65h
   A==;
X-CSE-ConnectionGUID: 9sO2bm5WS/SP5jvvAyfKZA==
X-CSE-MsgGUID: 6tJDsk7yQgK2MGW5LWCCEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="59951438"
X-IronPort-AV: E=Sophos;i="6.18,261,1751266800"; 
   d="scan'208";a="59951438"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2025 01:24:46 -0700
X-CSE-ConnectionGUID: NkqhNWWtS+mhl82SL90g+A==
X-CSE-MsgGUID: 2VEq35jEQbWQ4LCgM3L4pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,261,1751266800"; 
   d="scan'208";a="173471773"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 13 Sep 2025 01:24:44 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uxLYn-0001Q0-18;
	Sat, 13 Sep 2025 08:24:41 +0000
Date: Sat, 13 Sep 2025 16:24:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 6038/8719]
 drivers/gpu/drm/radeon/evergreen_cs.c:2705 evergreen_packet3_check() warn:
 Function too hairy.  No more merges.
Message-ID: <202509131642.dWQKMTsp-lkp@intel.com>
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
TO: Alex Deucher <alexander.deucher@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   590b221ed4256fd6c34d3dea77aa5bd6e741bbc1
commit: b7c5334af69d359fcd7a39ed409a08138900ec18 [6038/8719] drm/radeon: use dev_warn_once() in CS parsers
:::::: branch date: 27 hours ago
:::::: commit date: 7 days ago
config: sparc64-randconfig-r072-20250913 (https://download.01.org/0day-ci/archive/20250913/202509131642.dWQKMTsp-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509131642.dWQKMTsp-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/radeon/evergreen_cs.c:2705 evergreen_packet3_check() warn: Function too hairy.  No more merges.

vim +2705 drivers/gpu/drm/radeon/evergreen_cs.c

dd220a00e8bd5a Marek Olšák       2012-01-27  1772  
cb5fcbd540b438 Alex Deucher      2010-05-28  1773  static int evergreen_packet3_check(struct radeon_cs_parser *p,
cb5fcbd540b438 Alex Deucher      2010-05-28  1774  				   struct radeon_cs_packet *pkt)
cb5fcbd540b438 Alex Deucher      2010-05-28  1775  {
1d0c094201bd4c Christian König   2014-11-27  1776  	struct radeon_bo_list *reloc;
cb5fcbd540b438 Alex Deucher      2010-05-28  1777  	struct evergreen_cs_track *track;
1c5dc335140023 Grazvydas Ignotas 2015-08-23  1778  	uint32_t *ib;
cb5fcbd540b438 Alex Deucher      2010-05-28  1779  	unsigned idx;
cb5fcbd540b438 Alex Deucher      2010-05-28  1780  	unsigned i;
cb5fcbd540b438 Alex Deucher      2010-05-28  1781  	unsigned start_reg, end_reg, reg;
cb5fcbd540b438 Alex Deucher      2010-05-28  1782  	int r;
cb5fcbd540b438 Alex Deucher      2010-05-28  1783  	u32 idx_value;
cb5fcbd540b438 Alex Deucher      2010-05-28  1784  
cb5fcbd540b438 Alex Deucher      2010-05-28  1785  	track = (struct evergreen_cs_track *)p->track;
f2e3922106f6b2 Jerome Glisse     2012-05-09  1786  	ib = p->ib.ptr;
cb5fcbd540b438 Alex Deucher      2010-05-28  1787  	idx = pkt->idx + 1;
cb5fcbd540b438 Alex Deucher      2010-05-28  1788  	idx_value = radeon_get_ib_value(p, idx);
cb5fcbd540b438 Alex Deucher      2010-05-28  1789  
cb5fcbd540b438 Alex Deucher      2010-05-28  1790  	switch (pkt->opcode) {
2a19cac8f9abf6 Dave Airlie       2011-02-28  1791  	case PACKET3_SET_PREDICATION:
2a19cac8f9abf6 Dave Airlie       2011-02-28  1792  	{
2a19cac8f9abf6 Dave Airlie       2011-02-28  1793  		int pred_op;
2a19cac8f9abf6 Dave Airlie       2011-02-28  1794  		int tmp;
78857131387061 Marek Olšák       2012-03-19  1795  		uint64_t offset;
78857131387061 Marek Olšák       2012-03-19  1796  
2a19cac8f9abf6 Dave Airlie       2011-02-28  1797  		if (pkt->count != 1) {
b7c5334af69d35 Alex Deucher      2025-09-02  1798  			dev_warn_once(p->dev, "bad SET PREDICATION\n");
2a19cac8f9abf6 Dave Airlie       2011-02-28  1799  			return -EINVAL;
2a19cac8f9abf6 Dave Airlie       2011-02-28  1800  		}
2a19cac8f9abf6 Dave Airlie       2011-02-28  1801  
2a19cac8f9abf6 Dave Airlie       2011-02-28  1802  		tmp = radeon_get_ib_value(p, idx + 1);
2a19cac8f9abf6 Dave Airlie       2011-02-28  1803  		pred_op = (tmp >> 16) & 0x7;
2a19cac8f9abf6 Dave Airlie       2011-02-28  1804  
2a19cac8f9abf6 Dave Airlie       2011-02-28  1805  		/* for the clear predicate operation */
2a19cac8f9abf6 Dave Airlie       2011-02-28  1806  		if (pred_op == 0)
2a19cac8f9abf6 Dave Airlie       2011-02-28  1807  			return 0;
2a19cac8f9abf6 Dave Airlie       2011-02-28  1808  
2a19cac8f9abf6 Dave Airlie       2011-02-28  1809  		if (pred_op > 2) {
b7c5334af69d35 Alex Deucher      2025-09-02  1810  			dev_warn_once(p->dev, "bad SET PREDICATION operation %d\n", pred_op);
2a19cac8f9abf6 Dave Airlie       2011-02-28  1811  			return -EINVAL;
2a19cac8f9abf6 Dave Airlie       2011-02-28  1812  		}
2a19cac8f9abf6 Dave Airlie       2011-02-28  1813  
012e976d42d281 Ilija Hadzic      2013-01-02  1814  		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
2a19cac8f9abf6 Dave Airlie       2011-02-28  1815  		if (r) {
b7c5334af69d35 Alex Deucher      2025-09-02  1816  			dev_warn_once(p->dev, "bad SET PREDICATION\n");
2a19cac8f9abf6 Dave Airlie       2011-02-28  1817  			return -EINVAL;
2a19cac8f9abf6 Dave Airlie       2011-02-28  1818  		}
2a19cac8f9abf6 Dave Airlie       2011-02-28  1819  
df0af4403aa8df Christian König   2014-03-03  1820  		offset = reloc->gpu_offset +
78857131387061 Marek Olšák       2012-03-19  1821  			 (idx_value & 0xfffffff0) +
78857131387061 Marek Olšák       2012-03-19  1822  			 ((u64)(tmp & 0xff) << 32);
78857131387061 Marek Olšák       2012-03-19  1823  
78857131387061 Marek Olšák       2012-03-19  1824  		ib[idx + 0] = offset;
78857131387061 Marek Olšák       2012-03-19  1825  		ib[idx + 1] = (tmp & 0xffffff00) | (upper_32_bits(offset) & 0xff);
2a19cac8f9abf6 Dave Airlie       2011-02-28  1826  	}
2a19cac8f9abf6 Dave Airlie       2011-02-28  1827  	break;
cb5fcbd540b438 Alex Deucher      2010-05-28  1828  	case PACKET3_CONTEXT_CONTROL:
cb5fcbd540b438 Alex Deucher      2010-05-28  1829  		if (pkt->count != 1) {
b7c5334af69d35 Alex Deucher      2025-09-02  1830  			dev_warn_once(p->dev, "bad CONTEXT_CONTROL\n");
cb5fcbd540b438 Alex Deucher      2010-05-28  1831  			return -EINVAL;
cb5fcbd540b438 Alex Deucher      2010-05-28  1832  		}
cb5fcbd540b438 Alex Deucher      2010-05-28  1833  		break;
cb5fcbd540b438 Alex Deucher      2010-05-28  1834  	case PACKET3_INDEX_TYPE:
cb5fcbd540b438 Alex Deucher      2010-05-28  1835  	case PACKET3_NUM_INSTANCES:
cb5fcbd540b438 Alex Deucher      2010-05-28  1836  	case PACKET3_CLEAR_STATE:
cb5fcbd540b438 Alex Deucher      2010-05-28  1837  		if (pkt->count) {
b7c5334af69d35 Alex Deucher      2025-09-02  1838  			dev_warn_once(p->dev, "bad INDEX_TYPE/NUM_INSTANCES/CLEAR_STATE\n");
cb5fcbd540b438 Alex Deucher      2010-05-28  1839  			return -EINVAL;
cb5fcbd540b438 Alex Deucher      2010-05-28  1840  		}
cb5fcbd540b438 Alex Deucher      2010-05-28  1841  		break;
c175ca9a4c8cb3 Alex Deucher      2011-03-02  1842  	case CAYMAN_PACKET3_DEALLOC_STATE:
c175ca9a4c8cb3 Alex Deucher      2011-03-02  1843  		if (p->rdev->family < CHIP_CAYMAN) {
b7c5334af69d35 Alex Deucher      2025-09-02  1844  			dev_warn_once(p->dev, "bad PACKET3_DEALLOC_STATE\n");
c175ca9a4c8cb3 Alex Deucher      2011-03-02  1845  			return -EINVAL;
c175ca9a4c8cb3 Alex Deucher      2011-03-02  1846  		}
c175ca9a4c8cb3 Alex Deucher      2011-03-02  1847  		if (pkt->count) {
b7c5334af69d35 Alex Deucher      2025-09-02  1848  			dev_warn_once(p->dev, "bad INDEX_TYPE/NUM_INSTANCES/CLEAR_STATE\n");
c175ca9a4c8cb3 Alex Deucher      2011-03-02  1849  			return -EINVAL;
c175ca9a4c8cb3 Alex Deucher      2011-03-02  1850  		}
c175ca9a4c8cb3 Alex Deucher      2011-03-02  1851  		break;
cb5fcbd540b438 Alex Deucher      2010-05-28  1852  	case PACKET3_INDEX_BASE:
78857131387061 Marek Olšák       2012-03-19  1853  	{
78857131387061 Marek Olšák       2012-03-19  1854  		uint64_t offset;
78857131387061 Marek Olšák       2012-03-19  1855  
cb5fcbd540b438 Alex Deucher      2010-05-28  1856  		if (pkt->count != 1) {
b7c5334af69d35 Alex Deucher      2025-09-02  1857  			dev_warn_once(p->dev, "bad INDEX_BASE\n");
cb5fcbd540b438 Alex Deucher      2010-05-28  1858  			return -EINVAL;
cb5fcbd540b438 Alex Deucher      2010-05-28  1859  		}
012e976d42d281 Ilija Hadzic      2013-01-02  1860  		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
cb5fcbd540b438 Alex Deucher      2010-05-28  1861  		if (r) {
b7c5334af69d35 Alex Deucher      2025-09-02  1862  			dev_warn_once(p->dev, "bad INDEX_BASE\n");
cb5fcbd540b438 Alex Deucher      2010-05-28  1863  			return -EINVAL;
cb5fcbd540b438 Alex Deucher      2010-05-28  1864  		}
78857131387061 Marek Olšák       2012-03-19  1865  
df0af4403aa8df Christian König   2014-03-03  1866  		offset = reloc->gpu_offset +
78857131387061 Marek Olšák       2012-03-19  1867  			 idx_value +
78857131387061 Marek Olšák       2012-03-19  1868  			 ((u64)(radeon_get_ib_value(p, idx+1) & 0xff) << 32);
78857131387061 Marek Olšák       2012-03-19  1869  
78857131387061 Marek Olšák       2012-03-19  1870  		ib[idx+0] = offset;
78857131387061 Marek Olšák       2012-03-19  1871  		ib[idx+1] = upper_32_bits(offset) & 0xff;
78857131387061 Marek Olšák       2012-03-19  1872  
cb5fcbd540b438 Alex Deucher      2010-05-28  1873  		r = evergreen_cs_track_check(p);
cb5fcbd540b438 Alex Deucher      2010-05-28  1874  		if (r) {
b7c5334af69d35 Alex Deucher      2025-09-02  1875  			dev_warn_once(p->dev, "%s:%d invalid cmd stream\n", __func__, __LINE__);
cb5fcbd540b438 Alex Deucher      2010-05-28  1876  			return r;
cb5fcbd540b438 Alex Deucher      2010-05-28  1877  		}
cb5fcbd540b438 Alex Deucher      2010-05-28  1878  		break;
78857131387061 Marek Olšák       2012-03-19  1879  	}
16613743adaf79 Glenn Kennard     2014-12-13  1880  	case PACKET3_INDEX_BUFFER_SIZE:
16613743adaf79 Glenn Kennard     2014-12-13  1881  	{
16613743adaf79 Glenn Kennard     2014-12-13  1882  		if (pkt->count != 0) {
b7c5334af69d35 Alex Deucher      2025-09-02  1883  			dev_warn_once(p->dev, "bad INDEX_BUFFER_SIZE\n");
16613743adaf79 Glenn Kennard     2014-12-13  1884  			return -EINVAL;
16613743adaf79 Glenn Kennard     2014-12-13  1885  		}
16613743adaf79 Glenn Kennard     2014-12-13  1886  		break;
16613743adaf79 Glenn Kennard     2014-12-13  1887  	}
cb5fcbd540b438 Alex Deucher      2010-05-28  1888  	case PACKET3_DRAW_INDEX:
78857131387061 Marek Olšák       2012-03-19  1889  	{
78857131387061 Marek Olšák       2012-03-19  1890  		uint64_t offset;
cb5fcbd540b438 Alex Deucher      2010-05-28  1891  		if (pkt->count != 3) {
b7c5334af69d35 Alex Deucher      2025-09-02  1892  			dev_warn_once(p->dev, "bad DRAW_INDEX\n");
cb5fcbd540b438 Alex Deucher      2010-05-28  1893  			return -EINVAL;
cb5fcbd540b438 Alex Deucher      2010-05-28  1894  		}
012e976d42d281 Ilija Hadzic      2013-01-02  1895  		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
cb5fcbd540b438 Alex Deucher      2010-05-28  1896  		if (r) {
b7c5334af69d35 Alex Deucher      2025-09-02  1897  			dev_warn_once(p->dev, "bad DRAW_INDEX\n");
cb5fcbd540b438 Alex Deucher      2010-05-28  1898  			return -EINVAL;
cb5fcbd540b438 Alex Deucher      2010-05-28  1899  		}
78857131387061 Marek Olšák       2012-03-19  1900  
df0af4403aa8df Christian König   2014-03-03  1901  		offset = reloc->gpu_offset +
78857131387061 Marek Olšák       2012-03-19  1902  			 idx_value +
78857131387061 Marek Olšák       2012-03-19  1903  			 ((u64)(radeon_get_ib_value(p, idx+1) & 0xff) << 32);
78857131387061 Marek Olšák       2012-03-19  1904  
78857131387061 Marek Olšák       2012-03-19  1905  		ib[idx+0] = offset;
78857131387061 Marek Olšák       2012-03-19  1906  		ib[idx+1] = upper_32_bits(offset) & 0xff;
78857131387061 Marek Olšák       2012-03-19  1907  
cb5fcbd540b438 Alex Deucher      2010-05-28  1908  		r = evergreen_cs_track_check(p);
cb5fcbd540b438 Alex Deucher      2010-05-28  1909  		if (r) {
b7c5334af69d35 Alex Deucher      2025-09-02  1910  			dev_warn_once(p->dev, "%s:%d invalid cmd stream\n", __func__, __LINE__);
cb5fcbd540b438 Alex Deucher      2010-05-28  1911  			return r;
cb5fcbd540b438 Alex Deucher      2010-05-28  1912  		}
cb5fcbd540b438 Alex Deucher      2010-05-28  1913  		break;
78857131387061 Marek Olšák       2012-03-19  1914  	}
cb5fcbd540b438 Alex Deucher      2010-05-28  1915  	case PACKET3_DRAW_INDEX_2:
78857131387061 Marek Olšák       2012-03-19  1916  	{
78857131387061 Marek Olšák       2012-03-19  1917  		uint64_t offset;
78857131387061 Marek Olšák       2012-03-19  1918  
cb5fcbd540b438 Alex Deucher      2010-05-28  1919  		if (pkt->count != 4) {
b7c5334af69d35 Alex Deucher      2025-09-02  1920  			dev_warn_once(p->dev, "bad DRAW_INDEX_2\n");
cb5fcbd540b438 Alex Deucher      2010-05-28  1921  			return -EINVAL;
cb5fcbd540b438 Alex Deucher      2010-05-28  1922  		}
012e976d42d281 Ilija Hadzic      2013-01-02  1923  		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
cb5fcbd540b438 Alex Deucher      2010-05-28  1924  		if (r) {
b7c5334af69d35 Alex Deucher      2025-09-02  1925  			dev_warn_once(p->dev, "bad DRAW_INDEX_2\n");
cb5fcbd540b438 Alex Deucher      2010-05-28  1926  			return -EINVAL;
cb5fcbd540b438 Alex Deucher      2010-05-28  1927  		}
78857131387061 Marek Olšák       2012-03-19  1928  
df0af4403aa8df Christian König   2014-03-03  1929  		offset = reloc->gpu_offset +
78857131387061 Marek Olšák       2012-03-19  1930  			 radeon_get_ib_value(p, idx+1) +
78857131387061 Marek Olšák       2012-03-19  1931  			 ((u64)(radeon_get_ib_value(p, idx+2) & 0xff) << 32);
78857131387061 Marek Olšák       2012-03-19  1932  
78857131387061 Marek Olšák       2012-03-19  1933  		ib[idx+1] = offset;
78857131387061 Marek Olšák       2012-03-19  1934  		ib[idx+2] = upper_32_bits(offset) & 0xff;
78857131387061 Marek Olšák       2012-03-19  1935  
cb5fcbd540b438 Alex Deucher      2010-05-28  1936  		r = evergreen_cs_track_check(p);
cb5fcbd540b438 Alex Deucher      2010-05-28  1937  		if (r) {
b7c5334af69d35 Alex Deucher      2025-09-02  1938  			dev_warn_once(p->dev, "%s:%d invalid cmd stream\n", __func__, __LINE__);
cb5fcbd540b438 Alex Deucher      2010-05-28  1939  			return r;
cb5fcbd540b438 Alex Deucher      2010-05-28  1940  		}
cb5fcbd540b438 Alex Deucher      2010-05-28  1941  		break;
78857131387061 Marek Olšák       2012-03-19  1942  	}
cb5fcbd540b438 Alex Deucher      2010-05-28  1943  	case PACKET3_DRAW_INDEX_AUTO:
cb5fcbd540b438 Alex Deucher      2010-05-28  1944  		if (pkt->count != 1) {
b7c5334af69d35 Alex Deucher      2025-09-02  1945  			dev_warn_once(p->dev, "bad DRAW_INDEX_AUTO\n");
cb5fcbd540b438 Alex Deucher      2010-05-28  1946  			return -EINVAL;
cb5fcbd540b438 Alex Deucher      2010-05-28  1947  		}
cb5fcbd540b438 Alex Deucher      2010-05-28  1948  		r = evergreen_cs_track_check(p);
cb5fcbd540b438 Alex Deucher      2010-05-28  1949  		if (r) {
b7c5334af69d35 Alex Deucher      2025-09-02  1950  			dev_warn_once(p->dev, "%s:%d invalid cmd stream %d\n", __func__, __LINE__, idx);
cb5fcbd540b438 Alex Deucher      2010-05-28  1951  			return r;
cb5fcbd540b438 Alex Deucher      2010-05-28  1952  		}
cb5fcbd540b438 Alex Deucher      2010-05-28  1953  		break;
cb5fcbd540b438 Alex Deucher      2010-05-28  1954  	case PACKET3_DRAW_INDEX_MULTI_AUTO:
cb5fcbd540b438 Alex Deucher      2010-05-28  1955  		if (pkt->count != 2) {
b7c5334af69d35 Alex Deucher      2025-09-02  1956  			dev_warn_once(p->dev, "bad DRAW_INDEX_MULTI_AUTO\n");
cb5fcbd540b438 Alex Deucher      2010-05-28  1957  			return -EINVAL;
cb5fcbd540b438 Alex Deucher      2010-05-28  1958  		}
cb5fcbd540b438 Alex Deucher      2010-05-28  1959  		r = evergreen_cs_track_check(p);
cb5fcbd540b438 Alex Deucher      2010-05-28  1960  		if (r) {
b7c5334af69d35 Alex Deucher      2025-09-02  1961  			dev_warn_once(p->dev, "%s:%d invalid cmd stream %d\n", __func__, __LINE__, idx);
cb5fcbd540b438 Alex Deucher      2010-05-28  1962  			return r;
cb5fcbd540b438 Alex Deucher      2010-05-28  1963  		}
cb5fcbd540b438 Alex Deucher      2010-05-28  1964  		break;
cb5fcbd540b438 Alex Deucher      2010-05-28  1965  	case PACKET3_DRAW_INDEX_IMMD:
cb5fcbd540b438 Alex Deucher      2010-05-28  1966  		if (pkt->count < 2) {
b7c5334af69d35 Alex Deucher      2025-09-02  1967  			dev_warn_once(p->dev, "bad DRAW_INDEX_IMMD\n");
cb5fcbd540b438 Alex Deucher      2010-05-28  1968  			return -EINVAL;
cb5fcbd540b438 Alex Deucher      2010-05-28  1969  		}
cb5fcbd540b438 Alex Deucher      2010-05-28  1970  		r = evergreen_cs_track_check(p);
cb5fcbd540b438 Alex Deucher      2010-05-28  1971  		if (r) {
b7c5334af69d35 Alex Deucher      2025-09-02  1972  			dev_warn_once(p->dev, "%s:%d invalid cmd stream\n", __func__, __LINE__);
cb5fcbd540b438 Alex Deucher      2010-05-28  1973  			return r;
cb5fcbd540b438 Alex Deucher      2010-05-28  1974  		}
cb5fcbd540b438 Alex Deucher      2010-05-28  1975  		break;
cb5fcbd540b438 Alex Deucher      2010-05-28  1976  	case PACKET3_DRAW_INDEX_OFFSET:
cb5fcbd540b438 Alex Deucher      2010-05-28  1977  		if (pkt->count != 2) {
b7c5334af69d35 Alex Deucher      2025-09-02  1978  			dev_warn_once(p->dev, "bad DRAW_INDEX_OFFSET\n");
cb5fcbd540b438 Alex Deucher      2010-05-28  1979  			return -EINVAL;
cb5fcbd540b438 Alex Deucher      2010-05-28  1980  		}
cb5fcbd540b438 Alex Deucher      2010-05-28  1981  		r = evergreen_cs_track_check(p);
cb5fcbd540b438 Alex Deucher      2010-05-28  1982  		if (r) {
b7c5334af69d35 Alex Deucher      2025-09-02  1983  			dev_warn_once(p->dev, "%s:%d invalid cmd stream\n", __func__, __LINE__);
cb5fcbd540b438 Alex Deucher      2010-05-28  1984  			return r;
cb5fcbd540b438 Alex Deucher      2010-05-28  1985  		}
cb5fcbd540b438 Alex Deucher      2010-05-28  1986  		break;
cb5fcbd540b438 Alex Deucher      2010-05-28  1987  	case PACKET3_DRAW_INDEX_OFFSET_2:
cb5fcbd540b438 Alex Deucher      2010-05-28  1988  		if (pkt->count != 3) {
b7c5334af69d35 Alex Deucher      2025-09-02  1989  			dev_warn_once(p->dev, "bad DRAW_INDEX_OFFSET_2\n");
cb5fcbd540b438 Alex Deucher      2010-05-28  1990  			return -EINVAL;
cb5fcbd540b438 Alex Deucher      2010-05-28  1991  		}
cb5fcbd540b438 Alex Deucher      2010-05-28  1992  		r = evergreen_cs_track_check(p);
cb5fcbd540b438 Alex Deucher      2010-05-28  1993  		if (r) {
b7c5334af69d35 Alex Deucher      2025-09-02  1994  			dev_warn_once(p->dev, "%s:%d invalid cmd stream\n", __func__, __LINE__);
cb5fcbd540b438 Alex Deucher      2010-05-28  1995  			return r;
cb5fcbd540b438 Alex Deucher      2010-05-28  1996  		}
cb5fcbd540b438 Alex Deucher      2010-05-28  1997  		break;
16613743adaf79 Glenn Kennard     2014-12-13  1998  	case PACKET3_SET_BASE:
16613743adaf79 Glenn Kennard     2014-12-13  1999  	{
16613743adaf79 Glenn Kennard     2014-12-13  2000  		/*
16613743adaf79 Glenn Kennard     2014-12-13  2001  		DW 1 HEADER Header of the packet. Shader_Type in bit 1 of the Header will correspond to the shader type of the Load, see Type-3 Packet.
16613743adaf79 Glenn Kennard     2014-12-13  2002  		   2 BASE_INDEX Bits [3:0] BASE_INDEX - Base Index specifies which base address is specified in the last two DWs.
16613743adaf79 Glenn Kennard     2014-12-13  2003  		     0001: DX11 Draw_Index_Indirect Patch Table Base: Base address for Draw_Index_Indirect data.
16613743adaf79 Glenn Kennard     2014-12-13  2004  		   3 ADDRESS_LO Bits [31:3] - Lower bits of QWORD-Aligned Address. Bits [2:0] - Reserved
16613743adaf79 Glenn Kennard     2014-12-13  2005  		   4 ADDRESS_HI Bits [31:8] - Reserved. Bits [7:0] - Upper bits of Address [47:32]
16613743adaf79 Glenn Kennard     2014-12-13  2006  		*/
16613743adaf79 Glenn Kennard     2014-12-13  2007  		if (pkt->count != 2) {
b7c5334af69d35 Alex Deucher      2025-09-02  2008  			dev_warn_once(p->dev, "bad SET_BASE\n");
16613743adaf79 Glenn Kennard     2014-12-13  2009  			return -EINVAL;
16613743adaf79 Glenn Kennard     2014-12-13  2010  		}
16613743adaf79 Glenn Kennard     2014-12-13  2011  
16613743adaf79 Glenn Kennard     2014-12-13  2012  		/* currently only supporting setting indirect draw buffer base address */
16613743adaf79 Glenn Kennard     2014-12-13  2013  		if (idx_value != 1) {
b7c5334af69d35 Alex Deucher      2025-09-02  2014  			dev_warn_once(p->dev, "bad SET_BASE\n");
16613743adaf79 Glenn Kennard     2014-12-13  2015  			return -EINVAL;
16613743adaf79 Glenn Kennard     2014-12-13  2016  		}
16613743adaf79 Glenn Kennard     2014-12-13  2017  
16613743adaf79 Glenn Kennard     2014-12-13  2018  		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
16613743adaf79 Glenn Kennard     2014-12-13  2019  		if (r) {
b7c5334af69d35 Alex Deucher      2025-09-02  2020  			dev_warn_once(p->dev, "bad SET_BASE\n");
16613743adaf79 Glenn Kennard     2014-12-13  2021  			return -EINVAL;
16613743adaf79 Glenn Kennard     2014-12-13  2022  		}
16613743adaf79 Glenn Kennard     2014-12-13  2023  
16613743adaf79 Glenn Kennard     2014-12-13  2024  		track->indirect_draw_buffer_size = radeon_bo_size(reloc->robj);
16613743adaf79 Glenn Kennard     2014-12-13  2025  
16613743adaf79 Glenn Kennard     2014-12-13  2026  		ib[idx+1] = reloc->gpu_offset;
16613743adaf79 Glenn Kennard     2014-12-13  2027  		ib[idx+2] = upper_32_bits(reloc->gpu_offset) & 0xff;
16613743adaf79 Glenn Kennard     2014-12-13  2028  
16613743adaf79 Glenn Kennard     2014-12-13  2029  		break;
16613743adaf79 Glenn Kennard     2014-12-13  2030  	}
16613743adaf79 Glenn Kennard     2014-12-13  2031  	case PACKET3_DRAW_INDIRECT:
16613743adaf79 Glenn Kennard     2014-12-13  2032  	case PACKET3_DRAW_INDEX_INDIRECT:
16613743adaf79 Glenn Kennard     2014-12-13  2033  	{
16613743adaf79 Glenn Kennard     2014-12-13  2034  		u64 size = pkt->opcode == PACKET3_DRAW_INDIRECT ? 16 : 20;
16613743adaf79 Glenn Kennard     2014-12-13  2035  
16613743adaf79 Glenn Kennard     2014-12-13  2036  		/*
16613743adaf79 Glenn Kennard     2014-12-13  2037  		DW 1 HEADER
16613743adaf79 Glenn Kennard     2014-12-13  2038  		   2 DATA_OFFSET Bits [31:0] + byte aligned offset where the required data structure starts. Bits 1:0 are zero
16613743adaf79 Glenn Kennard     2014-12-13  2039  		   3 DRAW_INITIATOR Draw Initiator Register. Written to the VGT_DRAW_INITIATOR register for the assigned context
16613743adaf79 Glenn Kennard     2014-12-13  2040  		*/
16613743adaf79 Glenn Kennard     2014-12-13  2041  		if (pkt->count != 1) {
b7c5334af69d35 Alex Deucher      2025-09-02  2042  			dev_warn_once(p->dev, "bad DRAW_INDIRECT\n");
16613743adaf79 Glenn Kennard     2014-12-13  2043  			return -EINVAL;
16613743adaf79 Glenn Kennard     2014-12-13  2044  		}
16613743adaf79 Glenn Kennard     2014-12-13  2045  
16613743adaf79 Glenn Kennard     2014-12-13  2046  		if (idx_value + size > track->indirect_draw_buffer_size) {
b7c5334af69d35 Alex Deucher      2025-09-02  2047  			dev_warn_once(p->dev, "DRAW_INDIRECT buffer too small %u + %llu > %lu\n",
16613743adaf79 Glenn Kennard     2014-12-13  2048  				      idx_value, size, track->indirect_draw_buffer_size);
16613743adaf79 Glenn Kennard     2014-12-13  2049  			return -EINVAL;
16613743adaf79 Glenn Kennard     2014-12-13  2050  		}
16613743adaf79 Glenn Kennard     2014-12-13  2051  
16613743adaf79 Glenn Kennard     2014-12-13  2052  		r = evergreen_cs_track_check(p);
16613743adaf79 Glenn Kennard     2014-12-13  2053  		if (r) {
b7c5334af69d35 Alex Deucher      2025-09-02  2054  			dev_warn_once(p->dev, "%s:%d invalid cmd stream\n", __func__, __LINE__);
16613743adaf79 Glenn Kennard     2014-12-13  2055  			return r;
16613743adaf79 Glenn Kennard     2014-12-13  2056  		}
16613743adaf79 Glenn Kennard     2014-12-13  2057  		break;
16613743adaf79 Glenn Kennard     2014-12-13  2058  	}
033b5650010652 Alex Deucher      2011-06-08  2059  	case PACKET3_DISPATCH_DIRECT:
033b5650010652 Alex Deucher      2011-06-08  2060  		if (pkt->count != 3) {
b7c5334af69d35 Alex Deucher      2025-09-02  2061  			dev_warn_once(p->dev, "bad DISPATCH_DIRECT\n");
033b5650010652 Alex Deucher      2011-06-08  2062  			return -EINVAL;
033b5650010652 Alex Deucher      2011-06-08  2063  		}
033b5650010652 Alex Deucher      2011-06-08  2064  		r = evergreen_cs_track_check(p);
033b5650010652 Alex Deucher      2011-06-08  2065  		if (r) {
b7c5334af69d35 Alex Deucher      2025-09-02  2066  			dev_warn_once(p->dev, "%s:%d invalid cmd stream %d\n", __func__, __LINE__, idx);
033b5650010652 Alex Deucher      2011-06-08  2067  			return r;
033b5650010652 Alex Deucher      2011-06-08  2068  		}
033b5650010652 Alex Deucher      2011-06-08  2069  		break;
033b5650010652 Alex Deucher      2011-06-08  2070  	case PACKET3_DISPATCH_INDIRECT:
033b5650010652 Alex Deucher      2011-06-08  2071  		if (pkt->count != 1) {
b7c5334af69d35 Alex Deucher      2025-09-02  2072  			dev_warn_once(p->dev, "bad DISPATCH_INDIRECT\n");
033b5650010652 Alex Deucher      2011-06-08  2073  			return -EINVAL;
033b5650010652 Alex Deucher      2011-06-08  2074  		}
012e976d42d281 Ilija Hadzic      2013-01-02  2075  		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
033b5650010652 Alex Deucher      2011-06-08  2076  		if (r) {
b7c5334af69d35 Alex Deucher      2025-09-02  2077  			dev_warn_once(p->dev, "bad DISPATCH_INDIRECT\n");
033b5650010652 Alex Deucher      2011-06-08  2078  			return -EINVAL;
033b5650010652 Alex Deucher      2011-06-08  2079  		}
df0af4403aa8df Christian König   2014-03-03  2080  		ib[idx+0] = idx_value + (u32)(reloc->gpu_offset & 0xffffffff);
033b5650010652 Alex Deucher      2011-06-08  2081  		r = evergreen_cs_track_check(p);
033b5650010652 Alex Deucher      2011-06-08  2082  		if (r) {
b7c5334af69d35 Alex Deucher      2025-09-02  2083  			dev_warn_once(p->dev, "%s:%d invalid cmd stream\n", __func__, __LINE__);
033b5650010652 Alex Deucher      2011-06-08  2084  			return r;
033b5650010652 Alex Deucher      2011-06-08  2085  		}
033b5650010652 Alex Deucher      2011-06-08  2086  		break;
cb5fcbd540b438 Alex Deucher      2010-05-28  2087  	case PACKET3_WAIT_REG_MEM:
cb5fcbd540b438 Alex Deucher      2010-05-28  2088  		if (pkt->count != 5) {
b7c5334af69d35 Alex Deucher      2025-09-02  2089  			dev_warn_once(p->dev, "bad WAIT_REG_MEM\n");
cb5fcbd540b438 Alex Deucher      2010-05-28  2090  			return -EINVAL;
cb5fcbd540b438 Alex Deucher      2010-05-28  2091  		}
cb5fcbd540b438 Alex Deucher      2010-05-28  2092  		/* bit 4 is reg (0) or mem (1) */
cb5fcbd540b438 Alex Deucher      2010-05-28  2093  		if (idx_value & 0x10) {
78857131387061 Marek Olšák       2012-03-19  2094  			uint64_t offset;
78857131387061 Marek Olšák       2012-03-19  2095  
012e976d42d281 Ilija Hadzic      2013-01-02  2096  			r = radeon_cs_packet_next_reloc(p, &reloc, 0);
cb5fcbd540b438 Alex Deucher      2010-05-28  2097  			if (r) {
b7c5334af69d35 Alex Deucher      2025-09-02  2098  				dev_warn_once(p->dev, "bad WAIT_REG_MEM\n");
cb5fcbd540b438 Alex Deucher      2010-05-28  2099  				return -EINVAL;
cb5fcbd540b438 Alex Deucher      2010-05-28  2100  			}
78857131387061 Marek Olšák       2012-03-19  2101  
df0af4403aa8df Christian König   2014-03-03  2102  			offset = reloc->gpu_offset +
78857131387061 Marek Olšák       2012-03-19  2103  				 (radeon_get_ib_value(p, idx+1) & 0xfffffffc) +
78857131387061 Marek Olšák       2012-03-19  2104  				 ((u64)(radeon_get_ib_value(p, idx+2) & 0xff) << 32);
78857131387061 Marek Olšák       2012-03-19  2105  
78857131387061 Marek Olšák       2012-03-19  2106  			ib[idx+1] = (ib[idx+1] & 0x3) | (offset & 0xfffffffc);
78857131387061 Marek Olšák       2012-03-19  2107  			ib[idx+2] = upper_32_bits(offset) & 0xff;
d6e18a3406d401 Ilija Hadzic      2013-01-02  2108  		} else if (idx_value & 0x100) {
b7c5334af69d35 Alex Deucher      2025-09-02  2109  			dev_warn_once(p->dev, "cannot use PFP on REG wait\n");
d6e18a3406d401 Ilija Hadzic      2013-01-02  2110  			return -EINVAL;
cb5fcbd540b438 Alex Deucher      2010-05-28  2111  		}
cb5fcbd540b438 Alex Deucher      2010-05-28  2112  		break;
8770b86b3e02c3 Alex Deucher      2012-12-03  2113  	case PACKET3_CP_DMA:
8770b86b3e02c3 Alex Deucher      2012-12-03  2114  	{
8770b86b3e02c3 Alex Deucher      2012-12-03  2115  		u32 command, size, info;
8770b86b3e02c3 Alex Deucher      2012-12-03  2116  		u64 offset, tmp;
8770b86b3e02c3 Alex Deucher      2012-12-03  2117  		if (pkt->count != 4) {
b7c5334af69d35 Alex Deucher      2025-09-02  2118  			dev_warn_once(p->dev, "bad CP DMA\n");
8770b86b3e02c3 Alex Deucher      2012-12-03  2119  			return -EINVAL;
8770b86b3e02c3 Alex Deucher      2012-12-03  2120  		}
8770b86b3e02c3 Alex Deucher      2012-12-03  2121  		command = radeon_get_ib_value(p, idx+4);
8770b86b3e02c3 Alex Deucher      2012-12-03  2122  		size = command & 0x1fffff;
8770b86b3e02c3 Alex Deucher      2012-12-03  2123  		info = radeon_get_ib_value(p, idx+1);
9d89d78e3a2098 Alex Deucher      2012-12-14  2124  		if ((((info & 0x60000000) >> 29) != 0) || /* src = GDS or DATA */
9d89d78e3a2098 Alex Deucher      2012-12-14  2125  		    (((info & 0x00300000) >> 20) != 0) || /* dst = GDS */
9d89d78e3a2098 Alex Deucher      2012-12-14  2126  		    ((((info & 0x00300000) >> 20) == 0) &&
9d89d78e3a2098 Alex Deucher      2012-12-14  2127  		     (command & PACKET3_CP_DMA_CMD_DAS)) || /* dst = register */
9d89d78e3a2098 Alex Deucher      2012-12-14  2128  		    ((((info & 0x60000000) >> 29) == 0) &&
9d89d78e3a2098 Alex Deucher      2012-12-14  2129  		     (command & PACKET3_CP_DMA_CMD_SAS))) { /* src = register */
9d89d78e3a2098 Alex Deucher      2012-12-14  2130  			/* non mem to mem copies requires dw aligned count */
9d89d78e3a2098 Alex Deucher      2012-12-14  2131  			if (size % 4) {
b7c5334af69d35 Alex Deucher      2025-09-02  2132  				dev_warn_once(p->dev, "CP DMA command requires dw count alignment\n");
9d89d78e3a2098 Alex Deucher      2012-12-14  2133  				return -EINVAL;
9d89d78e3a2098 Alex Deucher      2012-12-14  2134  			}
9d89d78e3a2098 Alex Deucher      2012-12-14  2135  		}
8770b86b3e02c3 Alex Deucher      2012-12-03  2136  		if (command & PACKET3_CP_DMA_CMD_SAS) {
8770b86b3e02c3 Alex Deucher      2012-12-03  2137  			/* src address space is register */
8770b86b3e02c3 Alex Deucher      2012-12-03  2138  			/* GDS is ok */
8770b86b3e02c3 Alex Deucher      2012-12-03  2139  			if (((info & 0x60000000) >> 29) != 1) {
b7c5334af69d35 Alex Deucher      2025-09-02  2140  				dev_warn_once(p->dev, "CP DMA SAS not supported\n");
8770b86b3e02c3 Alex Deucher      2012-12-03  2141  				return -EINVAL;
8770b86b3e02c3 Alex Deucher      2012-12-03  2142  			}
8770b86b3e02c3 Alex Deucher      2012-12-03  2143  		} else {
8770b86b3e02c3 Alex Deucher      2012-12-03  2144  			if (command & PACKET3_CP_DMA_CMD_SAIC) {
b7c5334af69d35 Alex Deucher      2025-09-02  2145  				dev_warn_once(p->dev, "CP DMA SAIC only supported for registers\n");
8770b86b3e02c3 Alex Deucher      2012-12-03  2146  				return -EINVAL;
8770b86b3e02c3 Alex Deucher      2012-12-03  2147  			}
8770b86b3e02c3 Alex Deucher      2012-12-03  2148  			/* src address space is memory */
8770b86b3e02c3 Alex Deucher      2012-12-03  2149  			if (((info & 0x60000000) >> 29) == 0) {
012e976d42d281 Ilija Hadzic      2013-01-02  2150  				r = radeon_cs_packet_next_reloc(p, &reloc, 0);
8770b86b3e02c3 Alex Deucher      2012-12-03  2151  				if (r) {
b7c5334af69d35 Alex Deucher      2025-09-02  2152  					dev_warn_once(p->dev, "bad CP DMA SRC\n");
8770b86b3e02c3 Alex Deucher      2012-12-03  2153  					return -EINVAL;
8770b86b3e02c3 Alex Deucher      2012-12-03  2154  				}
8770b86b3e02c3 Alex Deucher      2012-12-03  2155  
8770b86b3e02c3 Alex Deucher      2012-12-03  2156  				tmp = radeon_get_ib_value(p, idx) +
8770b86b3e02c3 Alex Deucher      2012-12-03  2157  					((u64)(radeon_get_ib_value(p, idx+1) & 0xff) << 32);
8770b86b3e02c3 Alex Deucher      2012-12-03  2158  
df0af4403aa8df Christian König   2014-03-03  2159  				offset = reloc->gpu_offset + tmp;
8770b86b3e02c3 Alex Deucher      2012-12-03  2160  
8770b86b3e02c3 Alex Deucher      2012-12-03  2161  				if ((tmp + size) > radeon_bo_size(reloc->robj)) {
b7c5334af69d35 Alex Deucher      2025-09-02  2162  					dev_warn_once(p->dev, "CP DMA src buffer too small (%llu %lu)\n",
8770b86b3e02c3 Alex Deucher      2012-12-03  2163  						      tmp + size, radeon_bo_size(reloc->robj));
8770b86b3e02c3 Alex Deucher      2012-12-03  2164  					return -EINVAL;
8770b86b3e02c3 Alex Deucher      2012-12-03  2165  				}
8770b86b3e02c3 Alex Deucher      2012-12-03  2166  
8770b86b3e02c3 Alex Deucher      2012-12-03  2167  				ib[idx] = offset;
8770b86b3e02c3 Alex Deucher      2012-12-03  2168  				ib[idx+1] = (ib[idx+1] & 0xffffff00) | (upper_32_bits(offset) & 0xff);
8770b86b3e02c3 Alex Deucher      2012-12-03  2169  			} else if (((info & 0x60000000) >> 29) != 2) {
b7c5334af69d35 Alex Deucher      2025-09-02  2170  				dev_warn_once(p->dev, "bad CP DMA SRC_SEL\n");
8770b86b3e02c3 Alex Deucher      2012-12-03  2171  				return -EINVAL;
8770b86b3e02c3 Alex Deucher      2012-12-03  2172  			}
8770b86b3e02c3 Alex Deucher      2012-12-03  2173  		}
8770b86b3e02c3 Alex Deucher      2012-12-03  2174  		if (command & PACKET3_CP_DMA_CMD_DAS) {
8770b86b3e02c3 Alex Deucher      2012-12-03  2175  			/* dst address space is register */
8770b86b3e02c3 Alex Deucher      2012-12-03  2176  			/* GDS is ok */
8770b86b3e02c3 Alex Deucher      2012-12-03  2177  			if (((info & 0x00300000) >> 20) != 1) {
b7c5334af69d35 Alex Deucher      2025-09-02  2178  				dev_warn_once(p->dev, "CP DMA DAS not supported\n");
8770b86b3e02c3 Alex Deucher      2012-12-03  2179  				return -EINVAL;
8770b86b3e02c3 Alex Deucher      2012-12-03  2180  			}
8770b86b3e02c3 Alex Deucher      2012-12-03  2181  		} else {
8770b86b3e02c3 Alex Deucher      2012-12-03  2182  			/* dst address space is memory */
8770b86b3e02c3 Alex Deucher      2012-12-03  2183  			if (command & PACKET3_CP_DMA_CMD_DAIC) {
b7c5334af69d35 Alex Deucher      2025-09-02  2184  				dev_warn_once(p->dev, "CP DMA DAIC only supported for registers\n");
8770b86b3e02c3 Alex Deucher      2012-12-03  2185  				return -EINVAL;
8770b86b3e02c3 Alex Deucher      2012-12-03  2186  			}
8770b86b3e02c3 Alex Deucher      2012-12-03  2187  			if (((info & 0x00300000) >> 20) == 0) {
012e976d42d281 Ilija Hadzic      2013-01-02  2188  				r = radeon_cs_packet_next_reloc(p, &reloc, 0);
8770b86b3e02c3 Alex Deucher      2012-12-03  2189  				if (r) {
b7c5334af69d35 Alex Deucher      2025-09-02  2190  					dev_warn_once(p->dev, "bad CP DMA DST\n");
8770b86b3e02c3 Alex Deucher      2012-12-03  2191  					return -EINVAL;
8770b86b3e02c3 Alex Deucher      2012-12-03  2192  				}
8770b86b3e02c3 Alex Deucher      2012-12-03  2193  
8770b86b3e02c3 Alex Deucher      2012-12-03  2194  				tmp = radeon_get_ib_value(p, idx+2) +
8770b86b3e02c3 Alex Deucher      2012-12-03  2195  					((u64)(radeon_get_ib_value(p, idx+3) & 0xff) << 32);
8770b86b3e02c3 Alex Deucher      2012-12-03  2196  
df0af4403aa8df Christian König   2014-03-03  2197  				offset = reloc->gpu_offset + tmp;
8770b86b3e02c3 Alex Deucher      2012-12-03  2198  
8770b86b3e02c3 Alex Deucher      2012-12-03  2199  				if ((tmp + size) > radeon_bo_size(reloc->robj)) {
b7c5334af69d35 Alex Deucher      2025-09-02  2200  					dev_warn_once(p->dev, "CP DMA dst buffer too small (%llu %lu)\n",
8770b86b3e02c3 Alex Deucher      2012-12-03  2201  						      tmp + size, radeon_bo_size(reloc->robj));
8770b86b3e02c3 Alex Deucher      2012-12-03  2202  					return -EINVAL;
8770b86b3e02c3 Alex Deucher      2012-12-03  2203  				}
8770b86b3e02c3 Alex Deucher      2012-12-03  2204  
8770b86b3e02c3 Alex Deucher      2012-12-03  2205  				ib[idx+2] = offset;
8770b86b3e02c3 Alex Deucher      2012-12-03  2206  				ib[idx+3] = upper_32_bits(offset) & 0xff;
8770b86b3e02c3 Alex Deucher      2012-12-03  2207  			} else {
b7c5334af69d35 Alex Deucher      2025-09-02  2208  				dev_warn_once(p->dev, "bad CP DMA DST_SEL\n");
8770b86b3e02c3 Alex Deucher      2012-12-03  2209  				return -EINVAL;
8770b86b3e02c3 Alex Deucher      2012-12-03  2210  			}
8770b86b3e02c3 Alex Deucher      2012-12-03  2211  		}
8770b86b3e02c3 Alex Deucher      2012-12-03  2212  		break;
8770b86b3e02c3 Alex Deucher      2012-12-03  2213  	}
662ce7bce7a4da Edmondo Tommasina 2016-05-31  2214  	case PACKET3_PFP_SYNC_ME:
662ce7bce7a4da Edmondo Tommasina 2016-05-31  2215  		if (pkt->count) {
b7c5334af69d35 Alex Deucher      2025-09-02  2216  			dev_warn_once(p->dev, "bad PFP_SYNC_ME\n");
662ce7bce7a4da Edmondo Tommasina 2016-05-31  2217  			return -EINVAL;
662ce7bce7a4da Edmondo Tommasina 2016-05-31  2218  		}
662ce7bce7a4da Edmondo Tommasina 2016-05-31  2219  		break;
cb5fcbd540b438 Alex Deucher      2010-05-28  2220  	case PACKET3_SURFACE_SYNC:
cb5fcbd540b438 Alex Deucher      2010-05-28  2221  		if (pkt->count != 3) {
b7c5334af69d35 Alex Deucher      2025-09-02  2222  			dev_warn_once(p->dev, "bad SURFACE_SYNC\n");
cb5fcbd540b438 Alex Deucher      2010-05-28  2223  			return -EINVAL;
cb5fcbd540b438 Alex Deucher      2010-05-28  2224  		}
cb5fcbd540b438 Alex Deucher      2010-05-28  2225  		/* 0xffffffff/0x0 is flush all cache flag */
cb5fcbd540b438 Alex Deucher      2010-05-28  2226  		if (radeon_get_ib_value(p, idx + 1) != 0xffffffff ||
cb5fcbd540b438 Alex Deucher      2010-05-28  2227  		    radeon_get_ib_value(p, idx + 2) != 0) {
012e976d42d281 Ilija Hadzic      2013-01-02  2228  			r = radeon_cs_packet_next_reloc(p, &reloc, 0);
cb5fcbd540b438 Alex Deucher      2010-05-28  2229  			if (r) {
b7c5334af69d35 Alex Deucher      2025-09-02  2230  				dev_warn_once(p->dev, "bad SURFACE_SYNC\n");
cb5fcbd540b438 Alex Deucher      2010-05-28  2231  				return -EINVAL;
cb5fcbd540b438 Alex Deucher      2010-05-28  2232  			}
df0af4403aa8df Christian König   2014-03-03  2233  			ib[idx+2] += (u32)((reloc->gpu_offset >> 8) & 0xffffffff);
cb5fcbd540b438 Alex Deucher      2010-05-28  2234  		}
cb5fcbd540b438 Alex Deucher      2010-05-28  2235  		break;
cb5fcbd540b438 Alex Deucher      2010-05-28  2236  	case PACKET3_EVENT_WRITE:
cb5fcbd540b438 Alex Deucher      2010-05-28  2237  		if (pkt->count != 2 && pkt->count != 0) {
b7c5334af69d35 Alex Deucher      2025-09-02  2238  			dev_warn_once(p->dev, "bad EVENT_WRITE\n");
cb5fcbd540b438 Alex Deucher      2010-05-28  2239  			return -EINVAL;
cb5fcbd540b438 Alex Deucher      2010-05-28  2240  		}
cb5fcbd540b438 Alex Deucher      2010-05-28  2241  		if (pkt->count) {
78857131387061 Marek Olšák       2012-03-19  2242  			uint64_t offset;
78857131387061 Marek Olšák       2012-03-19  2243  
012e976d42d281 Ilija Hadzic      2013-01-02  2244  			r = radeon_cs_packet_next_reloc(p, &reloc, 0);
cb5fcbd540b438 Alex Deucher      2010-05-28  2245  			if (r) {
b7c5334af69d35 Alex Deucher      2025-09-02  2246  				dev_warn_once(p->dev, "bad EVENT_WRITE\n");
cb5fcbd540b438 Alex Deucher      2010-05-28  2247  				return -EINVAL;
cb5fcbd540b438 Alex Deucher      2010-05-28  2248  			}
df0af4403aa8df Christian König   2014-03-03  2249  			offset = reloc->gpu_offset +
78857131387061 Marek Olšák       2012-03-19  2250  				 (radeon_get_ib_value(p, idx+1) & 0xfffffff8) +
78857131387061 Marek Olšák       2012-03-19  2251  				 ((u64)(radeon_get_ib_value(p, idx+2) & 0xff) << 32);
78857131387061 Marek Olšák       2012-03-19  2252  
78857131387061 Marek Olšák       2012-03-19  2253  			ib[idx+1] = offset & 0xfffffff8;
78857131387061 Marek Olšák       2012-03-19  2254  			ib[idx+2] = upper_32_bits(offset) & 0xff;
cb5fcbd540b438 Alex Deucher      2010-05-28  2255  		}
cb5fcbd540b438 Alex Deucher      2010-05-28  2256  		break;
cb5fcbd540b438 Alex Deucher      2010-05-28  2257  	case PACKET3_EVENT_WRITE_EOP:
78857131387061 Marek Olšák       2012-03-19  2258  	{
78857131387061 Marek Olšák       2012-03-19  2259  		uint64_t offset;
78857131387061 Marek Olšák       2012-03-19  2260  
cb5fcbd540b438 Alex Deucher      2010-05-28  2261  		if (pkt->count != 4) {
b7c5334af69d35 Alex Deucher      2025-09-02  2262  			dev_warn_once(p->dev, "bad EVENT_WRITE_EOP\n");
cb5fcbd540b438 Alex Deucher      2010-05-28  2263  			return -EINVAL;
cb5fcbd540b438 Alex Deucher      2010-05-28  2264  		}
012e976d42d281 Ilija Hadzic      2013-01-02  2265  		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
cb5fcbd540b438 Alex Deucher      2010-05-28  2266  		if (r) {
b7c5334af69d35 Alex Deucher      2025-09-02  2267  			dev_warn_once(p->dev, "bad EVENT_WRITE_EOP\n");
cb5fcbd540b438 Alex Deucher      2010-05-28  2268  			return -EINVAL;
cb5fcbd540b438 Alex Deucher      2010-05-28  2269  		}
78857131387061 Marek Olšák       2012-03-19  2270  
df0af4403aa8df Christian König   2014-03-03  2271  		offset = reloc->gpu_offset +
78857131387061 Marek Olšák       2012-03-19  2272  			 (radeon_get_ib_value(p, idx+1) & 0xfffffffc) +
78857131387061 Marek Olšák       2012-03-19  2273  			 ((u64)(radeon_get_ib_value(p, idx+2) & 0xff) << 32);
78857131387061 Marek Olšák       2012-03-19  2274  
78857131387061 Marek Olšák       2012-03-19  2275  		ib[idx+1] = offset & 0xfffffffc;
78857131387061 Marek Olšák       2012-03-19  2276  		ib[idx+2] = (ib[idx+2] & 0xffffff00) | (upper_32_bits(offset) & 0xff);
cb5fcbd540b438 Alex Deucher      2010-05-28  2277  		break;
78857131387061 Marek Olšák       2012-03-19  2278  	}
cb5fcbd540b438 Alex Deucher      2010-05-28  2279  	case PACKET3_EVENT_WRITE_EOS:
78857131387061 Marek Olšák       2012-03-19  2280  	{
78857131387061 Marek Olšák       2012-03-19  2281  		uint64_t offset;
78857131387061 Marek Olšák       2012-03-19  2282  
cb5fcbd540b438 Alex Deucher      2010-05-28  2283  		if (pkt->count != 3) {
b7c5334af69d35 Alex Deucher      2025-09-02  2284  			dev_warn_once(p->dev, "bad EVENT_WRITE_EOS\n");
cb5fcbd540b438 Alex Deucher      2010-05-28  2285  			return -EINVAL;
cb5fcbd540b438 Alex Deucher      2010-05-28  2286  		}
012e976d42d281 Ilija Hadzic      2013-01-02  2287  		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
cb5fcbd540b438 Alex Deucher      2010-05-28  2288  		if (r) {
b7c5334af69d35 Alex Deucher      2025-09-02  2289  			dev_warn_once(p->dev, "bad EVENT_WRITE_EOS\n");
cb5fcbd540b438 Alex Deucher      2010-05-28  2290  			return -EINVAL;
cb5fcbd540b438 Alex Deucher      2010-05-28  2291  		}
78857131387061 Marek Olšák       2012-03-19  2292  
df0af4403aa8df Christian König   2014-03-03  2293  		offset = reloc->gpu_offset +
78857131387061 Marek Olšák       2012-03-19  2294  			 (radeon_get_ib_value(p, idx+1) & 0xfffffffc) +
78857131387061 Marek Olšák       2012-03-19  2295  			 ((u64)(radeon_get_ib_value(p, idx+2) & 0xff) << 32);
78857131387061 Marek Olšák       2012-03-19  2296  
78857131387061 Marek Olšák       2012-03-19  2297  		ib[idx+1] = offset & 0xfffffffc;
78857131387061 Marek Olšák       2012-03-19  2298  		ib[idx+2] = (ib[idx+2] & 0xffffff00) | (upper_32_bits(offset) & 0xff);
cb5fcbd540b438 Alex Deucher      2010-05-28  2299  		break;
78857131387061 Marek Olšák       2012-03-19  2300  	}
cb5fcbd540b438 Alex Deucher      2010-05-28  2301  	case PACKET3_SET_CONFIG_REG:
cb5fcbd540b438 Alex Deucher      2010-05-28  2302  		start_reg = (idx_value << 2) + PACKET3_SET_CONFIG_REG_START;
cb5fcbd540b438 Alex Deucher      2010-05-28  2303  		end_reg = 4 * pkt->count + start_reg - 4;
cb5fcbd540b438 Alex Deucher      2010-05-28  2304  		if ((start_reg < PACKET3_SET_CONFIG_REG_START) ||
cb5fcbd540b438 Alex Deucher      2010-05-28  2305  		    (start_reg >= PACKET3_SET_CONFIG_REG_END) ||
cb5fcbd540b438 Alex Deucher      2010-05-28  2306  		    (end_reg >= PACKET3_SET_CONFIG_REG_END)) {
b7c5334af69d35 Alex Deucher      2025-09-02  2307  			dev_warn_once(p->dev, "bad PACKET3_SET_CONFIG_REG\n");
cb5fcbd540b438 Alex Deucher      2010-05-28  2308  			return -EINVAL;
cb5fcbd540b438 Alex Deucher      2010-05-28  2309  		}
7874d3901d752d Grazvydas Ignotas 2015-08-23  2310  		for (reg = start_reg, idx++; reg <= end_reg; reg += 4, idx++) {
e5b69da6badca8 Grazvydas Ignotas 2015-08-23  2311  			if (evergreen_is_safe_reg(p, reg))
e5b69da6badca8 Grazvydas Ignotas 2015-08-23  2312  				continue;
7874d3901d752d Grazvydas Ignotas 2015-08-23  2313  			r = evergreen_cs_handle_reg(p, reg, idx);
cb5fcbd540b438 Alex Deucher      2010-05-28  2314  			if (r)
cb5fcbd540b438 Alex Deucher      2010-05-28  2315  				return r;
cb5fcbd540b438 Alex Deucher      2010-05-28  2316  		}
cb5fcbd540b438 Alex Deucher      2010-05-28  2317  		break;
cb5fcbd540b438 Alex Deucher      2010-05-28  2318  	case PACKET3_SET_CONTEXT_REG:
cb5fcbd540b438 Alex Deucher      2010-05-28  2319  		start_reg = (idx_value << 2) + PACKET3_SET_CONTEXT_REG_START;
cb5fcbd540b438 Alex Deucher      2010-05-28  2320  		end_reg = 4 * pkt->count + start_reg - 4;
cb5fcbd540b438 Alex Deucher      2010-05-28  2321  		if ((start_reg < PACKET3_SET_CONTEXT_REG_START) ||
cb5fcbd540b438 Alex Deucher      2010-05-28  2322  		    (start_reg >= PACKET3_SET_CONTEXT_REG_END) ||
cb5fcbd540b438 Alex Deucher      2010-05-28  2323  		    (end_reg >= PACKET3_SET_CONTEXT_REG_END)) {
b7c5334af69d35 Alex Deucher      2025-09-02  2324  			dev_warn_once(p->dev, "bad PACKET3_SET_CONTEXT_REG\n");
cb5fcbd540b438 Alex Deucher      2010-05-28  2325  			return -EINVAL;
cb5fcbd540b438 Alex Deucher      2010-05-28  2326  		}
7874d3901d752d Grazvydas Ignotas 2015-08-23  2327  		for (reg = start_reg, idx++; reg <= end_reg; reg += 4, idx++) {
e5b69da6badca8 Grazvydas Ignotas 2015-08-23  2328  			if (evergreen_is_safe_reg(p, reg))
e5b69da6badca8 Grazvydas Ignotas 2015-08-23  2329  				continue;
7874d3901d752d Grazvydas Ignotas 2015-08-23  2330  			r = evergreen_cs_handle_reg(p, reg, idx);
cb5fcbd540b438 Alex Deucher      2010-05-28  2331  			if (r)
cb5fcbd540b438 Alex Deucher      2010-05-28  2332  				return r;
cb5fcbd540b438 Alex Deucher      2010-05-28  2333  		}
cb5fcbd540b438 Alex Deucher      2010-05-28  2334  		break;
cb5fcbd540b438 Alex Deucher      2010-05-28  2335  	case PACKET3_SET_RESOURCE:
cb5fcbd540b438 Alex Deucher      2010-05-28  2336  		if (pkt->count % 8) {
b7c5334af69d35 Alex Deucher      2025-09-02  2337  			dev_warn_once(p->dev, "bad SET_RESOURCE\n");
cb5fcbd540b438 Alex Deucher      2010-05-28  2338  			return -EINVAL;
cb5fcbd540b438 Alex Deucher      2010-05-28  2339  		}
cb5fcbd540b438 Alex Deucher      2010-05-28  2340  		start_reg = (idx_value << 2) + PACKET3_SET_RESOURCE_START;
cb5fcbd540b438 Alex Deucher      2010-05-28  2341  		end_reg = 4 * pkt->count + start_reg - 4;
cb5fcbd540b438 Alex Deucher      2010-05-28  2342  		if ((start_reg < PACKET3_SET_RESOURCE_START) ||
cb5fcbd540b438 Alex Deucher      2010-05-28  2343  		    (start_reg >= PACKET3_SET_RESOURCE_END) ||
cb5fcbd540b438 Alex Deucher      2010-05-28  2344  		    (end_reg >= PACKET3_SET_RESOURCE_END)) {
b7c5334af69d35 Alex Deucher      2025-09-02  2345  			dev_warn_once(p->dev, "bad SET_RESOURCE\n");
cb5fcbd540b438 Alex Deucher      2010-05-28  2346  			return -EINVAL;
cb5fcbd540b438 Alex Deucher      2010-05-28  2347  		}
cb5fcbd540b438 Alex Deucher      2010-05-28  2348  		for (i = 0; i < (pkt->count / 8); i++) {
cb5fcbd540b438 Alex Deucher      2010-05-28  2349  			struct radeon_bo *texture, *mipmap;
285484e2d55e76 Jerome Glisse     2011-12-16  2350  			u32 toffset, moffset;
61051afd3540da Marek Olšák       2012-09-25  2351  			u32 size, offset, mip_address, tex_dim;
cb5fcbd540b438 Alex Deucher      2010-05-28  2352  
cb5fcbd540b438 Alex Deucher      2010-05-28  2353  			switch (G__SQ_CONSTANT_TYPE(radeon_get_ib_value(p, idx+1+(i*8)+7))) {
cb5fcbd540b438 Alex Deucher      2010-05-28  2354  			case SQ_TEX_VTX_VALID_TEXTURE:
cb5fcbd540b438 Alex Deucher      2010-05-28  2355  				/* tex base */
012e976d42d281 Ilija Hadzic      2013-01-02  2356  				r = radeon_cs_packet_next_reloc(p, &reloc, 0);
cb5fcbd540b438 Alex Deucher      2010-05-28  2357  				if (r) {
b7c5334af69d35 Alex Deucher      2025-09-02  2358  					dev_warn_once(p->dev, "bad SET_RESOURCE (tex)\n");
cb5fcbd540b438 Alex Deucher      2010-05-28  2359  					return -EINVAL;
cb5fcbd540b438 Alex Deucher      2010-05-28  2360  				}
721604a15b934f Jerome Glisse     2012-01-05  2361  				if (!(p->cs_flags & RADEON_CS_KEEP_TILING_FLAGS)) {
f3a71df05082c8 Alex Deucher      2011-11-28  2362  					ib[idx+1+(i*8)+1] |=
df0af4403aa8df Christian König   2014-03-03  2363  						TEX_ARRAY_MODE(evergreen_cs_get_aray_mode(reloc->tiling_flags));
df0af4403aa8df Christian König   2014-03-03  2364  					if (reloc->tiling_flags & RADEON_TILING_MACRO) {
285484e2d55e76 Jerome Glisse     2011-12-16  2365  						unsigned bankw, bankh, mtaspect, tile_split;
285484e2d55e76 Jerome Glisse     2011-12-16  2366  
df0af4403aa8df Christian König   2014-03-03  2367  						evergreen_tiling_fields(reloc->tiling_flags,
285484e2d55e76 Jerome Glisse     2011-12-16  2368  									&bankw, &bankh, &mtaspect,
285484e2d55e76 Jerome Glisse     2011-12-16  2369  									&tile_split);
285484e2d55e76 Jerome Glisse     2011-12-16  2370  						ib[idx+1+(i*8)+6] |= TEX_TILE_SPLIT(tile_split);
f3a71df05082c8 Alex Deucher      2011-11-28  2371  						ib[idx+1+(i*8)+7] |=
285484e2d55e76 Jerome Glisse     2011-12-16  2372  							TEX_BANK_WIDTH(bankw) |
285484e2d55e76 Jerome Glisse     2011-12-16  2373  							TEX_BANK_HEIGHT(bankh) |
285484e2d55e76 Jerome Glisse     2011-12-16  2374  							MACRO_TILE_ASPECT(mtaspect) |
f3a71df05082c8 Alex Deucher      2011-11-28  2375  							TEX_NUM_BANKS(evergreen_cs_get_num_banks(track->nbanks));
f3a71df05082c8 Alex Deucher      2011-11-28  2376  					}
e70f224c1938af Marek Olšák       2011-10-25  2377  				}
cb5fcbd540b438 Alex Deucher      2010-05-28  2378  				texture = reloc->robj;
df0af4403aa8df Christian König   2014-03-03  2379  				toffset = (u32)((reloc->gpu_offset >> 8) & 0xffffffff);
61051afd3540da Marek Olšák       2012-09-25  2380  
cb5fcbd540b438 Alex Deucher      2010-05-28  2381  				/* tex mip base */
61051afd3540da Marek Olšák       2012-09-25  2382  				tex_dim = ib[idx+1+(i*8)+0] & 0x7;
61051afd3540da Marek Olšák       2012-09-25  2383  				mip_address = ib[idx+1+(i*8)+3];
61051afd3540da Marek Olšák       2012-09-25  2384  
61051afd3540da Marek Olšák       2012-09-25  2385  				if ((tex_dim == SQ_TEX_DIM_2D_MSAA || tex_dim == SQ_TEX_DIM_2D_ARRAY_MSAA) &&
61051afd3540da Marek Olšák       2012-09-25  2386  				    !mip_address &&
9ffb7a6dca4fd2 Ilija Hadzic      2013-01-02  2387  				    !radeon_cs_packet_next_is_pkt3_nop(p)) {
61051afd3540da Marek Olšák       2012-09-25  2388  					/* MIP_ADDRESS should point to FMASK for an MSAA texture.
61051afd3540da Marek Olšák       2012-09-25  2389  					 * It should be 0 if FMASK is disabled. */
61051afd3540da Marek Olšák       2012-09-25  2390  					moffset = 0;
61051afd3540da Marek Olšák       2012-09-25  2391  					mipmap = NULL;
61051afd3540da Marek Olšák       2012-09-25  2392  				} else {
012e976d42d281 Ilija Hadzic      2013-01-02  2393  					r = radeon_cs_packet_next_reloc(p, &reloc, 0);
cb5fcbd540b438 Alex Deucher      2010-05-28  2394  					if (r) {
b7c5334af69d35 Alex Deucher      2025-09-02  2395  						dev_warn_once(p->dev, "bad SET_RESOURCE (tex)\n");
cb5fcbd540b438 Alex Deucher      2010-05-28  2396  						return -EINVAL;
cb5fcbd540b438 Alex Deucher      2010-05-28  2397  					}
df0af4403aa8df Christian König   2014-03-03  2398  					moffset = (u32)((reloc->gpu_offset >> 8) & 0xffffffff);
cb5fcbd540b438 Alex Deucher      2010-05-28  2399  					mipmap = reloc->robj;
61051afd3540da Marek Olšák       2012-09-25  2400  				}
61051afd3540da Marek Olšák       2012-09-25  2401  
285484e2d55e76 Jerome Glisse     2011-12-16  2402  				r = evergreen_cs_track_validate_texture(p, texture, mipmap, idx+1+(i*8));
cb5fcbd540b438 Alex Deucher      2010-05-28  2403  				if (r)
cb5fcbd540b438 Alex Deucher      2010-05-28  2404  					return r;
285484e2d55e76 Jerome Glisse     2011-12-16  2405  				ib[idx+1+(i*8)+2] += toffset;
285484e2d55e76 Jerome Glisse     2011-12-16  2406  				ib[idx+1+(i*8)+3] += moffset;
cb5fcbd540b438 Alex Deucher      2010-05-28  2407  				break;
cb5fcbd540b438 Alex Deucher      2010-05-28  2408  			case SQ_TEX_VTX_VALID_BUFFER:
78857131387061 Marek Olšák       2012-03-19  2409  			{
78857131387061 Marek Olšák       2012-03-19  2410  				uint64_t offset64;
cb5fcbd540b438 Alex Deucher      2010-05-28  2411  				/* vtx base */
012e976d42d281 Ilija Hadzic      2013-01-02  2412  				r = radeon_cs_packet_next_reloc(p, &reloc, 0);
cb5fcbd540b438 Alex Deucher      2010-05-28  2413  				if (r) {
b7c5334af69d35 Alex Deucher      2025-09-02  2414  					dev_warn_once(p->dev, "bad SET_RESOURCE (vtx)\n");
cb5fcbd540b438 Alex Deucher      2010-05-28  2415  					return -EINVAL;
cb5fcbd540b438 Alex Deucher      2010-05-28  2416  				}
cb5fcbd540b438 Alex Deucher      2010-05-28  2417  				offset = radeon_get_ib_value(p, idx+1+(i*8)+0);
cb5fcbd540b438 Alex Deucher      2010-05-28  2418  				size = radeon_get_ib_value(p, idx+1+(i*8)+1);
cb5fcbd540b438 Alex Deucher      2010-05-28  2419  				if (p->rdev && (size + offset) > radeon_bo_size(reloc->robj)) {
cb5fcbd540b438 Alex Deucher      2010-05-28  2420  					/* force size to size of the buffer */
b7c5334af69d35 Alex Deucher      2025-09-02  2421  					dev_warn_once(p->dev, "vbo resource seems too big (%d) for the bo (%ld)\n",
b7c5334af69d35 Alex Deucher      2025-09-02  2422  						      size + offset, radeon_bo_size(reloc->robj));
78857131387061 Marek Olšák       2012-03-19  2423  					ib[idx+1+(i*8)+1] = radeon_bo_size(reloc->robj) - offset;
cb5fcbd540b438 Alex Deucher      2010-05-28  2424  				}
78857131387061 Marek Olšák       2012-03-19  2425  
df0af4403aa8df Christian König   2014-03-03  2426  				offset64 = reloc->gpu_offset + offset;
78857131387061 Marek Olšák       2012-03-19  2427  				ib[idx+1+(i*8)+0] = offset64;
78857131387061 Marek Olšák       2012-03-19  2428  				ib[idx+1+(i*8)+2] = (ib[idx+1+(i*8)+2] & 0xffffff00) |
78857131387061 Marek Olšák       2012-03-19  2429  						    (upper_32_bits(offset64) & 0xff);
cb5fcbd540b438 Alex Deucher      2010-05-28  2430  				break;
78857131387061 Marek Olšák       2012-03-19  2431  			}
cb5fcbd540b438 Alex Deucher      2010-05-28  2432  			case SQ_TEX_VTX_INVALID_TEXTURE:
cb5fcbd540b438 Alex Deucher      2010-05-28  2433  			case SQ_TEX_VTX_INVALID_BUFFER:
cb5fcbd540b438 Alex Deucher      2010-05-28  2434  			default:
b7c5334af69d35 Alex Deucher      2025-09-02  2435  				dev_warn_once(p->dev, "bad SET_RESOURCE\n");
cb5fcbd540b438 Alex Deucher      2010-05-28  2436  				return -EINVAL;
cb5fcbd540b438 Alex Deucher      2010-05-28  2437  			}
cb5fcbd540b438 Alex Deucher      2010-05-28  2438  		}
cb5fcbd540b438 Alex Deucher      2010-05-28  2439  		break;
cb5fcbd540b438 Alex Deucher      2010-05-28  2440  	case PACKET3_SET_ALU_CONST:
cb5fcbd540b438 Alex Deucher      2010-05-28  2441  		/* XXX fix me ALU const buffers only */
cb5fcbd540b438 Alex Deucher      2010-05-28  2442  		break;
cb5fcbd540b438 Alex Deucher      2010-05-28  2443  	case PACKET3_SET_BOOL_CONST:
cb5fcbd540b438 Alex Deucher      2010-05-28  2444  		start_reg = (idx_value << 2) + PACKET3_SET_BOOL_CONST_START;
cb5fcbd540b438 Alex Deucher      2010-05-28  2445  		end_reg = 4 * pkt->count + start_reg - 4;
cb5fcbd540b438 Alex Deucher      2010-05-28  2446  		if ((start_reg < PACKET3_SET_BOOL_CONST_START) ||
cb5fcbd540b438 Alex Deucher      2010-05-28  2447  		    (start_reg >= PACKET3_SET_BOOL_CONST_END) ||
cb5fcbd540b438 Alex Deucher      2010-05-28  2448  		    (end_reg >= PACKET3_SET_BOOL_CONST_END)) {
b7c5334af69d35 Alex Deucher      2025-09-02  2449  			dev_warn_once(p->dev, "bad SET_BOOL_CONST\n");
cb5fcbd540b438 Alex Deucher      2010-05-28  2450  			return -EINVAL;
cb5fcbd540b438 Alex Deucher      2010-05-28  2451  		}
cb5fcbd540b438 Alex Deucher      2010-05-28  2452  		break;
cb5fcbd540b438 Alex Deucher      2010-05-28  2453  	case PACKET3_SET_LOOP_CONST:
cb5fcbd540b438 Alex Deucher      2010-05-28  2454  		start_reg = (idx_value << 2) + PACKET3_SET_LOOP_CONST_START;
cb5fcbd540b438 Alex Deucher      2010-05-28  2455  		end_reg = 4 * pkt->count + start_reg - 4;
cb5fcbd540b438 Alex Deucher      2010-05-28  2456  		if ((start_reg < PACKET3_SET_LOOP_CONST_START) ||
cb5fcbd540b438 Alex Deucher      2010-05-28  2457  		    (start_reg >= PACKET3_SET_LOOP_CONST_END) ||
cb5fcbd540b438 Alex Deucher      2010-05-28  2458  		    (end_reg >= PACKET3_SET_LOOP_CONST_END)) {
b7c5334af69d35 Alex Deucher      2025-09-02  2459  			dev_warn_once(p->dev, "bad SET_LOOP_CONST\n");
cb5fcbd540b438 Alex Deucher      2010-05-28  2460  			return -EINVAL;
cb5fcbd540b438 Alex Deucher      2010-05-28  2461  		}
cb5fcbd540b438 Alex Deucher      2010-05-28  2462  		break;
cb5fcbd540b438 Alex Deucher      2010-05-28  2463  	case PACKET3_SET_CTL_CONST:
cb5fcbd540b438 Alex Deucher      2010-05-28  2464  		start_reg = (idx_value << 2) + PACKET3_SET_CTL_CONST_START;
cb5fcbd540b438 Alex Deucher      2010-05-28  2465  		end_reg = 4 * pkt->count + start_reg - 4;
cb5fcbd540b438 Alex Deucher      2010-05-28  2466  		if ((start_reg < PACKET3_SET_CTL_CONST_START) ||
cb5fcbd540b438 Alex Deucher      2010-05-28  2467  		    (start_reg >= PACKET3_SET_CTL_CONST_END) ||
cb5fcbd540b438 Alex Deucher      2010-05-28  2468  		    (end_reg >= PACKET3_SET_CTL_CONST_END)) {
b7c5334af69d35 Alex Deucher      2025-09-02  2469  			dev_warn_once(p->dev, "bad SET_CTL_CONST\n");
cb5fcbd540b438 Alex Deucher      2010-05-28  2470  			return -EINVAL;
cb5fcbd540b438 Alex Deucher      2010-05-28  2471  		}
cb5fcbd540b438 Alex Deucher      2010-05-28  2472  		break;
cb5fcbd540b438 Alex Deucher      2010-05-28  2473  	case PACKET3_SET_SAMPLER:
cb5fcbd540b438 Alex Deucher      2010-05-28  2474  		if (pkt->count % 3) {
b7c5334af69d35 Alex Deucher      2025-09-02  2475  			dev_warn_once(p->dev, "bad SET_SAMPLER\n");
cb5fcbd540b438 Alex Deucher      2010-05-28  2476  			return -EINVAL;
cb5fcbd540b438 Alex Deucher      2010-05-28  2477  		}
cb5fcbd540b438 Alex Deucher      2010-05-28  2478  		start_reg = (idx_value << 2) + PACKET3_SET_SAMPLER_START;
cb5fcbd540b438 Alex Deucher      2010-05-28  2479  		end_reg = 4 * pkt->count + start_reg - 4;
cb5fcbd540b438 Alex Deucher      2010-05-28  2480  		if ((start_reg < PACKET3_SET_SAMPLER_START) ||
cb5fcbd540b438 Alex Deucher      2010-05-28  2481  		    (start_reg >= PACKET3_SET_SAMPLER_END) ||
cb5fcbd540b438 Alex Deucher      2010-05-28  2482  		    (end_reg >= PACKET3_SET_SAMPLER_END)) {
b7c5334af69d35 Alex Deucher      2025-09-02  2483  			dev_warn_once(p->dev, "bad SET_SAMPLER\n");
cb5fcbd540b438 Alex Deucher      2010-05-28  2484  			return -EINVAL;
cb5fcbd540b438 Alex Deucher      2010-05-28  2485  		}
cb5fcbd540b438 Alex Deucher      2010-05-28  2486  		break;
dd220a00e8bd5a Marek Olšák       2012-01-27  2487  	case PACKET3_STRMOUT_BUFFER_UPDATE:
dd220a00e8bd5a Marek Olšák       2012-01-27  2488  		if (pkt->count != 4) {
b7c5334af69d35 Alex Deucher      2025-09-02  2489  			dev_warn_once(p->dev, "bad STRMOUT_BUFFER_UPDATE (invalid count)\n");
dd220a00e8bd5a Marek Olšák       2012-01-27  2490  			return -EINVAL;
dd220a00e8bd5a Marek Olšák       2012-01-27  2491  		}
dd220a00e8bd5a Marek Olšák       2012-01-27  2492  		/* Updating memory at DST_ADDRESS. */
dd220a00e8bd5a Marek Olšák       2012-01-27  2493  		if (idx_value & 0x1) {
dd220a00e8bd5a Marek Olšák       2012-01-27  2494  			u64 offset;
012e976d42d281 Ilija Hadzic      2013-01-02  2495  			r = radeon_cs_packet_next_reloc(p, &reloc, 0);
dd220a00e8bd5a Marek Olšák       2012-01-27  2496  			if (r) {
b7c5334af69d35 Alex Deucher      2025-09-02  2497  				dev_warn_once(p->dev, "bad STRMOUT_BUFFER_UPDATE (missing dst reloc)\n");
dd220a00e8bd5a Marek Olšák       2012-01-27  2498  				return -EINVAL;
dd220a00e8bd5a Marek Olšák       2012-01-27  2499  			}
dd220a00e8bd5a Marek Olšák       2012-01-27  2500  			offset = radeon_get_ib_value(p, idx+1);
dd220a00e8bd5a Marek Olšák       2012-01-27  2501  			offset += ((u64)(radeon_get_ib_value(p, idx+2) & 0xff)) << 32;
dd220a00e8bd5a Marek Olšák       2012-01-27  2502  			if ((offset + 4) > radeon_bo_size(reloc->robj)) {
b7c5334af69d35 Alex Deucher      2025-09-02  2503  				dev_warn_once(p->dev, "bad STRMOUT_BUFFER_UPDATE dst bo too small: 0x%llx, 0x%lx\n",
dd220a00e8bd5a Marek Olšák       2012-01-27  2504  					      offset + 4, radeon_bo_size(reloc->robj));
dd220a00e8bd5a Marek Olšák       2012-01-27  2505  				return -EINVAL;
dd220a00e8bd5a Marek Olšák       2012-01-27  2506  			}
df0af4403aa8df Christian König   2014-03-03  2507  			offset += reloc->gpu_offset;
78857131387061 Marek Olšák       2012-03-19  2508  			ib[idx+1] = offset;
78857131387061 Marek Olšák       2012-03-19  2509  			ib[idx+2] = upper_32_bits(offset) & 0xff;
dd220a00e8bd5a Marek Olšák       2012-01-27  2510  		}
dd220a00e8bd5a Marek Olšák       2012-01-27  2511  		/* Reading data from SRC_ADDRESS. */
dd220a00e8bd5a Marek Olšák       2012-01-27  2512  		if (((idx_value >> 1) & 0x3) == 2) {
dd220a00e8bd5a Marek Olšák       2012-01-27  2513  			u64 offset;
012e976d42d281 Ilija Hadzic      2013-01-02  2514  			r = radeon_cs_packet_next_reloc(p, &reloc, 0);
dd220a00e8bd5a Marek Olšák       2012-01-27  2515  			if (r) {
b7c5334af69d35 Alex Deucher      2025-09-02  2516  				dev_warn_once(p->dev, "bad STRMOUT_BUFFER_UPDATE (missing src reloc)\n");
dd220a00e8bd5a Marek Olšák       2012-01-27  2517  				return -EINVAL;
dd220a00e8bd5a Marek Olšák       2012-01-27  2518  			}
dd220a00e8bd5a Marek Olšák       2012-01-27  2519  			offset = radeon_get_ib_value(p, idx+3);
dd220a00e8bd5a Marek Olšák       2012-01-27  2520  			offset += ((u64)(radeon_get_ib_value(p, idx+4) & 0xff)) << 32;
dd220a00e8bd5a Marek Olšák       2012-01-27  2521  			if ((offset + 4) > radeon_bo_size(reloc->robj)) {
b7c5334af69d35 Alex Deucher      2025-09-02  2522  				dev_warn_once(p->dev, "bad STRMOUT_BUFFER_UPDATE src bo too small: 0x%llx, 0x%lx\n",
dd220a00e8bd5a Marek Olšák       2012-01-27  2523  					      offset + 4, radeon_bo_size(reloc->robj));
dd220a00e8bd5a Marek Olšák       2012-01-27  2524  				return -EINVAL;
dd220a00e8bd5a Marek Olšák       2012-01-27  2525  			}
df0af4403aa8df Christian König   2014-03-03  2526  			offset += reloc->gpu_offset;
78857131387061 Marek Olšák       2012-03-19  2527  			ib[idx+3] = offset;
78857131387061 Marek Olšák       2012-03-19  2528  			ib[idx+4] = upper_32_bits(offset) & 0xff;
dd220a00e8bd5a Marek Olšák       2012-01-27  2529  		}
dd220a00e8bd5a Marek Olšák       2012-01-27  2530  		break;
4613ca14b97394 Jerome Glisse     2012-12-19  2531  	case PACKET3_MEM_WRITE:
4613ca14b97394 Jerome Glisse     2012-12-19  2532  	{
4613ca14b97394 Jerome Glisse     2012-12-19  2533  		u64 offset;
4613ca14b97394 Jerome Glisse     2012-12-19  2534  
4613ca14b97394 Jerome Glisse     2012-12-19  2535  		if (pkt->count != 3) {
b7c5334af69d35 Alex Deucher      2025-09-02  2536  			dev_warn_once(p->dev, "bad MEM_WRITE (invalid count)\n");
4613ca14b97394 Jerome Glisse     2012-12-19  2537  			return -EINVAL;
4613ca14b97394 Jerome Glisse     2012-12-19  2538  		}
012e976d42d281 Ilija Hadzic      2013-01-02  2539  		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
4613ca14b97394 Jerome Glisse     2012-12-19  2540  		if (r) {
b7c5334af69d35 Alex Deucher      2025-09-02  2541  			dev_warn_once(p->dev, "bad MEM_WRITE (missing reloc)\n");
4613ca14b97394 Jerome Glisse     2012-12-19  2542  			return -EINVAL;
4613ca14b97394 Jerome Glisse     2012-12-19  2543  		}
4613ca14b97394 Jerome Glisse     2012-12-19  2544  		offset = radeon_get_ib_value(p, idx+0);
4613ca14b97394 Jerome Glisse     2012-12-19  2545  		offset += ((u64)(radeon_get_ib_value(p, idx+1) & 0xff)) << 32UL;
4613ca14b97394 Jerome Glisse     2012-12-19  2546  		if (offset & 0x7) {
b7c5334af69d35 Alex Deucher      2025-09-02  2547  			dev_warn_once(p->dev, "bad MEM_WRITE (address not qwords aligned)\n");
4613ca14b97394 Jerome Glisse     2012-12-19  2548  			return -EINVAL;
4613ca14b97394 Jerome Glisse     2012-12-19  2549  		}
4613ca14b97394 Jerome Glisse     2012-12-19  2550  		if ((offset + 8) > radeon_bo_size(reloc->robj)) {
b7c5334af69d35 Alex Deucher      2025-09-02  2551  			dev_warn_once(p->dev, "bad MEM_WRITE bo too small: 0x%llx, 0x%lx\n",
4613ca14b97394 Jerome Glisse     2012-12-19  2552  				      offset + 8, radeon_bo_size(reloc->robj));
4613ca14b97394 Jerome Glisse     2012-12-19  2553  			return -EINVAL;
4613ca14b97394 Jerome Glisse     2012-12-19  2554  		}
df0af4403aa8df Christian König   2014-03-03  2555  		offset += reloc->gpu_offset;
4613ca14b97394 Jerome Glisse     2012-12-19  2556  		ib[idx+0] = offset;
4613ca14b97394 Jerome Glisse     2012-12-19  2557  		ib[idx+1] = upper_32_bits(offset) & 0xff;
4613ca14b97394 Jerome Glisse     2012-12-19  2558  		break;
4613ca14b97394 Jerome Glisse     2012-12-19  2559  	}
dd220a00e8bd5a Marek Olšák       2012-01-27  2560  	case PACKET3_COPY_DW:
dd220a00e8bd5a Marek Olšák       2012-01-27  2561  		if (pkt->count != 4) {
b7c5334af69d35 Alex Deucher      2025-09-02  2562  			dev_warn_once(p->dev, "bad COPY_DW (invalid count)\n");
dd220a00e8bd5a Marek Olšák       2012-01-27  2563  			return -EINVAL;
dd220a00e8bd5a Marek Olšák       2012-01-27  2564  		}
dd220a00e8bd5a Marek Olšák       2012-01-27  2565  		if (idx_value & 0x1) {
dd220a00e8bd5a Marek Olšák       2012-01-27  2566  			u64 offset;
dd220a00e8bd5a Marek Olšák       2012-01-27  2567  			/* SRC is memory. */
012e976d42d281 Ilija Hadzic      2013-01-02  2568  			r = radeon_cs_packet_next_reloc(p, &reloc, 0);
dd220a00e8bd5a Marek Olšák       2012-01-27  2569  			if (r) {
b7c5334af69d35 Alex Deucher      2025-09-02  2570  				dev_warn_once(p->dev, "bad COPY_DW (missing src reloc)\n");
dd220a00e8bd5a Marek Olšák       2012-01-27  2571  				return -EINVAL;
dd220a00e8bd5a Marek Olšák       2012-01-27  2572  			}
dd220a00e8bd5a Marek Olšák       2012-01-27  2573  			offset = radeon_get_ib_value(p, idx+1);
dd220a00e8bd5a Marek Olšák       2012-01-27  2574  			offset += ((u64)(radeon_get_ib_value(p, idx+2) & 0xff)) << 32;
dd220a00e8bd5a Marek Olšák       2012-01-27  2575  			if ((offset + 4) > radeon_bo_size(reloc->robj)) {
b7c5334af69d35 Alex Deucher      2025-09-02  2576  				dev_warn_once(p->dev, "bad COPY_DW src bo too small: 0x%llx, 0x%lx\n",
dd220a00e8bd5a Marek Olšák       2012-01-27  2577  					      offset + 4, radeon_bo_size(reloc->robj));
dd220a00e8bd5a Marek Olšák       2012-01-27  2578  				return -EINVAL;
dd220a00e8bd5a Marek Olšák       2012-01-27  2579  			}
df0af4403aa8df Christian König   2014-03-03  2580  			offset += reloc->gpu_offset;
78857131387061 Marek Olšák       2012-03-19  2581  			ib[idx+1] = offset;
78857131387061 Marek Olšák       2012-03-19  2582  			ib[idx+2] = upper_32_bits(offset) & 0xff;
dd220a00e8bd5a Marek Olšák       2012-01-27  2583  		} else {
dd220a00e8bd5a Marek Olšák       2012-01-27  2584  			/* SRC is a reg. */
dd220a00e8bd5a Marek Olšák       2012-01-27  2585  			reg = radeon_get_ib_value(p, idx+1) << 2;
e5b69da6badca8 Grazvydas Ignotas 2015-08-23  2586  			if (!evergreen_is_safe_reg(p, reg)) {
b7c5334af69d35 Alex Deucher      2025-09-02  2587  				dev_warn_once(p->dev, "forbidden register 0x%08x at %d\n",
e5b69da6badca8 Grazvydas Ignotas 2015-08-23  2588  					      reg, idx + 1);
dd220a00e8bd5a Marek Olšák       2012-01-27  2589  				return -EINVAL;
dd220a00e8bd5a Marek Olšák       2012-01-27  2590  			}
e5b69da6badca8 Grazvydas Ignotas 2015-08-23  2591  		}
dd220a00e8bd5a Marek Olšák       2012-01-27  2592  		if (idx_value & 0x2) {
dd220a00e8bd5a Marek Olšák       2012-01-27  2593  			u64 offset;
dd220a00e8bd5a Marek Olšák       2012-01-27  2594  			/* DST is memory. */
012e976d42d281 Ilija Hadzic      2013-01-02  2595  			r = radeon_cs_packet_next_reloc(p, &reloc, 0);
dd220a00e8bd5a Marek Olšák       2012-01-27  2596  			if (r) {
b7c5334af69d35 Alex Deucher      2025-09-02  2597  				dev_warn_once(p->dev, "bad COPY_DW (missing dst reloc)\n");
dd220a00e8bd5a Marek Olšák       2012-01-27  2598  				return -EINVAL;
dd220a00e8bd5a Marek Olšák       2012-01-27  2599  			}
dd220a00e8bd5a Marek Olšák       2012-01-27  2600  			offset = radeon_get_ib_value(p, idx+3);
dd220a00e8bd5a Marek Olšák       2012-01-27  2601  			offset += ((u64)(radeon_get_ib_value(p, idx+4) & 0xff)) << 32;
dd220a00e8bd5a Marek Olšák       2012-01-27  2602  			if ((offset + 4) > radeon_bo_size(reloc->robj)) {
b7c5334af69d35 Alex Deucher      2025-09-02  2603  				dev_warn_once(p->dev, "bad COPY_DW dst bo too small: 0x%llx, 0x%lx\n",
dd220a00e8bd5a Marek Olšák       2012-01-27  2604  					      offset + 4, radeon_bo_size(reloc->robj));
dd220a00e8bd5a Marek Olšák       2012-01-27  2605  				return -EINVAL;
dd220a00e8bd5a Marek Olšák       2012-01-27  2606  			}
df0af4403aa8df Christian König   2014-03-03  2607  			offset += reloc->gpu_offset;
78857131387061 Marek Olšák       2012-03-19  2608  			ib[idx+3] = offset;
78857131387061 Marek Olšák       2012-03-19  2609  			ib[idx+4] = upper_32_bits(offset) & 0xff;
dd220a00e8bd5a Marek Olšák       2012-01-27  2610  		} else {
dd220a00e8bd5a Marek Olšák       2012-01-27  2611  			/* DST is a reg. */
dd220a00e8bd5a Marek Olšák       2012-01-27  2612  			reg = radeon_get_ib_value(p, idx+3) << 2;
e5b69da6badca8 Grazvydas Ignotas 2015-08-23  2613  			if (!evergreen_is_safe_reg(p, reg)) {
b7c5334af69d35 Alex Deucher      2025-09-02  2614  				dev_warn_once(p->dev, "forbidden register 0x%08x at %d\n",
e5b69da6badca8 Grazvydas Ignotas 2015-08-23  2615  					      reg, idx + 3);
dd220a00e8bd5a Marek Olšák       2012-01-27  2616  				return -EINVAL;
dd220a00e8bd5a Marek Olšák       2012-01-27  2617  			}
e5b69da6badca8 Grazvydas Ignotas 2015-08-23  2618  		}
dd220a00e8bd5a Marek Olšák       2012-01-27  2619  		break;
8c4f2bbd66784f Dave Airlie       2016-04-07  2620  	case PACKET3_SET_APPEND_CNT:
8c4f2bbd66784f Dave Airlie       2016-04-07  2621  	{
8c4f2bbd66784f Dave Airlie       2016-04-07  2622  		uint32_t areg;
8c4f2bbd66784f Dave Airlie       2016-04-07  2623  		uint32_t allowed_reg_base;
8c4f2bbd66784f Dave Airlie       2016-04-07  2624  		uint32_t source_sel;
8c4f2bbd66784f Dave Airlie       2016-04-07  2625  		if (pkt->count != 2) {
b7c5334af69d35 Alex Deucher      2025-09-02  2626  			dev_warn_once(p->dev, "bad SET_APPEND_CNT (invalid count)\n");
8c4f2bbd66784f Dave Airlie       2016-04-07  2627  			return -EINVAL;
8c4f2bbd66784f Dave Airlie       2016-04-07  2628  		}
8c4f2bbd66784f Dave Airlie       2016-04-07  2629  
8c4f2bbd66784f Dave Airlie       2016-04-07  2630  		allowed_reg_base = GDS_APPEND_COUNT_0;
8c4f2bbd66784f Dave Airlie       2016-04-07  2631  		allowed_reg_base -= PACKET3_SET_CONTEXT_REG_START;
8c4f2bbd66784f Dave Airlie       2016-04-07  2632  		allowed_reg_base >>= 2;
8c4f2bbd66784f Dave Airlie       2016-04-07  2633  
8c4f2bbd66784f Dave Airlie       2016-04-07  2634  		areg = idx_value >> 16;
8c4f2bbd66784f Dave Airlie       2016-04-07  2635  		if (areg < allowed_reg_base || areg > (allowed_reg_base + 11)) {
b7c5334af69d35 Alex Deucher      2025-09-02  2636  			dev_warn_once(p->dev, "forbidden register for append cnt 0x%08x at %d\n",
8c4f2bbd66784f Dave Airlie       2016-04-07  2637  				      areg, idx);
8c4f2bbd66784f Dave Airlie       2016-04-07  2638  			return -EINVAL;
8c4f2bbd66784f Dave Airlie       2016-04-07  2639  		}
8c4f2bbd66784f Dave Airlie       2016-04-07  2640  
8c4f2bbd66784f Dave Airlie       2016-04-07  2641  		source_sel = G_PACKET3_SET_APPEND_CNT_SRC_SELECT(idx_value);
8c4f2bbd66784f Dave Airlie       2016-04-07  2642  		if (source_sel == PACKET3_SAC_SRC_SEL_MEM) {
8c4f2bbd66784f Dave Airlie       2016-04-07  2643  			uint64_t offset;
8c4f2bbd66784f Dave Airlie       2016-04-07  2644  			uint32_t swap;
8c4f2bbd66784f Dave Airlie       2016-04-07  2645  			r = radeon_cs_packet_next_reloc(p, &reloc, 0);
8c4f2bbd66784f Dave Airlie       2016-04-07  2646  			if (r) {
b7c5334af69d35 Alex Deucher      2025-09-02  2647  				dev_warn_once(p->dev, "bad SET_APPEND_CNT (missing reloc)\n");
8c4f2bbd66784f Dave Airlie       2016-04-07  2648  				return -EINVAL;
8c4f2bbd66784f Dave Airlie       2016-04-07  2649  			}
8c4f2bbd66784f Dave Airlie       2016-04-07  2650  			offset = radeon_get_ib_value(p, idx + 1);
8c4f2bbd66784f Dave Airlie       2016-04-07  2651  			swap = offset & 0x3;
8c4f2bbd66784f Dave Airlie       2016-04-07  2652  			offset &= ~0x3;
8c4f2bbd66784f Dave Airlie       2016-04-07  2653  
8c4f2bbd66784f Dave Airlie       2016-04-07  2654  			offset += ((u64)(radeon_get_ib_value(p, idx + 2) & 0xff)) << 32;
8c4f2bbd66784f Dave Airlie       2016-04-07  2655  
8c4f2bbd66784f Dave Airlie       2016-04-07  2656  			offset += reloc->gpu_offset;
8c4f2bbd66784f Dave Airlie       2016-04-07  2657  			ib[idx+1] = (offset & 0xfffffffc) | swap;
8c4f2bbd66784f Dave Airlie       2016-04-07  2658  			ib[idx+2] = upper_32_bits(offset) & 0xff;
8c4f2bbd66784f Dave Airlie       2016-04-07  2659  		} else {
b7c5334af69d35 Alex Deucher      2025-09-02  2660  			dev_warn_once(p->dev, "bad SET_APPEND_CNT (unsupported operation)\n");
8c4f2bbd66784f Dave Airlie       2016-04-07  2661  			return -EINVAL;
8c4f2bbd66784f Dave Airlie       2016-04-07  2662  		}
8c4f2bbd66784f Dave Airlie       2016-04-07  2663  		break;
8c4f2bbd66784f Dave Airlie       2016-04-07  2664  	}
6a117dc39a7421 Patrick Lerda     2025-06-10  2665  	case PACKET3_COND_EXEC:
6a117dc39a7421 Patrick Lerda     2025-06-10  2666  	{
6a117dc39a7421 Patrick Lerda     2025-06-10  2667  		u64 offset;
6a117dc39a7421 Patrick Lerda     2025-06-10  2668  
6a117dc39a7421 Patrick Lerda     2025-06-10  2669  		if (pkt->count != 2) {
b7c5334af69d35 Alex Deucher      2025-09-02  2670  			dev_warn_once(p->dev, "bad COND_EXEC (invalid count)\n");
6a117dc39a7421 Patrick Lerda     2025-06-10  2671  			return -EINVAL;
6a117dc39a7421 Patrick Lerda     2025-06-10  2672  		}
6a117dc39a7421 Patrick Lerda     2025-06-10  2673  		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
6a117dc39a7421 Patrick Lerda     2025-06-10  2674  		if (r) {
b7c5334af69d35 Alex Deucher      2025-09-02  2675  			dev_warn_once(p->dev, "bad COND_EXEC (missing reloc)\n");
6a117dc39a7421 Patrick Lerda     2025-06-10  2676  			return -EINVAL;
6a117dc39a7421 Patrick Lerda     2025-06-10  2677  		}
6a117dc39a7421 Patrick Lerda     2025-06-10  2678  		offset = radeon_get_ib_value(p, idx + 0);
6a117dc39a7421 Patrick Lerda     2025-06-10  2679  		offset += ((u64)(radeon_get_ib_value(p, idx + 1) & 0xff)) << 32UL;
6a117dc39a7421 Patrick Lerda     2025-06-10  2680  		if (offset & 0x7) {
b7c5334af69d35 Alex Deucher      2025-09-02  2681  			dev_warn_once(p->dev, "bad COND_EXEC (address not qwords aligned)\n");
6a117dc39a7421 Patrick Lerda     2025-06-10  2682  			return -EINVAL;
6a117dc39a7421 Patrick Lerda     2025-06-10  2683  		}
6a117dc39a7421 Patrick Lerda     2025-06-10  2684  		if ((offset + 8) > radeon_bo_size(reloc->robj)) {
b7c5334af69d35 Alex Deucher      2025-09-02  2685  			dev_warn_once(p->dev, "bad COND_EXEC bo too small: 0x%llx, 0x%lx\n",
6a117dc39a7421 Patrick Lerda     2025-06-10  2686  				      offset + 8, radeon_bo_size(reloc->robj));
6a117dc39a7421 Patrick Lerda     2025-06-10  2687  			return -EINVAL;
6a117dc39a7421 Patrick Lerda     2025-06-10  2688  		}
6a117dc39a7421 Patrick Lerda     2025-06-10  2689  		offset += reloc->gpu_offset;
6a117dc39a7421 Patrick Lerda     2025-06-10  2690  		ib[idx + 0] = offset;
6a117dc39a7421 Patrick Lerda     2025-06-10  2691  		ib[idx + 1] = upper_32_bits(offset) & 0xff;
6a117dc39a7421 Patrick Lerda     2025-06-10  2692  		break;
6a117dc39a7421 Patrick Lerda     2025-06-10  2693  	}
6a117dc39a7421 Patrick Lerda     2025-06-10  2694  	case PACKET3_COND_WRITE:
6a117dc39a7421 Patrick Lerda     2025-06-10  2695  		if (pkt->count != 7) {
b7c5334af69d35 Alex Deucher      2025-09-02  2696  			dev_warn_once(p->dev, "bad COND_WRITE (invalid count)\n");
6a117dc39a7421 Patrick Lerda     2025-06-10  2697  			return -EINVAL;
6a117dc39a7421 Patrick Lerda     2025-06-10  2698  		}
6a117dc39a7421 Patrick Lerda     2025-06-10  2699  		if (idx_value & 0x10) {
6a117dc39a7421 Patrick Lerda     2025-06-10  2700  			u64 offset;
6a117dc39a7421 Patrick Lerda     2025-06-10  2701  			/* POLL is memory. */
6a117dc39a7421 Patrick Lerda     2025-06-10  2702  			r = radeon_cs_packet_next_reloc(p, &reloc, 0);
6a117dc39a7421 Patrick Lerda     2025-06-10  2703  			if (r) {
b7c5334af69d35 Alex Deucher      2025-09-02  2704  				dev_warn_once(p->dev, "bad COND_WRITE (missing src reloc)\n");
6a117dc39a7421 Patrick Lerda     2025-06-10 @2705  				return -EINVAL;
6a117dc39a7421 Patrick Lerda     2025-06-10  2706  			}
6a117dc39a7421 Patrick Lerda     2025-06-10  2707  			offset = radeon_get_ib_value(p, idx + 1);
6a117dc39a7421 Patrick Lerda     2025-06-10  2708  			offset += ((u64)(radeon_get_ib_value(p, idx + 2) & 0xff)) << 32;
6a117dc39a7421 Patrick Lerda     2025-06-10  2709  			if ((offset + 8) > radeon_bo_size(reloc->robj)) {
b7c5334af69d35 Alex Deucher      2025-09-02  2710  				dev_warn_once(p->dev, "bad COND_WRITE src bo too small: 0x%llx, 0x%lx\n",
6a117dc39a7421 Patrick Lerda     2025-06-10  2711  					      offset + 8, radeon_bo_size(reloc->robj));
6a117dc39a7421 Patrick Lerda     2025-06-10  2712  				return -EINVAL;
6a117dc39a7421 Patrick Lerda     2025-06-10  2713  			}
6a117dc39a7421 Patrick Lerda     2025-06-10  2714  			offset += reloc->gpu_offset;
6a117dc39a7421 Patrick Lerda     2025-06-10  2715  			ib[idx + 1] = offset;
6a117dc39a7421 Patrick Lerda     2025-06-10  2716  			ib[idx + 2] = upper_32_bits(offset) & 0xff;
6a117dc39a7421 Patrick Lerda     2025-06-10  2717  		} else {
6a117dc39a7421 Patrick Lerda     2025-06-10  2718  			/* POLL is a reg. */
6a117dc39a7421 Patrick Lerda     2025-06-10  2719  			reg = radeon_get_ib_value(p, idx + 1) << 2;
6a117dc39a7421 Patrick Lerda     2025-06-10  2720  			if (!evergreen_is_safe_reg(p, reg)) {
b7c5334af69d35 Alex Deucher      2025-09-02  2721  				dev_warn_once(p->dev, "forbidden register 0x%08x at %d\n",
6a117dc39a7421 Patrick Lerda     2025-06-10  2722  					      reg, idx + 1);
6a117dc39a7421 Patrick Lerda     2025-06-10  2723  				return -EINVAL;
6a117dc39a7421 Patrick Lerda     2025-06-10  2724  			}
6a117dc39a7421 Patrick Lerda     2025-06-10  2725  		}
6a117dc39a7421 Patrick Lerda     2025-06-10  2726  		if (idx_value & 0x100) {
6a117dc39a7421 Patrick Lerda     2025-06-10  2727  			u64 offset;
6a117dc39a7421 Patrick Lerda     2025-06-10  2728  			/* WRITE is memory. */
6a117dc39a7421 Patrick Lerda     2025-06-10  2729  			r = radeon_cs_packet_next_reloc(p, &reloc, 0);
6a117dc39a7421 Patrick Lerda     2025-06-10  2730  			if (r) {
b7c5334af69d35 Alex Deucher      2025-09-02  2731  				dev_warn_once(p->dev, "bad COND_WRITE (missing dst reloc)\n");
6a117dc39a7421 Patrick Lerda     2025-06-10  2732  				return -EINVAL;
6a117dc39a7421 Patrick Lerda     2025-06-10  2733  			}
6a117dc39a7421 Patrick Lerda     2025-06-10  2734  			offset = radeon_get_ib_value(p, idx + 5);
6a117dc39a7421 Patrick Lerda     2025-06-10  2735  			offset += ((u64)(radeon_get_ib_value(p, idx + 6) & 0xff)) << 32;
6a117dc39a7421 Patrick Lerda     2025-06-10  2736  			if ((offset + 8) > radeon_bo_size(reloc->robj)) {
b7c5334af69d35 Alex Deucher      2025-09-02  2737  				dev_warn_once(p->dev, "bad COND_WRITE dst bo too small: 0x%llx, 0x%lx\n",
6a117dc39a7421 Patrick Lerda     2025-06-10  2738  					      offset + 8, radeon_bo_size(reloc->robj));
6a117dc39a7421 Patrick Lerda     2025-06-10  2739  				return -EINVAL;
6a117dc39a7421 Patrick Lerda     2025-06-10  2740  			}
6a117dc39a7421 Patrick Lerda     2025-06-10  2741  			offset += reloc->gpu_offset;
6a117dc39a7421 Patrick Lerda     2025-06-10  2742  			ib[idx + 5] = offset;
6a117dc39a7421 Patrick Lerda     2025-06-10  2743  			ib[idx + 6] = upper_32_bits(offset) & 0xff;
6a117dc39a7421 Patrick Lerda     2025-06-10  2744  		} else {
6a117dc39a7421 Patrick Lerda     2025-06-10  2745  			/* WRITE is a reg. */
6a117dc39a7421 Patrick Lerda     2025-06-10  2746  			reg = radeon_get_ib_value(p, idx + 5) << 2;
6a117dc39a7421 Patrick Lerda     2025-06-10  2747  			if (!evergreen_is_safe_reg(p, reg)) {
b7c5334af69d35 Alex Deucher      2025-09-02  2748  				dev_warn_once(p->dev, "forbidden register 0x%08x at %d\n",
6a117dc39a7421 Patrick Lerda     2025-06-10  2749  					      reg, idx + 5);
6a117dc39a7421 Patrick Lerda     2025-06-10  2750  				return -EINVAL;
6a117dc39a7421 Patrick Lerda     2025-06-10  2751  			}
6a117dc39a7421 Patrick Lerda     2025-06-10  2752  		}
6a117dc39a7421 Patrick Lerda     2025-06-10  2753  		break;
cb5fcbd540b438 Alex Deucher      2010-05-28  2754  	case PACKET3_NOP:
cb5fcbd540b438 Alex Deucher      2010-05-28  2755  		break;
cb5fcbd540b438 Alex Deucher      2010-05-28  2756  	default:
b7c5334af69d35 Alex Deucher      2025-09-02  2757  		dev_warn_once(p->dev, "Packet3 opcode %x not supported\n", pkt->opcode);
cb5fcbd540b438 Alex Deucher      2010-05-28  2758  		return -EINVAL;
cb5fcbd540b438 Alex Deucher      2010-05-28  2759  	}
cb5fcbd540b438 Alex Deucher      2010-05-28  2760  	return 0;
cb5fcbd540b438 Alex Deucher      2010-05-28  2761  }
cb5fcbd540b438 Alex Deucher      2010-05-28  2762  

:::::: The code at line 2705 was first introduced by commit
:::::: 6a117dc39a7421697bea9a8e94a06fbcf937d489 drm/radeon/evergreen_cs: implement cond_exec and cond_write

:::::: TO: Patrick Lerda <patrick9876@free.fr>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
