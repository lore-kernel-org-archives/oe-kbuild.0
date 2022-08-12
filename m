Content-Type: multipart/mixed; boundary="===============4581055682284054261=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/mediatek/common/mtk-btcvsd.c:365:13: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Fri, 12 Aug 2022 13:27:15 +0800
Message-ID: <202208121317.oFHtKLbM-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4581055682284054261==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 sound/soc/mediatek/common/mtk-btcvsd.c:365:13: warning: use of uninitializ=
ed value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Trevor Wu <trevor.wu@mediatek.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   7ebfc85e2cd7b08f518b526173e9a33b56b3913b
commit: 6746cc858259985a945a07075a19ec4d24352407 ASoC: mediatek: mt8195: ad=
d platform driver
date:   12 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 12 months ago
config: arm-randconfig-c002-20220810 (https://download.01.org/0day-ci/archi=
ve/20220812/202208121317.oFHtKLbM-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D6746cc858259985a945a07075a19ec4d24352407
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 6746cc858259985a945a07075a19ec4d24352407
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   sound/soc/mediatek/common/mtk-btcvsd.c: In function 'mtk_btcvsd_read_fro=
m_bt':
>> sound/soc/mediatek/common/mtk-btcvsd.c:365:13: warning: use of uninitial=
ized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     365 |         int pv;
         |             ^~
     'mtk_btcvsd_snd_irq_handler': events 1-12
       |
       |  481 | static irqreturn_t mtk_btcvsd_snd_irq_handler(int irq_id, v=
oid *dev)
       |      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                    |
       |      |                    (1) entry to 'mtk_btcvsd_snd_irq_handler'
       |......
       |  500 |         if (((control >> 31) & 1) =3D=3D 0) {
       |      |            ~        =

       |      |            |
       |      |            (2) following 'false' branch...
       |......
       |  506 |         if (packet_type >=3D BT_SCO_CVSD_MAX) {
       |      |            ~        =

       |      |            |
       |      |            (3) ...to here
       |      |            (4) following 'false' branch (when 'packet_type =
<=3D 5')...
       |......
       |  512 |         packet_length =3D btsco_packet_info[packet_type][0];
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                       |
       |      |                       (5) ...to here
       |......
       |  553 |         if (bt->rx->state =3D=3D BT_SCO_STATE_RUNNING ||
       |      |            ~        =

       |      |            |
       |      |            (6) following 'true' branch...
       |  554 |             bt->rx->state =3D=3D BT_SCO_STATE_ENDING) {
       |  555 |                 if (bt->rx->xrun) {
       |      |                     ~~
       |      |                     |
       |      |                     (7) ...to here
       |......
       |  568 |                 if (!bt->rx->xrun &&
       |      |                    ~~~~~~~~~~~~~~~~~
       |      |                    |              |
       |      |                    |              (10) following 'true' bra=
nch...
       |      |                    (8) following 'true' branch...
       |  569 |                     (bt->rx->packet_w - bt->rx->packet_r <=
=3D
       |      |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                            |
       |      |                            (9) ...to here
       |  570 |                      SCO_RX_PACKER_BUF_NUM - buf_cnt_rx)) {
       |      |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |  571 |                         mtk_btcvsd_read_from_bt(bt,
       |      |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                         |
       |      |                         (11) ...to here
       |      |                         (12) calling 'mtk_btcvsd_read_from_=
bt' from 'mtk_btcvsd_snd_irq_handler'
       |  572 |                                                 packet_type,
       |      |                                                 ~~~~~~~~~~~~
       |  573 |                                                 packet_leng=
th,
       |      |                                                 ~~~~~~~~~~~=
~~~
       |  574 |                                                 packet_num,
       |      |                                                 ~~~~~~~~~~~
       |  575 |                                                 buf_cnt_rx,
       |      |                                                 ~~~~~~~~~~~
       |  576 |                                                 control);
       |      |                                                 ~~~~~~~~
       |
       +--> 'mtk_btcvsd_read_from_bt': events 13-14
              |
              |  357 | static int mtk_btcvsd_read_from_bt(struct mtk_btcvsd=
_snd *bt,
              |      |            ^~~~~~~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (13) entry to 'mtk_btcvsd_read_from_bt'
              |......
              |  365 |         int pv;
              |      |             ~~
              |      |             |
              |      |             (14) use of uninitialized value '<unknow=
n>' here
              |

vim +365 sound/soc/mediatek/common/mtk-btcvsd.c

4bd8597dc36c37 KaiChieh Chuang 2019-01-30  356  =

4bd8597dc36c37 KaiChieh Chuang 2019-01-30  357  static int mtk_btcvsd_read_=
from_bt(struct mtk_btcvsd_snd *bt,
4bd8597dc36c37 KaiChieh Chuang 2019-01-30  358  				   enum bt_sco_packet_l=
en packet_type,
4bd8597dc36c37 KaiChieh Chuang 2019-01-30  359  				   unsigned int packet_=
length,
4bd8597dc36c37 KaiChieh Chuang 2019-01-30  360  				   unsigned int packet_=
num,
4bd8597dc36c37 KaiChieh Chuang 2019-01-30  361  				   unsigned int blk_siz=
e,
4bd8597dc36c37 KaiChieh Chuang 2019-01-30  362  				   unsigned int control)
4bd8597dc36c37 KaiChieh Chuang 2019-01-30  363  {
4bd8597dc36c37 KaiChieh Chuang 2019-01-30  364  	unsigned int i;
4bd8597dc36c37 KaiChieh Chuang 2019-01-30 @365  	int pv;
4bd8597dc36c37 KaiChieh Chuang 2019-01-30  366  	u8 *src;
4bd8597dc36c37 KaiChieh Chuang 2019-01-30  367  	unsigned int packet_buf_of=
s;
4bd8597dc36c37 KaiChieh Chuang 2019-01-30  368  	unsigned long flags;
4bd8597dc36c37 KaiChieh Chuang 2019-01-30  369  	unsigned long connsys_addr=
_rx, ap_addr_rx;
4bd8597dc36c37 KaiChieh Chuang 2019-01-30  370  =

4bd8597dc36c37 KaiChieh Chuang 2019-01-30  371  	connsys_addr_rx =3D *bt->b=
t_reg_pkt_r;
4bd8597dc36c37 KaiChieh Chuang 2019-01-30  372  	ap_addr_rx =3D (unsigned l=
ong)bt->bt_sram_bank2_base +
4bd8597dc36c37 KaiChieh Chuang 2019-01-30  373  		     (connsys_addr_rx & 0=
xFFFF);
4bd8597dc36c37 KaiChieh Chuang 2019-01-30  374  =

4bd8597dc36c37 KaiChieh Chuang 2019-01-30  375  	if (connsys_addr_rx =3D=3D=
 0xdeadfeed) {
4bd8597dc36c37 KaiChieh Chuang 2019-01-30  376  		/* bt return 0xdeadfeed i=
f read register during bt sleep */
4bd8597dc36c37 KaiChieh Chuang 2019-01-30  377  		dev_warn(bt->dev, "%s(), =
connsys_addr_rx =3D=3D 0xdeadfeed",
4bd8597dc36c37 KaiChieh Chuang 2019-01-30  378  			 __func__);
4bd8597dc36c37 KaiChieh Chuang 2019-01-30  379  		return -EIO;
4bd8597dc36c37 KaiChieh Chuang 2019-01-30  380  	}
4bd8597dc36c37 KaiChieh Chuang 2019-01-30  381  =

4bd8597dc36c37 KaiChieh Chuang 2019-01-30  382  	src =3D (u8 *)ap_addr_rx;
4bd8597dc36c37 KaiChieh Chuang 2019-01-30  383  =

4bd8597dc36c37 KaiChieh Chuang 2019-01-30  384  	mtk_btcvsd_snd_data_transf=
er(BT_SCO_DIRECT_BT2ARM, src,
4bd8597dc36c37 KaiChieh Chuang 2019-01-30  385  				     bt->rx->temp_packe=
t_buf, packet_length,
4bd8597dc36c37 KaiChieh Chuang 2019-01-30  386  				     packet_num);
4bd8597dc36c37 KaiChieh Chuang 2019-01-30  387  =

4bd8597dc36c37 KaiChieh Chuang 2019-01-30  388  	spin_lock_irqsave(&bt->rx_=
lock, flags);
4bd8597dc36c37 KaiChieh Chuang 2019-01-30  389  	for (i =3D 0; i < blk_size=
; i++) {
4bd8597dc36c37 KaiChieh Chuang 2019-01-30  390  		packet_buf_ofs =3D (bt->r=
x->packet_w & SCO_RX_PACKET_MASK) *
4bd8597dc36c37 KaiChieh Chuang 2019-01-30  391  				 bt->rx->packet_size;
4bd8597dc36c37 KaiChieh Chuang 2019-01-30  392  		memcpy(bt->rx_packet_buf =
+ packet_buf_ofs,
4bd8597dc36c37 KaiChieh Chuang 2019-01-30  393  		       bt->rx->temp_packe=
t_buf + (SCO_RX_PLC_SIZE * i),
4bd8597dc36c37 KaiChieh Chuang 2019-01-30  394  		       SCO_RX_PLC_SIZE);
4bd8597dc36c37 KaiChieh Chuang 2019-01-30  395  		if ((control & btsco_pack=
et_valid_mask[packet_type][i]) =3D=3D
4bd8597dc36c37 KaiChieh Chuang 2019-01-30  396  		    btsco_packet_valid_ma=
sk[packet_type][i])
4bd8597dc36c37 KaiChieh Chuang 2019-01-30  397  			pv =3D 1;
4bd8597dc36c37 KaiChieh Chuang 2019-01-30  398  		else
4bd8597dc36c37 KaiChieh Chuang 2019-01-30  399  			pv =3D 0;
4bd8597dc36c37 KaiChieh Chuang 2019-01-30  400  =

4bd8597dc36c37 KaiChieh Chuang 2019-01-30  401  		packet_buf_ofs +=3D SCO_R=
X_PLC_SIZE;
4bd8597dc36c37 KaiChieh Chuang 2019-01-30  402  		memcpy(bt->rx_packet_buf =
+ packet_buf_ofs, (void *)&pv,
4bd8597dc36c37 KaiChieh Chuang 2019-01-30  403  		       SCO_CVSD_PACKET_VA=
LID_SIZE);
4bd8597dc36c37 KaiChieh Chuang 2019-01-30  404  		bt->rx->packet_w++;
4bd8597dc36c37 KaiChieh Chuang 2019-01-30  405  	}
4bd8597dc36c37 KaiChieh Chuang 2019-01-30  406  	spin_unlock_irqrestore(&bt=
->rx_lock, flags);
4bd8597dc36c37 KaiChieh Chuang 2019-01-30  407  	return 0;
4bd8597dc36c37 KaiChieh Chuang 2019-01-30  408  }
4bd8597dc36c37 KaiChieh Chuang 2019-01-30  409  =


:::::: The code at line 365 was first introduced by commit
:::::: 4bd8597dc36c376a2bb1ef2c72984615bdeb68de ASoC: mediatek: add btcvsd =
driver

:::::: TO: KaiChieh Chuang <kaichieh.chuang@mediatek.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4581055682284054261==--

