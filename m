Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA8522423A
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Mar 2026 21:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774042730; cv=none; b=rIyGSUnqivmREbLRTkjG4TM7JDUoG/1MEmxQqQoLXh4J/R4unCY226xbQpnQBWnWju71gg6YC9WvJM/y/h7bF7AZQBpd11CuUOuJKDIvmtdffPmVcM4v+wEogkmav5NFXdV1TpStpiIovM9P7sspbUmgfmjQsoJ+XeueKmhP21A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774042730; c=relaxed/simple;
	bh=7v3cedIA8WJL1RPZ0RdjcvpHJZAuoT9M6GtEOykmcso=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BYpQcBdMnzDG/QlrumNZIiqX0VULuJuk3h3azFopUDDCfm8i1OveTKwWBivhvgNlpDFEGvFlEe5mYilU+sytFjnhbm5sUfl/HQgrhj6q4XW+Sdat9YSSNykA6nFftyl4hxsLBdF+EuojM2puvZ+MSZhM+LxXBBUexln9VGYREgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IqZeDxwT; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IqZeDxwT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774042729; x=1805578729;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7v3cedIA8WJL1RPZ0RdjcvpHJZAuoT9M6GtEOykmcso=;
  b=IqZeDxwTmAly3P8zTfjF4AvKRR3/q3URdr6kl/ul9KnLnd4Z/oV0FFpn
   es4s2nQn2BOJfiy31FCBkyb2fPHcM+73xjaAcgXfbDvsAVSgr5h9YlQMu
   gms3y+K0ZYYNuPHTDeQnRJ/In3PVAlDrV4aEZoN0bxPUxovxHn/nrOIQt
   p/IKo5SMSQ46khM+9D1RhGH1yK8RNJaXFRg60jiXS6/Ee19bapZ4/SKPn
   SN+EyXXhLt/6epnwXyN7QX0Z7/6++kKZWomO7Ris4RCfNCTikrZfevcGj
   RP53rGsL3dzmlrUkyobeVGLdAvCixYvtWLMP9gnPVwlMU/i1zE6mCsWs7
   A==;
X-CSE-ConnectionGUID: rZvWrMN6Qfqq6XNeLET+Sg==
X-CSE-MsgGUID: 7JJCe673QwyEmRsVFPDf7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="92711470"
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="92711470"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 14:38:48 -0700
X-CSE-ConnectionGUID: r5PUFj/9Su2hFeyYu/HsAg==
X-CSE-MsgGUID: 7UlOLJJWQVKDyx+yNuSlvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="246427711"
Received: from lkp-server02.sh.intel.com (HELO ef9b23065726) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 20 Mar 2026 14:38:47 -0700
Received: from kbuild by ef9b23065726 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3hXe-000000000FD-3li3;
	Fri, 20 Mar 2026 21:38:05 +0000
Date: Sat, 21 Mar 2026 05:22:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 6465/7971]
 drivers/block/drbd/drbd_debugfs.c:336 drbd_get_peer_request_state() warn:
 bitwise AND condition is false here
Message-ID: <202603210529.IutAxKNP-lkp@intel.com>
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
TO: "Christoph B=C3=B6hmwalder" <christoph.boehmwalder@linbit.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   785f0eb2f85decbe7c1ef9ae922931f0194ffc2e
commit: 945807e66a140e5ee0f919d04e15eadd4cc294be [6465/7971] drbd: remove B=
ROKEN for DRBD
:::::: branch date: 6 hours ago
:::::: commit date: 2 days ago
config: nios2-randconfig-r073-20260321 (https://download.01.org/0day-ci/arc=
hive/20260321/202603210529.IutAxKNP-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603210529.IutAxKNP-lkp@intel.com/

smatch warnings:
drivers/block/drbd/drbd_debugfs.c:336 drbd_get_peer_request_state() warn: b=
itwise AND condition is false here

vim +336 drivers/block/drbd/drbd_debugfs.c

0c897516a4856d Christoph B=C3=B6hmwalder 2025-12-16  328 =20
0c897516a4856d Christoph B=C3=B6hmwalder 2025-12-16  329  static enum drbd_=
peer_request_state drbd_get_peer_request_state(struct drbd_peer_request *pe=
er_req)
f418815f7adad4 Lars Ellenberg       2014-05-05  330  {
0c897516a4856d Christoph B=C3=B6hmwalder 2025-12-16  331  	unsigned long in=
terval_flags =3D peer_req->i.flags;
0c897516a4856d Christoph B=C3=B6hmwalder 2025-12-16  332 =20
0c897516a4856d Christoph B=C3=B6hmwalder 2025-12-16  333  	if (interval_fla=
gs & INTERVAL_SUBMITTED)
0c897516a4856d Christoph B=C3=B6hmwalder 2025-12-16  334  		return PRS_SUBM=
ITTED;
0c897516a4856d Christoph B=C3=B6hmwalder 2025-12-16  335 =20
0c897516a4856d Christoph B=C3=B6hmwalder 2025-12-16 @336  	if (interval_fla=
gs & INTERVAL_SENT)
0c897516a4856d Christoph B=C3=B6hmwalder 2025-12-16  337  		return PRS_SENT;
0c897516a4856d Christoph B=C3=B6hmwalder 2025-12-16  338 =20
0c897516a4856d Christoph B=C3=B6hmwalder 2025-12-16  339  	return PRS_NEW;
0c897516a4856d Christoph B=C3=B6hmwalder 2025-12-16  340  }
0c897516a4856d Christoph B=C3=B6hmwalder 2025-12-16  341 =20

:::::: The code at line 336 was first introduced by commit
:::::: 0c897516a4856d55c75cfdb2b02489b0fc50bdf8 drbd: rework support module=
s for DRBD 9 multi-peer monitoring

:::::: TO: Christoph B=C3=B6hmwalder <christoph.boehmwalder@linbit.com>
:::::: CC: Christoph B=C3=B6hmwalder <christoph.boehmwalder@linbit.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
