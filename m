Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4DE1E3DE8
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Dec 2025 14:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766674784; cv=none; b=N/nxx1GuHaRF39mAA7VK14E5Tl9fSGp6i1BBGTsQfAy+iG9U7LuaYyp3smesubv0Nqm4ENEivNpM3Z4hitl5c4jrPoN9gJQzedEnRKJ5DVfiH02XqsxtRAxEUI506sbZPiGrvWYSoET9QJrHNe/zTanKyK2QmK/phwnvL+3BPLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766674784; c=relaxed/simple;
	bh=/9Q0X6+Y0XQVPhmKdC0Y0ddAmKUwVj6d5qLjMR6Fspc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pigP8JfhJpckRvtoQvPdOmT45VIz1SqhTMJQN2M38TL8tCcaiSjEBn49d40+HzP83OyJAGZbLPyWBWCvnaaEnIIyg9U9T6sfT4p5rqfB33WmSe4ktG4pYAw0JoY8l8CSAL7VHgcrhk4emjamXyPtWHsMaNTU10/f3vztXX1vy/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=APxtkJ+a; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="APxtkJ+a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766674783; x=1798210783;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/9Q0X6+Y0XQVPhmKdC0Y0ddAmKUwVj6d5qLjMR6Fspc=;
  b=APxtkJ+aUIN8en6UJbdNjXax5yxcarZV7dSbawZXN89iv+e2M/9Ddv0s
   tC70/75zsWZuWLZMve/VEXRKXFgmYOxJ9tYVj0JI+73uMDZvLAyImjPJU
   zKpY3HLdMHXbizAg77buatSJUljypgMHHy3De/XjfI2aTRo+4K5+ipCwj
   l2iWglifptfSQRR9NYx8jQUzj7ROJUH+W2t8bTl+1emq3rWi1sF3Qc8kP
   I7nMmwFFl6o/dTTe+TMntOAwjTu2avTQTTyJoSaW0e/wcKoIatcUu9O8N
   Kf0YxTKuiLGd95+iZlXX4MtZVdaJIQpoDzIWpxA1U912NqghvQ+z6sg1U
   A==;
X-CSE-ConnectionGUID: zT0eElJUQ9Ws/6ExYaD9lg==
X-CSE-MsgGUID: 3LHek9yMRgaKo15qwOvPTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="68356776"
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; 
   d="scan'208";a="68356776"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 06:59:40 -0800
X-CSE-ConnectionGUID: 3iSS7fpSRZiIZoCOzHAaBw==
X-CSE-MsgGUID: D+WG4TBgRWSnx0JQuD+i9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; 
   d="scan'208";a="230890885"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 25 Dec 2025 06:59:39 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYmoS-000000004B5-38lk;
	Thu, 25 Dec 2025 14:59:36 +0000
Date: Thu, 25 Dec 2025 22:59:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/um/drivers/vector_user.c:402 strtofd() warn: impossible
 condition '(fd > 2147483647) => (0-s32max > s32max)'
Message-ID: <202512252234.Sgz23MAK-lkp@intel.com>
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
head:   ccd1cdca5cd433c8a5dff78b69a79b31d9b77ee1
commit: b555cb66583e99158cfef8e91c025252cefae55b um: vector: Eliminate the =
dependency on uml_net
date:   8 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 8 months ago
config: um-randconfig-r071-20251225 (https://download.01.org/0day-ci/archiv=
e/20251225/202512252234.Sgz23MAK-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512252234.Sgz23MAK-lkp@intel.com/

smatch warnings:
arch/um/drivers/vector_user.c:402 strtofd() warn: impossible condition '(fd=
 > 2147483647) =3D> (0-s32max > s32max)'
arch/um/drivers/vector_kern.c:471 destroy_queue() warn: variable dereferenc=
ed before check 'qi' (see line 468)

vim +402 arch/um/drivers/vector_user.c

49da7e64f33e80 Anton Ivanov      2017-11-20  387 =20
bc8f8e4e6e7a64 Marc-Andr=C3=A9 Lureau 2020-04-07  388  static int strtofd(c=
onst char *nptr)
bc8f8e4e6e7a64 Marc-Andr=C3=A9 Lureau 2020-04-07  389  {
bc8f8e4e6e7a64 Marc-Andr=C3=A9 Lureau 2020-04-07  390  	long fd;
bc8f8e4e6e7a64 Marc-Andr=C3=A9 Lureau 2020-04-07  391  	char *endptr;
bc8f8e4e6e7a64 Marc-Andr=C3=A9 Lureau 2020-04-07  392 =20
bc8f8e4e6e7a64 Marc-Andr=C3=A9 Lureau 2020-04-07  393  	if (nptr =3D=3D NUL=
L)
bc8f8e4e6e7a64 Marc-Andr=C3=A9 Lureau 2020-04-07  394  		return -1;
bc8f8e4e6e7a64 Marc-Andr=C3=A9 Lureau 2020-04-07  395 =20
bc8f8e4e6e7a64 Marc-Andr=C3=A9 Lureau 2020-04-07  396  	errno =3D 0;
bc8f8e4e6e7a64 Marc-Andr=C3=A9 Lureau 2020-04-07  397  	fd =3D strtol(nptr,=
 &endptr, 10);
bc8f8e4e6e7a64 Marc-Andr=C3=A9 Lureau 2020-04-07  398  	if (nptr =3D=3D end=
ptr ||
bc8f8e4e6e7a64 Marc-Andr=C3=A9 Lureau 2020-04-07  399  		errno !=3D 0 ||
bc8f8e4e6e7a64 Marc-Andr=C3=A9 Lureau 2020-04-07  400  		*endptr !=3D '\0' =
||
bc8f8e4e6e7a64 Marc-Andr=C3=A9 Lureau 2020-04-07  401  		fd < 0 ||
bc8f8e4e6e7a64 Marc-Andr=C3=A9 Lureau 2020-04-07 @402  		fd > INT_MAX) {
bc8f8e4e6e7a64 Marc-Andr=C3=A9 Lureau 2020-04-07  403  		return -1;
bc8f8e4e6e7a64 Marc-Andr=C3=A9 Lureau 2020-04-07  404  	}
bc8f8e4e6e7a64 Marc-Andr=C3=A9 Lureau 2020-04-07  405  	return fd;
bc8f8e4e6e7a64 Marc-Andr=C3=A9 Lureau 2020-04-07  406  }
bc8f8e4e6e7a64 Marc-Andr=C3=A9 Lureau 2020-04-07  407 =20

:::::: The code at line 402 was first introduced by commit
:::::: bc8f8e4e6e7a648e8c6357307d614be8fdcfdf2a um: Add a generic "fd" vect=
or transport

:::::: TO: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
:::::: CC: Richard Weinberger <richard@nod.at>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
