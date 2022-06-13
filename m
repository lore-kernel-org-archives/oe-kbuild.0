Content-Type: multipart/mixed; boundary="===============4639611530897079017=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jimc:dd-drm 26/26] drivers/gpu/drm/drm_print.c:283 __drm_dev_dbg() warn: should this be a bitwise op?
Date: Mon, 13 Jun 2022 12:14:12 +0800
Message-ID: <202206131244.09L1piio-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4639611530897079017==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Jim Cromie <jim.cromie@gmail.com>

tree:   https://github.com/jimc/linux.git dd-drm
head:   33833feb445e5cfc48f1fbfdbbb8ada11657c5d4
commit: 33833feb445e5cfc48f1fbfdbbb8ada11657c5d4 [26/26] drm_print: add _dd=
ebug desc to drm_*dbg prototypes
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20613/202206131244.09L1piio-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/drm_print.c:283 __drm_dev_dbg() warn: should this be a bitw=
ise op?

Old smatch warnings:
drivers/gpu/drm/drm_print.c:287 __drm_dev_dbg() warn: should this be a bitw=
ise op?

vim +283 drivers/gpu/drm/drm_print.c

db87086492581c Joe Perches     2018-03-16  267  =

33833feb445e5c Jim Cromie      2021-12-28  268  void __drm_dev_dbg(struct _=
ddebug *desc, const struct device *dev,
33833feb445e5c Jim Cromie      2021-12-28  269  		   enum drm_debug_categor=
y category, const char *format, ...)
02c9656b2f0d69 Haneen Mohammed 2017-10-17  270  {
02c9656b2f0d69 Haneen Mohammed 2017-10-17  271  	struct va_format vaf;
02c9656b2f0d69 Haneen Mohammed 2017-10-17  272  	va_list args;
02c9656b2f0d69 Haneen Mohammed 2017-10-17  273  =

c42134fa6c61ec Jim Cromie      2022-01-19  274  	if (!__drm_debug_enabled(c=
ategory))
02c9656b2f0d69 Haneen Mohammed 2017-10-17  275  		return;
02c9656b2f0d69 Haneen Mohammed 2017-10-17  276  =

33833feb445e5c Jim Cromie      2021-12-28  277  	/* we know we are printing=
 for either syslog, tracefs, or both */
02c9656b2f0d69 Haneen Mohammed 2017-10-17  278  	va_start(args, format);
02c9656b2f0d69 Haneen Mohammed 2017-10-17  279  	vaf.fmt =3D format;
02c9656b2f0d69 Haneen Mohammed 2017-10-17  280  	vaf.va =3D &args;
02c9656b2f0d69 Haneen Mohammed 2017-10-17  281  =

33833feb445e5c Jim Cromie      2021-12-28  282  	if (dev) {
33833feb445e5c Jim Cromie      2021-12-28 @283  		if (desc->flags && _DPRIN=
TK_FLAGS_PRINT)
db87086492581c Joe Perches     2018-03-16  284  			dev_printk(KERN_DEBUG, d=
ev, "[" DRM_NAME ":%ps] %pV",
db87086492581c Joe Perches     2018-03-16  285  				   __builtin_return_add=
ress(0), &vaf);
33833feb445e5c Jim Cromie      2021-12-28  286  	} else {
33833feb445e5c Jim Cromie      2021-12-28  287  		if (desc->flags && _DPRIN=
TK_FLAGS_PRINT)
db87086492581c Joe Perches     2018-03-16  288  			printk(KERN_DEBUG "[" DR=
M_NAME ":%ps] %pV",
db87086492581c Joe Perches     2018-03-16  289  			       __builtin_return_=
address(0), &vaf);
33833feb445e5c Jim Cromie      2021-12-28  290  	}
02c9656b2f0d69 Haneen Mohammed 2017-10-17  291  	va_end(args);
02c9656b2f0d69 Haneen Mohammed 2017-10-17  292  }
0538400cb2f0f9 Jim Cromie      2021-12-18  293  EXPORT_SYMBOL(__drm_dev_dbg=
);
02c9656b2f0d69 Haneen Mohammed 2017-10-17  294  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4639611530897079017==--

