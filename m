Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667593911C3
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Aug 2026 14:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786113637; cv=none; b=dvBykQrv+iXM78JrXg3dAQXEyrwvfL3rdJ/sU6bxregEKqUbbPlRortSEq9CUHaBbeLb9FhvFEQIzXW+Rjm+xmSscW5gMhauekzbJU3pO8we7kvO8C2dxYCRNRTi9NEul5dxUvOTFDfm62iq/zBM0u7GBNZFaxJ0u1oc2DECocg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786113637; c=relaxed/simple;
	bh=BhVOBZszEaDySTH4gucXeBGnuUXLISohefliTLTPR94=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JGFE0kSxuvlo6zPWMbKitFuKBJR1d0o+5ZyXd+kS7fqhe/IzsKyAgmXD8616IOvF4a7qjiuyw9yqejiP7czmXdVvxZ2MfsHVnebfoIFRoIJYK9HMRVd1ZAIQa+xKefAqSKmAs4mJui3fEW9Z3PiQKdcLEM8jiOP0yYogQSlmS4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gtsD3PQi; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gtsD3PQi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786113615; x=1817649615;
  h=date:from:to:cc:subject:message-id;
  bh=BhVOBZszEaDySTH4gucXeBGnuUXLISohefliTLTPR94=;
  b=gtsD3PQiIPgnypWM4OgIVQQ3YBmk8GpRsfpnYl3u98tqodT2YMhhx5cs
   YKv1wqzXmXoMF/+oylatvDDHsxNR+MhH9k7pWaBDRy2iKMgG8Xw0kYPxz
   wTRwcKvFfeY7m08Qk761Y2Kgep/8pyU9rJLe5MG3r1lzZcVoNBG7V6eJ+
   OPXcjk8+cAG94yod8bDhmnCQVlyqkAdrOjmPLS29Rs8XDqhx5WC/ptdfN
   vc0N1/WR6oBPg6o69nMte9kQSVxyg2LX2K8hD57IRsw9niQPRBGZK4baD
   64zG1EvreVqt0FgY5IIBpsom5ZmzgpQKjOzzUWhZAAnevwR9pv/mePmvC
   w==;
X-CSE-ConnectionGUID: cKPDgU4bT4mVqSdpeb7xOQ==
X-CSE-MsgGUID: MAvDdm1pS1KsvTGPDCN+qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="85695776"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="85695776"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 07:40:12 -0700
X-CSE-ConnectionGUID: rhibp11ZRzesV/r9G7Ts5w==
X-CSE-MsgGUID: QG+5BEPzTQ6bD0066tq39A==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Aug 2026 07:40:11 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsLk0-00000000IVN-1I3F;
	Fri, 07 Aug 2026 14:40:08 +0000
Date: Fri, 07 Aug 2026 22:39:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/char/xillybus/xillybus_class.c:230
 xillybus_find_inode() warn: variable dereferenced before check 'inode' (see
 line 226)
Message-ID: <202608072246.Ee6OOcT6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Eli Billauer <eli.billauer@gmail.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Eli-Billauer/char-xillybus-Improve-control-of-execution-flow-with-mutexes/20260806-033404
head:   d05c024c9354aabd2ea64be46e6fccbf24ba33cd
commit: 16edb90c39a5645b3803be32b2b77476efae2402 char: xillybus: Add defensive sanity checks
date:   2 days ago
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141 (https://download.01.org/0day-ci/archive/20260807/202608072246.Ee6OOcT6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608072246.Ee6OOcT6-lkp@intel.com/

smatch warnings:
drivers/char/xillybus/xillybus_class.c:230 xillybus_find_inode() warn: variable dereferenced before check 'inode' (see line 226)

vim +/inode +230 drivers/char/xillybus/xillybus_class.c

8cb5d216ab3365 Eli Billauer  2021-05-26  222  
8cb5d216ab3365 Eli Billauer  2021-05-26  223  int xillybus_find_inode(struct inode *inode,
8cb5d216ab3365 Eli Billauer  2021-05-26  224  			void **private_data, int *index)
8cb5d216ab3365 Eli Billauer  2021-05-26  225  {
8cb5d216ab3365 Eli Billauer  2021-05-26 @226  	int minor = iminor(inode);
8cb5d216ab3365 Eli Billauer  2021-05-26  227  	int major = imajor(inode);
4834f9898c7301 Jakob Koschel 2022-03-24  228  	struct xilly_unit *unit = NULL, *iter;
8cb5d216ab3365 Eli Billauer  2021-05-26  229  
16edb90c39a564 Eli Billauer  2026-06-30 @230  	if (!inode || !private_data || !index)
16edb90c39a564 Eli Billauer  2026-06-30  231  		return -ENODEV;
16edb90c39a564 Eli Billauer  2026-06-30  232  
8cb5d216ab3365 Eli Billauer  2021-05-26  233  	mutex_lock(&unit_mutex);
8cb5d216ab3365 Eli Billauer  2021-05-26  234  
4834f9898c7301 Jakob Koschel 2022-03-24  235  	list_for_each_entry(iter, &unit_list, list_entry)
4834f9898c7301 Jakob Koschel 2022-03-24  236  		if (iter->major == major &&
4834f9898c7301 Jakob Koschel 2022-03-24  237  		    minor >= iter->lowest_minor &&
4834f9898c7301 Jakob Koschel 2022-03-24  238  		    minor < (iter->lowest_minor + iter->num_nodes)) {
4834f9898c7301 Jakob Koschel 2022-03-24  239  			unit = iter;
8cb5d216ab3365 Eli Billauer  2021-05-26  240  			break;
8cb5d216ab3365 Eli Billauer  2021-05-26  241  		}
8cb5d216ab3365 Eli Billauer  2021-05-26  242  
c002f04c0bc79e Eli Billauer  2022-11-17  243  	if (!unit) {
8cb5d216ab3365 Eli Billauer  2021-05-26  244  		mutex_unlock(&unit_mutex);
8cb5d216ab3365 Eli Billauer  2021-05-26  245  		return -ENODEV;
c002f04c0bc79e Eli Billauer  2022-11-17  246  	}
8cb5d216ab3365 Eli Billauer  2021-05-26  247  
8cb5d216ab3365 Eli Billauer  2021-05-26  248  	*private_data = unit->private_data;
8cb5d216ab3365 Eli Billauer  2021-05-26  249  	*index = minor - unit->lowest_minor;
8cb5d216ab3365 Eli Billauer  2021-05-26  250  
c002f04c0bc79e Eli Billauer  2022-11-17  251  	mutex_unlock(&unit_mutex);
8cb5d216ab3365 Eli Billauer  2021-05-26  252  	return 0;
8cb5d216ab3365 Eli Billauer  2021-05-26  253  }
8cb5d216ab3365 Eli Billauer  2021-05-26  254  EXPORT_SYMBOL(xillybus_find_inode);
8cb5d216ab3365 Eli Billauer  2021-05-26  255  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
