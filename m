Content-Type: multipart/mixed; boundary="===============7548073685857051887=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/usb/serial/keyspan.c:791:2: warning: Value stored to 'endpoint' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 29 Aug 2021 10:52:10 +0800
Message-ID: <202108291042.33y0M9ds-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7548073685857051887==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>
CC: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3f5ad13cb012939e1797ec9cdf43941c169216d2
commit: 596b0474d3d9b1242eab713f84d8873f9887d980 kbuild: preprocess module =
linker script
date:   11 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 11 months ago
config: riscv-randconfig-c006-20210822 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 9e9d70=
591e72fc6762b4b9a226b68ed1307419bf)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D596b0474d3d9b1242eab713f84d8873f9887d980
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 596b0474d3d9b1242eab713f84d8873f9887d980
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   short_name, =

   report_size, =

   init, =

   write, =

   type, =

   max_brightness, =

   num_leds, =

   report_type, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct hidled_config {
   ~~~~~~~^~~~~~~~~~~~~~~
   drivers/hid/hid-led.c:70:8: note: Excessive padding in 'struct hidled_co=
nfig' (8 padding bytes, where 0 is optimal). Optimal fields order: name, sh=
ort_name, report_size, init, write, type, max_brightness, num_leds, report_=
type, consider reordering the fields or adding explicit padding members
   struct hidled_config {
   ~~~~~~~^~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/usb/core/file.c:160:6: warning: Value stored to 'minor_base' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           int minor_base =3D class_driver->minor_base;
               ^~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/core/file.c:160:6: note: Value stored to 'minor_base' during=
 its initialization is never read
           int minor_base =3D class_driver->minor_base;
               ^~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   42 warnings generated.
   Suppressed 42 warnings (28 in non-user code, 14 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   42 warnings generated.
   Suppressed 42 warnings (28 in non-user code, 14 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (8 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (13 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (13 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (12 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (13 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (13 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   22 warnings generated.
>> drivers/usb/serial/keyspan.c:791:2: warning: Value stored to 'endpoint' =
is never read [clang-analyzer-deadcode.DeadStores]
           endpoint =3D usb_pipeendpoint(urb->pipe);
           ^
   drivers/usb/serial/keyspan.c:791:2: note: Value stored to 'endpoint' is =
never read
>> drivers/usb/serial/keyspan.c:849:2: warning: Value stored to 'p_priv' is=
 never read [clang-analyzer-deadcode.DeadStores]
           p_priv =3D usb_get_serial_port_data(port);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/keyspan.c:849:2: note: Value stored to 'p_priv' is ne=
ver read
           p_priv =3D usb_get_serial_port_data(port);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/keyspan.c:940:2: warning: Value stored to 'data' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           data =3D urb->transfer_buffer;
           ^      ~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/keyspan.c:940:2: note: Value stored to 'data' is neve=
r read
           data =3D urb->transfer_buffer;
           ^      ~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/keyspan.c:1142:2: warning: Value stored to 'endpoint'=
 is never read [clang-analyzer-deadcode.DeadStores]
           endpoint =3D usb_pipeendpoint(urb->pipe);
           ^
   drivers/usb/serial/keyspan.c:1142:2: note: Value stored to 'endpoint' is=
 never read
   drivers/usb/serial/keyspan.c:1204:2: warning: Value stored to 'len' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           len =3D 0;
           ^     ~
   drivers/usb/serial/keyspan.c:1204:2: note: Value stored to 'len' is neve=
r read
           len =3D 0;
           ^     ~
   drivers/usb/serial/keyspan.c:1271:2: warning: Value stored to 'endpoint'=
 is never read [clang-analyzer-deadcode.DeadStores]
           endpoint =3D usb_pipeendpoint(urb->pipe);
           ^
   drivers/usb/serial/keyspan.c:1271:2: note: Value stored to 'endpoint' is=
 never read
>> drivers/usb/serial/keyspan.c:1752:3: warning: Value stored to 'ep_type_n=
ame' is never read [clang-analyzer-deadcode.DeadStores]
                   ep_type_name =3D "INT";
                   ^              ~~~~~
   drivers/usb/serial/keyspan.c:1752:3: note: Value stored to 'ep_type_name=
' is never read
                   ep_type_name =3D "INT";
                   ^              ~~~~~
   drivers/usb/serial/keyspan.c:1758:3: warning: Value stored to 'ep_type_n=
ame' is never read [clang-analyzer-deadcode.DeadStores]
                   ep_type_name =3D "BULK";
                   ^              ~~~~~~
   drivers/usb/serial/keyspan.c:1758:3: note: Value stored to 'ep_type_name=
' is never read
                   ep_type_name =3D "BULK";
                   ^              ~~~~~~
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (14 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (14 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   57 warnings generated.
   Suppressed 57 warnings (14 in non-user code, 43 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (14 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (14 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (14 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (14 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (14 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (14 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   drivers/usb/image/mdc800.c:274:17: warning: Value stored to 'dev' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &mdc800->dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~
   drivers/usb/image/mdc800.c:274:17: note: Value stored to 'dev' during it=
s initialization is never read
           struct device *dev =3D &mdc800->dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~
   drivers/usb/image/mdc800.c:634:2: warning: Value stored to 'retval' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           retval=3D0;
           ^      ~
   drivers/usb/image/mdc800.c:634:2: note: Value stored to 'retval' is neve=
r read
           retval=3D0;
           ^      ~
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   drivers/usb/serial/usb-serial.c:717:17: warning: Value stored to 'dev' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &serial->interface->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/usb-serial.c:717:17: note: Value stored to 'dev' duri=
ng its initialization is never read
           struct device *dev =3D &serial->interface->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/usb-serial.c:1414:2: warning: Value stored to 'rc' is=
 never read [clang-analyzer-deadcode.DeadStores]
           rc =3D driver_attach(&udriver->drvwrap.driver);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/usb-serial.c:1414:2: note: Value stored to 'rc' is ne=
ver read
           rc =3D driver_attach(&udriver->drvwrap.driver);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (14 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (14 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   22 warnings generated.
   Suppressed 22 warnings (15 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (12 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   net/core/dst.c:142:2: warning: Value stored to 'dst' is never read [clan=
g-analyzer-deadcode.DeadStores]
           dst =3D dst_destroy(dst);
           ^     ~~~~~~~~~~~~~~~~
   net/core/dst.c:142:2: note: Value stored to 'dst' is never read
           dst =3D dst_destroy(dst);

vim +/endpoint +791 drivers/usb/serial/keyspan.c

^1da177e4c3f415 Linus Torvalds     2005-04-16  782  =

7d12e780e003f93 David Howells      2006-10-05  783  static void	usa26_indat=
_callback(struct urb *urb)
^1da177e4c3f415 Linus Torvalds     2005-04-16  784  {
^1da177e4c3f415 Linus Torvalds     2005-04-16  785  	int			i, err;
^1da177e4c3f415 Linus Torvalds     2005-04-16  786  	int			endpoint;
^1da177e4c3f415 Linus Torvalds     2005-04-16  787  	struct usb_serial_port=
	*port;
^1da177e4c3f415 Linus Torvalds     2005-04-16  788  	unsigned char 		*data =
=3D urb->transfer_buffer;
95b934548049e2f Greg Kroah-Hartman 2007-06-15  789  	int status =3D urb->st=
atus;
^1da177e4c3f415 Linus Torvalds     2005-04-16  790  =

^1da177e4c3f415 Linus Torvalds     2005-04-16 @791  	endpoint =3D usb_pipee=
ndpoint(urb->pipe);
^1da177e4c3f415 Linus Torvalds     2005-04-16  792  =

95b934548049e2f Greg Kroah-Hartman 2007-06-15  793  	if (status) {
0cd782b0bea1917 Johan Hovold       2016-05-08  794  		dev_dbg(&urb->dev->de=
v, "%s - nonzero status %d on endpoint %x\n",
441b62c1edb9868 Harvey Harrison    2008-03-03  795  			__func__, status, en=
dpoint);
^1da177e4c3f415 Linus Torvalds     2005-04-16  796  		return;
^1da177e4c3f415 Linus Torvalds     2005-04-16  797  	}
^1da177e4c3f415 Linus Torvalds     2005-04-16  798  =

cdc977922891799 Ming Lei           2008-02-24  799  	port =3D  urb->context;
2e124b4a390ca85 Jiri Slaby         2013-01-03  800  	if (urb->actual_length=
) {
^1da177e4c3f415 Linus Torvalds     2005-04-16  801  		/* 0x80 bit is error =
flag */
^1da177e4c3f415 Linus Torvalds     2005-04-16  802  		if ((data[0] & 0x80) =
=3D=3D 0) {
deb91685784fc0b Alan Cox           2008-07-22  803  			/* no errors on indi=
vidual bytes, only
deb91685784fc0b Alan Cox           2008-07-22  804  			   possible overrun =
err */
855515a6d373124 Johan Hovold       2014-11-18  805  			if (data[0] & RXERRO=
R_OVERRUN) {
855515a6d373124 Johan Hovold       2014-11-18  806  				tty_insert_flip_cha=
r(&port->port, 0,
855515a6d373124 Johan Hovold       2014-11-18  807  								TTY_OVERRUN);
855515a6d373124 Johan Hovold       2014-11-18  808  			}
deb91685784fc0b Alan Cox           2008-07-22  809  			for (i =3D 1; i < ur=
b->actual_length ; ++i)
855515a6d373124 Johan Hovold       2014-11-18  810  				tty_insert_flip_cha=
r(&port->port, data[i],
855515a6d373124 Johan Hovold       2014-11-18  811  								TTY_NORMAL);
^1da177e4c3f415 Linus Torvalds     2005-04-16  812  		} else {
^1da177e4c3f415 Linus Torvalds     2005-04-16  813  			/* some bytes had er=
rors, every byte has status */
049c6b4e8f85d9e Greg Kroah-Hartman 2012-09-14  814  			dev_dbg(&port->dev, =
"%s - RX error!!!!\n", __func__);
^1da177e4c3f415 Linus Torvalds     2005-04-16  815  			for (i =3D 0; i + 1 =
< urb->actual_length; i +=3D 2) {
5d1678a33c731b5 Johan Hovold       2014-11-18  816  				int stat =3D data[i=
];
5d1678a33c731b5 Johan Hovold       2014-11-18  817  				int flag =3D TTY_NO=
RMAL;
5d1678a33c731b5 Johan Hovold       2014-11-18  818  =

5d1678a33c731b5 Johan Hovold       2014-11-18  819  				if (stat & RXERROR_=
OVERRUN) {
5d1678a33c731b5 Johan Hovold       2014-11-18  820  					tty_insert_flip_ch=
ar(&port->port, 0,
5d1678a33c731b5 Johan Hovold       2014-11-18  821  								TTY_OVERRUN);
5d1678a33c731b5 Johan Hovold       2014-11-18  822  				}
^1da177e4c3f415 Linus Torvalds     2005-04-16  823  				/* XXX should handl=
e break (0x10) */
5d1678a33c731b5 Johan Hovold       2014-11-18  824  				if (stat & RXERROR_=
PARITY)
5d1678a33c731b5 Johan Hovold       2014-11-18  825  					flag =3D TTY_PARIT=
Y;
5d1678a33c731b5 Johan Hovold       2014-11-18  826  				else if (stat & RXE=
RROR_FRAMING)
5d1678a33c731b5 Johan Hovold       2014-11-18  827  					flag =3D TTY_FRAME;
5d1678a33c731b5 Johan Hovold       2014-11-18  828  =

92a19f9cec9a80a Jiri Slaby         2013-01-03  829  				tty_insert_flip_cha=
r(&port->port, data[i+1],
92a19f9cec9a80a Jiri Slaby         2013-01-03  830  						flag);
^1da177e4c3f415 Linus Torvalds     2005-04-16  831  			}
^1da177e4c3f415 Linus Torvalds     2005-04-16  832  		}
2e124b4a390ca85 Jiri Slaby         2013-01-03  833  		tty_flip_buffer_push(=
&port->port);
^1da177e4c3f415 Linus Torvalds     2005-04-16  834  	}
^1da177e4c3f415 Linus Torvalds     2005-04-16  835  =

^1da177e4c3f415 Linus Torvalds     2005-04-16  836  	/* Resubmit urb so we =
continue receiving */
deb91685784fc0b Alan Cox           2008-07-22  837  	err =3D usb_submit_urb=
(urb, GFP_ATOMIC);
deb91685784fc0b Alan Cox           2008-07-22  838  	if (err !=3D 0)
049c6b4e8f85d9e Greg Kroah-Hartman 2012-09-14  839  		dev_dbg(&port->dev, "=
%s - resubmit read urb failed. (%d)\n", __func__, err);
^1da177e4c3f415 Linus Torvalds     2005-04-16  840  }
^1da177e4c3f415 Linus Torvalds     2005-04-16  841  =

^1da177e4c3f415 Linus Torvalds     2005-04-16  842  /* Outdat handling is c=
ommon for all devices */
7d12e780e003f93 David Howells      2006-10-05  843  static void	usa2x_outda=
t_callback(struct urb *urb)
^1da177e4c3f415 Linus Torvalds     2005-04-16  844  {
^1da177e4c3f415 Linus Torvalds     2005-04-16  845  	struct usb_serial_port=
 *port;
^1da177e4c3f415 Linus Torvalds     2005-04-16  846  	struct keyspan_port_pr=
ivate *p_priv;
^1da177e4c3f415 Linus Torvalds     2005-04-16  847  =

cdc977922891799 Ming Lei           2008-02-24  848  	port =3D  urb->context;
^1da177e4c3f415 Linus Torvalds     2005-04-16 @849  	p_priv =3D usb_get_ser=
ial_port_data(port);
049c6b4e8f85d9e Greg Kroah-Hartman 2012-09-14  850  	dev_dbg(&port->dev, "%=
s - urb %d\n", __func__, urb =3D=3D p_priv->out_urbs[1]);
^1da177e4c3f415 Linus Torvalds     2005-04-16  851  =

cf2c7481d2ff7f0 Pete Zaitcev       2006-05-22  852  	usb_serial_port_softin=
t(port);
^1da177e4c3f415 Linus Torvalds     2005-04-16  853  }
^1da177e4c3f415 Linus Torvalds     2005-04-16  854  =


:::::: The code at line 791 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7548073685857051887==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
0mrO6xr3YVxGkhlaa+X/AF450hoc4gEA
--===============7548073685857051887==--

