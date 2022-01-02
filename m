Content-Type: multipart/mixed; boundary="===============8106543406251813189=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3] tty: rpmsg: Fix race condition releasing tty port
Date: Sun, 02 Jan 2022 23:30:28 +0800
Message-ID: <202201022353.FgGnJg5A-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8106543406251813189==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211215153121.30010-1-arnaud.pouliquen@foss.st.com>
References: <20211215153121.30010-1-arnaud.pouliquen@foss.st.com>
TO: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Jiri Slaby <jirislaby@kernel.org>
CC: Bjorn Andersson <bjorn.andersson@linaro.org>
CC: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: linux-remoteproc(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org
CC: linux-stm32(a)st-md-mailman.stormreply.com
CC: arnaud.pouliquen(a)foss.st.com

Hi Arnaud,

I love your patch! Perhaps something to improve:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on linux/master linus/master v5.16-rc7 next-202112=
24]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Arnaud-Pouliquen/tty-rpmsg=
-Fix-race-condition-releasing-tty-port/20211215-235006
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-=
testing
:::::: branch date: 3 weeks ago
:::::: commit date: 3 weeks ago
config: riscv-randconfig-c006-20211226 (https://download.01.org/0day-ci/arc=
hive/20220102/202201022353.FgGnJg5A-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project a9e8b1=
ee7fd44b53c555a7823ae8fd1a8209c520)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/827a192629877cd67f12b906f=
b467d46f3526db5
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Arnaud-Pouliquen/tty-rpmsg-Fix-rac=
e-condition-releasing-tty-port/20211215-235006
        git checkout 827a192629877cd67f12b906fb467d46f3526db5
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   drivers/misc/fastrpc.c:459:6: note: Assuming field 'nscalars' is not equ=
al to 0
           if (ctx->nscalars) {
               ^~~~~~~~~~~~~
   drivers/misc/fastrpc.c:459:2: note: Taking true branch
           if (ctx->nscalars) {
           ^
   drivers/misc/fastrpc.c:460:15: note: Calling 'kcalloc'
                   ctx->maps =3D kcalloc(ctx->nscalars,
                               ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:661:9: note: Calling 'kmalloc_array'
           return kmalloc_array(n, size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:626:2: note: Taking false branch
           if (unlikely(check_mul_overflow(n, size, &bytes)))
           ^
   include/linux/slab.h:628:30: note: Left side of '&&' is false
           if (__builtin_constant_p(n) && __builtin_constant_p(size))
                                       ^
   include/linux/slab.h:630:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(bytes, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:661:9: note: Returning from 'kmalloc_array'
           return kmalloc_array(n, size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:661:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc_array(n, size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/fastrpc.c:460:15: note: Returning from 'kcalloc'
                   ctx->maps =3D kcalloc(ctx->nscalars,
                               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/fastrpc.c:462:7: note: Assuming field 'maps' is non-null
                   if (!ctx->maps) {
                       ^~~~~~~~~~
   drivers/misc/fastrpc.c:462:3: note: Taking false branch
                   if (!ctx->maps) {
                   ^
   drivers/misc/fastrpc.c:466:16: note: Calling 'kcalloc'
                   ctx->olaps =3D kcalloc(ctx->nscalars,
                                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:661:9: note: Calling 'kmalloc_array'
           return kmalloc_array(n, size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:626:2: note: Taking false branch
           if (unlikely(check_mul_overflow(n, size, &bytes)))
           ^
   include/linux/slab.h:628:30: note: Left side of '&&' is false
           if (__builtin_constant_p(n) && __builtin_constant_p(size))
                                       ^
   include/linux/slab.h:630:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(bytes, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:661:9: note: Returning from 'kmalloc_array'
           return kmalloc_array(n, size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:661:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc_array(n, size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/fastrpc.c:466:16: note: Returning from 'kcalloc'
                   ctx->olaps =3D kcalloc(ctx->nscalars,
                                ^~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/fastrpc.c:468:7: note: Assuming field 'olaps' is non-null
                   if (!ctx->olaps) {
                       ^~~~~~~~~~~
   drivers/misc/fastrpc.c:468:3: note: Taking false branch
                   if (!ctx->olaps) {
                   ^
   drivers/misc/fastrpc.c:473:3: note: Null pointer value stored to field '=
args'
                   ctx->args =3D args;
                   ^~~~~~~~~~~~~~~~
   drivers/misc/fastrpc.c:474:3: note: Calling 'fastrpc_get_buff_overlaps'
                   fastrpc_get_buff_overlaps(ctx);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/fastrpc.c:409:14: note: Assuming 'i' is < field 'nbufs'
           for (i =3D 0; i < ctx->nbufs; ++i) {
                       ^~~~~~~~~~~~~~
   drivers/misc/fastrpc.c:409:2: note: Loop condition is true.  Entering lo=
op body
           for (i =3D 0; i < ctx->nbufs; ++i) {
           ^
   drivers/misc/fastrpc.c:410:25: note: Dereference of null pointer
                   ctx->olaps[i].start =3D ctx->args[i].ptr;
                                         ^~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> drivers/tty/rpmsg_tty.c:53:19: warning: Value stored to 'port' during it=
s initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct tty_port *port =3D tty->port;
                            ^~~~   ~~~~~~~~~
   drivers/tty/rpmsg_tty.c:53:19: note: Value stored to 'port' during its i=
nitialization is never read
           struct tty_port *port =3D tty->port;
                            ^~~~   ~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/firewire/core-cdev.c:611:2: warning: 7th function call argument =
is an uninitialized value [clang-analyzer-core.CallAndMessage]
           fw_send_request(client->device->card, &e->r.transaction,
           ^
   drivers/firewire/core-cdev.c:1481:6: note: Assuming field 'speed' is <=
=3D field 'link_speed'
           if (a->speed > client->device->card->link_speed ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firewire/core-cdev.c:1481:6: note: Left side of '||' is false
   drivers/firewire/core-cdev.c:1482:6: note: Assuming the condition is fal=
se
               a->length > 1024 << a->speed)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firewire/core-cdev.c:1481:2: note: Taking false branch
           if (a->speed > client->device->card->link_speed ||
           ^
   drivers/firewire/core-cdev.c:1485:6: note: Assuming field 'tag' is <=3D 3
           if (a->tag > 3 || a->channel > 63 || a->sy > 15)
               ^~~~~~~~~~
   drivers/firewire/core-cdev.c:1485:6: note: Left side of '||' is false
   drivers/firewire/core-cdev.c:1485:20: note: Assuming field 'channel' is =
<=3D 63
           if (a->tag > 3 || a->channel > 63 || a->sy > 15)
                             ^~~~~~~~~~~~~~~
   drivers/firewire/core-cdev.c:1485:6: note: Left side of '||' is false
           if (a->tag > 3 || a->channel > 63 || a->sy > 15)
               ^
   drivers/firewire/core-cdev.c:1485:39: note: Assuming field 'sy' is <=3D =
15
           if (a->tag > 3 || a->channel > 63 || a->sy > 15)
                                                ^~~~~~~~~~
   drivers/firewire/core-cdev.c:1485:2: note: Taking false branch
           if (a->tag > 3 || a->channel > 63 || a->sy > 15)
           ^
   drivers/firewire/core-cdev.c:1495:9: note: Calling 'init_request'
           return init_request(client, &request, dest, a->speed);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firewire/core-cdev.c:583:15: note: Field 'tcode' is equal to TCO=
DE_STREAM_DATA
           if (request->tcode !=3D TCODE_STREAM_DATA &&
                        ^
   drivers/firewire/core-cdev.c:583:42: note: Left side of '&&' is false
           if (request->tcode !=3D TCODE_STREAM_DATA &&
                                                   ^
   drivers/firewire/core-cdev.c:587:15: note: Field 'tcode' is not equal to=
 TCODE_WRITE_QUADLET_REQUEST
           if (request->tcode =3D=3D TCODE_WRITE_QUADLET_REQUEST &&
                        ^
   drivers/firewire/core-cdev.c:587:52: note: Left side of '&&' is false
           if (request->tcode =3D=3D TCODE_WRITE_QUADLET_REQUEST &&
                                                             ^
   drivers/firewire/core-cdev.c:592:6: note: Assuming 'e' is not equal to N=
ULL
           if (e =3D=3D NULL)
               ^~~~~~~~~
   drivers/firewire/core-cdev.c:592:2: note: Taking false branch
           if (e =3D=3D NULL)
           ^

vim +/port +53 drivers/tty/rpmsg_tty.c

7c0408d8057971 Arnaud Pouliquen 2021-10-15  49  =

7c0408d8057971 Arnaud Pouliquen 2021-10-15  50  static int rpmsg_tty_instal=
l(struct tty_driver *driver, struct tty_struct *tty)
7c0408d8057971 Arnaud Pouliquen 2021-10-15  51  {
7c0408d8057971 Arnaud Pouliquen 2021-10-15  52  	struct rpmsg_tty_port *cpo=
rt =3D idr_find(&tty_idr, tty->index);
827a192629877c Arnaud Pouliquen 2021-12-15 @53  	struct tty_port *port =3D =
tty->port;
7c0408d8057971 Arnaud Pouliquen 2021-10-15  54  =

7c0408d8057971 Arnaud Pouliquen 2021-10-15  55  	tty->driver_data =3D cport;
7c0408d8057971 Arnaud Pouliquen 2021-10-15  56  =

827a192629877c Arnaud Pouliquen 2021-12-15  57  	port =3D tty_port_get(&cpo=
rt->port);
827a192629877c Arnaud Pouliquen 2021-12-15  58  	return tty_port_install(po=
rt, driver, tty);
827a192629877c Arnaud Pouliquen 2021-12-15  59  }
827a192629877c Arnaud Pouliquen 2021-12-15  60  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8106543406251813189==--

