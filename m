Content-Type: multipart/mixed; boundary="===============0152430287172584463=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c:111:9: sparse: sparse: dubious: x | !y
Date: Sun, 27 Feb 2022 23:06:07 +0800
Message-ID: <202202272257.EuISAkAQ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0152430287172584463==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Shayne Chen <shayne.chen@mediatek.com>
CC: Felix Fietkau <nbd@nbd.name>
CC: Ryder Lee <ryder.lee@mediatek.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2293be58d6a18cab800e25e42081bacb75c05752
commit: 90f5daea758abcc4722f4304ed5fccbbc80a59c2 mt76: mt7915: add debugfs =
knobs for MCU utilization
date:   4 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 4 months ago
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20220227=
/202202272257.EuISAkAQ-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D90f5daea758abcc4722f4304ed5fccbbc80a59c2
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 90f5daea758abcc4722f4304ed5fccbbc80a59c2
        # save the config file to linux build tree
        mkdir build_dir
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Di386 SHELL=3D/bin/bash drivers/net/wireless/mediatek/mt76/=
mt7915/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c:111:9: sparse: spars=
e: dubious: x | !y

vim +111 drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c

e57b7901469fc0 Ryder Lee   2020-04-25   80  =

e57b7901469fc0 Ryder Lee   2020-04-25   81  DEFINE_DEBUGFS_ATTRIBUTE(fops_r=
adar_trigger, NULL,
e57b7901469fc0 Ryder Lee   2020-04-25   82  			 mt7915_radar_trigger, "%lld=
\n");
e57b7901469fc0 Ryder Lee   2020-04-25   83  =

5517f78b0063d0 Ryder Lee   2020-04-25   84  static int
9b121acd4e853c Shayne Chen 2021-10-22   85  mt7915_fw_debug_wm_set(void *da=
ta, u64 val)
5517f78b0063d0 Ryder Lee   2020-04-25   86  {
5517f78b0063d0 Ryder Lee   2020-04-25   87  	struct mt7915_dev *dev =3D dat=
a;
5517f78b0063d0 Ryder Lee   2020-04-25   88  	enum {
5517f78b0063d0 Ryder Lee   2020-04-25   89  		DEBUG_TXCMD =3D 62,
5517f78b0063d0 Ryder Lee   2020-04-25   90  		DEBUG_CMD_RPT_TX,
5517f78b0063d0 Ryder Lee   2020-04-25   91  		DEBUG_CMD_RPT_TRIG,
5517f78b0063d0 Ryder Lee   2020-04-25   92  		DEBUG_SPL,
5517f78b0063d0 Ryder Lee   2020-04-25   93  		DEBUG_RPT_RX,
5517f78b0063d0 Ryder Lee   2020-04-25   94  	} debug;
9b121acd4e853c Shayne Chen 2021-10-22   95  	int ret;
5517f78b0063d0 Ryder Lee   2020-04-25   96  =

9b121acd4e853c Shayne Chen 2021-10-22   97  	dev->fw_debug_wm =3D val ? MCU=
_FW_LOG_TO_HOST : 0;
5517f78b0063d0 Ryder Lee   2020-04-25   98  =

9b121acd4e853c Shayne Chen 2021-10-22   99  	ret =3D mt7915_mcu_fw_log_2_ho=
st(dev, MCU_FW_LOG_WM, dev->fw_debug_wm);
9b121acd4e853c Shayne Chen 2021-10-22  100  	if (ret)
9b121acd4e853c Shayne Chen 2021-10-22  101  		return ret;
5517f78b0063d0 Ryder Lee   2020-04-25  102  =

9b121acd4e853c Shayne Chen 2021-10-22  103  	for (debug =3D DEBUG_TXCMD; de=
bug <=3D DEBUG_RPT_RX; debug++) {
9b121acd4e853c Shayne Chen 2021-10-22  104  		ret =3D mt7915_mcu_fw_dbg_ctr=
l(dev, debug, !!dev->fw_debug_wm);
9b121acd4e853c Shayne Chen 2021-10-22  105  		if (ret)
9b121acd4e853c Shayne Chen 2021-10-22  106  			return ret;
9b121acd4e853c Shayne Chen 2021-10-22  107  	}
5517f78b0063d0 Ryder Lee   2020-04-25  108  =

90f5daea758abc Shayne Chen 2021-10-22  109  	/* WM CPU info record control =
*/
90f5daea758abc Shayne Chen 2021-10-22  110  	mt76_clear(dev, MT_CPU_UTIL_CT=
RL, BIT(0));
90f5daea758abc Shayne Chen 2021-10-22 @111  	mt76_wr(dev, MT_DIC_CMD_REG_CM=
D, BIT(2) | BIT(13) | !dev->fw_debug_wm);
90f5daea758abc Shayne Chen 2021-10-22  112  	mt76_wr(dev, MT_MCU_WM_CIRQ_IR=
Q_MASK_CLR_ADDR, BIT(5));
90f5daea758abc Shayne Chen 2021-10-22  113  	mt76_wr(dev, MT_MCU_WM_CIRQ_IR=
Q_SOFT_ADDR, BIT(5));
90f5daea758abc Shayne Chen 2021-10-22  114  =

5517f78b0063d0 Ryder Lee   2020-04-25  115  	return 0;
5517f78b0063d0 Ryder Lee   2020-04-25  116  }
5517f78b0063d0 Ryder Lee   2020-04-25  117  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0152430287172584463==--

