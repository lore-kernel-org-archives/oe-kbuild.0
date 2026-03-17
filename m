Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1479F330648
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Mar 2026 09:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773738385; cv=none; b=jAzKBlZrvk4g8r+RdSnyzIBkw/y0kJmU8iERrDDRgzXsiPBklQQo3V4INL5ovuy+SKvTkPlbmtoQS3XnMIiRUprg8FdWSdCQmP5TR1uIUajYmeGa1Gw8VVpQi8mXhFoLTbu70e9F50uGCHxBKCBV7PctaL5xSpPOOTKRrcGLEqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773738385; c=relaxed/simple;
	bh=MQX0rIRphhA52U28PQTw0vjpFXoRFuIZz1e9m3nGOvE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=c+fEtnTp1XdPslVYE5uMx6k0r3UKSwOaDS1/cyo87PlqSV2zJCr2W7PEUo5Kswb7wuLyASlEjfgmZDGNF9fWdVdEFuFPlSZ9TJ4Uyas2OklpsbMH94YnQx1O8dR7KALpMJlPVlAkgnpKC0TXPKSlyRuY59CTKrYNDiYpF4+Bh2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dC9DDrA0; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dC9DDrA0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773738384; x=1805274384;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=MQX0rIRphhA52U28PQTw0vjpFXoRFuIZz1e9m3nGOvE=;
  b=dC9DDrA0iZqulvzeWZPDX8Ii2Cnu14J/Y28kxuFrzHdWnehmwabf0De1
   2f34ZDCtx7WrZLTOB0TdFwnEQ4weAakalWkVYW1Dhf3BtINWnSU9T1g9E
   XbIm+aFQZF+GBEGu7BvUioRqROTqCBN4xiIAWHQ9lsyWJA6FtXSGg6cg8
   tak9UBjSXUyh1fxXoiDmJaOZHi4dizDEuZxz6pXqQvA+UI9RjLRWnGN1H
   +l2OWB85wzP7n36RNWxSXhpY1It8X2Do8UbVa6XJ+0ru1vInpdxUA+lfE
   vUZt9g+WXPcd8JP2MwshG1lsXZe1g2Ac0zFAvyCemKO8y+xZqubB7Cz9J
   g==;
X-CSE-ConnectionGUID: 2oo87ANeRiiNlPlBcZMevQ==
X-CSE-MsgGUID: 55+LkQCZThWD1ruS9c3txA==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="73782690"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="73782690"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 02:06:24 -0700
X-CSE-ConnectionGUID: idEPTw5mRhaKBucKQDo/WA==
X-CSE-MsgGUID: 4sQSO/GWSZCb7RMhRrwgAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="226880009"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Mar 2026 02:06:22 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2QNY-0000000008h-1FRs;
	Tue, 17 Mar 2026 09:06:20 +0000
Date: Tue, 17 Mar 2026 17:06:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: security/apparmor/policy_unpack.c:151 aa_ploaddata_kref()
 warn: can 'd' even be NULL?
Message-ID: <202603171615.S1QWwUPB-lkp@intel.com>
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
head:   2d1373e4246da3b58e1df058374ed6b101804e07
commit: a0b7091c4de45a7325c8780e6934a894f92ac86b apparmor: fix race on rawd=
ata dereference
date:   7 days ago
:::::: branch date: 17 hours ago
:::::: commit date: 7 days ago
config: xtensa-randconfig-r072-20260317 (https://download.01.org/0day-ci/ar=
chive/20260317/202603171615.S1QWwUPB-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603171615.S1QWwUPB-lkp@intel.com/

New smatch warnings:
security/apparmor/policy_unpack.c:151 aa_ploaddata_kref() warn: can 'd' eve=
n be NULL?

Old smatch warnings:
arch/xtensa/include/asm/thread_info.h:97 current_thread_info() warn: incons=
istent indenting
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

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
