Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF13221E097
	for <oe-kbuild@lists.linux.dev>; Wed,  5 Nov 2025 23:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762384482; cv=none; b=bCE26tLOClfFtCmjWPwRr1Eb1IBeZLhX4NAWeEDT7XDnKaElYYmL0MutqdTgGC+RZXSCNU4owrOmm45r6r723x0i3Po0WO59fFkWsIvaKCjICD01oEePJz6mC9xXriA5yDPbQeChQ2j8KBRYlZbyR0wzZryhQD39hwPyJ3Z+fSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762384482; c=relaxed/simple;
	bh=uf535fQO/FS0U1Jufpp8ll10xTRap8401hcvSvVL/RQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YjwUpePqNwpyBPy+Hd+4014f3HtUTOgJVVpb+I8fu9cr0ZDXp+E90GtGXJNGgToqlz0SpsWtgpg3FZedKgMJWTaAze7Qp6gjWVMcVcsSS6HhH1Eu4lzT5//pIGmPCwM5Fp8G5gNgtpCcJv5BHS9aFV03Kjqjjd5Grr5YwpkQa0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kM4hTZxq; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kM4hTZxq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762384480; x=1793920480;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=uf535fQO/FS0U1Jufpp8ll10xTRap8401hcvSvVL/RQ=;
  b=kM4hTZxqOS0Lam8XLiebhD5/o+FeSIFOtClFxWBLVfRlxZGGEldIJAHe
   j2jsUmHVA76YMgsFFkU2zA8daK0TeMrqepBviZ30K686JNTiGVJX3pwsJ
   zsqgOS+BTZkdCRBQOhDiGD62hu5/JvOJF9RtfoKC1PYCZb2tAToBh9wDN
   u+xC6xD4tgSFcBGXTYjJpXXOT+2MOTYJQgnAa1O/voTnObBuuH5mVkpUb
   PNTqvrKDAN2y/VtnSH+J+XgunCMVBnQC/Oenh7ZRPcFkjlXEjdDRnkMD9
   9aFXbIP/A8mnB0t3dI0+PYt2pdvNBeUNDI1Tj50z2xz8bWTp4ZuTQDuRg
   w==;
X-CSE-ConnectionGUID: i8NUJbdzSimivGopo4XLEQ==
X-CSE-MsgGUID: gPX+SPqbTQeQMmoRYrnR5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="64547140"
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; 
   d="scan'208";a="64547140"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 15:10:19 -0800
X-CSE-ConnectionGUID: vUXyed9NSOy53qrp5X436g==
X-CSE-MsgGUID: Mpj2obNKRK+Uq9tc0S+PNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; 
   d="scan'208";a="187537064"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 05 Nov 2025 15:10:19 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGmdZ-000TDo-1q;
	Wed, 05 Nov 2025 23:10:02 +0000
Date: Thu, 6 Nov 2025 07:08:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 04/28] drm/xe/pf: Add save/restore control state stubs
 and connect to debugfs
Message-ID: <202511060745.V5s5AlIB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251105151027.540712-5-michal.winiarski@intel.com>
References: <20251105151027.540712-5-michal.winiarski@intel.com>
TO: "Michał Winiarski" <michal.winiarski@intel.com>
TO: Alex Williamson <alex@shazbot.org>
TO: Lucas De Marchi <lucas.demarchi@intel.com>
TO: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
TO: Rodrigo Vivi <rodrigo.vivi@intel.com>
TO: Jason Gunthorpe <jgg@ziepe.ca>
TO: Yishai Hadas <yishaih@nvidia.com>
TO: Kevin Tian <kevin.tian@intel.com>
TO: Shameer Kolothum <skolothumtho@nvidia.com>
TO: intel-xe@lists.freedesktop.org
TO: linux-kernel@vger.kernel.org
TO: kvm@vger.kernel.org
TO: Matthew Brost <matthew.brost@intel.com>
TO: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: dri-devel@lists.freedesktop.org
CC: Jani Nikula <jani.nikula@linux.intel.com>
CC: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
CC: Tvrtko Ursulin <tursulin@ursulin.net>
CC: David Airlie <airlied@gmail.com>
CC: Simona Vetter <simona@ffwll.ch>
CC: Lukasz Laguna <lukasz.laguna@intel.com>
CC: Christoph Hellwig <hch@infradead.org>
CC: "Michał Winiarski" <michal.winiarski@intel.com>

Hi Michał,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on next-20251105]
[cannot apply to awilliam-vfio/next awilliam-vfio/for-linus drm-i915/for-linux-next drm-i915/for-linux-next-fixes linus/master v6.18-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Micha-Winiarski/drm-xe-pf-Remove-GuC-version-check-for-migration-support/20251105-234203
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20251105151027.540712-5-michal.winiarski%40intel.com
patch subject: [PATCH v4 04/28] drm/xe/pf: Add save/restore control state stubs and connect to debugfs
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: alpha-randconfig-r072-20251106 (https://download.01.org/0day-ci/archive/20251106/202511060745.V5s5AlIB-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511060745.V5s5AlIB-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/xe/xe_sriov_pf_control.c:198 xe_sriov_pf_control_finish_save_vf() error: uninitialized symbol 'ret'.
drivers/gpu/drm/xe/xe_sriov_pf_control.c:222 xe_sriov_pf_control_trigger_restore_vf() error: uninitialized symbol 'ret'.
drivers/gpu/drm/xe/xe_sriov_pf_control.c:246 xe_sriov_pf_control_finish_restore_vf() error: uninitialized symbol 'ret'.

vim +/ret +198 drivers/gpu/drm/xe/xe_sriov_pf_control.c

33b59ab90959e2 Michał Winiarski 2025-11-05  176  
33b59ab90959e2 Michał Winiarski 2025-11-05  177  /**
33b59ab90959e2 Michał Winiarski 2025-11-05  178   * xe_sriov_pf_control_finish_save_vf - Complete a VF migration data SAVE sequence on all GTs.
33b59ab90959e2 Michał Winiarski 2025-11-05  179   * @xe: the &xe_device
33b59ab90959e2 Michał Winiarski 2025-11-05  180   * @vfid: the VF identifier
33b59ab90959e2 Michał Winiarski 2025-11-05  181   *
33b59ab90959e2 Michał Winiarski 2025-11-05  182   * This function is for PF only.
33b59ab90959e2 Michał Winiarski 2025-11-05  183   *
33b59ab90959e2 Michał Winiarski 2025-11-05  184   * Return: 0 on success or a negative error code on failure.
33b59ab90959e2 Michał Winiarski 2025-11-05  185   */
33b59ab90959e2 Michał Winiarski 2025-11-05  186  int xe_sriov_pf_control_finish_save_vf(struct xe_device *xe, unsigned int vfid)
33b59ab90959e2 Michał Winiarski 2025-11-05  187  {
33b59ab90959e2 Michał Winiarski 2025-11-05  188  	struct xe_gt *gt;
33b59ab90959e2 Michał Winiarski 2025-11-05  189  	unsigned int id;
33b59ab90959e2 Michał Winiarski 2025-11-05  190  	int ret;
33b59ab90959e2 Michał Winiarski 2025-11-05  191  
33b59ab90959e2 Michał Winiarski 2025-11-05  192  	for_each_gt(gt, xe, id) {
33b59ab90959e2 Michał Winiarski 2025-11-05  193  		ret = xe_gt_sriov_pf_control_finish_save_vf(gt, vfid);
33b59ab90959e2 Michał Winiarski 2025-11-05  194  		if (ret)
33b59ab90959e2 Michał Winiarski 2025-11-05  195  			break;
33b59ab90959e2 Michał Winiarski 2025-11-05  196  	}
33b59ab90959e2 Michał Winiarski 2025-11-05  197  
33b59ab90959e2 Michał Winiarski 2025-11-05 @198  	return ret;
33b59ab90959e2 Michał Winiarski 2025-11-05  199  }
33b59ab90959e2 Michał Winiarski 2025-11-05  200  
33b59ab90959e2 Michał Winiarski 2025-11-05  201  /**
33b59ab90959e2 Michał Winiarski 2025-11-05  202   * xe_sriov_pf_control_trigger_restore_vf - Start a VF migration data RESTORE sequence on all GTs.
33b59ab90959e2 Michał Winiarski 2025-11-05  203   * @xe: the &xe_device
33b59ab90959e2 Michał Winiarski 2025-11-05  204   * @vfid: the VF identifier
33b59ab90959e2 Michał Winiarski 2025-11-05  205   *
33b59ab90959e2 Michał Winiarski 2025-11-05  206   * This function is for PF only.
33b59ab90959e2 Michał Winiarski 2025-11-05  207   *
33b59ab90959e2 Michał Winiarski 2025-11-05  208   * Return: 0 on success or a negative error code on failure.
33b59ab90959e2 Michał Winiarski 2025-11-05  209   */
33b59ab90959e2 Michał Winiarski 2025-11-05  210  int xe_sriov_pf_control_trigger_restore_vf(struct xe_device *xe, unsigned int vfid)
33b59ab90959e2 Michał Winiarski 2025-11-05  211  {
33b59ab90959e2 Michał Winiarski 2025-11-05  212  	struct xe_gt *gt;
33b59ab90959e2 Michał Winiarski 2025-11-05  213  	unsigned int id;
33b59ab90959e2 Michał Winiarski 2025-11-05  214  	int ret;
33b59ab90959e2 Michał Winiarski 2025-11-05  215  
33b59ab90959e2 Michał Winiarski 2025-11-05  216  	for_each_gt(gt, xe, id) {
33b59ab90959e2 Michał Winiarski 2025-11-05  217  		ret = xe_gt_sriov_pf_control_trigger_restore_vf(gt, vfid);
33b59ab90959e2 Michał Winiarski 2025-11-05  218  		if (ret)
33b59ab90959e2 Michał Winiarski 2025-11-05  219  			return ret;
33b59ab90959e2 Michał Winiarski 2025-11-05  220  	}
33b59ab90959e2 Michał Winiarski 2025-11-05  221  
33b59ab90959e2 Michał Winiarski 2025-11-05 @222  	return ret;
33b59ab90959e2 Michał Winiarski 2025-11-05  223  }
33b59ab90959e2 Michał Winiarski 2025-11-05  224  
33b59ab90959e2 Michał Winiarski 2025-11-05  225  /**
33b59ab90959e2 Michał Winiarski 2025-11-05  226   * xe_sriov_pf_control_wait_restore_vf - Complete a VF migration data RESTORE sequence in all GTs.
33b59ab90959e2 Michał Winiarski 2025-11-05  227   * @xe: the &xe_device
33b59ab90959e2 Michał Winiarski 2025-11-05  228   * @vfid: the VF identifier
33b59ab90959e2 Michał Winiarski 2025-11-05  229   *
33b59ab90959e2 Michał Winiarski 2025-11-05  230   * This function is for PF only.
33b59ab90959e2 Michał Winiarski 2025-11-05  231   *
33b59ab90959e2 Michał Winiarski 2025-11-05  232   * Return: 0 on success or a negative error code on failure.
33b59ab90959e2 Michał Winiarski 2025-11-05  233   */
33b59ab90959e2 Michał Winiarski 2025-11-05  234  int xe_sriov_pf_control_finish_restore_vf(struct xe_device *xe, unsigned int vfid)
33b59ab90959e2 Michał Winiarski 2025-11-05  235  {
33b59ab90959e2 Michał Winiarski 2025-11-05  236  	struct xe_gt *gt;
33b59ab90959e2 Michał Winiarski 2025-11-05  237  	unsigned int id;
33b59ab90959e2 Michał Winiarski 2025-11-05  238  	int ret;
33b59ab90959e2 Michał Winiarski 2025-11-05  239  
33b59ab90959e2 Michał Winiarski 2025-11-05  240  	for_each_gt(gt, xe, id) {
33b59ab90959e2 Michał Winiarski 2025-11-05  241  		ret = xe_gt_sriov_pf_control_finish_restore_vf(gt, vfid);
33b59ab90959e2 Michał Winiarski 2025-11-05  242  		if (ret)
33b59ab90959e2 Michał Winiarski 2025-11-05  243  			break;
33b59ab90959e2 Michał Winiarski 2025-11-05  244  	}
33b59ab90959e2 Michał Winiarski 2025-11-05  245  
33b59ab90959e2 Michał Winiarski 2025-11-05 @246  	return ret;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
