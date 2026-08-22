Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264F419D89E
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Aug 2026 03:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787370815; cv=none; b=LxYTivJcTQoZRT1PwDtwMc0MpGs4qoctnT/sp2IpPXyHf+KbE6feVdB9dLDIG82b5zJOp/G0G9DZXJZ40AZSnhKkfIMhsjZhR07vuY0I0vS7zo4QpKZlmi41hCilUhKiuP+aLuNx9rtgVa0RTuLowcHcypgDwZyHltc3pJdgb88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787370815; c=relaxed/simple;
	bh=S47ishVy8LWB3kiR5ezzONYmncfXZTchuXLk9dnoRvI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=U9QYZSvMAF5UbdT5+P00rfIZsrOIHFYjrRXq8zUrjPH+O/4NrtL7l7ZAuIv5yO0iWZIieHNJkV6HXRx2Gg3Xh4uopynPsMJbBkfs/rU7xV/vLHuX+HNxSz9tHOfeZ35OQwLusrM3MmuzWJcCDJE+AqXPp6RLFN9vdQmjARFjdHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QSTAQDzf; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QSTAQDzf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787370813; x=1818906813;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=S47ishVy8LWB3kiR5ezzONYmncfXZTchuXLk9dnoRvI=;
  b=QSTAQDzfUwZs1ViRHp+1ghOiay8apAcHSuWRsPumAixFlHSDhKPJOsuq
   JcLK65fBZXDx/+Y6VRPoCQ/bU+RQJnD8+8AIJfOJNf+Unv+B2wa3IvvbH
   GjLCgGByZneKdCIc/OkStG2/pNIt8aDdIRRFTXqa1enw5jsdacRLLaDnz
   sM11A7jScOWt7lqczmxUEbLtEZW3DugosiHFfq8CfcNk8GOYS1knQT2iE
   f+2Ev4Cjeb+Od3bGvg2pDW6FDkTleMNN/AgNnABRfJ57tac9uZdeb31AJ
   yNIf0HDxdST2pcg+FcHFmmxp8+sijY1EIRBcQ6ZBqjTlBkkK+gmA5VFnq
   Q==;
X-CSE-ConnectionGUID: KHDlR7ANRJWPwLfZiFa2IA==
X-CSE-MsgGUID: uYiGv5gNTxW0mZFWLd4sPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="110702365"
X-IronPort-AV: E=Sophos;i="6.25,236,1779174000"; 
   d="scan'208";a="110702365"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 20:53:33 -0700
X-CSE-ConnectionGUID: FoYoVqvHTX2o2iVZTi073g==
X-CSE-MsgGUID: rANaHKXcQL+aG/RhYlojKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,236,1779174000"; 
   d="scan'208";a="296419114"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 21 Aug 2026 20:53:31 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxcnR-00000000qs5-0kjF;
	Sat, 22 Aug 2026 03:53:29 +0000
Date: Sat, 22 Aug 2026 11:52:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [thomas-weissschuh:b4/kunit-kselftests 16/21]
 lib/kunit/kunit-uapi.c:126 kunit_uapi_open_standard_streams() warn: double
 fget(): 'stdin_fd'
Message-ID: <202608221146.0FrVaqNY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Thomas Wei=C3=9Fschuh" <thomas.weissschuh@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/l=
inux.git b4/kunit-kselftests
head:   72d2e686899cc0b009dcc94460feb2e632a676bd
commit: 86cdb0f09bbab1abe037777efbbec98be7c21cd9 [16/21] kunit: uapi: Forwa=
rd test executable output to KUnit log
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: x86_64-randconfig-r072-20260822 (https://download.01.org/0day-ci/ar=
chive/20260822/202608221146.0FrVaqNY-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e98466=
48fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608221146.0FrVaqNY-lkp@intel.com/

smatch warnings:
lib/kunit/kunit-uapi.c:126 kunit_uapi_open_standard_streams() warn: double =
fget(): 'stdin_fd'

vim +/stdin_fd +126 lib/kunit/kunit-uapi.c

036564cc93d9e19 Thomas Wei=C3=9Fschuh 2024-10-16  100 =20
86cdb0f09bbab1a Thomas Wei=C3=9Fschuh 2026-04-07  101  static int kunit_uap=
i_open_standard_streams(void)
86cdb0f09bbab1a Thomas Wei=C3=9Fschuh 2026-04-07  102  {
86cdb0f09bbab1a Thomas Wei=C3=9Fschuh 2026-04-07  103  	struct vfsmount *de=
vtmpfs __free(kern_unmount) =3D kunit_uapi_mount_fs("devtmpfs");
86cdb0f09bbab1a Thomas Wei=C3=9Fschuh 2026-04-07  104  	if (IS_ERR(devtmpfs=
))
86cdb0f09bbab1a Thomas Wei=C3=9Fschuh 2026-04-07  105  		return PTR_ERR(dev=
tmpfs);
86cdb0f09bbab1a Thomas Wei=C3=9Fschuh 2026-04-07  106 =20
86cdb0f09bbab1a Thomas Wei=C3=9Fschuh 2026-04-07  107  	CLASS(get_unused_fd=
, stdin_fd)(O_RDONLY);
86cdb0f09bbab1a Thomas Wei=C3=9Fschuh 2026-04-07  108  	if (stdin_fd < 0)
86cdb0f09bbab1a Thomas Wei=C3=9Fschuh 2026-04-07  109  		return stdin_fd;
86cdb0f09bbab1a Thomas Wei=C3=9Fschuh 2026-04-07  110 =20
86cdb0f09bbab1a Thomas Wei=C3=9Fschuh 2026-04-07  111  	CLASS(get_unused_fd=
, stdout_fd)(O_WRONLY);
86cdb0f09bbab1a Thomas Wei=C3=9Fschuh 2026-04-07  112  	if (stdout_fd < 0)
86cdb0f09bbab1a Thomas Wei=C3=9Fschuh 2026-04-07  113  		return stdout_fd;
86cdb0f09bbab1a Thomas Wei=C3=9Fschuh 2026-04-07  114 =20
86cdb0f09bbab1a Thomas Wei=C3=9Fschuh 2026-04-07  115  	CLASS(get_unused_fd=
, stderr_fd)(O_WRONLY);
86cdb0f09bbab1a Thomas Wei=C3=9Fschuh 2026-04-07  116  	if (stderr_fd < 0)
86cdb0f09bbab1a Thomas Wei=C3=9Fschuh 2026-04-07  117  		return stderr_fd;
86cdb0f09bbab1a Thomas Wei=C3=9Fschuh 2026-04-07  118 =20
86cdb0f09bbab1a Thomas Wei=C3=9Fschuh 2026-04-07  119  	struct file *logfil=
e __free(fput) =3D file_open_root_mnt(devtmpfs, KUNIT_LOG_DEVICE,
86cdb0f09bbab1a Thomas Wei=C3=9Fschuh 2026-04-07  120  							       O_RDWR=
, 0);
86cdb0f09bbab1a Thomas Wei=C3=9Fschuh 2026-04-07  121  	if (IS_ERR(logfile))
86cdb0f09bbab1a Thomas Wei=C3=9Fschuh 2026-04-07  122  		return PTR_ERR(log=
file);
86cdb0f09bbab1a Thomas Wei=C3=9Fschuh 2026-04-07  123 =20
86cdb0f09bbab1a Thomas Wei=C3=9Fschuh 2026-04-07  124  	fd_install(stdin_fd=
, no_free_ptr(logfile));
86cdb0f09bbab1a Thomas Wei=C3=9Fschuh 2026-04-07  125  	fd_install(stdout_f=
d, fget(stdin_fd));
86cdb0f09bbab1a Thomas Wei=C3=9Fschuh 2026-04-07 @126  	fd_install(stderr_f=
d, fget(stdin_fd));
86cdb0f09bbab1a Thomas Wei=C3=9Fschuh 2026-04-07  127 =20
86cdb0f09bbab1a Thomas Wei=C3=9Fschuh 2026-04-07  128  	take_fd(stdin_fd);
86cdb0f09bbab1a Thomas Wei=C3=9Fschuh 2026-04-07  129  	take_fd(stdout_fd);
86cdb0f09bbab1a Thomas Wei=C3=9Fschuh 2026-04-07  130  	take_fd(stderr_fd);
86cdb0f09bbab1a Thomas Wei=C3=9Fschuh 2026-04-07  131 =20
86cdb0f09bbab1a Thomas Wei=C3=9Fschuh 2026-04-07  132  	return 0;
86cdb0f09bbab1a Thomas Wei=C3=9Fschuh 2026-04-07  133  }
86cdb0f09bbab1a Thomas Wei=C3=9Fschuh 2026-04-07  134 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
