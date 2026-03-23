Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC3949620
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Mar 2026 02:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774231662; cv=none; b=XAfCXcs8S5nXJTSujvOBhB4MNZOPAIqLH7kuuYJBdhG8lbyY9j2QzwmeMybtlPmMgWDYYVmhRqMqxvhhNtIIuqMnXBL9k3X3TtdDMYY3s4ZrmVkz1aK0wT0DaM6mV45VAskJIssmN6Ny3+iItmDqEBn5wp9LIqSQgj12x3OE4u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774231662; c=relaxed/simple;
	bh=65GyuxGLb9OC5hxvJVDlmAdkA8kiEXcC5/0/tSVEJDM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BKDYf7sZUWaxJAFBHxLwQ1dP9twzJVtJQQZisJVDYXOF5Mn1XHxfHnacEZlQcG5c9byaCM8r3ZX1bY/u48a5J3rAG0q6FHrLIQGvwkt+83qPXmiphczRHmqlyaq9S8dNvNpoJyq9ID71+NlLwGeRUUk9H8t8zABHktBg3ibXxEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NwHtb7as; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NwHtb7as"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774231660; x=1805767660;
  h=date:from:to:cc:subject:message-id;
  bh=65GyuxGLb9OC5hxvJVDlmAdkA8kiEXcC5/0/tSVEJDM=;
  b=NwHtb7asK3WPjJS7FeJEHx3f41Y+K8vQQuQ4jMg4tqpr2l0L50am+T0J
   AwZzSSRm00fgkE6IpiRA13C1e6P2hAEQ6JxaHYqL9P+imA0XAGHcxR9wk
   H7LELR5mITT3jBqpDcKOpXr+Hn/gKL1BU+AQfnDvUM/f+H2sARzyrq9VX
   oCuiOvlwuelrPFqgYlPNBX1F1EWkhkoccjB8y6ZtDqlO3X1stpHSnHi3r
   6Wj8XW8W/Fa9xt7J8/7Dddl/09HsBWEJy+9tLKHtcmEnRK2j9iYI+oBR/
   JyrgN2EeMMpppQqAfJQyJunijXT3IShBYGtGdSQZ7jx2pzjHm5j2btOzY
   g==;
X-CSE-ConnectionGUID: 42G8//uTQjyser6F+4XNEA==
X-CSE-MsgGUID: wipWJuvjTniRyekvAVAIHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="85925434"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="85925434"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 19:07:40 -0700
X-CSE-ConnectionGUID: uOQjGsQyTGyIaJW6kYaKMw==
X-CSE-MsgGUID: B1CchKNhTV+0T/nPqtCfJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="220646385"
Received: from lkp-server01.sh.intel.com (HELO b2269c5cf7eb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 22 Mar 2026 19:07:39 -0700
Received: from kbuild by b2269c5cf7eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4Uhc-00000000021-3qPf;
	Mon, 23 Mar 2026 02:07:36 +0000
Date: Mon, 23 Mar 2026 10:06:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/btrfs/extent_map.o: warning: objtool:
 btrfs_split_extent_map+0x84: unreachable instruction
Message-ID: <202603230936.Li8Ucr1z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Filipe Manana <fdmanana@suse.com>
CC: David Sterba <dsterba@suse.com>

Hi Filipe,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c369299895a591d96745d6492d4888259b004a9e
commit: d846a6d3b09fa046e061ea6ec6daba67e66a7101 btrfs: rename remaining exported extent map functions
date:   10 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 10 months ago
config: loongarch-randconfig-r053-20260318 (https://download.01.org/0day-ci/archive/20260323/202603230936.Li8Ucr1z-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260323/202603230936.Li8Ucr1z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603230936.Li8Ucr1z-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/btrfs/extent_map.o: warning: objtool: merge_ondisk_extents+0x98: unreachable instruction
   fs/btrfs/extent_map.o: warning: objtool: btrfs_add_extent_mapping+0x284: unreachable instruction
   fs/btrfs/extent_map.o: warning: objtool: btrfs_drop_extent_map_range+0x4c8: unreachable instruction
>> fs/btrfs/extent_map.o: warning: objtool: btrfs_split_extent_map+0x84: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
