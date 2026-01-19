Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044CF19CCF5
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Jan 2026 11:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768820488; cv=none; b=PIHd4CKApdnL7BNTqSP5GrRzswzwRvaZgDE/e8dzFrwasQ28a90eyBEDP4LT51IiL6GPOlfJiXCw7Ppgwv5C9nFHSGh2QjkoOjRLXvU3em7yclDvDaqrLxYuQXrRFpqXk4493lXfRaPb9sSm01RBBKJ/HMRj+LDirDiq014LJco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768820488; c=relaxed/simple;
	bh=lthhiYhBiEwTpfJrQcrc0hX4pPOZdkmYbWKNNseVNj8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EUpGirreh+mVEfF76Q6Q9YhgcSzmMvty0nf1Z3LPGyUAFn6/2mbA7m27h4g7SJboBHz7bgshG5mKWdrUTnsI/uX7BVoTf2BMan7rr1k9xo1pNjdqdSjxxgqwPVc2ZFn2g6nsQdn/97fQUCpH/99kuPHqjdEKLG2igFIUfa9PsGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lvymHnIm; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lvymHnIm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768820486; x=1800356486;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lthhiYhBiEwTpfJrQcrc0hX4pPOZdkmYbWKNNseVNj8=;
  b=lvymHnImVPZ/dSbtQEwVi3IxuTFuUUlEpyhdLxGqazte5qIK29RSDFme
   8O8uX7tWeuLHZP/0PpolKgfueQecR1VbfcRvY8c3HWKuV9OvPh+/cGZX8
   cYgzLKa2yZASw/nElZy9HTdi8spNyG7hb5xawwMFgvkHqJ9s9hHGVxYRe
   sKbcPYNjavF4716oNuRMpSrekEb4lhMheIjPEDxX1VU6JPhyYK0e+tk9C
   yO/9g8ONxDeKxGH5Yx8y249d181vSbjNdoWmgfTXrmTL+QCh5qWcHZVW0
   jR4orGSHWWaLyuZWxshROO0OP7olQrrJggo4F1XuMGuH/QiIIKMuYZunu
   Q==;
X-CSE-ConnectionGUID: v4ll91RRRm676SJ03IIhmg==
X-CSE-MsgGUID: fiRJ+qSOSBO93N8Ij/SeuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="57583420"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="57583420"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 03:01:26 -0800
X-CSE-ConnectionGUID: x4kff6H9TCuJR9PCISe82g==
X-CSE-MsgGUID: E6ZJ1kIYRE+fzbpnwS6Qeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="206189559"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 19 Jan 2026 03:01:24 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhn0c-00000000NiD-0s0f;
	Mon, 19 Jan 2026 11:01:22 +0000
Date: Mon, 19 Jan 2026 19:00:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 3/4] drm/xe/xe_hw_error: Add support for GT hardware
 errors
Message-ID: <202601191846.EkolkIOM-lkp@intel.com>
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
In-Reply-To: <20260119040023.2821518-9-riana.tauro@intel.com>
References: <20260119040023.2821518-9-riana.tauro@intel.com>
TO: Riana Tauro <riana.tauro@intel.com>
TO: intel-xe@lists.freedesktop.org
TO: dri-devel@lists.freedesktop.org
CC: aravind.iddamsetty@linux.intel.com
CC: anshuman.gupta@intel.com
CC: rodrigo.vivi@intel.com
CC: joonas.lahtinen@linux.intel.com
CC: simona.vetter@ffwll.ch
CC: airlied@gmail.com
CC: pratik.bari@intel.com
CC: joshua.santosh.ranjan@intel.com
CC: ashwin.kumar.kulkarni@intel.com
CC: shubham.kumar@intel.com
CC: ravi.kishore.koppuravuri@intel.com
CC: raag.jadav@intel.com
CC: Riana Tauro <riana.tauro@intel.com>
CC: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Hi Riana,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on drm/drm-next next-20260116]
[cannot apply to drm-misc/drm-misc-next linus/master v6.19-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Riana-Tauro/drm-ras-Introduce-the-DRM-RAS-infrastructure-over-generic-netlink/20260119-113326
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20260119040023.2821518-9-riana.tauro%40intel.com
patch subject: [PATCH v4 3/4] drm/xe/xe_hw_error: Add support for GT hardware errors
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: x86_64-randconfig-161-20260119 (https://download.01.org/0day-ci/archive/20260119/202601191846.EkolkIOM-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601191846.EkolkIOM-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/xe/xe_hw_error.c:168 gt_hw_error_handler() warn: statement has no effect 'u32'

vim +/u32 +168 drivers/gpu/drm/xe/xe_hw_error.c

7dd3f07dc4ddf18 Riana Tauro 2026-01-19  134  
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  135  static void gt_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err,
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  136  				u32 error_id)
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  137  {
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  138  	const enum drm_xe_ras_error_severity severity = hw_err_to_severity(hw_err);
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  139  	struct xe_device *xe = tile_to_xe(tile);
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  140  	struct xe_drm_ras *ras = &xe->ras;
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  141  	struct xe_drm_ras_counter *info = ras->info[severity];
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  142  	struct xe_mmio *mmio = &tile->mmio;
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  143  	unsigned long err_stat = 0;
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  144  	int i, len;
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  145  
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  146  	if (xe->info.platform != XE_PVC)
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  147  		return;
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  148  
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  149  	if (hw_err == HARDWARE_ERROR_NONFATAL) {
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  150  		atomic64_inc(&info[error_id].counter);
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  151  		log_hw_error(tile, info[error_id].name, severity);
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  152  		return;
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  153  	}
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  154  
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  155  	len = (hw_err == HARDWARE_ERROR_CORRECTABLE) ? ERR_STAT_GT_COR_VECTOR_LEN
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  156  						     : ERR_STAT_GT_VECTOR_MAX;
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  157  
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  158  	for (i = 0; i < len; i++) {
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  159  		u32 vector, val;
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  160  
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  161  		vector = xe_mmio_read32(mmio, ERR_STAT_GT_VECTOR_REG(hw_err, i));
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  162  		if (!vector)
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  163  			continue;
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  164  
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  165  		switch (i) {
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  166  		case ERR_STAT_GT_VECTOR0:
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  167  		case ERR_STAT_GT_VECTOR1:
7dd3f07dc4ddf18 Riana Tauro 2026-01-19 @168  			u32 errbit;
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  169  
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  170  			val = hweight32(vector);
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  171  			atomic64_add(val, &info[error_id].counter);
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  172  			log_gt_err(tile, "Subslice", i, vector, severity);
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  173  
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  174  			/* Read Error Status Register once */
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  175  			if (err_stat)
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  176  				break;
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  177  
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  178  			err_stat = xe_mmio_read32(mmio, ERR_STAT_GT_REG(hw_err));
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  179  			for_each_set_bit(errbit, &err_stat, GT_HW_ERROR_MAX_ERR_BITS) {
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  180  				if (hw_err == HARDWARE_ERROR_CORRECTABLE &&
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  181  				    (BIT(errbit) & PVC_COR_ERR_MASK))
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  182  					atomic64_inc(&info[error_id].counter);
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  183  				if (hw_err == HARDWARE_ERROR_FATAL &&
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  184  				    (BIT(errbit) & PVC_FAT_ERR_MASK))
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  185  					atomic64_inc(&info[error_id].counter);
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  186  			}
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  187  			if (err_stat)
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  188  				xe_mmio_write32(mmio, ERR_STAT_GT_REG(hw_err), err_stat);
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  189  			break;
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  190  		case ERR_STAT_GT_VECTOR2:
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  191  		case ERR_STAT_GT_VECTOR3:
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  192  			val = hweight32(vector);
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  193  			atomic64_add(val, &info[error_id].counter);
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  194  			log_gt_err(tile, "L3 BANK", i, vector, severity);
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  195  			break;
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  196  		case ERR_STAT_GT_VECTOR6:
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  197  			val = hweight32(vector);
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  198  			atomic64_add(val, &info[error_id].counter);
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  199  			log_gt_err(tile, "TLB", i, vector, severity);
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  200  			break;
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  201  		case ERR_STAT_GT_VECTOR7:
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  202  			val = hweight32(vector);
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  203  			atomic64_add(val, &info[error_id].counter);
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  204  			break;
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  205  		default:
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  206  			log_gt_err(tile, "Undefined", i, vector, severity);
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  207  		}
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  208  
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  209  		xe_mmio_write32(mmio, ERR_STAT_GT_VECTOR_REG(hw_err, i), vector);
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  210  	}
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  211  }
7dd3f07dc4ddf18 Riana Tauro 2026-01-19  212  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
