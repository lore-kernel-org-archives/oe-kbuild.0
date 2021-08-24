Content-Type: multipart/mixed; boundary="===============6300630445979642131=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [mcgrof-next:20210823-for-axboe-add-disk-error-handling-next 41/70] drivers/block/rsxx/dev.c:212:6: warning: Uninitialized variable: err [uninitvar]
Date: Tue, 24 Aug 2021 10:20:39 +0800
Message-ID: <202108241033.Ly5zufPy-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6300630445979642131==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Luis Chamberlain <mcgrof@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.g=
it 20210823-for-axboe-add-disk-error-handling-next
head:   4b448d7532233530f59b5bf8a184b4b3d0acc73f
commit: 830cca58563fc304bc786521664a0d4fdb101e78 [41/70] block/rsxx: add er=
ror handling support for add_disk()
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
compiler: microblaze-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/block/rsxx/dev.c:212:6: warning: Uninitialized variable: err [un=
initvar]
    if (err)
        ^

vim +212 drivers/block/rsxx/dev.c

8722ff8cdbfac9 josh.h.morris(a)us.ibm.com 2013-02-05  192  =

8722ff8cdbfac9 josh.h.morris(a)us.ibm.com 2013-02-05  193  int rsxx_attach_=
dev(struct rsxx_cardinfo *card)
8722ff8cdbfac9 josh.h.morris(a)us.ibm.com 2013-02-05  194  {
830cca58563fc3 Luis Chamberlain         2021-07-13  195  	int err;
830cca58563fc3 Luis Chamberlain         2021-07-13  196  =

8722ff8cdbfac9 josh.h.morris(a)us.ibm.com 2013-02-05  197  	mutex_lock(&car=
d->dev_lock);
8722ff8cdbfac9 josh.h.morris(a)us.ibm.com 2013-02-05  198  =

8722ff8cdbfac9 josh.h.morris(a)us.ibm.com 2013-02-05  199  	/* The block de=
vice requires the stripe size from the config. */
8722ff8cdbfac9 josh.h.morris(a)us.ibm.com 2013-02-05  200  	if (enable_blkd=
ev) {
8722ff8cdbfac9 josh.h.morris(a)us.ibm.com 2013-02-05  201  		if (card->conf=
ig_valid)
8722ff8cdbfac9 josh.h.morris(a)us.ibm.com 2013-02-05  202  			set_capacity(=
card->gendisk, card->size8 >> 9);
8722ff8cdbfac9 josh.h.morris(a)us.ibm.com 2013-02-05  203  		else
8722ff8cdbfac9 josh.h.morris(a)us.ibm.com 2013-02-05  204  			set_capacity(=
card->gendisk, 0);
830cca58563fc3 Luis Chamberlain         2021-07-13  205  		err =3D device_a=
dd_disk(CARD_TO_DEV(card), card->gendisk, NULL);
830cca58563fc3 Luis Chamberlain         2021-07-13  206  		if (err =3D=3D 0)
8722ff8cdbfac9 josh.h.morris(a)us.ibm.com 2013-02-05  207  			card->bdev_at=
tached =3D 1;
8722ff8cdbfac9 josh.h.morris(a)us.ibm.com 2013-02-05  208  	}
8722ff8cdbfac9 josh.h.morris(a)us.ibm.com 2013-02-05  209  =

8722ff8cdbfac9 josh.h.morris(a)us.ibm.com 2013-02-05  210  	mutex_unlock(&c=
ard->dev_lock);
8722ff8cdbfac9 josh.h.morris(a)us.ibm.com 2013-02-05  211  =

830cca58563fc3 Luis Chamberlain         2021-07-13 @212  	if (err)
830cca58563fc3 Luis Chamberlain         2021-07-13  213  		blk_cleanup_disk=
(card->gendisk);
830cca58563fc3 Luis Chamberlain         2021-07-13  214  =

830cca58563fc3 Luis Chamberlain         2021-07-13  215  	return err;
8722ff8cdbfac9 josh.h.morris(a)us.ibm.com 2013-02-05  216  }
8722ff8cdbfac9 josh.h.morris(a)us.ibm.com 2013-02-05  217  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6300630445979642131==--

