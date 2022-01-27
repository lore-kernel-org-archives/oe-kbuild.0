Content-Type: multipart/mixed; boundary="===============2767646363046141541=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jirislaby:devel 31/34] drivers/tty/mxser.c:766:21: warning: Value stored to 'info' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 28 Jan 2022 02:37:46 +0800
Message-ID: <202201280214.fMsRnqXU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2767646363046141541==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jiri Slaby <jslaby@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git=
 devel
head:   7532b9db97a43f18170870ff0363a6839d575ed1
commit: 7960954c3082123b48b212c32cab0c85bd551411 [31/34] mxser: switch to u=
art_driver
:::::: branch date: 31 hours ago
:::::: commit date: 33 hours ago
config: x86_64-randconfig-c007-20220124 (https://download.01.org/0day-ci/ar=
chive/20220128/202201280214.fMsRnqXU-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f400a6=
012c668dfaa73462caf067ceb074e66c47)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.g=
it/commit/?id=3D7960954c3082123b48b212c32cab0c85bd551411
        git remote add jirislaby https://git.kernel.org/pub/scm/linux/kerne=
l/git/jirislaby/linux.git
        git fetch --no-tags jirislaby devel
        git checkout 7960954c3082123b48b212c32cab0c85bd551411
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/base/swnode.c:577:26: note: '?' condition is true
           struct swnode *swnode =3D to_swnode(fwnode);
                                   ^
   drivers/base/swnode.c:49:3: note: expanded from macro 'to_swnode'
                   is_software_node(__to_swnode_fwnode) ?                  \
                   ^
   drivers/base/swnode.c:581:7: note: 'swnode' is non-null
           if (!swnode)
                ^~~~~~
   drivers/base/swnode.c:581:2: note: Taking false branch
           if (!swnode)
           ^
   drivers/base/swnode.c:584:6: note: Assuming 'endpoint' is null
           if (endpoint) {
               ^~~~~~~~
   drivers/base/swnode.c:584:2: note: Taking false branch
           if (endpoint) {
           ^
   drivers/base/swnode.c:589:7: note: Assuming 'parent' is null
                   if (!parent)
                       ^~~~~~~
   drivers/base/swnode.c:589:3: note: Taking true branch
                   if (!parent)
                   ^
   drivers/base/swnode.c:592:10: note: Calling 'swnode_graph_find_next_port'
                   port =3D swnode_graph_find_next_port(parent, NULL);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/swnode.c:559:2: note: Loop condition is true.  Entering loo=
p body
           while ((port =3D software_node_get_next_child(parent, old))) {
           ^
   drivers/base/swnode.c:564:16: note: '?' condition is false
                   if (!strncmp(to_swnode(port)->node->name, "port@",
                                ^
   drivers/base/swnode.c:49:3: note: expanded from macro 'to_swnode'
                   is_software_node(__to_swnode_fwnode) ?                  \
                   ^
   drivers/base/swnode.c:564:16: note: Access to field 'node' results in a =
dereference of a null pointer
                   if (!strncmp(to_swnode(port)->node->name, "port@",
                                ^
   drivers/base/swnode.c:46:2: note: expanded from macro 'to_swnode'
           ({                                                              \
           ^
   drivers/base/swnode.c:1110:29: warning: Access to field 'managed' result=
s in a dereference of a null pointer [clang-analyzer-core.NullDereference]
           to_swnode(fwnode)->managed =3D true;
                                      ^
   drivers/base/swnode.c:1103:6: note: Assuming 'parent' is null
           if (parent && !p)
               ^~~~~~
   drivers/base/swnode.c:1103:13: note: Left side of '&&' is false
           if (parent && !p)
                      ^
   drivers/base/swnode.c:1107:6: note: Calling 'IS_ERR'
           if (IS_ERR(fwnode))
               ^~~~~~~~~~~~~~
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/swnode.c:1107:6: note: Returning from 'IS_ERR'
           if (IS_ERR(fwnode))
               ^~~~~~~~~~~~~~
   drivers/base/swnode.c:1107:2: note: Taking false branch
           if (IS_ERR(fwnode))
           ^
   drivers/base/swnode.c:1110:2: note: '?' condition is false
           to_swnode(fwnode)->managed =3D true;
           ^
   drivers/base/swnode.c:49:3: note: expanded from macro 'to_swnode'
                   is_software_node(__to_swnode_fwnode) ?                  \
                   ^
   drivers/base/swnode.c:1110:29: note: Access to field 'managed' results i=
n a dereference of a null pointer
           to_swnode(fwnode)->managed =3D true;
                                      ^
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
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
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
   5 warnings generated.
   drivers/tty/mxser.c:396:7: warning: Although the value stored to 'hwid' =
is used in the enclosing expression, the value is never actually read from =
'hwid' [clang-analyzer-deadcode.DeadStores]
           if ((hwid =3D inb(io + UART_MCR)) !=3D 0) {
                ^
   drivers/tty/mxser.c:396:7: note: Although the value stored to 'hwid' is =
used in the enclosing expression, the value is never actually read from 'hw=
id'
>> drivers/tty/mxser.c:766:21: warning: Value stored to 'info' during its i=
nitialization is never read [clang-analyzer-deadcode.DeadStores]
           struct mxser_port *info =3D to_mport(uport);
                              ^~~~   ~~~~~~~~~~~~~~~
   drivers/tty/mxser.c:766:21: note: Value stored to 'info' during its init=
ialization is never read
           struct mxser_port *info =3D to_mport(uport);
                              ^~~~   ~~~~~~~~~~~~~~~
   drivers/tty/mxser.c:854:21: warning: Value stored to 'info' during its i=
nitialization is never read [clang-analyzer-deadcode.DeadStores]
           struct mxser_port *info =3D to_mport(uport);
                              ^~~~   ~~~~~~~~~~~~~~~
   drivers/tty/mxser.c:854:21: note: Value stored to 'info' during its init=
ialization is never read
           struct mxser_port *info =3D to_mport(uport);
                              ^~~~   ~~~~~~~~~~~~~~~
>> drivers/tty/mxser.c:1693:4: warning: Value stored to 'int_cnt' is never =
read [clang-analyzer-deadcode.DeadStores]
                           int_cnt =3D 0;
                           ^         ~
   drivers/tty/mxser.c:1693:4: note: Value stored to 'int_cnt' is never read
                           int_cnt =3D 0;
                           ^         ~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   fs/btrfs/extent-tree.c:1124:13: warning: Dereference of null pointer (lo=
aded from variable 'last_ref') [clang-analyzer-core.NullDereference]
                   *last_ref =3D 1;
                             ^
   fs/btrfs/extent-tree.c:1469:6: note: Assuming 'path' is non-null
           if (!path)
               ^~~~~
   fs/btrfs/extent-tree.c:1469:2: note: Taking false branch
           if (!path)
           ^
   fs/btrfs/extent-tree.c:1473:8: note: Calling 'insert_inline_extent_backr=
ef'
           ret =3D insert_inline_extent_backref(trans, path, bytenr, num_by=
tes,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   fs/btrfs/extent-tree.c:1152:6: note: Assuming 'ret' is equal to 0
           if (ret =3D=3D 0) {
               ^~~~~~~~
   fs/btrfs/extent-tree.c:1152:2: note: Taking true branch
           if (ret =3D=3D 0) {
           ^
   fs/btrfs/extent-tree.c:1157:7: note: Assuming 'owner' is >=3D BTRFS_FIRS=
T_FREE_OBJECTID
                   if (owner < BTRFS_FIRST_FREE_OBJECTID) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/extent-tree.c:1157:3: note: Taking false branch
                   if (owner < BTRFS_FIRST_FREE_OBJECTID) {
                   ^
   fs/btrfs/extent-tree.c:1170:22: note: Passing null pointer value via 5th=
 parameter 'last_ref'
                                                extent_op, NULL);
                                                           ^
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^~~~~~~~~~~
   fs/btrfs/extent-tree.c:1169:3: note: Calling 'update_inline_extent_backr=
ef'
                   update_inline_extent_backref(path, iref, refs_to_add,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/extent-tree.c:1091:10: note: Assuming 'refs_to_mod' is < 0
           WARN_ON(refs_to_mod < 0 && refs + refs_to_mod <=3D 0);
                   ^
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   fs/btrfs/extent-tree.c:1091:10: note: Left side of '&&' is true
           WARN_ON(refs_to_mod < 0 && refs + refs_to_mod <=3D 0);
                   ^
   fs/btrfs/extent-tree.c:1091:29: note: Assuming the condition is false
           WARN_ON(refs_to_mod < 0 && refs + refs_to_mod <=3D 0);
                                      ^
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   fs/btrfs/extent-tree.c:1091:2: note: Taking false branch
           WARN_ON(refs_to_mod < 0 && refs + refs_to_mod <=3D 0);
           ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   fs/btrfs/extent-tree.c:1094:6: note: Assuming 'extent_op' is null
           if (extent_op)
               ^~~~~~~~~
   fs/btrfs/extent-tree.c:1094:2: note: Taking false branch
           if (extent_op)
           ^
   fs/btrfs/extent-tree.c:1102:9: note: Assuming 'type' is equal to BTRFS_R=
EF_TYPE_INVALID
           ASSERT(type !=3D BTRFS_REF_TYPE_INVALID);
                  ^
   fs/btrfs/ctree.h:3496:29: note: expanded from macro 'ASSERT'
   #define ASSERT(expr)    (void)(expr)
                                  ^~~~
   fs/btrfs/extent-tree.c:1104:6: note: 'type' is not equal to BTRFS_EXTENT=
_DATA_REF_KEY
           if (type =3D=3D BTRFS_EXTENT_DATA_REF_KEY) {
               ^~~~
   fs/btrfs/extent-tree.c:1104:2: note: Taking false branch
           if (type =3D=3D BTRFS_EXTENT_DATA_REF_KEY) {
           ^
   fs/btrfs/extent-tree.c:1107:13: note: 'type' is not equal to BTRFS_SHARE=
D_DATA_REF_KEY
           } else if (type =3D=3D BTRFS_SHARED_DATA_REF_KEY) {
                      ^~~~
   fs/btrfs/extent-tree.c:1107:9: note: Taking false branch
           } else if (type =3D=3D BTRFS_SHARED_DATA_REF_KEY) {
                  ^
   fs/btrfs/extent-tree.c:1112:10: note: Assuming the condition is false
                   BUG_ON(refs_to_mod !=3D -1);
                          ^
   include/asm-generic/bug.h:65:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/btrfs/extent-tree.c:1112:3: note: Taking false branch
                   BUG_ON(refs_to_mod !=3D -1);
                   ^
   include/asm-generic/bug.h:65:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)

vim +/info +766 drivers/tty/mxser.c

ee7e5e66f2d4fa drivers/tty/mxser.c  Jiri Slaby     2021-09-22  763  =

7960954c308212 drivers/tty/mxser.c  Jiri Slaby     2021-12-01  764  static =
int mxser_startup(struct uart_port *uport)
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds 2005-04-16  765  {
7960954c308212 drivers/tty/mxser.c  Jiri Slaby     2021-12-01 @766  	struct=
 mxser_port *info =3D to_mport(uport);
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds 2005-04-16  767  	unsign=
ed long flags;
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds 2005-04-16  768  =

7960954c308212 drivers/tty/mxser.c  Jiri Slaby     2021-12-01  769  	BUG_ON=
("we use kfifo");
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds 2005-04-16  770  =

135900fa3f9910 drivers/tty/mxser.c  Jiri Slaby     2021-12-10  771  	spin_l=
ock_irqsave(&uport->lock, flags);
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds 2005-04-16  772  =

67fa137c2b9fbd drivers/tty/mxser.c  Jiri Slaby     2021-12-10  773  	if (!u=
port->type) {
135900fa3f9910 drivers/tty/mxser.c  Jiri Slaby     2021-12-10  774  		spin_=
unlock_irqrestore(&uport->lock, flags);
7960954c308212 drivers/tty/mxser.c  Jiri Slaby     2021-12-01  775  		retur=
n -EINVAL;
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds 2005-04-16  776  	}
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby     2008-02-07  777  =

^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds 2005-04-16  778  	/*
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby     2008-02-07  779  	 * Cle=
ar the FIFO buffers and disable them
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby     2008-02-07  780  	 * (th=
ey will be reenabled in mxser_change_speed())
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds 2005-04-16  781  	 */
ee7e5e66f2d4fa drivers/tty/mxser.c  Jiri Slaby     2021-09-22  782  	mxser_=
disable_and_clear_FIFO(info);
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby     2008-02-07  783  =

^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds 2005-04-16  784  	/*
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby     2008-02-07  785  	 * At =
this point there's no way the LSR could still be 0xFF;
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby     2008-02-07  786  	 * if =
it is, then bail out, because there's likely no UART
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby     2008-02-07  787  	 * her=
e.
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds 2005-04-16  788  	 */
ec197f1fd0d68f drivers/tty/mxser.c  Jiri Slaby     2021-12-10  789  	if (in=
b(uport->iobase + UART_LSR) =3D=3D 0xff) {
135900fa3f9910 drivers/tty/mxser.c  Jiri Slaby     2021-12-10  790  		spin_=
unlock_irqrestore(&uport->lock, flags);
7960954c308212 drivers/tty/mxser.c  Jiri Slaby     2021-12-01  791  		retur=
n -ENODEV;
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby     2008-02-07  792  	}
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby     2008-02-07  793  =

^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds 2005-04-16  794  	/*
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby     2008-02-07  795  	 * Cle=
ar the interrupt registers.
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds 2005-04-16  796  	 */
ec197f1fd0d68f drivers/tty/mxser.c  Jiri Slaby     2021-12-10  797  	(void)=
 inb(uport->iobase + UART_LSR);
ec197f1fd0d68f drivers/tty/mxser.c  Jiri Slaby     2021-12-10  798  	(void)=
 inb(uport->iobase + UART_RX);
ec197f1fd0d68f drivers/tty/mxser.c  Jiri Slaby     2021-12-10  799  	(void)=
 inb(uport->iobase + UART_IIR);
ec197f1fd0d68f drivers/tty/mxser.c  Jiri Slaby     2021-12-10  800  	(void)=
 inb(uport->iobase + UART_MSR);
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby     2008-02-07  801  =

^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds 2005-04-16  802  	/*
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby     2008-02-07  803  	 * Now=
, initialize the UART
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds 2005-04-16  804  	 */
ec197f1fd0d68f drivers/tty/mxser.c  Jiri Slaby     2021-12-10  805  	outb(U=
ART_LCR_WLEN8, uport->iobase + UART_LCR);	/* reset DLAB */
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby     2008-02-07  806  	info->=
MCR =3D UART_MCR_DTR | UART_MCR_RTS;
ec197f1fd0d68f drivers/tty/mxser.c  Jiri Slaby     2021-12-10  807  	outb(i=
nfo->MCR, uport->iobase + UART_MCR);
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds 2005-04-16  808  =

1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby     2008-02-07  809  	/*
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby     2008-02-07  810  	 * Fin=
ally, enable interrupts
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby     2008-02-07  811  	 */
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby     2008-02-07  812  	info->=
IER =3D UART_IER_MSI | UART_IER_RLSI | UART_IER_RDI;
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds 2005-04-16  813  =

292955a7c011e2 drivers/tty/mxser.c  Jiri Slaby     2021-06-18  814  	if (in=
fo->board->must_hwid)
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby     2008-02-07  815  		info-=
>IER |=3D MOXA_MUST_IER_EGDAI;
ec197f1fd0d68f drivers/tty/mxser.c  Jiri Slaby     2021-12-10  816  	outb(i=
nfo->IER, uport->iobase + UART_IER);	/* enable interrupts */
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds 2005-04-16  817  =

1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby     2008-02-07  818  	/*
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby     2008-02-07  819  	 * And=
 clear the interrupt registers again for luck.
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby     2008-02-07  820  	 */
ec197f1fd0d68f drivers/tty/mxser.c  Jiri Slaby     2021-12-10  821  	(void)=
 inb(uport->iobase + UART_LSR);
ec197f1fd0d68f drivers/tty/mxser.c  Jiri Slaby     2021-12-10  822  	(void)=
 inb(uport->iobase + UART_RX);
ec197f1fd0d68f drivers/tty/mxser.c  Jiri Slaby     2021-12-10  823  	(void)=
 inb(uport->iobase + UART_IIR);
ec197f1fd0d68f drivers/tty/mxser.c  Jiri Slaby     2021-12-10  824  	(void)=
 inb(uport->iobase + UART_MSR);
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds 2005-04-16  825  =

7960954c308212 drivers/tty/mxser.c  Jiri Slaby     2021-12-01  826  	//kfif=
o_reset(&port->xmit_fifo);
7960954c308212 drivers/tty/mxser.c  Jiri Slaby     2021-12-01  827  	BUG_ON=
("kfifo_reset");
135900fa3f9910 drivers/tty/mxser.c  Jiri Slaby     2021-12-10  828  	spin_u=
nlock_irqrestore(&uport->lock, flags);
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds 2005-04-16  829  =

1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby     2008-02-07  830  	return=
 0;
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds 2005-04-16  831  }
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds 2005-04-16  832  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2767646363046141541==--

