Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD5913D52E
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Sep 2024 11:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727694193; cv=none; b=YwxK5U4JNs+cBeWA4Slb4hG4Dr39jmGJ9N6fE1nuXmUPgzZMt9yeKofOtwf594XNWeSQiHZa+n5o46fywe57f5LRqY4laK47DUbtJUIlRs3yEj2CjhmGbKe+y91PXpq4xcJ7IrymVw0UHU7lfH0BnkEnTl8KfAUgS3nIq2sUrYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727694193; c=relaxed/simple;
	bh=+tiYaJTBZ3Fmd4GB2x42VQ83zxKh/PGbcZTJHF1JE00=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hJIl7nSpgZLqE9Y8etS3fVGCxNtSPFbOi7kaGbRg/nQXXUwieMLLFAleRkXjOv13XtC+Y2MdM7fiUBmliL3YMfK1PQjC8JvPwQgfSg5sShECsQt203eOINPQBou5Qa33c9q1dd/LS1yyHMNocLmGMOgVuOtvv5qiKwIpEQHkpkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DQ1RhCia; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DQ1RhCia"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727694192; x=1759230192;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+tiYaJTBZ3Fmd4GB2x42VQ83zxKh/PGbcZTJHF1JE00=;
  b=DQ1RhCiaB8fIGliA5T3EAyuPe46XUSCMTc23bhQuS/ZAOt1d8+O8Hxfr
   QFB8BOSFYaUm+J6y9iZeIdmVHoOpT+rYXfH5BOvV4rPYG+XpgSYygIRRO
   fS3mJ5gDygQfOBvbVyhaAUURsyAUEtdCvXLiMSDFMc45DYjwjf+VaNgrb
   FVQ8gOJeMSob3ZF11GqoGO3d+QmcvQgWSS/22MiothG6LdREP7X0kOOJ1
   z139ASFFiWvsA286vL/ZrcHHAKEIBkdlFJGeTS1X2Iv3F1Me+INtbfagZ
   eqkBcelOOb417MR8gcHdHMXkLej3z47IE1Iqjg+GPsWS6+RCb/ebACQQW
   w==;
X-CSE-ConnectionGUID: dia/pyQuRNO7WunfChM7rw==
X-CSE-MsgGUID: Xi4AdK+yRJKU4yPWZBFktA==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="26284674"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="26284674"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 04:03:10 -0700
X-CSE-ConnectionGUID: Ex8KcgHHQoK4dAazqyBOCw==
X-CSE-MsgGUID: 5bPbhAhSQlSI76lswXXq+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="104068522"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 30 Sep 2024 04:03:07 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svEBF-000PMj-13;
	Mon, 30 Sep 2024 11:03:05 +0000
Date: Mon, 30 Sep 2024 19:03:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/xe/xe_guc_ct.c:617:1-7: preceding lock on line 598
Message-ID: <202409301804.HFadCXOK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9852d85ec9d492ebef56dc5f229416c925758edc
commit: 237412e45390805e14a6936fb998d756c4eac9d8 drm/xe: Enable 32bits build
date:   7 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 7 months ago
config: i386-randconfig-051-20240930 (https://download.01.org/0day-ci/archive/20240930/202409301804.HFadCXOK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202409301804.HFadCXOK-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/xe/xe_guc_ct.c:617:1-7: preceding lock on line 598
--
>> drivers/gpu/drm/xe/xe_irq.c:279:3-4: Unneeded semicolon
--
>> drivers/gpu/drm/xe/xe_rtp.c:168:2-3: Unneeded semicolon

vim +617 drivers/gpu/drm/xe/xe_guc_ct.c

0eb16fd2679563 Daniele Ceraolo Spurio 2023-12-06  542  
dd08ebf6c3525a Matthew Brost          2023-03-30  543  static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
dd08ebf6c3525a Matthew Brost          2023-03-30  544  				u32 len, u32 g2h_len, u32 num_g2h,
dd08ebf6c3525a Matthew Brost          2023-03-30  545  				struct g2h_fence *g2h_fence)
dd08ebf6c3525a Matthew Brost          2023-03-30  546  {
c73acc1eeba5e3 Francois Dugast        2023-09-12  547  	struct xe_device *xe = ct_to_xe(ct);
0eb16fd2679563 Daniele Ceraolo Spurio 2023-12-06  548  	u16 seqno;
dd08ebf6c3525a Matthew Brost          2023-03-30  549  	int ret;
dd08ebf6c3525a Matthew Brost          2023-03-30  550  
dc75d03716fe39 Matthew Brost          2024-01-22  551  	xe_assert(xe, ct->state != XE_GUC_CT_STATE_NOT_INITIALIZED);
c73acc1eeba5e3 Francois Dugast        2023-09-12  552  	xe_assert(xe, !g2h_len || !g2h_fence);
c73acc1eeba5e3 Francois Dugast        2023-09-12  553  	xe_assert(xe, !num_g2h || !g2h_fence);
c73acc1eeba5e3 Francois Dugast        2023-09-12  554  	xe_assert(xe, !g2h_len || num_g2h);
c73acc1eeba5e3 Francois Dugast        2023-09-12  555  	xe_assert(xe, g2h_len || !num_g2h);
dd08ebf6c3525a Matthew Brost          2023-03-30  556  	lockdep_assert_held(&ct->lock);
dd08ebf6c3525a Matthew Brost          2023-03-30  557  
a7ca8157ec7b59 Rodrigo Vivi           2023-05-16  558  	if (unlikely(ct->ctbs.h2g.info.broken)) {
dd08ebf6c3525a Matthew Brost          2023-03-30  559  		ret = -EPIPE;
dd08ebf6c3525a Matthew Brost          2023-03-30  560  		goto out;
dd08ebf6c3525a Matthew Brost          2023-03-30  561  	}
dd08ebf6c3525a Matthew Brost          2023-03-30  562  
dc75d03716fe39 Matthew Brost          2024-01-22  563  	if (ct->state == XE_GUC_CT_STATE_DISABLED) {
dd08ebf6c3525a Matthew Brost          2023-03-30  564  		ret = -ENODEV;
dd08ebf6c3525a Matthew Brost          2023-03-30  565  		goto out;
dd08ebf6c3525a Matthew Brost          2023-03-30  566  	}
dd08ebf6c3525a Matthew Brost          2023-03-30  567  
dc75d03716fe39 Matthew Brost          2024-01-22  568  	if (ct->state == XE_GUC_CT_STATE_STOPPED) {
dc75d03716fe39 Matthew Brost          2024-01-22  569  		ret = -ECANCELED;
dc75d03716fe39 Matthew Brost          2024-01-22  570  		goto out;
dc75d03716fe39 Matthew Brost          2024-01-22  571  	}
dc75d03716fe39 Matthew Brost          2024-01-22  572  
dc75d03716fe39 Matthew Brost          2024-01-22  573  	xe_assert(xe, xe_guc_ct_enabled(ct));
dc75d03716fe39 Matthew Brost          2024-01-22  574  
dd08ebf6c3525a Matthew Brost          2023-03-30  575  	if (g2h_fence) {
dd08ebf6c3525a Matthew Brost          2023-03-30  576  		g2h_len = GUC_CTB_HXG_MSG_MAX_LEN;
dd08ebf6c3525a Matthew Brost          2023-03-30  577  		num_g2h = 1;
dd08ebf6c3525a Matthew Brost          2023-03-30  578  
dd08ebf6c3525a Matthew Brost          2023-03-30  579  		if (g2h_fence_needs_alloc(g2h_fence)) {
dd08ebf6c3525a Matthew Brost          2023-03-30  580  			void *ptr;
dd08ebf6c3525a Matthew Brost          2023-03-30  581  
0eb16fd2679563 Daniele Ceraolo Spurio 2023-12-06  582  			g2h_fence->seqno = next_ct_seqno(ct, true);
dd08ebf6c3525a Matthew Brost          2023-03-30  583  			ptr = xa_store(&ct->fence_lookup,
dd08ebf6c3525a Matthew Brost          2023-03-30  584  				       g2h_fence->seqno,
dd08ebf6c3525a Matthew Brost          2023-03-30  585  				       g2h_fence, GFP_ATOMIC);
dd08ebf6c3525a Matthew Brost          2023-03-30  586  			if (IS_ERR(ptr)) {
dd08ebf6c3525a Matthew Brost          2023-03-30  587  				ret = PTR_ERR(ptr);
dd08ebf6c3525a Matthew Brost          2023-03-30  588  				goto out;
dd08ebf6c3525a Matthew Brost          2023-03-30  589  			}
dd08ebf6c3525a Matthew Brost          2023-03-30  590  		}
0eb16fd2679563 Daniele Ceraolo Spurio 2023-12-06  591  
0eb16fd2679563 Daniele Ceraolo Spurio 2023-12-06  592  		seqno = g2h_fence->seqno;
0eb16fd2679563 Daniele Ceraolo Spurio 2023-12-06  593  	} else {
0eb16fd2679563 Daniele Ceraolo Spurio 2023-12-06  594  		seqno = next_ct_seqno(ct, false);
dd08ebf6c3525a Matthew Brost          2023-03-30  595  	}
dd08ebf6c3525a Matthew Brost          2023-03-30  596  
dad33831d8d137 Matthew Auld           2023-07-10  597  	if (g2h_len)
dad33831d8d137 Matthew Auld           2023-07-10 @598  		spin_lock_irq(&ct->fast_lock);
dd08ebf6c3525a Matthew Brost          2023-03-30  599  retry:
dd08ebf6c3525a Matthew Brost          2023-03-30  600  	ret = has_room(ct, len + GUC_CTB_HDR_LEN, g2h_len);
dd08ebf6c3525a Matthew Brost          2023-03-30  601  	if (unlikely(ret))
dad33831d8d137 Matthew Auld           2023-07-10  602  		goto out_unlock;
dd08ebf6c3525a Matthew Brost          2023-03-30  603  
0eb16fd2679563 Daniele Ceraolo Spurio 2023-12-06  604  	ret = h2g_write(ct, action, len, seqno, !!g2h_fence);
dd08ebf6c3525a Matthew Brost          2023-03-30  605  	if (unlikely(ret)) {
dd08ebf6c3525a Matthew Brost          2023-03-30  606  		if (ret == -EAGAIN)
dd08ebf6c3525a Matthew Brost          2023-03-30  607  			goto retry;
dad33831d8d137 Matthew Auld           2023-07-10  608  		goto out_unlock;
dd08ebf6c3525a Matthew Brost          2023-03-30  609  	}
dd08ebf6c3525a Matthew Brost          2023-03-30  610  
dad33831d8d137 Matthew Auld           2023-07-10  611  	__g2h_reserve_space(ct, g2h_len, num_g2h);
dd08ebf6c3525a Matthew Brost          2023-03-30  612  	xe_guc_notify(ct_to_guc(ct));
dad33831d8d137 Matthew Auld           2023-07-10  613  out_unlock:
dad33831d8d137 Matthew Auld           2023-07-10  614  	if (g2h_len)
dad33831d8d137 Matthew Auld           2023-07-10  615  		spin_unlock_irq(&ct->fast_lock);
dd08ebf6c3525a Matthew Brost          2023-03-30  616  out:
dd08ebf6c3525a Matthew Brost          2023-03-30 @617  	return ret;
dd08ebf6c3525a Matthew Brost          2023-03-30  618  }
dd08ebf6c3525a Matthew Brost          2023-03-30  619  

:::::: The code at line 617 was first introduced by commit
:::::: dd08ebf6c3525a7ea2186e636df064ea47281987 drm/xe: Introduce a new DRM driver for Intel GPUs

:::::: TO: Matthew Brost <matthew.brost@intel.com>
:::::: CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
