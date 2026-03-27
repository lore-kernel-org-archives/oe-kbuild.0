Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CD9390CBF
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Mar 2026 08:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774600275; cv=none; b=mL1YT/HF7NRP4o5B6gqijAhkcxsqVjK7I2DNryT/vME8TObO4XfTTY4MbYdk+bGQCam682k4I/G8P+3krVaHKlE6pwJWcdbreNAC2iwPSIqTEChaEQMXO8G5rReN+M1egY6a6GQIV6u6PDs7jdT1ZTrDpjZ9qu4Wu1aWSknukQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774600275; c=relaxed/simple;
	bh=4nkxaKJc22Hs7n49B/+VNo+qaovd3RkpicDG6ZI+JSM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=LyhBchwR8gzLs7pZQRh1DUkSRTPWgDKte9u0QReG799xp2qfawXd5k3HPMQXiamhfcqANxog5ECjS0RRwX0QGnO8R5CjWpduRFTovVnBQk7bsHRGY6r4bsNIb/nG9oxqdhb6r8kQS1Qn945DPy9Biq8YUUvYy6/Fvzzj9c2nZ/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yrm1e3dm; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yrm1e3dm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774600274; x=1806136274;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=4nkxaKJc22Hs7n49B/+VNo+qaovd3RkpicDG6ZI+JSM=;
  b=Yrm1e3dmOLFwOm/xqrd26onBFjJ6jz8OvMrIQNan0KnBDVb2+2kPBUD2
   vvrTyuqPIXujZ+/ExJmkNaR+z2r0VlW9FOVzMpkxfLft63Fn3S1IkpAO0
   gY/gVy3J0G1h+g/w2AoV3213YrFJFwH7Iww6723QH2OWWwaj4PWW4rkbd
   iLxIOANmGs+FqIfb3hu4DGS8gwZ5+LinTjS90+QJiTA4bEL8XfZndIqfT
   aU6CHU56OIMPUPbHmiR90oxqE5SiLdv1QUhc0bMPnq/P2GKF6YmkduoCd
   cskQAsUEHs37w0F5t4Adag2Ic4WTGFic0lJCR1FeP9g7MuOOQ6t3qp0ms
   Q==;
X-CSE-ConnectionGUID: HkvwKIviSu+KzxtIDBu76g==
X-CSE-MsgGUID: kzSmdgErRsyWOQ+nU9IseA==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="63225369"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="63225369"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 01:31:13 -0700
X-CSE-ConnectionGUID: HFRYIQ9PSlenYSHex/Oxgg==
X-CSE-MsgGUID: taioyQQ9R62EFel27GiJyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="255751631"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Mar 2026 01:31:12 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w62az-000000009yZ-3JUs;
	Fri, 27 Mar 2026 08:31:09 +0000
Date: Fri, 27 Mar 2026 16:30:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 9218/9273]
 drivers/platform/x86/asus-wmi.c:4427:27: sparse: sparse: unsigned value that
 used to be signed checked against zero?
Message-ID: <202603271607.FADIT5HL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "low confidence static check warning: drivers/p=
latform/x86/asus-wmi.c:4427:27: sparse: sparse: unsigned value that used to=
 be signed checked against zero?"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Ilpo J=C3=A4rvinen" <ilpo.jarvinen@linux.intel.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   e77a5a5cfe43b4c25bd44a3818e487033287517f
commit: 5966013848d1661f1062965bb0d696bbca08daa0 [9218/9273] Merge branch '=
for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform=
-drivers-x86.git
:::::: branch date: 16 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-062-20260327 (https://download.01.org/0day-ci/archi=
ve/20260327/202603271607.FADIT5HL-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260327/202603271607.FADIT5HL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603271607.FADIT5HL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/platform/x86/asus-wmi.c:2792:33: sparse: sparse: incorrect type =
in argument 3 (different base types) @@     expected unsigned int [usertype=
] val @@     got restricted __le32 [usertype] @@
   drivers/platform/x86/asus-wmi.c:2792:33: sparse:     expected unsigned i=
nt [usertype] val
   drivers/platform/x86/asus-wmi.c:2792:33: sparse:     got restricted __le=
32 [usertype]
>> drivers/platform/x86/asus-wmi.c:4427:27: sparse: sparse: unsigned value =
that used to be signed checked against zero?
   drivers/platform/x86/asus-wmi.c:4424:26: sparse: signed value source

vim +4427 drivers/platform/x86/asus-wmi.c

2c97d3e55b70ed Luke D. Jones 2023-08-30  4421 =20
2c97d3e55b70ed Luke D. Jones 2023-08-30  4422  static int update_screenpad_=
bl_status(struct backlight_device *bd)
2c97d3e55b70ed Luke D. Jones 2023-08-30  4423  {
034f5efd362fb8 Denis Benato  2026-03-02  4424  	u32 ctrl_param =3D bd->prop=
s.brightness;
034f5efd362fb8 Denis Benato  2026-03-02  4425  	int err =3D 0;
2c97d3e55b70ed Luke D. Jones 2023-08-30  4426 =20
034f5efd362fb8 Denis Benato  2026-03-02 @4427  	if (ctrl_param >=3D 0 && bd=
->props.power) {
034f5efd362fb8 Denis Benato  2026-03-02  4428  		err =3D asus_wmi_set_devst=
ate(ASUS_WMI_DEVID_SCREENPAD_POWER, 1, NULL);
034f5efd362fb8 Denis Benato  2026-03-02  4429  		if (err < 0)
034f5efd362fb8 Denis Benato  2026-03-02  4430  			return err;
2c97d3e55b70ed Luke D. Jones 2023-08-30  4431 =20
2c97d3e55b70ed Luke D. Jones 2023-08-30  4432  		err =3D asus_wmi_set_devst=
ate(ASUS_WMI_DEVID_SCREENPAD_LIGHT, ctrl_param, NULL);
034f5efd362fb8 Denis Benato  2026-03-02  4433  		if (err < 0)
034f5efd362fb8 Denis Benato  2026-03-02  4434  			return err;
2c97d3e55b70ed Luke D. Jones 2023-08-30  4435  	}
2c97d3e55b70ed Luke D. Jones 2023-08-30  4436 =20
034f5efd362fb8 Denis Benato  2026-03-02  4437  	if (!bd->props.power) {
034f5efd362fb8 Denis Benato  2026-03-02  4438  		err =3D asus_wmi_set_devst=
ate(ASUS_WMI_DEVID_SCREENPAD_POWER, 0, NULL);
034f5efd362fb8 Denis Benato  2026-03-02  4439  		if (err < 0)
034f5efd362fb8 Denis Benato  2026-03-02  4440  			return err;
034f5efd362fb8 Denis Benato  2026-03-02  4441  	}
2c97d3e55b70ed Luke D. Jones 2023-08-30  4442 =20
2c97d3e55b70ed Luke D. Jones 2023-08-30  4443  	return err;
2c97d3e55b70ed Luke D. Jones 2023-08-30  4444  }
2c97d3e55b70ed Luke D. Jones 2023-08-30  4445 =20

:::::: The code at line 4427 was first introduced by commit
:::::: 034f5efd362fb87a3970d61eaf982664f84e6c5a platform/x86: asus-wmi: adj=
ust screenpad power/brightness handling

:::::: TO: Denis Benato <denis.benato@linux.dev>
:::::: CC: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
