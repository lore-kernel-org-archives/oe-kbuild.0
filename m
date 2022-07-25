Content-Type: multipart/mixed; boundary="===============3075528381758450487=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [mchehab-experimental:master 366/438] drivers/media/usb/uvc/uvc_ctrl.c:846:9: warning: Null pointer passed as 2nd argument to memory comparison function [clang-analyzer-unix.cstring.NullArg]
Date: Mon, 25 Jul 2022 10:32:38 +0800
Message-ID: <202207251036.FZDMFQpy-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3075528381758450487==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/m=
edia/usb/uvc/uvc_ctrl.c:846:9: warning: Null pointer passed as 2nd argument=
 to memory comparison function [clang-analyzer-unix.cstring.NullArg]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Ricardo Ribalda <ribalda@chromium.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

tree:   https://git.linuxtv.org/mchehab/experimental.git master
head:   8bd1dbf8d580c425605fb8936309a4e9745a7a95
commit: 86f7ef77315687df144042762325c53d9a3a28c9 [366/438] media: uvcvideo:=
 Add support for per-device control mapping overrides
:::::: branch date: 8 days ago
:::::: commit date: 9 days ago
config: arm-randconfig-c002-20220718 (https://download.01.org/0day-ci/archi=
ve/20220725/202207251036.FZDMFQpy-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project dd5635=
541cd7bbd62cd59b6694dfb759b6e9a0d8)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        git remote add mchehab-experimental https://git.linuxtv.org/mchehab=
/experimental.git
        git fetch --no-tags mchehab-experimental master
        git checkout 86f7ef77315687df144042762325c53d9a3a28c9
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

clang-analyzer warnings: (new ones prefixed by >>)
                   if (crc !=3D buf[i + 2]) {
                       ^~~~~~~~~~~~~~~~~
   drivers/iio/chemical/scd30_i2c.c:99:3: note: Taking false branch
                   if (crc !=3D buf[i + 2]) {
                   ^
   drivers/iio/chemical/scd30_i2c.c:104:10: note: Dereference of null point=
er
                   *rsp++ =3D buf[i];
                   ~~~~~~~^~~~~~~~
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/media/tuners/tua9001.c:148:21: warning: Value stored to 'client'=
 during its initialization is never read [clang-analyzer-deadcode.DeadStore=
s]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/tua9001.c:148:21: note: Value stored to 'client' du=
ring its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/tua9001.c:217:2: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&fe->ops.tuner_ops, &tua9001_tuner_ops,
           ^~~~~~
   drivers/media/tuners/tua9001.c:217:2: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&fe->ops.tuner_ops, &tua9001_tuner_ops,
           ^~~~~~
   Suppressed 44 warnings (43 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   53 warnings generated.
   drivers/media/tuners/xc2028.c:287:2: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&priv->cur_fw, 0, sizeof(priv->cur_fw));
           ^~~~~~
   drivers/media/tuners/xc2028.c:287:2: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
           memset(&priv->cur_fw, 0, sizeof(priv->cur_fw));
           ^~~~~~
   drivers/media/tuners/xc2028.c:321:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(name, p, sizeof(name) - 1);
           ^~~~~~
   drivers/media/tuners/xc2028.c:321:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(name, p, sizeof(name) - 1);
           ^~~~~~
   drivers/media/tuners/xc2028.c:631:4: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(buf + 1, p, len);
                           ^~~~~~
   drivers/media/tuners/xc2028.c:631:4: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(buf + 1, p, len);
                           ^~~~~~
   drivers/media/tuners/xc2028.c:769:2: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&priv->cur_fw, 0, sizeof(priv->cur_fw));
           ^~~~~~
   drivers/media/tuners/xc2028.c:769:2: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
           memset(&priv->cur_fw, 0, sizeof(priv->cur_fw));
           ^~~~~~
   drivers/media/tuners/xc2028.c:1037:3: warning: Value stored to 'rc' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   rc =3D send_seq(priv, {0x00, 0x00});
                   ^
   drivers/media/tuners/xc2028.c:1037:3: note: Value stored to 'rc' is neve=
r read
   drivers/media/tuners/xc2028.c:1396:2: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&priv->ctrl, p, sizeof(priv->ctrl));
           ^~~~~~
   drivers/media/tuners/xc2028.c:1396:2: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&priv->ctrl, p, sizeof(priv->ctrl));
           ^~~~~~
   drivers/media/tuners/xc2028.c:1497:2: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&fe->ops.tuner_ops, &xc2028_dvb_tuner_ops,
           ^~~~~~
   drivers/media/tuners/xc2028.c:1497:2: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&fe->ops.tuner_ops, &xc2028_dvb_tuner_ops,
           ^~~~~~
   Suppressed 46 warnings (44 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   61 warnings generated.
   drivers/media/usb/uvc/uvc_ctrl.c:832:37: warning: The result of the left=
 shift is undefined because the left operand is negative [clang-analyzer-co=
re.UndefinedBinaryOperatorResult]
                   *data =3D (*data & ~mask) | ((value << offset) & mask);
                                               ~~~~~ ^
   drivers/media/usb/uvc/uvc_ctrl.c:824:6: note: Assuming field 'v4l2_type'=
 is equal to V4L2_CTRL_TYPE_BUTTON
           if (mapping->v4l2_type =3D=3D V4L2_CTRL_TYPE_BUTTON)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/uvc/uvc_ctrl.c:824:2: note: Taking true branch
           if (mapping->v4l2_type =3D=3D V4L2_CTRL_TYPE_BUTTON)
           ^
   drivers/media/usb/uvc/uvc_ctrl.c:830:9: note: Assuming 'bits' is > 0
           for (; bits > 0; data++) {
                  ^~~~~~~~
   drivers/media/usb/uvc/uvc_ctrl.c:830:2: note: Loop condition is true.  E=
ntering loop body
           for (; bits > 0; data++) {
           ^
   drivers/media/usb/uvc/uvc_ctrl.c:833:13: note: Assuming 'offset' is 0
                   value >>=3D offset ? offset : 8;
                             ^~~~~~
   drivers/media/usb/uvc/uvc_ctrl.c:833:13: note: '?' condition is false
   drivers/media/usb/uvc/uvc_ctrl.c:833:3: note: The value -1 is assigned t=
o 'value'
                   value >>=3D offset ? offset : 8;
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/uvc/uvc_ctrl.c:830:9: note: Assuming 'bits' is > 0
           for (; bits > 0; data++) {
                  ^~~~~~~~
   drivers/media/usb/uvc/uvc_ctrl.c:830:2: note: Loop condition is true.  E=
ntering loop body
           for (; bits > 0; data++) {
           ^
   drivers/media/usb/uvc/uvc_ctrl.c:832:37: note: The result of the left sh=
ift is undefined because the left operand is negative
                   *data =3D (*data & ~mask) | ((value << offset) & mask);
                                               ~~~~~ ^
>> drivers/media/usb/uvc/uvc_ctrl.c:846:9: warning: Null pointer passed as =
2nd argument to memory comparison function [clang-analyzer-unix.cstring.Nul=
lArg]
           return memcmp(entity->guid, guid, sizeof(entity->guid)) =3D=3D 0;
                  ^
   drivers/media/usb/uvc/uvc_ctrl.c:2557:2: note: Loop condition is false. =
 Exiting loop
           INIT_WORK(&dev->async_ctrl.work, uvc_ctrl_status_event_work);
           ^
   include/linux/workqueue.h:245:2: note: expanded from macro 'INIT_WORK'
           __INIT_WORK((_work), (_func), 0)
           ^
   include/linux/workqueue.h:236:2: note: expanded from macro '__INIT_WORK'
           do {                                                            \
           ^
   drivers/media/usb/uvc/uvc_ctrl.c:2559:2: note: Loop condition is true.  =
Entering loop body
           list_for_each_entry(chain, &dev->chains, list) {
           ^
   include/linux/list.h:674:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/media/usb/uvc/uvc_ctrl.c:2560:9: note: Calling 'uvc_ctrl_init_ch=
ain'
                   ret =3D uvc_ctrl_init_chain(chain);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/uvc/uvc_ctrl.c:2502:2: note: Loop condition is true.  =
Entering loop body
           list_for_each_entry(entity, &chain->entities, chain) {
           ^
   include/linux/list.h:674:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/media/usb/uvc/uvc_ctrl.c:2507:7: note: Assuming the condition is=
 false
                   if (UVC_ENTITY_TYPE(entity) =3D=3D UVC_VC_EXTENSION_UNIT=
) {
                       ^
   drivers/media/usb/uvc/uvcvideo.h:31:34: note: expanded from macro 'UVC_E=
NTITY_TYPE'
   #define UVC_ENTITY_TYPE(entity)         ((entity)->type & 0x7fff)
                                           ^
   drivers/media/usb/uvc/uvc_ctrl.c:2507:3: note: Taking false branch
                   if (UVC_ENTITY_TYPE(entity) =3D=3D UVC_VC_EXTENSION_UNIT=
) {
                   ^
   drivers/media/usb/uvc/uvc_ctrl.c:2510:14: note: Assuming the condition i=
s false
                   } else if (UVC_ENTITY_TYPE(entity) =3D=3D UVC_VC_PROCESS=
ING_UNIT) {
                              ^
   drivers/media/usb/uvc/uvcvideo.h:31:34: note: expanded from macro 'UVC_E=
NTITY_TYPE'
   #define UVC_ENTITY_TYPE(entity)         ((entity)->type & 0x7fff)
                                           ^
   drivers/media/usb/uvc/uvc_ctrl.c:2510:10: note: Taking false branch
                   } else if (UVC_ENTITY_TYPE(entity) =3D=3D UVC_VC_PROCESS=
ING_UNIT) {
                          ^
   drivers/media/usb/uvc/uvc_ctrl.c:2513:14: note: Assuming the condition i=
s false
                   } else if (UVC_ENTITY_TYPE(entity) =3D=3D UVC_ITT_CAMERA=
) {
                              ^
   drivers/media/usb/uvc/uvcvideo.h:31:34: note: expanded from macro 'UVC_E=
NTITY_TYPE'
   #define UVC_ENTITY_TYPE(entity)         ((entity)->type & 0x7fff)
                                           ^
   drivers/media/usb/uvc/uvc_ctrl.c:2513:10: note: Taking false branch
                   } else if (UVC_ENTITY_TYPE(entity) =3D=3D UVC_ITT_CAMERA=
) {
                          ^
   drivers/media/usb/uvc/uvc_ctrl.c:2516:14: note: Assuming the condition i=
s true
                   } else if (UVC_ENTITY_TYPE(entity) =3D=3D UVC_EXT_GPIO_U=
NIT) {
                              ^
   drivers/media/usb/uvc/uvcvideo.h:31:34: note: expanded from macro 'UVC_E=
NTITY_TYPE'
   #define UVC_ENTITY_TYPE(entity)         ((entity)->type & 0x7fff)
                                           ^
   drivers/media/usb/uvc/uvc_ctrl.c:2516:10: note: Taking true branch
                   } else if (UVC_ENTITY_TYPE(entity) =3D=3D UVC_EXT_GPIO_U=
NIT) {
                          ^
   drivers/media/usb/uvc/uvc_ctrl.c:2526:7: note: Assuming 'ncontrols' is n=
ot equal to 0
                   if (ncontrols =3D=3D 0)
                       ^~~~~~~~~~~~~~
   drivers/media/usb/uvc/uvc_ctrl.c:2526:3: note: Taking false branch
                   if (ncontrols =3D=3D 0)
                   ^
   drivers/media/usb/uvc/uvc_ctrl.c:2531:7: note: Assuming field 'controls'=
 is not equal to NULL
                   if (entity->controls =3D=3D NULL)
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/uvc/uvc_ctrl.c:2531:3: note: Taking false branch
                   if (entity->controls =3D=3D NULL)
                   ^
   drivers/media/usb/uvc/uvc_ctrl.c:2537:15: note: Assuming the condition i=
s true
                   for (i =3D 0; i < bControlSize * 8; ++i) {
                               ^~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/uvc/uvc_ctrl.c:2537:3: note: Loop condition is true.  =
Entering loop body
                   for (i =3D 0; i < bControlSize * 8; ++i) {
                   ^
   drivers/media/usb/uvc/uvc_ctrl.c:2538:8: note: Assuming the condition is=
 false
                           if (uvc_test_bit(bmControls, i) =3D=3D 0)
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/uvc/uvc_ctrl.c:2538:4: note: Taking false branch
                           if (uvc_test_bit(bmControls, i) =3D=3D 0)
                           ^
   drivers/media/usb/uvc/uvc_ctrl.c:2544:4: note: Calling 'uvc_ctrl_init_ct=
rl'
                           uvc_ctrl_init_ctrl(chain, ctrl);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/uvc/uvc_ctrl.c:2426:2: note: Taking false branch
           if (UVC_ENTITY_TYPE(ctrl->entity) =3D=3D UVC_VC_EXTENSION_UNIT)
           ^
   drivers/media/usb/uvc/uvc_ctrl.c:2429:2: note: Loop condition is true.  =
Entering loop body
           for (; info < iend; ++info) {
           ^
   drivers/media/usb/uvc/uvc_ctrl.c:2430:7: note: Left side of '&&' is true
                   if (uvc_entity_match_guid(ctrl->entity, info->entity) &&
                       ^
   drivers/media/usb/uvc/uvc_ctrl.c:2431:7: note: Assuming 'ctrl->index' is=
 equal to 'info->index'
                       ctrl->index =3D=3D info->index) {

vim +846 drivers/media/usb/uvc/uvc_ctrl.c

c0efd232929c2c drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2008-06-=
30  838  =

c0efd232929c2c drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2008-06-=
30  839  /* ---------------------------------------------------------------=
---------
c0efd232929c2c drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2008-06-=
30  840   * Terminal and unit management
c0efd232929c2c drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2008-06-=
30  841   */
c0efd232929c2c drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2008-06-=
30  842  =

f9d81df9b8d77f drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
17  843  static int uvc_entity_match_guid(const struct uvc_entity *entity,
2c6b222cee2d68 drivers/media/usb/uvc/uvc_ctrl.c   Laurent Pinchart 2018-01-=
16  844  				 const u8 guid[16])
c0efd232929c2c drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2008-06-=
30  845  {
351509c604dcb0 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2020-12-=
23 @846  	return memcmp(entity->guid, guid, sizeof(entity->guid)) =3D=3D 0;
c0efd232929c2c drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2008-06-=
30  847  }
c0efd232929c2c drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2008-06-=
30  848  =


:::::: The code at line 846 was first introduced by commit
:::::: 351509c604dcb065305a165d7552058c2cbc447d media: uvcvideo: Move guid =
to entity

:::::: TO: Ricardo Ribalda <ribalda@chromium.org>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3075528381758450487==--

