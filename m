Content-Type: multipart/mixed; boundary="===============1456377584382163285=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] usb: serial: Repair FTDI FT232R bricked eeprom
Date: Wed, 09 Sep 2020 02:48:06 +0800
Message-ID: <202009090206.JyzStPxC%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1456377584382163285==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200908063609.2817032-1-james.hilliard1@gmail.com>
References: <20200908063609.2817032-1-james.hilliard1@gmail.com>
TO: James Hilliard <james.hilliard1@gmail.com>
TO: linux-usb(a)vger.kernel.org
CC: Johan Hovold <johan@kernel.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: linux-kernel(a)vger.kernel.org
CC: James Hilliard <james.hilliard1@gmail.com>
CC: Russ Dill <Russ.Dill@gmail.com>
CC: Hector Martin <hector@marcansoft.com>

Hi James,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on usb-serial/usb-next]
[also build test WARNING on usb/usb-testing peter.chen-usb/ci-for-usb-next =
balbi-usb/testing/next v5.9-rc4 next-20200903]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/James-Hilliard/usb-serial-=
Repair-FTDI-FT232R-bricked-eeprom/20200908-143733
base:   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.gi=
t usb-next
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
compiler: sparc64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

   drivers/usb/serial/ftdi_sio.c:1688:10: warning: %i in format string (no.=
 1) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfA=
rgType_sint]
     return sprintf(buf, "%in", priv->latency);
            ^
>> drivers/usb/serial/ftdi_sio.c:2291:17: warning: Variable 'priv->latency'=
 is reassigned a value before the old one has been used. [redundantAssignme=
nt]
     priv->latency =3D orig_latency;
                   ^
   drivers/usb/serial/ftdi_sio.c:2289:17: note: Variable 'priv->latency' is=
 reassigned a value before the old one has been used.
     priv->latency =3D 0x77;
                   ^
   drivers/usb/serial/ftdi_sio.c:2291:17: note: Variable 'priv->latency' is=
 reassigned a value before the old one has been used.
     priv->latency =3D orig_latency;
                   ^
   drivers/usb/serial/ftdi_sio.c:2810:8: warning: Variable 'cflag' is reass=
igned a value before the old one has been used. [redundantAssignment]
    cflag =3D termios->c_cflag;
          ^
   drivers/usb/serial/ftdi_sio.c:2768:0: note: Variable 'cflag' is reassign=
ed a value before the old one has been used.
    unsigned int cflag =3D termios->c_cflag;
   ^
   drivers/usb/serial/ftdi_sio.c:2810:8: note: Variable 'cflag' is reassign=
ed a value before the old one has been used.
    cflag =3D termios->c_cflag;
          ^

# https://github.com/0day-ci/linux/commit/7eb2ed589ba1653721e98ee20e339030a=
8fe8032
git remote add linux-review https://github.com/0day-ci/linux
git fetch --no-tags linux-review James-Hilliard/usb-serial-Repair-FTDI-FT23=
2R-bricked-eeprom/20200908-143733
git checkout 7eb2ed589ba1653721e98ee20e339030a8fe8032
vim +2291 drivers/usb/serial/ftdi_sio.c

7eb2ed589ba165 James Hilliard 2020-09-08  2266  =

7eb2ed589ba165 James Hilliard 2020-09-08  2267  static int ftdi_repair_bric=
k(struct usb_serial_port *port)
7eb2ed589ba165 James Hilliard 2020-09-08  2268  {
7eb2ed589ba165 James Hilliard 2020-09-08  2269  	struct ftdi_private *priv =
=3D usb_get_serial_port_data(port);
7eb2ed589ba165 James Hilliard 2020-09-08  2270  	int orig_latency;
7eb2ed589ba165 James Hilliard 2020-09-08  2271  	int rv;
7eb2ed589ba165 James Hilliard 2020-09-08  2272  	u16 *eeprom_data;
7eb2ed589ba165 James Hilliard 2020-09-08  2273  	u16 checksum;
7eb2ed589ba165 James Hilliard 2020-09-08  2274  	int eeprom_size;
7eb2ed589ba165 James Hilliard 2020-09-08  2275  	int result;
7eb2ed589ba165 James Hilliard 2020-09-08  2276  =

7eb2ed589ba165 James Hilliard 2020-09-08  2277  	switch (priv->chip_type) {
7eb2ed589ba165 James Hilliard 2020-09-08  2278  	case FT232RL:
7eb2ed589ba165 James Hilliard 2020-09-08  2279  		eeprom_size =3D 0x40;
7eb2ed589ba165 James Hilliard 2020-09-08  2280  		break;
7eb2ed589ba165 James Hilliard 2020-09-08  2281  	default:
7eb2ed589ba165 James Hilliard 2020-09-08  2282  		/* Unsupported for brick =
repair */
7eb2ed589ba165 James Hilliard 2020-09-08  2283  		return 0;
7eb2ed589ba165 James Hilliard 2020-09-08  2284  	}
7eb2ed589ba165 James Hilliard 2020-09-08  2285  =

7eb2ed589ba165 James Hilliard 2020-09-08  2286  	/* Latency timer needs to =
be 0x77 to unlock EEPROM programming */
7eb2ed589ba165 James Hilliard 2020-09-08  2287  	if (priv->latency !=3D 0x7=
7) {
7eb2ed589ba165 James Hilliard 2020-09-08  2288  		orig_latency =3D priv->la=
tency;
7eb2ed589ba165 James Hilliard 2020-09-08  2289  		priv->latency =3D 0x77;
7eb2ed589ba165 James Hilliard 2020-09-08  2290  		rv =3D write_latency_time=
r(port);
7eb2ed589ba165 James Hilliard 2020-09-08 @2291  		priv->latency =3D orig_la=
tency;
7eb2ed589ba165 James Hilliard 2020-09-08  2292  		if (rv < 0)
7eb2ed589ba165 James Hilliard 2020-09-08  2293  			return -EIO;
7eb2ed589ba165 James Hilliard 2020-09-08  2294  	}
7eb2ed589ba165 James Hilliard 2020-09-08  2295  =

7eb2ed589ba165 James Hilliard 2020-09-08  2296  	eeprom_data =3D kmalloc(ee=
prom_size * 2, GFP_KERNEL);
7eb2ed589ba165 James Hilliard 2020-09-08  2297  	if (!eeprom_data)
7eb2ed589ba165 James Hilliard 2020-09-08  2298  		return -ENOMEM;
7eb2ed589ba165 James Hilliard 2020-09-08  2299  =

7eb2ed589ba165 James Hilliard 2020-09-08  2300  	/* Read in EEPROM */
7eb2ed589ba165 James Hilliard 2020-09-08  2301  	result =3D ftdi_read_eepro=
m(port->serial, eeprom_data, 0x00, eeprom_size * 2);
7eb2ed589ba165 James Hilliard 2020-09-08  2302  	if (result < 0)
7eb2ed589ba165 James Hilliard 2020-09-08  2303  		goto end_repair_brick;
7eb2ed589ba165 James Hilliard 2020-09-08  2304  =

7eb2ed589ba165 James Hilliard 2020-09-08  2305  	/* Verify EEPROM is valid =
*/
7eb2ed589ba165 James Hilliard 2020-09-08  2306  	checksum =3D ftdi_checksum=
(eeprom_data, eeprom_size);
7eb2ed589ba165 James Hilliard 2020-09-08  2307  	if (checksum !=3D eeprom_d=
ata[eeprom_size - 1])
7eb2ed589ba165 James Hilliard 2020-09-08  2308  		goto end_repair_brick;
7eb2ed589ba165 James Hilliard 2020-09-08  2309  =

7eb2ed589ba165 James Hilliard 2020-09-08  2310  	/* FTDI driver checksum pr=
eimage attack targets address 62 */
7eb2ed589ba165 James Hilliard 2020-09-08  2311  	if (eeprom_data[62] =3D=3D=
 0)
7eb2ed589ba165 James Hilliard 2020-09-08  2312  		goto end_repair_brick;
7eb2ed589ba165 James Hilliard 2020-09-08  2313  =

7eb2ed589ba165 James Hilliard 2020-09-08  2314  	/* Attempt to restore Prod=
uct ID to 0x6001 */
7eb2ed589ba165 James Hilliard 2020-09-08  2315  	eeprom_data[2] =3D FTDI_8U=
232AM_PID;
7eb2ed589ba165 James Hilliard 2020-09-08  2316  =

7eb2ed589ba165 James Hilliard 2020-09-08  2317  	/* Clear preimage attack t=
arget address */
7eb2ed589ba165 James Hilliard 2020-09-08  2318  	eeprom_data[62] =3D 0;
7eb2ed589ba165 James Hilliard 2020-09-08  2319  =

7eb2ed589ba165 James Hilliard 2020-09-08  2320  	/* Calculate and verify ne=
w checksum */
7eb2ed589ba165 James Hilliard 2020-09-08  2321  	checksum =3D ftdi_checksum=
(eeprom_data, eeprom_size);
7eb2ed589ba165 James Hilliard 2020-09-08  2322  	if (checksum !=3D eeprom_d=
ata[eeprom_size - 1])
7eb2ed589ba165 James Hilliard 2020-09-08  2323  		goto end_repair_brick;
7eb2ed589ba165 James Hilliard 2020-09-08  2324  =

7eb2ed589ba165 James Hilliard 2020-09-08  2325  	/* Restore EEPROM PID to o=
riginal pre-brick state */
7eb2ed589ba165 James Hilliard 2020-09-08  2326  	if (ftdi_write_eeprom(port=
, 2, eeprom_data[2]) < 0)
7eb2ed589ba165 James Hilliard 2020-09-08  2327  		goto end_repair_brick;
7eb2ed589ba165 James Hilliard 2020-09-08  2328  =

7eb2ed589ba165 James Hilliard 2020-09-08  2329  	/* Restore EEPROM preimage=
 target address to original pre-brick state */
7eb2ed589ba165 James Hilliard 2020-09-08  2330  	if (ftdi_write_eeprom(port=
, 62, eeprom_data[62]) < 0)
7eb2ed589ba165 James Hilliard 2020-09-08  2331  		goto end_repair_brick;
7eb2ed589ba165 James Hilliard 2020-09-08  2332  =

7eb2ed589ba165 James Hilliard 2020-09-08  2333  	dev_info(&port->dev, "Succ=
essfully repaired eeprom bricked by FTDI's malicious Windows driver.\n");
7eb2ed589ba165 James Hilliard 2020-09-08  2334  =

7eb2ed589ba165 James Hilliard 2020-09-08  2335  end_repair_brick:
7eb2ed589ba165 James Hilliard 2020-09-08  2336  	kfree(eeprom_data);
7eb2ed589ba165 James Hilliard 2020-09-08  2337  =

7eb2ed589ba165 James Hilliard 2020-09-08  2338  	return result;
7eb2ed589ba165 James Hilliard 2020-09-08  2339  }
7eb2ed589ba165 James Hilliard 2020-09-08  2340  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1456377584382163285==--

