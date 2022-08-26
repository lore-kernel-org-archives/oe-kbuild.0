Content-Type: multipart/mixed; boundary="===============8096126910066440343=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [broonie-spi:for-6.1 19/19] drivers/spi/spi-amd.c:253 amd_set_spi_freq() error: buffer overflow 'amd_spi_freq' 9 <= 9 (assuming for loop doesn't break)
Date: Fri, 26 Aug 2022 12:30:03 +0800
Message-ID: <202208261256.gtRY1l0p-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8096126910066440343==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-spi(a)vger.kernel.org
TO: Lucas Tanure <tanureal@opensource.cirrus.com>
CC: Mark Brown <broonie@kernel.org>
CC: Shreeya Patel <shreeya.patel@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for=
-6.1
head:   3fe26121dc3a9bf64e18fe0075cd9a92c9cd1b1a
commit: 3fe26121dc3a9bf64e18fe0075cd9a92c9cd1b1a [19/19] spi: amd: Configur=
e device speed
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: arm64-randconfig-m041-20220824 (https://download.01.org/0day-ci/arc=
hive/20220826/202208261256.gtRY1l0p-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/spi/spi-amd.c:253 amd_set_spi_freq() error: buffer overflow 'amd_sp=
i_freq' 9 <=3D 9 (assuming for loop doesn't break)

Old smatch warnings:
drivers/spi/spi-amd.c:256 amd_set_spi_freq() error: buffer overflow 'amd_sp=
i_freq' 9 <=3D 9 (assuming for loop doesn't break)
drivers/spi/spi-amd.c:258 amd_set_spi_freq() error: buffer overflow 'amd_sp=
i_freq' 9 <=3D 9 (assuming for loop doesn't break)
drivers/spi/spi-amd.c:267 amd_set_spi_freq() error: buffer overflow 'amd_sp=
i_freq' 9 <=3D 9 (assuming for loop doesn't break)
drivers/spi/spi-amd.c:268 amd_set_spi_freq() error: buffer overflow 'amd_sp=
i_freq' 9 <=3D 9 (assuming for loop doesn't break)

vim +253 drivers/spi/spi-amd.c

3fe26121dc3a9b Lucas Tanure 2022-08-25  238  =

3fe26121dc3a9b Lucas Tanure 2022-08-25  239  static int amd_set_spi_freq(st=
ruct amd_spi *amd_spi, u32 speed_hz)
3fe26121dc3a9b Lucas Tanure 2022-08-25  240  {
3fe26121dc3a9b Lucas Tanure 2022-08-25  241  	unsigned int i, spd7_val, alt=
_spd;
3fe26121dc3a9b Lucas Tanure 2022-08-25  242  =

3fe26121dc3a9b Lucas Tanure 2022-08-25  243  	if (speed_hz =3D=3D amd_spi->=
speed_hz)
3fe26121dc3a9b Lucas Tanure 2022-08-25  244  		return 0;
3fe26121dc3a9b Lucas Tanure 2022-08-25  245  =

3fe26121dc3a9b Lucas Tanure 2022-08-25  246  	if (speed_hz < AMD_SPI_MIN_HZ)
3fe26121dc3a9b Lucas Tanure 2022-08-25  247  		return -EINVAL;
3fe26121dc3a9b Lucas Tanure 2022-08-25  248  =

3fe26121dc3a9b Lucas Tanure 2022-08-25  249  	for (i =3D 0; i < ARRAY_SIZE(=
amd_spi_freq); i++)
3fe26121dc3a9b Lucas Tanure 2022-08-25  250  		if (speed_hz >=3D amd_spi_fr=
eq[i].speed_hz)
3fe26121dc3a9b Lucas Tanure 2022-08-25  251  			break;
3fe26121dc3a9b Lucas Tanure 2022-08-25  252  =

3fe26121dc3a9b Lucas Tanure 2022-08-25 @253  	if (speed_hz =3D=3D amd_spi_f=
req[i].speed_hz)
3fe26121dc3a9b Lucas Tanure 2022-08-25  254  		return 0;
3fe26121dc3a9b Lucas Tanure 2022-08-25  255  =

3fe26121dc3a9b Lucas Tanure 2022-08-25  256  	amd_spi->speed_hz =3D amd_spi=
_freq[i].speed_hz;
3fe26121dc3a9b Lucas Tanure 2022-08-25  257  =

3fe26121dc3a9b Lucas Tanure 2022-08-25  258  	alt_spd =3D (amd_spi_freq[i].=
enable_val << AMD_SPI_ALT_SPD_SHIFT)
3fe26121dc3a9b Lucas Tanure 2022-08-25  259  		   & AMD_SPI_ALT_SPD_MASK;
3fe26121dc3a9b Lucas Tanure 2022-08-25  260  	amd_spi_setclear_reg32(amd_sp=
i, AMD_SPI_ENA_REG, alt_spd,
3fe26121dc3a9b Lucas Tanure 2022-08-25  261  			       AMD_SPI_ALT_SPD_MASK=
);
3fe26121dc3a9b Lucas Tanure 2022-08-25  262  =

3fe26121dc3a9b Lucas Tanure 2022-08-25  263  	if (amd_spi->speed_hz =3D=3D =
AMD_SPI_MAX_HZ)
3fe26121dc3a9b Lucas Tanure 2022-08-25  264  		amd_spi_setclear_reg32(amd_s=
pi, AMD_SPI_ENA_REG, 1,
3fe26121dc3a9b Lucas Tanure 2022-08-25  265  				       AMD_SPI_SPI100_MASK=
);
3fe26121dc3a9b Lucas Tanure 2022-08-25  266  =

3fe26121dc3a9b Lucas Tanure 2022-08-25  267  	if (amd_spi_freq[i].spd7_val)=
 {
3fe26121dc3a9b Lucas Tanure 2022-08-25  268  		spd7_val =3D (amd_spi_freq[i=
].spd7_val << AMD_SPI_SPD7_SHIFT)
3fe26121dc3a9b Lucas Tanure 2022-08-25  269  			    & AMD_SPI_SPD7_MASK;
3fe26121dc3a9b Lucas Tanure 2022-08-25  270  		amd_spi_setclear_reg32(amd_s=
pi, AMD_SPI_SPEED_REG, spd7_val,
3fe26121dc3a9b Lucas Tanure 2022-08-25  271  				       AMD_SPI_SPD7_MASK);
3fe26121dc3a9b Lucas Tanure 2022-08-25  272  	}
3fe26121dc3a9b Lucas Tanure 2022-08-25  273  =

3fe26121dc3a9b Lucas Tanure 2022-08-25  274  	return 0;
3fe26121dc3a9b Lucas Tanure 2022-08-25  275  }
3fe26121dc3a9b Lucas Tanure 2022-08-25  276  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8096126910066440343==--

