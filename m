Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F140212564
	for <oe-kbuild@lists.linux.dev>; Fri, 18 Sep 2026 17:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789752871; cv=none; b=VMIIqtY7tMX638bmql8eyibthnJfvegVrkeow4k/6v65AjdClMpEkDRqXsBngFrtRn0e+d+u0NckdNEDhSKmAD6VHohUD9mxoXkdCLTTY9xrrW32nP9Iuv+18Y7zoTGGFc4dEJm36MMxmXPibIbzH/X7OPqpyXJynirKHHK2cYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789752871; c=relaxed/simple;
	bh=uvEoJKL/I2ABd2wvaYIqZbbgd70X4ki7U9F/nAKS+Ak=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=bvmnSsBQg24Azpv80zaD25m3MGrDoeXQ/DvhO1xWxsWIkNnO5XBEv1aR617FJ9KKbse3/KUjOMvPxvv0THX+8fzG1MT+sP8eeNj0VjbTVMd35PxNXRmNyTk/lqBP04QREe7SvllR2zR2m3aa0YWGjPe9DeGl2ZlEyAijYL2lwSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YM2gpaMg; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YM2gpaMg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789752863; x=1821288863;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=uvEoJKL/I2ABd2wvaYIqZbbgd70X4ki7U9F/nAKS+Ak=;
  b=YM2gpaMgahweDh1YFHoCU6MV+TPm05wSJIAvVOe07P/lksZ2xiz6VSjl
   Sdl8LsulGskvr34qGP+h0JUs3Fa7H9wTQhi6ZKq88WKuKIE+pNu4fHBY6
   L3qGRn07j7bcuTK/1nGAvMOnsrPGMReTdubb/Q0NIStME3vb4DXiDhrEa
   SY6w3q9rz1RVkhfGB8/rT1IDvfgeCtr7v7T32s1uyv5PTzj2ufqHs/bQA
   a4+NZDJNMaF7TcY5JgOQLhzk/EBSgqxbh8MS440eERl33s0gKGobRmeYG
   UkKkze7QQ+/EOSEcyc2pUSMgKlMFAsM+tdgfyg1t/poogO+WT7Aev7gLy
   Q==;
X-CSE-ConnectionGUID: /HCmLK4AR66IJFzgY3ApgQ==
X-CSE-MsgGUID: b7KaTspUQT22cVEpAlZOaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="90142972"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="90142972"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 10:34:19 -0700
X-CSE-ConnectionGUID: UNG8WhMDSRqRX9UtaINmWw==
X-CSE-MsgGUID: lCjWPiWNREmhk5rjASOEMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="2736315"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 18 Sep 2026 10:34:18 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7cTX-00000000A9t-2cdp;
	Fri, 18 Sep 2026 17:34:15 +0000
Date: Sat, 19 Sep 2026 01:33:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:72:59: sparse:
 sparse: not a function init
Message-ID: <202609190138.tgpK7aeQ-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Imre Deak <imre.deak@intel.com>
CC: "Micha=C5=82 Grzelak" <michal.grzelak@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9b87fdc9af2fbfcdb5c24a64139685ef80f6573f
commit: 2eb9982ff179e648675b6c5b345b9ed509fc3361 drm/i915/kunit: Export lin=
k training and caps funcs for testing
date:   2 months ago
:::::: branch date: 3 days ago
:::::: commit date: 2 months ago
config: i386-randconfig-1300-20260918 (https://download.01.org/0day-ci/arch=
ive/20260919/202609190138.tgpK7aeQ-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e98466=
48fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260919/202609190138.tgpK7aeQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 2eb9982ff179 ("drm/i915/kunit: Export link training and caps funcs=
 for testing")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609190138.tgpK7aeQ-lkp@intel.com/

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
