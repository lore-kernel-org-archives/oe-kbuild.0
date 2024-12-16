Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996101D2785
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Dec 2024 20:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734381215; cv=none; b=PC3aorIM3NAyvxLiPLbXcIVheaguBjppRM88CzlqnG+D+T97XMyCAntQNuiYsoRriSzxmmVhphNTRs0HOl5qHfIsTA6fFQ7deV+fWdsr096wU+WXrfQ6A0Mf8YsRtlIiqxNsvB8wXdyVJqm+Ua3Tkrhy1lf8n6AojR/kaLP5FUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734381215; c=relaxed/simple;
	bh=/EhfWH2oscXMKu4kZc6M+YiTfn8GXSrYCgEAbfWlh8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JXjGe2qMt1YJc2wGz+fiiZjaugAhTlDRh51HFhzDKi351NL9XIe89/fMIgFMXOHl+c43hzDlsSYAwr8K2yluIkFlpt8Y9iX0YdDtSInbgX6q2b8GTZInlBs/j6s5kuP+tIS1B2hFOlPRFPo7SqXWG4jxfNLLrkRXOOYb0obBJ2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oC6NXj0S; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oC6NXj0S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734381214; x=1765917214;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/EhfWH2oscXMKu4kZc6M+YiTfn8GXSrYCgEAbfWlh8Q=;
  b=oC6NXj0SFS7LrBBMNR1GchknnjkB988Szh9SKPleOJvcXGBIBXmMNumS
   5JX5MCCJ1umW2JBL6knHGGoug5EEc7coaZ01CdMUJFFq6onAJp5SOeUfn
   MEAxob1c5W+gXREab5ZwpmbQTzwbSg7i/rY0kMcuvK2P3y1LN1CGNX67u
   h9CsitNiuQePVUsqS8GYfPrUPQuBMLIrVgoTlMB+3s8ka7Ox/S9j/im/Y
   DInyoiPOH+Rk3QhBlMZ2jA/vCp4ba246E669Wi0vUq7E/eP9oA2jLT+m1
   kfcXEkPtyUTjW1A88xXN1EpyDO6mjkT89HgYoI+zEhTU9VxaiyOl6SjIe
   A==;
X-CSE-ConnectionGUID: LHRYNIf9TEWAvmJvAqinMQ==
X-CSE-MsgGUID: gTyFsTH3RdusAcTunnQYOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="38559890"
X-IronPort-AV: E=Sophos;i="6.12,239,1728975600"; 
   d="scan'208";a="38559890"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 12:33:33 -0800
X-CSE-ConnectionGUID: H1rZp+UUQ+uLrwuq8AXeAw==
X-CSE-MsgGUID: O4UmbZymTXmT1UXAZbczlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134644322"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 16 Dec 2024 12:33:32 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNHmT-000ESq-2a;
	Mon, 16 Dec 2024 20:33:29 +0000
Date: Tue, 17 Dec 2024 04:32:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 3646/4379] kernel/bpf/verifier.c:19553
 add_used_map() warn: fd re-used after fget(): 'fd'
Message-ID: <202412170403.3hSZLClK-lkp@intel.com>
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
TO: Anton Protopopov <aspsk@isovalent.com>
CC: Andrii Nakryiko <andrii@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e25c8d66f6786300b680866c0e0139981273feba
commit: 4d3ae294f900fb7232fb6c890dbd3176b8a5f121 [3646/4379] bpf: Add fd_array_cnt attribute for prog_load
:::::: branch date: 14 hours ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20241216 (https://download.01.org/0day-ci/archive/20241217/202412170403.3hSZLClK-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412170403.3hSZLClK-lkp@intel.com/

smatch warnings:
kernel/bpf/verifier.c:19553 add_used_map() warn: fd re-used after fget(): 'fd'
kernel/bpf/verifier.c:22887 add_fd_from_fd_array() warn: fd re-used after fget(): 'fd'

vim +/fd +19553 kernel/bpf/verifier.c

535ead44ffd0847 Andrii Nakryiko  2024-08-06  19541  
4d3ae294f900fb7 Anton Protopopov 2024-12-13  19542  /* Add map behind fd to used maps list, if it's not already there, and return
4d3ae294f900fb7 Anton Protopopov 2024-12-13  19543   * its index.
4d3ae294f900fb7 Anton Protopopov 2024-12-13  19544   * Returns <0 on error, or >= 0 index, on success.
4d3ae294f900fb7 Anton Protopopov 2024-12-13  19545   */
4d3ae294f900fb7 Anton Protopopov 2024-12-13  19546  static int add_used_map(struct bpf_verifier_env *env, int fd)
4d3ae294f900fb7 Anton Protopopov 2024-12-13  19547  {
4d3ae294f900fb7 Anton Protopopov 2024-12-13  19548  	struct bpf_map *map;
4d3ae294f900fb7 Anton Protopopov 2024-12-13  19549  	CLASS(fd, f)(fd);
4d3ae294f900fb7 Anton Protopopov 2024-12-13  19550  
4d3ae294f900fb7 Anton Protopopov 2024-12-13  19551  	map = __bpf_map_get(f);
4d3ae294f900fb7 Anton Protopopov 2024-12-13  19552  	if (IS_ERR(map)) {
4d3ae294f900fb7 Anton Protopopov 2024-12-13 @19553  		verbose(env, "fd %d is not pointing to valid bpf_map\n", fd);
4d3ae294f900fb7 Anton Protopopov 2024-12-13  19554  		return PTR_ERR(map);
4d3ae294f900fb7 Anton Protopopov 2024-12-13  19555  	}
4d3ae294f900fb7 Anton Protopopov 2024-12-13  19556  
4d3ae294f900fb7 Anton Protopopov 2024-12-13  19557  	return __add_used_map(env, map);
4d3ae294f900fb7 Anton Protopopov 2024-12-13  19558  }
4d3ae294f900fb7 Anton Protopopov 2024-12-13  19559  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
