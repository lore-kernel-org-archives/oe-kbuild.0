Content-Type: multipart/mixed; boundary="===============0506548806951129349=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [sashal-linux-stable:queue-4.19 58/97] drivers/media/pci/tw5864/tw5864-video.c:787:9: warning: Identical condition 'ret', second condition is always false
Date: Mon, 02 Nov 2020 17:39:46 +0800
Message-ID: <202011021738.Vexh3UV0-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0506548806951129349==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Alexander Levin <alexander.levin@microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable=
.git queue-4.19
head:   a37630ee7f90d3da0e9657da6aaa8e24540d3e78
commit: 193d6711c001772428e8534f557336d08024bd88 [58/97] media: tw5864: che=
ck status of tw5864_frameinterval_get
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
compiler: sparc64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/media/pci/tw5864/tw5864-video.c:787:9: warning: Identical condit=
ion 'ret', second condition is always false [identicalConditionAfterEarlyEx=
it]
    return ret;
           ^
   drivers/media/pci/tw5864/tw5864-video.c:779:6: note: first condition
    if (ret)
        ^
   drivers/media/pci/tw5864/tw5864-video.c:787:9: note: second condition
    return ret;
           ^
   drivers/media/pci/tw5864/tw5864-video.c:807:9: warning: Identical condit=
ion 'ret', second condition is always false [identicalConditionAfterEarlyEx=
it]
    return ret;
           ^
   drivers/media/pci/tw5864/tw5864-video.c:800:6: note: first condition
    if (ret)
        ^
   drivers/media/pci/tw5864/tw5864-video.c:807:9: note: second condition
    return ret;
           ^

vim +/ret +787 drivers/media/pci/tw5864/tw5864-video.c

34d1324edd31541 Andrey Utkin 2016-07-20  757  =

34d1324edd31541 Andrey Utkin 2016-07-20  758  static int tw5864_enum_framei=
ntervals(struct file *file, void *priv,
34d1324edd31541 Andrey Utkin 2016-07-20  759  				      struct v4l2_frmival=
enum *fintv)
34d1324edd31541 Andrey Utkin 2016-07-20  760  {
34d1324edd31541 Andrey Utkin 2016-07-20  761  	struct tw5864_input *input =
=3D video_drvdata(file);
34d1324edd31541 Andrey Utkin 2016-07-20  762  	struct v4l2_fract frameinter=
val;
34d1324edd31541 Andrey Utkin 2016-07-20  763  	int std_max_fps =3D input->s=
td =3D=3D STD_NTSC ? 30 : 25;
34d1324edd31541 Andrey Utkin 2016-07-20  764  	struct v4l2_frmsizeenum fsiz=
e =3D { .index =3D fintv->index,
34d1324edd31541 Andrey Utkin 2016-07-20  765  		.pixel_format =3D fintv->pi=
xel_format };
34d1324edd31541 Andrey Utkin 2016-07-20  766  	int ret;
34d1324edd31541 Andrey Utkin 2016-07-20  767  =

34d1324edd31541 Andrey Utkin 2016-07-20  768  	ret =3D tw5864_enum_framesiz=
es(file, priv, &fsize);
34d1324edd31541 Andrey Utkin 2016-07-20  769  	if (ret)
34d1324edd31541 Andrey Utkin 2016-07-20  770  		return ret;
34d1324edd31541 Andrey Utkin 2016-07-20  771  =

34d1324edd31541 Andrey Utkin 2016-07-20  772  	if (fintv->width !=3D fsize.=
discrete.width ||
34d1324edd31541 Andrey Utkin 2016-07-20  773  	    fintv->height !=3D fsize=
.discrete.height)
34d1324edd31541 Andrey Utkin 2016-07-20  774  		return -EINVAL;
34d1324edd31541 Andrey Utkin 2016-07-20  775  =

34d1324edd31541 Andrey Utkin 2016-07-20  776  	fintv->type =3D V4L2_FRMIVAL=
_TYPE_STEPWISE;
34d1324edd31541 Andrey Utkin 2016-07-20  777  =

34d1324edd31541 Andrey Utkin 2016-07-20  778  	ret =3D tw5864_frameinterval=
_get(input, &frameinterval);
193d6711c001772 Tom Rix      2020-08-10  779  	if (ret)
193d6711c001772 Tom Rix      2020-08-10  780  		return ret;
193d6711c001772 Tom Rix      2020-08-10  781  =

34d1324edd31541 Andrey Utkin 2016-07-20  782  	fintv->stepwise.step =3D fra=
meinterval;
34d1324edd31541 Andrey Utkin 2016-07-20  783  	fintv->stepwise.min =3D fram=
einterval;
34d1324edd31541 Andrey Utkin 2016-07-20  784  	fintv->stepwise.max =3D fram=
einterval;
34d1324edd31541 Andrey Utkin 2016-07-20  785  	fintv->stepwise.max.numerato=
r *=3D std_max_fps;
34d1324edd31541 Andrey Utkin 2016-07-20  786  =

34d1324edd31541 Andrey Utkin 2016-07-20 @787  	return ret;
34d1324edd31541 Andrey Utkin 2016-07-20  788  }
34d1324edd31541 Andrey Utkin 2016-07-20  789  =


:::::: The code at line 787 was first introduced by commit
:::::: 34d1324edd3154105b7a3985c6c4384d602f2ab6 [media] pci: Add tw5864 dri=
ver

:::::: TO: Andrey Utkin <andrey.utkin@corp.bluecherry.net>
:::::: CC: Mauro Carvalho Chehab <mchehab@s-opensource.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0506548806951129349==--

