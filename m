Content-Type: multipart/mixed; boundary="===============4192429774786486901=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 3/4] tty: serial: use DEFINE_UART_PORT_TX_HELPER()
Date: Thu, 08 Sep 2022 05:35:56 +0800
Message-ID: <202209080556.PuNVET73-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4192429774786486901==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/t=
ty/serial/vt8500_serial.c:197:8: sparse:    int static [signed] [toplevel] =
writeb_relaxed( ... )"
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
v6.0-rc4 next-20220907]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiri-Slaby/tty-TX-he=
lpers/20220906-185236
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-=
testing
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: csky-randconfig-s041-20220907 (https://download.01.org/0day-ci/arch=
ive/20220908/202209080556.PuNVET73-lkp(a)intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
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
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dc=
sky SHELL=3D/bin/bash drivers/tty/serial/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
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
function declarator
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: got (
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
function declarator
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: got (
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
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: symbol 'writeb=
_relaxed' redeclared with different type (different argument counts):
>> drivers/tty/serial/vt8500_serial.c:197:8: sparse:    int static [signed]=
 [toplevel] writeb_relaxed( ... )
   drivers/tty/serial/vt8500_serial.c: note: in included file (through arch=
/csky/include/asm/io.h, include/linux/io.h):
   include/asm-generic/io.h:356:20: sparse: note: previously declared as:
   include/asm-generic/io.h:356:20: sparse:    void static inline [gnu_inli=
ne] [toplevel] writeb_relaxed( ... )
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
   drivers/tty/serial/vt8500_serial.c:197:8: sparse: sparse: symbol 'writeb=
_relaxed' redeclared with different type (different argument counts):
>> drivers/tty/serial/vt8500_serial.c:197:8: sparse:    int static [signed]=
 [toplevel] writeb_relaxed( ... )
   include/asm-generic/io.h:356:20: sparse: note: previously declared as:
   include/asm-generic/io.h:356:20: sparse:    void static inline [gnu_inli=
ne] [toplevel] writeb_relaxed( ... )
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
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: Expected ) in nes=
ted declarator
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: got {
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: Expected ) in fun=
ction declarator
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: got (
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: got }
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: Expected ; at end=
 of declaration
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: got ->
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: Trying to use res=
erved word 'continue' as identifier
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: got }
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: Expected ) in nes=
ted declarator
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: got {
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: Expected ) in fun=
ction declarator
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: got (
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: got }
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
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: symbol 'writel_re=
laxed' redeclared with different type (different argument counts):
>> drivers/tty/serial/lpc32xx_hs.c:286:8: sparse:    int static [signed] [t=
oplevel] writel_relaxed( ... )
   drivers/tty/serial/lpc32xx_hs.c: note: in included file (through arch/cs=
ky/include/asm/io.h, include/linux/scatterlist.h, include/linux/kfifo.h, ..=
.):
   include/asm-generic/io.h:376:20: sparse: note: previously declared as:
   include/asm-generic/io.h:376:20: sparse:    void static inline [gnu_inli=
ne] [toplevel] writel_relaxed( ... )
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
   drivers/tty/serial/lpc32xx_hs.c:286:8: sparse: sparse: symbol 'writel_re=
laxed' redeclared with different type (different argument counts):
>> drivers/tty/serial/lpc32xx_hs.c:286:8: sparse:    int static [signed] [t=
oplevel] writel_relaxed( ... )
   include/asm-generic/io.h:376:20: sparse: note: previously declared as:
   include/asm-generic/io.h:376:20: sparse:    void static inline [gnu_inli=
ne] [toplevel] writel_relaxed( ... )
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
>> drivers/tty/serial/lpc32xx_hs.c:303:17: sparse: sparse: too many argumen=
ts for function writel_relaxed
   drivers/tty/serial/lpc32xx_hs.c:310:17: sparse: sparse: too many argumen=
ts for function writel_relaxed
   drivers/tty/serial/lpc32xx_hs.c:314:17: sparse: sparse: too many argumen=
ts for function writel_relaxed
   drivers/tty/serial/lpc32xx_hs.c:327:17: sparse: sparse: too many argumen=
ts for function writel_relaxed
   drivers/tty/serial/lpc32xx_hs.c:368:9: sparse: sparse: too many argument=
s for function writel_relaxed
   drivers/tty/serial/lpc32xx_hs.c:379:9: sparse: sparse: too many argument=
s for function writel_relaxed
   drivers/tty/serial/lpc32xx_hs.c:389:9: sparse: sparse: too many argument=
s for function writel_relaxed
   drivers/tty/serial/lpc32xx_hs.c:391:9: sparse: sparse: too many argument=
s for function writel_relaxed
   drivers/tty/serial/lpc32xx_hs.c:408:9: sparse: sparse: too many argument=
s for function writel_relaxed
   drivers/tty/serial/lpc32xx_hs.c:423:9: sparse: sparse: too many argument=
s for function writel_relaxed
   drivers/tty/serial/lpc32xx_hs.c:427:9: sparse: sparse: too many argument=
s for function writel_relaxed
   drivers/tty/serial/lpc32xx_hs.c:435:9: sparse: sparse: too many argument=
s for function writel_relaxed
   drivers/tty/serial/lpc32xx_hs.c:444:17: sparse: sparse: too many argumen=
ts for function writel_relaxed
   drivers/tty/serial/lpc32xx_hs.c:460:9: sparse: sparse: too many argument=
s for function writel_relaxed
   drivers/tty/serial/lpc32xx_hs.c:497:9: sparse: sparse: too many argument=
s for function writel_relaxed
   drivers/tty/serial/lpc32xx_hs.c:499:9: sparse: sparse: too many argument=
s for function writel_relaxed
   drivers/tty/serial/lpc32xx_hs.c:560:9: sparse: sparse: too many argument=
s for function writel_relaxed
   drivers/tty/serial/lpc32xx_hs.c:564:9: sparse: sparse: too many argument=
s for function writel_relaxed
   drivers/tty/serial/lpc32xx_hs.c:568:9: sparse: sparse: too many argument=
s for function writel_relaxed

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
--===============4192429774786486901==--

