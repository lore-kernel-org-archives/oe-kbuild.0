Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0276B39A7F6
	for <oe-kbuild@lists.linux.dev>; Tue, 15 Sep 2026 05:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789449760; cv=none; b=NZPsjuNRt06D1tBxyFhjRM+BoyAoQmLSvqZjAOnWCjxlfGbJjDZv/AUpBZQk23Bn7ZZXdFSKWupMu2zmB2XlPRB+QIulCzfiTeaWYavkuUxXMV4JQ+e09V7h59Tr1X/rcz4F4I4NxfR6OOdxZHkBItsgsGgUdToH7USrZXgC2aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789449760; c=relaxed/simple;
	bh=IWKFsjfytWmGrl9KuI6kWsP6sqCfDyp0ajEjO7V3bpo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SqGcWV1DpeihExiWN/kVUgL6FfyBxDd39OQwslEWXy3gtNAbfqx3Aybf2fLu0YTWV+Om9g2k+F228daE9c2Hv6ExF1MyUMKKycDaG3i74g1Rs+lJHWiphzKk9iEC+bFI+i9ci0amxWwiF8+TksfOC72j2yXahnwbAZKUBxqLIo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WWaF7Lc7; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WWaF7Lc7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789449758; x=1820985758;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=IWKFsjfytWmGrl9KuI6kWsP6sqCfDyp0ajEjO7V3bpo=;
  b=WWaF7Lc7rQBP2Qt2QTkGdu//yN1KouHU9Yax5IqeF66lEXkpvB2OdRfH
   VYEVjk7WfqWj5/zyBh9ZaMUitp1iMyMYjVnt7eHXBp410VvmEXORdNzQl
   l2Z7Gdd0AcQVG2IOALbgMEE2Iy1eW8v+nukHPQnDcJQn9G1R16fkprzaT
   /pS+WaCBjwW41LpqJpbAK15ii8kdHQJevBRw6QbuaeVzrqZKiOEYTSmau
   2o4exm2zpagQT99A0GekeGjzwYsY8qBLwTNmZEf1WherglYLGcooeF6Mb
   XLMGox9Ts5s7k5aEy/wnIf+0WQGIxgq+jeBdsVyR9/gHB5Vc36s9vfiHf
   w==;
X-CSE-ConnectionGUID: nSftXYoUSsGB+COt8MLNsw==
X-CSE-MsgGUID: qvbUc5H3TqCsuDpP+9iB7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="88941450"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="88941450"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 22:22:36 -0700
X-CSE-ConnectionGUID: vlCFlUITRbq3J0XNzGLMsQ==
X-CSE-MsgGUID: r1gRZjSWT4+SdKrCkC+6lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="296340398"
Received: from igk-lkp-server01.igk.intel.com (HELO 71151d66d536) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 14 Sep 2026 22:22:35 -0700
Received: from kbuild by 71151d66d536 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6Lcn-000000000Vv-0zNn;
	Tue, 15 Sep 2026 05:22:33 +0000
Date: Tue, 15 Sep 2026 07:22:19 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [stefandoesinger-zx297520:dlink 26/132]
 arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dtb:
 /soc/aon-pin-controller@13c000: failed to match any schema with compatible:
 ['zte,aux-aon']
Message-ID: <202609150753.DBw7d3Ei-lkp@intel.com>
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
TO: "Stefan D=C3=B6singer" <stefandoesinger@gmail.com>

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel dlink
head:   ac919b52585145716ddb9d8154ca104ff2ea271b
commit: c930f9a4ac6e1d5f6f340dd72186627ec179ee7e [26/132] ARM: zte: Add a z=
x29 pin controller driver.
:::::: branch date: 11 days ago
:::::: commit date: 3 weeks ago
config: arm-randconfig-2054-20260909 (https://download.01.org/0day-ci/archi=
ve/20260915/202609150753.DBw7d3Ei-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260915/202609150753.DBw7d3Ei-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609150753.DBw7d3Ei-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/zte/zx297520v3.dtsi:379.34-382.5: Warning (unique_unit=
_address_if_enabled): /soc/aon-pin-controller@13c000: duplicate unit-addres=
s (also used in node /soc/pin-controller@13c000)
   arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dtb: /soc/spi@140a000: fa=
iled to match any schema with compatible: ['zte,zx29-spi']
>> arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dtb: /soc/aon-pin-control=
ler@13c000: failed to match any schema with compatible: ['zte,aux-aon']
>> arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dtb: /soc/iocfg-pin-contr=
oller@13c800: failed to match any schema with compatible: ['zte,aux-iocfg']
>> arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dtb: /soc/pdcfg-pin-contr=
oller@1303000: failed to match any schema with compatible: ['zte,aux-pdcfg']
>> arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dtb: /soc/pin-controller@=
13c000: failed to match any schema with compatible: ['zte,zx297520-pmm']
   arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dtb: pin-controller@13c00=
0 (zte,zx297520-pmm): zte,aux-aon: b'\x00\x00\x00\t' is not of type 'object=
', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dtb: pin-controller@13c00=
0 (zte,zx297520-pmm): zte,aux-iocfg: b'\x00\x00\x00\n' is not of type 'obje=
ct', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dtb: pin-controller@13c00=
0 (zte,zx297520-pmm): zte,aux-pdcfg: b'\x00\x00\x00\x0b' is not of type 'ob=
ject', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
