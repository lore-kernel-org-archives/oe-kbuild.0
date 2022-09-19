Content-Type: multipart/mixed; boundary="===============2133781714553562033=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/dsa/qca/qca8k-common.c:144:13: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Mon, 19 Sep 2022 13:59:48 +0800
Message-ID: <202209191320.7VaphCTX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2133781714553562033==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/n=
et/dsa/qca/qca8k-common.c:144:13: warning: use of uninitialized value '<unk=
nown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Christian Marangi <ansuelsmth@gmail.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Vladimir Oltean <olteanv@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   521a547ced6477c54b4b0cc206000406c221b4d6
commit: fce1ec0c4e2d03d9c62ffc615a42bdba78eb4c14 net: dsa: qca8k: move mib =
init function to common code
date:   7 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 7 weeks ago
config: arm-randconfig-c002-20220917 (https://download.01.org/0day-ci/archi=
ve/20220919/202209191320.7VaphCTX-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dfce1ec0c4e2d03d9c62ffc615a42bdba78eb4c14
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout fce1ec0c4e2d03d9c62ffc615a42bdba78eb4c14
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
   drivers/net/dsa/qca/qca8k-common.c: In function 'qca8k_busy_wait':
>> drivers/net/dsa/qca/qca8k-common.c:144:13: warning: use of uninitialized=
 value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     144 |         u32 val;
         |             ^~~
     'qca8k_busy_wait': event 1
       |
       |  144 |         u32 val;
       |      |             ^~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |

vim +144 drivers/net/dsa/qca/qca8k-common.c

fce1ec0c4e2d03 Christian Marangi 2022-07-27  141  =

fce1ec0c4e2d03 Christian Marangi 2022-07-27  142  int qca8k_busy_wait(struc=
t qca8k_priv *priv, u32 reg, u32 mask)
fce1ec0c4e2d03 Christian Marangi 2022-07-27  143  {
fce1ec0c4e2d03 Christian Marangi 2022-07-27 @144  	u32 val;
fce1ec0c4e2d03 Christian Marangi 2022-07-27  145  =

fce1ec0c4e2d03 Christian Marangi 2022-07-27  146  	return regmap_read_poll_=
timeout(priv->regmap, reg, val, !(val & mask), 0,
fce1ec0c4e2d03 Christian Marangi 2022-07-27  147  				       QCA8K_BUSY_WAI=
T_TIMEOUT * USEC_PER_MSEC);
fce1ec0c4e2d03 Christian Marangi 2022-07-27  148  }
fce1ec0c4e2d03 Christian Marangi 2022-07-27  149  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2133781714553562033==--

