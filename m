Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD2328003A
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Jan 2026 20:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768076063; cv=none; b=BHfEDunW55c76CojHr7N66zkVdMqpnrVEqMynywiSVhmGLBgR/bY3yNvpaDe2stI6h8NJgNbFgTrM3Pe2AjJf1I/E4FRUGlMhudibZPajVPFh5Vq5fuQzV5uCqTfCkJU/3bX/PRL4VhuNJodXqriZXRUR+zO8QhvGH9eXfayRmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768076063; c=relaxed/simple;
	bh=s8Ta6s0Ik8GXB0yCTq2gqO2p/cb1XkGHbeDTYTRMLEU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kwmOKh01iREOHCLT9DNxOlSJM21AGDGwC3apnWoEcZzWMw5Fe6z5CMVkCF3aOaRsds84DQAoX5t/jbOzj98h8+yRAuVthmO7evm19IKvvA4V6IUWXzwqxIWgXsUmvFJjGe8b5n1oRbhY9nCF5Fwj6IycWiVguZILywdBtEO2EGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GbW9zCNW; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GbW9zCNW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768076061; x=1799612061;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=s8Ta6s0Ik8GXB0yCTq2gqO2p/cb1XkGHbeDTYTRMLEU=;
  b=GbW9zCNWjmMbC1cbt9VPbmbJATkI/saRaQXSR4UCPZMsVbIsKj/IRIox
   cNxRn5eLKrI/b4mZKK9eaGKZeYEtiD1jm+TKXPgpk01Tt+e2ntIxWRF/x
   /PTKRDHcBnDW11EYi1AQKQ5LY4rJacE+8Td9gWf40JIf0G1xkoVIiImqN
   ompqvYFoWxH1ZJGNkRpn8CFgp+7ade54S8qmI1opso5tQHv1OAwiOf+k4
   UInbLUOZERFa5RxYwWOETjp4aiEHD0/1lKMTtujw3tb67zCYv967L0Oyk
   B+tSXfS3p5NWXaFMGdxkd+nV/ClQnne9Dk5iH72fhBe8yjYF4IUCwche6
   g==;
X-CSE-ConnectionGUID: O1bCuQiPRbCcRm/Qbdqdsg==
X-CSE-MsgGUID: td4evDN4QkWtcYjz4fmklw==
X-IronPort-AV: E=McAfee;i="6800,10657,11667"; a="94890678"
X-IronPort-AV: E=Sophos;i="6.21,217,1763452800"; 
   d="scan'208";a="94890678"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 12:14:20 -0800
X-CSE-ConnectionGUID: T36RsiD5SMSoKxz2NYowBw==
X-CSE-MsgGUID: zf1CD46dQMWJwkuiRon+/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,217,1763452800"; 
   d="scan'208";a="207885673"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Jan 2026 12:14:19 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vefLl-0000000097c-023k;
	Sat, 10 Jan 2026 20:14:17 +0000
Date: Sun, 11 Jan 2026 04:13:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/drm_gpusvm.c:933
 drm_gpusvm_range_chunk_size() error: uninitialized symbol 'end'.
Message-ID: <202601110432.5RH1Bfes-lkp@intel.com>
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
head:   97313d6113ab4362ad15076f65560e65288fbcb8
commit: d438d273417055241ebaaf1ba3be23459fc27cba mm: remove devmap related =
functions and page table bits
date:   6 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 6 months ago
config: s390-randconfig-r072-20260109 (https://download.01.org/0day-ci/arch=
ive/20260111/202601110432.5RH1Bfes-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8=
addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601110432.5RH1Bfes-lkp@intel.com/

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
