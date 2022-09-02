Content-Type: multipart/mixed; boundary="===============5296909857570943319=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 3/3] tty: serial: use DEFINE_UART_PORT_TX_HELPER_LIMITED()
Date: Fri, 02 Sep 2022 14:54:58 +0800
Message-ID: <202209021457.u7n1jKPI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5296909857570943319==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/t=
ty/serial/apbuart.c:123:8: sparse: sparse: Trying to use reserved word 'for=
' as identifier"
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
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: sparc-randconfig-s043-20220901 (https://download.01.org/0day-ci/arc=
hive/20220902/202209021457.u7n1jKPI-lkp(a)intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.1.0
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
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Ds=
parc SHELL=3D/bin/bash drivers/tty/serial/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   drivers/tty/serial/apbuart.c:123:8: sparse: sparse: Expected ) in functi=
on declarator
   drivers/tty/serial/apbuart.c:123:8: sparse: sparse: got __VA_OPT__
   drivers/tty/serial/apbuart.c:123:8: sparse: sparse: Expected ) in functi=
on declarator
   drivers/tty/serial/apbuart.c:123:8: sparse: sparse: got ;
>> drivers/tty/serial/apbuart.c:123:8: sparse: sparse: Trying to use reserv=
ed word 'for' as identifier
   drivers/tty/serial/apbuart.c:123:8: sparse: sparse: Expected ; at end of=
 declaration
   drivers/tty/serial/apbuart.c:123:8: sparse: sparse: got &&
   drivers/tty/serial/apbuart.c:123:8: sparse: sparse: Expected ) in nested=
 declarator
   drivers/tty/serial/apbuart.c:123:8: sparse: sparse: got --
   drivers/tty/serial/apbuart.c:123:8: sparse: sparse: Expected ) in functi=
on declarator
   drivers/tty/serial/apbuart.c:123:8: sparse: sparse: got ,
   drivers/tty/serial/apbuart.c:123:8: sparse: sparse: Expected ; at end of=
 declaration
   drivers/tty/serial/apbuart.c:123:8: sparse: sparse: got ->
>> drivers/tty/serial/apbuart.c:123:8: sparse: sparse: Trying to use reserv=
ed word 'continue' as identifier
   drivers/tty/serial/apbuart.c:123:8: sparse: sparse: Expected ; at the en=
d of type declaration
   drivers/tty/serial/apbuart.c:123:8: sparse: sparse: got }
   drivers/tty/serial/apbuart.c:123:8: sparse: sparse: Expected ) in functi=
on declarator
   drivers/tty/serial/apbuart.c:123:8: sparse: sparse: got ,
   drivers/tty/serial/apbuart.c:123:8: sparse: sparse: Expected ; at end of=
 declaration
   drivers/tty/serial/apbuart.c:123:8: sparse: sparse: got ->
   drivers/tty/serial/apbuart.c:123:8: sparse: sparse: Expected ; at the en=
d of type declaration
   drivers/tty/serial/apbuart.c:123:8: sparse: sparse: got }
   drivers/tty/serial/apbuart.c:123:8: sparse: sparse: Expected ) in functi=
on declarator
   drivers/tty/serial/apbuart.c:123:8: sparse: sparse: got <
>> drivers/tty/serial/apbuart.c:123:8: sparse: sparse: Trying to use reserv=
ed word 'if' as identifier
   drivers/tty/serial/apbuart.c:123:8: sparse: sparse: Expected ) in functi=
on declarator
   drivers/tty/serial/apbuart.c:123:8: sparse: sparse: got =3D=3D
>> drivers/tty/serial/apbuart.c:123:8: sparse: sparse: Trying to use reserv=
ed word 'if' as identifier
   drivers/tty/serial/apbuart.c:123:8: sparse: sparse: Expected ; at the en=
d of type declaration
   drivers/tty/serial/apbuart.c:123:8: sparse: sparse: got }
   drivers/tty/serial/apbuart.c:123:8: sparse: sparse: Expected ; at the en=
d of type declaration
   drivers/tty/serial/apbuart.c:123:8: sparse: sparse: got }
>> drivers/tty/serial/apbuart.c:130:28: sparse: sparse: too many arguments =
for function apbuart_do_tx_chars
   drivers/tty/serial/apbuart.c:123:8: sparse: sparse: symbol '__raw_writel=
' redeclared with different type (incompatible argument 1 (different base t=
ypes)):
>> drivers/tty/serial/apbuart.c:123:8: sparse:    int static [signed] [topl=
evel] __raw_writel( ... )
   drivers/tty/serial/apbuart.c: note: in included file (through arch/sparc=
/include/asm/io_32.h, arch/sparc/include/asm/io.h, include/linux/scatterlis=
t.h, ...):
   include/asm-generic/io.h:164:20: sparse: note: previously declared as:
>> include/asm-generic/io.h:164:20: sparse:    void static inline [gnu_inli=
ne] [toplevel] __raw_writel( ... )
   drivers/tty/serial/apbuart.c:123:8: sparse: sparse: undefined identifier=
 'xmit'
   drivers/tty/serial/apbuart.c:123:8: sparse: sparse: undefined identifier=
 'xmit'
   drivers/tty/serial/apbuart.c:123:8: sparse: sparse: symbol 'ch' redeclar=
ed with different type (different type sizes):
>> drivers/tty/serial/apbuart.c:123:8: sparse:    int [addressable] [toplev=
el] ch
   drivers/tty/serial/apbuart.c:123:8: sparse: note: previously declared as:
>> drivers/tty/serial/apbuart.c:123:8: sparse:    unsigned char [addressabl=
e] [toplevel] [usertype] ch
   drivers/tty/serial/apbuart.c:123:8: sparse: sparse: symbol '__raw_writel=
' redeclared with different type (incompatible argument 1 (different base t=
ypes)):
>> drivers/tty/serial/apbuart.c:123:8: sparse:    int static [signed] [topl=
evel] __raw_writel( ... )
   include/asm-generic/io.h:164:20: sparse: note: previously declared as:
>> include/asm-generic/io.h:164:20: sparse:    void static inline [gnu_inli=
ne] [toplevel] __raw_writel( ... )
>> drivers/tty/serial/apbuart.c:123:8: sparse: sparse: cannot dereference t=
his type
>> drivers/tty/serial/apbuart.c:123:8: sparse: sparse: cannot dereference t=
his type
   drivers/tty/serial/apbuart.c:123:8: sparse: sparse: symbol 'pending' red=
eclared with different type (different signedness):
>> drivers/tty/serial/apbuart.c:123:8: sparse:    int [addressable] [toplev=
el] pending
   drivers/tty/serial/apbuart.c:123:8: sparse: note: previously declared as:
>> drivers/tty/serial/apbuart.c:123:8: sparse:    unsigned int [addressable=
] [toplevel] pending
>> drivers/tty/serial/apbuart.c:185:9: sparse: sparse: too many arguments f=
or function __raw_writel
   drivers/tty/serial/apbuart.c:198:9: sparse: sparse: too many arguments f=
or function __raw_writel
   drivers/tty/serial/apbuart.c:253:9: sparse: sparse: too many arguments f=
or function __raw_writel
   drivers/tty/serial/apbuart.c:254:9: sparse: sparse: too many arguments f=
or function __raw_writel
   drivers/tty/serial/apbuart.c:338:9: sparse: sparse: too many arguments f=
or function __raw_writel
   drivers/tty/serial/apbuart.c:348:9: sparse: sparse: too many arguments f=
or function __raw_writel
   drivers/tty/serial/apbuart.c:351:9: sparse: sparse: too many arguments f=
or function __raw_writel
   drivers/tty/serial/apbuart.c:362:17: sparse: sparse: too many arguments =
for function __raw_writel
   drivers/tty/serial/apbuart.c:368:9: sparse: sparse: too many arguments f=
or function __raw_writel

vim +/for +123 drivers/tty/serial/apbuart.c

d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
22  =

f6f99189d77ea4 drivers/tty/serial/apbuart.c Jiri Slaby        2022-09-01 @1=
23  static DEFINE_UART_PORT_TX_HELPER_LIMITED(apbuart_do_tx_chars, port, ch,
f6f99189d77ea4 drivers/tty/serial/apbuart.c Jiri Slaby        2022-09-01  1=
24  		true,
f6f99189d77ea4 drivers/tty/serial/apbuart.c Jiri Slaby        2022-09-01  1=
25  		UART_PUT_CHAR(port, ch),
f6f99189d77ea4 drivers/tty/serial/apbuart.c Jiri Slaby        2022-09-01  1=
26  		({}));
f6f99189d77ea4 drivers/tty/serial/apbuart.c Jiri Slaby        2022-09-01  1=
27  =

d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
28  static void apbuart_tx_chars(struct uart_port *port)
d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
29  {
f6f99189d77ea4 drivers/tty/serial/apbuart.c Jiri Slaby        2022-09-01 @1=
30  	apbuart_do_tx_chars(port, port->fifosize >> 1);
d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
31  }
d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
32  =

d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
33  static irqreturn_t apbuart_int(int irq, void *dev_id)
d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
34  {
d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
35  	struct uart_port *port =3D dev_id;
d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
36  	unsigned int status;
d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
37  =

d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
38  	spin_lock(&port->lock);
d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
39  =

d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
40  	status =3D UART_GET_STATUS(port);
d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
41  	if (status & UART_STATUS_DR)
d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
42  		apbuart_rx_chars(port);
d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
43  	if (status & UART_STATUS_THE)
d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
44  		apbuart_tx_chars(port);
d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
45  =

d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
46  	spin_unlock(&port->lock);
d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
47  =

d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
48  	return IRQ_HANDLED;
d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
49  }
d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
50  =

d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
51  static unsigned int apbuart_tx_empty(struct uart_port *port)
d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
52  {
d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
53  	unsigned int status =3D UART_GET_STATUS(port);
d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
54  	return status & UART_STATUS_THE ? TIOCSER_TEMT : 0;
d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
55  }
d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
56  =

d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
57  static unsigned int apbuart_get_mctrl(struct uart_port *port)
d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
58  {
d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
59  	/* The GRLIB APBUART handles flow control in hardware */
d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
60  	return TIOCM_CAR | TIOCM_DSR | TIOCM_CTS;
d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
61  }
d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
62  =

d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
63  static void apbuart_set_mctrl(struct uart_port *port, unsigned int mctr=
l)
d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
64  {
d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
65  	/* The GRLIB APBUART handles flow control in hardware */
d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
66  }
d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
67  =

d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
68  static void apbuart_break_ctl(struct uart_port *port, int break_state)
d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
69  {
d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
70  	/* We don't support sending break */
d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
71  }
d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
72  =

d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
73  static int apbuart_startup(struct uart_port *port)
d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
74  {
d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
75  	int retval;
d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
76  	unsigned int cr;
d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
77  =

d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
78  	/* Allocate the IRQ */
d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
79  	retval =3D request_irq(port->irq, apbuart_int, 0, "apbuart", port);
d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
80  	if (retval)
d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
81  		return retval;
d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
82  =

d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
83  	/* Finally, enable interrupts */
d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
84  	cr =3D UART_GET_CTRL(port);
d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04 @1=
85  	UART_PUT_CTRL(port,
d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
86  		      cr | UART_CTRL_RE | UART_CTRL_TE |
d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
87  		      UART_CTRL_RI | UART_CTRL_TI);
d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
88  =

d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
89  	return 0;
d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
90  }
d4ac42a582e46d drivers/serial/apbuart.c     Kristoffer Glembo 2009-11-04  1=
91  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5296909857570943319==--

