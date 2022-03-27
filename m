Content-Type: multipart/mixed; boundary="===============4870755910474210861=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/usb/serial/io_ti.c:298:6: warning: Value stored to 'port_number' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 27 Mar 2022 15:16:49 +0800
Message-ID: <202203271536.AMXvdswe-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4870755910474210861==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Johan Hovold <johan@kernel.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f022814633e1c600507b3a99691b4d624c2813f0
commit: 7a14fac0c94472ad2d11ac14cefbeab5bf98e303 USB: serial: io_ti: add se=
nd-port-command helper
date:   12 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 12 months ago
config: arm-randconfig-c002-20220324 (https://download.01.org/0day-ci/archi=
ve/20220327/202203271536.AMXvdswe-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 902f47=
08fe1d03b0de7e5315ef875006a6adc319)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D7a14fac0c94472ad2d11ac14cefbeab5bf98e303
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 7a14fac0c94472ad2d11ac14cefbeab5bf98e303
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           if (verbose) {                                                  =
        \
           ^
   kernel/locking/locktorture.c:925:4: note: Loop condition is false.  Exit=
ing loop
                           VERBOSE_TOROUT_STRING("cxt.lwsa: Out of memory");
                           ^
   include/linux/torture.h:34:34: note: expanded from macro 'VERBOSE_TOROUT=
_STRING'
   #define VERBOSE_TOROUT_STRING(s) \
                                    ^
   kernel/locking/locktorture.c:927:4: note: Control jumps to line 1058
                           goto unwind;
                           ^
   kernel/locking/locktorture.c:1059:2: note: Calling 'lock_torture_cleanup'
           lock_torture_cleanup();
           ^~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/locktorture.c:794:6: note: Assuming the condition is false
           if (torture_cleanup_begin())
               ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/locktorture.c:794:2: note: Taking false branch
           if (torture_cleanup_begin())
           ^
   kernel/locking/locktorture.c:804:6: note: Assuming field 'lwsa' is non-n=
ull
           if (!cxt.lwsa && !cxt.lrsa)
               ^~~~~~~~~
   kernel/locking/locktorture.c:804:16: note: Left side of '&&' is false
           if (!cxt.lwsa && !cxt.lrsa)
                         ^
   kernel/locking/locktorture.c:807:6: note: Assuming 'writer_tasks' is null
           if (writer_tasks) {
               ^~~~~~~~~~~~
   kernel/locking/locktorture.c:807:2: note: Taking false branch
           if (writer_tasks) {
           ^
   kernel/locking/locktorture.c:815:6: note: Assuming 'reader_tasks' is null
           if (reader_tasks) {
               ^~~~~~~~~~~~
   kernel/locking/locktorture.c:815:2: note: Taking false branch
           if (reader_tasks) {
           ^
   kernel/locking/locktorture.c:824:2: note: Calling 'lock_torture_stats_pr=
int'
           lock_torture_stats_print();  /* -After- the stats thread is stop=
ped! */
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/locktorture.c:731:6: note: Assuming field 'readlock' is n=
ull
           if (cxt.cur_ops->readlock)
               ^~~~~~~~~~~~~~~~~~~~~
   kernel/locking/locktorture.c:731:2: note: Taking false branch
           if (cxt.cur_ops->readlock)
           ^
   kernel/locking/locktorture.c:734:8: note: Calling 'kmalloc'
           buf =3D kmalloc(size, GFP_KERNEL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:542:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:559:9: note: Value assigned to 'cxt.lwsa'
           return __kmalloc(size, flags);
                  ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:559:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/locktorture.c:734:8: note: Returning from 'kmalloc'
           buf =3D kmalloc(size, GFP_KERNEL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/locktorture.c:735:6: note: Assuming 'buf' is non-null
           if (!buf) {
               ^~~~
   kernel/locking/locktorture.c:735:2: note: Taking false branch
           if (!buf) {
           ^
   kernel/locking/locktorture.c:741:29: note: Passing value via 2nd paramet=
er 'statp'
           __torture_print_stats(buf, cxt.lwsa, true);
                                      ^~~~~~~~
   kernel/locking/locktorture.c:741:2: note: Calling '__torture_print_stats'
           __torture_print_stats(buf, cxt.lwsa, true);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/locktorture.c:695:22: note: Assuming 'statp' is null
           long max =3D 0, min =3D statp ? statp[0].n_lock_acquired : 0;
                               ^~~~~
   kernel/locking/locktorture.c:695:22: note: '?' condition is false
   kernel/locking/locktorture.c:698:13: note: 'write' is true
           n_stress =3D write ? cxt.nrealwriters_stress : cxt.nrealreaders_=
stress;
                      ^~~~~
   kernel/locking/locktorture.c:698:13: note: '?' condition is true
   kernel/locking/locktorture.c:699:14: note: Assuming 'i' is < 'n_stress'
           for (i =3D 0; i < n_stress; i++) {
                       ^~~~~~~~~~~~
   kernel/locking/locktorture.c:699:2: note: Loop condition is true.  Enter=
ing loop body
           for (i =3D 0; i < n_stress; i++) {
           ^
   kernel/locking/locktorture.c:700:7: note: Dereference of null pointer
                   if (statp[i].n_lock_fail)
                       ^~~~~~~~~~~~~~~~~~~~
   kernel/locking/locktorture.c:708:2: warning: Value stored to 'page' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           page +=3D sprintf(page,
           ^       ~~~~~~~~~~~~~
   kernel/locking/locktorture.c:708:2: note: Value stored to 'page' is neve=
r read
           page +=3D sprintf(page,
           ^       ~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> drivers/usb/serial/io_ti.c:298:6: warning: Value stored to 'port_number'=
 during its initialization is never read [clang-analyzer-deadcode.DeadStore=
s]
           int port_number =3D port->port_number;
               ^~~~~~~~~~~   ~~~~~~~~~~~~~~~~~
   drivers/usb/serial/io_ti.c:298:6: note: Value stored to 'port_number' du=
ring its initialization is never read
           int port_number =3D port->port_number;
               ^~~~~~~~~~~   ~~~~~~~~~~~~~~~~~
   drivers/usb/serial/io_ti.c:749:17: warning: Value stored to 'dev' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &serial->serial->dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/io_ti.c:749:17: note: Value stored to 'dev' during it=
s initialization is never read
           struct device *dev =3D &serial->serial->dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/io_ti.c:772:2: warning: Value stored to 'desc' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           desc =3D (struct edge_ti_manuf_descriptor *)buffer;
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/io_ti.c:772:2: note: Value stored to 'desc' is never =
read
           desc =3D (struct edge_ti_manuf_descriptor *)buffer;
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/io_ti.c:856:17: warning: Value stored to 'dev' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &serial->serial->dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/io_ti.c:856:17: note: Value stored to 'dev' during it=
s initialization is never read
           struct device *dev =3D &serial->serial->dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/io_ti.c:1230:4: warning: Value stored to 'status' is =
never read [clang-analyzer-deadcode.DeadStores]
                           status =3D ti_vsend_sync(serial->serial->dev,
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/io_ti.c:1230:4: note: Value stored to 'status' is nev=
er read
                           status =3D ti_vsend_sync(serial->serial->dev,
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/io_ti.c:1372:17: warning: Value stored to 'dev' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &serial->serial->interface->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/io_ti.c:1372:17: note: Value stored to 'dev' during i=
ts initialization is never read
           struct device *dev =3D &serial->serial->interface->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/io_ti.c:1375:26: warning: Value stored to 'fw_hdr' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct edgeport_fw_hdr *fw_hdr =3D (struct edgeport_fw_hdr *)fw-=
>data;
                                   ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/usb/serial/io_ti.c:1375:26: note: Value stored to 'fw_hdr' durin=
g its initialization is never read
           struct edgeport_fw_hdr *fw_hdr =3D (struct edgeport_fw_hdr *)fw-=
>data;
                                   ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/usb/serial/io_ti.c:1744:2: warning: Value stored to 'port_number=
' is never read [clang-analyzer-deadcode.DeadStores]
           port_number =3D edge_port->port->port_number;
           ^             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/io_ti.c:1744:2: note: Value stored to 'port_number' i=
s never read
           port_number =3D edge_port->port->port_number;
           ^             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/io_ti.c:2210:17: warning: Value stored to 'dev' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &edge_port->port->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/io_ti.c:2210:17: note: Value stored to 'dev' during i=
ts initialization is never read
           struct device *dev =3D &edge_port->port->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/w1/slaves/w1_ds2438.c:60:3: warning: Value stored to 'crc' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   crc =3D 0;
                   ^     ~
   drivers/w1/slaves/w1_ds2438.c:60:3: note: Value stored to 'crc' is never=
 read
                   crc =3D 0;
                   ^     ~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +/port_number +298 drivers/usb/serial/io_ti.c

^1da177e4c3f415 Linus Torvalds     2005-04-16  294  =

^1da177e4c3f415 Linus Torvalds     2005-04-16  295  /* clear tx/rx buffers =
and fifo in TI UMP */
2742fd889932834 Alan Cox           2008-04-29  296  static int purge_port(s=
truct usb_serial_port *port, __u16 mask)
^1da177e4c3f415 Linus Torvalds     2005-04-16  297  {
1143832eca8f1d6 Greg Kroah-Hartman 2013-06-06 @298  	int port_number =3D po=
rt->port_number;
^1da177e4c3f415 Linus Torvalds     2005-04-16  299  =

67e6da702753dac Greg Kroah-Hartman 2012-09-14  300  	dev_dbg(&port->dev, "%=
s - port %d, mask %x\n", __func__, port_number, mask);
^1da177e4c3f415 Linus Torvalds     2005-04-16  301  =

7a14fac0c94472a Johan Hovold       2021-04-12  302  	return send_port_cmd(p=
ort, UMPC_PURGE_PORT, mask, NULL, 0);
^1da177e4c3f415 Linus Torvalds     2005-04-16  303  }
^1da177e4c3f415 Linus Torvalds     2005-04-16  304  =


:::::: The code at line 298 was first introduced by commit
:::::: 1143832eca8f1d64da7d85642c956ae9d25c69e1 USB: serial: ports: add min=
or and port number

:::::: TO: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4870755910474210861==--

