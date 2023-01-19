Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1819A3D6E
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Jan 2023 20:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674161363; x=1705697363;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+jSdkp+dtLvfLJesVgl6Hw89q6jnOA5MEB5T2fFu3r0=;
  b=ck2V4G/9gTwYpF8pvz6rhwg5tzKOhPHEsE0Y2gssj2VDK4kLuWn87a/I
   JDMKZ8QjRS7wy+Qrw/UajB6remnQrlftxbaIm43BcYLqckE2LckX1wys1
   niqTnSQBtYKcE0saQyawCSE0N+gMi+c6c9rn54wUYgkdqtE+YtNYAJX19
   JuTygYNvE9NDgA7c1qjtEW7vYkibxa/4702XgWSlO2OaxB9ry6LCfIcM5
   QHzmXx60ukA+p269rjCLPxacTdvAIKYOQyCuBX8erOL+TBbGEjFzpGP5z
   yMl3btij1dJ6aNRKhI9ljXdqpbmAhlTndTUIFEvmaRkO2qUWxccLuVSxc
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="389935986"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; 
   d="scan'208";a="389935986"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 12:49:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="834128990"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; 
   d="scan'208";a="834128990"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 19 Jan 2023 12:49:21 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIbqa-0001qC-1N;
	Thu, 19 Jan 2023 20:49:20 +0000
Date: Fri, 20 Jan 2023 04:48:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH drm-next 11/14] drm/nouveau: nvkm/vmm: implement raw ops
 to manage uvmm
Message-ID: <202301200429.ahy6Bmvc-lkp@intel.com>
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
In-Reply-To: <20230118061256.2689-12-dakr@redhat.com>
References: <20230118061256.2689-12-dakr@redhat.com>
TO: Danilo Krummrich <dakr@redhat.com>
TO: daniel@ffwll.ch
TO: airlied@redhat.com
TO: christian.koenig@amd.com
TO: bskeggs@redhat.com
TO: jason@jlekstrand.net
TO: tzimmermann@suse.de
TO: mripard@kernel.org
TO: corbet@lwn.net
CC: nouveau@lists.freedesktop.org
CC: Danilo Krummrich <dakr@redhat.com>
CC: linux-kernel@vger.kernel.org
CC: dri-devel@lists.freedesktop.org
CC: linux-doc@vger.kernel.org

Hi Danilo,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on 0b45ac1170ea6416bc1d36798414c04870cd356d]

url:    https://github.com/intel-lab-lkp/linux/commits/Danilo-Krummrich/drm-execution-context-for-GEM-buffers/20230118-141552
base:   0b45ac1170ea6416bc1d36798414c04870cd356d
patch link:    https://lore.kernel.org/r/20230118061256.2689-12-dakr%40redhat.com
patch subject: [PATCH drm-next 11/14] drm/nouveau: nvkm/vmm: implement raw ops to manage uvmm
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: ia64-randconfig-m041-20230119 (https://download.01.org/0day-ci/archive/20230120/202301200429.ahy6Bmvc-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/gpu/drm/nouveau/nvif/vmm.c:195 nvif_vmm_ctor() warn: possible memory leak of 'args'

vim +/args +195 drivers/gpu/drm/nouveau/nvif/vmm.c

920d2b5ef2157e Ben Skeggs       2017-11-01  170  
920d2b5ef2157e Ben Skeggs       2017-11-01  171  int
5fca471110e52d Danilo Krummrich 2023-01-18  172  nvif_vmm_ctor(struct nvif_mmu *mmu, const char *name, s32 oclass,
5fca471110e52d Danilo Krummrich 2023-01-18  173  	      enum nvif_vmm_type type, u64 addr, u64 size, void *argv, u32 argc,
5fca471110e52d Danilo Krummrich 2023-01-18  174  	      struct nvif_vmm *vmm)
920d2b5ef2157e Ben Skeggs       2017-11-01  175  {
920d2b5ef2157e Ben Skeggs       2017-11-01  176  	struct nvif_vmm_v0 *args;
920d2b5ef2157e Ben Skeggs       2017-11-01  177  	u32 argn = sizeof(*args) + argc;
920d2b5ef2157e Ben Skeggs       2017-11-01  178  	int ret = -ENOSYS, i;
920d2b5ef2157e Ben Skeggs       2017-11-01  179  
920d2b5ef2157e Ben Skeggs       2017-11-01  180  	vmm->object.client = NULL;
920d2b5ef2157e Ben Skeggs       2017-11-01  181  	vmm->page = NULL;
920d2b5ef2157e Ben Skeggs       2017-11-01  182  
920d2b5ef2157e Ben Skeggs       2017-11-01  183  	if (!(args = kmalloc(argn, GFP_KERNEL)))
920d2b5ef2157e Ben Skeggs       2017-11-01  184  		return -ENOMEM;
920d2b5ef2157e Ben Skeggs       2017-11-01  185  	args->version = 0;
920d2b5ef2157e Ben Skeggs       2017-11-01  186  	args->addr = addr;
920d2b5ef2157e Ben Skeggs       2017-11-01  187  	args->size = size;
5fca471110e52d Danilo Krummrich 2023-01-18  188  
5fca471110e52d Danilo Krummrich 2023-01-18  189  	switch (type) {
5fca471110e52d Danilo Krummrich 2023-01-18  190  	case UNMANAGED: args->type = NVIF_VMM_V0_TYPE_UNMANAGED; break;
5fca471110e52d Danilo Krummrich 2023-01-18  191  	case MANAGED: args->type = NVIF_VMM_V0_TYPE_MANAGED; break;
5fca471110e52d Danilo Krummrich 2023-01-18  192  	case RAW: args->type = NVIF_VMM_V0_TYPE_RAW; break;
5fca471110e52d Danilo Krummrich 2023-01-18  193  	default:
5fca471110e52d Danilo Krummrich 2023-01-18  194  		WARN_ON(1);
5fca471110e52d Danilo Krummrich 2023-01-18 @195  		return -EINVAL;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
