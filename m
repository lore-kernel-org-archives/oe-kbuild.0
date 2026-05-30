Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2995F33B6C4
	for <oe-kbuild@lists.linux.dev>; Sat, 30 May 2026 17:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780162033; cv=none; b=qWmHPuG9zjobjYkkOM/AKfRc338s7eNDFcbsH9sWMgg1acHy0M9Qz9FOq9e/yIQwvYRyGxbHwwudUTL5Cocn6/YBN8jECRNL4Vro6kso/KsCXK9qhnegP/nDVKJeawrLLG3PFs/XSs9FfazkDxxdeCJj69nCS/WUNwWPukxgcGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780162033; c=relaxed/simple;
	bh=mpTn5iZdNg21FDWrlB2ZTxd43eO073/lQkK6bSsuiwc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pRn1tk1B/4WxcG2o/LUOaPZLJS4b0e/e0jVux0ary5ORpw6Dc/MlWbli51WUwBGKVau7neW5V8vZVrG9P2KIyB9WMyNwTJvTdArd2F7gcZsgPLCzqj183THW0RJ06eVTDTVFCVaLWgVYdL4Ali3uSOiQjVJ2LGksECMZct1Cjmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ab5vwAb3; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ab5vwAb3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780162031; x=1811698031;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=mpTn5iZdNg21FDWrlB2ZTxd43eO073/lQkK6bSsuiwc=;
  b=Ab5vwAb3sAosyG8Fp/YUsAp6B66prD0vDE2jRRhYmsm16K7qBwQnLMm8
   DBV9JevtnjNATZTO8mqG9NeDMOP9JuvyLkVuEWLpiYL5pIjWV4fyWqj+G
   5gVUhY72IEmiLvWlNcTK8W4R5sew8Ht4u90eQdAKbNXN+q9niuuSnUtN/
   /VvKexqXE1Ob+q4yRXtmvj7K4nnh/EwCPR/F5tRs6yoLg3943buM8E4LR
   vSU5FRxMQHrzRDvVaOxyUTzoDsRZXi1IX8CYFPSKvMOp0hJMQeFscy383
   Rm80cazSuqFEu3bgjwQO/W0zDDrkl/OtbfypiBYEh/eJkve79LABXgccN
   w==;
X-CSE-ConnectionGUID: T9N13G1+R7Suwi94P8UiZQ==
X-CSE-MsgGUID: 7I1G3w4LRCK3AiDgeNiLHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11802"; a="80879806"
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="80879806"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2026 10:27:11 -0700
X-CSE-ConnectionGUID: 2++szJDWT/+R5mG9SlMAjw==
X-CSE-MsgGUID: NwfGSs4wSe27/IB4iCy9Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="248055749"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 30 May 2026 10:27:10 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTNSl-000000008kQ-0hJz;
	Sat, 30 May 2026 17:27:07 +0000
Date: Sun, 31 May 2026 01:26:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/um/drivers/vector_user.c:402 strtofd() warn: impossible
 condition '(fd > 2147483647) => (0-s32max > s32max)'
Message-ID: <202605310148.0lsXfq7o-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Tiwei Bie <tiwei.btw@antgroup.com>
CC: Johannes Berg <johannes.berg@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f5e5d3509bffb95c6648eb9795f7f236852ae62d
commit: b555cb66583e99158cfef8e91c025252cefae55b um: vector: Eliminate the =
dependency on uml_net
date:   1 year, 1 month ago
:::::: branch date: 16 hours ago
:::::: commit date: 1 year, 1 month ago
config: um-randconfig-r073-20260530 (https://download.01.org/0day-ci/archiv=
e/20260531/202605310148.0lsXfq7o-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: b555cb66583e ("um: vector: Eliminate the dependency on uml_net")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605310148.0lsXfq7o-lkp@intel.com/

smatch warnings:
arch/um/drivers/vector_user.c:402 strtofd() warn: impossible condition '(fd=
 > 2147483647) =3D> (0-s32max > s32max)'

vim +402 arch/um/drivers/vector_user.c

49da7e64f33e80e Anton Ivanov      2017-11-20  387 =20
bc8f8e4e6e7a648 Marc-Andr=C3=A9 Lureau 2020-04-07  388  static int strtofd(=
const char *nptr)
bc8f8e4e6e7a648 Marc-Andr=C3=A9 Lureau 2020-04-07  389  {
bc8f8e4e6e7a648 Marc-Andr=C3=A9 Lureau 2020-04-07  390  	long fd;
bc8f8e4e6e7a648 Marc-Andr=C3=A9 Lureau 2020-04-07  391  	char *endptr;
bc8f8e4e6e7a648 Marc-Andr=C3=A9 Lureau 2020-04-07  392 =20
bc8f8e4e6e7a648 Marc-Andr=C3=A9 Lureau 2020-04-07  393  	if (nptr =3D=3D NU=
LL)
bc8f8e4e6e7a648 Marc-Andr=C3=A9 Lureau 2020-04-07  394  		return -1;
bc8f8e4e6e7a648 Marc-Andr=C3=A9 Lureau 2020-04-07  395 =20
bc8f8e4e6e7a648 Marc-Andr=C3=A9 Lureau 2020-04-07  396  	errno =3D 0;
bc8f8e4e6e7a648 Marc-Andr=C3=A9 Lureau 2020-04-07  397  	fd =3D strtol(nptr=
, &endptr, 10);
bc8f8e4e6e7a648 Marc-Andr=C3=A9 Lureau 2020-04-07  398  	if (nptr =3D=3D en=
dptr ||
bc8f8e4e6e7a648 Marc-Andr=C3=A9 Lureau 2020-04-07  399  		errno !=3D 0 ||
bc8f8e4e6e7a648 Marc-Andr=C3=A9 Lureau 2020-04-07  400  		*endptr !=3D '\0'=
 ||
bc8f8e4e6e7a648 Marc-Andr=C3=A9 Lureau 2020-04-07  401  		fd < 0 ||
bc8f8e4e6e7a648 Marc-Andr=C3=A9 Lureau 2020-04-07 @402  		fd > INT_MAX) {
bc8f8e4e6e7a648 Marc-Andr=C3=A9 Lureau 2020-04-07  403  		return -1;
bc8f8e4e6e7a648 Marc-Andr=C3=A9 Lureau 2020-04-07  404  	}
bc8f8e4e6e7a648 Marc-Andr=C3=A9 Lureau 2020-04-07  405  	return fd;
bc8f8e4e6e7a648 Marc-Andr=C3=A9 Lureau 2020-04-07  406  }
bc8f8e4e6e7a648 Marc-Andr=C3=A9 Lureau 2020-04-07  407 =20

:::::: The code at line 402 was first introduced by commit
:::::: bc8f8e4e6e7a648e8c6357307d614be8fdcfdf2a um: Add a generic "fd" vect=
or transport

:::::: TO: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
:::::: CC: Richard Weinberger <richard@nod.at>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
