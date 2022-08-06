Content-Type: multipart/mixed; boundary="===============1638745553388854990=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 1/3] drivers: serial: earlycon: Correct argument name
Date: Sun, 07 Aug 2022 04:29:32 +0800
Message-ID: <202208070432.k07ZjNg4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1638745553388854990==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "commit no functional change"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220806163255.10404-2-markuss.broks@gmail.com>
References: <20220806163255.10404-2-markuss.broks@gmail.com>
TO: Markuss Broks <markuss.broks@gmail.com>
TO: linux-kernel(a)vger.kernel.org
CC: ~postmarketos/upstreaming(a)lists.sr.ht
CC: phone-devel(a)vger.kernel.org
CC: Markuss Broks <markuss.broks@gmail.com>
CC: Jonathan Corbet <corbet@lwn.net>
CC: Ard Biesheuvel <ardb@kernel.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Jiri Slaby <jirislaby@kernel.org>
CC: Helge Deller <deller@gmx.de>
CC: "Paul E. McKenney" <paulmck@kernel.org>
CC: Borislav Petkov <bp@suse.de>
CC: Kees Cook <keescook@chromium.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Randy Dunlap <rdunlap@infradead.org>
CC: Damien Le Moal <damien.lemoal@opensource.wdc.com>
CC: Thomas Zimmermann <tzimmermann@suse.de>
CC: Michal Suchanek <msuchanek@suse.de>
CC: Javier Martinez Canillas <javierm@redhat.com>
CC: Arnd Bergmann <arnd@arndb.de>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: Wei Ming Chen <jj251510319013@gmail.com>
CC: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
CC: Tony Lindgren <tony@atomide.com>
CC: linux-doc(a)vger.kernel.org
CC: linux-efi(a)vger.kernel.org
CC: linux-serial(a)vger.kernel.org
CC: linux-fbdev(a)vger.kernel.org
CC: dri-devel(a)lists.freedesktop.org
CC: Rob Herring <robh@kernel.org>

Hi Markuss,

I love your patch! Yet something to improve:

[auto build test ERROR on tty/tty-testing]
[also build test ERROR on efi/next staging/staging-testing usb/usb-testing =
linus/master v5.19 next-20220805]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Markuss-Broks/Add-ge=
neric-framebuffer-support-to-EFI-earlycon-driver/20220807-003646
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-=
testing
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: x86_64-randconfig-a011 (https://download.01.org/0day-ci/archive/202=
20807/202208070432.k07ZjNg4-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=3D1 build):
        # https://github.com/intel-lab-lkp/linux/commit/dedd7c138e9492439ee=
da05fa75a18bf19883a08
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Markuss-Broks/Add-generic-framebuf=
fer-support-to-EFI-earlycon-driver/20220807-003646
        git checkout dedd7c138e9492439eeda05fa75a18bf19883a08
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=3D1 O=3Dbuild_dir ARCH=3Dx86_64 SHELL=3D/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/tty/serial/earlycon.c:246:12: error: conflicting types for 'of_s=
etup_earlycon'; have 'int(const struct earlycon_id *, int,  const char *)'
     246 | int __init of_setup_earlycon(const struct earlycon_id *match,
         |            ^~~~~~~~~~~~~~~~~
   In file included from drivers/tty/serial/earlycon.c:17:
   include/linux/serial_core.h:708:12: note: previous declaration of 'of_se=
tup_earlycon' with type 'int(const struct earlycon_id *, long unsigned int,=
  const char *)'
     708 | extern int of_setup_earlycon(const struct earlycon_id *match,
         |            ^~~~~~~~~~~~~~~~~


vim +246 drivers/tty/serial/earlycon.c

8477614d9f7c5c Peter Hurley       2016-01-16  245  =

c90fe9c0394b06 Peter Hurley       2016-01-16 @246  int __init of_setup_earl=
ycon(const struct earlycon_id *match,
dedd7c138e9492 Markuss Broks      2022-08-06  247  			     int offset,
4d118c9a866590 Peter Hurley       2016-01-16  248  			     const char *opti=
ons)
b0b6abd34c1b50 Rob Herring        2014-03-27  249  {
b0b6abd34c1b50 Rob Herring        2014-03-27  250  	int err;
b0b6abd34c1b50 Rob Herring        2014-03-27  251  	struct uart_port *port =
=3D &early_console_dev.port;
088da2a17619cf Peter Hurley       2016-01-16  252  	const __be32 *val;
088da2a17619cf Peter Hurley       2016-01-16  253  	bool big_endian;
c90fe9c0394b06 Peter Hurley       2016-01-16  254  	u64 addr;
b0b6abd34c1b50 Rob Herring        2014-03-27  255  =

65e20e8cbbccaf Michael Walle      2022-06-28  256  	if (early_con.flags & C=
ON_ENABLED)
65e20e8cbbccaf Michael Walle      2022-06-28  257  		return -EALREADY;
65e20e8cbbccaf Michael Walle      2022-06-28  258  =

e1dd3bef6d03c9 Geert Uytterhoeven 2015-11-27  259  	spin_lock_init(&port->l=
ock);
b0b6abd34c1b50 Rob Herring        2014-03-27  260  	port->iotype =3D UPIO_M=
EM;
dedd7c138e9492 Markuss Broks      2022-08-06  261  	addr =3D of_flat_dt_tra=
nslate_address(offset);
c90fe9c0394b06 Peter Hurley       2016-01-16  262  	if (addr =3D=3D OF_BAD_=
ADDR) {
c90fe9c0394b06 Peter Hurley       2016-01-16  263  		pr_warn("[%s] bad addr=
ess\n", match->name);
c90fe9c0394b06 Peter Hurley       2016-01-16  264  		return -ENXIO;
c90fe9c0394b06 Peter Hurley       2016-01-16  265  	}
b0b6abd34c1b50 Rob Herring        2014-03-27  266  	port->mapbase =3D addr;
b0b6abd34c1b50 Rob Herring        2014-03-27  267  =

dedd7c138e9492 Markuss Broks      2022-08-06  268  	val =3D of_get_flat_dt_=
prop(offset, "reg-offset", NULL);
088da2a17619cf Peter Hurley       2016-01-16  269  	if (val)
088da2a17619cf Peter Hurley       2016-01-16  270  		port->mapbase +=3D be3=
2_to_cpu(*val);
1f66dd36bb1843 Greentime Hu       2018-02-13  271  	port->membase =3D early=
con_map(port->mapbase, SZ_4K);
1f66dd36bb1843 Greentime Hu       2018-02-13  272  =

dedd7c138e9492 Markuss Broks      2022-08-06  273  	val =3D of_get_flat_dt_=
prop(offset, "reg-shift", NULL);
088da2a17619cf Peter Hurley       2016-01-16  274  	if (val)
088da2a17619cf Peter Hurley       2016-01-16  275  		port->regshift =3D be3=
2_to_cpu(*val);
dedd7c138e9492 Markuss Broks      2022-08-06  276  	big_endian =3D of_get_f=
lat_dt_prop(offset, "big-endian", NULL) !=3D NULL ||
088da2a17619cf Peter Hurley       2016-01-16  277  		(IS_ENABLED(CONFIG_CPU=
_BIG_ENDIAN) &&
dedd7c138e9492 Markuss Broks      2022-08-06  278  		 of_get_flat_dt_prop(o=
ffset, "native-endian", NULL) !=3D NULL);
dedd7c138e9492 Markuss Broks      2022-08-06  279  	val =3D of_get_flat_dt_=
prop(offset, "reg-io-width", NULL);
088da2a17619cf Peter Hurley       2016-01-16  280  	if (val) {
088da2a17619cf Peter Hurley       2016-01-16  281  		switch (be32_to_cpu(*v=
al)) {
088da2a17619cf Peter Hurley       2016-01-16  282  		case 1:
088da2a17619cf Peter Hurley       2016-01-16  283  			port->iotype =3D UPIO=
_MEM;
088da2a17619cf Peter Hurley       2016-01-16  284  			break;
088da2a17619cf Peter Hurley       2016-01-16  285  		case 2:
088da2a17619cf Peter Hurley       2016-01-16  286  			port->iotype =3D UPIO=
_MEM16;
088da2a17619cf Peter Hurley       2016-01-16  287  			break;
088da2a17619cf Peter Hurley       2016-01-16  288  		case 4:
088da2a17619cf Peter Hurley       2016-01-16  289  			port->iotype =3D (big=
_endian) ? UPIO_MEM32BE : UPIO_MEM32;
088da2a17619cf Peter Hurley       2016-01-16  290  			break;
088da2a17619cf Peter Hurley       2016-01-16  291  		default:
088da2a17619cf Peter Hurley       2016-01-16  292  			pr_warn("[%s] unsuppo=
rted reg-io-width\n", match->name);
088da2a17619cf Peter Hurley       2016-01-16  293  			return -EINVAL;
088da2a17619cf Peter Hurley       2016-01-16  294  		}
088da2a17619cf Peter Hurley       2016-01-16  295  	}
088da2a17619cf Peter Hurley       2016-01-16  296  =

dedd7c138e9492 Markuss Broks      2022-08-06  297  	val =3D of_get_flat_dt_=
prop(offset, "current-speed", NULL);
31cb9a8575ca04 Eugeniy Paltsev    2017-08-21  298  	if (val)
31cb9a8575ca04 Eugeniy Paltsev    2017-08-21  299  		early_console_dev.baud=
 =3D be32_to_cpu(*val);
31cb9a8575ca04 Eugeniy Paltsev    2017-08-21  300  =

dedd7c138e9492 Markuss Broks      2022-08-06  301  	val =3D of_get_flat_dt_=
prop(offset, "clock-frequency", NULL);
814453adea7d08 Michal Simek       2018-04-10  302  	if (val)
814453adea7d08 Michal Simek       2018-04-10  303  		port->uartclk =3D be32=
_to_cpu(*val);
814453adea7d08 Michal Simek       2018-04-10  304  =

4d118c9a866590 Peter Hurley       2016-01-16  305  	if (options) {
31cb9a8575ca04 Eugeniy Paltsev    2017-08-21  306  		early_console_dev.baud=
 =3D simple_strtoul(options, NULL, 0);
4d118c9a866590 Peter Hurley       2016-01-16  307  		strlcpy(early_console_=
dev.options, options,
4d118c9a866590 Peter Hurley       2016-01-16  308  			sizeof(early_console_=
dev.options));
4d118c9a866590 Peter Hurley       2016-01-16  309  	}
05d961320ba624 Peter Hurley       2016-01-16  310  	earlycon_init(&early_co=
nsole_dev, match->name);
4d118c9a866590 Peter Hurley       2016-01-16  311  	err =3D match->setup(&e=
arly_console_dev, options);
f28295cc8ce14b Hsin-Yi Wang       2020-09-15  312  	earlycon_print_info(&ea=
rly_console_dev);
b0b6abd34c1b50 Rob Herring        2014-03-27  313  	if (err < 0)
b0b6abd34c1b50 Rob Herring        2014-03-27  314  		return err;
b0b6abd34c1b50 Rob Herring        2014-03-27  315  	if (!early_console_dev.=
con->write)
b0b6abd34c1b50 Rob Herring        2014-03-27  316  		return -ENODEV;
b0b6abd34c1b50 Rob Herring        2014-03-27  317  =

b0b6abd34c1b50 Rob Herring        2014-03-27  318  =

b0b6abd34c1b50 Rob Herring        2014-03-27  319  	register_console(early_=
console_dev.con);
b0b6abd34c1b50 Rob Herring        2014-03-27  320  	return 0;
b0b6abd34c1b50 Rob Herring        2014-03-27  321  }
8477614d9f7c5c Peter Hurley       2016-01-16  322  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1638745553388854990==--

