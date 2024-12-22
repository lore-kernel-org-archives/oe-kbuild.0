Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2DE2F22
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Dec 2024 02:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734835579; cv=none; b=uiMsu+rTTCAkWojREBTC6+MAMK9YKKu+7HiNOeLGbPSAQV9hjY3O2kFXjuPRVDPfHaZj/wpt1ChUDWkiFAjjbPvLGBUezbs/YkKOq306wlkrQw3+5l+fef/daQMFg//O/cmVPnunq1ASiFrX5cBMfX19zYlUiaDj2yXVEnp4aw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734835579; c=relaxed/simple;
	bh=MgblUOYuI9hbKF1hFENfR0unOOX19tLlNOZaBFb0v4w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dV+8Vx0xhw1DnP9Eaura3f3LD5GPWIkoD6lE1NyNnkM7H/MGugyjW2EepxD6X0XphHst0XEs02NVgLTGAKYQJt02Fjzz1xkE8HSO+J74R5CJ+patx4JHdl0L34i7AC0YhvJ5ZoppHrCT0FRMLbIpSMCCCFYp1ZZbmVofiWZ+yxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MNioG7/V; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MNioG7/V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734835576; x=1766371576;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MgblUOYuI9hbKF1hFENfR0unOOX19tLlNOZaBFb0v4w=;
  b=MNioG7/VOKldlaa60Z5dJ7ft6J8XJCDA4psKzqMRAKV1Em3J8BZwX3b/
   kMg4WDVVIRlfI/IZMmAZ6iP5oR/1DHON2l4TNioYaUiS6F0KuAptSYdht
   1tKPblsACh6dH88zONp9lKBvOkp0/QWOwRzpL3jHT1oxFDRVm0y52n/Ag
   6PEy1MN9iPXHY5IbsA+TJ80rhjdfs4SGwCPfxnP3yGwNEfj6Li/+jYRP9
   SXLMpgPue3tnui24gP7dyz2WfGF28CgBlU2x2dRocQ5cYJh1xpVtKXoRx
   zhuji9aHHF8z143/J9Y+NaFJZiSxVT02/yeonwf/6XvYzhMmtiDsc4854
   Q==;
X-CSE-ConnectionGUID: A7YGHgQ+Sruv8IeeEcTbTA==
X-CSE-MsgGUID: Y5UphmQFTMKmaNeYmnz5Pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="34618263"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="34618263"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 18:46:15 -0800
X-CSE-ConnectionGUID: 3wZRU0FSTmSUWnTKjTZ6sw==
X-CSE-MsgGUID: 3l7sb4NdTGalsrjDF1ytKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="98759352"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 Dec 2024 18:46:14 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPByu-0002hF-0w;
	Sun, 22 Dec 2024 02:46:12 +0000
Date: Sun, 22 Dec 2024 10:45:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [soc:stm32/dt 22/23] arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb:
 /soc@0/bus@42080000/csi@48020000: failed to match any schema with
 compatible: ['st,stm32mp25-csi']
Message-ID: <202412221025.d70qOpTY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: arm@kernel.org
TO: Alain Volmat <alain.volmat@foss.st.com>
CC: Alexandre Torgue <alexandre.torgue@foss.st.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git stm32/dt
head:   8df9bff2788973e16263ca86df7574d527c84405
commit: d67635e62d8078eb5602246c81d991d3f6eb034d [22/23] arm64: dts: st: add csi & dcmipp node in stm32mp25
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20241221 (https://download.01.org/0day-ci/archive/20241222/202412221025.d70qOpTY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412221025.d70qOpTY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412221025.d70qOpTY-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: /soc@0/bus@42080000/csi@48020000: failed to match any schema with compatible: ['st,stm32mp25-csi']
   arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: /soc@0/bus@42080000/dcmipp@48030000: failed to match any schema with compatible: ['st,stm32mp25-dcmipp']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
