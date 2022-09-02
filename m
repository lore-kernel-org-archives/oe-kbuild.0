Content-Type: multipart/mixed; boundary="===============4927495956791660716=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 2/3] tty: serial: use DEFINE_UART_PORT_TX_HELPER()
Date: Sat, 03 Sep 2022 06:10:08 +0800
Message-ID: <202209030549.GGtkfRB1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4927495956791660716==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 arch/parisc/include/asm/io.h:185:20: sparse:    void static inline [gnu_in=
line] [toplevel] writeb( ... )"
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
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: parisc-randconfig-s031-20220901 (https://download.01.org/0day-ci/ar=
chive/20220903/202209030549.GGtkfRB1-lkp(a)intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
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
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dp=
arisc SHELL=3D/bin/bash drivers/tty/serial/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: Expected ) in functio=
n declarator
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: got __VA_OPT__
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: Expected ) in functio=
n declarator
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: got ;
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: Trying to use reserve=
d word 'for' as identifier
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: Expected ; at end of =
declaration
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: got &&
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: Expected ) in nested =
declarator
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: got {
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: Expected ) in functio=
n declarator
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: got ->
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: Expected ; at end of =
declaration
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: got ->
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: Trying to use reserve=
d word 'continue' as identifier
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: Expected ; at the end=
 of type declaration
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: got }
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: Expected ) in functio=
n declarator
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: got ->
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: Expected ; at end of =
declaration
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: got ->
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: Expected ; at the end=
 of type declaration
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: got }
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: Expected ) in functio=
n declarator
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: got <
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: Trying to use reserve=
d word 'if' as identifier
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: Expected ) in functio=
n declarator
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: got =3D=3D
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: Trying to use reserve=
d word 'if' as identifier
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: Expected ; at the end=
 of type declaration
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: got }
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: Expected ;@the end=
 of type declaration
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: got }
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: symbol 'true' redecla=
red with different type (different signedness):
   drivers/tty/serial/lantiq.c:149:8: sparse:    int [addressable] [topleve=
l] true
   drivers/tty/serial/lantiq.c: note: in included file (through include/uap=
i/linux/posix_types.h, include/uapi/linux/types.h, include/linux/types.h, .=
..):
   include/linux/stddef.h:12:9: sparse: note: previously declared as:
   include/linux/stddef.h:12:9: sparse:    unsigned int enum <noident> [top=
level] true
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: symbol 'writeb' redec=
lared with different type (incompatible argument 1 (different base types)):
   drivers/tty/serial/lantiq.c:149:8: sparse:    int static [signed] [tople=
vel] writeb( ... )
   drivers/tty/serial/lantiq.c: note: in included file (through include/lin=
ux/io.h):
   arch/parisc/include/asm/io.h:185:20: sparse: note: previously declared a=
s:
>> arch/parisc/include/asm/io.h:185:20: sparse:    void static inline [gnu_=
inline] [toplevel] writeb( ... )
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: undefined identifier =
'xmit'
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: undefined identifier =
'xmit'
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: symbol 'ch' redeclare=
d with different type (different type sizes):
   drivers/tty/serial/lantiq.c:149:8: sparse:    int [addressable] [topleve=
l] ch
   drivers/tty/serial/lantiq.c:149:8: sparse: note: previously declared as:
   drivers/tty/serial/lantiq.c:149:8: sparse:    unsigned char [addressable=
] [toplevel] [usertype] ch
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: symbol 'writeb' redec=
lared with different type (incompatible argument 1 (different base types)):
   drivers/tty/serial/lantiq.c:149:8: sparse:    int static [signed] [tople=
vel] writeb( ... )
   arch/parisc/include/asm/io.h:185:20: sparse: note: previously declared a=
s:
>> arch/parisc/include/asm/io.h:185:20: sparse:    void static inline [gnu_=
inline] [toplevel] writeb( ... )
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: cannot dereference th=
is type
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: cannot dereference th=
is type
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: symbol 'pending' rede=
clared with different type (different signedness):
   drivers/tty/serial/lantiq.c:149:8: sparse:    int [addressable] [topleve=
l] pending
   drivers/tty/serial/lantiq.c:149:8: sparse: note: previously declared as:
   drivers/tty/serial/lantiq.c:149:8: sparse:    unsigned int [addressable]=
 [toplevel] pending
--
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: Expected ) in fun=
ction declarator
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: got __VA_OPT__
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: Expected ) in fun=
ction declarator
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: got ;
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: Trying to use res=
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
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: Trying to use res=
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
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: Trying to use res=
erved word 'if' as identifier
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: Expected ) in fun=
ction declarator
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: got =3D=3D
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: Trying to use res=
erved word 'if' as identifier
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: got }
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: Expected ;@the=
 end of type declaration
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: got }
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: symbol 'true' red=
eclared with different type (different signedness):
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse:    int [addressable] [top=
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
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse:    int static [signed] [t=
oplevel] writel( ... )
   drivers/tty/serial/lpc32xx_hs.c: note: in included file (through include=
/linux/scatterlist.h, include/linux/kfifo.h, include/linux/tty_port.h, ...):
   arch/parisc/include/asm/io.h:193:20: sparse: note: previously declared a=
s:
>> arch/parisc/include/asm/io.h:193:20: sparse:    void static inline [gnu_=
inline] [toplevel] writel( ... )
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: undefined identif=
ier 'xmit'
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: undefined identif=
ier 'xmit'
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: symbol 'ch' redec=
lared with different type (different type sizes):
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse:    int [addressable] [top=
level] ch
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: note: previously declared=
 as:
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse:    unsigned char [address=
able] [toplevel] [usertype] ch
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: symbol 'writel' r=
edeclared with different type (incompatible argument 1 (different base type=
s)):
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse:    int static [signed] [t=
oplevel] writel( ... )
   arch/parisc/include/asm/io.h:193:20: sparse: note: previously declared a=
s:
>> arch/parisc/include/asm/io.h:193:20: sparse:    void static inline [gnu_=
inline] [toplevel] writel( ... )
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: cannot dereferenc=
e this type
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: cannot dereferenc=
e this type
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: symbol 'pending' =
redeclared with different type (different signedness):
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse:    int [addressable] [top=
level] pending
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: note: previously declared=
 as:
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse:    unsigned int [addressa=
ble] [toplevel] pending
   drivers/tty/serial/lpc32xx_hs.c:303:23: sparse: sparse: too many argumen=
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

vim +185 arch/parisc/include/asm/io.h

9dfe914da83ebc arch/parisc/include/asm/io.h Kyle McMartin  2009-02-16  184  =

9dfe914da83ebc arch/parisc/include/asm/io.h Kyle McMartin  2009-02-16 @185 =
 static inline void writeb(unsigned char b, volatile void __iomem *addr)
9dfe914da83ebc arch/parisc/include/asm/io.h Kyle McMartin  2009-02-16  186 =
 {
9dfe914da83ebc arch/parisc/include/asm/io.h Kyle McMartin  2009-02-16  187 =
 	__raw_writeb(b, addr);
9dfe914da83ebc arch/parisc/include/asm/io.h Kyle McMartin  2009-02-16  188 =
 }
9dfe914da83ebc arch/parisc/include/asm/io.h Kyle McMartin  2009-02-16  189 =
 static inline void writew(unsigned short w, volatile void __iomem *addr)
9dfe914da83ebc arch/parisc/include/asm/io.h Kyle McMartin  2009-02-16  190 =
 {
184b922cb63237 arch/parisc/include/asm/io.h Helge Deller   2018-03-04  191 =
 	__raw_writew((__u16 __force) cpu_to_le16(w), addr);
9dfe914da83ebc arch/parisc/include/asm/io.h Kyle McMartin  2009-02-16  192 =
 }
9dfe914da83ebc arch/parisc/include/asm/io.h Kyle McMartin  2009-02-16 @193 =
 static inline void writel(unsigned int l, volatile void __iomem *addr)
9dfe914da83ebc arch/parisc/include/asm/io.h Kyle McMartin  2009-02-16  194 =
 {
184b922cb63237 arch/parisc/include/asm/io.h Helge Deller   2018-03-04  195 =
 	__raw_writel((__u32 __force) cpu_to_le32(l), addr);
9dfe914da83ebc arch/parisc/include/asm/io.h Kyle McMartin  2009-02-16  196 =
 }
9dfe914da83ebc arch/parisc/include/asm/io.h Kyle McMartin  2009-02-16  197 =
 static inline void writeq(unsigned long long q, volatile void __iomem *add=
r)
9dfe914da83ebc arch/parisc/include/asm/io.h Kyle McMartin  2009-02-16  198 =
 {
184b922cb63237 arch/parisc/include/asm/io.h Helge Deller   2018-03-04  199 =
 	__raw_writeq((__u64 __force) cpu_to_le64(q), addr);
9dfe914da83ebc arch/parisc/include/asm/io.h Kyle McMartin  2009-02-16  200 =
 }
^1da177e4c3f41 include/asm-parisc/io.h      Linus Torvalds 2005-04-16  201  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4927495956791660716==--

