Content-Type: multipart/mixed; boundary="===============1641712257731918494=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/can/spi/mcp251xfd/mcp251xfd-ring.c:26:16: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Sat, 17 Sep 2022 13:48:48 +0800
Message-ID: <202209171319.x5ZywRMh-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1641712257731918494==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/n=
et/can/spi/mcp251xfd/mcp251xfd-ring.c:26:16: warning: use of uninitialized =
value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Marc Kleine-Budde" <mkl@pengutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a335366bad1364a07f49df9da1fdfa6d411a5f39
commit: 55bc37c85587d0c53a666a685a49752e28a31396 can: mcp251xfd: move ring =
init into separate function
date:   8 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 8 months ago
config: arm-randconfig-c002-20220915 (https://download.01.org/0day-ci/archi=
ve/20220917/202209171319.x5ZywRMh-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D55bc37c85587d0c53a666a685a49752e28a31396
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 55bc37c85587d0c53a666a685a49752e28a31396
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
   drivers/net/can/spi/mcp251xfd/mcp251xfd-ring.c: In function 'mcp251xfd_c=
md_prepare_write_reg':
>> drivers/net/can/spi/mcp251xfd/mcp251xfd-ring.c:26:16: warning: use of un=
initialized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-va=
lue]
      26 |         __le32 val_le32;
         |                ^~~~~~~~
     'mcp251xfd_cmd_prepare_write_reg': event 1
       |
       |   26 |         __le32 val_le32;
       |      |                ^~~~~~~~
       |      |                |
       |      |                (1) use of uninitialized value '<unknown>' h=
ere
       |

vim +26 drivers/net/can/spi/mcp251xfd/mcp251xfd-ring.c

55bc37c85587d0 Marc Kleine-Budde 2021-05-21  18  =

55bc37c85587d0 Marc Kleine-Budde 2021-05-21  19  static inline u8
55bc37c85587d0 Marc Kleine-Budde 2021-05-21  20  mcp251xfd_cmd_prepare_writ=
e_reg(const struct mcp251xfd_priv *priv,
55bc37c85587d0 Marc Kleine-Budde 2021-05-21  21  				union mcp251xfd_write_=
reg_buf *write_reg_buf,
55bc37c85587d0 Marc Kleine-Budde 2021-05-21  22  				const u16 reg, const u=
32 mask, const u32 val)
55bc37c85587d0 Marc Kleine-Budde 2021-05-21  23  {
55bc37c85587d0 Marc Kleine-Budde 2021-05-21  24  	u8 first_byte, last_byte,=
 len;
55bc37c85587d0 Marc Kleine-Budde 2021-05-21  25  	u8 *data;
55bc37c85587d0 Marc Kleine-Budde 2021-05-21 @26  	__le32 val_le32;
55bc37c85587d0 Marc Kleine-Budde 2021-05-21  27  =

55bc37c85587d0 Marc Kleine-Budde 2021-05-21  28  	first_byte =3D mcp251xfd_=
first_byte_set(mask);
55bc37c85587d0 Marc Kleine-Budde 2021-05-21  29  	last_byte =3D mcp251xfd_l=
ast_byte_set(mask);
55bc37c85587d0 Marc Kleine-Budde 2021-05-21  30  	len =3D last_byte - first=
_byte + 1;
55bc37c85587d0 Marc Kleine-Budde 2021-05-21  31  =

55bc37c85587d0 Marc Kleine-Budde 2021-05-21  32  	data =3D mcp251xfd_spi_cm=
d_write(priv, write_reg_buf, reg + first_byte);
55bc37c85587d0 Marc Kleine-Budde 2021-05-21  33  	val_le32 =3D cpu_to_le32(=
val >> BITS_PER_BYTE * first_byte);
55bc37c85587d0 Marc Kleine-Budde 2021-05-21  34  	memcpy(data, &val_le32, l=
en);
55bc37c85587d0 Marc Kleine-Budde 2021-05-21  35  =

55bc37c85587d0 Marc Kleine-Budde 2021-05-21  36  	if (priv->devtype_data.qu=
irks & MCP251XFD_QUIRK_CRC_REG) {
55bc37c85587d0 Marc Kleine-Budde 2021-05-21  37  		u16 crc;
55bc37c85587d0 Marc Kleine-Budde 2021-05-21  38  =

55bc37c85587d0 Marc Kleine-Budde 2021-05-21  39  		mcp251xfd_spi_cmd_crc_se=
t_len_in_reg(&write_reg_buf->crc.cmd,
55bc37c85587d0 Marc Kleine-Budde 2021-05-21  40  						     len);
55bc37c85587d0 Marc Kleine-Budde 2021-05-21  41  		/* CRC */
55bc37c85587d0 Marc Kleine-Budde 2021-05-21  42  		len +=3D sizeof(write_re=
g_buf->crc.cmd);
55bc37c85587d0 Marc Kleine-Budde 2021-05-21  43  		crc =3D mcp251xfd_crc16_=
compute(&write_reg_buf->crc, len);
55bc37c85587d0 Marc Kleine-Budde 2021-05-21  44  		put_unaligned_be16(crc, =
(void *)write_reg_buf + len);
55bc37c85587d0 Marc Kleine-Budde 2021-05-21  45  =

55bc37c85587d0 Marc Kleine-Budde 2021-05-21  46  		/* Total length */
55bc37c85587d0 Marc Kleine-Budde 2021-05-21  47  		len +=3D sizeof(write_re=
g_buf->crc.crc);
55bc37c85587d0 Marc Kleine-Budde 2021-05-21  48  	} else {
55bc37c85587d0 Marc Kleine-Budde 2021-05-21  49  		len +=3D sizeof(write_re=
g_buf->nocrc.cmd);
55bc37c85587d0 Marc Kleine-Budde 2021-05-21  50  	}
55bc37c85587d0 Marc Kleine-Budde 2021-05-21  51  =

55bc37c85587d0 Marc Kleine-Budde 2021-05-21  52  	return len;
55bc37c85587d0 Marc Kleine-Budde 2021-05-21  53  }
55bc37c85587d0 Marc Kleine-Budde 2021-05-21  54  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1641712257731918494==--

