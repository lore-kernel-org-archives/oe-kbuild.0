Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A271D45E8
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Jul 2026 02:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783738192; cv=none; b=iVw2VshNUNjxKJqvsz5aw6EvReosKpC6kHCbJ7at8kGsWFCuqtQSm/1YkedNUpPF/NBCpCyXKAQ2z5aibRlpQqQ1D9e5aU+OFNZBwwJOio3IIipS+83PrxP5G8OjxTPkm3MMJPBDS/R9+IymBrlhx4qkL4/KStee4CM+/GxO+0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783738192; c=relaxed/simple;
	bh=G0uZ+h8wJjX6rtLO89azH4QUonmwn8+SKO4m7IoHNlE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Rp/ic3keEmPynQwAS2wU2H1cJpo+lAXWlxviAKII7yf5LxgmyD/jPkocHvOa1/QlcArtusjPtyB0cRzI7HeYYENEkEQnJVSr4zd77c5GY0tsXh+RuBJZylWhHE3Ehv7EJ562a6+JwJaYyoBXkES/T9P8Hluyz2BRaPifJpSxWZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V5f5xC0U; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V5f5xC0U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783738190; x=1815274190;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=G0uZ+h8wJjX6rtLO89azH4QUonmwn8+SKO4m7IoHNlE=;
  b=V5f5xC0UVoxHsfxKIHzDImQ4QQAux8PLARLoBapB18VYX40WHiK0dgu3
   N4EjA9heNMLLPqH7fTKif8u+FibWB2pXJ27QAVWlZgL2p/6VgIgvg/dll
   HGDGgP/bh+WmFdOPcpANzaO9Y2FIDlEjw3TazaaUic50Sy+xIR2/PFS2Q
   5HclR7iy90fYN3zJU1ggzSheXSOO14wTpkTvaCkWkrAlO9it+fKek0N+f
   q8uQdua36L9PncNFUH9utJmSL2GhA87fJ+oCcV4/QmvVHphGlXWOM0rj8
   Q0L10MRxYyzjEzBdrDdQfviIfUQpLtU1o9/ZBV/Glp4ywZUDqhtG2rggg
   Q==;
X-CSE-ConnectionGUID: QmPv9hkyRyixDC+uRFIUzA==
X-CSE-MsgGUID: k+Q+L2DpS/qBWYERcwAcrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="101861118"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="101861118"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 19:49:49 -0700
X-CSE-ConnectionGUID: 3Jik72WrRyyyMsDdVih8dQ==
X-CSE-MsgGUID: B/Hpm3B1QTiTdXE4evKBVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="250623558"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 10 Jul 2026 19:49:48 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiNmj-00000000Jfo-2H8Y;
	Sat, 11 Jul 2026 02:49:45 +0000
Date: Sat, 11 Jul 2026 10:49:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 4669/5655]
 drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:72:59: sparse:
 sparse: not a function init
Message-ID: <202607111003.MvjSYuhg-lkp@intel.com>
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
head:   bee763d5f341b99cf472afeb508d4988f62a6ca1
commit: 2eb9982ff179e648675b6c5b345b9ed509fc3361 [4669/5655] drm/i915/kunit=
: Export link training and caps funcs for testing
:::::: branch date: 13 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-121-20260711 (https://download.01.org/0day-ci/arc=
hive/20260711/202607111003.MvjSYuhg-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e98466=
48fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260711/202607111003.MvjSYuhg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607111003.MvjSYuhg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:72:59: sparse: s=
parse: not a function init
>> drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:83:36: sparse: s=
parse: not a function cleanup

vim +72 drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c

d3340e92be326c1 Imre Deak 2026-07-01  46 =20
d3340e92be326c1 Imre Deak 2026-07-01  47  static int intel_dp_link_test_ini=
t(struct kunit *test)
d3340e92be326c1 Imre Deak 2026-07-01  48  {
df152476d00a46b Imre Deak 2026-07-01  49  	struct intel_digital_port *dig_p=
ort;
df152476d00a46b Imre Deak 2026-07-01  50  	struct intel_encoder *encoder;
df152476d00a46b Imre Deak 2026-07-01  51  	struct intel_dp *intel_dp;
df152476d00a46b Imre Deak 2026-07-01  52 =20
df152476d00a46b Imre Deak 2026-07-01  53  	/* Reset the dev state for each =
test. */
df152476d00a46b Imre Deak 2026-07-01  54  	memset(&test_ctx.dev, 0, sizeof(=
test_ctx.dev));
df152476d00a46b Imre Deak 2026-07-01  55 =20
df152476d00a46b Imre Deak 2026-07-01  56  	test_ctx.dev.generic_device.drm.=
dev =3D &test_ctx.dev.device;
df152476d00a46b Imre Deak 2026-07-01  57 =20
df152476d00a46b Imre Deak 2026-07-01  58  	test_ctx.dev.display.drm =3D &te=
st_ctx.dev.generic_device.drm;
df152476d00a46b Imre Deak 2026-07-01  59  	test_ctx.dev.generic_device.disp=
lay =3D &test_ctx.dev.display;
df152476d00a46b Imre Deak 2026-07-01  60 =20
df152476d00a46b Imre Deak 2026-07-01  61  	encoder =3D &test_ctx.dev.dig_po=
rt.base;
df152476d00a46b Imre Deak 2026-07-01  62  	encoder->base.dev =3D &test_ctx.=
dev.generic_device.drm;
df152476d00a46b Imre Deak 2026-07-01  63 =20
df152476d00a46b Imre Deak 2026-07-01  64  	dig_port =3D &test_ctx.dev.dig_p=
ort;
df152476d00a46b Imre Deak 2026-07-01  65  	dig_port->base.type =3D INTEL_OU=
TPUT_DP;
df152476d00a46b Imre Deak 2026-07-01  66 =20
df152476d00a46b Imre Deak 2026-07-01  67  	test_ctx.dev.connector.encoder =
=3D encoder;
df152476d00a46b Imre Deak 2026-07-01  68 =20
df152476d00a46b Imre Deak 2026-07-01  69  	intel_dp =3D &dig_port->dp;
df152476d00a46b Imre Deak 2026-07-01  70  	intel_dp->attached_connector =3D =
&test_ctx.dev.connector;
df152476d00a46b Imre Deak 2026-07-01  71 =20
2eb9982ff179e64 Imre Deak 2026-07-01 @72  	intel_dp->link.caps =3D test_ctx=
.link_caps_ops->init(intel_dp);
2eb9982ff179e64 Imre Deak 2026-07-01  73 =20
d3340e92be326c1 Imre Deak 2026-07-01  74  	test->priv =3D &test_ctx;
d3340e92be326c1 Imre Deak 2026-07-01  75 =20
d3340e92be326c1 Imre Deak 2026-07-01  76  	return 0;
d3340e92be326c1 Imre Deak 2026-07-01  77  }
d3340e92be326c1 Imre Deak 2026-07-01  78 =20
d3340e92be326c1 Imre Deak 2026-07-01  79  static void intel_dp_link_test_ex=
it(struct kunit *test)
d3340e92be326c1 Imre Deak 2026-07-01  80  {
2eb9982ff179e64 Imre Deak 2026-07-01  81  	struct test_ctx *ctx =3D test->p=
riv;
2eb9982ff179e64 Imre Deak 2026-07-01  82 =20
2eb9982ff179e64 Imre Deak 2026-07-01 @83  	ctx->link_caps_ops->cleanup(ctx-=
>dev.dig_port.dp.link.caps);
d3340e92be326c1 Imre Deak 2026-07-01  84  }
d3340e92be326c1 Imre Deak 2026-07-01  85 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
