Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E99D37C11F
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Feb 2026 23:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771889043; cv=none; b=sFaq/F5JUsBLIUNyx9RrFkhIwLstVKPyWfmWfpHnh6YzDxdDIvOwnil2YlTivzYxx1lGBnbHtQIPBweMO/RAu4gqSout7VpnMmnISGhgQRRk/0UhHMFtRpTC0AMsEaY/MdiZXHCKBAAmOmm3r84jZX5KvcbILgZaucD3YWiyxNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771889043; c=relaxed/simple;
	bh=cerGgQsRuC+aWOLE/2AFnQUajHFwz54FpFgNxt2i/Fo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jOmjtM7+tza4ipnlnqleLF76lO0804aHpFk+DgJnEKazk5LFBlANv62NKv+hVtZSYG8R5HPYeerO1Yv2JXDLmBlTcO1PEEJ+04UJD8rr9XjnIz98WOhSdmxefnMAcm56zjTO1yDh/TcOAFGci2lIBl0QDBnqgVRyspWmLgLXZl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mfUotki2; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mfUotki2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771889038; x=1803425038;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=cerGgQsRuC+aWOLE/2AFnQUajHFwz54FpFgNxt2i/Fo=;
  b=mfUotki2an6ujFvpB8ue28/aAnYZa/mbvNxa88FyVnOIwsgkZlZt37gB
   EZq3NVbCKKKkAAz4No2fXEuXRGF3+iGMsmYLx9WjCq3foXb1GS0SjxMD5
   vhcAQXjCt4dKR1nzQpMahJE1Fcwy8GFjr4Mhd448iOvcujKzdnekRYrqx
   JPfDnafYhQ6RGLu0ys5spjYntlrp3oFMbCnm/654rlEj/soVgLM4/d4Uu
   5HhyutBU1BZiKoTjG9rfS2cNgUzVWk3HQoQPdvFNTMgJmahN3QjhgfgVg
   Wc2kkynCqHJS1ixjCVRh2YA0xyKXjShrgYrHEeCDxrxarIQJRf2Vwezlo
   w==;
X-CSE-ConnectionGUID: xfn6u6QASQObKlkdg2zc4A==
X-CSE-MsgGUID: Zk22MHGbQAuWcbAz8jh7FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="75503590"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="75503590"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 15:23:56 -0800
X-CSE-ConnectionGUID: +4wRfTqMQ/mT6+MzhnRMig==
X-CSE-MsgGUID: fGzZAs5pR3eXRY7KRdhYWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="220720212"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 23 Feb 2026 15:23:54 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vufHM-000000000vx-1Cit;
	Mon, 23 Feb 2026 23:23:52 +0000
Date: Tue, 24 Feb 2026 07:23:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [thomas-weissschuh:b4/kbuild-uapi-c 14/14] arc-linux-gcc:
 error: language c++ not recognized
Message-ID: <202602240723.x1uyz2AM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "only suspicious fbc files changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Thomas Wei=C3=9Fschuh" <linux@weissschuh.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/l=
inux.git b4/kbuild-uapi-c
head:   f7e0b4956801dd819d37ffa46b55f82232b6c7ec
commit: 21c74eaf91ce4b0d2f569e9a502752d830c31cf6 [14/14] x
:::::: branch date: 7 hours ago
:::::: commit date: 8 hours ago
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260224/=
202602240723.x1uyz2AM-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260224/202602240723.x1uyz2AM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602240723.x1uyz2AM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arc-linux-gcc: error: language c++ not recognized
>> arc-linux-gcc: error: language c++ not recognized

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
