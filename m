Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FF523EA8B
	for <oe-kbuild@lists.linux.dev>; Sat,  8 Aug 2026 01:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786154125; cv=none; b=YEDJVDgOCKYnydC1e6LpoHHrXUSaT+yuc2FwoQX0/wXf/fzBtEQLOQfIUU6yQ197WDUZNi8qTnSXoSY23VwmJOuaMP1r33wTMz/IpAEoCWYmLo+y1j22hXVs//Jwqyk89/26pkG3Y4R64MqGt/6+3gOX0flHUcH5CkaVbez4GiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786154125; c=relaxed/simple;
	bh=KToNdYJ4lD8BaaXbDU1DP8s3dT9NsOSppBKhZal0+38=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=si0XmT2WqoPww3N0biIN2tJkcxyNz5aQao90hA388MZevsz/4XY4rmkTXHpBSjxdrGzrR256Z2aWIvcJgeHa98T/YL865ml7j7vLu1CpyS1/p9vhTSrVqeOWBiYHuHDIkdyBBZI+dPsgfKGou+qDj+L+eLnu94bV9LfbssFBVDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lRU63rJG; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lRU63rJG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786154123; x=1817690123;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KToNdYJ4lD8BaaXbDU1DP8s3dT9NsOSppBKhZal0+38=;
  b=lRU63rJGzZ96VFFLiidVDDKs62qPEQ6Uwm5+BSfssmQ7252ByKfKnyO5
   w/z5vNxZR0XZpRgf2p5+it/qAZTyJLHlimKo5lo6tSYG6p/D8Nj8zwA7b
   1FPqgpKle2LBX9V9v2IuWb20nG8ASPvjka5ZuavKlXRZcMqYK3/VNUdyb
   5q0cUcOgU7Bk23x4XKJq8WuRlSqrwQA0osOeU4R7W5SklPmx578k7qdBf
   7Ya0/vFwbgqyffvUxhigjOhtwoOQeFl/C1dhHw9nLcgXoz++IA/EBGPkB
   Cur0Ubfat2NAkhZejyiPauYiJchwTTj0qtUqu/sL6zyP/rxDFTw7asOYb
   A==;
X-CSE-ConnectionGUID: AA6+UdjHRRK/rw12b45hfg==
X-CSE-MsgGUID: uHA2huryTPuWX658w1dCaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="90445165"
X-IronPort-AV: E=Sophos;i="6.25,211,1779174000"; 
   d="scan'208";a="90445165"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 18:55:23 -0700
X-CSE-ConnectionGUID: lrdXiDi4S2a6fvuPEYKZhA==
X-CSE-MsgGUID: My7hEKPWSLytLtC0UtTfLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,211,1779174000"; 
   d="scan'208";a="266395404"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 Aug 2026 18:55:21 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsWHO-00000000Jci-3uBs;
	Sat, 08 Aug 2026 01:55:18 +0000
Date: Sat, 8 Aug 2026 09:54:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] audit: add FSOPEN record to log filesystem name
Message-ID: <202608080923.Lf400oFq-lkp@intel.com>
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
In-Reply-To: <20260701132410.711205-1-rrobaina@redhat.com>
References: <20260701132410.711205-1-rrobaina@redhat.com>
TO: Ricardo Robaina <rrobaina@redhat.com>
TO: audit@vger.kernel.org
TO: linux-fsdevel@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: paul@paul-moore.com
CC: eparis@redhat.com
CC: viro@zeniv.linux.org.uk
CC: brauner@kernel.org
CC: jack@suse.cz
CC: Ricardo Robaina <rrobaina@redhat.com>

Hi Ricardo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pcmoore-audit/next]
[also build test WARNING on brauner-vfs/vfs.all linus/master v7.2-rc6 next-20260807]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ricardo-Robaina/audit-add-FSOPEN-record-to-log-filesystem-name/20260807-192421
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git next
patch link:    https://lore.kernel.org/r/20260701132410.711205-1-rrobaina%40redhat.com
patch subject: [PATCH] audit: add FSOPEN record to log filesystem name
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: sparc-randconfig-r071-20260808 (https://download.01.org/0day-ci/archive/20260808/202608080923.Lf400oFq-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608080923.Lf400oFq-lkp@intel.com/

New smatch warnings:
fs/fsopen.c:154 __do_sys_fsopen() warn: passing freed memory 'fs_name' (line 139)
fs/fsopen.c:154 __do_sys_fsopen() warn: passing freed memory 'fs_name' (line 139)

Old smatch warnings:
fs/fsopen.c:481 __do_sys_fsconfig() warn: variable dereferenced before check 'param.name' (see line 450)
fs/fsopen.c:481 __do_sys_fsconfig() warn: variable dereferenced before check 'param.name' (see line 450)

vim +/fs_name +154 fs/fsopen.c

007ec26cdc9fef David Howells   2018-11-01  113  
24dcb3d90a1f67 David Howells   2018-11-01  114  /*
24dcb3d90a1f67 David Howells   2018-11-01  115   * Open a filesystem by name so that it can be configured for mounting.
24dcb3d90a1f67 David Howells   2018-11-01  116   *
24dcb3d90a1f67 David Howells   2018-11-01  117   * We are allowed to specify a container in which the filesystem will be
24dcb3d90a1f67 David Howells   2018-11-01  118   * opened, thereby indicating which namespaces will be used (notably, which
24dcb3d90a1f67 David Howells   2018-11-01  119   * network namespace will be used for network filesystems).
24dcb3d90a1f67 David Howells   2018-11-01  120   */
24dcb3d90a1f67 David Howells   2018-11-01  121  SYSCALL_DEFINE2(fsopen, const char __user *, _fs_name, unsigned int, flags)
24dcb3d90a1f67 David Howells   2018-11-01  122  {
24dcb3d90a1f67 David Howells   2018-11-01  123  	struct file_system_type *fs_type;
24dcb3d90a1f67 David Howells   2018-11-01  124  	struct fs_context *fc;
24dcb3d90a1f67 David Howells   2018-11-01  125  	const char *fs_name;
007ec26cdc9fef David Howells   2018-11-01  126  	int ret;
24dcb3d90a1f67 David Howells   2018-11-01  127  
a5f85d7834f7e1 Al Viro         2022-03-01  128  	if (!may_mount())
24dcb3d90a1f67 David Howells   2018-11-01  129  		return -EPERM;
24dcb3d90a1f67 David Howells   2018-11-01  130  
24dcb3d90a1f67 David Howells   2018-11-01  131  	if (flags & ~FSOPEN_CLOEXEC)
24dcb3d90a1f67 David Howells   2018-11-01  132  		return -EINVAL;
24dcb3d90a1f67 David Howells   2018-11-01  133  
24dcb3d90a1f67 David Howells   2018-11-01  134  	fs_name = strndup_user(_fs_name, PAGE_SIZE);
24dcb3d90a1f67 David Howells   2018-11-01  135  	if (IS_ERR(fs_name))
24dcb3d90a1f67 David Howells   2018-11-01  136  		return PTR_ERR(fs_name);
24dcb3d90a1f67 David Howells   2018-11-01  137  
24dcb3d90a1f67 David Howells   2018-11-01  138  	fs_type = get_fs_type(fs_name);
24dcb3d90a1f67 David Howells   2018-11-01 @139  	kfree(fs_name);
24dcb3d90a1f67 David Howells   2018-11-01  140  	if (!fs_type)
24dcb3d90a1f67 David Howells   2018-11-01  141  		return -ENODEV;
24dcb3d90a1f67 David Howells   2018-11-01  142  
24dcb3d90a1f67 David Howells   2018-11-01  143  	fc = fs_context_for_mount(fs_type, 0);
24dcb3d90a1f67 David Howells   2018-11-01  144  	put_filesystem(fs_type);
24dcb3d90a1f67 David Howells   2018-11-01  145  	if (IS_ERR(fc))
24dcb3d90a1f67 David Howells   2018-11-01  146  		return PTR_ERR(fc);
24dcb3d90a1f67 David Howells   2018-11-01  147  
24dcb3d90a1f67 David Howells   2018-11-01  148  	fc->phase = FS_CONTEXT_CREATE_PARAMS;
007ec26cdc9fef David Howells   2018-11-01  149  
007ec26cdc9fef David Howells   2018-11-01  150  	ret = fscontext_alloc_log(fc);
007ec26cdc9fef David Howells   2018-11-01  151  	if (ret < 0)
007ec26cdc9fef David Howells   2018-11-01  152  		goto err_fc;
007ec26cdc9fef David Howells   2018-11-01  153  
aee6439c3eb4ef Ricardo Robaina 2026-07-01 @154  	audit_log_fsopen(fs_name);
aee6439c3eb4ef Ricardo Robaina 2026-07-01  155  
24dcb3d90a1f67 David Howells   2018-11-01  156  	return fscontext_create_fd(fc, flags & FSOPEN_CLOEXEC ? O_CLOEXEC : 0);
007ec26cdc9fef David Howells   2018-11-01  157  
007ec26cdc9fef David Howells   2018-11-01  158  err_fc:
007ec26cdc9fef David Howells   2018-11-01  159  	put_fs_context(fc);
007ec26cdc9fef David Howells   2018-11-01  160  	return ret;
24dcb3d90a1f67 David Howells   2018-11-01  161  }
ecdab150fddb42 David Howells   2018-11-01  162  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
