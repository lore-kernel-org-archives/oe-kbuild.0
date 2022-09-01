Content-Type: multipart/mixed; boundary="===============3954364656416041384=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 3/3] tty: serial: use DEFINE_UART_PORT_TX_HELPER_LIMITED()
Date: Fri, 02 Sep 2022 06:43:46 +0800
Message-ID: <202209020604.lkQbCJHY-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3954364656416041384==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/t=
ty/serial/rp2.c:428:8: sparse: sparse: Trying to use reserved word 'for' as=
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
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: alpha-randconfig-s042-20220901 (https://download.01.org/0day-ci/arc=
hive/20220902/202209020604.lkQbCJHY-lkp(a)intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
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
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Da=
lpha SHELL=3D/bin/bash drivers/tty/serial/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: Expected ) in function d=
eclarator
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: got __VA_OPT__
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: Expected ) in function d=
eclarator
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: got ;
>> drivers/tty/serial/rp2.c:428:8: sparse: sparse: Trying to use reserved w=
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
>> drivers/tty/serial/rp2.c:428:8: sparse: sparse: Trying to use reserved w=
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
>> drivers/tty/serial/rp2.c:428:8: sparse: sparse: Trying to use reserved w=
ord 'if' as identifier
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: Expected ) in function d=
eclarator
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: got =3D=3D
>> drivers/tty/serial/rp2.c:428:8: sparse: sparse: Trying to use reserved w=
ord 'if' as identifier
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: Expected ; at the end of=
 type declaration
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: got }
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: Expected ; at the end of=
 type declaration
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: got }
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: undefined identifier 'xm=
it'
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: undefined identifier 'xm=
it'
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: symbol 'ch' redeclared w=
ith different type (different type sizes):
>> drivers/tty/serial/rp2.c:428:8: sparse:    int [addressable] [toplevel] =
ch
   drivers/tty/serial/rp2.c:428:8: sparse: note: previously declared as:
>> drivers/tty/serial/rp2.c:428:8: sparse:    unsigned char [addressable] [=
toplevel] [usertype] ch
>> drivers/tty/serial/rp2.c:428:8: sparse: sparse: cannot dereference this =
type
>> drivers/tty/serial/rp2.c:428:8: sparse: sparse: cannot dereference this =
type
   drivers/tty/serial/rp2.c:428:8: sparse: sparse: symbol 'pending' redecla=
red with different type (different signedness):
>> drivers/tty/serial/rp2.c:428:8: sparse:    int [addressable] [toplevel] =
pending
   drivers/tty/serial/rp2.c:428:8: sparse: note: previously declared as:
>> drivers/tty/serial/rp2.c:428:8: sparse:    unsigned int [addressable] [t=
oplevel] pending
>> drivers/tty/serial/rp2.c:449:29: sparse: sparse: too many arguments for =
function rp2_tx_chars
--
   drivers/tty/serial/st-asc.c:233:8: sparse: sparse: Expected ) in functio=
n declarator
   drivers/tty/serial/st-asc.c:233:8: sparse: sparse: got __VA_OPT__
   drivers/tty/serial/st-asc.c:233:8: sparse: sparse: Expected ) in functio=
n declarator
   drivers/tty/serial/st-asc.c:233:8: sparse: sparse: got ;
>> drivers/tty/serial/st-asc.c:233:8: sparse: sparse: Trying to use reserve=
d word 'for' as identifier
   drivers/tty/serial/st-asc.c:233:8: sparse: sparse: Expected ; at end of =
declaration
   drivers/tty/serial/st-asc.c:233:8: sparse: sparse: got &&
   drivers/tty/serial/st-asc.c:233:8: sparse: sparse: Expected ) in nested =
declarator
   drivers/tty/serial/st-asc.c:233:8: sparse: sparse: got --
   drivers/tty/serial/st-asc.c:233:8: sparse: sparse: Expected ) in functio=
n declarator
   drivers/tty/serial/st-asc.c:233:8: sparse: sparse: got ,
   drivers/tty/serial/st-asc.c:233:8: sparse: sparse: Expected ; at end of =
declaration
   drivers/tty/serial/st-asc.c:233:8: sparse: sparse: got ->
>> drivers/tty/serial/st-asc.c:233:8: sparse: sparse: Trying to use reserve=
d word 'continue' as identifier
   drivers/tty/serial/st-asc.c:233:8: sparse: sparse: Expected ; at the end=
 of type declaration
   drivers/tty/serial/st-asc.c:233:8: sparse: sparse: got }
   drivers/tty/serial/st-asc.c:233:8: sparse: sparse: Expected ) in functio=
n declarator
   drivers/tty/serial/st-asc.c:233:8: sparse: sparse: got ,
   drivers/tty/serial/st-asc.c:233:8: sparse: sparse: Expected ; at end of =
declaration
   drivers/tty/serial/st-asc.c:233:8: sparse: sparse: got ->
   drivers/tty/serial/st-asc.c:233:8: sparse: sparse: Expected ; at the end=
 of type declaration
   drivers/tty/serial/st-asc.c:233:8: sparse: sparse: got }
   drivers/tty/serial/st-asc.c:233:8: sparse: sparse: Expected ) in functio=
n declarator
   drivers/tty/serial/st-asc.c:233:8: sparse: sparse: got <
>> drivers/tty/serial/st-asc.c:233:8: sparse: sparse: Trying to use reserve=
d word 'if' as identifier
   drivers/tty/serial/st-asc.c:233:8: sparse: sparse: Expected ) in functio=
n declarator
   drivers/tty/serial/st-asc.c:233:8: sparse: sparse: got =3D=3D
>> drivers/tty/serial/st-asc.c:233:8: sparse: sparse: Trying to use reserve=
d word 'if' as identifier
   drivers/tty/serial/st-asc.c:233:8: sparse: sparse: Expected ; at the end=
 of type declaration
   drivers/tty/serial/st-asc.c:233:8: sparse: sparse: got }
   drivers/tty/serial/st-asc.c:233:8: sparse: sparse: Expected ; at the end=
 of type declaration
   drivers/tty/serial/st-asc.c:233:8: sparse: sparse: got }
   drivers/tty/serial/st-asc.c:233:8: sparse: sparse: symbol 'asc_out' rede=
clared with different type (incompatible argument 1 (different base types)):
>> drivers/tty/serial/st-asc.c:233:8: sparse:    int static [signed] [tople=
vel] asc_out( ... )
   drivers/tty/serial/st-asc.c:160:20: sparse: note: previously declared as:
>> drivers/tty/serial/st-asc.c:160:20: sparse:    void static inline [gnu_i=
nline] [toplevel] asc_out( ... )
   drivers/tty/serial/st-asc.c:233:8: sparse: sparse: undefined identifier =
'xmit'
   drivers/tty/serial/st-asc.c:233:8: sparse: sparse: undefined identifier =
'xmit'
   drivers/tty/serial/st-asc.c:233:8: sparse: sparse: symbol 'ch' redeclare=
d with different type (different type sizes):
>> drivers/tty/serial/st-asc.c:233:8: sparse:    int [addressable] [topleve=
l] ch
   drivers/tty/serial/st-asc.c:233:8: sparse: note: previously declared as:
>> drivers/tty/serial/st-asc.c:233:8: sparse:    unsigned char [addressable=
] [toplevel] [usertype] ch
   drivers/tty/serial/st-asc.c:233:8: sparse: sparse: symbol 'asc_out' rede=
clared with different type (incompatible argument 1 (different base types)):
>> drivers/tty/serial/st-asc.c:233:8: sparse:    int static [signed] [tople=
vel] asc_out( ... )
   drivers/tty/serial/st-asc.c:160:20: sparse: note: previously declared as:
>> drivers/tty/serial/st-asc.c:160:20: sparse:    void static inline [gnu_i=
nline] [toplevel] asc_out( ... )
>> drivers/tty/serial/st-asc.c:233:8: sparse: sparse: cannot dereference th=
is type
>> drivers/tty/serial/st-asc.c:233:8: sparse: sparse: cannot dereference th=
is type
   drivers/tty/serial/st-asc.c:233:8: sparse: sparse: symbol 'pending' rede=
clared with different type (different signedness):
>> drivers/tty/serial/st-asc.c:233:8: sparse:    int [addressable] [topleve=
l] pending
   drivers/tty/serial/st-asc.c:233:8: sparse: note: previously declared as:
>> drivers/tty/serial/st-asc.c:233:8: sparse:    unsigned int [addressable]=
 [toplevel] pending
>> drivers/tty/serial/st-asc.c:245:30: sparse: sparse: too many arguments f=
or function asc_do_transmit_chars
>> drivers/tty/serial/st-asc.c:457:24: sparse: sparse: too many arguments f=
or function asc_out
   drivers/tty/serial/st-asc.c:489:16: sparse: sparse: too many arguments f=
or function asc_out
   drivers/tty/serial/st-asc.c:493:16: sparse: sparse: too many arguments f=
or function asc_out
   drivers/tty/serial/st-asc.c:494:16: sparse: sparse: too many arguments f=
or function asc_out
   drivers/tty/serial/st-asc.c:543:24: sparse: sparse: too many arguments f=
or function asc_out
   drivers/tty/serial/st-asc.c:557:24: sparse: sparse: too many arguments f=
or function asc_out
   drivers/tty/serial/st-asc.c:592:16: sparse: sparse: too many arguments f=
or function asc_out
   drivers/tty/serial/st-asc.c:595:16: sparse: sparse: too many arguments f=
or function asc_out
--
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: Expected ) i=
n function declarator
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: got __VA_OPT=
__
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: Expected ) i=
n function declarator
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: got ;
>> drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: Trying to us=
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
>> drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: Trying to us=
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
>> drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: Trying to us=
e reserved word 'if' as identifier
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: Expected ) i=
n function declarator
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: got =3D=3D
>> drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: Trying to us=
e reserved word 'if' as identifier
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: Expected ; a=
t the end of type declaration
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: got }
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: Expected ; a=
t the end of type declaration
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: got }
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: undefined id=
entifier 'xmit'
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: undefined id=
entifier 'xmit'
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: symbol 'ch' =
redeclared with different type (different type sizes):
>> drivers/tty/serial/altera_jtaguart.c:137:8: sparse:    int [addressable]=
 [toplevel] ch
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: note: previously dec=
lared as:
>> drivers/tty/serial/altera_jtaguart.c:137:8: sparse:    unsigned char [ad=
dressable] [toplevel] [usertype] ch
>> drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: cannot deref=
erence this type
>> drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: cannot deref=
erence this type
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: symbol 'pend=
ing' redeclared with different type (different signedness):
>> drivers/tty/serial/altera_jtaguart.c:137:8: sparse:    int [addressable]=
 [toplevel] pending
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: note: previously dec=
lared as:
>> drivers/tty/serial/altera_jtaguart.c:137:8: sparse:    unsigned int [add=
ressable] [toplevel] pending
>> drivers/tty/serial/altera_jtaguart.c:150:36: sparse: sparse: too many ar=
guments for function altera_jtaguart_do_tx_chars
--
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: Expected ) in fun=
ction declarator
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: got __VA_OPT__
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: Expected ) in fun=
ction declarator
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: got ;
>> drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: Trying to use res=
erved word 'for' as identifier
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: Expected ; at end=
 of declaration
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: got &&
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: Expected ) in nes=
ted declarator
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: got --
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: Expected ) in fun=
ction declarator
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: got ->
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: Expected ; at end=
 of declaration
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: got ->
>> drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: Trying to use res=
erved word 'continue' as identifier
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: got }
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: Expected ) in fun=
ction declarator
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: got ->
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: Expected ; at end=
 of declaration
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: got ->
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: got }
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: Expected ) in fun=
ction declarator
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: got <
>> drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: Trying to use res=
erved word 'if' as identifier
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: Expected ) in fun=
ction declarator
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: got =3D=3D
>> drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: Trying to use res=
erved word 'if' as identifier
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: got }
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: got }
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: undefined identif=
ier 'xmit'
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: undefined identif=
ier 'xmit'
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: symbol 'ch' redec=
lared with different type (different type sizes):
>> drivers/tty/serial/amba-pl010.c:165:8: sparse:    int [addressable] [top=
level] ch
   drivers/tty/serial/amba-pl010.c:165:8: sparse: note: previously declared=
 as:
>> drivers/tty/serial/amba-pl010.c:165:8: sparse:    unsigned char [address=
able] [toplevel] [usertype] ch
>> drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: cannot dereferenc=
e this type
>> drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: cannot dereferenc=
e this type
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: symbol 'pending' =
redeclared with different type (different signedness):
>> drivers/tty/serial/amba-pl010.c:165:8: sparse:    int [addressable] [top=
level] pending
   drivers/tty/serial/amba-pl010.c:165:8: sparse: note: previously declared=
 as:
>> drivers/tty/serial/amba-pl010.c:165:8: sparse:    unsigned int [addressa=
ble] [toplevel] pending
>> drivers/tty/serial/amba-pl010.c:214:47: sparse: sparse: too many argumen=
ts for function pl010_tx_chars
--
   drivers/tty/serial/bcm63xx_uart.c:300:8: sparse: sparse: Expected ) in f=
unction declarator
   drivers/tty/serial/bcm63xx_uart.c:300:8: sparse: sparse: got __VA_OPT__
   drivers/tty/serial/bcm63xx_uart.c:300:8: sparse: sparse: Expected ) in f=
unction declarator
   drivers/tty/serial/bcm63xx_uart.c:300:8: sparse: sparse: got ;
>> drivers/tty/serial/bcm63xx_uart.c:300:8: sparse: sparse: Trying to use r=
eserved word 'for' as identifier
   drivers/tty/serial/bcm63xx_uart.c:300:8: sparse: sparse: Expected ; at e=
nd of declaration
   drivers/tty/serial/bcm63xx_uart.c:300:8: sparse: sparse: got &&
   drivers/tty/serial/bcm63xx_uart.c:300:8: sparse: sparse: Expected ) in n=
ested declarator
   drivers/tty/serial/bcm63xx_uart.c:300:8: sparse: sparse: got --
   drivers/tty/serial/bcm63xx_uart.c:300:8: sparse: sparse: Expected ) in f=
unction declarator
   drivers/tty/serial/bcm63xx_uart.c:300:8: sparse: sparse: got ,
   drivers/tty/serial/bcm63xx_uart.c:300:8: sparse: sparse: Expected ; at e=
nd of declaration
   drivers/tty/serial/bcm63xx_uart.c:300:8: sparse: sparse: got ->
>> drivers/tty/serial/bcm63xx_uart.c:300:8: sparse: sparse: Trying to use r=
eserved word 'continue' as identifier
   drivers/tty/serial/bcm63xx_uart.c:300:8: sparse: sparse: Expected ; at t=
he end of type declaration
   drivers/tty/serial/bcm63xx_uart.c:300:8: sparse: sparse: got }
   drivers/tty/serial/bcm63xx_uart.c:300:8: sparse: sparse: Expected ) in f=
unction declarator
   drivers/tty/serial/bcm63xx_uart.c:300:8: sparse: sparse: got ,
   drivers/tty/serial/bcm63xx_uart.c:300:8: sparse: sparse: Expected ; at e=
nd of declaration
   drivers/tty/serial/bcm63xx_uart.c:300:8: sparse: sparse: got ->
   drivers/tty/serial/bcm63xx_uart.c:300:8: sparse: sparse: Expected ; at t=
he end of type declaration
   drivers/tty/serial/bcm63xx_uart.c:300:8: sparse: sparse: got }
   drivers/tty/serial/bcm63xx_uart.c:300:8: sparse: sparse: Expected ) in f=
unction declarator
   drivers/tty/serial/bcm63xx_uart.c:300:8: sparse: sparse: got <
>> drivers/tty/serial/bcm63xx_uart.c:300:8: sparse: sparse: Trying to use r=
eserved word 'if' as identifier
   drivers/tty/serial/bcm63xx_uart.c:300:8: sparse: sparse: Expected ) in f=
unction declarator
   drivers/tty/serial/bcm63xx_uart.c:300:8: sparse: sparse: got =3D=3D
>> drivers/tty/serial/bcm63xx_uart.c:300:8: sparse: sparse: Trying to use r=
eserved word 'if' as identifier
   drivers/tty/serial/bcm63xx_uart.c:300:8: sparse: sparse: Expected ; at t=
he end of type declaration
   drivers/tty/serial/bcm63xx_uart.c:300:8: sparse: sparse: got }
   drivers/tty/serial/bcm63xx_uart.c:300:8: sparse: sparse: Expected ; at t=
he end of type declaration
   drivers/tty/serial/bcm63xx_uart.c:300:8: sparse: sparse: got }
   drivers/tty/serial/bcm63xx_uart.c:300:8: sparse: sparse: symbol 'bcm_uar=
t_writel' redeclared with different type (incompatible argument 1 (differen=
t base types)):
>> drivers/tty/serial/bcm63xx_uart.c:300:8: sparse:    int static [signed] =
[toplevel] bcm_uart_writel( ... )
   drivers/tty/serial/bcm63xx_uart.c:79:20: sparse: note: previously declar=
ed as:
>> drivers/tty/serial/bcm63xx_uart.c:79:20: sparse:    void static inline [=
gnu_inline] [toplevel] bcm_uart_writel( ... )
   drivers/tty/serial/bcm63xx_uart.c:300:8: sparse: sparse: undefined ident=
ifier 'xmit'
   drivers/tty/serial/bcm63xx_uart.c:300:8: sparse: sparse: undefined ident=
ifier 'xmit'
   drivers/tty/serial/bcm63xx_uart.c:300:8: sparse: sparse: symbol 'ch' red=
eclared with different type (different type sizes):
>> drivers/tty/serial/bcm63xx_uart.c:300:8: sparse:    int [addressable] [t=
oplevel] ch
   drivers/tty/serial/bcm63xx_uart.c:300:8: sparse: note: previously declar=
ed as:
>> drivers/tty/serial/bcm63xx_uart.c:300:8: sparse:    unsigned char [addre=
ssable] [toplevel] [usertype] ch
   drivers/tty/serial/bcm63xx_uart.c:300:8: sparse: sparse: symbol 'bcm_uar=
t_writel' redeclared with different type (incompatible argument 1 (differen=
t base types)):
>> drivers/tty/serial/bcm63xx_uart.c:300:8: sparse:    int static [signed] =
[toplevel] bcm_uart_writel( ... )
   drivers/tty/serial/bcm63xx_uart.c:79:20: sparse: note: previously declar=
ed as:
>> drivers/tty/serial/bcm63xx_uart.c:79:20: sparse:    void static inline [=
gnu_inline] [toplevel] bcm_uart_writel( ... )
>> drivers/tty/serial/bcm63xx_uart.c:300:8: sparse: sparse: cannot derefere=
nce this type
>> drivers/tty/serial/bcm63xx_uart.c:300:8: sparse: sparse: cannot derefere=
nce this type
   drivers/tty/serial/bcm63xx_uart.c:300:8: sparse: sparse: symbol 'pending=
' redeclared with different type (different signedness):
>> drivers/tty/serial/bcm63xx_uart.c:300:8: sparse:    int [addressable] [t=
oplevel] pending
   drivers/tty/serial/bcm63xx_uart.c:300:8: sparse: note: previously declar=
ed as:
>> drivers/tty/serial/bcm63xx_uart.c:300:8: sparse:    unsigned int [addres=
sable] [toplevel] pending
>> drivers/tty/serial/bcm63xx_uart.c:316:30: sparse: sparse: too many argum=
ents for function bcm_uart_tx
>> drivers/tty/serial/bcm63xx_uart.c:323:24: sparse: sparse: too many argum=
ents for function bcm_uart_writel
   drivers/tty/serial/bcm63xx_uart.c:369:24: sparse: sparse: too many argum=
ents for function bcm_uart_writel
   drivers/tty/serial/bcm63xx_uart.c:382:24: sparse: sparse: too many argum=
ents for function bcm_uart_writel
   drivers/tty/serial/bcm63xx_uart.c:395:24: sparse: sparse: too many argum=
ents for function bcm_uart_writel
   drivers/tty/serial/bcm63xx_uart.c:412:24: sparse: sparse: too many argum=
ents for function bcm_uart_writel
   drivers/tty/serial/bcm63xx_uart.c:423:24: sparse: sparse: too many argum=
ents for function bcm_uart_writel
   drivers/tty/serial/bcm63xx_uart.c:429:24: sparse: sparse: too many argum=
ents for function bcm_uart_writel
   drivers/tty/serial/bcm63xx_uart.c:435:24: sparse: sparse: too many argum=
ents for function bcm_uart_writel
   drivers/tty/serial/bcm63xx_uart.c:442:24: sparse: sparse: too many argum=
ents for function bcm_uart_writel
   drivers/tty/serial/bcm63xx_uart.c:455:24: sparse: sparse: too many argum=
ents for function bcm_uart_writel
   drivers/tty/serial/bcm63xx_uart.c:514:24: sparse: sparse: too many argum=
ents for function bcm_uart_writel
   drivers/tty/serial/bcm63xx_uart.c:519:24: sparse: sparse: too many argum=
ents for function bcm_uart_writel
   drivers/tty/serial/bcm63xx_uart.c:528:24: sparse: sparse: too many argum=
ents for function bcm_uart_writel

vim +/for +428 drivers/tty/serial/rp2.c

7d9f49afa451d8 Kevin Cernekee 2013-01-16  427  =

f6f99189d77ea4 Jiri Slaby     2022-09-01 @428  static DEFINE_UART_PORT_TX_H=
ELPER_LIMITED(rp2_tx_chars, port, ch,
f6f99189d77ea4 Jiri Slaby     2022-09-01  429  		true,
f6f99189d77ea4 Jiri Slaby     2022-09-01  430  		writeb(ch, port_to_up(port=
)->base + RP2_DATA_BYTE),
f6f99189d77ea4 Jiri Slaby     2022-09-01  431  		({}));
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
f6f99189d77ea4 Jiri Slaby     2022-09-01 @449  		rp2_tx_chars(&up->port,
f6f99189d77ea4 Jiri Slaby     2022-09-01  450  			FIFO_SIZE - readw(up->bas=
e + RP2_TX_FIFO_COUNT));
7d9f49afa451d8 Kevin Cernekee 2013-01-16  451  	if (status & RP2_CHAN_STAT_=
MS_CHANGED_MASK)
7d9f49afa451d8 Kevin Cernekee 2013-01-16  452  		wake_up_interruptible(&up-=
>port.state->port.delta_msr_wait);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  453  =

7d9f49afa451d8 Kevin Cernekee 2013-01-16  454  	spin_unlock(&up->port.lock);
7d9f49afa451d8 Kevin Cernekee 2013-01-16  455  }
7d9f49afa451d8 Kevin Cernekee 2013-01-16  456  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3954364656416041384==--

