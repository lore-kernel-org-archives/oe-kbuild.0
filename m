Content-Type: multipart/mixed; boundary="===============2489447556375330201=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 3/3] tty: serial: use DEFINE_UART_PORT_TX_HELPER_LIMITED()
Date: Fri, 02 Sep 2022 10:19:22 +0800
Message-ID: <202209021004.UjqqVdjR-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2489447556375330201==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/t=
ty/serial/sifive.c:766:28: sparse: sparse: too many arguments for function =
__ssp_transmit_char"
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
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: i386-randconfig-s001 (https://download.01.org/0day-ci/archive/20220=
902/202209021004.UjqqVdjR-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0
reproduce:
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
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Di386 SHELL=3D/bin/bash drivers/tty/serial/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: Expected ) in functio=
n declarator
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: got __VA_OPT__
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: Expected ) in functio=
n declarator
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: got ;
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: Trying to use reserve=
d word 'for' as identifier
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: Expected ; at end of =
declaration
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: got &&
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: Expected ) in nested =
declarator
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: got --
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: Expected ) in functio=
n declarator
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: got (
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: undefined identifier =
'port'
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: undefined identifier =
'port'
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: Expected ) in nested =
declarator
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: got sifive_serial_port
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: Trying to use reserve=
d word 'struct' as identifier
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: Expected ; at the end=
 of type declaration
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: got }
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: Expected ; at end of =
declaration
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: got ->
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: Trying to use reserve=
d word 'continue' as identifier
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: Expected ; at the end=
 of type declaration
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: got }
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: Expected ) in functio=
n declarator
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: got (
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: cannot dereference th=
is type
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: cannot dereference th=
is type
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: Expected ) in nested =
declarator
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: got sifive_serial_port
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: Trying to use reserve=
d word 'struct' as identifier
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: Expected ; at the end=
 of type declaration
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: got }
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: Expected ; at end of =
declaration
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: got ->
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: Expected ; at the end=
 of type declaration
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: got }
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: Expected ) in functio=
n declarator
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: got <
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: Trying to use reserve=
d word 'if' as identifier
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: Expected ) in functio=
n declarator
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: got =3D=3D
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: Trying to use reserve=
d word 'if' as identifier
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: Expected ; at the end=
 of type declaration
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: got }
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: Expected ;@the end=
 of type declaration
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: got }
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: symbol '__ssp_transmi=
t_char' redeclared with different type (different argument counts):
   drivers/tty/serial/sifive.c:280:8: sparse:    int static [signed] [tople=
vel] __ssp_transmit_char( ... )
   drivers/tty/serial/sifive.c:275:13: sparse: note: previously declared as:
   drivers/tty/serial/sifive.c:275:13: sparse:    void static [toplevel] __=
ssp_transmit_char( ... )
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: undefined identifier =
'xmit'
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: undefined identifier =
'xmit'
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: symbol 'ch' redeclare=
d with different type (different type sizes):
   drivers/tty/serial/sifive.c:280:8: sparse:    int [addressable] [topleve=
l] ch
   drivers/tty/serial/sifive.c:280:8: sparse: note: previously declared as:
   drivers/tty/serial/sifive.c:280:8: sparse:    unsigned char [addressable=
] [toplevel] [usertype] ch
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: symbol '__ssp_transmi=
t_char' redeclared with different type (different argument counts):
   drivers/tty/serial/sifive.c:280:8: sparse:    int static [signed] [tople=
vel] __ssp_transmit_char( ... )
   drivers/tty/serial/sifive.c:275:13: sparse: note: previously declared as:
   drivers/tty/serial/sifive.c:275:13: sparse:    void static [toplevel] __=
ssp_transmit_char( ... )
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: cannot dereference th=
is type
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: cannot dereference th=
is type
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: symbol 'pending' rede=
clared with different type (different signedness):
   drivers/tty/serial/sifive.c:280:8: sparse:    int [addressable] [topleve=
l] pending
   drivers/tty/serial/sifive.c:280:8: sparse: note: previously declared as:
   drivers/tty/serial/sifive.c:280:8: sparse:    unsigned int [addressable]=
 [toplevel] pending
   drivers/tty/serial/sifive.c:521:37: sparse: sparse: too many arguments f=
or function __ssp_transmit_chars
>> drivers/tty/serial/sifive.c:766:28: sparse: sparse: too many arguments f=
or function __ssp_transmit_char
--
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: Expected ) i=
n function declarator
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: got __VA_OPT=
__
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: Expected ) i=
n function declarator
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: got ;
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: Trying to us=
e reserved word 'for' as identifier
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: Expected ; a=
t end of declaration
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: got &&
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: Expected ) i=
n nested declarator
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: got --
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: Expected ) i=
n function declarator
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: got ->
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: Expected ; a=
t end of declaration
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: got ->
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: Trying to us=
e reserved word 'continue' as identifier
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: Expected ; a=
t the end of type declaration
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: got }
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: Expected ) i=
n function declarator
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: got ->
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: Expected ; a=
t end of declaration
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: got ->
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: Expected ; a=
t the end of type declaration
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: got }
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: Expected ) i=
n function declarator
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: got <
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: Trying to us=
e reserved word 'if' as identifier
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: Expected ) i=
n function declarator
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: got =3D=3D
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: Trying to us=
e reserved word 'if' as identifier
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: Expected ; a=
t the end of type declaration
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: got }
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: Expected ; a=
t the end of type declaration
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: got }
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: symbol 'writ=
el' redeclared with different type (incompatible argument 1 (different base=
 types)):
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse:    int static [signe=
d] [toplevel] writel( ... )
   drivers/tty/serial/altera_jtaguart.c: note: in included file (through in=
clude/linux/scatterlist.h, include/linux/kfifo.h, include/linux/tty_port.h,=
 ...):
   arch/x86/include/asm/io.h:69:1: sparse: note: previously declared as:
>> arch/x86/include/asm/io.h:69:1: sparse:    void static inline [gnu_inlin=
e] [toplevel] writel( ... )
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: undefined id=
entifier 'xmit'
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: undefined id=
entifier 'xmit'
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: symbol 'ch' =
redeclared with different type (different type sizes):
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse:    int [addressable]=
 [toplevel] ch
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: note: previously dec=
lared as:
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse:    unsigned char [ad=
dressable] [toplevel] [usertype] ch
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: symbol 'writ=
el' redeclared with different type (incompatible argument 1 (different base=
 types)):
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse:    int static [signe=
d] [toplevel] writel( ... )
   arch/x86/include/asm/io.h:69:1: sparse: note: previously declared as:
>> arch/x86/include/asm/io.h:69:1: sparse:    void static inline [gnu_inlin=
e] [toplevel] writel( ... )
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: cannot deref=
erence this type
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: cannot deref=
erence this type
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: symbol 'pend=
ing' redeclared with different type (different signedness):
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse:    int [addressable]=
 [toplevel] pending
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: note: previously dec=
lared as:
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse:    unsigned int [add=
ressable] [toplevel] pending
   drivers/tty/serial/altera_jtaguart.c:150:36: sparse: sparse: too many ar=
guments for function altera_jtaguart_do_tx_chars

vim +766 drivers/tty/serial/sifive.c

45c054d0815b15 Paul Walmsley 2019-04-12  760  =

3f8bab174cb26a Jiri Slaby    2022-03-03  761  static void sifive_serial_con=
sole_putchar(struct uart_port *port, unsigned char ch)
45c054d0815b15 Paul Walmsley 2019-04-12  762  {
45c054d0815b15 Paul Walmsley 2019-04-12  763  	struct sifive_serial_port *s=
sp =3D port_to_sifive_serial_port(port);
45c054d0815b15 Paul Walmsley 2019-04-12  764  =

45c054d0815b15 Paul Walmsley 2019-04-12  765  	__ssp_wait_for_xmitr(ssp);
45c054d0815b15 Paul Walmsley 2019-04-12 @766  	__ssp_transmit_char(ssp, ch);
45c054d0815b15 Paul Walmsley 2019-04-12  767  }
45c054d0815b15 Paul Walmsley 2019-04-12  768  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2489447556375330201==--

