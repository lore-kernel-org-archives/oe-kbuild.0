Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C5437C106
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Aug 2026 07:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786607219; cv=none; b=GaPcZySbZkpXmi7l4T3txuhn9fgpt9ayWB+kJBmOo7Zy79TKstT2R7muci28sF5F/5LswiCGtd00LE4QsrsaO6KaPTJmxtsMdankkiqe4BnnDQ/yJz0SeLnLBXGn608nt6MSTM9e1RHOmAXprviz6XYTpUMWleYMUeMynZ1vJX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786607219; c=relaxed/simple;
	bh=mizqrYIgszYxdVesXXlpPwNbCao3MooiM0imRUuVojU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Gwm+E+ptnqRjRJaPBBNifRG0oGL+GYpJlGFwgHZe8GFGDlV9NGm8ZMp9D9jkEH+N5dL3RfUU2npUuMuS4O9gWtbBwjskgsmNIz5+6d1AoaXHgUB8nT3/MRIizRS4dMV+dcZKOgk5TsGOV2dcTnPEJm0DemnWY+tKyTHn8fScr2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GIdUL7gf; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GIdUL7gf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786607217; x=1818143217;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=mizqrYIgszYxdVesXXlpPwNbCao3MooiM0imRUuVojU=;
  b=GIdUL7gfwqkpkidk6N3R/pMmKO0qG1LD3wUUxlH199CGrI3wcsJW0Yz6
   RQWDJaq6iveBSM4Y0ObSrqC+O5NzILVITSEtcEDdG6Req9dFG6KAf6OPk
   Qo+fszWNE2jAsMUpmlICh4geu+pxEyeJV6cPaN7Jjy093XVvebwdCm3fY
   k7EeNWhoD3oqZUkR3gP0ycg6YTWjhwE5xRq0PX+0d3nlsJUA5tubKOrUU
   Fxa6CTIyegGXRVmrFDs3CZkQgv8MA8q6eotnLzKUTNd9nvXLshWhiRaG0
   4bztZn5Tphv1vKlbZ9LVRMBvGKTFei6Jv12jc9qItIC/HOtvl1av5Aij1
   w==;
X-CSE-ConnectionGUID: IQWzymw6RgCUXqzK072GGg==
X-CSE-MsgGUID: fr/LXkxpS4+u86ONyl2T2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="87250565"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="87250565"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 00:46:56 -0700
X-CSE-ConnectionGUID: GA7cX2WlQKCO/jD8maIDlg==
X-CSE-MsgGUID: +wGzqYsWRfuwdar6CP89eg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Aug 2026 00:46:55 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuQ9M-00000000TGx-3DPw;
	Thu, 13 Aug 2026 07:46:52 +0000
Date: Thu, 13 Aug 2026 15:46:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 3549/14737]
 drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:463:28: sparse:
 sparse: not a function get_max_limits
Message-ID: <202608131516.HWw20vIE-lkp@intel.com>
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
pu/drm/i915/display/tests/intel_dp_link_test.c:463:28: sparse: sparse: not =
a function get_max_limits"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Imre Deak <imre.deak@intel.com>
CC: "Micha=C5=82 Grzelak" <michal.grzelak@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   28d012efb4327f9c75d5e042a7c91e9a542efa98
commit: 3d0e60d75172265d5e4dff9b148e4adf5fd561c9 [3549/14737] drm/i915/kuni=
t: DP link: add update config tests
:::::: branch date: 14 hours ago
:::::: commit date: 5 weeks ago
config: i386-randconfig-063-20260812 (https://download.01.org/0day-ci/archi=
ve/20260813/202608131516.HWw20vIE-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e98466=
48fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260813/202608131516.HWw20vIE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608131516.HWw20vIE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:274:24: sparse: =
sparse: not a function iter_start
   drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:286:22: sparse: =
sparse: not a function iter_end
   drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:297:20: sparse: =
sparse: not a function update
>> drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:463:28: sparse: =
sparse: not a function get_max_limits
>> drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:464:28: sparse: =
sparse: not a function set_max_limits
   drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:466:24: sparse: =
sparse: not a function iter_start
   drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:505:22: sparse: =
sparse: not a function iter_end
>> drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:509:31: sparse: =
sparse: not a function get_max_bw_config
   drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:513:9: sparse: s=
parse: not a function set_max_limits
   drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:595:41: sparse: =
sparse: not a function set_max_limits
   drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:617:42: sparse: =
sparse: not a function update
>> drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:677:17: sparse: =
sparse: not a function disable_config
   drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:1082:59: sparse:=
 sparse: not a function init
   drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:1093:36: sparse:=
 sparse: not a function cleanup

vim +463 drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c

3d0e60d7517226 Imre Deak 2026-07-07  443 =20
3d0e60d7517226 Imre Deak 2026-07-07  444  static void
3d0e60d7517226 Imre Deak 2026-07-07  445  verify_link_caps_for_order(const =
struct test_config_table *expected_table,
3d0e60d7517226 Imre Deak 2026-07-07  446  			   struct intel_dp_link_caps *=
link_caps,
3d0e60d7517226 Imre Deak 2026-07-07  447  			   struct intel_dp_link_caps_o=
rder config_order,
3d0e60d7517226 Imre Deak 2026-07-07  448  			   const struct intel_dp_link_=
config *max_limits)
3d0e60d7517226 Imre Deak 2026-07-07  449  {
3d0e60d7517226 Imre Deak 2026-07-07  450  	struct kunit *test =3D expected_=
table->test;
3d0e60d7517226 Imre Deak 2026-07-07  451  	struct test_ctx *ctx =3D test->p=
riv;
3d0e60d7517226 Imre Deak 2026-07-07  452  	const struct intel_dp_link_caps_=
test_ops *ops =3D
3d0e60d7517226 Imre Deak 2026-07-07  453  		ctx->link_caps_ops;
3d0e60d7517226 Imre Deak 2026-07-07  454  	struct intel_dp_link_config expe=
cted_max_bw_config =3D {};
3d0e60d7517226 Imre Deak 2026-07-07  455  	struct intel_dp_link_config actu=
al_max_bw_config;
3d0e60d7517226 Imre Deak 2026-07-07  456  	struct intel_dp_link_config last=
_config =3D {};
3d0e60d7517226 Imre Deak 2026-07-07  457  	struct intel_dp_link_config old_=
max_limits;
3d0e60d7517226 Imre Deak 2026-07-07  458  	struct intel_dp_link_config iter=
_config;
3d0e60d7517226 Imre Deak 2026-07-07  459  	struct intel_dp_link_caps_iter i=
ter;
3d0e60d7517226 Imre Deak 2026-07-07  460  	int num_actual_configs =3D 0;
3d0e60d7517226 Imre Deak 2026-07-07  461  	int max_bw =3D 0;
3d0e60d7517226 Imre Deak 2026-07-07  462 =20
3d0e60d7517226 Imre Deak 2026-07-07 @463  	ops->get_max_limits(link_caps, &=
old_max_limits);
3d0e60d7517226 Imre Deak 2026-07-07 @464  	ops->set_max_limits(link_caps, m=
ax_limits);
3d0e60d7517226 Imre Deak 2026-07-07  465 =20
3d0e60d7517226 Imre Deak 2026-07-07  466  	ops->iter_start(&iter, link_caps=
, config_order, INTEL_DP_LINK_CAPS_FILTER_ALL);
3d0e60d7517226 Imre Deak 2026-07-07  467  	for_each_dp_link_config(&iter, &=
iter_config) {
3d0e60d7517226 Imre Deak 2026-07-07  468  		int bw;
3d0e60d7517226 Imre Deak 2026-07-07  469 =20
3d0e60d7517226 Imre Deak 2026-07-07  470  		KUNIT_EXPECT_LE(test, iter_conf=
ig.rate, max_limits->rate);
3d0e60d7517226 Imre Deak 2026-07-07  471  		KUNIT_EXPECT_LE(test, iter_conf=
ig.lane_count, max_limits->lane_count);
3d0e60d7517226 Imre Deak 2026-07-07  472 =20
3d0e60d7517226 Imre Deak 2026-07-07  473  		num_actual_configs++;
3d0e60d7517226 Imre Deak 2026-07-07  474 =20
3d0e60d7517226 Imre Deak 2026-07-07  475  		/*
3d0e60d7517226 Imre Deak 2026-07-07  476  		 * Verify the config's rate/lan=
e-count values and its ordering relative
3d0e60d7517226 Imre Deak 2026-07-07  477  		 * to the previous config.
3d0e60d7517226 Imre Deak 2026-07-07  478  		 */
3d0e60d7517226 Imre Deak 2026-07-07  479  		if (last_config.rate)
3d0e60d7517226 Imre Deak 2026-07-07  480  			verify_config_order(test, conf=
ig_order, &last_config, &iter_config);
3d0e60d7517226 Imre Deak 2026-07-07  481  		last_config =3D iter_config;
3d0e60d7517226 Imre Deak 2026-07-07  482 =20
3d0e60d7517226 Imre Deak 2026-07-07  483  		KUNIT_EXPECT_TRUE(test, has_rat=
e(&expected_table->rates,
3d0e60d7517226 Imre Deak 2026-07-07  484  						 iter_config.rate));
3d0e60d7517226 Imre Deak 2026-07-07  485  		KUNIT_EXPECT_LE(test, iter_conf=
ig.lane_count,
3d0e60d7517226 Imre Deak 2026-07-07  486  				      expected_table->max_lan=
e_count);
3d0e60d7517226 Imre Deak 2026-07-07  487  		KUNIT_EXPECT_TRUE(test, is_powe=
r_of_2(iter_config.lane_count));
3d0e60d7517226 Imre Deak 2026-07-07  488 =20
3d0e60d7517226 Imre Deak 2026-07-07  489  		/* Verify the config's disabled=
 state */
3d0e60d7517226 Imre Deak 2026-07-07  490  		KUNIT_EXPECT_FALSE(test, has_co=
nfig(&expected_table->disabled_configs,
3d0e60d7517226 Imre Deak 2026-07-07  491  						    &iter_config));
3d0e60d7517226 Imre Deak 2026-07-07  492 =20
3d0e60d7517226 Imre Deak 2026-07-07  493  		/*
3d0e60d7517226 Imre Deak 2026-07-07  494  		 * Update the max limits for al=
lowed configs, verified at the
3d0e60d7517226 Imre Deak 2026-07-07  495  		 * end for the whole config tab=
le.
3d0e60d7517226 Imre Deak 2026-07-07  496  		 */
3d0e60d7517226 Imre Deak 2026-07-07  497 =20
3d0e60d7517226 Imre Deak 2026-07-07  498  		bw =3D drm_dp_max_dprx_data_rat=
e(iter_config.rate, iter_config.lane_count);
3d0e60d7517226 Imre Deak 2026-07-07  499  		if (bw > max_bw ||
3d0e60d7517226 Imre Deak 2026-07-07  500  		    (bw =3D=3D max_bw && iter_c=
onfig.rate > expected_max_bw_config.rate)) {
3d0e60d7517226 Imre Deak 2026-07-07  501  			max_bw =3D bw;
3d0e60d7517226 Imre Deak 2026-07-07  502  			expected_max_bw_config =3D ite=
r_config;
3d0e60d7517226 Imre Deak 2026-07-07  503  		}
3d0e60d7517226 Imre Deak 2026-07-07  504  	}
3d0e60d7517226 Imre Deak 2026-07-07  505  	ops->iter_end(&iter);
3d0e60d7517226 Imre Deak 2026-07-07  506 =20
3d0e60d7517226 Imre Deak 2026-07-07  507  	KUNIT_EXPECT_EQ(test, num_actual=
_configs, expected_num_configs(expected_table, max_limits));
3d0e60d7517226 Imre Deak 2026-07-07  508 =20
3d0e60d7517226 Imre Deak 2026-07-07 @509  	ops->get_max_bw_config(link_caps=
, &actual_max_bw_config);
3d0e60d7517226 Imre Deak 2026-07-07  510  	KUNIT_EXPECT_TRUE(test, link_con=
figs_match(&expected_max_bw_config,
3d0e60d7517226 Imre Deak 2026-07-07  511  						   &actual_max_bw_config));
3d0e60d7517226 Imre Deak 2026-07-07  512 =20
3d0e60d7517226 Imre Deak 2026-07-07  513  	KUNIT_ASSERT_TRUE(test, ops->set=
_max_limits(link_caps, &old_max_limits));
3d0e60d7517226 Imre Deak 2026-07-07  514  }
3d0e60d7517226 Imre Deak 2026-07-07  515 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
