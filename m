Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DD315B2
	for <oe-kbuild@lists.linux.dev>; Fri,  1 Dec 2023 01:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JICX1dtg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701394851; x=1732930851;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=koCgB3xNv8hzGVzwki+I5vmF8zBv0ABEkJ9bZLfxSQw=;
  b=JICX1dtgr1MrsFaExmAwrjpCDdFLFQbul5XVXprUvSnclMFbxFjiMyFl
   hwbOc1xUTAIA0meqTyzubk6ONCNdIqC1I+rEArpNviJpD5pSLghxqfddv
   kf2MSgcP2AEKyVDfJOF/fF66Rzixs0liVt2XI0nXwOPC3562+v53gpVKy
   vnFw8mlnQW1iA/oqKvDUh/T5haJVdpw56VHPqQqCDzfv1cvf3XqIZsIkU
   rfW0Y8vmqM9Q61SDPgIYLvPrDHAHXoRyu+2NM9dqxhlpVDVdwaDfSHmdW
   55vl5JRup8fP2ipHHeIhMSJFC4I7pEOmH4/zjPkPOWyfAE5PleJWmkpMr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="317391"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; 
   d="scan'208";a="317391"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 17:40:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; 
   d="scan'208";a="10988883"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 30 Nov 2023 17:40:49 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8sVv-0002w2-1I;
	Fri, 01 Dec 2023 01:40:25 +0000
Date: Fri, 1 Dec 2023 09:38:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:195
 nvkm_acr_lsfw_load_bl_inst_data_sig() warn: passing zero to 'PTR_ERR'
Message-ID: <202312010912.kl4OI16u-lkp@intel.com>
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
TO: Ben Skeggs <bskeggs@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6172a5180fcc65170bfa2d49e55427567860f2a7
commit: 1c338ed5e52b62737a9d45f37f085bdbb367821b drm/nouveau/acr: return error when registering LSF if ACR not supported
date:   3 years, 10 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 3 years, 10 months ago
config: i386-randconfig-141-20231105 (https://download.01.org/0day-ci/archive/20231201/202312010912.kl4OI16u-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231201/202312010912.kl4OI16u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312010912.kl4OI16u-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:195 nvkm_acr_lsfw_load_bl_inst_data_sig() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +195 drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c

c63fe2e704e2c1 Ben Skeggs 2020-01-15  178  
c63fe2e704e2c1 Ben Skeggs 2020-01-15  179  int
c63fe2e704e2c1 Ben Skeggs 2020-01-15  180  nvkm_acr_lsfw_load_bl_inst_data_sig(struct nvkm_subdev *subdev,
c63fe2e704e2c1 Ben Skeggs 2020-01-15  181  				    struct nvkm_falcon *falcon,
c63fe2e704e2c1 Ben Skeggs 2020-01-15  182  				    enum nvkm_acr_lsf_id id,
c63fe2e704e2c1 Ben Skeggs 2020-01-15  183  				    const char *path, int ver,
c63fe2e704e2c1 Ben Skeggs 2020-01-15  184  				    const struct nvkm_acr_lsf_func *func)
c63fe2e704e2c1 Ben Skeggs 2020-01-15  185  {
c63fe2e704e2c1 Ben Skeggs 2020-01-15  186  	struct nvkm_acr *acr = subdev->device->acr;
c63fe2e704e2c1 Ben Skeggs 2020-01-15  187  	struct nvkm_acr_lsfw *lsfw;
c63fe2e704e2c1 Ben Skeggs 2020-01-15  188  	const struct firmware *bl = NULL, *inst = NULL, *data = NULL;
c63fe2e704e2c1 Ben Skeggs 2020-01-15  189  	const struct nvfw_bin_hdr *hdr;
c63fe2e704e2c1 Ben Skeggs 2020-01-15  190  	const struct nvfw_bl_desc *desc;
c63fe2e704e2c1 Ben Skeggs 2020-01-15  191  	u32 *bldata;
c63fe2e704e2c1 Ben Skeggs 2020-01-15  192  	int ret;
c63fe2e704e2c1 Ben Skeggs 2020-01-15  193  
c63fe2e704e2c1 Ben Skeggs 2020-01-15  194  	if (IS_ERR((lsfw = nvkm_acr_lsfw_add(func, acr, falcon, id))))
c63fe2e704e2c1 Ben Skeggs 2020-01-15 @195  		return PTR_ERR(lsfw);

:::::: The code at line 195 was first introduced by commit
:::::: c63fe2e704e2c1fa9a4614f31a567925d00503f1 drm/nouveau/acr: add loaders for currently available LS firmware images

:::::: TO: Ben Skeggs <bskeggs@redhat.com>
:::::: CC: Ben Skeggs <bskeggs@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
