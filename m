Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACB63264D2
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Jun 2026 15:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782140598; cv=none; b=ao9N/AkmTLGT1602Mckehc+/5F7Q3DXrjWpGgcKyUj5W1bxqyfjHYp7VDzzOKFud90YnXNUtl9LhredHxQ5hHIs+JGfb+BRuiqec4KUzpJw5yC7vBNEBrVohaht4z6ZCI1MEnCciiOO0KzRCkmXcBkTaPGjSSbsX9iuP7ApgokA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782140598; c=relaxed/simple;
	bh=rSsRUCdqro3a+taGf3j8Jy531YaWVXdZQXtP8LKiP5E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=LbpnKldrCGKOAkkJ3qd0DvufTmh1F7a9g5odTdtSe47iPWjPx5S9PUPbAiRfAXTNwyYJUVhubm1rXQk8zVWpF2KlTl2YB+yMFnpkdLmQ26Tk8uAmkGYOmLs0wPQyTcHqn/lGHYxuWKDxpw76nl6Vz+qLqJ8XiPXmKBZi9g9dmqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b5JOUFU6; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b5JOUFU6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782140596; x=1813676596;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=rSsRUCdqro3a+taGf3j8Jy531YaWVXdZQXtP8LKiP5E=;
  b=b5JOUFU66Jf29BsVyqKZcBo6BhqoWOhn311Fgs5zsOEDxbBWEamQWWza
   9my31ucYLvCWwvCGMCroeqxOhcBQyYMW2o+ppiS7yjNMh1SfjJqZCo5mA
   BDORkZ2reW6UJv8rKwfzshvER31vQlUXXWD7nEZVhWHEvy+01DcM2GVwc
   62Pnrd+vClkrkKoCLqT/PviMB86v2p6Yp48PWO8q1WnRFJ325d90ExR+z
   2efnFtHxyc6D2fBAIHFEzrVQH744axdqATIgpzgTVnZOaGBfPLF5/1O9m
   yaZRaeGooi7su+x3kKwe/m9xEaAc8a6eDK+/EB7reAM1frZNPYiixafij
   g==;
X-CSE-ConnectionGUID: 74DEoxaNSZi3/ux+PMvTPg==
X-CSE-MsgGUID: KI8LPoJXQrercBc/PYeXJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="100423097"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="100423097"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 08:03:15 -0700
X-CSE-ConnectionGUID: z8XtDiobTzS3Az1oMKVV0g==
X-CSE-MsgGUID: Yje8IIIzRb6tCFvK/54qnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="249105236"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 22 Jun 2026 08:03:15 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbgB5-000000001Lp-4BAC;
	Mon, 22 Jun 2026 15:03:11 +0000
Date: Mon, 22 Jun 2026 23:03:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [thomas-weissschuh:b4/uapi-ucontext 9/9]
 usr/include/asm/uctx.h:67:9: error: unknown type name 'sigset_t'
Message-ID: <202606222253.WOUHTXhA-lkp@intel.com>
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
inux.git b4/uapi-ucontext
head:   91307027b05329242e33a446a5a74aca50ec6322
commit: 91307027b05329242e33a446a5a74aca50ec6322 [9/9] kbuild: uapi: test-c=
ompile asm/ucontext.h
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: sparc-randconfig-001-20260622 (https://download.01.org/0day-ci/arch=
ive/20260622/202606222253.WOUHTXhA-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260622/202606222253.WOUHTXhA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606222253.WOUHTXhA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./usr/include/asm/ucontext.h:3,
                    from <command-line>:
>> usr/include/asm/uctx.h:67:9: error: unknown type name 'sigset_t'
      67 |         sigset_t                uc_sigmask;
         |         ^~~~~~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
