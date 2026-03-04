Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6389D34E774
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Mar 2026 23:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772665724; cv=none; b=u5wpN36igovAw+DB8451dVnr1aTbnmESzmOvqbqIxm0QgEWnHtHrdLOfKPsnKVmMRSyJN/ATG+v8Nv+AamlZV0D1tazkO4QztUhgPdRy+4hvXRiUV4L+ssaawoDwFTQoFsf81VX/yvScKZDUSsV0dkdUx6earBtFonyqsMrEC2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772665724; c=relaxed/simple;
	bh=Y2K3FIjs9ZzYJLHhd5P+CQFJpZ/o5WLJg8wJe8Q/f/I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RqMjGi6OStYfYGyA6/1IdDEChUWIDsMW1pa17LS4SkEJ9YgLcLYVCMCOmsK4T5magLwWtS4dGkyFILxYBTXfm84LtdZPcduGCQJQ0UTzpueLN+3dTHzjh7tIj6WYqwB4XaFfsKJlSJ02bL6hNMLtRGy2Ae/nggveoTJN8urXfeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NjHj2Ias; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NjHj2Ias"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772665722; x=1804201722;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y2K3FIjs9ZzYJLHhd5P+CQFJpZ/o5WLJg8wJe8Q/f/I=;
  b=NjHj2IashWGT/GubvhC61AQOAmVvfOCKDt0Bxjta9zEu9NR2Tqfc+RdV
   JRN5DWr59Qss6N19o+qL1pSxVs8Tn1mo622GHFVg8Dxl5VZULCN7CDM3h
   ui64x8qwZxKNd4Ir6+rjzLRgH6x4Dzpsn0BE7Z/0tao+ZvWXGGeXNUVO1
   f/mWgK8+H0rmlLVhiqJ5mv83wckZJbO4VafwClSwl2xZbnU4gmg4NXuHM
   ZFWJplXbwufCaFhlYLXlqAnRj8fUWUQ4MCo+/Q9nkwKSZA2CCLK8eLWd2
   Cxj4Q30OAAqcSmiyNty4OQYm//y/ozT5NJJdvPsUTFaAp92HoI4jNRn1g
   Q==;
X-CSE-ConnectionGUID: ONdk00YCQHi9A1+EcoIQJQ==
X-CSE-MsgGUID: DOTbsS+cT82+f74oLPUwUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73647856"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="73647856"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 15:08:42 -0800
X-CSE-ConnectionGUID: Jxhq/kBpSguFEBWFSNlTCg==
X-CSE-MsgGUID: Cbu97FaUS7K43wl1NmhW3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="222632144"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 04 Mar 2026 15:08:41 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxvKY-000000004ev-13Dp;
	Wed, 04 Mar 2026 23:08:38 +0000
Date: Thu, 5 Mar 2026 07:07:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] fs/ntfs3: add a subset of W=1 warnings for stricter
 checks
Message-ID: <202603050717.kw7i6toN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "likely FALSE maybe-used-uninitialized warning on old compiler"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260304095334.4254-1-almaz.alexandrovich@paragon-software.com>
References: <20260304095334.4254-1-almaz.alexandrovich@paragon-software.com>
TO: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
TO: ntfs3@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: linux-fsdevel@vger.kernel.org
CC: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

Hi Konstantin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brauner-vfs/vfs.all]
[also build test WARNING on linus/master v7.0-rc2 next-20260303]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Konstantin-Komarov/fs-ntfs3-add-a-subset-of-W-1-warnings-for-stricter-checks/20260304-181332
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20260304095334.4254-1-almaz.alexandrovich%40paragon-software.com
patch subject: [PATCH] fs/ntfs3: add a subset of W=1 warnings for stricter checks
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: sparc-randconfig-002-20260305 (https://download.01.org/0day-ci/archive/20260305/202603050717.kw7i6toN-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603050717.kw7i6toN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603050717.kw7i6toN-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   fs/ntfs3/fsntfs.c: In function 'ntfs_write_bh':
>> fs/ntfs3/fsntfs.c:1487:30: warning: 'sample' may be used uninitialized [-Wmaybe-uninitialized]
    1487 |                         *ptr = sample;
         |                         ~~~~~^~~~~~~~
   fs/ntfs3/fsntfs.c:1444:16: note: 'sample' was declared here
    1444 |         __le16 sample;
         |                ^~~~~~
>> fs/ntfs3/fsntfs.c:1443:17: warning: 'fixup' may be used uninitialized [-Wmaybe-uninitialized]
    1443 |         __le16 *fixup;
         |                 ^~~~~
--
   fs/ntfs3/index.c: In function 'indx_add_allocate':
>> fs/ntfs3/index.c:1572:9: warning: 'bmp_size' may be used uninitialized [-Wmaybe-uninitialized]
    1572 |         attr_set_size(ni, ATTR_BITMAP, in->name, in->name_len,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1573 |                       &indx->bitmap_run, bmp_size, &bmp_size_v, false);
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ntfs3/index.c:1496:13: note: 'bmp_size' was declared here
    1496 |         u64 bmp_size, bmp_size_v;
         |             ^~~~~~~~


vim +/sample +1487 fs/ntfs3/fsntfs.c

82cae269cfa953 Konstantin Komarov      2021-08-13  1431  
82cae269cfa953 Konstantin Komarov      2021-08-13  1432  int ntfs_write_bh(struct ntfs_sb_info *sbi, struct NTFS_RECORD_HEADER *rhdr,
82cae269cfa953 Konstantin Komarov      2021-08-13  1433  		  struct ntfs_buffers *nb, int sync)
82cae269cfa953 Konstantin Komarov      2021-08-13  1434  {
82cae269cfa953 Konstantin Komarov      2021-08-13  1435  	int err = 0;
82cae269cfa953 Konstantin Komarov      2021-08-13  1436  	struct super_block *sb = sbi->sb;
82cae269cfa953 Konstantin Komarov      2021-08-13  1437  	u32 block_size = sb->s_blocksize;
82cae269cfa953 Konstantin Komarov      2021-08-13  1438  	u32 bytes = nb->bytes;
82cae269cfa953 Konstantin Komarov      2021-08-13  1439  	u32 off = nb->off;
82cae269cfa953 Konstantin Komarov      2021-08-13  1440  	u16 fo = le16_to_cpu(rhdr->fix_off);
82cae269cfa953 Konstantin Komarov      2021-08-13  1441  	u16 fn = le16_to_cpu(rhdr->fix_num);
82cae269cfa953 Konstantin Komarov      2021-08-13  1442  	u32 idx;
82cae269cfa953 Konstantin Komarov      2021-08-13 @1443  	__le16 *fixup;
82cae269cfa953 Konstantin Komarov      2021-08-13  1444  	__le16 sample;
82cae269cfa953 Konstantin Komarov      2021-08-13  1445  
82cae269cfa953 Konstantin Komarov      2021-08-13  1446  	if ((fo & 1) || fo + fn * sizeof(short) > SECTOR_SIZE || !fn-- ||
82cae269cfa953 Konstantin Komarov      2021-08-13  1447  	    fn * SECTOR_SIZE > bytes) {
82cae269cfa953 Konstantin Komarov      2021-08-13  1448  		return -EINVAL;
82cae269cfa953 Konstantin Komarov      2021-08-13  1449  	}
82cae269cfa953 Konstantin Komarov      2021-08-13  1450  
82cae269cfa953 Konstantin Komarov      2021-08-13  1451  	for (idx = 0; bytes && idx < nb->nbufs; idx += 1, off = 0) {
82cae269cfa953 Konstantin Komarov      2021-08-13  1452  		u32 op = block_size - off;
82cae269cfa953 Konstantin Komarov      2021-08-13  1453  		char *bh_data;
82cae269cfa953 Konstantin Komarov      2021-08-13  1454  		struct buffer_head *bh = nb->bh[idx];
82cae269cfa953 Konstantin Komarov      2021-08-13  1455  		__le16 *ptr, *end_data;
82cae269cfa953 Konstantin Komarov      2021-08-13  1456  
82cae269cfa953 Konstantin Komarov      2021-08-13  1457  		if (op > bytes)
82cae269cfa953 Konstantin Komarov      2021-08-13  1458  			op = bytes;
82cae269cfa953 Konstantin Komarov      2021-08-13  1459  
fac760f5246743 Lalit Shankar Chowdhury 2025-11-28  1460  		wait_on_buffer(bh);
8335ebe195dcc7 Konstantin Komarov      2022-07-07  1461  		lock_buffer(bh);
82cae269cfa953 Konstantin Komarov      2021-08-13  1462  
82cae269cfa953 Konstantin Komarov      2021-08-13  1463  		bh_data = bh->b_data + off;
82cae269cfa953 Konstantin Komarov      2021-08-13  1464  		end_data = Add2Ptr(bh_data, op);
82cae269cfa953 Konstantin Komarov      2021-08-13  1465  		memcpy(bh_data, rhdr, op);
82cae269cfa953 Konstantin Komarov      2021-08-13  1466  
82cae269cfa953 Konstantin Komarov      2021-08-13  1467  		if (!idx) {
82cae269cfa953 Konstantin Komarov      2021-08-13  1468  			u16 t16;
82cae269cfa953 Konstantin Komarov      2021-08-13  1469  
82cae269cfa953 Konstantin Komarov      2021-08-13  1470  			fixup = Add2Ptr(bh_data, fo);
82cae269cfa953 Konstantin Komarov      2021-08-13  1471  			sample = *fixup;
82cae269cfa953 Konstantin Komarov      2021-08-13  1472  			t16 = le16_to_cpu(sample);
82cae269cfa953 Konstantin Komarov      2021-08-13  1473  			if (t16 >= 0x7FFF) {
82cae269cfa953 Konstantin Komarov      2021-08-13  1474  				sample = *fixup = cpu_to_le16(1);
82cae269cfa953 Konstantin Komarov      2021-08-13  1475  			} else {
82cae269cfa953 Konstantin Komarov      2021-08-13  1476  				sample = cpu_to_le16(t16 + 1);
82cae269cfa953 Konstantin Komarov      2021-08-13  1477  				*fixup = sample;
82cae269cfa953 Konstantin Komarov      2021-08-13  1478  			}
82cae269cfa953 Konstantin Komarov      2021-08-13  1479  
82cae269cfa953 Konstantin Komarov      2021-08-13  1480  			*(__le16 *)Add2Ptr(rhdr, fo) = sample;
82cae269cfa953 Konstantin Komarov      2021-08-13  1481  		}
82cae269cfa953 Konstantin Komarov      2021-08-13  1482  
82cae269cfa953 Konstantin Komarov      2021-08-13  1483  		ptr = Add2Ptr(bh_data, SECTOR_SIZE - sizeof(short));
82cae269cfa953 Konstantin Komarov      2021-08-13  1484  
82cae269cfa953 Konstantin Komarov      2021-08-13  1485  		do {
82cae269cfa953 Konstantin Komarov      2021-08-13  1486  			*++fixup = *ptr;
82cae269cfa953 Konstantin Komarov      2021-08-13 @1487  			*ptr = sample;
82cae269cfa953 Konstantin Komarov      2021-08-13  1488  			ptr += SECTOR_SIZE / sizeof(short);
82cae269cfa953 Konstantin Komarov      2021-08-13  1489  		} while (ptr < end_data);
82cae269cfa953 Konstantin Komarov      2021-08-13  1490  
82cae269cfa953 Konstantin Komarov      2021-08-13  1491  		set_buffer_uptodate(bh);
82cae269cfa953 Konstantin Komarov      2021-08-13  1492  		mark_buffer_dirty(bh);
82cae269cfa953 Konstantin Komarov      2021-08-13  1493  		unlock_buffer(bh);
82cae269cfa953 Konstantin Komarov      2021-08-13  1494  
82cae269cfa953 Konstantin Komarov      2021-08-13  1495  		if (sync) {
82cae269cfa953 Konstantin Komarov      2021-08-13  1496  			int err2 = sync_dirty_buffer(bh);
82cae269cfa953 Konstantin Komarov      2021-08-13  1497  
82cae269cfa953 Konstantin Komarov      2021-08-13  1498  			if (!err && err2)
82cae269cfa953 Konstantin Komarov      2021-08-13  1499  				err = err2;
82cae269cfa953 Konstantin Komarov      2021-08-13  1500  		}
82cae269cfa953 Konstantin Komarov      2021-08-13  1501  
82cae269cfa953 Konstantin Komarov      2021-08-13  1502  		bytes -= op;
82cae269cfa953 Konstantin Komarov      2021-08-13  1503  		rhdr = Add2Ptr(rhdr, op);
82cae269cfa953 Konstantin Komarov      2021-08-13  1504  	}
82cae269cfa953 Konstantin Komarov      2021-08-13  1505  
82cae269cfa953 Konstantin Komarov      2021-08-13  1506  	return err;
82cae269cfa953 Konstantin Komarov      2021-08-13  1507  }
82cae269cfa953 Konstantin Komarov      2021-08-13  1508  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
