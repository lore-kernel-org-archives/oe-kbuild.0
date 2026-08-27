Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7752940F756
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Aug 2026 09:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787821735; cv=none; b=gu2E+4DpPqMnrbUAQbFOvdfFMxkXee0LCgT0FYtAXpO6ptTc2NFfZ8+bARGdTq+wOptOwJKivGiL94Ss8bKkk0MaUh/0usn1T//E0LJEuGLcPoI8363iMmBfbJFkr3Nt/c/ELqI7lRWRkp4VxGPRpEXg4XCLI0KX/t6j5aZked8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787821735; c=relaxed/simple;
	bh=kKhFAlp3fhXUQlP/DEbyNvaC90aF0xU6mHdGuOj8JpU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=JBjjC34s0KTfOjF/GuiANrWegHuCwYPw4MyE1X+VX68icBfr2GuqwwKw/KSyrRyQCDm82IpXaRZwfjMsKTG/tEz3TVxshL8cg/ephCtXNNbbyEKU76iJ3uosPaKLvqgt7VK5JZ6vcqgJ3iT5XeHebJ5i2d1zdMh5sWmIB5hD+Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mkZm3PH9; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mkZm3PH9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787821729; x=1819357729;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=kKhFAlp3fhXUQlP/DEbyNvaC90aF0xU6mHdGuOj8JpU=;
  b=mkZm3PH9v0ks1fvvOAl8RBMkdpUaJ5dFNtxNtv9v0lAprlInIUqzoLd5
   56se8bLpTm/LIjjQ51FKNYF/mrWsMn5F0Nz3VOtW0vU2ELEs9RQgGLqSj
   GhDJy5RySl0ODj/PDfQgdbKkVFN7mNko6uwx+rwCj1562C/MhCzQjOaMG
   /yqEPXV497i9tJoga6W9gKSpEnDzh6cZOs0kQrempg9qCA5X0X34YmuPm
   BdIgNzcg25hnzF7zhrX+lqoEaoVITZF8ArGpo092RQnhwz17rs++t0l/J
   vzBIo3XhpJPVMJzK3X6atHBS9GnQqcmMJccGpUUMQ7Da6In22HZLbypLh
   A==;
X-CSE-ConnectionGUID: d/phUfuGRTm0hHqyt/alrA==
X-CSE-MsgGUID: r2SrxvSBT2qT6hIVePSpdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88195204"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88195204"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 02:08:47 -0700
X-CSE-ConnectionGUID: KfsC0rNQRpO9Lu8dgLu5SQ==
X-CSE-MsgGUID: 8QaO4WnERQW5dVjvMesTvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="269764259"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 Aug 2026 02:08:46 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzW6F-000000009Dd-1QtT;
	Thu, 27 Aug 2026 09:08:43 +0000
Date: Thu, 27 Aug 2026 17:07:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/platform/x86/hp/hp-wmi.c:391 rpm_to_pwm() warn:
 signedness bug returning '(-65025)'
Message-ID: <202608271644.FXMsBF9y-lkp@intel.com>
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
TO: Krishna Chomal <krishna.chomal108@gmail.com>
CC: "Ilpo J=C3=A4rvinen" <ilpo.jarvinen@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   45c13f3f9e3bb15fd89ff2864c6f627a3b4b4229
commit: 46be1453e6e61884b4840a768d1e8ffaf01a4c1c platform/x86: hp-wmi: add =
manual fan control for Victus S models
date:   7 months ago
:::::: branch date: 2 days ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-r073-20260827 (https://download.01.org/0day-ci/ar=
chive/20260827/202608271644.FXMsBF9y-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 46be1453e6e6 ("platform/x86: hp-wmi: add manual fan control for Vi=
ctus S models")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608271644.FXMsBF9y-lkp@intel.com/

smatch warnings:
drivers/platform/x86/hp/hp-wmi.c:391 rpm_to_pwm() warn: signedness bug retu=
rning '(-65025)'

vim +391 drivers/platform/x86/hp/hp-wmi.c

46be1453e6e618 Krishna Chomal 2026-01-13  388 =20
46be1453e6e618 Krishna Chomal 2026-01-13  389  static inline u8 rpm_to_pwm(=
u8 rpm, struct hp_wmi_hwmon_priv *priv)
46be1453e6e618 Krishna Chomal 2026-01-13  390  {
46be1453e6e618 Krishna Chomal 2026-01-13 @391  	return fixp_linear_interpol=
ate(0, 0, priv->max_rpm, U8_MAX,
46be1453e6e618 Krishna Chomal 2026-01-13  392  				       clamp_val(rpm, 0,=
 priv->max_rpm));
46be1453e6e618 Krishna Chomal 2026-01-13  393  }
46be1453e6e618 Krishna Chomal 2026-01-13  394 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
