Content-Type: multipart/mixed; boundary="===============0140038176373687620=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/soundwire/qcom.c:1319 qcom_swrm_probe() warn: passing zero to 'PTR_ERR'
Date: Sat, 20 Aug 2022 21:41:41 +0800
Message-ID: <202208202132.gxUTdHmB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0140038176373687620==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
CC: Vinod Koul <vkoul@kernel.org>
CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   50cd95ac46548429e5bba7ca75cc97d11a697947
commit: 1fd0d85affe4d64e54b81d04bf9577e57172a341 soundwire: qcom: Add flag =
for software clock gating check
date:   6 weeks ago
:::::: branch date: 17 hours ago
:::::: commit date: 6 weeks ago
config: riscv-randconfig-m031-20220819 (https://download.01.org/0day-ci/arc=
hive/20220820/202208202132.gxUTdHmB-lkp(a)intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/soundwire/qcom.c:1319 qcom_swrm_probe() warn: passing zero to 'PTR_=
ERR'

Old smatch warnings:
arch/riscv/include/asm/atomic.h:204 arch_atomic_fetch_add_unless() warn: in=
consistent indenting

vim +/PTR_ERR +1319 drivers/soundwire/qcom.c

abd9a6049bb59a Srinivas Kandagatla     2021-09-07  1279  =

02efb49aa805ce Srinivas Kandagatla     2020-01-13  1280  static int qcom_sw=
rm_probe(struct platform_device *pdev)
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1281  {
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1282  	struct device *de=
v =3D &pdev->dev;
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1283  	struct sdw_master=
_prop *prop;
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1284  	struct sdw_bus_pa=
rams *params;
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1285  	struct qcom_swrm_=
ctrl *ctrl;
8cb3b4e74cd810 Srinivas Kandagatla     2020-09-17  1286  	const struct qcom=
_swrm_data *data;
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1287  	int ret;
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1288  	u32 val;
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1289  =

02efb49aa805ce Srinivas Kandagatla     2020-01-13  1290  	ctrl =3D devm_kza=
lloc(dev, sizeof(*ctrl), GFP_KERNEL);
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1291  	if (!ctrl)
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1292  		return -ENOMEM;
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1293  =

8cb3b4e74cd810 Srinivas Kandagatla     2020-09-17  1294  	data =3D of_devic=
e_get_match_data(dev);
8cb3b4e74cd810 Srinivas Kandagatla     2020-09-17  1295  	ctrl->rows_index =
=3D sdw_find_row_index(data->default_rows);
8cb3b4e74cd810 Srinivas Kandagatla     2020-09-17  1296  	ctrl->cols_index =
=3D sdw_find_col_index(data->default_cols);
47edc0104c61d6 Vinod Koul              2020-11-25  1297  #if IS_REACHABLE(C=
ONFIG_SLIMBUS)
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1298  	if (dev->parent->=
bus =3D=3D &slimbus_bus) {
5bd773242f75da Jonathan Marek          2020-09-05  1299  #else
5bd773242f75da Jonathan Marek          2020-09-05  1300  	if (false) {
5bd773242f75da Jonathan Marek          2020-09-05  1301  #endif
d1df23fe688b58 Jonathan Marek          2020-09-05  1302  		ctrl->reg_read =
=3D qcom_swrm_ahb_reg_read;
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1303  		ctrl->reg_write =
=3D qcom_swrm_ahb_reg_write;
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1304  		ctrl->regmap =3D=
 dev_get_regmap(dev->parent, NULL);
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1305  		if (!ctrl->regma=
p)
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1306  			return -EINVAL;
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1307  	} else {
82f5c70c26511b Jonathan Marek          2020-09-05  1308  		ctrl->reg_read =
=3D qcom_swrm_cpu_reg_read;
82f5c70c26511b Jonathan Marek          2020-09-05  1309  		ctrl->reg_write =
=3D qcom_swrm_cpu_reg_write;
82f5c70c26511b Jonathan Marek          2020-09-05  1310  		ctrl->mmio =3D d=
evm_platform_ioremap_resource(pdev, 0);
82f5c70c26511b Jonathan Marek          2020-09-05  1311  		if (IS_ERR(ctrl-=
>mmio))
82f5c70c26511b Jonathan Marek          2020-09-05  1312  			return PTR_ERR(=
ctrl->mmio);
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1313  	}
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1314  =

1fd0d85affe4d6 Srinivasa Rao Mandadapu 2022-07-01  1315  	if (data->sw_clk_=
gate_required) {
1fd0d85affe4d6 Srinivasa Rao Mandadapu 2022-07-01  1316  		ctrl->audio_cgcr=
 =3D devm_reset_control_get_exclusive(dev, "swr_audio_cgcr");
1fd0d85affe4d6 Srinivasa Rao Mandadapu 2022-07-01  1317  		if (IS_ERR_OR_NU=
LL(ctrl->audio_cgcr)) {
1fd0d85affe4d6 Srinivasa Rao Mandadapu 2022-07-01  1318  			dev_err(dev, "F=
ailed to get cgcr reset ctrl required for SW gating\n");
1fd0d85affe4d6 Srinivasa Rao Mandadapu 2022-07-01 @1319  			ret =3D PTR_ERR=
(ctrl->audio_cgcr);
1fd0d85affe4d6 Srinivasa Rao Mandadapu 2022-07-01  1320  			goto err_init;
1fd0d85affe4d6 Srinivasa Rao Mandadapu 2022-07-01  1321  		}
1fd0d85affe4d6 Srinivasa Rao Mandadapu 2022-07-01  1322  	}
1fd0d85affe4d6 Srinivasa Rao Mandadapu 2022-07-01  1323  =

02efb49aa805ce Srinivas Kandagatla     2020-01-13  1324  	ctrl->irq =3D of_=
irq_get(dev->of_node, 0);
91b5cfc0209b63 Pierre-Louis Bossart    2020-04-30  1325  	if (ctrl->irq < 0=
) {
91b5cfc0209b63 Pierre-Louis Bossart    2020-04-30  1326  		ret =3D ctrl->ir=
q;
91b5cfc0209b63 Pierre-Louis Bossart    2020-04-30  1327  		goto err_init;
91b5cfc0209b63 Pierre-Louis Bossart    2020-04-30  1328  	}
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1329  =

02efb49aa805ce Srinivas Kandagatla     2020-01-13  1330  	ctrl->hclk =3D de=
vm_clk_get(dev, "iface");
91b5cfc0209b63 Pierre-Louis Bossart    2020-04-30  1331  	if (IS_ERR(ctrl->=
hclk)) {
91b5cfc0209b63 Pierre-Louis Bossart    2020-04-30  1332  		ret =3D PTR_ERR(=
ctrl->hclk);
91b5cfc0209b63 Pierre-Louis Bossart    2020-04-30  1333  		goto err_init;
91b5cfc0209b63 Pierre-Louis Bossart    2020-04-30  1334  	}
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1335  =

02efb49aa805ce Srinivas Kandagatla     2020-01-13  1336  	clk_prepare_enabl=
e(ctrl->hclk);
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1337  =

02efb49aa805ce Srinivas Kandagatla     2020-01-13  1338  	ctrl->dev =3D dev;
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1339  	dev_set_drvdata(&=
pdev->dev, ctrl);
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1340  	mutex_init(&ctrl-=
>port_lock);
ddea6cf7b619ec Srinivas Kandagatla     2021-03-30  1341  	init_completion(&=
ctrl->broadcast);
06dd96738d6183 Srinivas Kandagatla     2021-03-30  1342  	init_completion(&=
ctrl->enumeration);
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1343  =

02efb49aa805ce Srinivas Kandagatla     2020-01-13  1344  	ctrl->bus.ops =3D=
 &qcom_swrm_ops;
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1345  	ctrl->bus.port_op=
s =3D &qcom_swrm_port_ops;
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1346  	ctrl->bus.compute=
_params =3D &qcom_swrm_compute_params;
74e79da9fd46a5 Srinivas Kandagatla     2022-02-28  1347  	ctrl->bus.clk_sto=
p_timeout =3D 300;
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1348  =

33ba0178888966 Srinivasa Rao Mandadapu 2022-05-18  1349  	ctrl->audio_cgcr =
=3D devm_reset_control_get_exclusive(dev, "swr_audio_cgcr");
33ba0178888966 Srinivasa Rao Mandadapu 2022-05-18  1350  	if (IS_ERR(ctrl->=
audio_cgcr))
33ba0178888966 Srinivasa Rao Mandadapu 2022-05-18  1351  		dev_err(dev, "Fa=
iled to get audio_cgcr reset required for soundwire-v1.6.0\n");
33ba0178888966 Srinivasa Rao Mandadapu 2022-05-18  1352  =

02efb49aa805ce Srinivas Kandagatla     2020-01-13  1353  	ret =3D qcom_swrm=
_get_port_config(ctrl);
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1354  	if (ret)
91b5cfc0209b63 Pierre-Louis Bossart    2020-04-30  1355  		goto err_clk;
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1356  =

02efb49aa805ce Srinivas Kandagatla     2020-01-13  1357  	params =3D &ctrl-=
>bus.params;
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1358  	params->max_dr_fr=
eq =3D DEFAULT_CLK_FREQ;
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1359  	params->curr_dr_f=
req =3D DEFAULT_CLK_FREQ;
8cb3b4e74cd810 Srinivas Kandagatla     2020-09-17  1360  	params->col =3D d=
ata->default_cols;
8cb3b4e74cd810 Srinivas Kandagatla     2020-09-17  1361  	params->row =3D d=
ata->default_rows;
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1362  	ctrl->reg_read(ct=
rl, SWRM_MCP_STATUS, &val);
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1363  	params->curr_bank=
 =3D val & SWRM_MCP_STATUS_BANK_NUM_MASK;
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1364  	params->next_bank=
 =3D !params->curr_bank;
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1365  =

02efb49aa805ce Srinivas Kandagatla     2020-01-13  1366  	prop =3D &ctrl->b=
us.prop;
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1367  	prop->max_clk_fre=
q =3D DEFAULT_CLK_FREQ;
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1368  	prop->num_clk_gea=
rs =3D 0;
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1369  	prop->num_clk_fre=
q =3D MAX_FREQ_NUM;
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1370  	prop->clk_freq =
=3D &qcom_swrm_freq_tbl[0];
8cb3b4e74cd810 Srinivas Kandagatla     2020-09-17  1371  	prop->default_col=
 =3D data->default_cols;
8cb3b4e74cd810 Srinivas Kandagatla     2020-09-17  1372  	prop->default_row=
 =3D data->default_rows;
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1373  =

02efb49aa805ce Srinivas Kandagatla     2020-01-13  1374  	ctrl->reg_read(ct=
rl, SWRM_COMP_HW_VERSION, &ctrl->version);
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1375  =

02efb49aa805ce Srinivas Kandagatla     2020-01-13  1376  	ret =3D devm_requ=
est_threaded_irq(dev, ctrl->irq, NULL,
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1377  					qcom_swrm_irq=
_handler,
4f1738f4c24b44 Samuel Zou              2020-05-06  1378  					IRQF_TRIGGER_=
RISING |
4f1738f4c24b44 Samuel Zou              2020-05-06  1379  					IRQF_ONESHOT,
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1380  					"soundwire", =
ctrl);
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1381  	if (ret) {
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1382  		dev_err(dev, "Fa=
iled to request soundwire irq\n");
91b5cfc0209b63 Pierre-Louis Bossart    2020-04-30  1383  		goto err_clk;
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1384  	}
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1385  =

04d46a7b38375a Srinivas Kandagatla     2022-02-28  1386  	ctrl->wake_irq =
=3D of_irq_get(dev->of_node, 1);
04d46a7b38375a Srinivas Kandagatla     2022-02-28  1387  	if (ctrl->wake_ir=
q > 0) {
04d46a7b38375a Srinivas Kandagatla     2022-02-28  1388  		ret =3D devm_req=
uest_threaded_irq(dev, ctrl->wake_irq, NULL,
04d46a7b38375a Srinivas Kandagatla     2022-02-28  1389  						qcom_swrm_wa=
ke_irq_handler,
04d46a7b38375a Srinivas Kandagatla     2022-02-28  1390  						IRQF_TRIGGER=
_HIGH | IRQF_ONESHOT,
04d46a7b38375a Srinivas Kandagatla     2022-02-28  1391  						"swr_wake_ir=
q", ctrl);
04d46a7b38375a Srinivas Kandagatla     2022-02-28  1392  		if (ret) {
04d46a7b38375a Srinivas Kandagatla     2022-02-28  1393  			dev_err(dev, "F=
ailed to request soundwire wake irq\n");
04d46a7b38375a Srinivas Kandagatla     2022-02-28  1394  			goto err_init;
04d46a7b38375a Srinivas Kandagatla     2022-02-28  1395  		}
04d46a7b38375a Srinivas Kandagatla     2022-02-28  1396  	}
04d46a7b38375a Srinivas Kandagatla     2022-02-28  1397  =

5cab3ff2489ede Pierre-Louis Bossart    2020-05-19  1398  	ret =3D sdw_bus_m=
aster_add(&ctrl->bus, dev, dev->fwnode);
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1399  	if (ret) {
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1400  		dev_err(dev, "Fa=
iled to register Soundwire controller (%d)\n",
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1401  			ret);
91b5cfc0209b63 Pierre-Louis Bossart    2020-04-30  1402  		goto err_clk;
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1403  	}
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1404  =

02efb49aa805ce Srinivas Kandagatla     2020-01-13  1405  	qcom_swrm_init(ct=
rl);
06dd96738d6183 Srinivas Kandagatla     2021-03-30  1406  	wait_for_completi=
on_timeout(&ctrl->enumeration,
06dd96738d6183 Srinivas Kandagatla     2021-03-30  1407  				    msecs_to_j=
iffies(TIMEOUT_MS));
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1408  	ret =3D qcom_swrm=
_register_dais(ctrl);
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1409  	if (ret)
91b5cfc0209b63 Pierre-Louis Bossart    2020-04-30  1410  		goto err_master_=
add;
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1411  =

02efb49aa805ce Srinivas Kandagatla     2020-01-13  1412  	dev_info(dev, "Qu=
alcomm Soundwire controller v%x.%x.%x Registered\n",
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1413  		 (ctrl->version =
>> 24) & 0xff, (ctrl->version >> 16) & 0xff,
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1414  		 ctrl->version &=
 0xffff);
02efb49aa805ce Srinivas Kandagatla     2020-01-13  1415  =

74e79da9fd46a5 Srinivas Kandagatla     2022-02-28  1416  	pm_runtime_set_au=
tosuspend_delay(dev, 3000);
74e79da9fd46a5 Srinivas Kandagatla     2022-02-28  1417  	pm_runtime_use_au=
tosuspend(dev);
74e79da9fd46a5 Srinivas Kandagatla     2022-02-28  1418  	pm_runtime_mark_l=
ast_busy(dev);
74e79da9fd46a5 Srinivas Kandagatla     2022-02-28  1419  	pm_runtime_set_ac=
tive(dev);
74e79da9fd46a5 Srinivas Kandagatla     2022-02-28  1420  	pm_runtime_enable=
(dev);
74e79da9fd46a5 Srinivas Kandagatla     2022-02-28  1421  =

74e79da9fd46a5 Srinivas Kandagatla     2022-02-28  1422  	/* Clk stop is no=
t supported on WSA Soundwire masters */
74e79da9fd46a5 Srinivas Kandagatla     2022-02-28  1423  	if (ctrl->version=
 <=3D 0x01030000) {
74e79da9fd46a5 Srinivas Kandagatla     2022-02-28  1424  		ctrl->clock_stop=
_not_supported =3D true;
74e79da9fd46a5 Srinivas Kandagatla     2022-02-28  1425  	} else {
74e79da9fd46a5 Srinivas Kandagatla     2022-02-28  1426  		ctrl->reg_read(c=
trl, SWRM_COMP_MASTER_ID, &val);
74e79da9fd46a5 Srinivas Kandagatla     2022-02-28  1427  		if (val =3D=3D M=
ASTER_ID_WSA)
74e79da9fd46a5 Srinivas Kandagatla     2022-02-28  1428  			ctrl->clock_sto=
p_not_supported =3D true;
74e79da9fd46a5 Srinivas Kandagatla     2022-02-28  1429  	}
74e79da9fd46a5 Srinivas Kandagatla     2022-02-28  1430  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0140038176373687620==--

