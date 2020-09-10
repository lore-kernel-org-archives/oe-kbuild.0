Content-Type: multipart/mixed; boundary="===============2841668713409191495=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/iommu/arm/arm-smmu/arm-smmu.c:1420:6: warning: Variable 'ret' is reassigned a value before the old one has been used.
Date: Thu, 10 Sep 2020 16:47:26 +0800
Message-ID: <202009101615.ifCfv0cI%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2841668713409191495==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Will Deacon <will@kernel.org>

Hi Will,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ab29a807a7ddaa7c84d2f4cb8d29e74e33759072
commit: e86d1aa8b60f7ea18d36f50296d7d20eb2852e7e iommu/arm-smmu: Move Arm S=
MMU drivers into their own subdirectory
date:   6 weeks ago
:::::: branch date: 15 hours ago
:::::: commit date: 6 weeks ago
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/iommu/arm/arm-smmu/arm-smmu.c:1420:6: warning: Variable 'ret' is=
 reassigned a value before the old one has been used. [redundantAssignment]
    ret =3D -ENOMEM;
        ^
   drivers/iommu/arm/arm-smmu/arm-smmu.c:1403:6: note: Variable 'ret' is re=
assigned a value before the old one has been used.
    ret =3D -EINVAL;
        ^
   drivers/iommu/arm/arm-smmu/arm-smmu.c:1420:6: note: Variable 'ret' is re=
assigned a value before the old one has been used.
    ret =3D -ENOMEM;
        ^
   drivers/iommu/arm/arm-smmu/arm-smmu.c:1431:6: warning: Variable 'ret' is=
 reassigned a value before the old one has been used. [redundantAssignment]
    ret =3D arm_smmu_rpm_get(smmu);
        ^
   drivers/iommu/arm/arm-smmu/arm-smmu.c:1420:6: note: Variable 'ret' is re=
assigned a value before the old one has been used.
    ret =3D -ENOMEM;
        ^
   drivers/iommu/arm/arm-smmu/arm-smmu.c:1431:6: note: Variable 'ret' is re=
assigned a value before the old one has been used.
    ret =3D arm_smmu_rpm_get(smmu);
        ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3De86d1aa8b60f7ea18d36f50296d7d20eb2852e7e
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git fetch --no-tags linus master
git checkout e86d1aa8b60f7ea18d36f50296d7d20eb2852e7e
vim +/ret +1420 drivers/iommu/arm/arm-smmu/arm-smmu.c

021bb8420d44cf drivers/iommu/arm-smmu.c Robin Murphy      2016-09-14  1378  =

cefa0d55da3753 drivers/iommu/arm-smmu.c Joerg Roedel      2020-04-29  1379 =
 static struct iommu_device *arm_smmu_probe_device(struct device *dev)
45ae7cff3684ab drivers/iommu/arm-smmu.c Will Deacon       2013-06-24  1380 =
 {
0b242ebbb7fca8 drivers/iommu/arm-smmu.c Joerg Roedel      2020-03-26  1381 =
 	struct arm_smmu_device *smmu =3D NULL;
03edb2264caddd drivers/iommu/arm-smmu.c Will Deacon       2015-01-19  1382 =
 	struct arm_smmu_master_cfg *cfg;
9b468f7d9cf1f0 drivers/iommu/arm-smmu.c Joerg Roedel      2018-11-29  1383 =
 	struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
f80cd885fcdd05 drivers/iommu/arm-smmu.c Robin Murphy      2016-09-14  1384 =
 	int i, ret;
03edb2264caddd drivers/iommu/arm-smmu.c Will Deacon       2015-01-19  1385  =

021bb8420d44cf drivers/iommu/arm-smmu.c Robin Murphy      2016-09-14  1386 =
 	if (using_legacy_binding) {
adfec2e709d2a4 drivers/iommu/arm-smmu.c Robin Murphy      2016-09-12  1387 =
 		ret =3D arm_smmu_register_legacy_master(dev, &smmu);
a7990c647b3541 drivers/iommu/arm-smmu.c Artem Savkov      2017-08-08  1388  =

a7990c647b3541 drivers/iommu/arm-smmu.c Artem Savkov      2017-08-08  1389 =
 		/*
a7990c647b3541 drivers/iommu/arm-smmu.c Artem Savkov      2017-08-08  1390 =
 		 * If dev->iommu_fwspec is initally NULL, arm_smmu_register_legacy_maste=
r()
a7990c647b3541 drivers/iommu/arm-smmu.c Artem Savkov      2017-08-08  1391 =
 		 * will allocate/initialise a new one. Thus we need to update fwspec for
a7990c647b3541 drivers/iommu/arm-smmu.c Artem Savkov      2017-08-08  1392 =
 		 * later use.
a7990c647b3541 drivers/iommu/arm-smmu.c Artem Savkov      2017-08-08  1393 =
 		 */
9b468f7d9cf1f0 drivers/iommu/arm-smmu.c Joerg Roedel      2018-11-29  1394 =
 		fwspec =3D dev_iommu_fwspec_get(dev);
f80cd885fcdd05 drivers/iommu/arm-smmu.c Robin Murphy      2016-09-14  1395 =
 		if (ret)
f80cd885fcdd05 drivers/iommu/arm-smmu.c Robin Murphy      2016-09-14  1396 =
 			goto out_free;
3c117b543528b0 drivers/iommu/arm-smmu.c Robin Murphy      2016-11-02  1397 =
 	} else if (fwspec && fwspec->ops =3D=3D &arm_smmu_ops) {
ce9babe5f66df2 drivers/iommu/arm-smmu.c Lorenzo Pieralisi 2016-11-21  1398 =
 		smmu =3D arm_smmu_get_by_fwnode(fwspec->iommu_fwnode);
021bb8420d44cf drivers/iommu/arm-smmu.c Robin Murphy      2016-09-14  1399 =
 	} else {
cefa0d55da3753 drivers/iommu/arm-smmu.c Joerg Roedel      2020-04-29  1400 =
 		return ERR_PTR(-ENODEV);
021bb8420d44cf drivers/iommu/arm-smmu.c Robin Murphy      2016-09-14  1401 =
 	}
03edb2264caddd drivers/iommu/arm-smmu.c Will Deacon       2015-01-19  1402  =

f80cd885fcdd05 drivers/iommu/arm-smmu.c Robin Murphy      2016-09-14  1403 =
 	ret =3D -EINVAL;
adfec2e709d2a4 drivers/iommu/arm-smmu.c Robin Murphy      2016-09-12  1404 =
 	for (i =3D 0; i < fwspec->num_ids; i++) {
fba6e960772b7b drivers/iommu/arm-smmu.c Will Deacon       2020-01-10  1405 =
 		u16 sid =3D FIELD_GET(ARM_SMMU_SMR_ID, fwspec->ids[i]);
fba6e960772b7b drivers/iommu/arm-smmu.c Will Deacon       2020-01-10  1406 =
 		u16 mask =3D FIELD_GET(ARM_SMMU_SMR_MASK, fwspec->ids[i]);
03edb2264caddd drivers/iommu/arm-smmu.c Will Deacon       2015-01-19  1407  =

adfec2e709d2a4 drivers/iommu/arm-smmu.c Robin Murphy      2016-09-12  1408 =
 		if (sid & ~smmu->streamid_mask) {
f80cd885fcdd05 drivers/iommu/arm-smmu.c Robin Murphy      2016-09-14  1409 =
 			dev_err(dev, "stream ID 0x%x out of range for SMMU (0x%x)\n",
021bb8420d44cf drivers/iommu/arm-smmu.c Robin Murphy      2016-09-14  1410 =
 				sid, smmu->streamid_mask);
021bb8420d44cf drivers/iommu/arm-smmu.c Robin Murphy      2016-09-14  1411 =
 			goto out_free;
021bb8420d44cf drivers/iommu/arm-smmu.c Robin Murphy      2016-09-14  1412 =
 		}
021bb8420d44cf drivers/iommu/arm-smmu.c Robin Murphy      2016-09-14  1413 =
 		if (mask & ~smmu->smr_mask_mask) {
021bb8420d44cf drivers/iommu/arm-smmu.c Robin Murphy      2016-09-14  1414 =
 			dev_err(dev, "SMR mask 0x%x out of range for SMMU (0x%x)\n",
6323f474902e37 drivers/iommu/arm-smmu.c Peng Fan          2017-04-21  1415 =
 				mask, smmu->smr_mask_mask);
f80cd885fcdd05 drivers/iommu/arm-smmu.c Robin Murphy      2016-09-14  1416 =
 			goto out_free;
03edb2264caddd drivers/iommu/arm-smmu.c Will Deacon       2015-01-19  1417 =
 		}
a9a1b0b53d8b7c drivers/iommu/arm-smmu.c Will Deacon       2014-05-01  1418 =
 	}
5fc63a7c446e99 drivers/iommu/arm-smmu.c Antonios Motakis  2013-10-18  1419  =

adfec2e709d2a4 drivers/iommu/arm-smmu.c Robin Murphy      2016-09-12 @1420 =
 	ret =3D -ENOMEM;
adfec2e709d2a4 drivers/iommu/arm-smmu.c Robin Murphy      2016-09-12  1421 =
 	cfg =3D kzalloc(offsetof(struct arm_smmu_master_cfg, smendx[i]),
adfec2e709d2a4 drivers/iommu/arm-smmu.c Robin Murphy      2016-09-12  1422 =
 		      GFP_KERNEL);
adfec2e709d2a4 drivers/iommu/arm-smmu.c Robin Murphy      2016-09-12  1423 =
 	if (!cfg)
adfec2e709d2a4 drivers/iommu/arm-smmu.c Robin Murphy      2016-09-12  1424 =
 		goto out_free;
adfec2e709d2a4 drivers/iommu/arm-smmu.c Robin Murphy      2016-09-12  1425  =

adfec2e709d2a4 drivers/iommu/arm-smmu.c Robin Murphy      2016-09-12  1426 =
 	cfg->smmu =3D smmu;
c84500a365b4b4 drivers/iommu/arm-smmu.c Joerg Roedel      2020-03-26  1427 =
 	dev_iommu_priv_set(dev, cfg);
adfec2e709d2a4 drivers/iommu/arm-smmu.c Robin Murphy      2016-09-12  1428 =
 	while (i--)
adfec2e709d2a4 drivers/iommu/arm-smmu.c Robin Murphy      2016-09-12  1429 =
 		cfg->smendx[i] =3D INVALID_SMENDX;
adfec2e709d2a4 drivers/iommu/arm-smmu.c Robin Murphy      2016-09-12  1430  =

d4a44f0750bb9b drivers/iommu/arm-smmu.c Sricharan R       2018-12-04  1431 =
 	ret =3D arm_smmu_rpm_get(smmu);
d4a44f0750bb9b drivers/iommu/arm-smmu.c Sricharan R       2018-12-04  1432 =
 	if (ret < 0)
d4a44f0750bb9b drivers/iommu/arm-smmu.c Sricharan R       2018-12-04  1433 =
 		goto out_cfg_free;
d4a44f0750bb9b drivers/iommu/arm-smmu.c Sricharan R       2018-12-04  1434  =

588888a7399db3 drivers/iommu/arm-smmu.c Robin Murphy      2016-09-12  1435 =
 	ret =3D arm_smmu_master_alloc_smes(dev);
d4a44f0750bb9b drivers/iommu/arm-smmu.c Sricharan R       2018-12-04  1436 =
 	arm_smmu_rpm_put(smmu);
d4a44f0750bb9b drivers/iommu/arm-smmu.c Sricharan R       2018-12-04  1437  =

adfec2e709d2a4 drivers/iommu/arm-smmu.c Robin Murphy      2016-09-12  1438 =
 	if (ret)
c54451a5e24159 drivers/iommu/arm-smmu.c Vivek Gautam      2017-07-06  1439 =
 		goto out_cfg_free;
adfec2e709d2a4 drivers/iommu/arm-smmu.c Robin Murphy      2016-09-12  1440  =

655e364374e74a drivers/iommu/arm-smmu.c Sricharan R       2018-12-04  1441 =
 	device_link_add(dev, smmu->dev,
655e364374e74a drivers/iommu/arm-smmu.c Sricharan R       2018-12-04  1442 =
 			DL_FLAG_PM_RUNTIME | DL_FLAG_AUTOREMOVE_SUPPLIER);
655e364374e74a drivers/iommu/arm-smmu.c Sricharan R       2018-12-04  1443  =

cefa0d55da3753 drivers/iommu/arm-smmu.c Joerg Roedel      2020-04-29  1444 =
 	return &smmu->iommu;
f80cd885fcdd05 drivers/iommu/arm-smmu.c Robin Murphy      2016-09-14  1445  =

c54451a5e24159 drivers/iommu/arm-smmu.c Vivek Gautam      2017-07-06  1446 =
 out_cfg_free:
c54451a5e24159 drivers/iommu/arm-smmu.c Vivek Gautam      2017-07-06  1447 =
 	kfree(cfg);
f80cd885fcdd05 drivers/iommu/arm-smmu.c Robin Murphy      2016-09-14  1448 =
 out_free:
adfec2e709d2a4 drivers/iommu/arm-smmu.c Robin Murphy      2016-09-12  1449 =
 	iommu_fwspec_free(dev);
cefa0d55da3753 drivers/iommu/arm-smmu.c Joerg Roedel      2020-04-29  1450 =
 	return ERR_PTR(ret);
45ae7cff3684ab drivers/iommu/arm-smmu.c Will Deacon       2013-06-24  1451 =
 }
45ae7cff3684ab drivers/iommu/arm-smmu.c Will Deacon       2013-06-24  1452  =


:::::: The code at line 1420 was first introduced by commit
:::::: adfec2e709d2a48dbd756d65fe4fa8e4aae529a3 iommu/arm-smmu: Convert to =
iommu_fwspec

:::::: TO: Robin Murphy <robin.murphy@arm.com>
:::::: CC: Will Deacon <will.deacon@arm.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2841668713409191495==--

