Content-Type: multipart/mixed; boundary="===============3225019897864829415=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] i2c: pasemi: Add IRQ support for Apple Silicon
Date: Mon, 22 Aug 2022 02:55:35 +0800
Message-ID: <202208220231.f88sizqa-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3225019897864829415==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <MN2PR01MB535838492432C910F2381F929F6F9@MN2PR01MB5358.prod.e=
xchangelabs.com>
References: <MN2PR01MB535838492432C910F2381F929F6F9@MN2PR01MB5358.prod.ex=
changelabs.com>
TO: Arminder Singh <arminders208@outlook.com>
TO: linux-kernel(a)vger.kernel.org
CC: Sven Peter <sven@svenpeter.dev>
CC: Alyssa Rosenzweig <alyssa@rosenzweig.io>
CC: Hector Martin <marcan@marcan.st>
CC: Michael Ellerman <mpe@ellerman.id.au>
CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>
CC: Paul Mackerras <paulus@samba.org>
CC: linux-arm-kernel(a)lists.infradead.org
CC: linuxppc-dev(a)lists.ozlabs.org
CC: linux-i2c(a)vger.kernel.org
CC: Arminder Singh <arminders208@outlook.com>

Hi Arminder,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on powerpc/next]
[also build test WARNING on linus/master v6.0-rc1 next-20220819]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arminder-Singh/i2c-p=
asemi-Add-IRQ-support-for-Apple-Silicon/20220821-034703
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git n=
ext
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: parisc-randconfig-m031-20220821 (https://download.01.org/0day-ci/ar=
chive/20220822/202208220231.f88sizqa-lkp(a)intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/i2c/busses/i2c-pasemi-core.c:92 pasemi_smb_waitready() error: unini=
tialized symbol 'status'.

vim +/status +92 drivers/i2c/busses/i2c-pasemi-core.c

beb58aa39e6e5a drivers/i2c/busses/i2c-pasemi.c      Olof Johansson 2007-02-=
13   79  =

8032214346c0c8 drivers/i2c/busses/i2c-pasemi.c      Julia Lawall   2010-09-=
05   80  static int pasemi_smb_waitready(struct pasemi_smbus *smbus)
beb58aa39e6e5a drivers/i2c/busses/i2c-pasemi.c      Olof Johansson 2007-02-=
13   81  {
beb58aa39e6e5a drivers/i2c/busses/i2c-pasemi.c      Olof Johansson 2007-02-=
13   82  	int timeout =3D 10;
beb58aa39e6e5a drivers/i2c/busses/i2c-pasemi.c      Olof Johansson 2007-02-=
13   83  	unsigned int status;
98584b2b51d808 drivers/i2c/busses/i2c-pasemi-core.c Arminder Singh 2022-08-=
20   84  	unsigned int bitmask =3D SMSTA_XEN | SMSTA_MTN;
beb58aa39e6e5a drivers/i2c/busses/i2c-pasemi.c      Olof Johansson 2007-02-=
13   85  =

98584b2b51d808 drivers/i2c/busses/i2c-pasemi-core.c Arminder Singh 2022-08-=
20   86  	if (smbus->use_irq) {
98584b2b51d808 drivers/i2c/busses/i2c-pasemi-core.c Arminder Singh 2022-08-=
20   87  		reinit_completion(&smbus->irq_completion);
98584b2b51d808 drivers/i2c/busses/i2c-pasemi-core.c Arminder Singh 2022-08-=
20   88  		reg_write(smbus, REG_IMASK, bitmask);
98584b2b51d808 drivers/i2c/busses/i2c-pasemi-core.c Arminder Singh 2022-08-=
20   89  		wait_for_completion_timeout(&smbus->irq_completion, msecs_to_jif=
fies(10));
beb58aa39e6e5a drivers/i2c/busses/i2c-pasemi.c      Olof Johansson 2007-02-=
13   90  		status =3D reg_read(smbus, REG_SMSTA);
98584b2b51d808 drivers/i2c/busses/i2c-pasemi-core.c Arminder Singh 2022-08-=
20   91  	} else {
beb58aa39e6e5a drivers/i2c/busses/i2c-pasemi.c      Olof Johansson 2007-02-=
13  @92  		while (!(status & SMSTA_XEN) && timeout--) {
beb58aa39e6e5a drivers/i2c/busses/i2c-pasemi.c      Olof Johansson 2007-02-=
13   93  			msleep(1);
beb58aa39e6e5a drivers/i2c/busses/i2c-pasemi.c      Olof Johansson 2007-02-=
13   94  			status =3D reg_read(smbus, REG_SMSTA);
beb58aa39e6e5a drivers/i2c/busses/i2c-pasemi.c      Olof Johansson 2007-02-=
13   95  		}
98584b2b51d808 drivers/i2c/busses/i2c-pasemi-core.c Arminder Singh 2022-08-=
20   96  	}
98584b2b51d808 drivers/i2c/busses/i2c-pasemi-core.c Arminder Singh 2022-08-=
20   97  =

beb58aa39e6e5a drivers/i2c/busses/i2c-pasemi.c      Olof Johansson 2007-02-=
13   98  =

be8a1f7cd4501c drivers/i2c/busses/i2c-pasemi.c      Olof Johansson 2007-11-=
15   99  	/* Got NACK? */
be8a1f7cd4501c drivers/i2c/busses/i2c-pasemi.c      Olof Johansson 2007-11-=
15  100  	if (status & SMSTA_MTN)
be8a1f7cd4501c drivers/i2c/busses/i2c-pasemi.c      Olof Johansson 2007-11-=
15  101  		return -ENXIO;
be8a1f7cd4501c drivers/i2c/busses/i2c-pasemi.c      Olof Johansson 2007-11-=
15  102  =

beb58aa39e6e5a drivers/i2c/busses/i2c-pasemi.c      Olof Johansson 2007-02-=
13  103  	if (timeout < 0) {
c06f50ed36cc0a drivers/i2c/busses/i2c-pasemi.c      Sven Peter     2021-10-=
08  104  		dev_warn(smbus->dev, "Timeout, status 0x%08x\n", status);
beb58aa39e6e5a drivers/i2c/busses/i2c-pasemi.c      Olof Johansson 2007-02-=
13  105  		reg_write(smbus, REG_SMSTA, status);
beb58aa39e6e5a drivers/i2c/busses/i2c-pasemi.c      Olof Johansson 2007-02-=
13  106  		return -ETIME;
beb58aa39e6e5a drivers/i2c/busses/i2c-pasemi.c      Olof Johansson 2007-02-=
13  107  	}
beb58aa39e6e5a drivers/i2c/busses/i2c-pasemi.c      Olof Johansson 2007-02-=
13  108  =

beb58aa39e6e5a drivers/i2c/busses/i2c-pasemi.c      Olof Johansson 2007-02-=
13  109  	/* Clear XEN */
beb58aa39e6e5a drivers/i2c/busses/i2c-pasemi.c      Olof Johansson 2007-02-=
13  110  	reg_write(smbus, REG_SMSTA, SMSTA_XEN);
beb58aa39e6e5a drivers/i2c/busses/i2c-pasemi.c      Olof Johansson 2007-02-=
13  111  =

beb58aa39e6e5a drivers/i2c/busses/i2c-pasemi.c      Olof Johansson 2007-02-=
13  112  	return 0;
beb58aa39e6e5a drivers/i2c/busses/i2c-pasemi.c      Olof Johansson 2007-02-=
13  113  }
beb58aa39e6e5a drivers/i2c/busses/i2c-pasemi.c      Olof Johansson 2007-02-=
13  114  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3225019897864829415==--

