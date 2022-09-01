Content-Type: multipart/mixed; boundary="===============8836347609433034147=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 3/3] tty: serial: use DEFINE_UART_PORT_TX_HELPER_LIMITED()
Date: Fri, 02 Sep 2022 07:55:19 +0800
Message-ID: <202209020725.6RNo5PyB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8836347609433034147==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/t=
ty/serial/amba-pl010.c:165:8: sparse:    int static [signed] [toplevel] __r=
aw_writel( ... )"
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
v6.0-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiri-Slaby/tty-TX-he=
lpers/20220901-190806
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-=
testing
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: arm-randconfig-s033-20220901 (https://download.01.org/0day-ci/archi=
ve/20220902/202209020725.6RNo5PyB-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
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
rm SHELL=3D/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: Expected ) in fun=
ction declarator
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: got __VA_OPT__
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: Expected ) in fun=
ction declarator
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: got ;
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: Trying to use res=
erved word 'for' as identifier
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: Expected ; at end=
 of declaration
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: got &&
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: Expected ) in nes=
ted declarator
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: got --
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: Expected ) in nes=
ted declarator
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: got {
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: Expected ) in fun=
ction declarator
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: got (
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: got }
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: Expected ; at end=
 of declaration
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: got ->
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: Trying to use res=
erved word 'continue' as identifier
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: got }
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: Expected ) in nes=
ted declarator
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: got {
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: Expected ) in fun=
ction declarator
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: got (
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: got }
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: Expected ; at end=
 of declaration
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: got ->
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: got }
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: Expected ) in fun=
ction declarator
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: got <
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: Trying to use res=
erved word 'if' as identifier
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: Expected ) in fun=
ction declarator
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: got =3D=3D
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: Trying to use res=
erved word 'if' as identifier
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: got }
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: Expected ;@the=
 end of type declaration
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: got }
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: symbol '__raw_wri=
tel' redeclared with different type (different argument counts):
>> drivers/tty/serial/amba-pl010.c:165:8: sparse:    int static [signed] [t=
oplevel] __raw_writel( ... )
   drivers/tty/serial/amba-pl010.c: note: in included file (through include=
/linux/scatterlist.h, include/linux/kfifo.h, include/linux/tty_port.h, ...):
   arch/arm/include/asm/io.h:93:20: sparse: note: previously declared as:
>> arch/arm/include/asm/io.h:93:20: sparse:    void static inline [gnu_inli=
ne] [toplevel] __raw_writel( ... )
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: undefined identif=
ier 'xmit'
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: undefined identif=
ier 'xmit'
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: symbol 'ch' redec=
lared with different type (different type sizes):
   drivers/tty/serial/amba-pl010.c:165:8: sparse:    int [addressable] [top=
level] ch
   drivers/tty/serial/amba-pl010.c:165:8: sparse: note: previously declared=
 as:
   drivers/tty/serial/amba-pl010.c:165:8: sparse:    unsigned char [address=
able] [toplevel] [usertype] ch
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: symbol '__raw_wri=
tel' redeclared with different type (different argument counts):
>> drivers/tty/serial/amba-pl010.c:165:8: sparse:    int static [signed] [t=
oplevel] __raw_writel( ... )
   arch/arm/include/asm/io.h:93:20: sparse: note: previously declared as:
>> arch/arm/include/asm/io.h:93:20: sparse:    void static inline [gnu_inli=
ne] [toplevel] __raw_writel( ... )
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: cannot dereferenc=
e this type
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: cannot dereferenc=
e this type
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: symbol 'pending' =
redeclared with different type (different signedness):
   drivers/tty/serial/amba-pl010.c:165:8: sparse:    int [addressable] [top=
level] pending
   drivers/tty/serial/amba-pl010.c:165:8: sparse: note: previously declared=
 as:
   drivers/tty/serial/amba-pl010.c:165:8: sparse:    unsigned int [addressa=
ble] [toplevel] pending
>> drivers/tty/serial/amba-pl010.c:175:9: sparse: sparse: too many argument=
s for function __raw_writel
   drivers/tty/serial/amba-pl010.c:214:47: sparse: sparse: too many argumen=
ts for function pl010_tx_chars
   drivers/tty/serial/amba-pl010.c:273:9: sparse: sparse: too many argument=
s for function __raw_writel
   drivers/tty/serial/amba-pl010.c:307:9: sparse: sparse: too many argument=
s for function __raw_writel
   drivers/tty/serial/amba-pl010.c:331:9: sparse: sparse: too many argument=
s for function __raw_writel
   drivers/tty/serial/amba-pl010.c:334:9: sparse: sparse: too many argument=
s for function __raw_writel
   drivers/tty/serial/amba-pl010.c:424:9: sparse: sparse: too many argument=
s for function __raw_writel
   drivers/tty/serial/amba-pl010.c:425:9: sparse: sparse: too many argument=
s for function __raw_writel
   drivers/tty/serial/amba-pl010.c:432:9: sparse: sparse: too many argument=
s for function __raw_writel
   drivers/tty/serial/amba-pl010.c:433:9: sparse: sparse: too many argument=
s for function __raw_writel
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
n nested declarator
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: got {
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: Expected ) i=
n function declarator
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: got (
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: Expected ; a=
t the end of type declaration
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: got }
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: Expected ; a=
t end of declaration
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: got ->
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: Trying to us=
e reserved word 'continue' as identifier
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: Expected ; a=
t the end of type declaration
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: got }
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: Expected ) i=
n nested declarator
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: got {
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: Expected ) i=
n function declarator
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: got (
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: Expected ; a=
t the end of type declaration
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: got }
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
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: symbol '__ra=
w_writel' redeclared with different type (different argument counts):
>> drivers/tty/serial/altera_jtaguart.c:137:8: sparse:    int static [signe=
d] [toplevel] __raw_writel( ... )
   drivers/tty/serial/altera_jtaguart.c: note: in included file (through in=
clude/linux/io.h, include/linux/irq.h, include/asm-generic/hardirq.h, ...):
   arch/arm/include/asm/io.h:93:20: sparse: note: previously declared as:
>> arch/arm/include/asm/io.h:93:20: sparse:    void static inline [gnu_inli=
ne] [toplevel] __raw_writel( ... )
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
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: symbol '__ra=
w_writel' redeclared with different type (different argument counts):
>> drivers/tty/serial/altera_jtaguart.c:137:8: sparse:    int static [signe=
d] [toplevel] __raw_writel( ... )
   arch/arm/include/asm/io.h:93:20: sparse: note: previously declared as:
>> arch/arm/include/asm/io.h:93:20: sparse:    void static inline [gnu_inli=
ne] [toplevel] __raw_writel( ... )
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
>> drivers/tty/serial/altera_jtaguart.c:180:9: sparse: sparse: too many arg=
uments for function __raw_writel
   drivers/tty/serial/altera_jtaguart.c:202:9: sparse: sparse: too many arg=
uments for function __raw_writel
   drivers/tty/serial/altera_jtaguart.c:219:9: sparse: sparse: too many arg=
uments for function __raw_writel
--
   drivers/tty/serial/sprd_serial.c:627:8: sparse: sparse: Expected ) in fu=
nction declarator
   drivers/tty/serial/sprd_serial.c:627:8: sparse: sparse: got __VA_OPT__
   drivers/tty/serial/sprd_serial.c:627:8: sparse: sparse: Expected ) in fu=
nction declarator
   drivers/tty/serial/sprd_serial.c:627:8: sparse: sparse: got ;
>> drivers/tty/serial/sprd_serial.c:627:8: sparse: sparse: Trying to use re=
served word 'for' as identifier
   drivers/tty/serial/sprd_serial.c:627:8: sparse: sparse: Expected ; at en=
d of declaration
   drivers/tty/serial/sprd_serial.c:627:8: sparse: sparse: got &&
   drivers/tty/serial/sprd_serial.c:627:8: sparse: sparse: Expected ) in ne=
sted declarator
   drivers/tty/serial/sprd_serial.c:627:8: sparse: sparse: got --
   drivers/tty/serial/sprd_serial.c:627:8: sparse: sparse: Expected ) in fu=
nction declarator
   drivers/tty/serial/sprd_serial.c:627:8: sparse: sparse: got ,
   drivers/tty/serial/sprd_serial.c:627:8: sparse: sparse: Expected ; at en=
d of declaration
   drivers/tty/serial/sprd_serial.c:627:8: sparse: sparse: got ->
>> drivers/tty/serial/sprd_serial.c:627:8: sparse: sparse: Trying to use re=
served word 'continue' as identifier
   drivers/tty/serial/sprd_serial.c:627:8: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/tty/serial/sprd_serial.c:627:8: sparse: sparse: got }
   drivers/tty/serial/sprd_serial.c:627:8: sparse: sparse: Expected ) in fu=
nction declarator
   drivers/tty/serial/sprd_serial.c:627:8: sparse: sparse: got ,
   drivers/tty/serial/sprd_serial.c:627:8: sparse: sparse: Expected ; at en=
d of declaration
   drivers/tty/serial/sprd_serial.c:627:8: sparse: sparse: got ->
   drivers/tty/serial/sprd_serial.c:627:8: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/tty/serial/sprd_serial.c:627:8: sparse: sparse: got }
   drivers/tty/serial/sprd_serial.c:627:8: sparse: sparse: Expected ) in fu=
nction declarator
   drivers/tty/serial/sprd_serial.c:627:8: sparse: sparse: got <
>> drivers/tty/serial/sprd_serial.c:627:8: sparse: sparse: Trying to use re=
served word 'if' as identifier
   drivers/tty/serial/sprd_serial.c:627:8: sparse: sparse: Expected ) in fu=
nction declarator
   drivers/tty/serial/sprd_serial.c:627:8: sparse: sparse: got =3D=3D
>> drivers/tty/serial/sprd_serial.c:627:8: sparse: sparse: Trying to use re=
served word 'if' as identifier
   drivers/tty/serial/sprd_serial.c:627:8: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/tty/serial/sprd_serial.c:627:8: sparse: sparse: got }
   drivers/tty/serial/sprd_serial.c:627:8: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/tty/serial/sprd_serial.c:627:8: sparse: sparse: got }
   drivers/tty/serial/sprd_serial.c:627:8: sparse: sparse: symbol 'serial_o=
ut' redeclared with different type (incompatible argument 1 (different base=
 types)):
>> drivers/tty/serial/sprd_serial.c:627:8: sparse:    int static [signed] [=
toplevel] serial_out( ... )
   drivers/tty/serial/sprd_serial.c:143:20: sparse: note: previously declar=
ed as:
>> drivers/tty/serial/sprd_serial.c:143:20: sparse:    void static inline [=
gnu_inline] [toplevel] serial_out( ... )
   drivers/tty/serial/sprd_serial.c:627:8: sparse: sparse: undefined identi=
fier 'xmit'
   drivers/tty/serial/sprd_serial.c:627:8: sparse: sparse: undefined identi=
fier 'xmit'
   drivers/tty/serial/sprd_serial.c:627:8: sparse: sparse: symbol 'ch' rede=
clared with different type (different type sizes):
>> drivers/tty/serial/sprd_serial.c:627:8: sparse:    int [addressable] [to=
plevel] ch
   drivers/tty/serial/sprd_serial.c:627:8: sparse: note: previously declare=
d as:
>> drivers/tty/serial/sprd_serial.c:627:8: sparse:    unsigned char [addres=
sable] [toplevel] [usertype] ch
   drivers/tty/serial/sprd_serial.c:627:8: sparse: sparse: symbol 'serial_o=
ut' redeclared with different type (incompatible argument 1 (different base=
 types)):
>> drivers/tty/serial/sprd_serial.c:627:8: sparse:    int static [signed] [=
toplevel] serial_out( ... )
   drivers/tty/serial/sprd_serial.c:143:20: sparse: note: previously declar=
ed as:
>> drivers/tty/serial/sprd_serial.c:143:20: sparse:    void static inline [=
gnu_inline] [toplevel] serial_out( ... )
>> drivers/tty/serial/sprd_serial.c:627:8: sparse: sparse: cannot dereferen=
ce this type
>> drivers/tty/serial/sprd_serial.c:627:8: sparse: sparse: cannot dereferen=
ce this type
   drivers/tty/serial/sprd_serial.c:627:8: sparse: sparse: symbol 'pending'=
 redeclared with different type (different signedness):
>> drivers/tty/serial/sprd_serial.c:627:8: sparse:    int [addressable] [to=
plevel] pending
   drivers/tty/serial/sprd_serial.c:627:8: sparse: note: previously declare=
d as:
>> drivers/tty/serial/sprd_serial.c:627:8: sparse:    unsigned int [address=
able] [toplevel] pending
>> drivers/tty/serial/sprd_serial.c:648:27: sparse: sparse: too many argume=
nts for function serial_out
   drivers/tty/serial/sprd_serial.c:651:27: sparse: sparse: too many argume=
nts for function serial_out
>> drivers/tty/serial/sprd_serial.c:658:24: sparse: sparse: too many argume=
nts for function sprd_tx
   drivers/tty/serial/sprd_serial.c:692:19: sparse: sparse: too many argume=
nts for function serial_out
   drivers/tty/serial/sprd_serial.c:706:19: sparse: sparse: too many argume=
nts for function serial_out
   drivers/tty/serial/sprd_serial.c:707:19: sparse: sparse: too many argume=
nts for function serial_out
   drivers/tty/serial/sprd_serial.c:724:19: sparse: sparse: too many argume=
nts for function serial_out
   drivers/tty/serial/sprd_serial.c:732:19: sparse: sparse: too many argume=
nts for function serial_out
   drivers/tty/serial/sprd_serial.c:741:19: sparse: sparse: too many argume=
nts for function serial_out
   drivers/tty/serial/sprd_serial.c:742:19: sparse: sparse: too many argume=
nts for function serial_out
   drivers/tty/serial/sprd_serial.c:828:19: sparse: sparse: too many argume=
nts for function serial_out
   drivers/tty/serial/sprd_serial.c:831:19: sparse: sparse: too many argume=
nts for function serial_out
   drivers/tty/serial/sprd_serial.c:833:19: sparse: sparse: too many argume=
nts for function serial_out
   drivers/tty/serial/sprd_serial.c:835:19: sparse: sparse: too many argume=
nts for function serial_out
--
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: Expected ) in functio=
n declarator
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: got __VA_OPT__
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: Expected ) in functio=
n declarator
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: got ;
>> drivers/tty/serial/sifive.c:280:8: sparse: sparse: Trying to use reserve=
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
>> drivers/tty/serial/sifive.c:280:8: sparse: sparse: Trying to use reserve=
d word 'struct' as identifier
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: Expected ; at the end=
 of type declaration
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: got }
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: Expected ; at end of =
declaration
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: got ->
>> drivers/tty/serial/sifive.c:280:8: sparse: sparse: Trying to use reserve=
d word 'continue' as identifier
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: Expected ; at the end=
 of type declaration
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: got }
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: Expected ) in functio=
n declarator
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: got (
>> drivers/tty/serial/sifive.c:280:8: sparse: sparse: cannot dereference th=
is type
>> drivers/tty/serial/sifive.c:280:8: sparse: sparse: cannot dereference th=
is type
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: Expected ) in nested =
declarator
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: got sifive_serial_port
>> drivers/tty/serial/sifive.c:280:8: sparse: sparse: Trying to use reserve=
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
>> drivers/tty/serial/sifive.c:280:8: sparse: sparse: Trying to use reserve=
d word 'if' as identifier
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: Expected ) in functio=
n declarator
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: got =3D=3D
>> drivers/tty/serial/sifive.c:280:8: sparse: sparse: Trying to use reserve=
d word 'if' as identifier
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: Expected ; at the end=
 of type declaration
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: got }
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: Expected ; at the end=
 of type declaration
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: got }
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: symbol '__ssp_transmi=
t_char' redeclared with different type (different argument counts):
>> drivers/tty/serial/sifive.c:280:8: sparse:    int static [signed] [tople=
vel] __ssp_transmit_char( ... )
   drivers/tty/serial/sifive.c:275:13: sparse: note: previously declared as:
>> drivers/tty/serial/sifive.c:275:13: sparse:    void static [toplevel] __=
ssp_transmit_char( ... )
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: undefined identifier =
'xmit'
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: undefined identifier =
'xmit'
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: symbol 'ch' redeclare=
d with different type (different type sizes):
>> drivers/tty/serial/sifive.c:280:8: sparse:    int [addressable] [topleve=
l] ch
   drivers/tty/serial/sifive.c:280:8: sparse: note: previously declared as:
>> drivers/tty/serial/sifive.c:280:8: sparse:    unsigned char [addressable=
] [toplevel] [usertype] ch
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: symbol '__ssp_transmi=
t_char' redeclared with different type (different argument counts):
>> drivers/tty/serial/sifive.c:280:8: sparse:    int static [signed] [tople=
vel] __ssp_transmit_char( ... )
   drivers/tty/serial/sifive.c:275:13: sparse: note: previously declared as:
>> drivers/tty/serial/sifive.c:275:13: sparse:    void static [toplevel] __=
ssp_transmit_char( ... )
>> drivers/tty/serial/sifive.c:280:8: sparse: sparse: cannot dereference th=
is type
>> drivers/tty/serial/sifive.c:280:8: sparse: sparse: cannot dereference th=
is type
   drivers/tty/serial/sifive.c:280:8: sparse: sparse: symbol 'pending' rede=
clared with different type (different signedness):
>> drivers/tty/serial/sifive.c:280:8: sparse:    int [addressable] [topleve=
l] pending
   drivers/tty/serial/sifive.c:280:8: sparse: note: previously declared as:
>> drivers/tty/serial/sifive.c:280:8: sparse:    unsigned int [addressable]=
 [toplevel] pending
>> drivers/tty/serial/sifive.c:521:37: sparse: sparse: too many arguments f=
or function __ssp_transmit_chars

vim +165 drivers/tty/serial/amba-pl010.c

^1da177e4c3f41 drivers/serial/amba-pl010.c     Linus Torvalds 2005-04-16  1=
64  =

f6f99189d77ea4 drivers/tty/serial/amba-pl010.c Jiri Slaby     2022-09-01 @1=
65  static DEFINE_UART_PORT_TX_HELPER_LIMITED(pl010_tx_chars, port, ch,
f6f99189d77ea4 drivers/tty/serial/amba-pl010.c Jiri Slaby     2022-09-01  1=
66  		true,
f6f99189d77ea4 drivers/tty/serial/amba-pl010.c Jiri Slaby     2022-09-01  1=
67  		writel(ch, port->membase + UART01x_DR),
f6f99189d77ea4 drivers/tty/serial/amba-pl010.c Jiri Slaby     2022-09-01  1=
68  		({}));
^1da177e4c3f41 drivers/serial/amba-pl010.c     Linus Torvalds 2005-04-16  1=
69  =

1b0646a033c370 drivers/serial/amba-pl010.c     Russell King   2007-04-22  1=
70  static void pl010_modem_status(struct uart_amba_port *uap)
^1da177e4c3f41 drivers/serial/amba-pl010.c     Linus Torvalds 2005-04-16  1=
71  {
f166d19f9e8243 drivers/tty/serial/amba-pl010.c Jiri Slaby     2022-02-24  1=
72  	struct uart_port *port =3D &uap->port;
^1da177e4c3f41 drivers/serial/amba-pl010.c     Linus Torvalds 2005-04-16  1=
73  	unsigned int status, delta;
^1da177e4c3f41 drivers/serial/amba-pl010.c     Linus Torvalds 2005-04-16  1=
74  =

f166d19f9e8243 drivers/tty/serial/amba-pl010.c Jiri Slaby     2022-02-24 @1=
75  	writel(0, port->membase + UART010_ICR);
^1da177e4c3f41 drivers/serial/amba-pl010.c     Linus Torvalds 2005-04-16  1=
76  =

f166d19f9e8243 drivers/tty/serial/amba-pl010.c Jiri Slaby     2022-02-24  1=
77  	status =3D readb(port->membase + UART01x_FR) & UART01x_FR_MODEM_ANY;
^1da177e4c3f41 drivers/serial/amba-pl010.c     Linus Torvalds 2005-04-16  1=
78  =

^1da177e4c3f41 drivers/serial/amba-pl010.c     Linus Torvalds 2005-04-16  1=
79  	delta =3D status ^ uap->old_status;
^1da177e4c3f41 drivers/serial/amba-pl010.c     Linus Torvalds 2005-04-16  1=
80  	uap->old_status =3D status;
^1da177e4c3f41 drivers/serial/amba-pl010.c     Linus Torvalds 2005-04-16  1=
81  =

^1da177e4c3f41 drivers/serial/amba-pl010.c     Linus Torvalds 2005-04-16  1=
82  	if (!delta)
^1da177e4c3f41 drivers/serial/amba-pl010.c     Linus Torvalds 2005-04-16  1=
83  		return;
^1da177e4c3f41 drivers/serial/amba-pl010.c     Linus Torvalds 2005-04-16  1=
84  =

^1da177e4c3f41 drivers/serial/amba-pl010.c     Linus Torvalds 2005-04-16  1=
85  	if (delta & UART01x_FR_DCD)
f166d19f9e8243 drivers/tty/serial/amba-pl010.c Jiri Slaby     2022-02-24  1=
86  		uart_handle_dcd_change(port, status & UART01x_FR_DCD);
^1da177e4c3f41 drivers/serial/amba-pl010.c     Linus Torvalds 2005-04-16  1=
87  =

^1da177e4c3f41 drivers/serial/amba-pl010.c     Linus Torvalds 2005-04-16  1=
88  	if (delta & UART01x_FR_DSR)
f166d19f9e8243 drivers/tty/serial/amba-pl010.c Jiri Slaby     2022-02-24  1=
89  		port->icount.dsr++;
^1da177e4c3f41 drivers/serial/amba-pl010.c     Linus Torvalds 2005-04-16  1=
90  =

^1da177e4c3f41 drivers/serial/amba-pl010.c     Linus Torvalds 2005-04-16  1=
91  	if (delta & UART01x_FR_CTS)
f166d19f9e8243 drivers/tty/serial/amba-pl010.c Jiri Slaby     2022-02-24  1=
92  		uart_handle_cts_change(port, status & UART01x_FR_CTS);
^1da177e4c3f41 drivers/serial/amba-pl010.c     Linus Torvalds 2005-04-16  1=
93  =

f166d19f9e8243 drivers/tty/serial/amba-pl010.c Jiri Slaby     2022-02-24  1=
94  	wake_up_interruptible(&port->state->port.delta_msr_wait);
^1da177e4c3f41 drivers/serial/amba-pl010.c     Linus Torvalds 2005-04-16  1=
95  }
^1da177e4c3f41 drivers/serial/amba-pl010.c     Linus Torvalds 2005-04-16  1=
96  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8836347609433034147==--

