Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5B91D0E24
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Oct 2024 12:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728305333; cv=none; b=gJfCsPZJpQ/p7oUGIz8+CBd+/4CJU6LtPgQOFzmaBi6uU9qjfOuWH9GJJ3kcEEt2yzUcU4Swkg4N8ERrnWZqHyGo949jNQv2L/UCOBwjZAz7hjyW2kdrXs3HR5gdcGBwiRA4CoaYalgnuMQ1yzSAuMYszqBeSMPu48z3KTEGugA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728305333; c=relaxed/simple;
	bh=Fh24j+8zvVRBQ1XgjKzfG++fWpxRDED7guKYuWob0SY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s5MV1AHAD8WHcXdNhysbMkQ4rVakJccfjQu4G+8X4+LfaoJCjQ32hEB+hCHgou4jnSl7m9pEBAH6cuwgf0ZRclNxyh/139HjpWQW6fyKnsaNi+vub1kKvj7elo3ai8gsAjnMIqZB1BBLj6gpBdbyVY6cJ6pcKkNZv+9TmrMuHZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dzm6Suha; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dzm6Suha"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728305332; x=1759841332;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fh24j+8zvVRBQ1XgjKzfG++fWpxRDED7guKYuWob0SY=;
  b=Dzm6Suhaz9A+GS4+/+O0dsQPi48BrWDL3vkYGmRUBQLqAuTyKAxiEQM+
   rLd8ZkOzyKb+Y0mm52kvLW0kYA5zo0XdUVQetnKB+RqX+JHTJstIeje+5
   dcd9NZ0rk05lq/shbhwUFI6be/+81sOJFd9uFLJA9e4Kast/w0eQ71B+1
   M9BDcxSlDPHXYiJO+zLYiDiecNNn7EXWxgzUYiyHTjIJ20RdWbUFAJs/o
   Ki1ibvsjlazNwucSiAAX7dbcVH9AssVYom8iS0d6CYFge/UvQHuk7mnMJ
   hrw1a21ctCZDR3Tmxtki9ugSZK2nOsgCPtM3XsNlZKPGWLk6Cp/ssFzRR
   A==;
X-CSE-ConnectionGUID: n25kev4vTPuU1E/3wHMNKA==
X-CSE-MsgGUID: HxiEJxCnT8KMEu++QRFfjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="31152287"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="31152287"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 05:48:52 -0700
X-CSE-ConnectionGUID: aulTz16tREecjWMVaJ2t1w==
X-CSE-MsgGUID: vJRIGXNhSw2revkOXSyG1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="80055138"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 Oct 2024 05:48:50 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxnAO-0004z4-0Q;
	Mon, 07 Oct 2024 12:48:48 +0000
Date: Mon, 7 Oct 2024 20:48:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/ext4/inode.o: warning: objtool: ext4_block_write_begin+0x8c:
 unreachable instruction
Message-ID: <202410072040.zuKQj6cJ-lkp@intel.com>
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
TO: Shida Zhang <zhangshida@kylinos.cn>
CC: "Theodore Ts'o" <tytso@mit.edu>
CC: Jan Kara <jack@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b
commit: 6b730a405037501a260d6efd24782d2737e65d07 ext4: hoist ext4_block_write_begin and replace the __block_write_begin
date:   5 weeks ago
:::::: branch date: 14 hours ago
:::::: commit date: 5 weeks ago
config: loongarch-randconfig-001-20240804 (https://download.01.org/0day-ci/archive/20241007/202410072040.zuKQj6cJ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241007/202410072040.zuKQj6cJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410072040.zuKQj6cJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/ext4/inode.o: warning: objtool: ext4_chksum.isra.0+0x50: unreachable instruction
   fs/ext4/inode.o: warning: objtool: mpage_release_unused_pages+0x1dc: unreachable instruction
   fs/ext4/inode.o: warning: objtool: ext4_da_get_block_prep+0x4c: unreachable instruction
   fs/ext4/inode.o: warning: objtool: ext4_getblk+0x7c: unreachable instruction
>> fs/ext4/inode.o: warning: objtool: ext4_block_write_begin+0x8c: unreachable instruction
   fs/ext4/inode.o: warning: objtool: ext4_do_writepages+0x14c: unreachable instruction


objdump-func vmlinux.o ext4_block_write_begin:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
