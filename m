Content-Type: multipart/mixed; boundary="===============6613180632798938613=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH v1] pinctrl: imx8m: kconfig: Depends on SOC_IMX8M
Date: Sat, 06 Aug 2022 20:36:07 +0800
Message-ID: <202208062030.11RYGgce-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6613180632798938613==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "only Kconfig file updated"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220802110232.130758-1-francesco.dolcini@toradex.com>
References: <20220802110232.130758-1-francesco.dolcini@toradex.com>
TO: Francesco Dolcini <francesco.dolcini@toradex.com>

Hi Francesco,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on linus/master v5.19 next-20220805]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Francesco-Dolcini/pi=
nctrl-imx8m-kconfig-Depends-on-SOC_IMX8M/20220802-190320
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctr=
l.git devel
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: alpha-randconfig-r033-20220805 (https://download.01.org/0day-ci/arc=
hive/20220806/202208062030.11RYGgce-lkp(a)intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/8cf69707b586a5aaa92=
ba9757f2d98383b220a43
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Francesco-Dolcini/pinctrl-imx8m-kc=
onfig-Depends-on-SOC_IMX8M/20220802-190320
        git checkout 8cf69707b586a5aaa92ba9757f2d98383b220a43
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 W=3D1 O=3Dbuild_dir ARCH=3Dalpha SHELL=3D/bin/bash drivers/pinctrl/freesca=
le/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/pinctrl/freescale/pinctrl-imx.c: In function 'imx_pmx_set':
   drivers/pinctrl/freescale/pinctrl-imx.c:260:16: error: implicit declarat=
ion of function 'pinmux_generic_get_function'; did you mean 'pinmux_generic=
_free_functions'? [-Werror=3Dimplicit-function-declaration]
     260 |         func =3D pinmux_generic_get_function(pctldev, selector);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                pinmux_generic_free_functions
>> drivers/pinctrl/freescale/pinctrl-imx.c:260:14: warning: assignment to '=
struct function_desc *' from 'int' makes pointer from integer without a cas=
t [-Wint-conversion]
     260 |         func =3D pinmux_generic_get_function(pctldev, selector);
         |              ^
   In file included from include/linux/device.h:15,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from include/linux/of_device.h:5,
                    from drivers/pinctrl/freescale/pinctrl-imx.c:16:
   drivers/pinctrl/freescale/pinctrl-imx.c:267:21: error: invalid use of un=
defined type 'struct function_desc'
     267 |                 func->name, grp->name);
         |                     ^~
   include/linux/dev_printk.h:129:48: note: in definition of macro 'dev_pri=
ntk'
     129 |                 _dev_printk(level, dev, fmt, ##__VA_ARGS__);    =
        \
         |                                                ^~~~~~~~~~~
   drivers/pinctrl/freescale/pinctrl-imx.c:266:9: note: in expansion of mac=
ro 'dev_dbg'
     266 |         dev_dbg(ipctl->dev, "enable function %s group %s\n",
         |         ^~~~~~~
   drivers/pinctrl/freescale/pinctrl-imx.c: At top level:
   drivers/pinctrl/freescale/pinctrl-imx.c:287:32: error: 'pinmux_generic_g=
et_function_count' undeclared here (not in a function); did you mean 'pinmu=
x_generic_free_functions'?
     287 |         .get_functions_count =3D pinmux_generic_get_function_cou=
nt,
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                pinmux_generic_free_functions
   drivers/pinctrl/freescale/pinctrl-imx.c:288:30: error: 'pinmux_generic_g=
et_function_name' undeclared here (not in a function); did you mean 'pinmux=
_generic_free_functions'?
     288 |         .get_function_name =3D pinmux_generic_get_function_name,
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                              pinmux_generic_free_functions
   drivers/pinctrl/freescale/pinctrl-imx.c:289:32: error: 'pinmux_generic_g=
et_function_groups' undeclared here (not in a function); did you mean 'pinm=
ux_generic_free_functions'?
     289 |         .get_function_groups =3D pinmux_generic_get_function_gro=
ups,
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                pinmux_generic_free_functions
   drivers/pinctrl/freescale/pinctrl-imx.c: In function 'imx_pinconf_parse_=
generic_config':
   drivers/pinctrl/freescale/pinctrl-imx.c:341:15: error: implicit declarat=
ion of function 'pinconf_generic_parse_dt_config'; did you mean 'pinconf_ge=
neric_dump_config'? [-Werror=3Dimplicit-function-declaration]
     341 |         ret =3D pinconf_generic_parse_dt_config(np, pctl, &confi=
gs,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               pinconf_generic_dump_config
   drivers/pinctrl/freescale/pinctrl-imx.c: In function 'imx_pinctrl_parse_=
functions':
   drivers/pinctrl/freescale/pinctrl-imx.c:656:14: warning: assignment to '=
struct function_desc *' from 'int' makes pointer from integer without a cas=
t [-Wint-conversion]
     656 |         func =3D pinmux_generic_get_function(pctl, index);
         |              ^
   drivers/pinctrl/freescale/pinctrl-imx.c:661:13: error: invalid use of un=
defined type 'struct function_desc'
     661 |         func->name =3D np->name;
         |             ^~
   drivers/pinctrl/freescale/pinctrl-imx.c:662:13: error: invalid use of un=
defined type 'struct function_desc'
     662 |         func->num_group_names =3D of_get_child_count(np);
         |             ^~
   drivers/pinctrl/freescale/pinctrl-imx.c:663:17: error: invalid use of un=
defined type 'struct function_desc'
     663 |         if (func->num_group_names =3D=3D 0) {
         |                 ^~
   drivers/pinctrl/freescale/pinctrl-imx.c:668:52: error: invalid use of un=
defined type 'struct function_desc'
     668 |         group_names =3D devm_kcalloc(ipctl->dev, func->num_group=
_names,
         |                                                    ^~
   drivers/pinctrl/freescale/pinctrl-imx.c:675:13: error: invalid use of un=
defined type 'struct function_desc'
     675 |         func->group_names =3D group_names;
         |             ^~
   drivers/pinctrl/freescale/pinctrl-imx.c: In function 'imx_pinctrl_probe_=
dt':
   drivers/pinctrl/freescale/pinctrl-imx.c:752:59: error: invalid applicati=
on of 'sizeof' to incomplete type 'struct function_desc'
     752 |                 function =3D devm_kzalloc(&pdev->dev, sizeof(*fu=
nction),
         |                                                           ^
   drivers/pinctrl/freescale/pinctrl-imx.c:758:40: error: 'struct pinctrl_d=
ev' has no member named 'pin_function_tree'
     758 |                 radix_tree_insert(&pctl->pin_function_tree, i, f=
unction);
         |                                        ^~
   drivers/pinctrl/freescale/pinctrl-imx.c:761:13: error: 'struct pinctrl_d=
ev' has no member named 'num_functions'
     761 |         pctl->num_functions =3D nfuncs;
         |             ^~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PINCTRL_IMX
   Depends on [n]: PINCTRL [=3Dy] && OF [=3Dn]
   Selected by [y]:
   - PINCTRL_IMX8MP [=3Dy] && PINCTRL [=3Dy] && SOC_IMX8M [=3Dy]
   Selected by [m]:
   - PINCTRL_IMX8MM [=3Dm] && PINCTRL [=3Dy] && SOC_IMX8M [=3Dy]
   - PINCTRL_IMX8MN [=3Dm] && PINCTRL [=3Dy] && SOC_IMX8M [=3Dy]


vim +260 drivers/pinctrl/freescale/pinctrl-imx.c

b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong    2018-10=
-30  240  =

b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong    2018-10=
-30  241  static int imx_pmx_set(struct pinctrl_dev *pctldev, unsigned sele=
ctor,
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong    2018-10=
-30  242  		       unsigned group)
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong    2018-10=
-30  243  {
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong    2018-10=
-30  244  	struct imx_pinctrl *ipctl =3D pinctrl_dev_get_drvdata(pctldev);
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong    2018-10=
-30  245  	const struct imx_pinctrl_soc_info *info =3D ipctl->info;
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong    2018-10=
-30  246  	struct function_desc *func;
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong    2018-10=
-30  247  	struct group_desc *grp;
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong    2018-10=
-30  248  	struct imx_pin *pin;
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong    2018-10=
-30  249  	unsigned int npins;
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong    2018-10=
-30  250  	int i, err;
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong    2018-10=
-30  251  =

b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong    2018-10=
-30  252  	/*
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong    2018-10=
-30  253  	 * Configure the mux mode for each pin in the group for a specif=
ic
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong    2018-10=
-30  254  	 * function.
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong    2018-10=
-30  255  	 */
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong    2018-10=
-30  256  	grp =3D pinctrl_generic_get_group(pctldev, group);
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong    2018-10=
-30  257  	if (!grp)
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong    2018-10=
-30  258  		return -EINVAL;
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong    2018-10=
-30  259  =

b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong    2018-10=
-30 @260  	func =3D pinmux_generic_get_function(pctldev, selector);
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong    2018-10=
-30  261  	if (!func)
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong    2018-10=
-30  262  		return -EINVAL;
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong    2018-10=
-30  263  =

b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong    2018-10=
-30  264  	npins =3D grp->num_pins;
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong    2018-10=
-30  265  =

b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong    2018-10=
-30  266  	dev_dbg(ipctl->dev, "enable function %s group %s\n",
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong    2018-10=
-30  267  		func->name, grp->name);
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong    2018-10=
-30  268  =

b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong    2018-10=
-30  269  	for (i =3D 0; i < npins; i++) {
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong    2018-10=
-30  270  		/*
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong    2018-10=
-30  271  		 * For IMX_USE_SCU case, we postpone the mux setting
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong    2018-10=
-30  272  		 * until config is set as we can set them together
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong    2018-10=
-30  273  		 * in one IPC call
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong    2018-10=
-30  274  		 */
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong    2018-10=
-30  275  		pin =3D &((struct imx_pin *)(grp->data))[i];
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong    2018-10=
-30  276  		if (!(info->flags & IMX_USE_SCU)) {
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong    2018-10=
-30  277  			err =3D imx_pmx_set_one_pin_mmio(ipctl, pin);
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong    2018-10=
-30  278  			if (err)
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong    2018-10=
-30  279  				return err;
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng 2012-04=
-27  280  		}
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng 2012-04=
-27  281  	}
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng 2012-04=
-27  282  =

ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng 2012-04=
-27  283  	return 0;
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng 2012-04=
-27  284  }
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng 2012-04=
-27  285  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6613180632798938613==--

