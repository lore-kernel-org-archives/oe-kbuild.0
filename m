Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B44B3205
	for <oe-kbuild@lists.linux.dev>; Sat,  1 Apr 2023 11:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680350127; x=1711886127;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pp4mL88ldbiTpLcOjk7EGDLKcFgMtefMlI4I/LoNtcU=;
  b=MmKSVup/VDyGhGO28dAMNbVPcz7PdkjXt0hrpIQ7NL8X7FTw+8ST6Ra3
   HuHbd8vvobNpDzkg+Wo+b20joLljysK64tan8W5q2ILgf8m0CpyWCJ/0F
   56qk9rYZ3NaJZNmXyI/jSh9JLsXmVMfJi2jIKoDc4081Io+vmX+8r3Cti
   WEhT/7SbzddOl5BjQ0Fdg/15YbfJLWfoZapF/OBubV2EL4F9AxbJ2rcEr
   uY7Eu1CAUAetIZwKHtWHgMXyDDzevhTg1CD/HHWK31uWXZ53Bi4SkazS/
   6UpDUI4dcNtUg7YPu401mfioGIrFHQvOjCI+70uaNUNQV2Bh2c6kZxUgX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="344191250"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; 
   d="scan'208";a="344191250"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2023 04:55:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="1015144063"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; 
   d="scan'208";a="1015144063"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 01 Apr 2023 04:55:26 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1piZpN-000Mk1-0p;
	Sat, 01 Apr 2023 11:55:25 +0000
Date: Sat, 1 Apr 2023 19:55:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [stable:linux-5.15.y 7610/9999] ld:
 drivers/gpu/drm/drm_fb_helper.c:839: undefined reference to `cfb_imageblit'
Message-ID: <202304011933.SNPdnjik-lkp@intel.com>
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
head:   c957cbb8731536ddc9a01e4c1cd51eab6558aa14
commit: 30f20ceb87f78a14645acd7996397af7fee6e518 [7610/9999] overflow: Implement size_t saturating arithmetic helpers
:::::: branch date: 2 days ago
:::::: commit date: 3 months ago
config: i386-randconfig-s001 (https://download.01.org/0day-ci/archive/20230401/202304011933.SNPdnjik-lkp@intel.com/config)
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
| Link: https://lore.kernel.org/r/202304011933.SNPdnjik-lkp@intel.com/

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
