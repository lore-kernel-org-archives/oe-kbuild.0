Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D3F4315A
	for <oe-kbuild@lists.linux.dev>; Tue, 13 Jan 2026 00:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768263287; cv=none; b=VYMaN2seXHSCrW3G37WKvkMD2MTgfYSKLMXoBgAquFhtwkcCN5XOp05e/6D/RsAP+MAuhqUwddBz17M1G22YWSdbcdC0J0MXshrcytrXjgzmcdqkSNrujhtfIrlEYfXKLwxpcJY6Dygt+I5CoeETOaHeSDKbxxLKnFuIyCDIwcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768263287; c=relaxed/simple;
	bh=FsPaglqKDk1/Pcr4aGuLaQGOCVuVCP/vTW3oEmCBVY0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=EQIZtRP5Y4ZZaaP7OkP1xzuq+Buj6TfuOlB3EB1H3Zf8oMaXxjY3qAJc7HRY0t9J2ANfH9UA0HdY+3r0wPDci4QAUm+rDbKz/mRTKh8ZqD9KgtV9RTLKmodxehcGQPwnAVJBWPUI1kv6Or6LrvfrU7zkK0ko29Ay8IqDMj5uRYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d+M8vmv6; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d+M8vmv6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768263286; x=1799799286;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=FsPaglqKDk1/Pcr4aGuLaQGOCVuVCP/vTW3oEmCBVY0=;
  b=d+M8vmv6IbBpIdbRbD7DapMTf1tJyPkFMxb3CvdH5vu6ne2kCKJN5Grt
   Kc09yx1lhTCfTfWQkK7LkJffrGt7T3imx5XO+7FfTBYjpPB3GW2nShl06
   hnXms7lqHkPboWSBLJXGdM+WPK8TX7Z9Hh8e3jM4i8kiPrNEj7d0Fffgh
   ZMpiDSC/6LyeSB/lg8sDWhCrWUy5+tYO3kHUYhQgbhIqZT02hIdisipeZ
   ELJ4m5X1iQ69Me7ISdKaWY14jsZ2jWFttCJMxXqqq7DB07t/kTsP499j7
   SnEATfVIlE8D1+bC5QKd6xV0vJ2wri5MI8yVgajcKBGmbXs6YnxQ8USBH
   A==;
X-CSE-ConnectionGUID: HCDXNwf8TcOLXIhwZ+LpOQ==
X-CSE-MsgGUID: Z31MxQ8VSVaPmWMhFSbI4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="68550566"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="68550566"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 16:14:45 -0800
X-CSE-ConnectionGUID: uvlIWoVCT9GawRRHPk4o0g==
X-CSE-MsgGUID: hOmIVRhASaWlQ7lrpsV5ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="208388490"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Jan 2026 16:14:44 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfS3U-00000000E1C-3orq;
	Tue, 13 Jan 2026 00:14:40 +0000
Date: Tue, 13 Jan 2026 08:13:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [thomas-weissschuh:b4/kunit-kselftests 14/17]
 lib/kunit/kunit-uapi.c:120 kunit_uapi_open_standard_streams() warn: double
 fget(): 'stdin_fd'
Message-ID: <202601130843.zWY00hxH-lkp@intel.com>
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
head:   80b91cbf311bb07ffba6c87d77096cd91772b1b3
commit: 309f754f627839d741bd67285095729bd41ae32c [14/17] kunit: Introduce U=
API testing framework
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: i386-randconfig-141-20260113 (https://download.01.org/0day-ci/archi=
ve/20260113/202601130843.zWY00hxH-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601130843.zWY00hxH-lkp@intel.com/

smatch warnings:
lib/kunit/kunit-uapi.c:120 kunit_uapi_open_standard_streams() warn: double =
fget(): 'stdin_fd'

vim +/stdin_fd +120 lib/kunit/kunit-uapi.c

309f754f627839d Thomas Wei=C3=9Fschuh 2024-10-16   95 =20
309f754f627839d Thomas Wei=C3=9Fschuh 2024-10-16   96  static int kunit_uap=
i_open_standard_streams(void)
309f754f627839d Thomas Wei=C3=9Fschuh 2024-10-16   97  {
309f754f627839d Thomas Wei=C3=9Fschuh 2024-10-16   98  	struct vfsmount *de=
vtmpfs __free(kern_unmount) =3D kunit_uapi_mount_fs("devtmpfs");
309f754f627839d Thomas Wei=C3=9Fschuh 2024-10-16   99  	if (IS_ERR(devtmpfs=
))
309f754f627839d Thomas Wei=C3=9Fschuh 2024-10-16  100  		return PTR_ERR(dev=
tmpfs);
309f754f627839d Thomas Wei=C3=9Fschuh 2024-10-16  101 =20
309f754f627839d Thomas Wei=C3=9Fschuh 2024-10-16  102  	CLASS(get_unused_fd=
, stdin_fd)(O_RDONLY);
309f754f627839d Thomas Wei=C3=9Fschuh 2024-10-16  103  	if (stdin_fd < 0)
309f754f627839d Thomas Wei=C3=9Fschuh 2024-10-16  104  		return stdin_fd;
309f754f627839d Thomas Wei=C3=9Fschuh 2024-10-16  105 =20
309f754f627839d Thomas Wei=C3=9Fschuh 2024-10-16  106  	CLASS(get_unused_fd=
, stdout_fd)(O_WRONLY);
309f754f627839d Thomas Wei=C3=9Fschuh 2024-10-16  107  	if (stdout_fd < 0)
309f754f627839d Thomas Wei=C3=9Fschuh 2024-10-16  108  		return stdout_fd;
309f754f627839d Thomas Wei=C3=9Fschuh 2024-10-16  109 =20
309f754f627839d Thomas Wei=C3=9Fschuh 2024-10-16  110  	CLASS(get_unused_fd=
, stderr_fd)(O_WRONLY);
309f754f627839d Thomas Wei=C3=9Fschuh 2024-10-16  111  	if (stderr_fd < 0)
309f754f627839d Thomas Wei=C3=9Fschuh 2024-10-16  112  		return stderr_fd;
309f754f627839d Thomas Wei=C3=9Fschuh 2024-10-16  113 =20
309f754f627839d Thomas Wei=C3=9Fschuh 2024-10-16  114  	struct file *logfil=
e __free(fput) =3D file_open_root_mnt(devtmpfs, "kunit-log", O_RDWR, 0);
309f754f627839d Thomas Wei=C3=9Fschuh 2024-10-16  115  	if (IS_ERR(logfile))
309f754f627839d Thomas Wei=C3=9Fschuh 2024-10-16  116  		return PTR_ERR(log=
file);
309f754f627839d Thomas Wei=C3=9Fschuh 2024-10-16  117 =20
309f754f627839d Thomas Wei=C3=9Fschuh 2024-10-16  118  	fd_install(stdin_fd=
, no_free_ptr(logfile));
309f754f627839d Thomas Wei=C3=9Fschuh 2024-10-16  119  	fd_install(stdout_f=
d, fget(stdin_fd));
309f754f627839d Thomas Wei=C3=9Fschuh 2024-10-16 @120  	fd_install(stderr_f=
d, fget(stdin_fd));
309f754f627839d Thomas Wei=C3=9Fschuh 2024-10-16  121 =20
309f754f627839d Thomas Wei=C3=9Fschuh 2024-10-16  122  	take_fd(stdin_fd);
309f754f627839d Thomas Wei=C3=9Fschuh 2024-10-16  123  	take_fd(stdout_fd);
309f754f627839d Thomas Wei=C3=9Fschuh 2024-10-16  124  	take_fd(stderr_fd);
309f754f627839d Thomas Wei=C3=9Fschuh 2024-10-16  125 =20
309f754f627839d Thomas Wei=C3=9Fschuh 2024-10-16  126  	return 0;
309f754f627839d Thomas Wei=C3=9Fschuh 2024-10-16  127  }
309f754f627839d Thomas Wei=C3=9Fschuh 2024-10-16  128 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
