Content-Type: multipart/mixed; boundary="===============2915316179361686766=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 5594/9257] drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c:1177 vmw_translate_mob_ptr() warn: passing zero to 'PTR_ERR'
Date: Thu, 23 Dec 2021 08:16:16 +0800
Message-ID: <202112230826.ADH6zTe0-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2915316179361686766==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Zack Rusin <zackr@vmware.com>
CC: Martin Krastev <krastevm@vmware.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   2bd48302750c652889a2604b3df8b591c1d3af08
commit: 8afa13a0583f94c14607e3041c02f068ac8fb628 [5594/9257] drm/vmwgfx: Im=
plement DRIVER_GEM
:::::: branch date: 12 hours ago
:::::: commit date: 13 days ago
config: arm64-randconfig-m031-20211222 (https://download.01.org/0day-ci/arc=
hive/20211223/202112230826.ADH6zTe0-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c:1177 vmw_translate_mob_ptr() warn: =
passing zero to 'PTR_ERR'
drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c:1231 vmw_translate_guest_ptr() warn=
: passing zero to 'PTR_ERR'

vim +/PTR_ERR +1177 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c

e2fa3a76839ada Thomas Hellstrom  2011-10-04  1142  =

ddcda24e3bec1d Thomas Hellstrom  2012-11-21  1143  /**
2cd80dbd35518d Zack Rusin        2021-05-05  1144   * vmw_translate_mob_ptr=
 - Prepare to translate a user-space buffer handle
680360a4d3f695 Deepak Rawat      2019-02-13  1145   * to a MOB id.
ddcda24e3bec1d Thomas Hellstrom  2012-11-21  1146   *
ddcda24e3bec1d Thomas Hellstrom  2012-11-21  1147   * @dev_priv: Pointer to=
 a device private structure.
ddcda24e3bec1d Thomas Hellstrom  2012-11-21  1148   * @sw_context: The soft=
ware context used for this command batch validation.
ddcda24e3bec1d Thomas Hellstrom  2012-11-21  1149   * @id: Pointer to the u=
ser-space handle to be translated.
680360a4d3f695 Deepak Rawat      2019-02-13  1150   * @vmw_bo_p: Points to =
a location that, on successful return will carry a
680360a4d3f695 Deepak Rawat      2019-02-13  1151   * non-reference-counted=
 pointer to the buffer object identified by the
ddcda24e3bec1d Thomas Hellstrom  2012-11-21  1152   * user-space handle in =
@id.
ddcda24e3bec1d Thomas Hellstrom  2012-11-21  1153   *
ddcda24e3bec1d Thomas Hellstrom  2012-11-21  1154   * This function saves i=
nformation needed to translate a user-space buffer
ddcda24e3bec1d Thomas Hellstrom  2012-11-21  1155   * handle to a MOB id. T=
he translation does not take place immediately, but
680360a4d3f695 Deepak Rawat      2019-02-13  1156   * during a call to vmw_=
apply_relocations().
680360a4d3f695 Deepak Rawat      2019-02-13  1157   *
680360a4d3f695 Deepak Rawat      2019-02-13  1158   * This function builds =
a relocation list and a list of buffers to validate. The
680360a4d3f695 Deepak Rawat      2019-02-13  1159   * former needs to be fr=
eed using either vmw_apply_relocations() or
680360a4d3f695 Deepak Rawat      2019-02-13  1160   * vmw_free_relocations(=
). The latter needs to be freed using
680360a4d3f695 Deepak Rawat      2019-02-13  1161   * vmw_clear_validations.
ddcda24e3bec1d Thomas Hellstrom  2012-11-21  1162   */
ddcda24e3bec1d Thomas Hellstrom  2012-11-21  1163  static int vmw_translate=
_mob_ptr(struct vmw_private *dev_priv,
ddcda24e3bec1d Thomas Hellstrom  2012-11-21  1164  				 struct vmw_sw_conte=
xt *sw_context,
ddcda24e3bec1d Thomas Hellstrom  2012-11-21  1165  				 SVGAMobId *id,
f1d34bfd70b1b4 Thomas Hellstrom  2018-06-19  1166  				 struct vmw_buffer_o=
bject **vmw_bo_p)
ddcda24e3bec1d Thomas Hellstrom  2012-11-21  1167  {
b139d43dacef68 Thomas Hellstrom  2018-09-26  1168  	struct vmw_buffer_objec=
t *vmw_bo;
ddcda24e3bec1d Thomas Hellstrom  2012-11-21  1169  	uint32_t handle =3D *id;
ddcda24e3bec1d Thomas Hellstrom  2012-11-21  1170  	struct vmw_relocation *=
reloc;
ddcda24e3bec1d Thomas Hellstrom  2012-11-21  1171  	int ret;
ddcda24e3bec1d Thomas Hellstrom  2012-11-21  1172  =

b139d43dacef68 Thomas Hellstrom  2018-09-26  1173  	vmw_validation_preload_=
bo(sw_context->ctx);
8afa13a0583f94 Zack Rusin        2021-12-06  1174  	vmw_bo =3D vmw_user_bo_=
noref_lookup(sw_context->filp, handle);
8afa13a0583f94 Zack Rusin        2021-12-06  1175  	if (IS_ERR_OR_NULL(vmw_=
bo)) {
5724f899ed8265 Deepak Rawat      2019-02-11  1176  		VMW_DEBUG_USER("Could =
not find or use MOB buffer.\n");
b139d43dacef68 Thomas Hellstrom  2018-09-26 @1177  		return PTR_ERR(vmw_bo);
ddcda24e3bec1d Thomas Hellstrom  2012-11-21  1178  	}
b139d43dacef68 Thomas Hellstrom  2018-09-26  1179  	ret =3D vmw_validation_=
add_bo(sw_context->ctx, vmw_bo, true, false);
8afa13a0583f94 Zack Rusin        2021-12-06  1180  	ttm_bo_put(&vmw_bo->bas=
e);
b139d43dacef68 Thomas Hellstrom  2018-09-26  1181  	if (unlikely(ret !=3D 0=
))
b139d43dacef68 Thomas Hellstrom  2018-09-26  1182  		return ret;
b139d43dacef68 Thomas Hellstrom  2018-09-26  1183  =

fc18afcf5fb2d8 Thomas Hellstrom  2018-09-26  1184  	reloc =3D vmw_validatio=
n_mem_alloc(sw_context->ctx, sizeof(*reloc));
fc18afcf5fb2d8 Thomas Hellstrom  2018-09-26  1185  	if (!reloc)
b139d43dacef68 Thomas Hellstrom  2018-09-26  1186  		return -ENOMEM;
ddcda24e3bec1d Thomas Hellstrom  2012-11-21  1187  =

ddcda24e3bec1d Thomas Hellstrom  2012-11-21  1188  	reloc->mob_loc =3D id;
9c079b8ce8bf8e Thomas Hellstrom  2018-09-26  1189  	reloc->vbo =3D vmw_bo;
ddcda24e3bec1d Thomas Hellstrom  2012-11-21  1190  =

ddcda24e3bec1d Thomas Hellstrom  2012-11-21  1191  	*vmw_bo_p =3D vmw_bo;
fc18afcf5fb2d8 Thomas Hellstrom  2018-09-26  1192  	list_add_tail(&reloc->h=
ead, &sw_context->bo_relocations);
fc18afcf5fb2d8 Thomas Hellstrom  2018-09-26  1193  =

ddcda24e3bec1d Thomas Hellstrom  2012-11-21  1194  	return 0;
ddcda24e3bec1d Thomas Hellstrom  2012-11-21  1195  }
ddcda24e3bec1d Thomas Hellstrom  2012-11-21  1196  =

e2fa3a76839ada Thomas Hellstrom  2011-10-04  1197  /**
2cd80dbd35518d Zack Rusin        2021-05-05  1198   * vmw_translate_guest_p=
tr - Prepare to translate a user-space buffer handle
680360a4d3f695 Deepak Rawat      2019-02-13  1199   * to a valid SVGAGuestP=
tr
e2fa3a76839ada Thomas Hellstrom  2011-10-04  1200   *
c0951b797e7d0f Thomas Hellstrom  2012-11-20  1201   * @dev_priv: Pointer to=
 a device private structure.
c0951b797e7d0f Thomas Hellstrom  2012-11-20  1202   * @sw_context: The soft=
ware context used for this command batch validation.
c0951b797e7d0f Thomas Hellstrom  2012-11-20  1203   * @ptr: Pointer to the =
user-space handle to be translated.
680360a4d3f695 Deepak Rawat      2019-02-13  1204   * @vmw_bo_p: Points to =
a location that, on successful return will carry a
680360a4d3f695 Deepak Rawat      2019-02-13  1205   * non-reference-counted=
 pointer to the DMA buffer identified by the user-space
680360a4d3f695 Deepak Rawat      2019-02-13  1206   * handle in @id.
e2fa3a76839ada Thomas Hellstrom  2011-10-04  1207   *
c0951b797e7d0f Thomas Hellstrom  2012-11-20  1208   * This function saves i=
nformation needed to translate a user-space buffer
c0951b797e7d0f Thomas Hellstrom  2012-11-20  1209   * handle to a valid SVG=
AGuestPtr. The translation does not take place
c0951b797e7d0f Thomas Hellstrom  2012-11-20  1210   * immediately, but duri=
ng a call to vmw_apply_relocations().
680360a4d3f695 Deepak Rawat      2019-02-13  1211   *
c0951b797e7d0f Thomas Hellstrom  2012-11-20  1212   * This function builds =
a relocation list and a list of buffers to validate.
c0951b797e7d0f Thomas Hellstrom  2012-11-20  1213   * The former needs to b=
e freed using either vmw_apply_relocations() or
c0951b797e7d0f Thomas Hellstrom  2012-11-20  1214   * vmw_free_relocations(=
). The latter needs to be freed using
c0951b797e7d0f Thomas Hellstrom  2012-11-20  1215   * vmw_clear_validations.
e2fa3a76839ada Thomas Hellstrom  2011-10-04  1216   */
4e4ddd47774313 Thomas Hellstrom  2010-02-21  1217  static int vmw_translate=
_guest_ptr(struct vmw_private *dev_priv,
fb1d9738ca053e Jakob Bornecrantz 2009-12-10  1218  				   struct vmw_sw_con=
text *sw_context,
4e4ddd47774313 Thomas Hellstrom  2010-02-21  1219  				   SVGAGuestPtr *ptr,
f1d34bfd70b1b4 Thomas Hellstrom  2018-06-19  1220  				   struct vmw_buffer=
_object **vmw_bo_p)
fb1d9738ca053e Jakob Bornecrantz 2009-12-10  1221  {
b139d43dacef68 Thomas Hellstrom  2018-09-26  1222  	struct vmw_buffer_objec=
t *vmw_bo;
4e4ddd47774313 Thomas Hellstrom  2010-02-21  1223  	uint32_t handle =3D ptr=
->gmrId;
fb1d9738ca053e Jakob Bornecrantz 2009-12-10  1224  	struct vmw_relocation *=
reloc;
4e4ddd47774313 Thomas Hellstrom  2010-02-21  1225  	int ret;
fb1d9738ca053e Jakob Bornecrantz 2009-12-10  1226  =

b139d43dacef68 Thomas Hellstrom  2018-09-26  1227  	vmw_validation_preload_=
bo(sw_context->ctx);
8afa13a0583f94 Zack Rusin        2021-12-06  1228  	vmw_bo =3D vmw_user_bo_=
noref_lookup(sw_context->filp, handle);
8afa13a0583f94 Zack Rusin        2021-12-06  1229  	if (IS_ERR_OR_NULL(vmw_=
bo)) {
5724f899ed8265 Deepak Rawat      2019-02-11  1230  		VMW_DEBUG_USER("Could =
not find or use GMR region.\n");
b139d43dacef68 Thomas Hellstrom  2018-09-26 @1231  		return PTR_ERR(vmw_bo);
fb1d9738ca053e Jakob Bornecrantz 2009-12-10  1232  	}
b139d43dacef68 Thomas Hellstrom  2018-09-26  1233  	ret =3D vmw_validation_=
add_bo(sw_context->ctx, vmw_bo, false, false);
8afa13a0583f94 Zack Rusin        2021-12-06  1234  	ttm_bo_put(&vmw_bo->bas=
e);
b139d43dacef68 Thomas Hellstrom  2018-09-26  1235  	if (unlikely(ret !=3D 0=
))
b139d43dacef68 Thomas Hellstrom  2018-09-26  1236  		return ret;
b139d43dacef68 Thomas Hellstrom  2018-09-26  1237  =

fc18afcf5fb2d8 Thomas Hellstrom  2018-09-26  1238  	reloc =3D vmw_validatio=
n_mem_alloc(sw_context->ctx, sizeof(*reloc));
fc18afcf5fb2d8 Thomas Hellstrom  2018-09-26  1239  	if (!reloc)
b139d43dacef68 Thomas Hellstrom  2018-09-26  1240  		return -ENOMEM;
fb1d9738ca053e Jakob Bornecrantz 2009-12-10  1241  =

4e4ddd47774313 Thomas Hellstrom  2010-02-21  1242  	reloc->location =3D ptr;
9c079b8ce8bf8e Thomas Hellstrom  2018-09-26  1243  	reloc->vbo =3D vmw_bo;
4e4ddd47774313 Thomas Hellstrom  2010-02-21  1244  	*vmw_bo_p =3D vmw_bo;
fc18afcf5fb2d8 Thomas Hellstrom  2018-09-26  1245  	list_add_tail(&reloc->h=
ead, &sw_context->bo_relocations);
fc18afcf5fb2d8 Thomas Hellstrom  2018-09-26  1246  =

4e4ddd47774313 Thomas Hellstrom  2010-02-21  1247  	return 0;
4e4ddd47774313 Thomas Hellstrom  2010-02-21  1248  }
4e4ddd47774313 Thomas Hellstrom  2010-02-21  1249  =


:::::: The code at line 1177 was first introduced by commit
:::::: b139d43dacef688a4f46f29eef34409e950f7cef drm/vmwgfx: Make buffer obj=
ect lookups reference-free during validation

:::::: TO: Thomas Hellstrom <thellstrom@vmware.com>
:::::: CC: Thomas Hellstrom <thellstrom@vmware.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2915316179361686766==--

