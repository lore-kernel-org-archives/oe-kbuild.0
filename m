Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF722E414
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Mar 2026 23:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772666985; cv=none; b=fnOLzcVb7aTpigdVyFtaQF2USjK9nOJJGhLxMG2M3mNnFe9i9uMJbplJ/lMF8TD7QzY4z1UIOUUFk/Uj/EWq5/F5MhyGE+45Ie8LIWA0TpT6NGCpUXjflxKsPLoKqebM8OF+nqwsa3YKhDz6XOfXB0tZYZAkY6xIn1T/d08U56w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772666985; c=relaxed/simple;
	bh=+ZfgZBmktUp5PohBOi+dGi6XOTMo/HWMA1HvEuetSgw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jbV5a8gqDZDzyjKaPd/HsoAvcDbOha+a+5XU9mWQLgKSNBLBV1WZP18uqACBF/EcUE0ey/LsGIuZYDCI8WWrwbfLy/BUiHxCQzNLqodZK8KyTaaSaNpE1aQ9/Jy1AxdoPTchSQFbj0pfHGSwfbm8wwmrbluAZxGWMksTE48dOzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EM9WFGR+; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EM9WFGR+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772666984; x=1804202984;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+ZfgZBmktUp5PohBOi+dGi6XOTMo/HWMA1HvEuetSgw=;
  b=EM9WFGR+Tc8KNP0utIUL3WL6MR8G6jq6PIkdN+RJdyg1Lsdimq7THr39
   ON2e5OcUF+n91pN68s1U0LunCIKY0UrKiUsgWpkZPVhTwhmg8Dore+ctK
   wiyT5jOOkbRAVGNbRvXqOSb1aHBqydJUC52oXTQ6C44+jw42qb30JZmci
   qCLHSenE40Az1dkvrrIe9CFRQ5EuNyJAcrzp48QIyLgQk3M9c+XPsuFKZ
   i9CONBGF5BziEb5ZotYnciHmAK6ezXqy3yei8PJUuTEH617aFdrbWOuD7
   lNbLECOqGNWknak04gyr055n7ph9P9a1RCRFokGul1ngV70kgwh3XnPUO
   w==;
X-CSE-ConnectionGUID: JHIcGY9AR1SbTkA3HRiyBg==
X-CSE-MsgGUID: 4Kwx1C5JRb+aqnz++3OvkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="76346468"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="76346468"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 15:29:43 -0800
X-CSE-ConnectionGUID: IyHU6zoPTsCFuNJ1X31Fxg==
X-CSE-MsgGUID: QdWW3IRqSUCj3NT9kkTA1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="256374224"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 04 Mar 2026 15:29:42 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxvet-000000004gN-2inz;
	Wed, 04 Mar 2026 23:29:39 +0000
Date: Thu, 5 Mar 2026 07:29:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] fs/ntfs3: add a subset of W=1 warnings for stricter
 checks
Message-ID: <202603050701.HA6h0acg-lkp@intel.com>
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
config: parisc-randconfig-002-20260305 (https://download.01.org/0day-ci/archive/20260305/202603050701.HA6h0acg-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603050701.HA6h0acg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603050701.HA6h0acg-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   fs/ntfs3/fsntfs.c: In function 'ntfs_write_bh':
>> fs/ntfs3/fsntfs.c:1487:9: warning: 'sample' may be used uninitialized in this function [-Wmaybe-uninitialized]
       *ptr = sample;
       ~~~~~^~~~~~~~
>> fs/ntfs3/fsntfs.c:1486:13: warning: 'fixup' may be used uninitialized in this function [-Wmaybe-uninitialized]
       *++fixup = *ptr;
       ~~~~~~~~~^~~~~~


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
82cae269cfa953 Konstantin Komarov      2021-08-13  1443  	__le16 *fixup;
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
82cae269cfa953 Konstantin Komarov      2021-08-13 @1486  			*++fixup = *ptr;
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
