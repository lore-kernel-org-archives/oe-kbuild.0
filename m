Content-Type: multipart/mixed; boundary="===============0918821298104134946=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/marvell-ccic/cafe-driver.c:208 cafe_smbus_write_data() error: double unlocked 'mcam->dev_lock' (orig line 188)
Date: Wed, 26 Aug 2020 20:53:26 +0800
Message-ID: <202008262018.4TioHYEr%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0918821298104134946==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org

Hi Mauro,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2ac69819ba9e3d8d550bb5d2d2df74848e556812
commit: a19f228b8dd9a67e8de4ebd4eac8a4c94ec39d1a media: Kconfig: not all V4=
L2 platform drivers are for camera
date:   4 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 4 months ago
config: riscv-randconfig-m031-20200826 (attached as .config)
compiler: riscv64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/media/platform/marvell-ccic/cafe-driver.c:208 cafe_smbus_write_data=
() error: double unlocked 'mcam->dev_lock' (orig line 188)
drivers/media/platform/marvell-ccic/cafe-driver.c:208 cafe_smbus_write_data=
() error: double unlocked 'mcam->dev_lock' (orig line 188)
drivers/media/platform/marvell-ccic/cafe-driver.c:269 cafe_smbus_read_data(=
) error: double unlocked 'mcam->dev_lock' (orig line 267)
drivers/media/platform/marvell-ccic/cafe-driver.c:404 cafe_ctlr_init() erro=
r: double unlocked 'mcam->dev_lock' (orig line 394)

Old smatch warnings:
drivers/media/platform/marvell-ccic/cafe-driver.c:208 cafe_smbus_write_data=
() error: double unlocked 'mcam->dev_lock' (orig line 208)
drivers/media/platform/marvell-ccic/cafe-driver.c:208 cafe_smbus_write_data=
() error: double unlocked 'mcam->dev_lock' (orig line 208)
drivers/media/platform/marvell-ccic/cafe-driver.c:208 cafe_smbus_write_data=
() error: double unlocked 'mcam->dev_lock' (orig line 208)
drivers/media/platform/marvell-ccic/cafe-driver.c:208 cafe_smbus_write_data=
() error: double unlocked 'mcam->dev_lock' (orig line 208)
drivers/media/platform/marvell-ccic/cafe-driver.c:208 cafe_smbus_write_data=
() error: double unlocked 'mcam->dev_lock' (orig line 208)
drivers/media/platform/marvell-ccic/cafe-driver.c:208 cafe_smbus_write_data=
() error: double unlocked 'mcam->dev_lock' (orig line 208)
drivers/media/platform/marvell-ccic/cafe-driver.c:213 cafe_smbus_write_data=
() error: double unlocked 'mcam->dev_lock' (orig line 208)
drivers/media/platform/marvell-ccic/cafe-driver.c:269 cafe_smbus_read_data(=
) error: double unlocked 'mcam->dev_lock' (orig line 269)
drivers/media/platform/marvell-ccic/cafe-driver.c:269 cafe_smbus_read_data(=
) error: double unlocked 'mcam->dev_lock' (orig line 269)
drivers/media/platform/marvell-ccic/cafe-driver.c:269 cafe_smbus_read_data(=
) error: double unlocked 'mcam->dev_lock' (orig line 269)
drivers/media/platform/marvell-ccic/cafe-driver.c:273 cafe_smbus_read_data(=
) error: double unlocked 'mcam->dev_lock' (orig line 269)

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Da19f228b8dd9a67e8de4ebd4eac8a4c94ec39d1a
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git fetch --no-tags linus master
git checkout a19f228b8dd9a67e8de4ebd4eac8a4c94ec39d1a
vim +208 drivers/media/platform/marvell-ccic/cafe-driver.c

abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  169  =

abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  170  static int cafe_smbus_write_data(struct cafe_c=
amera *cam,
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  171  		u16 addr, u8 command, u8 value)
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  172  {
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  173  	unsigned int rval;
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  174  	unsigned long flags;
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  175  	struct mcam_camera *mcam =3D &cam->mcam;
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  176  =

abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  177  	spin_lock_irqsave(&mcam->dev_lock, flags);
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  178  	rval =3D TWSIC0_EN | ((addr << TWSIC0_SID_SHI=
FT) & TWSIC0_SID);
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  179  	rval |=3D TWSIC0_OVMAGIC;  /* Make OV sensors=
 work */
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  180  	/*
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  181  	 * Marvell sez set clkdiv to all 1's for now.
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  182  	 */
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  183  	rval |=3D TWSIC0_CLKDIV;
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  184  	mcam_reg_write(mcam, REG_TWSIC0, rval);
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  185  	(void) mcam_reg_read(mcam, REG_TWSIC1); /* fo=
rce write */
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  186  	rval =3D value | ((command << TWSIC1_ADDR_SHI=
FT) & TWSIC1_ADDR);
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  187  	mcam_reg_write(mcam, REG_TWSIC1, rval);
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11 @188  	spin_unlock_irqrestore(&mcam->dev_lock, flags=
);
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  189  =

abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  190  	/* Unfortunately, reading TWSIC1 too soon aft=
er sending a command
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  191  	 * causes the device to die.
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  192  	 * Use a busy-wait because we often send a la=
rge quantity of small
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  193  	 * commands at-once; using msleep() would cau=
se a lot of context
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  194  	 * switches which take longer than 2ms, resul=
ting in a noticeable
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  195  	 * boot-time and capture-start delays.
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  196  	 */
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  197  	mdelay(2);
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  198  =

abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  199  	/*
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  200  	 * Another sad fact is that sometimes, comman=
ds silently complete but
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  201  	 * cafe_smbus_write_done() never becomes awar=
e of this.
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  202  	 * This happens at random and appears to poss=
ible occur with any
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  203  	 * command.
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  204  	 * We don't understand why this is. We work a=
round this issue
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  205  	 * with the timeout in the wait below, assumi=
ng that all commands
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  206  	 * complete within the timeout.
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  207  	 */
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11 @208  	wait_event_timeout(cam->smbus_wait, cafe_smbu=
s_write_done(mcam),
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  209  			CAFE_SMBUS_TIMEOUT);
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  210  =

abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  211  	spin_lock_irqsave(&mcam->dev_lock, flags);
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  212  	rval =3D mcam_reg_read(mcam, REG_TWSIC1);
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  213  	spin_unlock_irqrestore(&mcam->dev_lock, flags=
);
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  214  =

abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  215  	if (rval & TWSIC1_WSTAT) {
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  216  		cam_err(cam, "SMBUS write (%02x/%02x/%02x) t=
imed out\n", addr,
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  217  				command, value);
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  218  		return -EIO;
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  219  	}
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  220  	if (rval & TWSIC1_ERROR) {
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  221  		cam_err(cam, "SMBUS write (%02x/%02x/%02x) e=
rror\n", addr,
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  222  				command, value);
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  223  		return -EIO;
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  224  	}
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  225  	return 0;
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  226  }
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  227  =

abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  228  =

abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  229  =

abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  230  static int cafe_smbus_read_done(struct mcam_ca=
mera *mcam)
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  231  {
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  232  	unsigned long flags;
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  233  	int c1;
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  234  =

abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  235  	/*
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  236  	 * We must delay after the interrupt, or the =
controller gets confused
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  237  	 * and never does give us good status.  Fortu=
nately, we don't do this
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  238  	 * often.
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  239  	 */
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  240  	udelay(20);
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  241  	spin_lock_irqsave(&mcam->dev_lock, flags);
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  242  	c1 =3D mcam_reg_read(mcam, REG_TWSIC1);
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  243  	spin_unlock_irqrestore(&mcam->dev_lock, flags=
);
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  244  	return c1 & (TWSIC1_RVALID|TWSIC1_ERROR);
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  245  }
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  246  =

abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  247  =

abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  248  =

abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  249  static int cafe_smbus_read_data(struct cafe_ca=
mera *cam,
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  250  		u16 addr, u8 command, u8 *value)
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  251  {
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  252  	unsigned int rval;
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  253  	unsigned long flags;
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  254  	struct mcam_camera *mcam =3D &cam->mcam;
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  255  =

abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  256  	spin_lock_irqsave(&mcam->dev_lock, flags);
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  257  	rval =3D TWSIC0_EN | ((addr << TWSIC0_SID_SHI=
FT) & TWSIC0_SID);
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  258  	rval |=3D TWSIC0_OVMAGIC; /* Make OV sensors =
work */
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  259  	/*
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  260  	 * Marvel sez set clkdiv to all 1's for now.
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  261  	 */
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  262  	rval |=3D TWSIC0_CLKDIV;
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  263  	mcam_reg_write(mcam, REG_TWSIC0, rval);
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  264  	(void) mcam_reg_read(mcam, REG_TWSIC1); /* fo=
rce write */
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  265  	rval =3D TWSIC1_READ | ((command << TWSIC1_AD=
DR_SHIFT) & TWSIC1_ADDR);
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  266  	mcam_reg_write(mcam, REG_TWSIC1, rval);
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11 @267  	spin_unlock_irqrestore(&mcam->dev_lock, flags=
);
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  268  =

abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11 @269  	wait_event_timeout(cam->smbus_wait,
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  270  			cafe_smbus_read_done(mcam), CAFE_SMBUS_TIME=
OUT);
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  271  	spin_lock_irqsave(&mcam->dev_lock, flags);
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  272  	rval =3D mcam_reg_read(mcam, REG_TWSIC1);
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  273  	spin_unlock_irqrestore(&mcam->dev_lock, flags=
);
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  274  =

abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  275  	if (rval & TWSIC1_ERROR) {
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  276  		cam_err(cam, "SMBUS read (%02x/%02x) error\n=
", addr, command);
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  277  		return -EIO;
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  278  	}
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  279  	if (!(rval & TWSIC1_RVALID)) {
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  280  		cam_err(cam, "SMBUS read (%02x/%02x) timed o=
ut\n", addr,
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  281  				command);
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  282  		return -EIO;
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  283  	}
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  284  	*value =3D rval & 0xff;
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  285  	return 0;
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  286  }
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  287  =

abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  288  /*
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  289   * Perform a transfer over SMBUS.  This thing =
is called under
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  290   * the i2c bus lock, so we shouldn't race with=
 ourselves...
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  291   */
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  292  static int cafe_smbus_xfer(struct i2c_adapter =
*adapter, u16 addr,
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  293  		unsigned short flags, char rw, u8 command,
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  294  		int size, union i2c_smbus_data *data)
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  295  {
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  296  	struct cafe_camera *cam =3D i2c_get_adapdata(=
adapter);
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  297  	int ret =3D -EINVAL;
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  298  =

abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  299  	/*
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  300  	 * This interface would appear to only do byt=
e data ops.  OK
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  301  	 * it can do word too, but the cam chip has n=
o use for that.
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  302  	 */
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  303  	if (size !=3D I2C_SMBUS_BYTE_DATA) {
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  304  		cam_err(cam, "funky xfer size %d\n", size);
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  305  		return -EINVAL;
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  306  	}
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  307  =

abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  308  	if (rw =3D=3D I2C_SMBUS_WRITE)
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  309  		ret =3D cafe_smbus_write_data(cam, addr, com=
mand, data->byte);
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  310  	else if (rw =3D=3D I2C_SMBUS_READ)
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  311  		ret =3D cafe_smbus_read_data(cam, addr, comm=
and, &data->byte);
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  312  	return ret;
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  313  }
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  314  =

abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  315  =

abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  316  static void cafe_smbus_enable_irq(struct cafe_=
camera *cam)
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  317  {
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  318  	unsigned long flags;
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  319  =

abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  320  	spin_lock_irqsave(&cam->mcam.dev_lock, flags);
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  321  	mcam_reg_set_bit(&cam->mcam, REG_IRQMASK, TWS=
IIRQS);
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  322  	spin_unlock_irqrestore(&cam->mcam.dev_lock, f=
lags);
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  323  }
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  324  =

abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  325  static u32 cafe_smbus_func(struct i2c_adapter =
*adapter)
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  326  {
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  327  	return I2C_FUNC_SMBUS_READ_BYTE_DATA  |
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  328  	       I2C_FUNC_SMBUS_WRITE_BYTE_DATA;
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  329  }
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  330  =

8e10fd851cb3e9 drivers/media/platform/marvell-ccic/cafe-driver.c Gustavo A.=
 R. Silva   2017-07-09  331  static const struct i2c_algorithm cafe_smbus_a=
lgo =3D {
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  332  	.smbus_xfer =3D cafe_smbus_xfer,
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  333  	.functionality =3D cafe_smbus_func
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  334  };
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  335  =

abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  336  static int cafe_smbus_setup(struct cafe_camera=
 *cam)
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  337  {
595a93a47a3b7d drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  338  	struct i2c_adapter *adap;
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  339  	int ret;
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  340  =

595a93a47a3b7d drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  341  	adap =3D kzalloc(sizeof(*adap), GFP_KERNEL);
595a93a47a3b7d drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  342  	if (adap =3D=3D NULL)
595a93a47a3b7d drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  343  		return -ENOMEM;
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  344  	adap->owner =3D THIS_MODULE;
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  345  	adap->algo =3D &cafe_smbus_algo;
cc1e6315e83db0 drivers/media/platform/marvell-ccic/cafe-driver.c Mauro Carv=
alho Chehab 2018-09-10  346  	strscpy(adap->name, "cafe_ccic", sizeof(adap-=
>name));
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  347  	adap->dev.parent =3D &cam->pdev->dev;
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  348  	i2c_set_adapdata(adap, cam);
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  349  	ret =3D i2c_add_adapter(adap);
90ca75fd1945d9 drivers/media/platform/marvell-ccic/cafe-driver.c Alexey Kho=
roshilov    2015-04-03  350  	if (ret) {
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  351  		printk(KERN_ERR "Unable to register cafe i2c=
 adapter\n");
90ca75fd1945d9 drivers/media/platform/marvell-ccic/cafe-driver.c Alexey Kho=
roshilov    2015-04-03  352  		kfree(adap);
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  353  		return ret;
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  354  	}
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  355  =

3eefe36cc00c53 drivers/media/platform/marvell-ccic/cafe-driver.c Lubomir Ri=
ntel        2019-05-28  356  	cam->i2c_adapter =3D adap;
90ca75fd1945d9 drivers/media/platform/marvell-ccic/cafe-driver.c Alexey Kho=
roshilov    2015-04-03  357  	cafe_smbus_enable_irq(cam);
90ca75fd1945d9 drivers/media/platform/marvell-ccic/cafe-driver.c Alexey Kho=
roshilov    2015-04-03  358  	return 0;
90ca75fd1945d9 drivers/media/platform/marvell-ccic/cafe-driver.c Alexey Kho=
roshilov    2015-04-03  359  }
90ca75fd1945d9 drivers/media/platform/marvell-ccic/cafe-driver.c Alexey Kho=
roshilov    2015-04-03  360  =

abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  361  static void cafe_smbus_shutdown(struct cafe_ca=
mera *cam)
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  362  {
3eefe36cc00c53 drivers/media/platform/marvell-ccic/cafe-driver.c Lubomir Ri=
ntel        2019-05-28  363  	i2c_del_adapter(cam->i2c_adapter);
3eefe36cc00c53 drivers/media/platform/marvell-ccic/cafe-driver.c Lubomir Ri=
ntel        2019-05-28  364  	kfree(cam->i2c_adapter);
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  365  }
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  366  =

abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  367  =

abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  368  /*
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  369   * Controller-level stuff
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  370   */
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  371  =

abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  372  static void cafe_ctlr_init(struct mcam_camera =
*mcam)
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  373  {
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  374  	unsigned long flags;
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  375  =

abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  376  	spin_lock_irqsave(&mcam->dev_lock, flags);
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  377  	/*
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  378  	 * Added magic to bring up the hardware on th=
e B-Test board
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  379  	 */
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  380  	mcam_reg_write(mcam, 0x3038, 0x8);
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  381  	mcam_reg_write(mcam, 0x315c, 0x80008);
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  382  	/*
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  383  	 * Go through the dance needed to wake the de=
vice up.
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  384  	 * Note that these registers are global and s=
hared
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  385  	 * with the NAND and SD devices.  Interaction=
 between the
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  386  	 * three still needs to be examined.
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  387  	 */
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  388  	mcam_reg_write(mcam, REG_GL_CSR, GCSR_SRS|GCS=
R_MRS); /* Needed? */
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  389  	mcam_reg_write(mcam, REG_GL_CSR, GCSR_SRC|GCS=
R_MRC);
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  390  	mcam_reg_write(mcam, REG_GL_CSR, GCSR_SRC|GCS=
R_MRS);
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  391  	/*
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  392  	 * Here we must wait a bit for the controller=
 to come around.
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  393  	 */
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11 @394  	spin_unlock_irqrestore(&mcam->dev_lock, flags=
);
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  395  	msleep(5);
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  396  	spin_lock_irqsave(&mcam->dev_lock, flags);
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  397  =

abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  398  	mcam_reg_write(mcam, REG_GL_CSR, GCSR_CCIC_EN=
|GCSR_SRC|GCSR_MRC);
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  399  	mcam_reg_set_bit(mcam, REG_GL_IMASK, GIMSK_CC=
IC_EN);
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  400  	/*
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  401  	 * Mask all interrupts.
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  402  	 */
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  403  	mcam_reg_write(mcam, REG_IRQMASK, 0);
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11 @404  	spin_unlock_irqrestore(&mcam->dev_lock, flags=
);
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  405  }
abfa3df36c01a3 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan C=
orbet       2011-06-11  406  =


:::::: The code at line 208 was first introduced by commit
:::::: abfa3df36c01a32b081fb448750181af76eb9d55 [media] marvell-cam: Separa=
te out the Marvell camera core

:::::: TO: Jonathan Corbet <corbet@lwn.net>
:::::: CC: Mauro Carvalho Chehab <mchehab@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0918821298104134946==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============0918821298104134946==--

