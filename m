Content-Type: multipart/mixed; boundary="===============7791817830394802819=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/2] leds: ktd20xx: Add the KTD20xx family of the RGB LEDs driver from Kinetic
Date: Sat, 20 Nov 2021 14:48:05 +0800
Message-ID: <202111201421.udM6bJHl-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7791817830394802819==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211109100822.5412-2-fe@dev.tdt.de>
References: <20211109100822.5412-2-fe@dev.tdt.de>
TO: Florian Eckert <fe@dev.tdt.de>
TO: pavel(a)ucw.cz
TO: robh+dt(a)kernel.org
TO: Eckert.Florian(a)googlemail.com
CC: linux-leds(a)vger.kernel.org
CC: devicetree(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org
CC: Florian Eckert <fe@dev.tdt.de>

Hi Florian,

I love your patch! Perhaps something to improve:

[auto build test WARNING on pavel-leds/for-next]
[also build test WARNING on robh/for-next linus/master v5.16-rc1 next-20211=
118]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Florian-Eckert/leds-Add-KT=
D20xx-RGB-LEDs-driver-from-Kinetic/20211109-181728
base:   git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git =
for-next
:::::: branch date: 11 days ago
:::::: commit date: 11 days ago
config: i386-randconfig-m031-20211115 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/leds/leds-ktd20xx.c:304 ktd20xx_probe_dt() warn: missing error code=
 'ret'
drivers/leds/leds-ktd20xx.c:492 current_color0_store() warn: unsigned 'valu=
e[i]' is never less than zero.
drivers/leds/leds-ktd20xx.c:566 current_color1_store() warn: unsigned 'valu=
e[i]' is never less than zero.
drivers/leds/leds-ktd20xx.c:661 faderate_store() warn: unsigned 'faderate' =
is never less than zero.

vim +/ret +304 drivers/leds/leds-ktd20xx.c

004e74105bb360 Florian Eckert 2021-11-09  280  =

004e74105bb360 Florian Eckert 2021-11-09  281  static int ktd20xx_probe_dt(=
struct ktd20xx *chip)
004e74105bb360 Florian Eckert 2021-11-09  282  {
004e74105bb360 Florian Eckert 2021-11-09  283  	struct fwnode_handle *child=
 =3D NULL;
004e74105bb360 Florian Eckert 2021-11-09  284  	struct led_init_data init_d=
ata =3D {};
004e74105bb360 Florian Eckert 2021-11-09  285  	struct led_classdev *led_cd=
ev;
004e74105bb360 Florian Eckert 2021-11-09  286  	struct ktd20xx_led *led;
004e74105bb360 Florian Eckert 2021-11-09  287  	struct device *dev =3D &chi=
p->client->dev;
004e74105bb360 Florian Eckert 2021-11-09  288  	u8 value[3] =3D { 0, 0, 0 };
004e74105bb360 Florian Eckert 2021-11-09  289  	int i =3D 0;
004e74105bb360 Florian Eckert 2021-11-09  290  	int ret =3D -EINVAL;
004e74105bb360 Florian Eckert 2021-11-09  291  	int color;
004e74105bb360 Florian Eckert 2021-11-09  292  =

004e74105bb360 Florian Eckert 2021-11-09  293  	device_for_each_child_node(=
chip->dev, child) {
004e74105bb360 Florian Eckert 2021-11-09  294  		led =3D &chip->leds[i];
004e74105bb360 Florian Eckert 2021-11-09  295  =

004e74105bb360 Florian Eckert 2021-11-09  296  		ret =3D fwnode_property_re=
ad_u32(child, "reg", &led->index);
004e74105bb360 Florian Eckert 2021-11-09  297  		if (ret) {
004e74105bb360 Florian Eckert 2021-11-09  298  			dev_err(dev, "missing pro=
perty: reg\n");
004e74105bb360 Florian Eckert 2021-11-09  299  			goto child_out;
004e74105bb360 Florian Eckert 2021-11-09  300  		}
004e74105bb360 Florian Eckert 2021-11-09  301  		if (led->index >=3D KTD20X=
X_MAX_LEDS) {
004e74105bb360 Florian Eckert 2021-11-09  302  			dev_warn(dev, "property '=
reg' must contain value between '0' and '%i'\n",
004e74105bb360 Florian Eckert 2021-11-09  303  					KTD20XX_MAX_LEDS);
004e74105bb360 Florian Eckert 2021-11-09 @304  			goto child_out;
004e74105bb360 Florian Eckert 2021-11-09  305  		}
004e74105bb360 Florian Eckert 2021-11-09  306  =

004e74105bb360 Florian Eckert 2021-11-09  307  		ret =3D fwnode_property_re=
ad_u32(child, "color", &color);
004e74105bb360 Florian Eckert 2021-11-09  308  		if (ret) {
004e74105bb360 Florian Eckert 2021-11-09  309  			dev_err(dev, "missing pro=
perty: color\n");
004e74105bb360 Florian Eckert 2021-11-09  310  			goto child_out;
004e74105bb360 Florian Eckert 2021-11-09  311  		}
004e74105bb360 Florian Eckert 2021-11-09  312  		if (color !=3D LED_COLOR_I=
D_RGB) {
004e74105bb360 Florian Eckert 2021-11-09  313  			dev_warn(dev, "property '=
color' must contain value 'LED_COLOR_ID_RGB'\n");
004e74105bb360 Florian Eckert 2021-11-09  314  			goto child_out;
004e74105bb360 Florian Eckert 2021-11-09  315  		}
004e74105bb360 Florian Eckert 2021-11-09  316  =

004e74105bb360 Florian Eckert 2021-11-09  317  		/* Get default color regis=
ter selection */
004e74105bb360 Florian Eckert 2021-11-09  318  		if (fwnode_property_read_u=
8_array(child, "kinetic,color-selection", value, 3))
004e74105bb360 Florian Eckert 2021-11-09  319  			dev_warn(dev, "no kinetic=
,color-selection property found, use default rgbt color selection from regi=
ster 0.\n");
004e74105bb360 Florian Eckert 2021-11-09  320  =

004e74105bb360 Florian Eckert 2021-11-09  321  		led->subled_info[0].color_=
index =3D LED_COLOR_ID_RED;
004e74105bb360 Florian Eckert 2021-11-09  322  		led->subled_info[0].channe=
l =3D 0;
004e74105bb360 Florian Eckert 2021-11-09  323  		led->subled_info[0].intens=
ity =3D value[0];
004e74105bb360 Florian Eckert 2021-11-09  324  		led->subled_info[1].color_=
index =3D LED_COLOR_ID_GREEN;
004e74105bb360 Florian Eckert 2021-11-09  325  		led->subled_info[1].channe=
l =3D 1;
004e74105bb360 Florian Eckert 2021-11-09  326  		led->subled_info[1].intens=
ity =3D value[1];
004e74105bb360 Florian Eckert 2021-11-09  327  		led->subled_info[2].color_=
index =3D LED_COLOR_ID_BLUE;
004e74105bb360 Florian Eckert 2021-11-09  328  		led->subled_info[2].channe=
l =3D 2;
004e74105bb360 Florian Eckert 2021-11-09  329  		led->subled_info[2].intens=
ity =3D value[2];
004e74105bb360 Florian Eckert 2021-11-09  330  =

004e74105bb360 Florian Eckert 2021-11-09  331  		led->mc_cdev.subled_info =
=3D led->subled_info;
004e74105bb360 Florian Eckert 2021-11-09  332  		led->mc_cdev.num_colors =
=3D KTD20XX_LED_CHANNELS;
004e74105bb360 Florian Eckert 2021-11-09  333  =

004e74105bb360 Florian Eckert 2021-11-09  334  		init_data.fwnode =3D child;
004e74105bb360 Florian Eckert 2021-11-09  335  =

004e74105bb360 Florian Eckert 2021-11-09  336  		led->chip =3D chip;
004e74105bb360 Florian Eckert 2021-11-09  337  		led_cdev =3D &led->mc_cdev=
.led_cdev;
004e74105bb360 Florian Eckert 2021-11-09  338  		led_cdev->brightness_set_b=
locking =3D ktd20xx_brightness_set;
004e74105bb360 Florian Eckert 2021-11-09  339  =

004e74105bb360 Florian Eckert 2021-11-09  340  		switch (led->index) {
004e74105bb360 Florian Eckert 2021-11-09  341  		case RGB_A1:
004e74105bb360 Florian Eckert 2021-11-09  342  			led->select =3D devm_regm=
ap_field_alloc(chip->dev,
004e74105bb360 Florian Eckert 2021-11-09  343  					chip->regmap, kt20xx_a1=
_select);
004e74105bb360 Florian Eckert 2021-11-09  344  			led->enable =3D devm_regm=
ap_field_alloc(chip->dev,
004e74105bb360 Florian Eckert 2021-11-09  345  					chip->regmap, kt20xx_a1=
_enable);
004e74105bb360 Florian Eckert 2021-11-09  346  			break;
004e74105bb360 Florian Eckert 2021-11-09  347  		case RGB_A2:
004e74105bb360 Florian Eckert 2021-11-09  348  			led->select =3D devm_regm=
ap_field_alloc(chip->dev,
004e74105bb360 Florian Eckert 2021-11-09  349  					chip->regmap, kt20xx_a2=
_select);
004e74105bb360 Florian Eckert 2021-11-09  350  			led->enable =3D devm_regm=
ap_field_alloc(chip->dev,
004e74105bb360 Florian Eckert 2021-11-09  351  					chip->regmap, kt20xx_a2=
_enable);
004e74105bb360 Florian Eckert 2021-11-09  352  			break;
004e74105bb360 Florian Eckert 2021-11-09  353  		case RGB_A3:
004e74105bb360 Florian Eckert 2021-11-09  354  			led->select =3D devm_regm=
ap_field_alloc(chip->dev,
004e74105bb360 Florian Eckert 2021-11-09  355  					chip->regmap, kt20xx_a3=
_select);
004e74105bb360 Florian Eckert 2021-11-09  356  			led->enable =3D devm_regm=
ap_field_alloc(chip->dev,
004e74105bb360 Florian Eckert 2021-11-09  357  					chip->regmap, kt20xx_a3=
_enable);
004e74105bb360 Florian Eckert 2021-11-09  358  			break;
004e74105bb360 Florian Eckert 2021-11-09  359  		case RGB_A4:
004e74105bb360 Florian Eckert 2021-11-09  360  			led->select =3D devm_regm=
ap_field_alloc(chip->dev,
004e74105bb360 Florian Eckert 2021-11-09  361  					chip->regmap, kt20xx_a4=
_select);
004e74105bb360 Florian Eckert 2021-11-09  362  			led->enable =3D devm_regm=
ap_field_alloc(chip->dev,
004e74105bb360 Florian Eckert 2021-11-09  363  					chip->regmap, kt20xx_a4=
_enable);
004e74105bb360 Florian Eckert 2021-11-09  364  			break;
004e74105bb360 Florian Eckert 2021-11-09  365  		case RGB_B1:
004e74105bb360 Florian Eckert 2021-11-09  366  			led->select =3D devm_regm=
ap_field_alloc(chip->dev,
004e74105bb360 Florian Eckert 2021-11-09  367  					chip->regmap, kt20xx_b1=
_select);
004e74105bb360 Florian Eckert 2021-11-09  368  			led->enable =3D devm_regm=
ap_field_alloc(chip->dev,
004e74105bb360 Florian Eckert 2021-11-09  369  					chip->regmap, kt20xx_b1=
_enable);
004e74105bb360 Florian Eckert 2021-11-09  370  			break;
004e74105bb360 Florian Eckert 2021-11-09  371  		case RGB_B2:
004e74105bb360 Florian Eckert 2021-11-09  372  			led->select =3D devm_regm=
ap_field_alloc(chip->dev,
004e74105bb360 Florian Eckert 2021-11-09  373  					chip->regmap, kt20xx_b2=
_select);
004e74105bb360 Florian Eckert 2021-11-09  374  			led->enable =3D devm_regm=
ap_field_alloc(chip->dev,
004e74105bb360 Florian Eckert 2021-11-09  375  					chip->regmap, kt20xx_b2=
_enable);
004e74105bb360 Florian Eckert 2021-11-09  376  			break;
004e74105bb360 Florian Eckert 2021-11-09  377  		case RGB_B3:
004e74105bb360 Florian Eckert 2021-11-09  378  			led->select =3D devm_regm=
ap_field_alloc(chip->dev,
004e74105bb360 Florian Eckert 2021-11-09  379  					chip->regmap, kt20xx_b3=
_select);
004e74105bb360 Florian Eckert 2021-11-09  380  			led->enable =3D devm_regm=
ap_field_alloc(chip->dev,
004e74105bb360 Florian Eckert 2021-11-09  381  					chip->regmap, kt20xx_b3=
_enable);
004e74105bb360 Florian Eckert 2021-11-09  382  			break;
004e74105bb360 Florian Eckert 2021-11-09  383  		case RGB_B4:
004e74105bb360 Florian Eckert 2021-11-09  384  			led->select =3D devm_regm=
ap_field_alloc(chip->dev,
004e74105bb360 Florian Eckert 2021-11-09  385  					chip->regmap, kt20xx_b4=
_select);
004e74105bb360 Florian Eckert 2021-11-09  386  			led->enable =3D devm_regm=
ap_field_alloc(chip->dev,
004e74105bb360 Florian Eckert 2021-11-09  387  					chip->regmap, kt20xx_b4=
_enable);
004e74105bb360 Florian Eckert 2021-11-09  388  			break;
004e74105bb360 Florian Eckert 2021-11-09  389  		case RGB_C1:
004e74105bb360 Florian Eckert 2021-11-09  390  			led->select =3D devm_regm=
ap_field_alloc(chip->dev,
004e74105bb360 Florian Eckert 2021-11-09  391  					chip->regmap, kt20xx_c1=
_select);
004e74105bb360 Florian Eckert 2021-11-09  392  			led->enable =3D devm_regm=
ap_field_alloc(chip->dev,
004e74105bb360 Florian Eckert 2021-11-09  393  					chip->regmap, kt20xx_c1=
_enable);
004e74105bb360 Florian Eckert 2021-11-09  394  			break;
004e74105bb360 Florian Eckert 2021-11-09  395  		case RGB_C2:
004e74105bb360 Florian Eckert 2021-11-09  396  			led->select =3D devm_regm=
ap_field_alloc(chip->dev,
004e74105bb360 Florian Eckert 2021-11-09  397  					chip->regmap, kt20xx_c2=
_select);
004e74105bb360 Florian Eckert 2021-11-09  398  			led->enable =3D devm_regm=
ap_field_alloc(chip->dev,
004e74105bb360 Florian Eckert 2021-11-09  399  					chip->regmap, kt20xx_c2=
_enable);
004e74105bb360 Florian Eckert 2021-11-09  400  			break;
004e74105bb360 Florian Eckert 2021-11-09  401  		case RGB_C3:
004e74105bb360 Florian Eckert 2021-11-09  402  			led->select =3D devm_regm=
ap_field_alloc(chip->dev,
004e74105bb360 Florian Eckert 2021-11-09  403  					chip->regmap, kt20xx_c3=
_select);
004e74105bb360 Florian Eckert 2021-11-09  404  			led->enable =3D devm_regm=
ap_field_alloc(chip->dev,
004e74105bb360 Florian Eckert 2021-11-09  405  					chip->regmap, kt20xx_c3=
_enable);
004e74105bb360 Florian Eckert 2021-11-09  406  			break;
004e74105bb360 Florian Eckert 2021-11-09  407  		case RGB_C4:
004e74105bb360 Florian Eckert 2021-11-09  408  			led->select =3D devm_regm=
ap_field_alloc(chip->dev,
004e74105bb360 Florian Eckert 2021-11-09  409  					chip->regmap, kt20xx_c4=
_select);
004e74105bb360 Florian Eckert 2021-11-09  410  			led->enable =3D devm_regm=
ap_field_alloc(chip->dev,
004e74105bb360 Florian Eckert 2021-11-09  411  					chip->regmap, kt20xx_c4=
_enable);
004e74105bb360 Florian Eckert 2021-11-09  412  			break;
004e74105bb360 Florian Eckert 2021-11-09  413  		}
004e74105bb360 Florian Eckert 2021-11-09  414  =

004e74105bb360 Florian Eckert 2021-11-09  415  		ret =3D devm_led_classdev_=
multicolor_register_ext(&chip->client->dev,
004e74105bb360 Florian Eckert 2021-11-09  416  			&led->mc_cdev,
004e74105bb360 Florian Eckert 2021-11-09  417  			&init_data);
004e74105bb360 Florian Eckert 2021-11-09  418  =

004e74105bb360 Florian Eckert 2021-11-09  419  		if (ret) {
004e74105bb360 Florian Eckert 2021-11-09  420  			dev_err(&chip->client->de=
v, "led register err: %d\n", ret);
004e74105bb360 Florian Eckert 2021-11-09  421  			goto child_out;
004e74105bb360 Florian Eckert 2021-11-09  422  		}
004e74105bb360 Florian Eckert 2021-11-09  423  =

004e74105bb360 Florian Eckert 2021-11-09  424  		i++;
004e74105bb360 Florian Eckert 2021-11-09  425  		fwnode_handle_put(child);
004e74105bb360 Florian Eckert 2021-11-09  426  	}
004e74105bb360 Florian Eckert 2021-11-09  427  =

004e74105bb360 Florian Eckert 2021-11-09  428  	return 0;
004e74105bb360 Florian Eckert 2021-11-09  429  =

004e74105bb360 Florian Eckert 2021-11-09  430  child_out:
004e74105bb360 Florian Eckert 2021-11-09  431  	fwnode_handle_put(child);
004e74105bb360 Florian Eckert 2021-11-09  432  	return ret;
004e74105bb360 Florian Eckert 2021-11-09  433  }
004e74105bb360 Florian Eckert 2021-11-09  434  =

004e74105bb360 Florian Eckert 2021-11-09  435  /* Device attribute for colo=
r0 register
004e74105bb360 Florian Eckert 2021-11-09  436   *
004e74105bb360 Florian Eckert 2021-11-09  437   * The device attribute colo=
ur1 is intended to adjust the colour space.
004e74105bb360 Florian Eckert 2021-11-09  438   * The colour strength can b=
e controlled via the current in 125uA steps.
004e74105bb360 Florian Eckert 2021-11-09  439   * The maximum current for t=
he individual channels is limited to 24mA.
004e74105bb360 Florian Eckert 2021-11-09  440   * To set a new RGB value, 3=
 values must be passed. This value may not be
004e74105bb360 Florian Eckert 2021-11-09  441   * less than 0 and also not =
greater than 194. The chip can only process the
004e74105bb360 Florian Eckert 2021-11-09  442   * maximum current of 24mA. =
This means that any value greater than 194
004e74105bb360 Florian Eckert 2021-11-09  443   * cannot be set.
004e74105bb360 Florian Eckert 2021-11-09  444   */
004e74105bb360 Florian Eckert 2021-11-09  445  static ssize_t current_color=
0_show(struct device *dev,
004e74105bb360 Florian Eckert 2021-11-09  446  		struct device_attribute *a,
004e74105bb360 Florian Eckert 2021-11-09  447  		char *buf)
004e74105bb360 Florian Eckert 2021-11-09  448  {
004e74105bb360 Florian Eckert 2021-11-09  449  	struct i2c_client *client =
=3D to_i2c_client(dev);
004e74105bb360 Florian Eckert 2021-11-09  450  	struct ktd20xx *chip =3D i2=
c_get_clientdata(client);
004e74105bb360 Florian Eckert 2021-11-09  451  	unsigned int value;
004e74105bb360 Florian Eckert 2021-11-09  452  	int len =3D 0;
004e74105bb360 Florian Eckert 2021-11-09  453  =

004e74105bb360 Florian Eckert 2021-11-09  454  	mutex_lock(&chip->lock);
004e74105bb360 Florian Eckert 2021-11-09  455  	regmap_read(chip->regmap, K=
TD20XX_IRED0, &value);
004e74105bb360 Florian Eckert 2021-11-09  456  	len +=3D sprintf(buf + len,=
 "%d", value);
004e74105bb360 Florian Eckert 2021-11-09  457  	len +=3D sprintf(buf + len,=
 " ");
004e74105bb360 Florian Eckert 2021-11-09  458  =

004e74105bb360 Florian Eckert 2021-11-09  459  	regmap_read(chip->regmap, K=
TD20XX_IGRN0, &value);
004e74105bb360 Florian Eckert 2021-11-09  460  	len +=3D sprintf(buf + len,=
 "%d", value);
004e74105bb360 Florian Eckert 2021-11-09  461  	len +=3D sprintf(buf + len,=
 " ");
004e74105bb360 Florian Eckert 2021-11-09  462  =

004e74105bb360 Florian Eckert 2021-11-09  463  	regmap_read(chip->regmap, K=
TD20XX_IBLU0, &value);
004e74105bb360 Florian Eckert 2021-11-09  464  	len +=3D sprintf(buf + len,=
 "%d", value);
004e74105bb360 Florian Eckert 2021-11-09  465  	mutex_unlock(&chip->lock);
004e74105bb360 Florian Eckert 2021-11-09  466  =

004e74105bb360 Florian Eckert 2021-11-09  467  	buf[len++] =3D '\n';
004e74105bb360 Florian Eckert 2021-11-09  468  	return len;
004e74105bb360 Florian Eckert 2021-11-09  469  }
004e74105bb360 Florian Eckert 2021-11-09  470  =

004e74105bb360 Florian Eckert 2021-11-09  471  static ssize_t current_color=
0_store(struct device *dev,
004e74105bb360 Florian Eckert 2021-11-09  472  		struct device_attribute *a,
004e74105bb360 Florian Eckert 2021-11-09  473  		const char *buf, size_t si=
ze)
004e74105bb360 Florian Eckert 2021-11-09  474  {
004e74105bb360 Florian Eckert 2021-11-09  475  	struct i2c_client *client =
=3D to_i2c_client(dev);
004e74105bb360 Florian Eckert 2021-11-09  476  	struct ktd20xx *chip =3D i2=
c_get_clientdata(client);
004e74105bb360 Florian Eckert 2021-11-09  477  	unsigned int value[3];
004e74105bb360 Florian Eckert 2021-11-09  478  	int i;
004e74105bb360 Florian Eckert 2021-11-09  479  	ssize_t ret;
004e74105bb360 Florian Eckert 2021-11-09  480  =

004e74105bb360 Florian Eckert 2021-11-09  481  	ret =3D sscanf(buf, "%u %u =
%u", &value[0], &value[1], &value[2]);
004e74105bb360 Florian Eckert 2021-11-09  482  	if (ret < 3) {
004e74105bb360 Florian Eckert 2021-11-09  483  		ret =3D -EINVAL;
004e74105bb360 Florian Eckert 2021-11-09  484  		goto err_out;
004e74105bb360 Florian Eckert 2021-11-09  485  	}
004e74105bb360 Florian Eckert 2021-11-09  486  =

004e74105bb360 Florian Eckert 2021-11-09  487  	for (i =3D 0; i < 3; i++) {
004e74105bb360 Florian Eckert 2021-11-09  488  		if (value[i] > 194) {
004e74105bb360 Florian Eckert 2021-11-09  489  			ret =3D -EINVAL;
004e74105bb360 Florian Eckert 2021-11-09  490  			goto err_out;
004e74105bb360 Florian Eckert 2021-11-09  491  		}
004e74105bb360 Florian Eckert 2021-11-09 @492  		if (value[i] < 0) {
004e74105bb360 Florian Eckert 2021-11-09  493  			ret =3D -EINVAL;
004e74105bb360 Florian Eckert 2021-11-09  494  			goto err_out;
004e74105bb360 Florian Eckert 2021-11-09  495  		}
004e74105bb360 Florian Eckert 2021-11-09  496  	}
004e74105bb360 Florian Eckert 2021-11-09  497  =

004e74105bb360 Florian Eckert 2021-11-09  498  	mutex_lock(&chip->lock);
004e74105bb360 Florian Eckert 2021-11-09  499  	regmap_write(chip->regmap, =
KTD20XX_IRED0, value[0]);
004e74105bb360 Florian Eckert 2021-11-09  500  	regmap_write(chip->regmap, =
KTD20XX_IGRN0, value[1]);
004e74105bb360 Florian Eckert 2021-11-09  501  	regmap_write(chip->regmap, =
KTD20XX_IBLU0, value[2]);
004e74105bb360 Florian Eckert 2021-11-09  502  	mutex_unlock(&chip->lock);
004e74105bb360 Florian Eckert 2021-11-09  503  	return size;
004e74105bb360 Florian Eckert 2021-11-09  504  =

004e74105bb360 Florian Eckert 2021-11-09  505  err_out:
004e74105bb360 Florian Eckert 2021-11-09  506  	return ret;
004e74105bb360 Florian Eckert 2021-11-09  507  }
004e74105bb360 Florian Eckert 2021-11-09  508  static DEVICE_ATTR_RW(curren=
t_color0);
004e74105bb360 Florian Eckert 2021-11-09  509  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7791817830394802819==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============7791817830394802819==--

