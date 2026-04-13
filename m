Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41CF1BBBE5
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Apr 2026 19:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776107073; cv=none; b=HNE/uABkSFUwQD1f6sFzFGwWmtVB5ITPOD74dKOqv3hmyVUnrIPYcPri507VqFmihmQWwNDy6DFaLcuHzWkrQ7UAjs4i4FUJ4XVcbHuzxdAtBIj3ReHdvtnI2D0AKf8N1sIz7nMMtOikye689VWxYGBIxDzC90vBhdFAMhivhH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776107073; c=relaxed/simple;
	bh=iVmFCTsjvMmAT6wLY/iYWzM5kZJAAYBcwghYFTNUmbo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=r4PnwsPn56U8BNuqu6ZyY/JzLh9fx8O4d/VnrwloED71aKqTsvbNMAZLVlRfHbziecDLgfpYJbCQ9rjAgZKMypfWGQIRqf2nD+y8IL6AKp7B+6tp5d0cBmGSFSqvZOsoq1UO+H5XbOCiaCYampMvLVVzmCTAW2/3FrdSww0W0/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=izsre09r; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="izsre09r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776107072; x=1807643072;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=iVmFCTsjvMmAT6wLY/iYWzM5kZJAAYBcwghYFTNUmbo=;
  b=izsre09rlReh+B4S2o5FNCYiekQuq85Wu82xfw+mnRHV79oheXCdJGzf
   aumg/1qlqehX5Qx1A8L9vHPYnpzjHWXmlIjII0CQq4z4RIwnWIDbAxT8u
   Rxy4x6kI+jwb3I0c3Sj9V8pDzB89nVS0dHjRNWz0c79vVskhQMq6sfJ47
   xzKokAPupq2hVPR9jX5uhz9DMwC9Vmd+ZN4CnWm47W5vjU/R3QjbQMasX
   DEcv/DiWnaztRtcSROUCmV4+Jr7j1zrkY26S8iVz2cIUwtdF7q+Tx56pA
   WX04IYRdzwW1vwSwPcut2UmKiONRwR4XN/GDAKdYlMWc8QUOsLfgicnsP
   g==;
X-CSE-ConnectionGUID: mm+f2tROQ/esXtK80r2m5w==
X-CSE-MsgGUID: uB5XYn8KRlKhgFSzlKCA6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="77018211"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="77018211"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 12:04:32 -0700
X-CSE-ConnectionGUID: OzRWjRWZSdS6QbIfZzSRKA==
X-CSE-MsgGUID: xwS++b1XTyGICRejqH4m1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="225568144"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Apr 2026 12:04:30 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCMaB-000000000ll-3FN9;
	Mon, 13 Apr 2026 19:04:27 +0000
Date: Tue, 14 Apr 2026 03:03:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [drm-misc:drm-misc-next 1/5]
 drivers/gpu/drm/drm_gpusvm.c:1555:10: error: call to
 '__compiletime_assert_309' declared with 'error' attribute: BUILD_BUG failed
Message-ID: <202604140220.1WYAGSBw-lkp@intel.com>
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
:::::: Manual check reason: "__compiletime_assert_NNN"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: dri-devel@lists.freedesktop.org
TO: Matthew Brost <matthew.brost@intel.com>
CC: "Thomas Hellstr=C3=B6m" <thomas.hellstrom@linux.intel.com>

tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
head:   5f183b0588eb508ab49022e26923d91698447226
commit: 37ad039fb3674a36dbf082fa5c864af1b791eccd [1/5] drm/gpusvm: Use dma-=
map IOVA alloc, link, and sync API in GPU SVM
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: i386-randconfig-141-20260413 (https://download.01.org/0day-ci/archi=
ve/20260414/202604140220.1WYAGSBw-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9007-gcf3ea02b
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260414/202604140220.1WYAGSBw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604140220.1WYAGSBw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/drm_gpusvm.c:1555:10: error: call to '__compiletime_asse=
rt_309' declared with 'error' attribute: BUILD_BUG failed
    1555 |                                                    HPAGE_PMD_SIZ=
E ?
         |                                                    ^
   include/linux/huge_mm.h:120:34: note: expanded from macro 'HPAGE_PMD_SIZ=
E'
     120 | #define HPAGE_PMD_SIZE  ((1UL) << HPAGE_PMD_SHIFT)
         |                                   ^
   include/linux/huge_mm.h:113:28: note: expanded from macro 'HPAGE_PMD_SHI=
FT'
     113 | #define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
         |                            ^
   include/linux/build_bug.h:60:21: note: expanded from macro 'BUILD_BUG'
      60 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
         |                     ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:694:2: note: expanded from macro '_compil=
etime_assert'
     694 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:687:4: note: expanded from macro '__compi=
letime_assert'
     687 |                         prefix ## suffix();                     =
        \
         |                         ^
   <scratch space>:78:1: note: expanded from here
      78 | __compiletime_assert_309
         | ^
   1 error generated.


vim +1555 drivers/gpu/drm/drm_gpusvm.c

99624bdff86707 Matthew Brost         2025-03-05  1372 =20
99624bdff86707 Matthew Brost         2025-03-05  1373  /**
6364afd532bcab Matthew Auld          2025-08-28  1374   * drm_gpusvm_get_pa=
ges() - Get pages and populate GPU SVM pages struct
99624bdff86707 Matthew Brost         2025-03-05  1375   * @gpusvm: Pointer =
to the GPU SVM structure
6364afd532bcab Matthew Auld          2025-08-28  1376   * @svm_pages: The S=
VM pages to populate. This will contain the dma-addresses
6364afd532bcab Matthew Auld          2025-08-28  1377   * @mm: The mm corre=
sponding to the CPU range
6364afd532bcab Matthew Auld          2025-08-28  1378   * @notifier: The co=
rresponding notifier for the given CPU range
6364afd532bcab Matthew Auld          2025-08-28  1379   * @pages_start: Sta=
rt CPU address for the pages
6364afd532bcab Matthew Auld          2025-08-28  1380   * @pages_end: End C=
PU address for the pages (exclusive)
99624bdff86707 Matthew Brost         2025-03-05  1381   * @ctx: GPU SVM con=
text
99624bdff86707 Matthew Brost         2025-03-05  1382   *
6364afd532bcab Matthew Auld          2025-08-28  1383   * This function get=
s and maps pages for CPU range and ensures they are
6364afd532bcab Matthew Auld          2025-08-28  1384   * mapped for DMA ac=
cess.
99624bdff86707 Matthew Brost         2025-03-05  1385   *
99624bdff86707 Matthew Brost         2025-03-05  1386   * Return: 0 on succ=
ess, negative error code on failure.
99624bdff86707 Matthew Brost         2025-03-05  1387   */
83f706ecbde1df Matthew Auld          2025-08-28  1388  int drm_gpusvm_get_p=
ages(struct drm_gpusvm *gpusvm,
6364afd532bcab Matthew Auld          2025-08-28  1389  			 struct drm_gpusv=
m_pages *svm_pages,
6364afd532bcab Matthew Auld          2025-08-28  1390  			 struct mm_struct=
 *mm,
6364afd532bcab Matthew Auld          2025-08-28  1391  			 struct mmu_inter=
val_notifier *notifier,
83f706ecbde1df Matthew Auld          2025-08-28  1392  			 unsigned long pa=
ges_start, unsigned long pages_end,
99624bdff86707 Matthew Brost         2025-03-05  1393  			 const struct drm=
_gpusvm_ctx *ctx)
99624bdff86707 Matthew Brost         2025-03-05  1394  {
99624bdff86707 Matthew Brost         2025-03-05  1395  	struct hmm_range hm=
m_range =3D {
99624bdff86707 Matthew Brost         2025-03-05  1396  		.default_flags =3D =
HMM_PFN_REQ_FAULT | (ctx->read_only ? 0 :
99624bdff86707 Matthew Brost         2025-03-05  1397  			HMM_PFN_REQ_WRITE=
),
99624bdff86707 Matthew Brost         2025-03-05  1398  		.notifier =3D noti=
fier,
6364afd532bcab Matthew Auld          2025-08-28  1399  		.start =3D pages_s=
tart,
6364afd532bcab Matthew Auld          2025-08-28  1400  		.end =3D pages_end,
ad298d9ec95741 Thomas Hellstr=C3=B6m      2025-09-30  1401  		.dev_private_=
owner =3D ctx->device_private_page_owner,
99624bdff86707 Matthew Brost         2025-03-05  1402  	};
f86ad0ed620cb3 Matthew Brost         2025-06-19  1403  	void *zdd;
99624bdff86707 Matthew Brost         2025-03-05  1404  	unsigned long timeo=
ut =3D
99624bdff86707 Matthew Brost         2025-03-05  1405  		jiffies + msecs_to=
_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
99624bdff86707 Matthew Brost         2025-03-05  1406  	unsigned long i, j;
6364afd532bcab Matthew Auld          2025-08-28  1407  	unsigned long npage=
s =3D npages_in_range(pages_start, pages_end);
99624bdff86707 Matthew Brost         2025-03-05  1408  	unsigned long num_d=
ma_mapped;
99624bdff86707 Matthew Brost         2025-03-05  1409  	unsigned int order =
=3D 0;
99624bdff86707 Matthew Brost         2025-03-05  1410  	unsigned long *pfns;
99624bdff86707 Matthew Brost         2025-03-05  1411  	int err =3D 0;
99624bdff86707 Matthew Brost         2025-03-05  1412  	struct dev_pagemap =
*pagemap;
99624bdff86707 Matthew Brost         2025-03-05  1413  	struct drm_pagemap =
*dpagemap;
f70da6f99d4f40 Matthew Auld          2025-08-28  1414  	struct drm_gpusvm_p=
ages_flags flags;
ad70e289ed4b1f Matthew Auld          2025-08-28  1415  	enum dma_data_direc=
tion dma_dir =3D ctx->read_only ? DMA_TO_DEVICE :
ad70e289ed4b1f Matthew Auld          2025-08-28  1416  							   DMA_BIDIRE=
CTIONAL;
37ad039fb3674a Matthew Brost         2026-04-10  1417  	struct dma_iova_sta=
te *state =3D &svm_pages->state;
99624bdff86707 Matthew Brost         2025-03-05  1418 =20
99624bdff86707 Matthew Brost         2025-03-05  1419  retry:
9fb1f1256e419f Matthew Brost         2025-11-21  1420  	if (time_after(jiff=
ies, timeout))
9fb1f1256e419f Matthew Brost         2025-11-21  1421  		return -EBUSY;
9fb1f1256e419f Matthew Brost         2025-11-21  1422 =20
99624bdff86707 Matthew Brost         2025-03-05  1423  	hmm_range.notifier_=
seq =3D mmu_interval_read_begin(notifier);
6364afd532bcab Matthew Auld          2025-08-28  1424  	if (drm_gpusvm_page=
s_valid_unlocked(gpusvm, svm_pages))
99624bdff86707 Matthew Brost         2025-03-05  1425  		goto set_seqno;
99624bdff86707 Matthew Brost         2025-03-05  1426 =20
99624bdff86707 Matthew Brost         2025-03-05  1427  	pfns =3D kvmalloc_a=
rray(npages, sizeof(*pfns), GFP_KERNEL);
99624bdff86707 Matthew Brost         2025-03-05  1428  	if (!pfns)
99624bdff86707 Matthew Brost         2025-03-05  1429  		return -ENOMEM;
99624bdff86707 Matthew Brost         2025-03-05  1430 =20
99624bdff86707 Matthew Brost         2025-03-05  1431  	if (!mmget_not_zero=
(mm)) {
99624bdff86707 Matthew Brost         2025-03-05  1432  		err =3D -EFAULT;
99624bdff86707 Matthew Brost         2025-03-05  1433  		goto err_free;
99624bdff86707 Matthew Brost         2025-03-05  1434  	}
99624bdff86707 Matthew Brost         2025-03-05  1435 =20
99624bdff86707 Matthew Brost         2025-03-05  1436  	hmm_range.hmm_pfns =
=3D pfns;
99624bdff86707 Matthew Brost         2025-03-05  1437  	while (true) {
99624bdff86707 Matthew Brost         2025-03-05  1438  		mmap_read_lock(mm);
99624bdff86707 Matthew Brost         2025-03-05  1439  		err =3D hmm_range_=
fault(&hmm_range);
99624bdff86707 Matthew Brost         2025-03-05  1440  		mmap_read_unlock(m=
m);
99624bdff86707 Matthew Brost         2025-03-05  1441 =20
99624bdff86707 Matthew Brost         2025-03-05  1442  		if (err =3D=3D -EB=
USY) {
99624bdff86707 Matthew Brost         2025-03-05  1443  			if (time_after(ji=
ffies, timeout))
99624bdff86707 Matthew Brost         2025-03-05  1444  				break;
99624bdff86707 Matthew Brost         2025-03-05  1445 =20
99624bdff86707 Matthew Brost         2025-03-05  1446  			hmm_range.notifie=
r_seq =3D
99624bdff86707 Matthew Brost         2025-03-05  1447  				mmu_interval_rea=
d_begin(notifier);
99624bdff86707 Matthew Brost         2025-03-05  1448  			continue;
99624bdff86707 Matthew Brost         2025-03-05  1449  		}
99624bdff86707 Matthew Brost         2025-03-05  1450  		break;
99624bdff86707 Matthew Brost         2025-03-05  1451  	}
99624bdff86707 Matthew Brost         2025-03-05  1452  	mmput(mm);
99624bdff86707 Matthew Brost         2025-03-05  1453  	if (err)
99624bdff86707 Matthew Brost         2025-03-05  1454  		goto err_free;
99624bdff86707 Matthew Brost         2025-03-05  1455 =20
37ad039fb3674a Matthew Brost         2026-04-10  1456  	*state =3D (struct =
dma_iova_state){};
37ad039fb3674a Matthew Brost         2026-04-10  1457  	svm_pages->state_of=
fset =3D 0;
37ad039fb3674a Matthew Brost         2026-04-10  1458 =20
99624bdff86707 Matthew Brost         2025-03-05  1459  map_pages:
99624bdff86707 Matthew Brost         2025-03-05  1460  	/*
99624bdff86707 Matthew Brost         2025-03-05  1461  	 * Perform all dma =
mappings under the notifier lock to not
99624bdff86707 Matthew Brost         2025-03-05  1462  	 * access freed pag=
es. A notifier will either block on
99624bdff86707 Matthew Brost         2025-03-05  1463  	 * the notifier loc=
k or unmap dma.
99624bdff86707 Matthew Brost         2025-03-05  1464  	 */
99624bdff86707 Matthew Brost         2025-03-05  1465  	drm_gpusvm_notifier=
_lock(gpusvm);
99624bdff86707 Matthew Brost         2025-03-05  1466 =20
f70da6f99d4f40 Matthew Auld          2025-08-28  1467  	flags.__flags =3D s=
vm_pages->flags.__flags;
a9ac0fa455b050 Matthew Brost         2025-05-12  1468  	if (flags.unmapped)=
 {
99624bdff86707 Matthew Brost         2025-03-05  1469  		drm_gpusvm_notifie=
r_unlock(gpusvm);
99624bdff86707 Matthew Brost         2025-03-05  1470  		err =3D -EFAULT;
99624bdff86707 Matthew Brost         2025-03-05  1471  		goto err_free;
99624bdff86707 Matthew Brost         2025-03-05  1472  	}
99624bdff86707 Matthew Brost         2025-03-05  1473 =20
99624bdff86707 Matthew Brost         2025-03-05  1474  	if (mmu_interval_re=
ad_retry(notifier, hmm_range.notifier_seq)) {
99624bdff86707 Matthew Brost         2025-03-05  1475  		drm_gpusvm_notifie=
r_unlock(gpusvm);
99624bdff86707 Matthew Brost         2025-03-05  1476  		kvfree(pfns);
99624bdff86707 Matthew Brost         2025-03-05  1477  		goto retry;
99624bdff86707 Matthew Brost         2025-03-05  1478  	}
99624bdff86707 Matthew Brost         2025-03-05  1479 =20
f70da6f99d4f40 Matthew Auld          2025-08-28  1480  	if (!svm_pages->dma=
_addr) {
99624bdff86707 Matthew Brost         2025-03-05  1481  		/* Unlock and rest=
art mapping to allocate memory. */
99624bdff86707 Matthew Brost         2025-03-05  1482  		drm_gpusvm_notifie=
r_unlock(gpusvm);
f70da6f99d4f40 Matthew Auld          2025-08-28  1483  		svm_pages->dma_add=
r =3D
bf4afc53b77aea Linus Torvalds        2026-02-21  1484  			kvmalloc_objs(*sv=
m_pages->dma_addr, npages);
f70da6f99d4f40 Matthew Auld          2025-08-28  1485  		if (!svm_pages->dm=
a_addr) {
99624bdff86707 Matthew Brost         2025-03-05  1486  			err =3D -ENOMEM;
99624bdff86707 Matthew Brost         2025-03-05  1487  			goto err_free;
99624bdff86707 Matthew Brost         2025-03-05  1488  		}
99624bdff86707 Matthew Brost         2025-03-05  1489  		goto map_pages;
99624bdff86707 Matthew Brost         2025-03-05  1490  	}
99624bdff86707 Matthew Brost         2025-03-05  1491 =20
99624bdff86707 Matthew Brost         2025-03-05  1492  	zdd =3D NULL;
f86ad0ed620cb3 Matthew Brost         2025-06-19  1493  	pagemap =3D NULL;
99624bdff86707 Matthew Brost         2025-03-05  1494  	num_dma_mapped =3D =
0;
99624bdff86707 Matthew Brost         2025-03-05  1495  	for (i =3D 0, j =3D =
0; i < npages; ++j) {
99624bdff86707 Matthew Brost         2025-03-05  1496  		struct page *page =
=3D hmm_pfn_to_page(pfns[i]);
99624bdff86707 Matthew Brost         2025-03-05  1497 =20
c50729c68aaf93 Matthew Auld          2025-08-28  1498  		order =3D drm_gpus=
vm_hmm_pfn_to_order(pfns[i], i, npages);
99624bdff86707 Matthew Brost         2025-03-05  1499  		if (is_device_priv=
ate_page(page) ||
99624bdff86707 Matthew Brost         2025-03-05  1500  		    is_device_cohe=
rent_page(page)) {
2e03c0c5c59a08 Francois Dugast       2026-03-12  1501  			struct drm_pagema=
p_zdd *__zdd =3D
2e03c0c5c59a08 Francois Dugast       2026-03-12  1502  				drm_pagemap_page=
_zone_device_data(page);
2e03c0c5c59a08 Francois Dugast       2026-03-12  1503 =20
bce13d6ecd6c0e Matthew Brost         2025-10-15  1504  			if (!ctx->allow_m=
ixed &&
2e03c0c5c59a08 Francois Dugast       2026-03-12  1505  			    zdd !=3D __zd=
d && i > 0) {
99624bdff86707 Matthew Brost         2025-03-05  1506  				err =3D -EOPNOTS=
UPP;
99624bdff86707 Matthew Brost         2025-03-05  1507  				goto err_unmap;
99624bdff86707 Matthew Brost         2025-03-05  1508  			}
2e03c0c5c59a08 Francois Dugast       2026-03-12  1509  			zdd =3D __zdd;
eb0ece16027f82 Linus Torvalds        2025-04-01  1510  			if (pagemap !=3D =
page_pgmap(page)) {
ec49857ad181f2 Matthew Brost         2026-01-30  1511  				if (pagemap) {
99624bdff86707 Matthew Brost         2025-03-05  1512  					err =3D -EOPNOT=
SUPP;
99624bdff86707 Matthew Brost         2025-03-05  1513  					goto err_unmap;
99624bdff86707 Matthew Brost         2025-03-05  1514  				}
99624bdff86707 Matthew Brost         2025-03-05  1515 =20
eb0ece16027f82 Linus Torvalds        2025-04-01  1516  				pagemap =3D page=
_pgmap(page);
f86ad0ed620cb3 Matthew Brost         2025-06-19  1517  				dpagemap =3D drm=
_pagemap_page_to_dpagemap(page);
99624bdff86707 Matthew Brost         2025-03-05  1518  				if (drm_WARN_ON(=
gpusvm->drm, !dpagemap)) {
99624bdff86707 Matthew Brost         2025-03-05  1519  					/*
99624bdff86707 Matthew Brost         2025-03-05  1520  					 * Raced. This =
is not supposed to happen
99624bdff86707 Matthew Brost         2025-03-05  1521  					 * since hmm_ra=
nge_fault() should've migrated
99624bdff86707 Matthew Brost         2025-03-05  1522  					 * this page to=
 system.
99624bdff86707 Matthew Brost         2025-03-05  1523  					 */
99624bdff86707 Matthew Brost         2025-03-05  1524  					err =3D -EAGAIN;
99624bdff86707 Matthew Brost         2025-03-05  1525  					goto err_unmap;
99624bdff86707 Matthew Brost         2025-03-05  1526  				}
99624bdff86707 Matthew Brost         2025-03-05  1527  			}
f70da6f99d4f40 Matthew Auld          2025-08-28  1528  			svm_pages->dma_ad=
dr[j] =3D
99624bdff86707 Matthew Brost         2025-03-05  1529  				dpagemap->ops->d=
evice_map(dpagemap,
99624bdff86707 Matthew Brost         2025-03-05  1530  							  gpusvm->drm=
->dev,
99624bdff86707 Matthew Brost         2025-03-05  1531  							  page, order,
ad70e289ed4b1f Matthew Auld          2025-08-28  1532  							  dma_dir);
99624bdff86707 Matthew Brost         2025-03-05  1533  			if (dma_mapping_e=
rror(gpusvm->drm->dev,
f70da6f99d4f40 Matthew Auld          2025-08-28  1534  					      svm_pages=
->dma_addr[j].addr)) {
99624bdff86707 Matthew Brost         2025-03-05  1535  				err =3D -EFAULT;
99624bdff86707 Matthew Brost         2025-03-05  1536  				goto err_unmap;
99624bdff86707 Matthew Brost         2025-03-05  1537  			}
99624bdff86707 Matthew Brost         2025-03-05  1538  		} else {
99624bdff86707 Matthew Brost         2025-03-05  1539  			dma_addr_t addr;
99624bdff86707 Matthew Brost         2025-03-05  1540 =20
bce13d6ecd6c0e Matthew Brost         2025-10-15  1541  			if (is_zone_devic=
e_page(page) ||
bce13d6ecd6c0e Matthew Brost         2025-10-15  1542  			    (pagemap && !=
ctx->allow_mixed)) {
99624bdff86707 Matthew Brost         2025-03-05  1543  				err =3D -EOPNOTS=
UPP;
99624bdff86707 Matthew Brost         2025-03-05  1544  				goto err_unmap;
99624bdff86707 Matthew Brost         2025-03-05  1545  			}
99624bdff86707 Matthew Brost         2025-03-05  1546 =20
8a9b978ebd47df Himal Prasad Ghimiray 2025-05-12  1547  			if (ctx->devmem_o=
nly) {
8a9b978ebd47df Himal Prasad Ghimiray 2025-05-12  1548  				err =3D -EFAULT;
8a9b978ebd47df Himal Prasad Ghimiray 2025-05-12  1549  				goto err_unmap;
8a9b978ebd47df Himal Prasad Ghimiray 2025-05-12  1550  			}
8a9b978ebd47df Himal Prasad Ghimiray 2025-05-12  1551 =20
37ad039fb3674a Matthew Brost         2026-04-10  1552  			if (!i)
37ad039fb3674a Matthew Brost         2026-04-10  1553  				dma_iova_try_all=
oc(gpusvm->drm->dev, state,
37ad039fb3674a Matthew Brost         2026-04-10  1554  						   npages * PA=
GE_SIZE >=3D
37ad039fb3674a Matthew Brost         2026-04-10 @1555  						   HPAGE_PMD_S=
IZE ?
37ad039fb3674a Matthew Brost         2026-04-10  1556  						   HPAGE_PMD_S=
IZE : 0,
37ad039fb3674a Matthew Brost         2026-04-10  1557  						   npages * PA=
GE_SIZE);
37ad039fb3674a Matthew Brost         2026-04-10  1558 =20
37ad039fb3674a Matthew Brost         2026-04-10  1559  			if (dma_use_iova(=
state)) {
37ad039fb3674a Matthew Brost         2026-04-10  1560  				err =3D dma_iova=
_link(gpusvm->drm->dev, state,
37ad039fb3674a Matthew Brost         2026-04-10  1561  						    hmm_pfn_to=
_phys(pfns[i]),
37ad039fb3674a Matthew Brost         2026-04-10  1562  						    svm_pages-=
>state_offset,
37ad039fb3674a Matthew Brost         2026-04-10  1563  						    PAGE_SIZE =
<< order,
37ad039fb3674a Matthew Brost         2026-04-10  1564  						    dma_dir, 0=
);
37ad039fb3674a Matthew Brost         2026-04-10  1565  				if (err)
37ad039fb3674a Matthew Brost         2026-04-10  1566  					goto err_unmap;
37ad039fb3674a Matthew Brost         2026-04-10  1567 =20
37ad039fb3674a Matthew Brost         2026-04-10  1568  				addr =3D state->=
addr + svm_pages->state_offset;
37ad039fb3674a Matthew Brost         2026-04-10  1569  				svm_pages->state=
_offset +=3D PAGE_SIZE << order;
37ad039fb3674a Matthew Brost         2026-04-10  1570  			} else {
99624bdff86707 Matthew Brost         2025-03-05  1571  				addr =3D dma_map=
_page(gpusvm->drm->dev,
99624bdff86707 Matthew Brost         2025-03-05  1572  						    page, 0,
99624bdff86707 Matthew Brost         2025-03-05  1573  						    PAGE_SIZE =
<< order,
ad70e289ed4b1f Matthew Auld          2025-08-28  1574  						    dma_dir);
99624bdff86707 Matthew Brost         2025-03-05  1575  				if (dma_mapping_=
error(gpusvm->drm->dev, addr)) {
99624bdff86707 Matthew Brost         2025-03-05  1576  					err =3D -EFAULT;
99624bdff86707 Matthew Brost         2025-03-05  1577  					goto err_unmap;
99624bdff86707 Matthew Brost         2025-03-05  1578  				}
37ad039fb3674a Matthew Brost         2026-04-10  1579  			}
99624bdff86707 Matthew Brost         2025-03-05  1580 =20
f70da6f99d4f40 Matthew Auld          2025-08-28  1581  			svm_pages->dma_ad=
dr[j] =3D drm_pagemap_addr_encode
99624bdff86707 Matthew Brost         2025-03-05  1582  				(addr, DRM_INTER=
CONNECT_SYSTEM, order,
ad70e289ed4b1f Matthew Auld          2025-08-28  1583  				 dma_dir);
99624bdff86707 Matthew Brost         2025-03-05  1584  		}
99624bdff86707 Matthew Brost         2025-03-05  1585  		i +=3D 1 << order;
99624bdff86707 Matthew Brost         2025-03-05  1586  		num_dma_mapped =3D =
i;
a9ac0fa455b050 Matthew Brost         2025-05-12  1587  		flags.has_dma_mapp=
ing =3D true;
99624bdff86707 Matthew Brost         2025-03-05  1588  	}
99624bdff86707 Matthew Brost         2025-03-05  1589 =20
37ad039fb3674a Matthew Brost         2026-04-10  1590  	if (dma_use_iova(st=
ate)) {
37ad039fb3674a Matthew Brost         2026-04-10  1591  		err =3D dma_iova_s=
ync(gpusvm->drm->dev, state, 0,
37ad039fb3674a Matthew Brost         2026-04-10  1592  				    svm_pages->s=
tate_offset);
37ad039fb3674a Matthew Brost         2026-04-10  1593  		if (err)
37ad039fb3674a Matthew Brost         2026-04-10  1594  			goto err_unmap;
37ad039fb3674a Matthew Brost         2026-04-10  1595  	}
37ad039fb3674a Matthew Brost         2026-04-10  1596 =20
f86ad0ed620cb3 Matthew Brost         2025-06-19  1597  	if (pagemap) {
a9ac0fa455b050 Matthew Brost         2025-05-12  1598  		flags.has_devmem_p=
ages =3D true;
a599b98607decd Thomas Hellstr=C3=B6m      2025-12-19  1599  		drm_pagemap_g=
et(dpagemap);
a599b98607decd Thomas Hellstr=C3=B6m      2025-12-19  1600  		drm_pagemap_p=
ut(svm_pages->dpagemap);
f70da6f99d4f40 Matthew Auld          2025-08-28  1601  		svm_pages->dpagema=
p =3D dpagemap;
99624bdff86707 Matthew Brost         2025-03-05  1602  	}
99624bdff86707 Matthew Brost         2025-03-05  1603 =20
a9ac0fa455b050 Matthew Brost         2025-05-12  1604  	/* WRITE_ONCE pairs=
 with READ_ONCE for opportunistic checks */
f70da6f99d4f40 Matthew Auld          2025-08-28  1605  	WRITE_ONCE(svm_page=
s->flags.__flags, flags.__flags);
a9ac0fa455b050 Matthew Brost         2025-05-12  1606 =20
99624bdff86707 Matthew Brost         2025-03-05  1607  	drm_gpusvm_notifier=
_unlock(gpusvm);
99624bdff86707 Matthew Brost         2025-03-05  1608  	kvfree(pfns);
99624bdff86707 Matthew Brost         2025-03-05  1609  set_seqno:
f70da6f99d4f40 Matthew Auld          2025-08-28  1610  	svm_pages->notifier=
_seq =3D hmm_range.notifier_seq;
99624bdff86707 Matthew Brost         2025-03-05  1611 =20
99624bdff86707 Matthew Brost         2025-03-05  1612  	return 0;
99624bdff86707 Matthew Brost         2025-03-05  1613 =20
99624bdff86707 Matthew Brost         2025-03-05  1614  err_unmap:
556dba95473900 Matthew Brost         2026-01-30  1615  	svm_pages->flags.ha=
s_dma_mapping =3D true;
6364afd532bcab Matthew Auld          2025-08-28  1616  	__drm_gpusvm_unmap_=
pages(gpusvm, svm_pages, num_dma_mapped);
99624bdff86707 Matthew Brost         2025-03-05  1617  	drm_gpusvm_notifier=
_unlock(gpusvm);
99624bdff86707 Matthew Brost         2025-03-05  1618  err_free:
99624bdff86707 Matthew Brost         2025-03-05  1619  	kvfree(pfns);
99624bdff86707 Matthew Brost         2025-03-05  1620  	if (err =3D=3D -EAG=
AIN)
99624bdff86707 Matthew Brost         2025-03-05  1621  		goto retry;
99624bdff86707 Matthew Brost         2025-03-05  1622  	return err;
99624bdff86707 Matthew Brost         2025-03-05  1623  }
83f706ecbde1df Matthew Auld          2025-08-28  1624  EXPORT_SYMBOL_GPL(dr=
m_gpusvm_get_pages);
6364afd532bcab Matthew Auld          2025-08-28  1625 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
