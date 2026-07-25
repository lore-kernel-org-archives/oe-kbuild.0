Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A572F39B5
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Jul 2026 14:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784990739; cv=none; b=ah8U8l7OKGOYptkqg/k7h3wtu5UhPilwnYdK08szwSFJ3W9j4lF0Dl5WxANdTUfHJy1oTH8xCkGSLe9LrxLRW+AQly0Kh7W7jjMKSrrbbgYGBpAEqbTldmF74r1LDGhC031oKGegGCrINsbh12g+1TvyVrBcHz8jZ4PP4CSP12A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784990739; c=relaxed/simple;
	bh=NN5CwsVU6xpuqC8k35CWpmOH2P8b/Qoq770MADwO80w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZU2WYRLZCoXo+hXtHM/tIjOK950S3Yh3Y6OmEDg/cV9/e+ZoJ7MeUP5JOJdJf6Q4PifRmXngN/4Bl4W560Aeyzt5bC8xkxquRzRId3AnVUky3ZY+zjM159OTOAvN5veK7Upnp1ZUdJu3MNKBQAPUaSp6wS85BU9m1C+dp8T7GSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bjAtXh0E; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bjAtXh0E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784990737; x=1816526737;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=NN5CwsVU6xpuqC8k35CWpmOH2P8b/Qoq770MADwO80w=;
  b=bjAtXh0E4JnppSDF0K3ps/GD0/Er8VeVEtMNjwsLyhii3XW9JyH8j7Nl
   INcdSD9hFPqVKPyK/YB16xJQR4ZO/WfDF1g8YVDcyOj4vd76akesz/Qgm
   +NYXFgSGMC6FE4WB/MF+OmSvSuZtHJVpjPRAR1gnWJosdp2sNwV9erdqt
   1mK2JB5dRu7dFdfVe8+vW8Xi47Shgpgfq8nc2nuKj5Y0NQTIO5PmO/6Xc
   gLb2hMn557maMMu3oIJEFnnQu+CQfMa0h5RO4TGGXs/hal/I/rDakZEJg
   gLENmucC6u9wsfRe8Q516hQ3vR85LdYbC3BrqE1D3kxsKz1KhqLWq/sca
   w==;
X-CSE-ConnectionGUID: 4SCb5/VMR0eApjcVkqaT8A==
X-CSE-MsgGUID: K/xYbALaSGu2jAFsrpaPgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11856"; a="85717438"
X-IronPort-AV: E=Sophos;i="6.25,184,1779174000"; 
   d="scan'208";a="85717438"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2026 07:45:36 -0700
X-CSE-ConnectionGUID: q7+Ok0FbTHitbPMxtB/CLg==
X-CSE-MsgGUID: Wv7Ghj0TTgSEJ9V6VE8ZZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,184,1779174000"; 
   d="scan'208";a="252644135"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 25 Jul 2026 07:45:35 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wndd2-00000000bkQ-1A5N;
	Sat, 25 Jul 2026 14:45:28 +0000
Date: Sat, 25 Jul 2026 22:45:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: net/core/netmem_priv.h:25 netmem_is_pp() warn: masked
 condition '(netmem_get_pp_magic(netmem) & ~((((0) + (((((1 << (8 * 8 - 1 -
 (((-1)) < 1))) - 1) + (1 << (8 * 8 - 1 - (((-1)) < 1))))) << ((1 + __fls((64
 + (6767463209352822784)) - (6767463209352822784))...
Message-ID: <202607252245.0syGIDlt-lkp@intel.com>
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
head:   48a5a7ab8d6ab7090564339e039c421f315de912
commit: 104ea1c84b91c9f452e497ba51602b903711cdd5 bits: unify the non-asm GE=
NMASK*()
date:   12 months ago
:::::: branch date: 2 days ago
:::::: commit date: 12 months ago
config: powerpc64-randconfig-r073-20260725 (https://download.01.org/0day-ci=
/archive/20260725/202607252245.0syGIDlt-lkp@intel.com/config)
compiler: clang version 21.1.8 (https://github.com/llvm/llvm-project 2078da=
43e25a4623cab2d0d60decddf709aaea28)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 104ea1c84b91 ("bits: unify the non-asm GENMASK*()")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607252245.0syGIDlt-lkp@intel.com/

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

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
