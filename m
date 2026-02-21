Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BAE31AA94
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Feb 2026 08:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771661465; cv=none; b=eXzbuiUI5D3jIJanNUyxZFJTZ8DezvNgYe0fRdrkHvZSZa7G8y7m+SM65BzVuO/jCEtFf5/A7Q0wEorcLCXgHGg5Kg4G2o2dFiUd2PEvGHJuc+0ZDsFLF/fjL7QbDT4XmtNel+n7Wxd65OHr6x25A9rdOe2MiD6TqZ8X4488WLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771661465; c=relaxed/simple;
	bh=Vx+ahIho8+yCypzOHe0reqhc3DaTLRdcS2fYwHChvDU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Zdt6rZNIW3hBT39AW+0tV4JskgfpSpe/2kreHJNS6a3HUNHp7cWiRDk9lrFvg2XKCKGlM3XaVt4vKQX57l7NF3FSW9pyqFqPEqUN0rbuoeS/hLuWYzzrcIlMelBBgHmw2Pn+I5RVE8Dr4uNOHIxgLfRGB0ckYcvB8E2j6LKEIis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jRQ6uPZq; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jRQ6uPZq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771661463; x=1803197463;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Vx+ahIho8+yCypzOHe0reqhc3DaTLRdcS2fYwHChvDU=;
  b=jRQ6uPZqvXfH3cjYl6e5hihcIBD9THEpezgN5E0C7utR7sCjOLGrjmlC
   qA1+bQfmCBL+AmVrYwZBZpj/K0CzRXv+ikENfWZLsfkVfGfqnuHVejiKD
   Y37pKgs3qMzNIGEMqfT5XlFIGBoy+38hMGPsN8LyG97seMtj5pkaYXais
   I8F0otSpE3AB1xlBmAIfx49hp6TkpjB1GLMzEFT2Oc173HSBfNjgPNRcy
   VogpeNs49LffC5eqwmddHlUxx0C/XJcinDGePHKn3DTLb3Ml4dUmCmxhm
   po42XIzPO+UxlZe2ZF3WGR4jYARWBnY8CQOyd3yrHBy9VtDCu/8E9vaA4
   A==;
X-CSE-ConnectionGUID: ADV2k7vhTEyM3PA38sU2gQ==
X-CSE-MsgGUID: 1gY1N8ADTrqTb+Ze9jL9Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="83060679"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="83060679"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2026 00:11:00 -0800
X-CSE-ConnectionGUID: 9Gcf++oBQnuoBkSTWQ2g1g==
X-CSE-MsgGUID: pgmTbSJFTPqih6OUS9N4YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="213568990"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 21 Feb 2026 00:10:58 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vti4m-000000014ne-25b6;
	Sat, 21 Feb 2026 08:10:56 +0000
Date: Sat, 21 Feb 2026 16:10:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [drm-xe:drm-xe-next 1/5] drivers/gpu/drm/xe/xe_sync.c:168
 xe_sync_entry_parse() warn: missing unwind goto?
Message-ID: <202602211614.qY5LV3ZS-lkp@intel.com>
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
CC: intel-xe@lists.freedesktop.org
TO: Shuicheng Lin <shuicheng.lin@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   dfeef98e55d0e5f622886d0a9980c235ff08fd97
commit: f939bdd9207a5d1fc55cced5459858480686ce22 [1/5] drm/xe/sync: Cleanup=
 partially initialized sync on parse failure
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: parisc-randconfig-r071-20260221 (https://download.01.org/0day-ci/ar=
chive/20260221/202602211614.qY5LV3ZS-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602211614.qY5LV3ZS-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/xe/xe_sync.c:168 xe_sync_entry_parse() warn: missing unwind=
 goto?

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
f939bdd9207a5d Shuicheng Lin      2026-02-19  149  			if (XE_IOCTL_DBG(xe, =
!sync->fence)) {
f939bdd9207a5d Shuicheng Lin      2026-02-19  150  				err =3D -EINVAL;
f939bdd9207a5d Shuicheng Lin      2026-02-19  151  				goto free_sync;
f939bdd9207a5d Shuicheng Lin      2026-02-19  152  			}
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
f939bdd9207a5d Shuicheng Lin      2026-02-19  172  			if (!sync->chain_fenc=
e) {
f939bdd9207a5d Shuicheng Lin      2026-02-19  173  				err =3D -ENOMEM;
f939bdd9207a5d Shuicheng Lin      2026-02-19  174  				goto free_sync;
f939bdd9207a5d Shuicheng Lin      2026-02-19  175  			}
dd08ebf6c3525a Matthew Brost      2023-03-30  176  		} else {
dd08ebf6c3525a Matthew Brost      2023-03-30  177  			sync->fence =3D drm_s=
yncobj_fence_get(sync->syncobj);
f939bdd9207a5d Shuicheng Lin      2026-02-19  178  			if (XE_IOCTL_DBG(xe, =
!sync->fence)) {
f939bdd9207a5d Shuicheng Lin      2026-02-19  179  				err =3D -EINVAL;
f939bdd9207a5d Shuicheng Lin      2026-02-19  180  				goto free_sync;
f939bdd9207a5d Shuicheng Lin      2026-02-19  181  			}
dd08ebf6c3525a Matthew Brost      2023-03-30  182 =20
dd08ebf6c3525a Matthew Brost      2023-03-30  183  			err =3D dma_fence_cha=
in_find_seqno(&sync->fence,
dd08ebf6c3525a Matthew Brost      2023-03-30  184  							 sync_in.timeline=
_value);
dd08ebf6c3525a Matthew Brost      2023-03-30  185  			if (err)
f939bdd9207a5d Shuicheng Lin      2026-02-19  186  				goto free_sync;
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
f939bdd9207a5d Shuicheng Lin      2026-02-19  225 =20
f939bdd9207a5d Shuicheng Lin      2026-02-19  226  free_sync:
f939bdd9207a5d Shuicheng Lin      2026-02-19  227  	xe_sync_entry_cleanup(s=
ync);
f939bdd9207a5d Shuicheng Lin      2026-02-19  228  	return err;
dd08ebf6c3525a Matthew Brost      2023-03-30  229  }
70c7273778bf7f Priyanka Dandamudi 2025-02-12  230  ALLOW_ERROR_INJECTION(xe=
_sync_entry_parse, ERRNO);
dd08ebf6c3525a Matthew Brost      2023-03-30  231 =20

:::::: The code at line 168 was first introduced by commit
:::::: dd08ebf6c3525a7ea2186e636df064ea47281987 drm/xe: Introduce a new DRM=
 driver for Intel GPUs

:::::: TO: Matthew Brost <matthew.brost@intel.com>
:::::: CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
