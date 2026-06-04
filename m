Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D6938D3E3
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Jun 2026 07:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780558861; cv=none; b=fdtDCUm+bZlxyjoaLKQz6LHKFpV0Ax+5YAxm2EjQy2Dqf5yZJ3iZ0iZwKr+xLUoYcfSyn4VqYNf5+oYTRA12K0qxjfU5TkY6awRalJeeyELOy66bmiZjaClEPazmFp5Wim0GJCx1wStyoJAlZhrgpXSMRLpVqrJ6wC2jsR6+qqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780558861; c=relaxed/simple;
	bh=ZbV6ivVJX/6l4goPFhyWGZu1Bh4Sp3pbRftBV0Z14GY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mg4+qIYl4bXJvWMmftwMS0rHVIvG6F8xl0lLCh1LZilUtlxRi4I3S5KxqDI/DpWf1fk150GIKzVr2vtNiLtR6QYVTkN2cjrWKjLmnAoAPAeOH23ZlgBeycrdLpFzKM9/MY8ZLj78Glmx/YD1acG5uwwvaZrO4WnepHM543Piaa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XlNFYuG9; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XlNFYuG9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780558859; x=1812094859;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ZbV6ivVJX/6l4goPFhyWGZu1Bh4Sp3pbRftBV0Z14GY=;
  b=XlNFYuG9gh4VtOr7hswniLK04WtUdzw4z+GoWGUU3FpKP/DoXrH2VK3e
   e+l5fk3hGalAEu7q9O/x0Ks7bgRLzDVsm2M3//qNYcAfv4kkviwzJRbri
   Yxot4+M994kmA0B8yIJO7086+/I3XLeurceRp7YiOUSBqYN899ljdbm2M
   MfbRFJNkonyEQxXV31CyYobasHZ0D0CDStFKaAXbFEHsusjkXvXONyCMN
   nD/qX8jQVG3jH0MIgqNDX10sawoNjZJebvVRnwuDHbQn1rIg2xprOKOCa
   oSsXD8uGPWIEcpTE57gNaJqESQ6jECN3EP9C1w8Nbv4mwHKGEFAUikS8B
   Q==;
X-CSE-ConnectionGUID: N6tF7XF7TAGTXukQb6TAhA==
X-CSE-MsgGUID: 83zOwv3NR+mjoaps6OHQpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="104040882"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="104040882"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 00:40:59 -0700
X-CSE-ConnectionGUID: QfGPU6+zSu684q75BEduEw==
X-CSE-MsgGUID: eqmXg54PSgGyhfjIEZ96/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="248412923"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 04 Jun 2026 00:40:58 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wV2hC-00000000EQE-3Eb9;
	Thu, 04 Jun 2026 07:40:54 +0000
Date: Thu, 04 Jun 2026 15:40:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 1467/2910]
 drivers/gpu/drm/xe/xe_sync.c:168 xe_sync_entry_parse() warn: missing unwind
 goto?
Message-ID: <202606041511.d0kweV9I-lkp@intel.com>
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
TO: Shuicheng Lin <shuicheng.lin@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   a225caacc36546a09586e3ece36c0313146e7da9
commit: 1bfd7575092420ba5a0b944953c95b74a5646ff8 [1467/2910] drm/xe/sync: C=
leanup partially initialized sync on parse failure
:::::: branch date: 12 hours ago
:::::: commit date: 3 months ago
config: powerpc64-randconfig-r071-20260604 (https://download.01.org/0day-ci=
/archive/20260604/202606041511.d0kweV9I-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606041511.d0kweV9I-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/xe/xe_sync.c:168 xe_sync_entry_parse() warn: missing unwind=
 goto?

Old smatch warnings:
arch/powerpc/include/asm/mmu.h:253 mmu_has_feature() warn: bitwise AND cond=
ition is false here

vim +168 drivers/gpu/drm/xe/xe_sync.c

dd08ebf6c3525a Matthew Brost      2023-03-30  112 =20
dd08ebf6c3525a Matthew Brost      2023-03-30  113  int xe_sync_entry_parse(=
struct xe_device *xe, struct xe_file *xef,
dd08ebf6c3525a Matthew Brost      2023-03-30  114  			struct xe_sync_entry =
*sync,
dd08ebf6c3525a Matthew Brost      2023-03-30  115  			struct drm_xe_sync __=
user *sync_user,
adda4e855ab640 Matthew Brost      2025-10-31  116  			struct drm_syncobj *u=
fence_syncobj,
adda4e855ab640 Matthew Brost      2025-10-31  117  			u64 ufence_timeline_v=
alue,
53bf60f6d8503c Matthew Brost      2023-12-05  118  			unsigned int flags)
dd08ebf6c3525a Matthew Brost      2023-03-30  119  {
dd08ebf6c3525a Matthew Brost      2023-03-30  120  	struct drm_xe_sync sync=
_in;
dd08ebf6c3525a Matthew Brost      2023-03-30  121  	int err;
53bf60f6d8503c Matthew Brost      2023-12-05  122  	bool exec =3D flags & S=
YNC_PARSE_FLAG_EXEC;
53bf60f6d8503c Matthew Brost      2023-12-05  123  	bool in_lr_mode =3D fla=
gs & SYNC_PARSE_FLAG_LR_MODE;
eb9702ad29863c Matthew Brost      2023-12-05  124  	bool disallow_user_fenc=
e =3D flags & SYNC_PARSE_FLAG_DISALLOW_USER_FENCE;
7cabe5580cb9dc Matthew Brost      2023-04-16  125  	bool signal;
dd08ebf6c3525a Matthew Brost      2023-03-30  126 =20
dd08ebf6c3525a Matthew Brost      2023-03-30  127  	if (copy_from_user(&syn=
c_in, sync_user, sizeof(*sync_user)))
dd08ebf6c3525a Matthew Brost      2023-03-30  128  		return -EFAULT;
dd08ebf6c3525a Matthew Brost      2023-03-30  129 =20
37d078e51b4cba Rodrigo Vivi       2023-11-22  130  	if (XE_IOCTL_DBG(xe, sy=
nc_in.flags & ~DRM_XE_SYNC_FLAG_SIGNAL) ||
b8c1ba831e6750 Francois Dugast    2023-07-17  131  	    XE_IOCTL_DBG(xe, sy=
nc_in.reserved[0] || sync_in.reserved[1]))
dd08ebf6c3525a Matthew Brost      2023-03-30  132  		return -EINVAL;
dd08ebf6c3525a Matthew Brost      2023-03-30  133 =20
3ac4a7896d1c02 Francois Dugast    2023-11-14  134  	signal =3D sync_in.flag=
s & DRM_XE_SYNC_FLAG_SIGNAL;
37d078e51b4cba Rodrigo Vivi       2023-11-22  135  	switch (sync_in.type) {
37d078e51b4cba Rodrigo Vivi       2023-11-22  136  	case DRM_XE_SYNC_TYPE_S=
YNCOBJ:
fdb6a05383fab3 Thomas Hellstr=C3=B6m   2023-11-27  137  		if (XE_IOCTL_DBG(=
xe, in_lr_mode && signal))
ee6ad13705286b Janga Rahul Kumar  2023-06-13  138  			return -EOPNOTSUPP;
dd08ebf6c3525a Matthew Brost      2023-03-30  139 =20
b8c1ba831e6750 Francois Dugast    2023-07-17  140  		if (XE_IOCTL_DBG(xe, u=
pper_32_bits(sync_in.addr)))
dd08ebf6c3525a Matthew Brost      2023-03-30  141  			return -EINVAL;
dd08ebf6c3525a Matthew Brost      2023-03-30  142 =20
dd08ebf6c3525a Matthew Brost      2023-03-30  143  		sync->syncobj =3D drm_=
syncobj_find(xef->drm, sync_in.handle);
b8c1ba831e6750 Francois Dugast    2023-07-17  144  		if (XE_IOCTL_DBG(xe, !=
sync->syncobj))
dd08ebf6c3525a Matthew Brost      2023-03-30  145  			return -ENOENT;
dd08ebf6c3525a Matthew Brost      2023-03-30  146 =20
7cabe5580cb9dc Matthew Brost      2023-04-16  147  		if (!signal) {
dd08ebf6c3525a Matthew Brost      2023-03-30  148  			sync->fence =3D drm_s=
yncobj_fence_get(sync->syncobj);
1bfd7575092420 Shuicheng Lin      2026-02-19  149  			if (XE_IOCTL_DBG(xe, =
!sync->fence)) {
1bfd7575092420 Shuicheng Lin      2026-02-19  150  				err =3D -EINVAL;
1bfd7575092420 Shuicheng Lin      2026-02-19  151  				goto free_sync;
1bfd7575092420 Shuicheng Lin      2026-02-19  152  			}
dd08ebf6c3525a Matthew Brost      2023-03-30  153  		}
dd08ebf6c3525a Matthew Brost      2023-03-30  154  		break;
dd08ebf6c3525a Matthew Brost      2023-03-30  155 =20
37d078e51b4cba Rodrigo Vivi       2023-11-22  156  	case DRM_XE_SYNC_TYPE_T=
IMELINE_SYNCOBJ:
fdb6a05383fab3 Thomas Hellstr=C3=B6m   2023-11-27  157  		if (XE_IOCTL_DBG(=
xe, in_lr_mode && signal))
ee6ad13705286b Janga Rahul Kumar  2023-06-13  158  			return -EOPNOTSUPP;
dd08ebf6c3525a Matthew Brost      2023-03-30  159 =20
b8c1ba831e6750 Francois Dugast    2023-07-17  160  		if (XE_IOCTL_DBG(xe, u=
pper_32_bits(sync_in.addr)))
dd08ebf6c3525a Matthew Brost      2023-03-30  161  			return -EINVAL;
dd08ebf6c3525a Matthew Brost      2023-03-30  162 =20
b8c1ba831e6750 Francois Dugast    2023-07-17  163  		if (XE_IOCTL_DBG(xe, s=
ync_in.timeline_value =3D=3D 0))
dd08ebf6c3525a Matthew Brost      2023-03-30  164  			return -EINVAL;
dd08ebf6c3525a Matthew Brost      2023-03-30  165 =20
dd08ebf6c3525a Matthew Brost      2023-03-30  166  		sync->syncobj =3D drm_=
syncobj_find(xef->drm, sync_in.handle);
b8c1ba831e6750 Francois Dugast    2023-07-17  167  		if (XE_IOCTL_DBG(xe, !=
sync->syncobj))
dd08ebf6c3525a Matthew Brost      2023-03-30 @168  			return -ENOENT;
dd08ebf6c3525a Matthew Brost      2023-03-30  169 =20
7cabe5580cb9dc Matthew Brost      2023-04-16  170  		if (signal) {
dd08ebf6c3525a Matthew Brost      2023-03-30  171  			sync->chain_fence =3D =
dma_fence_chain_alloc();
1bfd7575092420 Shuicheng Lin      2026-02-19  172  			if (!sync->chain_fenc=
e) {
1bfd7575092420 Shuicheng Lin      2026-02-19  173  				err =3D -ENOMEM;
1bfd7575092420 Shuicheng Lin      2026-02-19  174  				goto free_sync;
1bfd7575092420 Shuicheng Lin      2026-02-19  175  			}
dd08ebf6c3525a Matthew Brost      2023-03-30  176  		} else {
dd08ebf6c3525a Matthew Brost      2023-03-30  177  			sync->fence =3D drm_s=
yncobj_fence_get(sync->syncobj);
1bfd7575092420 Shuicheng Lin      2026-02-19  178  			if (XE_IOCTL_DBG(xe, =
!sync->fence)) {
1bfd7575092420 Shuicheng Lin      2026-02-19  179  				err =3D -EINVAL;
1bfd7575092420 Shuicheng Lin      2026-02-19  180  				goto free_sync;
1bfd7575092420 Shuicheng Lin      2026-02-19  181  			}
dd08ebf6c3525a Matthew Brost      2023-03-30  182 =20
dd08ebf6c3525a Matthew Brost      2023-03-30  183  			err =3D dma_fence_cha=
in_find_seqno(&sync->fence,
dd08ebf6c3525a Matthew Brost      2023-03-30  184  							 sync_in.timeline=
_value);
dd08ebf6c3525a Matthew Brost      2023-03-30  185  			if (err)
1bfd7575092420 Shuicheng Lin      2026-02-19  186  				goto free_sync;
dd08ebf6c3525a Matthew Brost      2023-03-30  187  		}
dd08ebf6c3525a Matthew Brost      2023-03-30  188  		break;
dd08ebf6c3525a Matthew Brost      2023-03-30  189 =20
37d078e51b4cba Rodrigo Vivi       2023-11-22  190  	case DRM_XE_SYNC_TYPE_U=
SER_FENCE:
eb9702ad29863c Matthew Brost      2023-12-05  191  		if (XE_IOCTL_DBG(xe, d=
isallow_user_fence))
eb9702ad29863c Matthew Brost      2023-12-05  192  			return -EOPNOTSUPP;
eb9702ad29863c Matthew Brost      2023-12-05  193 =20
b8c1ba831e6750 Francois Dugast    2023-07-17  194  		if (XE_IOCTL_DBG(xe, !=
signal))
ee6ad13705286b Janga Rahul Kumar  2023-06-13  195  			return -EOPNOTSUPP;
dd08ebf6c3525a Matthew Brost      2023-03-30  196 =20
b8c1ba831e6750 Francois Dugast    2023-07-17  197  		if (XE_IOCTL_DBG(xe, s=
ync_in.addr & 0x7))
dd08ebf6c3525a Matthew Brost      2023-03-30  198  			return -EINVAL;
dd08ebf6c3525a Matthew Brost      2023-03-30  199 =20
dd08ebf6c3525a Matthew Brost      2023-03-30  200  		if (exec) {
dd08ebf6c3525a Matthew Brost      2023-03-30  201  			sync->addr =3D sync_i=
n.addr;
dd08ebf6c3525a Matthew Brost      2023-03-30  202  		} else {
adda4e855ab640 Matthew Brost      2025-10-31  203  			sync->ufence_timeline=
_value =3D ufence_timeline_value;
dd08ebf6c3525a Matthew Brost      2023-03-30  204  			sync->ufence =3D user=
_fence_create(xe, sync_in.addr,
dd08ebf6c3525a Matthew Brost      2023-03-30  205  							 sync_in.timeline=
_value);
0fde907da2d5fd Matthew Brost      2024-07-17  206  			if (XE_IOCTL_DBG(xe, =
IS_ERR(sync->ufence)))
0fde907da2d5fd Matthew Brost      2024-07-17  207  				return PTR_ERR(sync-=
>ufence);
adda4e855ab640 Matthew Brost      2025-10-31  208  			sync->ufence_chain_fe=
nce =3D dma_fence_chain_alloc();
adda4e855ab640 Matthew Brost      2025-10-31  209  			if (!sync->ufence_cha=
in_fence)
adda4e855ab640 Matthew Brost      2025-10-31  210  				return -ENOMEM;
adda4e855ab640 Matthew Brost      2025-10-31  211  			sync->ufence_syncobj =
=3D ufence_syncobj;
dd08ebf6c3525a Matthew Brost      2023-03-30  212  		}
dd08ebf6c3525a Matthew Brost      2023-03-30  213 =20
dd08ebf6c3525a Matthew Brost      2023-03-30  214  		break;
dd08ebf6c3525a Matthew Brost      2023-03-30  215 =20
dd08ebf6c3525a Matthew Brost      2023-03-30  216  	default:
dd08ebf6c3525a Matthew Brost      2023-03-30  217  		return -EINVAL;
dd08ebf6c3525a Matthew Brost      2023-03-30  218  	}
dd08ebf6c3525a Matthew Brost      2023-03-30  219 =20
37d078e51b4cba Rodrigo Vivi       2023-11-22  220  	sync->type =3D sync_in.=
type;
dd08ebf6c3525a Matthew Brost      2023-03-30  221  	sync->flags =3D sync_in=
.flags;
dd08ebf6c3525a Matthew Brost      2023-03-30  222  	sync->timeline_value =
=3D sync_in.timeline_value;
dd08ebf6c3525a Matthew Brost      2023-03-30  223 =20
dd08ebf6c3525a Matthew Brost      2023-03-30  224  	return 0;
1bfd7575092420 Shuicheng Lin      2026-02-19  225 =20
1bfd7575092420 Shuicheng Lin      2026-02-19  226  free_sync:
1bfd7575092420 Shuicheng Lin      2026-02-19  227  	xe_sync_entry_cleanup(s=
ync);
1bfd7575092420 Shuicheng Lin      2026-02-19  228  	return err;
dd08ebf6c3525a Matthew Brost      2023-03-30  229  }
70c7273778bf7f Priyanka Dandamudi 2025-02-12  230  ALLOW_ERROR_INJECTION(xe=
_sync_entry_parse, ERRNO);
dd08ebf6c3525a Matthew Brost      2023-03-30  231 =20

:::::: The code at line 168 was first introduced by commit
:::::: dd08ebf6c3525a7ea2186e636df064ea47281987 drm/xe: Introduce a new DRM=
 driver for Intel GPUs

:::::: TO: Matthew Brost <matthew.brost@intel.com>
:::::: CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
