Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C3715573D
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 04:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733719487; cv=none; b=Rj30oii6hQLTxN4tsD7VL7+kWohSIWjnnOCf7Waoc5WlrNFlqJpUcmX7vk5CPzPAWeHtJzdn4EsrSGdGrJ7iKYrWG7Ejb6WGQAvikzQX8fkzSfbsQebFKIncetJIqbewxCaVwGoEweBCVak7ingg4xYB9lCDPfr+wQAC+HhTfO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733719487; c=relaxed/simple;
	bh=8pSYb8nm4sWJAkizwDVyKUgEUUqyYWSTr0+KebmZHrs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j8OnBbyHATQS2yhOOwWgSBh2cvcr8+ydMwd5fPpAF3YHAn6H+OpoPbC5+tgvaZ79w2HptiaB3E1FDoeQxBAOMkNXJ2RJCCkn/kCFVG/cpr6ArLQ78tNSUXrE1TVpJC8TAMzH4OzUFhPwxzdDg4fos4wCiTZ3aLvzBlZv18wKkFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bcnf9wXl; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bcnf9wXl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733719483; x=1765255483;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8pSYb8nm4sWJAkizwDVyKUgEUUqyYWSTr0+KebmZHrs=;
  b=bcnf9wXl+ar/BV2WyovMkt8Qb5etrcRLp/MVQZnzTuqPSkSdtRj6ooyu
   YZkZjbYwY/i3KudXIpc6tAeZyEA+NZg79HAr0o/v96YqfCnhdQCfVP7ro
   +xGTOLkr4NcTpqdc2oM1l0GtUW5JAqewFafJRIce2th9BiNRRG+UBF32I
   f4xXGCiKrq3y314JMKGXNoT8RvWADcW+QMqgBPHYOgW12wLTWOWoG/N32
   vZmcwfwns2pAjLY+/ypS5lm+wQZYL03Wu7m7iOlDyjCXkM5fTKZxzRWKg
   zzoX2ZTDMLPTUMrWhze0ojyD6eP6DBOTo/JbdPdNBC35mEE3gKw/2ZRbj
   Q==;
X-CSE-ConnectionGUID: hLdeZrM2SFG771hMTS9qwg==
X-CSE-MsgGUID: E8WagfvUS/Cxi5iKv35l8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="45015209"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="45015209"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:44:41 -0800
X-CSE-ConnectionGUID: m59jGsaWTvSvXc+8bUS2gw==
X-CSE-MsgGUID: z5NxrlBTQUOd4YFAk17msw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="94760111"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Dec 2024 20:44:39 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVdM-0003uJ-1U;
	Mon, 09 Dec 2024 04:44:36 +0000
Date: Mon, 9 Dec 2024 12:43:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [akpm-mm:mm-unstable 124/172] fs/proc/vmcore.c:1542:1-7: preceding
 lock on line 1525
Message-ID: <202412081528.zlH1seWK-lkp@intel.com>
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
TO: David Hildenbrand <david@redhat.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   6e165f54437931f329d09dca6c19d99af08a36e1
commit: 18d6602e1b51dfe86dc0d16a0c2eb4ac0b0413e2 [124/172] fs/proc/vmcore: disallow vmcore modifications while the vmcore is open
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: i386-randconfig-052-20241208 (https://download.01.org/0day-ci/archive/20241208/202412081528.zlH1seWK-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412081528.zlH1seWK-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/proc/vmcore.c:1542:1-7: preceding lock on line 1525

vim +1542 fs/proc/vmcore.c

7efe48df8a3df6 Rahul Lakkireddy  2018-05-02  1470  
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1471  /**
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1472   * vmcore_add_device_dump - Add a buffer containing device dump to vmcore
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1473   * @data: dump info.
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1474   *
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1475   * Allocate a buffer and invoke the calling driver's dump collect routine.
70e79866ab36fe Alexey Dobriyan   2023-02-28  1476   * Write ELF note at the beginning of the buffer to indicate vmcore device
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1477   * dump and add the dump to global list.
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1478   */
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1479  int vmcore_add_device_dump(struct vmcoredd_data *data)
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1480  {
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1481  	struct vmcoredd_node *dump;
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1482  	void *buf = NULL;
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1483  	size_t data_size;
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1484  	int ret;
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1485  
c6c405336bd3b0 Kairui Song       2019-07-16  1486  	if (vmcoredd_disabled) {
c6c405336bd3b0 Kairui Song       2019-07-16  1487  		pr_err_once("Device dump is disabled\n");
c6c405336bd3b0 Kairui Song       2019-07-16  1488  		return -EINVAL;
c6c405336bd3b0 Kairui Song       2019-07-16  1489  	}
c6c405336bd3b0 Kairui Song       2019-07-16  1490  
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1491  	if (!data || !strlen(data->dump_name) ||
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1492  	    !data->vmcoredd_callback || !data->size)
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1493  		return -EINVAL;
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1494  
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1495  	dump = vzalloc(sizeof(*dump));
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1496  	if (!dump) {
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1497  		ret = -ENOMEM;
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1498  		goto out_err;
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1499  	}
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1500  
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1501  	/* Keep size of the buffer page aligned so that it can be mmaped */
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1502  	data_size = roundup(sizeof(struct vmcoredd_header) + data->size,
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1503  			    PAGE_SIZE);
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1504  
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1505  	/* Allocate buffer for driver's to write their dumps */
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1506  	buf = vmcore_alloc_buf(data_size);
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1507  	if (!buf) {
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1508  		ret = -ENOMEM;
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1509  		goto out_err;
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1510  	}
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1511  
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1512  	vmcoredd_write_header(buf, data, data_size -
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1513  			      sizeof(struct vmcoredd_header));
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1514  
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1515  	/* Invoke the driver's dump collection routing */
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1516  	ret = data->vmcoredd_callback(data, buf +
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1517  				      sizeof(struct vmcoredd_header));
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1518  	if (ret)
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1519  		goto out_err;
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1520  
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1521  	dump->buf = buf;
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1522  	dump->size = data_size;
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1523  
18d6602e1b51df David Hildenbrand 2024-12-04  1524  	/* Add the dump to driver sysfs list and update the elfcore hdr */
92208a87f99b93 David Hildenbrand 2024-12-04 @1525  	mutex_lock(&vmcore_mutex);
18d6602e1b51df David Hildenbrand 2024-12-04  1526  	if (vmcore_opened)
18d6602e1b51df David Hildenbrand 2024-12-04  1527  		pr_warn_once("Unexpected adding of device dump\n");
18d6602e1b51df David Hildenbrand 2024-12-04  1528  	if (vmcore_open) {
18d6602e1b51df David Hildenbrand 2024-12-04  1529  		ret = -EBUSY;
18d6602e1b51df David Hildenbrand 2024-12-04  1530  		goto out_err;
18d6602e1b51df David Hildenbrand 2024-12-04  1531  	}
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1532  
18d6602e1b51df David Hildenbrand 2024-12-04  1533  	list_add_tail(&dump->list, &vmcoredd_list);
7efe48df8a3df6 Rahul Lakkireddy  2018-05-02  1534  	vmcoredd_update_size(data_size);
18d6602e1b51df David Hildenbrand 2024-12-04  1535  	mutex_unlock(&vmcore_mutex);
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1536  	return 0;
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1537  
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1538  out_err:
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1539  	vfree(buf);
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1540  	vfree(dump);
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1541  
2724273e8fd00b Rahul Lakkireddy  2018-05-02 @1542  	return ret;
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1543  }
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1544  EXPORT_SYMBOL(vmcore_add_device_dump);
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1545  #endif /* CONFIG_PROC_VMCORE_DEVICE_DUMP */
2724273e8fd00b Rahul Lakkireddy  2018-05-02  1546  

:::::: The code at line 1542 was first introduced by commit
:::::: 2724273e8fd00b512596a77ee063f49b25f36507 vmcore: add API to collect hardware dump in second kernel

:::::: TO: Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
