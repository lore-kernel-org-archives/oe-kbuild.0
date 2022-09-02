Content-Type: multipart/mixed; boundary="===============5548327433089161363=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 2/3] tty: serial: use DEFINE_UART_PORT_TX_HELPER()
Date: Fri, 02 Sep 2022 09:17:04 +0800
Message-ID: <202209020944.CIvhlMgf-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5548327433089161363==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/t=
ty/serial/lpc32xx_hs.c:286:8: sparse: sparse: Trying to use reserved word '=
for' as identifier"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220901110657.3305-3-jslaby@suse.cz>
References: <20220901110657.3305-3-jslaby@suse.cz>
TO: Jiri Slaby <jslaby@suse.cz>

Hi Jiri,

I love your patch! Perhaps something to improve:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on usb/usb-testing shawnguo/for-next linus/master =
v6.0-rc3 next-20220901]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiri-Slaby/tty-TX-he=
lpers/20220901-190806
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-=
testing
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: xtensa-randconfig-s033-20220901 (https://download.01.org/0day-ci/ar=
chive/20220902/202209020944.CIvhlMgf-lkp(a)intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/393b592949b2c633992=
ae9bdf00d3cffdd9a85d7
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jiri-Slaby/tty-TX-helpers/20220901=
-190806
        git checkout 393b592949b2c633992ae9bdf00d3cffdd9a85d7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dx=
tensa SHELL=3D/bin/bash drivers/tty/serial/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   drivers/tty/serial/lpc32xx_hs.c: note: in included file (through arch/xt=
ensa/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ..=
.):
   arch/xtensa/include/asm/processor.h:103:2: sparse: sparse: Unsupported x=
tensa ABI
   arch/xtensa/include/asm/processor.h:133:2: sparse: sparse: Unsupported X=
tensa ABI
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: Expected ) in fun=
ction declarator
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: got __VA_OPT__
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: Expected ) in fun=
ction declarator
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: got ;
>> drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: Trying to use res=
erved word 'for' as identifier
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: Expected ; at end=
 of declaration
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: got &&
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: Expected ) in nes=
ted declarator
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: got {
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: Expected ) in fun=
ction declarator
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: got ,
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: Expected ; at end=
 of declaration
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: got ->
>> drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: Trying to use res=
erved word 'continue' as identifier
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: got }
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: Expected ) in fun=
ction declarator
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: got ,
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: Expected ; at end=
 of declaration
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: got ->
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: got }
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: Expected ) in fun=
ction declarator
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: got <
>> drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: Trying to use res=
erved word 'if' as identifier
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: Expected ) in fun=
ction declarator
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: got =3D=3D
>> drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: Trying to use res=
erved word 'if' as identifier
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: got }
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: got }
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: symbol 'true' red=
eclared with different type (different signedness):
>> drivers/tty/serial/lpc32xx_hs.c:286:8: sparse:    int [addressable] [top=
level] true
   drivers/tty/serial/lpc32xx_hs.c: note: in included file (through include=
/uapi/linux/posix_types.h, include/uapi/linux/types.h, include/linux/types.=
h, ...):
   include/linux/stddef.h:12:9: sparse: note: previously declared as:
   include/linux/stddef.h:12:9: sparse:    unsigned int enum <noident> [top=
level] true
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: symbol 'writel' r=
edeclared with different type (incompatible argument 1 (different base type=
s)):
>> drivers/tty/serial/lpc32xx_hs.c:286:8: sparse:    int static [signed] [t=
oplevel] writel( ... )
   drivers/tty/serial/lpc32xx_hs.c: note: in included file (through arch/xt=
ensa/include/asm/io.h, include/linux/scatterlist.h, include/linux/kfifo.h, =
...):
   include/asm-generic/io.h:273:20: sparse: note: previously declared as:
   include/asm-generic/io.h:273:20: sparse:    void static inline [gnu_inli=
ne] [toplevel] writel( ... )
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: undefined identif=
ier 'xmit'
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: undefined identif=
ier 'xmit'
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: symbol 'ch' redec=
lared with different type (different type sizes):
>> drivers/tty/serial/lpc32xx_hs.c:286:8: sparse:    int [addressable] [top=
level] ch
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: note: previously declared=
 as:
>> drivers/tty/serial/lpc32xx_hs.c:286:8: sparse:    unsigned char [address=
able] [toplevel] [usertype] ch
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: symbol 'writel' r=
edeclared with different type (incompatible argument 1 (different base type=
s)):
>> drivers/tty/serial/lpc32xx_hs.c:286:8: sparse:    int static [signed] [t=
oplevel] writel( ... )
   include/asm-generic/io.h:273:20: sparse: note: previously declared as:
   include/asm-generic/io.h:273:20: sparse:    void static inline [gnu_inli=
ne] [toplevel] writel( ... )
>> drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: cannot dereferenc=
e this type
>> drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: cannot dereferenc=
e this type
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: symbol 'pending' =
redeclared with different type (different signedness):
>> drivers/tty/serial/lpc32xx_hs.c:286:8: sparse:    int [addressable] [top=
level] pending
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: note: previously declared=
 as:
>> drivers/tty/serial/lpc32xx_hs.c:286:8: sparse:    unsigned int [addressa=
ble] [toplevel] pending
>> drivers/tty/serial/lpc32xx_hs.c:303:23: sparse: sparse: too many argumen=
ts for function writel
   drivers/tty/serial/lpc32xx_hs.c:310:23: sparse: sparse: too many argumen=
ts for function writel
   drivers/tty/serial/lpc32xx_hs.c:314:23: sparse: sparse: too many argumen=
ts for function writel
   drivers/tty/serial/lpc32xx_hs.c:327:23: sparse: sparse: too many argumen=
ts for function writel
   drivers/tty/serial/lpc32xx_hs.c:368:15: sparse: sparse: too many argumen=
ts for function writel
   drivers/tty/serial/lpc32xx_hs.c:379:15: sparse: sparse: too many argumen=
ts for function writel
   drivers/tty/serial/lpc32xx_hs.c:389:15: sparse: sparse: too many argumen=
ts for function writel
   drivers/tty/serial/lpc32xx_hs.c:391:15: sparse: sparse: too many argumen=
ts for function writel
   drivers/tty/serial/lpc32xx_hs.c:408:15: sparse: sparse: too many argumen=
ts for function writel
   drivers/tty/serial/lpc32xx_hs.c:423:15: sparse: sparse: too many argumen=
ts for function writel
   drivers/tty/serial/lpc32xx_hs.c:427:15: sparse: sparse: too many argumen=
ts for function writel
   drivers/tty/serial/lpc32xx_hs.c:435:15: sparse: sparse: too many argumen=
ts for function writel
   drivers/tty/serial/lpc32xx_hs.c:444:23: sparse: sparse: too many argumen=
ts for function writel
   drivers/tty/serial/lpc32xx_hs.c:460:15: sparse: sparse: too many argumen=
ts for function writel
   drivers/tty/serial/lpc32xx_hs.c:497:15: sparse: sparse: too many argumen=
ts for function writel
   drivers/tty/serial/lpc32xx_hs.c:499:15: sparse: sparse: too many argumen=
ts for function writel
   drivers/tty/serial/lpc32xx_hs.c:560:15: sparse: sparse: too many argumen=
ts for function writel
   drivers/tty/serial/lpc32xx_hs.c:564:15: sparse: sparse: too many argumen=
ts for function writel
   drivers/tty/serial/lpc32xx_hs.c:568:15: sparse: sparse: too many argumen=
ts for function writel

vim +/for +286 drivers/tty/serial/lpc32xx_hs.c

596f93f50e2d1a9 Roland Stigge  2012-06-11  285  =

393b592949b2c63 Jiri Slaby     2022-09-01 @286  static DEFINE_UART_PORT_TX_=
HELPER(__serial_lpc32xx_tx, port, ch,
393b592949b2c63 Jiri Slaby     2022-09-01  287  		serial_lpc32xx_tx_ready(p=
ort),
393b592949b2c63 Jiri Slaby     2022-09-01  288  		writel(ch, LPC32XX_HSUART=
_FIFO(port->membase)));
596f93f50e2d1a9 Roland Stigge  2012-06-11  289  =

596f93f50e2d1a9 Roland Stigge  2012-06-11  290  static irqreturn_t serial_l=
pc32xx_interrupt(int irq, void *dev_id)
596f93f50e2d1a9 Roland Stigge  2012-06-11  291  {
596f93f50e2d1a9 Roland Stigge  2012-06-11  292  	struct uart_port *port =3D=
 dev_id;
33aeb9da1b5248c Thierry Reding 2013-01-18  293  	struct tty_port *tport =3D=
 &port->state->port;
596f93f50e2d1a9 Roland Stigge  2012-06-11  294  	u32 status;
596f93f50e2d1a9 Roland Stigge  2012-06-11  295  =

596f93f50e2d1a9 Roland Stigge  2012-06-11  296  	spin_lock(&port->lock);
596f93f50e2d1a9 Roland Stigge  2012-06-11  297  =

596f93f50e2d1a9 Roland Stigge  2012-06-11  298  	/* Read UART status and cl=
ear latched interrupts */
596f93f50e2d1a9 Roland Stigge  2012-06-11  299  	status =3D readl(LPC32XX_H=
SUART_IIR(port->membase));
596f93f50e2d1a9 Roland Stigge  2012-06-11  300  =

596f93f50e2d1a9 Roland Stigge  2012-06-11  301  	if (status & LPC32XX_HSU_B=
RK_INT) {
596f93f50e2d1a9 Roland Stigge  2012-06-11  302  		/* Break received */
596f93f50e2d1a9 Roland Stigge  2012-06-11 @303  		writel(LPC32XX_HSU_BRK_IN=
T, LPC32XX_HSUART_IIR(port->membase));
596f93f50e2d1a9 Roland Stigge  2012-06-11  304  		port->icount.brk++;
596f93f50e2d1a9 Roland Stigge  2012-06-11  305  		uart_handle_break(port);
596f93f50e2d1a9 Roland Stigge  2012-06-11  306  	}
596f93f50e2d1a9 Roland Stigge  2012-06-11  307  =

596f93f50e2d1a9 Roland Stigge  2012-06-11  308  	/* Framing error */
596f93f50e2d1a9 Roland Stigge  2012-06-11  309  	if (status & LPC32XX_HSU_F=
E_INT)
596f93f50e2d1a9 Roland Stigge  2012-06-11  310  		writel(LPC32XX_HSU_FE_INT=
, LPC32XX_HSUART_IIR(port->membase));
596f93f50e2d1a9 Roland Stigge  2012-06-11  311  =

596f93f50e2d1a9 Roland Stigge  2012-06-11  312  	if (status & LPC32XX_HSU_R=
X_OE_INT) {
596f93f50e2d1a9 Roland Stigge  2012-06-11  313  		/* Receive FIFO overrun */
596f93f50e2d1a9 Roland Stigge  2012-06-11  314  		writel(LPC32XX_HSU_RX_OE_=
INT,
596f93f50e2d1a9 Roland Stigge  2012-06-11  315  		       LPC32XX_HSUART_IIR=
(port->membase));
596f93f50e2d1a9 Roland Stigge  2012-06-11  316  		port->icount.overrun++;
92a19f9cec9a80a Jiri Slaby     2013-01-03  317  		tty_insert_flip_char(tpor=
t, 0, TTY_OVERRUN);
5f6a85158ccacc3 Jiri Slaby     2021-11-22  318  		tty_flip_buffer_push(tpor=
t);
596f93f50e2d1a9 Roland Stigge  2012-06-11  319  	}
596f93f50e2d1a9 Roland Stigge  2012-06-11  320  =

596f93f50e2d1a9 Roland Stigge  2012-06-11  321  	/* Data received? */
97f2c4289c591c2 Viresh Kumar   2013-08-19  322  	if (status & (LPC32XX_HSU_=
RX_TIMEOUT_INT | LPC32XX_HSU_RX_TRIG_INT))
596f93f50e2d1a9 Roland Stigge  2012-06-11  323  		__serial_lpc32xx_rx(port);
596f93f50e2d1a9 Roland Stigge  2012-06-11  324  =

596f93f50e2d1a9 Roland Stigge  2012-06-11  325  	/* Transmit data request? =
*/
596f93f50e2d1a9 Roland Stigge  2012-06-11  326  	if ((status & LPC32XX_HSU_=
TX_INT) && (!uart_tx_stopped(port))) {
596f93f50e2d1a9 Roland Stigge  2012-06-11  327  		writel(LPC32XX_HSU_TX_INT=
, LPC32XX_HSUART_IIR(port->membase));
596f93f50e2d1a9 Roland Stigge  2012-06-11  328  		__serial_lpc32xx_tx(port);
596f93f50e2d1a9 Roland Stigge  2012-06-11  329  	}
596f93f50e2d1a9 Roland Stigge  2012-06-11  330  =

596f93f50e2d1a9 Roland Stigge  2012-06-11  331  	spin_unlock(&port->lock);
596f93f50e2d1a9 Roland Stigge  2012-06-11  332  =

596f93f50e2d1a9 Roland Stigge  2012-06-11  333  	return IRQ_HANDLED;
596f93f50e2d1a9 Roland Stigge  2012-06-11  334  }
596f93f50e2d1a9 Roland Stigge  2012-06-11  335  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5548327433089161363==--

