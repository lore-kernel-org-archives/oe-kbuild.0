Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5A3376496
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Apr 2026 11:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776857203; cv=none; b=SrS4Gos2zZOUYreDSjZ2iR1dEZH3IIXg53P2Sfo1BDqSvWYn8oUqtdWgpNf6MoVtO5JdNkkcWe37A2A5WCQ8r9/guocMoWd/Z09A7j+pi4nZ69NmajnVqR3adqT8EYlhYKqpu2DJGBVx5WmY8vIIn6og8JEzbvlVE1gmxdsOIB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776857203; c=relaxed/simple;
	bh=5hAIu0ve0HM6P+l/NGMtEWSd17xWt5bFHBpKg+Hhzvw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ArD4A1lcmsrOkjJKs/lyLh1aWoSAV5lfsQA8M4eDi+9+YApjGUA54mKMnFk6c6qy30/SWlj1LcBtWkwOxpwK4mL22UF+XmRjeWnM7fJXOHgtCfjC1/sMKD1abpFlDprM76wd6Gfdm19bgRMQV1gh8QurZdArxtH+MJ/FByFxXGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mS5EZzy+; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mS5EZzy+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776857201; x=1808393201;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5hAIu0ve0HM6P+l/NGMtEWSd17xWt5bFHBpKg+Hhzvw=;
  b=mS5EZzy+K++aqPY5mDGoN2+7SmkRFr/qPI+lp0G7zGbjQuwluzrg54no
   RoHiW0sDzkbTUyhCDYW9XNCBswNKeWPOCYWc3obGb0FFDmHETygjj+934
   PW3RcUlRyWVvii0Ebc2aAJQWqi7qg8gcgqu+/mMTCTMstIJiIgVwjxk/R
   fS1nubhnj5Vf6S8mE7eEpOT8dXsLHUY68pHgkCdd1ZJfsZHPhoAo0cZ9b
   loaCMvLptUYkEs5PzwjC/dzf41gQe/P6ZO6Tg1nSHCMG+otH8+iMzC8pf
   BAe2GEiN3hZT3vl07v2rlvKTXBY41KaesAZ1Dxn0pTGBnu27NSkPv5BFK
   w==;
X-CSE-ConnectionGUID: prK2PmV5QT+PkgwTcxuNLg==
X-CSE-MsgGUID: L59rqqOJTA+3RSBuCv6x8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="88108532"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="88108532"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 04:26:40 -0700
X-CSE-ConnectionGUID: OkSpZOrQTRWVzYIrLsdBbA==
X-CSE-MsgGUID: SQ8EwwQgSSi0xjg8qyZCwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="237323634"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 Apr 2026 04:26:39 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFVj2-000000000cT-2TXw;
	Wed, 22 Apr 2026 11:26:36 +0000
Date: Wed, 22 Apr 2026 19:26:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [kas:uffd/rfc-v3 3/9] fs/userfaultfd.c:1310
 userfaultfd_register() warn: bitwise AND condition is false here
Message-ID: <202604221944.ZEokmyS7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git uffd/=
rfc-v3
head:   85764da82960e6bfbab3a8874331ab72ea5c2020
commit: 83de03a3a2c386eaad4e0a3d87abb452d485ecc8 [3/9] userfaultfd: add UFF=
DIO_REGISTER_MODE_RWP and UFFDIO_RWPROTECT plumbing
:::::: branch date: 24 hours ago
:::::: commit date: 4 days ago
config: arm-randconfig-r073-20260421 (https://download.01.org/0day-ci/archi=
ve/20260422/202604221944.ZEokmyS7-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5ba=
c06718f502014fade905512f1d26d578a18f3)
smatch: v0.5.0-9007-gcf3ea02b

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604221944.ZEokmyS7-lkp@intel.com/

New smatch warnings:
fs/userfaultfd.c:1310 userfaultfd_register() warn: bitwise AND condition is=
 false here

Old smatch warnings:
fs/userfaultfd.c:218 userfault_msg() warn: bitwise AND condition is false h=
ere

vim +1310 fs/userfaultfd.c

2ef5d7245d9cb8 Axel Rasmussen         2023-07-07  1262 =20
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1263  static int userfaul=
tfd_register(struct userfaultfd_ctx *ctx,
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1264  				unsigned long a=
rg)
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1265  {
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1266  	struct mm_struct *=
mm =3D ctx->mm;
a17c7d8fd2b097 Lorenzo Stoakes        2024-07-29  1267  	struct vm_area_str=
uct *vma, *cur;
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1268  	int ret;
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1269  	struct uffdio_regi=
ster uffdio_register;
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1270  	struct uffdio_regi=
ster __user *user_uffdio_register;
bfbe71109fa40e Lorenzo Stoakes        2025-06-18  1271  	vm_flags_t vm_flag=
s;
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1272  	bool found;
ce53e8e6f2cb02 Mike Rapoport          2017-09-06  1273  	bool basic_ioctls;
a17c7d8fd2b097 Lorenzo Stoakes        2024-07-29  1274  	unsigned long star=
t, end;
11a9b90274f6a5 Liam R. Howlett        2023-01-20  1275  	struct vma_iterato=
r vmi;
d61ea1cb009532 Peter Xu               2023-08-21  1276  	bool wp_async =3D =
userfaultfd_wp_async_ctx(ctx);
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1277 =20
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1278  	user_uffdio_regist=
er =3D (struct uffdio_register __user *) arg;
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1279 =20
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1280  	ret =3D -EFAULT;
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1281  	if (copy_from_user=
(&uffdio_register, user_uffdio_register,
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1282  			   sizeof(uffdio=
_register)-sizeof(__u64)))
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1283  		goto out;
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1284 =20
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1285  	ret =3D -EINVAL;
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1286  	if (!uffdio_regist=
er.mode)
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1287  		goto out;
7677f7fd8be766 Axel Rasmussen         2021-05-04  1288  	if (uffdio_registe=
r.mode & ~UFFD_API_REGISTER_MODES)
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1289  		goto out;
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1290  	vm_flags =3D 0;
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1291  	if (uffdio_registe=
r.mode & UFFDIO_REGISTER_MODE_MISSING)
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1292  		vm_flags |=3D VM_=
UFFD_MISSING;
00b151f21f390f Peter Xu               2021-06-30  1293  	if (uffdio_registe=
r.mode & UFFDIO_REGISTER_MODE_WP) {
f59c0924d61aa2 Chunyan Zhang          2025-11-13  1294  		if (!pgtable_supp=
orts_uffd_wp())
00b151f21f390f Peter Xu               2021-06-30  1295  			goto out;
f59c0924d61aa2 Chunyan Zhang          2025-11-13  1296 =20
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1297  		vm_flags |=3D VM_=
UFFD_WP;
00b151f21f390f Peter Xu               2021-06-30  1298  	}
83de03a3a2c386 Kiryl Shutsemau (Meta  2026-04-18  1299) 	if (uffdio_registe=
r.mode & UFFDIO_REGISTER_MODE_RWP) {
83de03a3a2c386 Kiryl Shutsemau (Meta  2026-04-18  1300) 		if (!(ctx->featur=
es & UFFD_FEATURE_RWP))
83de03a3a2c386 Kiryl Shutsemau (Meta  2026-04-18  1301) 			goto out;
83de03a3a2c386 Kiryl Shutsemau (Meta  2026-04-18  1302) 		vm_flags |=3D VM_=
UFFD_RWP;
83de03a3a2c386 Kiryl Shutsemau (Meta  2026-04-18  1303) 	}
83de03a3a2c386 Kiryl Shutsemau (Meta  2026-04-18  1304)=20
83de03a3a2c386 Kiryl Shutsemau (Meta  2026-04-18  1305) 	/*
83de03a3a2c386 Kiryl Shutsemau (Meta  2026-04-18  1306) 	 * WP and RWP shar=
e the uffd-wp PTE bit / marker infrastructure and
83de03a3a2c386 Kiryl Shutsemau (Meta  2026-04-18  1307) 	 * cannot coexist =
in the same VMA =E2=80=94 the bit would carry ambiguous
83de03a3a2c386 Kiryl Shutsemau (Meta  2026-04-18  1308) 	 * semantics. Reje=
ct the combination up front.
83de03a3a2c386 Kiryl Shutsemau (Meta  2026-04-18  1309) 	 */
83de03a3a2c386 Kiryl Shutsemau (Meta  2026-04-18 @1310) 	if ((vm_flags & VM=
_UFFD_WP) && (vm_flags & VM_UFFD_RWP))
83de03a3a2c386 Kiryl Shutsemau (Meta  2026-04-18  1311) 		goto out;
83de03a3a2c386 Kiryl Shutsemau (Meta  2026-04-18  1312)=20
7677f7fd8be766 Axel Rasmussen         2021-05-04  1313  	if (uffdio_registe=
r.mode & UFFDIO_REGISTER_MODE_MINOR) {
7677f7fd8be766 Axel Rasmussen         2021-05-04  1314  #ifndef CONFIG_HAVE=
_ARCH_USERFAULTFD_MINOR
7677f7fd8be766 Axel Rasmussen         2021-05-04  1315  		goto out;
7677f7fd8be766 Axel Rasmussen         2021-05-04  1316  #endif
7677f7fd8be766 Axel Rasmussen         2021-05-04  1317  		vm_flags |=3D VM_=
UFFD_MINOR;
7677f7fd8be766 Axel Rasmussen         2021-05-04  1318  	}
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1319 =20
e71e2ace5721a8 Peter Collingbourne    2021-07-23  1320  	ret =3D validate_r=
ange(mm, uffdio_register.range.start,
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1321  			     uffdio_regi=
ster.range.len);
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1322  	if (ret)
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1323  		goto out;
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1324 =20
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1325  	start =3D uffdio_r=
egister.range.start;
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1326  	end =3D start + uf=
fdio_register.range.len;
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1327 =20
d2005e3f41d4f9 Oleg Nesterov          2016-05-20  1328  	ret =3D -ENOMEM;
d2005e3f41d4f9 Oleg Nesterov          2016-05-20  1329  	if (!mmget_not_zer=
o(mm))
d2005e3f41d4f9 Oleg Nesterov          2016-05-20  1330  		goto out;
d2005e3f41d4f9 Oleg Nesterov          2016-05-20  1331 =20
11a9b90274f6a5 Liam R. Howlett        2023-01-20  1332  	ret =3D -EINVAL;
d8ed45c5dcd455 Michel Lespinasse      2020-06-08  1333  	mmap_write_lock(mm=
);
11a9b90274f6a5 Liam R. Howlett        2023-01-20  1334  	vma_iter_init(&vmi=
, mm, start);
11a9b90274f6a5 Liam R. Howlett        2023-01-20  1335  	vma =3D vma_find(&=
vmi, end);
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1336  	if (!vma)
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1337  		goto out_unlock;
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1338 =20
cab350afcbc9c8 Mike Kravetz           2017-02-22  1339  	/*
cab350afcbc9c8 Mike Kravetz           2017-02-22  1340  	 * If the first vm=
a contains huge pages, make sure start address
cab350afcbc9c8 Mike Kravetz           2017-02-22  1341  	 * is aligned to h=
uge page size.
cab350afcbc9c8 Mike Kravetz           2017-02-22  1342  	 */
cab350afcbc9c8 Mike Kravetz           2017-02-22  1343  	if (is_vm_hugetlb_=
page(vma)) {
cab350afcbc9c8 Mike Kravetz           2017-02-22  1344  		unsigned long vma=
_hpagesize =3D vma_kernel_pagesize(vma);
cab350afcbc9c8 Mike Kravetz           2017-02-22  1345 =20
cab350afcbc9c8 Mike Kravetz           2017-02-22  1346  		if (start & (vma_=
hpagesize - 1))
cab350afcbc9c8 Mike Kravetz           2017-02-22  1347  			goto out_unlock;
cab350afcbc9c8 Mike Kravetz           2017-02-22  1348  	}
cab350afcbc9c8 Mike Kravetz           2017-02-22  1349 =20
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1350  	/*
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1351  	 * Search for not =
compatible vmas.
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1352  	 */
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1353  	found =3D false;
ce53e8e6f2cb02 Mike Rapoport          2017-09-06  1354  	basic_ioctls =3D f=
alse;
11a9b90274f6a5 Liam R. Howlett        2023-01-20  1355  	cur =3D vma;
11a9b90274f6a5 Liam R. Howlett        2023-01-20  1356  	do {
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1357  		cond_resched();
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1358 =20
31defc3b01d907 Tal Zussman            2025-06-19  1359  		VM_WARN_ON_ONCE(!=
!cur->vm_userfaultfd_ctx.ctx ^
7677f7fd8be766 Axel Rasmussen         2021-05-04  1360  				!!(cur->vm_flag=
s & __VM_UFFD_FLAGS));
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1361 =20
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1362  		/* check not comp=
atible vmas */
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1363  		ret =3D -EINVAL;
d61ea1cb009532 Peter Xu               2023-08-21  1364  		if (!vma_can_user=
fault(cur, vm_flags, wp_async))
cab350afcbc9c8 Mike Kravetz           2017-02-22  1365  			goto out_unlock;
29ec90660d68bb Andrea Arcangeli       2018-11-30  1366 =20
29ec90660d68bb Andrea Arcangeli       2018-11-30  1367  		/*
29ec90660d68bb Andrea Arcangeli       2018-11-30  1368  		 * UFFDIO_COPY wi=
ll fill file holes even without
29ec90660d68bb Andrea Arcangeli       2018-11-30  1369  		 * PROT_WRITE. Th=
is check enforces that if this is a
29ec90660d68bb Andrea Arcangeli       2018-11-30  1370  		 * MAP_SHARED, th=
e process has write permission to the backing
29ec90660d68bb Andrea Arcangeli       2018-11-30  1371  		 * file. If VM_MA=
YWRITE is set it also enforces that on a
29ec90660d68bb Andrea Arcangeli       2018-11-30  1372  		 * MAP_SHARED vma=
: there is no F_WRITE_SEAL and no further
29ec90660d68bb Andrea Arcangeli       2018-11-30  1373  		 * F_WRITE_SEAL c=
an be taken until the vma is destroyed.
29ec90660d68bb Andrea Arcangeli       2018-11-30  1374  		 */
29ec90660d68bb Andrea Arcangeli       2018-11-30  1375  		ret =3D -EPERM;
29ec90660d68bb Andrea Arcangeli       2018-11-30  1376  		if (unlikely(!(cu=
r->vm_flags & VM_MAYWRITE)))
29ec90660d68bb Andrea Arcangeli       2018-11-30  1377  			goto out_unlock;
29ec90660d68bb Andrea Arcangeli       2018-11-30  1378 =20
cab350afcbc9c8 Mike Kravetz           2017-02-22  1379  		/*
cab350afcbc9c8 Mike Kravetz           2017-02-22  1380  		 * If this vma co=
ntains ending address, and huge pages
cab350afcbc9c8 Mike Kravetz           2017-02-22  1381  		 * check alignmen=
t.
cab350afcbc9c8 Mike Kravetz           2017-02-22  1382  		 */
cab350afcbc9c8 Mike Kravetz           2017-02-22  1383  		if (is_vm_hugetlb=
_page(cur) && end <=3D cur->vm_end &&
cab350afcbc9c8 Mike Kravetz           2017-02-22  1384  		    end > cur->vm=
_start) {
cab350afcbc9c8 Mike Kravetz           2017-02-22  1385  			unsigned long vm=
a_hpagesize =3D vma_kernel_pagesize(cur);
cab350afcbc9c8 Mike Kravetz           2017-02-22  1386 =20
cab350afcbc9c8 Mike Kravetz           2017-02-22  1387  			ret =3D -EINVAL;
cab350afcbc9c8 Mike Kravetz           2017-02-22  1388 =20
cab350afcbc9c8 Mike Kravetz           2017-02-22  1389  			if (end & (vma_h=
pagesize - 1))
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1390  				goto out_unlock;
cab350afcbc9c8 Mike Kravetz           2017-02-22  1391  		}
63b2d4174c4ad1 Andrea Arcangeli       2020-04-06  1392  		if ((vm_flags & V=
M_UFFD_WP) && !(cur->vm_flags & VM_MAYWRITE))
63b2d4174c4ad1 Andrea Arcangeli       2020-04-06  1393  			goto out_unlock;
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1394 =20
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1395  		/*
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1396  		 * Check that thi=
s vma isn't already owned by a
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1397  		 * different user=
faultfd. We can't allow more than one
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1398  		 * userfaultfd to=
 own a single vma simultaneously or we
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1399  		 * wouldn't know =
which one to deliver the userfaults to.
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1400  		 */
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1401  		ret =3D -EBUSY;
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1402  		if (cur->vm_userf=
aultfd_ctx.ctx &&
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1403  		    cur->vm_userf=
aultfd_ctx.ctx !=3D ctx)
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1404  			goto out_unlock;
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1405 =20
cab350afcbc9c8 Mike Kravetz           2017-02-22  1406  		/*
cab350afcbc9c8 Mike Kravetz           2017-02-22  1407  		 * Note vmas cont=
aining huge pages
cab350afcbc9c8 Mike Kravetz           2017-02-22  1408  		 */
ce53e8e6f2cb02 Mike Rapoport          2017-09-06  1409  		if (is_vm_hugetlb=
_page(cur))
ce53e8e6f2cb02 Mike Rapoport          2017-09-06  1410  			basic_ioctls =3D =
true;
cab350afcbc9c8 Mike Kravetz           2017-02-22  1411 =20
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1412  		found =3D true;
11a9b90274f6a5 Liam R. Howlett        2023-01-20  1413  	} for_each_vma_ran=
ge(vmi, cur, end);
31defc3b01d907 Tal Zussman            2025-06-19  1414  	VM_WARN_ON_ONCE(!f=
ound);
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1415 =20
a17c7d8fd2b097 Lorenzo Stoakes        2024-07-29  1416  	ret =3D userfaultf=
d_register_range(ctx, vma, vm_flags, start, end,
a17c7d8fd2b097 Lorenzo Stoakes        2024-07-29  1417  					 wp_async);
11a9b90274f6a5 Liam R. Howlett        2023-01-20  1418 =20
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1419  out_unlock:
d8ed45c5dcd455 Michel Lespinasse      2020-06-08  1420  	mmap_write_unlock(=
mm);
d2005e3f41d4f9 Oleg Nesterov          2016-05-20  1421  	mmput(mm);
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1422  	if (!ret) {
14819305e09fe4 Peter Xu               2020-04-06  1423  		__u64 ioctls_out;
14819305e09fe4 Peter Xu               2020-04-06  1424 =20
14819305e09fe4 Peter Xu               2020-04-06  1425  		ioctls_out =3D ba=
sic_ioctls ? UFFD_API_RANGE_IOCTLS_BASIC :
14819305e09fe4 Peter Xu               2020-04-06  1426  		    UFFD_API_RANG=
E_IOCTLS;
14819305e09fe4 Peter Xu               2020-04-06  1427 =20
14819305e09fe4 Peter Xu               2020-04-06  1428  		/*
14819305e09fe4 Peter Xu               2020-04-06  1429  		 * Declare the WP=
 ioctl only if the WP mode is
14819305e09fe4 Peter Xu               2020-04-06  1430  		 * specified and =
all checks passed with the range
14819305e09fe4 Peter Xu               2020-04-06  1431  		 */
14819305e09fe4 Peter Xu               2020-04-06  1432  		if (!(uffdio_regi=
ster.mode & UFFDIO_REGISTER_MODE_WP))
14819305e09fe4 Peter Xu               2020-04-06  1433  			ioctls_out &=3D =
~((__u64)1 << _UFFDIO_WRITEPROTECT);
14819305e09fe4 Peter Xu               2020-04-06  1434 =20
f619147104c8ea Axel Rasmussen         2021-05-04  1435  		/* CONTINUE ioctl=
 is only supported for MINOR ranges. */
f619147104c8ea Axel Rasmussen         2021-05-04  1436  		if (!(uffdio_regi=
ster.mode & UFFDIO_REGISTER_MODE_MINOR))
f619147104c8ea Axel Rasmussen         2021-05-04  1437  			ioctls_out &=3D =
~((__u64)1 << _UFFDIO_CONTINUE);
f619147104c8ea Axel Rasmussen         2021-05-04  1438 =20
83de03a3a2c386 Kiryl Shutsemau (Meta  2026-04-18  1439) 		/* RWPROTECT is o=
nly supported for RWP ranges */
83de03a3a2c386 Kiryl Shutsemau (Meta  2026-04-18  1440) 		if (!(uffdio_regi=
ster.mode & UFFDIO_REGISTER_MODE_RWP))
83de03a3a2c386 Kiryl Shutsemau (Meta  2026-04-18  1441) 			ioctls_out &=3D =
~((__u64)1 << _UFFDIO_RWPROTECT);
83de03a3a2c386 Kiryl Shutsemau (Meta  2026-04-18  1442)=20
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1443  		/*
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1444  		 * Now that we sc=
anned all vmas we can already tell
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1445  		 * userland which=
 ioctls methods are guaranteed to
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1446  		 * succeed on thi=
s range.
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1447  		 */
14819305e09fe4 Peter Xu               2020-04-06  1448  		if (put_user(ioct=
ls_out, &user_uffdio_register->ioctls))
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1449  			ret =3D -EFAULT;
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1450  	}
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1451  out:
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1452  	return ret;
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1453  }
86039bd3b4e6a1 Andrea Arcangeli       2015-09-04  1454 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
