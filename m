Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AF325333F
	for <oe-kbuild@lists.linux.dev>; Thu, 15 Jan 2026 02:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768442863; cv=none; b=c72ja9Y/ZKDSDBSArQ8lZO90zyT6fs7sG9e5Z6lw6mPzAYQ2fsNJxQLN+vrtEYhFYfAwIey0t3Ujyu2WYhtktBxkE6juoldR+ddymn8PnwXwtwPRadWWMnvce/g+jE6Gz5GXlcapSvCjuu6BZbO5XGDFDJ0VcwUyvYovfG3eguQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768442863; c=relaxed/simple;
	bh=I7joOCrV5tfHOvgTFOyGK8OnjF7RPtQmwbj91oz3NqE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Y6nhqxhXhSxDCD70dzSV6KBD3xUc1K5TlFSVG+OXueTTDaqK/F9vgKjW434ZJvHymCCW7LF28XCM00agpFpi2MvRP9EdTr9x8J5Kbgiho/QtRAxsXVtHpAjXba0e7az/h7IdtQwo37lFQ9cgFcwR56p31D0ilETB01UOa/l3/1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AO5+Hx+E; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AO5+Hx+E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768442861; x=1799978861;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=I7joOCrV5tfHOvgTFOyGK8OnjF7RPtQmwbj91oz3NqE=;
  b=AO5+Hx+EPRHjQX603S63xH1Fle5v4dSQlJ6s15ooyUirHlE8wl0/Pg6T
   Gf3oPRA9pmrMMLKSXl6SbMO/jKxPPKNCBgyr6c6hbknViFBoD5eEGrqES
   6r1sc3x3gSznHG//HenMAuAPtvrRFz0dR0CAHoBqFzw4qt7n5zp1WSv3C
   1sol/ZVQfbiwH8PdpV2zmc3c5EJ+do4mI5nA8iXZ8J1JFrbSWESY8Q1xP
   YTn2MNlrdR17vPoSOimGmcUHbcy4+7FnlioG3NJhtPIAxEgtOQhlkye5r
   Q9cHyiGu78ZxadGL2NMIg1R5tdv5uzwyDhlFo5f3e0aXT4kjKDxWDj+9n
   Q==;
X-CSE-ConnectionGUID: 3BIZ0PrGRf2GiVC3GEs5eg==
X-CSE-MsgGUID: zP1loB9JRs2WngGNygyHpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="81116340"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="81116340"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 18:07:40 -0800
X-CSE-ConnectionGUID: KBClS8ZeRTa2p0YRL1YYzw==
X-CSE-MsgGUID: obRO8vJ9RbmS2PYNHn36FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="204049974"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 Jan 2026 18:07:38 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgCls-00000000HNc-0WUk;
	Thu, 15 Jan 2026 02:07:36 +0000
Date: Thu, 15 Jan 2026 10:06:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/panfrost/panfrost_job.c:964
 panfrost_jm_close() warn: iterator 'i' not incremented
Message-ID: <202601151033.x6xAiEgh-lkp@intel.com>
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
TO: "Adri=C3=A1n Larumbe" <adrian.larumbe@collabora.com>
CC: Steven Price <steven.price@arm.com>
CC: Boris Brezillon <bbrezillon@kernel.org>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   944aacb68baf7624ab8d277d0ebf07f025ca137c
commit: 32dd00f17c1441fa8dd7fdd89223d7907eb75325 drm/panfrost: Rename panfr=
ost_job functions to reflect real role
date:   3 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 3 months ago
config: arm64-randconfig-r073-20260115 (https://download.01.org/0day-ci/arc=
hive/20260115/202601151033.x6xAiEgh-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601151033.x6xAiEgh-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/panfrost/panfrost_job.c:964 panfrost_jm_close() warn: itera=
tor 'i' not incremented

vim +/i +964 drivers/gpu/drm/panfrost/panfrost_job.c

6aa8bc58ac88f3a Boris Brezillon 2025-09-17  957 =20
32dd00f17c1441f Adri=C3=A1n Larumbe  2025-10-19  958  void panfrost_jm_clos=
e(struct drm_file *file)
6aa8bc58ac88f3a Boris Brezillon 2025-09-17  959  {
6aa8bc58ac88f3a Boris Brezillon 2025-09-17  960  	struct panfrost_file_priv=
 *panfrost_priv =3D file->driver_priv;
6aa8bc58ac88f3a Boris Brezillon 2025-09-17  961  	struct panfrost_jm_ctx *j=
m_ctx;
6aa8bc58ac88f3a Boris Brezillon 2025-09-17  962  	unsigned long i;
6aa8bc58ac88f3a Boris Brezillon 2025-09-17  963 =20
6aa8bc58ac88f3a Boris Brezillon 2025-09-17 @964  	xa_for_each(&panfrost_pri=
v->jm_ctxs, i, jm_ctx)
6aa8bc58ac88f3a Boris Brezillon 2025-09-17  965  		panfrost_jm_ctx_destroy(=
file, i);
6aa8bc58ac88f3a Boris Brezillon 2025-09-17  966 =20
6aa8bc58ac88f3a Boris Brezillon 2025-09-17  967  	xa_destroy(&panfrost_priv=
->jm_ctxs);
6aa8bc58ac88f3a Boris Brezillon 2025-09-17  968  }
6aa8bc58ac88f3a Boris Brezillon 2025-09-17  969 =20

:::::: The code at line 964 was first introduced by commit
:::::: 6aa8bc58ac88f3aafb48df68db14dc6b8c85f295 drm/panfrost: Introduce JM =
contexts for manging job resources

:::::: TO: Boris Brezillon <boris.brezillon@collabora.com>
:::::: CC: Steven Price <steven.price@arm.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
