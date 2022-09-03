Content-Type: multipart/mixed; boundary="===============5928558527615117587=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 2/3] tty: serial: use DEFINE_UART_PORT_TX_HELPER()
Date: Sat, 03 Sep 2022 09:14:12 +0800
Message-ID: <202209030908.sJE470N9-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5928558527615117587==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/t=
ty/serial/vt8500_serial.c:197:8: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier"
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
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: sparc64-randconfig-s041-20220901 (https://download.01.org/0day-ci/a=
rchive/20220903/202209030908.sJE470N9-lkp(a)intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
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
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Ds=
parc64 SHELL=3D/bin/bash drivers/tty/serial/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: Expected ) in =
function declarator
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: got __VA_OPT__
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: Expected ) in =
function declarator
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: got ;
>> drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: Trying to use =
reserved word 'for' as identifier
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: Expected ; at =
end of declaration
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: got &&
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: Expected ) in =
nested declarator
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: got {
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: Expected ) in =
function declarator
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: got ->
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: Expected ; at =
end of declaration
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: got ->
>> drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: Trying to use =
reserved word 'continue' as identifier
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: Expected ; at =
the end of type declaration
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: got }
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: Expected ) in =
function declarator
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: got ->
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: Expected ; at =
end of declaration
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: got ->
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: Expected ; at =
the end of type declaration
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: got }
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: Expected ) in =
function declarator
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: got <
>> drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: Trying to use =
reserved word 'if' as identifier
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: Expected ) in =
function declarator
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: got =3D=3D
>> drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: Trying to use =
reserved word 'if' as identifier
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: Expected ; at =
the end of type declaration
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: got }
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: Expected ; at =
the end of type declaration
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: got }
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: symbol 'true' =
redeclared with different type (different signedness):
>> drivers/tty/serial/vt8500_serial.c:197:8: sparse:    int [addressable] [=
toplevel] true
   drivers/tty/serial/vt8500_serial.c: note: in included file (through incl=
ude/uapi/linux/posix_types.h, include/uapi/linux/types.h, include/linux/typ=
es.h, ...):
   include/linux/stddef.h:12:9: sparse: note: previously declared as:
   include/linux/stddef.h:12:9: sparse:    unsigned int enum <noident> [top=
level] true
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: symbol 'writeb=
' redeclared with different type (incompatible argument 1 (different base t=
ypes)):
>> drivers/tty/serial/vt8500_serial.c:197:8: sparse:    int static [signed]=
 [toplevel] writeb( ... )
   drivers/tty/serial/vt8500_serial.c: note: in included file (through arch=
/sparc/include/asm/io.h, include/linux/io.h):
   arch/sparc/include/asm/io_64.h:157:20: sparse: note: previously declared=
 as:
>> arch/sparc/include/asm/io_64.h:157:20: sparse:    void static inline [gn=
u_inline] [toplevel] writeb( ... )
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: undefined iden=
tifier 'xmit'
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: undefined iden=
tifier 'xmit'
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: symbol 'ch' re=
declared with different type (different type sizes):
>> drivers/tty/serial/vt8500_serial.c:197:8: sparse:    int [addressable] [=
toplevel] ch
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: note: previously decla=
red as:
>> drivers/tty/serial/vt8500_serial.c:197:8: sparse:    unsigned char [addr=
essable] [toplevel] [usertype] ch
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: symbol 'writeb=
' redeclared with different type (incompatible argument 1 (different base t=
ypes)):
>> drivers/tty/serial/vt8500_serial.c:197:8: sparse:    int static [signed]=
 [toplevel] writeb( ... )
   arch/sparc/include/asm/io_64.h:157:20: sparse: note: previously declared=
 as:
>> arch/sparc/include/asm/io_64.h:157:20: sparse:    void static inline [gn=
u_inline] [toplevel] writeb( ... )
>> drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: cannot derefer=
ence this type
>> drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: cannot derefer=
ence this type
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: symbol 'pendin=
g' redeclared with different type (different signedness):
>> drivers/tty/serial/vt8500_serial.c:197:8: sparse:    int [addressable] [=
toplevel] pending
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: note: previously decla=
red as:
>> drivers/tty/serial/vt8500_serial.c:197:8: sparse:    unsigned int [addre=
ssable] [toplevel] pending
--
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
   drivers/tty/serial/lantiq.c: note: in included file (through arch/sparc/=
include/asm/io.h, include/linux/io.h):
   arch/sparc/include/asm/io_64.h:157:20: sparse: note: previously declared=
 as:
>> arch/sparc/include/asm/io_64.h:157:20: sparse:    void static inline [gn=
u_inline] [toplevel] writeb( ... )
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
   arch/sparc/include/asm/io_64.h:157:20: sparse: note: previously declared=
 as:
>> arch/sparc/include/asm/io_64.h:157:20: sparse:    void static inline [gn=
u_inline] [toplevel] writeb( ... )
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
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: Expected ) in fun=
ction declarator
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: got __VA_OPT__
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: Expected ) in fun=
ction declarator
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: got ;
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: Trying to use res=
erved word 'for' as identifier
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: Expected ; at end=
 of declaration
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: got &&
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: Expected ) in nes=
ted declarator
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: got {
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: Expected ) in fun=
ction declarator
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: got ->
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: Expected ; at end=
 of declaration
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: got ->
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: Trying to use res=
erved word 'continue' as identifier
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: got }
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: Expected ) in fun=
ction declarator
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: got ->
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: Expected ; at end=
 of declaration
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: got ->
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: got }
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: Expected ) in fun=
ction declarator
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: got <
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: Trying to use res=
erved word 'if' as identifier
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: Expected ) in fun=
ction declarator
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: got =3D=3D
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: Trying to use res=
erved word 'if' as identifier
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: got }
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: Expected ;@the=
 end of type declaration
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: got }
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: symbol 'true' red=
eclared with different type (different signedness):
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse:    int [addressable] [top=
level] true
   drivers/tty/serial/fsl_lpuart.c: note: in included file (through include=
/uapi/linux/posix_types.h, include/uapi/linux/types.h, include/linux/types.=
h, ...):
   include/linux/stddef.h:12:9: sparse: note: previously declared as:
   include/linux/stddef.h:12:9: sparse:    unsigned int enum <noident> [top=
level] true
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: symbol 'writeb' r=
edeclared with different type (incompatible argument 1 (different base type=
s)):
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse:    int static [signed] [t=
oplevel] writeb( ... )
   drivers/tty/serial/fsl_lpuart.c: note: in included file (through arch/sp=
arc/include/asm/io.h, include/linux/scatterlist.h, include/linux/dma-mappin=
g.h):
   arch/sparc/include/asm/io_64.h:157:20: sparse: note: previously declared=
 as:
>> arch/sparc/include/asm/io_64.h:157:20: sparse:    void static inline [gn=
u_inline] [toplevel] writeb( ... )
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: undefined identif=
ier 'xmit'
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: undefined identif=
ier 'xmit'
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: symbol 'ch' redec=
lared with different type (different type sizes):
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse:    int [addressable] [top=
level] ch
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: note: previously declared=
 as:
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse:    unsigned char [address=
able] [toplevel] [usertype] ch
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: symbol 'writeb' r=
edeclared with different type (incompatible argument 1 (different base type=
s)):
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse:    int static [signed] [t=
oplevel] writeb( ... )
   arch/sparc/include/asm/io_64.h:157:20: sparse: note: previously declared=
 as:
>> arch/sparc/include/asm/io_64.h:157:20: sparse:    void static inline [gn=
u_inline] [toplevel] writeb( ... )
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: cannot dereferenc=
e this type
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: cannot dereferenc=
e this type
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: symbol 'pending' =
redeclared with different type (different signedness):
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse:    int [addressable] [top=
level] pending
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: note: previously declared=
 as:
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse:    unsigned int [addressa=
ble] [toplevel] pending

vim +/for +197 drivers/tty/serial/vt8500_serial.c

304e12665a4a7b drivers/serial/vt8500_serial.c     Alexey Charkov 2010-11-08=
  196  =

393b592949b2c6 drivers/tty/serial/vt8500_serial.c Jiri Slaby     2022-09-01=
 @197  static DEFINE_UART_PORT_TX_HELPER(handle_tx, port, ch,
393b592949b2c6 drivers/tty/serial/vt8500_serial.c Jiri Slaby     2022-09-01=
  198  		vt8500_tx_empty(port),
393b592949b2c6 drivers/tty/serial/vt8500_serial.c Jiri Slaby     2022-09-01=
  199  		writeb(ch, port->membase + VT8500_TXFIFO));
304e12665a4a7b drivers/serial/vt8500_serial.c     Alexey Charkov 2010-11-08=
  200  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5928558527615117587==--

