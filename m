Content-Type: multipart/mixed; boundary="===============8028757141338082928=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/iio/adc/ad7124.c:433 ad7124_pop_config() error: potentially dereferencing uninitialized 'lru_cfg'.
Date: Fri, 10 Dec 2021 04:43:53 +0800
Message-ID: <202112100439.jTmfKv5U-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8028757141338082928==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Alexandru Tachici <alexandru.tachici@analog.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2a987e65025e2b79c6d453b78cb5985ac6e5eb26
commit: 7b8d045e497a04dd88546da51f34fa3b102778d2 iio: adc: ad7124: allow mo=
re than 8 channels
date:   9 months ago
:::::: branch date: 2 days ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-m031-20211206 (https://download.01.org/0day-ci/ar=
chive/20211210/202112100439.jTmfKv5U-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/iio/adc/ad7124.c:433 ad7124_pop_config() error: potentially derefer=
encing uninitialized 'lru_cfg'.

vim +/lru_cfg +433 drivers/iio/adc/ad7124.c

7b8d045e497a04d Alexandru Tachici 2021-03-11  417  =

7b8d045e497a04d Alexandru Tachici 2021-03-11  418  static struct ad7124_cha=
nnel_config *ad7124_pop_config(struct ad7124_state *st)
7b8d045e497a04d Alexandru Tachici 2021-03-11  419  {
7b8d045e497a04d Alexandru Tachici 2021-03-11  420  	struct ad7124_channel_c=
onfig *lru_cfg;
7b8d045e497a04d Alexandru Tachici 2021-03-11  421  	struct ad7124_channel_c=
onfig *cfg;
7b8d045e497a04d Alexandru Tachici 2021-03-11  422  	int ret;
7b8d045e497a04d Alexandru Tachici 2021-03-11  423  	int i;
7b8d045e497a04d Alexandru Tachici 2021-03-11  424  =

7b8d045e497a04d Alexandru Tachici 2021-03-11  425  	/*
7b8d045e497a04d Alexandru Tachici 2021-03-11  426  	 * Pop least recently u=
sed config from the fifo
7b8d045e497a04d Alexandru Tachici 2021-03-11  427  	 * in order to make roo=
m for the new one
7b8d045e497a04d Alexandru Tachici 2021-03-11  428  	 */
7b8d045e497a04d Alexandru Tachici 2021-03-11  429  	ret =3D kfifo_get(&st->=
live_cfgs_fifo, &lru_cfg);
7b8d045e497a04d Alexandru Tachici 2021-03-11  430  	if (ret <=3D 0)
7b8d045e497a04d Alexandru Tachici 2021-03-11  431  		return NULL;
7b8d045e497a04d Alexandru Tachici 2021-03-11  432  =

7b8d045e497a04d Alexandru Tachici 2021-03-11 @433  	lru_cfg->live =3D false;
7b8d045e497a04d Alexandru Tachici 2021-03-11  434  =

7b8d045e497a04d Alexandru Tachici 2021-03-11  435  	/* mark slot as free */
7b8d045e497a04d Alexandru Tachici 2021-03-11  436  	assign_bit(lru_cfg->cfg=
_slot, &st->cfg_slots_status, 0);
7b8d045e497a04d Alexandru Tachici 2021-03-11  437  =

7b8d045e497a04d Alexandru Tachici 2021-03-11  438  	/* invalidate all other=
 configs that pointed to this one */
7b8d045e497a04d Alexandru Tachici 2021-03-11  439  	for (i =3D 0; i < st->n=
um_channels; i++) {
7b8d045e497a04d Alexandru Tachici 2021-03-11  440  		cfg =3D &st->channels[=
i].cfg;
7b8d045e497a04d Alexandru Tachici 2021-03-11  441  =

7b8d045e497a04d Alexandru Tachici 2021-03-11  442  		if (cfg->cfg_slot =3D=
=3D lru_cfg->cfg_slot)
7b8d045e497a04d Alexandru Tachici 2021-03-11  443  			cfg->live =3D false;
cef2760954cf4f8 Alexandru Tachici 2020-01-22  444  	}
cef2760954cf4f8 Alexandru Tachici 2020-01-22  445  =

7b8d045e497a04d Alexandru Tachici 2021-03-11  446  	return lru_cfg;
cef2760954cf4f8 Alexandru Tachici 2020-01-22  447  }
cef2760954cf4f8 Alexandru Tachici 2020-01-22  448  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8028757141338082928==--

