Content-Type: multipart/mixed; boundary="===============7051036624691373787=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/iio/adc/ad7124.c:434:23: warning: dereference of NULL 'lru_cfg' [CWE-476]
Date: Sun, 19 Jun 2022 21:33:58 +0800
Message-ID: <202206192142.oFubZ7Jp-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7051036624691373787==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/i=
io/adc/ad7124.c:434:23: warning: dereference of NULL 'lru_cfg' [CWE-476] [-=
Wanalyzer-null-dereference]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Alexandru Tachici <alexandru.tachici@analog.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4b35035bcf80ddb47c0112c4fbd84a63a2836a18
commit: 5cfe8a1c2577ab24b38127f01c3bfa9dafd859da iio: adc: ad7124: add sequ=
encer support
date:   3 months ago
:::::: branch date: 2 days ago
:::::: commit date: 3 months ago
config: arm-randconfig-c002-20220619 (https://download.01.org/0day-ci/archi=
ve/20220619/202206192142.oFubZ7Jp-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D5cfe8a1c2577ab24b38127f01c3bfa9dafd859da
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 5cfe8a1c2577ab24b38127f01c3bfa9dafd859da
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   drivers/iio/adc/ad7124.c: In function 'ad7124_pop_config':
>> drivers/iio/adc/ad7124.c:434:23: warning: dereference of NULL 'lru_cfg' =
[CWE-476] [-Wanalyzer-null-dereference]
     434 |         lru_cfg->live =3D false;
         |         ~~~~~~~~~~~~~~^~~~~~~
     'ad7124_update_scan_mode': events 1-6
       |
       |  509 |         return ad7124_prepare_read(st, channel);
       |      |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                |
       |      |                (6) calling 'ad7124_prepare_read' from 'ad71=
24_update_scan_mode'
       |......
       |  718 | static int ad7124_update_scan_mode(struct iio_dev *indio_de=
v,
       |      |            ^~~~~~~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'ad7124_update_scan_mode'
       |......
       |  727 |         for (i =3D 0; i < st->num_channels; i++) {
       |      |                     ~~~~~~~~~~~~~~~~~~~~
       |      |                       |
       |      |                       (2) following 'true' branch...
       |  728 |                 bit_set =3D test_bit(i, scan_mask);
       |      |                 ~~~~~~~
       |      |                 |
       |      |                 (3) ...to here
       |  729 |                 if (bit_set)
       |      |                    ~
       |      |                    |
       |      |                    (4) following 'true' branch...
       |  730 |                         ret =3D __ad7124_set_channel(&st->s=
d, i);
       |      |                         ~~~
       |      |                         |
       |      |                         (5) ...to here
       |
       +--> 'ad7124_prepare_read': events 7-8
              |
              |  483 | static int ad7124_prepare_read(struct ad7124_state *=
st, int address)
              |      |            ^~~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (7) entry to 'ad7124_prepare_read'
              |......
              |  492 |         if (!cfg->live) {
              |      |            ~
              |      |            |
              |      |            (8) following 'false' branch...
              |
            'ad7124_prepare_read': event 9
              |
              |cc1:
              | (9): ...to here
              |
            'ad7124_prepare_read': events 10-12
              |
              |  495 |                 if (!live_cfg)
              |      |                    ^
              |      |                    |
              |      |                    (10) following 'true' branch...
              |  496 |                         ad7124_push_config(st, cfg);
              |      |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                         |
              |      |                         (11) ...to here
              |      |                         (12) calling 'ad7124_push_co=
nfig' from 'ad7124_prepare_read'
              |
              +--> 'ad7124_push_config': events 13-14
                     |
                     |  450 | static int ad7124_push_config(struct ad7124_s=
tate *st, struct ad7124_channel_config *cfg)
                     |      |            ^~~~~~~~~~~~~~~~~~
                     |      |            |
                     |      |            (13) entry to 'ad7124_push_config'
                     |......
                     |  461 |                 lru_cfg =3D ad7124_pop_config=
(st);
                     |      |                           ~~~~~~~~~~~~~~~~~~~=
~~
                     |      |                           |
                     |      |                           (14) calling 'ad712=
4_pop_config' from 'ad7124_push_config'
                     |
                     +--> 'ad7124_pop_config': event 15
                            |
                            |  419 | static struct ad7124_channel_config *a=
d7124_pop_config(struct ad7124_state *st)
                            |      |                                      ^=
~~~~~~~~~~~~~~~~
                            |      |                                      |
                            |      |                                      (=
15) entry to 'ad7124_pop_config'
                            |
                          'ad7124_pop_config': event 16
                            |
                            |include/linux/kfifo.h:455:20:
                            |  455 |                 if (__ret) { \
                            |      |                    ^
                            |      |                    |
                            |      |                    (16) following 'fal=
se' branch...
   drivers/iio/adc/ad7124.c:430:15: note: in expansion of macro 'kfifo_get'
                            |  430 |         ret =3D kfifo_get(&st->live_cf=
gs_fifo, &lru_cfg);
                            |      |               ^~~~~~~~~
                            |
                          'ad7124_pop_config': event 17
                            |
                            |include/linux/kfifo.h:465:9:
                            |  465 |         __ret; \
                            |      |         ^~~~~
                            |      |         |
                            |      |         (17) ...to here
   drivers/iio/adc/ad7124.c:430:15: note: in expansion of macro 'kfifo_get'
                            |  430 |         ret =3D kfifo_get(&st->live_cf=
gs_fifo, &lru_cfg);
                            |      |               ^~~~~~~~~

vim +/lru_cfg +434 drivers/iio/adc/ad7124.c

7b8d045e497a04 Alexandru Tachici 2021-03-11  418  =

7b8d045e497a04 Alexandru Tachici 2021-03-11  419  static struct ad7124_chan=
nel_config *ad7124_pop_config(struct ad7124_state *st)
7b8d045e497a04 Alexandru Tachici 2021-03-11  420  {
7b8d045e497a04 Alexandru Tachici 2021-03-11  421  	struct ad7124_channel_co=
nfig *lru_cfg;
7b8d045e497a04 Alexandru Tachici 2021-03-11  422  	struct ad7124_channel_co=
nfig *cfg;
7b8d045e497a04 Alexandru Tachici 2021-03-11  423  	int ret;
7b8d045e497a04 Alexandru Tachici 2021-03-11  424  	int i;
7b8d045e497a04 Alexandru Tachici 2021-03-11  425  =

7b8d045e497a04 Alexandru Tachici 2021-03-11  426  	/*
7b8d045e497a04 Alexandru Tachici 2021-03-11  427  	 * Pop least recently us=
ed config from the fifo
7b8d045e497a04 Alexandru Tachici 2021-03-11  428  	 * in order to make room=
 for the new one
7b8d045e497a04 Alexandru Tachici 2021-03-11  429  	 */
7b8d045e497a04 Alexandru Tachici 2021-03-11  430  	ret =3D kfifo_get(&st->l=
ive_cfgs_fifo, &lru_cfg);
7b8d045e497a04 Alexandru Tachici 2021-03-11  431  	if (ret <=3D 0)
7b8d045e497a04 Alexandru Tachici 2021-03-11  432  		return NULL;
7b8d045e497a04 Alexandru Tachici 2021-03-11  433  =

7b8d045e497a04 Alexandru Tachici 2021-03-11 @434  	lru_cfg->live =3D false;
7b8d045e497a04 Alexandru Tachici 2021-03-11  435  =

7b8d045e497a04 Alexandru Tachici 2021-03-11  436  	/* mark slot as free */
7b8d045e497a04 Alexandru Tachici 2021-03-11  437  	assign_bit(lru_cfg->cfg_=
slot, &st->cfg_slots_status, 0);
7b8d045e497a04 Alexandru Tachici 2021-03-11  438  =

7b8d045e497a04 Alexandru Tachici 2021-03-11  439  	/* invalidate all other =
configs that pointed to this one */
7b8d045e497a04 Alexandru Tachici 2021-03-11  440  	for (i =3D 0; i < st->nu=
m_channels; i++) {
7b8d045e497a04 Alexandru Tachici 2021-03-11  441  		cfg =3D &st->channels[i=
].cfg;
7b8d045e497a04 Alexandru Tachici 2021-03-11  442  =

7b8d045e497a04 Alexandru Tachici 2021-03-11  443  		if (cfg->cfg_slot =3D=
=3D lru_cfg->cfg_slot)
7b8d045e497a04 Alexandru Tachici 2021-03-11  444  			cfg->live =3D false;
cef2760954cf4f Alexandru Tachici 2020-01-22  445  	}
cef2760954cf4f Alexandru Tachici 2020-01-22  446  =

7b8d045e497a04 Alexandru Tachici 2021-03-11  447  	return lru_cfg;
cef2760954cf4f Alexandru Tachici 2020-01-22  448  }
cef2760954cf4f Alexandru Tachici 2020-01-22  449  =


:::::: The code at line 434 was first introduced by commit
:::::: 7b8d045e497a04dd88546da51f34fa3b102778d2 iio: adc: ad7124: allow mor=
e than 8 channels

:::::: TO: Alexandru Tachici <alexandru.tachici@analog.com>
:::::: CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7051036624691373787==--

