Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74B0386C1B
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Mar 2026 11:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772970202; cv=none; b=qjO0mdQxwK7tiV25OIKuqsbGueVs7hL5RlRe7LnKF1rfWYGltoVb83R02qpSmMfLOd2oyKfav0fqlEviy8Psv3dcHuauB2M/9aoMu2qCnNqykzGsYklZTnoYo9qz7jX/kDoDK/b5R6Whz4/YACdL6IWNQp5qHHix0w2AKl5Tytg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772970202; c=relaxed/simple;
	bh=NpAomfQpxLhGzCi1RYtwmN8TT99Lgs5zUh9+e0euYRE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=PKIEdWm6WDoh98HnK0TMQcKs1+pF1kbgsUYTJlAC4RaRseq7DVfHnPIbtNpvk/iKphFP7Tf9RmXCYqo+eXTxy5ZYsCp1N54TkQPvFay8OrBz72R1ujTxBXpKp+ntMxQ2+qgPisZPgqfGwEbVvf9TN1ti3UD4OeApywls41+s7I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JXdWnwaP; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JXdWnwaP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772970200; x=1804506200;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=NpAomfQpxLhGzCi1RYtwmN8TT99Lgs5zUh9+e0euYRE=;
  b=JXdWnwaPkwBb/f9E7habdoVnN5w8gxvovL1wP1Bfl5I5oq5UXeaA+KW/
   M2R2+0XoOiuw2WwcsXrBeWzVMaQuFEtB7j6t68qMH3D1tvvlYV1Sqx0Ib
   2zBnMMcMJjUQwhyTXmyaYAfLywlT8BFhDugXa+DCYjahrCiTjJJyKb96o
   8uyJuJmSnxZpn0YgwCzVfqNMndMjOcdT1FIRAByrRgAtXNEdxmCgE7wdY
   FSB+8i9K/l3yMG4MxVSk+vT0lE5S9eL7a4QHF8Rha6LZr+c5FP0QtRvgq
   DEF8fC/H7jAUEU3gIoCrON4OO6WWXbhwSDixeeX06Am8Fd78WqMNrWU7j
   Q==;
X-CSE-ConnectionGUID: xFILmu59RCK0hCz+Oadu4A==
X-CSE-MsgGUID: sFPUsZm8Q1eSQAx0IHA56A==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="73930962"
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="73930962"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 04:43:19 -0700
X-CSE-ConnectionGUID: aHmCOUh0TG2Wi51Zl3pD7w==
X-CSE-MsgGUID: wZYAV+WeQGW8sf0xqd6rdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="217585196"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 08 Mar 2026 04:43:18 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzCXU-000000002fB-2HN9;
	Sun, 08 Mar 2026 11:43:16 +0000
Date: Sun, 08 Mar 2026 12:42:23 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk:next/dt64 12/12]
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb:
 /soc@0/usi@10d500c0/i2c@10d50000/fuel-gauge@36: failed to match any schema
 with compatible: ['maxim,max77759-fg']
Message-ID: <202603081232.k4jgmJMK-lkp@intel.com>
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
:::::: Manual check reason: "dtcheck: binding changes may go via different =
trees"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Andr=C3=A9 Draszik" <andre.draszik@linaro.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Peter Griffin <peter.griffin@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git next=
/dt64
head:   3d7bd20e026687db513887e4d066121cb0a49852
commit: 3d7bd20e026687db513887e4d066121cb0a49852 [12/12] arm64: dts: exynos=
: gs101-pixel-common: add Maxim MAX77759 fuel gauge
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: arm64-randconfig-2054-20260307 (https://download.01.org/0day-ci/arc=
hive/20260308/202603081232.k4jgmJMK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260308/202603081232.k4jgmJMK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603081232.k4jgmJMK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb: power-management (go=
ogle,gs101-acpm-ipc): 'pmic-1', 'pmic-2' do not match any of the regexes: '=
^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/google,gs101-ac=
pm-ipc.yaml
>> arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb: /soc@0/usi@10d500c0/=
i2c@10d50000/fuel-gauge@36: failed to match any schema with compatible: ['m=
axim,max77759-fg']
--
   arch/arm64/boot/dts/exynos/google/gs101-raven.dtb: power-management (goo=
gle,gs101-acpm-ipc): 'pmic-1', 'pmic-2' do not match any of the regexes: '^=
pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/google,gs101-ac=
pm-ipc.yaml
>> arch/arm64/boot/dts/exynos/google/gs101-raven.dtb: /soc@0/usi@10d500c0/i=
2c@10d50000/fuel-gauge@36: failed to match any schema with compatible: ['ma=
xim,max77759-fg']

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
