Content-Type: multipart/mixed; boundary="===============6599665611955138486=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-linux-intel-lts:5.4/yocto 3/3] drivers/gpu/drm/hantro_driver/hantro.c:801:9: warning: Identical condition 'ret', second condition is always false
Date: Wed, 05 Aug 2020 18:49:39 +0800
Message-ID: <202008051837.OeB1cjHk%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6599665611955138486==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: "Murugasen Krishnan, Kuhanh" <kuhanh.murugasen.krishnan@intel.com>
CC: "Qin, Chao" <chao.qin@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 5.4/yocto
head:   b8b4b73e4f7bffe85610b37cef411bf55b60fbe4
commit: b8b4b73e4f7bffe85610b37cef411bf55b60fbe4 [3/3] drm: Add Keembay med=
ia codec driver
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
compiler: h8300-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/gpu/drm/hantro_driver/hantro.c:801:9: warning: Identical conditi=
on 'ret', second condition is always false [identicalConditionAfterEarlyExi=
t]
    return ret;
           ^
   drivers/gpu/drm/hantro_driver/hantro.c:795:6: note: first condition
    if (ret)
        ^
   drivers/gpu/drm/hantro_driver/hantro.c:801:9: note: second condition
    return ret;
           ^
>> drivers/gpu/drm/hantro_driver/hantro.c:1788:5: warning: Variable 'rc' is=
 reassigned a value before the old one has been used. [redundantAssignment]
    rc =3D device_add(mem_dev);
       ^
   drivers/gpu/drm/hantro_driver/hantro.c:1785:5: note: Variable 'rc' is re=
assigned a value before the old one has been used.
    rc =3D of_dma_configure(mem_dev, dev->of_node, true);
       ^
   drivers/gpu/drm/hantro_driver/hantro.c:1788:5: note: Variable 'rc' is re=
assigned a value before the old one has been used.
    rc =3D device_add(mem_dev);
       ^
>> drivers/gpu/drm/hantro_driver/hantro.c:1818:15: warning: Uninitialized v=
ariable: vaddr [uninitvar]
    mem->vaddr =3D vaddr;
                 ^
>> drivers/gpu/drm/hantro_driver/hantro.c:1820:14: warning: Uninitialized v=
ariable: mem_size [uninitvar]
    mem->size =3D mem_size;
                ^

# https://github.com/intel/linux-intel-lts/commit/b8b4b73e4f7bffe85610b37ce=
f411bf55b60fbe4
git remote add intel-linux-intel-lts https://github.com/intel/linux-intel-l=
ts.git
git remote update intel-linux-intel-lts
git checkout b8b4b73e4f7bffe85610b37cef411bf55b60fbe4
vim +/ret +801 drivers/gpu/drm/hantro_driver/hantro.c

b8b4b73e4f7bff Murugasen Krishnan, Kuhanh 2019-10-08  774  =

b8b4b73e4f7bff Murugasen Krishnan, Kuhanh 2019-10-08  775  static int hantr=
o_gem_open(
b8b4b73e4f7bff Murugasen Krishnan, Kuhanh 2019-10-08  776  	struct drm_devi=
ce *dev,
b8b4b73e4f7bff Murugasen Krishnan, Kuhanh 2019-10-08  777  	void *data,
b8b4b73e4f7bff Murugasen Krishnan, Kuhanh 2019-10-08  778  	struct drm_file=
 *file_priv)
b8b4b73e4f7bff Murugasen Krishnan, Kuhanh 2019-10-08  779  {
b8b4b73e4f7bff Murugasen Krishnan, Kuhanh 2019-10-08  780  	int ret;
b8b4b73e4f7bff Murugasen Krishnan, Kuhanh 2019-10-08  781  	u32 handle;
b8b4b73e4f7bff Murugasen Krishnan, Kuhanh 2019-10-08  782  	struct drm_gem_=
open *openarg;
b8b4b73e4f7bff Murugasen Krishnan, Kuhanh 2019-10-08  783  	struct drm_gem_=
object *obj =3D NULL;
b8b4b73e4f7bff Murugasen Krishnan, Kuhanh 2019-10-08  784  =

b8b4b73e4f7bff Murugasen Krishnan, Kuhanh 2019-10-08  785  	openarg =3D (st=
ruct drm_gem_open *)data;
b8b4b73e4f7bff Murugasen Krishnan, Kuhanh 2019-10-08  786  =

b8b4b73e4f7bff Murugasen Krishnan, Kuhanh 2019-10-08  787  	obj =3D idr_fin=
d(&dev->object_name_idr, (int)openarg->name);
b8b4b73e4f7bff Murugasen Krishnan, Kuhanh 2019-10-08  788  	if (obj)
b8b4b73e4f7bff Murugasen Krishnan, Kuhanh 2019-10-08  789  		hantro_ref_drm=
obj(obj);
b8b4b73e4f7bff Murugasen Krishnan, Kuhanh 2019-10-08  790  	else
b8b4b73e4f7bff Murugasen Krishnan, Kuhanh 2019-10-08  791  		return -ENOENT;
b8b4b73e4f7bff Murugasen Krishnan, Kuhanh 2019-10-08  792  =

b8b4b73e4f7bff Murugasen Krishnan, Kuhanh 2019-10-08  793  	ret =3D drm_gem=
_handle_create(file_priv, obj, &handle);
b8b4b73e4f7bff Murugasen Krishnan, Kuhanh 2019-10-08  794  	hantro_unref_dr=
mobj(obj);
b8b4b73e4f7bff Murugasen Krishnan, Kuhanh 2019-10-08  795  	if (ret)
b8b4b73e4f7bff Murugasen Krishnan, Kuhanh 2019-10-08  796  		return ret;
b8b4b73e4f7bff Murugasen Krishnan, Kuhanh 2019-10-08  797  =

b8b4b73e4f7bff Murugasen Krishnan, Kuhanh 2019-10-08  798  	openarg->handle=
 =3D handle;
b8b4b73e4f7bff Murugasen Krishnan, Kuhanh 2019-10-08  799  	openarg->size =
=3D obj->size;
b8b4b73e4f7bff Murugasen Krishnan, Kuhanh 2019-10-08  800  =

b8b4b73e4f7bff Murugasen Krishnan, Kuhanh 2019-10-08 @801  	return ret;
b8b4b73e4f7bff Murugasen Krishnan, Kuhanh 2019-10-08  802  }
b8b4b73e4f7bff Murugasen Krishnan, Kuhanh 2019-10-08  803  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6599665611955138486==--

