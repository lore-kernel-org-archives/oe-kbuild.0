Content-Type: multipart/mixed; boundary="===============1250393850115148969=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 4/4] tty: serial: use DEFINE_UART_PORT_TX_HELPER_LIMITED()
Date: Sat, 10 Sep 2022 01:37:50 +0800
Message-ID: <202209100152.g9BlC4Ke-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1250393850115148969==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/t=
ty/serial/altera_jtaguart.c:137:8: sparse:    int static [signed] [toplevel=
] mmiowb_set_pending( ... )"
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
v6.0-rc4 next-20220909]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiri-Slaby/tty-TX-he=
lpers/20220906-185236
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-=
testing
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: riscv-randconfig-s033-20220909 (https://download.01.org/0day-ci/arc=
hive/20220910/202209100152.g9BlC4Ke-lkp(a)intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
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
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dr=
iscv SHELL=3D/bin/bash drivers/tty/serial/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zihintpause'
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
n nested declarator
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: got __raw_wr=
itel
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: Trying to us=
e reserved word 'void' as identifier
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
n nested declarator
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: got __raw_wr=
itel
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: Trying to us=
e reserved word 'void' as identifier
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
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: symbol 'mmio=
wb_set_pending' redeclared with different type (different base types):
>> drivers/tty/serial/altera_jtaguart.c:137:8: sparse:    int static [signe=
d] [toplevel] mmiowb_set_pending( ... )
   drivers/tty/serial/altera_jtaguart.c: note: in included file (through ar=
ch/riscv/include/asm/mmiowb.h, include/linux/spinlock.h, include/linux/wait=
.h, ...):
   include/asm-generic/mmiowb.h:35:20: sparse: note: previously declared as:
   include/asm-generic/mmiowb.h:35:20: sparse:    void static inline [gnu_i=
nline] [toplevel] mmiowb_set_pending( ... )
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
   drivers/tty/serial/altera_jtaguart.c:137:8: sparse: sparse: symbol 'mmio=
wb_set_pending' redeclared with different type (different base types):
>> drivers/tty/serial/altera_jtaguart.c:137:8: sparse:    int static [signe=
d] [toplevel] mmiowb_set_pending( ... )
   include/asm-generic/mmiowb.h:35:20: sparse: note: previously declared as:
   include/asm-generic/mmiowb.h:35:20: sparse:    void static inline [gnu_i=
nline] [toplevel] mmiowb_set_pending( ... )
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

vim +137 drivers/tty/serial/altera_jtaguart.c

5bcd601049c6b2 drivers/serial/altera_jtaguart.c     Tobias Klauser 2010-05-=
05  136  =

acf6bd027deb5a drivers/tty/serial/altera_jtaguart.c Jiri Slaby     2022-09-=
06 @137  static DEFINE_UART_PORT_TX_HELPER_LIMITED(altera_jtaguart_do_tx_ch=
ars,
acf6bd027deb5a drivers/tty/serial/altera_jtaguart.c Jiri Slaby     2022-09-=
06  138  		true,
acf6bd027deb5a drivers/tty/serial/altera_jtaguart.c Jiri Slaby     2022-09-=
06  139  		writel(ch, port->membase + ALTERA_JTAGUART_DATA_REG),
acf6bd027deb5a drivers/tty/serial/altera_jtaguart.c Jiri Slaby     2022-09-=
06  140  		({}));
acf6bd027deb5a drivers/tty/serial/altera_jtaguart.c Jiri Slaby     2022-09-=
06  141  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1250393850115148969==--

