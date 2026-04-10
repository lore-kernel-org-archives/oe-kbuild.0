Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220B53A872B
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Apr 2026 21:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775855894; cv=none; b=BZU9++6vyZ342vhhg2bNmXgCKTfyq75HbqLfww0o97blniw7b4ep38np4W5hWHJpNTYLl6DERrl17ksTrNRNJAFY/zPhHzOVaZQscqsmoRv7qCqAI4YIr3GZ7gjeIB9p65MZrFpTGYxU9QLxmlyCqENoiPjYVoSDviZ6vmS/Ehs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775855894; c=relaxed/simple;
	bh=ghFbwDfALi1iaf8DCm4ChbXRIN2uIqxSrRFuHK2GYI4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=N85MCP9LWoYogZJoWlPCmCxh+gEs0txuDox4TnXv+4CgOUACNLsUHuz9iCIiPbXTNZn0CcSV+X7coLH9IhE8A08vXMVNMdQiebhowYlXBtTBJWDu2c0g0xs34cNjiqh/jss6gAr62+665G+mEq327r81Km97QYniTNh1a4nkan4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ABZxt6u1; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ABZxt6u1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775855893; x=1807391893;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ghFbwDfALi1iaf8DCm4ChbXRIN2uIqxSrRFuHK2GYI4=;
  b=ABZxt6u1+snkbijRheyhFO5+cOk1vHyZBZ7P880CKN08GWqEoU62t+P/
   Ir3SwSyKiSqsksWpQsaMWtwPNNNlmrZUhycRaGODB1/k29/NWRG92hYpN
   +mxb6hyz6bpqeCHUIiJochr/ZQsmSqxX4Lw7wTcVjd9/Eqdh7x5L1C1nb
   JPgGYgNnrIc7v6Do8C7+CliNxdL1RKLf81VCCcQMlo9lIGRwr284mZL4v
   vfevT4gYBJPotiyKqN7x7w5x/Ad6r7JH/+hGr6R7hhx7R/GNW5T11xtm+
   iFPi7LVPwgUKpEcaVwfoq+clcBaWswp2xbO/IGHYBs3Oo42iR4P4TxwP9
   A==;
X-CSE-ConnectionGUID: eR2jp9iqRAy72JUiKjwXKw==
X-CSE-MsgGUID: Dbv7j7SLQaCzwEg4jblYwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="99523909"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="99523909"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 14:18:12 -0700
X-CSE-ConnectionGUID: 0J5nfeglTvSpw5hpTRJ37w==
X-CSE-MsgGUID: Dqz+DX/+TNSdn7nVM7NX5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="224874482"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Apr 2026 14:18:11 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBJEu-000000000Cb-40DR;
	Fri, 10 Apr 2026 21:18:08 +0000
Date: Sat, 11 Apr 2026 05:17:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: lib/kunit/test.c:857:34: sparse: sparse: unsigned value that
 used to be signed checked against zero?
Message-ID: <202604110554.fnUWTIxa-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check warning: lib/kunit=
/test.c:857:34: sparse: sparse: unsigned value that used to be signed check=
ed against zero?"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Thomas Wei=C3=9Fschuh" <thomas.weissschuh@linutronix.de>
CC: Daniel Gomez <da.gomez@samsung.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   7c6c4ed80b874f721bc7c2c937e098c56e37d2f0
commit: 768da2eae8662ca51102794c32d37c17410acbf5 kunit: test: Drop CONFIG_M=
ODULE ifdeffery
date:   8 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 8 months ago
config: m68k-randconfig-r112-20260410 (https://download.01.org/0day-ci/arch=
ive/20260411/202604110554.fnUWTIxa-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260411/202604110554.fnUWTIxa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 768da2eae866 ("kunit: test: Drop CONFIG_MODULE ifdeffery")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604110554.fnUWTIxa-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/kunit/test.c:857:34: sparse: sparse: unsigned value that used to be =
signed checked against zero?
   lib/kunit/test.c:848:17: sparse: signed value source

vim +857 lib/kunit/test.c

3d6e44623841c8b Jeremy Kerr        2022-07-09  844 =20
3d6e44623841c8b Jeremy Kerr        2022-07-09  845  static void kunit_modul=
e_exit(struct module *mod)
3d6e44623841c8b Jeremy Kerr        2022-07-09  846  {
b67abaad4d25b5d Janusz Krzysztofik 2023-08-07  847  	struct kunit_suite_set=
 suite_set =3D {
b67abaad4d25b5d Janusz Krzysztofik 2023-08-07  848  		mod->kunit_suites, mo=
d->kunit_suites + mod->num_kunit_suites,
b67abaad4d25b5d Janusz Krzysztofik 2023-08-07  849  	};
18258c60f8a74b9 Janusz Krzysztofik 2023-08-07  850  	const char *action =3D =
kunit_action();
18258c60f8a74b9 Janusz Krzysztofik 2023-08-07  851 =20
a1af6a2bfa0cb46 Marco Pagani       2024-01-10  852  	/*
a1af6a2bfa0cb46 Marco Pagani       2024-01-10  853  	 * Check if the start =
address is a valid virtual address to detect
a1af6a2bfa0cb46 Marco Pagani       2024-01-10  854  	 * if the module load =
sequence has failed and the suite set has not
a1af6a2bfa0cb46 Marco Pagani       2024-01-10  855  	 * been initialized an=
d filtered.
a1af6a2bfa0cb46 Marco Pagani       2024-01-10  856  	 */
a1af6a2bfa0cb46 Marco Pagani       2024-01-10 @857  	if (!suite_set.start |=
| !virt_addr_valid(suite_set.start))
a1af6a2bfa0cb46 Marco Pagani       2024-01-10  858  		return;
a1af6a2bfa0cb46 Marco Pagani       2024-01-10  859 =20
18258c60f8a74b9 Janusz Krzysztofik 2023-08-07  860  	if (!action)
18258c60f8a74b9 Janusz Krzysztofik 2023-08-07  861  		__kunit_test_suites_e=
xit(mod->kunit_suites,
18258c60f8a74b9 Janusz Krzysztofik 2023-08-07  862  					 mod->num_kunit_su=
ites);
b67abaad4d25b5d Janusz Krzysztofik 2023-08-07  863 =20
b67abaad4d25b5d Janusz Krzysztofik 2023-08-07  864  	kunit_free_suite_set(s=
uite_set);
3d6e44623841c8b Jeremy Kerr        2022-07-09  865  }
3d6e44623841c8b Jeremy Kerr        2022-07-09  866 =20

:::::: The code at line 857 was first introduced by commit
:::::: a1af6a2bfa0cb46d70b7df5352993e750da6c79b kunit: run test suites only=
 after module initialization completes

:::::: TO: Marco Pagani <marpagan@redhat.com>
:::::: CC: Shuah Khan <skhan@linuxfoundation.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
