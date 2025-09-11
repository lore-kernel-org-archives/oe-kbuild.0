Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563282153E7
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Sep 2025 22:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757631418; cv=none; b=KdVhKdsuM7G8+fq3yS+9CwOtmstWgGe028wTYp4KG2RaNCCAiohhIrBv9tZDWsEnZCBfyvF6QRJWLzSFICbX0KIrYWwtDsvXUBLKUAWixTWrBXah93W+Yko1P5V2Hs5KkIKa8V/KF8z5fIxMEkrlRwZUQeFtR+mL0EAXVK73lUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757631418; c=relaxed/simple;
	bh=wpwehQZezfBWAZwqJ7FhaE8AT3tcj5prIq5HlMynTMc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tp0Z/bp+uBzu9glLFFH2ofu1RBtKEDFnPPsbmAgfW905O4YtwLFCNPypEDOx3vgJemI+d4RlEbdNr2N0TV8emVlbZ6GCRGtttEcVNcbhj9TXYp9YPdXxVOsBFMqtdnEjOFoTqkSZl0E2wmhbHRbVI5fZfwnLOztaRpsCIRi0oaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J+iCqdE5; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J+iCqdE5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757631417; x=1789167417;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wpwehQZezfBWAZwqJ7FhaE8AT3tcj5prIq5HlMynTMc=;
  b=J+iCqdE5vo0y4p1j4cIw6k+aFABE98TD7rFPa1xxjVlHILAx6gVtmoSU
   SsAmEMtAZ29jlyWjkmY/LvCT0sRPARnAUwjRAstAD7fRW4JazDJVj6r3p
   4ti2g97IR1iYCX4GPO1JHuosX88aiZ9FNWroNGOnwr6dPAtmioOD8Fpsx
   4OnYnRd0Ix8M0lCO/vJVzrJQJ4s+dGN6vjK2+heNbnbWbSkxgR7A1PKj8
   5C5tzSxIExqvGe0PI7FBc3upWo5Kd2hDv6vyJk9aAgv0HzKYezRu7bTNR
   ucvSHOSzJvzE4w6yAvvM+80AGf5z4zSAnQz3NzCo+4cg+tNSRHWYd3bBc
   Q==;
X-CSE-ConnectionGUID: AlHSKXjqSLWm4IroBkoi2Q==
X-CSE-MsgGUID: CzHrn6EKRbOYhK8TvVXbNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="71401512"
X-IronPort-AV: E=Sophos;i="6.18,258,1751266800"; 
   d="scan'208";a="71401512"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 15:56:56 -0700
X-CSE-ConnectionGUID: JlyV/HDwRa2q1ipQBm2zPA==
X-CSE-MsgGUID: v50b9z1gSmy3tpdaMhiwEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,258,1751266800"; 
   d="scan'208";a="197496555"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 11 Sep 2025 15:56:54 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwqDk-0000gS-0m;
	Thu, 11 Sep 2025 22:56:52 +0000
Date: Fri, 12 Sep 2025 06:56:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] ntfs3: fix use-after-free of sbi->options in cmp_fnames
Message-ID: <202509120631.3NU1HKk1-lkp@intel.com>
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
In-Reply-To: <20250910151708.28810-1-anmuxixixi@gmail.com>
References: <20250910151708.28810-1-anmuxixixi@gmail.com>
TO: YangWen <anmuxixixi@gmail.com>
TO: almaz.alexandrovich@paragon-software.com
CC: ntfs3@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: YangWen <anmuxixixi@gmail.com>
CC: syzbot+d77c546c60db651a389c@syzkaller.appspotmail.com

Hi YangWen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brauner-vfs/vfs.all]
[also build test WARNING on linus/master v6.17-rc5 next-20250911]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/YangWen/ntfs3-fix-use-after-free-of-sbi-options-in-cmp_fnames/20250910-232209
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20250910151708.28810-1-anmuxixixi%40gmail.com
patch subject: [PATCH] ntfs3: fix use-after-free of sbi->options in cmp_fnames
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: arm-randconfig-r071-20250911 (https://download.01.org/0day-ci/archive/20250912/202509120631.3NU1HKk1-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 21857ae337e0892a5522b6e7337899caa61de2a6)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509120631.3NU1HKk1-lkp@intel.com/

smatch warnings:
fs/ntfs3/super.c:1668 ntfs_fill_super() warn: variable dereferenced before check 'sbi' (see line 1226)

vim +/sbi +1668 fs/ntfs3/super.c

82cae269cfa953 Konstantin Komarov 2021-08-13  1571  
0056b273757b30 Kari Argillander   2021-09-09  1572  	shared = ntfs_set_shared(sbi->upcase, 0x10000 * sizeof(short));
0056b273757b30 Kari Argillander   2021-09-09  1573  	if (shared && sbi->upcase != shared) {
0056b273757b30 Kari Argillander   2021-09-09  1574  		kvfree(sbi->upcase);
82cae269cfa953 Konstantin Komarov 2021-08-13  1575  		sbi->upcase = shared;
82cae269cfa953 Konstantin Komarov 2021-08-13  1576  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  1577  
82cae269cfa953 Konstantin Komarov 2021-08-13  1578  	iput(inode);
82cae269cfa953 Konstantin Komarov 2021-08-13  1579  
82cae269cfa953 Konstantin Komarov 2021-08-13  1580  	if (is_ntfs3(sbi)) {
e8b8e97f91b80f Kari Argillander   2021-08-03  1581  		/* Load $Secure. */
82cae269cfa953 Konstantin Komarov 2021-08-13  1582  		err = ntfs_security_init(sbi);
e43f6ec224c1b4 Konstantin Komarov 2023-02-15  1583  		if (err) {
e43f6ec224c1b4 Konstantin Komarov 2023-02-15  1584  			ntfs_err(sb, "Failed to initialize $Secure (%d).", err);
9b75450d6c5801 Konstantin Komarov 2021-09-28  1585  			goto out;
e43f6ec224c1b4 Konstantin Komarov 2023-02-15  1586  		}
82cae269cfa953 Konstantin Komarov 2021-08-13  1587  
e8b8e97f91b80f Kari Argillander   2021-08-03  1588  		/* Load $Extend. */
82cae269cfa953 Konstantin Komarov 2021-08-13  1589  		err = ntfs_extend_init(sbi);
e43f6ec224c1b4 Konstantin Komarov 2023-02-15  1590  		if (err) {
e43f6ec224c1b4 Konstantin Komarov 2023-02-15  1591  			ntfs_warn(sb, "Failed to initialize $Extend.");
82cae269cfa953 Konstantin Komarov 2021-08-13  1592  			goto load_root;
e43f6ec224c1b4 Konstantin Komarov 2023-02-15  1593  		}
82cae269cfa953 Konstantin Komarov 2021-08-13  1594  
e43f6ec224c1b4 Konstantin Komarov 2023-02-15  1595  		/* Load $Extend/$Reparse. */
82cae269cfa953 Konstantin Komarov 2021-08-13  1596  		err = ntfs_reparse_init(sbi);
e43f6ec224c1b4 Konstantin Komarov 2023-02-15  1597  		if (err) {
e43f6ec224c1b4 Konstantin Komarov 2023-02-15  1598  			ntfs_warn(sb, "Failed to initialize $Extend/$Reparse.");
82cae269cfa953 Konstantin Komarov 2021-08-13  1599  			goto load_root;
e43f6ec224c1b4 Konstantin Komarov 2023-02-15  1600  		}
82cae269cfa953 Konstantin Komarov 2021-08-13  1601  
e43f6ec224c1b4 Konstantin Komarov 2023-02-15  1602  		/* Load $Extend/$ObjId. */
82cae269cfa953 Konstantin Komarov 2021-08-13  1603  		err = ntfs_objid_init(sbi);
e43f6ec224c1b4 Konstantin Komarov 2023-02-15  1604  		if (err) {
e43f6ec224c1b4 Konstantin Komarov 2023-02-15  1605  			ntfs_warn(sb, "Failed to initialize $Extend/$ObjId.");
82cae269cfa953 Konstantin Komarov 2021-08-13  1606  			goto load_root;
82cae269cfa953 Konstantin Komarov 2021-08-13  1607  		}
e43f6ec224c1b4 Konstantin Komarov 2023-02-15  1608  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  1609  
82cae269cfa953 Konstantin Komarov 2021-08-13  1610  load_root:
e8b8e97f91b80f Kari Argillander   2021-08-03  1611  	/* Load root. */
82cae269cfa953 Konstantin Komarov 2021-08-13  1612  	ref.low = cpu_to_le32(MFT_REC_ROOT);
82cae269cfa953 Konstantin Komarov 2021-08-13  1613  	ref.seq = cpu_to_le16(MFT_REC_ROOT);
82cae269cfa953 Konstantin Komarov 2021-08-13  1614  	inode = ntfs_iget5(sb, &ref, &NAME_ROOT);
788ee1605c2e9f Konstantin Komarov 2023-02-20  1615  	if (IS_ERR(inode)) {
e43f6ec224c1b4 Konstantin Komarov 2023-02-15  1616  		err = PTR_ERR(inode);
e43f6ec224c1b4 Konstantin Komarov 2023-02-15  1617  		ntfs_err(sb, "Failed to load root (%d).", err);
9b75450d6c5801 Konstantin Komarov 2021-09-28  1618  		goto out;
82cae269cfa953 Konstantin Komarov 2021-08-13  1619  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  1620  
788ee1605c2e9f Konstantin Komarov 2023-02-20  1621  	/*
788ee1605c2e9f Konstantin Komarov 2023-02-20  1622  	 * Final check. Looks like this case should never occurs.
788ee1605c2e9f Konstantin Komarov 2023-02-20  1623  	 */
788ee1605c2e9f Konstantin Komarov 2023-02-20  1624  	if (!inode->i_op) {
788ee1605c2e9f Konstantin Komarov 2023-02-20  1625  		err = -EINVAL;
788ee1605c2e9f Konstantin Komarov 2023-02-20  1626  		ntfs_err(sb, "Failed to load root (%d).", err);
788ee1605c2e9f Konstantin Komarov 2023-02-20  1627  		goto put_inode_out;
788ee1605c2e9f Konstantin Komarov 2023-02-20  1628  	}
788ee1605c2e9f Konstantin Komarov 2023-02-20  1629  
82cae269cfa953 Konstantin Komarov 2021-08-13  1630  	sb->s_root = d_make_root(inode);
9b75450d6c5801 Konstantin Komarov 2021-09-28  1631  	if (!sb->s_root) {
9b75450d6c5801 Konstantin Komarov 2021-09-28  1632  		err = -ENOMEM;
9b75450d6c5801 Konstantin Komarov 2021-09-28  1633  		goto put_inode_out;
9b75450d6c5801 Konstantin Komarov 2021-09-28  1634  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  1635  
f1d325b8c75e90 Konstantin Komarov 2023-05-08  1636  	if (boot2) {
f1d325b8c75e90 Konstantin Komarov 2023-05-08  1637  		/*
f1d325b8c75e90 Konstantin Komarov 2023-05-08  1638  	 	 * Alternative boot is ok but primary is not ok.
f1d325b8c75e90 Konstantin Komarov 2023-05-08  1639  	 	 * Volume is recognized as NTFS. Update primary boot.
f1d325b8c75e90 Konstantin Komarov 2023-05-08  1640  		 */
f1d325b8c75e90 Konstantin Komarov 2023-05-08  1641  		struct buffer_head *bh0 = sb_getblk(sb, 0);
f1d325b8c75e90 Konstantin Komarov 2023-05-08  1642  		if (bh0) {
f1d325b8c75e90 Konstantin Komarov 2023-05-08  1643  			if (buffer_locked(bh0))
f1d325b8c75e90 Konstantin Komarov 2023-05-08  1644  				__wait_on_buffer(bh0);
f1d325b8c75e90 Konstantin Komarov 2023-05-08  1645  
f1d325b8c75e90 Konstantin Komarov 2023-05-08  1646  			lock_buffer(bh0);
f1d325b8c75e90 Konstantin Komarov 2023-05-08  1647  			memcpy(bh0->b_data, boot2, sizeof(*boot2));
f1d325b8c75e90 Konstantin Komarov 2023-05-08  1648  			set_buffer_uptodate(bh0);
f1d325b8c75e90 Konstantin Komarov 2023-05-08  1649  			mark_buffer_dirty(bh0);
f1d325b8c75e90 Konstantin Komarov 2023-05-08  1650  			unlock_buffer(bh0);
f1d325b8c75e90 Konstantin Komarov 2023-05-08  1651  			if (!sync_dirty_buffer(bh0))
f1d325b8c75e90 Konstantin Komarov 2023-05-08  1652  				ntfs_warn(sb, "primary boot is updated");
f1d325b8c75e90 Konstantin Komarov 2023-05-08  1653  			put_bh(bh0);
f1d325b8c75e90 Konstantin Komarov 2023-05-08  1654  		}
f1d325b8c75e90 Konstantin Komarov 2023-05-08  1655  
f1d325b8c75e90 Konstantin Komarov 2023-05-08  1656  		kfree(boot2);
f1d325b8c75e90 Konstantin Komarov 2023-05-08  1657  	}
f1d325b8c75e90 Konstantin Komarov 2023-05-08  1658  
e2d74c47a3d3d8 Ye Bin             2024-10-11  1659  	ntfs_create_procdir(sb);
7832e123490ac3 Konstantin Komarov 2023-05-08  1660  
d55f90e9b243fa Christian Brauner  2024-04-16  1661  	if (is_legacy_ntfs(sb))
d55f90e9b243fa Christian Brauner  2024-04-16  1662  		sb->s_flags |= SB_RDONLY;
82cae269cfa953 Konstantin Komarov 2021-08-13  1663  	return 0;
9b75450d6c5801 Konstantin Komarov 2021-09-28  1664  
9b75450d6c5801 Konstantin Komarov 2021-09-28  1665  put_inode_out:
82cae269cfa953 Konstantin Komarov 2021-08-13  1666  	iput(inode);
9b75450d6c5801 Konstantin Komarov 2021-09-28  1667  out:
18efecefde9b87 YangWen            2025-09-10 @1668  	if (sbi && sbi->options) {
18efecefde9b87 YangWen            2025-09-10  1669  		unload_nls(sbi->options->nls);
18efecefde9b87 YangWen            2025-09-10  1670  		kfree(sbi->options->nls);
18efecefde9b87 YangWen            2025-09-10  1671  		kfree(sbi->options);
18efecefde9b87 YangWen            2025-09-10  1672  		sbi->options = NULL;
18efecefde9b87 YangWen            2025-09-10  1673  	}
18efecefde9b87 YangWen            2025-09-10  1674  
493c71926c2030 Christian Brauner  2023-09-25  1675  	ntfs3_put_sbi(sbi);
f1d325b8c75e90 Konstantin Komarov 2023-05-08  1676  	kfree(boot2);
4ad5c924df6cd6 Konstantin Komarov 2023-09-22  1677  	ntfs3_put_sbi(sbi);
82cae269cfa953 Konstantin Komarov 2021-08-13  1678  	return err;
82cae269cfa953 Konstantin Komarov 2021-08-13  1679  }
82cae269cfa953 Konstantin Komarov 2021-08-13  1680  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
