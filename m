Content-Type: multipart/mixed; boundary="===============1503330351041407504=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c:1305 bdisp_probe() warn: assigning (-38) to unsigned variable 'bdisp->id'
Date: Fri, 16 Sep 2022 04:53:01 +0800
Message-ID: <202209160433.xJLcdcAT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1503330351041407504==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org

Hi Mauro,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3245cb65fd91cd514801bf91f5a3066d562f0ac4
commit: e7b8153e2a4f0c9c8d1450aa7328d54ea64fe8b2 media: platform: place stm=
32/ and sti/ under st/ dir
date:   6 months ago
:::::: branch date: 35 hours ago
:::::: commit date: 6 months ago
config: m68k-randconfig-m031-20220914 (https://download.01.org/0day-ci/arch=
ive/20220916/202209160433.xJLcdcAT-lkp(a)intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c:1305 bdisp_probe() warn: a=
ssigning (-38) to unsigned variable 'bdisp->id'

Old smatch warnings:
drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c:725 bdisp_g_fmt() warn: pa=
ssing a valid pointer to 'PTR_ERR'
drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c:852 bdisp_g_selection() wa=
rn: passing a valid pointer to 'PTR_ERR'

vim +1305 drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c

28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1283  =

28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1284  static int bdisp_probe(struct platform_device *pd=
ev)
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1285  {
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1286  	struct bdisp_dev *bdisp;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1287  	struct device *dev =3D &pdev->dev;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1288  	int ret;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1289  =

28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1290  	dev_dbg(dev, "%s\n", __func__);
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1291  =

28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1292  	bdisp =3D devm_kzalloc(dev, sizeof(struct bdisp_=
dev), GFP_KERNEL);
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1293  	if (!bdisp)
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1294  		return -ENOMEM;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1295  =

2732bb765f14eb drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2018-05-15  1296  	ret =3D dma_coerce_mask_and_coherent(dev, DMA_BI=
T_MASK(32));
2732bb765f14eb drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2018-05-15  1297  	if (ret)
2732bb765f14eb drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2018-05-15  1298  		return ret;
2732bb765f14eb drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2018-05-15  1299  =

28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1300  	bdisp->pdev =3D pdev;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1301  	bdisp->dev =3D dev;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1302  	platform_set_drvdata(pdev, bdisp);
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1303  =

28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1304  	if (dev->of_node)
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12 @1305  		bdisp->id =3D of_alias_get_id(pdev->dev.of_node=
, BDISP_NAME);
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1306  	else
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1307  		bdisp->id =3D pdev->id;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1308  =

28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1309  	init_waitqueue_head(&bdisp->irq_queue);
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1310  	INIT_DELAYED_WORK(&bdisp->timeout_work, bdisp_ir=
q_timeout);
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1311  	bdisp->work_queue =3D create_workqueue(BDISP_NAM=
E);
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1312  =

28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1313  	spin_lock_init(&bdisp->slock);
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1314  	mutex_init(&bdisp->lock);
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1315  =

28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1316  	/* get resources */
6394c2d95399e5 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Cai Huoqing   =
        2021-09-01  1317  	bdisp->regs =3D devm_platform_ioremap_resource(p=
dev, 0);
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1318  	if (IS_ERR(bdisp->regs)) {
8ea1c5af489a76 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Chuhong Yuan  =
        2019-11-13  1319  		ret =3D PTR_ERR(bdisp->regs);
8ea1c5af489a76 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Chuhong Yuan  =
        2019-11-13  1320  		goto err_wq;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1321  	}
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1322  =

28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1323  	bdisp->clock =3D devm_clk_get(dev, BDISP_NAME);
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1324  	if (IS_ERR(bdisp->clock)) {
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1325  		dev_err(dev, "failed to get clock\n");
8ea1c5af489a76 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Chuhong Yuan  =
        2019-11-13  1326  		ret =3D PTR_ERR(bdisp->clock);
8ea1c5af489a76 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Chuhong Yuan  =
        2019-11-13  1327  		goto err_wq;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1328  	}
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1329  =

28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1330  	ret =3D clk_prepare(bdisp->clock);
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1331  	if (ret < 0) {
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1332  		dev_err(dev, "clock prepare failed\n");
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1333  		bdisp->clock =3D ERR_PTR(-EINVAL);
8ea1c5af489a76 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Chuhong Yuan  =
        2019-11-13  1334  		goto err_wq;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1335  	}
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1336  =

9fcb700420c90c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Lad Prabhakar =
        2022-01-11  1337  	ret =3D platform_get_irq(pdev, 0);
9fcb700420c90c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Lad Prabhakar =
        2022-01-11  1338  	if (ret < 0)
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1339  		goto err_clk;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1340  =

9fcb700420c90c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Lad Prabhakar =
        2022-01-11  1341  	ret =3D devm_request_threaded_irq(dev, ret, bdis=
p_irq_handler,
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1342  					bdisp_irq_thread, IRQF_ONESHOT,
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1343  					pdev->name, bdisp);
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1344  	if (ret) {
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1345  		dev_err(dev, "failed to install irq\n");
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1346  		goto err_clk;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1347  	}
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1348  =

28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1349  	/* v4l2 register */
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1350  	ret =3D v4l2_device_register(dev, &bdisp->v4l2_d=
ev);
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1351  	if (ret) {
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1352  		dev_err(dev, "failed to register\n");
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1353  		goto err_clk;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1354  	}
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1355  =

34b6beb65beb7f drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1356  	/* Debug */
8c23f411296e54 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Greg Kroah-Har=
tman    2020-08-18  1357  	bdisp_debugfs_create(bdisp);
34b6beb65beb7f drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1358  =

28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1359  	/* Power management */
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1360  	pm_runtime_enable(dev);
c44eac5b72e23c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Mauro Carvalho=
 Chehab 2021-04-23  1361  	ret =3D pm_runtime_resume_and_get(dev);
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1362  	if (ret < 0) {
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1363  		dev_err(dev, "failed to set PM\n");
c44eac5b72e23c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Mauro Carvalho=
 Chehab 2021-04-23  1364  		goto err_remove;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1365  	}
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1366  =

28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1367  	/* Filters */
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1368  	if (bdisp_hw_alloc_filters(bdisp->dev)) {
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1369  		dev_err(bdisp->dev, "no memory for filters\n");
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1370  		ret =3D -ENOMEM;
dce57314b53760 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Hans Verkuil  =
        2016-02-15  1371  		goto err_pm;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1372  	}
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1373  =

28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1374  	/* Register */
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1375  	ret =3D bdisp_register_device(bdisp);
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1376  	if (ret) {
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1377  		dev_err(dev, "failed to register\n");
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1378  		goto err_filter;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1379  	}
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1380  =

28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1381  	dev_info(dev, "%s%d registered as /dev/video%d\n=
", BDISP_NAME,
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1382  		 bdisp->id, bdisp->vdev.num);
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1383  =

28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1384  	pm_runtime_put(dev);
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1385  =

28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1386  	return 0;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1387  =

28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1388  err_filter:
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1389  	bdisp_hw_free_filters(bdisp->dev);
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1390  err_pm:
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1391  	pm_runtime_put(dev);
c44eac5b72e23c drivers/media/platform/sti/bdisp/bdisp-v4l2.c Mauro Carvalho=
 Chehab 2021-04-23  1392  err_remove:
0529c0f55da87a drivers/media/platform/sti/bdisp/bdisp-v4l2.c Dongliang Mu  =
        2021-10-19  1393  	pm_runtime_disable(dev);
34b6beb65beb7f drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1394  	bdisp_debugfs_remove(bdisp);
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1395  	v4l2_device_unregister(&bdisp->v4l2_dev);
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1396  err_clk:
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1397  	if (!IS_ERR(bdisp->clock))
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1398  		clk_unprepare(bdisp->clock);
8ea1c5af489a76 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Chuhong Yuan  =
        2019-11-13  1399  err_wq:
8ea1c5af489a76 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Chuhong Yuan  =
        2019-11-13  1400  	destroy_workqueue(bdisp->work_queue);
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1401  	return ret;
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1402  }
28ffeebbb7bdc0 drivers/media/platform/sti/bdisp/bdisp-v4l2.c Fabien Dessenn=
e       2015-05-12  1403  =


:::::: The code at line 1305 was first introduced by commit
:::::: 28ffeebbb7bdc0dd7899286b63f3c359d43d0a1a [media] bdisp: 2D blitter d=
river using v4l2 mem2mem framework

:::::: TO: Fabien Dessenne <fabien.dessenne@st.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@osg.samsung.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1503330351041407504==--

