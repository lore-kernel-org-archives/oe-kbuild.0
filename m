Content-Type: multipart/mixed; boundary="===============9171012460648781182=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v16 2/4] dmaengine: tegra: Add tegra gpcdma driver
Date: Tue, 18 Jan 2022 09:21:15 +0800
Message-ID: <202201180923.fNi2QFgD-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9171012460648781182==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <1641830718-23650-3-git-send-email-akhilrajeev@nvidia.com>
References: <1641830718-23650-3-git-send-email-akhilrajeev@nvidia.com>
TO: Akhil R <akhilrajeev@nvidia.com>

Hi Akhil,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on vkoul-dmaengine/next]
[also build test WARNING on robh/for-next arm64/for-next/core v5.16 next-20=
220117]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Akhil-R/Add-NVIDIA-Tegra-G=
PC-DMA-driver/20220111-000734
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git=
 next
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: microblaze-randconfig-s031-20220118 (https://download.01.org/0day-c=
i/archive/20220118/202201180923.fNi2QFgD-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/0day-ci/linux/commit/c8498ed60baaec5b689dbe5d3=
882342c88981eb3
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Akhil-R/Add-NVIDIA-Tegra-GPC-DMA-d=
river/20220111-000734
        git checkout c8498ed60baaec5b689dbe5d3882342c88981eb3
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dm=
icroblaze SHELL=3D/bin/bash drivers/dma/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   drivers/dma/tegra186-gpc-dma.c: note: in included file (through arch/mic=
roblaze/include/asm/io.h, include/linux/scatterlist.h, include/linux/dmaeng=
ine.h):
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
>> drivers/dma/tegra186-gpc-dma.c:861:25: sparse: sparse: shift too big (32=
) for type unsigned int
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   drivers/dma/tegra186-gpc-dma.c:929:17: sparse: sparse: shift too big (32=
) for type unsigned int
   drivers/dma/tegra186-gpc-dma.c:931:17: sparse: sparse: shift too big (32=
) for type unsigned int
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   drivers/dma/tegra186-gpc-dma.c:1040:33: sparse: sparse: shift too big (3=
2) for type unsigned int
   drivers/dma/tegra186-gpc-dma.c:1045:33: sparse: sparse: shift too big (3=
2) for type unsigned int
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   drivers/dma/tegra186-gpc-dma.c:1162:33: sparse: sparse: shift too big (3=
2) for type unsigned int
   drivers/dma/tegra186-gpc-dma.c:1167:33: sparse: sparse: shift too big (3=
2) for type unsigned int
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]

vim +861 drivers/dma/tegra186-gpc-dma.c

c8498ed60baaec5 Akhil R 2022-01-10  806  =

c8498ed60baaec5 Akhil R 2022-01-10  807  static struct dma_async_tx_descrip=
tor *
c8498ed60baaec5 Akhil R 2022-01-10  808  tegra_dma_prep_dma_memset(struct d=
ma_chan *dc, dma_addr_t dest, int value,
c8498ed60baaec5 Akhil R 2022-01-10  809  			  size_t len, unsigned long fla=
gs)
c8498ed60baaec5 Akhil R 2022-01-10  810  {
c8498ed60baaec5 Akhil R 2022-01-10  811  	struct tegra_dma_channel *tdc =3D=
 to_tegra_dma_chan(dc);
c8498ed60baaec5 Akhil R 2022-01-10  812  	unsigned int max_dma_count =3D td=
c->tdma->chip_data->max_dma_count;
c8498ed60baaec5 Akhil R 2022-01-10  813  	struct tegra_dma_sg_req *sg_req;
c8498ed60baaec5 Akhil R 2022-01-10  814  	struct tegra_dma_desc *dma_desc;
c8498ed60baaec5 Akhil R 2022-01-10  815  	unsigned long csr, mc_seq;
c8498ed60baaec5 Akhil R 2022-01-10  816  =

c8498ed60baaec5 Akhil R 2022-01-10  817  	if ((len & 3) || (dest & 3) || le=
n > max_dma_count) {
c8498ed60baaec5 Akhil R 2022-01-10  818  		dev_err(tdc2dev(tdc),
c8498ed60baaec5 Akhil R 2022-01-10  819  			"DMA length/memory address is n=
ot supported\n");
c8498ed60baaec5 Akhil R 2022-01-10  820  		return NULL;
c8498ed60baaec5 Akhil R 2022-01-10  821  	}
c8498ed60baaec5 Akhil R 2022-01-10  822  =

c8498ed60baaec5 Akhil R 2022-01-10  823  	/* Set dma mode to fixed pattern =
*/
c8498ed60baaec5 Akhil R 2022-01-10  824  	csr =3D TEGRA_GPCDMA_CSR_DMA_FIXE=
D_PAT;
c8498ed60baaec5 Akhil R 2022-01-10  825  	/* Enable once or continuous mode=
 */
c8498ed60baaec5 Akhil R 2022-01-10  826  	csr |=3D TEGRA_GPCDMA_CSR_ONCE;
c8498ed60baaec5 Akhil R 2022-01-10  827  	/* Enable IRQ mask */
c8498ed60baaec5 Akhil R 2022-01-10  828  	csr |=3D TEGRA_GPCDMA_CSR_IRQ_MAS=
K;
c8498ed60baaec5 Akhil R 2022-01-10  829  	/* Enable the dma interrupt */
c8498ed60baaec5 Akhil R 2022-01-10  830  	if (flags & DMA_PREP_INTERRUPT)
c8498ed60baaec5 Akhil R 2022-01-10  831  		csr |=3D TEGRA_GPCDMA_CSR_IE_EOC;
c8498ed60baaec5 Akhil R 2022-01-10  832  	/* Configure default priority wei=
ght for the channel */
c8498ed60baaec5 Akhil R 2022-01-10  833  	csr |=3D FIELD_PREP(TEGRA_GPCDMA_=
CSR_WEIGHT, 1);
c8498ed60baaec5 Akhil R 2022-01-10  834  =

c8498ed60baaec5 Akhil R 2022-01-10  835  	mc_seq =3D  tdc_read(tdc, TEGRA_G=
PCDMA_CHAN_MCSEQ);
c8498ed60baaec5 Akhil R 2022-01-10  836  	/* retain stream-id and clean res=
t */
c8498ed60baaec5 Akhil R 2022-01-10  837  	mc_seq &=3D TEGRA_GPCDMA_MCSEQ_ST=
REAM_ID0_MASK;
c8498ed60baaec5 Akhil R 2022-01-10  838  =

c8498ed60baaec5 Akhil R 2022-01-10  839  	/* Set the address wrapping */
c8498ed60baaec5 Akhil R 2022-01-10  840  	mc_seq |=3D FIELD_PREP(TEGRA_GPCD=
MA_MCSEQ_WRAP0,
c8498ed60baaec5 Akhil R 2022-01-10  841  						TEGRA_GPCDMA_MCSEQ_WRAP_NONE=
);
c8498ed60baaec5 Akhil R 2022-01-10  842  	mc_seq |=3D FIELD_PREP(TEGRA_GPCD=
MA_MCSEQ_WRAP1,
c8498ed60baaec5 Akhil R 2022-01-10  843  						TEGRA_GPCDMA_MCSEQ_WRAP_NONE=
);
c8498ed60baaec5 Akhil R 2022-01-10  844  =

c8498ed60baaec5 Akhil R 2022-01-10  845  	/* Program outstanding MC request=
s */
c8498ed60baaec5 Akhil R 2022-01-10  846  	mc_seq |=3D FIELD_PREP(TEGRA_GPCD=
MA_MCSEQ_REQ_COUNT, 1);
c8498ed60baaec5 Akhil R 2022-01-10  847  	/* Set burst size */
c8498ed60baaec5 Akhil R 2022-01-10  848  	mc_seq |=3D TEGRA_GPCDMA_MCSEQ_BU=
RST_16;
c8498ed60baaec5 Akhil R 2022-01-10  849  =

c8498ed60baaec5 Akhil R 2022-01-10  850  	dma_desc =3D kzalloc(struct_size(=
dma_desc, sg_req, 1), GFP_NOWAIT);
c8498ed60baaec5 Akhil R 2022-01-10  851  	if (!dma_desc)
c8498ed60baaec5 Akhil R 2022-01-10  852  		return NULL;
c8498ed60baaec5 Akhil R 2022-01-10  853  =

c8498ed60baaec5 Akhil R 2022-01-10  854  	dma_desc->bytes_requested =3D len;
c8498ed60baaec5 Akhil R 2022-01-10  855  	dma_desc->sg_count =3D 1;
c8498ed60baaec5 Akhil R 2022-01-10  856  	sg_req =3D dma_desc->sg_req;
c8498ed60baaec5 Akhil R 2022-01-10  857  =

c8498ed60baaec5 Akhil R 2022-01-10  858  	sg_req[0].ch_regs.src_ptr =3D 0;
c8498ed60baaec5 Akhil R 2022-01-10  859  	sg_req[0].ch_regs.dst_ptr =3D des=
t;
c8498ed60baaec5 Akhil R 2022-01-10  860  	sg_req[0].ch_regs.high_addr_ptr =
=3D
c8498ed60baaec5 Akhil R 2022-01-10 @861  			FIELD_PREP(TEGRA_GPCDMA_HIGH_AD=
DR_DST_PTR, (dest >> 32));
c8498ed60baaec5 Akhil R 2022-01-10  862  	sg_req[0].ch_regs.fixed_pattern =
=3D value;
c8498ed60baaec5 Akhil R 2022-01-10  863  	/* Word count reg takes value as =
(N +1) words */
c8498ed60baaec5 Akhil R 2022-01-10  864  	sg_req[0].ch_regs.wcount =3D ((le=
n - 4) >> 2);
c8498ed60baaec5 Akhil R 2022-01-10  865  	sg_req[0].ch_regs.csr =3D csr;
c8498ed60baaec5 Akhil R 2022-01-10  866  	sg_req[0].ch_regs.mmio_seq =3D 0;
c8498ed60baaec5 Akhil R 2022-01-10  867  	sg_req[0].ch_regs.mc_seq =3D mc_s=
eq;
c8498ed60baaec5 Akhil R 2022-01-10  868  	sg_req[0].len =3D len;
c8498ed60baaec5 Akhil R 2022-01-10  869  =

c8498ed60baaec5 Akhil R 2022-01-10  870  	dma_desc->cyclic =3D false;
c8498ed60baaec5 Akhil R 2022-01-10  871  	return vchan_tx_prep(&tdc->vc, &d=
ma_desc->vd, flags);
c8498ed60baaec5 Akhil R 2022-01-10  872  }
c8498ed60baaec5 Akhil R 2022-01-10  873  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============9171012460648781182==--

