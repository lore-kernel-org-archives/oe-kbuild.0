Content-Type: multipart/mixed; boundary="===============1843794100056422892=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 2/3] tty: serial: use DEFINE_UART_PORT_TX_HELPER()
Date: Fri, 02 Sep 2022 04:10:28 +0800
Message-ID: <202209020425.h3flbKPo-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1843794100056422892==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/t=
ty/serial/altera_uart.c:249:8: sparse: sparse: Trying to use reserved word =
'for' as identifier"
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
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: alpha-randconfig-s042-20220901 (https://download.01.org/0day-ci/arc=
hive/20220902/202209020425.h3flbKPo-lkp(a)intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
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
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Da=
lpha SHELL=3D/bin/bash drivers/tty/serial/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   drivers/tty/serial/altera_uart.c:249:8: sparse: sparse: Expected ) in fu=
nction declarator
   drivers/tty/serial/altera_uart.c:249:8: sparse: sparse: got __VA_OPT__
   drivers/tty/serial/altera_uart.c:249:8: sparse: sparse: Expected ) in fu=
nction declarator
   drivers/tty/serial/altera_uart.c:249:8: sparse: sparse: got ;
>> drivers/tty/serial/altera_uart.c:249:8: sparse: sparse: Trying to use re=
served word 'for' as identifier
   drivers/tty/serial/altera_uart.c:249:8: sparse: sparse: Expected ; at en=
d of declaration
   drivers/tty/serial/altera_uart.c:249:8: sparse: sparse: got &&
   drivers/tty/serial/altera_uart.c:249:8: sparse: sparse: Expected ) in ne=
sted declarator
   drivers/tty/serial/altera_uart.c:249:8: sparse: sparse: got {
   drivers/tty/serial/altera_uart.c:249:8: sparse: sparse: Expected ) in fu=
nction declarator
   drivers/tty/serial/altera_uart.c:249:8: sparse: sparse: got ,
   drivers/tty/serial/altera_uart.c:249:8: sparse: sparse: Expected ; at en=
d of declaration
   drivers/tty/serial/altera_uart.c:249:8: sparse: sparse: got ->
>> drivers/tty/serial/altera_uart.c:249:8: sparse: sparse: Trying to use re=
served word 'continue' as identifier
   drivers/tty/serial/altera_uart.c:249:8: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/tty/serial/altera_uart.c:249:8: sparse: sparse: got }
   drivers/tty/serial/altera_uart.c:249:8: sparse: sparse: Expected ) in fu=
nction declarator
   drivers/tty/serial/altera_uart.c:249:8: sparse: sparse: got ,
   drivers/tty/serial/altera_uart.c:249:8: sparse: sparse: Expected ; at en=
d of declaration
   drivers/tty/serial/altera_uart.c:249:8: sparse: sparse: got ->
   drivers/tty/serial/altera_uart.c:249:8: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/tty/serial/altera_uart.c:249:8: sparse: sparse: got }
   drivers/tty/serial/altera_uart.c:249:8: sparse: sparse: Expected ) in fu=
nction declarator
   drivers/tty/serial/altera_uart.c:249:8: sparse: sparse: got <
>> drivers/tty/serial/altera_uart.c:249:8: sparse: sparse: Trying to use re=
served word 'if' as identifier
   drivers/tty/serial/altera_uart.c:249:8: sparse: sparse: Expected ) in fu=
nction declarator
   drivers/tty/serial/altera_uart.c:249:8: sparse: sparse: got =3D=3D
>> drivers/tty/serial/altera_uart.c:249:8: sparse: sparse: Trying to use re=
served word 'if' as identifier
   drivers/tty/serial/altera_uart.c:249:8: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/tty/serial/altera_uart.c:249:8: sparse: sparse: got }
   drivers/tty/serial/altera_uart.c:249:8: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/tty/serial/altera_uart.c:249:8: sparse: sparse: got }
   drivers/tty/serial/altera_uart.c:249:8: sparse: sparse: symbol 'true' re=
declared with different type (different signedness):
>> drivers/tty/serial/altera_uart.c:249:8: sparse:    int [addressable] [to=
plevel] true
   drivers/tty/serial/altera_uart.c: note: in included file (through includ=
e/uapi/linux/posix_types.h, include/uapi/linux/types.h, include/linux/types=
.h, ...):
   include/linux/stddef.h:12:9: sparse: note: previously declared as:
>> include/linux/stddef.h:12:9: sparse:    unsigned int enum <noident> [top=
level] true
   drivers/tty/serial/altera_uart.c:249:8: sparse: sparse: symbol 'altera_u=
art_writel' redeclared with different type (incompatible argument 1 (differ=
ent base types)):
>> drivers/tty/serial/altera_uart.c:249:8: sparse:    int static [signed] [=
toplevel] altera_uart_writel( ... )
   drivers/tty/serial/altera_uart.c:89:13: sparse: note: previously declare=
d as:
>> drivers/tty/serial/altera_uart.c:89:13: sparse:    void static [toplevel=
] altera_uart_writel( ... )
   drivers/tty/serial/altera_uart.c:249:8: sparse: sparse: undefined identi=
fier 'xmit'
   drivers/tty/serial/altera_uart.c:249:8: sparse: sparse: undefined identi=
fier 'xmit'
   drivers/tty/serial/altera_uart.c:249:8: sparse: sparse: symbol 'ch' rede=
clared with different type (different type sizes):
>> drivers/tty/serial/altera_uart.c:249:8: sparse:    int [addressable] [to=
plevel] ch
   drivers/tty/serial/altera_uart.c:249:8: sparse: note: previously declare=
d as:
>> drivers/tty/serial/altera_uart.c:249:8: sparse:    unsigned char [addres=
sable] [toplevel] [usertype] ch
   drivers/tty/serial/altera_uart.c:249:8: sparse: sparse: symbol 'altera_u=
art_writel' redeclared with different type (incompatible argument 1 (differ=
ent base types)):
>> drivers/tty/serial/altera_uart.c:249:8: sparse:    int static [signed] [=
toplevel] altera_uart_writel( ... )
   drivers/tty/serial/altera_uart.c:89:13: sparse: note: previously declare=
d as:
>> drivers/tty/serial/altera_uart.c:89:13: sparse:    void static [toplevel=
] altera_uart_writel( ... )
>> drivers/tty/serial/altera_uart.c:249:8: sparse: sparse: cannot dereferen=
ce this type
>> drivers/tty/serial/altera_uart.c:249:8: sparse: sparse: cannot dereferen=
ce this type
   drivers/tty/serial/altera_uart.c:249:8: sparse: sparse: symbol 'pending'=
 redeclared with different type (different signedness):
>> drivers/tty/serial/altera_uart.c:249:8: sparse:    int [addressable] [to=
plevel] pending
   drivers/tty/serial/altera_uart.c:249:8: sparse: note: previously declare=
d as:
>> drivers/tty/serial/altera_uart.c:249:8: sparse:    unsigned int [address=
able] [toplevel] pending
>> drivers/tty/serial/altera_uart.c:286:27: sparse: sparse: too many argume=
nts for function altera_uart_writel
   drivers/tty/serial/altera_uart.c:288:27: sparse: sparse: too many argume=
nts for function altera_uart_writel
--
   drivers/tty/serial/mps2-uart.c:130:8: sparse: sparse: Expected ) in func=
tion declarator
   drivers/tty/serial/mps2-uart.c:130:8: sparse: sparse: got __VA_OPT__
   drivers/tty/serial/mps2-uart.c:130:8: sparse: sparse: Expected ) in func=
tion declarator
   drivers/tty/serial/mps2-uart.c:130:8: sparse: sparse: got ;
>> drivers/tty/serial/mps2-uart.c:130:8: sparse: sparse: Trying to use rese=
rved word 'for' as identifier
   drivers/tty/serial/mps2-uart.c:130:8: sparse: sparse: Expected ; at end =
of declaration
   drivers/tty/serial/mps2-uart.c:130:8: sparse: sparse: got &&
   drivers/tty/serial/mps2-uart.c:130:8: sparse: sparse: Expected ) in nest=
ed declarator
   drivers/tty/serial/mps2-uart.c:130:8: sparse: sparse: got {
   drivers/tty/serial/mps2-uart.c:130:8: sparse: sparse: Expected ) in func=
tion declarator
   drivers/tty/serial/mps2-uart.c:130:8: sparse: sparse: got ,
   drivers/tty/serial/mps2-uart.c:130:8: sparse: sparse: Expected ; at end =
of declaration
   drivers/tty/serial/mps2-uart.c:130:8: sparse: sparse: got ->
>> drivers/tty/serial/mps2-uart.c:130:8: sparse: sparse: Trying to use rese=
rved word 'continue' as identifier
   drivers/tty/serial/mps2-uart.c:130:8: sparse: sparse: Expected ; at the =
end of type declaration
   drivers/tty/serial/mps2-uart.c:130:8: sparse: sparse: got }
   drivers/tty/serial/mps2-uart.c:130:8: sparse: sparse: Expected ) in func=
tion declarator
   drivers/tty/serial/mps2-uart.c:130:8: sparse: sparse: got ,
   drivers/tty/serial/mps2-uart.c:130:8: sparse: sparse: Expected ; at end =
of declaration
   drivers/tty/serial/mps2-uart.c:130:8: sparse: sparse: got ->
   drivers/tty/serial/mps2-uart.c:130:8: sparse: sparse: Expected ; at the =
end of type declaration
   drivers/tty/serial/mps2-uart.c:130:8: sparse: sparse: got }
   drivers/tty/serial/mps2-uart.c:130:8: sparse: sparse: Expected ) in func=
tion declarator
   drivers/tty/serial/mps2-uart.c:130:8: sparse: sparse: got <
>> drivers/tty/serial/mps2-uart.c:130:8: sparse: sparse: Trying to use rese=
rved word 'if' as identifier
   drivers/tty/serial/mps2-uart.c:130:8: sparse: sparse: Expected ) in func=
tion declarator
   drivers/tty/serial/mps2-uart.c:130:8: sparse: sparse: got =3D=3D
>> drivers/tty/serial/mps2-uart.c:130:8: sparse: sparse: Trying to use rese=
rved word 'if' as identifier
   drivers/tty/serial/mps2-uart.c:130:8: sparse: sparse: Expected ; at the =
end of type declaration
   drivers/tty/serial/mps2-uart.c:130:8: sparse: sparse: got }
   drivers/tty/serial/mps2-uart.c:130:8: sparse: sparse: Expected ; at the =
end of type declaration
   drivers/tty/serial/mps2-uart.c:130:8: sparse: sparse: got }
   drivers/tty/serial/mps2-uart.c:130:8: sparse: sparse: symbol 'true' rede=
clared with different type (different signedness):
>> drivers/tty/serial/mps2-uart.c:130:8: sparse:    int [addressable] [topl=
evel] true
   drivers/tty/serial/mps2-uart.c: note: in included file (through include/=
uapi/linux/posix_types.h, include/uapi/linux/types.h, include/linux/types.h=
, ...):
   include/linux/stddef.h:12:9: sparse: note: previously declared as:
>> include/linux/stddef.h:12:9: sparse:    unsigned int enum <noident> [top=
level] true
   drivers/tty/serial/mps2-uart.c:130:8: sparse: sparse: symbol 'mps2_uart_=
write8' redeclared with different type (incompatible argument 1 (different =
base types)):
>> drivers/tty/serial/mps2-uart.c:130:8: sparse:    int static [signed] [to=
plevel] mps2_uart_write8( ... )
   drivers/tty/serial/mps2-uart.c:84:13: sparse: note: previously declared =
as:
>> drivers/tty/serial/mps2-uart.c:84:13: sparse:    void static [toplevel] =
mps2_uart_write8( ... )
   drivers/tty/serial/mps2-uart.c:130:8: sparse: sparse: undefined identifi=
er 'xmit'
   drivers/tty/serial/mps2-uart.c:130:8: sparse: sparse: undefined identifi=
er 'xmit'
   drivers/tty/serial/mps2-uart.c:130:8: sparse: sparse: symbol 'ch' redecl=
ared with different type (different type sizes):
>> drivers/tty/serial/mps2-uart.c:130:8: sparse:    int [addressable] [topl=
evel] ch
   drivers/tty/serial/mps2-uart.c:130:8: sparse: note: previously declared =
as:
>> drivers/tty/serial/mps2-uart.c:130:8: sparse:    unsigned char [addressa=
ble] [toplevel] [usertype] ch
   drivers/tty/serial/mps2-uart.c:130:8: sparse: sparse: symbol 'mps2_uart_=
write8' redeclared with different type (incompatible argument 1 (different =
base types)):
>> drivers/tty/serial/mps2-uart.c:130:8: sparse:    int static [signed] [to=
plevel] mps2_uart_write8( ... )
   drivers/tty/serial/mps2-uart.c:84:13: sparse: note: previously declared =
as:
>> drivers/tty/serial/mps2-uart.c:84:13: sparse:    void static [toplevel] =
mps2_uart_write8( ... )
>> drivers/tty/serial/mps2-uart.c:130:8: sparse: sparse: cannot dereference=
 this type
>> drivers/tty/serial/mps2-uart.c:130:8: sparse: sparse: cannot dereference=
 this type
   drivers/tty/serial/mps2-uart.c:130:8: sparse: sparse: symbol 'pending' r=
edeclared with different type (different signedness):
>> drivers/tty/serial/mps2-uart.c:130:8: sparse:    int [addressable] [topl=
evel] pending
   drivers/tty/serial/mps2-uart.c:130:8: sparse: note: previously declared =
as:
>> drivers/tty/serial/mps2-uart.c:130:8: sparse:    unsigned int [addressab=
le] [toplevel] pending
>> drivers/tty/serial/mps2-uart.c:140:25: sparse: sparse: too many argument=
s for function mps2_uart_write8
   drivers/tty/serial/mps2-uart.c:158:25: sparse: sparse: too many argument=
s for function mps2_uart_write8
   drivers/tty/serial/mps2-uart.c:189:25: sparse: sparse: too many argument=
s for function mps2_uart_write8
   drivers/tty/serial/mps2-uart.c:207:25: sparse: sparse: too many argument=
s for function mps2_uart_write8
   drivers/tty/serial/mps2-uart.c:226:33: sparse: sparse: too many argument=
s for function mps2_uart_write8
   drivers/tty/serial/mps2-uart.c:239:33: sparse: sparse: too many argument=
s for function mps2_uart_write8
   drivers/tty/serial/mps2-uart.c:270:25: sparse: sparse: too many argument=
s for function mps2_uart_write8
   drivers/tty/serial/mps2-uart.c:307:25: sparse: sparse: too many argument=
s for function mps2_uart_write8
   drivers/tty/serial/mps2-uart.c:326:25: sparse: sparse: too many argument=
s for function mps2_uart_write8
   drivers/tty/serial/mps2-uart.c:417:25: sparse: sparse: too many argument=
s for function mps2_uart_write8
--
   drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: Expected ) in func=
tion declarator
   drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: got __VA_OPT__
   drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: Expected ) in func=
tion declarator
   drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: got ;
>> drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: Trying to use rese=
rved word 'for' as identifier
   drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: Expected ; at end =
of declaration
   drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: got &&
   drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: undefined identifi=
er 'port'
   drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: undefined identifi=
er 'port'
   drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: Expected ) in nest=
ed declarator
   drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: got mxs_auart_port
>> drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: Trying to use rese=
rved word 'struct' as identifier
   drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: Expected ; at the =
end of type declaration
   drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: got }
   drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: Expected ) in nest=
ed declarator
   drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: got {
   drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: Expected ) in func=
tion declarator
   drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: got ,
   drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: undefined identifi=
er 'port'
   drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: undefined identifi=
er 'port'
   drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: Expected ) in nest=
ed declarator
   drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: got mxs_auart_port
>> drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: Trying to use rese=
rved word 'struct' as identifier
   drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: Expected ; at the =
end of type declaration
   drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: got }
   drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: Expected ; at end =
of declaration
   drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: got ->
>> drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: Trying to use rese=
rved word 'continue' as identifier
   drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: Expected ; at the =
end of type declaration
   drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: got }
   drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: Expected ) in func=
tion declarator
   drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: got ,
>> drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: cannot dereference=
 this type
>> drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: cannot dereference=
 this type
   drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: Expected ) in nest=
ed declarator
   drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: got mxs_auart_port
>> drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: Trying to use rese=
rved word 'struct' as identifier
   drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: Expected ; at the =
end of type declaration
   drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: got }
   drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: Expected ; at end =
of declaration
   drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: got ->
   drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: Expected ; at the =
end of type declaration
   drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: got }
   drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: Expected ) in func=
tion declarator
   drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: got <
>> drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: Trying to use rese=
rved word 'if' as identifier
   drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: Expected ) in func=
tion declarator
   drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: got =3D=3D
>> drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: Trying to use rese=
rved word 'if' as identifier
   drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: Expected ; at the =
end of type declaration
   drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: got }
   drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: Expected ; at the =
end of type declaration
   drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: got }
   drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: symbol 'true' rede=
clared with different type (different signedness):
>> drivers/tty/serial/mxs-auart.c:569:8: sparse:    int [addressable] [topl=
evel] true
   drivers/tty/serial/mxs-auart.c: note: in included file (through include/=
uapi/linux/posix_types.h, include/uapi/linux/types.h, include/linux/types.h=
, ...):
   include/linux/stddef.h:12:9: sparse: note: previously declared as:
>> include/linux/stddef.h:12:9: sparse:    unsigned int enum <noident> [top=
level] true
   drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: symbol 'mxs_write'=
 redeclared with different type (incompatible argument 1 (different base ty=
pes)):
>> drivers/tty/serial/mxs-auart.c:569:8: sparse:    int static [signed] [to=
plevel] mxs_write( ... )
   drivers/tty/serial/mxs-auart.c:487:13: sparse: note: previously declared=
 as:
>> drivers/tty/serial/mxs-auart.c:487:13: sparse:    void static [toplevel]=
 mxs_write( ... )
   drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: undefined identifi=
er 'xmit'
   drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: undefined identifi=
er 'xmit'
   drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: symbol 'ch' redecl=
ared with different type (different type sizes):
>> drivers/tty/serial/mxs-auart.c:569:8: sparse:    int [addressable] [topl=
evel] ch
   drivers/tty/serial/mxs-auart.c:569:8: sparse: note: previously declared =
as:
>> drivers/tty/serial/mxs-auart.c:569:8: sparse:    unsigned char [addressa=
ble] [toplevel] [usertype] ch
   drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: symbol 'mxs_write'=
 redeclared with different type (incompatible argument 1 (different base ty=
pes)):
>> drivers/tty/serial/mxs-auart.c:569:8: sparse:    int static [signed] [to=
plevel] mxs_write( ... )
   drivers/tty/serial/mxs-auart.c:487:13: sparse: note: previously declared=
 as:
>> drivers/tty/serial/mxs-auart.c:487:13: sparse:    void static [toplevel]=
 mxs_write( ... )
>> drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: cannot dereference=
 this type
>> drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: cannot dereference=
 this type
   drivers/tty/serial/mxs-auart.c:569:8: sparse: sparse: symbol 'pending' r=
edeclared with different type (different signedness):
>> drivers/tty/serial/mxs-auart.c:569:8: sparse:    int [addressable] [topl=
evel] pending
   drivers/tty/serial/mxs-auart.c:569:8: sparse: note: previously declared =
as:
>> drivers/tty/serial/mxs-auart.c:569:8: sparse:    unsigned int [addressab=
le] [toplevel] pending
>> drivers/tty/serial/mxs-auart.c:658:18: sparse: sparse: too many argument=
s for function mxs_write
   drivers/tty/serial/mxs-auart.c:672:18: sparse: sparse: too many argument=
s for function mxs_write
   drivers/tty/serial/mxs-auart.c:718:18: sparse: sparse: too many argument=
s for function mxs_write
   drivers/tty/serial/mxs-auart.c:833:18: sparse: sparse: too many argument=
s for function mxs_write
   drivers/tty/serial/mxs-auart.c:1041:18: sparse: sparse: too many argumen=
ts for function mxs_write
   drivers/tty/serial/mxs-auart.c:1043:18: sparse: sparse: too many argumen=
ts for function mxs_write
   drivers/tty/serial/mxs-auart.c:1182:18: sparse: sparse: too many argumen=
ts for function mxs_write
--
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: Expected ) in functio=
n declarator
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: got __VA_OPT__
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: Expected ) in functio=
n declarator
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: got ;
>> drivers/tty/serial/lantiq.c:149:8: sparse: sparse: Trying to use reserve=
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
>> drivers/tty/serial/lantiq.c:149:8: sparse: sparse: Trying to use reserve=
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
>> drivers/tty/serial/lantiq.c:149:8: sparse: sparse: Trying to use reserve=
d word 'if' as identifier
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: Expected ) in functio=
n declarator
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: got =3D=3D
>> drivers/tty/serial/lantiq.c:149:8: sparse: sparse: Trying to use reserve=
d word 'if' as identifier
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: Expected ; at the end=
 of type declaration
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: got }
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: Expected ; at the end=
 of type declaration
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: got }
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: symbol 'true' redecla=
red with different type (different signedness):
>> drivers/tty/serial/lantiq.c:149:8: sparse:    int [addressable] [topleve=
l] true
   drivers/tty/serial/lantiq.c: note: in included file (through include/uap=
i/linux/posix_types.h, include/uapi/linux/types.h, include/linux/types.h, .=
..):
   include/linux/stddef.h:12:9: sparse: note: previously declared as:
>> include/linux/stddef.h:12:9: sparse:    unsigned int enum <noident> [top=
level] true
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: undefined identifier =
'xmit'
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: undefined identifier =
'xmit'
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: symbol 'ch' redeclare=
d with different type (different type sizes):
>> drivers/tty/serial/lantiq.c:149:8: sparse:    int [addressable] [topleve=
l] ch
   drivers/tty/serial/lantiq.c:149:8: sparse: note: previously declared as:
>> drivers/tty/serial/lantiq.c:149:8: sparse:    unsigned char [addressable=
] [toplevel] [usertype] ch
>> drivers/tty/serial/lantiq.c:149:8: sparse: sparse: cannot dereference th=
is type
>> drivers/tty/serial/lantiq.c:149:8: sparse: sparse: cannot dereference th=
is type
   drivers/tty/serial/lantiq.c:149:8: sparse: sparse: symbol 'pending' rede=
clared with different type (different signedness):
>> drivers/tty/serial/lantiq.c:149:8: sparse:    int [addressable] [topleve=
l] pending
   drivers/tty/serial/lantiq.c:149:8: sparse: note: previously declared as:
>> drivers/tty/serial/lantiq.c:149:8: sparse:    unsigned int [addressable]=
 [toplevel] pending
--
   drivers/tty/serial/owl-uart.c:182:8: sparse: sparse: Expected ) in funct=
ion declarator
   drivers/tty/serial/owl-uart.c:182:8: sparse: sparse: got __VA_OPT__
   drivers/tty/serial/owl-uart.c:182:8: sparse: sparse: Expected ) in funct=
ion declarator
   drivers/tty/serial/owl-uart.c:182:8: sparse: sparse: got ;
>> drivers/tty/serial/owl-uart.c:182:8: sparse: sparse: Trying to use reser=
ved word 'for' as identifier
   drivers/tty/serial/owl-uart.c:182:8: sparse: sparse: Expected ; at end o=
f declaration
   drivers/tty/serial/owl-uart.c:182:8: sparse: sparse: got &&
   drivers/tty/serial/owl-uart.c:182:8: sparse: sparse: Expected ) in neste=
d declarator
   drivers/tty/serial/owl-uart.c:182:8: sparse: sparse: got {
   drivers/tty/serial/owl-uart.c:182:8: sparse: sparse: Expected ) in funct=
ion declarator
   drivers/tty/serial/owl-uart.c:182:8: sparse: sparse: got ,
   drivers/tty/serial/owl-uart.c:182:8: sparse: sparse: Expected ; at end o=
f declaration
   drivers/tty/serial/owl-uart.c:182:8: sparse: sparse: got ->
>> drivers/tty/serial/owl-uart.c:182:8: sparse: sparse: Trying to use reser=
ved word 'continue' as identifier
   drivers/tty/serial/owl-uart.c:182:8: sparse: sparse: Expected ; at the e=
nd of type declaration
   drivers/tty/serial/owl-uart.c:182:8: sparse: sparse: got }
   drivers/tty/serial/owl-uart.c:182:8: sparse: sparse: Expected ) in funct=
ion declarator
   drivers/tty/serial/owl-uart.c:182:8: sparse: sparse: got ,
   drivers/tty/serial/owl-uart.c:182:8: sparse: sparse: Expected ; at end o=
f declaration
   drivers/tty/serial/owl-uart.c:182:8: sparse: sparse: got ->
   drivers/tty/serial/owl-uart.c:182:8: sparse: sparse: Expected ; at the e=
nd of type declaration
   drivers/tty/serial/owl-uart.c:182:8: sparse: sparse: got }
   drivers/tty/serial/owl-uart.c:182:8: sparse: sparse: Expected ) in funct=
ion declarator
   drivers/tty/serial/owl-uart.c:182:8: sparse: sparse: got <
>> drivers/tty/serial/owl-uart.c:182:8: sparse: sparse: Trying to use reser=
ved word 'if' as identifier
   drivers/tty/serial/owl-uart.c:182:8: sparse: sparse: Expected ) in funct=
ion declarator
   drivers/tty/serial/owl-uart.c:182:8: sparse: sparse: got =3D=3D
>> drivers/tty/serial/owl-uart.c:182:8: sparse: sparse: Trying to use reser=
ved word 'if' as identifier
   drivers/tty/serial/owl-uart.c:182:8: sparse: sparse: Expected ; at the e=
nd of type declaration
   drivers/tty/serial/owl-uart.c:182:8: sparse: sparse: got }
   drivers/tty/serial/owl-uart.c:182:8: sparse: sparse: Expected ; at the e=
nd of type declaration
   drivers/tty/serial/owl-uart.c:182:8: sparse: sparse: got }
   drivers/tty/serial/owl-uart.c:182:8: sparse: sparse: symbol 'true' redec=
lared with different type (different signedness):
>> drivers/tty/serial/owl-uart.c:182:8: sparse:    int [addressable] [tople=
vel] true
   drivers/tty/serial/owl-uart.c: note: in included file (through include/u=
api/linux/posix_types.h, include/uapi/linux/types.h, include/linux/types.h,=
 ...):
   include/linux/stddef.h:12:9: sparse: note: previously declared as:
>> include/linux/stddef.h:12:9: sparse:    unsigned int enum <noident> [top=
level] true
   drivers/tty/serial/owl-uart.c:182:8: sparse: sparse: symbol 'owl_uart_wr=
ite' redeclared with different type (incompatible argument 1 (different bas=
e types)):
>> drivers/tty/serial/owl-uart.c:182:8: sparse:    int static [signed] [top=
level] owl_uart_write( ... )
   drivers/tty/serial/owl-uart.c:84:20: sparse: note: previously declared a=
s:
>> drivers/tty/serial/owl-uart.c:84:20: sparse:    void static inline [gnu_=
inline] [toplevel] owl_uart_write( ... )
   drivers/tty/serial/owl-uart.c:182:8: sparse: sparse: undefined identifie=
r 'xmit'
   drivers/tty/serial/owl-uart.c:182:8: sparse: sparse: undefined identifie=
r 'xmit'
   drivers/tty/serial/owl-uart.c:182:8: sparse: sparse: symbol 'ch' redecla=
red with different type (different type sizes):
>> drivers/tty/serial/owl-uart.c:182:8: sparse:    int [addressable] [tople=
vel] ch
   drivers/tty/serial/owl-uart.c:182:8: sparse: note: previously declared a=
s:
>> drivers/tty/serial/owl-uart.c:182:8: sparse:    unsigned char [addressab=
le] [toplevel] [usertype] ch
   drivers/tty/serial/owl-uart.c:182:8: sparse: sparse: symbol 'owl_uart_wr=
ite' redeclared with different type (incompatible argument 1 (different bas=
e types)):
>> drivers/tty/serial/owl-uart.c:182:8: sparse:    int static [signed] [top=
level] owl_uart_write( ... )
   drivers/tty/serial/owl-uart.c:84:20: sparse: note: previously declared a=
s:
>> drivers/tty/serial/owl-uart.c:84:20: sparse:    void static inline [gnu_=
inline] [toplevel] owl_uart_write( ... )
>> drivers/tty/serial/owl-uart.c:182:8: sparse: sparse: cannot dereference =
this type
>> drivers/tty/serial/owl-uart.c:182:8: sparse: sparse: cannot dereference =
this type
   drivers/tty/serial/owl-uart.c:182:8: sparse: sparse: symbol 'pending' re=
declared with different type (different signedness):
>> drivers/tty/serial/owl-uart.c:182:8: sparse:    int [addressable] [tople=
vel] pending
   drivers/tty/serial/owl-uart.c:182:8: sparse: note: previously declared a=
s:
>> drivers/tty/serial/owl-uart.c:182:8: sparse:    unsigned int [addressabl=
e] [toplevel] pending
>> drivers/tty/serial/owl-uart.c:192:23: sparse: sparse: too many arguments=
 for function owl_uart_write
   drivers/tty/serial/owl-uart.c:242:23: sparse: sparse: too many arguments=
 for function owl_uart_write
   drivers/tty/serial/owl-uart.c:259:23: sparse: sparse: too many arguments=
 for function owl_uart_write
   drivers/tty/serial/owl-uart.c:282:23: sparse: sparse: too many arguments=
 for function owl_uart_write
   drivers/tty/serial/owl-uart.c:287:23: sparse: sparse: too many arguments=
 for function owl_uart_write
   drivers/tty/serial/owl-uart.c:354:23: sparse: sparse: too many arguments=
 for function owl_uart_write
--
   drivers/tty/serial/atmel_serial.c:815:8: sparse: sparse: Expected ) in f=
unction declarator
   drivers/tty/serial/atmel_serial.c:815:8: sparse: sparse: got __VA_OPT__
   drivers/tty/serial/atmel_serial.c:815:8: sparse: sparse: Expected ) in f=
unction declarator
   drivers/tty/serial/atmel_serial.c:815:8: sparse: sparse: got ;
>> drivers/tty/serial/atmel_serial.c:815:8: sparse: sparse: Trying to use r=
eserved word 'for' as identifier
   drivers/tty/serial/atmel_serial.c:815:8: sparse: sparse: Expected ; at e=
nd of declaration
   drivers/tty/serial/atmel_serial.c:815:8: sparse: sparse: got &&
   drivers/tty/serial/atmel_serial.c:815:8: sparse: sparse: Expected ) in n=
ested declarator
   drivers/tty/serial/atmel_serial.c:815:8: sparse: sparse: got {
   drivers/tty/serial/atmel_serial.c:815:8: sparse: sparse: Expected ; at e=
nd of declaration
   drivers/tty/serial/atmel_serial.c:815:8: sparse: sparse: got ->
>> drivers/tty/serial/atmel_serial.c:815:8: sparse: sparse: Trying to use r=
eserved word 'continue' as identifier
   drivers/tty/serial/atmel_serial.c:815:8: sparse: sparse: Expected ; at t=
he end of type declaration
   drivers/tty/serial/atmel_serial.c:815:8: sparse: sparse: got }
   drivers/tty/serial/atmel_serial.c:815:8: sparse: sparse: Expected ; at e=
nd of declaration
   drivers/tty/serial/atmel_serial.c:815:8: sparse: sparse: got ->
   drivers/tty/serial/atmel_serial.c:815:8: sparse: sparse: Expected ; at t=
he end of type declaration
   drivers/tty/serial/atmel_serial.c:815:8: sparse: sparse: got }
   drivers/tty/serial/atmel_serial.c:815:8: sparse: sparse: Expected ) in f=
unction declarator
   drivers/tty/serial/atmel_serial.c:815:8: sparse: sparse: got <
>> drivers/tty/serial/atmel_serial.c:815:8: sparse: sparse: Trying to use r=
eserved word 'if' as identifier
   drivers/tty/serial/atmel_serial.c:815:8: sparse: sparse: Expected ) in f=
unction declarator
   drivers/tty/serial/atmel_serial.c:815:8: sparse: sparse: got =3D=3D
>> drivers/tty/serial/atmel_serial.c:815:8: sparse: sparse: Trying to use r=
eserved word 'if' as identifier
   drivers/tty/serial/atmel_serial.c:815:8: sparse: sparse: Expected ; at t=
he end of type declaration
   drivers/tty/serial/atmel_serial.c:815:8: sparse: sparse: got }
   drivers/tty/serial/atmel_serial.c:815:8: sparse: sparse: Expected ; at t=
he end of type declaration
   drivers/tty/serial/atmel_serial.c:815:8: sparse: sparse: got }
   drivers/tty/serial/atmel_serial.c:815:8: sparse: sparse: symbol 'true' r=
edeclared with different type (different signedness):
>> drivers/tty/serial/atmel_serial.c:815:8: sparse:    int [addressable] [t=
oplevel] true
   drivers/tty/serial/atmel_serial.c: note: in included file (through inclu=
de/uapi/linux/posix_types.h, include/uapi/linux/types.h, include/linux/type=
s.h, ...):
   include/linux/stddef.h:12:9: sparse: note: previously declared as:
>> include/linux/stddef.h:12:9: sparse:    unsigned int enum <noident> [top=
level] true
   drivers/tty/serial/atmel_serial.c:815:8: sparse: sparse: symbol 'atmel_u=
art_write_char' redeclared with different type (incompatible argument 1 (di=
fferent base types)):
>> drivers/tty/serial/atmel_serial.c:815:8: sparse:    int static [signed] =
[toplevel] atmel_uart_write_char( ... )
   drivers/tty/serial/atmel_serial.c:219:20: sparse: note: previously decla=
red as:
>> drivers/tty/serial/atmel_serial.c:219:20: sparse:    void static inline =
[gnu_inline] [toplevel] atmel_uart_write_char( ... )
   drivers/tty/serial/atmel_serial.c:815:8: sparse: sparse: undefined ident=
ifier 'xmit'
   drivers/tty/serial/atmel_serial.c:815:8: sparse: sparse: undefined ident=
ifier 'xmit'
   drivers/tty/serial/atmel_serial.c:815:8: sparse: sparse: symbol 'ch' red=
eclared with different type (different type sizes):
>> drivers/tty/serial/atmel_serial.c:815:8: sparse:    int [addressable] [t=
oplevel] ch
   drivers/tty/serial/atmel_serial.c:815:8: sparse: note: previously declar=
ed as:
>> drivers/tty/serial/atmel_serial.c:815:8: sparse:    unsigned char [addre=
ssable] [toplevel] [usertype] ch
   drivers/tty/serial/atmel_serial.c:815:8: sparse: sparse: symbol 'atmel_u=
art_write_char' redeclared with different type (incompatible argument 1 (di=
fferent base types)):
>> drivers/tty/serial/atmel_serial.c:815:8: sparse:    int static [signed] =
[toplevel] atmel_uart_write_char( ... )
   drivers/tty/serial/atmel_serial.c:219:20: sparse: note: previously decla=
red as:
>> drivers/tty/serial/atmel_serial.c:219:20: sparse:    void static inline =
[gnu_inline] [toplevel] atmel_uart_write_char( ... )
>> drivers/tty/serial/atmel_serial.c:815:8: sparse: sparse: cannot derefere=
nce this type
>> drivers/tty/serial/atmel_serial.c:815:8: sparse: sparse: cannot derefere=
nce this type
   drivers/tty/serial/atmel_serial.c:815:8: sparse: sparse: symbol 'pending=
' redeclared with different type (different signedness):
>> drivers/tty/serial/atmel_serial.c:815:8: sparse:    int [addressable] [t=
oplevel] pending
   drivers/tty/serial/atmel_serial.c:815:8: sparse: note: previously declar=
ed as:
>> drivers/tty/serial/atmel_serial.c:815:8: sparse:    unsigned int [addres=
sable] [toplevel] pending
--
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: Expected ) in fun=
ction declarator
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: got __VA_OPT__
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: Expected ) in fun=
ction declarator
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: got ;
>> drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: Trying to use res=
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
>> drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: Trying to use res=
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
>> drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: Trying to use res=
erved word 'if' as identifier
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: Expected ) in fun=
ction declarator
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: got =3D=3D
>> drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: Trying to use res=
erved word 'if' as identifier
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: got }
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: got }
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: symbol 'true' red=
eclared with different type (different signedness):
>> drivers/tty/serial/fsl_lpuart.c:751:8: sparse:    int [addressable] [top=
level] true
   drivers/tty/serial/fsl_lpuart.c: note: in included file (through include=
/uapi/linux/posix_types.h, include/uapi/linux/types.h, include/linux/types.=
h, ...):
   include/linux/stddef.h:12:9: sparse: note: previously declared as:
>> include/linux/stddef.h:12:9: sparse:    unsigned int enum <noident> [top=
level] true
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: undefined identif=
ier 'xmit'
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: undefined identif=
ier 'xmit'
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: symbol 'ch' redec=
lared with different type (different type sizes):
>> drivers/tty/serial/fsl_lpuart.c:751:8: sparse:    int [addressable] [top=
level] ch
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: note: previously declared=
 as:
>> drivers/tty/serial/fsl_lpuart.c:751:8: sparse:    unsigned char [address=
able] [toplevel] [usertype] ch
>> drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: cannot dereferenc=
e this type
>> drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: cannot dereferenc=
e this type
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: sparse: symbol 'pending' =
redeclared with different type (different signedness):
>> drivers/tty/serial/fsl_lpuart.c:751:8: sparse:    int [addressable] [top=
level] pending
   drivers/tty/serial/fsl_lpuart.c:751:8: sparse: note: previously declared=
 as:
>> drivers/tty/serial/fsl_lpuart.c:751:8: sparse:    unsigned int [addressa=
ble] [toplevel] pending

vim +/for +249 drivers/tty/serial/altera_uart.c

0d426eda7c94d8 drivers/serial/altera_uart.c     Anton Vorontsov  2010-10-01=
   88  =

0d426eda7c94d8 drivers/serial/altera_uart.c     Anton Vorontsov  2010-10-01=
  @89  static void altera_uart_writel(struct uart_port *port, u32 dat, int =
reg)
0d426eda7c94d8 drivers/serial/altera_uart.c     Anton Vorontsov  2010-10-01=
   90  {
2780ad42f5fe67 drivers/tty/serial/altera_uart.c Tobias Klauser   2011-02-09=
   91  	writel(dat, port->membase + (reg << port->regshift));
0d426eda7c94d8 drivers/serial/altera_uart.c     Anton Vorontsov  2010-10-01=
   92  }
0d426eda7c94d8 drivers/serial/altera_uart.c     Anton Vorontsov  2010-10-01=
   93  =

6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
   94  static unsigned int altera_uart_tx_empty(struct uart_port *port)
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
   95  {
0d426eda7c94d8 drivers/serial/altera_uart.c     Anton Vorontsov  2010-10-01=
   96  	return (altera_uart_readl(port, ALTERA_UART_STATUS_REG) &
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
   97  		ALTERA_UART_STATUS_TMT_MSK) ? TIOCSER_TEMT : 0;
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
   98  }
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
   99  =

6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  100  static unsigned int altera_uart_get_mctrl(struct uart_port *port)
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  101  {
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  102  	struct altera_uart *pp =3D container_of(port, struct altera_uart, p=
ort);
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  103  	unsigned int sigs;
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  104  =

0d426eda7c94d8 drivers/serial/altera_uart.c     Anton Vorontsov  2010-10-01=
  105  	sigs =3D (altera_uart_readl(port, ALTERA_UART_STATUS_REG) &
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  106  	     ALTERA_UART_STATUS_CTS_MSK) ? TIOCM_CTS : 0;
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  107  	sigs |=3D (pp->sigs & TIOCM_RTS);
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  108  =

6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  109  	return sigs;
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  110  }
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  111  =

2ea6ad8bc60f66 drivers/tty/serial/altera_uart.c Uwe Kleine-K=C3=B6nig 2018-=
01-25  112  static void altera_uart_update_ctrl_reg(struct altera_uart *pp)
2ea6ad8bc60f66 drivers/tty/serial/altera_uart.c Uwe Kleine-K=C3=B6nig 2018-=
01-25  113  {
2ea6ad8bc60f66 drivers/tty/serial/altera_uart.c Uwe Kleine-K=C3=B6nig 2018-=
01-25  114  	unsigned short imr =3D pp->imr;
2ea6ad8bc60f66 drivers/tty/serial/altera_uart.c Uwe Kleine-K=C3=B6nig 2018-=
01-25  115  =

2ea6ad8bc60f66 drivers/tty/serial/altera_uart.c Uwe Kleine-K=C3=B6nig 2018-=
01-25  116  	/*
2ea6ad8bc60f66 drivers/tty/serial/altera_uart.c Uwe Kleine-K=C3=B6nig 2018-=
01-25  117  	 * If the device doesn't have an irq, ensure that the irq bits=
 are
2ea6ad8bc60f66 drivers/tty/serial/altera_uart.c Uwe Kleine-K=C3=B6nig 2018-=
01-25  118  	 * masked out to keep the irq line inactive.
2ea6ad8bc60f66 drivers/tty/serial/altera_uart.c Uwe Kleine-K=C3=B6nig 2018-=
01-25  119  	 */
2ea6ad8bc60f66 drivers/tty/serial/altera_uart.c Uwe Kleine-K=C3=B6nig 2018-=
01-25  120  	if (!pp->port.irq)
2ea6ad8bc60f66 drivers/tty/serial/altera_uart.c Uwe Kleine-K=C3=B6nig 2018-=
01-25  121  		imr &=3D ALTERA_UART_CONTROL_TRBK_MSK | ALTERA_UART_CONTROL_R=
TS_MSK;
2ea6ad8bc60f66 drivers/tty/serial/altera_uart.c Uwe Kleine-K=C3=B6nig 2018-=
01-25  122  =

2ea6ad8bc60f66 drivers/tty/serial/altera_uart.c Uwe Kleine-K=C3=B6nig 2018-=
01-25  123  	altera_uart_writel(&pp->port, imr, ALTERA_UART_CONTROL_REG);
2ea6ad8bc60f66 drivers/tty/serial/altera_uart.c Uwe Kleine-K=C3=B6nig 2018-=
01-25  124  }
2ea6ad8bc60f66 drivers/tty/serial/altera_uart.c Uwe Kleine-K=C3=B6nig 2018-=
01-25  125  =

6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  126  static void altera_uart_set_mctrl(struct uart_port *port, unsigned i=
nt sigs)
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  127  {
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  128  	struct altera_uart *pp =3D container_of(port, struct altera_uart, p=
ort);
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  129  =

6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  130  	pp->sigs =3D sigs;
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  131  	if (sigs & TIOCM_RTS)
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  132  		pp->imr |=3D ALTERA_UART_CONTROL_RTS_MSK;
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  133  	else
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  134  		pp->imr &=3D ~ALTERA_UART_CONTROL_RTS_MSK;
2ea6ad8bc60f66 drivers/tty/serial/altera_uart.c Uwe Kleine-K=C3=B6nig 2018-=
01-25  135  	altera_uart_update_ctrl_reg(pp);
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  136  }
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  137  =

6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  138  static void altera_uart_start_tx(struct uart_port *port)
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  139  {
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  140  	struct altera_uart *pp =3D container_of(port, struct altera_uart, p=
ort);
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  141  =

6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  142  	pp->imr |=3D ALTERA_UART_CONTROL_TRDY_MSK;
2ea6ad8bc60f66 drivers/tty/serial/altera_uart.c Uwe Kleine-K=C3=B6nig 2018-=
01-25  143  	altera_uart_update_ctrl_reg(pp);
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  144  }
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  145  =

6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  146  static void altera_uart_stop_tx(struct uart_port *port)
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  147  {
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  148  	struct altera_uart *pp =3D container_of(port, struct altera_uart, p=
ort);
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  149  =

6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  150  	pp->imr &=3D ~ALTERA_UART_CONTROL_TRDY_MSK;
2ea6ad8bc60f66 drivers/tty/serial/altera_uart.c Uwe Kleine-K=C3=B6nig 2018-=
01-25  151  	altera_uart_update_ctrl_reg(pp);
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  152  }
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  153  =

6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  154  static void altera_uart_stop_rx(struct uart_port *port)
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  155  {
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  156  	struct altera_uart *pp =3D container_of(port, struct altera_uart, p=
ort);
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  157  =

6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  158  	pp->imr &=3D ~ALTERA_UART_CONTROL_RRDY_MSK;
2ea6ad8bc60f66 drivers/tty/serial/altera_uart.c Uwe Kleine-K=C3=B6nig 2018-=
01-25  159  	altera_uart_update_ctrl_reg(pp);
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  160  }
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  161  =

6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  162  static void altera_uart_break_ctl(struct uart_port *port, int break_=
state)
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  163  {
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  164  	struct altera_uart *pp =3D container_of(port, struct altera_uart, p=
ort);
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  165  	unsigned long flags;
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  166  =

6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  167  	spin_lock_irqsave(&port->lock, flags);
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  168  	if (break_state =3D=3D -1)
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  169  		pp->imr |=3D ALTERA_UART_CONTROL_TRBK_MSK;
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  170  	else
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  171  		pp->imr &=3D ~ALTERA_UART_CONTROL_TRBK_MSK;
2ea6ad8bc60f66 drivers/tty/serial/altera_uart.c Uwe Kleine-K=C3=B6nig 2018-=
01-25  172  	altera_uart_update_ctrl_reg(pp);
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  173  	spin_unlock_irqrestore(&port->lock, flags);
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  174  }
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  175  =

6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  176  static void altera_uart_set_termios(struct uart_port *port,
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  177  				    struct ktermios *termios,
bec5b814d46c2a drivers/tty/serial/altera_uart.c Ilpo J=C3=A4rvinen    2022-=
08-16  178  				    const struct ktermios *old)
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  179  {
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  180  	unsigned long flags;
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  181  	unsigned int baud, baudclk;
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  182  =

6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  183  	baud =3D uart_get_baud_rate(port, termios, old, 0, 4000000);
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  184  	baudclk =3D port->uartclk / baud;
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  185  =

6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  186  	if (old)
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  187  		tty_termios_copy_hw(termios, old);
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  188  	tty_termios_encode_baud_rate(termios, baud, baud);
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  189  =

6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  190  	spin_lock_irqsave(&port->lock, flags);
2f8b9c15cd88ce drivers/serial/altera_uart.c     Anton Vorontsov  2010-10-01=
  191  	uart_update_timeout(port, termios->c_cflag, baud);
0d426eda7c94d8 drivers/serial/altera_uart.c     Anton Vorontsov  2010-10-01=
  192  	altera_uart_writel(port, baudclk, ALTERA_UART_DIVISOR_REG);
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  193  	spin_unlock_irqrestore(&port->lock, flags);
ef8b9ddcb45fa3 drivers/tty/serial/altera_uart.c Peter Hurley     2014-06-16=
  194  =

ef8b9ddcb45fa3 drivers/tty/serial/altera_uart.c Peter Hurley     2014-06-16=
  195  	/*
ef8b9ddcb45fa3 drivers/tty/serial/altera_uart.c Peter Hurley     2014-06-16=
  196  	 * FIXME: port->read_status_mask and port->ignore_status_mask
ef8b9ddcb45fa3 drivers/tty/serial/altera_uart.c Peter Hurley     2014-06-16=
  197  	 * need to be initialized based on termios settings for
ef8b9ddcb45fa3 drivers/tty/serial/altera_uart.c Peter Hurley     2014-06-16=
  198  	 * INPCK, IGNBRK, IGNPAR, PARMRK, BRKINT
ef8b9ddcb45fa3 drivers/tty/serial/altera_uart.c Peter Hurley     2014-06-16=
  199  	 */
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  200  }
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  201  =

6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  202  static void altera_uart_rx_chars(struct altera_uart *pp)
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  203  {
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  204  	struct uart_port *port =3D &pp->port;
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  205  	unsigned char ch, flag;
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  206  	unsigned short status;
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  207  =

0d426eda7c94d8 drivers/serial/altera_uart.c     Anton Vorontsov  2010-10-01=
  208  	while ((status =3D altera_uart_readl(port, ALTERA_UART_STATUS_REG))=
 &
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  209  	       ALTERA_UART_STATUS_RRDY_MSK) {
0d426eda7c94d8 drivers/serial/altera_uart.c     Anton Vorontsov  2010-10-01=
  210  		ch =3D altera_uart_readl(port, ALTERA_UART_RXDATA_REG);
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  211  		flag =3D TTY_NORMAL;
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  212  		port->icount.rx++;
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  213  =

6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  214  		if (status & ALTERA_UART_STATUS_E_MSK) {
0d426eda7c94d8 drivers/serial/altera_uart.c     Anton Vorontsov  2010-10-01=
  215  			altera_uart_writel(port, status,
0d426eda7c94d8 drivers/serial/altera_uart.c     Anton Vorontsov  2010-10-01=
  216  					   ALTERA_UART_STATUS_REG);
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  217  =

6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  218  			if (status & ALTERA_UART_STATUS_BRK_MSK) {
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  219  				port->icount.brk++;
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  220  				if (uart_handle_break(port))
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  221  					continue;
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  222  			} else if (status & ALTERA_UART_STATUS_PE_MSK) {
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  223  				port->icount.parity++;
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  224  			} else if (status & ALTERA_UART_STATUS_ROE_MSK) {
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  225  				port->icount.overrun++;
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  226  			} else if (status & ALTERA_UART_STATUS_FE_MSK) {
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  227  				port->icount.frame++;
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  228  			}
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  229  =

6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  230  			status &=3D port->read_status_mask;
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  231  =

6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  232  			if (status & ALTERA_UART_STATUS_BRK_MSK)
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  233  				flag =3D TTY_BREAK;
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  234  			else if (status & ALTERA_UART_STATUS_PE_MSK)
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  235  				flag =3D TTY_PARITY;
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  236  			else if (status & ALTERA_UART_STATUS_FE_MSK)
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  237  				flag =3D TTY_FRAME;
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  238  		}
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  239  =

6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  240  		if (uart_handle_sysrq_char(port, ch))
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  241  			continue;
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  242  		uart_insert_char(port, status, ALTERA_UART_STATUS_ROE_MSK, ch,
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  243  				 flag);
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  244  	}
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  245  =

2e124b4a390ca8 drivers/tty/serial/altera_uart.c Jiri Slaby       2013-01-03=
  246  	tty_flip_buffer_push(&port->state->port);
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  247  }
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  248  =

393b592949b2c6 drivers/tty/serial/altera_uart.c Jiri Slaby       2022-09-01=
 @249  static DEFINE_UART_PORT_TX_HELPER(altera_uart_tx_chars, port, ch,
393b592949b2c6 drivers/tty/serial/altera_uart.c Jiri Slaby       2022-09-01=
  250  		altera_uart_readl(port, ALTERA_UART_STATUS_REG) &
393b592949b2c6 drivers/tty/serial/altera_uart.c Jiri Slaby       2022-09-01=
  251  		                ALTERA_UART_STATUS_TRDY_MSK,
393b592949b2c6 drivers/tty/serial/altera_uart.c Jiri Slaby       2022-09-01=
  252  		altera_uart_writel(port, ch, ALTERA_UART_TXDATA_REG));
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  253  =

6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  254  static irqreturn_t altera_uart_interrupt(int irq, void *data)
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  255  {
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  256  	struct uart_port *port =3D data;
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  257  	struct altera_uart *pp =3D container_of(port, struct altera_uart, p=
ort);
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  258  	unsigned int isr;
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  259  =

0d426eda7c94d8 drivers/serial/altera_uart.c     Anton Vorontsov  2010-10-01=
  260  	isr =3D altera_uart_readl(port, ALTERA_UART_STATUS_REG) & pp->imr;
d8d721f4c005f9 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-25=
  261  =

d8d721f4c005f9 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-25=
  262  	spin_lock(&port->lock);
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  263  	if (isr & ALTERA_UART_STATUS_RRDY_MSK)
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  264  		altera_uart_rx_chars(pp);
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  265  	if (isr & ALTERA_UART_STATUS_TRDY_MSK)
393b592949b2c6 drivers/tty/serial/altera_uart.c Jiri Slaby       2022-09-01=
  266  		altera_uart_tx_chars(&pp->port);
d8d721f4c005f9 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-25=
  267  	spin_unlock(&port->lock);
d8d721f4c005f9 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-25=
  268  =

6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  269  	return IRQ_RETVAL(isr);
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  270  }
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  271  =

ad0cda7a90f269 drivers/tty/serial/altera_uart.c Kees Cook        2017-10-24=
  272  static void altera_uart_timer(struct timer_list *t)
2f8b9c15cd88ce drivers/serial/altera_uart.c     Anton Vorontsov  2010-10-01=
  273  {
ad0cda7a90f269 drivers/tty/serial/altera_uart.c Kees Cook        2017-10-24=
  274  	struct altera_uart *pp =3D from_timer(pp, t, tmr);
ad0cda7a90f269 drivers/tty/serial/altera_uart.c Kees Cook        2017-10-24=
  275  	struct uart_port *port =3D &pp->port;
2f8b9c15cd88ce drivers/serial/altera_uart.c     Anton Vorontsov  2010-10-01=
  276  =

2f8b9c15cd88ce drivers/serial/altera_uart.c     Anton Vorontsov  2010-10-01=
  277  	altera_uart_interrupt(0, port);
2f8b9c15cd88ce drivers/serial/altera_uart.c     Anton Vorontsov  2010-10-01=
  278  	mod_timer(&pp->tmr, jiffies + uart_poll_timeout(port));
2f8b9c15cd88ce drivers/serial/altera_uart.c     Anton Vorontsov  2010-10-01=
  279  }
2f8b9c15cd88ce drivers/serial/altera_uart.c     Anton Vorontsov  2010-10-01=
  280  =

6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  281  static void altera_uart_config_port(struct uart_port *port, int flag=
s)
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  282  {
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  283  	port->type =3D PORT_ALTERA_UART;
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  284  =

6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  285  	/* Clear mask, so no surprise interrupts. */
0d426eda7c94d8 drivers/serial/altera_uart.c     Anton Vorontsov  2010-10-01=
 @286  	altera_uart_writel(port, 0, ALTERA_UART_CONTROL_REG);
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  287  	/* Clear status register */
0d426eda7c94d8 drivers/serial/altera_uart.c     Anton Vorontsov  2010-10-01=
  288  	altera_uart_writel(port, 0, ALTERA_UART_STATUS_REG);
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  289  }
6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser   2010-05-05=
  290  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1843794100056422892==--

