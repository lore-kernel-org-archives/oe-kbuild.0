Content-Type: multipart/mixed; boundary="===============3040890393733106010=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v2 1/5] hwmon: (max31790) Rework to use regmap
Date: Wed, 17 Mar 2021 08:12:40 +0300
Message-ID: <20210317051239.GW2087@kadam>
In-Reply-To: <20210316175503.1003051-1-kubernat@cesnet.cz>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3040890393733106010==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi "V=C3=A1clav,

url:    https://github.com/0day-ci/linux/commits/V-clav-Kubern-t/hwmon-max3=
1790-Rework-to-use-regmap/20210317-015931
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-stagin=
g.git hwmon-next
config: x86_64-randconfig-m001-20210316 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/hwmon/max31790.c:263 max31790_fan_is_visible() warn: impossible con=
dition '(fan_config < 0) =3D> (0-255 < 0)'
drivers/hwmon/max31790.c:337 max31790_write_pwm() warn: impossible conditio=
n '(fan_config < 0) =3D> (0-255 < 0)'
drivers/hwmon/max31790.c:372 max31790_pwm_is_visible() warn: impossible con=
dition '(fan_config < 0) =3D> (0-255 < 0)'

vim +263 drivers/hwmon/max31790.c

54187ff9d766b2 Guenter Roeck   2016-07-01  257  static umode_t max31790_fan=
_is_visible(const void *_data, u32 attr, int channel)
195a4b4298a795 Il Han          2015-08-30  258  {
54187ff9d766b2 Guenter Roeck   2016-07-01  259  	const struct max31790_data=
 *data =3D _data;
2c8602cfaeab63 V=C3=A1clav Kubern=C3=A1t 2021-03-16  260  	struct regmap *r=
egmap =3D data->regmap;
2c8602cfaeab63 V=C3=A1clav Kubern=C3=A1t 2021-03-16  261  	u8 fan_config =
=3D read_reg_byte(regmap, MAX31790_REG_FAN_CONFIG(channel % NR_CHANNEL));
2c8602cfaeab63 V=C3=A1clav Kubern=C3=A1t 2021-03-16  262  =

2c8602cfaeab63 V=C3=A1clav Kubern=C3=A1t 2021-03-16 @263  	if (fan_config <=
 0)
                                                            ^^^^^^^^^^^^^^
A u8 can't be negative.

2c8602cfaeab63 V=C3=A1clav Kubern=C3=A1t 2021-03-16  264  		return 0;
54187ff9d766b2 Guenter Roeck   2016-07-01  265  =

54187ff9d766b2 Guenter Roeck   2016-07-01  266  	switch (attr) {
54187ff9d766b2 Guenter Roeck   2016-07-01  267  	case hwmon_fan_input:
54187ff9d766b2 Guenter Roeck   2016-07-01  268  	case hwmon_fan_fault:
54187ff9d766b2 Guenter Roeck   2016-07-01  269  		if (channel < NR_CHANNEL =
||
54187ff9d766b2 Guenter Roeck   2016-07-01  270  		    (fan_config & MAX3179=
0_FAN_CFG_TACH_INPUT))
dc8dbb4d7672b7 Guenter Roeck   2018-12-10  271  			return 0444;
54187ff9d766b2 Guenter Roeck   2016-07-01  272  		return 0;
54187ff9d766b2 Guenter Roeck   2016-07-01  273  	case hwmon_fan_target:
54187ff9d766b2 Guenter Roeck   2016-07-01  274  		if (channel < NR_CHANNEL =
&&
54187ff9d766b2 Guenter Roeck   2016-07-01  275  		    !(fan_config & MAX317=
90_FAN_CFG_TACH_INPUT))
dc8dbb4d7672b7 Guenter Roeck   2018-12-10  276  			return 0644;
54187ff9d766b2 Guenter Roeck   2016-07-01  277  		return 0;
54187ff9d766b2 Guenter Roeck   2016-07-01  278  	default:
54187ff9d766b2 Guenter Roeck   2016-07-01  279  		return 0;
195a4b4298a795 Il Han          2015-08-30  280  	}
195a4b4298a795 Il Han          2015-08-30  281  }
195a4b4298a795 Il Han          2015-08-30  282  =

54187ff9d766b2 Guenter Roeck   2016-07-01  283  static int max31790_read_pw=
m(struct device *dev, u32 attr, int channel,
54187ff9d766b2 Guenter Roeck   2016-07-01  284  			     long *val)
195a4b4298a795 Il Han          2015-08-30  285  {
2c8602cfaeab63 V=C3=A1clav Kubern=C3=A1t 2021-03-16  286  	struct max31790_=
data *data =3D dev_get_drvdata(dev);
2c8602cfaeab63 V=C3=A1clav Kubern=C3=A1t 2021-03-16  287  	struct regmap *r=
egmap =3D data->regmap;
2c8602cfaeab63 V=C3=A1clav Kubern=C3=A1t 2021-03-16  288  	int read;
195a4b4298a795 Il Han          2015-08-30  289  =

195a4b4298a795 Il Han          2015-08-30  290  	if (IS_ERR(data))
195a4b4298a795 Il Han          2015-08-30  291  		return PTR_ERR(data);
195a4b4298a795 Il Han          2015-08-30  292  =

54187ff9d766b2 Guenter Roeck   2016-07-01  293  	switch (attr) {
54187ff9d766b2 Guenter Roeck   2016-07-01  294  	case hwmon_pwm_input:
2c8602cfaeab63 V=C3=A1clav Kubern=C3=A1t 2021-03-16  295  		read =3D read_r=
eg_word(regmap, MAX31790_REG_PWMOUT(channel));
2c8602cfaeab63 V=C3=A1clav Kubern=C3=A1t 2021-03-16  296  		if (read < 0)
2c8602cfaeab63 V=C3=A1clav Kubern=C3=A1t 2021-03-16  297  			return read;
2c8602cfaeab63 V=C3=A1clav Kubern=C3=A1t 2021-03-16  298  =

2c8602cfaeab63 V=C3=A1clav Kubern=C3=A1t 2021-03-16  299  		*val =3D read >=
> 8;
54187ff9d766b2 Guenter Roeck   2016-07-01  300  		return 0;
54187ff9d766b2 Guenter Roeck   2016-07-01  301  	case hwmon_pwm_enable:
2c8602cfaeab63 V=C3=A1clav Kubern=C3=A1t 2021-03-16  302  		read =3D read_r=
eg_byte(regmap, MAX31790_REG_FAN_CONFIG(channel));
2c8602cfaeab63 V=C3=A1clav Kubern=C3=A1t 2021-03-16  303  		if (read < 0)
2c8602cfaeab63 V=C3=A1clav Kubern=C3=A1t 2021-03-16  304  			return read;
2c8602cfaeab63 V=C3=A1clav Kubern=C3=A1t 2021-03-16  305  =

2c8602cfaeab63 V=C3=A1clav Kubern=C3=A1t 2021-03-16  306  		if (read & MAX3=
1790_FAN_CFG_RPM_MODE)
54187ff9d766b2 Guenter Roeck   2016-07-01  307  			*val =3D 2;
2c8602cfaeab63 V=C3=A1clav Kubern=C3=A1t 2021-03-16  308  		else if (read &=
 MAX31790_FAN_CFG_TACH_INPUT_EN)
54187ff9d766b2 Guenter Roeck   2016-07-01  309  			*val =3D 1;
195a4b4298a795 Il Han          2015-08-30  310  		else
54187ff9d766b2 Guenter Roeck   2016-07-01  311  			*val =3D 0;
54187ff9d766b2 Guenter Roeck   2016-07-01  312  		return 0;
54187ff9d766b2 Guenter Roeck   2016-07-01  313  	default:
54187ff9d766b2 Guenter Roeck   2016-07-01  314  		return -EOPNOTSUPP;
54187ff9d766b2 Guenter Roeck   2016-07-01  315  	}
195a4b4298a795 Il Han          2015-08-30  316  }
195a4b4298a795 Il Han          2015-08-30  317  =

54187ff9d766b2 Guenter Roeck   2016-07-01  318  static int max31790_write_p=
wm(struct device *dev, u32 attr, int channel,
54187ff9d766b2 Guenter Roeck   2016-07-01  319  			      long val)
195a4b4298a795 Il Han          2015-08-30  320  {
195a4b4298a795 Il Han          2015-08-30  321  	struct max31790_data *data=
 =3D dev_get_drvdata(dev);
2c8602cfaeab63 V=C3=A1clav Kubern=C3=A1t 2021-03-16  322  	struct regmap *r=
egmap =3D data->regmap;
54187ff9d766b2 Guenter Roeck   2016-07-01  323  	u8 fan_config;
54187ff9d766b2 Guenter Roeck   2016-07-01  324  	int err =3D 0;
195a4b4298a795 Il Han          2015-08-30  325  =

54187ff9d766b2 Guenter Roeck   2016-07-01  326  	switch (attr) {
54187ff9d766b2 Guenter Roeck   2016-07-01  327  	case hwmon_pwm_input:
54187ff9d766b2 Guenter Roeck   2016-07-01  328  		if (val < 0 || val > 255)=
 {
54187ff9d766b2 Guenter Roeck   2016-07-01  329  			err =3D -EINVAL;
54187ff9d766b2 Guenter Roeck   2016-07-01  330  			break;
54187ff9d766b2 Guenter Roeck   2016-07-01  331  		}
2c8602cfaeab63 V=C3=A1clav Kubern=C3=A1t 2021-03-16  332  		err =3D write_r=
eg_word(regmap, MAX31790_REG_PWMOUT(channel), val << 8);
195a4b4298a795 Il Han          2015-08-30  333  		break;
54187ff9d766b2 Guenter Roeck   2016-07-01  334  	case hwmon_pwm_enable:
2c8602cfaeab63 V=C3=A1clav Kubern=C3=A1t 2021-03-16  335  		fan_config =3D =
read_reg_byte(regmap, MAX31790_REG_FAN_CONFIG(channel % NR_CHANNEL));
2c8602cfaeab63 V=C3=A1clav Kubern=C3=A1t 2021-03-16  336  =

2c8602cfaeab63 V=C3=A1clav Kubern=C3=A1t 2021-03-16 @337  		if (fan_config =
< 0)
2c8602cfaeab63 V=C3=A1clav Kubern=C3=A1t 2021-03-16  338  			return fan_con=
fig;
2c8602cfaeab63 V=C3=A1clav Kubern=C3=A1t 2021-03-16  339  =

54187ff9d766b2 Guenter Roeck   2016-07-01  340  		if (val =3D=3D 0) {
54187ff9d766b2 Guenter Roeck   2016-07-01  341  			fan_config &=3D ~(MAX317=
90_FAN_CFG_TACH_INPUT_EN |
54187ff9d766b2 Guenter Roeck   2016-07-01  342  					MAX31790_FAN_CFG_RPM_M=
ODE);
54187ff9d766b2 Guenter Roeck   2016-07-01  343  		} else if (val =3D=3D 1) {
54187ff9d766b2 Guenter Roeck   2016-07-01  344  			fan_config =3D (fan_conf=
ig |
54187ff9d766b2 Guenter Roeck   2016-07-01  345  				      MAX31790_FAN_CFG_=
TACH_INPUT_EN) &
54187ff9d766b2 Guenter Roeck   2016-07-01  346  				     ~MAX31790_FAN_CFG_=
RPM_MODE;
54187ff9d766b2 Guenter Roeck   2016-07-01  347  		} else if (val =3D=3D 2) {
54187ff9d766b2 Guenter Roeck   2016-07-01  348  			fan_config |=3D MAX31790=
_FAN_CFG_TACH_INPUT_EN |
54187ff9d766b2 Guenter Roeck   2016-07-01  349  				      MAX31790_FAN_CFG_=
RPM_MODE;
54187ff9d766b2 Guenter Roeck   2016-07-01  350  		} else {
54187ff9d766b2 Guenter Roeck   2016-07-01  351  			err =3D -EINVAL;
195a4b4298a795 Il Han          2015-08-30  352  			break;
54187ff9d766b2 Guenter Roeck   2016-07-01  353  		}
2c8602cfaeab63 V=C3=A1clav Kubern=C3=A1t 2021-03-16  354  		err =3D regmap_=
write(regmap,
54187ff9d766b2 Guenter Roeck   2016-07-01  355  				   MAX31790_REG_FAN_CON=
FIG(channel),
54187ff9d766b2 Guenter Roeck   2016-07-01  356  				   fan_config);
195a4b4298a795 Il Han          2015-08-30  357  		break;
195a4b4298a795 Il Han          2015-08-30  358  	default:
54187ff9d766b2 Guenter Roeck   2016-07-01  359  		err =3D -EOPNOTSUPP;
54187ff9d766b2 Guenter Roeck   2016-07-01  360  		break;
195a4b4298a795 Il Han          2015-08-30  361  	}
195a4b4298a795 Il Han          2015-08-30  362  =

195a4b4298a795 Il Han          2015-08-30  363  	return err;
195a4b4298a795 Il Han          2015-08-30  364  }
195a4b4298a795 Il Han          2015-08-30  365  =

54187ff9d766b2 Guenter Roeck   2016-07-01  366  static umode_t max31790_pwm=
_is_visible(const void *_data, u32 attr, int channel)
195a4b4298a795 Il Han          2015-08-30  367  {
54187ff9d766b2 Guenter Roeck   2016-07-01  368  	const struct max31790_data=
 *data =3D _data;
2c8602cfaeab63 V=C3=A1clav Kubern=C3=A1t 2021-03-16  369  	struct regmap *r=
egmap =3D data->regmap;
2c8602cfaeab63 V=C3=A1clav Kubern=C3=A1t 2021-03-16  370  	u8 fan_config =
=3D read_reg_byte(regmap, MAX31790_REG_FAN_CONFIG(channel % NR_CHANNEL));
2c8602cfaeab63 V=C3=A1clav Kubern=C3=A1t 2021-03-16  371  =

2c8602cfaeab63 V=C3=A1clav Kubern=C3=A1t 2021-03-16 @372  	if (fan_config <=
 0)
2c8602cfaeab63 V=C3=A1clav Kubern=C3=A1t 2021-03-16  373  		return 0;
54187ff9d766b2 Guenter Roeck   2016-07-01  374  =

54187ff9d766b2 Guenter Roeck   2016-07-01  375  	switch (attr) {
54187ff9d766b2 Guenter Roeck   2016-07-01  376  	case hwmon_pwm_input:
54187ff9d766b2 Guenter Roeck   2016-07-01  377  	case hwmon_pwm_enable:
54187ff9d766b2 Guenter Roeck   2016-07-01  378  		if (!(fan_config & MAX317=
90_FAN_CFG_TACH_INPUT))
dc8dbb4d7672b7 Guenter Roeck   2018-12-10  379  			return 0644;
54187ff9d766b2 Guenter Roeck   2016-07-01  380  		return 0;
54187ff9d766b2 Guenter Roeck   2016-07-01  381  	default:
54187ff9d766b2 Guenter Roeck   2016-07-01  382  		return 0;
54187ff9d766b2 Guenter Roeck   2016-07-01  383  	}
54187ff9d766b2 Guenter Roeck   2016-07-01  384  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--===============3040890393733106010==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============3040890393733106010==--

