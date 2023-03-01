Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9844E10E1
	for <oe-kbuild@lists.linux.dev>; Wed,  1 Mar 2023 08:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677659352; x=1709195352;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=thtjTNMUzqsMWh2PTfEJUxgFuvUM9wlX2gcJjj/pCfI=;
  b=fmlkGiuD16jH3HpAX0GkWHnL3lPs4NjYub6dyN08X8cuNARoEKJeLvuc
   39yrzIaGlF23qci41pYDi9HAx10ZoqAAa7/amRrn5RQzdP+KxcotCkprq
   qDz3M57S+rUQPtrEuWGnVKzLCDRvwTjDYtCEG5Mmhbli9klqQKIIvRCg4
   HxwKZ9Ki6K5t5kwnnLd1s0DIJcHFF/fUglx7l6z7DU8j/vr+j1ThUhX3p
   nk29z4aE9HvdMxJ1qwDUGpTYyTfcYqPe4rNyb74GGgV62iBlWrO34IP83
   Eww6/kfPfoTDjEcQ8M2bQ9EvE2Jc9z8cWeNJIzJn0FmcTHGwv7DnXvRCz
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="399134363"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; 
   d="scan'208";a="399134363"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 00:29:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="920151868"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; 
   d="scan'208";a="920151868"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 01 Mar 2023 00:29:10 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXHpm-00060x-0t;
	Wed, 01 Mar 2023 08:29:10 +0000
Date: Wed, 1 Mar 2023 16:28:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [stable:linux-5.15.y 8748/9999] ld:
 drivers/gpu/drm/drm_fb_helper.c:839: undefined reference to `cfb_imageblit'
Message-ID: <202303011634.6MVTUCtm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: ld: drivers/gpu/drm/drm_fb_helper.c:839: undefined reference to `cfb_imageblit'"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kees Cook <keescook@chromium.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Sasha Levin <sashal@kernel.org>

Hi Kees,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   d383d0f28ecac0f3375bdfb9a0c4bfac979f6f8f
commit: 30f20ceb87f78a14645acd7996397af7fee6e518 [8748/9999] overflow: Implement size_t saturating arithmetic helpers
:::::: branch date: 4 days ago
:::::: commit date: 9 weeks ago
config: i386-randconfig-s001 (https://download.01.org/0day-ci/archive/20230301/202303011634.6MVTUCtm-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=30f20ceb87f78a14645acd7996397af7fee6e518
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.15.y
        git checkout 30f20ceb87f78a14645acd7996397af7fee6e518
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303011634.6MVTUCtm-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_resume_worker':
   drivers/gpu/drm/drm_fb_helper.c:370: undefined reference to `fb_set_suspend'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_unregister_fbi':
   drivers/gpu/drm/drm_fb_helper.c:605: undefined reference to `unregister_framebuffer'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_fini':
   drivers/gpu/drm/drm_fb_helper.c:634: undefined reference to `framebuffer_release'
   ld: drivers/gpu/drm/drm_fb_helper.c:633: undefined reference to `fb_dealloc_cmap'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `__drm_fb_helper_initial_config_and_unlock':
   drivers/gpu/drm/drm_fb_helper.c:1867: undefined reference to `register_framebuffer'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_alloc_fbi':
   drivers/gpu/drm/drm_fb_helper.c:559: undefined reference to `framebuffer_alloc'
   ld: drivers/gpu/drm/drm_fb_helper.c:563: undefined reference to `fb_alloc_cmap'
   ld: drivers/gpu/drm/drm_fb_helper.c:589: undefined reference to `framebuffer_release'
   ld: drivers/gpu/drm/drm_fb_helper.c:587: undefined reference to `fb_dealloc_cmap'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_generic_probe':
   drivers/gpu/drm/drm_fb_helper.c:2360: undefined reference to `fb_deferred_io_init'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_cfb_fillrect':
   drivers/gpu/drm/drm_fb_helper.c:809: undefined reference to `cfb_fillrect'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_cfb_copyarea':
   drivers/gpu/drm/drm_fb_helper.c:824: undefined reference to `cfb_copyarea'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_cfb_imageblit':
   drivers/gpu/drm/drm_fb_helper.c:839: undefined reference to `cfb_imageblit'
>> ld: drivers/gpu/drm/drm_fb_helper.c:839: undefined reference to `cfb_imageblit'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_sys_imageblit':
   drivers/gpu/drm/drm_fb_helper.c:794: undefined reference to `sys_imageblit'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_cfb_copyarea':
   drivers/gpu/drm/drm_fb_helper.c:824: undefined reference to `cfb_copyarea'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_sys_copyarea':
   drivers/gpu/drm/drm_fb_helper.c:779: undefined reference to `sys_copyarea'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_cfb_fillrect':
   drivers/gpu/drm/drm_fb_helper.c:809: undefined reference to `cfb_fillrect'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_sys_fillrect':
   drivers/gpu/drm/drm_fb_helper.c:764: undefined reference to `sys_fillrect'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fbdev_cleanup':
   drivers/gpu/drm/drm_fb_helper.c:2054: undefined reference to `fb_deferred_io_cleanup'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_unregister_fbi':
   drivers/gpu/drm/drm_fb_helper.c:605: undefined reference to `unregister_framebuffer'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_sys_read':
   drivers/gpu/drm/drm_fb_helper.c:728: undefined reference to `fb_sys_read'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_sys_write':
   drivers/gpu/drm/drm_fb_helper.c:746: undefined reference to `fb_sys_write'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_sys_fillrect':
   drivers/gpu/drm/drm_fb_helper.c:764: undefined reference to `sys_fillrect'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_sys_copyarea':
   drivers/gpu/drm/drm_fb_helper.c:779: undefined reference to `sys_copyarea'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_sys_imageblit':
   drivers/gpu/drm/drm_fb_helper.c:794: undefined reference to `sys_imageblit'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_set_suspend':
   drivers/gpu/drm/drm_fb_helper.c:856: undefined reference to `fb_set_suspend'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_set_suspend_unlocked':
   drivers/gpu/drm/drm_fb_helper.c:901: undefined reference to `fb_set_suspend'
   ld: drivers/gpu/drm/vmwgfx/vmwgfx_fb.o: in function `vmw_fb_imageblit':
   drivers/gpu/drm/vmwgfx/vmwgfx_fb.c:382: undefined reference to `cfb_imageblit'
   ld: drivers/gpu/drm/vmwgfx/vmwgfx_fb.o: in function `vmw_fb_copyarea':
   drivers/gpu/drm/vmwgfx/vmwgfx_fb.c:375: undefined reference to `cfb_copyarea'
   ld: drivers/gpu/drm/vmwgfx/vmwgfx_fb.o: in function `vmw_fb_fillrect':
   drivers/gpu/drm/vmwgfx/vmwgfx_fb.c:368: undefined reference to `cfb_fillrect'
   ld: drivers/gpu/drm/vmwgfx/vmwgfx_fb.o: in function `vmw_fb_init':
   drivers/gpu/drm/vmwgfx/vmwgfx_fb.c:650: undefined reference to `framebuffer_alloc'
   ld: drivers/gpu/drm/vmwgfx/vmwgfx_fb.c:759: undefined reference to `framebuffer_release'
   ld: drivers/gpu/drm/vmwgfx/vmwgfx_fb.c:743: undefined reference to `fb_deferred_io_init'
   ld: drivers/gpu/drm/vmwgfx/vmwgfx_fb.c:745: undefined reference to `register_framebuffer'
   ld: drivers/gpu/drm/vmwgfx/vmwgfx_fb.c:754: undefined reference to `fb_deferred_io_cleanup'
   ld: drivers/gpu/drm/vmwgfx/vmwgfx_fb.o: in function `vmw_fb_close':
   drivers/gpu/drm/vmwgfx/vmwgfx_fb.c:777: undefined reference to `fb_deferred_io_cleanup'
   ld: drivers/gpu/drm/vmwgfx/vmwgfx_fb.c:779: undefined reference to `unregister_framebuffer'
   ld: drivers/gpu/drm/vmwgfx/vmwgfx_fb.c:786: undefined reference to `framebuffer_release'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
