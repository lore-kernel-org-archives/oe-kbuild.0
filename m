Content-Type: multipart/mixed; boundary="===============3257827666267021397=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [pinchartl-media:rpi/next/bcm2835-isp 26/49] drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c:235:2: warning: Argument to kfree() is a constant address (4294967284), which is not memory allocated by malloc() [clang-analyzer-unix.Malloc]
Date: Sat, 15 Jan 2022 12:07:47 +0800
Message-ID: <202201151241.vPL4RTDE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3257827666267021397==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Dave Stevenson <dave.stevenson@raspberrypi.org>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

tree:   git://linuxtv.org/pinchartl/media.git rpi/next/bcm2835-isp
head:   97975aa0732da0e2084ed69d140656c2162bec05
commit: 6a70e9d3e4e0158075e8f1c1035e90e138b65cc9 [26/49] staging: mmal-vchi=
q: Add support for event callbacks.
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-c002-20220112 (https://download.01.org/0day-ci/archi=
ve/20220115/202201151241.vPL4RTDE-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 244dd2=
913a43a200f5a6544d424cdc37b771028b)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        git remote add pinchartl-media git://linuxtv.org/pinchartl/media.git
        git fetch --no-tags pinchartl-media rpi/next/bcm2835-isp
        git checkout 6a70e9d3e4e0158075e8f1c1035e90e138b65cc9
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/iio/buffer/kfifo_buf.c:28:7: note: Assuming 'length' is not equa=
l to 0
           if ((length =3D=3D 0) || (bytes_per_datum =3D=3D 0))
                ^~~~~~~~~~~
   drivers/iio/buffer/kfifo_buf.c:28:6: note: Left side of '||' is false
           if ((length =3D=3D 0) || (bytes_per_datum =3D=3D 0))
               ^
   drivers/iio/buffer/kfifo_buf.c:28:24: note: Assuming 'bytes_per_datum' i=
s not equal to 0
           if ((length =3D=3D 0) || (bytes_per_datum =3D=3D 0))
                                 ^~~~~~~~~~~~~~~~~~~~
   drivers/iio/buffer/kfifo_buf.c:28:2: note: Taking false branch
           if ((length =3D=3D 0) || (bytes_per_datum =3D=3D 0))
           ^
   drivers/iio/buffer/kfifo_buf.c:35:6: note: '?' condition is false
           if (roundup_pow_of_two(length) > UINT_MAX / bytes_per_datum)
               ^
   include/linux/log2.h:176:2: note: expanded from macro 'roundup_pow_of_tw=
o'
           __builtin_constant_p(n) ? (             \
           ^
   drivers/iio/buffer/kfifo_buf.c:35:6: note: Calling '__roundup_pow_of_two'
           if (roundup_pow_of_two(length) > UINT_MAX / bytes_per_datum)
               ^
   include/linux/log2.h:180:2: note: expanded from macro 'roundup_pow_of_tw=
o'
           __roundup_pow_of_two(n)                 \
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/log2.h:57:16: note: Calling 'fls_long'
           return 1UL << fls_long(n - 1);
                         ^~~~~~~~~~~~~~~
   include/linux/bitops.h:188:2: note: Taking true branch
           if (sizeof(l) =3D=3D 4)
           ^
   include/linux/bitops.h:189:10: note: Calling 'fls'
                   return fls(l);
                          ^~~~~~
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
   include/linux/bitops.h:189:10: note: Returning from 'fls'
                   return fls(l);
                          ^~~~~~
   include/linux/bitops.h:189:3: note: Returning the value 32
                   return fls(l);
                   ^~~~~~~~~~~~~
   include/linux/log2.h:57:16: note: Returning from 'fls_long'
           return 1UL << fls_long(n - 1);
                         ^~~~~~~~~~~~~~~
   include/linux/log2.h:57:13: note: The result of the left shift is undefi=
ned due to shifting by '32', which is greater or equal to the width of type=
 'unsigned long'
           return 1UL << fls_long(n - 1);
                      ^  ~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/staging/vc04_services/bcm2835-camera/controls.c:888:3: warning: =
Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D -EINVAL;
                   ^     ~~~~~~~
   drivers/staging/vc04_services/bcm2835-camera/controls.c:888:3: note: Val=
ue stored to 'ret' is never read
                   ret =3D -EINVAL;
                   ^     ~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
>> drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c:235:2: warning: Ar=
gument to kfree() is a constant address (4294967284), which is not memory a=
llocated by malloc() [clang-analyzer-unix.Malloc]
           kfree(msg_context);
           ^
   drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c:1778:6: note: Assu=
ming the condition is false
           if (mutex_lock_interruptible(&instance->vchiq_mutex))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c:1778:2: note: Taki=
ng false branch
           if (mutex_lock_interruptible(&instance->vchiq_mutex))
           ^
   drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c:1781:2: note: Loop=
 condition is true.  Entering loop body
           for (idx =3D 0; idx < VCHIQ_MMAL_MAX_COMPONENTS; idx++) {
           ^
   drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c:1782:7: note: Assu=
ming field 'in_use' is 0
                   if (!instance->component[idx].in_use) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c:1782:3: note: Taki=
ng true branch
                   if (!instance->component[idx].in_use) {
                   ^
   drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c:1785:4: note:  Exe=
cution continues on line 1789
                           break;
                           ^
   drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c:1789:7: note: 'com=
ponent' is non-null
           if (!component) {
                ^~~~~~~~~
   drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c:1789:2: note: Taki=
ng false branch
           if (!component) {
           ^
   drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c:1801:6: note: Assu=
ming 'ret' is >=3D 0
           if (ret < 0) {
               ^~~~~~~
   drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c:1801:2: note: Taki=
ng false branch
           if (ret < 0) {
           ^
   drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c:1811:2: note: Loop=
 condition is false.  Exiting loop
           spin_lock_init(&component->control.slock);
           ^
   include/linux/spinlock.h:339:34: note: expanded from macro 'spin_lock_in=
it'
   # define spin_lock_init(_lock)                  \
                                                   ^
   drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c:1814:6: note: 'ret=
' is >=3D 0
           if (ret < 0)
               ^~~
   drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c:1814:2: note: Taki=
ng false branch
           if (ret < 0)
           ^
   drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c:1816:2: note: Call=
ing 'init_event_context'
           init_event_context(instance, &component->control);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c:1735:2: note: Loop=
 condition is false.  Exiting loop
           mutex_init(&port->event_context_mutex);
           ^
   include/linux/mutex.h:101:32: note: expanded from macro 'mutex_init'
   #define mutex_init(mutex)                                               \
                                                                           ^
   drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c:1742:6: note: Assu=
ming field 'buffer' is null
           if (!ctx->u.bulk.buffer)
               ^~~~~~~~~~~~~~~~~~~
   drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c:1742:2: note: Taki=
ng true branch
           if (!ctx->u.bulk.buffer)
           ^
   drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c:1743:3: note: Cont=
rol jumps to line 1755
                   goto release_msg_context;
                   ^
   drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c:1755:2: note: Call=
ing 'release_msg_context'
           release_msg_context(ctx);
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c:235:2: note: Argum=
ent to kfree() is a constant address (4294967284), which is not memory allo=
cated by malloc()
           kfree(msg_context);
           ^     ~~~~~~~~~~~
   drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c:512:16: warning: A=
ccess to field 'event_context' results in a dereference of a null pointer (=
loaded from variable 'port') [clang-analyzer-core.NullDereference]
           msg_context =3D port->event_context;
                         ^
   drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c:656:6: note: Assum=
ing 'instance' is non-null
           if (!instance) {
               ^~~~~~~~~
   drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c:656:2: note: Takin=
g false branch
           if (!instance) {
           ^
   drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c:661:2: note: Contr=
ol jumps to 'case VCHIQ_MESSAGE_AVAILABLE:'  at line 662
           switch (reason) {
           ^
   drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c:669:3: note: Contr=
ol jumps to 'case MMAL_MSG_TYPE_EVENT_TO_HOST:'  at line 674
                   switch (msg->h.type) {
                   ^
   drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c:675:4: note: Calli=
ng 'event_to_host_cb'
                           event_to_host_cb(instance, msg, msg_len);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c:458:2: note: 'port=
' initialized to a null pointer value
           struct vchiq_mmal_port *port =3D NULL;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c:462:6: note: Assum=
ing the condition is false
           if (msg->u.buffer_from_host.drvbuf.magic =3D=3D MMAL_MAGIC) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c:462:2: note: Takin=
g false branch
           if (msg->u.buffer_from_host.drvbuf.magic =3D=3D MMAL_MAGIC) {
           ^
   drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c:468:2: note: Contr=
ol jumps to the 'default' case at line 504
           switch (msg->u.event_to_host.port_type) {
           ^
   drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c:505:3: note:  Exec=
ution continues on line 508
                   break;

vim +235 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c

4e6bafdfb9f394 drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c Mi=
chael Zoran  2017-03-08  226  =

4e6bafdfb9f394 drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c Mi=
chael Zoran  2017-03-08  227  static void
4e6bafdfb9f394 drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c Mi=
chael Zoran  2017-03-08  228  release_msg_context(struct mmal_msg_context *=
msg_context)
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Er=
ic Anholt    2017-01-27  229  {
950fd867c6354c drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c Er=
ic Anholt    2018-05-11  230  	struct vchiq_mmal_instance *instance =3D msg=
_context->instance;
950fd867c6354c drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c Er=
ic Anholt    2018-05-11  231  =

8dedab2903f152 drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c Da=
ve Stevenson 2019-06-29  232  	mutex_lock(&instance->context_map_lock);
950fd867c6354c drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c Er=
ic Anholt    2018-05-11  233  	idr_remove(&instance->context_map, msg_conte=
xt->handle);
8dedab2903f152 drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c Da=
ve Stevenson 2019-06-29  234  	mutex_unlock(&instance->context_map_lock);
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Er=
ic Anholt    2017-01-27 @235  	kfree(msg_context);
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Er=
ic Anholt    2017-01-27  236  }
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Er=
ic Anholt    2017-01-27  237  =


:::::: The code at line 235 was first introduced by commit
:::::: 7b3ad5abf027b7643b38c4006d7f4ce47a86dd3a staging: Import the BCM2835=
 MMAL-based V4L2 camera driver.

:::::: TO: Eric Anholt <eric@anholt.net>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3257827666267021397==--

