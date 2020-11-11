Content-Type: multipart/mixed; boundary="===============4617875539695318684=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/dma/sf-pdma/sf-pdma.c:488:23: warning: Variable 'chan' is not assigned a value.
Date: Wed, 11 Nov 2020 20:16:55 +0800
Message-ID: <202011112052.ntrInKqW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4617875539695318684==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
CC: Vinod Koul <vkoul@kernel.org>
CC: Green Wan <green.wan@sifive.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   eccc876724927ff3b9ff91f36f7b6b159e948f0c
commit: f2b5d503c04a28828af8e41fcd4a5d9fd978a78e dmaengine: sf-pdma: Simpli=
fy the error handling path in 'sf_pdma_probe()'
date:   6 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 6 months ago
compiler: h8300-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   drivers/dma/sf-pdma/sf-pdma.c:58:6: warning: Either the condition 'chan'=
 is redundant or there is possible null pointer dereference: chan. [nullPoi=
nterRedundantCheck]
    if (chan->desc && !chan->desc->in_use) {
        ^
   drivers/dma/sf-pdma/sf-pdma.c:97:6: note: Assuming that condition 'chan'=
 is not redundant
    if (chan && (!len || !dest || !src)) {
        ^
   drivers/dma/sf-pdma/sf-pdma.c:103:28: note: Calling function 'sf_pdma_al=
loc_desc', 1st argument 'chan' value is 0
    desc =3D sf_pdma_alloc_desc(chan);
                              ^
   drivers/dma/sf-pdma/sf-pdma.c:58:6: note: Null pointer dereference
    if (chan->desc && !chan->desc->in_use) {
        ^
   drivers/dma/sf-pdma/sf-pdma.c:112:2: warning: Either the condition 'chan=
' is redundant or there is possible null pointer dereference: chan. [nullPo=
interRedundantCheck]
    chan->desc =3D desc;
    ^
   drivers/dma/sf-pdma/sf-pdma.c:97:6: note: Assuming that condition 'chan'=
 is not redundant
    if (chan && (!len || !dest || !src)) {
        ^
   drivers/dma/sf-pdma/sf-pdma.c:112:2: note: Null pointer dereference
    chan->desc =3D desc;
    ^
>> drivers/dma/sf-pdma/sf-pdma.c:488:23: warning: Variable 'chan' is not as=
signed a value. [unassignedVariable]
    struct sf_pdma_chan *chan;
                         ^

vim +/chan +488 drivers/dma/sf-pdma/sf-pdma.c

6973886ad58e6b4 Green Wan          2019-11-07  484  =

6973886ad58e6b4 Green Wan          2019-11-07  485  static int sf_pdma_prob=
e(struct platform_device *pdev)
6973886ad58e6b4 Green Wan          2019-11-07  486  {
6973886ad58e6b4 Green Wan          2019-11-07  487  	struct sf_pdma *pdma;
6973886ad58e6b4 Green Wan          2019-11-07 @488  	struct sf_pdma_chan *c=
han;
6973886ad58e6b4 Green Wan          2019-11-07  489  	struct resource *res;
6973886ad58e6b4 Green Wan          2019-11-07  490  	int len, chans;
6973886ad58e6b4 Green Wan          2019-11-07  491  	int ret;
6973886ad58e6b4 Green Wan          2019-11-07  492  	const enum dma_slave_b=
uswidth widths =3D
6973886ad58e6b4 Green Wan          2019-11-07  493  		DMA_SLAVE_BUSWIDTH_1_=
BYTE | DMA_SLAVE_BUSWIDTH_2_BYTES |
6973886ad58e6b4 Green Wan          2019-11-07  494  		DMA_SLAVE_BUSWIDTH_4_=
BYTES | DMA_SLAVE_BUSWIDTH_8_BYTES |
6973886ad58e6b4 Green Wan          2019-11-07  495  		DMA_SLAVE_BUSWIDTH_16=
_BYTES | DMA_SLAVE_BUSWIDTH_32_BYTES |
6973886ad58e6b4 Green Wan          2019-11-07  496  		DMA_SLAVE_BUSWIDTH_64=
_BYTES;
6973886ad58e6b4 Green Wan          2019-11-07  497  =

6973886ad58e6b4 Green Wan          2019-11-07  498  	chans =3D PDMA_NR_CH;
6973886ad58e6b4 Green Wan          2019-11-07  499  	len =3D sizeof(*pdma) =
+ sizeof(*chan) * chans;
6973886ad58e6b4 Green Wan          2019-11-07  500  	pdma =3D devm_kzalloc(=
&pdev->dev, len, GFP_KERNEL);
6973886ad58e6b4 Green Wan          2019-11-07  501  	if (!pdma)
6973886ad58e6b4 Green Wan          2019-11-07  502  		return -ENOMEM;
6973886ad58e6b4 Green Wan          2019-11-07  503  =

6973886ad58e6b4 Green Wan          2019-11-07  504  	pdma->n_chans =3D chan=
s;
6973886ad58e6b4 Green Wan          2019-11-07  505  =

6973886ad58e6b4 Green Wan          2019-11-07  506  	res =3D platform_get_r=
esource(pdev, IORESOURCE_MEM, 0);
6973886ad58e6b4 Green Wan          2019-11-07  507  	pdma->membase =3D devm=
_ioremap_resource(&pdev->dev, res);
6973886ad58e6b4 Green Wan          2019-11-07  508  	if (IS_ERR(pdma->memba=
se))
f2b5d503c04a288 Christophe JAILLET 2020-05-01  509  		return PTR_ERR(pdma->=
membase);
6973886ad58e6b4 Green Wan          2019-11-07  510  =

6973886ad58e6b4 Green Wan          2019-11-07  511  	ret =3D sf_pdma_irq_in=
it(pdev, pdma);
6973886ad58e6b4 Green Wan          2019-11-07  512  	if (ret)
f2b5d503c04a288 Christophe JAILLET 2020-05-01  513  		return ret;
6973886ad58e6b4 Green Wan          2019-11-07  514  =

6973886ad58e6b4 Green Wan          2019-11-07  515  	sf_pdma_setup_chans(pd=
ma);
6973886ad58e6b4 Green Wan          2019-11-07  516  =

6973886ad58e6b4 Green Wan          2019-11-07  517  	pdma->dma_dev.dev =3D =
&pdev->dev;
6973886ad58e6b4 Green Wan          2019-11-07  518  =

6973886ad58e6b4 Green Wan          2019-11-07  519  	/* Setup capability */
6973886ad58e6b4 Green Wan          2019-11-07  520  	dma_cap_set(DMA_MEMCPY=
, pdma->dma_dev.cap_mask);
6973886ad58e6b4 Green Wan          2019-11-07  521  	pdma->dma_dev.copy_ali=
gn =3D 2;
6973886ad58e6b4 Green Wan          2019-11-07  522  	pdma->dma_dev.src_addr=
_widths =3D widths;
6973886ad58e6b4 Green Wan          2019-11-07  523  	pdma->dma_dev.dst_addr=
_widths =3D widths;
6973886ad58e6b4 Green Wan          2019-11-07  524  	pdma->dma_dev.directio=
ns =3D BIT(DMA_MEM_TO_MEM);
6973886ad58e6b4 Green Wan          2019-11-07  525  	pdma->dma_dev.residue_=
granularity =3D DMA_RESIDUE_GRANULARITY_DESCRIPTOR;
6973886ad58e6b4 Green Wan          2019-11-07  526  	pdma->dma_dev.descript=
or_reuse =3D true;
6973886ad58e6b4 Green Wan          2019-11-07  527  =

6973886ad58e6b4 Green Wan          2019-11-07  528  	/* Setup DMA APIs */
6973886ad58e6b4 Green Wan          2019-11-07  529  	pdma->dma_dev.device_a=
lloc_chan_resources =3D
6973886ad58e6b4 Green Wan          2019-11-07  530  		sf_pdma_alloc_chan_re=
sources;
6973886ad58e6b4 Green Wan          2019-11-07  531  	pdma->dma_dev.device_f=
ree_chan_resources =3D
6973886ad58e6b4 Green Wan          2019-11-07  532  		sf_pdma_free_chan_res=
ources;
6973886ad58e6b4 Green Wan          2019-11-07  533  	pdma->dma_dev.device_t=
x_status =3D sf_pdma_tx_status;
6973886ad58e6b4 Green Wan          2019-11-07  534  	pdma->dma_dev.device_p=
rep_dma_memcpy =3D sf_pdma_prep_dma_memcpy;
6973886ad58e6b4 Green Wan          2019-11-07  535  	pdma->dma_dev.device_c=
onfig =3D sf_pdma_slave_config;
6973886ad58e6b4 Green Wan          2019-11-07  536  	pdma->dma_dev.device_t=
erminate_all =3D sf_pdma_terminate_all;
6973886ad58e6b4 Green Wan          2019-11-07  537  	pdma->dma_dev.device_i=
ssue_pending =3D sf_pdma_issue_pending;
6973886ad58e6b4 Green Wan          2019-11-07  538  =

6973886ad58e6b4 Green Wan          2019-11-07  539  	platform_set_drvdata(p=
dev, pdma);
6973886ad58e6b4 Green Wan          2019-11-07  540  =

6973886ad58e6b4 Green Wan          2019-11-07  541  	ret =3D dma_set_mask_a=
nd_coherent(&pdev->dev, DMA_BIT_MASK(64));
6973886ad58e6b4 Green Wan          2019-11-07  542  	if (ret)
6973886ad58e6b4 Green Wan          2019-11-07  543  		dev_warn(&pdev->dev,
6973886ad58e6b4 Green Wan          2019-11-07  544  			 "Failed to set DMA =
mask. Fall back to default.\n");
6973886ad58e6b4 Green Wan          2019-11-07  545  =

6973886ad58e6b4 Green Wan          2019-11-07  546  	ret =3D dma_async_devi=
ce_register(&pdma->dma_dev);
f2b5d503c04a288 Christophe JAILLET 2020-05-01  547  	if (ret) {
6973886ad58e6b4 Green Wan          2019-11-07  548  		dev_err(&pdev->dev,
6973886ad58e6b4 Green Wan          2019-11-07  549  			"Can't register SiFi=
ve Platform DMA. (%d)\n", ret);
6973886ad58e6b4 Green Wan          2019-11-07  550  		return ret;
6973886ad58e6b4 Green Wan          2019-11-07  551  	}
6973886ad58e6b4 Green Wan          2019-11-07  552  =

f2b5d503c04a288 Christophe JAILLET 2020-05-01  553  	return 0;
f2b5d503c04a288 Christophe JAILLET 2020-05-01  554  }
f2b5d503c04a288 Christophe JAILLET 2020-05-01  555  =


:::::: The code at line 488 was first introduced by commit
:::::: 6973886ad58e6b4988813331abb76ae0b364a9c2 dmaengine: sf-pdma: add pla=
tform DMA support for HiFive Unleashed A00

:::::: TO: Green Wan <green.wan@sifive.com>
:::::: CC: Vinod Koul <vkoul@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4617875539695318684==--

