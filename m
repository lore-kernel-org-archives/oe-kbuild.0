Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E3F346786
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Jan 2026 06:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768028259; cv=none; b=kPQ4T43v8Z/AFqdiF3SnopTw2VJJL9hZjVx0/b7uitvV3s4kmuJHO0yBCShHYPtKYlJmiw1ULVwXl4LYD1KW3vna6j5mbfAmES269KoV7gk+IBdN5K6R+zlYIUOS5mJs9iCsCPAUezCvszKrZ3P/v6wpa/6Xqt9rJnupc6b4ru0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768028259; c=relaxed/simple;
	bh=GTp4Rva0LhUHPMZdapZPXWr7ieJzGZxSCGM2Z6hkskQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MXwyQL+pvf+1MkJs08xeVbaTrwoGcPWKN+9jrs182ikLldOW7tmBaSHyXGV+9Fl9ZfCRMV9pnx57ulWc0wqap+JDjY4qRCL+nU+X76VnLrcZ9UwBopJGsHrkb1T37dC36jp+sLpgJYQbGX9uS1vfhlPTh6zgz9zZOqMvG+MZbdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L/lkYckF; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L/lkYckF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768028255; x=1799564255;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=GTp4Rva0LhUHPMZdapZPXWr7ieJzGZxSCGM2Z6hkskQ=;
  b=L/lkYckFO31RorDTDW7Qr0+AFZyucUJoeBkCxftP1FC3m7bfpvgE/hJx
   9yhYdm9PRPr0L/BYZOQaypx4shwUAp7Iy1MTqLhlECGefcCiQhoZw4LSf
   aEwLxo5AOB5yCgbVx607j/qmKwlmTdKuFQBljwiSM+zWthrvxk9v0OLau
   OiD2JWFbxZ4ebQQ8VlxwH3nnphWgEWClFB23RRjdETJu8K8PU7L8MO11l
   1PPewfRZLVSO2xOnpOLeAWA4CE69niq72tJ2GXy07iGrSZsTAfdlJU+Cl
   3o+c7Xo2g3WtTF8u1j23TTTKMKgwI2aPeoTuQXLKJuRd3Onx2Ex+pzY+L
   A==;
X-CSE-ConnectionGUID: Sad7ljLSQAS1f4N+1CYAKw==
X-CSE-MsgGUID: 0x8ZqpbkTM+l7aY8mJz6GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="86817249"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="86817249"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 22:57:34 -0800
X-CSE-ConnectionGUID: mMlqhYSTRWur/P+XCha+Bw==
X-CSE-MsgGUID: qYC1uBDCQVKwQPbqJYryRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="207790009"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Jan 2026 22:57:33 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veSuh-000000008OS-19gu;
	Sat, 10 Jan 2026 06:57:31 +0000
Date: Sat, 10 Jan 2026 14:57:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/drm_gpusvm.c:933
 drm_gpusvm_range_chunk_size() error: uninitialized symbol 'end'.
Message-ID: <202601101402.IFPyfaRc-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Alistair Popple <apopple@nvidia.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: "Bj=C3=B6rn T=C3=B6pel" <bjorn@rivosinc.com>
CC: Jason Gunthorpe <jgg@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   cb2076b0910f3b19036ec7d50530113fcb9736c8
commit: d438d273417055241ebaaf1ba3be23459fc27cba mm: remove devmap related =
functions and page table bits
date:   6 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 6 months ago
config: s390-randconfig-r072-20260109 (https://download.01.org/0day-ci/arch=
ive/20260110/202601101402.IFPyfaRc-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8=
addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601101402.IFPyfaRc-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/drm_gpusvm.c:933 drm_gpusvm_range_chunk_size() error: unini=
tialized symbol 'end'.
drivers/gpu/drm/drm_gpusvm.c:933 drm_gpusvm_range_chunk_size() error: unini=
tialized symbol 'start'.

Old smatch warnings:
drivers/gpu/drm/drm_gpusvm.c:1427 drm_gpusvm_range_get_pages() error: unini=
tialized symbol 'pagemap'.
drivers/gpu/drm/drm_gpusvm.c:1446 drm_gpusvm_range_get_pages() error: unini=
tialized symbol 'dpagemap'.

vim +/end +933 drivers/gpu/drm/drm_gpusvm.c

99624bdff86707 Matthew Brost 2025-03-05  885 =20
99624bdff86707 Matthew Brost 2025-03-05  886  /**
99624bdff86707 Matthew Brost 2025-03-05  887   * drm_gpusvm_range_chunk_siz=
e() - Determine chunk size for GPU SVM range
99624bdff86707 Matthew Brost 2025-03-05  888   * @gpusvm: Pointer to the GP=
U SVM structure
99624bdff86707 Matthew Brost 2025-03-05  889   * @notifier: Pointer to the =
GPU SVM notifier structure
99624bdff86707 Matthew Brost 2025-03-05  890   * @vas: Pointer to the virtu=
al memory area structure
99624bdff86707 Matthew Brost 2025-03-05  891   * @fault_addr: Fault address
99624bdff86707 Matthew Brost 2025-03-05  892   * @gpuva_start: Start addres=
s of GPUVA which mirrors CPU
99624bdff86707 Matthew Brost 2025-03-05  893   * @gpuva_end: End address of=
 GPUVA which mirrors CPU
99624bdff86707 Matthew Brost 2025-03-05  894   * @check_pages_threshold: Ch=
eck CPU pages for present threshold
99624bdff86707 Matthew Brost 2025-03-05  895   *
99624bdff86707 Matthew Brost 2025-03-05  896   * This function determines t=
he chunk size for the GPU SVM range based on the
99624bdff86707 Matthew Brost 2025-03-05  897   * fault address, GPU SVM chu=
nk sizes, existing GPU SVM ranges, and the virtual
99624bdff86707 Matthew Brost 2025-03-05  898   * memory area boundaries.
99624bdff86707 Matthew Brost 2025-03-05  899   *
99624bdff86707 Matthew Brost 2025-03-05  900   * Return: Chunk size on succ=
ess, LONG_MAX on failure.
99624bdff86707 Matthew Brost 2025-03-05  901   */
99624bdff86707 Matthew Brost 2025-03-05  902  static unsigned long
99624bdff86707 Matthew Brost 2025-03-05  903  drm_gpusvm_range_chunk_size(s=
truct drm_gpusvm *gpusvm,
99624bdff86707 Matthew Brost 2025-03-05  904  			    struct drm_gpusvm_noti=
fier *notifier,
99624bdff86707 Matthew Brost 2025-03-05  905  			    struct vm_area_struct =
*vas,
99624bdff86707 Matthew Brost 2025-03-05  906  			    unsigned long fault_ad=
dr,
99624bdff86707 Matthew Brost 2025-03-05  907  			    unsigned long gpuva_st=
art,
99624bdff86707 Matthew Brost 2025-03-05  908  			    unsigned long gpuva_en=
d,
99624bdff86707 Matthew Brost 2025-03-05  909  			    unsigned long check_pa=
ges_threshold)
99624bdff86707 Matthew Brost 2025-03-05  910  {
99624bdff86707 Matthew Brost 2025-03-05  911  	unsigned long start, end;
99624bdff86707 Matthew Brost 2025-03-05  912  	int i =3D 0;
99624bdff86707 Matthew Brost 2025-03-05  913 =20
99624bdff86707 Matthew Brost 2025-03-05  914  retry:
99624bdff86707 Matthew Brost 2025-03-05  915  	for (; i < gpusvm->num_chunk=
s; ++i) {
99624bdff86707 Matthew Brost 2025-03-05  916  		start =3D ALIGN_DOWN(fault_=
addr, gpusvm->chunk_sizes[i]);
99624bdff86707 Matthew Brost 2025-03-05  917  		end =3D ALIGN(fault_addr + =
1, gpusvm->chunk_sizes[i]);
99624bdff86707 Matthew Brost 2025-03-05  918 =20
99624bdff86707 Matthew Brost 2025-03-05  919  		if (start >=3D vas->vm_star=
t && end <=3D vas->vm_end &&
99624bdff86707 Matthew Brost 2025-03-05  920  		    start >=3D drm_gpusvm_n=
otifier_start(notifier) &&
99624bdff86707 Matthew Brost 2025-03-05  921  		    end <=3D drm_gpusvm_not=
ifier_end(notifier) &&
99624bdff86707 Matthew Brost 2025-03-05  922  		    start >=3D gpuva_start =
&& end <=3D gpuva_end)
99624bdff86707 Matthew Brost 2025-03-05  923  			break;
99624bdff86707 Matthew Brost 2025-03-05  924  	}
99624bdff86707 Matthew Brost 2025-03-05  925 =20
99624bdff86707 Matthew Brost 2025-03-05  926  	if (i =3D=3D gpusvm->num_chu=
nks)
99624bdff86707 Matthew Brost 2025-03-05  927  		return LONG_MAX;
99624bdff86707 Matthew Brost 2025-03-05  928 =20
99624bdff86707 Matthew Brost 2025-03-05  929  	/*
99624bdff86707 Matthew Brost 2025-03-05  930  	 * If allocation more than p=
age, ensure not to overlap with existing
99624bdff86707 Matthew Brost 2025-03-05  931  	 * ranges.
99624bdff86707 Matthew Brost 2025-03-05  932  	 */
99624bdff86707 Matthew Brost 2025-03-05 @933  	if (end - start !=3D SZ_4K) {
99624bdff86707 Matthew Brost 2025-03-05  934  		struct drm_gpusvm_range *ra=
nge;
99624bdff86707 Matthew Brost 2025-03-05  935 =20
99624bdff86707 Matthew Brost 2025-03-05  936  		range =3D drm_gpusvm_range_=
find(notifier, start, end);
99624bdff86707 Matthew Brost 2025-03-05  937  		if (range) {
99624bdff86707 Matthew Brost 2025-03-05  938  			++i;
99624bdff86707 Matthew Brost 2025-03-05  939  			goto retry;
99624bdff86707 Matthew Brost 2025-03-05  940  		}
99624bdff86707 Matthew Brost 2025-03-05  941 =20
99624bdff86707 Matthew Brost 2025-03-05  942  		/*
99624bdff86707 Matthew Brost 2025-03-05  943  		 * XXX: Only create range o=
n pages CPU has faulted in. Without
99624bdff86707 Matthew Brost 2025-03-05  944  		 * this check, or prefault,=
 on BMG 'xe_exec_system_allocator --r
99624bdff86707 Matthew Brost 2025-03-05  945  		 * process-many-malloc' fai=
ls. In the failure case, each process
99624bdff86707 Matthew Brost 2025-03-05  946  		 * mallocs 16k but the CPU =
VMA is ~128k which results in 64k SVM
99624bdff86707 Matthew Brost 2025-03-05  947  		 * ranges. When migrating t=
he SVM ranges, some processes fail in
99624bdff86707 Matthew Brost 2025-03-05  948  		 * drm_gpusvm_migrate_to_de=
vmem with 'migrate.cpages !=3D npages'
99624bdff86707 Matthew Brost 2025-03-05  949  		 * and then upon drm_gpusvm=
_range_get_pages device pages from
99624bdff86707 Matthew Brost 2025-03-05  950  		 * other processes are coll=
ected + faulted in which creates all
99624bdff86707 Matthew Brost 2025-03-05  951  		 * sorts of problems. Unsur=
e exactly how this happening, also
99624bdff86707 Matthew Brost 2025-03-05  952  		 * problem goes away if 'xe=
_exec_system_allocator --r
99624bdff86707 Matthew Brost 2025-03-05  953  		 * process-many-malloc' mal=
locs at least 64k at a time.
99624bdff86707 Matthew Brost 2025-03-05  954  		 */
99624bdff86707 Matthew Brost 2025-03-05  955  		if (end - start <=3D check_=
pages_threshold &&
99624bdff86707 Matthew Brost 2025-03-05  956  		    !drm_gpusvm_check_pages=
(gpusvm, notifier, start, end)) {
99624bdff86707 Matthew Brost 2025-03-05  957  			++i;
99624bdff86707 Matthew Brost 2025-03-05  958  			goto retry;
99624bdff86707 Matthew Brost 2025-03-05  959  		}
99624bdff86707 Matthew Brost 2025-03-05  960  	}
99624bdff86707 Matthew Brost 2025-03-05  961 =20
99624bdff86707 Matthew Brost 2025-03-05  962  	return end - start;
99624bdff86707 Matthew Brost 2025-03-05  963  }
99624bdff86707 Matthew Brost 2025-03-05  964 =20

:::::: The code at line 933 was first introduced by commit
:::::: 99624bdff8670795b678eafa6509aaad3a5c0175 drm/gpusvm: Add support for=
 GPU Shared Virtual Memory

:::::: TO: Matthew Brost <matthew.brost@intel.com>
:::::: CC: Matthew Brost <matthew.brost@intel.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
