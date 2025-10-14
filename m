Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8A72080C1;
	Tue, 14 Oct 2025 09:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760434058; cv=none; b=WT1Mlb94Cwspu25WJ9SX+u0DimCaBgt8dp1/jdjJcscRVz9WrU6RTuJBOLlwj9HnjLkHtIrF/X/nQKcpianBPq+MPIOb3utEWq8CmNeb4AlMoayfxWhlUmCnas3zIHcqccVauvvhSdXT18fQ1o55RfnEUuck+GZMRbKOSwQvfss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760434058; c=relaxed/simple;
	bh=K6TAMiCaGMIBLMsAhT/vxdWe9ZbYAm66uGS4kY5Okcs=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=OIuiA1sDV+ldSDMqKWpRHX5BsdeQ4MovQgLp6U7hgupbNXuO0Rhp/WzLnSOaKsZ86h2eruSGvTGV3Ss2Tf8SI5U9n2LHmqs3bnxTAYkEVySIyi3NPbF4T9EmiIevt4X2DyVId1EAYXZ1ym+64DXTdyCXeNdTVqq/C3ieH4YXwx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=R6FDRJts; arc=none smtp.client-ip=115.124.30.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="R6FDRJts"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1760434045; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=9p0qTVsaA/0eUuNDB2HEIbJ57T7iM2pq155kMAVAFzU=;
	b=R6FDRJts2LRtA46ibE7Nq3B30BN5EmqvfMnMWrm/OM4bOOu0nPyNU67CsU4NGRCpRBxADJblGm7yb7AskJfwxXNCUnADwY5dSHBowvOme1wHCXRRAAC2AJJ4q8vFSt2MvPmP5kex+vJfqAIoP7jEXmec7GXQuoYeNviOm2wlj98=
Received: from LG41624401116(mailfrom:yadong.qi@linux.alibaba.com fp:SMTPD_---0WqBV2FQ_1760434044 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 14 Oct 2025 17:27:25 +0800
From: <yadong.qi@linux.alibaba.com>
To: "'Dan Carpenter'" <dan.carpenter@linaro.org>,
	<oe-kbuild@lists.linux.dev>
Cc: <lkp@intel.com>,
	<oe-kbuild-all@lists.linux.dev>,
	"'Andrew Morton'" <akpm@linux-foundation.org>,
	"'Linux Memory Management List'" <linux-mm@kvack.org>,
	"'Huang Ying'" <ying.huang@linux.alibaba.com>
References: <202510110050.VG9YKMRK-lkp@intel.com>
In-Reply-To: <202510110050.VG9YKMRK-lkp@intel.com>
Subject: RE: [akpm-mm:mm-new 114/114] mm/vmalloc.c:191 vmap_pmd_range() error: uninitialized symbol 'err'.
Date: Tue, 14 Oct 2025 17:27:24 +0800
Message-ID: <003201dc3cec$c0697f40$413c7dc0$@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKp7XLvs+TopqcS+NXWteQ2YS1OxrMl93cA
Content-Language: zh-cn

> -----Original Message-----
> From: Dan Carpenter <dan.carpenter@linaro.org>
> Sent: 2025=C4=EA10=D4=C214=C8=D5 16:28
> To: oe-kbuild@lists.linux.dev; Yadong Qi <yadong.qi@linux.alibaba.com>
> Cc: lkp@intel.com; oe-kbuild-all@lists.linux.dev; Andrew Morton
> <akpm@linux-foundation.org>; Linux Memory Management List
> <linux-mm@kvack.org>; Huang Ying <ying.huang@linux.alibaba.com>
> Subject: [akpm-mm:mm-new 114/114] mm/vmalloc.c:191 vmap_pmd_range()
> error: uninitialized symbol 'err'.
>=20
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git =
mm-new
> head:   dbf0247637dd0601a462793035bdd0b416b30e36
> commit: dbf0247637dd0601a462793035bdd0b416b30e36 [114/114] mm:
> vmalloc: WARN_ON if mapping size is not PAGE_SIZE aligned
> config: sparc-randconfig-r071-20251010
> =
(https://download.01.org/0day-ci/archive/20251011/202510110050.VG9YKMRK-l=

> kp@intel.com/config)
> compiler: sparc-linux-gcc (GCC) 8.5.0
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new =
version
of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: =
https://lore.kernel.org/r/202510110050.VG9YKMRK-lkp@intel.com/
>=20
> smatch warnings:
> mm/vmalloc.c:191 vmap_pmd_range() error: uninitialized symbol 'err'.
> mm/vmalloc.c:243 vmap_pud_range() error: uninitialized symbol 'err'.
> mm/vmalloc.c:295 vmap_p4d_range() error: uninitialized symbol 'err'.
>=20
> vim +/err +191 mm/vmalloc.c
>=20
> 5e9e3d777b99aa Nicholas Piggin 2021-04-29  167  static int
> vmap_pmd_range(pud_t *pud, unsigned long addr, unsigned long end,
> 5e9e3d777b99aa Nicholas Piggin 2021-04-29  168
phys_addr_t
> phys_addr, pgprot_t prot,
> 5e9e3d777b99aa Nicholas Piggin 2021-04-29  169  			unsigned
int
> max_page_shift, pgtbl_mod_mask *mask)
> 5e9e3d777b99aa Nicholas Piggin 2021-04-29  170  {
> 5e9e3d777b99aa Nicholas Piggin 2021-04-29  171  	pmd_t *pmd;
> 5e9e3d777b99aa Nicholas Piggin 2021-04-29  172  	unsigned long next;
> dbf0247637dd06 Yadong Qi       2025-10-10  173  	int err;
> 5e9e3d777b99aa Nicholas Piggin 2021-04-29  174
> 5e9e3d777b99aa Nicholas Piggin 2021-04-29  175  	pmd =3D
> pmd_alloc_track(&init_mm, pud, addr, mask);
> 5e9e3d777b99aa Nicholas Piggin 2021-04-29  176  	if (!pmd)
> 5e9e3d777b99aa Nicholas Piggin 2021-04-29  177  		return -ENOMEM;
> 5e9e3d777b99aa Nicholas Piggin 2021-04-29  178  	do {
> 5e9e3d777b99aa Nicholas Piggin 2021-04-29  179  		next =3D
> pmd_addr_end(addr, end);
> 5e9e3d777b99aa Nicholas Piggin 2021-04-29  180
> 5e9e3d777b99aa Nicholas Piggin 2021-04-29  181  		if
> (vmap_try_huge_pmd(pmd, addr, next, phys_addr, prot,
> 5e9e3d777b99aa Nicholas Piggin 2021-04-29  182
> 	max_page_shift)) {
> 5e9e3d777b99aa Nicholas Piggin 2021-04-29  183  			*mask |=3D
> PGTBL_PMD_MODIFIED;
> 5e9e3d777b99aa Nicholas Piggin 2021-04-29  184
continue;
>=20
> Is it possible to hit the continue on every iteration through the =
loop?
>=20
Yes, this is an issue. I will submit an addon patch to fix it.

> 5e9e3d777b99aa Nicholas Piggin 2021-04-29  185  		}
> 5e9e3d777b99aa Nicholas Piggin 2021-04-29  186
> dbf0247637dd06 Yadong Qi       2025-10-10  187  		err =3D
> vmap_pte_range(pmd, addr, next, phys_addr, prot, max_page_shift, =
mask);
> dbf0247637dd06 Yadong Qi       2025-10-10  188  		if (err)
> dbf0247637dd06 Yadong Qi       2025-10-10  189  			break;
>=20
> I always feel like these are better as a "return ret;" anyway.  Then =
it's
> just one line to read instead of needing to "break; ... return err;".
> Twice as fast to read one line vs two lines.
>=20
I prefer to keep same style in vmalloc.c.



