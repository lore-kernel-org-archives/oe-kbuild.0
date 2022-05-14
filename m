Content-Type: multipart/mixed; boundary="===============4418918861435821154=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [mszyprow:v5.18-next-20220511-dsi-rework 14/35] drivers/gpu/drm/bridge/samsung-dsim.c:506:3-9: WARNING: do_div() does a 64-by-32 division, please consider using div64_ul instead.
Date: Sat, 14 May 2022 09:31:10 +0800
Message-ID: <202205140917.9cTJ9GLZ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4418918861435821154==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Jagan Teki <jagan@amarulasolutions.com>
CC: Marek Szyprowski <m.szyprowski@samsung.com>

tree:   https://github.com/mszyprow/linux.git v5.18-next-20220511-dsi-rework
head:   65cb4959430021041f1e68ef98a6ec541d5891aa
commit: 395cab08cbac6e4028dafce068414ea43244a592 [14/35] drm: bridge: Add S=
amsung DSIM bridge driver
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: openrisc-randconfig-c003-20220512 (https://download.01.org/0day-ci/=
archive/20220514/202205140917.9cTJ9GLZ-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/bridge/samsung-dsim.c:506:3-9: WARNING: do_div() does a =
64-by-32 division, please consider using div64_ul instead.

vim +506 drivers/gpu/drm/bridge/samsung-dsim.c

395cab08cbac6e Jagan Teki 2022-05-04  483  =

395cab08cbac6e Jagan Teki 2022-05-04  484  static unsigned long samsung_dsi=
m_pll_find_pms(struct samsung_dsim *dsi,
395cab08cbac6e Jagan Teki 2022-05-04  485  					       unsigned long fin,
395cab08cbac6e Jagan Teki 2022-05-04  486  					       unsigned long fout,
395cab08cbac6e Jagan Teki 2022-05-04  487  					       u8 *p, u16 *m, u8 *s)
395cab08cbac6e Jagan Teki 2022-05-04  488  {
395cab08cbac6e Jagan Teki 2022-05-04  489  	const struct samsung_dsim_drive=
r_data *driver_data =3D dsi->driver_data;
395cab08cbac6e Jagan Teki 2022-05-04  490  	unsigned long best_freq =3D 0;
395cab08cbac6e Jagan Teki 2022-05-04  491  	u32 min_delta =3D 0xffffffff;
395cab08cbac6e Jagan Teki 2022-05-04  492  	u8 p_min, p_max;
395cab08cbac6e Jagan Teki 2022-05-04  493  	u8 _p, best_p;
395cab08cbac6e Jagan Teki 2022-05-04  494  	u16 _m, best_m;
395cab08cbac6e Jagan Teki 2022-05-04  495  	u8 _s, best_s;
395cab08cbac6e Jagan Teki 2022-05-04  496  =

395cab08cbac6e Jagan Teki 2022-05-04  497  	p_min =3D DIV_ROUND_UP(fin, (12=
 * MHZ));
395cab08cbac6e Jagan Teki 2022-05-04  498  	p_max =3D fin / (6 * MHZ);
395cab08cbac6e Jagan Teki 2022-05-04  499  =

395cab08cbac6e Jagan Teki 2022-05-04  500  	for (_p =3D p_min; _p <=3D p_ma=
x; ++_p) {
395cab08cbac6e Jagan Teki 2022-05-04  501  		for (_s =3D 0; _s <=3D 5; ++_s=
) {
395cab08cbac6e Jagan Teki 2022-05-04  502  			u64 tmp;
395cab08cbac6e Jagan Teki 2022-05-04  503  			u32 delta;
395cab08cbac6e Jagan Teki 2022-05-04  504  =

395cab08cbac6e Jagan Teki 2022-05-04  505  			tmp =3D (u64)fout * (_p << _s=
);
395cab08cbac6e Jagan Teki 2022-05-04 @506  			do_div(tmp, fin);
395cab08cbac6e Jagan Teki 2022-05-04  507  			_m =3D tmp;
395cab08cbac6e Jagan Teki 2022-05-04  508  			if (_m < 41 || _m > 125)
395cab08cbac6e Jagan Teki 2022-05-04  509  				continue;
395cab08cbac6e Jagan Teki 2022-05-04  510  =

395cab08cbac6e Jagan Teki 2022-05-04  511  			tmp =3D (u64)_m * fin;
395cab08cbac6e Jagan Teki 2022-05-04  512  			do_div(tmp, _p);
395cab08cbac6e Jagan Teki 2022-05-04  513  			if (tmp < 500 * MHZ ||
395cab08cbac6e Jagan Teki 2022-05-04  514  					tmp > driver_data->max_freq=
 * MHZ)
395cab08cbac6e Jagan Teki 2022-05-04  515  				continue;
395cab08cbac6e Jagan Teki 2022-05-04  516  =

395cab08cbac6e Jagan Teki 2022-05-04  517  			tmp =3D (u64)_m * fin;
395cab08cbac6e Jagan Teki 2022-05-04  518  			do_div(tmp, _p << _s);
395cab08cbac6e Jagan Teki 2022-05-04  519  =

395cab08cbac6e Jagan Teki 2022-05-04  520  			delta =3D abs(fout - tmp);
395cab08cbac6e Jagan Teki 2022-05-04  521  			if (delta < min_delta) {
395cab08cbac6e Jagan Teki 2022-05-04  522  				best_p =3D _p;
395cab08cbac6e Jagan Teki 2022-05-04  523  				best_m =3D _m;
395cab08cbac6e Jagan Teki 2022-05-04  524  				best_s =3D _s;
395cab08cbac6e Jagan Teki 2022-05-04  525  				min_delta =3D delta;
395cab08cbac6e Jagan Teki 2022-05-04  526  				best_freq =3D tmp;
395cab08cbac6e Jagan Teki 2022-05-04  527  			}
395cab08cbac6e Jagan Teki 2022-05-04  528  		}
395cab08cbac6e Jagan Teki 2022-05-04  529  	}
395cab08cbac6e Jagan Teki 2022-05-04  530  =

395cab08cbac6e Jagan Teki 2022-05-04  531  	if (best_freq) {
395cab08cbac6e Jagan Teki 2022-05-04  532  		*p =3D best_p;
395cab08cbac6e Jagan Teki 2022-05-04  533  		*m =3D best_m;
395cab08cbac6e Jagan Teki 2022-05-04  534  		*s =3D best_s;
395cab08cbac6e Jagan Teki 2022-05-04  535  	}
395cab08cbac6e Jagan Teki 2022-05-04  536  =

395cab08cbac6e Jagan Teki 2022-05-04  537  	return best_freq;
395cab08cbac6e Jagan Teki 2022-05-04  538  }
395cab08cbac6e Jagan Teki 2022-05-04  539  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4418918861435821154==--

