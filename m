Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DAE389453
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Aug 2026 20:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787257654; cv=none; b=BSgX1kvDOK9NU+Bl3wxEiU38ajUWAJH7q9LUaRJiiTAHfSRzhJGMGyvqMKRxlNcAQIrgaj999hHQznq+PHQYcQt/9xSibhdyoMitIiBnc7vCgNiWfCyUS1SofGBCjxFscYkBRROnbSFcJYQkjE37mzKavtdFm4et7zZVeJbW3+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787257654; c=relaxed/simple;
	bh=OflMUssClY5eKj9EjohtSDrSy0RnApcrcyHokXO341o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DeM2xnGejMSjmN3YdpkQ0YPbapY/fqaw7ocf05LJMpbVDDDel8duyR/Jz+fEhimkJ7WCK0/0d4KR4xaZVKXn/cD8crzm9f6nF5eDXWYeVKr6zq9PAWbts6aYlbU8uq7+pXu4mC+di/vZSMJ+f3KLxooBFK0/vTsUZ5NVZEAegtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=drrDmOrs; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="drrDmOrs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787257652; x=1818793652;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OflMUssClY5eKj9EjohtSDrSy0RnApcrcyHokXO341o=;
  b=drrDmOrsm5zDtqmTMjrlDgZrCl/m8BczlaELjKAw/xnwo5/bU3U76vpf
   R+rt0B0BpGlZ3u89RuVBnMtIoyB8kFEzo89mJmfNFDFyb2VKxJ1HgoKOu
   nbMEgkqMu0jIPi22Lky10nrLhazrymO3wFL/2GEqPDUeO555CiNRK/8Za
   koNSipGWkq0+4VbOsovk0z9UvWwa1RWzk/CUpOJnsYDCcTehJzN7xh+5S
   j5OD7NVmJq5NB8+nAGww37DNp3oERwcsXM6SRY5bhIqQD6R50+oKiYSYB
   KXgKWKdcQSUMjmaHZF22a4dMaxdIhptguLRk4PXA38RMlA5N+FRtgtiPw
   w==;
X-CSE-ConnectionGUID: Kkc1M2YCRtuXjRPdCefHvA==
X-CSE-MsgGUID: 1nO+Zdn1St6w7nPpom814A==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="98140938"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; 
   d="scan'208";a="98140938"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 13:27:31 -0700
X-CSE-ConnectionGUID: a2ZVMQP6SWOIoiFU+544Iw==
X-CSE-MsgGUID: LSNRN3FESvqrDXNMFCJsmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; 
   d="scan'208";a="270376853"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Aug 2026 13:27:30 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wx9MG-00000000nZN-0aQq;
	Thu, 20 Aug 2026 20:27:28 +0000
Date: Fri, 21 Aug 2026 04:27:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] staging: sm750fb: make g_fbmode array pointers
 const;prevent accidental modification of entries.
Message-ID: <202608210437.0jvsGsKR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "linux-review patch is more than 7 days old, verify it wasn't already superseded"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260806004325.3253-1-xanthakis.alexandre@gmail.com>
References: <20260806004325.3253-1-xanthakis.alexandre@gmail.com>
TO: Alexandros Xanthakis <xanthakis.alexandre@gmail.com>
TO: sudipm.mukherjee@gmail.com
TO: teddy.wang@siliconmotion.com
TO: gregkh@linuxfoundation.org
CC: linux-fbdev@vger.kernel.org
CC: linux-staging@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: Alexandros Xanthakis <xanthakis.alexandre@gmail.com>

Hi Alexandros,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandros-Xanthakis/staging-sm750fb-make-g_fbmode-array-pointers-const-prevent-accidental-modification-of-entries/20260806-034325
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260806004325.3253-1-xanthakis.alexandre%40gmail.com
patch subject: [PATCH] staging: sm750fb: make g_fbmode array pointers const;prevent accidental modification of entries.
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: powerpc64-randconfig-001-20260820 (https://download.01.org/0day-ci/archive/20260821/202608210437.0jvsGsKR-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 935bfc708590c60147a79c7df145bb6e68b1d388)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260821/202608210437.0jvsGsKR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608210437.0jvsGsKR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/sm750fb/sm750.c:762:19: error: cannot assign to variable 'g_fbmode' with const-qualified type 'const char *const[2]'
     762 |                 g_fbmode[index] = g_def_fbmode;
         |                 ~~~~~~~~~~~~~~~ ^
   drivers/staging/sm750fb/sm750.c:15:27: note: variable 'g_fbmode' declared const here
      15 | static const char * const g_fbmode[] = {NULL, NULL};
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/sm750fb/sm750.c:764:20: error: cannot assign to variable 'g_fbmode' with const-qualified type 'const char *const[2]'
     764 |                         g_fbmode[index] = g_fbmode[0];
         |                         ~~~~~~~~~~~~~~~ ^
   drivers/staging/sm750fb/sm750.c:15:27: note: variable 'g_fbmode' declared const here
      15 | static const char * const g_fbmode[] = {NULL, NULL};
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/sm750fb/sm750.c:872:17: error: cannot assign to variable 'g_fbmode' with const-qualified type 'const char *const[2]'
     872 |                                 g_fbmode[0] = opt;
         |                                 ~~~~~~~~~~~ ^
   drivers/staging/sm750fb/sm750.c:15:27: note: variable 'g_fbmode' declared const here
      15 | static const char * const g_fbmode[] = {NULL, NULL};
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/sm750fb/sm750.c:876:17: error: cannot assign to variable 'g_fbmode' with const-qualified type 'const char *const[2]'
     876 |                                 g_fbmode[1] = opt;
         |                                 ~~~~~~~~~~~ ^
   drivers/staging/sm750fb/sm750.c:15:27: note: variable 'g_fbmode' declared const here
      15 | static const char * const g_fbmode[] = {NULL, NULL};
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   4 errors generated.


vim +762 drivers/staging/sm750fb/sm750.c

81dee67e215b23f Sudip Mukherjee      2015-03-03  696  
81dee67e215b23f Sudip Mukherjee      2015-03-03  697  static int lynxfb_set_fbinfo(struct fb_info *info, int index)
81dee67e215b23f Sudip Mukherjee      2015-03-03  698  {
81dee67e215b23f Sudip Mukherjee      2015-03-03  699  	int i;
81dee67e215b23f Sudip Mukherjee      2015-03-03  700  	struct lynxfb_par *par;
e359b6a863e19f2 Mike Rapoport        2015-10-26  701  	struct sm750_dev *sm750_dev;
81dee67e215b23f Sudip Mukherjee      2015-03-03  702  	struct lynxfb_crtc *crtc;
81dee67e215b23f Sudip Mukherjee      2015-03-03  703  	struct lynxfb_output *output;
81dee67e215b23f Sudip Mukherjee      2015-03-03  704  	struct fb_var_screeninfo *var;
81dee67e215b23f Sudip Mukherjee      2015-03-03  705  	struct fb_fix_screeninfo *fix;
81dee67e215b23f Sudip Mukherjee      2015-03-03  706  
81dee67e215b23f Sudip Mukherjee      2015-03-03  707  	const struct fb_videomode *pdb[] = {
81dee67e215b23f Sudip Mukherjee      2015-03-03  708  		lynx750_ext, NULL, vesa_modes,
81dee67e215b23f Sudip Mukherjee      2015-03-03  709  	};
81dee67e215b23f Sudip Mukherjee      2015-03-03  710  	int cdb[] = {ARRAY_SIZE(lynx750_ext), 0, VESA_MODEDB_SIZE};
d0856045f0e9fc9 Hungyu Lin           2026-04-01  711  	static const char * const fix_id[2] = {
81dee67e215b23f Sudip Mukherjee      2015-03-03  712  		"sm750_fb1", "sm750_fb2",
81dee67e215b23f Sudip Mukherjee      2015-03-03  713  	};
81dee67e215b23f Sudip Mukherjee      2015-03-03  714  
81dee67e215b23f Sudip Mukherjee      2015-03-03  715  	int ret, line_length;
81dee67e215b23f Sudip Mukherjee      2015-03-03  716  
81dee67e215b23f Sudip Mukherjee      2015-03-03  717  	ret = 0;
81dee67e215b23f Sudip Mukherjee      2015-03-03  718  	par = (struct lynxfb_par *)info->par;
e359b6a863e19f2 Mike Rapoport        2015-10-26  719  	sm750_dev = par->dev;
81dee67e215b23f Sudip Mukherjee      2015-03-03  720  	crtc = &par->crtc;
81dee67e215b23f Sudip Mukherjee      2015-03-03  721  	output = &par->output;
81dee67e215b23f Sudip Mukherjee      2015-03-03  722  	var = &info->var;
81dee67e215b23f Sudip Mukherjee      2015-03-03  723  	fix = &info->fix;
81dee67e215b23f Sudip Mukherjee      2015-03-03  724  
81dee67e215b23f Sudip Mukherjee      2015-03-03  725  	/* set index */
81dee67e215b23f Sudip Mukherjee      2015-03-03  726  	par->index = index;
81dee67e215b23f Sudip Mukherjee      2015-03-03  727  	output->channel = &crtc->channel;
81dee67e215b23f Sudip Mukherjee      2015-03-03  728  	sm750fb_set_drv(par);
81dee67e215b23f Sudip Mukherjee      2015-03-03  729  
d11ac7cbcc266c6 Sudip Mukherjee      2015-08-07  730  	/*
d11ac7cbcc266c6 Sudip Mukherjee      2015-08-07  731  	 * set current cursor variable and proc pointer,
d11ac7cbcc266c6 Sudip Mukherjee      2015-08-07  732  	 * must be set after crtc member initialized
d11ac7cbcc266c6 Sudip Mukherjee      2015-08-07  733  	 */
fdc234d85210d91 Benjamin Philip      2021-07-28  734  	crtc->cursor.offset = crtc->o_screen + crtc->vidmem_size - 1024;
1be54c03f7519c9 Jad Keskes           2026-06-19  735  	crtc->cursor.mmio = sm750_dev->mmio +
e359b6a863e19f2 Mike Rapoport        2015-10-26  736  		0x800f0 + (int)crtc->channel * 0x140;
81dee67e215b23f Sudip Mukherjee      2015-03-03  737  
cd33da26036ea54 Christopher Carbone  2022-08-23  738  	crtc->cursor.max_h = 64;
cd33da26036ea54 Christopher Carbone  2022-08-23  739  	crtc->cursor.max_w = 64;
39f9137268ee3df Benjamin Philip      2021-07-26  740  	crtc->cursor.size = crtc->cursor.max_h * crtc->cursor.max_w * 2 / 8;
f50b4602fea62fe Jennifer Guo         2026-05-09  741  	crtc->cursor.vstart = sm750_dev->vmem + crtc->cursor.offset;
81dee67e215b23f Sudip Mukherjee      2015-03-03  742  
3de08a2d14ff8c7 Lorenzo Stoakes      2015-03-20  743  	memset_io(crtc->cursor.vstart, 0, crtc->cursor.size);
f7c8a046577e09d Thomas Zimmermann    2023-11-27  744  	if (!g_hwcursor)
52d0744d751d8f1 Arnd Bergmann        2016-11-09  745  		sm750_hw_cursor_disable(&crtc->cursor);
81dee67e215b23f Sudip Mukherjee      2015-03-03  746  
81dee67e215b23f Sudip Mukherjee      2015-03-03  747  	/* set info->fbops, must be set before fb_find_mode */
e359b6a863e19f2 Mike Rapoport        2015-10-26  748  	if (!sm750_dev->accel_off) {
81dee67e215b23f Sudip Mukherjee      2015-03-03  749  		/* use 2d acceleration */
f7c8a046577e09d Thomas Zimmermann    2023-11-27  750  		if (!g_hwcursor)
f7c8a046577e09d Thomas Zimmermann    2023-11-27  751  			info->fbops = &lynxfb_ops_accel;
f7c8a046577e09d Thomas Zimmermann    2023-11-27  752  		else
f7c8a046577e09d Thomas Zimmermann    2023-11-27  753  			info->fbops = &lynxfb_ops_accel_with_cursor;
f7c8a046577e09d Thomas Zimmermann    2023-11-27  754  	} else {
f7c8a046577e09d Thomas Zimmermann    2023-11-27  755  		if (!g_hwcursor)
81dee67e215b23f Sudip Mukherjee      2015-03-03  756  			info->fbops = &lynxfb_ops;
f7c8a046577e09d Thomas Zimmermann    2023-11-27  757  		else
f7c8a046577e09d Thomas Zimmermann    2023-11-27  758  			info->fbops = &lynxfb_ops_with_cursor;
f7c8a046577e09d Thomas Zimmermann    2023-11-27  759  	}
81dee67e215b23f Sudip Mukherjee      2015-03-03  760  
81dee67e215b23f Sudip Mukherjee      2015-03-03  761  	if (!g_fbmode[index]) {
81dee67e215b23f Sudip Mukherjee      2015-03-03 @762  		g_fbmode[index] = g_def_fbmode;
81dee67e215b23f Sudip Mukherjee      2015-03-03  763  		if (index)
81dee67e215b23f Sudip Mukherjee      2015-03-03  764  			g_fbmode[index] = g_fbmode[0];
81dee67e215b23f Sudip Mukherjee      2015-03-03  765  	}
81dee67e215b23f Sudip Mukherjee      2015-03-03  766  
81dee67e215b23f Sudip Mukherjee      2015-03-03  767  	for (i = 0; i < 3; i++) {
81dee67e215b23f Sudip Mukherjee      2015-03-03  768  		ret = fb_find_mode(var, info, g_fbmode[index],
81dee67e215b23f Sudip Mukherjee      2015-03-03  769  				   pdb[i], cdb[i], NULL, 8);
81dee67e215b23f Sudip Mukherjee      2015-03-03  770  
db7fb3588ab4920 Artem Lytkin         2026-02-23  771  		if (ret == 1 || ret == 2)
81dee67e215b23f Sudip Mukherjee      2015-03-03  772  			break;
81dee67e215b23f Sudip Mukherjee      2015-03-03  773  	}
81dee67e215b23f Sudip Mukherjee      2015-03-03  774  
81dee67e215b23f Sudip Mukherjee      2015-03-03  775  	/* set par */
81dee67e215b23f Sudip Mukherjee      2015-03-03  776  	par->info = info;
81dee67e215b23f Sudip Mukherjee      2015-03-03  777  
81dee67e215b23f Sudip Mukherjee      2015-03-03  778  	/* set info */
e3a3f9f5123683b Mike Rapoport        2015-10-26  779  	line_length = ALIGN((var->xres_virtual * var->bits_per_pixel / 8),
e3a3f9f5123683b Mike Rapoport        2015-10-26  780  			    crtc->line_pad);
81dee67e215b23f Sudip Mukherjee      2015-03-03  781  
81dee67e215b23f Sudip Mukherjee      2015-03-03  782  	info->pseudo_palette = &par->pseudo_palette[0];
cc59bde1c920ab6 Benjamin Philip      2021-07-28  783  	info->screen_base = crtc->v_screen;
81dee67e215b23f Sudip Mukherjee      2015-03-03  784  	info->screen_size = line_length * var->yres_virtual;
81dee67e215b23f Sudip Mukherjee      2015-03-03  785  
81dee67e215b23f Sudip Mukherjee      2015-03-03  786  	/* set info->fix */
81dee67e215b23f Sudip Mukherjee      2015-03-03  787  	fix->type = FB_TYPE_PACKED_PIXELS;
81dee67e215b23f Sudip Mukherjee      2015-03-03  788  	fix->type_aux = 0;
81dee67e215b23f Sudip Mukherjee      2015-03-03  789  	fix->xpanstep = crtc->xpanstep;
81dee67e215b23f Sudip Mukherjee      2015-03-03  790  	fix->ypanstep = crtc->ypanstep;
81dee67e215b23f Sudip Mukherjee      2015-03-03  791  	fix->ywrapstep = crtc->ywrapstep;
81dee67e215b23f Sudip Mukherjee      2015-03-03  792  	fix->accel = FB_ACCEL_SMI;
81dee67e215b23f Sudip Mukherjee      2015-03-03  793  
8c475735085a7db Tim Wassink          2025-12-21  794  	strscpy(fix->id, fix_id[index], sizeof(fix->id));
81dee67e215b23f Sudip Mukherjee      2015-03-03  795  
fdc234d85210d91 Benjamin Philip      2021-07-28  796  	fix->smem_start = crtc->o_screen + sm750_dev->vidmem_start;
d11ac7cbcc266c6 Sudip Mukherjee      2015-08-07  797  	/*
d11ac7cbcc266c6 Sudip Mukherjee      2015-08-07  798  	 * according to mmap experiment from user space application,
81dee67e215b23f Sudip Mukherjee      2015-03-03  799  	 * fix->mmio_len should not larger than virtual size
81dee67e215b23f Sudip Mukherjee      2015-03-03  800  	 * (xres_virtual x yres_virtual x ByPP)
81dee67e215b23f Sudip Mukherjee      2015-03-03  801  	 * Below line maybe buggy when user mmap fb dev node and write
81dee67e215b23f Sudip Mukherjee      2015-03-03  802  	 * data into the bound over virtual size
d11ac7cbcc266c6 Sudip Mukherjee      2015-08-07  803  	 */
81dee67e215b23f Sudip Mukherjee      2015-03-03  804  	fix->smem_len = crtc->vidmem_size;
81dee67e215b23f Sudip Mukherjee      2015-03-03  805  	info->screen_size = fix->smem_len;
81dee67e215b23f Sudip Mukherjee      2015-03-03  806  	fix->line_length = line_length;
e359b6a863e19f2 Mike Rapoport        2015-10-26  807  	fix->mmio_start = sm750_dev->vidreg_start;
e359b6a863e19f2 Mike Rapoport        2015-10-26  808  	fix->mmio_len = sm750_dev->vidreg_size;
b610e1193a917f4 Matej Dujava         2020-04-30  809  
b610e1193a917f4 Matej Dujava         2020-04-30  810  	lynxfb_set_visual_mode(info);
81dee67e215b23f Sudip Mukherjee      2015-03-03  811  
81dee67e215b23f Sudip Mukherjee      2015-03-03  812  	/* set var */
81dee67e215b23f Sudip Mukherjee      2015-03-03  813  	var->activate = FB_ACTIVATE_NOW;
81dee67e215b23f Sudip Mukherjee      2015-03-03  814  	var->accel_flags = 0;
81dee67e215b23f Sudip Mukherjee      2015-03-03  815  	var->vmode = FB_VMODE_NONINTERLACED;
81dee67e215b23f Sudip Mukherjee      2015-03-03  816  
61c507cf652da1b Michel von Czettritz 2015-03-26  817  	ret = fb_alloc_cmap(&info->cmap, 256, 0);
61c507cf652da1b Michel von Czettritz 2015-03-26  818  	if (ret < 0) {
fbab250eb51d6d6 Artem Lytkin         2026-02-07  819  		dev_err(info->device, "Could not allocate memory for cmap.\n");
81dee67e215b23f Sudip Mukherjee      2015-03-03  820  		goto exit;
81dee67e215b23f Sudip Mukherjee      2015-03-03  821  	}
81dee67e215b23f Sudip Mukherjee      2015-03-03  822  
81dee67e215b23f Sudip Mukherjee      2015-03-03  823  exit:
81dee67e215b23f Sudip Mukherjee      2015-03-03  824  	lynxfb_ops_check_var(var, info);
81dee67e215b23f Sudip Mukherjee      2015-03-03  825  	return ret;
81dee67e215b23f Sudip Mukherjee      2015-03-03  826  }
81dee67e215b23f Sudip Mukherjee      2015-03-03  827  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
