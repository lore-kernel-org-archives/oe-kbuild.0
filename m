Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C97241663
	for <oe-kbuild@lists.linux.dev>; Thu, 21 Aug 2025 09:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755770209; cv=none; b=WnN8kJXIPDxUVSt0dA+pnPGZjIPmYNrpau+LCSxj1epIW3FV3FEdHvaVjlRnGpTeW2EamfIafBC1+T4uCkd5q3AuPF3spjPS82oOZhAgAqvldMdyW5aJHmlfMNPdfEUerb7ql8XT1uXE8Z/q4vUWOMH5MKT5N7eCe5bPSoUEKh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755770209; c=relaxed/simple;
	bh=3jry8IwtCjNAGpcYvuyGA3eMnBxq5FzcH99p8zEib6w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TcXBV2XamW8yHXJB8UgPvn58M2mm9sT94Q8OMUGiqDvR1/2NsjlDWPJo2UaunY8tAJBCNZdl+tPawnSdjpmdHKXZQazwRHEP3qVpNwSVAZplXbr9ze1CVaxcn3IwvPNKKfKjmnICD8tOZHTHiuc356x1htTMuDQnHM/e7Snk/Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hbx3+Ttz; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hbx3+Ttz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755770207; x=1787306207;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3jry8IwtCjNAGpcYvuyGA3eMnBxq5FzcH99p8zEib6w=;
  b=hbx3+TtzQBjudUcWiOrZt6VO8yz/b7h41VdS+k4qINezIcUjRQuanopF
   4y+DvZrPju7VPI68hnRXcqA11OjnbL8QKk+4/SBJL7SJ+ep60Vjzm7WSA
   g2BKnT3rHAmtOAyBivDsNae3Fm9Ffg/EOAU1e4CMVzxfuIWvh/h80CstA
   rUimUPJqO5/ZBIeWf56YqRI+Tb02M7dwMu/2XFaGye06mLrT/fAiuuLIP
   fX/8eVDQX9x86hBHlat7EUgZTwlIPKM3u3AB7Hso97qRgrLxFdSQM8Mtr
   L1N5yl9RtHJMmlOzmieRN7IWj72Q3E+eYrTvFZs9/+RhQlyHHj3R0WHqT
   g==;
X-CSE-ConnectionGUID: qIfNPnSYSzuIVy9ibCMghw==
X-CSE-MsgGUID: p/tadK2GT1aNXDZ4/cbTHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="68324453"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="68324453"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 02:56:46 -0700
X-CSE-ConnectionGUID: e9IgXGDtSkar6IzAzIF7sg==
X-CSE-MsgGUID: n3xy2tpyRxKjEd5oOiG6tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="167879120"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 21 Aug 2025 02:56:44 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1up21y-000KAp-2A;
	Thu, 21 Aug 2025 09:56:32 +0000
Date: Thu, 21 Aug 2025 17:55:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [chao:bugfix/syzbot 21/21] fs/f2fs/sysfs.c:1811:2-8: Missing call to
 dput() at line 1811.
Message-ID: <202508211750.zNfjckT5-lkp@intel.com>
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
CC: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
TO: Jaegeuk Kim <jaegeuk@kernel.org>
CC: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/syzbot
head:   a910788bf8a9a5d791157a4df5222af3992e745e
commit: a910788bf8a9a5d791157a4df5222af3992e745e [21/21] f2fs: show the list of donation files
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-101-20250821 (https://download.01.org/0day-ci/archive/20250821/202508211750.zNfjckT5-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202508211750.zNfjckT5-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/f2fs/sysfs.c:1811:2-8: Missing call to dput() at line 1811.
   fs/f2fs/sysfs.c:1811:2-8: Missing call to dput() at line 1831.

vim +1811 fs/f2fs/sysfs.c

f238eff95f485b Jaegeuk Kim 2024-03-04  1771  
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1772  static int __maybe_unused donation_list_seq_show(struct seq_file *seq,
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1773  						void *offset)
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1774  {
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1775  	struct super_block *sb = seq->private;
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1776  	struct f2fs_sb_info *sbi = F2FS_SB(sb);
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1777  	struct inode *inode;
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1778  	struct f2fs_inode_info *fi;
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1779  	struct dentry *dentry;
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1780  	char *buf, *path;
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1781  	int i;
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1782  
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1783  	buf = f2fs_getname(sbi);
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1784  	if (!buf)
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1785  		return 0;
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1786  
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1787  	seq_printf(seq, "Donation List\n");
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1788  	seq_printf(seq, " # of files  : %u\n", sbi->donate_files);
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1789  	seq_printf(seq, " %-50s %10s %20s %20s %22s\n",
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1790  			"File path", "Status", "Donation offset (kb)",
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1791  			"Donation size (kb)", "File cached size (kb)");
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1792  	seq_printf(seq, "---\n");
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1793  
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1794  	for (i = 0; i < sbi->donate_files; i++) {
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1795  		spin_lock(&sbi->inode_lock[DONATE_INODE]);
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1796  		if (list_empty(&sbi->inode_list[DONATE_INODE])) {
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1797  			spin_unlock(&sbi->inode_lock[DONATE_INODE]);
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1798  			break;
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1799  		}
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1800  		fi = list_first_entry(&sbi->inode_list[DONATE_INODE],
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1801  					struct f2fs_inode_info, gdonate_list);
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1802  		list_move_tail(&fi->gdonate_list, &sbi->inode_list[DONATE_INODE]);
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1803  		inode = igrab(&fi->vfs_inode);
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1804  		spin_unlock(&sbi->inode_lock[DONATE_INODE]);
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1805  
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1806  		if (!inode)
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1807  			continue;
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1808  
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1809  		inode_lock_shared(inode);
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1810  
a910788bf8a9a5 Jaegeuk Kim 2025-08-11 @1811  		dentry = d_find_alias(inode);
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1812  		if (!dentry) {
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1813  			path = NULL;
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1814  		} else {
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1815  			path = dentry_path_raw(dentry, buf, PATH_MAX);
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1816  			if (IS_ERR(path))
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1817  				goto next;
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1818  		}
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1819  		seq_printf(seq, " %-50s %10s %20llu %20llu %22llu\n",
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1820  				path ? path : "<unlinked>",
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1821  				is_inode_flag_set(inode, FI_DONATE_FINISHED) ?
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1822  				"Evicted" : "Donated",
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1823  				(loff_t)fi->donate_start << (PAGE_SHIFT - 10),
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1824  				(loff_t)(fi->donate_end + 1) << (PAGE_SHIFT - 10),
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1825  				(loff_t)inode->i_mapping->nrpages << (PAGE_SHIFT - 10));
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1826  next:
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1827  		inode_unlock_shared(inode);
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1828  		iput(inode);
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1829  	}
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1830  	f2fs_putname(buf);
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1831  	return 0;
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1832  }
a910788bf8a9a5 Jaegeuk Kim 2025-08-11  1833  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
