Content-Type: multipart/mixed; boundary="===============0591977837335055714=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/dsa/mt7530.c:908 mt7530_set_ageing_time() error: uninitialized symbol 'age_count'.
Date: Thu, 25 Nov 2021 22:55:02 +0800
Message-ID: <202111252238.BmosAAYv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0591977837335055714==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: DENG Qingfang <dqfext@gmail.com>
CC: Andrew Lunn <andrew@lunn.ch>
CC: Vladimir Oltean <olteanv@gmail.com>
CC: Florian Fainelli <f.fainelli@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5f53fa508db098c9d372423a6dac31c8a5679cdf
commit: ea6d5c924e391872d402acac38461a5f8261e57f net: dsa: mt7530: support =
setting ageing time
date:   12 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 12 months ago
config: ia64-randconfig-m031-20211122 (https://download.01.org/0day-ci/arch=
ive/20211125/202111252238.BmosAAYv-lkp(a)intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/dsa/mt7530.c:908 mt7530_set_ageing_time() error: uninitialized =
symbol 'age_count'.
drivers/net/dsa/mt7530.c:908 mt7530_set_ageing_time() error: uninitialized =
symbol 'age_unit'.

Old smatch warnings:
drivers/net/dsa/mt7530.c:469 mt7530_pad_clk_setup() error: uninitialized sy=
mbol 'ncpo1'.

vim +/age_count +908 drivers/net/dsa/mt7530.c

b8f126a8d54318b Sean Wang     2017-04-07  872  =

ea6d5c924e39187 DENG Qingfang 2020-12-08  873  static int
ea6d5c924e39187 DENG Qingfang 2020-12-08  874  mt7530_set_ageing_time(struc=
t dsa_switch *ds, unsigned int msecs)
ea6d5c924e39187 DENG Qingfang 2020-12-08  875  {
ea6d5c924e39187 DENG Qingfang 2020-12-08  876  	struct mt7530_priv *priv =
=3D ds->priv;
ea6d5c924e39187 DENG Qingfang 2020-12-08  877  	unsigned int secs =3D msecs=
 / 1000;
ea6d5c924e39187 DENG Qingfang 2020-12-08  878  	unsigned int tmp_age_count;
ea6d5c924e39187 DENG Qingfang 2020-12-08  879  	unsigned int error =3D -1;
ea6d5c924e39187 DENG Qingfang 2020-12-08  880  	unsigned int age_count;
ea6d5c924e39187 DENG Qingfang 2020-12-08  881  	unsigned int age_unit;
ea6d5c924e39187 DENG Qingfang 2020-12-08  882  =

ea6d5c924e39187 DENG Qingfang 2020-12-08  883  	/* Applied timer is (AGE_CN=
T + 1) * (AGE_UNIT + 1) seconds */
ea6d5c924e39187 DENG Qingfang 2020-12-08  884  	if (secs < 1 || secs > (AGE=
_CNT_MAX + 1) * (AGE_UNIT_MAX + 1))
ea6d5c924e39187 DENG Qingfang 2020-12-08  885  		return -ERANGE;
ea6d5c924e39187 DENG Qingfang 2020-12-08  886  =

ea6d5c924e39187 DENG Qingfang 2020-12-08  887  	/* iterate through all poss=
ible age_count to find the closest pair */
ea6d5c924e39187 DENG Qingfang 2020-12-08  888  	for (tmp_age_count =3D 0; t=
mp_age_count <=3D AGE_CNT_MAX; ++tmp_age_count) {
ea6d5c924e39187 DENG Qingfang 2020-12-08  889  		unsigned int tmp_age_unit =
=3D secs / (tmp_age_count + 1) - 1;
ea6d5c924e39187 DENG Qingfang 2020-12-08  890  =

ea6d5c924e39187 DENG Qingfang 2020-12-08  891  		if (tmp_age_unit <=3D AGE_=
UNIT_MAX) {
ea6d5c924e39187 DENG Qingfang 2020-12-08  892  			unsigned int tmp_error =
=3D secs -
ea6d5c924e39187 DENG Qingfang 2020-12-08  893  				(tmp_age_count + 1) * (t=
mp_age_unit + 1);
ea6d5c924e39187 DENG Qingfang 2020-12-08  894  =

ea6d5c924e39187 DENG Qingfang 2020-12-08  895  			/* found a closer pair */
ea6d5c924e39187 DENG Qingfang 2020-12-08  896  			if (error > tmp_error) {
ea6d5c924e39187 DENG Qingfang 2020-12-08  897  				error =3D tmp_error;
ea6d5c924e39187 DENG Qingfang 2020-12-08  898  				age_count =3D tmp_age_co=
unt;
ea6d5c924e39187 DENG Qingfang 2020-12-08  899  				age_unit =3D tmp_age_uni=
t;
ea6d5c924e39187 DENG Qingfang 2020-12-08  900  			}
ea6d5c924e39187 DENG Qingfang 2020-12-08  901  =

ea6d5c924e39187 DENG Qingfang 2020-12-08  902  			/* found the exact match,=
 so break the loop */
ea6d5c924e39187 DENG Qingfang 2020-12-08  903  			if (!error)
ea6d5c924e39187 DENG Qingfang 2020-12-08  904  				break;
ea6d5c924e39187 DENG Qingfang 2020-12-08  905  		}
ea6d5c924e39187 DENG Qingfang 2020-12-08  906  	}
ea6d5c924e39187 DENG Qingfang 2020-12-08  907  =

ea6d5c924e39187 DENG Qingfang 2020-12-08 @908  	mt7530_write(priv, MT7530_A=
AC, AGE_CNT(age_count) | AGE_UNIT(age_unit));
ea6d5c924e39187 DENG Qingfang 2020-12-08  909  =

ea6d5c924e39187 DENG Qingfang 2020-12-08  910  	return 0;
ea6d5c924e39187 DENG Qingfang 2020-12-08  911  }
ea6d5c924e39187 DENG Qingfang 2020-12-08  912  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0591977837335055714==--

