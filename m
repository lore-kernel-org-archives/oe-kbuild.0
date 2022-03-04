Content-Type: multipart/mixed; boundary="===============9184998022187071706=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jirislaby:devel 22/26] drivers/tty/mxser.c:752:21: warning: Value stored to 'info' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 04 Mar 2022 13:10:40 +0800
Message-ID: <202203041328.rcE4XmXQ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9184998022187071706==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Jiri Slaby <jslaby@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git=
 devel
head:   c331bc7b74133b532a9b7a7c4c71d12601597612
commit: c54bfdfe420584f7213f5855a17bf059e53596c8 [22/26] mxser: switch to u=
art_driver
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: riscv-randconfig-c006-20220302 (https://download.01.org/0day-ci/arc=
hive/20220304/202203041328.rcE4XmXQ-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.g=
it/commit/?id=3Dc54bfdfe420584f7213f5855a17bf059e53596c8
        git remote add jirislaby https://git.kernel.org/pub/scm/linux/kerne=
l/git/jirislaby/linux.git
        git fetch --no-tags jirislaby devel
        git checkout c54bfdfe420584f7213f5855a17bf059e53596c8
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/gpu/drm/radeon/atombios_i2c.c:61:3: note: Taking true branch
                   if (buf =3D=3D NULL)
                   ^
   drivers/gpu/drm/radeon/atombios_i2c.c:65:7: note: 'num' is 3
                   if (num)
                       ^~~
   drivers/gpu/drm/radeon/atombios_i2c.c:65:3: note: Taking true branch
                   if (num)
                   ^
   drivers/gpu/drm/radeon/atombios_i2c.c:67:7: note: 'num' is 2
                   if (num)
                       ^~~
   drivers/gpu/drm/radeon/atombios_i2c.c:67:3: note: Taking true branch
                   if (num)
                   ^
   drivers/gpu/drm/radeon/atombios_i2c.c:68:4: note: Null pointer passed as=
 2nd argument to memory copy function
                           memcpy(&out, &buf[1], num);
                           ^            ~~~~~~~
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   22 warnings generated.
   drivers/gpu/drm/radeon/si.c:1814:4: warning: Value stored to 'err' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                           err =3D -EINVAL;
                           ^     ~~~~~~~
   drivers/gpu/drm/radeon/si.c:1814:4: note: Value stored to 'err' is never=
 read
                           err =3D -EINVAL;
                           ^     ~~~~~~~
   drivers/gpu/drm/radeon/si.c:1837:4: warning: Value stored to 'err' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                           err =3D -EINVAL;
                           ^     ~~~~~~~
   drivers/gpu/drm/radeon/si.c:1837:4: note: Value stored to 'err' is never=
 read
                           err =3D -EINVAL;
                           ^     ~~~~~~~
   drivers/gpu/drm/radeon/si.c:1860:4: warning: Value stored to 'err' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                           err =3D -EINVAL;
                           ^     ~~~~~~~
   drivers/gpu/drm/radeon/si.c:1860:4: note: Value stored to 'err' is never=
 read
                           err =3D -EINVAL;
                           ^     ~~~~~~~
   drivers/gpu/drm/radeon/si.c:1891:4: warning: Value stored to 'err' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                           err =3D -EINVAL;
                           ^     ~~~~~~~
   drivers/gpu/drm/radeon/si.c:1891:4: note: Value stored to 'err' is never=
 read
                           err =3D -EINVAL;
                           ^     ~~~~~~~
   drivers/gpu/drm/radeon/si.c:3613:3: warning: Value stored to 'r' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   r =3D radeon_ring_lock(rdev, ring, 2);
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/si.c:3613:3: note: Value stored to 'r' is never r=
ead
                   r =3D radeon_ring_lock(rdev, ring, 2);
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/si.c:3956:3: warning: Value stored to 'tmp' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   tmp =3D RREG32(GRBM_SOFT_RESET);
                   ^
   drivers/gpu/drm/radeon/si.c:3956:3: note: Value stored to 'tmp' is never=
 read
   drivers/gpu/drm/radeon/si.c:3970:3: warning: Value stored to 'tmp' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   tmp =3D RREG32(SRBM_SOFT_RESET);
                   ^
   drivers/gpu/drm/radeon/si.c:3970:3: note: Value stored to 'tmp' is never=
 read
   drivers/gpu/drm/radeon/si.c:5155:3: warning: Value stored to 'tmp' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   tmp =3D RREG32(DB_DEPTH_INFO);
                   ^
   drivers/gpu/drm/radeon/si.c:5155:3: note: Value stored to 'tmp' is never=
 read
   drivers/gpu/drm/radeon/si.c:5270:3: warning: Value stored to 'tmp' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   tmp =3D RREG32(DB_RENDER_CONTROL);
                   ^
   drivers/gpu/drm/radeon/si.c:5270:3: note: Value stored to 'tmp' is never=
 read
   drivers/gpu/drm/radeon/si.c:5396:10: warning: Although the value stored =
to 'data' is used in the enclosing expression, the value is never actually =
read from 'data' [clang-analyzer-deadcode.DeadStores]
                   orig =3D data =3D RREG32(CGTS_SM_CTRL_REG);
                          ^
   drivers/gpu/drm/radeon/si.c:5396:10: note: Although the value stored to =
'data' is used in the enclosing expression, the value is never actually rea=
d from 'data'
   drivers/gpu/drm/radeon/si.c:5554:11: warning: Although the value stored =
to 'data' is used in the enclosing expression, the value is never actually =
read from 'data' [clang-analyzer-deadcode.DeadStores]
                           orig =3D data =3D RREG32(DMA_CLK_CTRL + offset);
                                  ^
   drivers/gpu/drm/radeon/si.c:5554:11: note: Although the value stored to =
'data' is used in the enclosing expression, the value is never actually rea=
d from 'data'
   drivers/gpu/drm/radeon/si.c:6824:22: warning: Value stored to 'ring' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct radeon_ring *ring =3D &rdev->ring[RADEON_RING_TYPE_GFX_IN=
DEX];
                               ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/gpu/drm/radeon/si.c:6824:22: note: Value stored to 'ring' during=
 its initialization is never read
           struct radeon_ring *ring =3D &rdev->ring[RADEON_RING_TYPE_GFX_IN=
DEX];
                               ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   drivers/tty/mxser.c:396:7: warning: Although the value stored to 'hwid' =
is used in the enclosing expression, the value is never actually read from =
'hwid' [clang-analyzer-deadcode.DeadStores]
           if ((hwid =3D inb(io + UART_MCR)) !=3D 0) {
                ^
   drivers/tty/mxser.c:396:7: note: Although the value stored to 'hwid' is =
used in the enclosing expression, the value is never actually read from 'hw=
id'
>> drivers/tty/mxser.c:752:21: warning: Value stored to 'info' during its i=
nitialization is never read [clang-analyzer-deadcode.DeadStores]
           struct mxser_port *info =3D to_mport(uport);
                              ^~~~   ~~~~~~~~~~~~~~~
   drivers/tty/mxser.c:752:21: note: Value stored to 'info' during its init=
ialization is never read
           struct mxser_port *info =3D to_mport(uport);
                              ^~~~   ~~~~~~~~~~~~~~~
   drivers/tty/mxser.c:840:21: warning: Value stored to 'info' during its i=
nitialization is never read [clang-analyzer-deadcode.DeadStores]
           struct mxser_port *info =3D to_mport(uport);
                              ^~~~   ~~~~~~~~~~~~~~~
   drivers/tty/mxser.c:840:21: note: Value stored to 'info' during its init=
ialization is never read
           struct mxser_port *info =3D to_mport(uport);
                              ^~~~   ~~~~~~~~~~~~~~~
>> drivers/tty/mxser.c:1679:4: warning: Value stored to 'int_cnt' is never =
read [clang-analyzer-deadcode.DeadStores]
                           int_cnt =3D 0;
                           ^         ~
   drivers/tty/mxser.c:1679:4: note: Value stored to 'int_cnt' is never read
                           int_cnt =3D 0;
                           ^         ~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   drivers/tty/synclink_gt.c:212:8: warning: Excessive padding in 'struct s=
lgt_info' (46 padding bytes, where 6 is optimal). =

   Optimal fields order: =

   if_ptr, =

   next_device, =

   pdev, =

   gpio_wait_q, =

   irq_flags, =

   reg_addr, =

   tx_buf, =

   flag_buf, =

   bufs, =

   bufs_dma_addr, =

   rbufs, =

   tbufs, =

   tmp_rbuf, =

   port_array, =

   params, =

   lock, =

   netlock, =

   task, =

   status_event_wait_q, =

   event_wait_q, =

   tx_timer, =

   rx_timer, =

   port, =

   magic, =

   port_count, =

   adapter_num, =

   port_num, =

   line, =

   timeout, =

   x_char, =

   read_status_mask, =

   ignore_status_mask, =

   gpio_present, =

   pending_bh, =

   isr_overflow, =

   bus_type, =

   irq_level, =

   phys_reg_addr, =

   idle_mode, =

   max_frame_size, =

   rbuf_fill_level, =

   rx_pio, =

   if_mode, =

   base_clock, =

   xsync, =

   xctrl, =

   init_error, =

   tx_count, =

   dcd_chkcount, =

   cts_chkcount, =

   dsr_chkcount, =

   ri_chkcount, =

   rbuf_count, =

   rbuf_current, =

   rbuf_index, =

   rbuf_fill_index, =

   tbuf_count, =

   tbuf_current, =

   tbuf_start, =

   tmp_rbuf_count, =

   netcount, =

   input_signal_events, =

   icount, =

   rbuf_fill_count, =

   bh_requested, =

   bh_running, =

   irq_requested, =

   irq_occurred, =

   reg_addr_requested, =

   rx_enabled, =

   rx_restart, =

   tx_enabled, =

   tx_active, =

   signals, =

   drop_rts_on_tx_done, =

   device_name, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct slgt_info {
   ~~~~~~~^~~~~~~~~~~
   drivers/tty/synclink_gt.c:212:8: note: Excessive padding in 'struct slgt=
_info' (46 padding bytes, where 6 is optimal). Optimal fields order: if_ptr=
, next_device, pdev, gpio_wait_q, irq_flags, reg_addr, tx_buf, flag_buf, bu=
fs, bufs_dma_addr, rbufs, tbufs, tmp_rbuf, port_array, params, lock, netloc=
k, task, status_event_wait_q, event_wait_q, tx_timer, rx_timer, port, magic=
, port_count, adapter_num, port_num, line, timeout, x_char, read_status_mas=
k, ignore_status_mask, gpio_present, pending_bh, isr_overflow, bus_type, ir=
q_level, phys_reg_addr, idle_mode, max_frame_size, rbuf_fill_level, rx_pio,=
 if_mode, base_clock, xsync, xctrl, init_error, tx_count, dcd_chkcount, cts=
_chkcount, dsr_chkcount, ri_chkcount, rbuf_count, rbuf_current, rbuf_index,=
 rbuf_fill_index, tbuf_count, tbuf_current, tbuf_start, tmp_rbuf_count, net=
count, input_signal_events, icount, rbuf_fill_count, bh_requested, bh_runni=
ng, irq_requested, irq_occurred, reg_addr_requested, rx_enabled, rx_restart=
, tx_enabled, tx_active, signals, drop_rts_on_tx_done, device_name, conside=
r reordering the fields or adding explicit padding members
   struct slgt_info {
   ~~~~~~~^~~~~~~~~~~
   drivers/tty/synclink_gt.c:1190:3: warning: Call to function 'strcat' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(stat_buf, "|RTS");
                   ^~~~~~
   drivers/tty/synclink_gt.c:1190:3: note: Call to function 'strcat' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcat'. CWE-119
                   strcat(stat_buf, "|RTS");

vim +/info +752 drivers/tty/mxser.c

ee7e5e66f2d4fa drivers/tty/mxser.c  Jiri Slaby     2021-09-22  749  =

c54bfdfe420584 drivers/tty/mxser.c  Jiri Slaby     2021-12-01  750  static =
int mxser_startup(struct uart_port *uport)
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds 2005-04-16  751  {
c54bfdfe420584 drivers/tty/mxser.c  Jiri Slaby     2021-12-01 @752  	struct=
 mxser_port *info =3D to_mport(uport);
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds 2005-04-16  753  	unsign=
ed long flags;
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds 2005-04-16  754  =

c54bfdfe420584 drivers/tty/mxser.c  Jiri Slaby     2021-12-01  755  	BUG_ON=
("we use kfifo");
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds 2005-04-16  756  =

70d208ed1cf4ee drivers/tty/mxser.c  Jiri Slaby     2021-12-10  757  	spin_l=
ock_irqsave(&uport->lock, flags);
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds 2005-04-16  758  =

fd6cd40e106512 drivers/tty/mxser.c  Jiri Slaby     2021-12-10  759  	if (!u=
port->type) {
70d208ed1cf4ee drivers/tty/mxser.c  Jiri Slaby     2021-12-10  760  		spin_=
unlock_irqrestore(&uport->lock, flags);
c54bfdfe420584 drivers/tty/mxser.c  Jiri Slaby     2021-12-01  761  		retur=
n -EINVAL;
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds 2005-04-16  762  	}
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby     2008-02-07  763  =

^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds 2005-04-16  764  	/*
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby     2008-02-07  765  	 * Cle=
ar the FIFO buffers and disable them
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby     2008-02-07  766  	 * (th=
ey will be reenabled in mxser_change_speed())
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds 2005-04-16  767  	 */
ee7e5e66f2d4fa drivers/tty/mxser.c  Jiri Slaby     2021-09-22  768  	mxser_=
disable_and_clear_FIFO(info);
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby     2008-02-07  769  =

^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds 2005-04-16  770  	/*
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby     2008-02-07  771  	 * At =
this point there's no way the LSR could still be 0xFF;
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby     2008-02-07  772  	 * if =
it is, then bail out, because there's likely no UART
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby     2008-02-07  773  	 * her=
e.
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds 2005-04-16  774  	 */
0578bc21274874 drivers/tty/mxser.c  Jiri Slaby     2021-12-10  775  	if (in=
b(uport->iobase + UART_LSR) =3D=3D 0xff) {
70d208ed1cf4ee drivers/tty/mxser.c  Jiri Slaby     2021-12-10  776  		spin_=
unlock_irqrestore(&uport->lock, flags);
c54bfdfe420584 drivers/tty/mxser.c  Jiri Slaby     2021-12-01  777  		retur=
n -ENODEV;
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby     2008-02-07  778  	}
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby     2008-02-07  779  =

^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds 2005-04-16  780  	/*
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby     2008-02-07  781  	 * Cle=
ar the interrupt registers.
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds 2005-04-16  782  	 */
0578bc21274874 drivers/tty/mxser.c  Jiri Slaby     2021-12-10  783  	(void)=
 inb(uport->iobase + UART_LSR);
0578bc21274874 drivers/tty/mxser.c  Jiri Slaby     2021-12-10  784  	(void)=
 inb(uport->iobase + UART_RX);
0578bc21274874 drivers/tty/mxser.c  Jiri Slaby     2021-12-10  785  	(void)=
 inb(uport->iobase + UART_IIR);
0578bc21274874 drivers/tty/mxser.c  Jiri Slaby     2021-12-10  786  	(void)=
 inb(uport->iobase + UART_MSR);
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby     2008-02-07  787  =

^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds 2005-04-16  788  	/*
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby     2008-02-07  789  	 * Now=
, initialize the UART
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds 2005-04-16  790  	 */
0578bc21274874 drivers/tty/mxser.c  Jiri Slaby     2021-12-10  791  	outb(U=
ART_LCR_WLEN8, uport->iobase + UART_LCR);	/* reset DLAB */
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby     2008-02-07  792  	info->=
MCR =3D UART_MCR_DTR | UART_MCR_RTS;
0578bc21274874 drivers/tty/mxser.c  Jiri Slaby     2021-12-10  793  	outb(i=
nfo->MCR, uport->iobase + UART_MCR);
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds 2005-04-16  794  =

1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby     2008-02-07  795  	/*
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby     2008-02-07  796  	 * Fin=
ally, enable interrupts
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby     2008-02-07  797  	 */
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby     2008-02-07  798  	info->=
IER =3D UART_IER_MSI | UART_IER_RLSI | UART_IER_RDI;
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds 2005-04-16  799  =

292955a7c011e2 drivers/tty/mxser.c  Jiri Slaby     2021-06-18  800  	if (in=
fo->board->must_hwid)
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby     2008-02-07  801  		info-=
>IER |=3D MOXA_MUST_IER_EGDAI;
0578bc21274874 drivers/tty/mxser.c  Jiri Slaby     2021-12-10  802  	outb(i=
nfo->IER, uport->iobase + UART_IER);	/* enable interrupts */
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds 2005-04-16  803  =

1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby     2008-02-07  804  	/*
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby     2008-02-07  805  	 * And=
 clear the interrupt registers again for luck.
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby     2008-02-07  806  	 */
0578bc21274874 drivers/tty/mxser.c  Jiri Slaby     2021-12-10  807  	(void)=
 inb(uport->iobase + UART_LSR);
0578bc21274874 drivers/tty/mxser.c  Jiri Slaby     2021-12-10  808  	(void)=
 inb(uport->iobase + UART_RX);
0578bc21274874 drivers/tty/mxser.c  Jiri Slaby     2021-12-10  809  	(void)=
 inb(uport->iobase + UART_IIR);
0578bc21274874 drivers/tty/mxser.c  Jiri Slaby     2021-12-10  810  	(void)=
 inb(uport->iobase + UART_MSR);
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds 2005-04-16  811  =

c54bfdfe420584 drivers/tty/mxser.c  Jiri Slaby     2021-12-01  812  	//kfif=
o_reset(&port->xmit_fifo);
c54bfdfe420584 drivers/tty/mxser.c  Jiri Slaby     2021-12-01  813  	BUG_ON=
("kfifo_reset");
70d208ed1cf4ee drivers/tty/mxser.c  Jiri Slaby     2021-12-10  814  	spin_u=
nlock_irqrestore(&uport->lock, flags);
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds 2005-04-16  815  =

1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby     2008-02-07  816  	return=
 0;
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds 2005-04-16  817  }
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds 2005-04-16  818  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============9184998022187071706==--

