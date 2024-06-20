Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABE81EEFC
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Jun 2024 05:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718861797; cv=none; b=UU+WQoO1aBhW83pifDlRprckrSozucHFvpPq2CHXX5Wd6CN3cAhUXl+ztnS6473Ya9Gdt5YbkqoFUrVbcSc5CmiS0rKXEBQaraXfGAtqUCDiw/hBwfZ4XyjJoVr5GXZarpy/pfAmZrlTN1u/mAMBnuyXhyOsk9s2jlxeoi90Q+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718861797; c=relaxed/simple;
	bh=e20S+X8WKpOEOIo/ykApnEtZdUqqywrebwU2vTb4JK8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MdoJ5E7YzaQJcBwiZIVOipmyipqEWzo5zDAF3QhlsOdqW2poHzz6yvCH1XF0nyP162jyWyfkC/1wDO9y0NZn3E7I8MsHxFIe+V5aA5QtMSOttpRscZwoAzv0XpsWVhD7Rr7KyQqc46caL/y54eJNvmqrsG6C//3EuN8sjNpwY/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nke7fchZ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nke7fchZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718861795; x=1750397795;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e20S+X8WKpOEOIo/ykApnEtZdUqqywrebwU2vTb4JK8=;
  b=Nke7fchZY5oZTjWkVf3wni3e1cqZRCMeez1DDgJ7b6PWpPJ22jksS23g
   PPM+24xN92BHU2alX0ctI/AJdf0jvjCmDA2wLMbDSDYcmBJlTKeMH2BZh
   qzLaHb1NP+TKYnuKQyygr8eNXlqoX5425PpsGBHKVSPP1VC1U7vJ7u/Mi
   nQoe1J7VtvesgfkVNdGKf9xnUBAWxiaVgsKrso45ptX3+mjcReSqvahBU
   b28b0uUFVBpe9fvtr4lDpaVLFhG9ONV1II4sagazmkLmZo0TxK28VkiiH
   2EhvKw5v62LDDRFMTYcjhBCwyXgO/ggApqcL/LAhJW+CZ7r/nonTz14oe
   A==;
X-CSE-ConnectionGUID: IDJEJeLGR+CUOlLWnS7IZA==
X-CSE-MsgGUID: X7cmoLa1Te2V5bNoPNXVkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15651048"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="15651048"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 22:36:35 -0700
X-CSE-ConnectionGUID: /n/Y0hUARQyYkEab4AMFDg==
X-CSE-MsgGUID: a8GUgvQcQZ2bmHoy9WZVOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="42009855"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 19 Jun 2024 22:36:33 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKATH-0007LW-0k;
	Thu, 20 Jun 2024 05:36:31 +0000
Date: Thu, 20 Jun 2024 13:36:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [hch-block:block-limit-flags 22/26] drivers/md/dm-table.c:1838:6-22:
 duplicated argument to & or |
Message-ID: <202406201304.yaarpcql-lkp@intel.com>
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
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/block.git block-limit-flags
head:   9ac92f88a6f5debfa827cdc3f47904331a20df53
commit: d1deb97f501576480164396f9f1be710f78bb77e [22/26] block: move the zoned flag into the features field
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-104-20240620 (https://download.01.org/0day-ci/archive/20240620/202406201304.yaarpcql-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202406201304.yaarpcql-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/md/dm-table.c:1838:6-22: duplicated argument to & or |

vim +1838 drivers/md/dm-table.c

00716545c894fc Denis Semakin         2018-03-13  1791  
bb37d77239af25 Damien Le Moal        2021-05-26  1792  int dm_table_set_restrictions(struct dm_table *t, struct request_queue *q,
754c5fc7ebb417 Mike Snitzer          2009-06-22  1793  			      struct queue_limits *limits)
^1da177e4c3f41 Linus Torvalds        2005-04-16  1794  {
bb37d77239af25 Damien Le Moal        2021-05-26  1795  	int r;
ed8b752bccf256 Mike Snitzer          2011-08-02  1796  
8cf3a4e7e3eab0 Christoph Hellwig     2024-06-08  1797  	if (!dm_table_supports_nowait(t))
8cf3a4e7e3eab0 Christoph Hellwig     2024-06-08  1798  		limits->features &= ~BLK_FEAT_NOWAIT;
6abc49468eeaad Konstantin Khlebnikov 2020-09-23  1799  
5637c05bc57100 Christoph Hellwig     2024-06-02  1800  	/*
5637c05bc57100 Christoph Hellwig     2024-06-02  1801  	 * The current polling impementation does not support request based
5637c05bc57100 Christoph Hellwig     2024-06-02  1802  	 * stacking.
5637c05bc57100 Christoph Hellwig     2024-06-02  1803  	 */
5637c05bc57100 Christoph Hellwig     2024-06-02  1804  	if (!__table_type_bio_based(t->type))
5637c05bc57100 Christoph Hellwig     2024-06-02  1805  		limits->features &= ~BLK_FEAT_POLL;
5637c05bc57100 Christoph Hellwig     2024-06-02  1806  
5d47c89f29eab6 Mike Snitzer          2017-11-16  1807  	if (!dm_table_supports_discards(t)) {
1c0e720228ad1c Christoph Hellwig     2024-02-28  1808  		limits->max_hw_discard_sectors = 0;
1c0e720228ad1c Christoph Hellwig     2024-02-28  1809  		limits->discard_granularity = 0;
1c0e720228ad1c Christoph Hellwig     2024-02-28  1810  		limits->discard_alignment = 0;
1c0e720228ad1c Christoph Hellwig     2024-02-28  1811  		limits->discard_misaligned = 0;
70200574cc229f Christoph Hellwig     2022-04-15  1812  	}
5ae89a8720c28c Mike Snitzer          2010-08-12  1813  
1c0e720228ad1c Christoph Hellwig     2024-02-28  1814  	if (!dm_table_supports_write_zeroes(t))
1c0e720228ad1c Christoph Hellwig     2024-02-28  1815  		limits->max_write_zeroes_sectors = 0;
1c0e720228ad1c Christoph Hellwig     2024-02-28  1816  
44abff2c0b970a Christoph Hellwig     2022-04-15  1817  	if (!dm_table_supports_secure_erase(t))
1c0e720228ad1c Christoph Hellwig     2024-02-28  1818  		limits->max_secure_erase_sectors = 0;
1c0e720228ad1c Christoph Hellwig     2024-02-28  1819  
0a4b93029038da Christoph Hellwig     2024-06-14  1820  	if (dm_table_supports_flush(t))
0a4b93029038da Christoph Hellwig     2024-06-14  1821  		limits->features |= BLK_FEAT_WRITE_CACHE | BLK_FEAT_FUA;
ed8b752bccf256 Mike Snitzer          2011-08-02  1822  
7b0800d00dae8c Christoph Hellwig     2021-11-29  1823  	if (dm_table_supports_dax(t, device_not_dax_capable)) {
7201976456447b Christoph Hellwig     2024-06-08  1824  		limits->features |= BLK_FEAT_DAX;
7b0800d00dae8c Christoph Hellwig     2021-11-29  1825  		if (dm_table_supports_dax(t, device_not_dax_synchronous_capable))
2e9ee0955d3c2d Pankaj Gupta          2019-07-05  1826  			set_dax_synchronous(t->md->dax_dev);
03b18887703c5f Heinz Mauelshagen     2023-01-30  1827  	} else
7201976456447b Christoph Hellwig     2024-06-08  1828  		limits->features &= ~BLK_FEAT_DAX;
dbc626597c39b2 Ross Zwisler          2018-06-26  1829  
24f6b6036c9eec Jeffle Xu             2021-02-08  1830  	if (dm_table_any_dev_attr(t, device_dax_write_cache_enabled, NULL))
273752c9ff03eb Vivek Goyal           2017-07-26  1831  		dax_write_cache(t->md->dax_dev, true);
273752c9ff03eb Vivek Goyal           2017-07-26  1832  
bb37d77239af25 Damien Le Moal        2021-05-26  1833  	/*
bb37d77239af25 Damien Le Moal        2021-05-26  1834  	 * For a zoned target, setup the zones related queue attributes
bb37d77239af25 Damien Le Moal        2021-05-26  1835  	 * and resources necessary for zone append emulation if necessary.
bb37d77239af25 Damien Le Moal        2021-05-26  1836  	 */
d1deb97f501576 Christoph Hellwig     2024-06-16  1837  	if (IS_ENABLED(CONFIG_BLK_DEV_ZONED) &&
d1deb97f501576 Christoph Hellwig     2024-06-16 @1838  	    (limits->features & limits->features & BLK_FEAT_ZONED)) {
c8c1f7012b807c Christoph Hellwig     2024-05-27  1839  		r = dm_set_zones_restrictions(t, q, limits);
bb37d77239af25 Damien Le Moal        2021-05-26  1840  		if (r)
bb37d77239af25 Damien Le Moal        2021-05-26  1841  			return r;
bb37d77239af25 Damien Le Moal        2021-05-26  1842  	}
c6d6e9b0f6b420 Jaegeuk Kim           2018-12-18  1843  
c8c1f7012b807c Christoph Hellwig     2024-05-27  1844  	r = queue_limits_set(q, limits);
c8c1f7012b807c Christoph Hellwig     2024-05-27  1845  	if (r)
c8c1f7012b807c Christoph Hellwig     2024-05-27  1846  		return r;
c8c1f7012b807c Christoph Hellwig     2024-05-27  1847  
cb77cb5abe1f4f Eric Biggers          2021-10-18  1848  	dm_update_crypto_profile(q, t);
bb37d77239af25 Damien Le Moal        2021-05-26  1849  	return 0;
^1da177e4c3f41 Linus Torvalds        2005-04-16  1850  }
^1da177e4c3f41 Linus Torvalds        2005-04-16  1851  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
