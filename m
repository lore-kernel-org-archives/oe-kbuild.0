Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51832BEC2B
	for <oe-kbuild@lists.linux.dev>; Sun, 12 Apr 2026 06:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775975432; cv=none; b=N19A8TkLQgJzzCV2OS5GecUgBpN+SSWVJ7D3153Tew5VF1TY6k/LKnkLCTB2CoK3+QH3ZJkRoUwVdNylVyNjevQt+2boAsY1Ptb9Xv8pKDdLYnAkTvVtD9F1CXf0vWobip2vkfDFCZqMhR5CwZBZy3/wYsR924cZf86JVVlSWH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775975432; c=relaxed/simple;
	bh=aRvzgPCkzHTHYS5VXWpqZ7bLHDenncbnnFPQcsWT8XI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SAeoo/0AZL/Ni++mvy4crQZIku8bSzbJl57dDzH3VTSuVhb95+1Ljt4fRjfoxpknT0LCKYwX1nFoti0L7SAZjFzLsO8YbeVeg5X3d3vkiVlMLc8phakoW0ztg3qU1sOiiajHaA7VN9Fcj91Z74rKQuHEarKiyu/f4YVVjF6Jm8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X+EWaNi7; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X+EWaNi7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775975430; x=1807511430;
  h=date:from:to:cc:subject:message-id;
  bh=aRvzgPCkzHTHYS5VXWpqZ7bLHDenncbnnFPQcsWT8XI=;
  b=X+EWaNi7EZDP6HukiCYucGN1J+uCCFiLQmoeJEEoeRSCMQjAu3bLnxXA
   hSqXSedmIya1s254+zyWKohkcRv+xr4ZzoLEXT6geDiJqmS23HSBeJwJw
   Eg7QVXuUA6UnR5irtaruLkPLKiQnpFB1RhaZCcvidi5x0UMNn0dddQdi9
   FFdce8XtwDvsuKILl99I3L8vIqV7L8mUdcN0vOzzUFSDMln3sm7MmOb98
   gsqLFlM11RUFeluM+ipplqstwSUsUJNz9K2QMCF/JAG9NeE50ChjCrgx/
   Cwu/dC4Zi8ynFQ2AS2Dh1LpqgJE4719MFIY+C5yAn5rbi74ddbl9F4OyQ
   g==;
X-CSE-ConnectionGUID: 7BAZD3tsR2yZ96dDhOd+SQ==
X-CSE-MsgGUID: VpQBN6A1S9epTcR2BTSupQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="102400090"
X-IronPort-AV: E=Sophos;i="6.23,174,1770624000"; 
   d="scan'208";a="102400090"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2026 23:30:29 -0700
X-CSE-ConnectionGUID: 2ADmyeH9RuaWwAa8HgI2oQ==
X-CSE-MsgGUID: OBxRUHEnSLm8qcQj4lS74g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,174,1770624000"; 
   d="scan'208";a="231217075"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 11 Apr 2026 23:30:29 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBoKw-00000000BGH-2fFa;
	Sun, 12 Apr 2026 06:30:26 +0000
Date: Sun, 12 Apr 2026 08:29:41 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/ext4/orphan.c:744:29: warning: format '%llu' expects
 argument of type 'long long unsigned int', but argument 3 has type 'long
 unsigned int'
Message-ID: <202604120850.BhCcxSX6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ye Bin <yebin10@huawei.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Ye-Bin/ext4-register-orphan_list-procfs/20260412-043155
head:   40c8b08a765262ff0c3d84ac9ac0ec5110487e8c
commit: cf76577bfa266ccf03e5c8ab1775327709c32984 ext4: show inode orphan list detail information
date:   10 hours ago
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260412/202604120850.BhCcxSX6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260412/202604120850.BhCcxSX6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604120850.BhCcxSX6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/ext4/orphan.c: In function 'ext4_orphan_seq_show':
>> fs/ext4/orphan.c:744:29: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 3 has type 'long unsigned int' [-Wformat=]
     744 |         seq_printf(seq, "%llu\t%u\t%llu\t%llu\t%u\t",
         |                          ~~~^
         |                             |
         |                             long long unsigned int
         |                          %lu
     745 |                    inode->i_ino, inode->i_nlink,
         |                    ~~~~~~~~~~~~
         |                         |
         |                         long unsigned int


vim +744 fs/ext4/orphan.c

9dcd2ef939ebbc Ye Bin 2026-04-03  733  
9dcd2ef939ebbc Ye Bin 2026-04-03  734  static int ext4_orphan_seq_show(struct seq_file *seq, void *v)
9dcd2ef939ebbc Ye Bin 2026-04-03  735  {
cf76577bfa266c Ye Bin 2026-04-03  736  	struct inode *inode = v;
cf76577bfa266c Ye Bin 2026-04-03  737  	struct ext4_proc_orphan *s = seq->private;
cf76577bfa266c Ye Bin 2026-04-03  738  
cf76577bfa266c Ye Bin 2026-04-03  739  	if (s->print_title) {
cf76577bfa266c Ye Bin 2026-04-03  740  		seq_puts(seq, "INO\tNLINK\tSIZE\tBLOCKS\tPROJID\tPATH\n");
cf76577bfa266c Ye Bin 2026-04-03  741  		s->print_title = false;
cf76577bfa266c Ye Bin 2026-04-03  742  	}
cf76577bfa266c Ye Bin 2026-04-03  743  
cf76577bfa266c Ye Bin 2026-04-03 @744  	seq_printf(seq, "%llu\t%u\t%llu\t%llu\t%u\t",
cf76577bfa266c Ye Bin 2026-04-03  745  		   inode->i_ino, inode->i_nlink,
cf76577bfa266c Ye Bin 2026-04-03  746  		   i_size_read(inode), inode->i_blocks,
cf76577bfa266c Ye Bin 2026-04-03  747  		   __kprojid_val(EXT4_I(inode)->i_projid));
cf76577bfa266c Ye Bin 2026-04-03  748  
cf76577bfa266c Ye Bin 2026-04-03  749  	ext4_show_filename(seq, inode);
cf76577bfa266c Ye Bin 2026-04-03  750  
9dcd2ef939ebbc Ye Bin 2026-04-03  751  	return 0;
9dcd2ef939ebbc Ye Bin 2026-04-03  752  }
9dcd2ef939ebbc Ye Bin 2026-04-03  753  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
