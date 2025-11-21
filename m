Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFD02EA732
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Nov 2025 21:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763762151; cv=none; b=bslnRDpBEoQYRByp58qXaEfMYIvWfyEoagqYJi0hHMe1QygxqaQ4ozwQ/LTomx10r5fKJNWUS2GPcjaOA7aHfju2fHkSp/8ck+x4ce48kTaXsfuzj7RzMK6OjCIHDfhJWg7VfjRnkPBLkH/XKEhDuxTa4fEeZAkqT/jMI63hWSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763762151; c=relaxed/simple;
	bh=QsnbBRDA6Ak04+/vFmMIYlI5WaZ8lX0y9NByt7ex6v4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yt4iXqYau1V81VT+PHGhPhahR26BqlzW4Pvzn57jvXV63bP5zOOd2+QR6AWkbkHNPVFA0pC2nBjSIyJRQE2rPd8knNKNngqRnhq92/+6d4SGKDSibx9OSwR8D+5WeOXu78skbXzJvo1oH0H7afrYil5vyQq23OrtAeZ2oD8tvvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kyRqj3jV; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kyRqj3jV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763762149; x=1795298149;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QsnbBRDA6Ak04+/vFmMIYlI5WaZ8lX0y9NByt7ex6v4=;
  b=kyRqj3jVzsGHqWZVJgcuZZHrO3Foc30GOChCkPQsS50Bcb0y1eydX/74
   iPI9KnUHg4gd0JahrtzjbkTqPg7arvPBQUtU8D9P1j7vuUJFQHoO+gZou
   cMIiaX2ZS3XEKsTCSaVgGWedsk53c1TQCM+tfMZi5qfCrTRLa8+Dt0HKR
   YDXCht6wCyKaqCsfK2QVz/0TeCeWEeFCpq7QpPc2edZL30F5wFwmObRiU
   Rci4hdbqswyTs5ChTG9/d+71eKlPhNIUp0fxd1bHZjbbEBGlR7K1pFZbS
   NGH2tV1ksR3SrssDUe35VPuQH95xdvNJOFHXPfmCZOwP01NYzLxOJCrF4
   w==;
X-CSE-ConnectionGUID: 81e5YebATqauBSwjwY4k/A==
X-CSE-MsgGUID: 8e926WciS6Sm9BC5mjVaHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="88513560"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="88513560"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 13:55:49 -0800
X-CSE-ConnectionGUID: PZuq0ua6Q5uqchTtQSi4Tw==
X-CSE-MsgGUID: 6tyGSiAOR7Sx2DKu2OXx8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="196265674"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 Nov 2025 13:55:48 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMZ6W-0006up-37;
	Fri, 21 Nov 2025 21:55:44 +0000
Date: Sat, 22 Nov 2025 05:55:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [brauner-github:work.fd.prepare.scoped 16/52] fs/open.c:1424
 do_sys_openat2() error: uninitialized symbol 'tmp'.
Message-ID: <202511220547.BX8AdVlr-lkp@intel.com>
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
CC: Christian Brauner <christianvanbrauner@gmail.com>
TO: Christian Brauner <brauner@kernel.org>

tree:   https://github.com/brauner/linux.git work.fd.prepare.scoped
head:   09ba3707485de081133d97c9bdc7fa364d318f46
commit: a290be3972f9df5a58b630e081d53caa1305ca1c [16/52] open: convert do_sys_openat2() to FD_PREPARE()
:::::: branch date: 4 hours ago
:::::: commit date: 33 hours ago
config: loongarch-randconfig-r072-20251122 (https://download.01.org/0day-ci/archive/20251122/202511220547.BX8AdVlr-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511220547.BX8AdVlr-lkp@intel.com/

smatch warnings:
fs/open.c:1424 do_sys_openat2() error: uninitialized symbol 'tmp'.

vim +/tmp +1424 fs/open.c

73d049a40fc6269 Al Viro             2011-03-11  1419  
29d80d506b18384 Yuichiro Tsuji      2025-01-21  1420  static int do_sys_openat2(int dfd, const char __user *filename,
fddb5d430ad9fa9 Aleksa Sarai        2020-01-18  1421  			  struct open_how *how)
^1da177e4c3f415 Linus Torvalds      2005-04-16  1422  {
47c805dc2d2dff6 Al Viro             2011-02-23  1423  	struct open_flags op;
a290be3972f9df5 Christian Brauner   2025-11-18 @1424  	struct filename *tmp __free(putname);
a290be3972f9df5 Christian Brauner   2025-11-18  1425  	int err;
f9652e10c12b43d Al Viro             2013-06-11  1426  
d5a05a5a44a983e Mateusz Guzik       2025-03-20  1427  	err = build_open_flags(how, &op);
d5a05a5a44a983e Mateusz Guzik       2025-03-20  1428  	if (unlikely(err))
d5a05a5a44a983e Mateusz Guzik       2025-03-20  1429  		return err;
f9652e10c12b43d Al Viro             2013-06-11  1430  
f9652e10c12b43d Al Viro             2013-06-11  1431  	tmp = getname(filename);
f9652e10c12b43d Al Viro             2013-06-11  1432  	if (IS_ERR(tmp))
f9652e10c12b43d Al Viro             2013-06-11  1433  		return PTR_ERR(tmp);
ef3daeda7b58f04 Yoav Zach           2005-06-23  1434  
a290be3972f9df5 Christian Brauner   2025-11-18  1435  	FD_PREPARE(fdf, how->flags, do_filp_open(dfd, tmp, &op)) {
a290be3972f9df5 Christian Brauner   2025-11-18  1436  		if (fd_prepare_failed(fdf))
a290be3972f9df5 Christian Brauner   2025-11-18  1437  			return fd_prepare_error(fdf);
a290be3972f9df5 Christian Brauner   2025-11-18  1438  
a290be3972f9df5 Christian Brauner   2025-11-18  1439  		return fd_publish(fdf);
fed2fc18a4567d6 Telemaque Ndizihiwe 2005-06-23  1440  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  1441  }
e922efc342d565a Miklos Szeredi      2005-09-06  1442  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
