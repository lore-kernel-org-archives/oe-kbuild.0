Content-Type: multipart/mixed; boundary="===============5742392374953349616=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 4/4] tty: serial: use DEFINE_UART_PORT_TX_HELPER_LIMITED()
Date: Thu, 08 Sep 2022 17:54:29 +0800
Message-ID: <202209081740.G5DXUcNF-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5742392374953349616==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/t=
ty/serial/rp2.c:428:8: sparse:    int static [signed] [toplevel] writeb_rel=
axed( ... )"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220906104805.23211-5-jslaby@suse.cz>
References: <20220906104805.23211-5-jslaby@suse.cz>
TO: Jiri Slaby <jslaby@suse.cz>

Hi Jiri,

I love your patch! Perhaps something to improve:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on usb/usb-testing shawnguo/for-next linus/master =
v6.0-rc4 next-20220907]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiri-Slaby/tty-TX-he=
lpers/20220906-185236
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-=
testing
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: csky-randconfig-s041-20220908 (https://download.01.org/0day-ci/arch=
ive/20220908/202209081740.G5DXUcNF-lkp(a)intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/acf6bd027deb5adff25=
97e7c592b10a5822a5975
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jiri-Slaby/tty-TX-helpers/20220906=
-185236
        git checkout acf6bd027deb5adff2597e7c592b10a5822a5975
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dc=
sky SHELL=3D/bin/bash drivers/tty/serial/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: Expected ) in function d=
eclarator
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: got __VA_OPT__
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: Expected ) in function d=
eclarator
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: got ;
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: Trying to use reserved w=
ord 'for' as identifier
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: Expected ; at end of dec=
laration
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: got &&
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: Expected ) in nested dec=
larator
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: got --
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: Expected ) in nested dec=
larator
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: got {
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: Expected ) in function d=
eclarator
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: got (
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: Expected ; at the end of=
 type declaration
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: got }
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: Expected ; at end of dec=
laration
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: got ->
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: Trying to use reserved w=
ord 'continue' as identifier
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: Expected ; at the end of=
 type declaration
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: got }
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: Expected ) in nested dec=
larator
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: got {
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: Expected ) in function d=
eclarator
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: got (
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: Expected ; at the end of=
 type declaration
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: got }
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: Expected ; at end of dec=
laration
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: got ->
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: Expected ; at the end of=
 type declaration
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: got }
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: Expected ) in function d=
eclarator
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: got <
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: Trying to use reserved w=
ord 'if' as identifier
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: Expected ) in function d=
eclarator
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: got =3D=3D
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: Trying to use reserved w=
ord 'if' as identifier
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: Expected ; at the end of=
 type declaration
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: got }
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: Expected ;@the end of=
 type declaration
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: got }
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: symbol 'writeb_relaxed' =
redeclared with different type (different argument counts):
>> drivers/tty/serial/rp2.c:428:8: sparse:    int static [signed] [toplevel=
] writeb_relaxed( ... )
   drivers/tty/serial/rp2.c: note: in included file (through arch/csky/incl=
ude/asm/io.h, include/linux/io.h):
   include/asm-generic/io.h:356:20: sparse: note: previously declared as:
   include/asm-generic/io.h:356:20: sparse:    void static inline [gnu_inli=
ne] [toplevel] writeb_relaxed( ... )
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: undefined identifier 'xm=
it'
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: undefined identifier 'xm=
it'
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: symbol 'ch' redeclared w=
ith different type (different type sizes):
   drivers/tty/serial/rp2.c:428:8: sparse:    int [addressable] [toplevel] =
ch
   drivers/tty/serial/rp2.c:428:8: sparse: note: previously declared as:
   drivers/tty/serial/rp2.c:428:8: sparse:    unsigned char [addressable] [=
toplevel] [usertype] ch
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: symbol 'writeb_relaxed' =
redeclared with different type (different argument counts):
>> drivers/tty/serial/rp2.c:428:8: sparse:    int static [signed] [toplevel=
] writeb_relaxed( ... )
   include/asm-generic/io.h:356:20: sparse: note: previously declared as:
   include/asm-generic/io.h:356:20: sparse:    void static inline [gnu_inli=
ne] [toplevel] writeb_relaxed( ... )
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: cannot dereference this =
type
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: cannot dereference this =
type
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: symbol 'pending' redecla=
red with different type (different signedness):
   drivers/tty/serial/rp2.c:428:8: sparse:    int [addressable] [toplevel] =
pending
   drivers/tty/serial/rp2.c:428:8: sparse: note: previously declared as:
   drivers/tty/serial/rp2.c:428:8: sparse:    unsigned int [addressable] [t=
oplevel] pending
   drivers/tty/serial/rp2.c:449:29: sparse: sparse: too many arguments for =
function rp2_tx_chars
>> drivers/tty/serial/rp2.c:618:17: sparse: sparse: too many arguments for =
function writeb_relaxed
   drivers/tty/serial/rp2.c:623:9: sparse: sparse: too many arguments for f=
unction writeb_relaxed

vim +428 drivers/tty/serial/rp2.c

7d9f49afa451d8 Kevin Cernekee 2013-01-16  427  =

acf6bd027deb5a Jiri Slaby     2022-09-06 @428  static DEFINE_UART_PORT_TX_H=
ELPER_LIMITED(rp2_tx_chars,
acf6bd027deb5a Jiri Slaby     2022-09-06  429  		true,
acf6bd027deb5a Jiri Slaby     2022-09-06  430  		writeb(ch, port_to_up(port=
)->base + RP2_DATA_BYTE),
acf6bd027deb5a Jiri Slaby     2022-09-06  431  		({}));
7d9f49afa451d8 Kevin Cernekee 2013-01-16  432  =

7d9f49afa451d8 Kevin Cernekee 2013-01-16  433  static void rp2_ch_interrupt=
(struct rp2_uart_port *up)
7d9f49afa451d8 Kevin Cernekee 2013-01-16  434  {
7d9f49afa451d8 Kevin Cernekee 2013-01-16  435  	u32 status;
7d9f49afa451d8 Kevin Cernekee 2013-01-16  436  =

7d9f49afa451d8 Kevin Cernekee 2013-01-16  437  	spin_lock(&up->port.lock);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  438  =

7d9f49afa451d8 Kevin Cernekee 2013-01-16  439  	/*
7d9f49afa451d8 Kevin Cernekee 2013-01-16  440  	 * The IRQ status bits are =
clear-on-write.  Other status bits in
7d9f49afa451d8 Kevin Cernekee 2013-01-16  441  	 * this register aren't, so=
 it's harmless to write to them.
7d9f49afa451d8 Kevin Cernekee 2013-01-16  442  	 */
7d9f49afa451d8 Kevin Cernekee 2013-01-16  443  	status =3D readl(up->base +=
 RP2_CHAN_STAT);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  444  	writel(status, up->base + R=
P2_CHAN_STAT);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  445  =

7d9f49afa451d8 Kevin Cernekee 2013-01-16  446  	if (status & RP2_CHAN_STAT_=
RXDATA_m)
7d9f49afa451d8 Kevin Cernekee 2013-01-16  447  		rp2_rx_chars(up);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  448  	if (status & RP2_CHAN_STAT_=
TXEMPTY_m)
acf6bd027deb5a Jiri Slaby     2022-09-06  449  		rp2_tx_chars(&up->port,
acf6bd027deb5a Jiri Slaby     2022-09-06  450  			FIFO_SIZE - readw(up->bas=
e + RP2_TX_FIFO_COUNT));
7d9f49afa451d8 Kevin Cernekee 2013-01-16  451  	if (status & RP2_CHAN_STAT_=
MS_CHANGED_MASK)
7d9f49afa451d8 Kevin Cernekee 2013-01-16  452  		wake_up_interruptible(&up-=
>port.state->port.delta_msr_wait);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  453  =

7d9f49afa451d8 Kevin Cernekee 2013-01-16  454  	spin_unlock(&up->port.lock);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  455  }
7d9f49afa451d8 Kevin Cernekee 2013-01-16  456  =

7d9f49afa451d8 Kevin Cernekee 2013-01-16  457  static int rp2_asic_interrup=
t(struct rp2_card *card, unsigned int asic_id)
7d9f49afa451d8 Kevin Cernekee 2013-01-16  458  {
7d9f49afa451d8 Kevin Cernekee 2013-01-16  459  	void __iomem *base =3D card=
->bar1 + RP2_ASIC_OFFSET(asic_id);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  460  	int ch, handled =3D 0;
7d9f49afa451d8 Kevin Cernekee 2013-01-16  461  	unsigned long status =3D re=
adl(base + RP2_CH_IRQ_STAT) &
7d9f49afa451d8 Kevin Cernekee 2013-01-16  462  			       ~readl(base + RP2_=
CH_IRQ_MASK);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  463  =

7d9f49afa451d8 Kevin Cernekee 2013-01-16  464  	for_each_set_bit(ch, &statu=
s, PORTS_PER_ASIC) {
7d9f49afa451d8 Kevin Cernekee 2013-01-16  465  		rp2_ch_interrupt(&card->po=
rts[ch]);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  466  		handled++;
7d9f49afa451d8 Kevin Cernekee 2013-01-16  467  	}
7d9f49afa451d8 Kevin Cernekee 2013-01-16  468  	return handled;
7d9f49afa451d8 Kevin Cernekee 2013-01-16  469  }
7d9f49afa451d8 Kevin Cernekee 2013-01-16  470  =

7d9f49afa451d8 Kevin Cernekee 2013-01-16  471  static irqreturn_t rp2_uart_=
interrupt(int irq, void *dev_id)
7d9f49afa451d8 Kevin Cernekee 2013-01-16  472  {
7d9f49afa451d8 Kevin Cernekee 2013-01-16  473  	struct rp2_card *card =3D d=
ev_id;
7d9f49afa451d8 Kevin Cernekee 2013-01-16  474  	int handled;
7d9f49afa451d8 Kevin Cernekee 2013-01-16  475  =

7d9f49afa451d8 Kevin Cernekee 2013-01-16  476  	handled =3D rp2_asic_interr=
upt(card, 0);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  477  	if (card->n_ports >=3D PORT=
S_PER_ASIC)
7d9f49afa451d8 Kevin Cernekee 2013-01-16  478  		handled +=3D rp2_asic_inte=
rrupt(card, 1);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  479  =

7d9f49afa451d8 Kevin Cernekee 2013-01-16  480  	return handled ? IRQ_HANDLE=
D : IRQ_NONE;
7d9f49afa451d8 Kevin Cernekee 2013-01-16  481  }
7d9f49afa451d8 Kevin Cernekee 2013-01-16  482  =

7d9f49afa451d8 Kevin Cernekee 2013-01-16  483  static inline void rp2_flush=
_fifos(struct rp2_uart_port *up)
7d9f49afa451d8 Kevin Cernekee 2013-01-16  484  {
7d9f49afa451d8 Kevin Cernekee 2013-01-16  485  	rp2_rmw_set(up, RP2_UART_CT=
L,
7d9f49afa451d8 Kevin Cernekee 2013-01-16  486  		    RP2_UART_CTL_FLUSH_RX_=
m | RP2_UART_CTL_FLUSH_TX_m);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  487  	readl(up->base + RP2_UART_C=
TL);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  488  	udelay(10);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  489  	rp2_rmw_clr(up, RP2_UART_CT=
L,
7d9f49afa451d8 Kevin Cernekee 2013-01-16  490  		    RP2_UART_CTL_FLUSH_RX_=
m | RP2_UART_CTL_FLUSH_TX_m);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  491  }
7d9f49afa451d8 Kevin Cernekee 2013-01-16  492  =

7d9f49afa451d8 Kevin Cernekee 2013-01-16  493  static int rp2_uart_startup(=
struct uart_port *port)
7d9f49afa451d8 Kevin Cernekee 2013-01-16  494  {
7d9f49afa451d8 Kevin Cernekee 2013-01-16  495  	struct rp2_uart_port *up =
=3D port_to_up(port);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  496  =

7d9f49afa451d8 Kevin Cernekee 2013-01-16  497  	rp2_flush_fifos(up);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  498  	rp2_rmw(up, RP2_TXRX_CTL, R=
P2_TXRX_CTL_MSRIRQ_m, RP2_TXRX_CTL_RXIRQ_m);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  499  	rp2_rmw(up, RP2_TXRX_CTL, R=
P2_TXRX_CTL_RX_TRIG_m,
7d9f49afa451d8 Kevin Cernekee 2013-01-16  500  		RP2_TXRX_CTL_RX_TRIG_1);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  501  	rp2_rmw(up, RP2_CHAN_STAT, =
0, 0);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  502  	rp2_mask_ch_irq(up, up->idx=
, 1);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  503  =

7d9f49afa451d8 Kevin Cernekee 2013-01-16  504  	return 0;
7d9f49afa451d8 Kevin Cernekee 2013-01-16  505  }
7d9f49afa451d8 Kevin Cernekee 2013-01-16  506  =

7d9f49afa451d8 Kevin Cernekee 2013-01-16  507  static void rp2_uart_shutdow=
n(struct uart_port *port)
7d9f49afa451d8 Kevin Cernekee 2013-01-16  508  {
7d9f49afa451d8 Kevin Cernekee 2013-01-16  509  	struct rp2_uart_port *up =
=3D port_to_up(port);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  510  	unsigned long flags;
7d9f49afa451d8 Kevin Cernekee 2013-01-16  511  =

7d9f49afa451d8 Kevin Cernekee 2013-01-16  512  	rp2_uart_break_ctl(port, 0);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  513  =

7d9f49afa451d8 Kevin Cernekee 2013-01-16  514  	spin_lock_irqsave(&port->lo=
ck, flags);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  515  	rp2_mask_ch_irq(up, up->idx=
, 0);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  516  	rp2_rmw(up, RP2_CHAN_STAT, =
0, 0);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  517  	spin_unlock_irqrestore(&por=
t->lock, flags);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  518  }
7d9f49afa451d8 Kevin Cernekee 2013-01-16  519  =

7d9f49afa451d8 Kevin Cernekee 2013-01-16  520  static const char *rp2_uart_=
type(struct uart_port *port)
7d9f49afa451d8 Kevin Cernekee 2013-01-16  521  {
7d9f49afa451d8 Kevin Cernekee 2013-01-16  522  	return (port->type =3D=3D P=
ORT_RP2) ? "RocketPort 2 UART" : NULL;
7d9f49afa451d8 Kevin Cernekee 2013-01-16  523  }
7d9f49afa451d8 Kevin Cernekee 2013-01-16  524  =

7d9f49afa451d8 Kevin Cernekee 2013-01-16  525  static void rp2_uart_release=
_port(struct uart_port *port)
7d9f49afa451d8 Kevin Cernekee 2013-01-16  526  {
7d9f49afa451d8 Kevin Cernekee 2013-01-16  527  	/* Nothing to release ... */
7d9f49afa451d8 Kevin Cernekee 2013-01-16  528  }
7d9f49afa451d8 Kevin Cernekee 2013-01-16  529  =

7d9f49afa451d8 Kevin Cernekee 2013-01-16  530  static int rp2_uart_request_=
port(struct uart_port *port)
7d9f49afa451d8 Kevin Cernekee 2013-01-16  531  {
7d9f49afa451d8 Kevin Cernekee 2013-01-16  532  	/* UARTs always present */
7d9f49afa451d8 Kevin Cernekee 2013-01-16  533  	return 0;
7d9f49afa451d8 Kevin Cernekee 2013-01-16  534  }
7d9f49afa451d8 Kevin Cernekee 2013-01-16  535  =

7d9f49afa451d8 Kevin Cernekee 2013-01-16  536  static void rp2_uart_config_=
port(struct uart_port *port, int flags)
7d9f49afa451d8 Kevin Cernekee 2013-01-16  537  {
7d9f49afa451d8 Kevin Cernekee 2013-01-16  538  	if (flags & UART_CONFIG_TYP=
E)
7d9f49afa451d8 Kevin Cernekee 2013-01-16  539  		port->type =3D PORT_RP2;
7d9f49afa451d8 Kevin Cernekee 2013-01-16  540  }
7d9f49afa451d8 Kevin Cernekee 2013-01-16  541  =

7d9f49afa451d8 Kevin Cernekee 2013-01-16  542  static int rp2_uart_verify_p=
ort(struct uart_port *port,
7d9f49afa451d8 Kevin Cernekee 2013-01-16  543  				   struct serial_struct =
*ser)
7d9f49afa451d8 Kevin Cernekee 2013-01-16  544  {
7d9f49afa451d8 Kevin Cernekee 2013-01-16  545  	if (ser->type !=3D PORT_UNK=
NOWN && ser->type !=3D PORT_RP2)
7d9f49afa451d8 Kevin Cernekee 2013-01-16  546  		return -EINVAL;
7d9f49afa451d8 Kevin Cernekee 2013-01-16  547  =

7d9f49afa451d8 Kevin Cernekee 2013-01-16  548  	return 0;
7d9f49afa451d8 Kevin Cernekee 2013-01-16  549  }
7d9f49afa451d8 Kevin Cernekee 2013-01-16  550  =

7d9f49afa451d8 Kevin Cernekee 2013-01-16  551  static const struct uart_ops=
 rp2_uart_ops =3D {
7d9f49afa451d8 Kevin Cernekee 2013-01-16  552  	.tx_empty	=3D rp2_uart_tx_e=
mpty,
7d9f49afa451d8 Kevin Cernekee 2013-01-16  553  	.set_mctrl	=3D rp2_uart_set=
_mctrl,
7d9f49afa451d8 Kevin Cernekee 2013-01-16  554  	.get_mctrl	=3D rp2_uart_get=
_mctrl,
7d9f49afa451d8 Kevin Cernekee 2013-01-16  555  	.stop_tx	=3D rp2_uart_stop_=
tx,
7d9f49afa451d8 Kevin Cernekee 2013-01-16  556  	.start_tx	=3D rp2_uart_star=
t_tx,
7d9f49afa451d8 Kevin Cernekee 2013-01-16  557  	.stop_rx	=3D rp2_uart_stop_=
rx,
7d9f49afa451d8 Kevin Cernekee 2013-01-16  558  	.enable_ms	=3D rp2_uart_ena=
ble_ms,
7d9f49afa451d8 Kevin Cernekee 2013-01-16  559  	.break_ctl	=3D rp2_uart_bre=
ak_ctl,
7d9f49afa451d8 Kevin Cernekee 2013-01-16  560  	.startup	=3D rp2_uart_start=
up,
7d9f49afa451d8 Kevin Cernekee 2013-01-16  561  	.shutdown	=3D rp2_uart_shut=
down,
7d9f49afa451d8 Kevin Cernekee 2013-01-16  562  	.set_termios	=3D rp2_uart_s=
et_termios,
7d9f49afa451d8 Kevin Cernekee 2013-01-16  563  	.type		=3D rp2_uart_type,
7d9f49afa451d8 Kevin Cernekee 2013-01-16  564  	.release_port	=3D rp2_uart_=
release_port,
7d9f49afa451d8 Kevin Cernekee 2013-01-16  565  	.request_port	=3D rp2_uart_=
request_port,
7d9f49afa451d8 Kevin Cernekee 2013-01-16  566  	.config_port	=3D rp2_uart_c=
onfig_port,
7d9f49afa451d8 Kevin Cernekee 2013-01-16  567  	.verify_port	=3D rp2_uart_v=
erify_port,
7d9f49afa451d8 Kevin Cernekee 2013-01-16  568  };
7d9f49afa451d8 Kevin Cernekee 2013-01-16  569  =

7d9f49afa451d8 Kevin Cernekee 2013-01-16  570  static void rp2_reset_asic(s=
truct rp2_card *card, unsigned int asic_id)
7d9f49afa451d8 Kevin Cernekee 2013-01-16  571  {
7d9f49afa451d8 Kevin Cernekee 2013-01-16  572  	void __iomem *base =3D card=
->bar1 + RP2_ASIC_OFFSET(asic_id);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  573  	u32 clk_cfg;
7d9f49afa451d8 Kevin Cernekee 2013-01-16  574  =

7d9f49afa451d8 Kevin Cernekee 2013-01-16  575  	writew(1, base + RP2_GLOBAL=
_CMD);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  576  	readw(base + RP2_GLOBAL_CMD=
);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  577  	msleep(100);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  578  	writel(0, base + RP2_CLK_PR=
ESCALER);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  579  =

7d9f49afa451d8 Kevin Cernekee 2013-01-16  580  	/* TDM clock configuration =
*/
7d9f49afa451d8 Kevin Cernekee 2013-01-16  581  	clk_cfg =3D readw(base + RP=
2_ASIC_CFG);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  582  	clk_cfg =3D (clk_cfg & ~BIT=
(8)) | BIT(9);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  583  	writew(clk_cfg, base + RP2_=
ASIC_CFG);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  584  =

7d9f49afa451d8 Kevin Cernekee 2013-01-16  585  	/* IRQ routing */
7d9f49afa451d8 Kevin Cernekee 2013-01-16  586  	writel(ALL_PORTS_MASK, base=
 + RP2_CH_IRQ_MASK);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  587  	writel(RP2_ASIC_IRQ_EN_m, b=
ase + RP2_ASIC_IRQ);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  588  }
7d9f49afa451d8 Kevin Cernekee 2013-01-16  589  =

7d9f49afa451d8 Kevin Cernekee 2013-01-16  590  static void rp2_init_card(st=
ruct rp2_card *card)
7d9f49afa451d8 Kevin Cernekee 2013-01-16  591  {
7d9f49afa451d8 Kevin Cernekee 2013-01-16  592  	writel(4, card->bar0 + RP2_=
FPGA_CTL0);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  593  	writel(0, card->bar0 + RP2_=
FPGA_CTL1);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  594  =

7d9f49afa451d8 Kevin Cernekee 2013-01-16  595  	rp2_reset_asic(card, 0);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  596  	if (card->n_ports >=3D PORT=
S_PER_ASIC)
7d9f49afa451d8 Kevin Cernekee 2013-01-16  597  		rp2_reset_asic(card, 1);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  598  =

7d9f49afa451d8 Kevin Cernekee 2013-01-16  599  	writel(RP2_IRQ_MASK_EN_m, c=
ard->bar0 + RP2_IRQ_MASK);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  600  }
7d9f49afa451d8 Kevin Cernekee 2013-01-16  601  =

7d9f49afa451d8 Kevin Cernekee 2013-01-16  602  static void rp2_init_port(st=
ruct rp2_uart_port *up, const struct firmware *fw)
7d9f49afa451d8 Kevin Cernekee 2013-01-16  603  {
7d9f49afa451d8 Kevin Cernekee 2013-01-16  604  	int i;
7d9f49afa451d8 Kevin Cernekee 2013-01-16  605  =

7d9f49afa451d8 Kevin Cernekee 2013-01-16  606  	writel(RP2_UART_CTL_RESET_C=
H_m, up->base + RP2_UART_CTL);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  607  	readl(up->base + RP2_UART_C=
TL);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  608  	udelay(1);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  609  =

7d9f49afa451d8 Kevin Cernekee 2013-01-16  610  	writel(0, up->base + RP2_TX=
RX_CTL);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  611  	writel(0, up->base + RP2_UA=
RT_CTL);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  612  	readl(up->base + RP2_UART_C=
TL);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  613  	udelay(1);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  614  =

7d9f49afa451d8 Kevin Cernekee 2013-01-16  615  	rp2_flush_fifos(up);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  616  =

7d9f49afa451d8 Kevin Cernekee 2013-01-16  617  	for (i =3D 0; i < min_t(int=
, fw->size, RP2_UCODE_BYTES); i++)
7d9f49afa451d8 Kevin Cernekee 2013-01-16 @618  		writeb(fw->data[i], up->uc=
ode + i);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  619  =

7d9f49afa451d8 Kevin Cernekee 2013-01-16  620  	__rp2_uart_set_termios(up, =
CS8 | CREAD | CLOCAL, 0, DEFAULT_BAUD_DIV);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  621  	rp2_uart_set_mctrl(&up->por=
t, 0);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  622  =

7d9f49afa451d8 Kevin Cernekee 2013-01-16  623  	writeb(RP2_RX_FIFO_ena, up-=
>ucode + RP2_RX_FIFO);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  624  	rp2_rmw(up, RP2_UART_CTL, R=
P2_UART_CTL_MODE_m,
7d9f49afa451d8 Kevin Cernekee 2013-01-16  625  		RP2_UART_CTL_XMIT_EN_m | R=
P2_UART_CTL_MODE_rs232);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  626  	rp2_rmw_set(up, RP2_TXRX_CT=
L,
7d9f49afa451d8 Kevin Cernekee 2013-01-16  627  		    RP2_TXRX_CTL_TX_EN_m |=
 RP2_TXRX_CTL_RX_EN_m);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  628  }
7d9f49afa451d8 Kevin Cernekee 2013-01-16  629  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5742392374953349616==--

