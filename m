Content-Type: multipart/mixed; boundary="===============9061042895808161647=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v1 6/7] soc: fsl: guts: drop platform driver
Date: Fri, 28 Jan 2022 12:50:34 +0800
Message-ID: <202201281246.NKFv8GyG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9061042895808161647==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220127164125.3651285-7-michael@walle.cc>
References: <20220127164125.3651285-7-michael@walle.cc>
TO: Michael Walle <michael@walle.cc>

Hi Michael,

I love your patch! Perhaps something to improve:

[auto build test WARNING on soc/for-next]
[also build test WARNING on next-20220127]
[cannot apply to linux/master linus/master v5.17-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Michael-Walle/soc-fsl-guts=
-cleanups-and-serial_number-support/20220128-004223
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: openrisc-randconfig-m031-20220124 (https://download.01.org/0day-ci/=
archive/20220128/202201281246.NKFv8GyG-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/soc/fsl/guts.c:169 fsl_guts_init() warn: possible memory leak of 's=
oc_dev_attr'

Old smatch warnings:
drivers/soc/fsl/guts.c:182 fsl_guts_init() warn: possible memory leak of 's=
oc_dev_attr'

vim +/soc_dev_attr +169 drivers/soc/fsl/guts.c

a83b17321e29c5 Michael Walle 2022-01-27  144  =

a83b17321e29c5 Michael Walle 2022-01-27  145  static int __init fsl_guts_in=
it(void)
a6fc3b69813023 yangbo lu     2016-11-09  146  {
c93df5b7c92a04 Michael Walle 2022-01-27  147  	struct soc_device_attribute =
*soc_dev_attr;
c09e0eeea0bce0 Michael Walle 2022-01-27  148  	static struct soc_device *so=
c_dev;
a6fc3b69813023 yangbo lu     2016-11-09  149  	const struct fsl_soc_die_att=
r *soc_die;
01e929af81c348 Michael Walle 2022-01-27  150  	struct ccsr_guts __iomem *re=
gs;
794557e9a91a9b Michael Walle 2022-01-27  151  	const char *machine =3D NULL;
a83b17321e29c5 Michael Walle 2022-01-27  152  	struct device_node *np;
01e929af81c348 Michael Walle 2022-01-27  153  	bool little_endian;
a6fc3b69813023 yangbo lu     2016-11-09  154  	u32 svr;
a83b17321e29c5 Michael Walle 2022-01-27  155  	int ret;
a83b17321e29c5 Michael Walle 2022-01-27  156  =

a83b17321e29c5 Michael Walle 2022-01-27  157  	np =3D of_find_matching_node=
_and_match(NULL, fsl_guts_of_match, NULL);
a83b17321e29c5 Michael Walle 2022-01-27  158  	if (!np)
a83b17321e29c5 Michael Walle 2022-01-27  159  		return 0;
a6fc3b69813023 yangbo lu     2016-11-09  160  =

a83b17321e29c5 Michael Walle 2022-01-27  161  	soc_dev_attr =3D kzalloc(siz=
eof(*soc_dev_attr), GFP_KERNEL);
c93df5b7c92a04 Michael Walle 2022-01-27  162  	if (!soc_dev_attr)
c93df5b7c92a04 Michael Walle 2022-01-27  163  		return -ENOMEM;
c93df5b7c92a04 Michael Walle 2022-01-27  164  =

01e929af81c348 Michael Walle 2022-01-27  165  	little_endian =3D of_propert=
y_read_bool(np, "little-endian");
a6fc3b69813023 yangbo lu     2016-11-09  166  =

01e929af81c348 Michael Walle 2022-01-27  167  	regs =3D of_iomap(np, 0);
01e929af81c348 Michael Walle 2022-01-27  168  	if (IS_ERR(regs))
01e929af81c348 Michael Walle 2022-01-27 @169  		return PTR_ERR(regs);

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============9061042895808161647==--

