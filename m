Content-Type: multipart/mixed; boundary="===============2419265742012610695=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [drm-drm-misc:drm-misc-next 1/4] drivers/gpu/drm/bridge/ti-sn65dsi86.c:923:41: error: 'struct gpio_chip' has no member named 'of_gpio_n_cells'
Date: Sat, 13 Jun 2020 17:10:04 +0800
Message-ID: <202006131700.y4pJbIcl%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2419265742012610695==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Douglas Anderson <dianders@chromium.org>
CC: Sam Ravnborg <sam@ravnborg.org>
CC: Stephen Boyd <swboyd@chromium.org>
CC: Bjorn Andersson <bjorn.andersson@linaro.org>
CC: Linus Walleij <linus.walleij@linaro.org>

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   baef4d56195b6d6e0f681f6eac03d8c6db011d34
commit: 27ed2b3f22ed60295c74b4ca3e855823d0e7603b [1/4] drm/bridge: ti-sn65d=
si86: Export bridge GPIOs to Linux
:::::: branch date: 4 weeks ago
:::::: commit date: 4 weeks ago
config: xtensa-randconfig-r011-20200612 (attached as .config)
compiler: xtensa-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 27ed2b3f22ed60295c74b4ca3e855823d0e7603b
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Dxtensa =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

In file included from ./arch/xtensa/include/generated/asm/bug.h:1,
from include/linux/bug.h:5,
from include/linux/thread_info.h:12,
from arch/xtensa/include/asm/current.h:18,
from include/linux/mutex.h:14,
from include/linux/notifier.h:14,
from include/linux/clk.h:14,
from drivers/gpu/drm/bridge/ti-sn65dsi86.c:8:
drivers/gpu/drm/bridge/ti-sn65dsi86.c: In function 'tn_sn_bridge_of_xlate':
>> drivers/gpu/drm/bridge/ti-sn65dsi86.c:923:41: error: 'struct gpio_chip' =
has no member named 'of_gpio_n_cells'
923 |  if (WARN_ON(gpiospec->args_count < chip->of_gpio_n_cells))
|                                         ^~
include/asm-generic/bug.h:113:25: note: in definition of macro 'WARN_ON'
113 |  int __ret_warn_on =3D !!(condition);             |                  =
       ^~~~~~~~~
drivers/gpu/drm/bridge/ti-sn65dsi86.c: In function 'ti_sn_bridge_gpio_set':
drivers/gpu/drm/bridge/ti-sn65dsi86.c:978:6: warning: variable 'ret' set bu=
t not used [-Wunused-but-set-variable]
978 |  int ret;
|      ^~~
drivers/gpu/drm/bridge/ti-sn65dsi86.c: In function 'ti_sn_setup_gpio_contro=
ller':
>> drivers/gpu/drm/bridge/ti-sn65dsi86.c:1067:14: error: 'struct gpio_chip'=
 has no member named 'of_xlate'
1067 |  pdata->gchip.of_xlate =3D tn_sn_bridge_of_xlate;
|              ^
drivers/gpu/drm/bridge/ti-sn65dsi86.c:1068:14: error: 'struct gpio_chip' ha=
s no member named 'of_gpio_n_cells'
1068 |  pdata->gchip.of_gpio_n_cells =3D 2;
|              ^

git remote add drm-drm-misc git://anongit.freedesktop.org/drm/drm-misc
git remote update drm-drm-misc
git checkout 27ed2b3f22ed60295c74b4ca3e855823d0e7603b
vim +923 drivers/gpu/drm/bridge/ti-sn65dsi86.c

a095f15c00e278 Sandeep Panda    2018-07-20   918  =

27ed2b3f22ed60 Douglas Anderson 2020-05-07   919  static int tn_sn_bridge_o=
f_xlate(struct gpio_chip *chip,
27ed2b3f22ed60 Douglas Anderson 2020-05-07   920  				 const struct of_phan=
dle_args *gpiospec,
27ed2b3f22ed60 Douglas Anderson 2020-05-07   921  				 u32 *flags)
27ed2b3f22ed60 Douglas Anderson 2020-05-07   922  {
27ed2b3f22ed60 Douglas Anderson 2020-05-07  @923  	if (WARN_ON(gpiospec->ar=
gs_count < chip->of_gpio_n_cells))
27ed2b3f22ed60 Douglas Anderson 2020-05-07   924  		return -EINVAL;
27ed2b3f22ed60 Douglas Anderson 2020-05-07   925  =

27ed2b3f22ed60 Douglas Anderson 2020-05-07   926  	if (gpiospec->args[0] > =
chip->ngpio || gpiospec->args[0] < 1)
27ed2b3f22ed60 Douglas Anderson 2020-05-07   927  		return -EINVAL;
27ed2b3f22ed60 Douglas Anderson 2020-05-07   928  =

27ed2b3f22ed60 Douglas Anderson 2020-05-07   929  	if (flags)
27ed2b3f22ed60 Douglas Anderson 2020-05-07   930  		*flags =3D gpiospec->ar=
gs[1];
27ed2b3f22ed60 Douglas Anderson 2020-05-07   931  =

27ed2b3f22ed60 Douglas Anderson 2020-05-07   932  	return gpiospec->args[0]=
 - SN_GPIO_PHYSICAL_OFFSET;
27ed2b3f22ed60 Douglas Anderson 2020-05-07   933  }
27ed2b3f22ed60 Douglas Anderson 2020-05-07   934  =

27ed2b3f22ed60 Douglas Anderson 2020-05-07   935  static int ti_sn_bridge_g=
pio_get_direction(struct gpio_chip *chip,
27ed2b3f22ed60 Douglas Anderson 2020-05-07   936  					   unsigned int offs=
et)
27ed2b3f22ed60 Douglas Anderson 2020-05-07   937  {
27ed2b3f22ed60 Douglas Anderson 2020-05-07   938  	struct ti_sn_bridge *pda=
ta =3D gpiochip_get_data(chip);
27ed2b3f22ed60 Douglas Anderson 2020-05-07   939  =

27ed2b3f22ed60 Douglas Anderson 2020-05-07   940  	/*
27ed2b3f22ed60 Douglas Anderson 2020-05-07   941  	 * We already have to ke=
ep track of the direction because we use
27ed2b3f22ed60 Douglas Anderson 2020-05-07   942  	 * that to figure out wh=
ether we've powered the device.  We can
27ed2b3f22ed60 Douglas Anderson 2020-05-07   943  	 * just return that rath=
er than (maybe) powering up the device
27ed2b3f22ed60 Douglas Anderson 2020-05-07   944  	 * to ask its direction.
27ed2b3f22ed60 Douglas Anderson 2020-05-07   945  	 */
27ed2b3f22ed60 Douglas Anderson 2020-05-07   946  	return test_bit(offset, =
pdata->gchip_output) ?
27ed2b3f22ed60 Douglas Anderson 2020-05-07   947  		GPIO_LINE_DIRECTION_OUT=
 : GPIO_LINE_DIRECTION_IN;
27ed2b3f22ed60 Douglas Anderson 2020-05-07   948  }
27ed2b3f22ed60 Douglas Anderson 2020-05-07   949  =

27ed2b3f22ed60 Douglas Anderson 2020-05-07   950  static int ti_sn_bridge_g=
pio_get(struct gpio_chip *chip, unsigned int offset)
27ed2b3f22ed60 Douglas Anderson 2020-05-07   951  {
27ed2b3f22ed60 Douglas Anderson 2020-05-07   952  	struct ti_sn_bridge *pda=
ta =3D gpiochip_get_data(chip);
27ed2b3f22ed60 Douglas Anderson 2020-05-07   953  	unsigned int val;
27ed2b3f22ed60 Douglas Anderson 2020-05-07   954  	int ret;
27ed2b3f22ed60 Douglas Anderson 2020-05-07   955  =

27ed2b3f22ed60 Douglas Anderson 2020-05-07   956  	/*
27ed2b3f22ed60 Douglas Anderson 2020-05-07   957  	 * When the pin is an in=
put we don't forcibly keep the bridge
27ed2b3f22ed60 Douglas Anderson 2020-05-07   958  	 * powered--we just powe=
r it on to read the pin.  NOTE: part of
27ed2b3f22ed60 Douglas Anderson 2020-05-07   959  	 * the reason this works=
 is that the bridge defaults (when
27ed2b3f22ed60 Douglas Anderson 2020-05-07   960  	 * powered back on) to a=
ll 4 GPIOs being configured as GPIO input.
27ed2b3f22ed60 Douglas Anderson 2020-05-07   961  	 * Also note that if som=
ething else is keeping the chip powered the
27ed2b3f22ed60 Douglas Anderson 2020-05-07   962  	 * pm_runtime functions =
are lightweight increments of a refcount.
27ed2b3f22ed60 Douglas Anderson 2020-05-07   963  	 */
27ed2b3f22ed60 Douglas Anderson 2020-05-07   964  	pm_runtime_get_sync(pdat=
a->dev);
27ed2b3f22ed60 Douglas Anderson 2020-05-07   965  	ret =3D regmap_read(pdat=
a->regmap, SN_GPIO_IO_REG, &val);
27ed2b3f22ed60 Douglas Anderson 2020-05-07   966  	pm_runtime_put(pdata->de=
v);
27ed2b3f22ed60 Douglas Anderson 2020-05-07   967  =

27ed2b3f22ed60 Douglas Anderson 2020-05-07   968  	if (ret)
27ed2b3f22ed60 Douglas Anderson 2020-05-07   969  		return ret;
27ed2b3f22ed60 Douglas Anderson 2020-05-07   970  =

27ed2b3f22ed60 Douglas Anderson 2020-05-07   971  	return !!(val & BIT(SN_G=
PIO_INPUT_SHIFT + offset));
27ed2b3f22ed60 Douglas Anderson 2020-05-07   972  }
27ed2b3f22ed60 Douglas Anderson 2020-05-07   973  =

27ed2b3f22ed60 Douglas Anderson 2020-05-07   974  static void ti_sn_bridge_=
gpio_set(struct gpio_chip *chip, unsigned int offset,
27ed2b3f22ed60 Douglas Anderson 2020-05-07   975  				  int val)
27ed2b3f22ed60 Douglas Anderson 2020-05-07   976  {
27ed2b3f22ed60 Douglas Anderson 2020-05-07   977  	struct ti_sn_bridge *pda=
ta =3D gpiochip_get_data(chip);
27ed2b3f22ed60 Douglas Anderson 2020-05-07   978  	int ret;
27ed2b3f22ed60 Douglas Anderson 2020-05-07   979  =

27ed2b3f22ed60 Douglas Anderson 2020-05-07   980  	if (!test_bit(offset, pd=
ata->gchip_output)) {
27ed2b3f22ed60 Douglas Anderson 2020-05-07   981  		dev_err(pdata->dev, "Ig=
noring GPIO set while input\n");
27ed2b3f22ed60 Douglas Anderson 2020-05-07   982  		return;
27ed2b3f22ed60 Douglas Anderson 2020-05-07   983  	}
27ed2b3f22ed60 Douglas Anderson 2020-05-07   984  =

27ed2b3f22ed60 Douglas Anderson 2020-05-07   985  	val &=3D 1;
27ed2b3f22ed60 Douglas Anderson 2020-05-07   986  	ret =3D regmap_update_bi=
ts(pdata->regmap, SN_GPIO_IO_REG,
27ed2b3f22ed60 Douglas Anderson 2020-05-07   987  				 BIT(SN_GPIO_OUTPUT_S=
HIFT + offset),
27ed2b3f22ed60 Douglas Anderson 2020-05-07   988  				 val << (SN_GPIO_OUTP=
UT_SHIFT + offset));
27ed2b3f22ed60 Douglas Anderson 2020-05-07   989  }
27ed2b3f22ed60 Douglas Anderson 2020-05-07   990  =

27ed2b3f22ed60 Douglas Anderson 2020-05-07   991  static int ti_sn_bridge_g=
pio_direction_input(struct gpio_chip *chip,
27ed2b3f22ed60 Douglas Anderson 2020-05-07   992  					     unsigned int of=
fset)
27ed2b3f22ed60 Douglas Anderson 2020-05-07   993  {
27ed2b3f22ed60 Douglas Anderson 2020-05-07   994  	struct ti_sn_bridge *pda=
ta =3D gpiochip_get_data(chip);
27ed2b3f22ed60 Douglas Anderson 2020-05-07   995  	int shift =3D offset * 2;
27ed2b3f22ed60 Douglas Anderson 2020-05-07   996  	int ret;
27ed2b3f22ed60 Douglas Anderson 2020-05-07   997  =

27ed2b3f22ed60 Douglas Anderson 2020-05-07   998  	if (!test_and_clear_bit(=
offset, pdata->gchip_output))
27ed2b3f22ed60 Douglas Anderson 2020-05-07   999  		return 0;
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1000  =

27ed2b3f22ed60 Douglas Anderson 2020-05-07  1001  	ret =3D regmap_update_bi=
ts(pdata->regmap, SN_GPIO_CTRL_REG,
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1002  				 SN_GPIO_MUX_MASK << =
shift,
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1003  				 SN_GPIO_MUX_INPUT <<=
 shift);
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1004  	if (ret) {
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1005  		set_bit(offset, pdata->=
gchip_output);
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1006  		return ret;
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1007  	}
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1008  =

27ed2b3f22ed60 Douglas Anderson 2020-05-07  1009  	/*
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1010  	 * NOTE: if nobody else =
is powering the device this may fully power
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1011  	 * it off and when it co=
mes back it will have lost all state, but
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1012  	 * that's OK because the=
 default is input and we're now an input.
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1013  	 */
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1014  	pm_runtime_put(pdata->de=
v);
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1015  =

27ed2b3f22ed60 Douglas Anderson 2020-05-07  1016  	return 0;
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1017  }
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1018  =

27ed2b3f22ed60 Douglas Anderson 2020-05-07  1019  static int ti_sn_bridge_g=
pio_direction_output(struct gpio_chip *chip,
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1020  					      unsigned int o=
ffset, int val)
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1021  {
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1022  	struct ti_sn_bridge *pda=
ta =3D gpiochip_get_data(chip);
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1023  	int shift =3D offset * 2;
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1024  	int ret;
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1025  =

27ed2b3f22ed60 Douglas Anderson 2020-05-07  1026  	if (test_and_set_bit(off=
set, pdata->gchip_output))
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1027  		return 0;
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1028  =

27ed2b3f22ed60 Douglas Anderson 2020-05-07  1029  	pm_runtime_get_sync(pdat=
a->dev);
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1030  =

27ed2b3f22ed60 Douglas Anderson 2020-05-07  1031  	/* Set value first to av=
oid glitching */
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1032  	ti_sn_bridge_gpio_set(ch=
ip, offset, val);
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1033  =

27ed2b3f22ed60 Douglas Anderson 2020-05-07  1034  	/* Set direction */
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1035  	ret =3D regmap_update_bi=
ts(pdata->regmap, SN_GPIO_CTRL_REG,
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1036  				 SN_GPIO_MUX_MASK << =
shift,
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1037  				 SN_GPIO_MUX_OUTPUT <=
< shift);
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1038  	if (ret) {
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1039  		clear_bit(offset, pdata=
->gchip_output);
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1040  		pm_runtime_put(pdata->d=
ev);
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1041  	}
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1042  =

27ed2b3f22ed60 Douglas Anderson 2020-05-07  1043  	return ret;
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1044  }
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1045  =

27ed2b3f22ed60 Douglas Anderson 2020-05-07  1046  static void ti_sn_bridge_=
gpio_free(struct gpio_chip *chip, unsigned int offset)
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1047  {
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1048  	/* We won't keep pm_runt=
ime if we're input, so switch there on free */
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1049  	ti_sn_bridge_gpio_direct=
ion_input(chip, offset);
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1050  }
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1051  =

27ed2b3f22ed60 Douglas Anderson 2020-05-07  1052  static const char * const=
 ti_sn_bridge_gpio_names[SN_NUM_GPIOS] =3D {
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1053  	"GPIO1", "GPIO2", "GPIO3=
", "GPIO4"
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1054  };
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1055  =

27ed2b3f22ed60 Douglas Anderson 2020-05-07  1056  static int ti_sn_setup_gp=
io_controller(struct ti_sn_bridge *pdata)
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1057  {
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1058  	int ret;
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1059  =

27ed2b3f22ed60 Douglas Anderson 2020-05-07  1060  	/* Only init if someone =
is going to use us as a GPIO controller */
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1061  	if (!of_property_read_bo=
ol(pdata->dev->of_node, "gpio-controller"))
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1062  		return 0;
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1063  =

27ed2b3f22ed60 Douglas Anderson 2020-05-07  1064  	pdata->gchip.label =3D d=
ev_name(pdata->dev);
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1065  	pdata->gchip.parent =3D =
pdata->dev;
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1066  	pdata->gchip.owner =3D T=
HIS_MODULE;
27ed2b3f22ed60 Douglas Anderson 2020-05-07 @1067  	pdata->gchip.of_xlate =
=3D tn_sn_bridge_of_xlate;
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1068  	pdata->gchip.of_gpio_n_c=
ells =3D 2;
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1069  	pdata->gchip.free =3D ti=
_sn_bridge_gpio_free;
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1070  	pdata->gchip.get_directi=
on =3D ti_sn_bridge_gpio_get_direction;
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1071  	pdata->gchip.direction_i=
nput =3D ti_sn_bridge_gpio_direction_input;
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1072  	pdata->gchip.direction_o=
utput =3D ti_sn_bridge_gpio_direction_output;
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1073  	pdata->gchip.get =3D ti_=
sn_bridge_gpio_get;
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1074  	pdata->gchip.set =3D ti_=
sn_bridge_gpio_set;
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1075  	pdata->gchip.can_sleep =
=3D true;
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1076  	pdata->gchip.names =3D t=
i_sn_bridge_gpio_names;
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1077  	pdata->gchip.ngpio =3D S=
N_NUM_GPIOS;
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1078  	pdata->gchip.base =3D -1;
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1079  	ret =3D devm_gpiochip_ad=
d_data(pdata->dev, &pdata->gchip, pdata);
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1080  	if (ret)
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1081  		dev_err(pdata->dev, "ca=
n't add gpio chip\n");
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1082  =

27ed2b3f22ed60 Douglas Anderson 2020-05-07  1083  	return ret;
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1084  }
27ed2b3f22ed60 Douglas Anderson 2020-05-07  1085  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============2419265742012610695==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
P6o4Po6mMgEA
--===============2419265742012610695==--

