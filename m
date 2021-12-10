Content-Type: multipart/mixed; boundary="===============3558958106168840946=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v5 6/7] usb: gadget: uvc: add VIDIOC function
Date: Sat, 11 Dec 2021 04:36:39 +0800
Message-ID: <202112110459.3opM6tgP-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3558958106168840946==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211209084322.2662616-7-m.grzeschik@pengutronix.de>
References: <20211209084322.2662616-7-m.grzeschik@pengutronix.de>
TO: Michael Grzeschik <m.grzeschik@pengutronix.de>
TO: linux-usb(a)vger.kernel.org
CC: balbi(a)kernel.org
CC: laurent.pinchart(a)ideasonboard.com
CC: paul.elder(a)ideasonboard.com
CC: kernel(a)pengutronix.de

Hi Michael,

I love your patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on usb/usb-testing v5.16-rc4 next-20211208]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Michael-Grzeschik/usb-gadg=
et-uvc-use-configfs-entries-for-negotiation-and-v4l2-VIDIOCS/20211209-164457
base:   git://linuxtv.org/media_tree.git master
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-c002-20211209 (https://download.01.org/0day-ci/archi=
ve/20211211/202112110459.3opM6tgP-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1c=
b1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/f141049e618ab8d196ccc4891=
7c226c3f63ace67
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Michael-Grzeschik/usb-gadget-uvc-u=
se-configfs-entries-for-negotiation-and-v4l2-VIDIOCS/20211209-164457
        git checkout f141049e618ab8d196ccc48917c226c3f63ace67
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/hwtracing/coresight/coresight-syscfg.c:407:2: note: Undefined or=
 garbage value returned to caller
           return err;
           ^      ~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   drivers/hwtracing/coresight/coresight-config.c:167:4: warning: Value sto=
red to 'name' is never read [clang-analyzer-deadcode.DeadStores]
                           name =3D feat_csdev->feat_desc->params_desc[j].n=
ame;
                           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-config.c:167:4: note: Value stored=
 to 'name' is never read
                           name =3D feat_csdev->feat_desc->params_desc[j].n=
ame;
                           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-config.c:206:4: warning: Value sto=
red to 'name' is never read [clang-analyzer-deadcode.DeadStores]
                           name =3D feat_csdev->feat_desc->params_desc[j].n=
ame;
                           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-config.c:206:4: note: Value stored=
 to 'name' is never read
                           name =3D feat_csdev->feat_desc->params_desc[j].n=
ame;
                           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-config.c:234:3: warning: Value sto=
red to 'csdev' is never read [clang-analyzer-deadcode.DeadStores]
                   csdev =3D feat_csdev->csdev;
                   ^       ~~~~~~~~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-config.c:234:3: note: Value stored=
 to 'csdev' is never read
                   csdev =3D feat_csdev->csdev;
                   ^       ~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   fs/gfs2/file.c:793:3: warning: Value stored to 'pages' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                   pages =3D min(pages, nr_dirtied);
                   ^
   fs/gfs2/file.c:793:3: note: Value stored to 'pages' is never read
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   fs/gfs2/ops_fstype.c:852:2: warning: Value stored to 'jindex' is never r=
ead [clang-analyzer-deadcode.DeadStores]
           jindex =3D 0;
           ^        ~
   fs/gfs2/ops_fstype.c:852:2: note: Value stored to 'jindex' is never read
           jindex =3D 0;
           ^        ~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   fs/gfs2/inode.c:1493:4: warning: Value stored to 'error' is never read [=
clang-analyzer-deadcode.DeadStores]
                           error =3D 0;
                           ^       ~
   fs/gfs2/inode.c:1493:4: note: Value stored to 'error' is never read
                           error =3D 0;
                           ^       ~
   fs/gfs2/inode.c:1558:3: warning: Value stored to 'error' is never read [=
clang-analyzer-deadcode.DeadStores]
                   error =3D gfs2_unlink_inode(ndip, ndentry);
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/gfs2/inode.c:1558:3: note: Value stored to 'error' is never read
                   error =3D gfs2_unlink_inode(ndip, ndentry);
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/usb/gadget/function/f_uac2.c:1587:28: warning: Value stored to '=
cdev' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct usb_composite_dev *cdev =3D agdev->func.config->cdev;
                                     ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_uac2.c:1587:28: note: Value stored to 'cde=
v' during its initialization is never read
           struct usb_composite_dev *cdev =3D agdev->func.config->cdev;
                                     ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
>> drivers/usb/gadget/function/uvc_v4l2.c:128:20: warning: Value stored to =
'video' during its initialization is never read [clang-analyzer-deadcode.De=
adStores]
           struct uvc_video *video =3D &uvc->video;
                             ^~~~~   ~~~~~~~~~~~
   drivers/usb/gadget/function/uvc_v4l2.c:128:20: note: Value stored to 'vi=
deo' during its initialization is never read
           struct uvc_video *video =3D &uvc->video;
                             ^~~~~   ~~~~~~~~~~~
>> drivers/usb/gadget/function/uvc_v4l2.c:244:2: warning: Value stored to '=
fcc' is never read [clang-analyzer-deadcode.DeadStores]
           fcc =3D (u8 *)&fmt->fmt.pix.pixelformat;
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/uvc_v4l2.c:244:2: note: Value stored to 'fcc=
' is never read
           fcc =3D (u8 *)&fmt->fmt.pix.pixelformat;
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/gadget/function/uvc_v4l2.c:333:3: warning: Value stored to '=
uformat' is never read [clang-analyzer-deadcode.DeadStores]
                   uformat =3D video->cur_format;
                   ^         ~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/uvc_v4l2.c:333:3: note: Value stored to 'ufo=
rmat' is never read
                   uformat =3D video->cur_format;
                   ^         ~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   sound/soc/codecs/tlv320aic3x.c:162:25: warning: The result of the left s=
hift is undefined due to shifting by '32', which is greater or equal to the=
 width of type 'int' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           unsigned int mask =3D (1 << fls(max)) - 1;
                                  ^  ~~~~~~~~
   sound/soc/codecs/tlv320aic3x.c:162:28: note: Calling 'fls'
           unsigned int mask =3D (1 << fls(max)) - 1;
                                     ^~~~~~~~
   include/asm-generic/bitops/fls.h:15:2: note: 'r' initialized to 32
           int r =3D 32;
           ^~~~~
   include/asm-generic/bitops/fls.h:17:6: note: Assuming 'x' is not equal t=
o 0, which participates in a condition later
           if (!x)
               ^~
   include/asm-generic/bitops/fls.h:17:2: note: Taking false branch
           if (!x)
           ^
   include/asm-generic/bitops/fls.h:19:6: note: Assuming the condition is f=
alse
           if (!(x & 0xffff0000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:19:2: note: Taking false branch
           if (!(x & 0xffff0000u)) {
           ^
   include/asm-generic/bitops/fls.h:23:6: note: Assuming the condition is f=
alse
           if (!(x & 0xff000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:23:2: note: Taking false branch
           if (!(x & 0xff000000u)) {
           ^
   include/asm-generic/bitops/fls.h:27:6: note: Assuming the condition is f=
alse
           if (!(x & 0xf0000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:27:2: note: Taking false branch
           if (!(x & 0xf0000000u)) {
           ^
   include/asm-generic/bitops/fls.h:31:6: note: Assuming the condition is f=
alse
           if (!(x & 0xc0000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:31:2: note: Taking false branch
           if (!(x & 0xc0000000u)) {
           ^
   include/asm-generic/bitops/fls.h:35:6: note: Assuming the condition is f=
alse
           if (!(x & 0x80000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:35:2: note: Taking false branch
           if (!(x & 0x80000000u)) {
           ^
   include/asm-generic/bitops/fls.h:39:2: note: Returning the value 32 (loa=
ded from 'r')
           return r;
           ^~~~~~~~
   sound/soc/codecs/tlv320aic3x.c:162:28: note: Returning from 'fls'
           unsigned int mask =3D (1 << fls(max)) - 1;
                                     ^~~~~~~~
   sound/soc/codecs/tlv320aic3x.c:162:25: note: The result of the left shif=
t is undefined due to shifting by '32', which is greater or equal to the wi=
dth of type 'int'
           unsigned int mask =3D (1 << fls(max)) - 1;
                                  ^  ~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   drivers/most/configfs.c:173:2: warning: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(mdev_link->direction, page);
           ^~~~~~
   drivers/most/configfs.c:173:2: note: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119
           strcpy(mdev_link->direction, page);
           ^~~~~~
   drivers/most/configfs.c:192:2: warning: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(mdev_link->datatype, page);
           ^~~~~~
   drivers/most/configfs.c:192:2: note: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119
           strcpy(mdev_link->datatype, page);
           ^~~~~~
   drivers/most/configfs.c:446:2: warning: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(mdev_link->name, name);
           ^~~~~~
   drivers/most/configfs.c:446:2: note: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119
           strcpy(mdev_link->name, name);
           ^~~~~~
   drivers/most/configfs.c:535:2: warning: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(mdev_link->name, name);

vim +/video +128 drivers/usb/gadget/function/uvc_v4l2.c

f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  123  =

f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  124  static struct uvcg_frame *find_closest_frame_by_size(struct u=
vc_device *uvc,
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  125  					   struct uvcg_format *uformat,
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  126  					   u16 rw, u16 rh)
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  127  {
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09 @128  	struct uvc_video *video =3D &uvc->video;
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  129  	struct uvcg_format_ptr *format;
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  130  	struct uvcg_frame_ptr *frame;
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  131  	struct uvcg_frame *uframe =3D NULL;
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  132  	unsigned int d, maxd;
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  133  =

f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  134  	/* Find the closest image size. The distance between image s=
izes is
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  135  	 * the size in pixels of the non-overlapping regions between=
 the
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  136  	 * requested size and the frame-specified size.
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  137  	 */
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  138  	maxd =3D (unsigned int)-1;
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  139  =

f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  140  	list_for_each_entry(format, &uvc->header->formats, entry) {
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  141  		if (format->fmt->type !=3D uformat->type)
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  142  			continue;
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  143  =

f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  144  		list_for_each_entry(frame, &format->fmt->frames, entry) {
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  145  			u16 w, h;
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  146  =

f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  147  			w =3D frame->frm->frame.w_width;
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  148  			h =3D frame->frm->frame.w_height;
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  149  =

f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  150  			d =3D min(w, rw) * min(h, rh);
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  151  			d =3D w*h + rw*rh - 2*d;
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  152  			if (d < maxd) {
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  153  				maxd =3D d;
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  154  				uframe =3D frame->frm;
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  155  			}
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  156  =

f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  157  			if (maxd =3D=3D 0)
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  158  				break;
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  159  		}
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  160  	}
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  161  =

f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  162  	if (!uframe)
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  163  		uvcg_dbg(&video->uvc->func, "Unsupported size %ux%u\n", rw,=
 rh);
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  164  =

f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  165  	return uframe;
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  166  }
cdda479f15cd13 drivers/usb/gadget/uvc_v4l2.c          Laurent Pinchart  201=
0-05-02  167  =

cdda479f15cd13 drivers/usb/gadget/uvc_v4l2.c          Laurent Pinchart  201=
0-05-02  168  /* ----------------------------------------------------------=
----------------
cdda479f15cd13 drivers/usb/gadget/uvc_v4l2.c          Laurent Pinchart  201=
0-05-02  169   * Requests handling
cdda479f15cd13 drivers/usb/gadget/uvc_v4l2.c          Laurent Pinchart  201=
0-05-02  170   */
cdda479f15cd13 drivers/usb/gadget/uvc_v4l2.c          Laurent Pinchart  201=
0-05-02  171  =

cdda479f15cd13 drivers/usb/gadget/uvc_v4l2.c          Laurent Pinchart  201=
0-05-02  172  static int
cdda479f15cd13 drivers/usb/gadget/uvc_v4l2.c          Laurent Pinchart  201=
0-05-02  173  uvc_send_response(struct uvc_device *uvc, struct uvc_request_=
data *data)
cdda479f15cd13 drivers/usb/gadget/uvc_v4l2.c          Laurent Pinchart  201=
0-05-02  174  {
cdda479f15cd13 drivers/usb/gadget/uvc_v4l2.c          Laurent Pinchart  201=
0-05-02  175  	struct usb_composite_dev *cdev =3D uvc->func.config->cdev;
cdda479f15cd13 drivers/usb/gadget/uvc_v4l2.c          Laurent Pinchart  201=
0-05-02  176  	struct usb_request *req =3D uvc->control_req;
cdda479f15cd13 drivers/usb/gadget/uvc_v4l2.c          Laurent Pinchart  201=
0-05-02  177  =

cdda479f15cd13 drivers/usb/gadget/uvc_v4l2.c          Laurent Pinchart  201=
0-05-02  178  	if (data->length < 0)
cdda479f15cd13 drivers/usb/gadget/uvc_v4l2.c          Laurent Pinchart  201=
0-05-02  179  		return usb_ep_set_halt(cdev->gadget->ep0);
cdda479f15cd13 drivers/usb/gadget/uvc_v4l2.c          Laurent Pinchart  201=
0-05-02  180  =

6f6543f53f9ce1 drivers/usb/gadget/uvc_v4l2.c          Laurent Pinchart  201=
2-04-24  181  	req->length =3D min_t(unsigned int, uvc->event_length, data-=
>length);
cdda479f15cd13 drivers/usb/gadget/uvc_v4l2.c          Laurent Pinchart  201=
0-05-02  182  	req->zero =3D data->length < uvc->event_length;
cdda479f15cd13 drivers/usb/gadget/uvc_v4l2.c          Laurent Pinchart  201=
0-05-02  183  =

a5eaaa1f33e771 drivers/usb/gadget/uvc_v4l2.c          Dan Carpenter     201=
3-03-14  184  	memcpy(req->buf, data->data, req->length);
cdda479f15cd13 drivers/usb/gadget/uvc_v4l2.c          Laurent Pinchart  201=
0-05-02  185  =

cdda479f15cd13 drivers/usb/gadget/uvc_v4l2.c          Laurent Pinchart  201=
0-05-02  186  	return usb_ep_queue(cdev->gadget->ep0, req, GFP_KERNEL);
cdda479f15cd13 drivers/usb/gadget/uvc_v4l2.c          Laurent Pinchart  201=
0-05-02  187  }
cdda479f15cd13 drivers/usb/gadget/uvc_v4l2.c          Laurent Pinchart  201=
0-05-02  188  =

cdda479f15cd13 drivers/usb/gadget/uvc_v4l2.c          Laurent Pinchart  201=
0-05-02  189  /* ----------------------------------------------------------=
----------------
a1d27a4bf5bb41 drivers/usb/gadget/function/uvc_v4l2.c Laurent Pinchart  201=
4-09-08  190   * V4L2 ioctls
cdda479f15cd13 drivers/usb/gadget/uvc_v4l2.c          Laurent Pinchart  201=
0-05-02  191   */
cdda479f15cd13 drivers/usb/gadget/uvc_v4l2.c          Laurent Pinchart  201=
0-05-02  192  =

cdda479f15cd13 drivers/usb/gadget/uvc_v4l2.c          Laurent Pinchart  201=
0-05-02  193  static int
a1d27a4bf5bb41 drivers/usb/gadget/function/uvc_v4l2.c Laurent Pinchart  201=
4-09-08  194  uvc_v4l2_querycap(struct file *file, void *fh, struct v4l2_ca=
pability *cap)
cdda479f15cd13 drivers/usb/gadget/uvc_v4l2.c          Laurent Pinchart  201=
0-05-02  195  {
a1d27a4bf5bb41 drivers/usb/gadget/function/uvc_v4l2.c Laurent Pinchart  201=
4-09-08  196  	struct video_device *vdev =3D video_devdata(file);
a1d27a4bf5bb41 drivers/usb/gadget/function/uvc_v4l2.c Laurent Pinchart  201=
4-09-08  197  	struct uvc_device *uvc =3D video_get_drvdata(vdev);
a1d27a4bf5bb41 drivers/usb/gadget/function/uvc_v4l2.c Laurent Pinchart  201=
4-09-08  198  	struct usb_composite_dev *cdev =3D uvc->func.config->cdev;
a1d27a4bf5bb41 drivers/usb/gadget/function/uvc_v4l2.c Laurent Pinchart  201=
4-09-08  199  =

a1d27a4bf5bb41 drivers/usb/gadget/function/uvc_v4l2.c Laurent Pinchart  201=
4-09-08  200  	strlcpy(cap->driver, "g_uvc", sizeof(cap->driver));
a1d27a4bf5bb41 drivers/usb/gadget/function/uvc_v4l2.c Laurent Pinchart  201=
4-09-08  201  	strlcpy(cap->card, cdev->gadget->name, sizeof(cap->card));
a1d27a4bf5bb41 drivers/usb/gadget/function/uvc_v4l2.c Laurent Pinchart  201=
4-09-08  202  	strlcpy(cap->bus_info, dev_name(&cdev->gadget->dev),
a1d27a4bf5bb41 drivers/usb/gadget/function/uvc_v4l2.c Laurent Pinchart  201=
4-09-08  203  		sizeof(cap->bus_info));
a1d27a4bf5bb41 drivers/usb/gadget/function/uvc_v4l2.c Laurent Pinchart  201=
4-09-08  204  	return 0;
a1d27a4bf5bb41 drivers/usb/gadget/function/uvc_v4l2.c Laurent Pinchart  201=
4-09-08  205  }
a1d27a4bf5bb41 drivers/usb/gadget/function/uvc_v4l2.c Laurent Pinchart  201=
4-09-08  206  =

a1d27a4bf5bb41 drivers/usb/gadget/function/uvc_v4l2.c Laurent Pinchart  201=
4-09-08  207  static int
a1d27a4bf5bb41 drivers/usb/gadget/function/uvc_v4l2.c Laurent Pinchart  201=
4-09-08  208  uvc_v4l2_get_format(struct file *file, void *fh, struct v4l2_=
format *fmt)
a1d27a4bf5bb41 drivers/usb/gadget/function/uvc_v4l2.c Laurent Pinchart  201=
4-09-08  209  {
a1d27a4bf5bb41 drivers/usb/gadget/function/uvc_v4l2.c Laurent Pinchart  201=
4-09-08  210  	struct video_device *vdev =3D video_devdata(file);
a1d27a4bf5bb41 drivers/usb/gadget/function/uvc_v4l2.c Laurent Pinchart  201=
4-09-08  211  	struct uvc_device *uvc =3D video_get_drvdata(vdev);
a1d27a4bf5bb41 drivers/usb/gadget/function/uvc_v4l2.c Laurent Pinchart  201=
4-09-08  212  	struct uvc_video *video =3D &uvc->video;
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  213  	struct uvc_format_desc *fmtdesc;
a1d27a4bf5bb41 drivers/usb/gadget/function/uvc_v4l2.c Laurent Pinchart  201=
4-09-08  214  =

f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  215  	fmtdesc =3D to_uvc_format(video->cur_format);
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  216  =

f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  217  	fmt->fmt.pix.pixelformat =3D fmtdesc->fcc;
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  218  	fmt->fmt.pix.width =3D video->cur_frame->frame.w_width;
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  219  	fmt->fmt.pix.height =3D video->cur_frame->frame.w_height;
cdda479f15cd13 drivers/usb/gadget/uvc_v4l2.c          Laurent Pinchart  201=
0-05-02  220  	fmt->fmt.pix.field =3D V4L2_FIELD_NONE;
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  221  	fmt->fmt.pix.bytesperline =3D uvc_v4l2_get_bytesperline(vide=
o->cur_format,
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  222  							      video->cur_frame);
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  223  	fmt->fmt.pix.sizeimage =3D
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  224  			video->cur_frame->frame.dw_max_video_frame_buffer_size;
cdda479f15cd13 drivers/usb/gadget/uvc_v4l2.c          Laurent Pinchart  201=
0-05-02  225  	fmt->fmt.pix.colorspace =3D V4L2_COLORSPACE_SRGB;
cdda479f15cd13 drivers/usb/gadget/uvc_v4l2.c          Laurent Pinchart  201=
0-05-02  226  	fmt->fmt.pix.priv =3D 0;
cdda479f15cd13 drivers/usb/gadget/uvc_v4l2.c          Laurent Pinchart  201=
0-05-02  227  =

cdda479f15cd13 drivers/usb/gadget/uvc_v4l2.c          Laurent Pinchart  201=
0-05-02  228  	return 0;
cdda479f15cd13 drivers/usb/gadget/uvc_v4l2.c          Laurent Pinchart  201=
0-05-02  229  }
cdda479f15cd13 drivers/usb/gadget/uvc_v4l2.c          Laurent Pinchart  201=
0-05-02  230  =

cdda479f15cd13 drivers/usb/gadget/uvc_v4l2.c          Laurent Pinchart  201=
0-05-02  231  static int
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  232  uvc_v4l2_try_set_fmt(struct file *file, void *fh, struct v4l2=
_format *fmt)
cdda479f15cd13 drivers/usb/gadget/uvc_v4l2.c          Laurent Pinchart  201=
0-05-02  233  {
a1d27a4bf5bb41 drivers/usb/gadget/function/uvc_v4l2.c Laurent Pinchart  201=
4-09-08  234  	struct video_device *vdev =3D video_devdata(file);
a1d27a4bf5bb41 drivers/usb/gadget/function/uvc_v4l2.c Laurent Pinchart  201=
4-09-08  235  	struct uvc_device *uvc =3D video_get_drvdata(vdev);
a1d27a4bf5bb41 drivers/usb/gadget/function/uvc_v4l2.c Laurent Pinchart  201=
4-09-08  236  	struct uvc_video *video =3D &uvc->video;
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  237  	struct uvcg_format *uformat;
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  238  	struct uvcg_frame *uframe;
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  239  	u8 *fcc;
cdda479f15cd13 drivers/usb/gadget/uvc_v4l2.c          Laurent Pinchart  201=
0-05-02  240  =

f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  241  	if (fmt->type !=3D video->queue.queue.type)
cdda479f15cd13 drivers/usb/gadget/uvc_v4l2.c          Laurent Pinchart  201=
0-05-02  242  		return -EINVAL;
cdda479f15cd13 drivers/usb/gadget/uvc_v4l2.c          Laurent Pinchart  201=
0-05-02  243  =

f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09 @244  	fcc =3D (u8 *)&fmt->fmt.pix.pixelformat;
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  245  	uvcg_dbg(&uvc->func, "Trying format 0x%08x (%c%c%c%c): %ux%u=
\n",
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  246  		fmt->fmt.pix.pixelformat,
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  247  		fcc[0], fcc[1], fcc[2], fcc[3],
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  248  		fmt->fmt.pix.width, fmt->fmt.pix.height);
cdda479f15cd13 drivers/usb/gadget/uvc_v4l2.c          Laurent Pinchart  201=
0-05-02  249  =

f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  250  	uformat =3D find_format_by_pix(uvc, fmt->fmt.pix.pixelformat=
);
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  251  	if (!uformat)
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  252  		return -EINVAL;
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  253  =

f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  254  	uframe =3D find_closest_frame_by_size(uvc, uformat,
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  255  				fmt->fmt.pix.width, fmt->fmt.pix.height);
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  256  	if (!uframe)
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  257  		return -EINVAL;
cdda479f15cd13 drivers/usb/gadget/uvc_v4l2.c          Laurent Pinchart  201=
0-05-02  258  =

f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  259  	fmt->fmt.pix.width =3D uframe->frame.w_width;
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  260  	fmt->fmt.pix.height =3D uframe->frame.w_height;
cdda479f15cd13 drivers/usb/gadget/uvc_v4l2.c          Laurent Pinchart  201=
0-05-02  261  	fmt->fmt.pix.field =3D V4L2_FIELD_NONE;
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  262  	fmt->fmt.pix.bytesperline =3D uvc_v4l2_get_bytesperline(ufor=
mat, uframe);
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  263  	fmt->fmt.pix.sizeimage =3D uframe->frame.dw_max_video_frame_=
buffer_size;
f141049e618ab8 drivers/usb/gadget/function/uvc_v4l2.c Michael Grzeschik 202=
1-12-09  264  	fmt->fmt.pix.pixelformat =3D to_uvc_format(uformat)->fcc;
cdda479f15cd13 drivers/usb/gadget/uvc_v4l2.c          Laurent Pinchart  201=
0-05-02  265  	fmt->fmt.pix.colorspace =3D V4L2_COLORSPACE_SRGB;
cdda479f15cd13 drivers/usb/gadget/uvc_v4l2.c          Laurent Pinchart  201=
0-05-02  266  	fmt->fmt.pix.priv =3D 0;
cdda479f15cd13 drivers/usb/gadget/uvc_v4l2.c          Laurent Pinchart  201=
0-05-02  267  =

cdda479f15cd13 drivers/usb/gadget/uvc_v4l2.c          Laurent Pinchart  201=
0-05-02  268  	return 0;
cdda479f15cd13 drivers/usb/gadget/uvc_v4l2.c          Laurent Pinchart  201=
0-05-02  269  }
cdda479f15cd13 drivers/usb/gadget/uvc_v4l2.c          Laurent Pinchart  201=
0-05-02  270  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3558958106168840946==--

