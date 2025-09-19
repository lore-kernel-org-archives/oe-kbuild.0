Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7C127B50C
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Sep 2025 20:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758313227; cv=none; b=XuBepdgHyG8/HVwVgaBGSr4XH4JTKrKAOoy07fQDg+vPB6eMUoB4zfpEAPjrXCeDvgQ2av9bCM9dUfwDWLGFpUx4QRjfBzzFTtGLf2S4f8+3DCMwFwZVOggxV4njxTsqs8DNKZ6D1CjjI5h2dUL4W1R/wBPPcDzv9bcmuOXtrmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758313227; c=relaxed/simple;
	bh=0kw5OpeUMaCg2LL2JFrJY+AZcOnjlNgle+HNFoMJE24=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aof7lAo3Lzy6T/dpbe8BdT6aOl7eixSY9yYfmMm7EQ7PxYT8HpHM9tXf8R7QBWfMI1TssyUsii80aA+I+RPwZGQZrASp33vZV5Mlfaw4lAjlXdoBIuaR5zJ3j2i1VDdiwpw3JRKderJKs07LKJHS/tt4ds0ZImhyken8X5jQCR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jMXdCWMI; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jMXdCWMI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758313226; x=1789849226;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0kw5OpeUMaCg2LL2JFrJY+AZcOnjlNgle+HNFoMJE24=;
  b=jMXdCWMIGFdhc/1x0rQ7Rkz4GIDL0fGECylbKwzvvzhKG4ZTi3GrS7OK
   9u7BWocoCaHj316avusYhsy3Rj9vGscGg9Pgg8DOa7cujENIqzj4FRhSe
   JrIWU4mnyVxzLEsQYsqU/x3e4DU490R2JDv5VHCnvUCOSrNr7dpxw8qyh
   frrCVcWA251+h1IvJb3r1Sa240Xi5KS9ya5YZ2wwP9OV7aNP1OvqZ09yb
   tv+EVZpUwd4hVzs7zeF/9tqyaPBBIlS8hSSdeljifaVw/fVYDmrJldUIV
   BY6sqIIKLhncTkomVc+8Vop7w4dp43mbzcl0MlWrBgxkGVfg9Y3IIp5kt
   Q==;
X-CSE-ConnectionGUID: D5Ax7VNJRRWmWxWm9QPMFA==
X-CSE-MsgGUID: /YpBB+JlS9uVTrgvBOusuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11558"; a="70913664"
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="70913664"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 13:20:25 -0700
X-CSE-ConnectionGUID: ok5yh7L7SeuhhvPRqR6F4Q==
X-CSE-MsgGUID: TzFHiGt8QoO3ngwX1KzsUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="175478695"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 19 Sep 2025 13:20:24 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzhaf-0004mD-2F;
	Fri, 19 Sep 2025 20:20:21 +0000
Date: Sat, 20 Sep 2025 04:19:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 10249/11136] fs/dcache.o: warning: objtool:
 vfs_pressure_ratio+0x44: stack state mismatch: cfa1=3+0 cfa2=3+16
Message-ID: <202509200413.7uihAxJ5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Tiezhu Yang <yangtiezhu@loongson.cn>
CC: Huacai Chen <chenhuacai@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   846bd2225ec3cfa8be046655e02b9457ed41973e
commit: baad7830ee9a56756b3857348452fe756cb0a702 [10249/11136] objtool/LoongArch: Mark types based on break immediate code
:::::: branch date: 5 hours ago
:::::: commit date: 32 hours ago
config: loongarch-randconfig-002-20250920 (https://download.01.org/0day-ci/archive/20250920/202509200413.7uihAxJ5-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250920/202509200413.7uihAxJ5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509200413.7uihAxJ5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/dcache.o: warning: objtool: vfs_pressure_ratio+0x44: stack state mismatch: cfa1=3+0 cfa2=3+16
--
>> block/blk-settings.o: warning: objtool: queue_limit_alignment_offset+0x4c: stack state mismatch: cfa1=3+0 cfa2=3+16
>> block/blk-settings.o: warning: objtool: queue_limit_discard_alignment+0x7c: stack state mismatch: cfa1=3+0 cfa2=3+16
--
>> block/blk-merge.o: warning: objtool: blk_boundary_sectors_left+0x6c: return with modified stack frame
--
>> drivers/nvdimm/namespace_devs.o: warning: objtool: div_u64_rem+0x2c: stack state mismatch: cfa1=3+0 cfa2=3+16
--
>> fs/btrfs/zoned.o: warning: objtool: div_u64_rem+0x2c: stack state mismatch: cfa1=3+0 cfa2=3+16
--
>> fs/f2fs/gc.o: warning: objtool: div_u64_rem+0x2c: stack state mismatch: cfa1=3+0 cfa2=3+16
--
>> drivers/md/dm-era-target.o: warning: objtool: era_io_hints+0x74: stack state mismatch: cfa1=3+0 cfa2=3+16
--
>> drivers/md/dm-stats.o: warning: objtool: div64_u64_rem+0x28: stack state mismatch: cfa1=3+0 cfa2=3+16
--
>> drivers/md/dm-thin.o: warning: objtool: is_factor+0x30: stack state mismatch: cfa1=3+0 cfa2=3+16
--
>> drivers/md/dm-cache-target.o: warning: objtool: cache_io_hints+0x4c: stack state mismatch: cfa1=3+0 cfa2=3+16
--
>> drivers/md/dm-clone-target.o: warning: objtool: clone_io_hints+0x4c: stack state mismatch: cfa1=3+0 cfa2=3+16
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
