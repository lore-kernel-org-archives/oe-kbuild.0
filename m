Content-Type: multipart/mixed; boundary="===============0840524207305762897=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [net-next PATCH RFC v6 12/16] net: dsa: qca8k: add support for mdio read/write in Ethernet packet
Date: Wed, 15 Dec 2021 16:22:38 +0800
Message-ID: <202112151621.ebBfoRll-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0840524207305762897==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211214224409.5770-13-ansuelsmth@gmail.com>
References: <20211214224409.5770-13-ansuelsmth@gmail.com>
TO: Ansuel Smith <ansuelsmth@gmail.com>

Hi Ansuel,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on net-next/master]

url:    https://github.com/0day-ci/linux/commits/Ansuel-Smith/Add-support-f=
or-qca8k-mdio-rw-in-Ethernet-packet/20211215-064645
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git =
fe4c82a7e0f06abdf5a6978aa00457b63bd46680
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: microblaze-randconfig-s032-20211214 (https://download.01.org/0day-c=
i/archive/20211215/202112151621.ebBfoRll-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/0day-ci/linux/commit/8036c636992760ad100109c13=
85110b8fda46e25
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Ansuel-Smith/Add-support-for-qca8k=
-mdio-rw-in-Ethernet-packet/20211215-064645
        git checkout 8036c636992760ad100109c1385110b8fda46e25
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dm=
icroblaze SHELL=3D/bin/bash drivers/net/dsa/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/net/dsa/qca8k.c:2577:17: sparse: sparse: typename in expression
   drivers/net/dsa/qca8k.c:2577:24: sparse: sparse: Expected ; at end of st=
atement
   drivers/net/dsa/qca8k.c:2577:24: sparse: sparse: got tag_qca_priv
   drivers/net/dsa/qca8k.c:2577:17: sparse: sparse: undefined identifier 's=
truct'
   drivers/net/dsa/qca8k.c:2579:17: sparse: sparse: undefined identifier 'p=
riv'
   drivers/net/dsa/qca8k.c:2584:17: sparse: sparse: undefined identifier 'p=
riv'

vim +2577 drivers/net/dsa/qca8k.c

8036c636992760a Ansuel Smith 2021-12-14  2569  =

8036c636992760a Ansuel Smith 2021-12-14  2570  static int qca8k_connect_tag=
_protocol(struct dsa_switch *ds,
8036c636992760a Ansuel Smith 2021-12-14  2571  				      enum dsa_tag_proto=
col proto)
8036c636992760a Ansuel Smith 2021-12-14  2572  {
8036c636992760a Ansuel Smith 2021-12-14  2573  	struct qca8k_priv *qca8k_pr=
iv =3D ds->priv;
8036c636992760a Ansuel Smith 2021-12-14  2574  =

8036c636992760a Ansuel Smith 2021-12-14  2575  	switch (proto) {
8036c636992760a Ansuel Smith 2021-12-14  2576  	case DSA_TAG_PROTO_QCA:
8036c636992760a Ansuel Smith 2021-12-14 @2577  		struct tag_qca_priv *priv;
8036c636992760a Ansuel Smith 2021-12-14  2578  =

8036c636992760a Ansuel Smith 2021-12-14  2579  		priv =3D ds->tagger_data;
8036c636992760a Ansuel Smith 2021-12-14  2580  =

8036c636992760a Ansuel Smith 2021-12-14  2581  		mutex_init(&qca8k_priv->md=
io_hdr_data.mutex);
8036c636992760a Ansuel Smith 2021-12-14  2582  		init_completion(&qca8k_pri=
v->mdio_hdr_data.rw_done);
8036c636992760a Ansuel Smith 2021-12-14  2583  =

8036c636992760a Ansuel Smith 2021-12-14  2584  		priv->rw_reg_ack_handler =
=3D qca8k_rw_reg_ack_handler;
8036c636992760a Ansuel Smith 2021-12-14  2585  =

8036c636992760a Ansuel Smith 2021-12-14  2586  		break;
8036c636992760a Ansuel Smith 2021-12-14  2587  	default:
8036c636992760a Ansuel Smith 2021-12-14  2588  		return -EOPNOTSUPP;
8036c636992760a Ansuel Smith 2021-12-14  2589  	}
8036c636992760a Ansuel Smith 2021-12-14  2590  =

8036c636992760a Ansuel Smith 2021-12-14  2591  	return 0;
b5bf3a0669edf1c Ansuel Smith 2021-12-14  2592  }
b5bf3a0669edf1c Ansuel Smith 2021-12-14  2593  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0840524207305762897==--

