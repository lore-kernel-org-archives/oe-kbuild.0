Content-Type: multipart/mixed; boundary="===============3862585441182979208=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [asahilinux:bits/020-t6000-dart 7/11] drivers/iommu/apple-dart.c:918 apple_dart_probe() warn: missing error code 'ret'
Date: Thu, 18 Aug 2022 10:41:04 +0800
Message-ID: <202208181055.JPFYIeIR-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3862585441182979208==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Hector Martin <marcan@marcan.st>

tree:   https://github.com/AsahiLinux/linux bits/020-t6000-dart
head:   a1335782bc0044bf5fc4ec4f8a4a785ecb02a652
commit: fe20c64837d183c09082887d0c96d338b438a855 [7/11] iommu: dart: Suppor=
t >64 stream IDs
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: mips-randconfig-m031-20220818 (https://download.01.org/0day-ci/arch=
ive/20220818/202208181055.JPFYIeIR-lkp(a)intel.com/config)
compiler: mips64el-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/iommu/apple-dart.c:918 apple_dart_probe() warn: missing error code =
'ret'

vim +/ret +918 drivers/iommu/apple-dart.c

46d1fb072e76b1 Sven Peter     2021-08-03  869  =

46d1fb072e76b1 Sven Peter     2021-08-03  870  static int apple_dart_probe(=
struct platform_device *pdev)
46d1fb072e76b1 Sven Peter     2021-08-03  871  {
46d1fb072e76b1 Sven Peter     2021-08-03  872  	int ret;
46d1fb072e76b1 Sven Peter     2021-08-03  873  	u32 dart_params[2];
46d1fb072e76b1 Sven Peter     2021-08-03  874  	struct resource *res;
46d1fb072e76b1 Sven Peter     2021-08-03  875  	struct apple_dart *dart;
46d1fb072e76b1 Sven Peter     2021-08-03  876  	struct device *dev =3D &pde=
v->dev;
46d1fb072e76b1 Sven Peter     2021-08-03  877  =

46d1fb072e76b1 Sven Peter     2021-08-03  878  	dart =3D devm_kzalloc(dev, =
sizeof(*dart), GFP_KERNEL);
46d1fb072e76b1 Sven Peter     2021-08-03  879  	if (!dart)
46d1fb072e76b1 Sven Peter     2021-08-03  880  		return -ENOMEM;
46d1fb072e76b1 Sven Peter     2021-08-03  881  =

46d1fb072e76b1 Sven Peter     2021-08-03  882  	dart->dev =3D dev;
15720227e18019 Sven Peter     2021-11-02  883  	dart->hw =3D of_device_get_=
match_data(dev);
46d1fb072e76b1 Sven Peter     2021-08-03  884  	spin_lock_init(&dart->lock);
46d1fb072e76b1 Sven Peter     2021-08-03  885  =

a15932f4377062 Yang Yingliang 2022-04-25  886  	dart->regs =3D devm_platfor=
m_get_and_ioremap_resource(pdev, 0, &res);
a15932f4377062 Yang Yingliang 2022-04-25  887  	if (IS_ERR(dart->regs))
a15932f4377062 Yang Yingliang 2022-04-25  888  		return PTR_ERR(dart->regs);
a15932f4377062 Yang Yingliang 2022-04-25  889  =

46d1fb072e76b1 Sven Peter     2021-08-03  890  	if (resource_size(res) < 0x=
4000) {
46d1fb072e76b1 Sven Peter     2021-08-03  891  		dev_err(dev, "MMIO region =
too small (%pr)\n", res);
46d1fb072e76b1 Sven Peter     2021-08-03  892  		return -EINVAL;
46d1fb072e76b1 Sven Peter     2021-08-03  893  	}
46d1fb072e76b1 Sven Peter     2021-08-03  894  =

46d1fb072e76b1 Sven Peter     2021-08-03  895  	dart->irq =3D platform_get_=
irq(pdev, 0);
46d1fb072e76b1 Sven Peter     2021-08-03  896  	if (dart->irq < 0)
46d1fb072e76b1 Sven Peter     2021-08-03  897  		return -ENODEV;
46d1fb072e76b1 Sven Peter     2021-08-03  898  =

46d1fb072e76b1 Sven Peter     2021-08-03  899  	ret =3D devm_clk_bulk_get_a=
ll(dev, &dart->clks);
46d1fb072e76b1 Sven Peter     2021-08-03  900  	if (ret < 0)
46d1fb072e76b1 Sven Peter     2021-08-03  901  		return ret;
46d1fb072e76b1 Sven Peter     2021-08-03  902  	dart->num_clks =3D ret;
46d1fb072e76b1 Sven Peter     2021-08-03  903  =

46d1fb072e76b1 Sven Peter     2021-08-03  904  	ret =3D clk_bulk_prepare_en=
able(dart->num_clks, dart->clks);
46d1fb072e76b1 Sven Peter     2021-08-03  905  	if (ret)
46d1fb072e76b1 Sven Peter     2021-08-03  906  		return ret;
46d1fb072e76b1 Sven Peter     2021-08-03  907  =

46d1fb072e76b1 Sven Peter     2021-08-03  908  	dart_params[0] =3D readl(da=
rt->regs + DART_PARAMS1);
46d1fb072e76b1 Sven Peter     2021-08-03  909  	dart_params[1] =3D readl(da=
rt->regs + DART_PARAMS2);
46d1fb072e76b1 Sven Peter     2021-08-03  910  	dart->pgsize =3D 1 << FIELD=
_GET(DART_PARAMS_PAGE_SHIFT, dart_params[0]);
46d1fb072e76b1 Sven Peter     2021-08-03  911  	dart->supports_bypass =3D d=
art_params[1] & DART_PARAMS_BYPASS_SUPPORT;
fe20c64837d183 Hector Martin  2022-06-28  912  =

fe20c64837d183 Hector Martin  2022-06-28  913  	dart->num_streams =3D dart-=
>hw->max_sid_count;
fe20c64837d183 Hector Martin  2022-06-28  914  =

fe20c64837d183 Hector Martin  2022-06-28  915  	if (dart->num_streams > DAR=
T_MAX_STREAMS) {
fe20c64837d183 Hector Martin  2022-06-28  916  		dev_err(&pdev->dev, "Too m=
any streams (%d > %d)\n",
fe20c64837d183 Hector Martin  2022-06-28  917  			dart->num_streams, DART_M=
AX_STREAMS);
fe20c64837d183 Hector Martin  2022-06-28 @918  		goto err_clk_disable;
fe20c64837d183 Hector Martin  2022-06-28  919  	}
fe20c64837d183 Hector Martin  2022-06-28  920  =

46d1fb072e76b1 Sven Peter     2021-08-03  921  	dart->force_bypass =3D dart=
->pgsize > PAGE_SIZE;
46d1fb072e76b1 Sven Peter     2021-08-03  922  =

fe20c64837d183 Hector Martin  2022-06-28  923  	ret =3D apple_dart_hw_reset=
(dart);
fe20c64837d183 Hector Martin  2022-06-28  924  	if (ret)
fe20c64837d183 Hector Martin  2022-06-28  925  		goto err_clk_disable;
fe20c64837d183 Hector Martin  2022-06-28  926  =

46d1fb072e76b1 Sven Peter     2021-08-03  927  	ret =3D request_irq(dart->i=
rq, apple_dart_irq, IRQF_SHARED,
46d1fb072e76b1 Sven Peter     2021-08-03  928  			  "apple-dart fault handl=
er", dart);
46d1fb072e76b1 Sven Peter     2021-08-03  929  	if (ret)
46d1fb072e76b1 Sven Peter     2021-08-03  930  		goto err_clk_disable;
46d1fb072e76b1 Sven Peter     2021-08-03  931  =

46d1fb072e76b1 Sven Peter     2021-08-03  932  	platform_set_drvdata(pdev, =
dart);
46d1fb072e76b1 Sven Peter     2021-08-03  933  =

46d1fb072e76b1 Sven Peter     2021-08-03  934  	ret =3D apple_dart_set_bus_=
ops(&apple_dart_iommu_ops);
46d1fb072e76b1 Sven Peter     2021-08-03  935  	if (ret)
46d1fb072e76b1 Sven Peter     2021-08-03  936  		goto err_free_irq;
46d1fb072e76b1 Sven Peter     2021-08-03  937  =

46d1fb072e76b1 Sven Peter     2021-08-03  938  	ret =3D iommu_device_sysfs_=
add(&dart->iommu, dev, NULL, "apple-dart.%s",
46d1fb072e76b1 Sven Peter     2021-08-03  939  				     dev_name(&pdev->dev=
));
46d1fb072e76b1 Sven Peter     2021-08-03  940  	if (ret)
46d1fb072e76b1 Sven Peter     2021-08-03  941  		goto err_remove_bus_ops;
46d1fb072e76b1 Sven Peter     2021-08-03  942  =

46d1fb072e76b1 Sven Peter     2021-08-03  943  	ret =3D iommu_device_regist=
er(&dart->iommu, &apple_dart_iommu_ops, dev);
46d1fb072e76b1 Sven Peter     2021-08-03  944  	if (ret)
46d1fb072e76b1 Sven Peter     2021-08-03  945  		goto err_sysfs_remove;
46d1fb072e76b1 Sven Peter     2021-08-03  946  =

46d1fb072e76b1 Sven Peter     2021-08-03  947  	dev_info(
46d1fb072e76b1 Sven Peter     2021-08-03  948  		&pdev->dev,
fe20c64837d183 Hector Martin  2022-06-28  949  		"DART [pagesize %x, %d str=
eams, bypass support: %d, bypass forced: %d] initialized\n",
fe20c64837d183 Hector Martin  2022-06-28  950  		dart->pgsize, dart->num_st=
reams, dart->supports_bypass, dart->force_bypass);
46d1fb072e76b1 Sven Peter     2021-08-03  951  	return 0;
46d1fb072e76b1 Sven Peter     2021-08-03  952  =

46d1fb072e76b1 Sven Peter     2021-08-03  953  err_sysfs_remove:
46d1fb072e76b1 Sven Peter     2021-08-03  954  	iommu_device_sysfs_remove(&=
dart->iommu);
46d1fb072e76b1 Sven Peter     2021-08-03  955  err_remove_bus_ops:
46d1fb072e76b1 Sven Peter     2021-08-03  956  	apple_dart_set_bus_ops(NULL=
);
46d1fb072e76b1 Sven Peter     2021-08-03  957  err_free_irq:
46d1fb072e76b1 Sven Peter     2021-08-03  958  	free_irq(dart->irq, dart);
46d1fb072e76b1 Sven Peter     2021-08-03  959  err_clk_disable:
46d1fb072e76b1 Sven Peter     2021-08-03  960  	clk_bulk_disable_unprepare(=
dart->num_clks, dart->clks);
46d1fb072e76b1 Sven Peter     2021-08-03  961  =

46d1fb072e76b1 Sven Peter     2021-08-03  962  	return ret;
46d1fb072e76b1 Sven Peter     2021-08-03  963  }
46d1fb072e76b1 Sven Peter     2021-08-03  964  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3862585441182979208==--

