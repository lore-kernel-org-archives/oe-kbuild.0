Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0639B3A0B28
	for <oe-kbuild@lists.linux.dev>; Thu, 15 Jan 2026 13:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768483030; cv=none; b=JnGeI9tJPwDosvOyog/LJXyFhFIvaTupAcUh3o5mxuFj+rjPZyI2gS5VcTpIGzryjYpoBZiB+zgTLYaGP/tuKnBr2FIzM3PIwUr7z2tLeMQyK41/wTXov5TVmMX2y4WOqpuUPUh8lzz+PGQx8nT7MpLdu/KB4ST2s/Ig7XeE8SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768483030; c=relaxed/simple;
	bh=lgDneLMt+2GC4Aj8FjtJqvO6irD/zxgvBRJaaN9GSAE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WrexRVTlj0XJRFA4A+afKuwR2c9n/HvrVkFVy3rVdLfiucWol4R3LinzNTDfdMbDIiHALrORGlxi0U5SmSEn0Adm5LWwhYyxdH93Fx5x6VR2hZUjvLpvnzn/jy0nFmiUxI16SMcF8rh374UvuFI2w87IvRZ++jq/SEAxhNPv2NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IQFMqpvA; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IQFMqpvA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768483029; x=1800019029;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=lgDneLMt+2GC4Aj8FjtJqvO6irD/zxgvBRJaaN9GSAE=;
  b=IQFMqpvAEg8VuIbQQP0OEsvyJ27PuVOl0nX3UfgoufeHiWWQ5Wye7lzN
   OHrsq1vq1xsLfyTUF3PPsg7g81oKdq3Mxx0uJxN6FIUSqlVpWcE0FVJPn
   lbqa1asr13D0+P4zDGyoFIPSOFf+8AMaZu+v4mk0H/FvV542gAK2uEZJV
   dyAnEamQ0YP2GuZy8/yJPQApffYLlVFudlAy3y3/Hace0cvzsI/2SPA0e
   NPKs/4ekDWQLuUlwt86rYK3d1ZUoICIo5wd04MmiG8zTiHxhzE9h5eUre
   AFpZMrc+cs+IwVqorcPSBDnZuiIXaAiIAW48vJfCwzTh0f7/9ljwcs3Pt
   A==;
X-CSE-ConnectionGUID: 5Zz7SxunSPmDFYURwG6ZTg==
X-CSE-MsgGUID: rvootgD2Roq1KS3kQOF8Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="81151176"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="81151176"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 05:17:07 -0800
X-CSE-ConnectionGUID: xC0Z3IzASfGUtKesRUBnVA==
X-CSE-MsgGUID: 8h7FSpRpQW2j7xUmZ9fmbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="242493064"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 15 Jan 2026 05:17:05 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgNDi-00000000Hzh-2dEG;
	Thu, 15 Jan 2026 13:17:02 +0000
Date: Thu, 15 Jan 2026 21:16:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: lib/test_hmm.c:932 dmirror_migrate_to_system() error:
 uninitialized symbol 'ret'.
Message-ID: <202601152125.McLpiKxS-lkp@intel.com>
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
head:   944aacb68baf7624ab8d277d0ebf07f025ca137c
commit: d438d273417055241ebaaf1ba3be23459fc27cba mm: remove devmap related =
functions and page table bits
date:   6 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 6 months ago
config: s390-randconfig-r071-20260115 (https://download.01.org/0day-ci/arch=
ive/20260115/202601152125.McLpiKxS-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8=
addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601152125.McLpiKxS-lkp@intel.com/

smatch warnings:
lib/test_hmm.c:932 dmirror_migrate_to_system() error: uninitialized symbol =
'ret'.

vim +/ret +932 lib/test_hmm.c

4c2e0f764eb4444 Alex Sierra     2022-07-15  874 =20
4c2e0f764eb4444 Alex Sierra     2022-07-15  875  static int dmirror_migrate=
_to_system(struct dmirror *dmirror,
4c2e0f764eb4444 Alex Sierra     2022-07-15  876  				     struct hmm_dmirro=
r_cmd *cmd)
4c2e0f764eb4444 Alex Sierra     2022-07-15  877  {
4c2e0f764eb4444 Alex Sierra     2022-07-15  878  	unsigned long start, end,=
 addr;
4c2e0f764eb4444 Alex Sierra     2022-07-15  879  	unsigned long size =3D cm=
d->npages << PAGE_SHIFT;
4c2e0f764eb4444 Alex Sierra     2022-07-15  880  	struct mm_struct *mm =3D =
dmirror->notifier.mm;
4c2e0f764eb4444 Alex Sierra     2022-07-15  881  	struct vm_area_struct *vm=
a;
6046a3bed1c2b02 Arnd Bergmann   2025-06-10  882  	unsigned long src_pfns[32=
] =3D { 0 };
6046a3bed1c2b02 Arnd Bergmann   2025-06-10  883  	unsigned long dst_pfns[32=
] =3D { 0 };
16ce101db85db69 Alistair Popple 2022-09-28  884  	struct migrate_vma args =
=3D { 0 };
4c2e0f764eb4444 Alex Sierra     2022-07-15  885  	unsigned long next;
4c2e0f764eb4444 Alex Sierra     2022-07-15  886  	int ret;
4c2e0f764eb4444 Alex Sierra     2022-07-15  887 =20
4c2e0f764eb4444 Alex Sierra     2022-07-15  888  	start =3D cmd->addr;
4c2e0f764eb4444 Alex Sierra     2022-07-15  889  	end =3D start + size;
4c2e0f764eb4444 Alex Sierra     2022-07-15  890  	if (end < start)
4c2e0f764eb4444 Alex Sierra     2022-07-15  891  		return -EINVAL;
4c2e0f764eb4444 Alex Sierra     2022-07-15  892 =20
4c2e0f764eb4444 Alex Sierra     2022-07-15  893  	/* Since the mm is for th=
e mirrored process, get a reference first. */
4c2e0f764eb4444 Alex Sierra     2022-07-15  894  	if (!mmget_not_zero(mm))
4c2e0f764eb4444 Alex Sierra     2022-07-15  895  		return -EINVAL;
4c2e0f764eb4444 Alex Sierra     2022-07-15  896 =20
4c2e0f764eb4444 Alex Sierra     2022-07-15  897  	cmd->cpages =3D 0;
4c2e0f764eb4444 Alex Sierra     2022-07-15  898  	mmap_read_lock(mm);
4c2e0f764eb4444 Alex Sierra     2022-07-15  899  	for (addr =3D start; addr=
 < end; addr =3D next) {
4c2e0f764eb4444 Alex Sierra     2022-07-15  900  		vma =3D vma_lookup(mm, a=
ddr);
4c2e0f764eb4444 Alex Sierra     2022-07-15  901  		if (!vma || !(vma->vm_fl=
ags & VM_READ)) {
4c2e0f764eb4444 Alex Sierra     2022-07-15  902  			ret =3D -EINVAL;
4c2e0f764eb4444 Alex Sierra     2022-07-15  903  			goto out;
4c2e0f764eb4444 Alex Sierra     2022-07-15  904  		}
4c2e0f764eb4444 Alex Sierra     2022-07-15  905  		next =3D min(end, addr +=
 (ARRAY_SIZE(src_pfns) << PAGE_SHIFT));
4c2e0f764eb4444 Alex Sierra     2022-07-15  906  		if (next > vma->vm_end)
4c2e0f764eb4444 Alex Sierra     2022-07-15  907  			next =3D vma->vm_end;
4c2e0f764eb4444 Alex Sierra     2022-07-15  908 =20
4c2e0f764eb4444 Alex Sierra     2022-07-15  909  		args.vma =3D vma;
4c2e0f764eb4444 Alex Sierra     2022-07-15  910  		args.src =3D src_pfns;
4c2e0f764eb4444 Alex Sierra     2022-07-15  911  		args.dst =3D dst_pfns;
4c2e0f764eb4444 Alex Sierra     2022-07-15  912  		args.start =3D addr;
4c2e0f764eb4444 Alex Sierra     2022-07-15  913  		args.end =3D next;
4c2e0f764eb4444 Alex Sierra     2022-07-15  914  		args.pgmap_owner =3D dmi=
rror->mdevice;
4c2e0f764eb4444 Alex Sierra     2022-07-15  915  		args.flags =3D dmirror_s=
elect_device(dmirror);
4c2e0f764eb4444 Alex Sierra     2022-07-15  916 =20
4c2e0f764eb4444 Alex Sierra     2022-07-15  917  		ret =3D migrate_vma_setu=
p(&args);
4c2e0f764eb4444 Alex Sierra     2022-07-15  918  		if (ret)
4c2e0f764eb4444 Alex Sierra     2022-07-15  919  			goto out;
4c2e0f764eb4444 Alex Sierra     2022-07-15  920 =20
4c2e0f764eb4444 Alex Sierra     2022-07-15  921  		pr_debug("Migrating from=
 device mem to sys mem\n");
4c2e0f764eb4444 Alex Sierra     2022-07-15  922  		dmirror_devmem_fault_all=
oc_and_copy(&args, dmirror);
4c2e0f764eb4444 Alex Sierra     2022-07-15  923 =20
4c2e0f764eb4444 Alex Sierra     2022-07-15  924  		migrate_vma_pages(&args);
4c2e0f764eb4444 Alex Sierra     2022-07-15  925  		cmd->cpages +=3D dmirror=
_successful_migrated_pages(&args);
4c2e0f764eb4444 Alex Sierra     2022-07-15  926  		migrate_vma_finalize(&ar=
gs);
4c2e0f764eb4444 Alex Sierra     2022-07-15  927  	}
4c2e0f764eb4444 Alex Sierra     2022-07-15  928  out:
4c2e0f764eb4444 Alex Sierra     2022-07-15  929  	mmap_read_unlock(mm);
4c2e0f764eb4444 Alex Sierra     2022-07-15  930  	mmput(mm);
4c2e0f764eb4444 Alex Sierra     2022-07-15  931 =20
4c2e0f764eb4444 Alex Sierra     2022-07-15 @932  	return ret;
4c2e0f764eb4444 Alex Sierra     2022-07-15  933  }
4c2e0f764eb4444 Alex Sierra     2022-07-15  934 =20

:::::: The code at line 932 was first introduced by commit
:::::: 4c2e0f764eb4444272cfd2fa4afeb84c453a1a34 lib: add support for device=
 coherent type in test_hmm

:::::: TO: Alex Sierra <alex.sierra@amd.com>
:::::: CC: akpm <akpm@linux-foundation.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
