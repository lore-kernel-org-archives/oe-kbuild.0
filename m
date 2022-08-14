Content-Type: multipart/mixed; boundary="===============6294611605253928654=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [asahilinux:bits/120-spmi 1/4] drivers/spmi/spmi-apple-controller.c:54:22: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Sun, 14 Aug 2022 17:21:13 +0800
Message-ID: <202208141744.vKChGrMK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6294611605253928654==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/s=
pmi/spmi-apple-controller.c:54:22: warning: use of uninitialized value '<un=
known>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Jean-Francois Bortolotti" <jeff@borto.fr>
CC: Hector Martin <marcan@marcan.st>

tree:   https://github.com/AsahiLinux/linux bits/120-spmi
head:   0324791a3cdc3e93df57f6293e2cfaaadc264aeb
commit: 69860806b247b72cc354ca35ea147c2d1538ea85 [1/4] spmi: add a first ba=
sic spmi driver for Apple SoC
:::::: branch date: 12 days ago
:::::: commit date: 12 days ago
config: arm-randconfig-c002-20220804 (https://download.01.org/0day-ci/archi=
ve/20220814/202208141744.vKChGrMK-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/69860806b247b72cc354ca=
35ea147c2d1538ea85
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/120-spmi
        git checkout 69860806b247b72cc354ca35ea147c2d1538ea85
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   drivers/spmi/spmi-apple-controller.c: In function 'spmi_read_cmd':
>> drivers/spmi/spmi-apple-controller.c:54:22: warning: use of uninitialize=
d value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      54 |         volatile u32 status;
         |                      ^~~~~~
     'spmi_read_cmd': event 1
       |
       |   54 |         volatile u32 status;
       |      |                      ^~~~~~
       |      |                      |
       |      |                      (1) use of uninitialized value '<unkno=
wn>' here
       |
   drivers/spmi/spmi-apple-controller.c: In function 'spmi_write_cmd':
   drivers/spmi/spmi-apple-controller.c:98:22: warning: use of uninitialize=
d value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      98 |         volatile u32 rsp;
         |                      ^~~
     'spmi_write_cmd': event 1
       |
       |   98 |         volatile u32 rsp;
       |      |                      ^~~
       |      |                      |
       |      |                      (1) use of uninitialized value '<unkno=
wn>' here
       |

vim +54 drivers/spmi/spmi-apple-controller.c

69860806b247b7 Jean-Francois Bortolotti 2022-02-04  47  =

69860806b247b7 Jean-Francois Bortolotti 2022-02-04  48  static int spmi_rea=
d_cmd(struct spmi_controller *ctrl,
69860806b247b7 Jean-Francois Bortolotti 2022-02-04  49  			 u8 opc, u8 slav=
e_id, u16 slave_addr, u8 *__buf, size_t bc)
69860806b247b7 Jean-Francois Bortolotti 2022-02-04  50  {
69860806b247b7 Jean-Francois Bortolotti 2022-02-04  51  	struct apple_spmi =
*spmi;
69860806b247b7 Jean-Francois Bortolotti 2022-02-04  52  	u32 spmi_cmd =3D o=
pc|slave_id<<8|slave_addr<<16|(bc-1)|(1<<15);
69860806b247b7 Jean-Francois Bortolotti 2022-02-04  53  	u32 rsp;
69860806b247b7 Jean-Francois Bortolotti 2022-02-04 @54  	volatile u32 statu=
s;
69860806b247b7 Jean-Francois Bortolotti 2022-02-04  55  	size_t len_to_read;
69860806b247b7 Jean-Francois Bortolotti 2022-02-04  56  	u8 i;
69860806b247b7 Jean-Francois Bortolotti 2022-02-04  57  =

69860806b247b7 Jean-Francois Bortolotti 2022-02-04  58  	spmi =3D spmi_cont=
roller_get_drvdata(ctrl);
69860806b247b7 Jean-Francois Bortolotti 2022-02-04  59  =

69860806b247b7 Jean-Francois Bortolotti 2022-02-04  60  	write_reg(spmi_cmd=
, spmi, SPMI_CMD_REG);
69860806b247b7 Jean-Francois Bortolotti 2022-02-04  61  =

69860806b247b7 Jean-Francois Bortolotti 2022-02-04  62  	/* Wait for Rx FIF=
O to have something */
69860806b247b7 Jean-Francois Bortolotti 2022-02-04  63  	/* Quite ugly msle=
ep, need to find a better way to do it */
69860806b247b7 Jean-Francois Bortolotti 2022-02-04  64  	i=3D0;
69860806b247b7 Jean-Francois Bortolotti 2022-02-04  65  	do {
69860806b247b7 Jean-Francois Bortolotti 2022-02-04  66  		status=3Dread_reg=
(spmi, SPMI_STATUS_REG);
69860806b247b7 Jean-Francois Bortolotti 2022-02-04  67  		msleep(10);
69860806b247b7 Jean-Francois Bortolotti 2022-02-04  68  		i+=3D1;
69860806b247b7 Jean-Francois Bortolotti 2022-02-04  69  	} while ((status &=
 SPMI_RX_FIFO_EMPTY) && i<5);
69860806b247b7 Jean-Francois Bortolotti 2022-02-04  70  =

69860806b247b7 Jean-Francois Bortolotti 2022-02-04  71  	if(i>=3D5){
69860806b247b7 Jean-Francois Bortolotti 2022-02-04  72  		dev_err(&ctrl->de=
v,"spmi_read_cmd:took to long to get the status");
69860806b247b7 Jean-Francois Bortolotti 2022-02-04  73  		return -1;
69860806b247b7 Jean-Francois Bortolotti 2022-02-04  74  	}
69860806b247b7 Jean-Francois Bortolotti 2022-02-04  75  =

69860806b247b7 Jean-Francois Bortolotti 2022-02-04  76  	/* Read SPMI reply=
 status */
69860806b247b7 Jean-Francois Bortolotti 2022-02-04  77  	rsp=3Dread_reg(spm=
i, SPMI_RSP_REG);
69860806b247b7 Jean-Francois Bortolotti 2022-02-04  78  =

69860806b247b7 Jean-Francois Bortolotti 2022-02-04  79  	len_to_read =3D 0;
69860806b247b7 Jean-Francois Bortolotti 2022-02-04  80  	/* Read SPMI data =
reply */
69860806b247b7 Jean-Francois Bortolotti 2022-02-04  81      while (!( statu=
s & SPMI_RX_FIFO_EMPTY ) && (len_to_read < bc )) {
69860806b247b7 Jean-Francois Bortolotti 2022-02-04  82          rsp=3Dread_=
reg(spmi, SPMI_RSP_REG);
69860806b247b7 Jean-Francois Bortolotti 2022-02-04  83  		i=3D0;
69860806b247b7 Jean-Francois Bortolotti 2022-02-04  84  		while ((len_to_re=
ad<bc)&&(i<4)) {
69860806b247b7 Jean-Francois Bortolotti 2022-02-04  85  			__buf[len_to_rea=
d++]=3D((0xff<<(8*i))&rsp)>>(8*i);
69860806b247b7 Jean-Francois Bortolotti 2022-02-04  86  			 i+=3D1;
69860806b247b7 Jean-Francois Bortolotti 2022-02-04  87  		}
69860806b247b7 Jean-Francois Bortolotti 2022-02-04  88  	}
69860806b247b7 Jean-Francois Bortolotti 2022-02-04  89  =

69860806b247b7 Jean-Francois Bortolotti 2022-02-04  90  	return 0;
69860806b247b7 Jean-Francois Bortolotti 2022-02-04  91  }
69860806b247b7 Jean-Francois Bortolotti 2022-02-04  92  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6294611605253928654==--

