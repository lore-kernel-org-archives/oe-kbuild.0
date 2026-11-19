Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795111793;
	b=yu2buqOTPaPjYyHrMOgpwdvvhxEE6jQOX3RqftZQtuFJ2Kz+DwTkhraSadUn8d1iX9kT
	 gRi6I3pKMndJ/j8faKF6+8W24O6/U7cx1Lv1zwZJZOdS+G04Iwosu8oR/5o8tfpxN/G4R
	 FBebyrfCoxB7pZd9qsvaVli0BLXhnKZoWzhzj1XARmBupqqyQ8MIzc3I0rs7ORq5fxJB0
	 xkwlzjXdd5zXwa/1kq3ObsB3OEi3SoNRW9R3utp0Eh2FConGqe+qlZ9hDdVMVkbbaDDvy
	 SectnFicdDvoZKff8nVOhFvLZUIh0P8O59HCJwS+cI/0pVx7HoBiYaQ+CB7+t/WubdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111793;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=SDOJh9MxTUvU+QgbSYJv3mVYQ3FMkEC0lXq2AqNtHyE=;
	b=gGrwl6GRNojsjdKGRcqc0Ru0eBKWRgHfZP4gzKSQqYYIACASZjmE0d/PmBDLW28MjlSy
	 4UIo7ro2qMp2YbBVPIKMhp+g6qLGgi4a9h6YE3hxeDTYEiH5TV6apUSLNy6f8DqZ3qU0L
	 DVqR60y7m1vrpkyrE6VGyt3MBdKLnjGdoEM8TpiOLJQd5uMgVa+gxnJvKnytxy9eC8n1z
	 4rBTwjVUi2nBfrbbcgXOJfTD9P/I2daJNTFkToNcHfi5JRyK2JZHqmx+Lxav3fjX8/vXI
	 gIwnvfonVrbRsLrhJR4PKcfRM2bs70SRZHA1X57MG8u2V/IW3olzq5YVzMknBywCspw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ekb60eZz;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B599E606A325
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Nov 2026 18:09:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B599E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ekb60eZz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795111792; x=1826647792;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=IkgwKj9lWKaySjzoVYLQKu2HOj+uEEtECSOjfFMX3hw=;
  b=ekb60eZzhoXI7hx53viftUGb4SyQS+k7cuDMnmIMiToIGbit4ObaPIEc
   PhFf+GlIuGo50f0RkA8NDrp8TWrtLq2D3igjDE9jvElyJiMUTW2drcqra
   E3lG+7gLTuuVesXwNOzm2wBesceUm1f9OK/OeqyfDgyIWeweA2/sM1FPa
   7sM+enL9R0TaER0WcynlJ5jDRysE6cJv4KauLV0HXfs5VLEe769jtu1bc
   9ENlSWtNHT1ULUJhkmoLUzyT9ULzGcN25TyhxzSZCPSbqOex98SnD21Cq
   UazlrbHte3ZKyEebMCV5c+V36x3FReColF4izkmYcOQvhzb9uG7d+i3An
   Q==;
X-CSE-ConnectionGUID: jVH3mLY6SGOvKEY3CRew4g==
X-CSE-MsgGUID: RiwrD0c2Tu22jabudPPVow==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3857878"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3857878"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 10:09:52 -0800
X-CSE-ConnectionGUID: 2r4xj4haScCjYtDxpbLaqg==
X-CSE-MsgGUID: HV/SU64MQDWogUJVqrLX/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10855929"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 19 Nov 2026 10:09:50 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xU6Zv-000000003pB-3Iu0;
	Thu, 19 Nov 2026 18:09:47 +0000
Date: Thu, 19 Nov 2026 19:09:35 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 8016/9180]
 drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c:119 alloc_usable_pool_oversized()
 warn: passing zero to 'PTR_ERR'
Message-ID: <20261119190610.SAwAZ0wd-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Piotr Pi=C3=B3rkowski" <piotr.piorkowski@intel.com>
CC: Lukasz Laguna <lukasz.laguna@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   e8017d29067fd1310a65c3494ce1a1b492adbac6
commit: 23282e1d0eb7c3260f80b4a84826e3301f711bf3 [8016/9180] drm/xe/ggtt: A=
dd KUnit tests for usable and shareable pools
:::::: branch date: 24 hours ago
:::::: commit date: 2 days ago
config: powerpc64-randconfig-2200-20261117 (https://download.01.org/0day-ci=
/archive/20261119/20261119190610.SAwAZ0wd-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261119190610.SAwAZ0wd-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c:119 alloc_usable_pool_oversized() =
warn: passing zero to 'PTR_ERR'
drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c:253 alloc_partial_overlap_usable_f=
ull() warn: passing zero to 'PTR_ERR'
drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c:275 alloc_partial_overlap_shareabl=
e_full() warn: passing zero to 'PTR_ERR'
drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c:290 alloc_shareable_pool_unavailab=
le() warn: passing zero to 'PTR_ERR'
drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c:308 alloc_shareable_pool_oversized=
() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +119 drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c

23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  104 =20
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  105  static void alloc_usa=
ble_pool_oversized(struct kunit *test)
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  106  {
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  107  	u64 accessible =3D g=
gtt_test_accessible_size(test);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  108  	u64 usable =3D (acce=
ssible * 3) / 4;
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  109  	struct xe_ggtt_node =
*node;
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  110  	struct xe_ggtt *ggtt;
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  111 =20
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  112  	KUNIT_ASSERT_LE(test=
, usable + XE_PAGE_SIZE, (u64)U32_MAX);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  113 =20
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  114  	ggtt =3D ggtt_test_c=
reate(test, usable, usable, 0);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  115  	KUNIT_ASSERT_NOT_NUL=
L(test, ggtt);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  116 =20
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  117  	node =3D ggtt_test_i=
nsert_node(test, ggtt, usable + XE_PAGE_SIZE);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  118  	KUNIT_ASSERT_TRUE(te=
st, IS_ERR(node));
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16 @119  	KUNIT_EXPECT_EQ(test=
, PTR_ERR(node), -ENOSPC);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  120  }
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  121 =20
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  122  static struct kunit_c=
ase ggtt_test_cases[] =3D {
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  123  	KUNIT_CASE(init_nati=
ve),
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  124  	KUNIT_CASE(alloc_usa=
ble_pool_native),
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  125  	KUNIT_CASE(alloc_usa=
ble_pool_oversized),
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  126  	{}
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  127  };
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  128 =20
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  129  static struct kunit_s=
uite ggtt_suite =3D {
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  130  	.name =3D "xe_ggtt",
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  131  	.test_cases =3D ggtt=
_test_cases,
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  132  	.init =3D xe_kunit_h=
elper_xe_device_test_init,
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  133  };
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  134 =20
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  135  #if IS_ENABLED(CONFIG=
_PCI_IOV)
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  136  static struct xe_ggtt=
_node *ggtt_test_insert_node_shareable(struct kunit *test,
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  137  							    struct xe_=
ggtt *ggtt, u32 size)
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  138  {
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  139  	return ggtt_test_tra=
ck_node(test,
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  140  				    xe_ggtt_inser=
t_node_shareable(ggtt, size, XE_PAGE_SIZE));
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  141  }
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  142 =20
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  143  static void init_shar=
ed_pf(struct kunit *test)
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  144  {
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  145  	u64 accessible =3D g=
gtt_test_accessible_size(test);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  146  	struct xe_ggtt *ggtt=
 =3D ggtt_test_get(test);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  147 =20
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  148  	ggtt_init_shared(ggt=
t, GGTT_TEST_START, accessible);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  149  	KUNIT_ASSERT_EQ(test=
, ggtt_test_track_ggtt(test, ggtt), 0);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  150 =20
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  151  	KUNIT_EXPECT_EQ(test=
, ggtt->size, accessible);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  152  	KUNIT_EXPECT_EQ(test=
, ggtt_shareable_offset(ggtt), 0);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  153  	KUNIT_EXPECT_EQ(test=
, ggtt->shareable_size, accessible);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  154  	KUNIT_EXPECT_EQ(test=
, ggtt->full_size, accessible);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  155  }
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  156 =20
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  157  static void init_part=
ial_overlap(struct kunit *test)
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  158  {
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  159  	u64 accessible =3D g=
gtt_test_accessible_size(test);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  160  	u64 usable =3D (acce=
ssible * 3) / 4;
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  161  	u64 shareable =3D ac=
cessible / 2;
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  162  	struct xe_ggtt *ggtt;
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  163 =20
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  164  	KUNIT_ASSERT_GT(test=
, accessible, 0ULL);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  165  	KUNIT_ASSERT_GT(test=
, usable, shareable);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  166 =20
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  167  	ggtt =3D ggtt_test_c=
reate(test, accessible, usable, shareable);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  168  	KUNIT_ASSERT_NOT_NUL=
L(test, ggtt);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  169 =20
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  170  	KUNIT_EXPECT_EQ(test=
, ggtt->size, usable);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  171  	KUNIT_EXPECT_EQ(test=
, ggtt_shareable_offset(ggtt), accessible - shareable);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  172  	KUNIT_EXPECT_EQ(test=
, ggtt->shareable_size, shareable);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  173  	KUNIT_EXPECT_LT(test=
, ggtt_shareable_offset(ggtt), usable);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  174  	KUNIT_EXPECT_EQ(test=
, ggtt->full_size, accessible);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  175  }
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  176 =20
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  177  static void alloc_usa=
ble_pool_low(struct kunit *test)
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  178  {
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  179  	u64 accessible =3D g=
gtt_test_accessible_size(test);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  180  	u64 usable =3D (acce=
ssible * 3) / 4;
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  181  	u64 shareable =3D ac=
cessible / 2;
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  182  	struct xe_ggtt_node =
*usable_node;
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  183  	struct xe_ggtt *ggtt;
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  184 =20
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  185  	ggtt =3D ggtt_test_c=
reate(test, accessible, usable, shareable);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  186  	KUNIT_ASSERT_NOT_NUL=
L(test, ggtt);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  187 =20
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  188  	usable_node =3D ggtt=
_test_insert_node(test, ggtt, XE_PAGE_SIZE);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  189  	KUNIT_ASSERT_NOT_ERR=
_OR_NULL(test, usable_node);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  190  	KUNIT_EXPECT_EQ(test=
, xe_ggtt_node_addr(usable_node), GGTT_TEST_START);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  191  	KUNIT_EXPECT_EQ(test=
, xe_ggtt_node_size(usable_node), (u64)XE_PAGE_SIZE);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  192  }
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  193 =20
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  194  static void alloc_sha=
reable_pool_high(struct kunit *test)
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  195  {
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  196  	u64 accessible =3D g=
gtt_test_accessible_size(test);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  197  	u64 usable =3D (acce=
ssible * 3) / 4;
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  198  	u64 shareable =3D ac=
cessible / 2;
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  199  	struct xe_ggtt_node =
*shareable_node;
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  200  	struct xe_ggtt *ggtt;
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  201 =20
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  202  	ggtt =3D ggtt_test_c=
reate(test, accessible, usable, shareable);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  203  	KUNIT_ASSERT_NOT_NUL=
L(test, ggtt);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  204 =20
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  205  	shareable_node =3D g=
gtt_test_insert_node_shareable(test, ggtt, XE_PAGE_SIZE);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  206  	KUNIT_ASSERT_NOT_ERR=
_OR_NULL(test, shareable_node);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  207  	KUNIT_EXPECT_EQ(test=
, xe_ggtt_node_addr(shareable_node),
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  208  			GGTT_TEST_START + =
accessible - XE_PAGE_SIZE);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  209  	KUNIT_EXPECT_EQ(test=
, xe_ggtt_node_size(shareable_node), (u64)XE_PAGE_SIZE);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  210  }
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  211 =20
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  212  static void alloc_par=
tial_overlap(struct kunit *test)
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  213  {
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  214  	u64 accessible =3D g=
gtt_test_accessible_size(test);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  215  	u64 usable =3D (acce=
ssible * 3) / 4;
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  216  	u64 shareable =3D ac=
cessible / 2;
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  217  	struct xe_ggtt_node =
*shareable_node;
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  218  	struct xe_ggtt_node =
*usable_node;
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  219  	struct xe_ggtt *ggtt;
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  220 =20
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  221  	ggtt =3D ggtt_test_c=
reate(test, accessible, usable, shareable);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  222  	KUNIT_ASSERT_NOT_NUL=
L(test, ggtt);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  223 =20
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  224  	usable_node =3D ggtt=
_test_insert_node(test, ggtt, XE_PAGE_SIZE);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  225  	KUNIT_ASSERT_NOT_ERR=
_OR_NULL(test, usable_node);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  226  	shareable_node =3D g=
gtt_test_insert_node_shareable(test, ggtt, XE_PAGE_SIZE);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  227  	KUNIT_ASSERT_NOT_ERR=
_OR_NULL(test, shareable_node);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  228 =20
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  229  	KUNIT_EXPECT_EQ(test=
, xe_ggtt_node_addr(usable_node), GGTT_TEST_START);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  230  	KUNIT_EXPECT_EQ(test=
, xe_ggtt_node_addr(shareable_node),
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  231  			GGTT_TEST_START + =
accessible - XE_PAGE_SIZE);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  232  }
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  233 =20
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  234  static void alloc_par=
tial_overlap_usable_full(struct kunit *test)
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  235  {
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  236  	u64 accessible =3D g=
gtt_test_accessible_size(test);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  237  	u64 usable =3D (acce=
ssible * 3) / 4;
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  238  	u64 shareable =3D ac=
cessible / 2;
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  239  	struct xe_ggtt_node =
*shareable_node;
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  240  	struct xe_ggtt_node =
*usable_node;
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  241  	struct xe_ggtt *ggtt;
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  242 =20
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  243  	KUNIT_ASSERT_LE(test=
, usable, (u64)U32_MAX);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  244  	KUNIT_ASSERT_LE(test=
, shareable, (u64)U32_MAX);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  245 =20
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  246  	ggtt =3D ggtt_test_c=
reate(test, accessible, usable, shareable);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  247  	KUNIT_ASSERT_NOT_NUL=
L(test, ggtt);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  248 =20
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  249  	usable_node =3D ggtt=
_test_insert_node(test, ggtt, usable);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  250  	KUNIT_ASSERT_NOT_ERR=
_OR_NULL(test, usable_node);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  251  	shareable_node =3D g=
gtt_test_insert_node_shareable(test, ggtt, shareable);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  252  	KUNIT_ASSERT_TRUE(te=
st, IS_ERR(shareable_node));
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16 @253  	KUNIT_EXPECT_EQ(test=
, PTR_ERR(shareable_node), -ENOSPC);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  254  }
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  255 =20
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  256  static void alloc_par=
tial_overlap_shareable_full(struct kunit *test)
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  257  {
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  258  	u64 accessible =3D g=
gtt_test_accessible_size(test);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  259  	u64 usable =3D (acce=
ssible * 3) / 4;
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  260  	u64 shareable =3D ac=
cessible / 2;
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  261  	struct xe_ggtt_node =
*shareable_node;
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  262  	struct xe_ggtt_node =
*usable_node;
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  263  	struct xe_ggtt *ggtt;
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  264 =20
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  265  	KUNIT_ASSERT_LE(test=
, usable, (u64)U32_MAX);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  266  	KUNIT_ASSERT_LE(test=
, shareable, (u64)U32_MAX);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  267 =20
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  268  	ggtt =3D ggtt_test_c=
reate(test, accessible, usable, shareable);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  269  	KUNIT_ASSERT_NOT_NUL=
L(test, ggtt);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  270 =20
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  271  	shareable_node =3D g=
gtt_test_insert_node_shareable(test, ggtt, shareable);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  272  	KUNIT_ASSERT_NOT_ERR=
_OR_NULL(test, shareable_node);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  273  	usable_node =3D ggtt=
_test_insert_node(test, ggtt, usable);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  274  	KUNIT_ASSERT_TRUE(te=
st, IS_ERR(usable_node));
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16 @275  	KUNIT_EXPECT_EQ(test=
, PTR_ERR(usable_node), -ENOSPC);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  276  }
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  277 =20
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  278  static void alloc_sha=
reable_pool_unavailable(struct kunit *test)
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  279  {
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  280  	u64 accessible =3D g=
gtt_test_accessible_size(test);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  281  	u64 usable =3D (acce=
ssible * 3) / 4;
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  282  	struct xe_ggtt_node =
*node;
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  283  	struct xe_ggtt *ggtt;
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  284 =20
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  285  	ggtt =3D ggtt_test_c=
reate(test, usable, usable, 0);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  286  	KUNIT_ASSERT_NOT_NUL=
L(test, ggtt);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  287 =20
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  288  	node =3D ggtt_test_i=
nsert_node_shareable(test, ggtt, XE_PAGE_SIZE);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  289  	KUNIT_ASSERT_TRUE(te=
st, IS_ERR(node));
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16 @290  	KUNIT_EXPECT_EQ(test=
, PTR_ERR(node), -ENOSPC);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  291  }
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  292 =20
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  293  static void alloc_sha=
reable_pool_oversized(struct kunit *test)
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  294  {
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  295  	u64 accessible =3D g=
gtt_test_accessible_size(test);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  296  	u64 usable =3D (acce=
ssible * 3) / 4;
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  297  	u64 shareable =3D ac=
cessible / 2;
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  298  	struct xe_ggtt_node =
*node;
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  299  	struct xe_ggtt *ggtt;
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  300 =20
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  301  	KUNIT_ASSERT_LE(test=
, shareable + XE_PAGE_SIZE, (u64)U32_MAX);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  302 =20
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  303  	ggtt =3D ggtt_test_c=
reate(test, accessible, usable, shareable);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  304  	KUNIT_ASSERT_NOT_NUL=
L(test, ggtt);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  305 =20
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  306  	node =3D ggtt_test_i=
nsert_node_shareable(test, ggtt, shareable + XE_PAGE_SIZE);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  307  	KUNIT_ASSERT_TRUE(te=
st, IS_ERR(node));
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16 @308  	KUNIT_EXPECT_EQ(test=
, PTR_ERR(node), -ENOSPC);
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  309  }
23282e1d0eb7c3 Piotr Pi=C3=B3rkowski 2026-11-16  310 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
