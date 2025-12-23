Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595E430ACE3
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Dec 2025 21:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766524168; cv=none; b=AsQ6WDfZnitX0nevoE1OTIoFexp0/W5R9VL6Y0hF+vAJ5lIwfzFNfNgLkCsqbVcS+nYNjhF3X3Erdt4eQJKDUgmt6WbgTtvs65VcE90IxfmlMtmdioWStuI3GJdyyp2gajv99FWSNBJYAtHY3L95kcVHmbQYRb3YJZO69fujpy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766524168; c=relaxed/simple;
	bh=b3CBHghtp+O2xpYjQO4jBYwt5ICMZiIXGPL/z7js/3A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uC1jMXcuq5PCfVjRjsWAianvXFFu/LlSkYha75eErdXq+Lbs6M4ok5GbftGx+toVwb+VfyfGf+bnyUykLyf39AAxOYZqkfPb7kdnBc3ixQeqYWU/JA/koxm4jKAvGT2or9w5IONVdFn7duIE8uJNXCsTrrfoAq7sRGejtnAy2Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gAoEzyCU; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gAoEzyCU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766524166; x=1798060166;
  h=date:from:to:cc:subject:message-id;
  bh=b3CBHghtp+O2xpYjQO4jBYwt5ICMZiIXGPL/z7js/3A=;
  b=gAoEzyCUL4+HbKCHCyhG3uMBqJmiSmWFOS9oc+sLMmp/Wap849m7IYx6
   O8+2w/WZX8yQRnejUxmZyOodEQJcEMHdxDn1/Jk83S2rNjg+msep+bjsa
   B95bjFrA/VTpWwma8T/N0mOATQr07N4uiDmi9mBZibLBIEO0z2FJqo2T3
   aavghf20MS1p4j9W5rMrAQn5L95z+qvftlMS2x5kR+ORk+OmfhUUMcJtP
   8R+0F6X8GwTcnCIi2dk/S11ueHjOaFdVwJIGxiU3t15EOCECDyo0wuRhJ
   nffe5mpSFOlKfIgAvRCvgGKwnos2dHoLZR+Uj4MCdsSkqce2O/Fnhvw0R
   Q==;
X-CSE-ConnectionGUID: Ol/Rkf0TRli4odxjZy7fkA==
X-CSE-MsgGUID: PiaMj1yMQZ+epFhm4lSJ0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="72000551"
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="72000551"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 13:09:25 -0800
X-CSE-ConnectionGUID: u4qZ2jLHRLumnx0FnDFzfg==
X-CSE-MsgGUID: YO+bVWAfRRGYGHxcrsVE7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="199010692"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 23 Dec 2025 13:09:24 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vY9dB-000000002Nd-46T9;
	Tue, 23 Dec 2025 21:09:21 +0000
Date: Wed, 24 Dec 2025 05:09:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [hch-misc:inode-time-nowait.4 5/11] fs/inode.c:2139:16-23:
 duplicated argument to & or |
Message-ID: <202512240401.NsKRkr2X-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/misc.git inode-time-nowait.4
head:   48db9b88d8b81b1b5c3973cb491d7cd952ef6ca0
commit: 4c45d5090b1155bd7b428574d2cf9bfe6871017a [5/11] fs: return I_DIRTY_* and allow error returns from inode_update_timestamps
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: m68k-randconfig-r054-20251224 (https://download.01.org/0day-ci/archive/20251224/202512240401.NsKRkr2X-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 9.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202512240401.NsKRkr2X-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/inode.c:2139:16-23: duplicated argument to & or |

vim +2139 fs/inode.c

4c45d5090b1155 Christoph Hellwig 2025-12-23  2090  
541d4c798a5988 Jeff Layton       2023-08-07  2091  /**
541d4c798a5988 Jeff Layton       2023-08-07  2092   * inode_update_timestamps - update the timestamps on the inode
541d4c798a5988 Jeff Layton       2023-08-07  2093   * @inode: inode to be updated
541d4c798a5988 Jeff Layton       2023-08-07  2094   * @flags: S_* flags that needed to be updated
4c45d5090b1155 Christoph Hellwig 2025-12-23  2095   * @dirty_flags: returns the I_DIRTY_* flags for the modification
541d4c798a5988 Jeff Layton       2023-08-07  2096   *
541d4c798a5988 Jeff Layton       2023-08-07  2097   * The update_time function is called when an inode's timestamps need to be
541d4c798a5988 Jeff Layton       2023-08-07  2098   * updated for a read or write operation. This function handles updating the
541d4c798a5988 Jeff Layton       2023-08-07  2099   * actual timestamps. It's up to the caller to ensure that the inode is marked
541d4c798a5988 Jeff Layton       2023-08-07  2100   * dirty appropriately.
541d4c798a5988 Jeff Layton       2023-08-07  2101   *
541d4c798a5988 Jeff Layton       2023-08-07  2102   * In the case where any of S_MTIME, S_CTIME, or S_VERSION need to be updated,
541d4c798a5988 Jeff Layton       2023-08-07  2103   * attempt to update all three of them. S_ATIME updates can be handled
541d4c798a5988 Jeff Layton       2023-08-07  2104   * independently of the rest.
541d4c798a5988 Jeff Layton       2023-08-07  2105   *
4c45d5090b1155 Christoph Hellwig 2025-12-23  2106   * Sets @dirty_flags to contain the I_DIRTY_FLAG_* flags for the actual changes.
4c45d5090b1155 Christoph Hellwig 2025-12-23  2107   *
4c45d5090b1155 Christoph Hellwig 2025-12-23  2108   * Returns 0 or a negative errno.
541d4c798a5988 Jeff Layton       2023-08-07  2109   */
4c45d5090b1155 Christoph Hellwig 2025-12-23  2110  int inode_update_timestamps(struct inode *inode, int flags, int *dirty_flags)
c3b2da31483449 Josef Bacik       2012-03-26  2111  {
541d4c798a5988 Jeff Layton       2023-08-07  2112  	struct timespec64 now;
4c45d5090b1155 Christoph Hellwig 2025-12-23  2113  	int updated = 0;
4c45d5090b1155 Christoph Hellwig 2025-12-23  2114  
4c45d5090b1155 Christoph Hellwig 2025-12-23  2115  	*dirty_flags = 0;
c3b2da31483449 Josef Bacik       2012-03-26  2116  
541d4c798a5988 Jeff Layton       2023-08-07  2117  	if (flags & (S_MTIME | S_CTIME | S_VERSION)) {
541d4c798a5988 Jeff Layton       2023-08-07  2118  		struct timespec64 ctime = inode_get_ctime(inode);
16a9496523a473 Jeff Layton       2023-10-04  2119  		struct timespec64 mtime = inode_get_mtime(inode);
0ae45f63d4ef8d Theodore Ts'o     2015-02-02  2120  
541d4c798a5988 Jeff Layton       2023-08-07  2121  		now = inode_set_ctime_current(inode);
541d4c798a5988 Jeff Layton       2023-08-07  2122  		if (!timespec64_equal(&now, &ctime))
541d4c798a5988 Jeff Layton       2023-08-07  2123  			updated |= S_CTIME;
486c4642bc02d2 Christoph Hellwig 2025-12-23  2124  		if (!timespec64_equal(&now, &mtime))
541d4c798a5988 Jeff Layton       2023-08-07  2125  			updated |= S_MTIME;
541d4c798a5988 Jeff Layton       2023-08-07  2126  		if (IS_I_VERSION(inode) && inode_maybe_inc_iversion(inode, updated))
541d4c798a5988 Jeff Layton       2023-08-07  2127  			updated |= S_VERSION;
541d4c798a5988 Jeff Layton       2023-08-07  2128  	} else {
541d4c798a5988 Jeff Layton       2023-08-07  2129  		now = current_time(inode);
e20b14db050ae2 Eric Biggers      2021-01-12  2130  	}
e20b14db050ae2 Eric Biggers      2021-01-12  2131  
541d4c798a5988 Jeff Layton       2023-08-07  2132  	if (flags & S_ATIME) {
16a9496523a473 Jeff Layton       2023-10-04  2133  		struct timespec64 atime = inode_get_atime(inode);
16a9496523a473 Jeff Layton       2023-10-04  2134  
486c4642bc02d2 Christoph Hellwig 2025-12-23  2135  		if (!timespec64_equal(&now, &atime))
541d4c798a5988 Jeff Layton       2023-08-07  2136  			updated |= S_ATIME;
541d4c798a5988 Jeff Layton       2023-08-07  2137  	}
486c4642bc02d2 Christoph Hellwig 2025-12-23  2138  
4c45d5090b1155 Christoph Hellwig 2025-12-23 @2139  	if (updated & (S_MTIME | S_CTIME | S_MTIME))
4c45d5090b1155 Christoph Hellwig 2025-12-23  2140  		*dirty_flags |= timestamp_dirty_flag(inode->i_sb);
4c45d5090b1155 Christoph Hellwig 2025-12-23  2141  	if (updated & S_VERSION)
4c45d5090b1155 Christoph Hellwig 2025-12-23  2142  		*dirty_flags |= I_DIRTY_SYNC;
4c45d5090b1155 Christoph Hellwig 2025-12-23  2143  
486c4642bc02d2 Christoph Hellwig 2025-12-23  2144  	if (updated & S_MTIME)
486c4642bc02d2 Christoph Hellwig 2025-12-23  2145  		inode_set_mtime_to_ts(inode, now);
486c4642bc02d2 Christoph Hellwig 2025-12-23  2146  	if (updated & S_ATIME)
486c4642bc02d2 Christoph Hellwig 2025-12-23  2147  		inode_set_atime_to_ts(inode, now);
4c45d5090b1155 Christoph Hellwig 2025-12-23  2148  
4c45d5090b1155 Christoph Hellwig 2025-12-23  2149  	return 0;
541d4c798a5988 Jeff Layton       2023-08-07  2150  }
541d4c798a5988 Jeff Layton       2023-08-07  2151  EXPORT_SYMBOL(inode_update_timestamps);
e20b14db050ae2 Eric Biggers      2021-01-12  2152  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
