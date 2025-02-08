Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6302500D6
	for <oe-kbuild@lists.linux.dev>; Sat,  8 Feb 2025 15:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739029461; cv=none; b=HL4REckz/wVdDRrIeEx3ewuL8IwQfOlY66c9US+zMq7Uu0LKmfuHHiWymbNuRCflPu9PZroRt16RbKl5eMGa6luDf38Zr75cRRa+6iBgCTDXfNIPg75ESvJ4cSUbBqWSBHyUY41M86u3WFX1zYzvn4J/R0DknwbJw0AaU0PxVe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739029461; c=relaxed/simple;
	bh=Zy117Zt/qN7qDR2Nt79NUUC52kRwB1FGO1axZ9hbmbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RgK0dQtKCUNNKPD4c2kXd2thp7KXXzuVYL5AODj1CPdmFK+q3koqCbvhdVUXZ+U39J7k+bHY9M38Rrhg+WYDOytVy2YVEy1UMvD916aafVApeduagWCKD488Mf6R/U7CJUGwLnxtDGGdcQMkGCeuuEh6Tee7cPHNG9pU2QTybFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bRs1yBwb; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bRs1yBwb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739029459; x=1770565459;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zy117Zt/qN7qDR2Nt79NUUC52kRwB1FGO1axZ9hbmbQ=;
  b=bRs1yBwbz/N3WFSqPBLpDgC7l1/0M2p2Ao1IufsLJw+pr+vdLBWKGvsC
   DHN/fTIl9EZH5TWx02TTBbVvVyWOyNc4JjKYrl/V0TzCIAoWDhFMyiWbd
   lB/CWs376+4PhEav6RPI2s4n0y+7WBbJVKHskeNR4eajEmg0HxCgVcTS0
   xaxMRHnAs7kwETXtWfX7Uf4BZd02/uJbzf62dM65bvYDzJ6TdWSX4E+qP
   iljwLLWqnzyvFILq9Y2857Bk31Fxbyi3J1TFyiG9uh8BMe7uI5h2+80LA
   +WRNEfFs5zThCB5yMPmBVYY8Avn09rgl287hxu5QpO7KBsL+rxHq1c7Wz
   w==;
X-CSE-ConnectionGUID: HEgFLf6hTmq191nGv/05wg==
X-CSE-MsgGUID: SKJCrFh9Q0+cP1cGogjfQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="50285380"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="50285380"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 07:44:16 -0800
X-CSE-ConnectionGUID: r3/NZ8PeTCabfG5rZeeiSA==
X-CSE-MsgGUID: ymFzMWv8S9mWDkHgUKdQOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112682434"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 Feb 2025 07:44:15 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgn08-0010E3-2F;
	Sat, 08 Feb 2025 15:44:12 +0000
Date: Sat, 8 Feb 2025 23:43:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [deller-fbdev:for-next 13/15]
 drivers/video/fbdev/core/fb_imageblit.h:297 fast_imageblit() error:
 uninitialized symbol 'j'.
Message-ID: <202502082357.cBJ9n0lf-lkp@intel.com>
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
TO: Zsolt Kajtar <soci@c64.rulez.org>
CC: Helge Deller <deller@gmx.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git for-next
head:   720fcad9d12e92368192689a90e2b932a1e44406
commit: d244899de08c324fdcf4dbed95ecb64ea292ff61 [13/15] fbdev: core: Use generic imageblit for as cfb_imageblit
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: arm64-randconfig-r072-20250208 (https://download.01.org/0day-ci/archive/20250208/202502082357.cBJ9n0lf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502082357.cBJ9n0lf-lkp@intel.com/

smatch warnings:
drivers/video/fbdev/core/fb_imageblit.h:297 fast_imageblit() error: uninitialized symbol 'j'.

vim +/j +297 drivers/video/fbdev/core/fb_imageblit.h

d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  199  
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  200  /*
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  201   * fast_imageblit - optimized monochrome color expansion
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  202   *
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  203   * Only if:  bits_per_pixel == 8, 16, or 32
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  204   *           image->width is divisible by pixel/dword (ppw);
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  205   *           fix->line_legth is divisible by 4;
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  206   *           beginning and end of a scanline is dword aligned
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  207   */
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  208  static inline void fast_imageblit(const struct fb_image *image, struct fb_info *p,
24d36dc5bee2bf Zsolt Kajtar 2025-02-07  209                                    u8 FB_MEM *dst1, u32 fgcolor,
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  210                                    u32 bgcolor)
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  211  {
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  212          u32 fgx = fgcolor, bgx = bgcolor, bpp = p->var.bits_per_pixel;
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  213          u32 ppw = 32/bpp, spitch = (image->width + 7)/8;
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  214          u32 bit_mask, eorx, shift;
24d36dc5bee2bf Zsolt Kajtar 2025-02-07  215          const u8 *s = image->data, *src;
24d36dc5bee2bf Zsolt Kajtar 2025-02-07  216          u32 FB_MEM *dst;
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  217          const u32 *tab = NULL;
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  218          size_t tablen;
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  219          u32 colortab[16];
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  220          int i, j, k;
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  221  
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  222          switch (bpp) {
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  223          case 8:
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  224                  tab = fb_be_math(p) ? cfb_tab8_be : cfb_tab8_le;
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  225                  tablen = 16;
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  226                  break;
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  227          case 16:
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  228                  tab = fb_be_math(p) ? cfb_tab16_be : cfb_tab16_le;
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  229                  tablen = 4;
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  230                  break;
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  231          case 32:
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  232                  tab = cfb_tab32;
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  233                  tablen = 2;
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  234                  break;
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  235          default:
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  236                  return;
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  237          }
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  238  
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  239          for (i = ppw-1; i--; ) {
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  240                  fgx <<= bpp;
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  241                  bgx <<= bpp;
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  242                  fgx |= fgcolor;
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  243                  bgx |= bgcolor;
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  244          }
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  245  
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  246          bit_mask = (1 << ppw) - 1;
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  247          eorx = fgx ^ bgx;
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  248          k = image->width/ppw;
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  249  
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  250          for (i = 0; i < tablen; ++i)
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  251                  colortab[i] = (tab[i] & eorx) ^ bgx;
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  252  
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  253          for (i = image->height; i--; ) {
24d36dc5bee2bf Zsolt Kajtar 2025-02-07  254                  dst = (u32 FB_MEM *)dst1;
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  255                  shift = 8;
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  256                  src = s;
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  257  
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  258                  /*
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  259                   * Manually unroll the per-line copying loop for better
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  260                   * performance. This works until we processed the last
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  261                   * completely filled source byte (inclusive).
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  262                   */
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  263                  switch (ppw) {
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  264                  case 4: /* 8 bpp */
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  265                          for (j = k; j >= 2; j -= 2, ++src) {
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  266                                  FB_WRITEL(colortab[(*src >> 4) & bit_mask], dst++);
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  267                                  FB_WRITEL(colortab[(*src >> 0) & bit_mask], dst++);
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  268                          }
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  269                          break;
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  270                  case 2: /* 16 bpp */
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  271                          for (j = k; j >= 4; j -= 4, ++src) {
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  272                                  FB_WRITEL(colortab[(*src >> 6) & bit_mask], dst++);
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  273                                  FB_WRITEL(colortab[(*src >> 4) & bit_mask], dst++);
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  274                                  FB_WRITEL(colortab[(*src >> 2) & bit_mask], dst++);
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  275                                  FB_WRITEL(colortab[(*src >> 0) & bit_mask], dst++);
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  276                          }
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  277                          break;
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  278                  case 1: /* 32 bpp */
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  279                          for (j = k; j >= 8; j -= 8, ++src) {
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  280                                  FB_WRITEL(colortab[(*src >> 7) & bit_mask], dst++);
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  281                                  FB_WRITEL(colortab[(*src >> 6) & bit_mask], dst++);
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  282                                  FB_WRITEL(colortab[(*src >> 5) & bit_mask], dst++);
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  283                                  FB_WRITEL(colortab[(*src >> 4) & bit_mask], dst++);
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  284                                  FB_WRITEL(colortab[(*src >> 3) & bit_mask], dst++);
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  285                                  FB_WRITEL(colortab[(*src >> 2) & bit_mask], dst++);
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  286                                  FB_WRITEL(colortab[(*src >> 1) & bit_mask], dst++);
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  287                                  FB_WRITEL(colortab[(*src >> 0) & bit_mask], dst++);
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  288                          }
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  289                          break;
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  290                  }
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  291  
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  292                  /*
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  293                   * For image widths that are not a multiple of 8, there
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  294                   * are trailing pixels left on the current line. Print
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  295                   * them as well.
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  296                   */
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07 @297                  for (; j--; ) {
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  298                          shift -= ppw;
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  299                          FB_WRITEL(colortab[(*src >> shift) & bit_mask], dst++);
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  300                          if (!shift) {
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  301                                  shift = 8;
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  302                                  ++src;
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  303                          }
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  304                  }
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  305  
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  306                  dst1 += p->fix.line_length;
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  307                  s += spitch;
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  308          }
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  309  }
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  310  

:::::: The code at line 297 was first introduced by commit
:::::: d933e6d9f4eb8e4a9cabd14371c2aceefe90032a fbdev: core: Copy cfbimgblt to fb_imageblit

:::::: TO: Zsolt Kajtar <soci@c64.rulez.org>
:::::: CC: Helge Deller <deller@gmx.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
