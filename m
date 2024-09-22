Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7822576F
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Sep 2024 22:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727045658; cv=none; b=s2xwVdaCv+dsuEciuGiqm7s0SdvAI3AH8x5QE4jtl6DnaZ0R0IAm1s3SFGDeb4sd5QLejC5O4NCxmQST2nbauo+0ve/3RIEzIB/0VIA87xx+nPrz8I8M1CUZfP6JNkqoxAcw9+YF3oBFgqU7HC+b3iUu0tWYoezT8QuF/yZaiWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727045658; c=relaxed/simple;
	bh=tdCb+rs4maftFqOJUsi82SuLAzXbGnG6LIGMLtD474s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aOrRcacJg0Rx+roOsJnry6dENsG5iuele4u80c327c5cCL6x2uc9kAd85T2FHdlOIXiBafsiTpGeJq4GFE28HTxT5WPfT2SCo83uMiDpFMqGv9Fhi03VSQ1dL6svwIc+iYYpNhzfoId/K087xeS8cvPpbBQXRK5Rp9dr/B74YW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bXAvWS1k; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bXAvWS1k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727045656; x=1758581656;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tdCb+rs4maftFqOJUsi82SuLAzXbGnG6LIGMLtD474s=;
  b=bXAvWS1ka1mNikcRxuaq2d1liaWsuoI7tnc9QoE+D7jGUG6g1c/cqkSG
   Cy80cj9uvwjZ+NuzWzu9hbMychibdiAlj0YoePaRLLMNeSCa08lhwRQm8
   x0UPrcIrtEuRCzdf9v0k6h5kBzlYl1VC5tbw5Sk3I4zPSWcZErNlrazzv
   bYyH8tBlvtZC2ypyR2yang30rCVfv/02IyBRQWtda3sQnekvz2RGuTVen
   9cK/g9PnxMNrWo9neRY9bufnmK04nIW69b85vpGhBTyOhy/dM43E6/F8G
   VYGjqZeh8D4gzBHHdlo5mvSP7R9WPG7RAKH284mzZ0TzaGJVL83tEx1Ze
   A==;
X-CSE-ConnectionGUID: Bh0HrURNSHuBTRN1GoLcSg==
X-CSE-MsgGUID: 1eKuXGIOS/SZGq4EesEFDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="13629781"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="13629781"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 15:54:15 -0700
X-CSE-ConnectionGUID: tlqM3m+SQ6e3ojx635dfQw==
X-CSE-MsgGUID: e7oA3L8PQTmZwtyYg5y9VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="70460094"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 22 Sep 2024 15:54:13 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssVT1-000Gie-10;
	Sun, 22 Sep 2024 22:54:11 +0000
Date: Mon, 23 Sep 2024 06:53:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 18/26] drm: sun4i: de3: Implement AFBC support
Message-ID: <202409230531.ZMb79p9h-lkp@intel.com>
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
In-Reply-To: <20240921095153.213568-19-ryan@testtoast.com>
References: <20240921095153.213568-19-ryan@testtoast.com>
TO: Ryan Walklin <ryan@testtoast.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: "Chen-Yu Tsai" <wens@csie.org>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: David Airlie <airlied@gmail.com>
TO: Daniel Vetter <daniel@ffwll.ch>
TO: Jernej Skrabec <jernej.skrabec@gmail.com>
TO: Samuel Holland <samuel@sholland.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
CC: Andre Przywara <andre.przywara@arm.com>
CC: Chris Morgan <macroalpha82@gmail.com>
CC: John Watts <contact@jookia.org>
CC: dri-devel@lists.freedesktop.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-sunxi@lists.linux.dev
CC: devicetree@vger.kernel.org
CC: linux-clk@vger.kernel.org
CC: Ryan Walklin <ryan@testtoast.com>

Hi Ryan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on sunxi/sunxi/for-next]
[also build test WARNING on robh/for-next clk/clk-next linus/master v6.11 next-20240920]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Walklin/drm-sun4i-de2-de3-Change-CSC-argument/20240921-175532
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi/for-next
patch link:    https://lore.kernel.org/r/20240921095153.213568-19-ryan%40testtoast.com
patch subject: [PATCH v4 18/26] drm: sun4i: de3: Implement AFBC support
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: microblaze-randconfig-r071-20240922 (https://download.01.org/0day-ci/archive/20240923/202409230531.ZMb79p9h-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409230531.ZMb79p9h-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/sun4i/sun50i_afbc.c:236 sun50i_afbc_atomic_update() warn: right shifting more than type allows 16 vs 16

vim +236 drivers/gpu/drm/sun4i/sun50i_afbc.c

757b2767d5472c Jernej Skrabec 2024-09-21   69  
757b2767d5472c Jernej Skrabec 2024-09-21   70  void sun50i_afbc_atomic_update(struct sun8i_mixer *mixer, unsigned int channel,
757b2767d5472c Jernej Skrabec 2024-09-21   71  			       struct drm_plane *plane)
757b2767d5472c Jernej Skrabec 2024-09-21   72  {
757b2767d5472c Jernej Skrabec 2024-09-21   73  	struct drm_plane_state *state = plane->state;
757b2767d5472c Jernej Skrabec 2024-09-21   74  	struct drm_framebuffer *fb = state->fb;
757b2767d5472c Jernej Skrabec 2024-09-21   75  	const struct drm_format_info *format = fb->format;
757b2767d5472c Jernej Skrabec 2024-09-21   76  	struct drm_gem_dma_object *gem;
757b2767d5472c Jernej Skrabec 2024-09-21   77  	u32 base, val, src_w, src_h;
757b2767d5472c Jernej Skrabec 2024-09-21   78  	u32 def_color0, def_color1;
757b2767d5472c Jernej Skrabec 2024-09-21   79  	struct regmap *regs;
757b2767d5472c Jernej Skrabec 2024-09-21   80  	dma_addr_t dma_addr;
757b2767d5472c Jernej Skrabec 2024-09-21   81  
757b2767d5472c Jernej Skrabec 2024-09-21   82  	base = sun50i_afbc_get_base(mixer, channel);
757b2767d5472c Jernej Skrabec 2024-09-21   83  	regs = mixer->engine.regs;
757b2767d5472c Jernej Skrabec 2024-09-21   84  
757b2767d5472c Jernej Skrabec 2024-09-21   85  	src_w = drm_rect_width(&state->src) >> 16;
757b2767d5472c Jernej Skrabec 2024-09-21   86  	src_h = drm_rect_height(&state->src) >> 16;
757b2767d5472c Jernej Skrabec 2024-09-21   87  
757b2767d5472c Jernej Skrabec 2024-09-21   88  	val = SUN50I_FBD_SIZE_HEIGHT(src_h);
757b2767d5472c Jernej Skrabec 2024-09-21   89  	val |= SUN50I_FBD_SIZE_WIDTH(src_w);
757b2767d5472c Jernej Skrabec 2024-09-21   90  	regmap_write(regs, SUN50I_FBD_SIZE(base), val);
757b2767d5472c Jernej Skrabec 2024-09-21   91  
757b2767d5472c Jernej Skrabec 2024-09-21   92  	val = SUN50I_FBD_BLK_SIZE_HEIGHT(DIV_ROUND_UP(src_h, 16));
757b2767d5472c Jernej Skrabec 2024-09-21   93  	val = SUN50I_FBD_BLK_SIZE_WIDTH(DIV_ROUND_UP(src_w, 16));
757b2767d5472c Jernej Skrabec 2024-09-21   94  	regmap_write(regs, SUN50I_FBD_BLK_SIZE(base), val);
757b2767d5472c Jernej Skrabec 2024-09-21   95  
757b2767d5472c Jernej Skrabec 2024-09-21   96  	val = SUN50I_FBD_SRC_CROP_TOP(0);
757b2767d5472c Jernej Skrabec 2024-09-21   97  	val |= SUN50I_FBD_SRC_CROP_LEFT(0);
757b2767d5472c Jernej Skrabec 2024-09-21   98  	regmap_write(regs, SUN50I_FBD_SRC_CROP(base), val);
757b2767d5472c Jernej Skrabec 2024-09-21   99  
757b2767d5472c Jernej Skrabec 2024-09-21  100  	val = SUN50I_FBD_LAY_CROP_TOP(state->src.y1 >> 16);
757b2767d5472c Jernej Skrabec 2024-09-21  101  	val |= SUN50I_FBD_LAY_CROP_LEFT(state->src.x1 >> 16);
757b2767d5472c Jernej Skrabec 2024-09-21  102  	regmap_write(regs, SUN50I_FBD_LAY_CROP(base), val);
757b2767d5472c Jernej Skrabec 2024-09-21  103  
757b2767d5472c Jernej Skrabec 2024-09-21  104  	/*
757b2767d5472c Jernej Skrabec 2024-09-21  105  	 * Default color is always set to white, in colorspace and bitness
757b2767d5472c Jernej Skrabec 2024-09-21  106  	 * that coresponds to used format. If it is actually used or not
757b2767d5472c Jernej Skrabec 2024-09-21  107  	 * depends on AFBC buffer. At least in Cedrus it can be turned on
757b2767d5472c Jernej Skrabec 2024-09-21  108  	 * or off.
757b2767d5472c Jernej Skrabec 2024-09-21  109  	 * NOTE: G and B channels are off by 1 (up). It's unclear if this
757b2767d5472c Jernej Skrabec 2024-09-21  110  	 * is because HW need such value or it is due to good enough code
757b2767d5472c Jernej Skrabec 2024-09-21  111  	 * in vendor driver and HW clips the value anyway.
757b2767d5472c Jernej Skrabec 2024-09-21  112  	 */
757b2767d5472c Jernej Skrabec 2024-09-21  113  	def_color0 = 0;
757b2767d5472c Jernej Skrabec 2024-09-21  114  	def_color1 = 0;
757b2767d5472c Jernej Skrabec 2024-09-21  115  
757b2767d5472c Jernej Skrabec 2024-09-21  116  	val = 0;
757b2767d5472c Jernej Skrabec 2024-09-21  117  	switch (format->format) {
757b2767d5472c Jernej Skrabec 2024-09-21  118  	case DRM_FORMAT_YUYV:
757b2767d5472c Jernej Skrabec 2024-09-21  119  	case DRM_FORMAT_YUV420_10BIT:
757b2767d5472c Jernej Skrabec 2024-09-21  120  		val |= SUN50I_FBD_FMT_SBS1(2);
757b2767d5472c Jernej Skrabec 2024-09-21  121  		val |= SUN50I_FBD_FMT_SBS0(1);
757b2767d5472c Jernej Skrabec 2024-09-21  122  		break;
757b2767d5472c Jernej Skrabec 2024-09-21  123  	case DRM_FORMAT_Y210:
757b2767d5472c Jernej Skrabec 2024-09-21  124  		val |= SUN50I_FBD_FMT_SBS1(3);
757b2767d5472c Jernej Skrabec 2024-09-21  125  		val |= SUN50I_FBD_FMT_SBS0(2);
757b2767d5472c Jernej Skrabec 2024-09-21  126  		break;
757b2767d5472c Jernej Skrabec 2024-09-21  127  	default:
757b2767d5472c Jernej Skrabec 2024-09-21  128  		val |= SUN50I_FBD_FMT_SBS1(1);
757b2767d5472c Jernej Skrabec 2024-09-21  129  		val |= SUN50I_FBD_FMT_SBS0(1);
757b2767d5472c Jernej Skrabec 2024-09-21  130  		break;
757b2767d5472c Jernej Skrabec 2024-09-21  131  	}
757b2767d5472c Jernej Skrabec 2024-09-21  132  	switch (format->format) {
757b2767d5472c Jernej Skrabec 2024-09-21  133  	case DRM_FORMAT_RGBA8888:
757b2767d5472c Jernej Skrabec 2024-09-21  134  		val |= SUN50I_FBD_FMT_YUV_TRAN;
757b2767d5472c Jernej Skrabec 2024-09-21  135  		val |= SUN50I_FBD_FMT_IN_FMT(SUN50I_AFBC_RGBA_8888);
757b2767d5472c Jernej Skrabec 2024-09-21  136  		def_color0 = SUN50I_FBD_DEFAULT_COLOR0_ALPHA(255) |
757b2767d5472c Jernej Skrabec 2024-09-21  137  			     SUN50I_FBD_DEFAULT_COLOR0_YR(255);
757b2767d5472c Jernej Skrabec 2024-09-21  138  		def_color1 = SUN50I_FBD_DEFAULT_COLOR1_UG(256) |
757b2767d5472c Jernej Skrabec 2024-09-21  139  			     SUN50I_FBD_DEFAULT_COLOR1_VB(256);
757b2767d5472c Jernej Skrabec 2024-09-21  140  		break;
757b2767d5472c Jernej Skrabec 2024-09-21  141  	case DRM_FORMAT_RGB888:
757b2767d5472c Jernej Skrabec 2024-09-21  142  		val |= SUN50I_FBD_FMT_YUV_TRAN;
757b2767d5472c Jernej Skrabec 2024-09-21  143  		val |= SUN50I_FBD_FMT_IN_FMT(SUN50I_AFBC_RGB_888);
757b2767d5472c Jernej Skrabec 2024-09-21  144  		def_color0 = SUN50I_FBD_DEFAULT_COLOR0_ALPHA(0) |
757b2767d5472c Jernej Skrabec 2024-09-21  145  			     SUN50I_FBD_DEFAULT_COLOR0_YR(255);
757b2767d5472c Jernej Skrabec 2024-09-21  146  		def_color1 = SUN50I_FBD_DEFAULT_COLOR1_UG(256) |
757b2767d5472c Jernej Skrabec 2024-09-21  147  			     SUN50I_FBD_DEFAULT_COLOR1_VB(256);
757b2767d5472c Jernej Skrabec 2024-09-21  148  		break;
757b2767d5472c Jernej Skrabec 2024-09-21  149  	case DRM_FORMAT_RGB565:
757b2767d5472c Jernej Skrabec 2024-09-21  150  		val |= SUN50I_FBD_FMT_YUV_TRAN;
757b2767d5472c Jernej Skrabec 2024-09-21  151  		val |= SUN50I_FBD_FMT_IN_FMT(SUN50I_AFBC_RGB_565);
757b2767d5472c Jernej Skrabec 2024-09-21  152  		def_color0 = SUN50I_FBD_DEFAULT_COLOR0_ALPHA(0) |
757b2767d5472c Jernej Skrabec 2024-09-21  153  			     SUN50I_FBD_DEFAULT_COLOR0_YR(31);
757b2767d5472c Jernej Skrabec 2024-09-21  154  		def_color1 = SUN50I_FBD_DEFAULT_COLOR1_UG(64) |
757b2767d5472c Jernej Skrabec 2024-09-21  155  			     SUN50I_FBD_DEFAULT_COLOR1_VB(32);
757b2767d5472c Jernej Skrabec 2024-09-21  156  		break;
757b2767d5472c Jernej Skrabec 2024-09-21  157  	case DRM_FORMAT_RGBA4444:
757b2767d5472c Jernej Skrabec 2024-09-21  158  		val |= SUN50I_FBD_FMT_YUV_TRAN;
757b2767d5472c Jernej Skrabec 2024-09-21  159  		val |= SUN50I_FBD_FMT_IN_FMT(SUN50I_AFBC_RGBA_4444);
757b2767d5472c Jernej Skrabec 2024-09-21  160  		def_color0 = SUN50I_FBD_DEFAULT_COLOR0_ALPHA(15) |
757b2767d5472c Jernej Skrabec 2024-09-21  161  			     SUN50I_FBD_DEFAULT_COLOR0_YR(15);
757b2767d5472c Jernej Skrabec 2024-09-21  162  		def_color1 = SUN50I_FBD_DEFAULT_COLOR1_UG(16) |
757b2767d5472c Jernej Skrabec 2024-09-21  163  			     SUN50I_FBD_DEFAULT_COLOR1_VB(16);
757b2767d5472c Jernej Skrabec 2024-09-21  164  		break;
757b2767d5472c Jernej Skrabec 2024-09-21  165  	case DRM_FORMAT_RGBA5551:
757b2767d5472c Jernej Skrabec 2024-09-21  166  		val |= SUN50I_FBD_FMT_YUV_TRAN;
757b2767d5472c Jernej Skrabec 2024-09-21  167  		val |= SUN50I_FBD_FMT_IN_FMT(SUN50I_AFBC_RGBA_5551);
757b2767d5472c Jernej Skrabec 2024-09-21  168  		def_color0 = SUN50I_FBD_DEFAULT_COLOR0_ALPHA(1) |
757b2767d5472c Jernej Skrabec 2024-09-21  169  			     SUN50I_FBD_DEFAULT_COLOR0_YR(31);
757b2767d5472c Jernej Skrabec 2024-09-21  170  		def_color1 = SUN50I_FBD_DEFAULT_COLOR1_UG(32) |
757b2767d5472c Jernej Skrabec 2024-09-21  171  			     SUN50I_FBD_DEFAULT_COLOR1_VB(32);
757b2767d5472c Jernej Skrabec 2024-09-21  172  		break;
757b2767d5472c Jernej Skrabec 2024-09-21  173  	case DRM_FORMAT_RGBA1010102:
757b2767d5472c Jernej Skrabec 2024-09-21  174  		val |= SUN50I_FBD_FMT_YUV_TRAN;
757b2767d5472c Jernej Skrabec 2024-09-21  175  		val |= SUN50I_FBD_FMT_IN_FMT(SUN50I_AFBC_RGBA1010102);
757b2767d5472c Jernej Skrabec 2024-09-21  176  		def_color0 = SUN50I_FBD_DEFAULT_COLOR0_ALPHA(3) |
757b2767d5472c Jernej Skrabec 2024-09-21  177  			     SUN50I_FBD_DEFAULT_COLOR0_YR(1023);
757b2767d5472c Jernej Skrabec 2024-09-21  178  		def_color1 = SUN50I_FBD_DEFAULT_COLOR1_UG(1024) |
757b2767d5472c Jernej Skrabec 2024-09-21  179  			     SUN50I_FBD_DEFAULT_COLOR1_VB(1024);
757b2767d5472c Jernej Skrabec 2024-09-21  180  		break;
757b2767d5472c Jernej Skrabec 2024-09-21  181  	case DRM_FORMAT_YUV420_8BIT:
757b2767d5472c Jernej Skrabec 2024-09-21  182  		val |= SUN50I_FBD_FMT_IN_FMT(SUN50I_AFBC_YUV420);
757b2767d5472c Jernej Skrabec 2024-09-21  183  		def_color0 = SUN50I_FBD_DEFAULT_COLOR0_ALPHA(0) |
757b2767d5472c Jernej Skrabec 2024-09-21  184  			     SUN50I_FBD_DEFAULT_COLOR0_YR(255);
757b2767d5472c Jernej Skrabec 2024-09-21  185  		def_color1 = SUN50I_FBD_DEFAULT_COLOR1_UG(128) |
757b2767d5472c Jernej Skrabec 2024-09-21  186  			     SUN50I_FBD_DEFAULT_COLOR1_VB(128);
757b2767d5472c Jernej Skrabec 2024-09-21  187  		break;
757b2767d5472c Jernej Skrabec 2024-09-21  188  	case DRM_FORMAT_YUYV:
757b2767d5472c Jernej Skrabec 2024-09-21  189  		val |= SUN50I_FBD_FMT_IN_FMT(SUN50I_AFBC_YUV422);
757b2767d5472c Jernej Skrabec 2024-09-21  190  		def_color0 = SUN50I_FBD_DEFAULT_COLOR0_ALPHA(0) |
757b2767d5472c Jernej Skrabec 2024-09-21  191  			     SUN50I_FBD_DEFAULT_COLOR0_YR(255);
757b2767d5472c Jernej Skrabec 2024-09-21  192  		def_color1 = SUN50I_FBD_DEFAULT_COLOR1_UG(128) |
757b2767d5472c Jernej Skrabec 2024-09-21  193  			     SUN50I_FBD_DEFAULT_COLOR1_VB(128);
757b2767d5472c Jernej Skrabec 2024-09-21  194  		break;
757b2767d5472c Jernej Skrabec 2024-09-21  195  	case DRM_FORMAT_YUV420_10BIT:
757b2767d5472c Jernej Skrabec 2024-09-21  196  		val |= SUN50I_FBD_FMT_IN_FMT(SUN50I_AFBC_P010);
757b2767d5472c Jernej Skrabec 2024-09-21  197  		def_color0 = SUN50I_FBD_DEFAULT_COLOR0_ALPHA(0) |
757b2767d5472c Jernej Skrabec 2024-09-21  198  			     SUN50I_FBD_DEFAULT_COLOR0_YR(1023);
757b2767d5472c Jernej Skrabec 2024-09-21  199  		def_color1 = SUN50I_FBD_DEFAULT_COLOR1_UG(512) |
757b2767d5472c Jernej Skrabec 2024-09-21  200  			     SUN50I_FBD_DEFAULT_COLOR1_VB(512);
757b2767d5472c Jernej Skrabec 2024-09-21  201  		break;
757b2767d5472c Jernej Skrabec 2024-09-21  202  	case DRM_FORMAT_Y210:
757b2767d5472c Jernej Skrabec 2024-09-21  203  		val |= SUN50I_FBD_FMT_IN_FMT(SUN50I_AFBC_P210);
757b2767d5472c Jernej Skrabec 2024-09-21  204  		def_color0 = SUN50I_FBD_DEFAULT_COLOR0_ALPHA(0) |
757b2767d5472c Jernej Skrabec 2024-09-21  205  			     SUN50I_FBD_DEFAULT_COLOR0_YR(1023);
757b2767d5472c Jernej Skrabec 2024-09-21  206  		def_color1 = SUN50I_FBD_DEFAULT_COLOR1_UG(512) |
757b2767d5472c Jernej Skrabec 2024-09-21  207  			     SUN50I_FBD_DEFAULT_COLOR1_VB(512);
757b2767d5472c Jernej Skrabec 2024-09-21  208  		break;
757b2767d5472c Jernej Skrabec 2024-09-21  209  	}
757b2767d5472c Jernej Skrabec 2024-09-21  210  	regmap_write(regs, SUN50I_FBD_FMT(base), val);
757b2767d5472c Jernej Skrabec 2024-09-21  211  
757b2767d5472c Jernej Skrabec 2024-09-21  212  	/* Get the physical address of the buffer in memory */
757b2767d5472c Jernej Skrabec 2024-09-21  213  	gem = drm_fb_dma_get_gem_obj(fb, 0);
757b2767d5472c Jernej Skrabec 2024-09-21  214  
757b2767d5472c Jernej Skrabec 2024-09-21  215  	DRM_DEBUG_DRIVER("Using GEM @ %pad\n", &gem->dma_addr);
757b2767d5472c Jernej Skrabec 2024-09-21  216  
757b2767d5472c Jernej Skrabec 2024-09-21  217  	/* Compute the start of the displayed memory */
757b2767d5472c Jernej Skrabec 2024-09-21  218  	dma_addr = gem->dma_addr + fb->offsets[0];
757b2767d5472c Jernej Skrabec 2024-09-21  219  
757b2767d5472c Jernej Skrabec 2024-09-21  220  	regmap_write(regs, SUN50I_FBD_LADDR(base), lower_32_bits(dma_addr));
757b2767d5472c Jernej Skrabec 2024-09-21  221  	regmap_write(regs, SUN50I_FBD_HADDR(base), upper_32_bits(dma_addr));
757b2767d5472c Jernej Skrabec 2024-09-21  222  
757b2767d5472c Jernej Skrabec 2024-09-21  223  	val = SUN50I_FBD_OVL_SIZE_HEIGHT(src_h);
757b2767d5472c Jernej Skrabec 2024-09-21  224  	val |= SUN50I_FBD_OVL_SIZE_WIDTH(src_w);
757b2767d5472c Jernej Skrabec 2024-09-21  225  	regmap_write(regs, SUN50I_FBD_OVL_SIZE(base), val);
757b2767d5472c Jernej Skrabec 2024-09-21  226  
757b2767d5472c Jernej Skrabec 2024-09-21  227  	val = SUN50I_FBD_OVL_COOR_Y(0);
757b2767d5472c Jernej Skrabec 2024-09-21  228  	val |= SUN50I_FBD_OVL_COOR_X(0);
757b2767d5472c Jernej Skrabec 2024-09-21  229  	regmap_write(regs, SUN50I_FBD_OVL_COOR(base), val);
757b2767d5472c Jernej Skrabec 2024-09-21  230  
757b2767d5472c Jernej Skrabec 2024-09-21  231  	regmap_write(regs, SUN50I_FBD_OVL_BG_COLOR(base),
757b2767d5472c Jernej Skrabec 2024-09-21  232  		     SUN8I_MIXER_BLEND_COLOR_BLACK);
757b2767d5472c Jernej Skrabec 2024-09-21  233  	regmap_write(regs, SUN50I_FBD_DEFAULT_COLOR0(base), def_color0);
757b2767d5472c Jernej Skrabec 2024-09-21  234  	regmap_write(regs, SUN50I_FBD_DEFAULT_COLOR1(base), def_color1);
757b2767d5472c Jernej Skrabec 2024-09-21  235  
757b2767d5472c Jernej Skrabec 2024-09-21 @236  	val = SUN50I_FBD_CTL_GLB_ALPHA(state->alpha >> 16);
757b2767d5472c Jernej Skrabec 2024-09-21  237  	val |= SUN50I_FBD_CTL_CLK_GATE;
757b2767d5472c Jernej Skrabec 2024-09-21  238  	val |= (state->alpha == DRM_BLEND_ALPHA_OPAQUE) ?
757b2767d5472c Jernej Skrabec 2024-09-21  239  		SUN50I_FBD_CTL_ALPHA_MODE_PIXEL :
757b2767d5472c Jernej Skrabec 2024-09-21  240  		SUN50I_FBD_CTL_ALPHA_MODE_COMBINED;
757b2767d5472c Jernej Skrabec 2024-09-21  241  	val |= SUN50I_FBD_CTL_FBD_EN;
757b2767d5472c Jernej Skrabec 2024-09-21  242  	regmap_write(regs, SUN50I_FBD_CTL(base), val);
757b2767d5472c Jernej Skrabec 2024-09-21  243  }
757b2767d5472c Jernej Skrabec 2024-09-21  244  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
