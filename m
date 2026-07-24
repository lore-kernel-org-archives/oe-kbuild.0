Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294D42D7386
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Jul 2026 06:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784876129; cv=none; b=tJvkU5WwHhv3hYsyACCbugt6zLUdcXcpk1r9K35ft3p0ilS3AjVrxXhtvbyTjliAmwqtJ2EI1tmR4Hcd2JRyzFRLGsl9QKvJCCvBETIL9fz4gBdaJfiiVcvV/tHMgde3IVAGv5TgVAzHyl36ZQTT4VHYmvJNjSTadu+PLLgKe1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784876129; c=relaxed/simple;
	bh=aFCQ0ndg3LEkjFYto8sUXfZYHUzXrip6rnpgN5fTLIE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pQ0NaTy2yO9ebTM4hk87tL0g6rdEpTm4qNhdBvxYoAjiVhkTw1vZAqxTDvr6MzJIaTEIOYKnAX/HPJN/fsRQCTZ26+T5xLDsB+15IY90sfDe+7eUfBh/Vs5ngaWC52Tgv1GJlAfh5x3q3Wssnwpkd1ygsvAD/vaOxzI05NgnxBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=msX9/Y9u; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="msX9/Y9u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784876126; x=1816412126;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=aFCQ0ndg3LEkjFYto8sUXfZYHUzXrip6rnpgN5fTLIE=;
  b=msX9/Y9u9OptIuICyv6chapCHArGm5RKXHomTvYD1V7fTf79QY7ERewN
   gkdQb0yAJ/eldJ/AI+s1MhcWQZWFQy9xq95/Mb1kkeOmT1qjAy61EXR8r
   67d3uAGOckj5xjD4VKu6f/TvXH79ivQMXCe2cLBX1b289JHOwjCju584k
   xxoiEI+IGjgntDTzhn9xjixLJVeuLJ9B04pYSRyMdYmrOM/JBGbx9imdx
   4ufyKhzZBcgLnPqOBAg7rVi2xdSxD7tUnuipSexY9cdwQdlZro7l4TcwX
   l7zv1i950WBHIc6oaGEVMUdJyts5n5d7sdJX/3MWQ2nM4xsQ7rfOcmzEL
   g==;
X-CSE-ConnectionGUID: X3JQ0yPPSN+opVPgIq1MNQ==
X-CSE-MsgGUID: +CA0wPXNQkOCW2LgKliAcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="89364021"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; 
   d="scan'208";a="89364021"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 23:55:23 -0700
X-CSE-ConnectionGUID: 5O33iyxjTv+mIrF2KeQCLw==
X-CSE-MsgGUID: X3/tOaR5QzueT/WH1Kdngw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; 
   d="scan'208";a="296848901"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 23 Jul 2026 23:55:22 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wn9oV-00000000aZi-3mbV;
	Fri, 24 Jul 2026 06:55:19 +0000
Date: Fri, 24 Jul 2026 14:55:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/stm/ltdc.c:1903 ltdc_resume() warn:
 'ldev->pixel_clk' from clk_prepare_enable() not released on lines: 1903.
Message-ID: <202607241438.j6QMExVU-lkp@intel.com>
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
TO: Yannick Fertre <yannick.fertre@foss.st.com>
CC: "Raphael Gallais-Pou" <raphael.gallais-pou@foss.st.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4539944e515183668109bdf4d0c3d7d228383d88
commit: d80667642b0f43580efd489d627dd24aa10ab98f drm/stm: ltdc: support new=
 hardware version for STM32MP25 SoC
date:   11 months ago
:::::: branch date: 2 days ago
:::::: commit date: 11 months ago
config: um-randconfig-r071-20260724 (https://download.01.org/0day-ci/archiv=
e/20260724/202607241438.j6QMExVU-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: d80667642b0f ("drm/stm: ltdc: support new hardware version for STM=
32MP25 SoC")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607241438.j6QMExVU-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/stm/ltdc.c:1903 ltdc_resume() warn: 'ldev->pixel_clk' from =
clk_prepare_enable() not released on lines: 1903.

Old smatch warnings:
drivers/gpu/drm/stm/ltdc.c:939 ltdc_crtc_mode_set_nofb() warn: pm_runtime_g=
et_sync() also returns 1 on success

vim +1903 drivers/gpu/drm/stm/ltdc.c

df61c776657fa5 Yannick Fertr=C3=A9      2019-03-21  1883 =20
df61c776657fa5 Yannick Fertr=C3=A9      2019-03-21  1884  int ltdc_resume(s=
truct drm_device *ddev)
df61c776657fa5 Yannick Fertr=C3=A9      2019-03-21  1885  {
df61c776657fa5 Yannick Fertr=C3=A9      2019-03-21  1886  	struct ltdc_devi=
ce *ldev =3D ddev->dev_private;
df61c776657fa5 Yannick Fertr=C3=A9      2019-03-21  1887  	int ret;
df61c776657fa5 Yannick Fertr=C3=A9      2019-03-21  1888 =20
1e00a12dbb09a7 Raphael Gallais-Pou 2025-08-25  1889  	drm_dbg_driver(ddev, =
"\n");
df61c776657fa5 Yannick Fertr=C3=A9      2019-03-21  1890 =20
df61c776657fa5 Yannick Fertr=C3=A9      2019-03-21  1891  	ret =3D clk_prep=
are_enable(ldev->pixel_clk);
df61c776657fa5 Yannick Fertr=C3=A9      2019-03-21  1892  	if (ret) {
1e00a12dbb09a7 Raphael Gallais-Pou 2025-08-25  1893  		drm_err(ddev, "faile=
d to enable pixel clock (%d)\n", ret);
df61c776657fa5 Yannick Fertr=C3=A9      2019-03-21  1894  		return ret;
df61c776657fa5 Yannick Fertr=C3=A9      2019-03-21  1895  	}
df61c776657fa5 Yannick Fertr=C3=A9      2019-03-21  1896 =20
d80667642b0f43 Yannick Fertre      2025-08-22  1897  	if (ldev->bus_clk) {
d80667642b0f43 Yannick Fertre      2025-08-22  1898  		ret =3D clk_prepare_=
enable(ldev->bus_clk);
d80667642b0f43 Yannick Fertre      2025-08-22  1899  		if (ret)
d80667642b0f43 Yannick Fertre      2025-08-22  1900  			drm_err(ddev, "fail=
ed to enable bus clock (%d)\n", ret);
d80667642b0f43 Yannick Fertre      2025-08-22  1901  	}
d80667642b0f43 Yannick Fertre      2025-08-22  1902 =20
d80667642b0f43 Yannick Fertre      2025-08-22 @1903  	return ret;
df61c776657fa5 Yannick Fertr=C3=A9      2019-03-21  1904  }
df61c776657fa5 Yannick Fertr=C3=A9      2019-03-21  1905 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
