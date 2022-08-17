Content-Type: multipart/mixed; boundary="===============2008044817894559480=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [drm-misc:drm-misc-next 3/18] drivers/gpu/drm/drm_format_helper.c:150:38: warning: Parameter 'dst' can be declared with const [constParameter]
Date: Wed, 17 Aug 2022 22:03:08 +0800
Message-ID: <202208172219.CfOMEUSa-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2008044817894559480==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/g=
pu/drm/drm_format_helper.c:150:38: warning: Parameter 'dst' can be declared=
 with const [constParameter]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: dri-devel(a)lists.freedesktop.org
TO: Thomas Zimmermann <tzimmermann@suse.de>
CC: Sam Ravnborg <sam@ravnborg.org>

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   8ba9249396bef37cb68be9e8dee7847f1737db9d
commit: edbe262acf92c986ad9a1f594ae3b4f3d3373133 [3/18] drm/format-helper: =
Merge drm_fb_memcpy() and drm_fb_memcpy_toio()
:::::: branch date: 18 hours ago
:::::: commit date: 7 days ago
compiler: xtensa-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout edbe262acf92c986ad9a1f594ae3b4f3d3373133
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpu/drm/drm_gem_framebuffer_helper.c:71:28: warning: Parameter '=
obj' can be declared with const [constParameter]
      struct drm_gem_object **obj, unsigned int num_planes,
                              ^
--
>> drivers/gpu/drm/drm_format_helper.c:150:38: warning: Parameter 'dst' can=
 be declared with const [constParameter]
   void drm_fb_memcpy(struct iosys_map *dst, const unsigned int *dst_pitch,
                                        ^

vim +/dst +150 drivers/gpu/drm/drm_format_helper.c

cce6bedb38ed08f Thomas Zimmermann 2022-04-27  131  =

7415287e1f36759 Gerd Hoffmann     2019-04-05  132  /**
7415287e1f36759 Gerd Hoffmann     2019-04-05  133   * drm_fb_memcpy - Copy =
clip buffer
edbe262acf92c98 Thomas Zimmermann 2022-08-08  134   * @dst: Array of destin=
ation buffers
edbe262acf92c98 Thomas Zimmermann 2022-08-08  135   * @dst_pitch: Array of =
numbers of bytes between the start of two consecutive scanlines
edbe262acf92c98 Thomas Zimmermann 2022-08-08  136   *             within @d=
st; can be NULL if scanlines are stored next to each other.
edbe262acf92c98 Thomas Zimmermann 2022-08-08  137   * @vmap: Array of sourc=
e buffers
7415287e1f36759 Gerd Hoffmann     2019-04-05  138   * @fb: DRM framebuffer
7415287e1f36759 Gerd Hoffmann     2019-04-05  139   * @clip: Clip rectangle=
 area to copy
26f024f54ab69a1 Gerd Hoffmann     2019-04-05  140   *
edbe262acf92c98 Thomas Zimmermann 2022-08-08  141   * This function copies =
parts of a framebuffer to display memory. Destination and
edbe262acf92c98 Thomas Zimmermann 2022-08-08  142   * framebuffer formats m=
ust match. No conversion takes place. The parameters @dst,
edbe262acf92c98 Thomas Zimmermann 2022-08-08  143   * @dst_pitch and @vmap =
refer to arrays. Each array must have at least as many entries
edbe262acf92c98 Thomas Zimmermann 2022-08-08  144   * as there are planes i=
n @fb's format. Each entry stores the value for the format's
edbe262acf92c98 Thomas Zimmermann 2022-08-08  145   * respective color plan=
e at the same index.
edbe262acf92c98 Thomas Zimmermann 2022-08-08  146   *
edbe262acf92c98 Thomas Zimmermann 2022-08-08  147   * This function does no=
t apply clipping on @dst (i.e. the destination is at the
edbe262acf92c98 Thomas Zimmermann 2022-08-08  148   * top-left corner).
7415287e1f36759 Gerd Hoffmann     2019-04-05  149   */
edbe262acf92c98 Thomas Zimmermann 2022-08-08 @150  void drm_fb_memcpy(struc=
t iosys_map *dst, const unsigned int *dst_pitch,
edbe262acf92c98 Thomas Zimmermann 2022-08-08  151  		   const struct iosys_=
map *vmap, const struct drm_framebuffer *fb,
edbe262acf92c98 Thomas Zimmermann 2022-08-08  152  		   const struct drm_re=
ct *clip)
7415287e1f36759 Gerd Hoffmann     2019-04-05  153  {
edbe262acf92c98 Thomas Zimmermann 2022-08-08  154  	static const unsigned i=
nt default_dst_pitch[DRM_FORMAT_MAX_PLANES] =3D {
edbe262acf92c98 Thomas Zimmermann 2022-08-08  155  		0, 0, 0, 0
edbe262acf92c98 Thomas Zimmermann 2022-08-08  156  	};
7415287e1f36759 Gerd Hoffmann     2019-04-05  157  =

edbe262acf92c98 Thomas Zimmermann 2022-08-08  158  	const struct drm_format=
_info *format =3D fb->format;
edbe262acf92c98 Thomas Zimmermann 2022-08-08  159  	unsigned int i, y, line=
s =3D drm_rect_height(clip);
27bd66dd6419c45 Thomas Zimmermann 2021-11-10  160  =

edbe262acf92c98 Thomas Zimmermann 2022-08-08  161  	if (!dst_pitch)
edbe262acf92c98 Thomas Zimmermann 2022-08-08  162  		dst_pitch =3D default_=
dst_pitch;
7415287e1f36759 Gerd Hoffmann     2019-04-05  163  =

edbe262acf92c98 Thomas Zimmermann 2022-08-08  164  	for (i =3D 0; i < forma=
t->num_planes; ++i) {
edbe262acf92c98 Thomas Zimmermann 2022-08-08  165  		unsigned int bpp_i =3D=
 drm_format_info_bpp(format, i);
edbe262acf92c98 Thomas Zimmermann 2022-08-08  166  		unsigned int cpp_i =3D=
 DIV_ROUND_UP(bpp_i, 8);
edbe262acf92c98 Thomas Zimmermann 2022-08-08  167  		size_t len_i =3D DIV_R=
OUND_UP(drm_rect_width(clip) * bpp_i, 8);
edbe262acf92c98 Thomas Zimmermann 2022-08-08  168  		unsigned int dst_pitch=
_i =3D dst_pitch[i];
edbe262acf92c98 Thomas Zimmermann 2022-08-08  169  		struct iosys_map dst_i=
 =3D dst[i];
edbe262acf92c98 Thomas Zimmermann 2022-08-08  170  		struct iosys_map vmap_=
i =3D vmap[i];
26f024f54ab69a1 Gerd Hoffmann     2019-04-05  171  =

edbe262acf92c98 Thomas Zimmermann 2022-08-08  172  		if (!dst_pitch_i)
edbe262acf92c98 Thomas Zimmermann 2022-08-08  173  			dst_pitch_i =3D len_i;
27bd66dd6419c45 Thomas Zimmermann 2021-11-10  174  =

edbe262acf92c98 Thomas Zimmermann 2022-08-08  175  		iosys_map_incr(&vmap_i=
, clip_offset(clip, fb->pitches[i], cpp_i));
bf4f6d16c89466b Gerd Hoffmann     2019-04-10  176  		for (y =3D 0; y < line=
s; y++) {
edbe262acf92c98 Thomas Zimmermann 2022-08-08  177  			/* TODO: handle vmap_=
i in I/O memory here */
edbe262acf92c98 Thomas Zimmermann 2022-08-08  178  			iosys_map_memcpy_to(&=
dst_i, 0, vmap_i.vaddr, len_i);
edbe262acf92c98 Thomas Zimmermann 2022-08-08  179  			iosys_map_incr(&vmap_=
i, fb->pitches[i]);
edbe262acf92c98 Thomas Zimmermann 2022-08-08  180  			iosys_map_incr(&dst_i=
, dst_pitch_i);
bf4f6d16c89466b Gerd Hoffmann     2019-04-10  181  		}
26f024f54ab69a1 Gerd Hoffmann     2019-04-05  182  	}
edbe262acf92c98 Thomas Zimmermann 2022-08-08  183  }
edbe262acf92c98 Thomas Zimmermann 2022-08-08  184  EXPORT_SYMBOL(drm_fb_mem=
cpy);
26f024f54ab69a1 Gerd Hoffmann     2019-04-05  185  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2008044817894559480==--

