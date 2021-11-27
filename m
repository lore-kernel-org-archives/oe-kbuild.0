Content-Type: multipart/mixed; boundary="===============6882681431639423818=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v13 2/4] dmaengine: tegra: Add tegra gpcdma driver
Date: Sat, 27 Nov 2021 10:02:00 +0800
Message-ID: <202111270938.Ne5fLy58-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6882681431639423818==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <1637573292-13214-3-git-send-email-akhilrajeev@nvidia.com>
References: <1637573292-13214-3-git-send-email-akhilrajeev@nvidia.com>
TO: Akhil R <akhilrajeev@nvidia.com>
TO: dan.j.williams(a)intel.com
TO: devicetree(a)vger.kernel.org
TO: dmaengine(a)vger.kernel.org
TO: jonathanh(a)nvidia.com
TO: kyarlagadda(a)nvidia.com
TO: ldewangan(a)nvidia.com
TO: linux-kernel(a)vger.kernel.org
TO: linux-tegra(a)vger.kernel.org
TO: p.zabel(a)pengutronix.de
TO: rgumasta(a)nvidia.com

Hi Akhil,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on robh/for-next]
[also build test WARNING on vkoul-dmaengine/next arm64/for-next/core v5.16-=
rc2 next-20211126]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Akhil-R/Add-NVIDIA-Tegra-G=
PC-DMA-driver/20211122-173019
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-=
next
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
compiler: hppa-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
>> drivers/dma/tegra186-gpc-dma.c:1135:3: warning: %d in format string (no.=
 1) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfA=
rgType_sint]
     snprintf(tdc->name, sizeof(tdc->name), "gpcdma.%d", i);
     ^

vim +1135 drivers/dma/tegra186-gpc-dma.c

7707da9f914433 Akhil R 2021-11-22  1081  =

7707da9f914433 Akhil R 2021-11-22  1082  static int tegra_dma_probe(struct =
platform_device *pdev)
7707da9f914433 Akhil R 2021-11-22  1083  {
7707da9f914433 Akhil R 2021-11-22  1084  	const struct tegra_dma_chip_data =
*cdata =3D NULL;
7707da9f914433 Akhil R 2021-11-22  1085  	struct iommu_fwspec *iommu_spec;
7707da9f914433 Akhil R 2021-11-22  1086  	unsigned int stream_id, i;
7707da9f914433 Akhil R 2021-11-22  1087  	struct tegra_dma *tdma;
7707da9f914433 Akhil R 2021-11-22  1088  	struct resource	*res;
7707da9f914433 Akhil R 2021-11-22  1089  	int ret;
7707da9f914433 Akhil R 2021-11-22  1090  =

7707da9f914433 Akhil R 2021-11-22  1091  	cdata =3D of_device_get_match_dat=
a(&pdev->dev);
7707da9f914433 Akhil R 2021-11-22  1092  =

7707da9f914433 Akhil R 2021-11-22  1093  	tdma =3D devm_kzalloc(&pdev->dev,=
 sizeof(*tdma) + cdata->nr_channels *
7707da9f914433 Akhil R 2021-11-22  1094  			sizeof(struct tegra_dma_channel=
), GFP_KERNEL);
7707da9f914433 Akhil R 2021-11-22  1095  	if (!tdma)
7707da9f914433 Akhil R 2021-11-22  1096  		return -ENOMEM;
7707da9f914433 Akhil R 2021-11-22  1097  =

7707da9f914433 Akhil R 2021-11-22  1098  	tdma->dev =3D &pdev->dev;
7707da9f914433 Akhil R 2021-11-22  1099  	tdma->chip_data =3D cdata;
7707da9f914433 Akhil R 2021-11-22  1100  	platform_set_drvdata(pdev, tdma);
7707da9f914433 Akhil R 2021-11-22  1101  =

7707da9f914433 Akhil R 2021-11-22  1102  	tdma->base_addr =3D devm_platform=
_ioremap_resource(pdev, 0);
7707da9f914433 Akhil R 2021-11-22  1103  	if (IS_ERR(tdma->base_addr))
7707da9f914433 Akhil R 2021-11-22  1104  		return PTR_ERR(tdma->base_addr);
7707da9f914433 Akhil R 2021-11-22  1105  =

7707da9f914433 Akhil R 2021-11-22  1106  	tdma->rst =3D devm_reset_control_=
get_exclusive(&pdev->dev, "gpcdma");
7707da9f914433 Akhil R 2021-11-22  1107  	if (IS_ERR(tdma->rst)) {
7707da9f914433 Akhil R 2021-11-22  1108  		dev_err_probe(&pdev->dev, PTR_ER=
R(tdma->rst),
7707da9f914433 Akhil R 2021-11-22  1109  			      "Missing controller reset=
\n");
7707da9f914433 Akhil R 2021-11-22  1110  		return PTR_ERR(tdma->rst);
7707da9f914433 Akhil R 2021-11-22  1111  	}
7707da9f914433 Akhil R 2021-11-22  1112  	reset_control_reset(tdma->rst);
7707da9f914433 Akhil R 2021-11-22  1113  =

7707da9f914433 Akhil R 2021-11-22  1114  	tdma->dma_dev.dev =3D &pdev->dev;
7707da9f914433 Akhil R 2021-11-22  1115  =

7707da9f914433 Akhil R 2021-11-22  1116  	iommu_spec =3D dev_iommu_fwspec_g=
et(&pdev->dev);
7707da9f914433 Akhil R 2021-11-22  1117  	if (!iommu_spec) {
7707da9f914433 Akhil R 2021-11-22  1118  		dev_err(&pdev->dev, "Missing iom=
mu stream-id\n");
7707da9f914433 Akhil R 2021-11-22  1119  		return -EINVAL;
7707da9f914433 Akhil R 2021-11-22  1120  	}
7707da9f914433 Akhil R 2021-11-22  1121  	stream_id =3D iommu_spec->ids[0] =
& 0xffff;
7707da9f914433 Akhil R 2021-11-22  1122  =

7707da9f914433 Akhil R 2021-11-22  1123  	INIT_LIST_HEAD(&tdma->dma_dev.cha=
nnels);
7707da9f914433 Akhil R 2021-11-22  1124  	for (i =3D 0; i < cdata->nr_chann=
els; i++) {
7707da9f914433 Akhil R 2021-11-22  1125  		struct tegra_dma_channel *tdc =
=3D &tdma->channels[i];
7707da9f914433 Akhil R 2021-11-22  1126  =

7707da9f914433 Akhil R 2021-11-22  1127  		tdc->chan_base_offset =3D TEGRA_=
GPCDMA_CHANNEL_BASE_ADD_OFFSET +
7707da9f914433 Akhil R 2021-11-22  1128  					i * cdata->channel_reg_size;
7707da9f914433 Akhil R 2021-11-22  1129  		res =3D platform_get_resource(pd=
ev, IORESOURCE_IRQ, i);
7707da9f914433 Akhil R 2021-11-22  1130  		if (!res) {
7707da9f914433 Akhil R 2021-11-22  1131  			dev_err(&pdev->dev, "No irq res=
ource for chan %d\n", i);
7707da9f914433 Akhil R 2021-11-22  1132  			return -EINVAL;
7707da9f914433 Akhil R 2021-11-22  1133  		}
7707da9f914433 Akhil R 2021-11-22  1134  		tdc->irq =3D res->start;
7707da9f914433 Akhil R 2021-11-22 @1135  		snprintf(tdc->name, sizeof(tdc->=
name), "gpcdma.%d", i);
7707da9f914433 Akhil R 2021-11-22  1136  =

7707da9f914433 Akhil R 2021-11-22  1137  		tdc->tdma =3D tdma;
7707da9f914433 Akhil R 2021-11-22  1138  		tdc->id =3D i;
7707da9f914433 Akhil R 2021-11-22  1139  		tdc->slave_id =3D -1;
7707da9f914433 Akhil R 2021-11-22  1140  =

7707da9f914433 Akhil R 2021-11-22  1141  		vchan_init(&tdc->vc, &tdma->dma_=
dev);
7707da9f914433 Akhil R 2021-11-22  1142  		tdc->vc.desc_free =3D tegra_dma_=
desc_free;
7707da9f914433 Akhil R 2021-11-22  1143  		raw_spin_lock_init(&tdc->lock);
7707da9f914433 Akhil R 2021-11-22  1144  =

7707da9f914433 Akhil R 2021-11-22  1145  		/* program stream-id for this ch=
annel */
7707da9f914433 Akhil R 2021-11-22  1146  		tegra_dma_program_sid(tdc, i, st=
ream_id);
7707da9f914433 Akhil R 2021-11-22  1147  		tdc->stream_id =3D stream_id;
7707da9f914433 Akhil R 2021-11-22  1148  	}
7707da9f914433 Akhil R 2021-11-22  1149  =

7707da9f914433 Akhil R 2021-11-22  1150  	dma_cap_set(DMA_SLAVE, tdma->dma_=
dev.cap_mask);
7707da9f914433 Akhil R 2021-11-22  1151  	dma_cap_set(DMA_PRIVATE, tdma->dm=
a_dev.cap_mask);
7707da9f914433 Akhil R 2021-11-22  1152  	dma_cap_set(DMA_MEMCPY, tdma->dma=
_dev.cap_mask);
7707da9f914433 Akhil R 2021-11-22  1153  	dma_cap_set(DMA_MEMSET, tdma->dma=
_dev.cap_mask);
7707da9f914433 Akhil R 2021-11-22  1154  =

7707da9f914433 Akhil R 2021-11-22  1155  	/*
7707da9f914433 Akhil R 2021-11-22  1156  	 * Only word aligned transfers ar=
e supported. Set the copy
7707da9f914433 Akhil R 2021-11-22  1157  	 * alignment shift.
7707da9f914433 Akhil R 2021-11-22  1158  	 */
7707da9f914433 Akhil R 2021-11-22  1159  	tdma->dma_dev.copy_align =3D 2;
7707da9f914433 Akhil R 2021-11-22  1160  	tdma->dma_dev.fill_align =3D 2;
7707da9f914433 Akhil R 2021-11-22  1161  	tdma->dma_dev.device_alloc_chan_r=
esources =3D
7707da9f914433 Akhil R 2021-11-22  1162  					tegra_dma_alloc_chan_resource=
s;
7707da9f914433 Akhil R 2021-11-22  1163  	tdma->dma_dev.device_free_chan_re=
sources =3D
7707da9f914433 Akhil R 2021-11-22  1164  					tegra_dma_free_chan_resources;
7707da9f914433 Akhil R 2021-11-22  1165  	tdma->dma_dev.device_prep_slave_s=
g =3D tegra_dma_prep_slave_sg;
7707da9f914433 Akhil R 2021-11-22  1166  	tdma->dma_dev.device_prep_dma_mem=
cpy =3D tegra_dma_prep_dma_memcpy;
7707da9f914433 Akhil R 2021-11-22  1167  	tdma->dma_dev.device_prep_dma_mem=
set =3D tegra_dma_prep_dma_memset;
7707da9f914433 Akhil R 2021-11-22  1168  	tdma->dma_dev.device_config =3D t=
egra_dma_slave_config;
7707da9f914433 Akhil R 2021-11-22  1169  	tdma->dma_dev.device_terminate_al=
l =3D tegra_dma_terminate_all;
7707da9f914433 Akhil R 2021-11-22  1170  	tdma->dma_dev.device_tx_status =
=3D tegra_dma_tx_status;
7707da9f914433 Akhil R 2021-11-22  1171  	tdma->dma_dev.device_issue_pendin=
g =3D tegra_dma_issue_pending;
7707da9f914433 Akhil R 2021-11-22  1172  	tdma->dma_dev.device_synchronize =
=3D tegra_dma_chan_synchronize;
7707da9f914433 Akhil R 2021-11-22  1173  	tdma->dma_dev.residue_granularity=
 =3D DMA_RESIDUE_GRANULARITY_BURST;
7707da9f914433 Akhil R 2021-11-22  1174  =

7707da9f914433 Akhil R 2021-11-22  1175  	/* Register DMA channel interrupt=
 handlers after everything is setup */
7707da9f914433 Akhil R 2021-11-22  1176  	for (i =3D 0; i < cdata->nr_chann=
els; i++) {
7707da9f914433 Akhil R 2021-11-22  1177  		struct tegra_dma_channel *tdc =
=3D &tdma->channels[i];
7707da9f914433 Akhil R 2021-11-22  1178  =

7707da9f914433 Akhil R 2021-11-22  1179  		ret =3D devm_request_irq(&pdev->=
dev, tdc->irq,
7707da9f914433 Akhil R 2021-11-22  1180  				       tegra_dma_isr, 0, tdc->=
name, tdc);
7707da9f914433 Akhil R 2021-11-22  1181  		if (ret) {
7707da9f914433 Akhil R 2021-11-22  1182  			dev_err_probe(&pdev->dev, ret,
7707da9f914433 Akhil R 2021-11-22  1183  				      "request_irq failed for =
channel %d\n", i);
7707da9f914433 Akhil R 2021-11-22  1184  			return ret;
7707da9f914433 Akhil R 2021-11-22  1185  		}
7707da9f914433 Akhil R 2021-11-22  1186  	}
7707da9f914433 Akhil R 2021-11-22  1187  =

7707da9f914433 Akhil R 2021-11-22  1188  	ret =3D dma_async_device_register=
(&tdma->dma_dev);
7707da9f914433 Akhil R 2021-11-22  1189  	if (ret < 0) {
7707da9f914433 Akhil R 2021-11-22  1190  		dev_err_probe(&pdev->dev, ret,
7707da9f914433 Akhil R 2021-11-22  1191  			      "GPC DMA driver registrat=
ion failed\n");
7707da9f914433 Akhil R 2021-11-22  1192  		return ret;
7707da9f914433 Akhil R 2021-11-22  1193  	}
7707da9f914433 Akhil R 2021-11-22  1194  =

7707da9f914433 Akhil R 2021-11-22  1195  	ret =3D of_dma_controller_registe=
r(pdev->dev.of_node,
7707da9f914433 Akhil R 2021-11-22  1196  					 tegra_dma_of_xlate, tdma);
7707da9f914433 Akhil R 2021-11-22  1197  	if (ret < 0) {
7707da9f914433 Akhil R 2021-11-22  1198  		dev_err_probe(&pdev->dev, ret,
7707da9f914433 Akhil R 2021-11-22  1199  			      "GPC DMA OF registration =
failed\n");
7707da9f914433 Akhil R 2021-11-22  1200  =

7707da9f914433 Akhil R 2021-11-22  1201  		dma_async_device_unregister(&tdm=
a->dma_dev);
7707da9f914433 Akhil R 2021-11-22  1202  		return ret;
7707da9f914433 Akhil R 2021-11-22  1203  	}
7707da9f914433 Akhil R 2021-11-22  1204  =

7707da9f914433 Akhil R 2021-11-22  1205  	dev_info(&pdev->dev, "GPC DMA dri=
ver register %d channels\n",
7707da9f914433 Akhil R 2021-11-22  1206  		 cdata->nr_channels);
7707da9f914433 Akhil R 2021-11-22  1207  =

7707da9f914433 Akhil R 2021-11-22  1208  	return 0;
7707da9f914433 Akhil R 2021-11-22  1209  }
7707da9f914433 Akhil R 2021-11-22  1210  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6882681431639423818==--

