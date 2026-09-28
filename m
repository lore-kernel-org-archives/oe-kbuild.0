Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471344E1C8D
	for <oe-kbuild@lists.linux.dev>; Mon, 28 Sep 2026 14:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790606037; cv=none; b=l2ALkL0fwQrPZ/034hfItA+gXQl/T+R8cRpxfg7U8oTqt4mldeznBu+dsFAzlX5SALDjr7mlb6e8h3Idaz/jqMRQT7CqJtC26tyKLUz7w7zvb24pi25W+z8xRXbUzcMjwEOc+Kj/R6NC1CxjnPkBB0XHIGzJbyMTTGnIMsJfAXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790606037; c=relaxed/simple;
	bh=mU7aq4fr3qV2yXNAD+4Sh+huBL16SKQo1elFM/gbSNw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gnE0ES49wg5hJ4mEWH4rmeMtgQME1MQ56/4osdk2n4r+WCEXgDOnz3jbPnGMqAVXb7r+YjXOFTw6AkMGc/7u6CeUIdE875Jsp7OOd0ilgoLINndfeOfHUMMXimnHYJbXdJrM3mrJCFEAciehmglOfrr7VWr8QuJLYSpi5NvMmjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JCEtFOeo; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JCEtFOeo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790606028; x=1822142028;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=mU7aq4fr3qV2yXNAD+4Sh+huBL16SKQo1elFM/gbSNw=;
  b=JCEtFOeokbcSNH1c4rdaYydlJ1tQNam2RcINuTM1iyL5+sE8op21vPhI
   INaOFZdfG9UC0SKCBUx9vE2hVgVfneNhe2nkjEZx4qJ3WaX0s5z3ZiSAv
   ZB9Ror+DUABOfGnYFxMfOPeOJZLobQGDv0D9pqvn9yFoLmZbanhx1YBYJ
   OGOoRlFSAC75ssgHAj7ROtYzG1SkWwm3oonczDlZqMFeaN1VstTMHanAR
   SnNxzmm+GzBYaYknfjdxTR4QMxPAGjKYchbmDfkTEVZ9eUCEMUcHbQeKh
   3LSKJG3aozRavdDAlgmEGOuf3WeS4WqkxlaAUZmBFqL7GDz0yDxX21AIs
   w==;
X-CSE-ConnectionGUID: o88b6By7Qeq9fYeuL7LimA==
X-CSE-MsgGUID: MnbqT7VpRbuCNSymCSV/OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="78872790"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="78872790"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 07:33:43 -0700
X-CSE-ConnectionGUID: M+VuH2ENTsmtYkfFsOxn0Q==
X-CSE-MsgGUID: aORrumK/T2+jmiZ+GFCxXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="274580407"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 28 Sep 2026 07:33:41 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBCQD-0000000011j-1BKV;
	Mon, 28 Sep 2026 14:33:37 +0000
Date: Mon, 28 Sep 2026 16:33:31 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: sound/i2c/tea6330t.c:387:12-13: WARNING opportunity for
 min()
Message-ID: <202609281612.lgPUHLHP-lkp@intel.com>
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
TO: "C=C3=A1ssio Gabriel" <cassiogabrielcontato@gmail.com>
CC: Takashi Iwai <tiwai@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
commit: 19cbb3e0c27f28feb7781641994226cb2ee206a2 ALSA: tea6330t: add mixer =
state restore helper
date:   6 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 6 months ago
config: i386-randconfig-2101-20260928 (https://download.01.org/0day-ci/arch=
ive/20260928/202609281612.lgPUHLHP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 19cbb3e0c27f ("ALSA: tea6330t: add mixer state restore helper")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202609281612.lgPUHLHP-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> sound/i2c/tea6330t.c:387:12-13: WARNING opportunity for min()

vim +387 sound/i2c/tea6330t.c

19cbb3e0c27f28 C=C3=A1ssio Gabriel 2026-04-07  360 =20
19cbb3e0c27f28 C=C3=A1ssio Gabriel 2026-04-07  361  int snd_tea6330t_restor=
e_mixer(struct snd_i2c_bus *bus)
19cbb3e0c27f28 C=C3=A1ssio Gabriel 2026-04-07  362  {
19cbb3e0c27f28 C=C3=A1ssio Gabriel 2026-04-07  363  	struct snd_i2c_device =
*device;
19cbb3e0c27f28 C=C3=A1ssio Gabriel 2026-04-07  364  	struct tea6330t *tea;
19cbb3e0c27f28 C=C3=A1ssio Gabriel 2026-04-07  365  	unsigned char bytes[7];
19cbb3e0c27f28 C=C3=A1ssio Gabriel 2026-04-07  366  	unsigned int idx;
19cbb3e0c27f28 C=C3=A1ssio Gabriel 2026-04-07  367  	int err;
19cbb3e0c27f28 C=C3=A1ssio Gabriel 2026-04-07  368 =20
19cbb3e0c27f28 C=C3=A1ssio Gabriel 2026-04-07  369  	if (!bus)
19cbb3e0c27f28 C=C3=A1ssio Gabriel 2026-04-07  370  		return -EINVAL;
19cbb3e0c27f28 C=C3=A1ssio Gabriel 2026-04-07  371 =20
19cbb3e0c27f28 C=C3=A1ssio Gabriel 2026-04-07  372  	snd_i2c_lock(bus);
19cbb3e0c27f28 C=C3=A1ssio Gabriel 2026-04-07  373  	list_for_each_entry(de=
vice, &bus->devices, list) {
19cbb3e0c27f28 C=C3=A1ssio Gabriel 2026-04-07  374  		if (device->addr !=3D =
TEA6330T_ADDR)
19cbb3e0c27f28 C=C3=A1ssio Gabriel 2026-04-07  375  			continue;
19cbb3e0c27f28 C=C3=A1ssio Gabriel 2026-04-07  376 =20
19cbb3e0c27f28 C=C3=A1ssio Gabriel 2026-04-07  377  		tea =3D device->priva=
te_data;
19cbb3e0c27f28 C=C3=A1ssio Gabriel 2026-04-07  378  		if (!tea) {
19cbb3e0c27f28 C=C3=A1ssio Gabriel 2026-04-07  379  			err =3D -EINVAL;
19cbb3e0c27f28 C=C3=A1ssio Gabriel 2026-04-07  380  			goto unlock;
19cbb3e0c27f28 C=C3=A1ssio Gabriel 2026-04-07  381  		}
19cbb3e0c27f28 C=C3=A1ssio Gabriel 2026-04-07  382 =20
19cbb3e0c27f28 C=C3=A1ssio Gabriel 2026-04-07  383  		bytes[0] =3D TEA6330T=
_SADDR_VOLUME_LEFT;
19cbb3e0c27f28 C=C3=A1ssio Gabriel 2026-04-07  384  		for (idx =3D 0; idx <=
 6; idx++)
19cbb3e0c27f28 C=C3=A1ssio Gabriel 2026-04-07  385  			bytes[idx + 1] =3D t=
ea->regs[idx];
19cbb3e0c27f28 C=C3=A1ssio Gabriel 2026-04-07  386  		err =3D snd_i2c_sendb=
ytes(device, bytes, 7);
19cbb3e0c27f28 C=C3=A1ssio Gabriel 2026-04-07 @387  		err =3D err < 0 ? err=
 : 0;

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
