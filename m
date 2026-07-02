Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A2734D3B0
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Jul 2026 06:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782973595; cv=none; b=k5AuuLQTCclzJvSbaTLEL8VnBvrlwUgkW4IsnXUsjSXyzeFpw0k+4WzPmCd/e+qBiKln+itbrWYhnW5ohRbXQVV5GXFXONkXYf0pBWPzxOH+8t/4ZF/pZNs4I0tp/1SKxNcv/pvR5gqFqSFc0XWAGRwywlcmzFCj1HOgYKQERVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782973595; c=relaxed/simple;
	bh=f8vil/ny9MCm4940fL3tiS7bdKqr6M+zmzT9rKR182Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=c7gAs4AN3vMVzDz5EyPCm2PDZVl6mJOqkd1kZiT/CZCwP5MvoakMGeQsVgImJX2g8cYpF51V1kYYAcca7XPEZvNaXXxpMeNol/EDe3tEsLFEvR/3qFunlGolUMiMj1fYuvAOTlasCmSfAxhazka7qMjW2oA7kdOG3fNnf9saeCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mz239QXr; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mz239QXr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782973594; x=1814509594;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=f8vil/ny9MCm4940fL3tiS7bdKqr6M+zmzT9rKR182Y=;
  b=mz239QXrRDeTUAvxIK4Z/EVSa37JMbUa3u87jV+iaNyc/X6lgDZHBc+t
   wSoWEKnNpfWXH/LTckv7csl8BPurE5j+fO/K2qyAcJDz0+jCVk8CEy+ZB
   QNFxLSvVfyIsUgO+v3IpZK25vg/tCPl855bD6NEW+S/Ae3xHZaFba7lyv
   FqkGUtjp8m9Gte+4Tsx0HQDSojtvLkaxPPCnB0zt/0XvVQwSw4IrC1Xbl
   hxQ09OiLCi0yu12skgKHXNx30e1oQpsTbZ2yno4U95oJWgbHAZQrB9f0t
   O7S1t4Q9R4lX6PEf7ZKMioOm9kp4aEKPadr+ySU3G3cMVWsYn0qYEMuhs
   A==;
X-CSE-ConnectionGUID: MoOgKS03SS2nreyybs06fw==
X-CSE-MsgGUID: aEvqVsYVQ/StOtKkTpQ4xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="83493173"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="83493173"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 23:26:33 -0700
X-CSE-ConnectionGUID: 0B76BYTiTaKfvnwxCUSclg==
X-CSE-MsgGUID: PLIOpBGOSOyZDaqmaWDPHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="250113466"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 01 Jul 2026 23:26:32 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfAsX-00000000A5p-3Nha;
	Thu, 02 Jul 2026 06:26:29 +0000
Date: Thu, 02 Jul 2026 14:25:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: security/apparmor/policy_unpack.c:151 aa_ploaddata_kref()
 warn: can 'd' even be NULL?
Message-ID: <202607021440.4ZBIiSZM-lkp@intel.com>
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
TO: John Johansen <john.johansen@canonical.com>
CC: Georgia Garcia <georgia.garcia@canonical.com>
CC: "Maxime B=C3=A9lair" <maxime.belair@canonical.com>
CC: Cengiz Can <cengiz.can@canonical.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4a50a141f05a8d1737661b19ee22ff8455b94409
commit: a0b7091c4de45a7325c8780e6934a894f92ac86b apparmor: fix race on rawd=
ata dereference
date:   4 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 4 months ago
config: i386-randconfig-141-20260702 (https://download.01.org/0day-ci/archi=
ve/20260702/202607021440.4ZBIiSZM-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: a0b7091c4de4 ("apparmor: fix race on rawdata dereference")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607021440.4ZBIiSZM-lkp@intel.com/

New smatch warnings:
security/apparmor/policy_unpack.c:151 aa_ploaddata_kref() warn: can 'd' eve=
n be NULL?

Old smatch warnings:
security/apparmor/policy_unpack.c:881 unpack_tags() warn: missing error cod=
e 'error'
security/apparmor/policy_unpack.c:1045 unpack_pdb() error: we previously as=
sumed 'pdb->dfa' could be null (see line 1009)

vim +/d +151 security/apparmor/policy_unpack.c

5d5182cae40115 John Johansen 2017-05-09  146 =20
a0b7091c4de45a John Johansen 2026-02-24  147  void aa_ploaddata_kref(struct=
 kref *kref)
5ac8c355ae0013 John Johansen 2017-01-16  148  {
a0b7091c4de45a John Johansen 2026-02-24  149  	struct aa_loaddata *d =3D co=
ntainer_of(kref, struct aa_loaddata, pcount);
5ac8c355ae0013 John Johansen 2017-01-16  150 =20
5ac8c355ae0013 John Johansen 2017-01-16 @151  	if (d) {
a0b7091c4de45a John Johansen 2026-02-24  152  		INIT_WORK(&d->work, do_ploa=
ddata_rmfs);
5d5182cae40115 John Johansen 2017-05-09  153  		schedule_work(&d->work);
5ac8c355ae0013 John Johansen 2017-01-16  154  	}
5ac8c355ae0013 John Johansen 2017-01-16  155  }
5ac8c355ae0013 John Johansen 2017-01-16  156 =20

:::::: The code at line 151 was first introduced by commit
:::::: 5ac8c355ae0013d82b3a07b49aebeadfce9b6e52 apparmor: allow introspecti=
ng the loaded policy pre internal transform

:::::: TO: John Johansen <john.johansen@canonical.com>
:::::: CC: John Johansen <john.johansen@canonical.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
