Content-Type: multipart/mixed; boundary="===============2122298747699460615=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v10 1/2] fpga: lattice-sysconfig-spi: add Lattice sysCONFIG FPGA manager
Date: Wed, 07 Sep 2022 17:15:52 +0800
Message-ID: <202209071750.XXAMXVEr-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2122298747699460615==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220905133205.17039-2-i.bornyakov@metrotek.ru>
References: <20220905133205.17039-2-i.bornyakov@metrotek.ru>
TO: Ivan Bornyakov <i.bornyakov@metrotek.ru>
TO: mdf(a)kernel.org
TO: hao.wu(a)intel.com
TO: yilun.xu(a)intel.com
TO: trix(a)redhat.com
TO: dg(a)emlix.com
TO: j.zink(a)pengutronix.de
TO: robh+dt(a)kernel.org
TO: krzysztof.kozlowski+dt(a)linaro.org
CC: Ivan Bornyakov <i.bornyakov@metrotek.ru>
CC: linux-fpga(a)vger.kernel.org
CC: devicetree(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org
CC: kernel(a)pengutronix.de
CC: system(a)metrotek.ru

Hi Ivan,

I love your patch! Perhaps something to improve:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.0-rc4 next-20220906]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ivan-Bornyakov/Latti=
ce-sysCONFIG-SPI-FPGA-manager/20220905-213520
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-=
next
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: parisc-randconfig-m041-20220906 (https://download.01.org/0day-ci/ar=
chive/20220907/202209071750.XXAMXVEr-lkp(a)intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/fpga/sysconfig.c:265 sysconfig_bitstream_paged_write() error: unini=
tialized symbol 'ret'.

vim +/ret +265 drivers/fpga/sysconfig.c

d464d896568c54 Ivan Bornyakov 2022-09-05  243  =

d464d896568c54 Ivan Bornyakov 2022-09-05  244  static int sysconfig_bitstre=
am_paged_write(struct sysconfig_priv *priv,
d464d896568c54 Ivan Bornyakov 2022-09-05  245  					   const char *buf, siz=
e_t count)
d464d896568c54 Ivan Bornyakov 2022-09-05  246  {
d464d896568c54 Ivan Bornyakov 2022-09-05  247  	const u8 lsc_progincr[] =3D=
 SYSCONFIG_LSC_PROG_INCR_NV;
d464d896568c54 Ivan Bornyakov 2022-09-05  248  	size_t i;
d464d896568c54 Ivan Bornyakov 2022-09-05  249  	int ret;
d464d896568c54 Ivan Bornyakov 2022-09-05  250  =

d464d896568c54 Ivan Bornyakov 2022-09-05  251  	if (count % SYSCONFIG_PAGE_=
SIZE)
d464d896568c54 Ivan Bornyakov 2022-09-05  252  		return -EINVAL;
d464d896568c54 Ivan Bornyakov 2022-09-05  253  =

d464d896568c54 Ivan Bornyakov 2022-09-05  254  	for (i =3D 0; i < count; i =
+=3D SYSCONFIG_PAGE_SIZE) {
d464d896568c54 Ivan Bornyakov 2022-09-05  255  		ret =3D sysconfig_cmd_writ=
e_with_data(priv, lsc_progincr,
d464d896568c54 Ivan Bornyakov 2022-09-05  256  						    sizeof(lsc_proginc=
r),
d464d896568c54 Ivan Bornyakov 2022-09-05  257  						    buf + i, SYSCONFIG=
_PAGE_SIZE);
d464d896568c54 Ivan Bornyakov 2022-09-05  258  		if (!ret)
d464d896568c54 Ivan Bornyakov 2022-09-05  259  			ret =3D sysconfig_poll_bu=
sy(priv);
d464d896568c54 Ivan Bornyakov 2022-09-05  260  =

d464d896568c54 Ivan Bornyakov 2022-09-05  261  		if (ret)
d464d896568c54 Ivan Bornyakov 2022-09-05  262  			break;
d464d896568c54 Ivan Bornyakov 2022-09-05  263  	}
d464d896568c54 Ivan Bornyakov 2022-09-05  264  =

d464d896568c54 Ivan Bornyakov 2022-09-05 @265  	return ret;
d464d896568c54 Ivan Bornyakov 2022-09-05  266  }
d464d896568c54 Ivan Bornyakov 2022-09-05  267  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2122298747699460615==--

