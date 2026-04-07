Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7FD38F651
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Apr 2026 07:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775545922; cv=none; b=D9c0aiVLN286rGViNg2ZqrSO9muN4DF0SDeSwg2Z4B/vpnLrsky9iK4xXlhRYi2+BopW0Let5luk0d7d1oT4/2lHSnSJCPvDSfI737C0VMKhtvAaZFB2mNIsdugQ3kSWW0iCfCEwrT23zHHQhjWFclHd88Ma16zyyG4WjbNx5n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775545922; c=relaxed/simple;
	bh=JXtNfLqSfPrC40uarpCbDSpRuHNvJxQJb10jxnWA7BI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nYeFUfho6GVrr6PkD4SQe6Ed/2eXRcqDBJ0KLS2AHGmCiKAj8uCi9I0rkwZWPQw7kIvIf5ZH+g3c9jPxsybNcjx2z011IpU7lQTGr56Lh5bMr4MKeAwDLaFUM3oTWgVtMpX5ariUZ0p6pKyDh7FElv8y8qXLGXeovTIiveSJaLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DEWICrmr; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DEWICrmr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775545921; x=1807081921;
  h=date:from:to:cc:subject:message-id;
  bh=JXtNfLqSfPrC40uarpCbDSpRuHNvJxQJb10jxnWA7BI=;
  b=DEWICrmrCfD95yHYglJjj8UtaOayvVUm7IiFC7/O5fBbKPJfCdkh6Mmt
   dXHLX0QCpRQlBvjIGPHywWTPqQMd694cAGzzUCUZWIBZFE2Zg0ZdVxsxn
   ybETNhEAQqyOW9wiIPcdQQMr+0tj0vGdStj6Q4sOQhbqo1/57rznAsQFg
   1ozXNvdxXLRy9w4thWxnJHqE2oFf6G1iXp3cWP3mXh6CXY5SvOs7jeU5D
   wlqO7StekbxLW1ojZce1tjwpeCy+7kp/hh+xJnFMVFqaD3e4oYZe6YZQe
   FFFpEkK5QpNUcoFKOdBPycLLMk8W6JnLK485vwWyvJwmWQG73IOoVZaDn
   A==;
X-CSE-ConnectionGUID: 5HWFhsvFSWeK4vF7m5WTpg==
X-CSE-MsgGUID: AFtQRKIYT9S2zfH+JGeWLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="94081791"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="94081791"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 00:12:01 -0700
X-CSE-ConnectionGUID: CVlH/laGQ+uR2oNrFD+giQ==
X-CSE-MsgGUID: NyDShlMlQea9pXCcAA8c/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="251379377"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Apr 2026 00:11:59 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wA0bN-000000000Ib-2cMt;
	Tue, 07 Apr 2026 07:11:57 +0000
Date: Tue, 07 Apr 2026 15:11:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [hubcap:for-next 1/6] fs/orangefs/orangefs-debugfs.c:244:20:
 sparse: sparse: unsigned value that used to be signed checked against zero?
Message-ID: <202604071540.ul3D0TzF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/orangefs/orangefs-debugfs.c:244:20: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Mike Marshall <hubcap@omnibond.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hubcap/linux.git for-next
head:   fb0898b77656046fd25c5f08cf89cd6e3899e6db
commit: 30b7c30781f0440e70a5e0c8943be423b57bbd9b [1/6] debugfs: take better advantage of strscpy.
:::::: branch date: 16 hours ago
:::::: commit date: 3 days ago
config: parisc-randconfig-r134-20260407 (https://download.01.org/0day-ci/archive/20260407/202604071540.ul3D0TzF-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260407/202604071540.ul3D0TzF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604071540.ul3D0TzF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/orangefs/orangefs-debugfs.c:244:20: sparse: sparse: unsigned value that used to be signed checked against zero?
   fs/orangefs/orangefs-debugfs.c:242:17: sparse: signed value source
   fs/orangefs/orangefs-debugfs.c:343:20: sparse: sparse: unsigned value that used to be signed checked against zero?
   fs/orangefs/orangefs-debugfs.c:341:17: sparse: signed value source

vim +244 fs/orangefs/orangefs-debugfs.c

44f4641073f132 fs/orangefs/orangefs-debugfs.c Martin Brandenburg 2016-08-15  234  
44f4641073f132 fs/orangefs/orangefs-debugfs.c Martin Brandenburg 2016-08-15  235  /*
44f4641073f132 fs/orangefs/orangefs-debugfs.c Martin Brandenburg 2016-08-15  236   * initialize the kernel-debug file.
44f4641073f132 fs/orangefs/orangefs-debugfs.c Martin Brandenburg 2016-08-15  237   */
0979cf95d201f7 fs/orangefs/orangefs-debugfs.c Greg Kroah-Hartman 2019-07-04  238  static void orangefs_kernel_debug_init(void)
44f4641073f132 fs/orangefs/orangefs-debugfs.c Martin Brandenburg 2016-08-15  239  {
31720a2b109b30 fs/orangefs/orangefs-debugfs.c Zhang Xiaoxu       2022-10-18  240  	static char k_buffer[ORANGEFS_MAX_DEBUG_STRING_LEN] = { };
30b7c30781f044 fs/orangefs/orangefs-debugfs.c Mike Marshall      2026-04-03  241  	size_t len =
30b7c30781f044 fs/orangefs/orangefs-debugfs.c Mike Marshall      2026-04-03  242  		strscpy(k_buffer, kernel_debug_string, sizeof(k_buffer) - 1);
44f4641073f132 fs/orangefs/orangefs-debugfs.c Martin Brandenburg 2016-08-15  243  
30b7c30781f044 fs/orangefs/orangefs-debugfs.c Mike Marshall      2026-04-03 @244  	if (len >= 0) {
9e835108a9ae1c fs/orangefs/orangefs-debugfs.c Thorsten Blum      2026-01-17  245  		k_buffer[len] = '\n';
9e835108a9ae1c fs/orangefs/orangefs-debugfs.c Thorsten Blum      2026-01-17  246  		k_buffer[len + 1] = '\0';
44f4641073f132 fs/orangefs/orangefs-debugfs.c Martin Brandenburg 2016-08-15  247  	} else {
9e835108a9ae1c fs/orangefs/orangefs-debugfs.c Thorsten Blum      2026-01-17  248  		strscpy(k_buffer, "none\n");
44f4641073f132 fs/orangefs/orangefs-debugfs.c Martin Brandenburg 2016-08-15  249  		pr_info("%s: overflow 1!\n", __func__);
44f4641073f132 fs/orangefs/orangefs-debugfs.c Martin Brandenburg 2016-08-15  250  	}
44f4641073f132 fs/orangefs/orangefs-debugfs.c Martin Brandenburg 2016-08-15  251  
c2a3a216c7e9ad fs/orangefs/orangefs-debugfs.c Al Viro            2025-01-12  252  	debugfs_create_file_aux_num(ORANGEFS_KMOD_DEBUG_FILE, 0444, debug_dir, k_buffer,
c2a3a216c7e9ad fs/orangefs/orangefs-debugfs.c Al Viro            2025-01-12  253  			    0, &kernel_debug_fops);
274dcf55bd4ab1 fs/orangefs/pvfs2-debugfs.c    Mike Marshall      2015-07-17  254  }
274dcf55bd4ab1 fs/orangefs/pvfs2-debugfs.c    Mike Marshall      2015-07-17  255  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
