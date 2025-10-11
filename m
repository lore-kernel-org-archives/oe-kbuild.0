Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7507B3E1
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Oct 2025 06:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760163325; cv=none; b=ANwdU8ziEyFWZ6pEWWGkyCujeswsyFqPq91TvcW6zaChYqBqCNcpGUnZ7K3ca7r1PFYygZZsCJoAbbF+xXrMvd/IfxMwuzix5hLlNEenjLY92k5HvKZ+l7IwztEiNurKuR3N5lP2HF26NSlQyfxIDNKnvO+9wTGmEWW6/kUW4Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760163325; c=relaxed/simple;
	bh=0xs6LSdC/oYX6ROOIc1xxHCM4BWeZAeyjatgAzGyRcU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BIglRV8HxLWPPv345lC5+DG2oOkHnxooBTKJaOq+U4dSH9vNrCBcaQiDHP1Htf6KD2MHskH17dNsHtBdj2wDFpgDpxuASl5yGymtIS5EgH31DpOKlw+MbnpXEAOdqQmbjxX7qHkchU4okdLqVaEeBz7fNTyE7rBPpVCfoUthHy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QshnlurF; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QshnlurF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760163323; x=1791699323;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=0xs6LSdC/oYX6ROOIc1xxHCM4BWeZAeyjatgAzGyRcU=;
  b=QshnlurFuScCxHlxljJOGc9pmfheye1rDQFqlgA+UZzSoKF88CbN8iH+
   sqjl/0JIEAoXyJl8I4Hl9rCvQkrZatRqgKn0fhHyJMEF/hz+LtK0TMCd5
   EkQfjJ4XhjpGlBiRbkAEnpE+K2Uw9fzkgozQqcnbt6ayfZc+DXzUrkyxO
   7TUWrucfXEP2E0qpXPgBrmVcS1/hAxjiqtIrVyxvuiODPHxyxTAQrglQr
   lKbxMoXhxKdRZOgr9rAgb20wvxyW3ZSLkd4t1nTjLvCOygmu0H87I+JJK
   DtS/jaXho5L8gCLzVC7H1S/xHBe9dHRRO55Ndo2/SAxqzxQJeNLDXafGj
   w==;
X-CSE-ConnectionGUID: NvFZboNTSVmNDhm+uVuSmQ==
X-CSE-MsgGUID: lhiq3skXQZKiTlmP1EF2Fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="62417984"
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="62417984"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 23:15:20 -0700
X-CSE-ConnectionGUID: nVzB/BxmQyuru2winGjrJA==
X-CSE-MsgGUID: SIA0dJ+QQ+SJgB9sHMhFqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="181096965"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Oct 2025 23:15:19 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7Ssv-0003Yp-1V;
	Sat, 11 Oct 2025 06:15:17 +0000
Date: Sat, 11 Oct 2025 14:14:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 10/10] drm/panfrost: Rename panfrost_job functions to
 reflect real role
Message-ID: <202510111347.yceSirEP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251001022039.1215976-11-adrian.larumbe@collabora.com>
References: <20251001022039.1215976-11-adrian.larumbe@collabora.com>
TO: "Adrián Larumbe" <adrian.larumbe@collabora.com>
TO: linux-kernel@vger.kernel.org
CC: dri-devel@lists.freedesktop.org
CC: Steven Price <steven.price@arm.com>
CC: Boris Brezillon <bbrezillon@kernel.org>
CC: kernel@collabora.com
CC: "Adrián Larumbe" <adrian.larumbe@collabora.com>
CC: Rob Herring <robh@kernel.org>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: Maxime Ripard <mripard@kernel.org>
CC: Thomas Zimmermann <tzimmermann@suse.de>
CC: David Airlie <airlied@gmail.com>
CC: Simona Vetter <simona@ffwll.ch>

Hi Adrián,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 1a93d70801421ca506807ced45566490976d532a]

url:    https://github.com/intel-lab-lkp/linux/commits/Adri-n-Larumbe/drm-panfrost-Replace-DRM-driver-allocation-method-with-newer-one/20251001-102438
base:   1a93d70801421ca506807ced45566490976d532a
patch link:    https://lore.kernel.org/r/20251001022039.1215976-11-adrian.larumbe%40collabora.com
patch subject: [PATCH v4 10/10] drm/panfrost: Rename panfrost_job functions to reflect real role
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: s390-randconfig-r071-20251004 (https://download.01.org/0day-ci/archive/20251011/202510111347.yceSirEP-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510111347.yceSirEP-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/panfrost/panfrost_job.c:958 panfrost_jm_close() warn: iterator 'i' not incremented

vim +/i +958 drivers/gpu/drm/panfrost/panfrost_job.c

6aa8bc58ac88f3 Boris Brezillon 2025-09-17  951  
af0a25dc419cec Adrián Larumbe  2025-10-01  952  void panfrost_jm_close(struct drm_file *file)
6aa8bc58ac88f3 Boris Brezillon 2025-09-17  953  {
6aa8bc58ac88f3 Boris Brezillon 2025-09-17  954  	struct panfrost_file_priv *panfrost_priv = file->driver_priv;
6aa8bc58ac88f3 Boris Brezillon 2025-09-17  955  	struct panfrost_jm_ctx *jm_ctx;
6aa8bc58ac88f3 Boris Brezillon 2025-09-17  956  	unsigned long i;
6aa8bc58ac88f3 Boris Brezillon 2025-09-17  957  
6aa8bc58ac88f3 Boris Brezillon 2025-09-17 @958  	xa_for_each(&panfrost_priv->jm_ctxs, i, jm_ctx)
6aa8bc58ac88f3 Boris Brezillon 2025-09-17  959  		panfrost_jm_ctx_destroy(file, i);
6aa8bc58ac88f3 Boris Brezillon 2025-09-17  960  
6aa8bc58ac88f3 Boris Brezillon 2025-09-17  961  	xa_destroy(&panfrost_priv->jm_ctxs);
6aa8bc58ac88f3 Boris Brezillon 2025-09-17  962  }
6aa8bc58ac88f3 Boris Brezillon 2025-09-17  963  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
