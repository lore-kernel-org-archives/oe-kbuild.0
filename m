Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07B0A23
	for <oe-kbuild@lists.linux.dev>; Sun, 12 Feb 2023 03:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676171436; x=1707707436;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sOVHnFwz8dUonSaRqyjR7ooxJgcnRyEZLWvn4W7yRE8=;
  b=RYu1SsppbqwfXa3fPMKfudKN90jd/I41lssl0sZ5PVcu8QtWopjh1mBn
   UwAlHReSyrkxteehmotkGJJpqZ6cCHmBbyNoDd2vzRPpHrCYw8eZhs8of
   FzEQrrc4odXWc77KFizAO0EerpnA/XYN9F671EgtYvBzPs70pklm6AEvz
   NQOfJ6OCUpLffKJBINH6po/DoGvfq+JUkdz9NbTRwaza8aG2mLZpOamfp
   XTql2owb/XkGczkNaAPifXnkp7/uvxl7ThjrRjYz8rwJu1klJrHEzWfiK
   19MPQMb6HU0xN561Fb99N0Cf4YSfa5aAvwBMOPRc/4Yd8YUC0o4mfSCuC
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="311045918"
X-IronPort-AV: E=Sophos;i="5.97,290,1669104000"; 
   d="scan'208";a="311045918"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2023 19:10:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="997326578"
X-IronPort-AV: E=Sophos;i="5.97,290,1669104000"; 
   d="scan'208";a="997326578"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 11 Feb 2023 19:10:34 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pR2l7-0006zd-1i;
	Sun, 12 Feb 2023 03:10:33 +0000
Date: Sun, 12 Feb 2023 11:10:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [stable:linux-5.15.y 8937/9999] ld:
 drivers/gpu/drm/drm_fb_helper.c:839: undefined reference to `cfb_imageblit'
Message-ID: <202302121031.JyZREjK9-lkp@intel.com>
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
head:   85d7786c66b69d3f07cc149ac2f78d8f330c7c11
commit: 30f20ceb87f78a14645acd7996397af7fee6e518 [8937/9999] overflow: Implement size_t saturating arithmetic helpers
:::::: branch date: 3 days ago
:::::: commit date: 6 weeks ago
config: i386-randconfig-s001 (https://download.01.org/0day-ci/archive/20230212/202302121031.JyZREjK9-lkp@intel.com/config)
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
| Link: https://lore.kernel.org/r/202302121031.JyZREjK9-lkp@intel.com/

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
