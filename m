Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2241849
	for <oe-kbuild@lists.linux.dev>; Fri,  4 Oct 2024 00:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728001140; cv=none; b=KzHdZX2W8hA2q8+TqLlk4Gr5W9KsXq8TziuhzpYZmDlfLGy1LHxniQ1xVMbRXhsEV+EL0+ZLQgOrnXtHjWqt0VwjweR6O1pHmFvBrbowAowXjG7oYk9He4zILV2O8/e96TZRu0HRr7M7VxWlBZaFCKy+aGueCSfRuBcHV+bJGew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728001140; c=relaxed/simple;
	bh=M3p7HjxZj5k5NVnAJ7K/Sci3/dCfvGVMGeilvUtZjhI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fTG2eSGZxscFKpWVox5pKSrZjsmUKiMyMMBPLWOiqFucrvpNfwVNegFYs8vc/7cRcAp7TeetSdJuzZhfcJm8kkeNtUBL57Ax2uX6wtitcLmn/5F2ffTIvK8wtmqdQ6xDQxzajNvUXMMT4IMtp6zC8gpjh4SBwxFpUdQcMjSekTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jHOhfn2S; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jHOhfn2S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728001138; x=1759537138;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M3p7HjxZj5k5NVnAJ7K/Sci3/dCfvGVMGeilvUtZjhI=;
  b=jHOhfn2S7TAvgzdq1txzagW3Kth6Hq8Xz2515zaZa/krffNh3jEFLHb2
   KjAXSXFGpzqiTrrGl2YLxDFezfbeA5YD+dJos+S49NhqXQvp0jgk1TqG5
   Y+3bik8k7cKsfJ4ogKk2OUN3XMiE/YIl5ZYBGZSZzqGlf4yZEXS6GTgxR
   YIPfTnuBU383NELaQnTUauTwwldd+6dGuid2i6bYH7eyvLnhGFd0rQGEq
   yDJGGIYn3MN0uOqmc4WwEE+BGkCa5UTslk+Sb/gsQONzJkDHpbgSIG+iQ
   ZUhgbLWBYrgFnbl4SQM3BCvq8DCmgz+GEkyY2rBeeZ3dMOdezRRfGWbJu
   Q==;
X-CSE-ConnectionGUID: c2wJXtBPRb+x41oKHUR0ug==
X-CSE-MsgGUID: fjqm9Bi7TNicnCiLTA0/0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="30096494"
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; 
   d="scan'208";a="30096494"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 17:18:57 -0700
X-CSE-ConnectionGUID: Yb+0bNxlTqeEkXhdv0NiDg==
X-CSE-MsgGUID: 3HZlOvAnSvKrUlW1jbefOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; 
   d="scan'208";a="74523289"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Oct 2024 17:18:57 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swW22-00013Q-27;
	Fri, 04 Oct 2024 00:18:54 +0000
Date: Fri, 4 Oct 2024 08:18:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/reiserfs/inode.o: warning: objtool: reiserfs_write_folio+0x4ac:
 unreachable instruction
Message-ID: <202410040851.kuibxeM1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Matthew Wilcox (Oracle)" <willy@infradead.org>
CC: Jan Kara <jack@suse.cz>

Hi Matthew,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8c245fe7dde3bf776253550fc914a36293db4ff3
commit: 4f8cf60ac18bee62e8c58654a300eb44b96caf09 reiserfs: Convert to writepages
date:   6 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 6 months ago
config: loongarch-randconfig-001-20240804 (https://download.01.org/0day-ci/archive/20241004/202410040851.kuibxeM1-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410040851.kuibxeM1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410040851.kuibxeM1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/reiserfs/inode.o: warning: objtool: restart_transaction+0x4c: unreachable instruction
   fs/reiserfs/inode.o: warning: objtool: reiserfs_write_begin+0xac: unreachable instruction
   fs/reiserfs/inode.o: warning: objtool: __reiserfs_write_begin+0xa8: unreachable instruction
>> fs/reiserfs/inode.o: warning: objtool: reiserfs_write_folio+0x4ac: unreachable instruction
   fs/reiserfs/inode.o: warning: objtool: reiserfs_new_inode+0x8c: unreachable instruction


objdump-func vmlinux.o reiserfs_write_folio:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
