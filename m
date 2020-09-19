Content-Type: multipart/mixed; boundary="===============1002545178359202279=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 3313/9028] drivers/media/pci/tw5864/tw5864-video.c:778:9: warning: Identical condition 'ret', second condition is always false
Date: Sat, 19 Sep 2020 13:42:30 +0800
Message-ID: <202009191323.5FJbqSoM%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1002545178359202279==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Tom Rix <trix@redhat.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Hans Verkuil <hverkuil@xs4all.nl>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   b652d2a5f2a4e93d803cc33eb57fdc41ee528500
commit: 780d815dcc9b34d93ae69385a8465c38d423ff0f [3313/9028] media: tw5864:=
 check status of tw5864_frameinterval_get
:::::: branch date: 21 hours ago
:::::: commit date: 3 weeks ago
compiler: s390-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/media/pci/tw5864/tw5864-video.c:778:9: warning: Identical condit=
ion 'ret', second condition is always false [identicalConditionAfterEarlyEx=
it]
    return ret;
           ^
   drivers/media/pci/tw5864/tw5864-video.c:770:6: note: first condition
    if (ret)
        ^
   drivers/media/pci/tw5864/tw5864-video.c:778:9: note: second condition
    return ret;
           ^
   drivers/media/pci/tw5864/tw5864-video.c:798:9: warning: Identical condit=
ion 'ret', second condition is always false [identicalConditionAfterEarlyEx=
it]
    return ret;
           ^
   drivers/media/pci/tw5864/tw5864-video.c:791:6: note: first condition
    if (ret)
        ^
   drivers/media/pci/tw5864/tw5864-video.c:798:9: note: second condition
    return ret;
           ^

# https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/?id=3D780d815dcc9b34d93ae69385a8465c38d423ff0f
git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/n=
ext/linux-next.git
git fetch --no-tags linux-next master
git checkout 780d815dcc9b34d93ae69385a8465c38d423ff0f
vim +/ret +778 drivers/media/pci/tw5864/tw5864-video.c

34d1324edd31541 Andrey Utkin 2016-07-20  748  =

34d1324edd31541 Andrey Utkin 2016-07-20  749  static int tw5864_enum_framei=
ntervals(struct file *file, void *priv,
34d1324edd31541 Andrey Utkin 2016-07-20  750  				      struct v4l2_frmival=
enum *fintv)
34d1324edd31541 Andrey Utkin 2016-07-20  751  {
34d1324edd31541 Andrey Utkin 2016-07-20  752  	struct tw5864_input *input =
=3D video_drvdata(file);
34d1324edd31541 Andrey Utkin 2016-07-20  753  	struct v4l2_fract frameinter=
val;
34d1324edd31541 Andrey Utkin 2016-07-20  754  	int std_max_fps =3D input->s=
td =3D=3D STD_NTSC ? 30 : 25;
34d1324edd31541 Andrey Utkin 2016-07-20  755  	struct v4l2_frmsizeenum fsiz=
e =3D { .index =3D fintv->index,
34d1324edd31541 Andrey Utkin 2016-07-20  756  		.pixel_format =3D fintv->pi=
xel_format };
34d1324edd31541 Andrey Utkin 2016-07-20  757  	int ret;
34d1324edd31541 Andrey Utkin 2016-07-20  758  =

34d1324edd31541 Andrey Utkin 2016-07-20  759  	ret =3D tw5864_enum_framesiz=
es(file, priv, &fsize);
34d1324edd31541 Andrey Utkin 2016-07-20  760  	if (ret)
34d1324edd31541 Andrey Utkin 2016-07-20  761  		return ret;
34d1324edd31541 Andrey Utkin 2016-07-20  762  =

34d1324edd31541 Andrey Utkin 2016-07-20  763  	if (fintv->width !=3D fsize.=
discrete.width ||
34d1324edd31541 Andrey Utkin 2016-07-20  764  	    fintv->height !=3D fsize=
.discrete.height)
34d1324edd31541 Andrey Utkin 2016-07-20  765  		return -EINVAL;
34d1324edd31541 Andrey Utkin 2016-07-20  766  =

34d1324edd31541 Andrey Utkin 2016-07-20  767  	fintv->type =3D V4L2_FRMIVAL=
_TYPE_STEPWISE;
34d1324edd31541 Andrey Utkin 2016-07-20  768  =

34d1324edd31541 Andrey Utkin 2016-07-20  769  	ret =3D tw5864_frameinterval=
_get(input, &frameinterval);
780d815dcc9b34d Tom Rix      2020-08-10  770  	if (ret)
780d815dcc9b34d Tom Rix      2020-08-10  771  		return ret;
780d815dcc9b34d Tom Rix      2020-08-10  772  =

34d1324edd31541 Andrey Utkin 2016-07-20  773  	fintv->stepwise.step =3D fra=
meinterval;
34d1324edd31541 Andrey Utkin 2016-07-20  774  	fintv->stepwise.min =3D fram=
einterval;
34d1324edd31541 Andrey Utkin 2016-07-20  775  	fintv->stepwise.max =3D fram=
einterval;
34d1324edd31541 Andrey Utkin 2016-07-20  776  	fintv->stepwise.max.numerato=
r *=3D std_max_fps;
34d1324edd31541 Andrey Utkin 2016-07-20  777  =

34d1324edd31541 Andrey Utkin 2016-07-20 @778  	return ret;
34d1324edd31541 Andrey Utkin 2016-07-20  779  }
34d1324edd31541 Andrey Utkin 2016-07-20  780  =


:::::: The code at line 778 was first introduced by commit
:::::: 34d1324edd3154105b7a3985c6c4384d602f2ab6 [media] pci: Add tw5864 dri=
ver

:::::: TO: Andrey Utkin <andrey.utkin@corp.bluecherry.net>
:::::: CC: Mauro Carvalho Chehab <mchehab@s-opensource.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1002545178359202279==--

