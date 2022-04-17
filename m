Content-Type: multipart/mixed; boundary="===============2287479201158491249=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jimc:dyn-drm-trc 23/23] drivers/gpu/drm/drm_print.c:289 __drm_dev_dbg() warn: should this be a bitwise op?
Date: Mon, 18 Apr 2022 05:25:08 +0800
Message-ID: <202204180554.UZsI2iDK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2287479201158491249==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Jim Cromie <jim.cromie@gmail.com>

tree:   https://github.com/jimc/linux.git dyn-drm-trc
head:   a6edc399f08cd7094247f602209a8738c0bb29f6
commit: a6edc399f08cd7094247f602209a8738c0bb29f6 [23/23] dyndbg: 4 new trac=
e-events: pr_debug, dev_dbg, drm_{,dev}debug
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: x86_64-randconfig-m031-20220418 (https://download.01.org/0day-ci/ar=
chive/20220418/202204180554.UZsI2iDK-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/drm_print.c:289 __drm_dev_dbg() warn: should this be a bitw=
ise op?

Old smatch warnings:
drivers/gpu/drm/drm_print.c:295 __drm_dev_dbg() warn: should this be a bitw=
ise op?

vim +289 drivers/gpu/drm/drm_print.c

db87086492581c8 Joe Perches     2018-03-16  270  =

f551ecc93512f82 Jim Cromie      2021-12-28  271  void __drm_dev_dbg(struct =
_ddebug *desc, const struct device *dev,
f551ecc93512f82 Jim Cromie      2021-12-28  272  		   enum drm_debug_catego=
ry category, const char *format, ...)
02c9656b2f0d699 Haneen Mohammed 2017-10-17  273  {
02c9656b2f0d699 Haneen Mohammed 2017-10-17  274  	struct va_format vaf;
02c9656b2f0d699 Haneen Mohammed 2017-10-17  275  	va_list args;
02c9656b2f0d699 Haneen Mohammed 2017-10-17  276  =

b4ea019663f81ca Jim Cromie      2022-01-19  277  	if (!__drm_debug_enabled(=
category))
02c9656b2f0d699 Haneen Mohammed 2017-10-17  278  		return;
02c9656b2f0d699 Haneen Mohammed 2017-10-17  279  =

f551ecc93512f82 Jim Cromie      2021-12-28  280  	/* we know we are printin=
g for either syslog, tracefs, or both */
02c9656b2f0d699 Haneen Mohammed 2017-10-17  281  	va_start(args, format);
02c9656b2f0d699 Haneen Mohammed 2017-10-17  282  	vaf.fmt =3D format;
02c9656b2f0d699 Haneen Mohammed 2017-10-17  283  	vaf.va =3D &args;
02c9656b2f0d699 Haneen Mohammed 2017-10-17  284  =

f551ecc93512f82 Jim Cromie      2021-12-28  285  	if (dev) {
c565d1ed5ffa369 Jim Cromie      2021-11-22  286  		if (desc->flags && _DPRI=
NTK_FLAGS_PRINTK)
db87086492581c8 Joe Perches     2018-03-16  287  			dev_printk(KERN_DEBUG, =
dev, "[" DRM_NAME ":%ps] %pV",
db87086492581c8 Joe Perches     2018-03-16  288  				   __builtin_return_ad=
dress(0), &vaf);
a6edc399f08cd70 Jim Cromie      2021-12-01 @289  		if (desc->flags && _DPRI=
NTK_FLAGS_TRACE)
a6edc399f08cd70 Jim Cromie      2021-12-01  290  			trace_drm_devdbg(dev, c=
ategory, &vaf);
f551ecc93512f82 Jim Cromie      2021-12-28  291  	} else {
c565d1ed5ffa369 Jim Cromie      2021-11-22  292  		if (desc->flags && _DPRI=
NTK_FLAGS_PRINTK)
db87086492581c8 Joe Perches     2018-03-16  293  			printk(KERN_DEBUG "[" D=
RM_NAME ":%ps] %pV",
db87086492581c8 Joe Perches     2018-03-16  294  			       __builtin_return=
_address(0), &vaf);
a6edc399f08cd70 Jim Cromie      2021-12-01  295  		if (desc->flags && _DPRI=
NTK_FLAGS_TRACE)
a6edc399f08cd70 Jim Cromie      2021-12-01  296  			trace_drm_debug(categor=
y, &vaf);
f551ecc93512f82 Jim Cromie      2021-12-28  297  	}
02c9656b2f0d699 Haneen Mohammed 2017-10-17  298  	va_end(args);
02c9656b2f0d699 Haneen Mohammed 2017-10-17  299  }
cfba4ec4f3059e6 Jim Cromie      2021-12-18  300  EXPORT_SYMBOL(__drm_dev_db=
g);
02c9656b2f0d699 Haneen Mohammed 2017-10-17  301  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2287479201158491249==--

