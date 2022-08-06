Content-Type: multipart/mixed; boundary="===============2595312832814053773=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH v1] pinctrl: imx8m: kconfig: Depends on SOC_IMX8M
Date: Sat, 06 Aug 2022 23:41:35 +0800
Message-ID: <202208062321.ZN1m0l56-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2595312832814053773==
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
[auto build test ERROR on linusw-pinctrl/devel]
[also build test ERROR on linus/master v5.19 next-20220805]
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
hive/20220806/202208062321.ZN1m0l56-lkp(a)intel.com/config)
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
 W=3D1 O=3Dbuild_dir ARCH=3Dalpha SHELL=3D/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/pinctrl/freescale/pinctrl-imx.c: In function 'imx_pmx_set':
>> drivers/pinctrl/freescale/pinctrl-imx.c:260:16: error: implicit declarat=
ion of function 'pinmux_generic_get_function'; did you mean 'pinmux_generic=
_free_functions'? [-Werror=3Dimplicit-function-declaration]
     260 |         func =3D pinmux_generic_get_function(pctldev, selector);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                pinmux_generic_free_functions
   drivers/pinctrl/freescale/pinctrl-imx.c:260:14: warning: assignment to '=
struct function_desc *' from 'int' makes pointer from integer without a cas=
t [-Wint-conversion]
     260 |         func =3D pinmux_generic_get_function(pctldev, selector);
         |              ^
   In file included from include/linux/device.h:15,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from include/linux/of_device.h:5,
                    from drivers/pinctrl/freescale/pinctrl-imx.c:16:
>> drivers/pinctrl/freescale/pinctrl-imx.c:267:21: error: invalid use of un=
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
>> drivers/pinctrl/freescale/pinctrl-imx.c:287:32: error: 'pinmux_generic_g=
et_function_count' undeclared here (not in a function); did you mean 'pinmu=
x_generic_free_functions'?
     287 |         .get_functions_count =3D pinmux_generic_get_function_cou=
nt,
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                pinmux_generic_free_functions
>> drivers/pinctrl/freescale/pinctrl-imx.c:288:30: error: 'pinmux_generic_g=
et_function_name' undeclared here (not in a function); did you mean 'pinmux=
_generic_free_functions'?
     288 |         .get_function_name =3D pinmux_generic_get_function_name,
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                              pinmux_generic_free_functions
>> drivers/pinctrl/freescale/pinctrl-imx.c:289:32: error: 'pinmux_generic_g=
et_function_groups' undeclared here (not in a function); did you mean 'pinm=
ux_generic_free_functions'?
     289 |         .get_function_groups =3D pinmux_generic_get_function_gro=
ups,
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                pinmux_generic_free_functions
   drivers/pinctrl/freescale/pinctrl-imx.c: In function 'imx_pinconf_parse_=
generic_config':
>> drivers/pinctrl/freescale/pinctrl-imx.c:341:15: error: implicit declarat=
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
>> drivers/pinctrl/freescale/pinctrl-imx.c:752:59: error: invalid applicati=
on of 'sizeof' to incomplete type 'struct function_desc'
     752 |                 function =3D devm_kzalloc(&pdev->dev, sizeof(*fu=
nction),
         |                                                           ^
>> drivers/pinctrl/freescale/pinctrl-imx.c:758:40: error: 'struct pinctrl_d=
ev' has no member named 'pin_function_tree'
     758 |                 radix_tree_insert(&pctl->pin_function_tree, i, f=
unction);
         |                                        ^~
>> drivers/pinctrl/freescale/pinctrl-imx.c:761:13: error: 'struct pinctrl_d=
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

b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-1=
0-30  240  =

b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-1=
0-30  241  static int imx_pmx_set(struct pinctrl_dev *pctldev, unsigned sel=
ector,
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-1=
0-30  242  		       unsigned group)
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-1=
0-30  243  {
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-1=
0-30  244  	struct imx_pinctrl *ipctl =3D pinctrl_dev_get_drvdata(pctldev);
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-1=
0-30  245  	const struct imx_pinctrl_soc_info *info =3D ipctl->info;
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-1=
0-30  246  	struct function_desc *func;
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-1=
0-30  247  	struct group_desc *grp;
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-1=
0-30  248  	struct imx_pin *pin;
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-1=
0-30  249  	unsigned int npins;
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-1=
0-30  250  	int i, err;
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-1=
0-30  251  =

b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-1=
0-30  252  	/*
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-1=
0-30  253  	 * Configure the mux mode for each pin in the group for a speci=
fic
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-1=
0-30  254  	 * function.
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-1=
0-30  255  	 */
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-1=
0-30  256  	grp =3D pinctrl_generic_get_group(pctldev, group);
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-1=
0-30  257  	if (!grp)
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-1=
0-30  258  		return -EINVAL;
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-1=
0-30  259  =

b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-1=
0-30 @260  	func =3D pinmux_generic_get_function(pctldev, selector);
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-1=
0-30  261  	if (!func)
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-1=
0-30  262  		return -EINVAL;
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-1=
0-30  263  =

b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-1=
0-30  264  	npins =3D grp->num_pins;
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-1=
0-30  265  =

b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-1=
0-30  266  	dev_dbg(ipctl->dev, "enable function %s group %s\n",
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-1=
0-30 @267  		func->name, grp->name);
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-1=
0-30  268  =

b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-1=
0-30  269  	for (i =3D 0; i < npins; i++) {
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-1=
0-30  270  		/*
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-1=
0-30  271  		 * For IMX_USE_SCU case, we postpone the mux setting
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-1=
0-30  272  		 * until config is set as we can set them together
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-1=
0-30  273  		 * in one IPC call
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-1=
0-30  274  		 */
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-1=
0-30  275  		pin =3D &((struct imx_pin *)(grp->data))[i];
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-1=
0-30  276  		if (!(info->flags & IMX_USE_SCU)) {
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-1=
0-30  277  			err =3D imx_pmx_set_one_pin_mmio(ipctl, pin);
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-1=
0-30  278  			if (err)
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong     2018-1=
0-30  279  				return err;
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng  2012-0=
4-27  280  		}
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng  2012-0=
4-27  281  	}
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng  2012-0=
4-27  282  =

ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng  2012-0=
4-27  283  	return 0;
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng  2012-0=
4-27  284  }
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng  2012-0=
4-27  285  =

3be6f65102a859 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-0=
7-25  286  struct pinmux_ops imx_pmx_ops =3D {
3fd6d6ad73af90 drivers/pinctrl/freescale/pinctrl-imx.c Gary Bisson   2017-0=
1-02 @287  	.get_functions_count =3D pinmux_generic_get_function_count,
3fd6d6ad73af90 drivers/pinctrl/freescale/pinctrl-imx.c Gary Bisson   2017-0=
1-02 @288  	.get_function_name =3D pinmux_generic_get_function_name,
3fd6d6ad73af90 drivers/pinctrl/freescale/pinctrl-imx.c Gary Bisson   2017-0=
1-02 @289  	.get_function_groups =3D pinmux_generic_get_function_groups,
03e9f0cac5da6a drivers/pinctrl/pinctrl-imx.c           Linus Walleij 2014-0=
9-03  290  	.set_mux =3D imx_pmx_set,
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng  2012-0=
4-27  291  };
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng  2012-0=
4-27  292  =

a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-0=
5-19  293  /* decode generic config into raw register values */
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-0=
5-19  294  static u32 imx_pinconf_decode_generic_config(struct imx_pinctrl =
*ipctl,
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-0=
5-19  295  					      unsigned long *configs,
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-0=
5-19  296  					      unsigned int num_configs)
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-0=
5-19  297  {
f5843492ecefcf drivers/pinctrl/freescale/pinctrl-imx.c Stefan Agner  2018-0=
1-06  298  	const struct imx_pinctrl_soc_info *info =3D ipctl->info;
d6093367bc743b drivers/pinctrl/freescale/pinctrl-imx.c Stefan Agner  2018-0=
1-06  299  	const struct imx_cfg_params_decode *decode;
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-0=
5-19  300  	enum pin_config_param param;
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-0=
5-19  301  	u32 raw_config =3D 0;
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-0=
5-19  302  	u32 param_val;
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-0=
5-19  303  	int i, j;
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-0=
5-19  304  =

a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-0=
5-19  305  	WARN_ON(num_configs > info->num_decodes);
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-0=
5-19  306  =

a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-0=
5-19  307  	for (i =3D 0; i < num_configs; i++) {
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-0=
5-19  308  		param =3D pinconf_to_config_param(configs[i]);
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-0=
5-19  309  		param_val =3D pinconf_to_config_argument(configs[i]);
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-0=
5-19  310  		decode =3D info->decodes;
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-0=
5-19  311  		for (j =3D 0; j < info->num_decodes; j++) {
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-0=
5-19  312  			if (param =3D=3D decode->param) {
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-0=
5-19  313  				if (decode->invert)
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-0=
5-19  314  					param_val =3D !param_val;
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-0=
5-19  315  				raw_config |=3D (param_val << decode->shift)
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-0=
5-19  316  					      & decode->mask;
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-0=
5-19  317  				break;
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-0=
5-19  318  			}
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-0=
5-19  319  			decode++;
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-0=
5-19  320  		}
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-0=
5-19  321  	}
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-0=
5-19  322  =

a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-0=
5-19  323  	if (info->fixup)
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-0=
5-19  324  		info->fixup(configs, num_configs, &raw_config);
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-0=
5-19  325  =

a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-0=
5-19  326  	return raw_config;
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-0=
5-19  327  }
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-0=
5-19  328  =

a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-0=
5-19  329  static u32 imx_pinconf_parse_generic_config(struct device_node *=
np,
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-0=
5-19  330  					    struct imx_pinctrl *ipctl)
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-0=
5-19  331  {
f5843492ecefcf drivers/pinctrl/freescale/pinctrl-imx.c Stefan Agner  2018-0=
1-06  332  	const struct imx_pinctrl_soc_info *info =3D ipctl->info;
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-0=
5-19  333  	struct pinctrl_dev *pctl =3D ipctl->pctl;
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-0=
5-19  334  	unsigned int num_configs;
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-0=
5-19  335  	unsigned long *configs;
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-0=
5-19  336  	int ret;
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-0=
5-19  337  =

a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-0=
5-19  338  	if (!info->generic_pinconf)
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-0=
5-19  339  		return 0;
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-0=
5-19  340  =

a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-0=
5-19 @341  	ret =3D pinconf_generic_parse_dt_config(np, pctl, &configs,
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-0=
5-19  342  					      &num_configs);
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-0=
5-19  343  	if (ret)
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-0=
5-19  344  		return 0;
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-0=
5-19  345  =

a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-0=
5-19  346  	return imx_pinconf_decode_generic_config(ipctl, configs, num_co=
nfigs);
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-0=
5-19  347  }
a5cadbbb081cb8 drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng  2017-0=
5-19  348  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2595312832814053773==--

