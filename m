Content-Type: multipart/mixed; boundary="===============5530804317135633336=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 3/4] tty: serial: use DEFINE_UART_PORT_TX_HELPER()
Date: Fri, 09 Sep 2022 23:19:09 +0800
Message-ID: <202209092347.wb27DXlO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5530804317135633336==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/t=
ty/serial/vt8500_serial.c:197:8: sparse:    int static [signed] [toplevel] =
mmiowb_set_pending( ... )"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220906104805.23211-4-jslaby@suse.cz>
References: <20220906104805.23211-4-jslaby@suse.cz>
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
hive/20220909/202209092347.wb27DXlO-lkp(a)intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/7a2fb33f6cabf44f85f=
fba57d6487529ce598d13
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jiri-Slaby/tty-TX-helpers/20220906=
-185236
        git checkout 7a2fb33f6cabf44f85ffba57d6487529ce598d13
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dr=
iscv SHELL=3D/bin/bash drivers/tty/serial/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zihintpause'
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: Expected ) in =
function declarator
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: got __VA_OPT__
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: Expected ) in =
function declarator
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: got ;
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: Trying to use =
reserved word 'for' as identifier
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: Expected ; at =
end of declaration
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: got &&
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: Expected ) in =
nested declarator
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: got {
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: Expected ) in =
nested declarator
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: got {
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: Expected ) in =
nested declarator
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: got __raw_writ=
eb
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: Trying to use =
reserved word 'void' as identifier
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: Expected ; at =
the end of type declaration
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: got }
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: Expected ; at =
end of declaration
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: got ->
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: Trying to use =
reserved word 'continue' as identifier
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: Expected ; at =
the end of type declaration
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: got }
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: Expected ) in =
nested declarator
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: got {
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: Expected ) in =
nested declarator
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: got __raw_writ=
eb
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: Trying to use =
reserved word 'void' as identifier
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: Expected ; at =
the end of type declaration
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: got }
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: Expected ; at =
end of declaration
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: got ->
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: Expected ; at =
the end of type declaration
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: got }
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: Expected ) in =
function declarator
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: got <
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: Trying to use =
reserved word 'if' as identifier
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: Expected ) in =
function declarator
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: got =3D=3D
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: Trying to use =
reserved word 'if' as identifier
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: Expected ; at =
the end of type declaration
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: got }
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: Expected ;@=
the end of type declaration
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: got }
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: symbol 'true' =
redeclared with different type (different signedness):
   drivers/tty/serial/vt8500_serial.c:197:8: sparse:    int [addressable] [=
toplevel] true
   drivers/tty/serial/vt8500_serial.c: note: in included file (through incl=
ude/uapi/linux/posix_types.h, include/uapi/linux/types.h, include/linux/typ=
es.h, ...):
   include/linux/stddef.h:12:9: sparse: note: previously declared as:
   include/linux/stddef.h:12:9: sparse:    unsigned int enum <noident> [top=
level] true
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: symbol 'mmiowb=
_set_pending' redeclared with different type (different base types):
>> drivers/tty/serial/vt8500_serial.c:197:8: sparse:    int static [signed]=
 [toplevel] mmiowb_set_pending( ... )
   drivers/tty/serial/vt8500_serial.c: note: in included file (through arch=
/riscv/include/asm/mmiowb.h, include/linux/spinlock.h, include/linux/seqloc=
k.h, ...):
   include/asm-generic/mmiowb.h:35:20: sparse: note: previously declared as:
   include/asm-generic/mmiowb.h:35:20: sparse:    void static inline [gnu_i=
nline] [toplevel] mmiowb_set_pending( ... )
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: undefined iden=
tifier 'xmit'
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: undefined iden=
tifier 'xmit'
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: symbol 'ch' re=
declared with different type (different type sizes):
   drivers/tty/serial/vt8500_serial.c:197:8: sparse:    int [addressable] [=
toplevel] ch
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: note: previously decla=
red as:
   drivers/tty/serial/vt8500_serial.c:197:8: sparse:    unsigned char [addr=
essable] [toplevel] [usertype] ch
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: symbol 'mmiowb=
_set_pending' redeclared with different type (different base types):
>> drivers/tty/serial/vt8500_serial.c:197:8: sparse:    int static [signed]=
 [toplevel] mmiowb_set_pending( ... )
   include/asm-generic/mmiowb.h:35:20: sparse: note: previously declared as:
   include/asm-generic/mmiowb.h:35:20: sparse:    void static inline [gnu_i=
nline] [toplevel] mmiowb_set_pending( ... )
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: cannot derefer=
ence this type
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: cannot derefer=
ence this type
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: symbol 'pendin=
g' redeclared with different type (different signedness):
   drivers/tty/serial/vt8500_serial.c:197:8: sparse:    int [addressable] [=
toplevel] pending
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: note: previously decla=
red as:
   drivers/tty/serial/vt8500_serial.c:197:8: sparse:    unsigned int [addre=
ssable] [toplevel] pending

vim +197 drivers/tty/serial/vt8500_serial.c

662e1513d700cc drivers/tty/serial/vt8500_serial.c Jiri Slaby     2022-09-06=
  196  =

7a2fb33f6cabf4 drivers/tty/serial/vt8500_serial.c Jiri Slaby     2022-09-06=
 @197  static DEFINE_UART_PORT_TX_HELPER(handle_tx,
7a2fb33f6cabf4 drivers/tty/serial/vt8500_serial.c Jiri Slaby     2022-09-06=
  198  		vt8500_tx_empty(port),
7a2fb33f6cabf4 drivers/tty/serial/vt8500_serial.c Jiri Slaby     2022-09-06=
  199  		writeb(ch, port->membase + VT8500_TXFIFO));
304e12665a4a7b drivers/serial/vt8500_serial.c     Alexey Charkov 2010-11-08=
  200  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5530804317135633336==--

