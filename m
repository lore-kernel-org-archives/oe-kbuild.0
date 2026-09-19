Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E033AEF4B
	for <oe-kbuild@lists.linux.dev>; Sat, 19 Sep 2026 01:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789780210; cv=none; b=QcRJtAp5OoPz1uMnKNEucicK/iQP+h6sYM9fpuXuTfTq4bKRCDmH2bq6a2b8oSDbz3NlQTj74hUh3jx0QVhbj4IpaeJEn5XDpjxDHwsaxU/746Mav1vWphiESG5B8g291BWG9DTfQnw0hhtsCqnqotf9AFH42BEOyb8VkW7P7rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789780210; c=relaxed/simple;
	bh=l4qTS40WYiEGtC8TPZLrMUBOQW1UxOVHLpm117/ru4E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dcSI/8lLYoPsgxQV9j4mOz71RSrKkZHIWN2KfP9KLnIUdPamIuKOLNQkXRvWde5OFSdEv6tcH0VBOHY1gqmzjzPE0yHIOoDcie+0wd4Sgpk2Uot6PNlomkrRQe6eGdV7pLFSbEX5u3IjrdUW6kDENjqcJN1shfXVhAnQAdKOrwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ju2gp8us; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ju2gp8us"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789780200; x=1821316200;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=l4qTS40WYiEGtC8TPZLrMUBOQW1UxOVHLpm117/ru4E=;
  b=Ju2gp8usRQitM3ZRTyBrPzZ9EZGAbyw8qRUU73cOV1sdUBo4M/pv1hOA
   7hEafK6zdSbjtR27juX2kavTcpP96QMfEJbhEmANfU4oBybD4N9CzdMCC
   48uW8q0EVvjxDK1vfACfcRL0WcCmqpepwowIGh/F782D8VUfrqXPptvtq
   A+33Gp+hUpz2pmNx8u6n01vphKb92Qy2cy04IFUP4d28Arl3V8LFZtnx0
   KjTjBGfnb7AvIE4uXdrqc+5FISRMrq1mv8oJ5JYdgeLJEDXShq6Pc+Fur
   78gNr3/8an4pt2ZaZMue8v/yXygtgQ6O7J5kO6/y3NxVFjOLlT8os1NtM
   g==;
X-CSE-ConnectionGUID: WTu10qRhQ9mZ8cAeTpp+Og==
X-CSE-MsgGUID: ilIPn4B8Q+OgqJ0UVxhIbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="115850863"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="115850863"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 18:09:57 -0700
X-CSE-ConnectionGUID: qS16YItKQy+mewmF14L8Tg==
X-CSE-MsgGUID: YynCSVKmSL6HtWqA2kX0kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="268359949"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 18 Sep 2026 18:09:56 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7jaT-00000000AYD-2IcC;
	Sat, 19 Sep 2026 01:09:53 +0000
Date: Sat, 19 Sep 2026 09:09:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:213:24: sparse:
 sparse: not a function iter_start
Message-ID: <202609190910.AYvX7XC8-lkp@intel.com>
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
pu/drm/i915/display/tests/intel_dp_link_test.c:213:24: sparse: sparse: not =
a function iter_start"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Imre Deak <imre.deak@intel.com>
CC: "Micha=C5=82 Grzelak" <michal.grzelak@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f259f446f5198d98e13756d2cd531812a0ad3064
commit: ee4c8f2e2a9ac8871a14c9a17e93d6647d5ff2c8 drm/i915/kunit: DP link: a=
dd baseline fixed table reference test
date:   2 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 2 months ago
config: i386-randconfig-1300-20260918 (https://download.01.org/0day-ci/arch=
ive/20260919/202609190910.AYvX7XC8-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e98466=
48fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260919/202609190910.AYvX7XC8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: ee4c8f2e2a9a ("drm/i915/kunit: DP link: add baseline fixed table r=
eference test")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609190910.AYvX7XC8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:213:24: sparse: =
sparse: not a function iter_start
>> drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:225:22: sparse: =
sparse: not a function iter_end
>> drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:236:20: sparse: =
sparse: not a function update
   drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:278:59: sparse: =
sparse: not a function init
   drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:289:36: sparse: =
sparse: not a function cleanup

vim +213 drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c

ee4c8f2e2a9ac8 Imre Deak 2026-07-07  195 =20
ee4c8f2e2a9ac8 Imre Deak 2026-07-07  196  /*
ee4c8f2e2a9ac8 Imre Deak 2026-07-07  197   * TEST: Baseline with fixed refe=
rence table
ee4c8f2e2a9ac8 Imre Deak 2026-07-07  198   * ------------------------------=
-----------
ee4c8f2e2a9ac8 Imre Deak 2026-07-07  199   * Verify the link_caps config it=
erator using fixed standard DP config tables.
ee4c8f2e2a9ac8 Imre Deak 2026-07-07  200   */
ee4c8f2e2a9ac8 Imre Deak 2026-07-07  201  static void baseline_test_for_ord=
er(struct kunit *test,
ee4c8f2e2a9ac8 Imre Deak 2026-07-07  202  				    struct intel_dp_link_caps=
 *link_caps,
ee4c8f2e2a9ac8 Imre Deak 2026-07-07  203  				    struct intel_dp_link_caps=
_order config_order)
ee4c8f2e2a9ac8 Imre Deak 2026-07-07  204  {
ee4c8f2e2a9ac8 Imre Deak 2026-07-07  205  	struct test_ctx *ctx =3D test->p=
riv;
ee4c8f2e2a9ac8 Imre Deak 2026-07-07  206  	const struct link_config_set *co=
nfig_set =3D
ee4c8f2e2a9ac8 Imre Deak 2026-07-07  207  		link_caps_config_order_key_to_s=
et(test, config_order.key);
ee4c8f2e2a9ac8 Imre Deak 2026-07-07  208  	const struct intel_dp_link_caps_=
test_ops *ops =3D ctx->link_caps_ops;
ee4c8f2e2a9ac8 Imre Deak 2026-07-07  209  	struct intel_dp_link_config iter=
_config;
ee4c8f2e2a9ac8 Imre Deak 2026-07-07  210  	struct intel_dp_link_caps_iter i=
ter;
ee4c8f2e2a9ac8 Imre Deak 2026-07-07  211  	int pos =3D 0;
ee4c8f2e2a9ac8 Imre Deak 2026-07-07  212 =20
ee4c8f2e2a9ac8 Imre Deak 2026-07-07 @213  	ops->iter_start(&iter, link_caps=
, config_order, INTEL_DP_LINK_CAPS_FILTER_ALL);
ee4c8f2e2a9ac8 Imre Deak 2026-07-07  214  	for_each_dp_link_config(&iter, &=
iter_config) {
ee4c8f2e2a9ac8 Imre Deak 2026-07-07  215  		int idx =3D pos;
ee4c8f2e2a9ac8 Imre Deak 2026-07-07  216 =20
ee4c8f2e2a9ac8 Imre Deak 2026-07-07  217  		if (config_order.dir =3D=3D INT=
EL_DP_LINK_CAPS_ORDER_DIR_DESC)
ee4c8f2e2a9ac8 Imre Deak 2026-07-07  218  			idx =3D config_set->size - idx=
 - 1;
ee4c8f2e2a9ac8 Imre Deak 2026-07-07  219 =20
ee4c8f2e2a9ac8 Imre Deak 2026-07-07  220  		KUNIT_EXPECT_TRUE(test, link_co=
nfigs_match(&iter_config,
ee4c8f2e2a9ac8 Imre Deak 2026-07-07  221  							   &config_set->entries[id=
x]));
ee4c8f2e2a9ac8 Imre Deak 2026-07-07  222 =20
ee4c8f2e2a9ac8 Imre Deak 2026-07-07  223  		pos++;
ee4c8f2e2a9ac8 Imre Deak 2026-07-07  224  	}
ee4c8f2e2a9ac8 Imre Deak 2026-07-07 @225  	ops->iter_end(&iter);
ee4c8f2e2a9ac8 Imre Deak 2026-07-07  226  }
ee4c8f2e2a9ac8 Imre Deak 2026-07-07  227 =20
ee4c8f2e2a9ac8 Imre Deak 2026-07-07  228  static void intel_dp_link_caps_te=
st_baseline(struct kunit *test)
ee4c8f2e2a9ac8 Imre Deak 2026-07-07  229  {
ee4c8f2e2a9ac8 Imre Deak 2026-07-07  230  	struct test_ctx *ctx =3D test->p=
riv;
ee4c8f2e2a9ac8 Imre Deak 2026-07-07  231  	struct intel_dp_link_caps *link_=
caps =3D ctx->dev.dig_port.dp.link.caps;
ee4c8f2e2a9ac8 Imre Deak 2026-07-07  232  	const struct intel_dp_link_caps_=
test_ops *ops =3D
ee4c8f2e2a9ac8 Imre Deak 2026-07-07  233  		ctx->link_caps_ops;
ee4c8f2e2a9ac8 Imre Deak 2026-07-07  234  	int i;
ee4c8f2e2a9ac8 Imre Deak 2026-07-07  235 =20
ee4c8f2e2a9ac8 Imre Deak 2026-07-07 @236  	ops->update(link_caps,
ee4c8f2e2a9ac8 Imre Deak 2026-07-07  237  		    standard_dp_link_rates, LIN=
K_TEST_NUM_STANDARD_RATES,
ee4c8f2e2a9ac8 Imre Deak 2026-07-07  238  		    LINK_TEST_MAX_LANE_COUNT,
ee4c8f2e2a9ac8 Imre Deak 2026-07-07  239  		    true);
ee4c8f2e2a9ac8 Imre Deak 2026-07-07  240 =20
ee4c8f2e2a9ac8 Imre Deak 2026-07-07  241  	for (i =3D 0; i < ARRAY_SIZE(con=
fig_orders); i++)
ee4c8f2e2a9ac8 Imre Deak 2026-07-07  242  		baseline_test_for_order(test, l=
ink_caps, config_orders[i]);
ee4c8f2e2a9ac8 Imre Deak 2026-07-07  243  }
ee4c8f2e2a9ac8 Imre Deak 2026-07-07  244 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
