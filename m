Content-Type: multipart/mixed; boundary="===============9058280527699614098=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/bcm/bcm63xx-i2s-whistler.c:161:24: warning: Shifting signed 32-bit value by 31 bits is undefined behaviour
Date: Fri, 29 Jan 2021 11:46:29 +0800
Message-ID: <202101291124.tGEf1hB4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9058280527699614098==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kevin Li <kevin-ke.li@broadcom.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   909b447dcc45db2f9bd5f495f1d16c419812e6df
commit: 88eb404ccc3efd300fb6fb6a9f8c99c1d5db3747 ASoC: brcm: Add DSL/PON So=
C audio driver
date:   11 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 11 months ago
compiler: hppa-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"cppcheck warnings: (new ones prefixed by >>)"
>> sound/soc/codecs/wm8962.c:2787:25: warning: Uninitialized variable: frat=
io [uninitvar]
    fll_div->n =3D target / (fratio * Fref);
                           ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> sound/soc/bcm/bcm63xx-i2s-whistler.c:161:24: warning: Shifting signed 32=
-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
      enabled =3D enabled & I2S_RX_ENABLE_MASK;
                          ^
   sound/soc/bcm/bcm63xx-i2s-whistler.c:182:24: warning: Shifting signed 32=
-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
      enabled =3D enabled & I2S_TX_ENABLE_MASK;
                          ^
--
>> sound/soc/codecs/rt5670.c:2490:61: warning: Boolean result is used in bi=
twise operation. Clarify expression with parentheses. [clarifyCondition]
     (pll_code.m_bp ? 0 : pll_code.m_code) << RT5670_PLL_M_SFT |
                                                               ^

vim +161 sound/soc/bcm/bcm63xx-i2s-whistler.c

88eb404ccc3efd Kevin Li 2020-03-12  141  =

88eb404ccc3efd Kevin Li 2020-03-12  142  static void bcm63xx_i2s_shutdown(s=
truct snd_pcm_substream *substream,
88eb404ccc3efd Kevin Li 2020-03-12  143  				struct snd_soc_dai *dai)
88eb404ccc3efd Kevin Li 2020-03-12  144  {
88eb404ccc3efd Kevin Li 2020-03-12  145  	unsigned int enabled, slavemode;
88eb404ccc3efd Kevin Li 2020-03-12  146  	struct bcm_i2s_priv *i2s_priv =3D=
 snd_soc_dai_get_drvdata(dai);
88eb404ccc3efd Kevin Li 2020-03-12  147  	struct regmap *regmap_i2s =3D i2s=
_priv->regmap_i2s;
88eb404ccc3efd Kevin Li 2020-03-12  148  =

88eb404ccc3efd Kevin Li 2020-03-12  149  	if (substream->stream =3D=3D SNDR=
V_PCM_STREAM_PLAYBACK) {
88eb404ccc3efd Kevin Li 2020-03-12  150  		regmap_update_bits(regmap_i2s, I=
2S_TX_CFG,
88eb404ccc3efd Kevin Li 2020-03-12  151  				   I2S_TX_OUT_R | I2S_TX_DATA_=
ALIGNMENT |
88eb404ccc3efd Kevin Li 2020-03-12  152  				   I2S_TX_DATA_ENABLE | I2S_TX=
_CLOCK_ENABLE, 0);
88eb404ccc3efd Kevin Li 2020-03-12  153  		regmap_write(regmap_i2s, I2S_TX_=
IRQ_CTL, 1);
88eb404ccc3efd Kevin Li 2020-03-12  154  		regmap_write(regmap_i2s, I2S_TX_=
IRQ_IFF_THLD, 4);
88eb404ccc3efd Kevin Li 2020-03-12  155  		regmap_write(regmap_i2s, I2S_TX_=
IRQ_OFF_THLD, 4);
88eb404ccc3efd Kevin Li 2020-03-12  156  =

88eb404ccc3efd Kevin Li 2020-03-12  157  		regmap_read(regmap_i2s, I2S_TX_C=
FG_2, &slavemode);
88eb404ccc3efd Kevin Li 2020-03-12  158  		slavemode =3D slavemode & I2S_TX=
_SLAVE_MODE_MASK;
88eb404ccc3efd Kevin Li 2020-03-12  159  		if (!slavemode) {
88eb404ccc3efd Kevin Li 2020-03-12  160  			regmap_read(regmap_i2s, I2S_RX_=
CFG, &enabled);
88eb404ccc3efd Kevin Li 2020-03-12 @161  			enabled =3D enabled & I2S_RX_EN=
ABLE_MASK;
88eb404ccc3efd Kevin Li 2020-03-12  162  			if (enabled)
88eb404ccc3efd Kevin Li 2020-03-12  163  				regmap_update_bits(regmap_i2s,=
 I2S_RX_CFG_2,
88eb404ccc3efd Kevin Li 2020-03-12  164  						   I2S_RX_SLAVE_MODE_MASK,
88eb404ccc3efd Kevin Li 2020-03-12  165  						   I2S_RX_MASTER_MODE);
88eb404ccc3efd Kevin Li 2020-03-12  166  		}
88eb404ccc3efd Kevin Li 2020-03-12  167  		regmap_update_bits(regmap_i2s, I=
2S_TX_CFG_2,
88eb404ccc3efd Kevin Li 2020-03-12  168  				   I2S_TX_SLAVE_MODE_MASK,
88eb404ccc3efd Kevin Li 2020-03-12  169  				   I2S_TX_SLAVE_MODE);
88eb404ccc3efd Kevin Li 2020-03-12  170  	} else {
88eb404ccc3efd Kevin Li 2020-03-12  171  		regmap_update_bits(regmap_i2s, I=
2S_RX_CFG,
88eb404ccc3efd Kevin Li 2020-03-12  172  				   I2S_RX_IN_R | I2S_RX_DATA_A=
LIGNMENT |
88eb404ccc3efd Kevin Li 2020-03-12  173  				   I2S_RX_CLOCK_ENABLE, 0);
88eb404ccc3efd Kevin Li 2020-03-12  174  		regmap_write(regmap_i2s, I2S_RX_=
IRQ_CTL, 1);
88eb404ccc3efd Kevin Li 2020-03-12  175  		regmap_write(regmap_i2s, I2S_RX_=
IRQ_IFF_THLD, 4);
88eb404ccc3efd Kevin Li 2020-03-12  176  		regmap_write(regmap_i2s, I2S_RX_=
IRQ_OFF_THLD, 4);
88eb404ccc3efd Kevin Li 2020-03-12  177  =

88eb404ccc3efd Kevin Li 2020-03-12  178  		regmap_read(regmap_i2s, I2S_RX_C=
FG_2, &slavemode);
88eb404ccc3efd Kevin Li 2020-03-12  179  		slavemode =3D slavemode & I2S_RX=
_SLAVE_MODE_MASK;
88eb404ccc3efd Kevin Li 2020-03-12  180  		if (!slavemode) {
88eb404ccc3efd Kevin Li 2020-03-12  181  			regmap_read(regmap_i2s, I2S_TX_=
CFG, &enabled);
88eb404ccc3efd Kevin Li 2020-03-12  182  			enabled =3D enabled & I2S_TX_EN=
ABLE_MASK;
88eb404ccc3efd Kevin Li 2020-03-12  183  			if (enabled)
88eb404ccc3efd Kevin Li 2020-03-12  184  				regmap_update_bits(regmap_i2s,=
 I2S_TX_CFG_2,
88eb404ccc3efd Kevin Li 2020-03-12  185  						   I2S_TX_SLAVE_MODE_MASK,
88eb404ccc3efd Kevin Li 2020-03-12  186  						   I2S_TX_MASTER_MODE);
88eb404ccc3efd Kevin Li 2020-03-12  187  		}
88eb404ccc3efd Kevin Li 2020-03-12  188  =

88eb404ccc3efd Kevin Li 2020-03-12  189  		regmap_update_bits(regmap_i2s, I=
2S_RX_CFG_2,
88eb404ccc3efd Kevin Li 2020-03-12  190  				   I2S_RX_SLAVE_MODE_MASK, I2S=
_RX_SLAVE_MODE);
88eb404ccc3efd Kevin Li 2020-03-12  191  	}
88eb404ccc3efd Kevin Li 2020-03-12  192  }
88eb404ccc3efd Kevin Li 2020-03-12  193  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============9058280527699614098==--

