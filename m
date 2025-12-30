Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C5F2222CB
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Dec 2025 11:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767094437; cv=none; b=FVWSgWjrvYSCB/CKSlhepKJjPEVZo16wD05IHq9nbqiwmebGl3rkxjsHT/2fUayN1tTXJFv4a2KFhZcmcr8NiidcdtbQc0gebAndQfNY2ZdnCZHNWENzeMaYMepQeLzQntf0FXylgUsVpydayuK9l1u90CbtfsCFS/YV8vNTcgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767094437; c=relaxed/simple;
	bh=90vCph80GamSQvqaj3ce0TOY3UfszZcA+oq7XhD64FM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=EsC0DBSKb5msR14F55Wd42R1VI/TsFd6k/RgGtRmMDlsyC7DLrbzjiWoY3/+RD5SOBCrpgF7YuRyXTov8QWrImTKyKc22NBEt13JSG5o8mk0ySZY4GMoeySlnuJ1CV2Neq8CIzHxuR5hBmKj48LfPHEfHUPBe865Q3tvGGRGlw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b6QjEoxt; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b6QjEoxt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767094435; x=1798630435;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=90vCph80GamSQvqaj3ce0TOY3UfszZcA+oq7XhD64FM=;
  b=b6QjEoxtiAzratCnRfg317cy4CwKSEvBteFTiXw6YW8wSpkbqiNaoOiA
   Ul6Qm+4yCRYIyFjAtxhmj1o0v6iCWHp7Vb+yKMPIjYtl9EhbkJ4TJbdrl
   750UzpdSGKA4UaPWaor3Ixz5tVIqt8CossWV5v0xLm4KxP7/ke71zihKA
   ML191vW0BjllJkpWxU0jJJF7dl5mG/iGkYx13zQt+q7DICDSO7kmnQGDs
   L7h7oRTBR6wSDNM4Ra8ya+Li8RqBdgdxv2i3p4FfVyHQfl5dxa3YSovHu
   U0NLGBE2A2DhWmzkE/P4aq/mKJtefNu4uMO1+39UP4mJSOORFDBr9fBaY
   g==;
X-CSE-ConnectionGUID: zcNAy6gBQFCzttY4vLJIpA==
X-CSE-MsgGUID: vF3qIi+DR6Cbhlo+RcYelQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="68575562"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="68575562"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 03:33:54 -0800
X-CSE-ConnectionGUID: Mvy0z8qKTcC27hVxXN7zQg==
X-CSE-MsgGUID: 0GuvjnmZT4iYl0eH44AyEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="201667754"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 30 Dec 2025 03:33:53 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaXz5-000000000L7-0rar;
	Tue, 30 Dec 2025 11:33:51 +0000
Date: Tue, 30 Dec 2025 19:33:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: net/core/netmem_priv.h:25 netmem_is_pp() warn: masked
 condition '(netmem_get_pp_magic(netmem) & ~((((0) + (((((1 << (8 * 8 - 1 -
 (((-1)) < 1))) - 1) + (1 << (8 * 8 - 1 - (((-1)) < 1))))) << ((1 + __fls((64
 + (6767463209352822784)) - (6767463209352822784))...
Message-ID: <202512301945.cs89yyZX-lkp@intel.com>
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
head:   8640b74557fc8b4c300030f6ccb8cd078f665ec8
commit: 104ea1c84b91c9f452e497ba51602b903711cdd5 bits: unify the non-asm GE=
NMASK*()
date:   5 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 5 months ago
config: powerpc64-randconfig-r072-20251229 (https://download.01.org/0day-ci=
/archive/20251230/202512301945.cs89yyZX-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512301945.cs89yyZX-lkp@intel.com/

New smatch warnings:
net/core/netmem_priv.h:25 netmem_is_pp() warn: masked condition '(netmem_ge=
t_pp_magic(netmem) & ~((((0) + (((((1 << (8 * 8 - 1 - (((-1)) < 1))) - 1) +=
 (1 << (8 * 8 - 1 - (((-1)) < 1))))) << ((1 + __fls((64 + (6767463209352822=
784)) - (6767463209352822784)))) & ((((1 << (8 * 8 - 1 - (((-1)) < 1))) - 1=
) + (1 << (8 * 8 - 1 - (((-1)) < 1))))) >> ((8 * 8) - 1 - ((((32) < (__ffs(=
(6767463209352822784)) - (1 + __fls((64 + (6767463209352822784)) - (6767463=
209352822784))))) ?(32):(__ffs((6767463209352822784)) - (1 + __fls((64 + (6=
767463209352822784)) - (6767463209352822784))))) + ' is always false.

Old smatch warnings:
net/core/skbuff.c:4812 skb_segment() error: we previously assumed 'list_skb=
' could be null (see line 4747)

vim +25 net/core/netmem_priv.h

8ab79ed50cf10f3 Mina Almasry           2024-09-10  22 =20
cd3c93167da0e76 Toke H=C3=B8iland-J=C3=B8rgensen 2025-04-09  23  static inl=
ine bool netmem_is_pp(netmem_ref netmem)
cd3c93167da0e76 Toke H=C3=B8iland-J=C3=B8rgensen 2025-04-09  24  {
cd3c93167da0e76 Toke H=C3=B8iland-J=C3=B8rgensen 2025-04-09 @25  	return (n=
etmem_get_pp_magic(netmem) & PP_MAGIC_MASK) =3D=3D PP_SIGNATURE;
cd3c93167da0e76 Toke H=C3=B8iland-J=C3=B8rgensen 2025-04-09  26  }
cd3c93167da0e76 Toke H=C3=B8iland-J=C3=B8rgensen 2025-04-09  27 =20

:::::: The code at line 25 was first introduced by commit
:::::: cd3c93167da0e760b5819246eae7a4ea30fd014b page_pool: Move pp_magic ch=
eck into helper functions

:::::: TO: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
