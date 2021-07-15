Content-Type: multipart/mixed; boundary="===============1038536842799625673=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/5] drm: Define DRM_FORMAT_MAX_PLANES
Date: Fri, 16 Jul 2021 07:17:53 +0800
Message-ID: <202107160729.dsfkD3VR-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1038536842799625673==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210715180133.3675-2-tzimmermann@suse.de>
References: <20210715180133.3675-2-tzimmermann@suse.de>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: maarten.lankhorst(a)linux.intel.com
TO: mripard(a)kernel.org
TO: airlied(a)linux.ie
TO: daniel(a)ffwll.ch
TO: noralf(a)tronnes.org
TO: rodrigosiqueiramelo(a)gmail.com
TO: melissa.srw(a)gmail.com
TO: hamohammed.sa(a)gmail.com
CC: Thomas Zimmermann <tzimmermann@suse.de>
CC: dri-devel(a)lists.freedesktop.org

Hi Thomas,

I love your patch! Perhaps something to improve:

[auto build test WARNING on 4d00e2309398147acdbfefbe1deb4b0e78868466]

url:    https://github.com/0day-ci/linux/commits/Thomas-Zimmermann/drm-Prov=
ide-framebuffer-vmap-helpers/20210716-020508
base:   4d00e2309398147acdbfefbe1deb4b0e78868466
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
compiler: hppa-linux-gcc (GCC) 10.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpu/drm/drm_gem_framebuffer_helper.c:192:14: warning: Unsigned v=
ariable 'i' can't be negative so it is unnecessary to test it. [unsignedPos=
itive]
    for (i--; i >=3D 0; i--)
                ^

vim +192 drivers/gpu/drm/drm_gem_framebuffer_helper.c

4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  119  =

4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  120  /**
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  121   * drm_gem_fb_init_wi=
th_funcs() - Helper function for implementing
4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  122   *				  &drm_mod=
e_config_funcs.fb_create
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  123   *				  callback in c=
ases when the driver
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  124   *				  allocates a s=
ubclass of
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  125   *				  struct drm_fr=
amebuffer
4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  126   * @dev: DRM dev=
ice
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  127   * @fb: framebuffer o=
bject
2e187b2099034a Noralf Tr=C3=B8nnes        2017-09-22  128   * @file: DRM fi=
le that holds the GEM handle(s) backing the framebuffer
2e187b2099034a Noralf Tr=C3=B8nnes        2017-09-22  129   * @mode_cmd: Me=
tadata from the userspace framebuffer creation request
4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  130   * @funcs: vtabl=
e to be used for the new framebuffer object
4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  131   *
dbd62e16fd53d3 Noralf Tr=C3=B8nnes        2019-01-15  132   * This function=
 can be used to set &drm_framebuffer_funcs for drivers that need
dbd62e16fd53d3 Noralf Tr=C3=B8nnes        2019-01-15  133   * custom frameb=
uffer callbacks. Use drm_gem_fb_create() if you don't need to
dbd62e16fd53d3 Noralf Tr=C3=B8nnes        2019-01-15  134   * change &drm_f=
ramebuffer_funcs. The function does buffer size validation.
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  135   * The buffer size va=
lidation is for a general case, though, so users should
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  136   * pay attention to t=
he checks being appropriate for them or, at least,
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  137   * non-conflicting.
2e187b2099034a Noralf Tr=C3=B8nnes        2017-09-22  138   *
2e187b2099034a Noralf Tr=C3=B8nnes        2017-09-22  139   * Returns:
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  140   * Zero or a negative=
 error code.
4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  141   */
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  142  int drm_gem_fb_init_w=
ith_funcs(struct drm_device *dev,
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  143  			       struct drm_=
framebuffer *fb,
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  144  			       struct drm_=
file *file,
4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  145  			       const =
struct drm_mode_fb_cmd2 *mode_cmd,
4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  146  			       const =
struct drm_framebuffer_funcs *funcs)
4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  147  {
4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  148  	const struct dr=
m_format_info *info;
6065e7036e073e Thomas Zimmermann     2021-07-15  149  	struct drm_gem_objec=
t *objs[DRM_FORMAT_MAX_PLANES];
6065e7036e073e Thomas Zimmermann     2021-07-15  150  	unsigned int i;
6065e7036e073e Thomas Zimmermann     2021-07-15  151  	int ret;
4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  152  =

4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  153  	info =3D drm_ge=
t_format_info(dev, mode_cmd);
f7f525030854b1 Simon Ser             2021-05-03  154  	if (!info) {
f7f525030854b1 Simon Ser             2021-05-03  155  		drm_dbg_kms(dev, "F=
ailed to get FB format info\n");
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  156  		return -EINVAL;
f7f525030854b1 Simon Ser             2021-05-03  157  	}
4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  158  =

4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  159  	for (i =3D 0; i=
 < info->num_planes; i++) {
4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  160  		unsigned int w=
idth =3D mode_cmd->width / (i ? info->hsub : 1);
4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  161  		unsigned int h=
eight =3D mode_cmd->height / (i ? info->vsub : 1);
4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  162  		unsigned int m=
in_size;
4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  163  =

4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  164  		objs[i] =3D dr=
m_gem_object_lookup(file, mode_cmd->handles[i]);
4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  165  		if (!objs[i]) {
24f03be4aa7922 Jani Nikula           2019-12-10  166  			drm_dbg_kms(dev, "=
Failed to lookup GEM object\n");
4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  167  			ret =3D -ENOE=
NT;
4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  168  			goto err_gem_=
object_put;
4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  169  		}
4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  170  =

4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  171  		min_size =3D (=
height - 1) * mode_cmd->pitches[i]
042bf753842ddb Alexandru Gheorghe    2018-11-01  172  			 + drm_format_info=
_min_pitch(info, i, width)
4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  173  			 + mode_cmd->=
offsets[i];
4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  174  =

4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  175  		if (objs[i]->s=
ize < min_size) {
f7f525030854b1 Simon Ser             2021-05-03  176  			drm_dbg_kms(dev,
f7f525030854b1 Simon Ser             2021-05-03  177  				    "GEM object s=
ize (%zu) smaller than minimum size (%u) for plane %d\n",
f7f525030854b1 Simon Ser             2021-05-03  178  				    objs[i]->size=
, min_size, i);
be6ee102341bc4 Emil Velikov          2020-05-15  179  			drm_gem_object_put=
(objs[i]);
4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  180  			ret =3D -EINV=
AL;
4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  181  			goto err_gem_=
object_put;
4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  182  		}
4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  183  	}
4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  184  =

f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  185  	ret =3D drm_gem_fb_i=
nit(dev, fb, mode_cmd, objs, i, funcs);
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  186  	if (ret)
4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  187  		goto err_gem_o=
bject_put;
4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  188  =

f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  189  	return 0;
4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  190  =

4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  191  err_gem_object_p=
ut:
4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13 @192  	for (i--; i >=
=3D 0; i--)
be6ee102341bc4 Emil Velikov          2020-05-15  193  		drm_gem_object_put(=
objs[i]);
4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  194  =

f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  195  	return ret;
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  196  }
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  197  EXPORT_SYMBOL_GPL(drm=
_gem_fb_init_with_funcs);
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  198  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1038536842799625673==--

