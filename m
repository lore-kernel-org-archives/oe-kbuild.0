Content-Type: multipart/mixed; boundary="===============7893686582397317518=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 3/3] tty: serial: use DEFINE_UART_PORT_TX_HELPER_LIMITED()
Date: Fri, 02 Sep 2022 08:56:28 +0800
Message-ID: <202209020826.7xkUk5YM-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7893686582397317518==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/t=
ty/serial/altera_jtaguart.c:137:8: sparse:    int static [signed] [toplevel=
] writel_relaxed( ... )"
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
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: csky-randconfig-s032-20220901 (https://download.01.org/0day-ci/arch=
ive/20220902/202209020826.7xkUk5YM-lkp(a)intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
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
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dc=
sky SHELL=3D/bin/bash drivers/tty/serial/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
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
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: symbol 'writ=
el_relaxed' redeclared with different type (different argument counts):
>> drivers/tty/serial/altera_jtaguart.c:137:8: sparse:    int static [signe=
d] [toplevel] writel_relaxed( ... )
   drivers/tty/serial/altera_jtaguart.c: note: in included file (through ar=
ch/csky/include/asm/io.h, include/linux/io.h, include/linux/irq.h, ...):
   include/asm-generic/io.h:376:20: sparse: note: previously declared as:
>> include/asm-generic/io.h:376:20: sparse:    void static inline [gnu_inli=
ne] [toplevel] writel_relaxed( ... )
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
el_relaxed' redeclared with different type (different argument counts):
>> drivers/tty/serial/altera_jtaguart.c:137:8: sparse:    int static [signe=
d] [toplevel] writel_relaxed( ... )
   include/asm-generic/io.h:376:20: sparse: note: previously declared as:
>> include/asm-generic/io.h:376:20: sparse:    void static inline [gnu_inli=
ne] [toplevel] writel_relaxed( ... )
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
uments for function writel_relaxed
   drivers/tty/serial/altera_jtaguart.c:202:9: sparse: sparse: too many arg=
uments for function writel_relaxed
   drivers/tty/serial/altera_jtaguart.c:219:9: sparse: sparse: too many arg=
uments for function writel_relaxed
--
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: Expected ) in fun=
ction declarator
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: got __VA_OPT__
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: Expected ) in fun=
ction declarator
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: got ;
>> drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: Trying to use res=
erved word 'for' as identifier
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: Expected ; at end=
 of declaration
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: got &&
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: got }
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: Expected ) in nes=
ted declarator
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: got --
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: Expected ) in nes=
ted declarator
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: got {
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: Expected ) in fun=
ction declarator
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: got (
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: got }
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: Expected ; at end=
 of declaration
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: got ->
>> drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: Trying to use res=
erved word 'continue' as identifier
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: got }
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: Expected ) in nes=
ted declarator
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: got {
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: Expected ) in fun=
ction declarator
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: got (
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: got }
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: Expected ; at end=
 of declaration
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: got ->
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: got }
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: Expected ) in fun=
ction declarator
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: got <
>> drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: Trying to use res=
erved word 'if' as identifier
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: Expected ) in fun=
ction declarator
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: got =3D=3D
>> drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: Trying to use res=
erved word 'if' as identifier
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: got }
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: got }
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: symbol 'writel_re=
laxed' redeclared with different type (different argument counts):
>> drivers/tty/serial/mvebu-uart.c:336:8: sparse:    int static [signed] [t=
oplevel] writel_relaxed( ... )
   drivers/tty/serial/mvebu-uart.c: note: in included file (through arch/cs=
ky/include/asm/io.h, include/linux/io.h):
   include/asm-generic/io.h:376:20: sparse: note: previously declared as:
>> include/asm-generic/io.h:376:20: sparse:    void static inline [gnu_inli=
ne] [toplevel] writel_relaxed( ... )
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: undefined identif=
ier 'xmit'
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: undefined identif=
ier 'xmit'
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: symbol 'ch' redec=
lared with different type (different type sizes):
>> drivers/tty/serial/mvebu-uart.c:336:8: sparse:    int [addressable] [top=
level] ch
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: note: previously declared=
 as:
>> drivers/tty/serial/mvebu-uart.c:336:8: sparse:    unsigned char [address=
able] [toplevel] [usertype] ch
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: symbol 'writel_re=
laxed' redeclared with different type (different argument counts):
>> drivers/tty/serial/mvebu-uart.c:336:8: sparse:    int static [signed] [t=
oplevel] writel_relaxed( ... )
   include/asm-generic/io.h:376:20: sparse: note: previously declared as:
>> include/asm-generic/io.h:376:20: sparse:    void static inline [gnu_inli=
ne] [toplevel] writel_relaxed( ... )
>> drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: cannot dereferenc=
e this type
>> drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: cannot dereferenc=
e this type
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: symbol 'pending' =
redeclared with different type (different signedness):
>> drivers/tty/serial/mvebu-uart.c:336:8: sparse:    int [addressable] [top=
level] pending
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: note: previously declared=
 as:
>> drivers/tty/serial/mvebu-uart.c:336:8: sparse:    unsigned int [addressa=
ble] [toplevel] pending
>> drivers/tty/serial/mvebu-uart.c:343:31: sparse: sparse: too many argumen=
ts for function mvebu_uart_do_tx_chars
>> drivers/tty/serial/mvebu-uart.c:390:9: sparse: sparse: too many argument=
s for function writel_relaxed
   drivers/tty/serial/mvebu-uart.c:397:9: sparse: sparse: too many argument=
s for function writel_relaxed
   drivers/tty/serial/mvebu-uart.c:399:9: sparse: sparse: too many argument=
s for function writel_relaxed
   drivers/tty/serial/mvebu-uart.c:403:9: sparse: sparse: too many argument=
s for function writel_relaxed
   drivers/tty/serial/mvebu-uart.c:446:9: sparse: sparse: too many argument=
s for function writel_relaxed
   drivers/tty/serial/mvebu-uart.c:524:9: sparse: sparse: too many argument=
s for function writel_relaxed
   drivers/tty/serial/mvebu-uart.c:532:9: sparse: sparse: too many argument=
s for function writel_relaxed
   drivers/tty/serial/mvebu-uart.c:987:9: sparse: sparse: too many argument=
s for function writel_relaxed
   drivers/tty/serial/mvebu-uart.c:989:9: sparse: sparse: too many argument=
s for function writel_relaxed
   drivers/tty/serial/mvebu-uart.c:1153:9: sparse: sparse: too many argumen=
ts for function writel_relaxed
   drivers/tty/serial/mvebu-uart.c:1166:17: sparse: sparse: too many argume=
nts for function writel_relaxed
   drivers/tty/serial/mvebu-uart.c:1193:9: sparse: sparse: too many argumen=
ts for function writel_relaxed
   drivers/tty/serial/mvebu-uart.c:1217:9: sparse: sparse: too many argumen=
ts for function writel_relaxed
   drivers/tty/serial/mvebu-uart.c:1260:9: sparse: sparse: too many argumen=
ts for function writel_relaxed
   drivers/tty/serial/mvebu-uart.c:1261:9: sparse: sparse: too many argumen=
ts for function writel_relaxed
--
   drivers/tty/serial/omap-serial.c:351:8: sparse: sparse: Expected ) in fu=
nction declarator
   drivers/tty/serial/omap-serial.c:351:8: sparse: sparse: got __VA_OPT__
   drivers/tty/serial/omap-serial.c:351:8: sparse: sparse: Expected ) in fu=
nction declarator
   drivers/tty/serial/omap-serial.c:351:8: sparse: sparse: got ;
>> drivers/tty/serial/omap-serial.c:351:8: sparse: sparse: Trying to use re=
served word 'for' as identifier
   drivers/tty/serial/omap-serial.c:351:8: sparse: sparse: Expected ; at en=
d of declaration
   drivers/tty/serial/omap-serial.c:351:8: sparse: sparse: got &&
   drivers/tty/serial/omap-serial.c:351:8: sparse: sparse: Expected ) in ne=
sted declarator
   drivers/tty/serial/omap-serial.c:351:8: sparse: sparse: got --
   drivers/tty/serial/omap-serial.c:351:8: sparse: sparse: Expected ; at en=
d of declaration
   drivers/tty/serial/omap-serial.c:351:8: sparse: sparse: got ->
>> drivers/tty/serial/omap-serial.c:351:8: sparse: sparse: Trying to use re=
served word 'continue' as identifier
   drivers/tty/serial/omap-serial.c:351:8: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/tty/serial/omap-serial.c:351:8: sparse: sparse: got }
   drivers/tty/serial/omap-serial.c:351:8: sparse: sparse: Expected ; at en=
d of declaration
   drivers/tty/serial/omap-serial.c:351:8: sparse: sparse: got ->
   drivers/tty/serial/omap-serial.c:351:8: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/tty/serial/omap-serial.c:351:8: sparse: sparse: got }
   drivers/tty/serial/omap-serial.c:351:8: sparse: sparse: Expected ) in fu=
nction declarator
   drivers/tty/serial/omap-serial.c:351:8: sparse: sparse: got <
>> drivers/tty/serial/omap-serial.c:351:8: sparse: sparse: Trying to use re=
served word 'if' as identifier
   drivers/tty/serial/omap-serial.c:351:8: sparse: sparse: Expected ) in fu=
nction declarator
   drivers/tty/serial/omap-serial.c:351:8: sparse: sparse: got =3D=3D
>> drivers/tty/serial/omap-serial.c:351:8: sparse: sparse: Trying to use re=
served word 'if' as identifier
   drivers/tty/serial/omap-serial.c:351:8: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/tty/serial/omap-serial.c:351:8: sparse: sparse: got }
   drivers/tty/serial/omap-serial.c:351:8: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/tty/serial/omap-serial.c:351:8: sparse: sparse: got }
   drivers/tty/serial/omap-serial.c:351:8: sparse: sparse: symbol 'serial_o=
map_put_char' redeclared with different type (incompatible argument 1 (diff=
erent base types)):
>> drivers/tty/serial/omap-serial.c:351:8: sparse:    int static [signed] [=
toplevel] serial_omap_put_char( ... )
   drivers/tty/serial/omap-serial.c:340:13: sparse: note: previously declar=
ed as:
>> drivers/tty/serial/omap-serial.c:340:13: sparse:    void static [topleve=
l] serial_omap_put_char( ... )
   drivers/tty/serial/omap-serial.c:351:8: sparse: sparse: undefined identi=
fier 'xmit'
   drivers/tty/serial/omap-serial.c:351:8: sparse: sparse: undefined identi=
fier 'xmit'
   drivers/tty/serial/omap-serial.c:351:8: sparse: sparse: symbol 'ch' rede=
clared with different type (different type sizes):
>> drivers/tty/serial/omap-serial.c:351:8: sparse:    int [addressable] [to=
plevel] ch
   drivers/tty/serial/omap-serial.c:351:8: sparse: note: previously declare=
d as:
>> drivers/tty/serial/omap-serial.c:351:8: sparse:    unsigned char [addres=
sable] [toplevel] [usertype] ch
   drivers/tty/serial/omap-serial.c:351:8: sparse: sparse: symbol 'serial_o=
map_put_char' redeclared with different type (incompatible argument 1 (diff=
erent base types)):
>> drivers/tty/serial/omap-serial.c:351:8: sparse:    int static [signed] [=
toplevel] serial_omap_put_char( ... )
   drivers/tty/serial/omap-serial.c:340:13: sparse: note: previously declar=
ed as:
>> drivers/tty/serial/omap-serial.c:340:13: sparse:    void static [topleve=
l] serial_omap_put_char( ... )
>> drivers/tty/serial/omap-serial.c:351:8: sparse: sparse: cannot dereferen=
ce this type
>> drivers/tty/serial/omap-serial.c:351:8: sparse: sparse: cannot dereferen=
ce this type
   drivers/tty/serial/omap-serial.c:351:8: sparse: sparse: symbol 'pending'=
 redeclared with different type (different signedness):
>> drivers/tty/serial/omap-serial.c:351:8: sparse:    int [addressable] [to=
plevel] pending
   drivers/tty/serial/omap-serial.c:351:8: sparse: note: previously declare=
d as:
>> drivers/tty/serial/omap-serial.c:351:8: sparse:    unsigned int [address=
able] [toplevel] pending
>> drivers/tty/serial/omap-serial.c:553:39: sparse: sparse: too many argume=
nts for function transmit_chars

vim +137 drivers/tty/serial/altera_jtaguart.c

5bcd601049c6b2 drivers/serial/altera_jtaguart.c     Tobias Klauser 2010-05-=
05  136  =

f6f99189d77ea4 drivers/tty/serial/altera_jtaguart.c Jiri Slaby     2022-09-=
01 @137  static DEFINE_UART_PORT_TX_HELPER_LIMITED(altera_jtaguart_do_tx_ch=
ars, port, ch,
f6f99189d77ea4 drivers/tty/serial/altera_jtaguart.c Jiri Slaby     2022-09-=
01  138  		true,
f6f99189d77ea4 drivers/tty/serial/altera_jtaguart.c Jiri Slaby     2022-09-=
01  139  		writel(ch, port->membase + ALTERA_JTAGUART_DATA_REG),
f6f99189d77ea4 drivers/tty/serial/altera_jtaguart.c Jiri Slaby     2022-09-=
01  140  		({}));
f6f99189d77ea4 drivers/tty/serial/altera_jtaguart.c Jiri Slaby     2022-09-=
01  141  =

5bcd601049c6b2 drivers/serial/altera_jtaguart.c     Tobias Klauser 2010-05-=
05  142  static void altera_jtaguart_tx_chars(struct altera_jtaguart *pp)
5bcd601049c6b2 drivers/serial/altera_jtaguart.c     Tobias Klauser 2010-05-=
05  143  {
5bcd601049c6b2 drivers/serial/altera_jtaguart.c     Tobias Klauser 2010-05-=
05  144  	struct uart_port *port =3D &pp->port;
f6f99189d77ea4 drivers/tty/serial/altera_jtaguart.c Jiri Slaby     2022-09-=
01  145  	unsigned int space;
5bcd601049c6b2 drivers/serial/altera_jtaguart.c     Tobias Klauser 2010-05-=
05  146  =

f6f99189d77ea4 drivers/tty/serial/altera_jtaguart.c Jiri Slaby     2022-09-=
01  147  	space =3D (readl(port->membase + ALTERA_JTAGUART_CONTROL_REG) &
5bcd601049c6b2 drivers/serial/altera_jtaguart.c     Tobias Klauser 2010-05-=
05  148  			ALTERA_JTAGUART_CONTROL_WSPACE_MSK) >>
5bcd601049c6b2 drivers/serial/altera_jtaguart.c     Tobias Klauser 2010-05-=
05  149  		ALTERA_JTAGUART_CONTROL_WSPACE_OFF;
f6f99189d77ea4 drivers/tty/serial/altera_jtaguart.c Jiri Slaby     2022-09-=
01  150  	altera_jtaguart_do_tx_chars(port, space);
5bcd601049c6b2 drivers/serial/altera_jtaguart.c     Tobias Klauser 2010-05-=
05  151  }
5bcd601049c6b2 drivers/serial/altera_jtaguart.c     Tobias Klauser 2010-05-=
05  152  =

5bcd601049c6b2 drivers/serial/altera_jtaguart.c     Tobias Klauser 2010-05-=
05  153  static irqreturn_t altera_jtaguart_interrupt(int irq, void *data)
5bcd601049c6b2 drivers/serial/altera_jtaguart.c     Tobias Klauser 2010-05-=
05  154  {
5bcd601049c6b2 drivers/serial/altera_jtaguart.c     Tobias Klauser 2010-05-=
05  155  	struct uart_port *port =3D data;
5bcd601049c6b2 drivers/serial/altera_jtaguart.c     Tobias Klauser 2010-05-=
05  156  	struct altera_jtaguart *pp =3D
5bcd601049c6b2 drivers/serial/altera_jtaguart.c     Tobias Klauser 2010-05-=
05  157  	    container_of(port, struct altera_jtaguart, port);
5bcd601049c6b2 drivers/serial/altera_jtaguart.c     Tobias Klauser 2010-05-=
05  158  	unsigned int isr;
5bcd601049c6b2 drivers/serial/altera_jtaguart.c     Tobias Klauser 2010-05-=
05  159  =

5bcd601049c6b2 drivers/serial/altera_jtaguart.c     Tobias Klauser 2010-05-=
05  160  	isr =3D (readl(port->membase + ALTERA_JTAGUART_CONTROL_REG) >>
5bcd601049c6b2 drivers/serial/altera_jtaguart.c     Tobias Klauser 2010-05-=
05  161  	       ALTERA_JTAGUART_CONTROL_RI_OFF) & pp->imr;
5bcd601049c6b2 drivers/serial/altera_jtaguart.c     Tobias Klauser 2010-05-=
05  162  =

5bcd601049c6b2 drivers/serial/altera_jtaguart.c     Tobias Klauser 2010-05-=
05  163  	spin_lock(&port->lock);
5bcd601049c6b2 drivers/serial/altera_jtaguart.c     Tobias Klauser 2010-05-=
05  164  =

5bcd601049c6b2 drivers/serial/altera_jtaguart.c     Tobias Klauser 2010-05-=
05  165  	if (isr & ALTERA_JTAGUART_CONTROL_RE_MSK)
5bcd601049c6b2 drivers/serial/altera_jtaguart.c     Tobias Klauser 2010-05-=
05  166  		altera_jtaguart_rx_chars(pp);
5bcd601049c6b2 drivers/serial/altera_jtaguart.c     Tobias Klauser 2010-05-=
05  167  	if (isr & ALTERA_JTAGUART_CONTROL_WE_MSK)
5bcd601049c6b2 drivers/serial/altera_jtaguart.c     Tobias Klauser 2010-05-=
05  168  		altera_jtaguart_tx_chars(pp);
5bcd601049c6b2 drivers/serial/altera_jtaguart.c     Tobias Klauser 2010-05-=
05  169  =

5bcd601049c6b2 drivers/serial/altera_jtaguart.c     Tobias Klauser 2010-05-=
05  170  	spin_unlock(&port->lock);
5bcd601049c6b2 drivers/serial/altera_jtaguart.c     Tobias Klauser 2010-05-=
05  171  =

5bcd601049c6b2 drivers/serial/altera_jtaguart.c     Tobias Klauser 2010-05-=
05  172  	return IRQ_RETVAL(isr);
5bcd601049c6b2 drivers/serial/altera_jtaguart.c     Tobias Klauser 2010-05-=
05  173  }
5bcd601049c6b2 drivers/serial/altera_jtaguart.c     Tobias Klauser 2010-05-=
05  174  =

5bcd601049c6b2 drivers/serial/altera_jtaguart.c     Tobias Klauser 2010-05-=
05  175  static void altera_jtaguart_config_port(struct uart_port *port, in=
t flags)
5bcd601049c6b2 drivers/serial/altera_jtaguart.c     Tobias Klauser 2010-05-=
05  176  {
5bcd601049c6b2 drivers/serial/altera_jtaguart.c     Tobias Klauser 2010-05-=
05  177  	port->type =3D PORT_ALTERA_JTAGUART;
5bcd601049c6b2 drivers/serial/altera_jtaguart.c     Tobias Klauser 2010-05-=
05  178  =

5bcd601049c6b2 drivers/serial/altera_jtaguart.c     Tobias Klauser 2010-05-=
05  179  	/* Clear mask, so no surprise interrupts. */
5bcd601049c6b2 drivers/serial/altera_jtaguart.c     Tobias Klauser 2010-05-=
05 @180  	writel(0, port->membase + ALTERA_JTAGUART_CONTROL_REG);
5bcd601049c6b2 drivers/serial/altera_jtaguart.c     Tobias Klauser 2010-05-=
05  181  }
5bcd601049c6b2 drivers/serial/altera_jtaguart.c     Tobias Klauser 2010-05-=
05  182  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7893686582397317518==--

