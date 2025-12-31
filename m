Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2BA26F2BE
	for <oe-kbuild@lists.linux.dev>; Wed, 31 Dec 2025 02:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767148746; cv=none; b=mCUOoznmUIgds8ZZx85gX+xaHWqCy5oWtIIuWYdBABhLTupBAuiAA2kW1WtZNeXjzUBchQ7C07Tr15AijqrkL0tXcN21qXR7/W81YTeJmf5CMPXQD1NhF2zCF71dmlc1evthjPrTMJRh5HYPJ0COyAZ+Yj2HqUXnKCZ+S+47Vpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767148746; c=relaxed/simple;
	bh=fzk+by/GEAVEDS00Ns7hXkBVFaBN4UBCiMRzg2Wnows=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BZTtdDfXD4MLOv2uYp47Ti/eC6qBv5IA/y8Xg+HezzEWaUZv+cJ/LxJ72dgOf3y12BejT3RvUSkDwc710Gqer+IkxbcWsHDhEElRtSd6IN/LgbxjUicuRvXfo1FEAHnsHJvdmLIyR5YoK98gY2+6EiATdBcnzyC9FlrwwKABXmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JSTJyHxk; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JSTJyHxk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767148744; x=1798684744;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=fzk+by/GEAVEDS00Ns7hXkBVFaBN4UBCiMRzg2Wnows=;
  b=JSTJyHxkcIHKGb5pm4j7bLmZAbtlFFu+O4RNWOKI5CHkSH1ZFPqx//r8
   412WDFJR+cEYKOs6KfUPSWbgubskwESvTpbRT/4bB61yR/o2xtxMI5oJQ
   KY/Nz17NE0ZzwA4WQMjB1jXFldwW2tv9tBWk/GzuGDTrcMAEaNEwEOVDp
   dZEAcef7T3uMcLu0yxITEwb6L2RZnTX7qZYz9yOJn1reVNVT9kO69HAx4
   fCjkxjk9vActMMuBDmSp18/igtgVQCtVau48TMeBG1ondEXl6dM2w6+Tz
   fwkYZgqMQEc4R1+EgPluxpMKL6ABBGqrGi311fnQxR8Ap3YoEjsec6TFp
   g==;
X-CSE-ConnectionGUID: mYGbv1cOSGqN/p2lZRiUqA==
X-CSE-MsgGUID: /lQL4YZWQQC0VJSIdf51wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="67733276"
X-IronPort-AV: E=Sophos;i="6.21,190,1763452800"; 
   d="scan'208";a="67733276"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 18:39:03 -0800
X-CSE-ConnectionGUID: NccPALKGRxq3gc0snIcRIw==
X-CSE-MsgGUID: THI/Be/6QOuy/LSXvvSYeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,190,1763452800"; 
   d="scan'208";a="205491131"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 30 Dec 2025 18:39:02 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vam71-000000000sR-1XnB;
	Wed, 31 Dec 2025 02:38:59 +0000
Date: Wed, 31 Dec 2025 10:38:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: include/linux/mm.h:4178 page_pool_page_is_pp() warn: masked
 condition '(page->pp_magic & ~((((0) + (((((1 << (8 * 8 - 1 - (((-1)) < 1)))
 - 1) + (1 << (8 * 8 - 1 - (((-1)) < 1))))) << ((1 + __fls((64 +
 (6767463209352822784)) - (6767463209352822784)))) & ((...
Message-ID: <202512311049.uhGMdjUK-lkp@intel.com>
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
TO: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
CC: Yury Norov <yury.norov@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   dbf8fe85a16a33d6b6bd01f2bc606fc017771465
commit: 104ea1c84b91c9f452e497ba51602b903711cdd5 bits: unify the non-asm GE=
NMASK*()
date:   5 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 5 months ago
config: powerpc64-randconfig-r072-20251229 (https://download.01.org/0day-ci=
/archive/20251231/202512311049.uhGMdjUK-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512311049.uhGMdjUK-lkp@intel.com/

smatch warnings:
include/linux/mm.h:4178 page_pool_page_is_pp() warn: masked condition '(pag=
e->pp_magic & ~((((0) + (((((1 << (8 * 8 - 1 - (((-1)) < 1))) - 1) + (1 << =
(8 * 8 - 1 - (((-1)) < 1))))) << ((1 + __fls((64 + (6767463209352822784)) -=
 (6767463209352822784)))) & ((((1 << (8 * 8 - 1 - (((-1)) < 1))) - 1) + (1 =
<< (8 * 8 - 1 - (((-1)) < 1))))) >> ((8 * 8) - 1 - ((((32) < (__ffs((676746=
3209352822784)) - (1 + __fls((64 + (6767463209352822784)) - (67674632093528=
22784))))) ?(32):(__ffs((6767463209352822784)) - (1 + __fls((64 + (67674632=
09352822784)) - (6767463209352822784))))) + (1 + __fls((6' is always false.

vim +4178 include/linux/mm.h

cd3c93167da0e7 Toke H=C3=B8iland-J=C3=B8rgensen 2025-04-09  4174 =20
cd3c93167da0e7 Toke H=C3=B8iland-J=C3=B8rgensen 2025-04-09  4175  #ifdef CO=
NFIG_PAGE_POOL
cd3c93167da0e7 Toke H=C3=B8iland-J=C3=B8rgensen 2025-04-09  4176  static in=
line bool page_pool_page_is_pp(struct page *page)
cd3c93167da0e7 Toke H=C3=B8iland-J=C3=B8rgensen 2025-04-09  4177  {
cd3c93167da0e7 Toke H=C3=B8iland-J=C3=B8rgensen 2025-04-09 @4178  	return (=
page->pp_magic & PP_MAGIC_MASK) =3D=3D PP_SIGNATURE;
cd3c93167da0e7 Toke H=C3=B8iland-J=C3=B8rgensen 2025-04-09  4179  }
cd3c93167da0e7 Toke H=C3=B8iland-J=C3=B8rgensen 2025-04-09  4180  #else
cd3c93167da0e7 Toke H=C3=B8iland-J=C3=B8rgensen 2025-04-09  4181  static in=
line bool page_pool_page_is_pp(struct page *page)
cd3c93167da0e7 Toke H=C3=B8iland-J=C3=B8rgensen 2025-04-09  4182  {
cd3c93167da0e7 Toke H=C3=B8iland-J=C3=B8rgensen 2025-04-09  4183  	return f=
alse;
cd3c93167da0e7 Toke H=C3=B8iland-J=C3=B8rgensen 2025-04-09  4184  }
cd3c93167da0e7 Toke H=C3=B8iland-J=C3=B8rgensen 2025-04-09  4185  #endif
cd3c93167da0e7 Toke H=C3=B8iland-J=C3=B8rgensen 2025-04-09  4186 =20

:::::: The code at line 4178 was first introduced by commit
:::::: cd3c93167da0e760b5819246eae7a4ea30fd014b page_pool: Move pp_magic ch=
eck into helper functions

:::::: TO: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
