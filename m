Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659408;
	b=4BFGbdZUHIoXurNhJAefLk+SQX8M68y+3hPM/oZlwz42zouY5H5FVpcxM7pQrFZ6rpye
	 h82F0gIbUH3MmdzKkvQunyrBqtbW6/K5gC87J7ipv2ZLApgo1KgqPDLyFIORPPU6QpgAJ
	 pk5hRceXX/MKquUErGQrwDI8qFuSekPT7eVv79C1KJSHAWV9qavv2AkAL2+C9eetcfm1d
	 lINrQOJcoJ+j6heTUcb0HL+wrP3OF9Wn8WW/LaMtDz8nnBTIdmYAtmg8cmTJ/hew5ZKCz
	 iiUj2fR6UcSMsNjF+jdW4x9z7FS/Jxb0pCcz7V+pASDDX4rGKkglcDyz1fDA1cTCqKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659408;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=H9JgHPO2zSJUJwagLsbCxzO/BBhWd0WEC+7SFI3paWo=;
	b=IC7l29589VzEUs0tsnkyfZahmDxjdFrukNjI8dSplMJI6Gph1Sxtor9ZU8SwYvWhqOni
	 fIawvxean6Of1bNDXQ6f9CwCGtUwF72dqD6pOtWSu28geOA78hnlJ4RrYAlZIBWxw0o5V
	 kSizfWZB7RpLkPAJfaqGzNa5A4lsb0oDWavoCjPS9XT4ReB48aqW5pSgh2GFsxIUslCmk
	 6W+OHpD3SOFDvIylM95oC1bkP09IzmPNa7xSDg9dSqy6aMgKUvnxJZKIm0a4fMamZ8nUq
	 WhHTeypP3hZn+h0wK5vN4ozz8Rfjo75HZBT49Wi1us6MsFd8IpG53+zPne9np6TJ2CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dCPLtXbe;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3B2606A319
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Oct 2026 08:56:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F3B2606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dCPLtXbe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792659408; x=1824195408;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bzlqKJ12ESL0MwCd8+8nubOuJCqkQIMrI+t5zYPY0rw=;
  b=dCPLtXbe44RtGXzyStA9TT63SpRfMb0pP4XxA4eukcdLtxk2/2QSMcfo
   tR1dnlAC0aXgLdwkjNE3LX5yC1beqirxvarP8u0CBdvb4LGU5Efd7d0hM
   xICcmjukkF664P5h+Pd/3OpdZllRBAausxX2TQafuFl1T1Pv9s9diBUYG
   NycFPmCMe0YtPqlCO2ksiCQq3bWFHAKps/tkByvFTGtVb+vb/GbbylFRS
   cfxCpc83jqz+bkh4rXlX0fY406MVX+y8jwwnmYF075Zt7U+PWodVIAgKz
   fh7GxtGfEaYO/KBj4oqm2sUqtSz9rDaZFxPZTcVEuiDuu2nb+2esOwISt
   g==;
X-CSE-ConnectionGUID: yS5UDPw6Rla9VbsHeQqs0w==
X-CSE-MsgGUID: 1LUv0EC3Rk6pPOS6w9rwSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1273583"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1273583"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 01:56:47 -0700
X-CSE-ConnectionGUID: CIjAGi3FSvG/xdnFWXmJ/Q==
X-CSE-MsgGUID: Ly9EVbMtQRmM6BsUtcsaaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3713227"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 22 Oct 2026 01:56:45 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJobL-000000000HT-2p4K;
	Thu, 22 Oct 2026 08:56:43 +0000
Date: Thu, 22 Oct 2026 10:56:16 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-6.1 7/7]
 drivers/gpu/drm/ttm/ttm_bo_vm.c:422 ttm_bo_vm_access() warn: variable
 dereferenced before check 'bo->resource' (see line 415)
Message-ID: <202610221001.wh9JzwNh-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   3ad9f1eca4fa204bb4428fa7f6e8448cee35d055
commit: 4b9944493c6d92d7b29cfd83aaf3deb842b8da79 [7/7] drm/ttm: Avoid NULL =
pointer deref for evicted BOs
:::::: branch date: 24 hours ago
:::::: commit date: 9 months ago
config: i386-randconfig-2200-20261021 (https://download.01.org/0day-ci/arch=
ive/20261022/202610221001.wh9JzwNh-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933=
e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610221001.wh9JzwNh-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/ttm/ttm_bo_vm.c:422 ttm_bo_vm_access() warn: variable deref=
erenced before check 'bo->resource' (see line 415)

vim +422 drivers/gpu/drm/ttm/ttm_bo_vm.c

09ac4fcb3f255e Felix Kuehling      2017-07-13  405 =20
20c012b24340a5 Christian K=C3=B6nig     2019-09-27  406  int ttm_bo_vm_acce=
ss(struct vm_area_struct *vma, unsigned long addr,
09ac4fcb3f255e Felix Kuehling      2017-07-13  407  		     void *buf, int l=
en, int write)
09ac4fcb3f255e Felix Kuehling      2017-07-13  408  {
09ac4fcb3f255e Felix Kuehling      2017-07-13  409  	struct ttm_buffer_obje=
ct *bo =3D vma->vm_private_data;
c0001213d195d1 Felix Kuehling      2020-07-28  410  	unsigned long offset =
=3D (addr) - vma->vm_start +
c0001213d195d1 Felix Kuehling      2020-07-28  411  		((vma->vm_pgoff - drm=
_vma_node_start(&bo->base.vma_node))
c0001213d195d1 Felix Kuehling      2020-07-28  412  		 << PAGE_SHIFT);
09ac4fcb3f255e Felix Kuehling      2017-07-13  413  	int ret;
09ac4fcb3f255e Felix Kuehling      2017-07-13  414 =20
d3116756a710e3 Christian K=C3=B6nig     2021-04-12 @415  	if (len < 1 || (o=
ffset + len) >> PAGE_SHIFT > bo->resource->num_pages)
09ac4fcb3f255e Felix Kuehling      2017-07-13  416  		return -EIO;
09ac4fcb3f255e Felix Kuehling      2017-07-13  417 =20
09ac4fcb3f255e Felix Kuehling      2017-07-13  418  	ret =3D ttm_bo_reserve=
(bo, true, false, NULL);
09ac4fcb3f255e Felix Kuehling      2017-07-13  419  	if (ret)
09ac4fcb3f255e Felix Kuehling      2017-07-13  420  		return ret;
09ac4fcb3f255e Felix Kuehling      2017-07-13  421 =20
4b9944493c6d92 Simon Richter       2025-10-14 @422  	if (!bo->resource) {
4b9944493c6d92 Simon Richter       2025-10-14  423  		ret =3D -ENODATA;
4b9944493c6d92 Simon Richter       2025-10-14  424  		goto unlock;
4b9944493c6d92 Simon Richter       2025-10-14  425  	}
4b9944493c6d92 Simon Richter       2025-10-14  426 =20
d3116756a710e3 Christian K=C3=B6nig     2021-04-12  427  	switch (bo->resou=
rce->mem_type) {
09ac4fcb3f255e Felix Kuehling      2017-07-13  428  	case TTM_PL_SYSTEM:
df561f6688fef7 Gustavo A. R. Silva 2020-08-23  429  		fallthrough;
09ac4fcb3f255e Felix Kuehling      2017-07-13  430  	case TTM_PL_TT:
09ac4fcb3f255e Felix Kuehling      2017-07-13  431  		ret =3D ttm_bo_vm_acc=
ess_kmap(bo, offset, buf, len, write);
09ac4fcb3f255e Felix Kuehling      2017-07-13  432  		break;
09ac4fcb3f255e Felix Kuehling      2017-07-13  433  	default:
8af8a109b34fa8 Christian K=C3=B6nig     2020-10-01  434  		if (bo->bdev->fu=
ncs->access_memory)
8af8a109b34fa8 Christian K=C3=B6nig     2020-10-01  435  			ret =3D bo->bde=
v->funcs->access_memory(
09ac4fcb3f255e Felix Kuehling      2017-07-13  436  				bo, offset, buf, le=
n, write);
09ac4fcb3f255e Felix Kuehling      2017-07-13  437  		else
09ac4fcb3f255e Felix Kuehling      2017-07-13  438  			ret =3D -EIO;
09ac4fcb3f255e Felix Kuehling      2017-07-13  439  	}
09ac4fcb3f255e Felix Kuehling      2017-07-13  440 =20
4b9944493c6d92 Simon Richter       2025-10-14  441  unlock:
09ac4fcb3f255e Felix Kuehling      2017-07-13  442  	ttm_bo_unreserve(bo);
09ac4fcb3f255e Felix Kuehling      2017-07-13  443 =20
09ac4fcb3f255e Felix Kuehling      2017-07-13  444  	return ret;
09ac4fcb3f255e Felix Kuehling      2017-07-13  445  }
20c012b24340a5 Christian K=C3=B6nig     2019-09-27  446  EXPORT_SYMBOL(ttm_=
bo_vm_access);
09ac4fcb3f255e Felix Kuehling      2017-07-13  447 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
