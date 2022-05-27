Content-Type: multipart/mixed; boundary="===============3273580280443723578=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC Patch net-next 16/17] net: dsa: microchip: common menuconfig for ksz series switch
Date: Sat, 28 May 2022 01:31:34 +0800
Message-ID: <202205280108.8yPGJiIw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3273580280443723578==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220527070358.25490-17-arun.ramadoss@microchip.com>
References: <20220527070358.25490-17-arun.ramadoss@microchip.com>
TO: Arun Ramadoss <arun.ramadoss@microchip.com>

Hi Arun,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on 7e062cda7d90543ac8c7700fc7c5527d0c0f22ad]

url:    https://github.com/intel-lab-lkp/linux/commits/Arun-Ramadoss/net-ds=
a-microchip-common-spi-probe-for-the-ksz-series-switches/20220527-151312
base:   7e062cda7d90543ac8c7700fc7c5527d0c0f22ad
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: arc-randconfig-m031-20220524 (https://download.01.org/0day-ci/archi=
ve/20220528/202205280108.8yPGJiIw-lkp(a)intel.com/config)
compiler: arceb-elf-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/dsa/microchip/ksz_common.c:997 ksz_get_tag_protocol() error: un=
initialized symbol 'proto'.

Old smatch warnings:
drivers/net/dsa/microchip/ksz_common.c:1301 ksz_switch_register() warn: pot=
entially one past the end of array 'dev->ports[port_num]'

vim +/proto +997 drivers/net/dsa/microchip/ksz_common.c

de6dd626d7082e Arun Ramadoss 2022-04-24  975  =

938d6d9b67a7d7 Arun Ramadoss 2022-05-27  976  static enum dsa_tag_protocol =
ksz_get_tag_protocol(struct dsa_switch *ds,
938d6d9b67a7d7 Arun Ramadoss 2022-05-27  977  						  int port,
938d6d9b67a7d7 Arun Ramadoss 2022-05-27  978  						  enum dsa_tag_protocol=
 mp)
f973a9285b661c Arun Ramadoss 2022-05-27  979  {
f973a9285b661c Arun Ramadoss 2022-05-27  980  	struct ksz_device *dev =3D d=
s->priv;
f973a9285b661c Arun Ramadoss 2022-05-27  981  	enum dsa_tag_protocol proto;
f973a9285b661c Arun Ramadoss 2022-05-27  982  =

f973a9285b661c Arun Ramadoss 2022-05-27  983  	if (dev->chip_id =3D=3D KSZ8=
795_CHIP_ID ||
f973a9285b661c Arun Ramadoss 2022-05-27  984  	    dev->chip_id =3D=3D KSZ8=
794_CHIP_ID ||
f973a9285b661c Arun Ramadoss 2022-05-27  985  	    dev->chip_id =3D=3D KSZ8=
765_CHIP_ID)
f973a9285b661c Arun Ramadoss 2022-05-27  986  		proto =3D DSA_TAG_PROTO_KSZ=
8795;
f973a9285b661c Arun Ramadoss 2022-05-27  987  =

f973a9285b661c Arun Ramadoss 2022-05-27  988  	if (dev->chip_id =3D=3D KSZ8=
830_CHIP_ID ||
f973a9285b661c Arun Ramadoss 2022-05-27  989  	    dev->chip_id =3D=3D KSZ9=
893_CHIP_ID)
f973a9285b661c Arun Ramadoss 2022-05-27  990  		proto =3D DSA_TAG_PROTO_KSZ=
9893;
f973a9285b661c Arun Ramadoss 2022-05-27  991  =

f973a9285b661c Arun Ramadoss 2022-05-27  992  	if (dev->chip_id =3D=3D KSZ9=
477_CHIP_ID ||
f973a9285b661c Arun Ramadoss 2022-05-27  993  	    dev->chip_id =3D=3D KSZ9=
897_CHIP_ID ||
f973a9285b661c Arun Ramadoss 2022-05-27  994  	    dev->chip_id =3D=3D KSZ9=
567_CHIP_ID)
f973a9285b661c Arun Ramadoss 2022-05-27  995  		proto =3D DSA_TAG_PROTO_KSZ=
9477;
f973a9285b661c Arun Ramadoss 2022-05-27  996  =

f973a9285b661c Arun Ramadoss 2022-05-27 @997  	return proto;
f973a9285b661c Arun Ramadoss 2022-05-27  998  }
f973a9285b661c Arun Ramadoss 2022-05-27  999  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3273580280443723578==--

