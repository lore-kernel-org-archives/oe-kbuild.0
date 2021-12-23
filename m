Content-Type: multipart/mixed; boundary="===============8904604047886278107=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: =?utf-8?q?=5Bkbuild=5D__Re=3A_=5BPATCH_v2_1/6=5D_drm/plane=3A_Make_format?=
 =?utf-8?q?=5Fmod=5Fsupported_truly=C2=A0optional?=
Date: Thu, 23 Dec 2021 10:54:36 +0800
Message-ID: <202112231015.Cu4a2WbM-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8904604047886278107==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211222090552.25972-2-jose.exposito89@gmail.com>
References: <20211222090552.25972-2-jose.exposito89@gmail.com>
TO: "Jos=C3=A9 Exp=C3=B3sito" <jose.exposito89@gmail.com>
TO: contact(a)emersion.fr
CC: dmitry.baryshkov(a)linaro.org
CC: maarten.lankhorst(a)linux.intel.com
CC: mripard(a)kernel.org
CC: tzimmermann(a)suse.de
CC: airlied(a)linux.ie
CC: daniel(a)ffwll.ch
CC: jani.nikula(a)linux.intel.com
CC: joonas.lahtinen(a)linux.intel.com
CC: rodrigo.vivi(a)intel.com

Hi "Jos=C3=A9,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on atorgue-stm32/stm32-next]
[also build test WARNING on v5.16-rc6 next-20211222]
[cannot apply to drm/drm-next drm-intel/for-linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jos-Exp-sito/Add-missing-f=
ormat_mod_supported-functions/20211222-170806
base:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git s=
tm32-next
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: csky-randconfig-s031-20211222 (https://download.01.org/0day-ci/arch=
ive/20211223/202112231015.Cu4a2WbM-lkp(a)intel.com/config)
compiler: csky-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/0day-ci/linux/commit/0a433a79da79d35aa0b0130be=
9f44ef3e8fd9b08
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jos-Exp-sito/Add-missing-format_mo=
d_supported-functions/20211222-170806
        git checkout 0a433a79da79d35aa0b0130be9f44ef3e8fd9b08
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dc=
sky SHELL=3D/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/drm_plane.c:222:1: sparse: sparse: unused label 'done'
   drivers/gpu/drm/drm_plane.c: note: in included file (through include/lin=
ux/uaccess.h):
   arch/csky/include/asm/uaccess.h:121:17: sparse: sparse: cast removes add=
ress space '__user' of expression
   arch/csky/include/asm/uaccess.h:121:17: sparse: sparse: asm output is no=
t an lvalue
   arch/csky/include/asm/uaccess.h:121:17: sparse: sparse: cast removes add=
ress space '__user' of expression
   arch/csky/include/asm/uaccess.h:121:17: sparse: sparse: generating addre=
ss of non-lvalue (11)

vim +/done +222 drivers/gpu/drm/drm_plane.c

db1689aa61bd1e Ben Widawsky  2017-07-23  163  =

db1689aa61bd1e Ben Widawsky  2017-07-23  164  static int create_in_format_b=
lob(struct drm_device *dev, struct drm_plane *plane)
db1689aa61bd1e Ben Widawsky  2017-07-23  165  {
db1689aa61bd1e Ben Widawsky  2017-07-23  166  	const struct drm_mode_config=
 *config =3D &dev->mode_config;
db1689aa61bd1e Ben Widawsky  2017-07-23  167  	struct drm_property_blob *bl=
ob;
db1689aa61bd1e Ben Widawsky  2017-07-23  168  	struct drm_format_modifier *=
mod;
db1689aa61bd1e Ben Widawsky  2017-07-23  169  	size_t blob_size, formats_si=
ze, modifiers_size;
db1689aa61bd1e Ben Widawsky  2017-07-23  170  	struct drm_format_modifier_b=
lob *blob_data;
db1689aa61bd1e Ben Widawsky  2017-07-23  171  	unsigned int i, j;
db1689aa61bd1e Ben Widawsky  2017-07-23  172  =

db1689aa61bd1e Ben Widawsky  2017-07-23  173  	formats_size =3D sizeof(__u3=
2) * plane->format_count;
db1689aa61bd1e Ben Widawsky  2017-07-23  174  	if (WARN_ON(!formats_size)) {
db1689aa61bd1e Ben Widawsky  2017-07-23  175  		/* 0 formats are never expe=
cted */
db1689aa61bd1e Ben Widawsky  2017-07-23  176  		return 0;
db1689aa61bd1e Ben Widawsky  2017-07-23  177  	}
db1689aa61bd1e Ben Widawsky  2017-07-23  178  =

db1689aa61bd1e Ben Widawsky  2017-07-23  179  	modifiers_size =3D
db1689aa61bd1e Ben Widawsky  2017-07-23  180  		sizeof(struct drm_format_mo=
difier) * plane->modifier_count;
db1689aa61bd1e Ben Widawsky  2017-07-23  181  =

db1689aa61bd1e Ben Widawsky  2017-07-23  182  	blob_size =3D sizeof(struct =
drm_format_modifier_blob);
db1689aa61bd1e Ben Widawsky  2017-07-23  183  	/* Modifiers offset is a poi=
nter to a struct with a 64 bit field so it
db1689aa61bd1e Ben Widawsky  2017-07-23  184  	 * should be naturally align=
ed to 8B.
db1689aa61bd1e Ben Widawsky  2017-07-23  185  	 */
db1689aa61bd1e Ben Widawsky  2017-07-23  186  	BUILD_BUG_ON(sizeof(struct d=
rm_format_modifier_blob) % 8);
db1689aa61bd1e Ben Widawsky  2017-07-23  187  	blob_size +=3D ALIGN(formats=
_size, 8);
db1689aa61bd1e Ben Widawsky  2017-07-23  188  	blob_size +=3D modifiers_siz=
e;
db1689aa61bd1e Ben Widawsky  2017-07-23  189  =

db1689aa61bd1e Ben Widawsky  2017-07-23  190  	blob =3D drm_property_create=
_blob(dev, blob_size, NULL);
db1689aa61bd1e Ben Widawsky  2017-07-23  191  	if (IS_ERR(blob))
db1689aa61bd1e Ben Widawsky  2017-07-23  192  		return -1;
db1689aa61bd1e Ben Widawsky  2017-07-23  193  =

11b83e3fbc4196 Ville Syrj=C3=A4l=C3=A4 2018-02-23  194  	blob_data =3D blob=
->data;
db1689aa61bd1e Ben Widawsky  2017-07-23  195  	blob_data->version =3D FORMA=
T_BLOB_CURRENT;
db1689aa61bd1e Ben Widawsky  2017-07-23  196  	blob_data->count_formats =3D=
 plane->format_count;
db1689aa61bd1e Ben Widawsky  2017-07-23  197  	blob_data->formats_offset =
=3D sizeof(struct drm_format_modifier_blob);
db1689aa61bd1e Ben Widawsky  2017-07-23  198  	blob_data->count_modifiers =
=3D plane->modifier_count;
db1689aa61bd1e Ben Widawsky  2017-07-23  199  =

db1689aa61bd1e Ben Widawsky  2017-07-23  200  	blob_data->modifiers_offset =
=3D
db1689aa61bd1e Ben Widawsky  2017-07-23  201  		ALIGN(blob_data->formats_of=
fset + formats_size, 8);
db1689aa61bd1e Ben Widawsky  2017-07-23  202  =

db1689aa61bd1e Ben Widawsky  2017-07-23  203  	memcpy(formats_ptr(blob_data=
), plane->format_types, formats_size);
db1689aa61bd1e Ben Widawsky  2017-07-23  204  =

db1689aa61bd1e Ben Widawsky  2017-07-23  205  	mod =3D modifiers_ptr(blob_d=
ata);
db1689aa61bd1e Ben Widawsky  2017-07-23  206  	for (i =3D 0; i < plane->mod=
ifier_count; i++) {
db1689aa61bd1e Ben Widawsky  2017-07-23  207  		for (j =3D 0; j < plane->fo=
rmat_count; j++) {
0a433a79da79d3 Jos=C3=A9 Exp=C3=B3sito 2021-12-22  208  			if (!plane->func=
s->format_mod_supported ||
0a433a79da79d3 Jos=C3=A9 Exp=C3=B3sito 2021-12-22  209  			    plane->funcs=
->format_mod_supported(plane,
db1689aa61bd1e Ben Widawsky  2017-07-23  210  							       plane->format_t=
ypes[j],
db1689aa61bd1e Ben Widawsky  2017-07-23  211  							       plane->modifier=
s[i])) {
aadd41485bb227 Dan Carpenter 2017-08-09  212  				mod->formats |=3D 1ULL <<=
 j;
db1689aa61bd1e Ben Widawsky  2017-07-23  213  			}
db1689aa61bd1e Ben Widawsky  2017-07-23  214  		}
db1689aa61bd1e Ben Widawsky  2017-07-23  215  =

db1689aa61bd1e Ben Widawsky  2017-07-23  216  		mod->modifier =3D plane->mo=
difiers[i];
db1689aa61bd1e Ben Widawsky  2017-07-23  217  		mod->offset =3D 0;
db1689aa61bd1e Ben Widawsky  2017-07-23  218  		mod->pad =3D 0;
db1689aa61bd1e Ben Widawsky  2017-07-23  219  		mod++;
db1689aa61bd1e Ben Widawsky  2017-07-23  220  	}
db1689aa61bd1e Ben Widawsky  2017-07-23  221  =

db1689aa61bd1e Ben Widawsky  2017-07-23 @222  done:
db1689aa61bd1e Ben Widawsky  2017-07-23  223  	drm_object_attach_property(&=
plane->base, config->modifiers_property,
db1689aa61bd1e Ben Widawsky  2017-07-23  224  				   blob->base.id);
db1689aa61bd1e Ben Widawsky  2017-07-23  225  =

db1689aa61bd1e Ben Widawsky  2017-07-23  226  	return 0;
db1689aa61bd1e Ben Widawsky  2017-07-23  227  }
db1689aa61bd1e Ben Widawsky  2017-07-23  228  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8904604047886278107==--

