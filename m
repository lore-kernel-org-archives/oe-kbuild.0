Content-Type: multipart/mixed; boundary="===============8829818090294452570=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 3/3] tty: serial: use DEFINE_UART_PORT_TX_HELPER_LIMITED()
Date: Fri, 02 Sep 2022 07:45:01 +0800
Message-ID: <202209020730.zFLAGT0F-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8829818090294452570==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/t=
ty/serial/rp2.c:428:8: sparse:    int static [signed] [toplevel] writeb( ..=
. )"
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
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: loongarch-randconfig-s053-20220901 (https://download.01.org/0day-ci=
/archive/20220902/202209020730.zFLAGT0F-lkp(a)intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
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
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dl=
oongarch SHELL=3D/bin/bash drivers/tty/serial/

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
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: Expected ) in function d=
eclarator
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: got (
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: Expected ; at end of dec=
laration
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: got ->
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: Trying to use reserved w=
ord 'continue' as identifier
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: Expected ; at the end of=
 type declaration
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: got }
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: Expected ) in function d=
eclarator
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: got (
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
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: symbol 'writeb' redeclar=
ed with different type (incompatible argument 1 (different base types)):
>> drivers/tty/serial/rp2.c:428:8: sparse:    int static [signed] [toplevel=
] writeb( ... )
   drivers/tty/serial/rp2.c: note: in included file (through arch/loongarch=
/include/asm/io.h, include/linux/io.h):
   include/asm-generic/io.h:249:20: sparse: note: previously declared as:
   include/asm-generic/io.h:249:20: sparse:    void static inline [gnu_inli=
ne] [toplevel] writeb( ... )
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
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: symbol 'writeb' redeclar=
ed with different type (incompatible argument 1 (different base types)):
>> drivers/tty/serial/rp2.c:428:8: sparse:    int static [signed] [toplevel=
] writeb( ... )
   include/asm-generic/io.h:249:20: sparse: note: previously declared as:
   include/asm-generic/io.h:249:20: sparse:    void static inline [gnu_inli=
ne] [toplevel] writeb( ... )
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
>> drivers/tty/serial/altera_jtaguart.c:137:8: sparse:    int static [signe=
d] [toplevel] writel( ... )
   drivers/tty/serial/altera_jtaguart.c: note: in included file (through ar=
ch/loongarch/include/asm/io.h, include/linux/io.h, include/linux/irq.h, ...=
):
   include/asm-generic/io.h:273:20: sparse: note: previously declared as:
>> include/asm-generic/io.h:273:20: sparse:    void static inline [gnu_inli=
ne] [toplevel] writel( ... )
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
>> drivers/tty/serial/altera_jtaguart.c:137:8: sparse:    int static [signe=
d] [toplevel] writel( ... )
   include/asm-generic/io.h:273:20: sparse: note: previously declared as:
>> include/asm-generic/io.h:273:20: sparse:    void static inline [gnu_inli=
ne] [toplevel] writel( ... )
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

vim +428 drivers/tty/serial/rp2.c

7d9f49afa451d85 Kevin Cernekee 2013-01-16  427  =

f6f99189d77ea45 Jiri Slaby     2022-09-01 @428  static DEFINE_UART_PORT_TX_=
HELPER_LIMITED(rp2_tx_chars, port, ch,
f6f99189d77ea45 Jiri Slaby     2022-09-01  429  		true,
f6f99189d77ea45 Jiri Slaby     2022-09-01  430  		writeb(ch, port_to_up(por=
t)->base + RP2_DATA_BYTE),
f6f99189d77ea45 Jiri Slaby     2022-09-01  431  		({}));
7d9f49afa451d85 Kevin Cernekee 2013-01-16  432  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8829818090294452570==--

