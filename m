Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9A44C74
	for <oe-kbuild@lists.linux.dev>; Sat,  1 Jun 2024 01:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717205381; cv=none; b=on8fHWA6YebUDpGg195ElAbSQaAhupcXn7OALpMUrz8k6oDj0f1XGzznrGeC/Z5hRT4xX4ouo71CO7RObXQ7MAQt80XXGq73/I8lqGH3neyjQKGu1d2brfMwMHCLuYe/ZkLEwF3CfUTxYXG9adG4atN3MU+RcnZUKKmm3lpnWsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717205381; c=relaxed/simple;
	bh=J65nj0St4g5lYNDh2r6y+WSBXhQXKjYzQQ/XxZVmp+o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RXUtdNRki5VzqnBZrG5NgBR5tWy5MCiAwQGFYQIA8HhEI/gvcgz62JTLGUQ4MTPbkYe+3qNt9m34m/oVjXehcE27Vw0YLKUoTEBUe1sDHzZWtQ8NhkJEFy3wp2bicTj4Kq2NitrrXFB/umj3TrJzf6rQ5rx++JW0iWAaC93NJhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PAw7aTAq; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PAw7aTAq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717205379; x=1748741379;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J65nj0St4g5lYNDh2r6y+WSBXhQXKjYzQQ/XxZVmp+o=;
  b=PAw7aTAqicZKxr4zGdbYXXBjEt8ftPFlHNXyUiPQ19NrZUmxKKu7xCFI
   EB+9BJuD7SFXG5kAFZlsecc1OdwreHVMuVgETCExq41Db4vfbtyFt4VWK
   ZK+7wSgtPiU7cSiSCm6BtC/jZwoFzSQ63tswfH7KLZmhoCvIudzD+sTpU
   G/GBXzsiggd2WmtBO4lkpNsVfm34ivK20Jj9H2trzdlNzN+aO4Yldk76a
   JmJwuBp7oPhU7nOGDJrJmq67UNN6+bY5cKVSmv0P+tAv2NdhUvVYoGI28
   wdQT9hQo+zfOhWwZwJwPNe+TU5Y4Uid9q0P0ZIAjXz+hEud1FHXemQfRO
   w==;
X-CSE-ConnectionGUID: dhb9ExtfQDipNPsYsgO8bQ==
X-CSE-MsgGUID: DmQyMU0wRTme/Db9SQ9Q+A==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="24400285"
X-IronPort-AV: E=Sophos;i="6.08,206,1712646000"; 
   d="scan'208";a="24400285"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 18:29:37 -0700
X-CSE-ConnectionGUID: wekcrLsWTSC8/vdfQPagSA==
X-CSE-MsgGUID: p/+MhB6YQyGSu460YJSuRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,206,1712646000"; 
   d="scan'208";a="36269628"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 31 May 2024 18:29:35 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDDYi-000I5R-1U;
	Sat, 01 Jun 2024 01:29:28 +0000
Date: Sat, 1 Jun 2024 09:28:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/3] drm/panic: Add a kmsg dump screen
Message-ID: <202406010948.upSxSi1H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240531080750.765982-4-jfalempe@redhat.com>
References: <20240531080750.765982-4-jfalempe@redhat.com>
TO: Jocelyn Falempe <jfalempe@redhat.com>
TO: dri-devel@lists.freedesktop.org
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: David Airlie <airlied@gmail.com>
TO: Daniel Vetter <daniel@ffwll.ch>
CC: Jocelyn Falempe <jfalempe@redhat.com>

Hi Jocelyn,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 86266829ea755f737762ebda614c59b136c8feac]

url:    https://github.com/intel-lab-lkp/linux/commits/Jocelyn-Falempe/drm-panic-only-draw-the-foreground-color-in-drm_panic_blit/20240531-161045
base:   86266829ea755f737762ebda614c59b136c8feac
patch link:    https://lore.kernel.org/r/20240531080750.765982-4-jfalempe%40redhat.com
patch subject: [PATCH 3/3] drm/panic: Add a kmsg dump screen
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406010948.upSxSi1H-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/drm_panic.c: linux/kmsg_dump.h is included more than once.

vim +12 drivers/gpu/drm/drm_panic.c

  > 12	#include <linux/kmsg_dump.h>
    13	#include <linux/list.h>
    14	#include <linux/module.h>
    15	#include <linux/types.h>
    16	
    17	#include <drm/drm_drv.h>
    18	#include <drm/drm_format_helper.h>
    19	#include <drm/drm_fourcc.h>
    20	#include <drm/drm_framebuffer.h>
    21	#include <drm/drm_modeset_helper_vtables.h>
    22	#include <drm/drm_panic.h>
    23	#include <drm/drm_plane.h>
    24	#include <drm/drm_print.h>
    25	
    26	MODULE_AUTHOR("Jocelyn Falempe");
    27	MODULE_DESCRIPTION("DRM panic handler");
    28	MODULE_LICENSE("GPL");
    29	
    30	/**
    31	 * DOC: overview
    32	 *
    33	 * To enable DRM panic for a driver, the primary plane must implement a
    34	 * &drm_plane_helper_funcs.get_scanout_buffer helper function. It is then
    35	 * automatically registered to the drm panic handler.
    36	 * When a panic occurs, the &drm_plane_helper_funcs.get_scanout_buffer will be
    37	 * called, and the driver can provide a framebuffer so the panic handler can
    38	 * draw the panic screen on it. Currently only linear buffer and a few color
    39	 * formats are supported.
    40	 * Optionally the driver can also provide a &drm_plane_helper_funcs.panic_flush
    41	 * callback, that will be called after that, to send additional commands to the
    42	 * hardware to make the scanout buffer visible.
    43	 */
    44	
    45	/*
    46	 * This module displays a user friendly message on screen when a kernel panic
    47	 * occurs. This is conflicting with fbcon, so you can only enable it when fbcon
    48	 * is disabled.
    49	 * It's intended for end-user, so have minimal technical/debug information.
    50	 *
    51	 * Implementation details:
    52	 *
    53	 * It is a panic handler, so it can't take lock, allocate memory, run tasks/irq,
    54	 * or attempt to sleep. It's a best effort, and it may not be able to display
    55	 * the message in all situations (like if the panic occurs in the middle of a
    56	 * modesetting).
    57	 * It will display only one static frame, so performance optimizations are low
    58	 * priority as the machine is already in an unusable state.
    59	 */
    60	
    61	struct drm_panic_line {
    62		u32 len;
    63		const char *txt;
    64	};
    65	
    66	/*
    67	 * Color conversion
    68	 */
    69	
    70	static u16 convert_xrgb8888_to_rgb565(u32 pix)
    71	{
    72		return ((pix & 0x00F80000) >> 8) |
    73		       ((pix & 0x0000FC00) >> 5) |
    74		       ((pix & 0x000000F8) >> 3);
    75	}
    76	
    77	static u16 convert_xrgb8888_to_rgba5551(u32 pix)
    78	{
    79		return ((pix & 0x00f80000) >> 8) |
    80		       ((pix & 0x0000f800) >> 5) |
    81		       ((pix & 0x000000f8) >> 2) |
    82		       BIT(0); /* set alpha bit */
    83	}
    84	
    85	static u16 convert_xrgb8888_to_xrgb1555(u32 pix)
    86	{
    87		return ((pix & 0x00f80000) >> 9) |
    88		       ((pix & 0x0000f800) >> 6) |
    89		       ((pix & 0x000000f8) >> 3);
    90	}
    91	
    92	static u16 convert_xrgb8888_to_argb1555(u32 pix)
    93	{
    94		return BIT(15) | /* set alpha bit */
    95		       ((pix & 0x00f80000) >> 9) |
    96		       ((pix & 0x0000f800) >> 6) |
    97		       ((pix & 0x000000f8) >> 3);
    98	}
    99	
   100	static u32 convert_xrgb8888_to_argb8888(u32 pix)
   101	{
   102		return pix | GENMASK(31, 24); /* fill alpha bits */
   103	}
   104	
   105	static u32 convert_xrgb8888_to_xbgr8888(u32 pix)
   106	{
   107		return ((pix & 0x00ff0000) >> 16) <<  0 |
   108		       ((pix & 0x0000ff00) >>  8) <<  8 |
   109		       ((pix & 0x000000ff) >>  0) << 16 |
   110		       ((pix & 0xff000000) >> 24) << 24;
   111	}
   112	
   113	static u32 convert_xrgb8888_to_abgr8888(u32 pix)
   114	{
   115		return ((pix & 0x00ff0000) >> 16) <<  0 |
   116		       ((pix & 0x0000ff00) >>  8) <<  8 |
   117		       ((pix & 0x000000ff) >>  0) << 16 |
   118		       GENMASK(31, 24); /* fill alpha bits */
   119	}
   120	
   121	static u32 convert_xrgb8888_to_xrgb2101010(u32 pix)
   122	{
   123		pix = ((pix & 0x000000FF) << 2) |
   124		      ((pix & 0x0000FF00) << 4) |
   125		      ((pix & 0x00FF0000) << 6);
   126		return pix | ((pix >> 8) & 0x00300C03);
   127	}
   128	
   129	static u32 convert_xrgb8888_to_argb2101010(u32 pix)
   130	{
   131		pix = ((pix & 0x000000FF) << 2) |
   132		      ((pix & 0x0000FF00) << 4) |
   133		      ((pix & 0x00FF0000) << 6);
   134		return GENMASK(31, 30) /* set alpha bits */ | pix | ((pix >> 8) & 0x00300C03);
   135	}
   136	
   137	/*
   138	 * convert_from_xrgb8888 - convert one pixel from xrgb8888 to the desired format
   139	 * @color: input color, in xrgb8888 format
   140	 * @format: output format
   141	 *
   142	 * Returns:
   143	 * Color in the format specified, casted to u32.
   144	 * Or 0 if the format is not supported.
   145	 */
   146	static u32 convert_from_xrgb8888(u32 color, u32 format)
   147	{
   148		switch (format) {
   149		case DRM_FORMAT_RGB565:
   150			return convert_xrgb8888_to_rgb565(color);
   151		case DRM_FORMAT_RGBA5551:
   152			return convert_xrgb8888_to_rgba5551(color);
   153		case DRM_FORMAT_XRGB1555:
   154			return convert_xrgb8888_to_xrgb1555(color);
   155		case DRM_FORMAT_ARGB1555:
   156			return convert_xrgb8888_to_argb1555(color);
   157		case DRM_FORMAT_RGB888:
   158		case DRM_FORMAT_XRGB8888:
   159			return color;
   160		case DRM_FORMAT_ARGB8888:
   161			return convert_xrgb8888_to_argb8888(color);
   162		case DRM_FORMAT_XBGR8888:
   163			return convert_xrgb8888_to_xbgr8888(color);
   164		case DRM_FORMAT_ABGR8888:
   165			return convert_xrgb8888_to_abgr8888(color);
   166		case DRM_FORMAT_XRGB2101010:
   167			return convert_xrgb8888_to_xrgb2101010(color);
   168		case DRM_FORMAT_ARGB2101010:
   169			return convert_xrgb8888_to_argb2101010(color);
   170		default:
   171			WARN_ONCE(1, "Can't convert to %p4cc\n", &format);
   172			return 0;
   173		}
   174	}
   175	
   176	/*
   177	 * Blit & Fill
   178	 */
   179	static void drm_panic_blit16(struct iosys_map *dmap, unsigned int dpitch,
   180				     const u8 *sbuf8, unsigned int spitch,
   181				     unsigned int height, unsigned int width,
   182				     u16 color)
   183	{
   184		unsigned int y, x;
   185	
   186		for (y = 0; y < height; y++)
   187			for (x = 0; x < width; x++)
   188				if (sbuf8[(y * spitch) + x / 8] & (0x80 >> (x % 8)))
   189					iosys_map_wr(dmap, y * dpitch + x * sizeof(u16), u16, color);
   190	}
   191	
   192	static void drm_panic_blit24(struct iosys_map *dmap, unsigned int dpitch,
   193				     const u8 *sbuf8, unsigned int spitch,
   194				     unsigned int height, unsigned int width,
   195				     u32 color)
   196	{
   197		unsigned int y, x;
   198	
   199		for (y = 0; y < height; y++) {
   200			for (x = 0; x < width; x++) {
   201				u32 off = y * dpitch + x * 3;
   202	
   203				if (sbuf8[(y * spitch) + x / 8] & (0x80 >> (x % 8))) {
   204					/* write blue-green-red to output in little endianness */
   205					iosys_map_wr(dmap, off, u8, (color & 0x000000FF) >> 0);
   206					iosys_map_wr(dmap, off + 1, u8, (color & 0x0000FF00) >> 8);
   207					iosys_map_wr(dmap, off + 2, u8, (color & 0x00FF0000) >> 16);
   208				}
   209			}
   210		}
   211	}
   212	
   213	static void drm_panic_blit32(struct iosys_map *dmap, unsigned int dpitch,
   214				     const u8 *sbuf8, unsigned int spitch,
   215				     unsigned int height, unsigned int width,
   216				     u32 color)
   217	{
   218		unsigned int y, x;
   219	
   220		for (y = 0; y < height; y++)
   221			for (x = 0; x < width; x++)
   222				if (sbuf8[(y * spitch) + x / 8] & (0x80 >> (x % 8)))
   223					iosys_map_wr(dmap, y * dpitch + x * sizeof(u32), u32, color);
   224	}
   225	
   226	static void drm_panic_blit_pixel(struct drm_scanout_buffer *sb, struct drm_rect *clip,
   227					 const u8 *sbuf8, unsigned int spitch, u32 color)
   228	{
   229		unsigned int y, x;
   230	
   231		for (y = 0; y < drm_rect_height(clip); y++)
   232			for (x = 0; x < drm_rect_width(clip); x++)
   233				if (sbuf8[(y * spitch) + x / 8] & (0x80 >> (x % 8)))
   234					sb->set_pixel(sb, clip->x1 + x, clip->y1 + y, color);
   235	}
   236	
   237	/*
   238	 * drm_panic_blit - convert a monochrome image to a linear framebuffer
   239	 * @sb: destination scanout buffer
   240	 * @clip: destination rectangle
   241	 * @sbuf8: source buffer, in monochrome format, 8 pixels per byte.
   242	 * @spitch: source pitch in bytes
   243	 * @color: foreground color, in destination format
   244	 *
   245	 * This can be used to draw a font character, which is a monochrome image, to a
   246	 * framebuffer in other supported format.
   247	 */
   248	static void drm_panic_blit(struct drm_scanout_buffer *sb, struct drm_rect *clip,
   249				   const u8 *sbuf8, unsigned int spitch, u32 color)
   250	{
   251		struct iosys_map map;
   252	
   253		if (sb->set_pixel)
   254			return drm_panic_blit_pixel(sb, clip, sbuf8, spitch, color);
   255	
   256		map = sb->map[0];
   257		iosys_map_incr(&map, clip->y1 * sb->pitch[0] + clip->x1 * sb->format->cpp[0]);
   258	
   259		switch (sb->format->cpp[0]) {
   260		case 2:
   261			drm_panic_blit16(&map, sb->pitch[0], sbuf8, spitch,
   262					 drm_rect_height(clip), drm_rect_width(clip), color);
   263		break;
   264		case 3:
   265			drm_panic_blit24(&map, sb->pitch[0], sbuf8, spitch,
   266					 drm_rect_height(clip), drm_rect_width(clip), color);
   267		break;
   268		case 4:
   269			drm_panic_blit32(&map, sb->pitch[0], sbuf8, spitch,
   270					 drm_rect_height(clip), drm_rect_width(clip), color);
   271		break;
   272		default:
   273			WARN_ONCE(1, "Can't blit with pixel width %d\n", sb->format->cpp[0]);
   274		}
   275	}
   276	
   277	static void drm_panic_fill16(struct iosys_map *dmap, unsigned int dpitch,
   278				     unsigned int height, unsigned int width,
   279				     u16 color)
   280	{
   281		unsigned int y, x;
   282	
   283		for (y = 0; y < height; y++)
   284			for (x = 0; x < width; x++)
   285				iosys_map_wr(dmap, y * dpitch + x * sizeof(u16), u16, color);
   286	}
   287	
   288	static void drm_panic_fill24(struct iosys_map *dmap, unsigned int dpitch,
   289				     unsigned int height, unsigned int width,
   290				     u32 color)
   291	{
   292		unsigned int y, x;
   293	
   294		for (y = 0; y < height; y++) {
   295			for (x = 0; x < width; x++) {
   296				unsigned int off = y * dpitch + x * 3;
   297	
   298				/* write blue-green-red to output in little endianness */
   299				iosys_map_wr(dmap, off, u8, (color & 0x000000FF) >> 0);
   300				iosys_map_wr(dmap, off + 1, u8, (color & 0x0000FF00) >> 8);
   301				iosys_map_wr(dmap, off + 2, u8, (color & 0x00FF0000) >> 16);
   302			}
   303		}
   304	}
   305	
   306	static void drm_panic_fill32(struct iosys_map *dmap, unsigned int dpitch,
   307				     unsigned int height, unsigned int width,
   308				     u32 color)
   309	{
   310		unsigned int y, x;
   311	
   312		for (y = 0; y < height; y++)
   313			for (x = 0; x < width; x++)
   314				iosys_map_wr(dmap, y * dpitch + x * sizeof(u32), u32, color);
   315	}
   316	
   317	static void drm_panic_fill_pixel(struct drm_scanout_buffer *sb,
   318					 struct drm_rect *clip,
   319					 u32 color)
   320	{
   321		unsigned int y, x;
   322	
   323		for (y = 0; y < drm_rect_height(clip); y++)
   324			for (x = 0; x < drm_rect_width(clip); x++)
   325				sb->set_pixel(sb, clip->x1 + x, clip->y1 + y, color);
   326	}
   327	
   328	/*
   329	 * drm_panic_fill - Fill a rectangle with a color
   330	 * @sb: destination scanout buffer
   331	 * @clip: destination rectangle
   332	 * @color: foreground color, in destination format
   333	 *
   334	 * Fill a rectangle with a color, in a linear framebuffer.
   335	 */
   336	static void drm_panic_fill(struct drm_scanout_buffer *sb, struct drm_rect *clip,
   337				   u32 color)
   338	{
   339		struct iosys_map map;
   340	
   341		if (sb->set_pixel)
   342			return drm_panic_fill_pixel(sb, clip, color);
   343	
   344		map = sb->map[0];
   345		iosys_map_incr(&map, clip->y1 * sb->pitch[0] + clip->x1 * sb->format->cpp[0]);
   346	
   347		switch (sb->format->cpp[0]) {
   348		case 2:
   349			drm_panic_fill16(&map, sb->pitch[0], drm_rect_height(clip),
   350					 drm_rect_width(clip), color);
   351		break;
   352		case 3:
   353			drm_panic_fill24(&map, sb->pitch[0], drm_rect_height(clip),
   354					 drm_rect_width(clip), color);
   355		break;
   356		case 4:
   357			drm_panic_fill32(&map, sb->pitch[0], drm_rect_height(clip),
   358					 drm_rect_width(clip), color);
   359		break;
   360		default:
   361			WARN_ONCE(1, "Can't fill with pixel width %d\n", sb->format->cpp[0]);
   362		}
   363	}
   364	
   365	static const u8 *get_char_bitmap(const struct font_desc *font, char c, size_t font_pitch)
   366	{
   367		return font->data + (c * font->height) * font_pitch;
   368	}
   369	
   370	/*
   371	 * Draw a text in a rectangle on a framebuffer. The text is truncated if it overflows the rectangle
   372	 */
   373	static void draw_txt_rectangle(struct drm_scanout_buffer *sb,
   374				       const struct font_desc *font,
   375				       const struct drm_panic_line *msg,
   376				       unsigned int msg_lines,
   377				       bool centered,
   378				       struct drm_rect *clip,
   379				       u32 color)
   380	{
   381		int i, j;
   382		const u8 *src;
   383		size_t font_pitch = DIV_ROUND_UP(font->width, 8);
   384		struct drm_rect rec;
   385	
   386		msg_lines = min(msg_lines,  drm_rect_height(clip) / font->height);
   387		for (i = 0; i < msg_lines; i++) {
   388			size_t line_len = min(msg[i].len, drm_rect_width(clip) / font->width);
   389	
   390			rec.y1 = clip->y1 +  i * font->height;
   391			rec.y2 = rec.y1 + font->height;
   392			rec.x1 = clip->x1;
   393	
   394			if (centered)
   395				rec.x1 += (drm_rect_width(clip) - (line_len * font->width)) / 2;
   396	
   397			for (j = 0; j < line_len; j++) {
   398				src = get_char_bitmap(font, msg[i].txt[j], font_pitch);
   399				rec.x2 = rec.x1 + font->width;
   400				drm_panic_blit(sb, &rec, src, font_pitch, color);
   401				rec.x1 += font->width;
   402			}
   403		}
   404	}
   405	
   406	#if defined(CONFIG_DRM_PANIC_SCREEN_USERFRIENDLY)
   407	
   408	#define PANIC_LINE(s) {.len = sizeof(s) - 1, .txt = s}
   409	
   410	static struct drm_panic_line panic_msg[] = {
   411		PANIC_LINE("KERNEL PANIC !"),
   412		PANIC_LINE(""),
   413		PANIC_LINE("Please reboot your computer."),
   414	};
   415	
   416	static const struct drm_panic_line logo[] = {
   417		PANIC_LINE("     .--.        _"),
   418		PANIC_LINE("    |o_o |      | |"),
   419		PANIC_LINE("    |:_/ |      | |"),
   420		PANIC_LINE("   //   \\ \\     |_|"),
   421		PANIC_LINE("  (|     | )     _"),
   422		PANIC_LINE(" /'\\_   _/`\\    (_)"),
   423		PANIC_LINE(" \\___)=(___/"),
   424	};
   425	
   426	static unsigned int get_max_line_len(const struct drm_panic_line *lines, int len)
   427	{
   428		int i;
   429		unsigned int max = 0;
   430	
   431		for (i = 0; i < len; i++)
   432			max = max(lines[i].len, max);
   433		return max;
   434	}
   435	
   436	static void draw_panic_static(struct drm_scanout_buffer *sb)
   437	{
   438		size_t msg_lines = ARRAY_SIZE(panic_msg);
   439		size_t logo_lines = ARRAY_SIZE(logo);
   440		u32 fg_color = convert_from_xrgb8888(CONFIG_DRM_PANIC_FOREGROUND_COLOR, sb->format->format);
   441		u32 bg_color = convert_from_xrgb8888(CONFIG_DRM_PANIC_BACKGROUND_COLOR, sb->format->format);
   442		const struct font_desc *font = get_default_font(sb->width, sb->height, NULL, NULL);
   443		struct drm_rect r_screen, r_logo, r_msg;
   444	
   445		if (!font)
   446			return;
   447	
   448		r_screen = DRM_RECT_INIT(0, 0, sb->width, sb->height);
   449	
   450		r_logo = DRM_RECT_INIT(0, 0,
   451				       get_max_line_len(logo, logo_lines) * font->width,
   452				       logo_lines * font->height);
   453		r_msg = DRM_RECT_INIT(0, 0,
   454				      min(get_max_line_len(panic_msg, msg_lines) * font->width, sb->width),
   455				      min(msg_lines * font->height, sb->height));
   456	
   457		/* Center the panic message */
   458		drm_rect_translate(&r_msg, (sb->width - r_msg.x2) / 2, (sb->height - r_msg.y2) / 2);
   459	
   460		/* Fill with the background color, and draw text on top */
   461		drm_panic_fill(sb, &r_screen, bg_color);
   462	
   463		if ((r_msg.x1 >= drm_rect_width(&r_logo) || r_msg.y1 >= drm_rect_height(&r_logo)) &&
   464		    drm_rect_width(&r_logo) < sb->width && drm_rect_height(&r_logo) < sb->height) {
   465			draw_txt_rectangle(sb, font, logo, logo_lines, false, &r_logo, fg_color);
   466		}
   467		draw_txt_rectangle(sb, font, panic_msg, msg_lines, true, &r_msg, fg_color);
   468	}
   469	
   470	#elif defined(CONFIG_DRM_PANIC_SCREEN_KMSG)
   471	
 > 472	#include <linux/kmsg_dump.h>
   473	#include <linux/printk.h>
   474	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
