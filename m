Content-Type: multipart/mixed; boundary="===============6452614898023844869=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 2/3] tty: serial: use DEFINE_UART_PORT_TX_HELPER()
Date: Fri, 02 Sep 2022 05:52:35 +0800
Message-ID: <202209020550.mxy3swTK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6452614898023844869==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/t=
ty/serial/lantiq.c:149:8: sparse:    int static [signed] [toplevel] writeb_=
relaxed( ... )"
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
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: csky-randconfig-s032-20220901 (https://download.01.org/0day-ci/arch=
ive/20220902/202209020550.mxy3swTK-lkp(a)intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
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
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dc=
sky SHELL=3D/bin/bash drivers/tty/serial/

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
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: Expected ) in nested =
declarator
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: got {
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: Expected ) in functio=
n declarator
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: got (
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: Expected ; at the end=
 of type declaration
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: got }
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: Expected ; at end of =
declaration
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: got ->
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: Trying to use reserve=
d word 'continue' as identifier
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: Expected ; at the end=
 of type declaration
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: got }
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: Expected ) in nested =
declarator
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: got {
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: Expected ) in functio=
n declarator
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: got (
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: Expected ; at the end=
 of type declaration
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: got }
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
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: symbol 'writeb_relaxe=
d' redeclared with different type (different argument counts):
>> drivers/tty/serial/lantiq.c:149:8: sparse:    int static [signed] [tople=
vel] writeb_relaxed( ... )
   drivers/tty/serial/lantiq.c: note: in included file (through arch/csky/i=
nclude/asm/io.h, include/linux/io.h):
   include/asm-generic/io.h:356:20: sparse: note: previously declared as:
>> include/asm-generic/io.h:356:20: sparse:    void static inline [gnu_inli=
ne] [toplevel] writeb_relaxed( ... )
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
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: symbol 'writeb_relaxe=
d' redeclared with different type (different argument counts):
>> drivers/tty/serial/lantiq.c:149:8: sparse:    int static [signed] [tople=
vel] writeb_relaxed( ... )
   include/asm-generic/io.h:356:20: sparse: note: previously declared as:
>> include/asm-generic/io.h:356:20: sparse:    void static inline [gnu_inli=
ne] [toplevel] writeb_relaxed( ... )
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

vim +149 drivers/tty/serial/lantiq.c

393b592949b2c6 Jiri Slaby 2022-09-01  148  =

393b592949b2c6 Jiri Slaby 2022-09-01 @149  static DEFINE_UART_PORT_TX_HELPE=
R(lqasc_tx_chars, port, ch,
393b592949b2c6 Jiri Slaby 2022-09-01  150  		lqasc_tx_ready(port),
393b592949b2c6 Jiri Slaby 2022-09-01  151  		writeb(ch, port->membase + LTQ=
_ASC_TBUF));
393b592949b2c6 Jiri Slaby 2022-09-01  152  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6452614898023844869==--

