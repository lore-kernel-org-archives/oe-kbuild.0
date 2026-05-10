Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC2B364055
	for <oe-kbuild@lists.linux.dev>; Sun, 10 May 2026 17:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778434012; cv=none; b=V2WkmXhB6vRI9zUZI0BTbMZ4wgehL0i3NJD92FvnpnvvuNfy6aZai3qW+RtVwaJLuUiDoBgNo5OdeVmYI/MpyUh4LSTkonJzgdtXFC/R/WJWUHzmPU9gEhCAo9nzy6F7fXOVLF/Xkti8PtMKZqE9/nYCIyni61RDiZWBlhks90Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778434012; c=relaxed/simple;
	bh=lojUDZrbacsvxyIdSFDhiolqp6RxbtMhQQBa+ieV/pM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=bbpCAz9jptIVnyr1sTLsPpsmxfu6uj5hxPE+1gEI2lBVQYa35LpCydRmG4AESWXVD3M5XZITmHd1i3MkYKjrXepRDgbgXT6Zmq685XaAtmtahZ3EMuONndy3B37pTheYSPagIXgWwipTgBOT1qcHJe3Zq2rFyUsHn8dJZTdsg10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QOP2f21z; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QOP2f21z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778434008; x=1809970008;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=lojUDZrbacsvxyIdSFDhiolqp6RxbtMhQQBa+ieV/pM=;
  b=QOP2f21zh/xNoD74p+DbjaX6x7QTInPkY01e14QCcyCNhJf5yjgbVcBE
   PNvdXP65empN3X8Iet8S1Mya+6o8Ob6t0Lh9zLgjWW0Doj0qllWcOTtr0
   or/HFcfiTw/KdVC5ScCnNVZwA8ev+jUH2eDy4f6zY8a51mTD5gIafX/m1
   r9hIszeGWJ2DLFp6uf2cX3anLS3/BzICsiPaWoueH5UzaIymiUR7OBdAH
   nn0yFznxaOD+bFVOt+xvjRCSsCeilPOfWvwNlGWAW6K0x8V3LVmQvZh+K
   k7sIJ1peLiBKyOo//efMZqZPLYjE+yW3Fr5iYUf0jDfGQIyltsltl74Ee
   Q==;
X-CSE-ConnectionGUID: ABUqo5ntT7OJvP3kTDglJw==
X-CSE-MsgGUID: niktfsdXQGaQbd+wndHvTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="79058794"
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="79058794"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2026 10:26:48 -0700
X-CSE-ConnectionGUID: FqNioElZTKitw3pcCYJldQ==
X-CSE-MsgGUID: GQUI5GWFRnaadu/0WBaQGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="275383303"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 10 May 2026 10:26:47 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wM7vQ-000000007kf-19lr;
	Sun, 10 May 2026 17:26:44 +0000
Date: Sun, 10 May 2026 19:26:18 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.17 60/89]
 arch/arm64/boot/dts/qcom/msm8976-longcheer-l9360.dtb: gpu@1c00000
 (qcom,adreno-510.0): clock-names:5: 'alwayson' is not one of ['core',
 'iface', 'mem', 'mem_iface', 'alt_mem_iface', 'gfx3d', 'rbbmtimer', 'rbcpr']
Message-ID: <202605101915.d2jBZ7xV-lkp@intel.com>
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
TO: "Andr=C3=A9 Apitzsch" <git@apitzsch.eu>
CC: Bjorn Andersson <andersson@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-fo=
r-6.17
head:   dc7e5b210a6b29287c1dae7197863d54e13615bd
commit: 79b896e7da7e2743fc930d260bcecd1e84a003c4 [60/89] arm64: dts: qcom: =
msm8976-longcheer-l9360: Add initial device tree
:::::: branch date: 10 months ago
:::::: commit date: 11 months ago
config: arm64-randconfig-2052-20260428 (https://download.01.org/0day-ci/arc=
hive/20260510/202605101915.d2jBZ7xV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260510/202605101915.d2jBZ7xV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605101915.d2jBZ7xV-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/msm8976.dtsi:575.27-578.6: Warning (unique_unit=
_address_if_enabled): /soc@0/qfprom@a4000/s6-p1@224: duplicate unit-address=
 (also used in node /soc@0/qfprom@a4000/s6-p2@224)
   arch/arm64/boot/dts/qcom/msm8976.dtsi:595.25-598.6: Warning (unique_unit=
_address_if_enabled): /soc@0/qfprom@a4000/mode@228: duplicate unit-address =
(also used in node /soc@0/qfprom@a4000/s8-p1@228)
   arch/arm64/boot/dts/qcom/msm8976.dtsi:605.27-608.6: Warning (unique_unit=
_address_if_enabled): /soc@0/qfprom@a4000/s8-p2@229: duplicate unit-address=
 (also used in node /soc@0/qfprom@a4000/s9-p1@229)
   arch/arm64/boot/dts/qcom/msm8976-longcheer-l9360.dtb: display-controller=
@1a01000 (qcom,msm8976-mdp5): clock-names: 'oneOf' conditional failed, one =
must be fixed:
   	['iface', 'bus', 'core', 'vsync', 'tbu', 'tbu_rt'] is too long
   	'iommu' was expected
   	'lut' was expected
   	'vsync' was expected
   	'tbu' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,mdp5.ya=
ml
>> arch/arm64/boot/dts/qcom/msm8976-longcheer-l9360.dtb: gpu@1c00000 (qcom,=
adreno-510.0): clock-names:5: 'alwayson' is not one of ['core', 'iface', 'm=
em', 'mem_iface', 'alt_mem_iface', 'gfx3d', 'rbbmtimer', 'rbcpr']
   	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
