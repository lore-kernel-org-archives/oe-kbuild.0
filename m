Content-Type: multipart/mixed; boundary="===============3356677098217961275=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 3/3] tty: serial: use DEFINE_UART_PORT_TX_HELPER_LIMITED()
Date: Fri, 02 Sep 2022 11:47:15 +0800
Message-ID: <202209021156.ZPlVbADh-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3356677098217961275==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/t=
ty/serial/mvebu-uart.c:336:8: sparse:    int static [signed] [toplevel] wri=
tel( ... )"
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
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: xtensa-randconfig-s033-20220901 (https://download.01.org/0day-ci/ar=
chive/20220902/202209021156.ZPlVbADh-lkp(a)intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.1.0
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
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dx=
tensa SHELL=3D/bin/bash drivers/tty/serial/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   drivers/tty/serial/mvebu-uart.c: note: in included file (through arch/xt=
ensa/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, =
...):
   arch/xtensa/include/asm/processor.h:103:2: sparse: sparse: Unsupported x=
tensa ABI
   arch/xtensa/include/asm/processor.h:133:2: sparse: sparse: Unsupported X=
tensa ABI
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: Expected ) in fun=
ction declarator
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: got __VA_OPT__
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: Expected ) in fun=
ction declarator
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: got ;
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: Trying to use res=
erved word 'for' as identifier
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: Expected ; at end=
 of declaration
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: got &&
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: Expected ) in nes=
ted declarator
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: got --
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: Expected ) in fun=
ction declarator
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: got ->
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: Expected ; at end=
 of declaration
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: got ->
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: Trying to use res=
erved word 'continue' as identifier
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: got }
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: Expected ) in fun=
ction declarator
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: got ->
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: Expected ; at end=
 of declaration
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: got ->
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: got }
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: Expected ) in fun=
ction declarator
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: got <
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: Trying to use res=
erved word 'if' as identifier
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: Expected ) in fun=
ction declarator
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: got =3D=3D
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: Trying to use res=
erved word 'if' as identifier
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: got }
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: Expected ;@the=
 end of type declaration
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: got }
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: symbol 'writel' r=
edeclared with different type (incompatible argument 1 (different base type=
s)):
>> drivers/tty/serial/mvebu-uart.c:336:8: sparse:    int static [signed] [t=
oplevel] writel( ... )
   drivers/tty/serial/mvebu-uart.c: note: in included file (through arch/xt=
ensa/include/asm/io.h, include/linux/io.h):
   include/asm-generic/io.h:273:20: sparse: note: previously declared as:
   include/asm-generic/io.h:273:20: sparse:    void static inline [gnu_inli=
ne] [toplevel] writel( ... )
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: undefined identif=
ier 'xmit'
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: undefined identif=
ier 'xmit'
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: symbol 'ch' redec=
lared with different type (different type sizes):
   drivers/tty/serial/mvebu-uart.c:336:8: sparse:    int [addressable] [top=
level] ch
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: note: previously declared=
 as:
   drivers/tty/serial/mvebu-uart.c:336:8: sparse:    unsigned char [address=
able] [toplevel] [usertype] ch
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: symbol 'writel' r=
edeclared with different type (incompatible argument 1 (different base type=
s)):
>> drivers/tty/serial/mvebu-uart.c:336:8: sparse:    int static [signed] [t=
oplevel] writel( ... )
   include/asm-generic/io.h:273:20: sparse: note: previously declared as:
   include/asm-generic/io.h:273:20: sparse:    void static inline [gnu_inli=
ne] [toplevel] writel( ... )
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: cannot dereferenc=
e this type
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: cannot dereferenc=
e this type
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: sparse: symbol 'pending' =
redeclared with different type (different signedness):
   drivers/tty/serial/mvebu-uart.c:336:8: sparse:    int [addressable] [top=
level] pending
   drivers/tty/serial/mvebu-uart.c:336:8: sparse: note: previously declared=
 as:
   drivers/tty/serial/mvebu-uart.c:336:8: sparse:    unsigned int [addressa=
ble] [toplevel] pending
   drivers/tty/serial/mvebu-uart.c:343:31: sparse: sparse: too many argumen=
ts for function mvebu_uart_do_tx_chars

vim +336 drivers/tty/serial/mvebu-uart.c

30530791a7a032 Wilson Ding 2016-02-16  335  =

f6f99189d77ea4 Jiri Slaby  2022-09-01 @336  static DEFINE_UART_PORT_TX_HELP=
ER_LIMITED(mvebu_uart_do_tx_chars, port, ch,
f6f99189d77ea4 Jiri Slaby  2022-09-01  337  		!(readl(port->membase + UART_=
STAT) & STAT_TX_FIFO_FUL),
f6f99189d77ea4 Jiri Slaby  2022-09-01  338  		writel(ch, port->membase + UA=
RT_TSH(port)),
f6f99189d77ea4 Jiri Slaby  2022-09-01  339  		({}));
f6f99189d77ea4 Jiri Slaby  2022-09-01  340  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3356677098217961275==--

