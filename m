Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BD338237A
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Apr 2026 07:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775115248; cv=none; b=P6UcZPKdFP87uMP7ResrWcn8s5Prx2S1IqVJB9ktWeRGZ7NDmC/4/uypvbYrZqq4+/YlyCPY+l7HPW1N2AZYbVpBW7nltX2DHiSwlF1XkP5DkDtNSbJyGWlvTEauu/hVbZvMYJaM37nvoKZ7yWcfCoRqJOX5gJFCx4hZnAanBNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775115248; c=relaxed/simple;
	bh=kdXNh45BSn6P4i4/3/wi+IVwhRHzQ/WRcJXec0BKvgw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HDjSnckErWjDtA6tGaPrIpTQ8uup6o5BqvykvNzpPBOdPPPKYRlnoq0ywq7Xbvn5avx0Wj9CqDcGYYVNLvXvHNvsfOJZ+Dg32rvwIKwWqMPv7A+RceNYGiqXJrc1N3AqdyMBVlPiq4SuT7mwQ1Lgljtxlz/3jCnMIt1plJUL6Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WRNcno6Q; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WRNcno6Q"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43cf73bbfbdso346284f8f.1
        for <oe-kbuild@lists.linux.dev>; Thu, 02 Apr 2026 00:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775115245; x=1775720045; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZhiUflwFUy2WPcGP8HzTbxOEv4skJ+nnW3yRKJvYww=;
        b=WRNcno6Qqsotpv2pC0K/L1xa6RkjnBOGp4QfkgQ+fRZFFmwAocP5u/rRvXv6lOfD3H
         lWQVs268YGNlIQkeei3WdbFP5n3GEtpyQ3KPmPnNbZ/KvEexyPrUeCgkQCnxaOGEy5s9
         u3I4qdW7KmmG/KCV4jCglZiFnGxomEh0YByHBtvKxRyDjvWkO6WTuRKov/pU2yrg7rKY
         ye2ggsbMfRrkjCuHOnK2A1Xhz+VWM29L4sUvtUTHGezIYN5Pip6WrVSEn5Nzq85VmKXQ
         MlfF671/AgmLak/TTU9S7uhTkFS9R1ID3X0E8MFPJnpSCz1TTF+enfKw7kNDP/5dCIxz
         7dMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775115245; x=1775720045;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XZhiUflwFUy2WPcGP8HzTbxOEv4skJ+nnW3yRKJvYww=;
        b=VbiKO983O88w4YFGi6o9aQ6lrkHHtj7Maox7liSumNJR+Mzt7Tcn+K/Cz+EqRwfeU2
         VWVH8E3ETW39XHRDwf/xEAa2hFdwmzdtTrSAu1X7q3VF9ljiJQ3DlTdeCBrHlT6LonOz
         nuFcPrUMxfrGZNsOsBIDmDAqlB+HfgxlONrGWSqgSNbPHUplKEq/d9aIouQfgTn85K4v
         UCfvamM1LyYSyjFwl2XUF5fy0Ffw4qu/dfYlcaYmFREtM1RfXWIf2zutTKaqLPMlPmc0
         MoK5S+50jpg8iW738PCQ/MflMe7PodD/tfElBU5v+ip61SJ0r0Jif7QsTReeKOiZI0Au
         JQsQ==
X-Gm-Message-State: AOJu0Yy5fPdSY0OIPfqaSj12j8MeqsRZCUDz0eM35697DlZ7qi5dHkxz
	DMiqfso5xYCBu4dW5K7fEm6ntRvl4ffclVaIjDS5MwXiZJXKMfDzAxsR1sAcaA==
X-Gm-Gg: ATEYQzwPATJmQpQu+7zgr9/iyYNk8uf3uzhVAhVdcJNEDWDrNSlssPGO0USloQGKV+q
	QPzsdNBk9IUyjmAXO/+W9NhCqHAmWn5DV0L1+ET/n1ADiMgHrFpSaXIb3YcfCaKQGHzt8t0GR2T
	rbGOHBTGbdQnsleKS4WVEkvZCXkRNs9Duspd8Dil9JxwSQ4SWY64nPlkGAU7sN/wNFJ9jt/5hje
	xGhdpwnauFhfxLSKE5yJhG9aQT+fvLbDgceZeEYgaVHf2/yt9721qs+ODohO4o8rARuUZAB+1ts
	1VrAiLeiZq4msHUEZ++ZfOdnWeHGxNipFVpv//j0cYTAMn8VzaeBj5o46UXPin+qa+is+2eeP/d
	21In0gdKRGBrqRH7+3CfHjq5/e1g5y9oaop33Ic6QlyshS30TmdSQc/GYcDvG+ZYFFpuoZM1Wm4
	Kch7uVYx7SE9bkFf3+4vE=
X-Received: by 2002:a05:6000:40cb:b0:43d:b99:bdcc with SMTP id ffacd0b85a97d-43d150dd744mr12121013f8f.26.1775115244942;
        Thu, 02 Apr 2026 00:34:04 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e6224sm6005807f8f.25.2026.04.02.00.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 00:34:04 -0700 (PDT)
Date: Thu, 2 Apr 2026 10:34:01 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Bart Van Assche <bvanassche@acm.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 38/96]
 drivers/video/fbdev/omap2/omapfb/omapfb-main.c:1126 omapfb_mmap() warn:
 inconsistent returns '&rg->lock'.
Message-ID: <202604012338.d8PQexIR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Message-ID: <20260402073401.-_h82FfVhOlNyu1O-oXcPw-s-nCzRv_e1BOC6EPTsls@z>

tree:   https://github.com/bvanassche/linux thread-safety
head:   c1607d2e734438927b2e2174f2af3912dbdb7e8b
commit: bfb7ef5272e9ee11e27416642e2cfdf1961eb4f8 [38/96] fbdev/omap2: Make the source code easier to analyze
config: arm64-randconfig-r072-20260401
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 585e2a015b29c1a53c4acddeda1b64b3fb3aac39)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604012338.d8PQexIR-lkp@intel.com/

smatch warnings:
drivers/video/fbdev/omap2/omapfb/omapfb-main.c:1126 omapfb_mmap() warn: inconsistent returns '&rg->lock'.

vim +1126 drivers/video/fbdev/omap2/omapfb/omapfb-main.c

b39a982ddecf1d drivers/video/omap2/omapfb/omapfb-main.c       Tomi Valkeinen    2009-08-04  1089  static int omapfb_mmap(struct fb_info *fbi, struct vm_area_struct *vma)
b39a982ddecf1d drivers/video/omap2/omapfb/omapfb-main.c       Tomi Valkeinen    2009-08-04  1090  {
b39a982ddecf1d drivers/video/omap2/omapfb/omapfb-main.c       Tomi Valkeinen    2009-08-04  1091  	struct omapfb_info *ofbi = FB2OFB(fbi);
b39a982ddecf1d drivers/video/omap2/omapfb/omapfb-main.c       Tomi Valkeinen    2009-08-04  1092  	struct fb_fix_screeninfo *fix = &fbi->fix;
bfb7ef5272e9ee drivers/video/fbdev/omap2/omapfb/omapfb-main.c Bart Van Assche   2026-02-06  1093  	struct omapfb2_mem_region *rg = ofbi->region;
b39a982ddecf1d drivers/video/omap2/omapfb/omapfb-main.c       Tomi Valkeinen    2009-08-04  1094  	unsigned long start;
b39a982ddecf1d drivers/video/omap2/omapfb/omapfb-main.c       Tomi Valkeinen    2009-08-04  1095  	u32 len;
6d28c21fe7b092 drivers/video/omap2/omapfb/omapfb-main.c       Tomi Valkeinen    2013-04-17  1096  	int r;
b39a982ddecf1d drivers/video/omap2/omapfb/omapfb-main.c       Tomi Valkeinen    2009-08-04  1097  
76f92201b821dd drivers/video/fbdev/omap2/omapfb/omapfb-main.c Thomas Zimmermann 2023-11-27  1098  	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
76f92201b821dd drivers/video/fbdev/omap2/omapfb/omapfb-main.c Thomas Zimmermann 2023-11-27  1099  
bfb7ef5272e9ee drivers/video/fbdev/omap2/omapfb/omapfb-main.c Bart Van Assche   2026-02-06  1100  	omapfb_get_mem_region(rg);
078ff546a806b2 drivers/video/omap2/omapfb/omapfb-main.c       Ville Syrjälä     2010-03-17  1101  
b39a982ddecf1d drivers/video/omap2/omapfb/omapfb-main.c       Tomi Valkeinen    2009-08-04  1102  	start = omapfb_get_region_paddr(ofbi);
b39a982ddecf1d drivers/video/omap2/omapfb/omapfb-main.c       Tomi Valkeinen    2009-08-04  1103  	len = fix->smem_len;
b39a982ddecf1d drivers/video/omap2/omapfb/omapfb-main.c       Tomi Valkeinen    2009-08-04  1104  
6d28c21fe7b092 drivers/video/omap2/omapfb/omapfb-main.c       Tomi Valkeinen    2013-04-17  1105  	DBG("user mmap region start %lx, len %d, off %lx\n", start, len,
6d28c21fe7b092 drivers/video/omap2/omapfb/omapfb-main.c       Tomi Valkeinen    2013-04-17  1106  			vma->vm_pgoff << PAGE_SHIFT);
b39a982ddecf1d drivers/video/omap2/omapfb/omapfb-main.c       Tomi Valkeinen    2009-08-04  1107  
b39a982ddecf1d drivers/video/omap2/omapfb/omapfb-main.c       Tomi Valkeinen    2009-08-04  1108  	vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
b39a982ddecf1d drivers/video/omap2/omapfb/omapfb-main.c       Tomi Valkeinen    2009-08-04  1109  	vma->vm_ops = &mmap_user_ops;
078ff546a806b2 drivers/video/omap2/omapfb/omapfb-main.c       Ville Syrjälä     2010-03-17  1110  	vma->vm_private_data = rg;
6d28c21fe7b092 drivers/video/omap2/omapfb/omapfb-main.c       Tomi Valkeinen    2013-04-17  1111  
6d28c21fe7b092 drivers/video/omap2/omapfb/omapfb-main.c       Tomi Valkeinen    2013-04-17  1112  	r = vm_iomap_memory(vma, start, len);
6d28c21fe7b092 drivers/video/omap2/omapfb/omapfb-main.c       Tomi Valkeinen    2013-04-17  1113  	if (r)
430571d59a0b51 drivers/video/omap2/omapfb/omapfb-main.c       Ville Syrjälä     2010-03-17  1114  		goto error;
430571d59a0b51 drivers/video/omap2/omapfb/omapfb-main.c       Ville Syrjälä     2010-03-17  1115  
b39a982ddecf1d drivers/video/omap2/omapfb/omapfb-main.c       Tomi Valkeinen    2009-08-04  1116  	/* vm_ops.open won't be called for mmap itself. */
078ff546a806b2 drivers/video/omap2/omapfb/omapfb-main.c       Ville Syrjälä     2010-03-17  1117  	atomic_inc(&rg->map_count);
430571d59a0b51 drivers/video/omap2/omapfb/omapfb-main.c       Ville Syrjälä     2010-03-17  1118  
3ed37d9aba486d drivers/video/omap2/omapfb/omapfb-main.c       Tomi Valkeinen    2012-12-13  1119  	omapfb_put_mem_region(rg);
3ed37d9aba486d drivers/video/omap2/omapfb/omapfb-main.c       Tomi Valkeinen    2012-12-13  1120  
b39a982ddecf1d drivers/video/omap2/omapfb/omapfb-main.c       Tomi Valkeinen    2009-08-04  1121  	return 0;
430571d59a0b51 drivers/video/omap2/omapfb/omapfb-main.c       Ville Syrjälä     2010-03-17  1122  
430571d59a0b51 drivers/video/omap2/omapfb/omapfb-main.c       Ville Syrjälä     2010-03-17  1123  error:
3ed37d9aba486d drivers/video/omap2/omapfb/omapfb-main.c       Tomi Valkeinen    2012-12-13  1124  	omapfb_put_mem_region(ofbi->region);

This is a false positive, but it would be cleaner to change this
as well: s/omapfb_put_mem_region(ofbi->region)/omapfb_put_mem_region(rg)/

3ed37d9aba486d drivers/video/omap2/omapfb/omapfb-main.c       Tomi Valkeinen    2012-12-13  1125  
430571d59a0b51 drivers/video/omap2/omapfb/omapfb-main.c       Ville Syrjälä     2010-03-17 @1126  	return r;
b39a982ddecf1d drivers/video/omap2/omapfb/omapfb-main.c       Tomi Valkeinen    2009-08-04  1127  }
b39a982ddecf1d drivers/video/omap2/omapfb/omapfb-main.c       Tomi Valkeinen    2009-08-04  1128  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
