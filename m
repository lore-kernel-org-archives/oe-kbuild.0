Content-Type: multipart/mixed; boundary="===============6224520147042857874=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/marvell-ccic/cafe-driver.c:208 cafe_smbus_write_data() error: double unlocked 'mcam->dev_lock' (orig line 188)
Date: Wed, 05 Aug 2020 02:25:51 +0800
Message-ID: <202008050248.8rH7FtaV%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6224520147042857874==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c0842fbc1b18c7a044e6ff3e8fa78bfa822c7d1a
commit: a19f228b8dd9a67e8de4ebd4eac8a4c94ec39d1a media: Kconfig: not all V4=
L2 platform drivers are for camera
date:   4 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-m001-20200805 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

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
git remote update linus
git checkout a19f228b8dd9a67e8de4ebd4eac8a4c94ec39d1a
vim +208 drivers/media/platform/marvell-ccic/cafe-driver.c

abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  169  =

abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  170  static int cafe_smbus_write_data(struct cafe_=
camera *cam,
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  171  		u16 addr, u8 command, u8 value)
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  172  {
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  173  	unsigned int rval;
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  174  	unsigned long flags;
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  175  	struct mcam_camera *mcam =3D &cam->mcam;
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  176  =

abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  177  	spin_lock_irqsave(&mcam->dev_lock, flags);
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  178  	rval =3D TWSIC0_EN | ((addr << TWSIC0_SID_SH=
IFT) & TWSIC0_SID);
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  179  	rval |=3D TWSIC0_OVMAGIC;  /* Make OV sensor=
s work */
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  180  	/*
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  181  	 * Marvell sez set clkdiv to all 1's for now.
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  182  	 */
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  183  	rval |=3D TWSIC0_CLKDIV;
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  184  	mcam_reg_write(mcam, REG_TWSIC0, rval);
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  185  	(void) mcam_reg_read(mcam, REG_TWSIC1); /* f=
orce write */
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  186  	rval =3D value | ((command << TWSIC1_ADDR_SH=
IFT) & TWSIC1_ADDR);
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  187  	mcam_reg_write(mcam, REG_TWSIC1, rval);
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11 @188  	spin_unlock_irqrestore(&mcam->dev_lock, flag=
s);
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  189  =

abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  190  	/* Unfortunately, reading TWSIC1 too soon af=
ter sending a command
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  191  	 * causes the device to die.
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  192  	 * Use a busy-wait because we often send a l=
arge quantity of small
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  193  	 * commands at-once; using msleep() would ca=
use a lot of context
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  194  	 * switches which take longer than 2ms, resu=
lting in a noticeable
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  195  	 * boot-time and capture-start delays.
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  196  	 */
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  197  	mdelay(2);
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  198  =

abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  199  	/*
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  200  	 * Another sad fact is that sometimes, comma=
nds silently complete but
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  201  	 * cafe_smbus_write_done() never becomes awa=
re of this.
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  202  	 * This happens at random and appears to pos=
sible occur with any
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  203  	 * command.
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  204  	 * We don't understand why this is. We work =
around this issue
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  205  	 * with the timeout in the wait below, assum=
ing that all commands
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  206  	 * complete within the timeout.
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  207  	 */
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11 @208  	wait_event_timeout(cam->smbus_wait, cafe_smb=
us_write_done(mcam),
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  209  			CAFE_SMBUS_TIMEOUT);
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  210  =

abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  211  	spin_lock_irqsave(&mcam->dev_lock, flags);
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  212  	rval =3D mcam_reg_read(mcam, REG_TWSIC1);
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  213  	spin_unlock_irqrestore(&mcam->dev_lock, flag=
s);
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  214  =

abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  215  	if (rval & TWSIC1_WSTAT) {
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  216  		cam_err(cam, "SMBUS write (%02x/%02x/%02x) =
timed out\n", addr,
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  217  				command, value);
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  218  		return -EIO;
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  219  	}
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  220  	if (rval & TWSIC1_ERROR) {
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  221  		cam_err(cam, "SMBUS write (%02x/%02x/%02x) =
error\n", addr,
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  222  				command, value);
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  223  		return -EIO;
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  224  	}
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  225  	return 0;
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  226  }
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  227  =

abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  228  =

abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  229  =

abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  230  static int cafe_smbus_read_done(struct mcam_c=
amera *mcam)
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  231  {
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  232  	unsigned long flags;
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  233  	int c1;
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  234  =

abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  235  	/*
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  236  	 * We must delay after the interrupt, or the=
 controller gets confused
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  237  	 * and never does give us good status.  Fort=
unately, we don't do this
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  238  	 * often.
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  239  	 */
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  240  	udelay(20);
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  241  	spin_lock_irqsave(&mcam->dev_lock, flags);
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  242  	c1 =3D mcam_reg_read(mcam, REG_TWSIC1);
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  243  	spin_unlock_irqrestore(&mcam->dev_lock, flag=
s);
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  244  	return c1 & (TWSIC1_RVALID|TWSIC1_ERROR);
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  245  }
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  246  =

abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  247  =

abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  248  =

abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  249  static int cafe_smbus_read_data(struct cafe_c=
amera *cam,
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  250  		u16 addr, u8 command, u8 *value)
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  251  {
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  252  	unsigned int rval;
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  253  	unsigned long flags;
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  254  	struct mcam_camera *mcam =3D &cam->mcam;
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  255  =

abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  256  	spin_lock_irqsave(&mcam->dev_lock, flags);
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  257  	rval =3D TWSIC0_EN | ((addr << TWSIC0_SID_SH=
IFT) & TWSIC0_SID);
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  258  	rval |=3D TWSIC0_OVMAGIC; /* Make OV sensors=
 work */
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  259  	/*
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  260  	 * Marvel sez set clkdiv to all 1's for now.
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  261  	 */
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  262  	rval |=3D TWSIC0_CLKDIV;
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  263  	mcam_reg_write(mcam, REG_TWSIC0, rval);
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  264  	(void) mcam_reg_read(mcam, REG_TWSIC1); /* f=
orce write */
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  265  	rval =3D TWSIC1_READ | ((command << TWSIC1_A=
DDR_SHIFT) & TWSIC1_ADDR);
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  266  	mcam_reg_write(mcam, REG_TWSIC1, rval);
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11 @267  	spin_unlock_irqrestore(&mcam->dev_lock, flag=
s);
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  268  =

abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11 @269  	wait_event_timeout(cam->smbus_wait,
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  270  			cafe_smbus_read_done(mcam), CAFE_SMBUS_TIM=
EOUT);
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  271  	spin_lock_irqsave(&mcam->dev_lock, flags);
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  272  	rval =3D mcam_reg_read(mcam, REG_TWSIC1);
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  273  	spin_unlock_irqrestore(&mcam->dev_lock, flag=
s);
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  274  =

abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  275  	if (rval & TWSIC1_ERROR) {
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  276  		cam_err(cam, "SMBUS read (%02x/%02x) error\=
n", addr, command);
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  277  		return -EIO;
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  278  	}
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  279  	if (!(rval & TWSIC1_RVALID)) {
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  280  		cam_err(cam, "SMBUS read (%02x/%02x) timed =
out\n", addr,
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  281  				command);
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  282  		return -EIO;
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  283  	}
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  284  	*value =3D rval & 0xff;
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  285  	return 0;
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  286  }
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  287  =

abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  288  /*
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  289   * Perform a transfer over SMBUS.  This thing=
 is called under
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  290   * the i2c bus lock, so we shouldn't race wit=
h ourselves...
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  291   */
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  292  static int cafe_smbus_xfer(struct i2c_adapter=
 *adapter, u16 addr,
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  293  		unsigned short flags, char rw, u8 command,
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  294  		int size, union i2c_smbus_data *data)
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  295  {
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  296  	struct cafe_camera *cam =3D i2c_get_adapdata=
(adapter);
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  297  	int ret =3D -EINVAL;
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  298  =

abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  299  	/*
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  300  	 * This interface would appear to only do by=
te data ops.  OK
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  301  	 * it can do word too, but the cam chip has =
no use for that.
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  302  	 */
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  303  	if (size !=3D I2C_SMBUS_BYTE_DATA) {
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  304  		cam_err(cam, "funky xfer size %d\n", size);
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  305  		return -EINVAL;
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  306  	}
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  307  =

abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  308  	if (rw =3D=3D I2C_SMBUS_WRITE)
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  309  		ret =3D cafe_smbus_write_data(cam, addr, co=
mmand, data->byte);
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  310  	else if (rw =3D=3D I2C_SMBUS_READ)
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  311  		ret =3D cafe_smbus_read_data(cam, addr, com=
mand, &data->byte);
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  312  	return ret;
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  313  }
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  314  =

abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  315  =

abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  316  static void cafe_smbus_enable_irq(struct cafe=
_camera *cam)
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  317  {
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  318  	unsigned long flags;
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  319  =

abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  320  	spin_lock_irqsave(&cam->mcam.dev_lock, flags=
);
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  321  	mcam_reg_set_bit(&cam->mcam, REG_IRQMASK, TW=
SIIRQS);
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  322  	spin_unlock_irqrestore(&cam->mcam.dev_lock, =
flags);
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  323  }
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  324  =

abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  325  static u32 cafe_smbus_func(struct i2c_adapter=
 *adapter)
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  326  {
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  327  	return I2C_FUNC_SMBUS_READ_BYTE_DATA  |
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  328  	       I2C_FUNC_SMBUS_WRITE_BYTE_DATA;
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  329  }
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  330  =

8e10fd851cb3e97 drivers/media/platform/marvell-ccic/cafe-driver.c Gustavo A=
. R. Silva   2017-07-09  331  static const struct i2c_algorithm cafe_smbus_=
algo =3D {
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  332  	.smbus_xfer =3D cafe_smbus_xfer,
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  333  	.functionality =3D cafe_smbus_func
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  334  };
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  335  =

abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  336  static int cafe_smbus_setup(struct cafe_camer=
a *cam)
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  337  {
595a93a47a3b7dc drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  338  	struct i2c_adapter *adap;
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  339  	int ret;
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  340  =

595a93a47a3b7dc drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  341  	adap =3D kzalloc(sizeof(*adap), GFP_KERNEL);
595a93a47a3b7dc drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  342  	if (adap =3D=3D NULL)
595a93a47a3b7dc drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  343  		return -ENOMEM;
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  344  	adap->owner =3D THIS_MODULE;
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  345  	adap->algo =3D &cafe_smbus_algo;
cc1e6315e83db0e drivers/media/platform/marvell-ccic/cafe-driver.c Mauro Car=
valho Chehab 2018-09-10  346  	strscpy(adap->name, "cafe_ccic", sizeof(adap=
->name));
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  347  	adap->dev.parent =3D &cam->pdev->dev;
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  348  	i2c_set_adapdata(adap, cam);
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  349  	ret =3D i2c_add_adapter(adap);
90ca75fd1945d9e drivers/media/platform/marvell-ccic/cafe-driver.c Alexey Kh=
oroshilov    2015-04-03  350  	if (ret) {
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  351  		printk(KERN_ERR "Unable to register cafe i2=
c adapter\n");
90ca75fd1945d9e drivers/media/platform/marvell-ccic/cafe-driver.c Alexey Kh=
oroshilov    2015-04-03  352  		kfree(adap);
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  353  		return ret;
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  354  	}
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  355  =

3eefe36cc00c539 drivers/media/platform/marvell-ccic/cafe-driver.c Lubomir R=
intel        2019-05-28  356  	cam->i2c_adapter =3D adap;
90ca75fd1945d9e drivers/media/platform/marvell-ccic/cafe-driver.c Alexey Kh=
oroshilov    2015-04-03  357  	cafe_smbus_enable_irq(cam);
90ca75fd1945d9e drivers/media/platform/marvell-ccic/cafe-driver.c Alexey Kh=
oroshilov    2015-04-03  358  	return 0;
90ca75fd1945d9e drivers/media/platform/marvell-ccic/cafe-driver.c Alexey Kh=
oroshilov    2015-04-03  359  }
90ca75fd1945d9e drivers/media/platform/marvell-ccic/cafe-driver.c Alexey Kh=
oroshilov    2015-04-03  360  =

abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  361  static void cafe_smbus_shutdown(struct cafe_c=
amera *cam)
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  362  {
3eefe36cc00c539 drivers/media/platform/marvell-ccic/cafe-driver.c Lubomir R=
intel        2019-05-28  363  	i2c_del_adapter(cam->i2c_adapter);
3eefe36cc00c539 drivers/media/platform/marvell-ccic/cafe-driver.c Lubomir R=
intel        2019-05-28  364  	kfree(cam->i2c_adapter);
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  365  }
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  366  =

abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  367  =

abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  368  /*
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  369   * Controller-level stuff
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  370   */
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  371  =

abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  372  static void cafe_ctlr_init(struct mcam_camera=
 *mcam)
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  373  {
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  374  	unsigned long flags;
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  375  =

abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  376  	spin_lock_irqsave(&mcam->dev_lock, flags);
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  377  	/*
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  378  	 * Added magic to bring up the hardware on t=
he B-Test board
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  379  	 */
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  380  	mcam_reg_write(mcam, 0x3038, 0x8);
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  381  	mcam_reg_write(mcam, 0x315c, 0x80008);
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  382  	/*
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  383  	 * Go through the dance needed to wake the d=
evice up.
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  384  	 * Note that these registers are global and =
shared
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  385  	 * with the NAND and SD devices.  Interactio=
n between the
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  386  	 * three still needs to be examined.
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  387  	 */
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  388  	mcam_reg_write(mcam, REG_GL_CSR, GCSR_SRS|GC=
SR_MRS); /* Needed? */
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  389  	mcam_reg_write(mcam, REG_GL_CSR, GCSR_SRC|GC=
SR_MRC);
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  390  	mcam_reg_write(mcam, REG_GL_CSR, GCSR_SRC|GC=
SR_MRS);
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  391  	/*
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  392  	 * Here we must wait a bit for the controlle=
r to come around.
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  393  	 */
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11 @394  	spin_unlock_irqrestore(&mcam->dev_lock, flag=
s);
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  395  	msleep(5);
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  396  	spin_lock_irqsave(&mcam->dev_lock, flags);
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  397  =

abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  398  	mcam_reg_write(mcam, REG_GL_CSR, GCSR_CCIC_E=
N|GCSR_SRC|GCSR_MRC);
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  399  	mcam_reg_set_bit(mcam, REG_GL_IMASK, GIMSK_C=
CIC_EN);
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  400  	/*
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  401  	 * Mask all interrupts.
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  402  	 */
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  403  	mcam_reg_write(mcam, REG_IRQMASK, 0);
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11 @404  	spin_unlock_irqrestore(&mcam->dev_lock, flag=
s);
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  405  }
abfa3df36c01a32 drivers/media/video/marvell-ccic/cafe-driver.c    Jonathan =
Corbet       2011-06-11  406  =


:::::: The code at line 208 was first introduced by commit
:::::: abfa3df36c01a32b081fb448750181af76eb9d55 [media] marvell-cam: Separa=
te out the Marvell camera core

:::::: TO: Jonathan Corbet <corbet@lwn.net>
:::::: CC: Mauro Carvalho Chehab <mchehab@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============6224520147042857874==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============6224520147042857874==--

