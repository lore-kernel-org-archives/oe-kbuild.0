Content-Type: multipart/mixed; boundary="===============1496990785897099166=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 4/4] tty: serial: use DEFINE_UART_PORT_TX_HELPER_LIMITED()
Date: Thu, 08 Sep 2022 08:56:38 +0800
Message-ID: <202209080807.sMjI4CqQ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1496990785897099166==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/t=
ty/serial/amba-pl010.c:165:8: sparse:    int static [signed] [toplevel] wri=
tel_relaxed( ... )"
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
v6.0-rc4 next-20220907]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiri-Slaby/tty-TX-he=
lpers/20220906-185236
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-=
testing
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: csky-randconfig-s041-20220907 (https://download.01.org/0day-ci/arch=
ive/20220908/202209080807.sMjI4CqQ-lkp(a)intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
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
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dc=
sky SHELL=3D/bin/bash drivers/tty/serial/

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
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: symbol 'writel_re=
laxed' redeclared with different type (different argument counts):
>> drivers/tty/serial/amba-pl010.c:165:8: sparse:    int static [signed] [t=
oplevel] writel_relaxed( ... )
   drivers/tty/serial/amba-pl010.c: note: in included file (through arch/cs=
ky/include/asm/io.h, include/linux/scatterlist.h, include/linux/kfifo.h, ..=
.):
   include/asm-generic/io.h:376:20: sparse: note: previously declared as:
   include/asm-generic/io.h:376:20: sparse:    void static inline [gnu_inli=
ne] [toplevel] writel_relaxed( ... )
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
   drivers/tty/serial/amba-pl010.c:165:8: sparse: sparse: symbol 'writel_re=
laxed' redeclared with different type (different argument counts):
>> drivers/tty/serial/amba-pl010.c:165:8: sparse:    int static [signed] [t=
oplevel] writel_relaxed( ... )
   include/asm-generic/io.h:376:20: sparse: note: previously declared as:
   include/asm-generic/io.h:376:20: sparse:    void static inline [gnu_inli=
ne] [toplevel] writel_relaxed( ... )
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
s for function writel_relaxed
   drivers/tty/serial/amba-pl010.c:214:47: sparse: sparse: too many argumen=
ts for function pl010_tx_chars
   drivers/tty/serial/amba-pl010.c:273:9: sparse: sparse: too many argument=
s for function writel_relaxed
   drivers/tty/serial/amba-pl010.c:307:9: sparse: sparse: too many argument=
s for function writel_relaxed
   drivers/tty/serial/amba-pl010.c:331:9: sparse: sparse: too many argument=
s for function writel_relaxed
   drivers/tty/serial/amba-pl010.c:334:9: sparse: sparse: too many argument=
s for function writel_relaxed
   drivers/tty/serial/amba-pl010.c:424:9: sparse: sparse: too many argument=
s for function writel_relaxed
   drivers/tty/serial/amba-pl010.c:425:9: sparse: sparse: too many argument=
s for function writel_relaxed
   drivers/tty/serial/amba-pl010.c:432:9: sparse: sparse: too many argument=
s for function writel_relaxed
   drivers/tty/serial/amba-pl010.c:433:9: sparse: sparse: too many argument=
s for function writel_relaxed

vim +165 drivers/tty/serial/amba-pl010.c

^1da177e4c3f415 drivers/serial/amba-pl010.c     Linus Torvalds 2005-04-16  =
164  =

acf6bd027deb5ad drivers/tty/serial/amba-pl010.c Jiri Slaby     2022-09-06 @=
165  static DEFINE_UART_PORT_TX_HELPER_LIMITED(pl010_tx_chars,
acf6bd027deb5ad drivers/tty/serial/amba-pl010.c Jiri Slaby     2022-09-06  =
166  		true,
acf6bd027deb5ad drivers/tty/serial/amba-pl010.c Jiri Slaby     2022-09-06  =
167  		writel(ch, port->membase + UART01x_DR),
acf6bd027deb5ad drivers/tty/serial/amba-pl010.c Jiri Slaby     2022-09-06  =
168  		({}));
^1da177e4c3f415 drivers/serial/amba-pl010.c     Linus Torvalds 2005-04-16  =
169  =

1b0646a033c370d drivers/serial/amba-pl010.c     Russell King   2007-04-22  =
170  static void pl010_modem_status(struct uart_amba_port *uap)
^1da177e4c3f415 drivers/serial/amba-pl010.c     Linus Torvalds 2005-04-16  =
171  {
f166d19f9e82431 drivers/tty/serial/amba-pl010.c Jiri Slaby     2022-02-24  =
172  	struct uart_port *port =3D &uap->port;
^1da177e4c3f415 drivers/serial/amba-pl010.c     Linus Torvalds 2005-04-16  =
173  	unsigned int status, delta;
^1da177e4c3f415 drivers/serial/amba-pl010.c     Linus Torvalds 2005-04-16  =
174  =

f166d19f9e82431 drivers/tty/serial/amba-pl010.c Jiri Slaby     2022-02-24 @=
175  	writel(0, port->membase + UART010_ICR);
^1da177e4c3f415 drivers/serial/amba-pl010.c     Linus Torvalds 2005-04-16  =
176  =

f166d19f9e82431 drivers/tty/serial/amba-pl010.c Jiri Slaby     2022-02-24  =
177  	status =3D readb(port->membase + UART01x_FR) & UART01x_FR_MODEM_ANY;
^1da177e4c3f415 drivers/serial/amba-pl010.c     Linus Torvalds 2005-04-16  =
178  =

^1da177e4c3f415 drivers/serial/amba-pl010.c     Linus Torvalds 2005-04-16  =
179  	delta =3D status ^ uap->old_status;
^1da177e4c3f415 drivers/serial/amba-pl010.c     Linus Torvalds 2005-04-16  =
180  	uap->old_status =3D status;
^1da177e4c3f415 drivers/serial/amba-pl010.c     Linus Torvalds 2005-04-16  =
181  =

^1da177e4c3f415 drivers/serial/amba-pl010.c     Linus Torvalds 2005-04-16  =
182  	if (!delta)
^1da177e4c3f415 drivers/serial/amba-pl010.c     Linus Torvalds 2005-04-16  =
183  		return;
^1da177e4c3f415 drivers/serial/amba-pl010.c     Linus Torvalds 2005-04-16  =
184  =

^1da177e4c3f415 drivers/serial/amba-pl010.c     Linus Torvalds 2005-04-16  =
185  	if (delta & UART01x_FR_DCD)
f166d19f9e82431 drivers/tty/serial/amba-pl010.c Jiri Slaby     2022-02-24  =
186  		uart_handle_dcd_change(port, status & UART01x_FR_DCD);
^1da177e4c3f415 drivers/serial/amba-pl010.c     Linus Torvalds 2005-04-16  =
187  =

^1da177e4c3f415 drivers/serial/amba-pl010.c     Linus Torvalds 2005-04-16  =
188  	if (delta & UART01x_FR_DSR)
f166d19f9e82431 drivers/tty/serial/amba-pl010.c Jiri Slaby     2022-02-24  =
189  		port->icount.dsr++;
^1da177e4c3f415 drivers/serial/amba-pl010.c     Linus Torvalds 2005-04-16  =
190  =

^1da177e4c3f415 drivers/serial/amba-pl010.c     Linus Torvalds 2005-04-16  =
191  	if (delta & UART01x_FR_CTS)
f166d19f9e82431 drivers/tty/serial/amba-pl010.c Jiri Slaby     2022-02-24  =
192  		uart_handle_cts_change(port, status & UART01x_FR_CTS);
^1da177e4c3f415 drivers/serial/amba-pl010.c     Linus Torvalds 2005-04-16  =
193  =

f166d19f9e82431 drivers/tty/serial/amba-pl010.c Jiri Slaby     2022-02-24  =
194  	wake_up_interruptible(&port->state->port.delta_msr_wait);
^1da177e4c3f415 drivers/serial/amba-pl010.c     Linus Torvalds 2005-04-16  =
195  }
^1da177e4c3f415 drivers/serial/amba-pl010.c     Linus Torvalds 2005-04-16  =
196  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1496990785897099166==--

