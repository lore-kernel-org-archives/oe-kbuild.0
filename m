Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758523469E7
	for <oe-kbuild@lists.linux.dev>; Thu,  7 May 2026 23:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778197252; cv=none; b=UkOIGV0EzoS2xQDu8iqRIuwX7EpqiwVIqJbJEUDt9Q9i6uYcBAc+XUb+j6W5Xh/44kvBoVLlqVydYeerDEGv2K1x40/t4qpmpi5cyALiJA3wPDHVijjJHr2QSfEEXdQkX0wDMbO8lJ2Vc+bKolIY2c2dmGtXTRfzUO9w0sqyFFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778197252; c=relaxed/simple;
	bh=GljXx2vMjMOqLafSoIeastuLhrPO1r6XJg2Ecuvl8qU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gsymzta2tYb3OYxXvL/PieZHM283k+Ef0Nsc9S1mpmLIwWjEJx6oZHpn4miuyru6aNHh2svk/JFNxQnvaUbODAwQvGhetiCt8tkLsE+no66lT1G3hMycDwPCWtHK4YhuNBxOD3VF29avT75Qc9JVdM1yF8YGpw+oCzunbWQVwlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R0Ldkzhb; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R0Ldkzhb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778197252; x=1809733252;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=GljXx2vMjMOqLafSoIeastuLhrPO1r6XJg2Ecuvl8qU=;
  b=R0LdkzhbJxKsj/nzXLNbPU8COYLcE++KHXn8oODlIoZG1gLunCPU+ZuH
   7d6scii+U6/aUyoE9e0I8llDq17DBsg4ppr/CMkdKZcRMvwX3jmAjJmYy
   UmbR4y0VkZUeLoHPHymkv+PUSfnOEeiLCZanZtugG/Tevg+EHseyWCal6
   3L9ycO+4JL8DvFWaSDlZEs8jpUrvbrjRpS1rvVDFE8LZakDubheQPoRsB
   ME7ycS4ZtqPW6Z50subA6dCrvBPax3nrRuwSOxObCht332nl6UwefBNcO
   g3JmuFntkKen0z0MkMH9uS77ehY/Cgn0K9ICII3TEdbrpOTRYUQccZCKs
   w==;
X-CSE-ConnectionGUID: J3HBlFdnT+SoDmpScFTSvQ==
X-CSE-MsgGUID: SwKiS2+JTwKh/bDlZ2Sz0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79064879"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="79064879"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 16:40:51 -0700
X-CSE-ConnectionGUID: FWPuR3mbRxGNWyKRYSXZQQ==
X-CSE-MsgGUID: w2ocDf3KQVac9c8Qt+M/SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="230219890"
Received: from lkp-server01.sh.intel.com (HELO d6e19f2f5857) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 May 2026 16:40:49 -0700
Received: from kbuild by d6e19f2f5857 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wL8Kl-000000000Zh-2GAZ;
	Thu, 07 May 2026 23:40:47 +0000
Date: Fri, 08 May 2026 07:39:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 5682/13385]
 drivers/platform/x86/hp/hp-wmi.c:391 rpm_to_pwm() warn: signedness bug
 returning '(-65025)'
Message-ID: <202605080719.1aBMAYBS-lkp@intel.com>
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
TO: Krishna Chomal <krishna.chomal108@gmail.com>
CC: "Ilpo J=C3=A4rvinen" <ilpo.jarvinen@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   17c7841d09ee7d33557fd075562d9289b6018c90
commit: 46be1453e6e61884b4840a768d1e8ffaf01a4c1c [5682/13385] platform/x86:=
 hp-wmi: add manual fan control for Victus S models
:::::: branch date: 12 hours ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-161-20260507 (https://download.01.org/0day-ci/arc=
hive/20260508/202605080719.1aBMAYBS-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605080719.1aBMAYBS-lkp@intel.com/

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

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
