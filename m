Content-Type: multipart/mixed; boundary="===============4916496062061437818=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/hwmon/w83627ehf.c:2417 w83627ehf_probe() warn: 'res->start' not released on lines: 2412.
Date: Thu, 17 Sep 2020 08:54:06 +0800
Message-ID: <202009170858.cMG3nwzU%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4916496062061437818==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Dr. David Alan Gilbert" <linux@treblig.org>
CC: Guenter Roeck <linux@roeck-us.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5925fa68fe8244651b3f78a88c4af99190a88f0d
commit: 266cd5835947d08b7c963b6d9d9f15d9e481bd0a hwmon: (w83627ehf) convert=
 to with_info interface
date:   8 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 8 months ago
config: i386-randconfig-m021-20200916 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/hwmon/w83627ehf.c:2417 w83627ehf_probe() warn: 'res->start' not rel=
eased on lines: 2412.

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D266cd5835947d08b7c963b6d9d9f15d9e481bd0a
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git fetch --no-tags linus master
git checkout 266cd5835947d08b7c963b6d9d9f15d9e481bd0a
vim +2417 drivers/hwmon/w83627ehf.c

266cd5835947d0 drivers/hwmon/w83627ehf.c     Dr. David Alan Gilbert 2019-11=
-24  2014  =

6c931ae1c09a96 drivers/hwmon/w83627ehf.c     Bill Pemberton         2012-11=
-19  2015  static int w83627ehf_probe(struct platform_device *pdev)
08e7e2789e0da4 drivers/i2c/chips/w83627ehf.c Jean Delvare           2005-04=
-25  2016  {
1ea6dd3840e5a2 drivers/hwmon/w83627ehf.c     David Hubbard          2007-06=
-24  2017  	struct device *dev =3D &pdev->dev;
a8b3a3a53f9a81 drivers/hwmon/w83627ehf.c     Jingoo Han             2013-07=
-30  2018  	struct w83627ehf_sio_data *sio_data =3D dev_get_platdata(dev);
08e7e2789e0da4 drivers/i2c/chips/w83627ehf.c Jean Delvare           2005-04=
-25  2019  	struct w83627ehf_data *data;
1ea6dd3840e5a2 drivers/hwmon/w83627ehf.c     David Hubbard          2007-06=
-24  2020  	struct resource *res;
03f5de2bb7125e drivers/hwmon/w83627ehf.c     Jean Delvare           2011-10=
-13  2021  	u8 en_vrm10;
08e7e2789e0da4 drivers/i2c/chips/w83627ehf.c Jean Delvare           2005-04=
-25  2022  	int i, err =3D 0;
266cd5835947d0 drivers/hwmon/w83627ehf.c     Dr. David Alan Gilbert 2019-11=
-24  2023  	struct device *hwmon_dev;
08e7e2789e0da4 drivers/i2c/chips/w83627ehf.c Jean Delvare           2005-04=
-25  2024  =

1ea6dd3840e5a2 drivers/hwmon/w83627ehf.c     David Hubbard          2007-06=
-24  2025  	res =3D platform_get_resource(pdev, IORESOURCE_IO, 0);
1ea6dd3840e5a2 drivers/hwmon/w83627ehf.c     David Hubbard          2007-06=
-24  2026  	if (!request_region(res->start, IOREGION_LENGTH, DRVNAME)) {
08e7e2789e0da4 drivers/i2c/chips/w83627ehf.c Jean Delvare           2005-04=
-25  2027  		err =3D -EBUSY;
1ea6dd3840e5a2 drivers/hwmon/w83627ehf.c     David Hubbard          2007-06=
-24  2028  		dev_err(dev, "Failed to request region 0x%lx-0x%lx\n",
1ea6dd3840e5a2 drivers/hwmon/w83627ehf.c     David Hubbard          2007-06=
-24  2029  			(unsigned long)res->start,
1ea6dd3840e5a2 drivers/hwmon/w83627ehf.c     David Hubbard          2007-06=
-24  2030  			(unsigned long)res->start + IOREGION_LENGTH - 1);
08e7e2789e0da4 drivers/i2c/chips/w83627ehf.c Jean Delvare           2005-04=
-25  2031  		goto exit;
08e7e2789e0da4 drivers/i2c/chips/w83627ehf.c Jean Delvare           2005-04=
-25  2032  	}
08e7e2789e0da4 drivers/i2c/chips/w83627ehf.c Jean Delvare           2005-04=
-25  2033  =

32260d94408c55 drivers/hwmon/w83627ehf.c     Guenter Roeck          2012-03=
-12  2034  	data =3D devm_kzalloc(&pdev->dev, sizeof(struct w83627ehf_data),
32260d94408c55 drivers/hwmon/w83627ehf.c     Guenter Roeck          2012-03=
-12  2035  			    GFP_KERNEL);
e7e1ca6ef4f331 drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-04  2036  	if (!data) {
08e7e2789e0da4 drivers/i2c/chips/w83627ehf.c Jean Delvare           2005-04=
-25  2037  		err =3D -ENOMEM;
08e7e2789e0da4 drivers/i2c/chips/w83627ehf.c Jean Delvare           2005-04=
-25  2038  		goto exit_release;
08e7e2789e0da4 drivers/i2c/chips/w83627ehf.c Jean Delvare           2005-04=
-25  2039  	}
08e7e2789e0da4 drivers/i2c/chips/w83627ehf.c Jean Delvare           2005-04=
-25  2040  =

1ea6dd3840e5a2 drivers/hwmon/w83627ehf.c     David Hubbard          2007-06=
-24  2041  	data->addr =3D res->start;
9a61bf6300533d drivers/hwmon/w83627ehf.c     Ingo Molnar            2006-01=
-18  2042  	mutex_init(&data->lock);
9a61bf6300533d drivers/hwmon/w83627ehf.c     Ingo Molnar            2006-01=
-18  2043  	mutex_init(&data->update_lock);
1ea6dd3840e5a2 drivers/hwmon/w83627ehf.c     David Hubbard          2007-06=
-24  2044  	data->name =3D w83627ehf_device_names[sio_data->kind];
266cd5835947d0 drivers/hwmon/w83627ehf.c     Dr. David Alan Gilbert 2019-11=
-24  2045  	data->kind =3D sio_data->kind;
3300fb4f886880 drivers/hwmon/w83627ehf.c     Jean Delvare           2012-11=
-05  2046  	data->bank =3D 0xff;		/* Force initial bank selection */
1ea6dd3840e5a2 drivers/hwmon/w83627ehf.c     David Hubbard          2007-06=
-24  2047  	platform_set_drvdata(pdev, data);
08e7e2789e0da4 drivers/i2c/chips/w83627ehf.c Jean Delvare           2005-04=
-25  2048  =

237c8d2f54ff12 drivers/hwmon/w83627ehf.c     Gong Jun               2009-03=
-30  2049  	/* 627EHG and 627EHF have 10 voltage inputs; 627DHG and 667HG h=
ave 9 */
237c8d2f54ff12 drivers/hwmon/w83627ehf.c     Gong Jun               2009-03=
-30  2050  	data->in_num =3D (sio_data->kind =3D=3D w83627ehf) ? 10 : 9;
eff7687d473c31 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2051  	/* 667HG, NCT6775F, and NCT6776F have 3 pwms, and 627UHG has on=
ly 2 */
eff7687d473c31 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2052  	switch (sio_data->kind) {
eff7687d473c31 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2053  	default:
eff7687d473c31 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2054  		data->pwm_num =3D 4;
eff7687d473c31 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2055  		break;
eff7687d473c31 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2056  	case w83667hg:
eff7687d473c31 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2057  	case w83667hg_b:
eff7687d473c31 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2058  	case nct6775:
eff7687d473c31 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2059  	case nct6776:
eff7687d473c31 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2060  		data->pwm_num =3D 3;
eff7687d473c31 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2061  		break;
eff7687d473c31 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2062  	case w83627uhg:
eff7687d473c31 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2063  		data->pwm_num =3D 2;
eff7687d473c31 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2064  		break;
eff7687d473c31 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2065  	}
08e7e2789e0da4 drivers/i2c/chips/w83627ehf.c Jean Delvare           2005-04=
-25  2066  =

6ba71de5f81bbf drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2067  	/* Default to 3 temperature inputs, code below will adjust as n=
eeded */
d36cf32c9a6c4f drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-07  2068  	data->have_temp =3D 0x07;
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2069  =

ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2070  	/* Deal with temperature register setup first. */
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2071  	if (sio_data->kind =3D=3D nct6775 || sio_data->kind =3D=3D nct6=
776) {
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2072  		int mask =3D 0;
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2073  =

ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2074  		/*
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2075  		 * Display temperature sensor output only if it monitors
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2076  		 * a source other than one already reported. Always display
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2077  		 * first three temperature registers, though.
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2078  		 */
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2079  		for (i =3D 0; i < NUM_REG_TEMP; i++) {
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2080  			u8 src;
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2081  =

ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2082  			data->reg_temp[i] =3D NCT6775_REG_TEMP[i];
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2083  			data->reg_temp_over[i] =3D NCT6775_REG_TEMP_OVER[i];
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2084  			data->reg_temp_hyst[i] =3D NCT6775_REG_TEMP_HYST[i];
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2085  			data->reg_temp_config[i] =3D NCT6775_REG_TEMP_CONFIG[i];
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2086  =

ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2087  			src =3D w83627ehf_read_value(data,
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2088  						   NCT6775_REG_TEMP_SOURCE[i]);
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2089  			src &=3D 0x1f;
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2090  			if (src && !(mask & (1 << src))) {
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2091  				data->have_temp |=3D 1 << i;
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2092  				mask |=3D 1 << src;
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2093  			}
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2094  =

ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2095  			data->temp_src[i] =3D src;
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2096  =

ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2097  			/*
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2098  			 * Now do some register swapping if index 0..2 don't
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2099  			 * point to SYSTIN(1), CPUIN(2), and AUXIN(3).
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2100  			 * Idea is to have the first three attributes
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2101  			 * report SYSTIN, CPUIN, and AUXIN if possible
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2102  			 * without overriding the basic system configuration.
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2103  			 */
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2104  			if (i > 0 && data->temp_src[0] !=3D 1
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2105  			    && data->temp_src[i] =3D=3D 1)
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2106  				w82627ehf_swap_tempreg(data, 0, i);
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2107  			if (i > 1 && data->temp_src[1] !=3D 2
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2108  			    && data->temp_src[i] =3D=3D 2)
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2109  				w82627ehf_swap_tempreg(data, 1, i);
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2110  			if (i > 2 && data->temp_src[2] !=3D 3
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2111  			    && data->temp_src[i] =3D=3D 3)
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2112  				w82627ehf_swap_tempreg(data, 2, i);
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2113  		}
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2114  		if (sio_data->kind =3D=3D nct6776) {
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2115  			/*
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2116  			 * On NCT6776, AUXTIN and VIN3 pins are shared.
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2117  			 * Only way to detect it is to check if AUXTIN is used
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2118  			 * as a temperature source, and if that source is
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2119  			 * enabled.
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2120  			 *
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2121  			 * If that is the case, disable in6, which reports VIN3.
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2122  			 * Otherwise disable temp3.
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2123  			 */
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2124  			if (data->temp_src[2] =3D=3D 3) {
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2125  				u8 reg;
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2126  =

ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2127  				if (data->reg_temp_config[2])
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2128  					reg =3D w83627ehf_read_value(data,
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2129  						data->reg_temp_config[2]);
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2130  				else
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2131  					reg =3D 0; /* Assume AUXTIN is used */
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2132  =

ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2133  				if (reg & 0x01)
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2134  					data->have_temp &=3D ~(1 << 2);
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2135  				else
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2136  					data->in6_skip =3D 1;
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2137  			}
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2138  			data->temp_label =3D nct6776_temp_label;
02309ad2b8cbcf drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-03=
-10  2139  		} else {
02309ad2b8cbcf drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-03=
-10  2140  			data->temp_label =3D nct6775_temp_label;
02309ad2b8cbcf drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-03=
-10  2141  		}
840e191dba36f5 drivers/hwmon/w83627ehf.c     Guenter Roeck          2012-02=
-08  2142  		data->have_temp_offset =3D data->have_temp & 0x07;
840e191dba36f5 drivers/hwmon/w83627ehf.c     Guenter Roeck          2012-02=
-08  2143  		for (i =3D 0; i < 3; i++) {
840e191dba36f5 drivers/hwmon/w83627ehf.c     Guenter Roeck          2012-02=
-08  2144  			if (data->temp_src[i] > 3)
840e191dba36f5 drivers/hwmon/w83627ehf.c     Guenter Roeck          2012-02=
-08  2145  				data->have_temp_offset &=3D ~(1 << i);
840e191dba36f5 drivers/hwmon/w83627ehf.c     Guenter Roeck          2012-02=
-08  2146  		}
d36cf32c9a6c4f drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-07  2147  	} else if (sio_data->kind =3D=3D w83667hg_b) {
d36cf32c9a6c4f drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-07  2148  		u8 reg;
d36cf32c9a6c4f drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-07  2149  =

6ba71de5f81bbf drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2150  		w83627ehf_set_temp_reg_ehf(data, 4);
6ba71de5f81bbf drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2151  =

ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2152  		/*
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2153  		 * Temperature sources are selected with bank 0, registers 0x49
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2154  		 * and 0x4a.
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2155  		 */
d36cf32c9a6c4f drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-07  2156  		reg =3D w83627ehf_read_value(data, 0x4a);
d36cf32c9a6c4f drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-07  2157  		data->temp_src[0] =3D reg >> 5;
d36cf32c9a6c4f drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-07  2158  		reg =3D w83627ehf_read_value(data, 0x49);
d36cf32c9a6c4f drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-07  2159  		data->temp_src[1] =3D reg & 0x07;
d36cf32c9a6c4f drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-07  2160  		data->temp_src[2] =3D (reg >> 4) & 0x07;
d36cf32c9a6c4f drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-07  2161  =

d36cf32c9a6c4f drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-07  2162  		/*
d36cf32c9a6c4f drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-07  2163  		 * W83667HG-B has another temperature register at 0x7e.
d36cf32c9a6c4f drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-07  2164  		 * The temperature source is selected with register 0x7d.
d36cf32c9a6c4f drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-07  2165  		 * Support it if the source differs from already reported
d36cf32c9a6c4f drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-07  2166  		 * sources.
d36cf32c9a6c4f drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-07  2167  		 */
d36cf32c9a6c4f drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-07  2168  		reg =3D w83627ehf_read_value(data, 0x7d);
d36cf32c9a6c4f drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-07  2169  		reg &=3D 0x07;
d36cf32c9a6c4f drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-07  2170  		if (reg !=3D data->temp_src[0] && reg !=3D data->temp_src[1]
d36cf32c9a6c4f drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-07  2171  		    && reg !=3D data->temp_src[2]) {
d36cf32c9a6c4f drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-07  2172  			data->temp_src[3] =3D reg;
d36cf32c9a6c4f drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-07  2173  			data->have_temp |=3D 1 << 3;
d36cf32c9a6c4f drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-07  2174  		}
d36cf32c9a6c4f drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-07  2175  =

d36cf32c9a6c4f drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-07  2176  		/*
d36cf32c9a6c4f drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-07  2177  		 * Chip supports either AUXTIN or VIN3. Try to find out which
d36cf32c9a6c4f drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-07  2178  		 * one.
d36cf32c9a6c4f drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-07  2179  		 */
d36cf32c9a6c4f drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-07  2180  		reg =3D w83627ehf_read_value(data, W83627EHF_REG_TEMP_CONFIG[2=
]);
d36cf32c9a6c4f drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-07  2181  		if (data->temp_src[2] =3D=3D 2 && (reg & 0x01))
d36cf32c9a6c4f drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-07  2182  			data->have_temp &=3D ~(1 << 2);
d36cf32c9a6c4f drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-07  2183  =

d36cf32c9a6c4f drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-07  2184  		if ((data->temp_src[2] =3D=3D 2 && (data->have_temp & (1 << 2)=
))
d36cf32c9a6c4f drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-07  2185  		    || (data->temp_src[3] =3D=3D 2 && (data->have_temp & (1 <<=
 3))))
d36cf32c9a6c4f drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-07  2186  			data->in6_skip =3D 1;
d36cf32c9a6c4f drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-07  2187  =

eff7687d473c31 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2188  		data->temp_label =3D w83667hg_b_temp_label;
840e191dba36f5 drivers/hwmon/w83627ehf.c     Guenter Roeck          2012-02=
-08  2189  		data->have_temp_offset =3D data->have_temp & 0x07;
840e191dba36f5 drivers/hwmon/w83627ehf.c     Guenter Roeck          2012-02=
-08  2190  		for (i =3D 0; i < 3; i++) {
840e191dba36f5 drivers/hwmon/w83627ehf.c     Guenter Roeck          2012-02=
-08  2191  			if (data->temp_src[i] > 2)
840e191dba36f5 drivers/hwmon/w83627ehf.c     Guenter Roeck          2012-02=
-08  2192  				data->have_temp_offset &=3D ~(1 << i);
840e191dba36f5 drivers/hwmon/w83627ehf.c     Guenter Roeck          2012-02=
-08  2193  		}
eff7687d473c31 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2194  	} else if (sio_data->kind =3D=3D w83627uhg) {
eff7687d473c31 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2195  		u8 reg;
eff7687d473c31 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2196  =

eff7687d473c31 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2197  		w83627ehf_set_temp_reg_ehf(data, 3);
eff7687d473c31 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2198  =

eff7687d473c31 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2199  		/*
aacb6b0052692c drivers/hwmon/w83627ehf.c     Jean Delvare           2012-03=
-13  2200  		 * Temperature sources for temp2 and temp3 are selected with
eff7687d473c31 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2201  		 * bank 0, registers 0x49 and 0x4a.
eff7687d473c31 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2202  		 */
eff7687d473c31 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2203  		data->temp_src[0] =3D 0;	/* SYSTIN */
eff7687d473c31 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2204  		reg =3D w83627ehf_read_value(data, 0x49) & 0x07;
eff7687d473c31 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2205  		/* Adjust to have the same mapping as other source registers */
eff7687d473c31 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2206  		if (reg =3D=3D 0)
aacb6b0052692c drivers/hwmon/w83627ehf.c     Jean Delvare           2012-03=
-13  2207  			data->temp_src[1] =3D 1;
eff7687d473c31 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2208  		else if (reg >=3D 2 && reg <=3D 5)
aacb6b0052692c drivers/hwmon/w83627ehf.c     Jean Delvare           2012-03=
-13  2209  			data->temp_src[1] =3D reg + 2;
eff7687d473c31 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2210  		else	/* should never happen */
eff7687d473c31 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2211  			data->have_temp &=3D ~(1 << 1);
eff7687d473c31 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2212  		reg =3D w83627ehf_read_value(data, 0x4a);
eff7687d473c31 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2213  		data->temp_src[2] =3D reg >> 5;
eff7687d473c31 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2214  =

eff7687d473c31 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2215  		/*
eff7687d473c31 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2216  		 * Skip temp3 if source is invalid or the same as temp1
eff7687d473c31 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2217  		 * or temp2.
eff7687d473c31 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2218  		 */
eff7687d473c31 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2219  		if (data->temp_src[2] =3D=3D 2 || data->temp_src[2] =3D=3D 3 ||
eff7687d473c31 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2220  		    data->temp_src[2] =3D=3D data->temp_src[0] ||
eff7687d473c31 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2221  		    ((data->have_temp & (1 << 1)) &&
eff7687d473c31 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2222  		     data->temp_src[2] =3D=3D data->temp_src[1]))
eff7687d473c31 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2223  			data->have_temp &=3D ~(1 << 2);
eff7687d473c31 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2224  		else
eff7687d473c31 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2225  			data->temp3_val_only =3D 1;	/* No limit regs */
eff7687d473c31 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2226  =

eff7687d473c31 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2227  		data->in6_skip =3D 1;			/* No VIN3 */
eff7687d473c31 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2228  =

d36cf32c9a6c4f drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-07  2229  		data->temp_label =3D w83667hg_b_temp_label;
840e191dba36f5 drivers/hwmon/w83627ehf.c     Guenter Roeck          2012-02=
-08  2230  		data->have_temp_offset =3D data->have_temp & 0x03;
840e191dba36f5 drivers/hwmon/w83627ehf.c     Guenter Roeck          2012-02=
-08  2231  		for (i =3D 0; i < 3; i++) {
840e191dba36f5 drivers/hwmon/w83627ehf.c     Guenter Roeck          2012-02=
-08  2232  			if (data->temp_src[i] > 1)
840e191dba36f5 drivers/hwmon/w83627ehf.c     Guenter Roeck          2012-02=
-08  2233  				data->have_temp_offset &=3D ~(1 << i);
840e191dba36f5 drivers/hwmon/w83627ehf.c     Guenter Roeck          2012-02=
-08  2234  		}
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2235  	} else {
6ba71de5f81bbf drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2236  		w83627ehf_set_temp_reg_ehf(data, 3);
6ba71de5f81bbf drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2237  =

ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2238  		/* Temperature sources are fixed */
6ba71de5f81bbf drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2239  =

6ba71de5f81bbf drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2240  		if (sio_data->kind =3D=3D w83667hg) {
6ba71de5f81bbf drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2241  			u8 reg;
6ba71de5f81bbf drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2242  =

6ba71de5f81bbf drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2243  			/*
6ba71de5f81bbf drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2244  			 * Chip supports either AUXTIN or VIN3. Try to find
6ba71de5f81bbf drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2245  			 * out which one.
6ba71de5f81bbf drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2246  			 */
6ba71de5f81bbf drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2247  			reg =3D w83627ehf_read_value(data,
6ba71de5f81bbf drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2248  						W83627EHF_REG_TEMP_CONFIG[2]);
6ba71de5f81bbf drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2249  			if (reg & 0x01)
6ba71de5f81bbf drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2250  				data->have_temp &=3D ~(1 << 2);
6ba71de5f81bbf drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2251  			else
6ba71de5f81bbf drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2252  				data->in6_skip =3D 1;
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2253  		}
840e191dba36f5 drivers/hwmon/w83627ehf.c     Guenter Roeck          2012-02=
-08  2254  		data->have_temp_offset =3D data->have_temp & 0x07;
a157d06d4d7031 drivers/hwmon/w83627ehf.c     Gong Jun               2009-03=
-30  2255  	}
a157d06d4d7031 drivers/hwmon/w83627ehf.c     Gong Jun               2009-03=
-30  2256  =

ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2257  	if (sio_data->kind =3D=3D nct6775) {
26bc440e3f14df drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-11  2258  		data->has_fan_div =3D true;
26bc440e3f14df drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-11  2259  		data->fan_from_reg =3D fan_from_reg16;
26bc440e3f14df drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-11  2260  		data->fan_from_reg_min =3D fan_from_reg8;
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2261  		data->REG_PWM =3D NCT6775_REG_PWM;
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2262  		data->REG_TARGET =3D NCT6775_REG_TARGET;
26bc440e3f14df drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-11  2263  		data->REG_FAN =3D NCT6775_REG_FAN;
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2264  		data->REG_FAN_MIN =3D W83627EHF_REG_FAN_MIN;
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2265  		data->REG_FAN_START_OUTPUT =3D NCT6775_REG_FAN_START_OUTPUT;
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2266  		data->REG_FAN_STOP_OUTPUT =3D NCT6775_REG_FAN_STOP_OUTPUT;
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2267  		data->REG_FAN_STOP_TIME =3D NCT6775_REG_FAN_STOP_TIME;
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2268  		data->REG_FAN_MAX_OUTPUT =3D NCT6775_REG_FAN_MAX_OUTPUT;
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2269  		data->REG_FAN_STEP_OUTPUT =3D NCT6775_REG_FAN_STEP_OUTPUT;
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2270  	} else if (sio_data->kind =3D=3D nct6776) {
26bc440e3f14df drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-11  2271  		data->has_fan_div =3D false;
26bc440e3f14df drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-11  2272  		data->fan_from_reg =3D fan_from_reg13;
26bc440e3f14df drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-11  2273  		data->fan_from_reg_min =3D fan_from_reg13;
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2274  		data->REG_PWM =3D NCT6775_REG_PWM;
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2275  		data->REG_TARGET =3D NCT6775_REG_TARGET;
26bc440e3f14df drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-11  2276  		data->REG_FAN =3D NCT6775_REG_FAN;
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2277  		data->REG_FAN_MIN =3D NCT6776_REG_FAN_MIN;
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2278  		data->REG_FAN_START_OUTPUT =3D NCT6775_REG_FAN_START_OUTPUT;
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2279  		data->REG_FAN_STOP_OUTPUT =3D NCT6775_REG_FAN_STOP_OUTPUT;
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2280  		data->REG_FAN_STOP_TIME =3D NCT6775_REG_FAN_STOP_TIME;
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2281  	} else if (sio_data->kind =3D=3D w83667hg_b) {
26bc440e3f14df drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-11  2282  		data->has_fan_div =3D true;
26bc440e3f14df drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-11  2283  		data->fan_from_reg =3D fan_from_reg8;
26bc440e3f14df drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-11  2284  		data->fan_from_reg_min =3D fan_from_reg8;
279af1a91a0410 drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-13  2285  		data->REG_PWM =3D W83627EHF_REG_PWM;
279af1a91a0410 drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-13  2286  		data->REG_TARGET =3D W83627EHF_REG_TARGET;
279af1a91a0410 drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-13  2287  		data->REG_FAN =3D W83627EHF_REG_FAN;
279af1a91a0410 drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-13  2288  		data->REG_FAN_MIN =3D W83627EHF_REG_FAN_MIN;
da2e025590cf70 drivers/hwmon/w83627ehf.c     Guenter Roeck          2010-08=
-14  2289  		data->REG_FAN_START_OUTPUT =3D W83627EHF_REG_FAN_START_OUTPUT;
da2e025590cf70 drivers/hwmon/w83627ehf.c     Guenter Roeck          2010-08=
-14  2290  		data->REG_FAN_STOP_OUTPUT =3D W83627EHF_REG_FAN_STOP_OUTPUT;
279af1a91a0410 drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-13  2291  		data->REG_FAN_STOP_TIME =3D W83627EHF_REG_FAN_STOP_TIME;
c39aedafb24260 drivers/hwmon/w83627ehf.c     Guenter Roeck          2010-08=
-14  2292  		data->REG_FAN_MAX_OUTPUT =3D
c39aedafb24260 drivers/hwmon/w83627ehf.c     Guenter Roeck          2010-08=
-14  2293  		  W83627EHF_REG_FAN_MAX_OUTPUT_W83667_B;
c39aedafb24260 drivers/hwmon/w83627ehf.c     Guenter Roeck          2010-08=
-14  2294  		data->REG_FAN_STEP_OUTPUT =3D
c39aedafb24260 drivers/hwmon/w83627ehf.c     Guenter Roeck          2010-08=
-14  2295  		  W83627EHF_REG_FAN_STEP_OUTPUT_W83667_B;
c39aedafb24260 drivers/hwmon/w83627ehf.c     Guenter Roeck          2010-08=
-14  2296  	} else {
26bc440e3f14df drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-11  2297  		data->has_fan_div =3D true;
26bc440e3f14df drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-11  2298  		data->fan_from_reg =3D fan_from_reg8;
26bc440e3f14df drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-11  2299  		data->fan_from_reg_min =3D fan_from_reg8;
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2300  		data->REG_PWM =3D W83627EHF_REG_PWM;
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2301  		data->REG_TARGET =3D W83627EHF_REG_TARGET;
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2302  		data->REG_FAN =3D W83627EHF_REG_FAN;
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2303  		data->REG_FAN_MIN =3D W83627EHF_REG_FAN_MIN;
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2304  		data->REG_FAN_START_OUTPUT =3D W83627EHF_REG_FAN_START_OUTPUT;
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2305  		data->REG_FAN_STOP_OUTPUT =3D W83627EHF_REG_FAN_STOP_OUTPUT;
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2306  		data->REG_FAN_STOP_TIME =3D W83627EHF_REG_FAN_STOP_TIME;
c39aedafb24260 drivers/hwmon/w83627ehf.c     Guenter Roeck          2010-08=
-14  2307  		data->REG_FAN_MAX_OUTPUT =3D
c39aedafb24260 drivers/hwmon/w83627ehf.c     Guenter Roeck          2010-08=
-14  2308  		  W83627EHF_REG_FAN_MAX_OUTPUT_COMMON;
c39aedafb24260 drivers/hwmon/w83627ehf.c     Guenter Roeck          2010-08=
-14  2309  		data->REG_FAN_STEP_OUTPUT =3D
c39aedafb24260 drivers/hwmon/w83627ehf.c     Guenter Roeck          2010-08=
-14  2310  		  W83627EHF_REG_FAN_STEP_OUTPUT_COMMON;
c39aedafb24260 drivers/hwmon/w83627ehf.c     Guenter Roeck          2010-08=
-14  2311  	}
da2e025590cf70 drivers/hwmon/w83627ehf.c     Guenter Roeck          2010-08=
-14  2312  =

eff7687d473c31 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2313  	/* Setup input voltage scaling factors */
eff7687d473c31 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2314  	if (sio_data->kind =3D=3D w83627uhg)
eff7687d473c31 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2315  		data->scale_in =3D scale_in_w83627uhg;
eff7687d473c31 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2316  	else
eff7687d473c31 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2317  		data->scale_in =3D scale_in_common;
eff7687d473c31 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2318  =

08e7e2789e0da4 drivers/i2c/chips/w83627ehf.c Jean Delvare           2005-04=
-25  2319  	/* Initialize the chip */
bf164c58e58328 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-10=
-13  2320  	w83627ehf_init_device(data, sio_data->kind);
08e7e2789e0da4 drivers/i2c/chips/w83627ehf.c Jean Delvare           2005-04=
-25  2321  =

fc18d6c0479d5b drivers/hwmon/w83627ehf.c     Jean Delvare           2007-06=
-24  2322  	data->vrm =3D vid_which_vrm();
0d0235301b3a53 drivers/hwmon/w83627ehf.c     Katsumi Sato           2017-02=
-22  2323  =

0d0235301b3a53 drivers/hwmon/w83627ehf.c     Katsumi Sato           2017-02=
-22  2324  	err =3D superio_enter(sio_data->sioreg);
0d0235301b3a53 drivers/hwmon/w83627ehf.c     Katsumi Sato           2017-02=
-22  2325  	if (err)
0d0235301b3a53 drivers/hwmon/w83627ehf.c     Katsumi Sato           2017-02=
-22  2326  		goto exit_release;
0d0235301b3a53 drivers/hwmon/w83627ehf.c     Katsumi Sato           2017-02=
-22  2327  =

58e6e78119da2b drivers/hwmon/w83627ehf.c     Jean Delvare           2008-01=
-03  2328  	/* Read VID value */
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2329  	if (sio_data->kind =3D=3D w83667hg || sio_data->kind =3D=3D w83=
667hg_b ||
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2330  	    sio_data->kind =3D=3D nct6775 || sio_data->kind =3D=3D nct6=
776) {
8969e84d954af3 drivers/hwmon/w83627ehf.c     Guenter Roeck          2012-01=
-19  2331  		/*
8969e84d954af3 drivers/hwmon/w83627ehf.c     Guenter Roeck          2012-01=
-19  2332  		 * W83667HG has different pins for VID input and output, so
8969e84d954af3 drivers/hwmon/w83627ehf.c     Guenter Roeck          2012-01=
-19  2333  		 * we can get the VID input values directly at logical device D
8969e84d954af3 drivers/hwmon/w83627ehf.c     Guenter Roeck          2012-01=
-19  2334  		 * 0xe3.
8969e84d954af3 drivers/hwmon/w83627ehf.c     Guenter Roeck          2012-01=
-19  2335  		 */
237c8d2f54ff12 drivers/hwmon/w83627ehf.c     Gong Jun               2009-03=
-30  2336  		superio_select(sio_data->sioreg, W83667HG_LD_VID);
237c8d2f54ff12 drivers/hwmon/w83627ehf.c     Gong Jun               2009-03=
-30  2337  		data->vid =3D superio_inb(sio_data->sioreg, 0xe3);
266cd5835947d0 drivers/hwmon/w83627ehf.c     Dr. David Alan Gilbert 2019-11=
-24  2338  		data->have_vid =3D true;
eff7687d473c31 drivers/hwmon/w83627ehf.c     Jean Delvare           2011-11=
-04  2339  	} else if (sio_data->kind !=3D w83627uhg) {
58e6e78119da2b drivers/hwmon/w83627ehf.c     Jean Delvare           2008-01=
-03  2340  		superio_select(sio_data->sioreg, W83627EHF_LD_HWM);
58e6e78119da2b drivers/hwmon/w83627ehf.c     Jean Delvare           2008-01=
-03  2341  		if (superio_inb(sio_data->sioreg, SIO_REG_VID_CTRL) & 0x80) {
8969e84d954af3 drivers/hwmon/w83627ehf.c     Guenter Roeck          2012-01=
-19  2342  			/*
8969e84d954af3 drivers/hwmon/w83627ehf.c     Guenter Roeck          2012-01=
-19  2343  			 * Set VID input sensibility if needed. In theory the
8969e84d954af3 drivers/hwmon/w83627ehf.c     Guenter Roeck          2012-01=
-19  2344  			 * BIOS should have set it, but in practice it's not
8969e84d954af3 drivers/hwmon/w83627ehf.c     Guenter Roeck          2012-01=
-19  2345  			 * always the case. We only do it for the W83627EHF/EHG
8969e84d954af3 drivers/hwmon/w83627ehf.c     Guenter Roeck          2012-01=
-19  2346  			 * because the W83627DHG is more complex in this
8969e84d954af3 drivers/hwmon/w83627ehf.c     Guenter Roeck          2012-01=
-19  2347  			 * respect.
8969e84d954af3 drivers/hwmon/w83627ehf.c     Guenter Roeck          2012-01=
-19  2348  			 */
58e6e78119da2b drivers/hwmon/w83627ehf.c     Jean Delvare           2008-01=
-03  2349  			if (sio_data->kind =3D=3D w83627ehf) {
58e6e78119da2b drivers/hwmon/w83627ehf.c     Jean Delvare           2008-01=
-03  2350  				en_vrm10 =3D superio_inb(sio_data->sioreg,
58e6e78119da2b drivers/hwmon/w83627ehf.c     Jean Delvare           2008-01=
-03  2351  						       SIO_REG_EN_VRM10);
58e6e78119da2b drivers/hwmon/w83627ehf.c     Jean Delvare           2008-01=
-03  2352  				if ((en_vrm10 & 0x08) && data->vrm =3D=3D 90) {
b55f375725ff85 drivers/hwmon/w83627ehf.c     Guenter Roeck          2013-01=
-10  2353  					dev_warn(dev,
b55f375725ff85 drivers/hwmon/w83627ehf.c     Guenter Roeck          2013-01=
-10  2354  						 "Setting VID input voltage to TTL\n");
237c8d2f54ff12 drivers/hwmon/w83627ehf.c     Gong Jun               2009-03=
-30  2355  					superio_outb(sio_data->sioreg,
237c8d2f54ff12 drivers/hwmon/w83627ehf.c     Gong Jun               2009-03=
-30  2356  						     SIO_REG_EN_VRM10,
fc18d6c0479d5b drivers/hwmon/w83627ehf.c     Jean Delvare           2007-06=
-24  2357  						     en_vrm10 & ~0x08);
237c8d2f54ff12 drivers/hwmon/w83627ehf.c     Gong Jun               2009-03=
-30  2358  				} else if (!(en_vrm10 & 0x08)
237c8d2f54ff12 drivers/hwmon/w83627ehf.c     Gong Jun               2009-03=
-30  2359  					   && data->vrm =3D=3D 100) {
b55f375725ff85 drivers/hwmon/w83627ehf.c     Guenter Roeck          2013-01=
-10  2360  					dev_warn(dev,
b55f375725ff85 drivers/hwmon/w83627ehf.c     Guenter Roeck          2013-01=
-10  2361  						 "Setting VID input voltage to VRM10\n");
237c8d2f54ff12 drivers/hwmon/w83627ehf.c     Gong Jun               2009-03=
-30  2362  					superio_outb(sio_data->sioreg,
237c8d2f54ff12 drivers/hwmon/w83627ehf.c     Gong Jun               2009-03=
-30  2363  						     SIO_REG_EN_VRM10,
fc18d6c0479d5b drivers/hwmon/w83627ehf.c     Jean Delvare           2007-06=
-24  2364  						     en_vrm10 | 0x08);
fc18d6c0479d5b drivers/hwmon/w83627ehf.c     Jean Delvare           2007-06=
-24  2365  				}
58e6e78119da2b drivers/hwmon/w83627ehf.c     Jean Delvare           2008-01=
-03  2366  			}
58e6e78119da2b drivers/hwmon/w83627ehf.c     Jean Delvare           2008-01=
-03  2367  =

237c8d2f54ff12 drivers/hwmon/w83627ehf.c     Gong Jun               2009-03=
-30  2368  			data->vid =3D superio_inb(sio_data->sioreg,
237c8d2f54ff12 drivers/hwmon/w83627ehf.c     Gong Jun               2009-03=
-30  2369  						SIO_REG_VID_DATA);
cbe311f2a40b84 drivers/hwmon/w83627ehf.c     Jean Delvare           2008-01=
-03  2370  			if (sio_data->kind =3D=3D w83627ehf) /* 6 VID pins only */
cbe311f2a40b84 drivers/hwmon/w83627ehf.c     Jean Delvare           2008-01=
-03  2371  				data->vid &=3D 0x3f;
266cd5835947d0 drivers/hwmon/w83627ehf.c     Dr. David Alan Gilbert 2019-11=
-24  2372  			data->have_vid =3D true;
58e6e78119da2b drivers/hwmon/w83627ehf.c     Jean Delvare           2008-01=
-03  2373  		} else {
b55f375725ff85 drivers/hwmon/w83627ehf.c     Guenter Roeck          2013-01=
-10  2374  			dev_info(dev,
b55f375725ff85 drivers/hwmon/w83627ehf.c     Guenter Roeck          2013-01=
-10  2375  				 "VID pins in output mode, CPU VID not available\n");
fc18d6c0479d5b drivers/hwmon/w83627ehf.c     Jean Delvare           2007-06=
-24  2376  		}
237c8d2f54ff12 drivers/hwmon/w83627ehf.c     Gong Jun               2009-03=
-30  2377  	}
fc18d6c0479d5b drivers/hwmon/w83627ehf.c     Jean Delvare           2007-06=
-24  2378  =

d42e869acf0da4 drivers/hwmon/w83627ehf.c     Ian Dobson             2011-03=
-07  2379  	if (fan_debounce &&
d42e869acf0da4 drivers/hwmon/w83627ehf.c     Ian Dobson             2011-03=
-07  2380  	    (sio_data->kind =3D=3D nct6775 || sio_data->kind =3D=3D nct=
6776)) {
d42e869acf0da4 drivers/hwmon/w83627ehf.c     Ian Dobson             2011-03=
-07  2381  		u8 tmp;
d42e869acf0da4 drivers/hwmon/w83627ehf.c     Ian Dobson             2011-03=
-07  2382  =

d42e869acf0da4 drivers/hwmon/w83627ehf.c     Ian Dobson             2011-03=
-07  2383  		superio_select(sio_data->sioreg, W83627EHF_LD_HWM);
d42e869acf0da4 drivers/hwmon/w83627ehf.c     Ian Dobson             2011-03=
-07  2384  		tmp =3D superio_inb(sio_data->sioreg, NCT6775_REG_FAN_DEBOUNCE=
);
d42e869acf0da4 drivers/hwmon/w83627ehf.c     Ian Dobson             2011-03=
-07  2385  		if (sio_data->kind =3D=3D nct6776)
d42e869acf0da4 drivers/hwmon/w83627ehf.c     Ian Dobson             2011-03=
-07  2386  			superio_outb(sio_data->sioreg, NCT6775_REG_FAN_DEBOUNCE,
d42e869acf0da4 drivers/hwmon/w83627ehf.c     Ian Dobson             2011-03=
-07  2387  				     0x3e | tmp);
d42e869acf0da4 drivers/hwmon/w83627ehf.c     Ian Dobson             2011-03=
-07  2388  		else
d42e869acf0da4 drivers/hwmon/w83627ehf.c     Ian Dobson             2011-03=
-07  2389  			superio_outb(sio_data->sioreg, NCT6775_REG_FAN_DEBOUNCE,
d42e869acf0da4 drivers/hwmon/w83627ehf.c     Ian Dobson             2011-03=
-07  2390  				     0x1e | tmp);
d42e869acf0da4 drivers/hwmon/w83627ehf.c     Ian Dobson             2011-03=
-07  2391  		pr_info("Enabled fan debounce for chip %s\n", data->name);
d42e869acf0da4 drivers/hwmon/w83627ehf.c     Ian Dobson             2011-03=
-07  2392  	}
d42e869acf0da4 drivers/hwmon/w83627ehf.c     Ian Dobson             2011-03=
-07  2393  =

03f5de2bb7125e drivers/hwmon/w83627ehf.c     Jean Delvare           2011-10=
-13  2394  	w83627ehf_check_fan_inputs(sio_data, data);
08e7e2789e0da4 drivers/i2c/chips/w83627ehf.c Jean Delvare           2005-04=
-25  2395  =

0d0235301b3a53 drivers/hwmon/w83627ehf.c     Katsumi Sato           2017-02=
-22  2396  	superio_exit(sio_data->sioreg);
0d0235301b3a53 drivers/hwmon/w83627ehf.c     Katsumi Sato           2017-02=
-22  2397  =

ea7be66c44e56b drivers/hwmon/w83627ehf.c     Mark M. Hoffman        2007-08=
-05  2398  	/* Read fan clock dividers immediately */
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2399  	w83627ehf_update_fan_div_common(dev, data);
ec3e5a16446fef drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-02  2400  =

b84bb5186297d1 drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-13  2401  	/* Read pwm data to save original values */
b84bb5186297d1 drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-13  2402  	w83627ehf_update_pwm_common(dev, data);
b84bb5186297d1 drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-13  2403  	for (i =3D 0; i < data->pwm_num; i++)
b84bb5186297d1 drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-13  2404  		data->pwm_enable_orig[i] =3D data->pwm_enable[i];
b84bb5186297d1 drivers/hwmon/w83627ehf.c     Guenter Roeck          2011-02=
-13  2405  =

266cd5835947d0 drivers/hwmon/w83627ehf.c     Dr. David Alan Gilbert 2019-11=
-24  2406  	hwmon_dev =3D devm_hwmon_device_register_with_info(&pdev->dev,
266cd5835947d0 drivers/hwmon/w83627ehf.c     Dr. David Alan Gilbert 2019-11=
-24  2407  							 data->name,
266cd5835947d0 drivers/hwmon/w83627ehf.c     Dr. David Alan Gilbert 2019-11=
-24  2408  							 data,
266cd5835947d0 drivers/hwmon/w83627ehf.c     Dr. David Alan Gilbert 2019-11=
-24  2409  							 &w83627ehf_chip_info,
266cd5835947d0 drivers/hwmon/w83627ehf.c     Dr. David Alan Gilbert 2019-11=
-24  2410  							 w83627ehf_groups);
08c79950a047db drivers/hwmon/w83627ehf.c     Rudolf Marek           2006-07=
-05  2411  =

266cd5835947d0 drivers/hwmon/w83627ehf.c     Dr. David Alan Gilbert 2019-11=
-24  2412  	return PTR_ERR_OR_ZERO(hwmon_dev);
08e7e2789e0da4 drivers/i2c/chips/w83627ehf.c Jean Delvare           2005-04=
-25  2413  =

08e7e2789e0da4 drivers/i2c/chips/w83627ehf.c Jean Delvare           2005-04=
-25  2414  exit_release:
1ea6dd3840e5a2 drivers/hwmon/w83627ehf.c     David Hubbard          2007-06=
-24  2415  	release_region(res->start, IOREGION_LENGTH);
08e7e2789e0da4 drivers/i2c/chips/w83627ehf.c Jean Delvare           2005-04=
-25  2416  exit:
08e7e2789e0da4 drivers/i2c/chips/w83627ehf.c Jean Delvare           2005-04=
-25 @2417  	return err;
08e7e2789e0da4 drivers/i2c/chips/w83627ehf.c Jean Delvare           2005-04=
-25  2418  }
08e7e2789e0da4 drivers/i2c/chips/w83627ehf.c Jean Delvare           2005-04=
-25  2419  =


:::::: The code at line 2417 was first introduced by commit
:::::: 08e7e2789e0da49eadeb17121e24af22efeee84b [PATCH] I2C: New hardware m=
onitoring driver: w83627ehf

:::::: TO: Jean Delvare <khali@linux-fr.org>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4916496062061437818==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
f6+OTxLgzgEA
--===============4916496062061437818==--

