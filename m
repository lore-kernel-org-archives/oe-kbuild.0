Content-Type: multipart/mixed; boundary="===============3283565929245314013=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 106/1039] drivers/fpga/zynqmp-fpga.c:149 zynqmp_fpga_ops_write() error: uninitialized symbol 'status'.
Date: Tue, 29 Mar 2022 13:31:02 +0800
Message-ID: <202203291311.AwQlj8lt-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3283565929245314013==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-arm-kernel(a)lists.infradead.org
TO: Nava kishore Manne <nava.manne@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   ea33365bd1a8cf667a122498e8f551df05609f92
commit: 33504b3c89260e1ca21a73c8d71c5da814f62db8 [106/1039] firmware: xilin=
x: Update the zynqmp_pm_fpga_load() API
:::::: branch date: 4 days ago
:::::: commit date: 8 weeks ago
config: nios2-randconfig-m031-20220328 (https://download.01.org/0day-ci/arc=
hive/20220329/202203291311.AwQlj8lt-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/fpga/zynqmp-fpga.c:149 zynqmp_fpga_ops_write() error: uninitialized=
 symbol 'status'.
drivers/fpga/zynqmp-fpga.c:213 zynqmp_fpga_ops_write_sg() error: uninitiali=
zed symbol 'status'.

vim +/status +149 drivers/fpga/zynqmp-fpga.c

c09f7471127e9d Nava kishore Manne           2019-04-15   97  =

c09f7471127e9d Nava kishore Manne           2019-04-15   98  static int zyn=
qmp_fpga_ops_write(struct fpga_manager *mgr,
c09f7471127e9d Nava kishore Manne           2019-04-15   99  				 const cha=
r *buf, size_t size)
c09f7471127e9d Nava kishore Manne           2019-04-15  100  {
c09f7471127e9d Nava kishore Manne           2019-04-15  101  	struct zynqmp=
_fpga_priv *priv;
17d80e71b14654 Nava kishore Manne           2020-09-29  102  	dma_addr_t dm=
a_addr =3D 0;
c09f7471127e9d Nava kishore Manne           2019-04-15  103  	u32 eemi_flag=
s =3D 0;
c9c4634e0ae452 Nava kishore Manne           2019-12-31  104  	size_t dma_si=
ze;
33504b3c89260e Nava kishore Manne           2022-01-13  105  	u32 status;
c09f7471127e9d Nava kishore Manne           2019-04-15  106  	char *kbuf;
c09f7471127e9d Nava kishore Manne           2019-04-15  107  	int ret;
c09f7471127e9d Nava kishore Manne           2019-04-15  108  =

c09f7471127e9d Nava kishore Manne           2019-04-15  109  	priv =3D mgr-=
>priv;
c56dc0db37a37e Appana Durga Kedareswara rao 2019-12-31  110  	priv->size =
=3D size;
c09f7471127e9d Nava kishore Manne           2019-04-15  111  =

c9c4634e0ae452 Nava kishore Manne           2019-12-31  112  	if (priv->fla=
gs & FPGA_MGR_USERKEY_ENCRYPTED_BITSTREAM)
c9c4634e0ae452 Nava kishore Manne           2019-12-31  113  		dma_size =3D=
 size + ENCRYPTED_KEY_LEN;
c9c4634e0ae452 Nava kishore Manne           2019-12-31  114  	else
c9c4634e0ae452 Nava kishore Manne           2019-12-31  115  		dma_size =3D=
 size;
c9c4634e0ae452 Nava kishore Manne           2019-12-31  116  =

c9c4634e0ae452 Nava kishore Manne           2019-12-31  117  	kbuf =3D dma_=
alloc_coherent(priv->dev, dma_size, &dma_addr, GFP_KERNEL);
c09f7471127e9d Nava kishore Manne           2019-04-15  118  	if (!kbuf)
c09f7471127e9d Nava kishore Manne           2019-04-15  119  		return -ENOM=
EM;
c09f7471127e9d Nava kishore Manne           2019-04-15  120  =

c09f7471127e9d Nava kishore Manne           2019-04-15  121  	memcpy(kbuf, =
buf, size);
c09f7471127e9d Nava kishore Manne           2019-04-15  122  =

c9c4634e0ae452 Nava kishore Manne           2019-12-31  123  	if (priv->fla=
gs & FPGA_MGR_USERKEY_ENCRYPTED_BITSTREAM) {
c9c4634e0ae452 Nava kishore Manne           2019-12-31  124  		eemi_flags |=
=3D XILINX_ZYNQMP_PM_FPGA_ENCRYPTION_USERKEY;
c9c4634e0ae452 Nava kishore Manne           2019-12-31  125  		memcpy(kbuf =
+ size, mgr->key, ENCRYPTED_KEY_LEN);
c9c4634e0ae452 Nava kishore Manne           2019-12-31  126  	} else if (pr=
iv->flags & FPGA_MGR_ENCRYPTED_BITSTREAM) {
c9c4634e0ae452 Nava kishore Manne           2019-12-31  127  		eemi_flags |=
=3D XILINX_ZYNQMP_PM_FPGA_ENCRYPTION_DEVKEY;
c9c4634e0ae452 Nava kishore Manne           2019-12-31  128  	}
c9c4634e0ae452 Nava kishore Manne           2019-12-31  129  =

c09f7471127e9d Nava kishore Manne           2019-04-15  130  	wmb(); /* ens=
ure all writes are done before initiate FW call */
c09f7471127e9d Nava kishore Manne           2019-04-15  131  =

0a59c37a459937 Nava kishore Manne           2019-12-31  132  	if (priv->fla=
gs & FPGA_MGR_DDR_MEM_AUTH_BITSTREAM)
0a59c37a459937 Nava kishore Manne           2019-12-31  133  		eemi_flags |=
=3D XILINX_ZYNQMP_PM_FPGA_AUTHENTICATION_DDR;
0a59c37a459937 Nava kishore Manne           2019-12-31  134  	else if (priv=
->flags & FPGA_MGR_SECURE_MEM_AUTH_BITSTREAM)
0a59c37a459937 Nava kishore Manne           2019-12-31  135  		eemi_flags |=
=3D XILINX_ZYNQMP_PM_FPGA_AUTHENTICATION_OCM;
0a59c37a459937 Nava kishore Manne           2019-12-31  136  =

c09f7471127e9d Nava kishore Manne           2019-04-15  137  	if (priv->fla=
gs & FPGA_MGR_PARTIAL_RECONFIG)
c09f7471127e9d Nava kishore Manne           2019-04-15  138  		eemi_flags |=
=3D XILINX_ZYNQMP_PM_FPGA_PARTIAL;
c09f7471127e9d Nava kishore Manne           2019-04-15  139  =

c9c4634e0ae452 Nava kishore Manne           2019-12-31  140  	if (priv->fla=
gs & FPGA_MGR_USERKEY_ENCRYPTED_BITSTREAM)
c9c4634e0ae452 Nava kishore Manne           2019-12-31  141  		ret =3D zynq=
mp_pm_fpga_load(dma_addr, dma_addr + size,
33504b3c89260e Nava kishore Manne           2022-01-13  142  					  eemi_fl=
ags, &status);
c9c4634e0ae452 Nava kishore Manne           2019-12-31  143  	else
33504b3c89260e Nava kishore Manne           2022-01-13  144  		ret =3D zynq=
mp_pm_fpga_load(dma_addr, size,
33504b3c89260e Nava kishore Manne           2022-01-13  145  					  eemi_fl=
ags, &status);
c09f7471127e9d Nava kishore Manne           2019-04-15  146  =

c9c4634e0ae452 Nava kishore Manne           2019-12-31  147  	dma_free_cohe=
rent(priv->dev, dma_size, kbuf, dma_addr);
c09f7471127e9d Nava kishore Manne           2019-04-15  148  =

33504b3c89260e Nava kishore Manne           2022-01-13 @149  	if (status)
33504b3c89260e Nava kishore Manne           2022-01-13  150  		return statu=
s;
33504b3c89260e Nava kishore Manne           2022-01-13  151  =

c09f7471127e9d Nava kishore Manne           2019-04-15  152  	return ret;
c09f7471127e9d Nava kishore Manne           2019-04-15  153  }
c09f7471127e9d Nava kishore Manne           2019-04-15  154  =

8d02a7ff49398f Nava kishore Manne           2020-07-30  155  static unsigne=
d long zynqmp_fpga_get_contiguous_size(struct sg_table *sgt)
8d02a7ff49398f Nava kishore Manne           2020-07-30  156  {
8d02a7ff49398f Nava kishore Manne           2020-07-30  157  	dma_addr_t ex=
pected =3D sg_dma_address(sgt->sgl);
8d02a7ff49398f Nava kishore Manne           2020-07-30  158  	unsigned long=
 size =3D 0;
8d02a7ff49398f Nava kishore Manne           2020-07-30  159  	struct scatte=
rlist *s;
8d02a7ff49398f Nava kishore Manne           2020-07-30  160  	unsigned int =
i;
8d02a7ff49398f Nava kishore Manne           2020-07-30  161  =

8d02a7ff49398f Nava kishore Manne           2020-07-30  162  	for_each_sg(s=
gt->sgl, s, sgt->nents, i) {
8d02a7ff49398f Nava kishore Manne           2020-07-30  163  		if (sg_dma_a=
ddress(s) !=3D expected)
8d02a7ff49398f Nava kishore Manne           2020-07-30  164  			break;
8d02a7ff49398f Nava kishore Manne           2020-07-30  165  		expected =3D=
 sg_dma_address(s) + sg_dma_len(s);
8d02a7ff49398f Nava kishore Manne           2020-07-30  166  		size +=3D sg=
_dma_len(s);
8d02a7ff49398f Nava kishore Manne           2020-07-30  167  	}
8d02a7ff49398f Nava kishore Manne           2020-07-30  168  =

8d02a7ff49398f Nava kishore Manne           2020-07-30  169  	return size;
8d02a7ff49398f Nava kishore Manne           2020-07-30  170  }
8d02a7ff49398f Nava kishore Manne           2020-07-30  171  =

8d02a7ff49398f Nava kishore Manne           2020-07-30  172  static int zyn=
qmp_fpga_ops_write_sg(struct fpga_manager *mgr,
8d02a7ff49398f Nava kishore Manne           2020-07-30  173  				    struct=
 sg_table *sgt)
8d02a7ff49398f Nava kishore Manne           2020-07-30  174  {
8d02a7ff49398f Nava kishore Manne           2020-07-30  175  	dma_addr_t dm=
a_addr, key_addr =3D 0;
8d02a7ff49398f Nava kishore Manne           2020-07-30  176  	struct zynqmp=
_fpga_priv *priv;
8d02a7ff49398f Nava kishore Manne           2020-07-30  177  	unsigned long=
 contig_size;
8d02a7ff49398f Nava kishore Manne           2020-07-30  178  	u32 eemi_flag=
s =3D 0;
33504b3c89260e Nava kishore Manne           2022-01-13  179  	u32 status;
8d02a7ff49398f Nava kishore Manne           2020-07-30  180  	char *kbuf;
8d02a7ff49398f Nava kishore Manne           2020-07-30  181  	int ret;
8d02a7ff49398f Nava kishore Manne           2020-07-30  182  =

8d02a7ff49398f Nava kishore Manne           2020-07-30  183  	priv =3D mgr-=
>priv;
8d02a7ff49398f Nava kishore Manne           2020-07-30  184  =

8d02a7ff49398f Nava kishore Manne           2020-07-30  185  	dma_addr =3D =
sg_dma_address(sgt->sgl);
8d02a7ff49398f Nava kishore Manne           2020-07-30  186  	contig_size =
=3D zynqmp_fpga_get_contiguous_size(sgt);
8d02a7ff49398f Nava kishore Manne           2020-07-30  187  =

8d02a7ff49398f Nava kishore Manne           2020-07-30  188  	if (priv->fla=
gs & FPGA_MGR_PARTIAL_RECONFIG)
8d02a7ff49398f Nava kishore Manne           2020-07-30  189  		eemi_flags |=
=3D XILINX_ZYNQMP_PM_FPGA_PARTIAL;
8d02a7ff49398f Nava kishore Manne           2020-07-30  190  	if (priv->fla=
gs & FPGA_MGR_USERKEY_ENCRYPTED_BITSTREAM)
8d02a7ff49398f Nava kishore Manne           2020-07-30  191  		eemi_flags |=
=3D XILINX_ZYNQMP_PM_FPGA_ENCRYPTION_USERKEY;
8d02a7ff49398f Nava kishore Manne           2020-07-30  192  	else if (priv=
->flags & FPGA_MGR_ENCRYPTED_BITSTREAM)
8d02a7ff49398f Nava kishore Manne           2020-07-30  193  		eemi_flags |=
=3D XILINX_ZYNQMP_PM_FPGA_ENCRYPTION_DEVKEY;
8d02a7ff49398f Nava kishore Manne           2020-07-30  194  	if (priv->fla=
gs & FPGA_MGR_DDR_MEM_AUTH_BITSTREAM)
8d02a7ff49398f Nava kishore Manne           2020-07-30  195  		eemi_flags |=
=3D XILINX_ZYNQMP_PM_FPGA_AUTHENTICATION_DDR;
8d02a7ff49398f Nava kishore Manne           2020-07-30  196  	else if (priv=
->flags & FPGA_MGR_SECURE_MEM_AUTH_BITSTREAM)
8d02a7ff49398f Nava kishore Manne           2020-07-30  197  		eemi_flags |=
=3D XILINX_ZYNQMP_PM_FPGA_AUTHENTICATION_OCM;
8d02a7ff49398f Nava kishore Manne           2020-07-30  198  =

8d02a7ff49398f Nava kishore Manne           2020-07-30  199  	if (priv->fla=
gs & FPGA_MGR_USERKEY_ENCRYPTED_BITSTREAM) {
8d02a7ff49398f Nava kishore Manne           2020-07-30  200  		kbuf =3D dma=
_alloc_coherent(priv->dev, ENCRYPTED_KEY_LEN,
8d02a7ff49398f Nava kishore Manne           2020-07-30  201  					  &key_ad=
dr, GFP_KERNEL);
8d02a7ff49398f Nava kishore Manne           2020-07-30  202  		if (!kbuf)
8d02a7ff49398f Nava kishore Manne           2020-07-30  203  			return -ENO=
MEM;
8d02a7ff49398f Nava kishore Manne           2020-07-30  204  		memcpy(kbuf,=
 mgr->key, ENCRYPTED_KEY_LEN);
33504b3c89260e Nava kishore Manne           2022-01-13  205  		ret =3D zynq=
mp_pm_fpga_load(dma_addr, key_addr,
33504b3c89260e Nava kishore Manne           2022-01-13  206  					  eemi_fl=
ags, &status);
8d02a7ff49398f Nava kishore Manne           2020-07-30  207  		dma_free_coh=
erent(priv->dev, ENCRYPTED_KEY_LEN, kbuf, key_addr);
8d02a7ff49398f Nava kishore Manne           2020-07-30  208  	} else {
33504b3c89260e Nava kishore Manne           2022-01-13  209  		ret =3D zynq=
mp_pm_fpga_load(dma_addr, contig_size,
33504b3c89260e Nava kishore Manne           2022-01-13  210  					  eemi_fl=
ags, &status);
8d02a7ff49398f Nava kishore Manne           2020-07-30  211  	}
8d02a7ff49398f Nava kishore Manne           2020-07-30  212  =

33504b3c89260e Nava kishore Manne           2022-01-13 @213  	if (status)
33504b3c89260e Nava kishore Manne           2022-01-13  214  		return statu=
s;
33504b3c89260e Nava kishore Manne           2022-01-13  215  =

8d02a7ff49398f Nava kishore Manne           2020-07-30  216  	return ret;
8d02a7ff49398f Nava kishore Manne           2020-07-30  217  }
8d02a7ff49398f Nava kishore Manne           2020-07-30  218  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3283565929245314013==--

