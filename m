Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A076282F13
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Aug 2026 01:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786583998; cv=none; b=AuAj1InxLUReCxYPhonEdDEnX11e+y5tAJEmm4kFJHqrSHAaAo82dUhky93VxEY17DNg/qhbDmXCecWfmB7sdpIELU0D3MgLqJnqCkCDb7x+vTFX0NtYxa4zHN3ChI/7KENy5Umv+TguouK1a9J1rXw1pujX0M4MitSiY7YQxDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786583998; c=relaxed/simple;
	bh=akAjojjIjmi/wrfuMDSJSICMjnswppbdXflTQ48feGI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rL/MJhOilNtAcnu+F7tendewTuiNYLVaVLeDWanN8YnyhY8i/3ThIaceMhj3YPr5UJP0hlZ8tOxI+QzEmldJWN3Cmupn0cfGyXjVJ7oWjmVg9zgvyXmz7I8F5J/fWZcDZ4ZiNFx+CNgJfdP/3gu+YGryFXaMGdj12SGeynwsFw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V3oFV8jQ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V3oFV8jQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786583996; x=1818119996;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=akAjojjIjmi/wrfuMDSJSICMjnswppbdXflTQ48feGI=;
  b=V3oFV8jQTaydKvALQGMTone8fB3rzuX09sn8an3OHaWuFPEhPgtq9gJM
   ucEsaMIw/y21VuIeAEps5Py3PHYobvxan0Yr34up53zFKyNV+j03HhbXH
   6RVfliapAcwVWBKflFS4g7sQar+dRwWSKKa1znjvrkNrosB4qHLG5YW8l
   Bzb+oyLYw92sFoZDQEz/zoZ2VHQVsXeBtCiK7AT6xuL+TDfkTRYvUKFnD
   85hCINfGRnxrkVZDq0SHGg8TDqGSxm0pGlVedVqzarlWttw9X50XrA7Ob
   7xuZ4uZ2NP3jPjNmgeWProoHP8JF8og3h90hDrt8AmTU15z6ogleaDMiV
   g==;
X-CSE-ConnectionGUID: nv3PkfuESvqtmDSyt/mxag==
X-CSE-MsgGUID: wQblbn9FTba++557jQo1eQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="91029319"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="91029319"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 18:19:55 -0700
X-CSE-ConnectionGUID: v9H5rCd4Q6+hl0MkSW2JiQ==
X-CSE-MsgGUID: dAeTWKQ9QVigbyN/2fc15g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="261177179"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Aug 2026 18:19:54 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuK6p-00000000SMP-3Awr;
	Thu, 13 Aug 2026 01:19:51 +0000
Date: Thu, 13 Aug 2026 09:19:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 3548/14447]
 drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:72:59: sparse:
 sparse: not a function init
Message-ID: <202608130956.e5v1H44o-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check warning: drivers/g=
pu/drm/i915/display/tests/intel_dp_link_test.c:72:59: sparse: sparse: not a=
 function init"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Imre Deak <imre.deak@intel.com>
CC: "Micha=C5=82 Grzelak" <michal.grzelak@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   5e6de6a2b522f659defacb1551d0465ba6ce13cf
commit: 2eb9982ff179e648675b6c5b345b9ed509fc3361 [3548/14447] drm/i915/kuni=
t: Export link training and caps funcs for testing
:::::: branch date: 33 hours ago
:::::: commit date: 5 weeks ago
config: i386-randconfig-063-20260812 (https://download.01.org/0day-ci/archi=
ve/20260813/202608130956.e5v1H44o-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e98466=
48fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260813/202608130956.e5v1H44o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608130956.e5v1H44o-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:72:59: sparse: s=
parse: not a function init
>> drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:83:36: sparse: s=
parse: not a function cleanup

vim +72 drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c

d3340e92be326c Imre Deak 2026-07-01  46 =20
d3340e92be326c Imre Deak 2026-07-01  47  static int intel_dp_link_test_init=
(struct kunit *test)
d3340e92be326c Imre Deak 2026-07-01  48  {
df152476d00a46 Imre Deak 2026-07-01  49  	struct intel_digital_port *dig_po=
rt;
df152476d00a46 Imre Deak 2026-07-01  50  	struct intel_encoder *encoder;
df152476d00a46 Imre Deak 2026-07-01  51  	struct intel_dp *intel_dp;
df152476d00a46 Imre Deak 2026-07-01  52 =20
df152476d00a46 Imre Deak 2026-07-01  53  	/* Reset the dev state for each t=
est. */
df152476d00a46 Imre Deak 2026-07-01  54  	memset(&test_ctx.dev, 0, sizeof(t=
est_ctx.dev));
df152476d00a46 Imre Deak 2026-07-01  55 =20
df152476d00a46 Imre Deak 2026-07-01  56  	test_ctx.dev.generic_device.drm.d=
ev =3D &test_ctx.dev.device;
df152476d00a46 Imre Deak 2026-07-01  57 =20
df152476d00a46 Imre Deak 2026-07-01  58  	test_ctx.dev.display.drm =3D &tes=
t_ctx.dev.generic_device.drm;
df152476d00a46 Imre Deak 2026-07-01  59  	test_ctx.dev.generic_device.displ=
ay =3D &test_ctx.dev.display;
df152476d00a46 Imre Deak 2026-07-01  60 =20
df152476d00a46 Imre Deak 2026-07-01  61  	encoder =3D &test_ctx.dev.dig_por=
t.base;
df152476d00a46 Imre Deak 2026-07-01  62  	encoder->base.dev =3D &test_ctx.d=
ev.generic_device.drm;
df152476d00a46 Imre Deak 2026-07-01  63 =20
df152476d00a46 Imre Deak 2026-07-01  64  	dig_port =3D &test_ctx.dev.dig_po=
rt;
df152476d00a46 Imre Deak 2026-07-01  65  	dig_port->base.type =3D INTEL_OUT=
PUT_DP;
df152476d00a46 Imre Deak 2026-07-01  66 =20
df152476d00a46 Imre Deak 2026-07-01  67  	test_ctx.dev.connector.encoder =
=3D encoder;
df152476d00a46 Imre Deak 2026-07-01  68 =20
df152476d00a46 Imre Deak 2026-07-01  69  	intel_dp =3D &dig_port->dp;
df152476d00a46 Imre Deak 2026-07-01  70  	intel_dp->attached_connector =3D =
&test_ctx.dev.connector;
df152476d00a46 Imre Deak 2026-07-01  71 =20
2eb9982ff179e6 Imre Deak 2026-07-01 @72  	intel_dp->link.caps =3D test_ctx.=
link_caps_ops->init(intel_dp);
2eb9982ff179e6 Imre Deak 2026-07-01  73 =20
d3340e92be326c Imre Deak 2026-07-01  74  	test->priv =3D &test_ctx;
d3340e92be326c Imre Deak 2026-07-01  75 =20
d3340e92be326c Imre Deak 2026-07-01  76  	return 0;
d3340e92be326c Imre Deak 2026-07-01  77  }
d3340e92be326c Imre Deak 2026-07-01  78 =20
d3340e92be326c Imre Deak 2026-07-01  79  static void intel_dp_link_test_exi=
t(struct kunit *test)
d3340e92be326c Imre Deak 2026-07-01  80  {
2eb9982ff179e6 Imre Deak 2026-07-01  81  	struct test_ctx *ctx =3D test->pr=
iv;
2eb9982ff179e6 Imre Deak 2026-07-01  82 =20
2eb9982ff179e6 Imre Deak 2026-07-01 @83  	ctx->link_caps_ops->cleanup(ctx->=
dev.dig_port.dp.link.caps);
d3340e92be326c Imre Deak 2026-07-01  84  }
d3340e92be326c Imre Deak 2026-07-01  85 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
