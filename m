Content-Type: multipart/mixed; boundary="===============7366204404986697716=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 3/3] tty: serial: use DEFINE_UART_PORT_TX_HELPER_LIMITED()
Date: Sat, 03 Sep 2022 10:15:54 +0800
Message-ID: <202209031027.KQvRt9IN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7366204404986697716==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/t=
ty/serial/mux.c:181:8: sparse: sparse: Trying to use reserved word 'for' as=
 identifier"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220901110657.3305-4-jslaby@suse.cz>
References: <20220901110657.3305-4-jslaby@suse.cz>
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
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: parisc-randconfig-s031-20220901 (https://download.01.org/0day-ci/ar=
chive/20220903/202209031027.KQvRt9IN-lkp(a)intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/f6f99189d77ea45bc72=
efe7393bb91f4eb46a2fb
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jiri-Slaby/tty-TX-helpers/20220901=
-190806
        git checkout f6f99189d77ea45bc72efe7393bb91f4eb46a2fb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dp=
arisc SHELL=3D/bin/bash drivers/tty/serial/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   drivers/tty/serial/mux.c:181:8: sparse: sparse: Expected ) in function d=
eclarator
   drivers/tty/serial/mux.c:181:8: sparse: sparse: got __VA_OPT__
   drivers/tty/serial/mux.c:181:8: sparse: sparse: Expected ) in function d=
eclarator
   drivers/tty/serial/mux.c:181:8: sparse: sparse: got ;
>> drivers/tty/serial/mux.c:181:8: sparse: sparse: Trying to use reserved w=
ord 'for' as identifier
   drivers/tty/serial/mux.c:181:8: sparse: sparse: Expected ; at end of dec=
laration
   drivers/tty/serial/mux.c:181:8: sparse: sparse: got &&
   drivers/tty/serial/mux.c:181:8: sparse: sparse: Expected ) in nested dec=
larator
   drivers/tty/serial/mux.c:181:8: sparse: sparse: got --
   drivers/tty/serial/mux.c:181:8: sparse: sparse: Expected ) in function d=
eclarator
   drivers/tty/serial/mux.c:181:8: sparse: sparse: got (
   drivers/tty/serial/mux.c:181:8: sparse: sparse: Expected ; at end of dec=
laration
   drivers/tty/serial/mux.c:181:8: sparse: sparse: got ->
>> drivers/tty/serial/mux.c:181:8: sparse: sparse: Trying to use reserved w=
ord 'continue' as identifier
   drivers/tty/serial/mux.c:181:8: sparse: sparse: Expected ; at the end of=
 type declaration
   drivers/tty/serial/mux.c:181:8: sparse: sparse: got }
   drivers/tty/serial/mux.c:181:8: sparse: sparse: Expected ) in function d=
eclarator
   drivers/tty/serial/mux.c:181:8: sparse: sparse: got (
   drivers/tty/serial/mux.c:181:8: sparse: sparse: Expected ; at end of dec=
laration
   drivers/tty/serial/mux.c:181:8: sparse: sparse: got ->
   drivers/tty/serial/mux.c:181:8: sparse: sparse: Expected ; at the end of=
 type declaration
   drivers/tty/serial/mux.c:181:8: sparse: sparse: got }
   drivers/tty/serial/mux.c:181:8: sparse: sparse: Expected ) in function d=
eclarator
   drivers/tty/serial/mux.c:181:8: sparse: sparse: got <
>> drivers/tty/serial/mux.c:181:8: sparse: sparse: Trying to use reserved w=
ord 'if' as identifier
   drivers/tty/serial/mux.c:181:8: sparse: sparse: Expected ) in function d=
eclarator
   drivers/tty/serial/mux.c:181:8: sparse: sparse: got =3D=3D
>> drivers/tty/serial/mux.c:181:8: sparse: sparse: Trying to use reserved w=
ord 'if' as identifier
   drivers/tty/serial/mux.c:181:8: sparse: sparse: Expected ; at the end of=
 type declaration
   drivers/tty/serial/mux.c:181:8: sparse: sparse: got }
   drivers/tty/serial/mux.c:181:8: sparse: sparse: Expected ; at the end of=
 type declaration
   drivers/tty/serial/mux.c:181:8: sparse: sparse: got }
   drivers/tty/serial/mux.c:181:8: sparse: sparse: symbol '__raw_writel' re=
declared with different type (different argument counts):
>> drivers/tty/serial/mux.c:181:8: sparse:    int static [signed] [toplevel=
] __raw_writel( ... )
   drivers/tty/serial/mux.c: note: in included file (through include/linux/=
scatterlist.h, include/linux/kfifo.h, include/linux/tty_port.h, ...):
   arch/parisc/include/asm/io.h:159:20: sparse: note: previously declared a=
s:
>> arch/parisc/include/asm/io.h:159:20: sparse:    void static inline [gnu_=
inline] [toplevel] __raw_writel( ... )
   drivers/tty/serial/mux.c:181:8: sparse: sparse: undefined identifier 'xm=
it'
   drivers/tty/serial/mux.c:181:8: sparse: sparse: undefined identifier 'xm=
it'
   drivers/tty/serial/mux.c:181:8: sparse: sparse: symbol 'ch' redeclared w=
ith different type (different type sizes):
>> drivers/tty/serial/mux.c:181:8: sparse:    int [addressable] [toplevel] =
ch
   drivers/tty/serial/mux.c:181:8: sparse: note: previously declared as:
>> drivers/tty/serial/mux.c:181:8: sparse:    unsigned char [addressable] [=
toplevel] [usertype] ch
   drivers/tty/serial/mux.c:181:8: sparse: sparse: symbol '__raw_writel' re=
declared with different type (different argument counts):
>> drivers/tty/serial/mux.c:181:8: sparse:    int static [signed] [toplevel=
] __raw_writel( ... )
   arch/parisc/include/asm/io.h:159:20: sparse: note: previously declared a=
s:
>> arch/parisc/include/asm/io.h:159:20: sparse:    void static inline [gnu_=
inline] [toplevel] __raw_writel( ... )
>> drivers/tty/serial/mux.c:181:8: sparse: sparse: cannot dereference this =
type
>> drivers/tty/serial/mux.c:181:8: sparse: sparse: cannot dereference this =
type
   drivers/tty/serial/mux.c:181:8: sparse: sparse: symbol 'pending' redecla=
red with different type (different signedness):
>> drivers/tty/serial/mux.c:181:8: sparse:    int [addressable] [toplevel] =
pending
   drivers/tty/serial/mux.c:181:8: sparse: note: previously declared as:
>> drivers/tty/serial/mux.c:181:8: sparse:    unsigned int [addressable] [t=
oplevel] pending
>> drivers/tty/serial/mux.c:195:21: sparse: sparse: too many arguments for =
function mux_transmit
>> drivers/tty/serial/mux.c:375:25: sparse: sparse: too many arguments for =
function __raw_writel
   drivers/tty/serial/mux.c:377:17: sparse: sparse: too many arguments for =
function __raw_writel

vim +/for +181 drivers/tty/serial/mux.c

f6f99189d77ea4 drivers/tty/serial/mux.c Jiri Slaby     2022-09-01  180  =

f6f99189d77ea4 drivers/tty/serial/mux.c Jiri Slaby     2022-09-01 @181  sta=
tic DEFINE_UART_PORT_TX_HELPER_LIMITED(mux_transmit, port, ch,
f6f99189d77ea4 drivers/tty/serial/mux.c Jiri Slaby     2022-09-01  182  		t=
rue,
f6f99189d77ea4 drivers/tty/serial/mux.c Jiri Slaby     2022-09-01  183  		U=
ART_PUT_CHAR(port, ch),
f6f99189d77ea4 drivers/tty/serial/mux.c Jiri Slaby     2022-09-01  184  		m=
ux_tx_done(port));
f6f99189d77ea4 drivers/tty/serial/mux.c Jiri Slaby     2022-09-01  185  =

^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  186  /**
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  187   * =
mux_write - Write chars to the mux fifo.
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  188   * =
@port: Ptr to the uart_port.
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  189   *
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  190   * =
This function writes all the data from the uart buffer to
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  191   * =
the mux fifo.
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  192   */
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  193  sta=
tic void mux_write(struct uart_port *port)
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  194  {
f6f99189d77ea4 drivers/tty/serial/mux.c Jiri Slaby     2022-09-01 @195  	mu=
x_transmit(port, port->fifosize - UART_GET_FIFO_CNT(port));
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  196  }
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  197  =

^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  198  /**
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  199   * =
mux_read - Read chars from the mux fifo.
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  200   * =
@port: Ptr to the uart_port.
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  201   *
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  202   * =
This reads all available data from the mux's fifo and pushes
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  203   * =
the data to the tty layer.
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  204   */
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  205  sta=
tic void mux_read(struct uart_port *port)
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  206  {
92a19f9cec9a80 drivers/tty/serial/mux.c Jiri Slaby     2013-01-03  207  	st=
ruct tty_port *tport =3D &port->state->port;
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  208  	in=
t data;
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  209  	__=
u32 start_count =3D port->icount.rx;
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  210  =

^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  211  	wh=
ile(1) {
92495c0ebc99ee drivers/serial/mux.c     Ryan Bradetich 2005-11-17  212  		d=
ata =3D __raw_readl(port->membase + IO_DATA_REG_OFFSET);
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  213  =

^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  214  		i=
f (MUX_STATUS(data))
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  215  			=
continue;
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  216  =

^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  217  		i=
f (MUX_EOFIFO(data))
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  218  			=
break;
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  219  =

^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  220  		p=
ort->icount.rx++;
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  221  =

^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  222  		i=
f (MUX_BREAK(data)) {
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  223  			=
port->icount.brk++;
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  224  			=
if(uart_handle_break(port))
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  225  			=
	continue;
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  226  		}
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  227  =

be577a5220b25e drivers/serial/mux.c     Matthew Wilcox 2006-10-06  228  		i=
f (uart_handle_sysrq_char(port, data & 0xffu))
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  229  			=
continue;
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  230  =

92a19f9cec9a80 drivers/tty/serial/mux.c Jiri Slaby     2013-01-03  231  		t=
ty_insert_flip_char(tport, data & 0xFF, TTY_NORMAL);
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  232  	}
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  233  	=

2e124b4a390ca8 drivers/tty/serial/mux.c Jiri Slaby     2013-01-03  234  	if=
 (start_count !=3D port->icount.rx)
2e124b4a390ca8 drivers/tty/serial/mux.c Jiri Slaby     2013-01-03  235  		t=
ty_flip_buffer_push(tport);
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  236  }
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  237  =

^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  238  /**
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  239   * =
mux_startup - Initialize the port.
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  240   * =
@port: Ptr to the uart_port.
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  241   *
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  242   * =
Grab any resources needed for this port and start the
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  243   * =
mux timer.
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  244   */
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  245  sta=
tic int mux_startup(struct uart_port *port)
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  246  {
4bd5d82779466a drivers/serial/mux.c     Ryan Bradetich 2006-11-03  247  	mu=
x_ports[port->line].enabled =3D 1;
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  248  	re=
turn 0;
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  249  }
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  250  =

^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  251  /**
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  252   * =
mux_shutdown - Disable the port.
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  253   * =
@port: Ptr to the uart_port.
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  254   *
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  255   * =
Release any resources needed for the port.
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  256   */
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  257  sta=
tic void mux_shutdown(struct uart_port *port)
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  258  {
4bd5d82779466a drivers/serial/mux.c     Ryan Bradetich 2006-11-03  259  	mu=
x_ports[port->line].enabled =3D 0;
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  260  }
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  261  =

^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  262  /**
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  263   * =
mux_set_termios - Chane port parameters.
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  264   * =
@port: Ptr to the uart_port.
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  265   * =
@termios: new termios settings.
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  266   * =
@old: old termios settings.
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  267   *
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  268   * =
The Serial Mux does not support this function.
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  269   */
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  270  sta=
tic void
606d099cdd1080 drivers/serial/mux.c     Alan Cox       2006-12-08  271  mux=
_set_termios(struct uart_port *port, struct ktermios *termios,
bec5b814d46c2a drivers/tty/serial/mux.c Ilpo J=C3=A4rvinen  2022-08-16  272=
  	        const struct ktermios *old)
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  273  {
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  274  }
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  275  =

^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  276  /**
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  277   * =
mux_type - Describe the port.
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  278   * =
@port: Ptr to the uart_port.
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  279   *
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  280   * =
Return a pointer to a string constant describing the
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  281   * =
specified port.
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  282   */
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  283  sta=
tic const char *mux_type(struct uart_port *port)
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  284  {
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  285  	re=
turn "Mux";
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  286  }
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  287  =

^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  288  /**
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  289   * =
mux_release_port - Release memory and IO regions.
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  290   * =
@port: Ptr to the uart_port.
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  291   * =

^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  292   * =
Release any memory and IO region resources currently in use by
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  293   * =
the port.
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  294   */
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  295  sta=
tic void mux_release_port(struct uart_port *port)
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  296  {
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  297  }
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  298  =

^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  299  /**
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  300   * =
mux_request_port - Request memory and IO regions.
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  301   * =
@port: Ptr to the uart_port.
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  302   *
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  303   * =
Request any memory and IO region resources required by the port.
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  304   * =
If any fail, no resources should be registered when this function
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  305   * =
returns, and it should return -EBUSY on failure.
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  306   */
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  307  sta=
tic int mux_request_port(struct uart_port *port)
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  308  {
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  309  	re=
turn 0;
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  310  }
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  311  =

^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  312  /**
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  313   * =
mux_config_port - Perform port autoconfiguration.
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  314   * =
@port: Ptr to the uart_port.
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  315   * =
@type: Bitmask of required configurations.
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  316   *
4bd5d82779466a drivers/serial/mux.c     Ryan Bradetich 2006-11-03  317   * =
Perform any autoconfiguration steps for the port.  This function is
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  318   * =
called if the UPF_BOOT_AUTOCONF flag is specified for the port.
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  319   * =
[Note: This is required for now because of a bug in the Serial core.
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  320   * =
 rmk has already submitted a patch to linus, should be available for
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  321   * =
 2.5.47.]
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  322   */
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  323  sta=
tic void mux_config_port(struct uart_port *port, int type)
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  324  {
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  325  	po=
rt->type =3D PORT_MUX;
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  326  }
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  327  =

^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  328  /**
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  329   * =
mux_verify_port - Verify the port information.
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  330   * =
@port: Ptr to the uart_port.
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  331   * =
@ser: Ptr to the serial information.
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  332   *
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  333   * =
Verify the new serial port information contained within serinfo is
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  334   * =
suitable for this port type.
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  335   */
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  336  sta=
tic int mux_verify_port(struct uart_port *port, struct serial_struct *ser)
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  337  {
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  338  	if=
(port->membase =3D=3D NULL)
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  339  		r=
eturn -EINVAL;
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  340  =

^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  341  	re=
turn 0;
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  342  }
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  343  =

^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  344  /**
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  345   * =
mux_drv_poll - Mux poll function.
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  346   * =
@unused: Unused variable
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  347   *
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  348   * =
This function periodically polls the Serial MUX to check for new data.
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  349   */
e99e88a9d2b067 drivers/tty/serial/mux.c Kees Cook      2017-10-16  350  sta=
tic void mux_poll(struct timer_list *unused)
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  351  {  =

^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  352  	in=
t i;
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  353  =

^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  354  	fo=
r(i =3D 0; i < port_cnt; ++i) {
4bd5d82779466a drivers/serial/mux.c     Ryan Bradetich 2006-11-03  355  		i=
f(!mux_ports[i].enabled)
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  356  			=
continue;
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  357  =

4bd5d82779466a drivers/serial/mux.c     Ryan Bradetich 2006-11-03  358  		m=
ux_read(&mux_ports[i].port);
4bd5d82779466a drivers/serial/mux.c     Ryan Bradetich 2006-11-03  359  		m=
ux_write(&mux_ports[i].port);
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  360  	}
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  361  =

^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  362  	mo=
d_timer(&mux_timer, jiffies + MUX_POLL_DELAY);
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  363  }
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  364  =

^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  365  =

^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  366  #if=
def CONFIG_SERIAL_MUX_CONSOLE
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  367  sta=
tic void mux_console_write(struct console *co, const char *s, unsigned coun=
t)
^1da177e4c3f41 drivers/serial/mux.c     Linus Torvalds 2005-04-16  368  {
3de7b6482b4e9a drivers/serial/mux.c     Ryan Bradetich 2006-11-03  369  	/*=
 Wait until the FIFO drains. */
3de7b6482b4e9a drivers/serial/mux.c     Ryan Bradetich 2006-11-03  370  	wh=
ile(UART_GET_FIFO_CNT(&mux_ports[0].port))
3de7b6482b4e9a drivers/serial/mux.c     Ryan Bradetich 2006-11-03  371  		u=
delay(1);
3de7b6482b4e9a drivers/serial/mux.c     Ryan Bradetich 2006-11-03  372  =

3de7b6482b4e9a drivers/serial/mux.c     Ryan Bradetich 2006-11-03  373  	wh=
ile(count--) {
3de7b6482b4e9a drivers/serial/mux.c     Ryan Bradetich 2006-11-03  374  		i=
f(*s =3D=3D '\n') {
3de7b6482b4e9a drivers/serial/mux.c     Ryan Bradetich 2006-11-03 @375  			=
UART_PUT_CHAR(&mux_ports[0].port, '\r');
3de7b6482b4e9a drivers/serial/mux.c     Ryan Bradetich 2006-11-03  376  		}
3de7b6482b4e9a drivers/serial/mux.c     Ryan Bradetich 2006-11-03  377  		U=
ART_PUT_CHAR(&mux_ports[0].port, *s++);
3de7b6482b4e9a drivers/serial/mux.c     Ryan Bradetich 2006-11-03  378  	}
3de7b6482b4e9a drivers/serial/mux.c     Ryan Bradetich 2006-11-03  379  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7366204404986697716==--

