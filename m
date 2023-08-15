Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7767B7494
	for <oe-kbuild@lists.linux.dev>; Tue, 15 Aug 2023 08:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692088899; x=1723624899;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AZqvdCTLkrYhL1Br1h1zLEWEFXvpZicBQjVPGceqISk=;
  b=anLTepQpedssbTczfbB16+EcvUIqwdtNWvLlW2caEr1cAuLBZEuT4M/u
   IzYbfNEDSPK5qeytqDMXGQd7fAP6ijaoFoB22yc7eD1+srYbmLcgmwleT
   u2nVNyW3jc/jJRd5pWwqcwqCbRApMomRzEVrNlFSia2PGovf3fIPdyZH0
   Cn5f+ITlhb3q/xUBU+ec5W8aphDse6sb2LaesfJqDUgowrfhUXcSP5G+F
   37mBqr141ysK63kTQ1Vk2ha5R62Nowj5h6Gsli4w6d/pX0V5IyjBLS7ej
   e3KoOrLZqNDWHXCZRdAiXyhgkM75L5ELK9+NfKXeTacsvcPV9TjLIly7B
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="369707257"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="369707257"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 01:41:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="736842006"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="736842006"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 15 Aug 2023 01:41:37 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVpcO-0000nj-1j;
	Tue, 15 Aug 2023 08:41:36 +0000
Date: Tue, 15 Aug 2023 16:41:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 3177/8441] drivers/video/fbdev/core/fbcon.c:3184:
 undefined reference to `fg_console'
Message-ID: <202308151621.4dFNzXkk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/video/fbdev/core/fbcon.c:3184: undefined reference to `fg_console'"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Javier Martinez Canillas <javierm@redhat.com>
CC: Arnd Bergmann <arnd@arndb.de>

Hi Javier,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   21ef7b1e17d039053edaeaf41142423810572741
commit: c242f48433e79ea8c8c9eb8d2b4a3ee340e635fb [3177/8441] drm: Make FB_CORE to be selected if DRM fbdev emulation is enabled
:::::: branch date: 6 days ago
:::::: commit date: 3 weeks ago
config: um-randconfig-r091-20230815 (https://download.01.org/0day-ci/archive/20230815/202308151621.4dFNzXkk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308151621.4dFNzXkk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308151621.4dFNzXkk-lkp@intel.com/

Note: the linux-next/master HEAD 21ef7b1e17d039053edaeaf41142423810572741 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   /usr/bin/ld: drivers/video/fbdev/core/fbcon.o: in function `store_rotate':
>> drivers/video/fbdev/core/fbcon.c:3184: undefined reference to `fg_console'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.o: in function `show_cursor_blink':
   drivers/video/fbdev/core/fbcon.c:3246: undefined reference to `fg_console'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.o: in function `show_rotate':
   drivers/video/fbdev/core/fbcon.c:3226: undefined reference to `fg_console'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.o: in function `fbcon_modechange_possible':
>> drivers/video/fbdev/core/fbcon.c:2766: undefined reference to `vc_cons'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.o: in function `get_color':
>> drivers/video/fbdev/core/fbcon.c:287: undefined reference to `console_blanked'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.o: in function `fbcon_set_palette':
>> drivers/video/fbdev/core/fbcon.c:2572: undefined reference to `con_is_visible'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.o: in function `fbcon_debug_enter':
>> drivers/video/fbdev/core/fbcon.c:2254: undefined reference to `color_table'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.o: in function `fbcon_set_disp':
   drivers/video/fbdev/core/fbcon.c:1347: undefined reference to `vc_cons'
>> /usr/bin/ld: drivers/video/fbdev/core/fbcon.c:1391: undefined reference to `vc_resize'
>> /usr/bin/ld: drivers/video/fbdev/core/fbcon.c:1393: undefined reference to `con_is_visible'
>> /usr/bin/ld: drivers/video/fbdev/core/fbcon.c:1394: undefined reference to `redraw_screen'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.o: in function `do_fbcon_takeover':
>> drivers/video/fbdev/core/fbcon.c:530: undefined reference to `do_take_over_console'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.o: in function `fb_flashcursor':
   drivers/video/fbdev/core/fbcon.c:368: undefined reference to `vc_cons'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.c:370: undefined reference to `con_is_visible'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.o: in function `store_rotate_all':
   drivers/video/fbdev/core/fbcon.c:3197: undefined reference to `fg_console'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.o: in function `fbcon_deinit':
   drivers/video/fbdev/core/fbcon.c:1190: undefined reference to `con_is_visible'
>> /usr/bin/ld: drivers/video/fbdev/core/fbcon.c:1202: undefined reference to `con_is_bound'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.o: in function `fbcon_resize':
   drivers/video/fbdev/core/fbcon.c:2049: undefined reference to `con_is_visible'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.o: in function `store_cursor_blink':
   drivers/video/fbdev/core/fbcon.c:3272: undefined reference to `fg_console'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.o: in function `fbcon_modechanged':
   drivers/video/fbdev/core/fbcon.c:2679: undefined reference to `vc_cons'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.c:2687: undefined reference to `con_is_visible'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.c:2693: undefined reference to `vc_resize'
>> /usr/bin/ld: drivers/video/fbdev/core/fbcon.c:2703: undefined reference to `color_table'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.c:2704: undefined reference to `redraw_screen'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.o: in function `fbcon_set_all_vcs':
   drivers/video/fbdev/core/fbcon.c:2719: undefined reference to `vc_cons'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.c:2724: undefined reference to `con_is_visible'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.c:2736: undefined reference to `vc_resize'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.o: in function `fbcon_startup':
   drivers/video/fbdev/core/fbcon.c:924: undefined reference to `fg_console'
>> /usr/bin/ld: drivers/video/fbdev/core/fbcon.c:924: undefined reference to `vc_cons'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.c:977: undefined reference to `vc_resize'
>> /usr/bin/ld: drivers/video/fbdev/core/fbcon.c:962: undefined reference to `find_font'
>> /usr/bin/ld: drivers/video/fbdev/core/fbcon.c:963: undefined reference to `get_default_font'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.o: in function `fbcon_prepare_logo':
   drivers/video/fbdev/core/fbcon.c:612: undefined reference to `con_is_visible'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.c:614: undefined reference to `redraw_screen'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.o: in function `fbcon_init':
   drivers/video/fbdev/core/fbcon.c:1022: undefined reference to `fg_console'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.c:1091: undefined reference to `con_is_visible'
>> /usr/bin/ld: drivers/video/fbdev/core/fbcon.c:1133: undefined reference to `fg_console'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.c:1123: undefined reference to `vc_resize'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.c:1025: undefined reference to `vc_cons'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.c:1040: undefined reference to `get_default_font'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.c:1039: undefined reference to `find_font'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.o: in function `fbcon_switch':
   drivers/video/fbdev/core/fbcon.c:2073: undefined reference to `vc_cons'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.c:2172: undefined reference to `color_table'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.c:2177: undefined reference to `fg_console'
>> /usr/bin/ld: drivers/video/fbdev/core/fbcon.c:2179: undefined reference to `update_region'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.o: in function `fbcon_do_set_font':
>> drivers/video/fbdev/core/fbcon.c:2431: undefined reference to `vc_resize'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.c:2434: undefined reference to `con_is_visible'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.c:2437: undefined reference to `redraw_screen'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.o: in function `fbcon_set_def_font':
>> drivers/video/fbdev/core/fbcon.c:2547: undefined reference to `find_font'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.c:2545: undefined reference to `get_default_font'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.o: in function `fbcon_set_font':
   drivers/video/fbdev/core/fbcon.c:2518: undefined reference to `vc_cons'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.o: in function `set_con2fb_map':
   drivers/video/fbdev/core/fbcon.c:822: undefined reference to `vc_cons'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.c:836: undefined reference to `con_is_bound'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.c:861: undefined reference to `fg_console'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.o: in function `con2fb_init_display':
   drivers/video/fbdev/core/fbcon.c:797: undefined reference to `fg_console'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.c:797: undefined reference to `vc_cons'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.c:806: undefined reference to `fg_console'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.c:806: undefined reference to `vc_cons'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.c:806: undefined reference to `redraw_screen'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.o: in function `fbcon_blank':
>> drivers/video/fbdev/core/fbcon.c:2233: undefined reference to `redraw_screen'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.o: in function `fbcon_suspended':
   drivers/video/fbdev/core/fbcon.c:2655: undefined reference to `vc_cons'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.o: in function `fbcon_resumed':
   drivers/video/fbdev/core/fbcon.c:2667: undefined reference to `vc_cons'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.c:2667: undefined reference to `redraw_screen'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.o: in function `fbcon_fb_unregistered':
>> drivers/video/fbdev/core/fbcon.c:2911: undefined reference to `do_unregister_con_driver'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.o: in function `fbcon_remap_all':
   drivers/video/fbdev/core/fbcon.c:2931: undefined reference to `con_is_bound'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.o: in function `fbcon_fb_blanked':
   drivers/video/fbdev/core/fbcon.c:3040: undefined reference to `vc_cons'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.c:3045: undefined reference to `con_is_visible'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.c:3047: undefined reference to `do_blank_screen'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.c:3049: undefined reference to `do_unblank_screen'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.o: in function `fbcon_new_modelist':
   drivers/video/fbdev/core/fbcon.c:3066: undefined reference to `vc_cons'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.o: in function `fbcon_get_requirement':
   drivers/video/fbdev/core/fbcon.c:3084: undefined reference to `vc_cons'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.c:3095: undefined reference to `fg_console'
   /usr/bin/ld: drivers/video/fbdev/core/fbcon.c:3095: undefined reference to `vc_cons'
   collect2: error: ld returned 1 exit status

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for FRAMEBUFFER_CONSOLE
   Depends on [n]: VT [=n] && FB_CORE [=y] && !UML [=y]
   Selected by [y]:
   - DRM_FBDEV_EMULATION [=y] && HAS_IOMEM [=y] && DRM [=y] && !EXPERT [=n]
   WARNING: unmet direct dependencies detected for FRAMEBUFFER_CONSOLE_DETECT_PRIMARY
   Depends on [n]: VT [=n] && FRAMEBUFFER_CONSOLE [=y]
   Selected by [y]:
   - DRM_FBDEV_EMULATION [=y] && HAS_IOMEM [=y] && DRM [=y] && FRAMEBUFFER_CONSOLE [=y]


vim +3184 drivers/video/fbdev/core/fbcon.c

^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3031  
7a625549ea8c14 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2019-05-28  3032  void fbcon_fb_blanked(struct fb_info *info, int blank)
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3033  {
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3034  	struct fbcon_ops *ops = info->fbcon_par;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3035  	struct vc_data *vc;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3036  
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3037  	if (!ops || ops->currcon < 0)
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3038  		return;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3039  
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3040  	vc = vc_cons[ops->currcon].d;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3041  	if (vc->vc_mode != KD_TEXT ||
409d6c95f9c68b drivers/video/fbdev/core/fbcon.c Daniel Vetter      2022-04-05  3042  			fbcon_info_from_console(ops->currcon) != info)
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3043  		return;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3044  
6ca8dfd78187d8 drivers/video/console/fbcon.c    Jiri Slaby         2016-06-23  3045  	if (con_is_visible(vc)) {
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3046  		if (blank)
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16 @3047  			do_blank_screen(0);
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3048  		else
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16 @3049  			do_unblank_screen(0);
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3050  	}
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3051  	ops->blank_state = blank;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3052  }
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3053  
13ff178ccd6d3b drivers/video/fbdev/core/fbcon.c Daniel Vetter      2019-05-28  3054  void fbcon_new_modelist(struct fb_info *info)
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3055  {
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3056  	int i;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3057  	struct vc_data *vc;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3058  	struct fb_var_screeninfo var;
9791d763de8cca drivers/video/console/fbcon.c    Geert Uytterhoeven 2007-02-12  3059  	const struct fb_videomode *mode;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3060  
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas 2006-06-26  3061  	for (i = first_fb_vc; i <= last_fb_vc; i++) {
409d6c95f9c68b drivers/video/fbdev/core/fbcon.c Daniel Vetter      2022-04-05  3062  		if (fbcon_info_from_console(i) != info)
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3063  			continue;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3064  		if (!fb_display[i].mode)
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3065  			continue;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3066  		vc = vc_cons[i].d;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3067  		display_to_var(&var, &fb_display[i]);
8fb6567e347a04 drivers/video/console/fbcon.c    Michal Januszewski 2005-11-07  3068  		mode = fb_find_nearest_mode(fb_display[i].mode,
8fb6567e347a04 drivers/video/console/fbcon.c    Michal Januszewski 2005-11-07  3069  					    &info->modelist);
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3070  		fb_videomode_to_var(&var, mode);
d1baa4ffa677bf drivers/video/console/fbcon.c    Antonino A. Daplas 2007-07-17  3071  		fbcon_set_disp(info, &var, vc->vc_num);
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3072  	}
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3073  }
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3074  
0526c2239ad8ce drivers/video/fbdev/core/fbcon.c Daniel Vetter      2019-05-28  3075  void fbcon_get_requirement(struct fb_info *info,
38a3dc51852d83 drivers/video/console/fbcon.c    Antonino A. Daplas 2007-05-08  3076  			   struct fb_blit_caps *caps)
38a3dc51852d83 drivers/video/console/fbcon.c    Antonino A. Daplas 2007-05-08  3077  {
38a3dc51852d83 drivers/video/console/fbcon.c    Antonino A. Daplas 2007-05-08  3078  	struct vc_data *vc;
38a3dc51852d83 drivers/video/console/fbcon.c    Antonino A. Daplas 2007-05-08  3079  
38a3dc51852d83 drivers/video/console/fbcon.c    Antonino A. Daplas 2007-05-08  3080  	if (caps->flags) {
167f07f1bc20ea drivers/video/console/fbcon.c    Antonino A. Daplas 2007-05-08  3081  		int i, charcnt;
38a3dc51852d83 drivers/video/console/fbcon.c    Antonino A. Daplas 2007-05-08  3082  
38a3dc51852d83 drivers/video/console/fbcon.c    Antonino A. Daplas 2007-05-08  3083  		for (i = first_fb_vc; i <= last_fb_vc; i++) {
38a3dc51852d83 drivers/video/console/fbcon.c    Antonino A. Daplas 2007-05-08  3084  			vc = vc_cons[i].d;
167f07f1bc20ea drivers/video/console/fbcon.c    Antonino A. Daplas 2007-05-08  3085  			if (vc && vc->vc_mode == KD_TEXT &&
167f07f1bc20ea drivers/video/console/fbcon.c    Antonino A. Daplas 2007-05-08  3086  			    info->node == con2fb_map[i]) {
38a3dc51852d83 drivers/video/console/fbcon.c    Antonino A. Daplas 2007-05-08  3087  				caps->x |= 1 << (vc->vc_font.width - 1);
38a3dc51852d83 drivers/video/console/fbcon.c    Antonino A. Daplas 2007-05-08  3088  				caps->y |= 1 << (vc->vc_font.height - 1);
a1ac250a82a5e9 drivers/video/fbdev/core/fbcon.c Peilin Ye          2020-11-12  3089  				charcnt = vc->vc_font.charcount;
38a3dc51852d83 drivers/video/console/fbcon.c    Antonino A. Daplas 2007-05-08  3090  				if (caps->len < charcnt)
38a3dc51852d83 drivers/video/console/fbcon.c    Antonino A. Daplas 2007-05-08  3091  					caps->len = charcnt;
38a3dc51852d83 drivers/video/console/fbcon.c    Antonino A. Daplas 2007-05-08  3092  			}
38a3dc51852d83 drivers/video/console/fbcon.c    Antonino A. Daplas 2007-05-08  3093  		}
38a3dc51852d83 drivers/video/console/fbcon.c    Antonino A. Daplas 2007-05-08  3094  	} else {
38a3dc51852d83 drivers/video/console/fbcon.c    Antonino A. Daplas 2007-05-08  3095  		vc = vc_cons[fg_console].d;
38a3dc51852d83 drivers/video/console/fbcon.c    Antonino A. Daplas 2007-05-08  3096  
167f07f1bc20ea drivers/video/console/fbcon.c    Antonino A. Daplas 2007-05-08  3097  		if (vc && vc->vc_mode == KD_TEXT &&
167f07f1bc20ea drivers/video/console/fbcon.c    Antonino A. Daplas 2007-05-08  3098  		    info->node == con2fb_map[fg_console]) {
167f07f1bc20ea drivers/video/console/fbcon.c    Antonino A. Daplas 2007-05-08  3099  			caps->x = 1 << (vc->vc_font.width - 1);
167f07f1bc20ea drivers/video/console/fbcon.c    Antonino A. Daplas 2007-05-08  3100  			caps->y = 1 << (vc->vc_font.height - 1);
a1ac250a82a5e9 drivers/video/fbdev/core/fbcon.c Peilin Ye          2020-11-12  3101  			caps->len = vc->vc_font.charcount;
38a3dc51852d83 drivers/video/console/fbcon.c    Antonino A. Daplas 2007-05-08  3102  		}
38a3dc51852d83 drivers/video/console/fbcon.c    Antonino A. Daplas 2007-05-08  3103  	}
38a3dc51852d83 drivers/video/console/fbcon.c    Antonino A. Daplas 2007-05-08  3104  }
38a3dc51852d83 drivers/video/console/fbcon.c    Antonino A. Daplas 2007-05-08  3105  
fe2d70d6f6ff03 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2019-05-28  3106  int fbcon_set_con2fb_map_ioctl(void __user *argp)
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3107  {
fe2d70d6f6ff03 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2019-05-28  3108  	struct fb_con2fbmap con2fb;
fe2d70d6f6ff03 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2019-05-28  3109  	int ret;
fe2d70d6f6ff03 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2019-05-28  3110  
fe2d70d6f6ff03 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2019-05-28  3111  	if (copy_from_user(&con2fb, argp, sizeof(con2fb)))
fe2d70d6f6ff03 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2019-05-28  3112  		return -EFAULT;
fe2d70d6f6ff03 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2019-05-28  3113  	if (con2fb.console < 1 || con2fb.console > MAX_NR_CONSOLES)
fe2d70d6f6ff03 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2019-05-28  3114  		return -EINVAL;
fe2d70d6f6ff03 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2019-05-28  3115  	if (con2fb.framebuffer >= FB_MAX)
fe2d70d6f6ff03 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2019-05-28  3116  		return -EINVAL;
efc3acbc105af7 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2022-04-05  3117  	if (!fbcon_registered_fb[con2fb.framebuffer])
fe2d70d6f6ff03 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2019-05-28  3118  		request_module("fb%d", con2fb.framebuffer);
efc3acbc105af7 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2022-04-05  3119  	if (!fbcon_registered_fb[con2fb.framebuffer]) {
fe2d70d6f6ff03 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2019-05-28  3120  		return -EINVAL;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3121  	}
fe2d70d6f6ff03 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2019-05-28  3122  
fe2d70d6f6ff03 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2019-05-28  3123  	console_lock();
fe2d70d6f6ff03 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2019-05-28  3124  	ret = set_con2fb_map(con2fb.console - 1,
fe2d70d6f6ff03 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2019-05-28  3125  			     con2fb.framebuffer, 1);
fe2d70d6f6ff03 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2019-05-28  3126  	console_unlock();
fe2d70d6f6ff03 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2019-05-28  3127  
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3128  	return ret;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3129  }
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3130  
fe2d70d6f6ff03 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2019-05-28  3131  int fbcon_get_con2fb_map_ioctl(void __user *argp)
fe2d70d6f6ff03 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2019-05-28  3132  {
fe2d70d6f6ff03 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2019-05-28  3133  	struct fb_con2fbmap con2fb;
fe2d70d6f6ff03 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2019-05-28  3134  
fe2d70d6f6ff03 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2019-05-28  3135  	if (copy_from_user(&con2fb, argp, sizeof(con2fb)))
fe2d70d6f6ff03 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2019-05-28  3136  		return -EFAULT;
fe2d70d6f6ff03 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2019-05-28  3137  	if (con2fb.console < 1 || con2fb.console > MAX_NR_CONSOLES)
fe2d70d6f6ff03 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2019-05-28  3138  		return -EINVAL;
fe2d70d6f6ff03 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2019-05-28  3139  
fe2d70d6f6ff03 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2019-05-28  3140  	console_lock();
fe2d70d6f6ff03 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2019-05-28  3141  	con2fb.framebuffer = con2fb_map[con2fb.console - 1];
fe2d70d6f6ff03 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2019-05-28  3142  	console_unlock();
fe2d70d6f6ff03 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2019-05-28  3143  
fe2d70d6f6ff03 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2019-05-28  3144  	return copy_to_user(argp, &con2fb, sizeof(con2fb)) ? -EFAULT : 0;
fe2d70d6f6ff03 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2019-05-28  3145  }
fe2d70d6f6ff03 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2019-05-28  3146  
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3147  /*
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3148   *  The console `switch' structure for the frame buffer based console
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3149   */
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3150  
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3151  static const struct consw fb_con = {
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3152  	.owner			= THIS_MODULE,
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3153  	.con_startup 		= fbcon_startup,
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3154  	.con_init 		= fbcon_init,
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3155  	.con_deinit 		= fbcon_deinit,
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3156  	.con_clear 		= fbcon_clear,
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3157  	.con_putc 		= fbcon_putc,
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3158  	.con_putcs 		= fbcon_putcs,
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3159  	.con_cursor 		= fbcon_cursor,
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3160  	.con_scroll 		= fbcon_scroll,
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3161  	.con_switch 		= fbcon_switch,
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3162  	.con_blank 		= fbcon_blank,
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3163  	.con_font_set 		= fbcon_set_font,
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3164  	.con_font_get 		= fbcon_get_font,
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3165  	.con_font_default	= fbcon_set_def_font,
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3166  	.con_set_palette 	= fbcon_set_palette,
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3167  	.con_invert_region 	= fbcon_invert_region,
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3168  	.con_screen_pos 	= fbcon_screen_pos,
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3169  	.con_getxy 		= fbcon_getxy,
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3170  	.con_resize             = fbcon_resize,
d219adc1228a38 drivers/video/console/fbcon.c    Jesse Barnes       2010-08-02  3171  	.con_debug_enter	= fbcon_debug_enter,
d219adc1228a38 drivers/video/console/fbcon.c    Jesse Barnes       2010-08-02  3172  	.con_debug_leave	= fbcon_debug_leave,
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3173  };
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  3174  
0c6c1ce079082d drivers/video/console/fbcon.c    Antonino A. Daplas 2007-07-17  3175  static ssize_t store_rotate(struct device *device,
0c6c1ce079082d drivers/video/console/fbcon.c    Antonino A. Daplas 2007-07-17  3176  			    struct device_attribute *attr, const char *buf,
0c6c1ce079082d drivers/video/console/fbcon.c    Antonino A. Daplas 2007-07-17  3177  			    size_t count)
9a17917671d407 drivers/video/console/fbcon.c    Antonino A. Daplas 2006-06-26  3178  {
9a17917671d407 drivers/video/console/fbcon.c    Antonino A. Daplas 2006-06-26  3179  	struct fb_info *info;
9a17917671d407 drivers/video/console/fbcon.c    Antonino A. Daplas 2006-06-26  3180  	int rotate, idx;
9a17917671d407 drivers/video/console/fbcon.c    Antonino A. Daplas 2006-06-26  3181  	char **last = NULL;
9a17917671d407 drivers/video/console/fbcon.c    Antonino A. Daplas 2006-06-26  3182  
ac751efa6a0d70 drivers/video/console/fbcon.c    Torben Hohn        2011-01-25  3183  	console_lock();
9a17917671d407 drivers/video/console/fbcon.c    Antonino A. Daplas 2006-06-26 @3184  	idx = con2fb_map[fg_console];
9a17917671d407 drivers/video/console/fbcon.c    Antonino A. Daplas 2006-06-26  3185  
efc3acbc105af7 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2022-04-05  3186  	if (idx == -1 || fbcon_registered_fb[idx] == NULL)
9a17917671d407 drivers/video/console/fbcon.c    Antonino A. Daplas 2006-06-26  3187  		goto err;
9a17917671d407 drivers/video/console/fbcon.c    Antonino A. Daplas 2006-06-26  3188  
efc3acbc105af7 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2022-04-05  3189  	info = fbcon_registered_fb[idx];
9a17917671d407 drivers/video/console/fbcon.c    Antonino A. Daplas 2006-06-26  3190  	rotate = simple_strtoul(buf, last, 0);
9a17917671d407 drivers/video/console/fbcon.c    Antonino A. Daplas 2006-06-26  3191  	fbcon_rotate(info, rotate);
9a17917671d407 drivers/video/console/fbcon.c    Antonino A. Daplas 2006-06-26  3192  err:
ac751efa6a0d70 drivers/video/console/fbcon.c    Torben Hohn        2011-01-25  3193  	console_unlock();
9a17917671d407 drivers/video/console/fbcon.c    Antonino A. Daplas 2006-06-26  3194  	return count;
9a17917671d407 drivers/video/console/fbcon.c    Antonino A. Daplas 2006-06-26  3195  }
9a17917671d407 drivers/video/console/fbcon.c    Antonino A. Daplas 2006-06-26  3196  

:::::: The code at line 3184 was first introduced by commit
:::::: 9a17917671d407d37bf23a527aa55acca3cb4735 [PATCH] Detaching fbcon: sdd sysfs class device entry for fbcon

:::::: TO: Antonino A. Daplas <adaplas@gmail.com>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
